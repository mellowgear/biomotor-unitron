// The LZSS variant Biomotor Unitron uses for its graphics (decompressor: routine 0x207232).
//
// The game's own tool was Haruhiko Okumura's LZSS.C (1989, public domain) with N = 1024, F = 18,
// THRESHOLD = 2 and a ring buffer filled with zeros (LZSS.C fills it with spaces). The last match
// is cut to the bytes left, as in LZSS.C. This is a C++ port of compress_okumura(clamp=True) in
// tlcs900/ngpc_lzss.py, which reproduces every stream in the ROM; decompress() is the game's
// decoder (ngpc_lzss.decompress).
//
// Stream format: a flag byte announces 8 items, lowest bit first: 1 = a literal byte, 0 = a match
// of 2 bytes A, W: ring offset ((W >> 4) << 8) | A, length (W & 15) + 3. The first write into the
// ring is at 0x3EE (N - F).
#pragma once
#include <cstddef>
#include <cstdint>
#include <stdexcept>
#include <vector>

namespace lzss {

constexpr int N = 0x400, F = 18, THRESHOLD = 2, NIL = N;

inline std::vector<uint8_t> compress(const std::vector<uint8_t>& raw) {
    std::vector<uint8_t> text(N + F - 1, 0);
    std::vector<int> lson(N + 1, NIL), rson(N + 257, NIL), dad(N + 1, NIL);
    int match_pos = 0, match_len = 0;

    // Okumura's binary search tree of the strings in the ring (InsertNode / DeleteNode).
    auto insert = [&](int r) {
        int cmp = 1, p = N + 1 + text[r];
        rson[r] = lson[r] = NIL;
        match_len = 0;
        for (;;) {
            if (cmp >= 0) {
                if (rson[p] != NIL) {
                    p = rson[p];
                } else {
                    rson[p] = r;
                    dad[r] = p;
                    return;
                }
            } else {
                if (lson[p] != NIL) {
                    p = lson[p];
                } else {
                    lson[p] = r;
                    dad[r] = p;
                    return;
                }
            }
            int i = 1;
            for (; i < F; i++)
                if ((cmp = text[r + i] - text[p + i]) != 0) break;
            if (i > match_len) {
                match_pos = p;
                match_len = i;
                if (i >= F) break;
            }
        }
        dad[r] = dad[p];
        lson[r] = lson[p];
        rson[r] = rson[p];
        dad[lson[p]] = r;
        dad[rson[p]] = r;
        if (rson[dad[p]] == p) rson[dad[p]] = r;
        else lson[dad[p]] = r;
        dad[p] = NIL;
    };
    auto remove = [&](int p) {
        if (dad[p] == NIL) return;
        int q;
        if (rson[p] == NIL) {
            q = lson[p];
        } else if (lson[p] == NIL) {
            q = rson[p];
        } else {
            q = lson[p];
            if (rson[q] != NIL) {
                while (rson[q] != NIL) q = rson[q];
                rson[dad[q]] = lson[q];
                dad[lson[q]] = dad[q];
                lson[q] = lson[p];
                dad[lson[p]] = q;
            }
            rson[q] = rson[p];
            dad[rson[p]] = q;
        }
        dad[q] = dad[p];
        if (rson[dad[p]] == p) rson[dad[p]] = q;
        else lson[dad[p]] = q;
        dad[p] = NIL;
    };

    std::vector<uint8_t> out, code{0};
    size_t next = 0;   // next byte of raw to read
    uint8_t mask = 1;
    int s = 0, r = N - F, len = 0;
    while (len < F && next < raw.size()) text[size_t(r + len++)] = raw[next++];
    if (len == 0) return out;
    for (int i = 1; i <= F; i++) insert(r - i);
    insert(r);
    while (len > 0) {
        if (match_len > len) match_len = len;   // the last match is cut to the bytes left
        if (match_len <= THRESHOLD) {
            match_len = 1;
            code[0] |= mask;
            code.push_back(text[size_t(r)]);
        } else {
            code.push_back(uint8_t(match_pos & 0xFF));
            code.push_back(uint8_t(((match_pos >> 4) & 0xF0) | (match_len - (THRESHOLD + 1))));
        }
        mask = uint8_t(mask << 1);
        if (mask == 0) {
            out.insert(out.end(), code.begin(), code.end());
            code.assign(1, 0);
            mask = 1;
        }
        int last = match_len, i = 0;
        for (; i < last && next < raw.size(); i++) {
            uint8_t c = raw[next++];
            remove(s);
            text[size_t(s)] = c;
            if (s < F - 1) text[size_t(s + N)] = c;
            s = (s + 1) & (N - 1);
            r = (r + 1) & (N - 1);
            insert(r);
        }
        while (i++ < last) {
            remove(s);
            s = (s + 1) & (N - 1);
            r = (r + 1) & (N - 1);
            if (--len) insert(r);
        }
    }
    if (code.size() > 1) out.insert(out.end(), code.begin(), code.end());
    return out;
}

// The game's decoder: out_len bytes from data[pos...]; *used = the stream bytes read.
inline std::vector<uint8_t> decompress(const std::vector<uint8_t>& data, size_t out_len, size_t pos = 0,
                                       size_t* used = nullptr) {
    std::vector<uint8_t> ring(N, 0), out;
    size_t start = pos;
    int r = N - F;
    unsigned flags = 0;
    auto byte = [&]() {
        if (pos >= data.size()) throw std::runtime_error("LZSS stream ends early");
        return data[pos++];
    };
    while (out.size() < out_len) {
        flags >>= 1;
        if (!(flags & 0x100)) flags = byte() | 0xFF00u;
        if (flags & 1) {
            uint8_t c = byte();
            out.push_back(c);
            ring[size_t(r)] = c;
            r = (r + 1) % N;
        } else {
            int a = byte(), w = byte();
            int off = ((w >> 4) << 8) | a, n = (w & 15) + THRESHOLD + 1;
            for (int k = 0; k < n && out.size() < out_len; k++) {
                uint8_t c = ring[size_t((off + k) % N)];
                out.push_back(c);
                ring[size_t(r)] = c;
                r = (r + 1) % N;
            }
        }
    }
    if (used) *used = pos - start;
    return out;
}

}  // namespace lzss
