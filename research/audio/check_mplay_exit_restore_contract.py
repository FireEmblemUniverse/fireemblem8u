#!/usr/bin/env python3
"""Guard the private saved-frame return contract and unchanged unannotated code."""
import argparse,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args();a.grouped=True
 out=ROOT/'.deps/soundmain-packed/mplay-exit-restore/guards';out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'research/audio/mplay_exit_restore.c').read_text();plain=source.replace('__attribute__((matching_thumb_frame_return))\n','')
 def compile(name,text,plugin=True,extra=()):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
  cmd=[a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
  if plugin:
   cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_frame_return.so')]
   if a.grouped:cmd+=['-fplugin-arg-thumb_frame_return-grouped','-fplugin-arg-thumb_frame_return-frame36']
  result=subprocess.run(cmd+list(extra)+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('positive',source);assert not result.returncode,result.stderr
 cases={
 'wrong_slot':(source.replace('exitStack[8]','exitStack[7]'),()),
 'unaligned_slot':(source.replace('exitStack[8]','*(volatile u32 *)((u32)exitStack+30)'),()),
 'wrong_advance':(source.replace('exitStack += 9','exitStack += 8'),()),
 'no_target_binding':(source.replace('asm("r3")','asm("r12")'),()),
 'no_frame_binding':(source.replace('asm("sp")','asm("r12")'),()),
 'target_clobber':(source.replace('exitStack += 9;', 'exitStack += 9; exitR3 = 0;'),()),
 'inline_asm':(source.replace('exitR0 = exitStack[0];', 'asm("nop"); exitR0 = exitStack[0];'),()),
 'arm':(source,('-marm',)),
 'debug':(source,('-g',)),
 'unwind':(source,('-funwind-tables',)),
 }
 if a.grouped:
  cases.update({
   'low_offset':(source.replace('exitR1 = exitStack[1]', 'exitR1 = exitStack[2]'),()),
   'high_copy':(source.replace('exitR8 = exitR0', 'exitR8 = exitR1'),()),
   'intervening_update':(source.replace('exitR8 = exitR0;', 'exitR7 += 1; exitR8 = exitR0;'),()),
   'reordered_loads':(source.replace('exitR0 = exitStack[0];\n    exitR1 = exitStack[1];','exitR1 = exitStack[1];\n    exitR0 = exitStack[0];'),()),
  })
 cases.update({
  'entry_empty':(source,('-fplugin-arg-thumb_frame_return-return-entry',)),
  'entry_invalid':(source,('-fplugin-arg-thumb_frame_return-return-entry=bad;name',)),
  'entry_digit':(source,('-fplugin-arg-thumb_frame_return-return-entry=1bad',)),
  'entry_duplicate':(source,('-fplugin-arg-thumb_frame_return-return-entry=call_r3','-fplugin-arg-thumb_frame_return-return-entry=call_r3')),
 })
 for name,(text,extra) in cases.items():
  result,_=compile(name,text,extra=extra);assert result.returncode and ('Thumb frame return' in result.stderr or 'Thumb 36-byte return' in result.stderr or 'initialize' in result.stderr),(name,result.stderr)
 result,obj=compile('plain',plain,False);assert not result.returncode,result.stderr
 original=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and original==obj.read_bytes(),result.stderr
 print(f'Private return accepted; {len(cases)} unsupported contracts rejected; unannotated object unchanged.')
if __name__=='__main__':main()
