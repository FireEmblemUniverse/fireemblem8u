#!/usr/bin/env python3
"""Guard opt-in unsigned <= bound raising without changing unrelated comparisons."""
import argparse,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-tempo/guards';out.mkdir(exist_ok=True)
 source=(ROOT/'research/audio/mplay_tempo_gate.c').read_text()
 base=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainTickLoop','-fplugin-arg-tail_transfer-destination=MPlayMainPostTick','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostTick']
 flag='-fplugin-arg-tail_transfer-raise-unsigned-le-bound'
 def compile(text,extra=base):
  src=out/'probe.c';asm=out/'probe.s';src.write_text(text)
  r=subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(src),'-o',str(asm)]+extra,capture_output=True,text=True)
  return r,asm.read_bytes() if not r.returncode else None
 r,original=compile(source);assert not r.returncode,r.stderr
 r,raised=compile(source,base+[flag]);assert not r.returncode and raised!=original,r.stderr
 for text in [source.replace('gateTempo >= 150','(int)gateTempo >= 150'),source.replace('gateTempo >= 150','gateTempo >= 256')]:
  r,original=compile(text);assert not r.returncode,r.stderr
  r,raised=compile(text,base+[flag]);assert not r.returncode and raised==original,r.stderr
 for extra in [base+[flag,flag],base+[flag+'=1'],base+[flag,'-fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostTick']]:
  r,_=compile(source,extra);assert r.returncode,r.stderr
 plain=source.replace('__attribute__((matching_tail_transfer))','');r,original=compile(plain,[]);assert not r.returncode,r.stderr
 r,raised=compile(plain,base+[flag]);assert not r.returncode and raised==original,r.stderr
 print('Unsigned LE bound changes only the opted-in eligible comparison; signed/large bounds and unannotated code unchanged; three invalid configurations rejected.')
if __name__=='__main__':main()
