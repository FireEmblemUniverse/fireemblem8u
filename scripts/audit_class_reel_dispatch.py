#!/usr/bin/env python3
"""Bind class-reel spell selectors and callback table to linked C functions."""
import hashlib,json,re,struct,subprocess
from pathlib import Path
from audit_linked_code import read_contributions
ROOT=Path(__file__).resolve().parents[1]
rom=(ROOT/'fireemblem8.gba').read_bytes()
text=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True)
symbols={f[-1]:(int(f[1],16),int(f[2]),f[3]) for line in text.splitlines() if len(f:=line.split())>=8 and re.fullmatch('[0-9a-fA-F]{8}',f[1])}
source=(ROOT/'src/banim-efxop.c').read_text()
body=re.search(r'gClassReelSpellAnimFuncLut\[\]\s*=\s*\{([^}]+)',source)[1]
names=re.findall(r'\bStartClassReelSpellAnim\w+',body)
address,size,_=symbols['gClassReelSpellAnimFuncLut'];assert size==len(names)*4==36
contributions=read_contributions((ROOT/'fireemblem8.map').read_text())
rows=[]
for index,name in enumerate(names):
 value=struct.unpack_from('<I',rom,address-0x08000000+index*4)[0]
 target,length,kind=symbols[name]
 assert kind=='FUNC' and value==target and value&1
 owners=[c['object'] for c in contributions if c['start']<=target&~1 and (target&~1)+length<=c['end']]
 assert owners==['src/banim-efxop.o'],(name,owners)
 rows.append(dict(index=index,function=name,pointer=hex(value),bytes=length,owner=owners[0]))
base,length,_=symbols['gClassReelData'];assert length==65*20
selectors=[rom[base-0x08000000+i*20+8] for i in range(65)]
assert all(x<len(names) for x in selectors),selectors
report=dict(class_entries=65,callback_entries=rows,selectors=selectors,all_selectors_in_bounds=True,rom_sha256=hashlib.sha256(rom).hexdigest(),source_sha256=hashlib.sha256(source.encode()).hexdigest(),scope='All 65 linked class-reel magicFx fields are valid indices into the nine-entry spell callback table; every pointer matches its source initializer and a linked C FUNC symbol. Does not prove runtime index immutability, class-entry selection bounds, callback effects or arbitrary writes. Struct stride/field offset follow include/opinfo.h.')
(ROOT/'docs/class-reel-dispatch.json').write_text(json.dumps(report,indent=2)+'\n');print('65 class selectors in bounds; nine callback pointers resolve to linked C functions')
