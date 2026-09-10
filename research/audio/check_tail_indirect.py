#!/usr/bin/env python3
"""Guard explicitly declared private indirect terminal transfers."""
import argparse,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mixer-entry/indirect-guards';out.mkdir(exist_ok=True)
 source=(ROOT/'research/audio/soundmain_mixer_entry_transfers.c').read_text()
 def compile(name,text,plugin=True,indirect='1',frame=True,extra=()):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
  cmd=[a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
  if plugin:
   cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=SoundMainRAM_NoReverb']
   if frame:cmd+=['-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches']
   if indirect is not None:cmd+=['-fplugin-arg-tail_transfer-indirect-register='+indirect]
  result=subprocess.run(cmd+list(extra)+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,_=compile('positive',source);assert not result.returncode,result.stderr
 cases={
 'missing_contract':(source,{'indirect':None}),
 'wrong_register':(source,{'indirect':'0'}),
 'missing_binding':(source.replace('asm("r1")','asm("r2")'),{}),
 'high_register':(source,{'indirect':'8'}),
 'duplicate_option':(source,{'extra':['-fplugin-arg-tail_transfer-indirect-register=2']}),
 'missing_frame':(source,{'frame':False}),
 'adjacent':(source,{'extra':['-fplugin-arg-tail_transfer-adjacent-destination=SoundMainRAM_NoReverb']}),
 'pool_adjacent':(source,{'extra':['-fplugin-arg-tail_transfer-pool-adjacent-destination=SoundMainRAM_NoReverb']}),
 'terminal_adjacent':(source,{'extra':['-fplugin-arg-tail_transfer-terminal-adjacent-destination=SoundMainRAM_NoReverb']}),
 'post_call_work':(source.replace('((void (*)(void))mixerTarget)();','((void (*)(void))mixerTarget)(); mixerReverb += 1;'),{}),
 'bare_path':(source.replace('        SoundMainRAM_NoReverb();',''),{}),
 'stack_arguments':(source.replace('((void (*)(void))mixerTarget)();','((void (*)(int,int,int,int,int))mixerTarget)(1,2,3,4,5);'),{}),
 }
 for name,(text,options) in cases.items():
  result,_=compile(name,text,**options);assert result.returncode,(name,result.stderr)
 plain=source.replace('__attribute__((matching_tail_transfer))','')
 result,obj=compile('plain',plain,False);assert not result.returncode,result.stderr
 original=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and original==obj.read_bytes(),result.stderr
 print('Mixed direct/indirect tails accepted; 12 unsupported contracts rejected; unannotated output unchanged.')
if __name__=='__main__':main()
