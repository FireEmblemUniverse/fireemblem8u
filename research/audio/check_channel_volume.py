#!/usr/bin/env python3
"""Compare stereo-volume arithmetic and its private ABI in original/production ROMs."""
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY=0x080cfe14
CHANNEL=0x02000000
TRACK=0x02000100
RETURN=0x080d1000

def main():
    machines=[]
    for name in ('baserom.gba','fireemblem8.gba'):
        code=(ROOT/name).read_bytes()[0xcfe14:0xcfe44]
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x080cf000,0x1000);uc.mem_map(RETURN,0x1000);uc.mem_map(CHANNEL,0x1000);uc.mem_map(0x03000000,0x8000)
        uc.mem_write(ENTRY,code);machines.append(uc)
    count=0
    for pan in (-128,-127,-64,-1,0,1,63,126,127):
        for velocity in (0,1,64,127,128,254,255):
            for right,left in ((0,0),(127,255),(255,127),(255,255)):
                initial=bytearray([0xa5]*0x200);initial[0x12]=velocity;initial[0x14]=pan&255;initial[0x110]=right;initial[0x111]=left
                expected=initial.copy();expected[2]=min(255,((128+pan)*velocity*right)>>14);expected[3]=min(255,((127-pan)*velocity*left)>>14)
                for flags in range(16):
                    results=[]
                    for uc in machines:
                        uc.mem_write(CHANNEL,bytes(initial));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                        for reg in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                        uc.reg_write(r.UC_ARM_REG_R4,CHANNEL);uc.reg_write(r.UC_ARM_REG_R5,TRACK);uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,RETURN|1)
                        uc.emu_start(ENTRY|1,RETURN,count=100)
                        assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN
                        memory=bytes(uc.mem_read(CHANNEL,0x200));assert memory==expected,(pan,velocity,right,left)
                        registers=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg))) for reg in range(13)]
                        assert registers[4:]==[CHANNEL,TRACK]+[0x12340000+reg for reg in range(6,13)]
                        assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                        results.append((registers,memory,uc.reg_read(r.UC_ARM_REG_CPSR)))
                    assert results[0]==results[1]
                    count+=1
    print(f'{count} original/production stereo-volume cases pass: pan extremes, saturation, all NZCV, r0-r12, stack and test memory.')
if __name__=='__main__':main()
