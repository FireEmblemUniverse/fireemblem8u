#!/usr/bin/env python3
"""Compare sign/carry bit-test branch decisions with live unsigned inputs."""
from pathlib import Path
import argparse,subprocess,tempfile,re
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--compiler',required=True);parser.add_argument('--plugin',type=Path,required=True);args=parser.parse_args()
    specs={};source='__attribute__((noinline)) void barrier(void) { asm volatile("" ::: "memory"); }\n'
    for bit in (0,1,7,15,25,31):
        for invert in (False,True):
            name=f'bit_{bit}_{int(invert)}';specs[name]=(bit,invert,0)
            source+=f'void {name}(unsigned value, volatile unsigned *out) {{ if ((value & {1<<bit}U) {"==" if invert else "!="} 0) *out=11; else *out=22; }}\n'
    # Exercise far branches in non-leaf functions, where the return address
    # is saved before the late branch rewrite. GCC rejects leaf far probes.
    for stores in (160,1200):
        for invert in (False,True):
            name=f'range_{stores}_{int(invert)}';specs[name]=(25,invert,stores)
            padding='*out=3;'*stores
            source+=f'void {name}(unsigned value, volatile unsigned *out) {{ barrier(); if ((value & (1U<<25)) {"==" if invert else "!="} 0) {{ {padding} *out=11; }} else *out=22; }}\n'
    cases=0
    with tempfile.TemporaryDirectory(prefix='thumb-carry-') as temp:
        root=Path(temp);(root/'probe.c').write_text(source)
        for enabled in (False,True):
            flags=['-fplugin='+str(args.plugin.resolve()),'-fplugin-arg-thumb_shared_literal-carry-tests'] if enabled else []
            subprocess.run([args.compiler,'-S','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-fno-if-conversion','-fno-if-conversion2','-fno-reorder-blocks',*flags,str(root/'probe.c'),'-o',str(root/'probe.s')],check=True)
            assembly=(root/'probe.s').read_text()
            if enabled:
                assert re.search(r'\bb(?:cc|cs)\s',assembly),assembly
                for stores in (160,1200):
                    for invert in (False,True):
                        name=f'range_{stores}_{int(invert)}'
                        body=assembly.split(name+':',1)[1].split('\t.size',1)[0]
                        opcode='b' if stores==160 else 'bl'
                        assert re.search(r'\bb(?:cc|cs)\s+\.LCB',body),(name,body)
                        assert re.search(r'\n\t'+opcode+r'\s+\.L',body),(name,body)
            subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(root/'probe.s'),'-o',str(root/'probe.o')],check=True)
            subprocess.run(['arm-none-eabi-ld','-Ttext=0x08010000',str(root/'probe.o'),'-o',str(root/'probe.elf')],check=True,capture_output=True)
            subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(root/'probe.elf'),str(root/'probe.bin')],check=True)
            symbols={parts[2]:int(parts[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(root/'probe.elf')],text=True).splitlines() if len(parts:=line.split())==3}
            uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08010000,0x20000);uc.mem_map(0x02000000,0x1000);uc.mem_map(0x03000000,0x8000);uc.mem_write(0x08010000,(root/'probe.bin').read_bytes())
            for name,(bit,invert,stores) in specs.items():
                mask=1<<bit
                for value in (0,0xffffffff,mask,mask^0xffffffff,(mask-1)&0xffffffff,(mask+1)&0xffffffff,0x55555555,0xaaaaaaaa):
                    taken=bool(value&mask)!=invert
                    for nzcv in range(16):
                        uc.mem_write(0x02000000,bytes(4));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nzcv<<28)
                        for reg in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                        uc.reg_write(r.UC_ARM_REG_R0,value);uc.reg_write(r.UC_ARM_REG_R1,0x02000000);uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x0802f001)
                        uc.emu_start(symbols[name]|1,0x0802f000,count=10000)
                        assert uc.reg_read(r.UC_ARM_REG_PC)==0x0802f000
                        assert int.from_bytes(uc.mem_read(0x02000000,4),'little')==(11 if taken else 22),(enabled,bit,invert,value)
                        assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                        for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                        cases+=1
    print(f'{cases} baseline/carry bit-test executions pass across six bit positions, both senses, short/long/far distances and all NZCV inputs.')
if __name__=='__main__':main()
