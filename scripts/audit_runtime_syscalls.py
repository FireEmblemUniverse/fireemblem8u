#!/usr/bin/env python3
"""Bind the active Angel inline template to fresh object and linked ROM bytes."""
import hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
receipt=ROOT/'docs/runtime-rebuild.json'; rebuild=json.loads(receipt.read_text())
build=Path(rebuild['build_directory'])
source=build/'libc/arm/syscalls.c';asm=build/'libc/arm/syscalls.s';obj=build/'libc/arm/syscalls.o'
pin=rebuild['source_commit']
pinned=subprocess.check_output(['git','-C',str(ROOT/'.deps/agbcc'),'show',pin+':libc/arm/syscalls.c'])
assert source.read_bytes()==pinned
assert 'mov r0, %1; mov r1, %2; swi %a3; mov %0, r0' in source.read_text()
assert sha(ROOT/'fireemblem8.elf')==rebuild['images']['main_rom']['original_elf_sha256']
assert sha(ROOT/'fireemblem8.map')==rebuild['images']['main_rom']['original_map_sha256']
rom=(ROOT/'fireemblem8.gba').read_bytes()
assert hashlib.sha1(rom).hexdigest()==rebuild['images']['main_rom']['sha1']
out=ROOT/'.deps/runtime-syscalls';out.mkdir(exist_ok=True)
rows=[];lines=[];function=None
for line in asm.read_text().splitlines():
    m=re.match(r'([A-Za-z_][A-Za-z_0-9]*):$',line)
    if m:function=m[1]
    if re.search(r'\bswi\b',line):
        assert re.fullmatch(r'\s*mov r0, (r\d+); mov r1, (sp|r\d+); swi 171; mov (r\d+), r0',line),line
        n=len(rows);lines+=['syscall_inline_start_'+str(n)+':',line,'syscall_inline_end_'+str(n)+':']
        rows.append(dict(function=function,assembly=line.strip()))
    else:lines.append(line)
assert len(rows)==13
annotated=out/'annotated.s';annotated.write_text('\n'.join(lines)+'\n')
marked=out/'annotated.o'
subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(annotated),'-o',str(marked)],check=True)
blobs=[]
for name,path in [('fresh',obj),('marked',marked)]:
    blob=out/(name+'.bin')
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(path),str(blob)],check=True)
    blobs.append(blob.read_bytes())
assert blobs[0]==blobs[1], 'Labels must not change text'
archive_obj=out/'installed.o';archive_obj.write_bytes(subprocess.check_output(['arm-none-eabi-ar','p',str(ROOT/'tools/agbcc/lib/libc.a'),'syscalls.o']))
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(archive_obj),str(out/'installed.bin')],check=True)
assert blobs[0]==(out/'installed.bin').read_bytes()
symbols={parts[2]:int(parts[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(marked)],text=True).splitlines() if len(parts:=line.split())==3}
m=re.findall(r'^ \.text\s+(0x[0-9a-f]+)\s+(0x[0-9a-f]+)\s+.*libc\.a\(syscalls\.o\)$',(ROOT/'fireemblem8.map').read_text(),re.M)
assert len(m)==1
address,size=map(lambda x:int(x,16),m[0]);assert size==len(blobs[0])
for n,row in enumerate(rows):
    start=symbols['syscall_inline_start_'+str(n)];end=symbols['syscall_inline_end_'+str(n)]
    code=blobs[0][start:end];assert len(code)==8 and code[4:6]==bytes.fromhex('abdf')
    assert rom[address-0x08000000+start:address-0x08000000+end]==code
    row.update(object_offset=start,rom_address=hex(address+start),bytes=8,hex=code.hex(),swi_bytes=2,register_move_bytes=6)
report=dict(source_pin=pin,source_sha256=sha(source),rebuild_receipt_sha256=sha(receipt),assembly_sha256=sha(asm),object_text_sha256=hashlib.sha256(blobs[0]).hexdigest(),inline_sites=len(rows),inline_instruction_bytes=sum(x['bytes'] for x in rows),swi_instruction_bytes=26,register_move_instruction_bytes=78,whole_object_mapped_instruction_bytes=1014,sites=rows,limitations=['Counts the active ARM_RDI_MONITOR variant only; inactive source branches are not linked instructions.','This is byte provenance, not a claim of reachability or GBA BIOS semantics for the monitor service.','No inline instructions have been replaced.'])
(ROOT/'docs/runtime-syscall-inline.json').write_text(json.dumps(report,indent=2)+'\n')
print('13 exact sites: 104 inline bytes = 26 SWI + 78 register moves')
