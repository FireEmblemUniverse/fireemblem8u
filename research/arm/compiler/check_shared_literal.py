#!/usr/bin/env python3
"""Validate external ARM literal relocation in both directions and range errors."""
import argparse
from pathlib import Path
import struct
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler',required=True)
    parser.add_argument('--plugin',type=Path,required=True)
    args=parser.parse_args()
    with tempfile.TemporaryDirectory(prefix='shared-arm-literal-') as tmp:
        root=Path(tmp);source=root/'probe.c'
        source.write_text('extern unsigned values[]; unsigned probe(unsigned index) { return values[index]; }\n')
        cases=0
        for offset in (0,4,12):
            binaries={}
            for mode in ('baseline','shared'):
                options=[] if mode=='baseline' else ['-fplugin='+str(args.plugin.resolve()),f'-fplugin-arg-branch_tables-shared-literal=values,SharedPool,{offset}']
                subprocess.run([args.compiler,'-S','-O1','-marm','-mcpu=arm7tdmi',*options,str(source),'-o',str(root/'probe.s')],check=True)
                subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(root/'probe.s'),'-o',str(root/(mode+'.o'))],check=True)
            for pool in (0x0800f100,0x08010f00):
                for mode in ('baseline','shared'):
                    (root/'link.ld').write_text(f'SECTIONS {{ . = 0x08010000; .text : {{ *(.text) }} /DISCARD/ : {{ *(.ARM.attributes) *(.comment) }} }}\nvalues = 0x02000000; SharedPool = {pool:#x};\n')
                    subprocess.run(['arm-none-eabi-ld','-T',str(root/'link.ld'),str(root/(mode+'.o')),'-o',str(root/'probe.elf')],check=True)
                    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(root/'probe.elf'),str(root/'probe.bin')],check=True)
                    binaries[mode]=(root/'probe.bin').read_bytes()
                for index in (0,1,7,31):
                    for flags in range(16):
                        results=[]
                        for mode in ('baseline','shared'):
                            uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x0800f000,0x4000);uc.mem_map(0x02000000,0x1000);uc.mem_map(0x03000000,0x8000)
                            uc.mem_write(0x08010000,binaries[mode]);uc.mem_write(pool+offset,struct.pack('<I',0x02000000))
                            uc.mem_write(0x02000000,struct.pack('<32I',*(i*0x1020304 for i in range(32))))
                            uc.reg_write(r.UC_ARM_REG_CPSR,0x13|(flags<<28))
                            for reg in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                            uc.reg_write(r.UC_ARM_REG_R0,index);uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x08012000)
                            uc.emu_start(0x08010000,0x08012000,count=100)
                            assert uc.reg_read(r.UC_ARM_REG_PC)==0x08012000
                            assert uc.reg_read(r.UC_ARM_REG_R0)==index*0x1020304
                            assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                            results.append([uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg))) for reg in range(13)]+[uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000])
                        assert results[0]==results[1]
                        cases+=1
            for pool in (0x0800d000,0x08013000):
                (root/'link.ld').write_text(f'SECTIONS {{ . = 0x08010000; .text : {{ *(.text) }} }} values = 0x02000000; SharedPool = {pool:#x};\n')
                result=subprocess.run(['arm-none-eabi-ld','-T',str(root/'link.ld'),str(root/'shared.o'),'-o',str(root/'bad.elf')],capture_output=True,text=True)
                assert result.returncode!=0 and ('overflow' in result.stderr or 'out of range' in result.stderr),result.stderr
    print(f'{cases} shared-literal comparisons pass; six out-of-range links rejected.')
if __name__=='__main__':main()
