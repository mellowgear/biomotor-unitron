// biosong: Biomotor Unitron's song track compiler. Turns one track text file (src/audio/tracks/
// track_XX.song) into the track record PlaySong reads, as asm900 db lines:
//
//   biosong TRACK.song OUT.asm
//
// Track record (PlaySong 0x200122): u16 track id, u8 E = 2 + 2k, then the Z80 block.
// Z80 block (driver 0x0522-0x05D4): u16 L | (k-1)<<14 (L = block length), k channel words
// chan<<14 | offset (stream start = address after the word + offset), the map bytes, then the
// streams. Streams are bit streams read MSB first (driver reader 0x048F); fields wider than 8
// bits are read as the low 8 bits first, then the rest.
//
// The source keeps the choices the ROM made (which note fields are sent, `=` against a value);
// biosong computes the rest: L, E, the offsets, the 4/8-bit width of waits and gates, the call
// offsets and the 0 padding bits (after `loop` and before each label, where a stream starts
// on a byte).
#include <algorithm>
#include <cctype>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <map>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace {

struct Error : std::runtime_error {
    using std::runtime_error::runtime_error;
};

// The bit stream as single bits; packed MSB first at the end.
struct Bits {
    std::vector<uint8_t> v;
    void put(unsigned value, int n) {  // n <= 8, MSB first
        for (int i = n - 1; i >= 0; --i) v.push_back(uint8_t(value >> i & 1));
    }
    void put_wide(unsigned value, int n) {  // the reader's order: low 8 bits first, then the rest
        if (n > 8) {
            put(value & 0xFF, 8);
            put(value >> 8, n - 8);
        } else {
            put(value, n);
        }
    }
    void align() {
        while (v.size() % 8) v.push_back(0);
    }
    size_t bytes() const { return (v.size() + 7) / 8; }  // the reader's pointer after the last bit
};

const char* NOTES[12] = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};

// cmd number and argument width (driver table at Z80 0x03E6; 15 = end, 0x0401)
struct Cmd {
    int num, bits;
};
const std::map<std::string, Cmd> CMDS = {
    {"instr", {0, 5}}, {"atten", {1, 4}}, {"pan", {2, 4}},  {"detune", {3, 7}}, {"loop", {4, 5}},
    {"endloop", {5, 0}}, {"tempo", {6, 8}}, {"call", {7, 11}}, {"ret", {8, 0}}, {"end", {15, 0}},
};

struct Fixup {
    size_t bitpos;  // where the 11-bit call argument goes
    size_t after;   // byte offset (from the stream start) of the reader's pointer after it
    std::string label;
    int line;
};

struct Compiler {
    std::string path;
    int line = 0;
    long track_id = -1;
    std::vector<std::pair<int, std::string>> channels;  // hardware channel, label
    std::vector<uint8_t> map;
    bool have_map = false;
    Bits bits;
    std::map<std::string, size_t> labels;  // label -> byte offset from the stream start
    std::vector<Fixup> fixups;

    [[noreturn]] void fail(const std::string& msg) const {
        throw Error(path + ":" + std::to_string(line) + ": " + msg);
    }

    long number(const std::string& s, long lo, long hi, const std::string& what) const {
        size_t used = 0;
        long v = 0;
        try {
            v = std::stol(s, &used, 0);
        } catch (...) {
            used = 0;
        }
        if (used != s.size() || s.empty()) fail("bad " + what + " '" + s + "'");
        if (v < lo || v > hi)
            fail(what + " " + s + " out of range " + std::to_string(lo) + "-" + std::to_string(hi));
        return v;
    }

    // duration field (driver 0x0479): `1` = same as last; `00 vvvv` 4-bit; `01 vvvvvvvv` 8-bit
    void duration(const std::string* field, const char* what) {
        if (!field || *field == "=") {
            bits.put(1, 1);
            return;
        }
        long v = number(*field, 0, 255, what);
        if (v < 16) {
            bits.put(0, 2);
            bits.put(unsigned(v), 4);
        } else {
            bits.put(1, 2);
            bits.put(unsigned(v), 8);
        }
    }

    // optional fields like w12 / g= / v15: returns the text after the letter, or nullptr
    struct Fields {
        std::map<char, std::string> f;
        const std::string* get(char c) const {
            auto it = f.find(c);
            return it == f.end() ? nullptr : &it->second;
        }
    };
    Fields fields(const std::vector<std::string>& tok, size_t from, const std::string& allowed) {
        Fields out;
        for (size_t i = from; i < tok.size(); ++i) {
            const std::string& t = tok[i];
            if (t.size() < 2 || allowed.find(t[0]) == std::string::npos) fail("unexpected '" + t + "'");
            if (!out.f.emplace(t[0], t.substr(1)).second) fail(std::string("field ") + t[0] + " given twice");
        }
        return out;
    }

    void note(const std::vector<std::string>& tok) {
        // note [oN] NAME|= [vN] [wN|w=] [gN|g=]   (oN: octave sent; NAME: semitone sent; = keeps it)
        size_t i = 1;
        int octave = -1, semi = -1;
        if (i < tok.size() && tok[i].size() >= 2 && tok[i][0] == 'o' && isdigit(uint8_t(tok[i][1])))
            octave = int(number(tok[i++].substr(1), 0, 7, "octave"));
        if (i >= tok.size()) fail("note needs a note name or =");
        const std::string& name = tok[i++];
        if (name != "=") {
            for (int s = 0; s < 12; ++s)
                if (name == NOTES[s]) semi = s;
            if (semi < 0) fail("bad note name '" + name + "' (C C# D D# E F F# G G# A A# B, or =)");
        }
        Fields f = fields(tok, i, "vwg");
        bits.put(0, 1);
        duration(f.get('w'), "wait");
        unsigned sel = (octave < 0 ? 1u : 0u) | (semi < 0 ? 2u : 0u);
        bits.put(sel, 2);
        if (octave >= 0) bits.put(unsigned(octave), 3);
        if (semi >= 0) bits.put(unsigned(semi), 4);
        if (const std::string* v = f.get('v'); v && *v != "=") {
            bits.put(0, 1);
            bits.put(unsigned(number(*v, 0, 15, "volume")), 4);
        } else {
            bits.put(1, 1);
        }
        duration(f.get('g'), "gate");
    }

    void command(const std::vector<std::string>& tok, const Cmd& c) {
        size_t i = 1;
        std::string arg;
        if (c.bits) {
            if (i >= tok.size()) fail(tok[0] + " needs an argument");
            arg = tok[i++];
        }
        Fields f = fields(tok, i, "w");
        bits.put(1, 1);
        // a command's `1` wait means wait 0 (and sets the stored last wait to 0), driver 0x031A
        duration(f.get('w'), "wait");
        bits.put(unsigned(c.num), 4);
        if (c.num == 7) {  // call: offset from the reader's pointer after the argument
            fixups.push_back({bits.v.size(), 0, arg, line});
            bits.put_wide(0, 11);
            fixups.back().after = bits.bytes();
        } else if (c.bits) {
            bits.put_wide(unsigned(number(arg, 0, (1L << c.bits) - 1, tok[0] + " argument")), c.bits);
        }
        if (c.num == 4) bits.align();  // loop drops the rest of the byte (driver 0x045E)
    }

    void statement(const std::vector<std::string>& tok) {
        const std::string& op = tok[0];
        if (op.back() == ':') {
            if (tok.size() != 1) fail("a label goes on its own line");
            std::string name = op.substr(0, op.size() - 1);
            bits.align();  // streams start on a byte
            if (!labels.emplace(name, bits.bytes()).second) fail("label " + name + " defined twice");
            return;
        }
        bool body = !labels.empty();
        if (op == "track" || op == "channel" || op == "map") {
            if (body) fail(op + " must come before the first label");
            if (op == "track") {
                if (tok.size() != 2) fail("track ID");
                track_id = number(tok[1], 0, 0xFFFF, "track id");
            } else if (op == "channel") {
                if (tok.size() != 3) fail("channel HWCHANNEL, LABEL");
                channels.push_back({int(number(tok[1], 0, 3, "hardware channel")), tok[2]});
            } else {
                if (have_map) fail("map given twice");
                have_map = true;
                for (size_t i = 1; i < tok.size(); ++i) map.push_back(uint8_t(number(tok[i], 0, 255, "map byte")));
            }
            return;
        }
        if (!body) fail("stream data before the first label");
        if (op == "note") return note(tok);
        auto it = CMDS.find(op);
        if (it == CMDS.end()) fail("unknown '" + op + "'");
        command(tok, it->second);
    }

    std::vector<uint8_t> compile(std::istream& in) {
        std::string text;
        while (std::getline(in, text)) {
            ++line;
            if (auto p = text.find(';'); p != std::string::npos) text.resize(p);
            for (char& ch : text)
                if (ch == ',' || ch == '\t' || ch == '\r') ch = ' ';
            std::istringstream ss(text);
            std::vector<std::string> tok;
            for (std::string t; ss >> t;) tok.push_back(t);
            if (!tok.empty()) statement(tok);
        }
        bits.align();
        if (track_id < 0) fail("no track line");
        if (channels.empty() || channels.size() > 4) fail("a track has 1 to 4 channel lines");
        if (!have_map) fail("no map line");

        // pack the streams, then patch the call offsets
        for (const Fixup& fx : fixups) {
            line = fx.line;
            auto it = labels.find(fx.label);
            if (it == labels.end()) fail("call to undefined label " + fx.label);
            if (it->second < fx.after || it->second - fx.after > 2047)
                fail("call target " + fx.label + " must lie 0-2047 bytes after the call");
            unsigned off = unsigned(it->second - fx.after);
            Bits b;
            b.put_wide(off, 11);
            std::copy(b.v.begin(), b.v.end(), bits.v.begin() + long(fx.bitpos));
        }
        std::vector<uint8_t> streams(bits.bytes());
        for (size_t i = 0; i < bits.v.size(); ++i) streams[i / 8] |= uint8_t(bits.v[i] << (7 - i % 8));

        size_t k = channels.size();
        size_t start = 2 + 2 * k + map.size();  // stream start, from the block start
        size_t L = start + streams.size();
        if (L > 0x3FFF) fail("block of " + std::to_string(L) + " bytes is over the 14-bit length");
        std::vector<uint8_t> out;
        auto w16 = [&](unsigned v) {
            out.push_back(uint8_t(v));
            out.push_back(uint8_t(v >> 8));
        };
        w16(unsigned(track_id));
        out.push_back(uint8_t(2 + 2 * k));  // E: PlaySong patches the song's map in here
        w16(unsigned(L | (k - 1) << 14));
        for (size_t i = 0; i < k; ++i) {
            auto it = labels.find(channels[i].second);
            if (it == labels.end()) throw Error(path + ": channel label " + channels[i].second + " undefined");
            size_t after = 2 + 2 * (i + 1);  // block offset of the address after this word
            w16(unsigned(channels[i].first) << 14 | unsigned(start + it->second - after));
        }
        out.insert(out.end(), map.begin(), map.end());
        out.insert(out.end(), streams.begin(), streams.end());
        return out;
    }
};

}  // namespace

int main(int argc, char** argv) {
    if (argc != 3) {
        std::cerr << "usage: biosong TRACK.song OUT.asm\n";
        return 2;
    }
    try {
        std::ifstream in(argv[1]);
        if (!in) throw Error(std::string(argv[1]) + ": can't open");
        Compiler c;
        c.path = argv[1];
        std::vector<uint8_t> bytes = c.compile(in);
        std::ofstream out(argv[2]);
        out << "; generated by biosong from " << argv[1] << ": edit the source, not this file\n";
        for (size_t i = 0; i < bytes.size(); i += 16) {
            out << "\tdb\t";
            for (size_t j = i; j < bytes.size() && j < i + 16; ++j) {
                char buf[8];
                std::snprintf(buf, sizeof buf, "%s0x%02X", j == i ? "" : ",", bytes[j]);
                out << buf;
            }
            out << "\n";
        }
        if (!out) throw Error(std::string(argv[2]) + ": can't write");
    } catch (const std::exception& e) {
        std::cerr << "biosong: " << e.what() << "\n";
        return 1;
    }
    return 0;
}
