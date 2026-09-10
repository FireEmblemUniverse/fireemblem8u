#!/usr/bin/env python3
"""Check widened-sum reduction rejection boundaries and opt-in isolation."""
import argparse
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[2]
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--plugin',type=Path,required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/signed-sum-guards';out.mkdir(exist_ok=True)
    source=(ROOT/'research/audio/soundmain_wrap_private.c').read_text()
    def compile_case(name,text,mode='-marm',plugin=True):
        src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
        result=subprocess.run([a.compiler,'-c',str(src),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1',mode,'-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding',*(['-fplugin='+str(a.plugin.resolve())] if plugin else [])],capture_output=True,text=True)
        return result,obj
    result,_=compile_case('accepted',source);assert not result.returncode,result.stderr
    rejects=[('thumb',source,'-mthumb'),('nonnegative',source.replace('total > 0','total >= 0'),'-marm'),('negative',source.replace('total > 0','total < 0'),'-marm'),('unsigned',source.replace('s64','u64').replace('(s32)','(u32)'),'-marm'),('subtract',source.replace(' + (s64)',' - (s64)'),'-marm'),('wrapped_compare',source.replace('total > 0','(s32)wrapRemaining > 0'),'-marm'),('barrier',source.replace('    if (total > 0)', '    asm volatile("" ::: "memory");\n    if (total > 0)'),'-marm'),('live_high',source.replace('    wrapSkip -= wrapLength;','    wrapSkip -= wrapLength;\n    wrapSkip += (u32)(total >> 32);'),'-marm')]
    for name,text,mode in rejects:
        result,_=compile_case(name,text,mode);assert result.returncode and 'signed sum' in result.stderr,(name,result.stderr)
    plain=source.replace('__attribute__((matching_signed_sum))\n','')
    result,obj=compile_case('plain',plain,plugin=False);assert not result.returncode;before=obj.read_bytes()
    result,obj=compile_case('plain',plain);assert not result.returncode and obj.read_bytes()==before
    print(f'Widened positive-sum candidate accepted; {len(rejects)} invalid patterns rejected; unannotated object unchanged. Execution coverage: check_soundmain_wrap.py.')
if __name__=='__main__':main()
