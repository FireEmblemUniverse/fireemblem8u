#!/usr/bin/env python3
"""Prove contiguous C ownership of the complete copied mixer in the current ELF."""
import argparse,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--json',type=Path,default=ROOT/'docs/mixer-code-region.json');a=p.parse_args()
 linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],cwd=ROOT,text=True))
 own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom'];assert linked['elf_sha256']==own['elf_sha256'],'Refresh code ownership first'
 owners={v['object'] for v in own['objects'] if v['category']=='c_owned'}
 symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
 start=symbols['SoundMainRAM']&~1;end=symbols['SoundMainRAM_End'];assert start==0x80cf54c and end-start==932
 cursor=start;regions=[];totals={}
 for r in linked['regions']:
  if r['end']<=start or r['start']>=end:continue
  assert r['start']==cursor and r['end']<=end,(cursor,r)
  assert r['object'] in owners,r
  totals[r['kind']]=totals.get(r['kind'],0)+r['end']-r['start'];regions.append(dict(start=hex(r['start']),end=hex(r['end']),kind=r['kind'],object=r['object']));cursor=r['end']
 assert cursor==end
 report=dict(start=hex(start),end=hex(end),section_bytes=end-start,bytes_by_kind=totals,all_regions_c_owned=True,elf_sha256=linked['elf_sha256'],regions=regions)
 a.json.write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k!='regions'},indent=2))
if __name__=='__main__':main()
