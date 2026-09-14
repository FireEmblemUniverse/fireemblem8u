#!/usr/bin/env python3
"""Identify exact duplicate prefix of the previously unclassified tail block."""
import hashlib,json,subprocess
from pathlib import Path
from audit_linked_code import read_contributions,read_mappings,partition
ROOT=Path(__file__).resolve().parents[1]
rom=(ROOT/'fireemblem8.gba').read_bytes();source=0x08b15740;target=0x08b1fe7c;size=0xa788;base=0x08000000
length=0
while length<size and rom[source-base+length]==rom[target-base+length]:length+=1
assert length==40952
symboltext=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True)
regions=partition(read_contributions((ROOT/'fireemblem8.map').read_text()),read_mappings(symboltext));pieces=[]
for region in regions:
 a=max(source,region['start']);b=min(source+length,region['end'])
 if a<b:pieces.append(dict(source_start=hex(a),duplicate_start=hex(target+a-source),bytes=b-a,source_mapping=region['kind'],source_owner=region['object']))
assert sum(x['bytes'] for x in pieces)==length
symbols=[]
for line in symboltext.splitlines():
 f=line.split()
 if len(f)>=8 and f[3]=='FUNC' and source<=int(f[1],16)&~1<source+length:
  a=int(f[1],16)&~1;symbols.append(dict(name=f[-1],source=hex(a),duplicate=hex(target+a-source),bytes=int(f[2])))
report=dict(scope='Exact duplicated bytes and original linked ownership, not proof the duplicate is reached. The duplicate contains embedded-payload bytes and must not be classified nonexecutable solely from its u8 array declaration. Remaining suffix differs and needs separate analysis.',source=hex(source),duplicate=hex(target),block_bytes=size,exact_prefix_bytes=length,remaining_suffix_bytes=size-length,rom_sha256=hashlib.sha256(rom).hexdigest(),pieces=pieces,declared_main_elf_functions_in_source=symbols)
(ROOT/'docs/orphan-duplicate.json').write_text(json.dumps(report,indent=2)+'\n');print(length,'duplicate bytes;',size-length,'suffix bytes; owners:',sorted({x['source_owner'] for x in pieces}))
