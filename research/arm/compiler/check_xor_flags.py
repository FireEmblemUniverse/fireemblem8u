#!/usr/bin/env python3
"""Check experimental XOR fusion with independent predicates and result checks."""
import argparse
from pathlib import Path
import re
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
from unicorn import arm_const as regs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin',type=Path,required=True)
    args = parser.parse_args()
    operations={}
    source='extern void hit(void);\n'
    eligible=[]
    excluded=[]
    for mask in (1,255,0x80000000):
        for relation in ('eq','ne','lt','ge'):
            name=relation+'_'+str(mask)
            expression={'eq':'v == 0','ne':'v != 0','lt':'(int)v < 0','ge':'(int)v >= 0'}[relation]
            operations[name]=(mask,relation)
            (eligible if relation in ('eq','ne') and mask != 0x80000000 else excluded).append(name)
            source+='unsigned %s(unsigned x) { register unsigned v asm("r4")=x; asm("" : "+r"(v)); v ^= %su; asm("" : "+r"(v)); if (%s) hit(); asm("" : "+r"(v)); return v; }\n' % (name,mask,expression)
    for suffix,barrier in [('memory','asm("" : "+r"(v) : : "memory");'),('cc','asm("" : "+r"(v) : : "cc");'),('nonempty','asm("mov %0, %0" : "+r"(v));')]:
        name='exclude_'+suffix
        operations[name]=(1,'eq');excluded.append(name)
        source+='unsigned %s(unsigned x) { register unsigned v asm("r4")=x; asm("" : "+r"(v)); v ^= 1u; %s if (v == 0) hit(); asm("" : "+r"(v)); return v; }\n' % (name,barrier)

    with tempfile.TemporaryDirectory(prefix='arm-tst-plugin-check-') as temporary:
        root = Path(temporary)
        (root/'probe.c').write_text(source)
        (root/'link.ld').write_text('SECTIONS { . = 0x08010000; .text : { *(.text) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\nhit = 0x08020000;\n')
        checks = 0
        baseline_text = None
        for name,plugin in [('baseline',[]),('plugin',['-fplugin='+str(args.plugin.resolve())])]:
            assembly = root/(name+'.s')
            obj = root/(name+'.o')
            elf = root/(name+'.elf')
            binary = root/(name+'.bin')
            subprocess.run(['arm-none-eabi-gcc','-S','-O1','-marm','-mcpu=arm7tdmi',
                            '-fno-if-conversion','-fno-if-conversion2','-fno-schedule-insns','-fno-schedule-insns2',*plugin,str(root/'probe.c'),'-o',str(assembly)],check=True)
            text = assembly.read_text()
            if not plugin:
                baseline_text = text
            if plugin:
                for function in eligible:
                    body=text.split('\n'+function+':',1)[1].split('\t.size',1)[0]
                    assert re.search(r'\beors\s',body), (function,body)
                for function in excluded:
                    body=text.split('\n'+function+':',1)[1].split('\t.size',1)[0]
                    old=baseline_text.split('\n'+function+':',1)[1].split('\t.size',1)[0]
                    assert body==old,('excluded form changed',function)

            subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi','-o',str(obj),str(assembly)],check=True)
            subprocess.run(['arm-none-eabi-ld','-T',str(root/'link.ld'),'-o',str(elf),str(obj)],check=True)
            subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(elf),str(binary)],check=True)
            symbols = {}
            for line in subprocess.check_output(['arm-none-eabi-readelf','-sW',str(elf)],text=True).splitlines():
                fields = line.split()
                if len(fields)>=8 and fields[-1] in operations:
                    symbols[fields[-1]] = int(fields[1],16)
            assert set(symbols) == set(operations)
            uc = Uc(UC_ARCH_ARM,UC_MODE_ARM)
            uc.mem_map(0x08010000,0x30000)
            uc.mem_write(0x08010000,binary.read_bytes())
            # Test-only external-call stub: BX LR; the hook counts calls.
            uc.mem_write(0x08020000,bytes.fromhex('1eff2fe1'))
            uc.mem_map(0x03000000,0x8000)
            calls = []
            def hit(machine,address,size,user_data):
                calls.append(address)
            uc.hook_add(UC_HOOK_CODE,hit,begin=0x08020000,end=0x08020000)
            for function,operation in operations.items():
                for value in [-2147483648,-129,-2,-1,0,1,2,30,31,32,33,127,254,255,256,1023,1024,0x3ffffffe,0x3fffffff,0x40000000,2147483647]:
                    for nzcv in range(16):
                        calls.clear()
                        uc.reg_write(regs.UC_ARM_REG_CPSR,0x13 | (nzcv<<28))
                        uc.reg_write(regs.UC_ARM_REG_R0,value & 0xFFFFFFFF)
                        for reg in range(4,12):uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                        uc.reg_write(regs.UC_ARM_REG_SP,0x03007000)
                        uc.reg_write(regs.UC_ARM_REG_LR,0x08030000)
                        uc.emu_start(symbols[function],0x08030000,count=1000)
                        assert uc.reg_read(regs.UC_ARM_REG_PC)==0x08030000
                        assert uc.reg_read(regs.UC_ARM_REG_SP)==0x03007000
                        mask,relation=operation
                        result=(value & 0xffffffff)^mask
                        signed=result if result<0x80000000 else result-0x100000000
                        taken={'eq':result==0,'ne':result!=0,'lt':signed<0,'ge':signed>=0}[relation]
                        assert len(calls)==int(taken),(name,function,value,nzcv,calls)
                        assert uc.reg_read(regs.UC_ARM_REG_R0)==result
                        for reg in range(4,12):assert uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                        checks += 1
        # Thumb code is outside the pass's scope and must not change.
        thumb = []
        for plugin in ([],['-fplugin='+str(args.plugin.resolve())]):
            subprocess.run(['arm-none-eabi-gcc','-S','-O1','-mthumb','-mcpu=arm7tdmi',*plugin,
                            str(root/'probe.c'),'-o',str(root/'thumb.s')],check=True)
            thumb.append((root/'thumb.s').read_bytes())
        assert thumb[0]==thumb[1]
    print(str(checks)+' baseline/plugin ARM executions pass, including all incoming NZCV combinations.')
    print('XOR results, EQ/NE paths and callee-saved registers pass; signed tests, non-identity barriers and Thumb output are unchanged.')


if __name__ == '__main__':
    main()
