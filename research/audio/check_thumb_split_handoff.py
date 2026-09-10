#!/usr/bin/env python3
"""Guard the byte-selected Thumb/ARM handoff rewrite."""
import argparse,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mixer-entry/split-guards';out.mkdir(exist_ok=True)
 plain=(ROOT/'research/audio/soundmain_mixer_entry_transfers.c').read_text();source=plain.replace('matching_tail_transfer)', 'matching_tail_transfer, matching_thumb_split_handoff)')
 def compile(name,text,plugin=True,arm='SoundMainRAM_Reverb',thumb='SoundMainRAM_NoReverb',extra=()):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
  cmd=[a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=SoundMainRAM_NoReverb','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-indirect-register=1']
  if plugin:cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_split_handoff.so'),'-fplugin-arg-thumb_split_handoff-arm-destination='+arm,'-fplugin-arg-thumb_split_handoff-thumb-destination='+thumb]
  result=subprocess.run(cmd+list(extra)+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('positive',source);assert not result.returncode,result.stderr
 cases={
 'wrong_arm':(source,{'arm':'DifferentArm'}),
 'wrong_thumb':(source,{'thumb':'DifferentThumb'}),
 'inverted':(source.replace('if (mixerReverb)','if (!mixerReverb)'),{}),
 'halfword':(source.replace('mixerInfo->reverb','*(volatile u16 *)mixerInfo'),{}),
 'extra_arithmetic':(source.replace('    if (mixerReverb)', '    mixerReverb += 1;\n    if (mixerReverb)'),{}),
 'wrong_condition':(source.replace('if (mixerReverb)','if (mixerReverb > 1)'),{}),
 'no_tie':(source.replace('        asm("" : "+r"(mixerTarget));',''),{}),
 'post_call':(source.replace('((void (*)(void))mixerTarget)();','((void (*)(void))mixerTarget)(); mixerReverb += 1;'),{}),
 'bare_path':(source.replace('        SoundMainRAM_NoReverb();',''),{}),
 'debug':(source,{'extra':['-g']}),
 'unwind':(source,{'extra':['-funwind-tables']}),
 'arm_mode':(source,{'extra':['-marm']}),
 }
 for name,(text,options) in cases.items():
  result,_=compile(name,text,**options);assert result.returncode,(name,result.stderr)
 for base in (0x08001000,0x03002000):
  for arm_offset,thumb_offset,valid in ((12,96,True),(12,262,True),(16,96,False),(13,96,False),(12,6,False),(12,264,False)):
   script=out/'placement.ld';elf=out/'placement.elf'
   script.write_text('SECTIONS { . = '+hex(base)+'; __start = .; .text : { *(.text) } __end = .; SoundMainRAM_Reverb = '+hex(base+arm_offset)+'; SoundMainRAM_NoReverb = '+hex(base+thumb_offset)+'; ASSERT((__start & 3) == 0 && __end - __start == 12 && SoundMainRAM_Reverb == (((__start + 6 + 4) & ~3) + 4) && (SoundMainRAM_Reverb & 3) == 0 && SoundMainRAM_NoReverb >= __start + 8 && SoundMainRAM_NoReverb - (__start + 8) <= 254, "split handoff contract") }')
   result=subprocess.run(['arm-none-eabi-ld','-T',str(script),'--entry=SoundMainRAM_EntryTransfersCandidate',str(out/'positive.o'),'-o',str(elf)],capture_output=True,text=True)
   if valid:assert not result.returncode,result.stderr
   else:assert result.returncode and 'split handoff contract' in result.stderr,result.stderr
 result,obj=compile('plain',plain,False);assert not result.returncode,result.stderr
 original=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and original==obj.read_bytes(),result.stderr
 print('Split handoff accepted; 12 unsupported source/configuration shapes and eight link placements rejected; four valid placements pass; unannotated output unchanged.')
if __name__=='__main__':main()
