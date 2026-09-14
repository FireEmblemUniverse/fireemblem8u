#!/usr/bin/env python3
"""Freshly assemble animation sources and independently resolve ABS32 references."""
import hashlib,json,re,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def sha(data):return hashlib.sha256(data).hexdigest()
def main():
 symbols={}
 for line in subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True).splitlines():
  f=line.split()
  if len(f)>=8 and f[0].rstrip(':').isdigit():symbols[f[7]]=int(f[1],16)
 sources=[]
 for line in (ROOT/'linker_script_banim.txt').read_text().splitlines():
  if '|.data.script>lz' in line:sources.append(line.split('|')[0])
 assert len(sources)==len(set(sources))
 records=[];total=0;reloc_count=0
 with tempfile.TemporaryDirectory(prefix='banim-source-audit-') as tmp:
  tmp=Path(tmp)
  for filename in sources:
   original=ROOT/filename;source=original.with_suffix('.s');obj=tmp/'fresh.o'
   subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi','-mthumb-interwork','-I',str(ROOT/'include'),str(source),'-o',str(obj)],cwd=ROOT/'banim',check=True,capture_output=True)
   relocations={};section=None
   for line in subprocess.check_output(['arm-none-eabi-readelf','-rW',str(obj)],text=True).splitlines():
    m=re.match(r"Relocation section '\.rel(\S+)'",line)
    if m:section=m[1];continue
    f=line.split()
    if len(f)>=5 and re.fullmatch('[0-9a-f]{8}',f[0]):
     assert f[2]=='R_ARM_ABS32',(filename,line)
     relocations.setdefault(section,[]).append((int(f[0],16),f[4]))
   assert set(relocations)<=set(['.data.script']),filename
   parts=[]
   for section,suffix in [('.data.script','_motion.o.bin'),('.data.oam_l','_oam_l.bin'),('.data.oam_r','_oam_r.bin'),('.data.modes','_modes.bin')]:
    raw=tmp/'section.bin';raw.unlink(missing_ok=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j',section,str(obj),str(raw)],check=True,capture_output=True)
    data=bytearray(raw.read_bytes());seen=set()
    for offset,symbol in relocations.get(section,[]):
     assert offset%4==0 and offset+4<=len(data) and offset not in seen
     seen.add(offset);value=int.from_bytes(data[offset:offset+4],'little')
     assert symbol in symbols,(filename,symbol)
     data[offset:offset+4]=((value+symbols[symbol])&0xffffffff).to_bytes(4,'little');reloc_count+=1
    target=ROOT/(filename.removesuffix('_motion.o')+suffix)
    assert data==target.read_bytes(),(filename,section,target)
    total+=len(data);parts.append(dict(section=section,bytes=len(data),relocations=len(seen),sha256=sha(data)))
   records.append(dict(source=str(source.relative_to(ROOT)),source_sha256=sha(source.read_bytes()),sections=parts))
 report=dict(motion_sources=len(sources),rebuilt_sections=sum(len(r['sections']) for r in records),verified_bytes=total,abs32_relocations=reloc_count,elf_sha256=sha((ROOT/'fireemblem8.elf').read_bytes()),linker_script_sha256=sha((ROOT/'linker_script_banim.txt').read_bytes()),macro_headers={p:sha((ROOT/p).read_bytes()) for p in ('include/banim_sheet.inc','include/banim_code.inc','include/banim_code_frame.inc')},sources=records,scope='Fresh source assembly reproduces all motion, OAM and mode-table build inputs after independently applying ABS32 relocations using current linked symbols. Complements the compressed-asset ROM audit; does not establish animation opcode semantics, original image regeneration, or whole-game completion.')
 (ROOT/'docs/banim-source-rebuild.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k!='sources'},indent=2))
if __name__=='__main__':main()
