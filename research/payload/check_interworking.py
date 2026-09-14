#!/usr/bin/env python3
"""Build and model C interworking veneers at every payload's original addresses."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];out=ROOT/'.deps/payload-interworking';out.mkdir(exist_ok=True)
parser=argparse.ArgumentParser();parser.add_argument('--source-dir',type=Path,default=ROOT/'research/payload');parser.add_argument('--json',type=Path,default=ROOT/'docs/payload-interworking-research.json');args=parser.parse_args();source_dir=args.source_dir.resolve()
cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
subprocess.run(['python3',str(ROOT/'tools/arm-dispatch/build_thumb_arm_entry.py'),'--compiler',str(cc),'--output-dir',str(out)],check=True)
common=['-c','-O2','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
subprocess.run([str(cc),*common,'-mthumb','-ffunction-sections','-Werror=attributes','-fplugin='+str(out/'thumb_arm_entry.so'),str(source_dir/'thumb_entries.c'),'-o',str(out/'thumb.o')],check=True)
subprocess.run(['arm-none-eabi-gcc',*common,'-marm','-mno-thumb-interwork','-fno-builtin','-fomit-frame-pointer',str(source_dir/'arm_entries.c'),'-o',str(out/'arm.o')],check=True)
regs=[getattr(r,f'UC_ARM_REG_R{n}') for n in range(15)];rng=random.Random(0x16fc8);images=[];rejected=[]
for name in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
 symbols={p[-1]:int(p[0],16) for line in subprocess.check_output(['arm-none-eabi-nm','-g','-S',str(ROOT/f'mgfembp/{name}.elf')],text=True).splitlines() if len(p:=line.split()) in (3,4)}
 start=symbols['ClearOam_thm'];assert symbols['Checksum32_thm']==start+8 and start%4==0
 layout=f'''SECTIONS {{ .text {start} : {{ *(.text.ClearOam_thm) *(.text.payload_arm_clear) *(.text.Checksum32_thm) *(.text.payload_arm_checksum) }}
 ClearOam = {symbols['ClearOam']}; Checksum32 = {symbols['Checksum32']};
 ASSERT(PayloadArmClear == ClearOam_thm + 4, "clear handoff moved")
 ASSERT(PayloadArmChecksum == Checksum32_thm + 4, "checksum handoff moved")
 ASSERT((ClearOam_thm & 3) == 0, "entry alignment changed")
 ASSERT(SIZEOF(.text) == 16, "veneer size changed")
 /DISCARD/ : {{ *(*) }} }}'''
 script=out/(name+'.ld');script.write_text(layout);elf=out/(name+'.elf');blob=out/(name+'.bin')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(out/'thumb.o'),str(out/'arm.o'),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary',str(elf),str(blob)],check=True)
 for control,altered in [('gap',layout.replace('*(.text.payload_arm_clear)', '. += 4; *(.text.payload_arm_clear)')),('wrong_adjacency',layout.replace('PayloadArmChecksum == Checksum32_thm + 4','PayloadArmChecksum == Checksum32_thm + 8'))]:
  bad=out/(name+'-'+control+'.ld');bad.write_text(altered)
  result=subprocess.run(['arm-none-eabi-ld','-T',str(bad),str(out/'thumb.o'),str(out/'arm.o'),'-o',str(out/(name+'-'+control+'.elf'))],capture_output=True,text=True)
  assert result.returncode and 'handoff moved' in result.stderr,(control,result.stderr)
  rejected.append(name+':'+control)
 code=blob.read_bytes();binary=(ROOT/f'mgfembp/{name}.bin').read_bytes()
 assert code==binary[start-0x02010000:start-0x02010000+16]
 cases=0
 for entry,target in [(start,symbols['ClearOam']),(start+8,symbols['Checksum32'])]:
  for flags in range(16):
   for sample in range(8):
    initial=[rng.getrandbits(32) for _ in regs];initial[13]=0x03004000
    u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x02010000,0x10000);u.mem_write(start,code)
    cpsr=0x3f|(flags<<28);u.reg_write(r.UC_ARM_REG_CPSR,cpsr)
    for reg,value in zip(regs,initial):u.reg_write(reg,value)
    writes=[];u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,addr,size,value,data:writes.append((addr,size,value)))
    u.emu_start(entry|1,0,count=2)
    assert [u.reg_read(reg) for reg in regs]==initial and not writes
    assert u.reg_read(r.UC_ARM_REG_CPSR)==(cpsr&~0x20) and u.reg_read(r.UC_ARM_REG_PC)==target
    cases+=1
 images.append(dict(image=name,address=hex(start),exact_bytes=16,cases=cases,code_sha256=hashlib.sha256(code).hexdigest()))
report=dict(rejected_layouts=rejected,images=images,cases=sum(x['cases'] for x in images),source_sha256={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in source_dir.glob('*entries.c')},scope='C replacements; two executed instructions per veneer (BX PC, ARM branch), padding NOP skipped. Checks register/flag preservation and exact destination, not callee execution.')
args.json.write_text(json.dumps(report,indent=2)+'\n');print(report['cases'],'interworking cases passed; all three regions exact')
