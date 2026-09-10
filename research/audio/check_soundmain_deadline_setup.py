#!/usr/bin/env python3
"""Verify matching private deadline setup and conditional VCOUNT accesses."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cf4e8;END=ENTRY+20;DATA=0x02000000;SP=DATA+0x1000;VCOUNT=0x04000006

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--guards-only',action='store_true');p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/deadline-setup';out.mkdir(exist_ok=True)
 source=(ROOT/'research/audio/soundmain_deadline_setup.c').read_text().replace('void SoundMainDeadlineSetupCandidate','extern void SoundMainCallbacks(void);\n__attribute__((matching_tail_transfer))\nvoid SoundMainDeadlineSetupCandidate').replace('    setupFrame->deadline = setupDeadline;', '    setupFrame->deadline = setupDeadline;\n    SoundMainCallbacks();')
 extra=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_shared_literal.so'),'-fplugin-arg-thumb_shared_literal-literal=0x04000006,lt_REG_VCOUNT','-fplugin-arg-thumb_shared_literal-omit-pool-alignment','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-after-shared-literals','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-destination=SoundMainCallbacks','-fplugin-arg-tail_transfer-terminal-adjacent-destination=SoundMainCallbacks','-fplugin-arg-tail_transfer-raise-unsigned-bound']
 def compile(name,text=source,options=extra):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
  result=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-falign-functions=4','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]+options+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('matching');assert not result.returncode,result.stderr
 elf=out/'candidate.elf';binary=out/'candidate.bin'
 subprocess.run(['arm-none-eabi-ld','-Ttext='+hex(ENTRY),'--entry=SoundMainDeadlineSetupCandidate','--defsym=lt_REG_VCOUNT=0x080cf540','--defsym=SoundMainCallbacks='+hex(END|1),str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==20 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes()
  assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
  assert code==production[ENTRY-0x08000000:END-0x08000000]

 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000);uc.mem_map(0x04000000,0x1000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,log):log.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,0x04000000,0x04000fff)
  machines.append((uc,trace))
 rng=random.Random(0xd34d);cases=0
 # Exhaust every byte input, all NZCV, and an alias of the final stack destination.
 for max_lines in ([] if a.guards_only else range(256)):
  for scanline in range(256):
   for info in (DATA+0x400,SP+8):
    for initial in range(16):
     memory=bytearray([0xa5])*0x4000;memory[info+12-DATA]=max_lines;wanted=memory.copy()
     adjusted=scanline+(228 if scanline<160 else 0);deadline=max_lines+adjusted if max_lines else 0
     wanted[SP+20-DATA:SP+24-DATA]=deadline.to_bytes(4,'little')
     regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=info;expected=regs.copy();expected[1]=deadline
     trace_wanted=[(16,info+12,1,None)]
     if max_lines:expected[2]=adjusted;trace_wanted.append((16,VCOUNT,1,None))
     trace_wanted.append((17,SP+20,4,deadline))
     for uc,trace in machines:
      uc.mem_write(DATA,bytes(memory));uc.mem_write(VCOUNT,bytes([scanline]));trace.clear()
      for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
      uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28);uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679)
      uc.emu_start(ENTRY|1,END,count=15)
      assert uc.reg_read(r.UC_ARM_REG_PC)==END and uc.reg_read(r.UC_ARM_REG_CPSR)&0x20
      assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
      assert uc.reg_read(r.UC_ARM_REG_CPSR)>>28==(0 if max_lines else 6)
      assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
      assert bytes(uc.mem_read(DATA,0x4000))==wanted and trace==trace_wanted
     cases+=1
 negatives={
  'retained_alignment':(source,[o for o in extra if 'omit-pool-alignment' not in o]),
  'early_tail':(source,[o for o in extra if 'after-shared-literals' not in o]),
  'post_call_write':(source.replace('    SoundMainCallbacks();','    SoundMainCallbacks(); setupDeadline++;'),extra),
  'bare_return':(source.replace('    if (setupDeadline) {','    if (!setupDeadline) return;\n    if (setupDeadline) {'),extra),
  'second_call':(source.replace('    setupFrame->deadline = setupDeadline;','    if (setupDeadline) { SoundMainCallbacks(); return; }\n    setupFrame->deadline = setupDeadline;'),extra),
  'missing_adjacency':(source,[o for o in extra if 'terminal-adjacent-destination' not in o]),
  'duplicate_late_option':(source,extra+['-fplugin-arg-tail_transfer-after-shared-literals']),
 }
 for name,(text,options) in negatives.items():
  result,_=compile(name,text,options);assert result.returncode,(name,result.stderr)
 report=dict(cases=cases,section_bytes=20,byte_exact=True,production_integrated=a.production,invalid_contracts_rejected=len(negatives),scope='Compilation and byte checks only; no execution cases.' if a.guards_only else 'Every maxLines/VCOUNT byte pair, two info/frame aliases, every initial NZCV; complete registers, SP/LR, RAM and ordered byte read/MMIO read/stack write; no VCOUNT access when disabled.',limitations='Original frame allocation and callback execution remain outside this candidate; final fallthrough requires adjacent callback placement.')
 (out/('guards.json' if a.guards_only else 'report.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
