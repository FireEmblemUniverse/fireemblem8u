#!/usr/bin/env python3
"""Identify generated ROM fill without treating it as executable coverage."""
import hashlib,json,re,subprocess
from pathlib import Path
from audit_linked_code import read_contributions
ROOT=Path(__file__).resolve().parents[1]
START,END=0x08000000,0x09000000

def audit(map_text,rom,load_end):
 if len(rom)!=END-START:raise ValueError('wrong ROM extent')
 contributions=read_contributions(map_text)
 gaps=[];cursor=START
 for section in contributions+[dict(start=END,end=END)]:
  if cursor<section['start']:gaps.append((cursor,section['start']))
  cursor=section['end']
 fills=[]
 for line in map_text.splitlines():
  match=re.fullmatch(r'\s+\*fill\*\s+(0x[0-9a-f]+)\s+(0x[0-9a-f]+)\s+([0-9a-f]+)\s*',line)
  if not match:continue
  start,size=int(match[1],16),int(match[2],16)
  if not START<=start<END:continue
  if not size or start+size>END or len(match[3])%2:raise ValueError('invalid ROM fill record')
  fills.append(dict(start=start,end=start+size,pattern=match[3],kind='linker_fill'))
 if not START<load_end<=END:raise ValueError('invalid ELF load extent')
 if load_end<END:fills.append(dict(start=load_end,end=END,pattern='ff',kind='objcopy_tail_padding'))
 fills.sort(key=lambda x:x['start']);records=[];n=0
 for start,end in gaps:
  cursor=start
  while n<len(fills) and fills[n]['start']<end:
   item=fills[n]
   if item['start']!=cursor or item['end']>end:raise ValueError('fill overlap or unaccounted gap')
   size=item['end']-cursor;pattern=bytes.fromhex(item['pattern']);expected=(pattern*((size+len(pattern)-1)//len(pattern)))[:size]
   actual=rom[cursor-START:item['end']-START]
   if actual!=expected:raise ValueError('fill bytes disagree with map or objcopy policy')
   records.append(dict(item,size=size,sha256=hashlib.sha256(actual).hexdigest()));cursor=item['end'];n+=1
  if cursor!=end:raise ValueError('unclassified bytes outside input sections')
 if n!=len(fills):raise ValueError('fill record overlaps input contribution')
 return dict(outside_input_bytes=sum(b-a for a,b in gaps),gap_count=len(gaps),linker_fill_bytes=sum(r['size'] for r in records if r['kind']=='linker_fill'),objcopy_padding_bytes=sum(r['size'] for r in records if r['kind']=='objcopy_tail_padding'),unclassified_outside_input_bytes=0,regions=records)

def main():
 map_path=ROOT/'fireemblem8.map';elf=ROOT/'fireemblem8.elf';rom=(ROOT/'fireemblem8.gba').read_bytes();map_text=map_path.read_text()
 headers=subprocess.check_output(['arm-none-eabi-readelf','-lW',str(elf)],text=True)
 ends=[]
 for line in headers.splitlines():
  f=line.split()
  if len(f)>=6 and f[0]=='LOAD':
   address,size=int(f[3],16),int(f[4],16)
   if size and START<=address<END:ends.append(address+size)
 if not ends:raise ValueError('no ROM load segment')
 policy='--pad-to 0x9000000 --gap-fill=0xff'
 if policy not in (ROOT/'Makefile').read_text():raise ValueError('review changed objcopy fill policy')
 report=audit(map_text,rom,max(ends))
 # Negative checks exercise provenance and byte checks, not only the ROM hash.
 tests=[]
 first=report['regions'][0]
 changed=bytearray(rom);changed[first['start']-START]^=1
 cases=[('changed-fill-byte',map_text,bytes(changed),max(ends)),('changed-tail-byte',map_text,rom[:-1]+bytes([rom[-1]^1]),max(ends)),('wrong-load-end',map_text,rom,max(ends)-1),('short-rom',map_text,rom[:-1],max(ends)),('missing-fill-provenance',re.sub(r'^\s+\*fill\*.*$', '',map_text,flags=re.M),rom,max(ends))]
 for name,text,data,load_end in cases:
  try:audit(text,data,load_end)
  except ValueError:tests.append(name)
  else:raise AssertionError('accepted invalid padding: '+name)
 assert rom==(ROOT/'baserom.gba').read_bytes()
 report.update(elf_sha256=hashlib.sha256(elf.read_bytes()).hexdigest(),map_sha256=hashlib.sha256(map_path.read_bytes()).hexdigest(),rom_sha256=hashlib.sha256(rom).hexdigest(),elf_rom_load_end=hex(max(ends)),objcopy_policy=policy,rejected_checks=tests,scope='Build-provenance classification of generated fill outside input sections. Not a proof of unreachability, absence of hidden code in input data, or an overall executable denominator.')
 (ROOT/'docs/rom-padding.json').write_text(json.dumps(report,indent=2)+'\n')
 print(json.dumps({k:v for k,v in report.items() if k!='regions'},indent=2))
if __name__=='__main__':main()
