#!/usr/bin/env python3
"""Check dispatcher call order with a controlled no-enqueue helper model."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
from unicorn import arm_const as r
from build_color_fade import FLAGS
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/map-flood-core-match'

def main():
    OUT.mkdir(exist_ok=True)
    rom=(ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    state=struct.unpack_from('<I',rom,0x774)[0]
    pool1,pool2=struct.unpack_from('<II',rom,0x850)
    source=Path(__file__).with_name('map_flood_core.c')
    flags=FLAGS+['-ffixed-r14']
    subprocess.run(['arm-none-eabi-gcc','-S',str(source),*flags,'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    (OUT/'candidate.ld').write_text('SECTIONS { . = 0x08010000; .text : { *(.text) *(.rodata) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\n'+''.join(f'{name} = {value:#x};\n' for name,value in [('gMovMapFillState',state),('gMovMapFillStPool1',pool1),('gMovMapFillStPool2',pool2),('MapFloodCoreStep',0x08000784)]))
    subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'candidate.ld'),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    code=(OUT/'candidate.bin').read_bytes()
    directions={0:[3,2,0],1:[3,2,1],2:[2,0,1],3:[3,0,1],5:[3,2,0,1]}
    offsets={0:(-1,0),1:(1,0),2:(0,1),3:(0,-1)}
    count=0
    for sequence in [[],[0],[1],[2],[3],[5],[5,0,1,2,3],[3,2,1,0,5,5]]:
        expected=[(pool1+4*i,d,*offsets[d]) for i,c in enumerate(sequence) for d in directions[c]]
        for flags_in in range(16):
            for entry in (0x08000874,0x08010000):
                uc=Uc(UC_ARCH_ARM,UC_MODE_ARM)
                uc.mem_map(0x08000000,0x20000);uc.mem_write(0x08000000,rom[:0x1000]);uc.mem_write(0x08010000,code)
                uc.mem_map(0x02000000,0x40000);uc.mem_map(0x03000000,0x8000)
                for i,c in enumerate(sequence+[4]):uc.mem_write(pool1+4*i,bytes((10+i,20+i,c,0)))
                uc.mem_write(pool2,bytes((0xaa,0xbb,99,0xcc)))
                trace=[]
                def hook(machine,address,size,data):
                    if address==0x08000784:
                        args=[machine.reg_read(reg) for reg in (r.UC_ARM_REG_R0,r.UC_ARM_REG_R1,r.UC_ARM_REG_R2)]
                        args=[v if v<0x80000000 else v-0x100000000 for v in args]
                        src=struct.unpack('<I',machine.mem_read(state,4))[0]
                        trace.append((src,*args))
                        machine.reg_write(r.UC_ARM_REG_PC,machine.reg_read(r.UC_ARM_REG_LR))
                uc.hook_add(UC_HOOK_CODE,hook)
                uc.reg_write(r.UC_ARM_REG_CPSR,0x13|(flags_in<<28))
                for reg in range(4,12):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x0801f000)
                uc.emu_start(entry,0x0801f000,count=10000)
                assert uc.reg_read(r.UC_ARM_REG_PC)==0x0801f000
                assert trace==expected,(sequence,entry,trace,expected)
                assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                final=(pool2,pool1) if sequence else (pool1,pool2)
                assert struct.unpack('<II',uc.mem_read(state,8))==final
                assert bytes(uc.mem_read(pool2,4))==bytes((0xaa,0xbb,4 if sequence else 99,0xcc))
            count+=1
    report={'cases':count,'scope':'No-enqueue helper model; eight initial queues, all NZCV; ordered calls, queue cursors, sentinel and callee-saved registers. Not full-helper or return-flag equivalence. Not instruction matching.', 'candidate_section_bytes':len(code),'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(code).hexdigest(),'compiler_flags':flags}
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f'{count} original/candidate dispatcher cases pass; candidate section {len(code)} bytes; instruction matching unfinished.')
if __name__=='__main__':main()
