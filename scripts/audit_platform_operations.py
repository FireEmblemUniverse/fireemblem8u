#!/usr/bin/env python3
"""Classify every reviewed nonlibrary inline instruction by hardware purpose."""
from collections import Counter
import hashlib,json
from pathlib import Path
from audit_inline_regions import SITES
ROOT=Path(__file__).resolve().parents[1]
receipt=json.loads((ROOT/'docs/inline-assembly-regions.json').read_text())
rows=[];totals={}
for image,source,function,address,hexcode,size,marker in SITES:
 root=ROOT if image=='main_rom' else ROOT/'mgfembp'
 base=0x08000000 if image=='main_rom' else 0x02010000
 stem='fireemblem8' if image=='main_rom' else 'mgfembp'
 extension='.gba' if image=='main_rom' else '.bin'
 code=bytes.fromhex(hexcode)
 assert len(code)==size
 assert (root/(stem+extension)).read_bytes()[address-base:address-base+size]==code
 assert marker in (root/source).read_text()
 if size==2 and code[1]==0xdf or size==4 and code[3]==0xef:
  category='software_interrupt';reason='BIOS or monitor service invocation; platform semantics remain explicit'
 elif marker.startswith('asm volatile("mrs') or marker.startswith('asm volatile("msr'):
  category='processor_status';reason='Processor mode, banked registers or saved status access'
 elif code==bytes.fromhex('7a46'):
  category='execution_address';reason='Current PC selects the calibrated memory-region delay'
 elif code==bytes.fromhex('c046'):
  category='explicit_nop';reason='Exact instruction retained in event switch; ordinary compiler recovery remains open'
 else: raise AssertionError((image,source,address,hexcode,marker))
 matches=[s for s in receipt['sites'] if s['image']==image and int(s['address'],16)==address]
 assert len(matches)==1 and matches[0]['instruction_bytes']==size
 totals.setdefault(image,Counter())[category]+=size
 rows.append(dict(image=image,source=source,function=function,address=hex(address),instruction_bytes=size,category=category,reason=reason))
assert len(rows)==len(receipt['sites'])
for image,categories in totals.items(): assert sum(categories.values())==receipt['totals'][image]
report=dict(scope='Purpose classification of all currently reviewed nonlibrary inline sites. Does not prove complete executable coverage or that hardware operations cannot be expressed by compiler intrinsics.',inline_receipt_sha256=hashlib.sha256((ROOT/'docs/inline-assembly-regions.json').read_bytes()).hexdigest(),categories=totals,sites=rows,runtime_scope='Runtime syscall SWIs are tracked separately in runtime-syscall-inline.json; not included in these totals.')
(ROOT/'docs/platform-operations.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(totals,indent=2))
