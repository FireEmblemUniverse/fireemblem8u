#!/usr/bin/python3

# external tools
# by laqieer
# 2019/4/26

import os
import math
import struct
import lzss3
from subprocess import Popen, PIPE

cwd = os.path.dirname(os.path.realpath(__file__))

# tool path
gbagfx = '../tools/gbagfx/gbagfx'

fake = 0
lz77 = 1
huffman = 2
runlength = 3

CompType = ['fake', 'lz77', 'huffman', 'runlength']

def align(address, byte_number=4):
    return math.ceil(address / byte_number) * byte_number


class Error(Exception):
    """Base class for exceptions in this module."""
    pass


class CompTypeError(Error):
    """Unsupported compression type.

    Attributes:
        offset -- file offset
        comp_type -- compression type
    """

    def __init__(self, offset, comp_type):
        self.offset = offset
        if comp_type < len(CompType):
            self.comp_type = CompType[comp_type]
        else:
            self.comp_type = comp_type


class GbagfxError(Error):
    """Error from gbagfx"""

    def __init__(self, cmd, err):
        self.cmd = cmd
        self.err = err


class FileExtNameError(Error):
    """Error from gbagfx"""

    def __init__(self, filename, require):
        self.filename = filename
        self.require = require


class BitDepthError(Error):
    """Image bit depth eroor"""

    def __init__(self, offset, bitdepth):
        self.offset = offset
        self.bitdepth = bitdepth


class CompData:
    """
    Compressed data.
    """
    def __init__(self, fp, offset=0, comp_type=None):
        # convert address to offset
        if offset >= 0x8000000:
            self.offset = offset - 0x8000000
        else:
            self.offset = offset
        fp.seek(self.offset)
        head = struct.unpack('<I', fp.read(4))[0]
        # decide compression type
        if comp_type is None:
            self.comp_type = (head & 0xf0) >> 4
        elif type(comp_type) is str:
            self.comp_type = CompType.index(comp_type)
        elif comp_type > len(CompType):
            raise CompTypeError(self.offset, comp_type)
        else:
            self.comp_type = comp_type
        # calc the size of uncompressed data
        if self.comp_type == fake:
            self.size = head >> 8 - 4
        else:
            self.size = head >> 8
        # calc the length of compressed data
        if self.comp_type == fake:
            self.length = head >> 8
        elif self.comp_type == lz77:
            written = 0
            while written < self.size:
                flags = struct.unpack("<B", fp.read(1))[0]
                for x in range(8):
                    if flags & 0x80:
                        tmp, tmp2 = struct.unpack("<BB", fp.read(2))
                        blocksize = (tmp >> 4) + 3
                        written += blocksize
                    else:
                        fp.read(1)
                        written += 1
                    if written >= self.size:
                        break
                    flags = (flags << 1) & 0xff
            self.length = align(fp.tell() - self.offset)
        else:
            # assuming that the comprssed data is smaller than the uncomprssed data
            self.length = self.size
        # compressed data
        fp.seek(self.offset)
        self.data = fp.read(self.length)

    def get_comp_type(self):
        return self.comp_type

    def write_comp_data(self, fp):
        fp.write(self.data)

    def write_uncomp_data(self, fp):
        if self.comp_type == fake:
            fp.write(self.data[4:])
        elif self.comp_type == lz77:
            fp.write(lzss3.decompress_bytes(self.data))
        else:
#            print('error: 0x%X %s compression is not supported.' % (self.offset, CompType[self.comp_type]))
            raise CompTypeError(self.offset, self.comp_type)


def decomp_file(infile, outfile):
    """
    Decompress lz77(*.lz) or runlength(*.rl) compressed file with gbagfx.
    """
    base, ext = os.path.splitext(infile)
    if ext not in ('.lz', '.rl'):
        raise FileExtNameError(infile, '*.lz, *.rl')
    cmd = "%s %s %s" % (gbagfx, infile, outfile)
    p = Popen(cmd, stderr=PIPE, cwd=cwd, shell=True)
    p.wait()
    if p.returncode != 0:
        raise GbagfxError(cmd, p.stderr)

def save_image(infile, outfile=None, width=32, palfile=None):
    """
    Save image with gbagfx.
    """
    base, ext = os.path.splitext(infile)
    if ext not in ('.1bpp', '.4bpp', '.8bpp'):
        raise FileExtNameError(infile, '*.1bpp, *.4bpp, *.8bpp')
    if outfile is not None:
        ext = os.path.splitext(outfile)[1]
        if exit != '.png':
            raise FileExtNameError(outfile, '*.png')
    else:
        outfile = base + '.png'
    if palfile is not None:
        ext = os.path.splitext(palfile)[1]
        if ext != '.gbapal':
            raise FileExtNameError(palfile, '*.gbapal')
    # convert pixel width to tile width
    if width > 32:
        width = math.ceil(8)
    cmd = "%s %s %s -width %d" % (gbagfx, infile, outfile, width)
    if palfile is not None:
        cmd += " -palette %s" % palfile
    p = Popen(cmd, stderr=PIPE, cwd=cwd, shell=True)
    p.wait()
    if p.returncode != 0:
        raise GbagfxError(cmd, p.stderr)

def dump_palette(fp, offset, comp_type=None, color_number=16, name=None):
    if offset > 0x8000000:
        offset -= 0x8000000
    fp.seek(offset)
    if name is None:
        name = 'pal_%X' % offset
    if comp_type is not None:
        data = CompData(fp, offset, comp_type)
        if data.comp_type == lz77:
            compfile = name + '.gbapal.lz'
        elif data.comp_type == runlength:
            compfile = name + '.gbapal.rl'
        else:
            raise CompTypeError(offset, data.comp_type)
        with open(compfile, 'wb') as fp_comp:
            data.write_comp_data(fp_comp)
        decomp_file(fp_comp, name)
    else:
        with open(name + '.gbapal', 'wb') as fp_pal:
            fp_pal.write(fp.read(2 * color_number))


def decomp_image(fp, offset_img, width=32, height=0, bitdepth=4, comp_type_img=None, offset_pal=None, comp_type_pal=None, pal_number=None, name=None):
    if offset_pal is not None:
        if offset_pal >= 0x8000000:
            offset_pal -= 0x8000000
        if pal_number is None:
            color_number = 1 << bitdepth
        else:
            color_number = 16 * pal_number
        dump_palette(fp, offset_pal, comp_type_pal, color_number, name)
        if name is None:
            palfile = 'pal_%X.gbapal' % offset_pal
        else:
            palfile = name + '.gbapal'
    if name is None:
        imagefile = 'img_%X' % offset_img
    else:
        imagefile = name
    if bitdepth in (1, 4, 8):
        imagefile += '.%dbpp' % bitdepth
    else:
        raise BitDepthError(offset_img, bitdepth)
    if comp_type_img == 'NoComp':
        if offset_img >= 0x8000000:
            offset_img -= 0x8000000
        fp.seek(offset_img)
        with open(imagefile, 'wb') as fp_img:
            fp_img.write(fp.read(32 * width * height))
    else:
        data_img = CompData(fp, offset_img, comp_type_img)
        if data_img.comp_type == fake:
            with open(imagefile, 'wb') as fp_img:
                data_img.write_uncomp_data(fp_img)
        else:
            if data_img.comp_type == lz77:
                compfile = imagefile + '.lz'
            elif data_img.comp_type == runlength:
                compfile = imagefile + '.rl'
            else:
                raise CompTypeError(data_img.offset, data_img.comp_type)
            with open(compfile, 'wb') as fp_comp:
                data_img.write_comp_data(fp_comp)
            decomp_file(compfile, imagefile)
    if offset_pal is None:
        save_image(imagefile, width=width)
    else:
        save_image(imagefile, width=width, palfile=palfile)

def read_pointer(fp, offset):
    fp.seek(offset)
    if offset % 4 == 0:
        pointer = struct.unpack('<I', fp.read(4))[0]
        if pointer >= 0x2000000:
            return pointer
    return None

def read_rom_offset(fp, offset):
    fp.seek(offset)
    pointer = read_pointer(fp, offset)
    if pointer >= 0x8000000:
        return pointer - 0x8000000
    return None

def read_pointer_here(fp):
    pointer = struct.unpack('<I', fp.read(4))[0]
    if pointer >= 0x2000000:
        return pointer
    return None

def read_rom_offset_here(fp):
    pointer = read_pointer_here(fp)
    if pointer >= 0x8000000:
        return pointer - 0x8000000
    return None

def read_asm_macro(fp):
    """
    make dict: value -> name from assembler macro.
    if several macros are equal, the last macro name is recorded.
    """
    result = {}
    lines = fp.readlines()
    for i in range(len(lines)):
        '''
        .macro name
            .word value
        .endm
        '''
        if '.macro' in lines[i] and '.word' in lines[i + 1] \
                and ',' not in lines[i + 1] and '.endm' in  lines[i + 2]:
            name = lines[i].split(".macro")[1].strip()
            name = name.split()[0]
            value = lines[i + 1].split(".word")[1].strip()
            value = value.split()[0]
            if '0x' in value:
                value = int(value, 16)
            else:
                value = int(value)
            result[value] = name
    return result

def main():
    with open('../baserom.gba', 'rb') as fp_rom:
        face_Eirika_pointer_table = 0x8ACBFC
        fp_rom.seek(face_Eirika_pointer_table)
        face_Eirika_image = read_pointer_here(fp_rom)
        face_Eirika_mini_image = read_pointer_here(fp_rom)
        face_Eirika_palette = read_pointer_here(fp_rom)
        face_Eirika_mouth_frame = read_pointer_here(fp_rom)
        decomp_image(fp_rom, offset_img=face_Eirika_image, name='out/face_Eirika', offset_pal=face_Eirika_palette)
        decomp_image(fp_rom, offset_img=face_Eirika_mini_image, name='out/face_Eirika_mini', width=4, offset_pal=face_Eirika_palette)
        decomp_image(fp_rom, offset_img=face_Eirika_mouth_frame, comp_type_img='NoComp', width=4, height=6, name='out/face_Eirika_mouth_frame', offset_pal=face_Eirika_palette)
    pass

if __name__ == "__main__":
    main()

