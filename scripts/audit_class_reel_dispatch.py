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
# Reconstruct every class-reel script from its declarative source macros.
opinfo=(ROOT/'src/opinfo.c').read_text()
macro_ids={'CR_END':0,'CR_ANIM_ROUND_HIT_CLOSE':1,'CR_ANIM_ROUND_CRIT_CLOSE':2,'CR_RETURN_TO_STANDING':3,'CR_ANIM_ROUND_NONCRIT_FAR':4,'CR_WAIT':5,'CR_ANIM_ROUND_TAKING_MISS_CLOSE':6,'CR_RETURN_TO_STANDING_ALT':7,'CR_WAIT_ROUND_END':8}
scripts=[]
for match in re.finditer(r'struct ClassReelAnimScr CONST_DATA (ClassReelScr_\w+)\[\]\s*=\s*\{(.*?)\};',opinfo,re.S):
 name,body=match.groups();body=re.sub(r'/\*.*?\*/|//[^\n]*','',body,flags=re.S)
 expected=bytearray()
 for token in body.split(','):
  token=token.strip()
  if not token:continue
  m=re.fullmatch(r'(CR_\w+)(?:\((\d+)\))?',token);assert m,token
  macro,arg=m.groups();opcode=macro_ids[macro]
  assert (arg is not None)==(opcode==5)
  expected.extend((opcode,int(arg) if arg else 0))
 first_end=list(expected[::2]).index(0)
 assert all(x==0 for x in expected[first_end*2:])
 start,n,_=symbols[name];assert n==len(expected)
 assert rom[start-0x08000000:start-0x08000000+n]==expected,name
 scripts.append(dict(name=name,address=hex(start),bytes=n,records=n//2,first_end_record=first_end,trailing_end_records=n//2-first_end-1,opcodes=list(expected[::2])))
assert len(scripts)==14
starts={int(x['address'],16) for x in scripts}
pointers=[struct.unpack_from('<I',rom,base-0x08000000+i*20+16)[0] for i in range(65)]
assert all(x in starts for x in pointers),[hex(x) for x in pointers if x not in starts]
report=dict(scripts=scripts,class_script_pointers=[hex(x) for x in pointers],opinfo_source_sha256=hashlib.sha256(opinfo.encode()).hexdigest(),class_entries=65,callback_entries=rows,selectors=selectors,all_selectors_in_bounds=True,rom_sha256=hashlib.sha256(rom).hexdigest(),source_sha256=hashlib.sha256(source.encode()).hexdigest(),scope='All 65 linked class-reel magicFx fields are valid indices into the nine-entry spell callback table; every pointer matches its source initializer and a linked C FUNC symbol. Does not prove runtime index immutability, class-entry selection bounds, callback effects or arbitrary writes. All 14 class-reel scripts reconstruct from source macros, end structurally in END, and contain only opcodes 0..8 (no native pointer opcode); all 65 class script pointers target their starts. Wait completion and interpreter side effects are not established. Struct stride/field offset follow include/opinfo.h.')
(ROOT/'docs/class-reel-dispatch.json').write_text(json.dumps(report,indent=2)+'\n');print('65 class selectors in bounds; nine callback pointers resolve to linked C functions')
print(len(scripts),'class scripts rebuilt;',sum(x['records'] for x in scripts),'records; all 65 script pointers bound')
