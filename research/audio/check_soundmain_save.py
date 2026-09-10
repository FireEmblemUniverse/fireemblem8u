#!/usr/bin/env python3
"""Check all three production channel-save entries and the PC-relative Thumb transfer."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_READ, UC_MEM_WRITE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/soundmain-packed'
ENTRY, DATA, SP = 0x080cf8b4, 0x02000000, 0x03007000


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--copied-ram', action='store_true'); a = p.parse_args()
    original = (ROOT/'baserom.gba').read_bytes(); production = (ROOT/'fireemblem8.gba').read_bytes()
    assert hashlib.sha1(original).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    nm = subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
    fields = next(line.split() for line in nm.splitlines() if line.endswith(' SoundMainRAM_SaveResampled'))
    assert int(fields[0],16) == ENTRY and int(fields[1],16) == 24, fields
    symbols = {line.split()[-1]:int(line.split()[0],16) for line in nm.splitlines() if len(line.split())>=3}
    assert symbols['SoundMainRAM_SaveChannel'] == ENTRY+4 and symbols['SoundMainRAM_RestoreFrame'] == ENTRY+12 and symbols['SoundMainRAM_ChanAdvance'] == ENTRY+24
    # nm normalizes Thumb addresses; readelf preserves the actual symbol mode bit.
    raw_symbols = subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True)
    thumb_symbol = next(line.split() for line in raw_symbols.splitlines() if line.endswith(' SoundMainRAM_ChanAdvance'))
    assert int(thumb_symbol[1],16) == (ENTRY+24)|1 and thumb_symbol[3] == 'FUNC'
    assert production[0xcf8b4:0xcf8cc] == original[0xcf8b4:0xcf8cc]
    machines = []
    def access(uc,kind,address,size,value,trace):
        if kind == UC_MEM_READ: value=int.from_bytes(uc.mem_read(address,size),'little')
        trace.append((kind,address,size,value & 0xffffffff))
    for image in (original,production):
        uc=Uc(UC_ARCH_ARM,UC_MODE_ARM); uc.mem_map(0x08000000,0x1000000); uc.mem_write(0x08000000,image)
        uc.mem_map(DATA,0x2000); uc.mem_map(0x03000000,0x8000)
        if a.copied_ram: uc.mem_write(0x03002c60,image[0xcf54c:0xcf54c+0x400])
        trace=[]
        for begin,end in ((DATA,DATA+0x1fff),(SP-128,SP+127)):
            uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE,access,trace,begin=begin,end=end)
        machines.append((uc,trace))
    entry=ENTRY+(0x03002c60-0x080cf54c if a.copied_ram else 0)
    counts=(0,1,255,256,0x7fffffff,0x80000000,0xffffffff,0x12345678)
    sources=(0,1,DATA+0x1000,SP,0x7fffffff,0x80000000,0xffffffff,0xdeadbeef)
    sample_counts=(0,1,4,16,528,0x7fffffff,0x80000000,0xffffffff)
    cases=0; entries={'resampled':0,'save':0,'restore_only':0}
    for count in counts:
        for source in sources:
            for samples in sample_counts:
                for channel in (DATA+0x800,SP-24,SP-40,SP-28,SP):
                    for offset in (0,4,12):
                        for flags in range(16):
                            lr=(0,1,7,0x7fffff,0x800000,0x80000000,0xffffffff,0xdeadbeef)[(cases//16)%8]
                            raw_data=bytearray([0xa5])*0x2000; raw_frame=bytearray([0x5a])*256
                            struct.pack_into('<I',raw_frame,128,samples)
                            expected_data=raw_data.copy(); expected_frame=raw_frame.copy(); expected_trace=[]
                            stores = ([(channel+28,lr)] if offset == 0 else []) + ([(channel+24,count),(channel+40,source)] if offset < 12 else [])
                            if stores:
                                for address,value in stores:
                                    if DATA <= address < DATA+0x2000: struct.pack_into('<I',expected_data,address-DATA,value)
                                    else: struct.pack_into('<I',expected_frame,address-(SP-128),value)
                                    expected_trace.append((UC_MEM_WRITE,address,4,value))
                            restored=struct.unpack_from('<I',expected_frame,128)[0]
                            expected_trace.append((UC_MEM_READ,SP,4,restored))
                            snapshots=[]
                            for uc,trace in machines:
                                uc.mem_write(DATA,bytes(raw_data)); uc.mem_write(SP-128,bytes(raw_frame)); trace.clear()
                                regs=[0x12340000+n for n in range(13)]; regs[2]=count; regs[3]=source; regs[4]=channel
                                for n,value in enumerate(regs): uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
                                uc.reg_write(r.UC_ARM_REG_LR,lr); uc.reg_write(r.UC_ARM_REG_SP,SP)
                                uc.reg_write(r.UC_ARM_REG_CPSR,0x13 | flags<<28); uc.emu_start(entry+offset,entry+24,count=8)
                                regs[0]=(entry+24)|1; regs[8]=restored
                                observed=tuple(uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13))
                                assert observed==tuple(regs)
                                assert uc.reg_read(r.UC_ARM_REG_PC)==entry+24
                                assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33 | flags<<28
                                assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==lr
                                assert bytes(uc.mem_read(DATA,len(raw_data)))==expected_data
                                assert bytes(uc.mem_read(SP-128,len(raw_frame)))==expected_frame
                                assert trace==expected_trace
                                snapshots.append((observed,trace.copy()))
                            assert snapshots[0]==snapshots[1]
                            entries[{0:'resampled',4:'save',12:'restore_only'}[offset]]+=1; cases+=1
    report=dict(cases=cases,entries=entries,matching_C_bytes=24,copied_RAM=a.copied_ram,
                scope='production resampled/channel-save/restore-only entries; distributed fraction values; count/source/sample boundaries and channel-frame aliases; independent expected ordered stores/load, full data/frame/canaries, r0-r12, SP/LR, preserved NZCV and Thumb destination/mode')
    (OUT/('save-production-ram.json' if a.copied_ram else 'save-production.json')).write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))


if __name__=='__main__': main()
