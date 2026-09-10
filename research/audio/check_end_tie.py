#!/usr/bin/env python3
"""Check the tied-note release C candidate against original code and a list model."""
from pathlib import Path
import struct,subprocess,json
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/end-tie-match'
ENTRY=0x080d0044
RAM=0x02000000

def main():
    OUT.mkdir(exist_ok=True)
    flags=['-O1','-std=gnu89','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-builtin','-fno-strict-aliasing','-fomit-frame-pointer','-fno-schedule-insns','-fno-schedule-insns2','-fno-if-conversion','-fno-if-conversion2','-fno-reorder-blocks']
    subprocess.run(['arm-none-eabi-gcc','-S',*flags,'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/end_tie.c'),'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.o'),str(OUT/'candidate.bin')],check=True)
    candidate=(OUT/'candidate.bin').read_bytes();original=(ROOT/'baserom.gba').read_bytes()[0xd0044:0xd0084]
    count=0
    for command in (0,1,60,127,128,255):
        key=command if command<128 else 60
        layouts=[[],[(0,key)],[(0x80,key)],[(0x40,key)],[(1,key+1),(2,key),(0x80,key)],[(0x41,key),(4,key),(0x83,key)],[(0x80,key+1),(0,key)],[(0x80,key),(0x80,key)]]
        for layout in layouts:
            for nzcv in range(16):
                initial=bytearray([0xa5]*0x1000);initial[5]=60;initial[0x800]=command
                struct.pack_into('<I',initial,0x40,RAM+0x800);struct.pack_into('<I',initial,0x20,RAM+0x100 if layout else 0)
                for i,(status,note) in enumerate(layout):
                    offset=0x100+i*0x40;initial[offset]=status;initial[offset+0x11]=note
                    struct.pack_into('<I',initial,offset+0x34,RAM+offset+0x40 if i+1<len(layout) else 0)
                expected=initial.copy()
                if command<128:expected[5]=command;struct.pack_into('<I',expected,0x40,RAM+0x801)
                for i,(status,note) in enumerate(layout):
                    if status&0x83 and not status&0x40 and note==key:
                        expected[0x100+i*0x40]=status|0x40;break
                results=[]
                for code in (original,candidate):
                    uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x080d0000,0x2000);uc.mem_map(RAM,0x1000);uc.mem_map(0x03000000,0x8000)
                    uc.mem_write(ENTRY,code);uc.mem_write(RAM,bytes(initial));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nzcv<<28)
                    for reg in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                    uc.reg_write(r.UC_ARM_REG_R1,RAM);uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x080d1001)
                    uc.emu_start(ENTRY|1,0x080d1000,count=300)
                    assert uc.reg_read(r.UC_ARM_REG_PC)==0x080d1000
                    assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                    for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                    memory=bytes(uc.mem_read(RAM,0x1000));assert memory==expected,(command,layout)
                    results.append((memory,uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
                assert results[0]==results[1]
                count+=1
    report={'cases':count,'candidate_bytes':len(candidate),'original_bytes':len(original),'differing_halfword_offsets':[i for i in range(0,min(len(candidate),len(original)),2) if candidate[i:i+2]!=original[i:i+2]],'complete_match':candidate==original}
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
if __name__=='__main__':main()
