#!/usr/bin/env python3
"""Cross-check sample-symbol relocations in all directly linked object files."""
from concurrent.futures import ThreadPoolExecutor
import hashlib,json,re,struct,subprocess
from pathlib import Path
from audit_linked_code import read_contributions
ROOT=Path(__file__).resolve().parents[1]
maptext=(ROOT/'fireemblem8.map').read_text();contributions=read_contributions(maptext)
objects=sorted(set(line.split()[1] for line in maptext.splitlines() if line.startswith('LOAD ') and line.endswith('.o')))
assert objects and all((ROOT/p).is_file() for p in objects)
samples=json.loads((ROOT/'docs/sound-sample-data.json').read_text())
symbols={x['symbol'] for x in samples['records_detail']}
refs=json.loads((ROOT/'docs/sound-sample-references.json').read_text())
expected={(str(Path(x['source']).with_suffix('.o')),int(x['address'],16)+4,x['sample']) for x in refs['records']}
def inspect(obj):
 output=subprocess.check_output(['arm-none-eabi-readelf','-rW',str(ROOT/obj)],text=True)
 section=None;rows=[]
 for line in output.splitlines():
  header=re.match(r"Relocation section '([^']+)'",line)
  if header:section=header[1];continue
  fields=line.split()
  if len(fields)<5 or fields[4] not in symbols:continue
  offset=int(fields[0],16);kind=fields[2];symbol=fields[4]
  target_section=section.removeprefix('.rel')
  owners=[x for x in contributions if x['object']==obj and x['section']==target_section and offset<x['end']-x['start']]
  address=owners[0]['start']+offset if len(owners)==1 else None
  verified=kind=='R_ARM_ABS32' and (obj,address,symbol) in expected
  rows.append(dict(object=obj,relocation_section=section,offset=hex(offset),type=kind,sample=symbol,linked_address=hex(address) if address is not None else None,verified_instrument_pointer=verified))
 return rows
with ThreadPoolExecutor(max_workers=8) as pool:rows=[row for result in pool.map(inspect,objects) for row in result]
matched={(x['object'],int(x['linked_address'],16),x['sample']) for x in rows if x['verified_instrument_pointer']}
missing=expected-matched;unexpected=[x for x in rows if not x['verified_instrument_pointer']]
# Independent ROM scan also catches literal numeric and section-relative pointers
# to exact sample starts. Interior pointers and computed references remain open.
rom=(ROOT/'fireemblem8.gba').read_bytes()
starts={int(x['address'],16):x['symbol'] for x in samples['records_detail']}
expected_addresses={address for obj,address,symbol in expected}
raw=[]
for offset,(value,) in enumerate(struct.iter_unpack('<I',rom)):
 if value in starts:
  address=0x08000000+offset*4
  raw.append(dict(address=hex(address),sample=starts[value],verified_instrument_pointer=address in expected_addresses))
raw_unexpected=[x for x in raw if not x['verified_instrument_pointer']]
assert expected_addresses <= {int(x['address'],16) for x in raw}

report=dict(scope='All directly linked main-ROM .o files scanned for relocations explicitly naming audited sample symbols. A separate whole-ROM aligned-word scan checks exact sample-start addresses, including numeric and section-relative origins. Unaligned pointers, interior pointers, computed pointers and indirect control flow are not covered; named-relocation scanning excludes runtime archives and unlinked objects.',rom_sha256=hashlib.sha256(rom).hexdigest(),aligned_exact_sample_start_words=len(raw),other_aligned_exact_sample_start_words=raw_unexpected,direct_objects_scanned=len(objects),sample_relocations=len(rows),verified_instrument_pointers=len(matched),missing_expected=[list(x) for x in sorted(missing)],other_named_sample_relocations=unexpected,map_sha256=hashlib.sha256(maptext.encode()).hexdigest(),reference_receipt_sha256=hashlib.sha256((ROOT/'docs/sound-sample-references.json').read_bytes()).hexdigest(),objects=objects,relocations=rows)
(ROOT/'docs/sound-relocations.json').write_text(json.dumps(report,indent=2)+'\n')
assert not missing,missing
print('Aligned ROM words pointing at sample starts:',len(raw),'; outside instruments:',len(raw_unexpected))
print(len(objects),'objects scanned;',len(rows),'named sample relocations;',len(unexpected),'outside verified instrument pointers')
