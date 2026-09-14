#!/usr/bin/env python3
"""Verify the final residual lookup bytes by fresh compilation or explicit source."""
import hashlib,json,subprocess,tempfile
from pathlib import Path
from audit_linked_code import read_contributions
ROOT=Path(__file__).resolve().parents[1]
def sha(x):return hashlib.sha256(x).hexdigest()
def main():
 prior=json.loads((ROOT/'docs/unmapped-asset-provenance.json').read_text());elf=ROOT/'fireemblem8.elf';assert prior['elf_sha256']==sha(elf.read_bytes())
 excluded={'src/data_terrains.o','src/fontgrp.o','src/data/unit_icon/const_data_unit_icon_move.o'}
 residual=[r for r in prior['residual'] if r['object'] not in excluded];rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
 contributions=read_contributions((ROOT/'fireemblem8.map').read_text());records=[]
 with tempfile.TemporaryDirectory(prefix='residual-lookup-audit-') as tmp:
  tmp=Path(tmp);done={}
  for r in residual:
   obj=r['object'];start,end=int(r['start'],16),int(r['end'],16);wanted=rom[start-0x08000000:end-0x08000000]
   record=dict(r)
   if obj.startswith('src/'):
    source=ROOT/obj.replace('.o','.c')
    if obj not in done:
     pp=subprocess.check_output(['arm-none-eabi-cpp','-I','tools/agbcc/include','-iquote','include','-iquote','.','-nostdinc','-undef',str(source)],cwd=ROOT)
     inp=tmp/'source.i';inp.write_bytes(pp.decode('utf8').encode('cp932'));asm=tmp/'source.s';fresh=tmp/(source.stem+'.o')
     subprocess.run([str(ROOT/'tools/agbcc/bin/agbcc'),'-mthumb-interwork','-Wimplicit','-Wparentheses','-Werror','-O2','-fhex-asm','-ffix-debug-line',str(inp),'-o',str(asm)],check=True,capture_output=True)
     with asm.open('a') as f:f.write('\n.ALIGN 2, 0\n')
     subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi','-mthumb-interwork','-I',str(ROOT/'include'),str(asm),'-o',str(fresh)],check=True,capture_output=True);done[obj]=fresh
    c=next(c for c in contributions if c['object']==obj and c['start']<=start and c['end']>=end)
    output=tmp/'section.bin';subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j',c['section'],str(done[obj]),str(output)],check=True,capture_output=True)
    data=output.read_bytes()[start-c['start']:end-c['start']];assert data==wanted,(obj,c['section'])
    record.update(method='fresh C compilation',source_sha256=sha(source.read_bytes()),section=c['section'])
   elif obj=='asm/fe6sio.o':
    source=ROOT/'src/data/fe6_rom_header.inc'
    wrapper=tmp/'serial_header.s';fresh=tmp/'serial_header.o';output=tmp/'serial_header.bin'
    wrapper.write_text('.section .data\n.include "src/data/fe6_rom_header.inc"\n')
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(wrapper),'-o',str(fresh)],cwd=ROOT,check=True,capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.data',str(fresh),str(output)],check=True,capture_output=True)
    contribution=next(c for c in contributions if c['object']==obj and c['section']=='.data.serial_header')
    offset=start-contribution['start'];data=output.read_bytes()
    assert len(data)==188 and data[offset:offset+len(wanted)]==wanted
    record.update(method='fresh assembly of explicit header data',source_sha256=sha(source.read_bytes()),section=contribution['section'])
   elif obj=='asm/arm.o':
    source=(ROOT/'asm/arm.s').read_bytes();assert b'.LOamLoPutIt: .4byte gOamLoPutIt' in source
    lines=subprocess.check_output(['arm-none-eabi-nm',str(elf)],text=True).splitlines();address=int(next(x.split()[0] for x in lines if x.endswith(' gOamLoPutIt')),16)
    assert wanted==address.to_bytes(4,'little');record.update(method='explicit pointer pool',target='gOamLoPutIt',source_sha256=sha(source))
   else:
    assert obj=='tools/agbcc/lib/libc.a(vfprintf.o)'
    source=(ROOT/'.deps/agbcc/libc/stdio/vfprintf.c').read_bytes();assert b'#define\tPADSIZE\t16' in source
    assert b"{' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '}" in source
    assert b"{'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'}" in source
    assert wanted==b' '*16+b'0'*16;record.update(method='explicit libc padding arrays',source_sha256=sha(source))
   record['sha256']=sha(wanted);records.append(record)
 report=dict(verified_bytes=sum(r['bytes'] for r in records),regions=len(records),fresh_c_objects=len(done),remaining_unbound_bytes=0,elf_sha256=sha(elf.read_bytes()),map_sha256=sha((ROOT/'fireemblem8.map').read_bytes()),compiler_sha256=sha((ROOT/'tools/agbcc/bin/agbcc').read_bytes()),records=records,scope='Residual bytes reproduce from fresh C translation units, explicit serial-header assembly data, or pointer/libc source definitions. Completes provenance of the previously unmapped-input inventory together with prior receipts; not a no-execution proof, mapped-data audit or whole-game completion.')
 (ROOT/'docs/final-unmapped-provenance.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k!='records'},indent=2))
if __name__=='__main__':main()
