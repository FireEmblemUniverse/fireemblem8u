#!/usr/bin/env python3
"""Inventory noninstruction input regions and check declared function entries."""
from collections import Counter
from bisect import bisect_right
import hashlib,json,subprocess
from pathlib import Path
from audit_linked_code import read_contributions,read_mappings,partition
ROOT=Path(__file__).resolve().parents[1]
images={}
targets=[('main_rom',ROOT,'fireemblem8',0x08000000,0x1000000)]
for name in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
 targets.append((name,ROOT/'mgfembp',name,0x02010000,(ROOT/f'mgfembp/{name}.bin').stat().st_size))
for name,root,stem,base,size in targets:
 elf=root/(stem+'.elf');mapfile=root/(stem+'.map')
 symbols=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(elf)],text=True)
 regions=partition(read_contributions(mapfile.read_text(),base,base+size),read_mappings(symbols,base,base+size))
 starts=[x['start'] for x in regions];owners={};entries=[];outside=[];counts=Counter()
 for region in regions:
  if region['kind'] not in ('data','unmapped'):continue
  counts[region['kind']]+=region['size']
  row=owners.setdefault(region['object'],dict(object=region['object'],data_bytes=0,unmapped_bytes=0,regions=0,sections=set()))
  row[region['kind']+'_bytes']+=region['size'];row['regions']+=1;row['sections'].add(region['section'])
 for line in symbols.splitlines():
  f=line.split()
  if len(f)<8 or f[3]!='FUNC' or f[6] in ('UND','ABS'):continue
  raw=int(f[1],16);address=raw&~1
  if not base<=address<base+size:continue
  index=bisect_right(starts,address)-1
  kind=regions[index]['kind'] if index>=0 and address<regions[index]['end'] else 'outside_input'
  item=dict(name=f[-1],address=hex(address),thumb=bool(raw&1),size=int(f[2]),entry_mapping=kind)
  entries.append(item)
  if kind not in ('arm','thumb'):outside.append(item)
 for row in owners.values():row['sections']=sorted(row['sections'])
 images[name]=dict(elf_sha256=hashlib.sha256(elf.read_bytes()).hexdigest(),map_sha256=hashlib.sha256(mapfile.read_bytes()).hexdigest(),noninstruction_input_bytes=dict(counts),declared_function_entries=len(entries),function_entries_without_instruction_mapping=outside,owners=sorted(owners.values(),key=lambda x:-(x['data_bytes']+x['unmapped_bytes'])))
report=dict(scope='Review frontier, not executable classification closure. Data/unmapped input bytes include literals, assets and possible embedded code. Declared FUNC starts are checked; untyped labels, indirect targets, relocated/compressed code and reachability remain open.',images=images)
(ROOT/'docs/executable-frontier.json').write_text(json.dumps(report,indent=2)+'\n')
lines=['# Executable classification review frontier','','These are review queues, not claims that the listed bytes are executable or nonexecutable.','']
for name,x in images.items():
 lines += [f'## {name}','',f"Declared function entries: {x['declared_function_entries']}; entries without instruction mappings: {len(x['function_entries_without_instruction_mapping'])}.",'','| Owner | Data-mapped bytes | Unmapped bytes |','|---|---:|---:|']
 for row in x['owners'][:25]:lines.append(f"| `{row['object']}` | {row['data_bytes']:,} | {row['unmapped_bytes']:,} |")
 lines+=['']
(ROOT/'docs/executable-frontier.md').write_text('\n'.join(lines)+'\n')
print(json.dumps({k:{n:v for n,v in x.items() if n!='owners'} for k,x in images.items()},indent=2))
