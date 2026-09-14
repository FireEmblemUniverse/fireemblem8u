#!/usr/bin/env python3
"""Characterize relocated runtime data in the duplicate tail block."""
import hashlib,json,struct
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
r=(ROOT/'fireemblem8.gba').read_bytes();source=0xb15740;target=0xb1fe7c;span=target-source;size=0xa788
assert span==0xa73c
rebuilt=bytearray(r[source:source+span]);shifted=[];exceptions=[]
for offset in range(0,span,4):
 old=struct.unpack_from('<I',rebuilt,offset)[0];new=struct.unpack_from('<I',r,target+offset)[0]
 if old==new:continue
 row=dict(offset=hex(offset),original=hex(old),duplicate=hex(new))
 if new-old==span:
  assert 0x08b1f734<=old<0x08b1fe7c
  shifted.append(row);struct.pack_into('<I',rebuilt,offset,old+span)
 else:exceptions.append(row)
assert len(shifted)==260
assert exceptions==[dict(offset='0xa028',original='0x8587790',duplicate='0x85913f0')]
# This explicit exception is evidence of a difference, not a validated relocation.
struct.pack_into('<I',rebuilt,0xa028,0x085913f0)
assert rebuilt==r[target:target+span]
tail=r[target+span:target+size];assert len(tail)==76
report=dict(scope='Byte-level reconstruction evidence only. 260 changed words point into the copied runtime-data range with a uniform delta. One exceptional word and a 76-byte tail are recorded without claiming recovered semantics. Historical build origin and reachability are unproven.',rom_sha256=hashlib.sha256(r).hexdigest(),source=hex(source+0x08000000),target=hex(target+0x08000000),reconstructed_prefix_bytes=span,uniform_delta=hex(span),shifted_words=shifted,exceptional_words=exceptions,tail_bytes=len(tail),tail_words=[hex(x[0]) for x in struct.iter_unpack('<I',tail)],tail_sha256=hashlib.sha256(tail).hexdigest())
(ROOT/'docs/orphan-runtime-copy.json').write_text(json.dumps(report,indent=2)+'\n');print(span,'bytes reconstructed with 260 uniform pointer shifts and one explicit exception;',len(tail),'tail bytes remain')
