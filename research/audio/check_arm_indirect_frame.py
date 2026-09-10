#!/usr/bin/env python3
"""Validate private indirect-tail LR frame removal, aliases and rejected forms."""
import argparse
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_READ, UC_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]


def main():
    p=argparse.ArgumentParser(description=__doc__); p.add_argument('--compiler',required=True); p.add_argument('--plugin',type=Path,required=True); a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/indirect-frame-guards'; out.mkdir(exist_ok=True)
    attr='__attribute__((matching_arm_indirect_frame)) '
    source='''register volatile unsigned target asm("r0");
register volatile unsigned *dest asm("r4");
register unsigned restored asm("r8");
register volatile unsigned *frame asm("sp");
register unsigned fraction asm("lr");
'''+attr+'''void fixture(void) {
 *dest = fraction;
 restored = *frame;
 ((void (*)(void))target)();
}
'''
    def compile_case(name,text,extra=(),plugin=True):
        src=out/(name+'.c'); src.write_text(text); obj=src.with_suffix('.o')
        result=subprocess.run([a.compiler,'-c','-O1','-foptimize-sibling-calls','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu',
                               *(['-fplugin='+str(a.plugin.resolve())] if plugin else []),*extra,str(src),'-o',str(obj)],capture_output=True,text=True)
        return result,obj
    result,obj=compile_case('accepted',source); assert not result.returncode,result.stderr
    binary=obj.with_suffix('.bin'); subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(obj),str(binary)],check=True)
    code=binary.read_bytes(); assert code==bytes.fromhex('00e084e500809de510ff2fe1'),code.hex()
    uc=Uc(UC_ARCH_ARM,UC_MODE_ARM); uc.mem_map(0x08000000,0x1000); uc.mem_write(0x08000000,code); uc.mem_map(0x02000000,0x1000)
    trace=[]
    def access(uc,kind,address,size,value,data):
        if kind==UC_MEM_READ: value=int.from_bytes(uc.mem_read(address,size),'little')
        data.append((kind,address,size,value))
    uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,begin=0x02000000,end=0x02000fff)
    rng=random.Random(0x494e4449)
    fractions=[0,1,7,0x7fffff,0x800000,0x7fffffff,0x80000000,0xffffffff]+[rng.getrandbits(32) for _ in range(64)]
    cases=0
    for fraction in fractions:
        for sample in (0,1,528,0x7fffffff,0x80000000,0xffffffff):
            for address in (0x02000100,0x02000800):
                for flags in range(16):
                    for thumb in (False,True):
                        raw=bytearray([0xa5])*0x1000; struct.pack_into('<I',raw,0x800,sample)
                        expected=raw.copy(); struct.pack_into('<I',expected,address-0x02000000,fraction)
                        value=struct.unpack_from('<I',expected,0x800)[0]
                        uc.mem_write(0x02000000,bytes(raw)); trace.clear()
                        regs=[0x12340000+n for n in range(13)]; regs[0]=0x08000100|thumb; regs[4]=address
                        for n,x in enumerate(regs): uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),x)
                        uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28); uc.reg_write(r.UC_ARM_REG_SP,0x02000800); uc.reg_write(r.UC_ARM_REG_LR,fraction)
                        uc.emu_start(0x08000000,0x08000100,count=8); regs[8]=value
                        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==regs
                        assert uc.reg_read(r.UC_ARM_REG_PC)==0x08000100
                        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|flags<<28|thumb<<5
                        assert uc.reg_read(r.UC_ARM_REG_SP)==0x02000800 and uc.reg_read(r.UC_ARM_REG_LR)==fraction
                        assert bytes(uc.mem_read(0x02000000,0x1000))==expected
                        assert trace==[(UC_MEM_WRITE,address,4,fraction),(UC_MEM_READ,0x02000800,4,value)]
                        cases+=1
    rejects=[('no_sp',source.replace('frame asm("sp")','frame asm("r5")'),()),
             ('no_lr',source.replace('fraction asm("lr")','fraction asm("r2")'),()),
             ('no_target',source.replace('target asm("r0")','target asm("r1")'),()),
             ('lr_write',source.replace('*dest = fraction;','fraction++; *dest = fraction;'),()),
             ('stack_write',source.replace('*dest = fraction;','*frame = fraction;'),()),
             ('outside_frame',source.replace('restored = *frame;','restored = frame[16];'),()),
             ('extra_call',source.replace('*dest = fraction;','((void (*)(void))target)(); *dest = fraction;'),()),
             ('after_call',source.replace('((void (*)(void))target)();','((void (*)(void))target)(); restored++;'),()),
             ('wrong_target',source.replace('((void (*)(void))target)();','((void (*)(void))restored)();'),()),
             ('missing_call',source.replace('((void (*)(void))target)();',''),()),
             ('assembly',source.replace('*dest = fraction;','asm volatile("nop"); *dest = fraction;'),()),
             ('debug',source,('-g',)),('unwind',source,('-funwind-tables',)),('thumb',source,('-mthumb',))]
    for name,text,extra in rejects:
        result,_=compile_case(name,text,extra); assert result.returncode and 'ARM indirect frame' in result.stderr,(name,result.stderr)
    plain=source.replace(attr,''); result,obj=compile_case('plain',plain,plugin=False); assert not result.returncode,result.stderr
    before=obj.read_bytes(); result,obj=compile_case('plain',plain)
    assert not result.returncode and before==obj.read_bytes(),result.stderr
    print(f'{cases} private indirect-frame executions pass; {len(rejects)} invalid forms rejected; unannotated object unchanged.')


if __name__=='__main__': main()
