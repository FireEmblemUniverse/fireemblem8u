#!/usr/bin/env python3
"""Guard the private saved-frame return contract and unchanged unannotated code."""
import argparse,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--grouped',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/exit-restore/guards';out.mkdir(exist_ok=True)
 plain=(ROOT/'research/audio/soundmain_exit_restore.c').read_text();attr='__attribute__((matching_thumb_frame_return))\n';source=plain.replace('void SoundMainRAM_',attr+'void SoundMainRAM_')
 def compile(name,text,plugin=True,extra=()):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
  cmd=[a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
  if plugin:
   cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_frame_return.so')]
   if a.grouped:cmd+=['-fplugin-arg-thumb_frame_return-grouped']
  result=subprocess.run(cmd+list(extra)+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('positive',source);assert not result.returncode,result.stderr
 cases={
 'wrong_slot':(source.replace('exitStack[15]','exitStack[14]'),()),
 'unaligned_slot':(source.replace('exitStack[15]','*(volatile u32 *)((u32)exitStack+58)'),()),
 'wrong_advance':(source.replace('exitStack += 16','exitStack += 15'),()),
 'no_target_binding':(source.replace('asm("r3")','asm("r12")'),()),
 'no_frame_binding':(source.replace('asm("sp")','asm("r12")'),()),
 'target_clobber':(source.replace('exitStack += 16;', 'exitStack += 16; exitR3 = 0;'),()),
 'inline_asm':(source.replace('exitR3 = 0x68736d53;', 'asm("nop"); exitR3 = 0x68736d53;'),()),
 'arm':(source,('-marm',)),
 'debug':(source,('-g',)),
 'unwind':(source,('-funwind-tables',)),
 }
 if a.grouped:
  cases.update({
   'low_offset':(source.replace('exitR1 = exitStack[8]', 'exitR1 = exitStack[9]'),()),
   'high_copy':(source.replace('exitR8 = exitR0', 'exitR8 = exitR1'),()),
   'intervening_update':(source.replace('exitR8 = exitR0;', 'exitR7 += 1; exitR8 = exitR0;'),()),
   'reordered_loads':(source.replace('exitR0 = exitStack[7];\n    exitR1 = exitStack[8];','exitR1 = exitStack[8];\n    exitR0 = exitStack[7];'),()),
  })
 for name,(text,extra) in cases.items():
  result,_=compile(name,text,extra=extra);assert result.returncode and 'Thumb frame return' in result.stderr,(name,result.stderr)
 result,obj=compile('plain',plain,False);assert not result.returncode,result.stderr
 original=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and original==obj.read_bytes(),result.stderr
 print(f'Private return accepted; {len(cases)} unsupported contracts rejected; unannotated object unchanged.')
if __name__=='__main__':main()
