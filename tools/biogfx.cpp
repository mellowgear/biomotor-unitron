// biogfx: Biomotor Unitron's own graphics products, built from what `unitron gfx frompng` writes.
// No PNG library: the image's width and height come from the PNG's IHDR chunk.
//
//   biogfx sheet TILES.2bpp OUT.2bpp.lz
//       LoadCompressedTiles 0x207226: u16 tile count, then LZSS of the tiles followed by one
//       blank tile (the original tool compressed one more tile than it counts; the decoder stops
//       after `count` tiles). TILES = unitron gfx frompng --trim (or --count N).
//   biogfx img2 --png SRC.png TILES.2bpp OUT.img2
//       LoadMonsterImage 0x207206: bytes 02, w, h, then LZSS of the 2bpp tiles, row by row.
//       TILES = unitron gfx frompng (every cell).
//   biogfx img4 --png SRC.png PIXELS OUT.img4
//       DrawPartImage 0x2070C7: bytes 04, w, h, then LZSS of 4-bit pixels, high nibble first;
//       an odd count is padded with 4 (clear). Every pixel must be 0-4.
//       PIXELS = unitron gfx frompng --indices.
//
// Same bytes as tools/assets.py (bd_2bpp_lz, bd_img2, bd_img4); the LZSS is tools/lzss.hpp.
#include <algorithm>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <iterator>
#include <stdexcept>
#include <string>
#include <vector>

#include "lzss.hpp"

namespace {

using Bytes = std::vector<uint8_t>;

Bytes read_file(const std::string& path) {
    std::ifstream f(path, std::ios::binary);
    if (!f) throw std::runtime_error(path + ": can't open");
    return Bytes((std::istreambuf_iterator<char>(f)), std::istreambuf_iterator<char>());
}

void write_file(const std::string& path, const Bytes& b) {
    std::ofstream f(path, std::ios::binary);
    if (!f) throw std::runtime_error(path + ": can't write");
    f.write(reinterpret_cast<const char*>(b.data()), std::streamsize(b.size()));
    if (!f) throw std::runtime_error(path + ": can't write");
}

// Width and height from a PNG's IHDR (the first chunk, bytes 16-23, big-endian).
void png_size(const std::string& path, uint32_t& w, uint32_t& h) {
    Bytes b = read_file(path);
    static const uint8_t SIG[8] = {0x89, 'P', 'N', 'G', 0x0D, 0x0A, 0x1A, 0x0A};
    if (b.size() < 24 || !std::equal(SIG, SIG + 8, b.begin()) || std::string(b.begin() + 12, b.begin() + 16) != "IHDR")
        throw std::runtime_error(path + ": not a PNG");
    auto be32 = [&](size_t o) { return uint32_t(b[o]) << 24 | uint32_t(b[o + 1]) << 16 | uint32_t(b[o + 2]) << 8 | b[o + 3]; };
    w = be32(16);
    h = be32(20);
}

Bytes header(uint8_t kind, uint32_t w, uint32_t h, const std::string& png) {
    if (w > 255 || h > 255) throw std::runtime_error(png + ": " + std::to_string(w) + "x" + std::to_string(h) +
                                                     " doesn't fit the one-byte width and height");
    return Bytes{kind, uint8_t(w), uint8_t(h)};
}

int usage() {
    std::cerr << "usage: biogfx sheet TILES.2bpp OUT.2bpp.lz\n"
                 "       biogfx img2 --png SRC.png TILES.2bpp OUT.img2\n"
                 "       biogfx img4 --png SRC.png PIXELS OUT.img4\n";
    return 2;
}

}  // namespace

int main(int argc, char** argv) {
    std::vector<std::string> a(argv + 1, argv + argc);
    try {
        if (a.size() == 3 && a[0] == "sheet") {
            Bytes tiles = read_file(a[1]);
            if (tiles.size() % 16) throw std::runtime_error(a[1] + ": not whole 16-byte tiles");
            size_t count = tiles.size() / 16;
            if (count > 0xFFFF) throw std::runtime_error(a[1] + ": more than 65535 tiles");
            tiles.resize(tiles.size() + 16, 0);   // the blank tile the original tool added
            Bytes out{uint8_t(count & 0xFF), uint8_t(count >> 8)};
            Bytes z = lzss::compress(tiles);
            out.insert(out.end(), z.begin(), z.end());
            write_file(a[2], out);
            return 0;
        }
        if (a.size() == 5 && (a[0] == "img2" || a[0] == "img4") && a[1] == "--png") {
            uint32_t w, h;
            png_size(a[2], w, h);
            Bytes in = read_file(a[3]), out, raw;
            if (a[0] == "img2") {
                out = header(2, w, h, a[2]);
                if (in.size() != size_t(w / 8) * (h / 8) * 16)
                    throw std::runtime_error(a[3] + ": " + std::to_string(in.size()) + " bytes, not the " +
                                             std::to_string((w / 8) * (h / 8)) + " tiles of " + a[2]);
                raw = in;
            } else {
                out = header(4, w, h, a[2]);
                if (in.size() != size_t(w) * h)
                    throw std::runtime_error(a[3] + ": " + std::to_string(in.size()) + " bytes, not the " +
                                             std::to_string(size_t(w) * h) + " pixels of " + a[2]);
                for (size_t i = 0; i < in.size(); i++)
                    if (in[i] > 4)
                        throw std::runtime_error(a[3] + ": pixel " + std::to_string(i) + " (x " + std::to_string(i % w) +
                                                 ", y " + std::to_string(i / w) + ") is palette index " +
                                                 std::to_string(in[i]) + "; a part image uses 0-3 and 4 = clear");
                if (in.size() % 2) in.push_back(4);
                for (size_t i = 0; i < in.size(); i += 2) raw.push_back(uint8_t(in[i] << 4 | in[i + 1]));
            }
            Bytes z = lzss::compress(raw);
            out.insert(out.end(), z.begin(), z.end());
            write_file(a[4], out);
            return 0;
        }
    } catch (std::exception& e) {
        std::cerr << "biogfx: " << e.what() << "\n";
        return 1;
    }
    return usage();
}
