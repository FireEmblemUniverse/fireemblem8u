#!/usr/bin/env python3
"""Check guarded decrement folding and unsupported source shapes."""
import argparse,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/channel-advance/guards';out.mkdir(exist_ok=True)
 source=(ROOT/'research/audio/soundmain_channel_advance.c').read_text();attr='matching_tail_transfer, matching_thumb_fork_decrement'
 annotated=source.replace('matching_tail_transfer',attr)
 def compile(name,text,plugin=True):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
  cmd=[a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=SoundMainRAM_DeadlineExit','-fplugin-arg-tail_transfer-destination=SoundMainRAM_ChanLoop','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=SoundMainRAM_DeadlineExit']
  if plugin:cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_fork_decrement.so')]
  result=subprocess.run(cmd+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('positive',annotated);assert not result.returncode,result.stderr
 before_tie=obj.read_bytes()
 tied=annotated.replace('        SoundMainRAM_ChanLoop();','        asm("" : "+r"(advanceChannel));\n        SoundMainRAM_ChanLoop();')
 result,obj=compile('positive',tied);assert not result.returncode and obj.read_bytes()==before_tie,result.stderr
 for name,text in [('nonempty_tie',tied.replace('asm(""','asm("nop"')),('clobber_tie',tied.replace('"+r"(advanceChannel));','"+r"(advanceChannel) : : "r1");'))]:
  result,_=compile(name,text);assert result.returncode and 'tail' in result.stderr.lower(),(name,result.stderr)
 cases={
  'wrong_bound':annotated.replace('advanceCount > 1','advanceCount > 2'),
  'unsigned':annotated.replace('(s32)advanceCount','(u32)advanceCount'),
  'unequal':annotated.replace('advanceCount -= 1','advanceCount -= 2',1),
  'missing':annotated.replace('advanceCount -= 1;','',1),
  'no_tail_contract':annotated.replace(attr,'matching_thumb_fork_decrement'),
  'prior_store':annotated.replace('        advanceCount -= 1;', '        advanceFrame->mixerScratchC = advanceCount;\n        advanceCount -= 1;'),
 }
 for name,text in cases.items():
  result,_=compile(name,text);assert result.returncode and ('Thumb fork decrement' in result.stderr), (name,result.stderr)
 result,obj=compile('plain',source,False);assert not result.returncode,result.stderr
 before=obj.read_bytes();result,obj=compile('plain',source);assert not result.returncode and before==obj.read_bytes(),result.stderr
 print('Positive folds with/without empty tie and eight unsupported shape rejections pass; unannotated object unchanged.')
if __name__=='__main__':main()
