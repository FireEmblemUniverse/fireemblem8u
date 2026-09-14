#!/usr/bin/env python3
"""Verify C ownership of the complete 16-byte multiply-high interworking routine."""
import json
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[1]

def main():
    linked=json.loads(subprocess.check_output(['python3','scripts/audit_linked_code.py'],cwd=ROOT,text=True))
    own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
    assert linked['elf_sha256']==own['elf_sha256']
    owners={v['object'] for v in own['objects'] if v['category']=='c_owned'}
    expected={'src/m4a_multiply_entry.o':4,'src/m4a_multiply_high.o':12}
    start,end=0x080cf4b8,0x080cf4c8
    cursor=start
    regions=[]
    totals={}
    for region in linked['regions']:
        if region['end']<=start or region['start']>=end:
            continue
        assert region['start']==cursor and region['end']<=end,region
        assert region['kind']==('thumb' if region['object']=='src/m4a_multiply_entry.o' else 'arm') and region['object'] in owners,region
        totals[region['object']]=totals.get(region['object'],0)+region['end']-cursor
        regions.append(region)
        cursor=region['end']
    assert cursor==end and totals==expected,(cursor,totals)
    assert not any(v['kind'] in ('arm','thumb') and v['object']=='src/m4a_1.o' for v in linked['regions'])
    report=dict(m4a_1_assembly_instruction_bytes=0,start=hex(start),end=hex(end),c_owned_instruction_bytes=end-start,objects=totals,
                elf_sha256=linked['elf_sha256'],regions=regions,
                scope='All mapped multiply-high entry/body instructions belong to C-owned objects. m4a_1.o has no mapped instructions. This is not proof of whole-game completion.')
    (ROOT/'docs/multiply-code-region.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='regions'},indent=2))

if __name__=='__main__':
    main()
