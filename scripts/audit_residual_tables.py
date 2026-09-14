#!/usr/bin/env python3
"""Verify terrain initializers and two explicitly located residual graphics assets."""
import hashlib,json,re,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def sha(x):return hashlib.sha256(x).hexdigest()
def main():
 rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes();elf=ROOT/'fireemblem8.elf';symbols={}
 for line in subprocess.check_output(['arm-none-eabi-readelf','-sW',str(elf)],text=True).splitlines():
  f=line.split()
  if len(f)>=8 and f[0].rstrip(':').isdigit():symbols[f[7]]=(int(f[1],16),int(f[2]))
 residual=json.loads((ROOT/'docs/unmapped-asset-provenance.json').read_text());assert residual['elf_sha256']==sha(elf.read_bytes())
 header=(ROOT/'include/constants/terrains.h').read_text();ids={name:int(value,0) for name,value in re.findall(r'\b(TERRAIN_\w+)\s*=\s*(0x[0-9A-Fa-f]+|[0-9]+)',header)}
 assert ids['TERRAIN_COUNT']==65
 source=(ROOT/'src/data_terrains.c').read_text();tables=[]
 for kind,name,body in re.findall(r'CONST_DATA (s8|u16) (\w+)\[\] = \{([^}]+)\};',source,re.S):
  values={}
  for terrain,value in re.findall(r'\[(TERRAIN_\w+)\]\s*=\s*(-?(?:0x[0-9A-Fa-f]+|[0-9]+))\s*,',body):
   index=ids[terrain];assert index not in values;values[index]=int(value,0)
  assert set(values)==set(range(65)),name
  width=1 if kind=='s8' else 2;data=b''.join((values[i]&((1<<(width*8))-1)).to_bytes(width,'little') for i in range(65))
  address,size=symbols[name];assert size==len(data) and rom[address-0x08000000:address-0x08000000+size]==data,name
  tables.append(dict(name=name,start=address,end=address+size,bytes=size,kind=kind,sha256=sha(data)))
 terrain=next(r for r in residual['residual'] if r['object']=='src/data_terrains.o');cursor=int(terrain['start'],16)
 for t in sorted(tables,key=lambda x:x['start']):
  if t['start']>=int(terrain['end'],16):continue
  assert t['start']==cursor;cursor=t['end']
 assert cursor==int(terrain['end'],16)
 records=[]
 for obj,name,path,sourcepath,marker in [('src/fontgrp.o','debug_font_4bpp','graphics/debug_font.4bpp','src/fontgrp.c','#include "graphics/debug_font.4bpp.h"'),('src/data/unit_icon/const_data_unit_icon_move.o','unit_icon_move_Ephraim_Lord_sheet','graphics/unit_icon/move/unit_icon_move_Ephraim_Lord_sheet.4bpp.lz','src/data/unit_icon/const_data_unit_icon_move.s','.incbin "graphics/unit_icon/move/unit_icon_move_Ephraim_Lord_sheet.4bpp.lz"')]:
  r=next(r for r in residual['residual'] if r['object']==obj);data=(ROOT/path).read_bytes();address=symbols[name][0]
  assert marker in (ROOT/sourcepath).read_text();assert address==int(r['start'],16) and len(data)==r['bytes'];assert rom[address-0x08000000:address-0x08000000+len(data)]==data
  records.append(dict(object=obj,symbol=name,asset=path,bytes=len(data),sha256=sha(data),source_sha256=sha((ROOT/sourcepath).read_bytes())))
 with tempfile.TemporaryDirectory(prefix='font-audit-') as tmp:
  out=Path(tmp)/'debug.4bpp';subprocess.run([str(ROOT/'tools/gbagfx/gbagfx'),str(ROOT/'graphics/debug_font.png'),str(out)],check=True,capture_output=True)
  assert out.read_bytes()==(ROOT/'graphics/debug_font.4bpp').read_bytes()
 explained=terrain['bytes']+sum(r['bytes'] for r in records)
 report=dict(terrain_arrays=len(tables),terrain_values=sum(t['bytes']//(1 if t['kind']=='s8' else 2) for t in tables),terrain_unmapped_bytes=terrain['bytes'],graphics=records,newly_bound_bytes=explained,residual_bytes=residual['residual_bytes']-explained,terrain_source_sha256=sha(source.encode()),terrain_header_sha256=sha(header.encode()),elf_sha256=sha(elf.read_bytes()),tables=tables,scope='Explicit numeric terrain initializers and source-bound font/icon assets match the residual ROM intervals; font PNG rebuild also matches. No general no-execution proof or whole-game completion claim.')
 (ROOT/'docs/residual-table-provenance.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k not in ('tables','graphics')},indent=2))
if __name__=='__main__':main()
