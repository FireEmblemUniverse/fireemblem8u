#!/usr/bin/env python3
"""Inventory aligned main-ROM words equal to declared function pointers."""
from bisect import bisect_right
from collections import Counter,defaultdict
import hashlib,json,struct,subprocess
from pathlib import Path
from audit_linked_code import read_contributions,read_mappings,partition
ROOT=Path(__file__).resolve().parents[1]
rom=(ROOT/'fireemblem8.gba').read_bytes();elf=ROOT/'fireemblem8.elf';maptext=(ROOT/'fireemblem8.map').read_text()
symboltext=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(elf)],text=True)
regions=partition(read_contributions(maptext),read_mappings(symboltext));starts=[r['start'] for r in regions]
def owner(address):
 i=bisect_right(starts,address)-1
 return regions[i] if i>=0 and address<regions[i]['end'] else None
functions=defaultdict(list)
for line in symboltext.splitlines():
 f=line.split()
 if len(f)<8 or f[3]!='FUNC' or f[6] in ('ABS','UND'):continue
 pointer=int(f[1],16);address=pointer&~1
 if not 0x08000000<=address<0x09000000:continue
 region=owner(address)
 assert region and region['kind']==('thumb' if pointer&1 else 'arm'),f
 functions[pointer].append(f[-1])
rows=[];counts=Counter();targets=set()
for offset,(value,) in enumerate(struct.iter_unpack('<I',rom)):
 if value not in functions:continue
 address=0x08000000+offset*4;region=owner(address)
 if region and region['kind'] in ('arm','thumb'):continue
 # Require the entire pointer word to stay in its noninstruction region.
 if region:assert address+4<=region['end'],hex(address)
 target=owner(value&~1)
 key=region['object'] if region else '<outside-input>'
 rows.append(dict(address=hex(address),owner=key,mapping=region['kind'] if region else 'outside_input',pointer=hex(value),functions=sorted(functions[value]),target_owner=target['object']))
 counts[key]+=1;targets.add(value)
report=dict(scope='Candidate inventory only: aligned words outside instruction-mapped regions that exactly equal a declared main-ROM FUNC pointer, preserving the Thumb bit. Coincidental matches are possible. Excludes instruction immediates, unaligned/interior/untyped targets, RAM targets, compressed pointers and computed dispatch; does not establish reachability or complete executable classification.',candidate_words=len(rows),distinct_targets=len(targets),source_owners=len(counts),rom_sha256=hashlib.sha256(rom).hexdigest(),elf_sha256=hashlib.sha256(elf.read_bytes()).hexdigest(),map_sha256=hashlib.sha256(maptext.encode()).hexdigest(),owners=[dict(object=k,candidates=v) for k,v in counts.most_common()],candidates=rows)
(ROOT/'docs/function-pointer-frontier.json').write_text(json.dumps(report,indent=2)+'\n')
lines=['# Function-pointer review frontier','','Aligned noninstruction ROM words equal to declared function pointers. These are candidates, not proven callback references.','',f'{len(rows):,} candidate words; {len(targets):,} distinct targets; {len(counts):,} source owners.','','| Source owner | Candidate words |','|---|---:|']
lines += [f'| `{k}` | {v:,} |' for k,v in counts.most_common(30)]
(ROOT/'docs/function-pointer-frontier.md').write_text('\n'.join(lines)+'\n')
print(len(rows),'candidate words;',len(targets),'targets;',len(counts),'owners')
print(json.dumps(counts.most_common(10)))
