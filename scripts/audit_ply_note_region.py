#!/usr/bin/env python3
"""Verify C ownership of the complete 502-byte ply_note instruction region."""
import json
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[1]

def main():
    linked=json.loads(subprocess.check_output(['python3','scripts/audit_linked_code.py'],cwd=ROOT,text=True))
    own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
    assert linked['elf_sha256']==own['elf_sha256']
    owners={v['object'] for v in own['objects'] if v['category']=='c_owned'}
    start,end=0x080cfe44,0x080d003a
    cursor=start
    regions=[]
    totals={}
    for region in linked['regions']:
        if region['end']<=start or region['start']>=end:
            continue
        assert region['start']==cursor and region['end']<=end,region
        assert region['kind']=='thumb' and region['object'] in owners and region['object'].startswith('src/m4a_ply_note_'),region
        totals[region['object']]=totals.get(region['object'],0)+region['end']-cursor
        regions.append(region)
        cursor=region['end']
    assert cursor==end and sum(totals.values())==502,(cursor,totals)
    data_regions=[v for v in linked['regions'] if v['end']>end and v['start']<end+10]
    data_cursor=end
    for region in data_regions:
        assert region['start']==data_cursor and region['end']<=end+10,region
        assert region['kind']=='data' and region['object']=='src/m4a_1.o',region
        data_cursor=region['end']
    assert data_cursor==end+10
    report=dict(assembly_data_bytes=10,start=hex(start),end=hex(end),c_owned_instruction_bytes=end-start,objects=totals,
                elf_sha256=linked['elf_sha256'],regions=regions,
                scope='All mapped ply_note instructions belong to C-owned objects. Ten padding/literal bytes follow in assembly data. This verifies instruction ownership, not independent full-note behavior or whole-game completion.')
    (ROOT/'docs/ply-note-code-region.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='regions'},indent=2))

if __name__=='__main__':
    main()
