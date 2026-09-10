#!/usr/bin/env python3
"""Probe the explicit Thumb leaf contract, boundary rewrite and TST ordering."""
import argparse
from pathlib import Path
import subprocess,tempfile
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--compiler',required=True);parser.add_argument('--plugin',type=Path,required=True);args=parser.parse_args()
    source='#ifdef MATCH\n#define CONTRACT __attribute__((matching_leaf_frame))\n#else\n#define CONTRACT\n#endif\n'
    tests={'bound':'x < 128','signed_test':'(int)x < 0','test':'(x & y) == 0','large':'x > 0x7fffffffU'}
    for name,test in tests.items():
        source+=f'CONTRACT unsigned {name}(unsigned a,unsigned b) {{ register unsigned x asm("r4")=a; register unsigned y asm("r5")=b; asm("" : "+r"(x), "+r"(y)); if ({test}) y+=x; else y-=x; asm("" : "+r"(y)); return y; }}\n'
    total=0
    with tempfile.TemporaryDirectory(prefix='thumb-leaf-') as temp:
        root=Path(temp);(root/'probe.c').write_text(source)
        flags=['-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-fomit-frame-pointer','-fno-if-conversion','-fno-if-conversion2','-fno-reorder-blocks']
        plugin=['-fplugin='+str(args.plugin.resolve()),'-Werror=attributes']
        assemblies=[]
        for mode in ('baseline','ignored','matching'):
            extra=[] if mode=='baseline' else plugin+(['-DMATCH'] if mode=='matching' else [])
            subprocess.run([args.compiler,*flags,*extra,str(root/'probe.c'),'-o',str(root/'probe.s')],check=True)
            assembly=(root/'probe.s').read_text();assemblies.append(assembly)
            if mode=='ignored':assert assemblies[0]==assembly;continue
            for name in tests:
                body=assembly.split(name+':',1)[1].split('.size',1)[0]
                assert ('push\t{r4, r5}' in body)==(mode=='matching'),body
                if mode=='matching':assert 'bx\tlr' in body and 'push\t{r4, r5, lr}' not in body
            subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(root/'probe.s'),'-o',str(root/'probe.o')],check=True)
            subprocess.run(['arm-none-eabi-ld','-Ttext=0x08010000',str(root/'probe.o'),'-o',str(root/'probe.elf')],check=True,capture_output=True)
            subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(root/'probe.elf'),str(root/'probe.bin')],check=True)
            symbols={parts[2]:int(parts[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(root/'probe.elf')],text=True).splitlines() if len(parts:=line.split())==3}
            uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08010000,0x2000);uc.mem_map(0x03000000,0x8000);uc.mem_write(0x08010000,(root/'probe.bin').read_bytes())
            for name in tests:
                for a in (0,1,126,127,128,129,0x7fffffff,0x80000000,0xffffffff):
                    for b in (0,1,0x83,0x80000000,0xffffffff):
                        take={'bound':a<128,'signed_test':a>=0x80000000,'test':a&b==0,'large':a>0x7fffffff}[name]
                        expected=(b+a if take else b-a)&0xffffffff
                        for nzcv in range(16):
                            uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nzcv<<28)
                            for reg in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                            uc.reg_write(r.UC_ARM_REG_R0,a);uc.reg_write(r.UC_ARM_REG_R1,b);uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x08011001)
                            uc.emu_start(symbols[name]|1,0x08011000,count=100)
                            assert uc.reg_read(r.UC_ARM_REG_PC)==0x08011000
                            assert uc.reg_read(r.UC_ARM_REG_R0)==expected,(mode,name,a,b)
                            assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                            for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                            total+=1
        invalid=[('extern void hit(void); __attribute__((matching_leaf_frame)) void bad(void) { hit(); }',[],'simple Thumb leaf'),
                 ('__attribute__((matching_leaf_frame)) unsigned bad(unsigned x) { register unsigned high asm("r8")=x; asm("" : "+r"(high)); return high; }',[],'simple Thumb leaf'),
                 (source,['-DMATCH','-marm'],'Thumb-1 mode'),
                 (source,['-DMATCH','-fno-omit-frame-pointer'],'simple Thumb leaf'),
                 ('__attribute__((matching_leaf_frame)) unsigned bad;',[],'function')]
        for text,extra,diagnostic in invalid:
            (root/'bad.c').write_text(text)
            result=subprocess.run([args.compiler,*flags,*plugin,*extra,str(root/'bad.c'),'-o',str(root/'bad.s')],capture_output=True,text=True)
            assert result.returncode and diagnostic in result.stderr,result.stderr
    print(f'{total} baseline/matching executions pass; unannotated assembly unchanged; five invalid contracts rejected.')
if __name__=='__main__':main()
