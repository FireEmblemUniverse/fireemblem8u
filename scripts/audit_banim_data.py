#!/usr/bin/env python3
"""Verify battle-animation asset concatenation and LZ stream boundaries."""
import hashlib,json,subprocess
from collections import Counter
from pathlib import Path
from audit_linked_code import read_contributions
ROOT=Path(__file__).resolve().parents[1]
def sha(x):return hashlib.sha256(x).hexdigest()
def expand(data):
 if len(data)<4 or data[0]!=0x10:raise ValueError('invalid LZ header')
 length=int.from_bytes(data[1:4],'little')
 if not length:raise ValueError('empty LZ output')
 out=bytearray();i=4
 while len(out)<length:
  if i>=len(data):raise ValueError('missing LZ flags')
  flags=data[i];i+=1
  for bit in range(7,-1,-1):
   if len(out)==length:break
   if flags&(1<<bit):
    if i+2>len(data):raise ValueError('truncated LZ match')
    a,b=data[i:i+2];i+=2;n=(a>>4)+3;distance=((a&15)<<8)+b+1
    if distance>len(out) or len(out)+n>length:raise ValueError('invalid LZ match bounds')
    for _ in range(n):out.append(out[-distance])
   else:
    if i>=len(data):raise ValueError('truncated LZ literal')
    out.append(data[i]);i+=1
 if len(data)-i>3:raise ValueError('excess trailing LZ data')
 return bytes(out),i

def main():
 script=(ROOT/'linker_script_banim.txt').read_bytes();mapfile=ROOT/'fireemblem8.map';rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
 sections=[r for r in read_contributions(mapfile.read_text()) if r['object']=='banim/data_banim.o'];assert len(sections)==1
 start,end=sections[0]['start'],sections[0]['end'];cursor=start;records=[];counts=Counter();decoded=0
 for line in script.decode().splitlines():
  if not line or line.startswith('#'):continue
  raw,sep,compression=line.partition('>');filename,bar,section=raw.partition('|')
  if sep:
   assert compression=='lz' and bar and section=='.data.script'
   path=filename+'.bin.lz';kind='relocated_motion_stream'
  else:
   assert not bar
   path=filename;kind='graphics' if path.startswith('graphics/') else ('oam' if '_oam_' in path else 'mode_table')
  data=(ROOT/path).read_bytes();assert rom[cursor-0x08000000:cursor-0x08000000+len(data)]==data,path
  record=dict(path=path,kind=kind,start=hex(cursor),bytes=len(data),sha256=sha(data))
  if path.endswith('.lz'):
   output,consumed=expand(data);precursor=ROOT/path[:-3];assert precursor.read_bytes()==output,path
   record.update(expanded_bytes=len(output),expanded_sha256=sha(output),consumed_bytes=consumed,trailing_alignment_bytes=len(data)-consumed);decoded+=len(output)
  else:assert path.endswith('_modes.bin'),path
  cursor+=len(data);counts[kind]+=1;records.append(record)
 assert cursor==end
 assert (ROOT/'banim/data_banim.bin').read_bytes()==rom[start-0x08000000:end-0x08000000]
 rejected=[]
 for name,data in [('bad-header',b'\0\1\0\0'),('missing-flags',b'\x10\1\0\0'),('bad-distance',bytes.fromhex('10030000800000')),('overrun',bytes.fromhex('1002000040410000')),('trailing-data',bytes.fromhex('10010000004100000000'))]:
  try:expand(data)
  except ValueError:rejected.append(name)
  else:raise AssertionError(name)
 report=dict(asset_count=len(records),asset_kinds=dict(counts),contribution_bytes=end-start,expanded_bytes=decoded,compressed_assets=sum('expanded_bytes' in r for r in records),start=hex(start),end=hex(end),script_sha256=sha(script),elf_sha256=sha((ROOT/'fireemblem8.elf').read_bytes()),map_sha256=sha(mapfile.read_bytes()),rejected_checks=rejected,assets=records,scope='Current asset/build-input provenance and complete LZ decoding for the merged battle-animation contribution. Motion streams are animation VM data; opcode/relocation semantics and source-image regeneration remain separate work. Not a proof of no hidden executable content or an overall executable denominator.')
 (ROOT/'docs/banim-data-classification.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k!='assets'},indent=2))
if __name__=='__main__':main()
