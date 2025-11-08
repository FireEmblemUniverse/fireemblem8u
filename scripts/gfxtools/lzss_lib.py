#!/usr/bin/env python3

from sys import stderr

from collections import defaultdict
from operator import itemgetter
from struct import pack, unpack

import rom_def

def lz77_decompress(src):
    if src[0] != 0x10:
        raise ValueError("Not a valid GBA LZ77 compressed stream.")

    dest_size = (src[1] | (src[2] << 8) | (src[3] << 16))
    dest = [0] * dest_size

    src_pos = 4
    dest_pos = 0

    while True:
        if src_pos >= len(src):
            raise ValueError("overflow")

        flags = src[src_pos]
        src_pos += 1

        for i in range(8):
            if flags & 0x80: # compressed blocks
                if src_pos + 1 >= len(src):
                    raise ValueError("overflow in flags")

                block_size = (src[src_pos] >> 4) + 3
                block_distance = (((src[src_pos] & 0xF) << 8) | src[src_pos + 1]) + 1

                src_pos += 2

                block_pos = dest_pos - block_distance

                if block_pos < 0:
                    raise ValueError("invalid distance")

                if dest_pos + block_size > dest_size:
                    block_size = dest_size - dest_pos
                    print("Destination buffer overflow. Truncating block size.")

                for j in range(block_size):
                    dest[dest_pos] = dest[block_pos + j]
                    dest_pos += 1

            else: # uncompressed blocks
                if src_pos >= len(src) or dest_pos >= dest_size:
                    raise ValueError("overflow in uncompressed blocks")

                dest[dest_pos] = src[src_pos]
                src_pos += 1
                dest_pos += 1

            if dest_pos == dest_size:
                return bytes(dest)

            flags <<= 1

def copy_direct(offset, len):
    offset = offset & 0x00FFFFFF
    with open(rom_def.ROM, "rb") as f:
        f.seek(offset)
        return f.read(len)

def lz77_decomp_data(offset):
    offset = offset & 0x00FFFFFF
    with open(rom_def.ROM, "rb") as f:
        f.seek(offset)
        return lz77_decompress(f.read())

class SlidingWindow:
    # The size of the sliding window
    size = 4096

    # The minimum displacement.
    disp_min = 2

    # The hard minimum — a disp less than this can't be represented in the
    # compressed stream.
    disp_start = 1

    # The minimum length for a successful match in the window
    match_min = 1

    # The maximum length of a successful match, inclusive.
    match_max = None

    def __init__(self, buf):
        self.data = buf
        self.hash = defaultdict(list)
        self.full = False

        self.start = 0
        self.stop = 0
        #self.index = self.disp_min - 1
        self.index = 0

        assert self.match_max is not None

    def next(self):
        if self.index < self.disp_start - 1:
            self.index += 1
            return

        if self.full:
            olditem = self.data[self.start]
            assert self.hash[olditem][0] == self.start
            self.hash[olditem].pop(0)

        item = self.data[self.stop]
        self.hash[item].append(self.stop)
        self.stop += 1
        self.index += 1

        if self.full:
            self.start += 1
        else:
            if self.size <= self.stop:
                self.full = True

    def advance(self, n=1):
        for _ in range(n):
            self.next()

    def search(self):
        match_max = self.match_max
        match_min = self.match_min

        counts = []
        indices = self.hash[self.data[self.index]]
        for i in indices:
            matchlen = self.match(i, self.index)
            if matchlen >= match_min:
                disp = self.index - i
                #assert self.index - disp >= 0
                #assert self.disp_min <= disp < self.size + self.disp_min
                if self.disp_min <= disp:
                    counts.append((matchlen, -disp))
                    if matchlen >= match_max:
                        #assert matchlen == match_max
                        return counts[-1]

        if counts:
            match = max(counts, key=itemgetter(0))
            return match

        return None

    def match(self, start, bufstart):
        size = self.index - start

        if size == 0:
            return 0

        matchlen = 0
        it = range(min(len(self.data) - bufstart, self.match_max))
        for i in it:
            if self.data[start + (i % size)] == self.data[bufstart + i]:
                matchlen += 1
            else:
                break
        return matchlen

class NLZ10Window(SlidingWindow):
    size = 4096

    match_min = 3
    match_max = 3 + 0xf

class NLZ11Window(SlidingWindow):
    size = 4096

    match_min = 3
    match_max = 0x111 + 0xFFFF

class NOverlayWindow(NLZ10Window):
    disp_min = 3

def _compress(input, windowclass=NLZ10Window):

    window = windowclass(input)

    i = 0
    while True:
        if len(input) <= i:
            break
        match = window.search()
        if match:
            yield match
            #if match[1] == -283:
            #    raise Exception(match, i)
            window.advance(match[0])
            i += match[0]
        else:
            yield input[i]
            window.next()
            i += 1

def packflags(flags):
    n = 0
    for i in range(8):
        n <<= 1
        try:
            if flags[i]:
                n |= 1
        except IndexError:
            pass
    return n

def chunkit(it, n):
    buf = []
    for x in it:
        buf.append(x)
        if n <= len(buf):
            yield buf
            buf = []
    if buf:
        yield buf


def lz77_compress(input):
    # header
    out = b''
    out += (pack("<L", (len(input) << 8) + 0x10))

    # body
    length = 0
    for tokens in chunkit(_compress(input), 8):
        flags = [type(t) == tuple for t in tokens]
        out += (pack(">B", packflags(flags)))

        for t in tokens:
            if type(t) == tuple:
                count, disp = t
                count -= 3
                disp = (-disp) - 1
                assert 0 <= disp < 4096
                sh = (count << 12) | disp
                out += (pack(">H", sh))
            else:
                out += (pack(">B", t))

        length += 1
        length += sum(2 if f else 1 for f in flags)

    # padding
    # padding = 4 - (length % 4 or 4)
    # if padding:
    #   out += (b'\x00' * padding)
    return out
