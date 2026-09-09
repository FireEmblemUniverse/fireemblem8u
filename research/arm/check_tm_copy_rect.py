#!/usr/bin/env python3
"""Compare tilemap copying with canonical ARM execution and sequential memory effects."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_WRITE
from unicorn import arm_const as regs
from build_color_fade import FLAGS

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/tm-copy-match'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin', type=Path, required=True)
    args = parser.parse_args()
    rom = (ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    source = Path(__file__).with_name('tm_copy_rect.c')
    OUT.mkdir(parents=True, exist_ok=True)
    flags = FLAGS + ['-fplugin=' + str(args.plugin.resolve())]
    subprocess.run(['arm-none-eabi-gcc', '-S', *flags, str(source), '-o', str(OUT/'candidate.s')], check=True)
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(OUT/'candidate.s'), '-o', str(OUT/'candidate.o')], check=True)
    (OUT/'candidate.ld').write_text('SECTIONS { . = 0x080003E0; .text : { *(.text) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\n')
    subprocess.run(['arm-none-eabi-ld', '-T', str(OUT/'candidate.ld'), str(OUT/'candidate.o'), '-o', str(OUT/'candidate.elf')], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'candidate.elf'), str(OUT/'candidate.bin')], check=True)
    code = (OUT/'candidate.bin').read_bytes()
    original = rom[0x3E0:0x43C]
    machines = []
    allowed = set()
    stack = 0x03007000
    def write_check(machine, access, address, size, value, data):
        assert (stack-16 <= address and address+size <= stack) or all(a in allowed for a in range(address,address+size)), (hex(address),size)
    for body in (original, code):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        uc.mem_map(0x08000000, 0x1000)
        uc.mem_write(0x080003E0, body)
        uc.mem_map(0x02000000, 0x4000)
        uc.mem_map(0x03000000, 0x8000)
        uc.hook_add(UC_HOOK_MEM_WRITE, write_check)
        machines.append(uc)
    initial = bytes((i*37+(i>>8)) & 255 for i in range(0x4000))
    count = 0
    for width in (-2147483648,-1,0,1,2,31,32,33):
        for height in (-1,0,1,2,4):
            for delta in (-2,0,2,0x1000):
                source_address = 0x02000800
                destination = source_address + delta
                expected = bytearray(initial)
                allowed.clear()
                for y in range(max(0,height)):
                    for x in range(max(0,width)):
                        src = source_address + 64*y + 2*x
                        dst = destination + 64*y + 2*x
                        expected[dst-0x02000000:dst-0x02000000+2] = expected[src-0x02000000:src-0x02000000+2]
                        allowed.update((dst,dst+1))
                for nzcv in range(16):
                    outputs = []
                    for uc in machines:
                        uc.mem_write(0x02000000, initial)
                        uc.reg_write(regs.UC_ARM_REG_CPSR, 0x13 | (nzcv<<28))
                        for r in range(13):
                            uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(r)), 0x12340000+r)
                        for r,v in enumerate((source_address,destination,width,height)):
                            uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(r)), v & 0xffffffff)
                        uc.reg_write(regs.UC_ARM_REG_SP, stack)
                        uc.reg_write(regs.UC_ARM_REG_LR, 0x08000F00)
                        uc.emu_start(0x080003E0, 0x08000F00, count=10000)
                        assert uc.reg_read(regs.UC_ARM_REG_PC)==0x08000F00
                        assert uc.reg_read(regs.UC_ARM_REG_SP)==stack
                        for r in range(4,13):
                            assert uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r)))==0x12340000+r
                        assert bytes(uc.mem_read(0x02000000,0x4000))==expected, (width,height,delta,nzcv)
                        outputs.append(tuple(uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r))) for r in range(13))+(uc.reg_read(regs.UC_ARM_REG_CPSR)&0xf0000000,))
                    assert outputs[0]==outputs[1], (width,height,delta,nzcv,outputs)
                    count += 1
    report = {'cases': count, 'complete_section_match':code==original,
              'original_bytes':len(original), 'candidate_bytes':len(code),
              'candidate_sha256':hashlib.sha256(code).hexdigest(),
              'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
              'plugin_sha256':hashlib.sha256(args.plugin.read_bytes()).hexdigest(), 'compiler_flags':flags}
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f'{count} original/candidate cases pass, including overlap, nonpositive dimensions, all NZCV, registers, and write boundaries.')
    print(f'Full {len(original)}-byte section match: {code==original}')


if __name__ == '__main__':
    main()
