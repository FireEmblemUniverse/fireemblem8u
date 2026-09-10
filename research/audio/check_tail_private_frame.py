#!/usr/bin/env python3
"""Reject unsupported private-frame and pool-adjacent Thumb transfer forms."""
import argparse,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/tail-private-guards';out.mkdir(exist_ok=True)
 text=(ROOT/'src/m4a_deadline.c').read_text()
 flags=['-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
 plugin=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=SoundMainRAM_DeadlineContinue','-fplugin-arg-tail_transfer-destination=SoundMainRAM_DeadlineExit','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-raise-unsigned-bound','-fplugin-arg-tail_transfer-pool-adjacent-destination=SoundMainRAM_DeadlineContinue']
 tests=[('no_frame_contract',text,[],[x for x in plugin if not x.endswith('-private-frame64')]),
 ('wrong_destination',text,[],plugin[:-1]+['-fplugin-arg-tail_transfer-pool-adjacent-destination=unknown']),
 ('frame_read_bound',text.replace('deadlineFrame->deadline','((volatile u32 *)deadlineFrame)[16]'),[],plugin),
 ('frame_write_bound',text.replace('deadlineFrame->channelsRemaining','((volatile u32 *)deadlineFrame)[16]'),[],plugin),
 ('frame_byte',text.replace('deadlineFrame->deadline','((volatile u8 *)deadlineFrame)[20]'),[],plugin),
 ('escape_frame',text.replace('deadlineWave = deadlineChannel->wav;','deadlineWave = (struct WaveData *)deadlineFrame;'),[],plugin),
 ('sp_write',text.replace('deadlineWave = deadlineChannel->wav;','deadlineFrame++;'),[],plugin),
 ('executable_tie',text.replace('asm(""','asm("nop"'),[],plugin),
 ('untied_asm',text.replace('asm("" : "+r"(deadlineValue));','asm volatile("" ::: "memory");'),[],plugin),
 ('post_call',text.replace('SoundMainRAM_DeadlineContinue();','SoundMainRAM_DeadlineContinue(); deadlineValue++;'),[],plugin),
 ('missing_pool',text.replace('0x04000006','0x12'),[],plugin),
 ('arguments',text.replace('ChanLoop(void)','ChanLoop(u32 argument)'),[],plugin),
 ('local_frame',text.replace('deadlineWave = deadlineChannel->wav;','volatile u32 local=deadlineValue; deadlineWave=(struct WaveData *)local;'),[],plugin),
 ('reordered',text,['-freorder-blocks'],plugin),
 ('arm',text,['-marm'],plugin),('debug',text,['-g'],plugin),('unwind',text,['-funwind-tables'],plugin)]
 for name,source,extra,selected in tests:
  src=out/(name+'.c');src.write_text(source)
  result=subprocess.run([a.compiler]+flags+extra+selected+[str(src),'-o',str(src.with_suffix('.o'))],capture_output=True,text=True)
  assert result.returncode,(name,'unexpected acceptance')
  assert 'error:' in result.stderr and ('tail' in result.stderr or 'plugin' in result.stderr or 'pool' in result.stderr),(name,result.stderr)
 print(f'{len(tests)} unsupported private-frame/pool-adjacent contracts reject.')
if __name__=='__main__':main()
