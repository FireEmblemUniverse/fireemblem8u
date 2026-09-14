#!/usr/bin/env python3
"""Check complete motion-word grammar and references against AnimInterpret."""
import hashlib,json
from collections import Counter
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def sha(data):return hashlib.sha256(data).hexdigest()
def parse(data,sheets,oam_sizes):
 if len(data)%4:raise ValueError('unaligned motion stream')
 words=[int.from_bytes(data[i:i+4],'little') for i in range(0,len(data),4)];i=0;ops={};counts=Counter()
 while i<len(words):
  start=i;word=words[i];tag=word>>24
  if tag==0x80:
   if word!=0x80000000:raise ValueError('unexpected stop payload')
   i+=1
  elif tag==0x85:
   if word&0x00ffff00 or (word&255)>0x7b:raise ValueError('unsupported queued command')
   i+=1
  elif tag==0x86:
   if i+3>len(words):raise ValueError('truncated frame')
   if words[i+1] not in sheets:raise ValueError('frame sheet outside graphic asset starts')
   offset=words[i+2]
   if offset%12 or not all(offset+12<=size for size in oam_sizes):raise ValueError('frame OAM offset outside pools')
   i+=3
  else:raise ValueError('unsupported opcode or pointer instruction')
  ops[start*4]=(tag,i*4);counts[hex(tag)]+=1
 return ops,counts

def main():
 assets=json.loads((ROOT/'docs/banim-data-classification.json').read_text());elf_hash=sha((ROOT/'fireemblem8.elf').read_bytes());assert assets['elf_sha256']==elf_hash
 sheets={int(a['start'],16) for a in assets['assets'] if a['path'].endswith('.4bpp.lz')}
 records=[];totals=Counter();mode_total=0
 for asset in assets['assets']:
  if asset['kind']!='relocated_motion_stream':continue
  path=asset['path'];stem=path.removesuffix('_motion.o.bin.lz');data=(ROOT/path[:-3]).read_bytes();assert sha(data)==asset['expanded_sha256']
  oams=[(ROOT/(stem+'_oam_'+side+'.bin')).read_bytes() for side in ('l','r')]
  ops,counts=parse(data,sheets,[len(x) for x in oams]);totals.update(counts)
  modes=(ROOT/(stem+'_modes.bin')).read_bytes();assert len(modes)%4==0
  entries=[int.from_bytes(modes[i:i+4],'little') for i in range(0,len(modes),4)]
  for entry in entries:
   if entry not in ops:raise ValueError('mode entry outside instruction boundary')
   cursor=entry
   while True:
    if cursor not in ops:raise ValueError('mode falls off motion stream')
    tag,next_cursor=ops[cursor]
    if tag==0x80:break
    cursor=next_cursor
  mode_total+=len(entries);records.append(dict(path=path,motion_sha256=sha(data),mode_entries=len(entries),commands=dict(counts),bytes=len(data)))
 # Deliberately invalid grammar/reference inputs must fail without a ROM hash.
 ptr=min(sheets);frame=lambda address,offset:b''.join(x.to_bytes(4,'little') for x in (0x86000001,address,offset))
 bad=[('native-callback',bytes.fromhex('010000c8')),('truncated-frame',bytes.fromhex('01000086')),('bad-sheet',frame(0,0)),('bad-oam',frame(ptr,13)),('unknown-command',bytes.fromhex('ff000085')),('stop-payload',bytes.fromhex('01000080'))];rejected=[]
 for name,data in bad:
  try:parse(data,sheets,[120,120])
  except ValueError:rejected.append(name)
  else:raise AssertionError(name)
 report=dict(streams=len(records),motion_bytes=sum(r['bytes'] for r in records),commands=dict(totals),mode_entries=mode_total,callback_or_pointer_opcodes=0,rejected_checks=rejected,elf_sha256=elf_hash,interpreter_sha256=sha((ROOT/'src/animedrv.c').read_bytes()),format_header_sha256=sha((ROOT/'include/anime.h').read_bytes()),streams_detail=records,scope='Complete static grammar for current motion streams: all words belong to STOP, COMMAND or three-word FRAME records; sheet pointers and both OAM-pool bounds are valid, and every mode entry reaches a structural STOP. Does not simulate command handlers, wait release, timing, rendering or arbitrary memory corruption.')
 (ROOT/'docs/banim-command-classification.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k!='streams_detail'},indent=2))
if __name__=='__main__':main()
