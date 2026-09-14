#!/usr/bin/env python3
"""Account for code and compressed payload inside the generated duplicate."""
from collections import Counter
import hashlib,json,subprocess
from pathlib import Path
from audit_linked_code import read_contributions,read_mappings,partition
from audit_banim_data import expand
ROOT=Path(__file__).resolve().parents[1]
rom=(ROOT/'fireemblem8.gba').read_bytes();delta=0xa73c
symbols=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True)
regions=partition(read_contributions((ROOT/'fireemblem8.map').read_text()),read_mappings(symbols))
source_start,source_end=0x08b15740,0x08b1f734;copied=[]
for region in regions:
 if region['kind'] not in ('arm','thumb'):continue
 a=max(source_start,region['start']);b=min(source_end,region['end'])
 if a>=b:continue
 assert rom[a-0x08000000:b-0x08000000]==rom[a+delta-0x08000000:b+delta-0x08000000]
 copied.append(dict(source=hex(a),duplicate=hex(a+delta),bytes=b-a,kind=region['kind'],source_object=region['object']))
payload_symbol=next(f for line in symbols.splitlines() if len(f:=line.split())>=8 and f[-1]=='FE6SIO_Payload')
payload=int(payload_symbol[1],16);compressed=(ROOT/'fe6sio_payload.bin.lz').read_bytes()
for address in (payload,payload+delta):assert rom[address-0x08000000:address-0x08000000+len(compressed)]==compressed
expanded,consumed=expand(compressed);assert expanded==(ROOT/'mgfembp/mgfembp.bin').read_bytes()
payload_symbols=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'mgfembp/mgfembp.elf')],text=True)
payload_regions=partition(read_contributions((ROOT/'mgfembp/mgfembp.map').read_text(),0x02010000,0x02010000+len(expanded)),read_mappings(payload_symbols,0x02010000,0x02010000+len(expanded)))
counts=Counter()
for region in payload_regions:counts[region['kind']]+=region['size']
report=dict(scope='Physical copied-code content, distinct from reachability and unique-source coverage. Main ELF labels the generated copy as data; these overlay records explicitly account for matching instructions and the compressed source payload. Expanded instructions are not added to physical ROM byte totals.',rom_sha256=hashlib.sha256(rom).hexdigest(),copied_native_instruction_bytes=sum(r['bytes'] for r in copied),native_regions=copied,compressed_payload=dict(source=hex(payload),duplicate=hex(payload+delta),bytes=len(compressed),consumed_bytes=consumed,expanded_bytes=len(expanded),expanded_sha256=hashlib.sha256(expanded).hexdigest(),source_image='mgfembp/mgfembp.bin',expanded_mapping_bytes=dict(counts)))
(ROOT/'docs/duplicate-executable-content.json').write_text(json.dumps(report,indent=2)+'\n');print(report['copied_native_instruction_bytes'],'copied native instruction bytes;',len(compressed),'compressed bytes;',dict(counts),'expanded')
