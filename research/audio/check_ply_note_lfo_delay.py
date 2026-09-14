#!/usr/bin/env python3
"""Verify note LFO delay storage, comparison flags and private continuations."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];BASE=0x08000000;DATA=0x02000000
ENTRY=0x080cff9c;END=0x080cffa6;SKIP=0x080cffaa

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');p.add_argument('--inequality',action='store_true');a=p.parse_args();assert not (a.production and a.inequality)
 out=ROOT/('.deps/soundmain-packed/ply-note/lfo-delay-ne' if a.inequality else '.deps/soundmain-packed/ply-note/lfo-delay');out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'research/audio/ply_note_lfo_delay.c').read_text()
 if a.inequality:source=source.replace('argR0 == argR1','argR0 != argR1')
 opts=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-destination=PlyNoteModInvoke','-fplugin-arg-tail_transfer-destination=PlyNoteTrackVolumeSetup','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteModInvoke','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_direct_tails.so'),'-fplugin-arg-thumb_direct_tails-destination=PlyNoteTrackVolumeSetup','-fplugin-arg-thumb_direct_tails-expected-transfers=1','-fplugin-arg-thumb_direct_tails-register-equality']
 def compile(label,text=source,options=opts):
  path,asm,obj=[out/(label+ext) for ext in ('.c','.s','.o')];path.write_text(text)
  run=subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(asm)]+options,capture_output=True,text=True)
  (out/(label+'.log')).write_text(run.stdout+run.stderr)
  if not run.returncode:run=subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],capture_output=True,text=True)
  return run,obj
 def link(obj,label):
  script,elf,binary=[out/(label+ext) for ext in ('.ld','.elf','.bin')]
  script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } PlyNoteModInvoke = '+hex(END)+'; PlyNoteTrackVolumeSetup = '+hex(SKIP)+'; }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True)
  subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True);return binary.read_bytes()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 run,obj=compile('candidate');assert not run.returncode,run.stderr
 code=link(obj,'candidate');expected_code=bytearray(rom[ENTRY-BASE:END-BASE])
 if a.inequality:expected_code[7]^=1
 assert code==expected_code,code.hex()
 if a.production:
  assert (ROOT/'fireemblem8.gba').read_bytes()==rom
  assert (ROOT/'src/m4a_ply_note_lfo_delay.c').read_text()==source.replace('Candidate','Body')
  assert link(ROOT/'src/m4a_ply_note_lfo_delay.o','production')==code
 invalid=[('unsigned_comparison',source.replace('argR0 != argR1' if a.inequality else 'argR0 == argR1','argR0 < argR1'),opts),('high_operand',source.replace('argR1 asm("r1")','argR1 asm("r8")'),opts),('missing_mode',source,opts[:-1]),('duplicate_mode',source,opts+[opts[-1]]),('valued_mode',source,opts[:-1]+[opts[-1]+'=1']),('mixed_mode',source,opts+['-fplugin-arg-thumb_direct_tails-unsigned-immediate=lt']),('wrong_count',source,[x.replace('expected-transfers=1','expected-transfers=2') for x in opts]),('extra_target',source,opts+['-fplugin-arg-thumb_direct_tails-destination=OtherTarget']),('wrong_target',source.replace('PlyNoteTrackVolumeSetup();','OtherTarget();'),opts),('debug',source,opts+['-g']),('unwind',source,opts+['-funwind-tables']),('entry_argument',source.replace('Candidate(void)','Candidate(u32 arg)'),opts)]
 for label,text,options in invalid:
  run,_=compile('reject-'+label,text,options);assert run.returncode,label
 plain=source.replace('__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero, matching_thumb_direct_tails))','')
 run,obj=compile('plain',plain,[]);assert not run.returncode,run.stderr;before=obj.read_bytes()
 run,obj=compile('plain',plain);assert not run.returncode and obj.read_bytes()==before,run.stderr
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(BASE,len(rom));uc.mem_write(BASE,rom);uc.mem_map(DATA,0x4000)
  if candidate or a.inequality:uc.mem_write(ENTRY,code if candidate else bytes(expected_code))
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  def stop(u,address,size,data):
   if address in (END,SKIP):u.emu_stop()
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);uc.hook_add(UC_HOOK_CODE,stop);machines.append((uc,trace))
 rng=random.Random(ENTRY);counts=dict(reset=0,skip=0)
 for delay,nz,alias in itertools.product(range(256),range(16),range(4)):
  for reference in (delay,0,1,255,256,0x7fffffff,0x80000000,0xffffffff,delay+1,(delay-1)&0xffffffff):
   sp=DATA+0x1000+alias*0x800;track=(DATA+0x600,sp-27,sp-28,DATA+0x3fff-28)[alias]
   regs=[rng.getrandbits(32) for _ in range(13)];regs[1]=reference;regs[5]=track
   memory=bytearray([0xa5])*0x4000;memory[track+27-DATA]=delay;expected_memory=memory.copy();expected_memory[track+28-DATA]=delay
   expected=regs.copy();expected[0]=delay;skip=(delay!=reference) if a.inequality else (delay==reference);target=SKIP if skip else END
   if skip:
    difference=(delay-reference)&0xffffffff
    overflow=bool(((delay^reference)&(delay^difference))&0x80000000)
    flags=((difference>>31)<<3)|((difference==0)<<2)|((delay>=reference)<<1)|overflow
   else:expected[1]=track;flags=0
   reads=[(16,track+27,1,None),(17,track+28,1,delay)]
   for uc,trace in machines:
    uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
    for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
    uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,0,count=10)
    assert uc.reg_read(r.UC_ARM_REG_PC)==target and uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,(delay,reference,nz,alias)
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
    assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
    assert bytes(uc.mem_read(DATA,0x4000))==expected_memory and trace==reads
   counts['skip' if skip else 'reset']+=1
 report=dict(inequality_regression=a.inequality,cases=sum(counts.values()),outcomes=counts,instruction_bytes=len(code),rejected_contracts=len(invalid),unannotated_unchanged=True,production_integrated=a.production,scope='All delay bytes and incoming NZCV, sampled full-width comparisons, four stack/track positions including read/write frame aliases and final RAM byte. Exact registers/SP/LR/NZCV/RAM and ordered byte access.',limitations='Stops before modulation reset or track-volume setup; no real callee or full note execution.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
