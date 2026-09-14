#!/usr/bin/env python3
"""Verify the exact C-owned unit-list page transition, excluding literal data."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def main():
 linked=json.loads(subprocess.check_output(['python3','scripts/audit_linked_code.py'],cwd=ROOT,text=True))
 own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
 assert own['elf_sha256']==linked['elf_sha256']
 obj=next(x for x in own['objects'] if x['object']=='src/unitlistscreen.o')
 assert obj['category']=='c_owned'
 start,end=0x08091f10,0x080920c4;cursor=start;counts={'thumb':0,'data':0};regions=[]
 for r in linked['regions']:
  lo=max(start,r['start']);hi=min(end,r['end'])
  if lo>=hi:continue
  assert lo==cursor and r['object']==obj['object'] and r['kind'] in counts,r
  counts[r['kind']]+=hi-lo;cursor=hi;regions.append(dict(start=hex(lo),end=hex(hi),kind=r['kind']))
 assert cursor==end and counts=={'thumb':396,'data':40},counts
 base=(ROOT/'baserom.gba').read_bytes();rom=(ROOT/'fireemblem8.gba').read_bytes()
 assert hashlib.sha1(base).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert rom==base
 code=rom[start-0x08000000:end-0x08000000]
 report=dict(start=hex(start),end=hex(end),region_bytes=end-start,c_owned_instruction_bytes=counts['thumb'],literal_alignment_bytes=counts['data'],object=obj,elf_sha256=linked['elf_sha256'],region_sha256=hashlib.sha256(code).hexdigest(),full_rom_exact=True,regions=regions,scope='This routine contributes 396 newly C-owned instruction bytes. Its complete 18,458-byte object now has no instruction templates; the other instructions in that object were already C. Not whole-game completion.')
 (ROOT/'docs/unitlist-code-region.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
if __name__=='__main__':main()
