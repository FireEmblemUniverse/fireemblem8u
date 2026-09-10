#!/usr/bin/env python3
"""Prove contiguous C ownership of the complete SoundMain and copied mixer in the current ELF."""
import argparse,hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--json',type=Path,default=ROOT/'docs/soundmain-code-region.json');a=p.parse_args()
 linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],cwd=ROOT,text=True))
 own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom'];assert linked['elf_sha256']==own['elf_sha256'],'Refresh code ownership first'
 owners={v['object'] for v in own['objects'] if v['category']=='c_owned'}
 symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
 start=symbols['SoundMain']&~1;end=symbols['SoundMainRAM_End'];assert start==0x80cf4c8 and end-start==1064
 pool_object='src/m4a_entry_literals.o';pool_source=ROOT/'src/m4a_entry_literals.c'
 assert linked['objects'][pool_object]=={'data':24}
 assert symbols['gSoundMainEntryLiterals']==0x80cf534
 subprocess.run(['git','ls-files','--error-unmatch',str(pool_source.relative_to(ROOT))],cwd=ROOT,check=True,stdout=subprocess.DEVNULL)
 pool_seen=False
 cursor=start;regions=[];totals={}
 for r in linked['regions']:
  if r['end']<=start or r['start']>=end:continue
  assert r['start']==cursor and r['end']<=end,(cursor,r)
  if r['object']==pool_object:
   assert not pool_seen and r['kind']=='data' and r['start']==0x80cf534 and r['end']==0x80cf54c,r
   pool_seen=True
  else:assert r['object'] in owners,r
  totals[r['kind']]=totals.get(r['kind'],0)+r['end']-r['start'];regions.append(dict(start=hex(r['start']),end=hex(r['end']),kind=r['kind'],object=r['object']));cursor=r['end']
 assert cursor==end and pool_seen
 assert totals==dict(thumb=452,data=40,arm=572)
 report=dict(start=hex(start),end=hex(end),section_bytes=end-start,bytes_by_kind=totals,all_regions_from_c=True,data_only_c_object=dict(object=pool_object,source=str(pool_source.relative_to(ROOT)),source_sha256=hashlib.sha256(pool_source.read_bytes()).hexdigest(),object_sha256=hashlib.sha256((ROOT/pool_object).read_bytes()).hexdigest()),elf_sha256=linked['elf_sha256'],regions=regions)
 a.json.write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k!='regions'},indent=2))
if __name__=='__main__':main()
