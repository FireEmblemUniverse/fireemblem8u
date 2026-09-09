#!/usr/bin/env python3
"""Check plugin branch selection and execute signed-boundary cases under ARM."""
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
    parser.add_argument("--zero-encodings", action="store_true")
    args = parser.parse_args()
    optional = ["-fplugin-arg-zero_test-zero-self-sub", "-fplugin-arg-zero_test-sign-zero-tests"] if args.zero_encodings else []
    operations = {'eq':lambda x:x==0,'ne':lambda x:x!=0,'lt':lambda x:x<0,
                  'le':lambda x:x<=0,'gt':lambda x:x>0,'ge':lambda x:x>=0,
                  'mixed':lambda x:x<=0}
    source = 'extern void hit(void);\n'
    for name,op in zip(list(operations)[:6],['==','!=','<','<=','>','>=']):
        source += 'void %s(int x) { if (x %s 0) hit(); }\n' % (name,op)
    source += 'void mixed(int x) { if (x == 0) hit(); if (x < 0) hit(); }\n'
    for bound in [0,1,30,31,255,1023,0x3fffffff,0x7fffffff,0xffffffff]:
        for relation in ['le','gt']:
            name = 'u_'+relation+'_'+str(bound)
            operator = '<=' if relation == 'le' else '>'
            operations[name] = (lambda x,b=bound: (x & 0xffffffff)<=b) if relation=='le' else (lambda x,b=bound: (x & 0xffffffff)>b)
            source += 'void %s(unsigned x) { if (x %s %su) hit(); }\n' % (name,operator,bound)
    for relation in ['le','gt']:
        name = 's_'+relation+'_31'
        operator = '<=' if relation=='le' else '>'
        operations[name] = (lambda x:x<=31) if relation=='le' else (lambda x:x>31)
        source += 'void %s(int x) { if (x %s 31) hit(); }\n' % (name,operator)

    operations['pair'] = lambda x: x > 0
    source += 'void pair(int x) { asm("" ::: "r4"); if (x == 0) goto end; asm("" : : "r"(x)); if (x < 0) goto end; hit(); end: asm(""); }\n'

    operations['pair_memory'] = lambda x: x > 0
    source += 'void pair_memory(int x) { asm("" ::: "r4"); if (x == 0) goto end; asm("" : : "r"(x) : "memory"); if (x < 0) goto end; hit(); end: asm(""); }\n'

    for suffix, clobber in [('cc', 'cc'), ('register', 'r5')]:
        operations['pair_'+suffix] = lambda x: x > 0
        source += 'void pair_%s(int x) { asm("" ::: "r4"); if (x == 0) goto end; asm("" : : "r"(x) : "%s"); if (x < 0) goto end; hit(); end: asm(""); }\n' % (suffix, clobber)

    with tempfile.TemporaryDirectory(prefix='arm-tst-plugin-check-') as temporary:
        root = Path(temporary)
        (root/'probe.c').write_text(source)
        (root/'link.ld').write_text('SECTIONS { . = 0x08010000; .text : { *(.text) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\nhit = 0x08020000;\n')
        checks = 0
        baseline_text = None
        for name,plugin in [('baseline',[]),('plugin',['-fplugin='+str(args.plugin.resolve())]+optional)]:
            assembly = root/(name+'.s')
            obj = root/(name+'.o')
            elf = root/(name+'.elf')
            binary = root/(name+'.bin')
            subprocess.run(['arm-none-eabi-gcc','-S','-O1','-marm','-mcpu=arm7tdmi',
                            '-fno-if-conversion','-fno-if-conversion2',*plugin,str(root/'probe.c'),'-o',str(assembly)],check=True)
            text = assembly.read_text()
            if not plugin:
                baseline_text = text
            if plugin:
                for function in list(operations)[:6]:
                    body = text.split('\n'+function+':',1)[1].split('\t.size',1)[0]
                    assert bool(re.search(r'\btst\s',body)) == (function in (('eq','ne','lt','ge') if args.zero_encodings else ('eq','ne'))), function
                for function in ['pair', 'pair_memory']:
                    pair = text.split('\n'+function+':',1)[1].split('\t.size',1)[0]
                    assert re.search(r'\btst\s', pair) and re.search(r'\b(?:bmi|blpl)\s', pair), pair
                for function in ['u_le_31','u_gt_31']:
                    body = text.split('\n'+function+':',1)[1].split('\t.size',1)[0]
                    assert re.search(r'\bcmp\s+[^\n]*#32\b',body), function
                for function in ['u_le_30','u_gt_30','u_le_2147483647','u_gt_2147483647','u_le_4294967295','u_gt_4294967295','s_le_31','s_gt_31']:
                    body = text.split('\n'+function+':',1)[1].split('\t.size',1)[0]
                    old = baseline_text.split('\n'+function+':',1)[1].split('\t.size',1)[0]
                    if args.zero_encodings and function in ['u_le_2147483647','u_gt_2147483647']:
                        assert re.search(r'\btst\s',body), function
                    else:
                        assert body == old, ('unsupported boundary changed',function)

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
                        uc.reg_write(regs.UC_ARM_REG_SP,0x03007000)
                        uc.reg_write(regs.UC_ARM_REG_LR,0x08030000)
                        uc.emu_start(symbols[function],0x08030000,count=1000)
                        assert uc.reg_read(regs.UC_ARM_REG_PC)==0x08030000
                        assert uc.reg_read(regs.UC_ARM_REG_SP)==0x03007000
                        assert len(calls)==int(operation(value)),(name,function,value,nzcv,len(calls))
                        checks += 1
        # Thumb code is outside the pass's scope and must not change.
        thumb = []
        for plugin in ([],['-fplugin='+str(args.plugin.resolve())]):
            subprocess.run(['arm-none-eabi-gcc','-S','-O1','-mthumb','-mcpu=arm7tdmi',*plugin,
                            str(root/'probe.c'),'-o',str(root/'thumb.s')],check=True)
            thumb.append((root/'thumb.s').read_bytes())
        assert thumb[0]==thumb[1]
    print(str(checks)+' baseline/plugin ARM executions pass, including all incoming NZCV combinations.')
    print('Zero tests, paired zero/sign branches, and unsigned power-of-two boundaries pass; excluded boundaries and Thumb output are unchanged.')


if __name__ == '__main__':
    main()
