#!/usr/bin/env python3
"""Research rebuild of duplicate data without reading its opaque initializer."""
import hashlib,json,struct,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'.deps/orphan-rebuild';OUT.mkdir(exist_ok=True)
def run(args):subprocess.run(args,cwd=ROOT,check=True,stdout=subprocess.DEVNULL,stderr=subprocess.PIPE)
placeholder=OUT/'placeholder.o';assembly=OUT/'placeholder.s'
assembly.write_text('.section .data\n.global gUnkData_108\ngUnkData_108:\n.space 0xa788\n')
run(['arm-none-eabi-as','-o',str(placeholder),str(assembly)])
old='src/data_B1FE7C.o';ldscript=(ROOT/'ldscript.txt').read_text();objects=(ROOT/'objects.lst').read_text()
assert old in ldscript and old in objects
(OUT/'link.ld').write_text(ldscript.replace(old,str(placeholder)))
(OUT/'objects.lst').write_text(objects.replace(old,str(placeholder)))
run(['arm-none-eabi-ld','-T',str(OUT/'link.ld'),'@'+str(OUT/'objects.lst'),'-R','banim/data_banim.o.sym.o','-L','.deps/runtime-c','-L','tools/agbcc/lib','-o',str(OUT/'stage.elf'),'-lc','-lgcc'])
run(['arm-none-eabi-objcopy','-O','binary','-j','ROM',str(OUT/'stage.elf'),str(OUT/'stage.bin')])
stage=(OUT/'stage.bin').read_bytes();assert stage[0xb1fe7c:0xb2a604]==bytes(0xa788)
data=bytearray(stage[0xb15740:0xb1fe7c]);shifted=0
for offset in range(0x9ff4,len(data),4):
 value=struct.unpack_from('<I',data,offset)[0]
 if 0x08b1f734<=value<0x08b1fe7c:
  struct.pack_into('<I',data,offset,value+0xa73c);shifted+=1
assert shifted==260
assert struct.unpack_from('<I',data,0xa028)[0]==0x08587790
# Historical rodata address remains an explicit fidelity constant, not a live pointer.
struct.pack_into('<I',data,0xa028,0x085913f0)
tail=bytearray(stage[0xb1fe30:0xb1fe7c])
for offset in range(0,16,4):struct.pack_into('<I',tail,offset,struct.unpack_from('<I',tail,offset)[0]+0xa788)
data+=tail;assert len(data)==0xa788
# Reference ROM is used only after generating the entire candidate.
assert data==(ROOT/'baserom.gba').read_bytes()[0xb1fe7c:0xb2a604]
(OUT/'orphan.bin').write_bytes(data)
report=dict(bytes=len(data),sha256=hashlib.sha256(data).hexdigest(),opaque_object_excluded=True,placeholder_bytes_verified_zero=True,uniform_pointer_changes=shifted,tail_pointer_changes=4,historical_rodata_constant='0x085913f0',scope='Research candidate derived from a fresh provisional link of current recovered objects with the opaque object replaced by zero storage. Reference ROM used only for final comparison. Does not rebuild every input object, establish historical origin/reachability, or integrate production build.',output=str(OUT/'orphan.bin'))
(ROOT/'docs/orphan-object-rebuild.json').write_text(json.dumps(report,indent=2)+'\n');print(len(data),'bytes rebuild exactly without opaque source object')
