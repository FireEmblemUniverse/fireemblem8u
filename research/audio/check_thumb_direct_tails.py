#!/usr/bin/env python3
"""Check private direct-tail contracts and preserve unannotated compilation."""
import argparse,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-channel-gate-direct/guards';out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'research/audio/mplay_channel_gate.c').read_text()
 base=['-DMATCH_DECREMENT_STORE','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),
       '-fplugin-arg-tail_transfer-destination=MPlayMainChannelClear','-fplugin-arg-tail_transfer-destination=MPlayMainChannelNext',
       '-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches',
       '-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_store_decrement_zero.so')]
 direct=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_direct_tails.so'),
         '-fplugin-arg-thumb_direct_tails-destination=MPlayMainChannelClear',
         '-fplugin-arg-thumb_direct_tails-destination=MPlayMainChannelNext',
         '-fplugin-arg-thumb_direct_tails-expected-transfers=3']
 def compile(text,options):
  src=out/'probe.c';obj=out/'probe.o';src.write_text(text)
  r=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(src),'-o',str(obj)]+base+options,capture_output=True,text=True)
  return r,obj.read_bytes() if not r.returncode else None
 r,plain=compile(source,[]);assert not r.returncode,r.stderr
 r,unannotated=compile(source,direct);assert not r.returncode and unannotated==plain,r.stderr
 enabled=['-DMATCH_DIRECT_TAILS']+direct
 r,matched=compile(source,enabled);assert not r.returncode and matched!=plain,r.stderr
 configs=[]
 for value in ('0','2','4','101','nonsense'):
  configs.append(direct[:-1]+['-fplugin-arg-thumb_direct_tails-expected-transfers='+value])
 configs += [direct+[direct[1]],direct+[direct[-1]],direct[:1]+direct[2:],direct[:2]+direct[3:]]
 for opts in configs:
  r,_=compile(source,['-DMATCH_DIRECT_TAILS']+opts);assert r.returncode,r.stderr
 bad=[source.replace('channelWork & channelStatus','channelWork ^ channelStatus'),
      source.replace('if (channelWork) {','if (channelWork > 2) {'),
      source.replace('__attribute__((matching_tail_transfer))','')]
 for text in bad:
  r,_=compile(text,enabled);assert r.returncode,r.stderr
 report=dict(rejected_configurations=len(configs),rejected_source_forms=len(bad),unannotated_unchanged=True)
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
