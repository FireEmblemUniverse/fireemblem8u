#!/usr/bin/env python3
"""Find exact copies of declared function bytes in noninstruction ROM regions."""
from bisect import bisect_right
from collections import defaultdict
import hashlib,json,subprocess
from pathlib import Path
from audit_linked_code import read_contributions,read_mappings,partition
ROOT=Path(__file__).resolve().parents[1]
rom=(ROOT/'fireemblem8.gba').read_bytes();base=0x08000000
text=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True)
regions=partition(read_contributions((ROOT/'fireemblem8.map').read_text()),read_mappings(text));starts=[x['start'] for x in regions]
anchors=defaultdict(list);functions=0
for line in text.splitlines():
 f=line.split()
 if len(f)<8 or f[3]!='FUNC' or f[6] in ('UND','ABS'):continue
 address=int(f[1],16)&~1;size=int(f[2])
 if not base<=address<base+len(rom) or size<32:continue
 data=rom[address-base:address-base+size]
 if len(data)!=size:continue
 anchors[data[:32]].append((address,size,f[-1],bool(int(f[1],16)&1)));functions+=1
matches=[]
for region in regions:
 if region['kind'] in ('arm','thumb'):continue
 for address in range((region['start']+1)&~1,region['end']-31,2):
  candidates=anchors.get(rom[address-base:address-base+32])
  if not candidates:continue
  for original,size,name,thumb in candidates:
   if address==original or (not thumb and address%4):continue
   if address+size>region['end']:continue
   if rom[address-base:address-base+size]!=rom[original-base:original-base+size]:continue
   matches.append(dict(function=name,source=hex(original),duplicate=hex(address),bytes=size,thumb=thumb,owner=region['object'],mapping=region['kind']))
assert any(x['function']=='sio_polling' and x['duplicate']=='0x8b248d4' for x in matches)
report=dict(scope='Exact whole-function copies at halfword-aligned locations contained in a single mapped-data/unmapped input region. Functions below 32 bytes, modified/relocated copies, compressed code, region-spanning copies and ROM gaps are excluded. Exact equality indicates code-like content, not execution or independent decompilation.',rom_sha256=hashlib.sha256(rom).hexdigest(),functions_scanned=functions,matches=len(matches),owners=sorted({x['owner'] for x in matches}),records=matches)
(ROOT/'docs/code-duplicate-frontier.json').write_text(json.dumps(report,indent=2)+'\n');print(functions,'functions scanned;',len(matches),'exact copies;',report['owners'])
