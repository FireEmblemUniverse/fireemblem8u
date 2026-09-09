#!/usr/bin/env python3
"""Verify opt-in scalar copy encoding, pointer exclusion, values and all NZCV."""
import argparse
from pathlib import Path
import re
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as regs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin', type=Path, required=True)
    args = parser.parse_args()
    plugin = ['-fplugin='+str(args.plugin.resolve())]
    option = ['-fplugin-arg-zero_test-scalar-copy-sub-zero']
    with tempfile.TemporaryDirectory(prefix='arm-scalar-copy-') as temporary:
        root = Path(temporary)
        (root/'probe.c').write_text('''unsigned scalar(unsigned x) { register unsigned v asm("r4")=x; asm("" : "+r"(v)); return v; }
void * pointer(void * x) { register void * v asm("r4")=x; asm("" : "+r"(v)); return v; }
''')
        (root/'link.ld').write_text('SECTIONS { . = 0x08010000; .text : { *(.text) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\n')
        images = []
        bodies = []
        for options in ([], option):
            subprocess.run(['arm-none-eabi-gcc','-S','-O1','-marm','-mcpu=arm7tdmi',*plugin,*options,str(root/'probe.c'),'-o',str(root/'probe.s')],check=True)
            text = (root/'probe.s').read_text()
            bodies.append(text.split('\npointer:',1)[1].split('\t.size',1)[0])
            scalar = text.split('\nscalar:',1)[1].split('\t.size',1)[0]
            assert bool(re.search(r'\bsub\s+r4, r0, #0',scalar)) == bool(options), scalar
            subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(root/'probe.s'),'-o',str(root/'probe.o')],check=True)
            subprocess.run(['arm-none-eabi-ld','-T',str(root/'link.ld'),str(root/'probe.o'),'-o',str(root/'probe.elf')],check=True)
            subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(root/'probe.elf'),str(root/'probe.bin')],check=True)
            symbols = {line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(root/'probe.elf')],text=True).splitlines() if line.split()[-1] in ['scalar','pointer']}
            images.append(((root/'probe.bin').read_bytes(),symbols))
        assert bodies[0] == bodies[1], 'pointer copy instructions changed'
        cases = 0
        for body, symbols in images:
            uc = Uc(UC_ARCH_ARM,UC_MODE_ARM)
            uc.mem_map(0x08010000,0x1000)
            uc.mem_map(0x03000000,0x8000)
            uc.mem_write(0x08010000,body)
            for symbol in symbols:
                for value in (0,1,0x7fffffff,0x80000000,0xffffffff,0x12345678):
                    for nzcv in range(16):
                        uc.reg_write(regs.UC_ARM_REG_CPSR,0x13|(nzcv<<28))
                        for r in range(13): uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(r)),0x11110000+r)
                        uc.reg_write(regs.UC_ARM_REG_R0,value)
                        uc.reg_write(regs.UC_ARM_REG_SP,0x03007000)
                        uc.reg_write(regs.UC_ARM_REG_LR,0x08010800)
                        uc.emu_start(symbols[symbol],0x08010800,count=100)
                        assert uc.reg_read(regs.UC_ARM_REG_PC)==0x08010800
                        assert uc.reg_read(regs.UC_ARM_REG_R0)==value
                        assert uc.reg_read(regs.UC_ARM_REG_SP)==0x03007000
                        assert uc.reg_read(regs.UC_ARM_REG_CPSR)&0xf0000000==nzcv<<28
                        for r in range(1,13): assert uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r)))==0x11110000+r
                        cases += 1
        result = subprocess.run(['arm-none-eabi-gcc','-S','-O1','-mthumb','-mcpu=arm7tdmi',*plugin,*option,str(root/'probe.c'),'-o',str(root/'thumb.s')],capture_output=True,text=True)
        assert result.returncode and 'require ARM mode' in result.stderr
        print(f'{cases} scalar/pointer executions preserve values, registers, and every NZCV; pointer encoding unchanged; Thumb request rejected.')


if __name__ == '__main__':
    main()
