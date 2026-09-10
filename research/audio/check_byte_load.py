#!/usr/bin/env python3
"""Check the C byte-load entry and its adjacent private filter continuation."""
import argparse
import json
from pathlib import Path
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/audio-byte-load-match'
ENTRY,FILTER,RETURN=0x080cf970,0x080cf972,0x080e0000

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--plugin',type=Path,required=True);p.add_argument('--production',action='store_true');a=p.parse_args();OUT.mkdir(exist_ok=True)
    flags=['-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fplugin='+str(a.plugin.resolve()),'-fplugin-arg-tail_transfer-destination=chk_adr_r2','-fplugin-arg-tail_transfer-adjacent-destination=chk_adr_r2']
    subprocess.run([a.compiler,*flags,'-I'+str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'src/m4a_byte_load.c'),'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    (OUT/'link.ld').write_text('SECTIONS { . = 0x080cf970; .text : { *(.text) } }\nchk_adr_r2 = 0x080cf972;\nASSERT(ADDR(.text)+SIZEOF(.text)==chk_adr_r2,"filter must immediately follow byte load")\n')
    subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'link.ld'),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True,capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    rom=(ROOT/'baserom.gba').read_bytes();candidate=(OUT/'candidate.bin').read_bytes();original=rom[ENTRY-0x08000000:FILTER-0x08000000];assert candidate==original
    if a.production: assert candidate==(ROOT/'fireemblem8.gba').read_bytes()[ENTRY-0x08000000:FILTER-0x08000000]
    machines=[]
    for code in (original,candidate):
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
        for base,size in ((0,0x1000),(0x01000000,0x1000),(0x02000000,0x1000),(0x03000000,0x8000),(0x08000000,0x1000000)):uc.mem_map(base,size)
        uc.mem_write(0x08000000,(ROOT/'fireemblem8.gba').read_bytes() if a.production and machines else rom);uc.mem_write(ENTRY,code)
        trace=[]
        def hook(uc,address,size,trace):
            if address==FILTER:trace.append((uc.reg_read(r.UC_ARM_REG_SP),uc.reg_read(r.UC_ARM_REG_LR),uc.reg_read(r.UC_ARM_REG_R3),uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
        uc.hook_add(UC_HOOK_CODE,hook,trace,begin=FILTER,end=FILTER)
        machines.append((uc,trace))
    cases=0
    for address in (0x100,0x01000100,0x02000100,0x02000101,0x02000102,0x03000100):
        for byte in range(256):
            for flags in range(16):
                for thumb_return in (False,True):
                    states=[]
                    for uc,trace in machines:
                        trace.clear();uc.mem_write(address,bytes([byte]));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                        for n in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),0x12340000+n)
                        uc.reg_write(r.UC_ARM_REG_R2,address);uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,RETURN|thumb_return)
                        uc.emu_start(ENTRY|1,RETURN,count=30)
                        regs=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]
                        assert regs==[0x12340000,0x12340001,address,byte if address>=0x02000000 else 0]+[0x12340000+n for n in range(4,13)]
                        assert trace==[(0x03007000,RETURN|thumb_return,byte,flags<<28)]
                        assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN and uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                        assert bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32)==thumb_return
                        states.append((regs,uc.reg_read(r.UC_ARM_REG_CPSR)))
                    assert states[0]==states[1];cases+=1
    report=dict(cases=cases,production=a.production,bytes=2,complete_match=True,scope='all bytes/NZCV, low rejected addresses, EWRAM/IWRAM, both return modes, r0-r12 and filter-entry SP/LR/raw byte')
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
if __name__=='__main__':main()
