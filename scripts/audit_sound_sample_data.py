#!/usr/bin/env python3
"""Bind the complete direct-sound region to rebuilt AIFF-derived wave records."""
import hashlib,json,re,struct,subprocess
from pathlib import Path
from audit_linked_code import read_contributions
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'.deps/sound-sample-audit';OUT.mkdir(exist_ok=True)
source=ROOT/'sound/direct_sound_data.s';text=source.read_text()
pairs=re.findall(r'(DirectSoundData_\w+):\s*\.incbin "([^"]+)"',text)
assert len(pairs)==len(re.findall(r'\.incbin',text))
contributions=[x for x in read_contributions((ROOT/'fireemblem8.map').read_text()) if x['object']=='sound/direct_sound_data.o']
assert len(contributions)==1
region=contributions[0];rom=(ROOT/'fireemblem8.gba').read_bytes()
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
assembled=bytearray();rows=[];padding=0
for symbol,path in pairs:
 while (region['start']+len(assembled))%4:assembled.append(0);padding+=1
 address=region['start']+len(assembled);assert symbols[symbol]==address
 binary=ROOT/path;data=binary.read_bytes();aif=binary.with_suffix('.aif');assert aif.is_file()
 rebuilt=OUT/binary.name
 subprocess.run([str(ROOT/'tools/aif2pcm/aif2pcm'),str(aif),str(rebuilt)],check=True,capture_output=True)
 assert rebuilt.read_bytes()==data,path
 assert len(data)>=17
 kind,status,freq,loop,count=struct.unpack_from('<HHIII',data)
 assert kind==0 and status in (0,0x4000) and freq>0 and len(data)==17+count
 assert loop<=count and (status!=0x4000 or loop<count)
 assert rom[address-0x08000000:address-0x08000000+len(data)]==data
 assembled.extend(data)
 rows.append(dict(symbol=symbol,address=hex(address),source=path,aif=str(aif.relative_to(ROOT)),bytes=len(data),sample_count=count,loop_start=loop,looped=status==0x4000,frequency_word=freq,sha256=hashlib.sha256(data).hexdigest()))
while (region['start']+len(assembled))%4:assembled.append(0);padding+=1
assert len(assembled)==region['end']-region['start']
assert assembled==rom[region['start']-0x08000000:region['end']-0x08000000]
report=dict(scope='Complete direct-sound input region rebuilt from AIFF sources as uncompressed WaveData records and zero alignment. Establishes format/provenance; not a proof that no control-flow target can enter these bytes.',region_start=hex(region['start']),region_bytes=len(assembled),records=len(rows),wave_header_bytes=16*len(rows),sample_and_terminal_bytes=sum(x['bytes']-16 for x in rows),alignment_bytes=padding,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),converter_source_sha256=hashlib.sha256((ROOT/'tools/aif2pcm/main.c').read_bytes()).hexdigest(),records_detail=rows)
(ROOT/'docs/sound-sample-data.json').write_text(json.dumps(report,indent=2)+'\n');print(len(rows),'AIFF rebuilds exact;',len(assembled),'region bytes accounted for;',padding,'alignment bytes')
