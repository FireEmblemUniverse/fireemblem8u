#!/usr/bin/env python3
"""Resolve archive relocations and locate sample-byte pointer coincidences."""
import hashlib,json,re,subprocess
from pathlib import Path
from audit_linked_code import read_contributions
ROOT=Path(__file__).resolve().parents[1]
receipt=ROOT/'docs/function-pointer-relocations.json';prior=json.loads(receipt.read_text())
rows=prior['unconfirmed_candidates'];contributions=read_contributions((ROOT/'fireemblem8.map').read_text())
rom=(ROOT/'fireemblem8.gba').read_bytes()
frontier=json.loads((ROOT/'docs/function-pointer-frontier.json').read_text());assert hashlib.sha256(rom).hexdigest()==frontier['rom_sha256']
resolved=[]
for archive in sorted({r['owner'].split('(')[0] for r in rows if '.a(' in r['owner']}):
 output=subprocess.check_output(['arm-none-eabi-readelf','-rW',archive],cwd=ROOT,text=True)
 obj=section=None
 for line in output.splitlines():
  if line.startswith('File: '):obj=line[6:];continue
  m=re.match(r"Relocation section '([^']+)'",line)
  if m:section=m[1];continue
  f=line.split()
  if len(f)<5 or f[2]!='R_ARM_ABS32':continue
  offset=int(f[0],16)
  owners=[c for c in contributions if c['object']==obj and c['section']==section.removeprefix('.rel') and offset+4<=c['end']-c['start']]
  if len(owners)!=1:continue
  address=owners[0]['start']+offset
  for row in rows:
   if row['owner']==obj and int(row['address'],16)==address and f[4] in row['functions']:
    resolved.append(dict(**row,classification='named_archive_function_reference',relocation_symbol=f[4]))
samples=json.loads((ROOT/'docs/sound-sample-data.json').read_text())
for row in rows:
 if row['owner']!='sound/direct_sound_data.o':continue
 address=int(row['address'],16)
 matches=[s for s in samples['records_detail'] if int(s['address'],16)+16<=address and address+4<=int(s['address'],16)+s['bytes']]
 assert len(matches)==1,row
 sample=matches[0];data=(ROOT/sample['source']).read_bytes();assert hashlib.sha256(data).hexdigest()==sample['sha256']
 offset=address-int(sample['address'],16)
 assert data[offset:offset+4]==rom[address-0x08000000:address-0x08000000+4]
 resolved.append(dict(**row,classification='sample_payload_bytes_equal_function_address',sample=sample['symbol'],source=sample['source'],sample_offset=offset-16))
keys={(r['owner'],r['address']) for r in resolved};assert len(keys)==len(resolved)
remaining=[r for r in rows if (r['owner'],r['address']) not in keys]
report=dict(scope='Archive named relocations establish reference provenance. Sample matches are located inside verified PCM payloads, not headers or padding; their value alone does not establish pointer use or exclude arbitrary execution. Other candidates and computed/untyped targets remain open.',archive_references=sum(r['classification']=='named_archive_function_reference' for r in resolved),sample_payload_matches=sum(r['classification']=='sample_payload_bytes_equal_function_address' for r in resolved),remaining=len(remaining),prior_receipt_sha256=hashlib.sha256(receipt.read_bytes()).hexdigest(),resolved=resolved,remaining_candidates=remaining)
(ROOT/'docs/function-pointer-residuals.json').write_text(json.dumps(report,indent=2)+'\n');print(report['archive_references'],'archive references;',report['sample_payload_matches'],'PCM matches;',len(remaining),'remaining')
