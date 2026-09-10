#!/usr/bin/env python3
"""Build and compare TrackStop's C candidate with the original audio routine."""
from pathlib import Path
import json
import argparse
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/track-stop-match'
ENTRY=0x080cfdd0
TRACK=0x02000000
INFO=0x02001000
CALLBACK=0x080d8000
RETURN=0x080d9000


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler",type=Path,default=ROOT/"tools/agbcc-tst/agbcc")
    args=parser.parse_args()
    OUT.mkdir(exist_ok=True)
    source=ROOT/'research/audio/track_stop.c'
    pre=subprocess.check_output(['arm-none-eabi-cpp','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-iquote',str(ROOT),'-nostdinc','-undef',str(source)])
    (OUT/'candidate.i').write_bytes(pre)
    subprocess.run([str(args.compiler.resolve()),'-mthumb-interwork','-Wimplicit','-Wparentheses','-Werror','-O2','-fhex-asm','-ffix-debug-line',str(OUT/'candidate.i'),'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi','-mthumb-interwork',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    (OUT/'link.ld').write_text(f'SECTIONS {{ . = {ENTRY:#x}; .text : {{ *(.text) }} }}\n')
    (OUT/'bridge.s').write_text('.syntax unified\n.thumb\n.global call_r3\n.type call_r3, %function\n.thumb_set call_r3, 0x080cfdc1\n')
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'bridge.s'),'-o',str(OUT/'bridge.o')],check=True)
    subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'link.ld'),str(OUT/'candidate.o'),str(OUT/'bridge.o'),'-o',str(OUT/'candidate.elf')],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    rom=(ROOT/'baserom.gba').read_bytes()
    candidate=(OUT/'candidate.bin').read_bytes()
    original=rom[ENTRY-0x08000000:ENTRY-0x08000000+68]
    differences=[i for i in range(0,min(len(original),len(candidate)),2) if original[i:i+2]!=candidate[i:i+2]]
    count=0
    lists=[[],[(0,0)],[(1,0)],[(0x80,1)],[(0x40,7)],[(1,8)],[(0,2),(1,9),(0xff,7),(1,0)],[(1,3),(1,4),(1,5)]]
    for track_flags in (0,1,0x7f,0x80,0x81,0xff):
        for layout in lists:
            for flags in range(16):
                state=bytearray([0xa5]*0x2000)
                state[0]=track_flags
                struct.pack_into('<I',state,0x20,TRACK+0x100 if layout else 0)
                expected_calls=[]
                expected=state.copy()
                for index,(status,kind) in enumerate(layout):
                    offset=0x100+index*0x40
                    state[offset]=status;state[offset+1]=kind
                    struct.pack_into('<I',state,offset+0x2c,TRACK)
                    struct.pack_into('<I',state,offset+0x34,TRACK+offset+0x40 if index+1<len(layout) else 0)
                struct.pack_into('<I',state,0x102c,CALLBACK|1)
                expected=state.copy()
                if track_flags&0x80:
                    struct.pack_into('<I',expected,0x20,0)
                    for index,(status,kind) in enumerate(layout):
                        offset=0x100+index*0x40
                        if status and kind&7:expected_calls.append((kind&7,TRACK+offset,status,TRACK))
                        if status:expected[offset]=0
                        struct.pack_into('<I',expected,offset+0x2c,0)
                results=[]
                for code in (original,candidate):
                    uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
                    uc.mem_map(0x080c0000,0x20000);uc.mem_map(TRACK,0x2000);uc.mem_map(0x03000000,0x8000)
                    uc.mem_write(0x080c0000,rom[0xc0000:0xe0000]);uc.mem_write(ENTRY,code)
                    uc.mem_write(CALLBACK,bytes.fromhex('7047'));uc.mem_write(TRACK,bytes(state))
                    uc.mem_write(0x03007ff0,struct.pack('<I',INFO))
                    calls=[]
                    def callback(machine,address,size,data):
                        ch=machine.reg_read(r.UC_ARM_REG_R4)
                        calls.append((machine.reg_read(r.UC_ARM_REG_R0),ch,machine.mem_read(ch,1)[0],struct.unpack('<I',machine.mem_read(ch+0x2c,4))[0]))
                        for reg in range(4):machine.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0xdead0000+reg)
                        machine.reg_write(r.UC_ARM_REG_CPSR,(machine.reg_read(r.UC_ARM_REG_CPSR)&0x0fffffff)|0xa0000000)
                    uc.hook_add(UC_HOOK_CODE,callback,begin=CALLBACK,end=CALLBACK)
                    uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                    for reg in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                    uc.reg_write(r.UC_ARM_REG_R1,TRACK);uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,RETURN|1)
                    try: uc.emu_start(ENTRY|1,RETURN,count=1000)
                    except Exception:
                        print("failure",track_flags,layout,flags,code==candidate,hex(uc.reg_read(r.UC_ARM_REG_PC)),hex(uc.reg_read(r.UC_ARM_REG_CPSR)))
                        raise
                    assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN
                    assert calls==expected_calls,(layout,calls,expected_calls)
                    assert bytes(uc.mem_read(TRACK,0x2000))==expected
                    for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                    assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                    results.append((calls,bytes(uc.mem_read(TRACK,0x2000)),uc.reg_read(r.UC_ARM_REG_CPSR)))
                assert results[0]==results[1]
                count+=1
    report={'cases':count,'section_bytes':len(candidate),'original_section_bytes':len(original),'differing_halfword_offsets':differences,'complete_section_match':candidate==original}
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report))


if __name__=='__main__':main()
