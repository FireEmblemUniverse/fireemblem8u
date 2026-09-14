#!/usr/bin/env python3
"""Verify source instrument records that reference audited direct-sound samples."""
import hashlib,json,re,subprocess
from collections import Counter
from pathlib import Path
from audit_linked_code import read_contributions
ROOT=Path(__file__).resolve().parents[1]
receipt=json.loads((ROOT/'docs/sound-sample-data.json').read_text());samples={x['symbol']:x for x in receipt['records_detail']}
rom=(ROOT/'fireemblem8.gba').read_bytes();rows=[];counts=Counter();seen=set()
contributions=read_contributions((ROOT/'fireemblem8.map').read_text())
for source in sorted((ROOT/'sound/voicegroups').glob('*.s')):
 for number,line in enumerate(source.read_text().splitlines(),1):
  if not re.match(r'\s*voice_directsound(?:\s|_)',line):continue
  match=re.fullmatch(r'\s*(voice_directsound(?:_no_resample|_alt)?)\s+(.+?)\s*@([0-9A-Fa-f]{8})\s*',line)
  assert match,(source,number,line)
  macro,args,address=match.groups();fields=[x.strip() for x in args.split(',')];assert len(fields)==7
  key,pan=int(fields[0],0),int(fields[1],0);symbol=fields[2];assert symbol in samples,symbol
  envelope=[int(x,0) for x in fields[3:]];target=int(samples[symbol]['address'],16)
  kind={'voice_directsound':0,'voice_directsound_no_resample':8,'voice_directsound_alt':16}[macro]
  expected=bytes([kind,key,0,(pan|0x80) if pan else 0])+target.to_bytes(4,'little')+bytes(envelope)
  address=int(address,16);assert address not in seen;seen.add(address)
  owner=str(source.relative_to(ROOT).with_suffix('.o'))
  assert any(x['object']==owner and x['start']<=address and address+12<=x['end'] for x in contributions)
  assert rom[address-0x08000000:address-0x08000000+12]==expected,(source,number)
  counts[symbol]+=1;rows.append(dict(source=str(source.relative_to(ROOT)),line=number,address=hex(address),sample=symbol,kind=kind))
report=dict(scope='Source-declared direct-sound instrument records verified byte-for-byte against ROM, including WaveData pointers and envelope fields. Does not prove song reachability, absence of other pointer references, or absence of code targets in samples.',instrument_records=len(rows),referenced_samples=len(counts),total_samples=len(samples),unreferenced_by_these_macros=sorted(set(samples)-set(counts)),sample_receipt_sha256=hashlib.sha256((ROOT/'docs/sound-sample-data.json').read_bytes()).hexdigest(),macro_source_sha256=hashlib.sha256((ROOT/'asm/macros/music_voice.inc').read_bytes()).hexdigest(),reference_counts=dict(sorted(counts.items())),records=rows)
(ROOT/'docs/sound-sample-references.json').write_text(json.dumps(report,indent=2)+'\n');print(len(rows),'instrument records verify;',len(counts),'of',len(samples),'samples referenced')
