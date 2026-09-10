#!/usr/bin/env python3
"""Exercise live AND/zero folding and exclude signed tests and asm barriers."""
import argparse
from pathlib import Path
import re
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE
from unicorn import arm_const as r


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--baseline',type=Path,required=True)
    parser.add_argument('--compiler',type=Path,required=True)
    args=parser.parse_args()
    conditions={'eq':'==','ne':'!=','lt':'<','le':'<=','gt':'>','ge':'>='}
    source='extern void hit(int);\n'
    for name,operator in conditions.items():
        source+=f'int {name}(int a,int b) {{ int value=a&b; if(value {operator} 0) hit(value); return value; }}\n'
    source+='int barrier(int a,int b) { int value=a&b; asm("" : "+r"(value)); if(value != 0) hit(value); return value; }\n'
    count=0
    with tempfile.TemporaryDirectory(prefix='live-and-check-') as tmp:
        root=Path(tmp);(root/'probe.c').write_text(source)
        (root/'hit.s').write_text('.syntax unified\n.thumb\n.section .callback,"ax",%progbits\n.global hit\n.thumb_func\nhit:\n bx lr\n')
        subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(root/'hit.s'),'-o',str(root/'hit.o')],check=True)
        (root/'link.ld').write_text('SECTIONS { . = 0x08010000; .text : { *(.text) } . = 0x08020000; .callback : { *(.callback) } }\n')
        baseline_bodies={}
        for mode,compiler in [('baseline',args.baseline),('folded',args.compiler)]:
            subprocess.run([str(compiler.resolve()),'-mthumb-interwork','-O2',str(root/'probe.c'),'-o',str(root/'probe.s')],check=True)
            assembly=(root/'probe.s').read_text()
            for name in [*conditions,'barrier']:
                body=assembly.split('\n'+name+':',1)[1].split('.Lfe',1)[0]
                if mode=='baseline':baseline_bodies[name]=body
                else:
                    assert re.search(r'\band\s',body),body
                    if name in ('eq','ne'):
                        assert not re.search(r'\bcmp\s',body),body
                        assert re.search(r'\bcmp\s',baseline_bodies[name]),name
                    else:
                        assert body==baseline_bodies[name],name+' excluded case changed'
            subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(root/'probe.s'),'-o',str(root/'probe.o')],check=True)
            subprocess.run(['arm-none-eabi-ld','-T',str(root/'link.ld'),str(root/'probe.o'),str(root/'hit.o'),'-o',str(root/'probe.elf')],check=True)
            subprocess.run(['arm-none-eabi-objcopy','-O','binary',str(root/'probe.elf'),str(root/'probe.bin')],check=True)
            symbols={parts[2]:int(parts[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(root/'probe.elf')],text=True).splitlines() if len(parts:=line.split())==3}
            uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08010000,0x30000);uc.mem_map(0x03000000,0x8000)
            uc.mem_write(0x08010000,(root/'probe.bin').read_bytes())
            calls=[]
            def hit(machine,address,size,data):
                calls.append(machine.reg_read(r.UC_ARM_REG_R0))
                for reg in range(4):machine.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0xdead0000+reg)
                machine.reg_write(r.UC_ARM_REG_CPSR,(machine.reg_read(r.UC_ARM_REG_CPSR)&0x0fffffff)|0xa0000000)
            uc.hook_add(UC_HOOK_CODE,hit,begin=0x08020000,end=0x08020000)
            values=(0,1,7,0xff,0x7fffffff,0x80000000,0x80000001,0xffffffff)
            for name in [*conditions,'barrier']:
                for a in values:
                    for b in values:
                        value=a&b;signed=value if value<0x80000000 else value-0x100000000
                        take={'eq':signed==0,'ne':signed!=0,'lt':signed<0,'le':signed<=0,'gt':signed>0,'ge':signed>=0,'barrier':signed!=0}[name]
                        for flags in range(16):
                            calls.clear();uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                            for reg in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                            uc.reg_write(r.UC_ARM_REG_R0,a);uc.reg_write(r.UC_ARM_REG_R1,b)
                            uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x08030001)
                            uc.emu_start(symbols[name]|1,0x08030000,count=100)
                            assert uc.reg_read(r.UC_ARM_REG_PC)==0x08030000
                            assert uc.reg_read(r.UC_ARM_REG_R0)==value
                            assert calls==([value] if take else []),(mode,name,a,b,flags,calls)
                            assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                            for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                            count+=1
    print(f'{count} baseline/folded executions pass; EQ/NE fold, signed conditions and asm barriers unchanged; live results, callbacks and callee-saved registers verified.')


if __name__=='__main__':main()
