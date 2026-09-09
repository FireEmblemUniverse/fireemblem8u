#!/usr/bin/env python3
"""Check instruction-table lowering with valid, hole and out-of-range indices."""
import argparse
from pathlib import Path
import re
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
from unicorn import arm_const as r

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin',type=Path,required=True)
    parser.add_argument('--compiler',default='arm-none-eabi-gcc')
    parser.add_argument('--pc-relative',action='store_true')
    parser.add_argument('--unchecked',action='store_true')
    args=parser.parse_args()
    specs={}
    source='extern void hit(unsigned);\n#ifdef MATCH_CONTRACT\n#define CONTRACT __attribute__((matching_unchecked_switch))\n#else\n#define CONTRACT\n#endif\n'
    for size in (5,6,9):
        for low in (0,7):
            name=f'table_{size}_{low}'
            mapping={low+i:100+i*13 for i in range(size) if i!=2}
            specs[name]=mapping
            source+=f'CONTRACT void {name}(unsigned x) {{ switch(x) {{\n'
            for key,value in mapping.items():source+=f'case {key}: hit({value}); break;\n'
            source+='default: hit(999); break; } }\n'
    with tempfile.TemporaryDirectory(prefix='arm-branch-tables-') as tmp:
        root=Path(tmp);(root/'probe.c').write_text(source)
        (root/'link.ld').write_text('SECTIONS { . = 0x08010000; .text : { *(.text) *(.rodata) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\nhit = 0x08020000;\n')
        checks=0
        for plugin in ([],['-fplugin='+str(args.plugin.resolve())]+(['-fplugin-arg-branch_tables-pc-relative'] if args.pc_relative else [])):
            if plugin and args.unchecked:plugin+=['-DMATCH_CONTRACT','-Werror=attributes']
            command=[args.compiler,'-S','-O1','-marm','-mcpu=arm7tdmi','-fno-if-conversion','-fno-if-conversion2','-fno-tree-switch-conversion',*plugin,str(root/'probe.c'),'-o',str(root/'probe.s')]
            subprocess.run(command,check=True)
            text=(root/'probe.s').read_text()
            assert bool(re.search(r'\bldrs?b\b',text)) == (not plugin),text
            if plugin:
                assert '.byte' not in text
                if args.pc_relative:
                    assert len(re.findall(r'\bmov\s+r[0-9]+, pc',text))==len(specs)
                    assert len(re.findall(r'\bbx\s+r[0-9]+',text))==len(specs)
                assert len(re.findall(r'\bbhi\s',text))==(0 if args.unchecked else len(specs))
            subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(root/'probe.s'),'-o',str(root/'probe.o')],check=True)
            subprocess.run(['arm-none-eabi-ld','-T',str(root/'link.ld'),str(root/'probe.o'),'-o',str(root/'probe.elf')],check=True)
            subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(root/'probe.elf'),str(root/'probe.bin')],check=True)
            symbols={}
            for line in subprocess.check_output(['arm-none-eabi-nm',str(root/'probe.elf')],text=True).splitlines():
                fields=line.split()
                if len(fields)==3 and fields[2] in specs:symbols[fields[2]]=int(fields[0],16)
            assert set(symbols)==set(specs)
            uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08010000,0x30000);uc.mem_map(0x03000000,0x8000)
            uc.mem_write(0x08010000,(root/'probe.bin').read_bytes());uc.mem_write(0x08020000,bytes.fromhex('1eff2fe1'))
            calls=[]
            def hit(machine,address,size,data):calls.append(machine.reg_read(r.UC_ARM_REG_R0))
            uc.hook_add(UC_HOOK_CODE,hit,begin=0x08020000,end=0x08020000)
            for name,mapping in specs.items():
                for value in [*range(20),0x7fffffff,0x80000000,0xfffffffe,0xffffffff]:
                    _,size,low=name.split('_')
                    if args.unchecked and not int(low)<=value<int(low)+int(size):continue
                    for flags in range(16):
                        calls.clear();uc.reg_write(r.UC_ARM_REG_CPSR,0x13|(flags<<28));uc.reg_write(r.UC_ARM_REG_R0,value)
                        for reg in range(4,12):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                        uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x08030000)
                        uc.emu_start(symbols[name],0x08030000,count=1000)
                        assert uc.reg_read(r.UC_ARM_REG_PC)==0x08030000
                        assert calls==[mapping.get(value,999)],(name,value,flags,calls)
                        assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                        for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                        checks+=1
        thumb=[]
        for plugin in ([],['-fplugin='+str(args.plugin.resolve())]):
            subprocess.run([args.compiler,'-S','-O1','-mthumb','-mcpu=arm7tdmi',*plugin,str(root/'probe.c'),'-o',str(root/'thumb.s')],check=True)
            thumb.append((root/'thumb.s').read_bytes())
        assert thumb[0]==thumb[1]
    print(f'{checks} baseline/plugin table executions pass; unchecked contract={args.unchecked}; holes, shifted ranges, all NZCV, registers and Thumb exclusion checked.')
if __name__=='__main__':main()
