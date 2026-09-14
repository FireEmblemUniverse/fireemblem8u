#!/usr/bin/env python3
"""Exercise the high-entry reconstruction against sequential OAM effects."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
import sys
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_WRITE
from unicorn import arm_const as regs

ROOT = Path(__file__).resolve().parents[2]
BASE, STACK, STOP = 0x02000000, 0x03007000, 0x08000f00

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin', type=Path, required=True)
    parser.add_argument('--low', action='store_true', help='execute the original low-entry shim into the reconstructed shared body')
    parser.add_argument('--low-candidate',type=Path,help='Fresh sixteen-byte low-entry pool/code region')
    args = parser.parse_args()
    if args.low_candidate and not args.low:parser.error('--low-candidate requires --low')
    subprocess.run([sys.executable, str(Path(__file__).with_name('build_put_oam.py')),
                    '--plugin', str(args.plugin.resolve()), '--prefix-pool'], check=True, cwd=ROOT)
    out = ROOT/'.deps/put-oam-match'
    rom = (ROOT/'baserom.gba').read_bytes()
    pointer = struct.unpack_from('<I', rom, 0x530 if args.low else 0x490)[0]
    entry = 0x08000534 if args.low else 0x08000494
    allowed = set()
    def check_write(uc, access, address, size, value, data):
        assert STACK-16 <= address and address+size <= STACK or all(a in allowed for a in range(address,address+size)), (hex(address), size)
    machines = []
    for section in (rom[0x490:0x530], (out/'candidate.bin').read_bytes()):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        uc.mem_map(0x08000000, 0x1000)
        shim=args.low_candidate.read_bytes() if args.low_candidate and machines else rom[0x530:0x540]
        assert len(shim)==16
        uc.mem_write(0x08000490, section + shim)
        uc.mem_map(BASE, 0x4000)
        uc.mem_map(0x03000000, 0x8000)
        uc.hook_add(UC_HOOK_MEM_WRITE, check_write)
        machines.append(uc)
    cases = flag_differences = 0
    register_differences = {}
    for count in (0,1,2,7,32):
        for delta in (-8,0,2,0x800):
            src = BASE+0x800
            dst = src+delta
            for x,y,oam2 in ((0,0,0),(511,255,0xffff),(0xffffffff,0xfffffffe,0x12345678),(0x12348001,0xabcd8000,0xffffffff)):
                initial = bytearray((i*37+(i>>8))&255 for i in range(0x4000))
                struct.pack_into('<H',initial,src-BASE,count)
                expected = bytearray(initial)
                allowed.clear()
                allowed.update(range(pointer,pointer+4))
                xy = (x&65535)|((y&65535)<<16)
                for index in range(count):
                    # Read each halfword just before its write: overlap may alter later input.
                    for lane in range(3):
                        value = struct.unpack_from('<H',expected,src-BASE+2+index*6+lane*2)[0]
                        if lane==0: value = ((value|(xy>>16))&0xff00)|((value+(xy>>16))&255)
                        elif lane==1: value = ((value|xy)&0xfe00)|((value+xy)&511)
                        else: value = (value+oam2)&65535
                        address = dst+index*8+lane*2
                        struct.pack_into('<H',expected,address-BASE,value)
                        allowed.update(range(address,address+2))
                for nzcv in range(16):
                    results=[]
                    for uc in machines:
                        uc.mem_write(BASE,bytes(initial))
                        uc.mem_write(pointer,struct.pack('<I',dst))
                        uc.reg_write(regs.UC_ARM_REG_CPSR,0x13|(nzcv<<28))
                        for r in range(13): uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(r)),0x12340000+r)
                        for r,value in enumerate((x,y,src,oam2)): uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(r)),value)
                        uc.reg_write(regs.UC_ARM_REG_SP,STACK)
                        uc.reg_write(regs.UC_ARM_REG_LR,STOP)
                        uc.emu_start(entry,STOP,count=10000)
                        assert uc.reg_read(regs.UC_ARM_REG_PC)==STOP
                        assert uc.reg_read(regs.UC_ARM_REG_SP)==STACK
                        assert bytes(uc.mem_read(BASE,len(expected)))==expected,(count,delta,x,y,nzcv)
                        assert struct.unpack('<I',uc.mem_read(pointer,4))[0]==dst+count*8
                        for r in range(4,12): assert uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r)))==0x12340000+r
                        results.append([uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r))) for r in range(13)]+[uc.reg_read(regs.UC_ARM_REG_CPSR)&0xf0000000])
                    for r in range(13):
                        if results[0][r]!=results[1][r]: register_differences[str(r)]=register_differences.get(str(r),0)+1
                    flag_differences += results[0][13]!=results[1][13]
                    cases+=1
    assert not register_differences, register_differences
    assert flag_differences == 0, flag_differences
    report=json.loads((out/'report.json').read_text())
    assert report['complete_section_match'], report['differing_words']
    report.update(cases=cases,register_difference_cases=register_differences,nzcv_difference_cases=flag_differences,
                  entry=('C low candidate' if args.low_candidate else 'low shim') if args.low else 'high',
                  scope='Selected entry; counts 0,1,2,7,32; four overlaps; four coordinate/attribute tuples; all NZCV. Full section, register and flag agreement required.')
    (out/('execution-low-report.json' if args.low else 'execution-report.json')).write_text(json.dumps(report,indent=2)+'\n')
    print(f'{cases} memory/cursor/callee-saved checks passed; register mismatches {register_differences}; NZCV mismatches {flag_differences}.')

if __name__=='__main__': main()
