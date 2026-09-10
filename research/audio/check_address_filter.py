#!/usr/bin/env python3
"""Research oracle for the shared private audio address filter."""
import argparse
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/address-filter-match'
ENTRY,POOL,RETURN=0x080cf972,0x080cf988,0x080e0000

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler',required=True)
    p.add_argument('--shared-plugin',type=Path)
    p.add_argument('--stack-plugin',type=Path)
    p.add_argument('--plugin',type=Path)
    p.add_argument('--require-match',action='store_true')
    a=p.parse_args();OUT.mkdir(exist_ok=True)
    flags=['-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-builtin','-fno-strict-aliasing','-fno-schedule-insns','-fno-schedule-insns2','-fno-if-conversion','-fno-if-conversion2','-fno-reorder-blocks']
    if a.shared_plugin: flags += ['-fplugin='+str(a.shared_plugin.resolve()),'-fplugin-arg-thumb_shared_literal-symbol-literal=gMPlayJumpTableTemplate,lt_MPlayJumpTableTemplate','-fplugin-arg-thumb_shared_literal-omit-pool-alignment']
    if a.stack_plugin: flags += ['-fplugin='+str(a.stack_plugin.resolve())]
    if a.plugin: flags += ['-fplugin='+str(a.plugin.resolve())]
    subprocess.run([a.compiler,*flags,'-I'+str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/address_filter.c'),'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    subprocess.run(['arm-none-eabi-ld','-Ttext='+hex(ENTRY),'--defsym=gMPlayJumpTableTemplate=0x08207190','--defsym=lt_MPlayJumpTableTemplate='+hex(POOL),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True,capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    rom=(ROOT/'baserom.gba').read_bytes();candidate=(OUT/'candidate.bin').read_bytes()
    original=rom[ENTRY-0x08000000:(POOL if a.shared_plugin else POOL+4)-0x08000000]
    if not a.shared_plugin: assert candidate[-4:]==struct.pack('<I',0x08207190)
    symbols=subprocess.check_output(['arm-none-eabi-nm',str(OUT/'candidate.elf')],text=True)
    candidate_entry=int(next(line.split()[0] for line in symbols.splitlines() if line.endswith(' chk_adr_r2')),16)
    if a.shared_plugin:
        assert candidate_entry==ENTRY
        assert POOL%4==0 and POOL>=ENTRY+len(candidate) and POOL+4<=ENTRY+1024
    machines=[]
    for code,entry in ((original,ENTRY),(candidate,candidate_entry)):
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
        uc.mem_map(0x08000000,0x1000000);uc.mem_map(0x03000000,0x8000)
        uc.mem_write(0x08000000,rom);uc.mem_write(ENTRY,code);machines.append((uc,entry))
    rng=random.Random(82)
    addresses=sorted(set([0,1,0x3fff,0x4000,0x3ffff,0x40000,0x1ffffff,0x2000000,0x2000001,0x820718f,0x8207190,0xffffffff]+[rng.getrandbits(32) for _ in range(128)]+[rng.randrange(0x2000000) for _ in range(128)]))
    count=flag_differences=0
    # Synthetic pool values exercise the historically intended BIOS exception too.
    for template in (0x08207190,0,0x100,0x3fff,0x4000,0x2000000):
        for (uc,_),at in zip(machines,(POOL,POOL if a.shared_plugin else ENTRY+len(candidate)-4)): uc.mem_write(at,struct.pack('<I',template))
        for address in sorted(set(addresses+[template,max(0,template-1),template+1])):
            for value in (0,1,0x80,0xffffffff):
                for nzcv in range(16):
                    for thumb in (False,True):
                        states=[]
                        expected=value if address>>25 or (address>=template and address>>14==0) else 0
                        for uc,entry in machines:
                            uc.mem_write(0x03006ff8,bytes([0xa5])*16)
                            uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nzcv<<28)
                            for n in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),0x12340000+n)
                            uc.reg_write(r.UC_ARM_REG_R2,address);uc.reg_write(r.UC_ARM_REG_R3,value)
                            uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,RETURN|thumb)
                            uc.emu_start(entry|1,RETURN,count=40)
                            regs=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]
                            assert regs==[0x12340000,0x12340001,address,expected]+[0x12340000+n for n in range(4,13)]
                            assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000 and uc.reg_read(r.UC_ARM_REG_PC)==RETURN
                            assert bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32)==thumb
                            assert bytes(uc.mem_read(0x03006ff8,16))==bytes([0xa5])*4+struct.pack('<I',0x12340000)+bytes([0xa5])*8
                            states.append(uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000)
                        flag_differences+=states[0]!=states[1];count+=1
    report=dict(cases=count,candidate_entry=hex(candidate_entry),original_bytes=len(original),candidate_bytes=len(candidate),complete_match=candidate==original,flag_difference_cases=flag_differences,scope='boundary and seeded addresses, six pool values, four incoming words, all NZCV, both return modes, r0-r12 and stack preservation')
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
    if a.require_match:assert candidate==original and not flag_differences

if __name__=='__main__':main()
