#!/usr/bin/env python3
"""Verify the glyph renderer against original ARM and a halfword lookup model."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_WRITE
from unicorn import arm_const as regs
from build_color_fade import FLAGS

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/glyph-match'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin',type=Path,required=True)
    parser.add_argument("--half-stride", action="store_true", help="compile both routines with a shared pool and execute the half-stride variant")
    args = parser.parse_args()
    out = ROOT / ".deps/glyph-half-match" if args.half_stride else OUT
    entry = 0x08000620 if args.half_stride else 0x08000564
    row_count = 8 if args.half_stride else 16
    section_end = 0x6dc if args.half_stride else 0x620
    rom = (ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    source = Path(__file__).with_name('draw_glyph.c')
    flags = [flag for flag in FLAGS if flag!='-O1'] + ['-O2','-ffixed-r14','-fno-strict-aliasing',
             '-fplugin='+str(args.plugin.resolve()),'-fplugin-arg-zero_test-prefix-pool=bitTable']
    out.mkdir(parents=True,exist_ok=True)
    if args.half_stride:
        flags += ["-fplugin-arg-zero_test-share-prefix-pool", "-fno-toplevel-reorder"]
        half = Path(__file__).with_name("draw_glyph_half_stride.c").read_text()
        combined = out/"combined.c"
        combined.write_text(source.read_text()+"\n"+half[half.index("void DrawGlyphHalfStride"):])
        source = combined
    subprocess.run(['arm-none-eabi-gcc','-S',*flags,str(source),'-o',str(out/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(out/'candidate.s'),'-o',str(out/'candidate.o')],check=True)
    (out/'candidate.ld').write_text('SECTIONS { . = 0x08000560; .text : { *(.text) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\nbitTable = 0x08000540;\n')
    subprocess.run(['arm-none-eabi-ld','-T',str(out/'candidate.ld'),str(out/'candidate.o'),'-o',str(out/'candidate.elf')],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(out/'candidate.elf'),str(out/'candidate.bin')],check=True)
    code = (out/'candidate.bin').read_bytes()
    assert len(code)==section_end-0x560
    allowed = set()
    stack = 0x03007000
    def write_check(machine,access,address,size,value,data):
        assert (stack-28<=address and address+size<=stack) or all(a in allowed for a in range(address,address+size)), (hex(address),size)
    machines = []
    for candidate in (False,True):
        uc = Uc(UC_ARCH_ARM,UC_MODE_ARM)
        uc.mem_map(0x08000000,0x1000)
        uc.mem_write(0x08000000,rom[:0x1000])
        if candidate: uc.mem_write(0x08000560,code)
        uc.mem_map(0x02000000,0x4000)
        uc.mem_map(0x03000000,0x8000)
        uc.hook_add(UC_HOOK_MEM_WRITE,write_check)
        machines.append(uc)
    randomizer = random.Random(0x564)
    cases = 0
    for shift in range(8):
        for pattern in range(4):
            for lut_alignment in (0,2):
                for overlap in (False,True):
                    palette = 0x02002000+lut_alignment
                    destination = 0x02001000
                    src = destination+32 if overlap else 0x02003000
                    initial = bytearray(randomizer.randbytes(0x4000))
                    glyph = [[0]*16,[0xffffffff]*16,[0x55555555,0xaaaaaaaa]*8,
                             [randomizer.getrandbits(32) for _ in range(16)]][pattern]
                    struct.pack_into('<16I',initial,src-0x02000000,*glyph)
                    expected = bytearray(initial)
                    allowed.clear()
                    for row in range(row_count):
                        product = struct.unpack_from('<I',expected,src-0x02000000+4*row)[0] << (2*shift)
                        for part in range(3):
                            low = (product>>(16*part))&255
                            high = (product>>(16*part+8))&255
                            # The original loads words at two-byte LUT strides, but
                            # masks/shifts away their upper half. Model the retained
                            # halfwords, independent of ARM word-load rotation.
                            pixels = struct.unpack_from('<H',expected,palette-0x02000000+2*low)[0]
                            pixels |= struct.unpack_from('<H',expected,palette-0x02000000+2*high)[0]<<16
                            address = destination+4*row+(32 if args.half_stride else 64)*part
                            read_address = destination+4*row+64*part
                            old = struct.unpack_from('<I',expected,read_address-0x02000000)[0]
                            struct.pack_into('<I',expected,address-0x02000000,old|pixels)
                            allowed.update(range(address,address+4))
                    for nzcv in range(16):
                        outputs = []
                        for uc in machines:
                            uc.mem_write(0x02000000,bytes(initial))
                            uc.reg_write(regs.UC_ARM_REG_CPSR,0x13|(nzcv<<28))
                            for r in range(13):uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(r)),0x12340000+r)
                            for r,v in enumerate((palette,destination,src,shift)):
                                uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(r)),v)
                            uc.reg_write(regs.UC_ARM_REG_SP,stack)
                            uc.reg_write(regs.UC_ARM_REG_LR,0x08000F00)
                            uc.emu_start(entry,0x08000F00,count=10000)
                            assert uc.reg_read(regs.UC_ARM_REG_PC)==0x08000F00
                            assert uc.reg_read(regs.UC_ARM_REG_SP)==stack
                            for r in range(4,13):assert uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r)))==0x12340000+r
                            assert bytes(uc.mem_read(0x02000000,0x4000))==expected,(shift,pattern,lut_alignment,overlap,nzcv)
                            outputs.append(tuple(uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r))) for r in range(13))+(uc.reg_read(regs.UC_ARM_REG_CPSR)&0xf0000000,))
                        assert outputs[0]==outputs[1]
                        cases+=1
    report = {'tested_function':'DrawGlyphHalfStride' if args.half_stride else 'DrawGlyph',
              'tested_entry':hex(entry), 'rows':row_count, 'cases':cases,'complete_section_match':code==rom[0x560:section_end],
              'instruction_bytes':188,'section_bytes':len(code),'compiler_flags':flags,
              'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
              'candidate_sha256':hashlib.sha256(code).hexdigest(),
              'plugin_sha256':hashlib.sha256(args.plugin.read_bytes()).hexdigest()}
    (out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f'{cases} glyph cases pass: all shifts, halfword-aligned LUTs, overlap, arbitrary pixels, registers, NZCV, and write bounds.')
    print('Complete '+str(len(code))+'-byte pool/code match: '+str(report['complete_section_match']))


if __name__=='__main__':main()
