#!/usr/bin/env python3
"""Partition every ROM byte while retaining unresolved execution classification."""
from collections import Counter
import hashlib,json,subprocess
from pathlib import Path
from audit_linked_code import read_contributions,read_mappings,partition
ROOT=Path(__file__).resolve().parents[1];base=0x08000000
rom=(ROOT/'fireemblem8.gba').read_bytes();end=base+len(rom)
maptext=(ROOT/'fireemblem8.map').read_text();symboltext=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True)
regions=partition(read_contributions(maptext),read_mappings(symboltext))
padding=json.loads((ROOT/'docs/rom-padding.json').read_text())
for row in padding['regions']:
 assert hashlib.sha256(rom[row['start']-base:row['end']-base]).hexdigest()==row['sha256']
 regions.append(dict(start=row['start'],end=row['end'],kind='verified_fill',object='<generated-fill>'))
regions.sort(key=lambda x:x['start']);cursor=base
for row in regions:assert row['start']==cursor,(hex(cursor),row);cursor=row['end']
assert cursor==end
copy=json.loads((ROOT/'docs/duplicate-executable-content.json').read_text());assert copy['rom_sha256']==hashlib.sha256(rom).hexdigest()
overlays=[]
for row in copy['native_regions']:
 start=int(row['duplicate'],16);overlays.append(dict(start=start,end=start+row['bytes'],kind='copied_native_instructions',source_object=row['source_object']))
compressed=copy['compressed_payload']
for key in ('source','duplicate'):
 start=int(compressed[key],16);overlays.append(dict(start=start,end=start+compressed['bytes'],kind='known_compressed_payload',source_object=compressed['source_image']))
overlays.sort(key=lambda x:x['start'])
for a,b in zip(overlays,overlays[1:]):assert a['end']<=b['start']
ledger=[];totals=Counter()
for region in regions:
 cuts=sorted({region['start'],region['end']}|{x for o in overlays for x in (o['start'],o['end']) if region['start']<x<region['end']})
 for a,b in zip(cuts,cuts[1:]):
  active=[o for o in overlays if o['start']<=a and b<=o['end']];assert len(active)<=1
  kind='mapped_native_instructions' if region['kind'] in ('arm','thumb') else 'verified_fill' if region['kind']=='verified_fill' else 'input_data_execution_classification_open'
  if active:
   assert kind=='input_data_execution_classification_open'
   kind=active[0]['kind']
  totals[kind]+=b-a
  ledger.append(dict(start=hex(a),end=hex(b),bytes=b-a,classification=kind,owner=region['object'],original_mapping=region['kind'],evidence_source=active[0]['source_object'] if active else None))
assert sum(totals.values())==len(rom)
assert totals['copied_native_instructions']==200 and totals['known_compressed_payload']==2*21452
report=dict(scope='Complete physical-byte partition, not a completed executable denominator. Mapping, known copied instructions, known compressed payloads and verified fill are explicit. Remaining input data retains open execution classification; existing asset provenance is not silently treated as proof of nonexecution. Expanded payload instruction totals are separate from ROM storage bytes.',rom_sha256=hashlib.sha256(rom).hexdigest(),elf_sha256=hashlib.sha256((ROOT/'fireemblem8.elf').read_bytes()).hexdigest(),map_sha256=hashlib.sha256(maptext.encode()).hexdigest(),padding_receipt_sha256=hashlib.sha256((ROOT/'docs/rom-padding.json').read_bytes()).hexdigest(),duplicate_receipt_sha256=hashlib.sha256((ROOT/'docs/duplicate-executable-content.json').read_bytes()).hexdigest(),rom_bytes=len(rom),categories=dict(totals),ranges=ledger)
(ROOT/'docs/rom-coverage-ledger.json').write_text(json.dumps(report,indent=2)+'\n')
lines=['# ROM coverage ledger','','Every ROM byte belongs to exactly one row category. This is not overall decompilation completion.','','| Classification | Physical bytes |','|---|---:|']+[f'| {k} | {v:,} |' for k,v in totals.items()]
lines+=['',f'Total: {len(rom):,} bytes. Expanded payload instructions are accounted for separately.','']
(ROOT/'docs/rom-coverage-ledger.md').write_text('\n'.join(lines));print(dict(totals))
