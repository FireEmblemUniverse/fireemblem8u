#!/usr/bin/env python3
"""Execute the candidate dispatcher with the actual ROM terrain helper."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/map-flood-core-match'

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin',type=Path,action='append',default=[])
    parser.add_argument('--compiler',default='arm-none-eabi-gcc')
    parser.add_argument('--pc-relative',action='store_true')
    parser.add_argument('--unchecked',action='store_true')
    parser.add_argument('--sink-trampolines',action='store_true')
    args=parser.parse_args()
    options=[item for plugin in args.plugin for item in ['--plugin',str(plugin.resolve())]]
    options+=['--compiler',args.compiler]
    if args.unchecked:options+=['--unchecked']
    if args.sink_trampolines:options+=['--sink-trampolines']
    if args.pc_relative:options+=['--pc-relative']
    subprocess.run([sys.executable,str(Path(__file__).with_name('check_map_flood_core.py')),*options],check=True)
    rom=(ROOT/'baserom.gba').read_bytes()
    code=(OUT/'candidate.bin').read_bytes()
    costs,state,working,terrain,units=struct.unpack_from('<5I',rom,0x770)
    pool1,pool2=struct.unpack_from('<II',rom,0x850)
    directions={0:[3,2,0],1:[3,2,1],2:[2,0,1],3:[3,0,1],5:[3,2,0,1]}
    offsets={0:(-1,0),1:(1,0),2:(0,1),3:(0,-1)}
    cases=0
    for layout in range(4):
        tiles=bytearray(81)
        occupants=bytearray(81)
        for y in range(9):
            for x in range(9):
                tiles[y*9+x]=255 if x in (0,8) or y in (0,8) else 1+(x*3+y+layout)%3
                if layout>=2 and (x+y)%4==0:occupants[y*9+x]=0x81 if x%2 else 1
        for budget in (0,1,3,6,12):
            for own,check in ((1,0),(1,1),(0x81,1)):
                expected=bytearray([255]*81);expected[40]=0
                frontier=[(4,4,5)]
                while frontier:
                    next_frontier=[]
                    for x,y,connection in frontier:
                        for direction in directions[connection]:
                            dx,dy=offsets[direction];nx,ny=x+dx,y+dy
                            at=ny*9+nx
                            cost=expected[y*9+x]+tiles[at]
                            if cost>=expected[at] or cost>budget:continue
                            if check and occupants[at] and ((own^occupants[at])&128):continue
                            expected[at]=cost
                            next_frontier.append((nx,ny,direction))
                    frontier=next_frontier
                for nzcv in (0,5,10,15):
                    outputs=[]
                    for entry in (0x08000874,0x08010000):
                        uc=Uc(UC_ARCH_ARM,UC_MODE_ARM)
                        uc.mem_map(0x08000000,0x20000);uc.mem_write(0x08000000,rom[:0x1000]);uc.mem_write(0x08010000,code)
                        uc.mem_map(0x02000000,0x40000);uc.mem_map(0x03000000,0x8000)
                        initial=bytearray([255]*81);initial[40]=0
                        for pointer,table,data,values in ((terrain,0x02001000,0x02002000,tiles),(units,0x02001100,0x02002100,occupants),(working,0x02001200,0x02002200,initial)):
                            uc.mem_write(pointer,struct.pack('<I',table))
                            uc.mem_write(table,struct.pack('<9I',*(data+i*9 for i in range(9))))
                            uc.mem_write(data,bytes(values))
                        uc.mem_write(costs,bytes(range(256)))
                        uc.mem_write(state,struct.pack('<IIBBBB',0,0,check,budget,own,0))
                        uc.mem_write(pool1,bytes((4,4,5,0,0,0,4,0)))
                        uc.reg_write(r.UC_ARM_REG_CPSR,0x13|(nzcv<<28))
                        for reg in range(4,13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                        uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x0801f000)
                        uc.emu_start(entry,0x0801f000,count=100000)
                        assert uc.reg_read(r.UC_ARM_REG_PC)==0x0801f000
                        assert bytes(uc.mem_read(0x02002200,81))==expected,(layout,budget,own,check,entry)
                        assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                        for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                        outputs.append((bytes(uc.mem_read(0x02000000,0x40000)),bytes(uc.mem_read(pool1,state+12-pool1)),uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
                    assert outputs[0]==outputs[1],(layout,budget,own,check,nzcv)
                    cases+=1
    report={'cases':cases,'scope':'Actual ROM helper; four bounded 9x9 terrain/unit layouts, five budgets, three allegiance/check settings, four incoming NZCV patterns. Independent final movement map and original/candidate EWRAM, queue/state, callee-saved and return flag checks. Not instruction matching.', 'candidate_sha256':hashlib.sha256(code).hexdigest()}
    (OUT/'full-helper-report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f'{cases} full-helper original/candidate flood cases pass.')
if __name__=='__main__':main()
