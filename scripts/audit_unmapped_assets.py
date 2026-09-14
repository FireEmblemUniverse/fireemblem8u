#!/usr/bin/env python3
"""Bind unmapped input bytes to explicit INCBIN assets; retain all residuals."""
import hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def sha(data):return hashlib.sha256(data).hexdigest()
def main():
 linked=json.loads(subprocess.check_output(['python3',str(ROOT/'scripts/audit_linked_code.py')],text=True))
 regions=[r for r in linked['regions'] if r['kind']=='unmapped' and r['object'] not in ('src/msg_data.o','banim/data_banim.o')]
 rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
 symbols={}
 for line in subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True).splitlines():
  f=line.split()
  if len(f)>=8 and f[0].rstrip(':').isdigit() and f[3]=='OBJECT':symbols.setdefault(f[7],[]).append((int(f[1],16),int(f[2])))
 bindings=[];residual=[];source_hashes={}
 for obj in sorted({r['object'] for r in regions}):
  objregions=[r for r in regions if r['object']==obj];source=ROOT/obj.replace('.o','.c');intervals=[]
  if source.is_file():
   content=source.read_bytes();source_hashes[str(source.relative_to(ROOT))]=sha(content)
   for name,width,path in re.findall(r'\b(\w+)\s*\[[^\]]*\]\s*=\s*INCBIN_U(8|16|32)\("([^"\n]+)"\)',content.decode()):
    candidates=[(start,size) for start,size in symbols.get(name,[]) if any(start<r['end'] and start+size>r['start'] for r in objregions)]
    if not candidates:continue
    assert len(candidates)==1,(obj,name,candidates)
    start,size=candidates[0];data=(ROOT/path).read_bytes();assert size==len(data),(name,size,len(data))
    assert data==rom[start-0x08000000:start-0x08000000+size],name
    assert size%(int(width)//8)==0,name
    intervals.append((start,start+size,name,path,sha(data)))
  intervals.sort()
  for left,right in zip(intervals,intervals[1:]):assert left[1]<=right[0]
  for region in objregions:
   cursor=region['start']
   for start,end,name,path,digest in intervals:
    lo=max(start,region['start']);hi=min(end,region['end'])
    if lo>=hi:continue
    if cursor<lo:residual.append(dict(object=obj,start=hex(cursor),end=hex(lo),bytes=lo-cursor))
    assert cursor<=lo
    bindings.append(dict(object=obj,symbol=name,asset=path,start=hex(lo),end=hex(hi),bytes=hi-lo,asset_sha256=digest));cursor=hi
   if cursor<region['end']:residual.append(dict(object=obj,start=hex(cursor),end=hex(region['end']),bytes=region['end']-cursor))
 total=sum(r['size'] for r in regions);covered=sum(r['bytes'] for r in bindings);remaining=sum(r['bytes'] for r in residual);assert covered+remaining==total
 report=dict(input_regions=len(regions),input_bytes=total,verified_asset_bindings=len(bindings),asset_bound_bytes=covered,residual_bytes=remaining,elf_sha256=linked['elf_sha256'],map_sha256=linked['map_sha256'],sources=source_hashes,bindings=bindings,residual=residual,scope='Exact source-declared binary asset provenance for unmapped intervals, excluding previously audited message/battle-animation contributions. Unbound bytes stay explicit; this neither classifies every compressed asset semantically nor proves data cannot execute.')
 (ROOT/'docs/unmapped-asset-provenance.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k not in ('bindings','residual','sources')},indent=2))
if __name__=='__main__':main()
