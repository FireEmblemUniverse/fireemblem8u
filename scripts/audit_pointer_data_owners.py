#!/usr/bin/env python3
"""Locate residual address matches within source data records/assets."""
import hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
prior=ROOT/'docs/function-pointer-residuals.json';rows=json.loads(prior.read_text())['remaining_candidates'];rom=(ROOT/'fireemblem8.gba').read_bytes()
frontier=json.loads((ROOT/'docs/function-pointer-frontier.json').read_text());assert hashlib.sha256(rom).hexdigest()==frontier['rom_sha256']
symbols=[]
for line in subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True).splitlines():
 f=line.split()
 if len(f)==4:symbols.append((int(f[0],16),int(f[1],16),f[3]))
assets=json.loads((ROOT/'docs/banim-data-classification.json').read_text())['assets'];result=[]
for row in rows:
 a=int(row['address'],16);matches=[(n,a-b) for b,z,n in symbols if z and b<=a and a+4<=b+z]
 item=dict(**row,containing_symbols=[dict(name=n,offset=hex(o)) for n,o in matches],classification='needs_data_provenance')
 if row['owner']=='banim/data_banim.o':
  found=[x for x in assets if int(x['start'],16)<=a and a+4<=int(x['start'],16)+x['bytes']];assert len(found)==1
  asset=found[0];data=(ROOT/asset['path']).read_bytes();assert hashlib.sha256(data).hexdigest()==asset['sha256']
  off=a-int(asset['start'],16);assert data[off:off+4]==rom[a-0x08000000:a-0x08000000+4]
  item.update(classification='verified_animation_asset_bytes',asset=asset['path'],asset_kind=asset['kind'],asset_offset=off)
 if row['owner']=='src/events_udefs.o':
  assert len(matches)==1
  name,offset=matches[0];field=offset%20;assert field in (0,4)
  item.update(classification='unit_definition_scalar_fields',unit_record=offset//20,record_offset=field,field_group='character/class/leader/level flags' if field==0 else 'position/spawn flags/extra data/reda count')
 if item['classification']=='needs_data_provenance' and len(matches)==1:
  name,offset=matches[0];source=ROOT/Path(row['owner']).with_suffix('.c')
  if source.is_file():
   declaration=re.search(r'\b'+re.escape(name)+r'\s*\[[^]]*\]\s*=\s*INCBIN_U(?:8|16|32)\("([^"\n]+)"\)',source.read_text())
   if declaration:
    path=declaration[1];data=(ROOT/path).read_bytes()
    start=a-offset
    extents=[z for b,z,n in symbols if b==start and n==name];assert extents==[len(data)],name
    assert rom[start-0x08000000:start-0x08000000+len(data)]==data,name
    item.update(classification='verified_incbin_asset_bytes',asset=path,asset_offset=offset,asset_sha256=hashlib.sha256(data).hexdigest())
 result.append(item)
remaining=[x for x in result if x['classification']=='needs_data_provenance']
report=dict(scope='Source-data ownership, not reachability. Unit-definition matches are in scalar fields (not the redas pointer). Animation asset bytes match their hashed source. Other containing symbols are locators only; no inference of nonexecution from symbol names.',classified=len(result)-len(remaining),remaining=len(remaining),prior_sha256=hashlib.sha256(prior.read_bytes()).hexdigest(),unit_header_sha256=hashlib.sha256((ROOT/'include/bmunit.h').read_bytes()).hexdigest(),records=result)
(ROOT/'docs/function-pointer-data-owners.json').write_text(json.dumps(report,indent=2)+'\n');print(report['classified'],'data matches classified;',len(remaining),'still require provenance')
