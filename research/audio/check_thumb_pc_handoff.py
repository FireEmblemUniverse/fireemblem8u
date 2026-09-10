#!/usr/bin/env python3
"""Exercise private Thumb PC handoff rejection and opt-in isolation."""
import argparse,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/sample-handoff/guards';out.mkdir(exist_ok=True)
 plain=(ROOT/'research/audio/soundmain_sample_handoff.c').read_text();source=plain.replace('void SoundMainRAM_', '__attribute__((matching_thumb_pc_handoff))\nvoid SoundMainRAM_')
 def compile(name,text,plugin=True,extra=(),symbol='SoundMainRAM_SampleEntry',site='6',offset='4'):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
  cmd=[a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
  if plugin:cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_pc_handoff.so'),'-fplugin-arg-thumb_pc_handoff-symbol='+symbol,'-fplugin-arg-thumb_pc_handoff-site='+site,'-fplugin-arg-thumb_pc_handoff-offset='+offset]
  result=subprocess.run(cmd+list(extra)+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,_=compile('positive',source);assert not result.returncode,result.stderr
 cases={
  'arm':(source,{'extra':['-marm']}),
  'debug':(source,{'extra':['-g']}),
  'unwind':(source,{'extra':['-funwind-tables']}),
  'symbol':(source,{'symbol':'DifferentTarget'}),
  'site':(source,{'site':'8'}),
  'constant':(source.replace('(u32)SoundMainRAM_SampleEntry','4'),{}),
  'target_register':(source.replace('asm("r0")','asm("r1")'),{}),
  'frame_register':(source.replace('asm("sp")','asm("r6")'),{}),
  'frame_write':(source.replace('handoffBuffer = handoffFrame->pcmBuffer;', 'handoffFrame->pcmBuffer = handoffBuffer;'),{}),
  'frame_outside':(source.replace('handoffFrame->pcmBuffer', '((volatile u32 *)handoffFrame)[16]'),{}),
  'assembly':(source.replace('handoffBuffer =', 'asm("nop"); handoffBuffer ='),{}),
  'unaligned_offset':(source,{'offset':'2'}),
  'oversized_offset':(source,{'offset':'1024'}),
 }
 for name,(text,options) in cases.items():
  result,_=compile(name,text,**options);assert result.returncode,(name,result.stderr)
  if name not in ('unaligned_offset','oversized_offset'):assert 'Thumb PC handoff' in result.stderr,(name,result.stderr)
 for base in (0x08001000,0x03002000):
  for displacement in (12,8,13,14,16):
   script=out/'placement.ld';elf=out/'placement.elf'
   script.write_text('SECTIONS { . = '+hex(base)+'; __start = .; .text : { *(.text) } __end = .; SoundMainRAM_SampleEntry = '+hex(base+displacement)+'; ASSERT((__start & 3) == 0 && __end - __start == 12 && SoundMainRAM_SampleEntry == (((__start + 6 + 4) & ~3) + 4) && (SoundMainRAM_SampleEntry & 3) == 0, "handoff address contract") }')
   result=subprocess.run(['arm-none-eabi-ld','-T',str(script),'--entry=SoundMainRAM_SampleHandoffCandidate',str(out/'positive.o'),'-o',str(elf)],capture_output=True,text=True)
   if displacement==12:assert not result.returncode,result.stderr
   else:assert result.returncode and 'handoff address contract' in result.stderr,result.stderr
 result,obj=compile('plain',plain,False);assert not result.returncode,result.stderr
 original=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and original==obj.read_bytes(),result.stderr
 print('Private handoff accepted; 13 unsupported configurations and eight wrong link placements rejected; two correct placements accepted; unannotated object unchanged.')
if __name__=='__main__':main()
