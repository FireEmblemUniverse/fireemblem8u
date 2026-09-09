#!/usr/bin/env python3
"""Check dispatcher call order with a controlled finite-enqueue helper models."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
from build_color_fade import FLAGS
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/map-flood-core-match'

def main():
    global OUT
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--computed', action='store_true', help='check the alternate computed-goto fixture')
    parser.add_argument('--plugin', type=Path, action='append', default=[], help='experimental compiler plugin; repeat to compose passes')
    parser.add_argument('--compiler',default='arm-none-eabi-gcc')
    parser.add_argument('--pc-relative',action='store_true')
    args=parser.parse_args()
    if args.computed:OUT=ROOT/'.deps/map-flood-core-computed-match'
    OUT.mkdir(exist_ok=True)
    rom=(ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    state=struct.unpack_from('<I',rom,0x774)[0]
    pool1,pool2=struct.unpack_from('<II',rom,0x850)
    source=Path(__file__).with_name('map_flood_core_computed.c' if args.computed else 'map_flood_core.c')
    flags=FLAGS+['-ffixed-r14']
    flags+=['-fplugin='+str(plugin.resolve()) for plugin in args.plugin]
    if args.pc_relative:flags+=['-fplugin-arg-branch_tables-pc-relative']
    subprocess.run([args.compiler,'-S',str(source),*flags,'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    (OUT/'candidate.ld').write_text('SECTIONS { . = 0x08010000; .text : { *(.text) *(.rodata) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\n'+''.join(f'{name} = {value:#x};\n' for name,value in [('gMovMapFillState',state),('gMovMapFillStPool1',pool1),('gMovMapFillStPool2',pool2),('MapFloodCoreStep',0x08000784)]))
    subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'candidate.ld'),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    code=(OUT/'candidate.bin').read_bytes()
    def call_setups(body, address):
        words=struct.unpack('<'+'I'*(len(body)//4),body[:len(body)//4*4])
        setups=[]
        for i,word in enumerate(words):
            if word>>24 != 0xeb:continue
            displacement=(word&0xffffff)
            if displacement&0x800000:displacement-=0x1000000
            target=address+i*4+8+displacement*4
            if target==0x08000784:
                setups.append(words[i-3:i])
        return setups
    original_setups=call_setups(rom[0x874:0xa20],0x08000874)
    candidate_setups=call_setups(code,0x08010000)
    assert len(original_setups)==16
    assert candidate_setups==original_setups, (candidate_setups,original_setups)
    directions={0:[3,2,0],1:[3,2,1],2:[2,0,1],3:[3,0,1],5:[3,2,0,1]}
    offsets={0:(-1,0),1:(1,0),2:(0,1),3:(0,-1)}
    count=0
    flag_differences=0
    base=0x03000000
    for sequence in [[],[0],[1],[2],[3],[5],[5,0,1,2,3],[3,2,1,0,5,5]]:
        for budget in (0,1,4,12,24):
            initial=bytearray(0x8000)
            for i,c in enumerate(sequence+[4]):initial[pool1-base+4*i:pool1-base+4*i+4]=bytes((10+i,20+i,c,0))
            initial[pool2-base:pool2-base+4]=bytes((0xaa,0xbb,99,0xcc))
            expected_memory=bytearray(initial)
            expected=[]
            remaining=budget
            src_pool,dst_pool=pool1,pool2
            while True:
                src,dst=src_pool,dst_pool
                struct.pack_into('<II',expected_memory,state-base,src,dst)
                if expected_memory[src-base+2]==4:break
                while expected_memory[src-base+2]!=4:
                    connection=expected_memory[src-base+2]
                    for direction in directions[connection]:
                        expected.append((src,direction,*offsets[direction]))
                        serial=len(expected)
                        if remaining and serial%3:
                            expected_memory[dst-base:dst-base+4]=bytes((serial,serial+1,direction,serial))
                            dst+=4
                            remaining-=1
                            struct.pack_into('<I',expected_memory,state-base+4,dst)
                    expected_memory[dst-base+2]=4
                    src+=4
                    struct.pack_into('<I',expected_memory,state-base,src)
                src_pool,dst_pool=dst_pool,src_pool
            for flags_in in range(16):
                returns=[]
                for entry in (0x08000874,0x08010000):
                    uc=Uc(UC_ARCH_ARM,UC_MODE_ARM)
                    uc.mem_map(0x08000000,0x20000);uc.mem_write(0x08000000,rom[:0x1000]);uc.mem_write(0x08010000,code)
                    uc.mem_map(0x02000000,0x40000);uc.mem_map(base,0x8000);uc.mem_write(base,bytes(initial))
                    trace=[]
                    left=[budget]
                    def hook(machine,address,size,data):
                        if address==0x08000784:
                            args=[machine.reg_read(reg) for reg in (r.UC_ARM_REG_R0,r.UC_ARM_REG_R1,r.UC_ARM_REG_R2)]
                            args=[v if v<0x80000000 else v-0x100000000 for v in args]
                            src,dst=struct.unpack('<II',machine.mem_read(state,8))
                            trace.append((src,*args))
                            serial=len(trace)
                            if left[0] and serial%3:
                                machine.mem_write(dst,bytes((serial,serial+1,args[0],serial)))
                                machine.mem_write(state+4,struct.pack('<I',dst+4))
                                left[0]-=1
                            # A real helper may clobber all caller-saved arguments and NZCV.
                            for reg in range(4):machine.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0xdead0000+reg)
                            machine.reg_write(r.UC_ARM_REG_CPSR,0x13|((serial%16)<<28))
                            machine.reg_write(r.UC_ARM_REG_PC,machine.reg_read(r.UC_ARM_REG_LR))
                    def check_write(machine,access,address,size,value,data):
                        assert (pool1<=address and address+size<=state+8) or (0x03006ff0<=address and address+size<=0x03007000),(hex(address),size)
                    uc.hook_add(UC_HOOK_CODE,hook)
                    uc.hook_add(UC_HOOK_MEM_WRITE,check_write)
                    uc.reg_write(r.UC_ARM_REG_CPSR,0x13|(flags_in<<28))
                    for reg in range(4,12):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                    uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x0801f000)
                    uc.emu_start(entry,0x0801f000,count=10000)
                    assert uc.reg_read(r.UC_ARM_REG_PC)==0x0801f000
                    assert trace==expected,(sequence,budget,entry,trace,expected)
                    assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                    for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                    actual=bytes(uc.mem_read(base,0x8000))
                    assert actual[:0x6ff0]==expected_memory[:0x6ff0]
                    assert actual[0x7000:]==expected_memory[0x7000:]
                    returns.append(uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000)
                flag_differences+=returns[0]!=returns[1]
                count+=1
    assert flag_differences == 0, flag_differences
    report={'plugins':[{'path':str(plugin.resolve()),'sha256':hashlib.sha256(plugin.read_bytes()).hexdigest()} for plugin in args.plugin],'matching_argument_setup_words':48,'cases':count,'return_flag_difference_cases':flag_differences,'scope':'Finite-enqueue helper models; eight initial queues, five enqueue budgets, all NZCV; ordered calls, complete IWRAM except stack save area, write bounds and callee-saved registers. Not full terrain helper or instruction matching.', 'candidate_section_bytes':len(code),'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(code).hexdigest(),'compiler_flags':flags}
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f'{count} original/candidate dispatcher cases pass; candidate section {len(code)} bytes; instruction matching unfinished.')
if __name__=='__main__':main()
