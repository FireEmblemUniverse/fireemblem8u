#!/usr/bin/env python3
"""Cross-check pointer candidates against named ABS32 function relocations."""
from concurrent.futures import ThreadPoolExecutor
from collections import Counter
import hashlib,json,re,subprocess
from pathlib import Path
from audit_linked_code import read_contributions
ROOT=Path(__file__).resolve().parents[1]
receipt_path=ROOT/'docs/function-pointer-frontier.json';receipt=json.loads(receipt_path.read_text())
maptext=(ROOT/'fireemblem8.map').read_text();assert hashlib.sha256(maptext.encode()).hexdigest()==receipt['map_sha256']
assert hashlib.sha256((ROOT/'fireemblem8.gba').read_bytes()).hexdigest()==receipt['rom_sha256']
assert hashlib.sha256((ROOT/'fireemblem8.elf').read_bytes()).hexdigest()==receipt['elf_sha256']
contributions=read_contributions(maptext)
objects=sorted({r['owner'] for r in receipt['candidates'] if r['owner'].endswith('.o')})
expected={(x['owner'],int(x['address'],16)):x for x in receipt['candidates']}
def inspect(obj):
 output=subprocess.check_output(['arm-none-eabi-readelf','-rW',str(ROOT/obj)],text=True)
 section=None;matched=[]
 for line in output.splitlines():
  header=re.match(r"Relocation section '([^']+)'",line)
  if header:section=header[1];continue
  f=line.split()
  if len(f)<5 or f[2]!='R_ARM_ABS32':continue
  offset=int(f[0],16)
  owner=[c for c in contributions if c['object']==obj and c['section']==section.removeprefix('.rel') and offset+4<=c['end']-c['start']]
  if len(owner)!=1:continue
  address=owner[0]['start']+offset;candidate=expected.get((obj,address))
  if candidate and f[4] in candidate['functions']:
   matched.append((obj,address,f[4]))
 return matched
with ThreadPoolExecutor(max_workers=8) as pool:
 matches=[row for batch in pool.map(inspect,objects) for row in batch]
keys={(obj,address) for obj,address,name in matches}
assert len(keys)==len(matches)
unconfirmed=[r for r in receipt['candidates'] if (r['owner'],int(r['address'],16)) not in keys]
counts=Counter(x['owner'] for x in unconfirmed)
report=dict(scope='Named R_ARM_ABS32 relocations at exact candidate locations confirm explicit symbol references. Final ROM words already equal the corresponding FUNC pointer. Unconfirmed includes section-relative/local relocations, archive members and possible coincidences; not proof they are invalid. This is reference provenance, not reachability or callback behavior.',objects_scanned=len(objects),candidates=receipt['candidate_words'],confirmed_named_function_references=len(matches),unconfirmed=len(unconfirmed),unconfirmed_owners=dict(counts.most_common()),frontier_sha256=hashlib.sha256(receipt_path.read_bytes()).hexdigest(),confirmed=[dict(object=o,address=hex(a),symbol=n) for o,a,n in matches],unconfirmed_candidates=unconfirmed)
(ROOT/'docs/function-pointer-relocations.json').write_text(json.dumps(report,indent=2)+'\n')
print(len(matches),'named references confirmed;',len(unconfirmed),'unconfirmed')
print(json.dumps(counts.most_common(15)))
