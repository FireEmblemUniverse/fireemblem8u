#!/usr/bin/env python3
"""Require disjoint provenance for every candidate in the bounded pointer scan."""
from collections import Counter
import hashlib,json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
paths={name:ROOT/'docs'/filename for name,filename in {
 'frontier':'function-pointer-frontier.json','named':'function-pointer-relocations.json',
 'residual':'function-pointer-residuals.json','data':'function-pointer-data-owners.json'}.items()}
r={k:json.loads(p.read_text()) for k,p in paths.items()}
assert r['named']['frontier_sha256']==hashlib.sha256(paths['frontier'].read_bytes()).hexdigest()
assert r['residual']['prior_receipt_sha256']==hashlib.sha256(paths['named'].read_bytes()).hexdigest()
assert r['data']['prior_sha256']==hashlib.sha256(paths['residual'].read_bytes()).hexdigest()
rom_hash=hashlib.sha256((ROOT/'fireemblem8.gba').read_bytes()).hexdigest()
assert r['frontier']['rom_sha256']==rom_hash
expected={(x['owner'],x['address']) for x in r['frontier']['candidates']}
assert len(expected)==r['frontier']['candidate_words']
accounted={}
def add(owner,address,kind):
 key=(owner,address)
 assert key in expected and key not in accounted,(key,kind)
 accounted[key]=kind
for x in r['named']['confirmed']:add(x['object'],x['address'],'named_function_reference')
for x in r['residual']['resolved']:add(x['owner'],x['address'],x['classification'])
for x in r['data']['records']:
 assert x['classification']!='needs_data_provenance',x
 add(x['owner'],x['address'],x['classification'])
assert set(accounted)==expected
counts=Counter(accounted.values())
report=dict(scope='Closure of the specific aligned exact-FUNC-address candidate inventory only. Named relocations prove references; other words have data provenance. Does not establish all indirect targets, reachability, absence of hidden code, or overall decompilation.',rom_sha256=rom_hash,candidates=len(expected),accounted=len(accounted),unaccounted=0,categories=dict(counts),receipt_hashes={k:hashlib.sha256(p.read_bytes()).hexdigest() for k,p in paths.items()})
(ROOT/'docs/function-pointer-closure.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
