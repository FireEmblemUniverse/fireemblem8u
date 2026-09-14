#!/usr/bin/env python3
"""Rebuild animation sheets from PNG and recompress all linked LZ assets."""
import hashlib,json,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def sha(data):return hashlib.sha256(data).hexdigest()
def main():
 inventory=json.loads((ROOT/'docs/banim-data-classification.json').read_text())
 assert inventory['elf_sha256']==sha((ROOT/'fireemblem8.elf').read_bytes())
 tracked=set(subprocess.check_output(['git','ls-files'],cwd=ROOT,text=True).splitlines())
 gfx=ROOT/'tools/gbagfx/gbagfx';records=[];images=palettes=streams=0;raw_bytes=compressed_bytes=0
 with tempfile.TemporaryDirectory(prefix='banim-graphics-audit-') as temp:
  temp=Path(temp)
  for asset in inventory['assets']:
   path=asset['path']
   if not path.endswith('.lz'):continue
   existing=ROOT/path;raw_path=ROOT/path[:-3];raw=raw_path.read_bytes();source=None
   assert sha(existing.read_bytes())==asset['sha256'] and sha(raw)==asset['expanded_sha256']
   if asset['kind']=='graphics':
    if raw_path.suffix=='.4bpp':
     source=raw_path.with_suffix('.png');assert str(source.relative_to(ROOT)) in tracked
     rebuilt=temp/'sheet.4bpp'
     subprocess.run([str(gfx),str(source),str(rebuilt)],check=True,capture_output=True)
     assert rebuilt.read_bytes()==raw,path;images+=1
    else:
     assert raw_path.suffix=='.agbpal' and str(raw_path.relative_to(ROOT)) in tracked,path
     source=raw_path;palettes+=1
   input_file=temp/'input.bin';output=temp/'input.bin.lz';input_file.write_bytes(raw)
   subprocess.run([str(gfx),str(input_file),str(output)],check=True,capture_output=True)
   assert output.read_bytes()==existing.read_bytes(),path
   streams+=1;raw_bytes+=len(raw);compressed_bytes+=existing.stat().st_size
   record=dict(path=path,expanded_bytes=len(raw),compressed_bytes=existing.stat().st_size,compressed_sha256=asset['sha256'])
   if source:record.update(source=str(source.relative_to(ROOT)),source_sha256=sha(source.read_bytes()),source_kind='png' if source.suffix=='.png' else 'tracked_binary_palette')
   records.append(record)
 report=dict(png_sheets_rebuilt=images,tracked_binary_palettes=palettes,recompressed_streams=streams,expanded_bytes=raw_bytes,compressed_bytes=compressed_bytes,gbagfx_sha256=sha(gfx.read_bytes()),elf_sha256=inventory['elf_sha256'],asset_receipt_sha256=sha((ROOT/'docs/banim-data-classification.json').read_bytes()),assets=records,scope='PNG sheets reproduce their tile bytes; tracked binary palettes are explicit source leaves. All linked LZ inputs recompress exactly. Motion source regeneration is covered by the separate fresh-assembly audit. No animation interpreter semantic or whole-game completion claim.')
 (ROOT/'docs/banim-graphics-rebuild.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k!='assets'},indent=2))
if __name__=='__main__':main()
