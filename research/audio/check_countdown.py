#!/usr/bin/env python3
"""Exercise guarded countdown compilation and reject unsupported loop shapes."""
import argparse
from pathlib import Path
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler',required=True)
    p.add_argument('--plugin',type=Path,required=True)
    args=p.parse_args()
    flags=['-S','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-fno-reorder-blocks','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
    plugin=['-fplugin='+str(args.plugin.resolve()),'-Werror=attributes']
    decl='register volatile int counter asm("r1"); register unsigned *output asm("r0");\n'
    attr='__attribute__((matching_countdown)) '
    cases=0
    with tempfile.TemporaryDirectory() as temp:
        root=Path(temp)
        command=[args.compiler,*flags,str(root/'probe.c'),'-o',str(root/'probe.s')]
        bodies=[
            ('counter=0; do { *output++=counter; counter--; } while(counter>0);','zero start'),
            ('counter=256; do { *output++=counter; counter--; } while(counter>0);','large start'),
            ('counter=*output; do { *output++=counter; counter--; } while(counter>0);','dynamic start'),
            ('counter=36; do { *output++=counter; counter-=2; } while(counter>0);','wrong decrement'),
            ('counter=36; do { *output++=counter; counter++; counter--; } while(counter>0);','extra write'),
            ('counter=36; do { if (*output) *output=1; counter--; } while(counter>0);','inner branch'),
            ('counter=36; do { helper(); counter--; } while(counter>0);','undeclared preservation'),
            ('counter=36; do { asm volatile("nop"); counter--; } while(counter>0);','assembly'),
        ]
        for body,label in bodies:
            (root/'probe.c').write_text(decl+'extern void helper(void);\n'+attr+'void probe(void) { '+body+' }')
            result=subprocess.run(command+plugin,text=True,capture_output=True)
            assert result.returncode and 'internal compiler error' not in result.stderr,(label,result.stderr)
        plain=decl+'void probe(void) { counter=36; do { *output++=counter; counter--; } while(counter>0); }'
        (root/'probe.c').write_text(plain)
        subprocess.run(command,check=True,capture_output=True);normal=(root/'probe.s').read_text()
        subprocess.run(command+plugin,check=True,capture_output=True)
        assert (root/'probe.s').read_text()==normal
        for start in (1,2,36,127,255):
            machines=[]
            for folded in (False,True):
                (root/'probe.c').write_text(decl+(attr if folded else '')+f'void probe(void) {{ counter={start}; do {{ *output++=counter; counter--; }} while(counter>0); }}')
                subprocess.run(command+(plugin if folded else []),check=True,capture_output=True)
                asm=(root/'probe.s').read_text()
                if folded:
                    assert '\tcmp\t' not in asm and '\tbgt\t' in asm,asm
                subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(root/'probe.s'),'-o',str(root/'probe.o')],check=True)
                subprocess.run(['arm-none-eabi-ld','-Ttext=0x08010000',str(root/'probe.o'),'-o',str(root/'probe.elf')],check=True,capture_output=True)
                subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(root/'probe.elf'),str(root/'probe.bin')],check=True)
                uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
                for address,size in ((0x08010000,0x2000),(0x02000000,0x2000),(0x03000000,0x8000)):
                    uc.mem_map(address,size)
                uc.mem_write(0x08010000,(root/'probe.bin').read_bytes());machines.append(uc)
            for nzcv in range(16):
                for thumb_return in (False,True):
                    states=[]
                    for uc in machines:
                        uc.mem_write(0x02000000,bytes([0xa5])*1028)
                        uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nzcv<<28)
                        for n in range(13):
                            uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),0x12340000+n)
                        uc.reg_write(r.UC_ARM_REG_R0,0x02000000)
                        uc.reg_write(r.UC_ARM_REG_SP,0x03007000)
                        uc.reg_write(r.UC_ARM_REG_LR,0x08011000|thumb_return)
                        uc.emu_start(0x08010001,0x08011000,count=3000)
                        assert uc.reg_read(r.UC_ARM_REG_PC)==0x08011000
                        assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                        assert bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32)==thumb_return
                        memory=bytes(uc.mem_read(0x02000000,1028))
                        expected=b''.join(n.to_bytes(4,'little') for n in range(start,0,-1))+bytes([0xa5])*(1028-start*4)
                        assert memory==expected
                        states.append(([uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)],uc.reg_read(r.UC_ARM_REG_CPSR)))
                    assert states[0]==states[1]
                    cases+=2
    print(f'{cases} original/folded countdown executions pass; {len(bodies)} unsupported loops rejected; unannotated assembly unchanged.')


if __name__=='__main__':
    main()
