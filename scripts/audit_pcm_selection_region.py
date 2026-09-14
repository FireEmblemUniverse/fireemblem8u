#!/usr/bin/env python3
"""Verify C ownership of the complete 84-byte ply_note PCM selection region."""
import json
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parents[1]

def main():
    linked=json.loads(subprocess.check_output(['python3','scripts/audit_linked_code.py'],cwd=ROOT,text=True))
    own=json.loads((ROOT/'docs/code-ownership.json').read_text())['images']['main_rom']
    assert linked['elf_sha256']==own['elf_sha256']
    owners={v['object'] for v in own['objects'] if v['category']=='c_owned'}
    expected={'src/m4a_ply_note_pcm_setup.o':14,'src/m4a_ply_note_pcm_choose.o':58,'src/m4a_ply_note_pcm_advance.o':12}
    start,end=0x080cff30,0x080cff84
    cursor=start
    regions=[]
    totals={}
    for region in linked['regions']:
        if region['end']<=start or region['start']>=end:
            continue
        assert region['start']==cursor and region['end']<=end,region
        assert region['kind']=='thumb' and region['object'] in owners,region
        totals[region['object']]=totals.get(region['object'],0)+region['end']-cursor
        regions.append(region)
        cursor=region['end']
    assert cursor==end and totals==expected,(cursor,totals)
    report=dict(start=hex(start),end=hex(end),c_owned_instruction_bytes=end-start,objects=totals,
                elf_sha256=linked['elf_sha256'],regions=regions,
                scope='All mapped PCM selection instructions belong to C-owned objects; stops before channel attachment. Does not establish full ply_note behavior or whole-game completion.')
    (ROOT/'docs/pcm-selection-code-region.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='regions'},indent=2))

if __name__=='__main__':
    main()
