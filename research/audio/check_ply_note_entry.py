#!/usr/bin/env python3
"""Verify both C note-entry fragments and their complete ordered frame/setup path."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];BASE=0x08000000;ENTRY=0x080cfe44;MIDDLE=ENTRY+14;END=ENTRY+32;DATA=0x02000000;IWRAM=0x03000000;INFO=0x03007ff0;CLOCK=0x08207404

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/ply-note/entry';out.mkdir(parents=True,exist_ok=True)
 plugin=ROOT/'.deps/flood-core-new-backend'
 frame=['-fplugin='+str(plugin/'thumb_saved_entry_frame.so'),'-fplugin-arg-thumb_saved_entry_frame-continuation=PlyNoteEntrySetup','-fplugin-arg-thumb_saved_entry_frame-saved-lr-frame60']
 setup=['-fplugin='+str(plugin/'thumb_shared_literal.so'),'-fplugin-arg-thumb_shared_literal-literal=0x03007ff0,lt_PlyNoteSoundInfo','-fplugin-arg-thumb_shared_literal-symbol-literal=gClockTable,lt_PlyNoteClockTable','-fplugin-arg-thumb_shared_literal-omit-pool-alignment','-fplugin='+str(plugin/'tail_transfer.so'),'-fplugin-arg-tail_transfer-after-shared-literals','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-destination=PlyNoteCommandBoundary','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteCommandBoundary','-fplugin='+str(plugin/'copy_add_zero.so')]
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 sources={part:(ROOT/('research/audio/ply_note_entry_'+part+'.c')).read_text() for part in ('frame','setup')}
 def compile(label,text,options):
  path,asm,obj=[out/(label+ext) for ext in ('.c','.s','.o')];path.write_text(text)
  run=subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(asm)]+options,capture_output=True,text=True)
  (out/(label+'.log')).write_text(run.stdout+run.stderr)
  if not run.returncode:run=subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],capture_output=True,text=True)
  return run,obj
 def link(obj,label,entry):
  script,elf,binary=[out/(label+ext) for ext in ('.ld','.elf','.bin')]
  script.write_text('SECTIONS { .text '+hex(entry)+' : { *(.text) } PlyNoteEntrySetup = '+hex(MIDDLE)+'; PlyNoteCommandBoundary = '+hex(END)+'; gClockTable = '+hex(CLOCK)+'; lt_PlyNoteSoundInfo = 0x080d003c; lt_PlyNoteClockTable = 0x080d0040; }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True);return binary.read_bytes()
 pieces=[];rejects={}
 for part,options,start,end in [('frame',frame,ENTRY,MIDDLE),('setup',setup,MIDDLE,END)]:
  source=sources[part];run,obj=compile(part,source,options);assert not run.returncode,run.stderr
  code=link(obj,part,start);assert code==rom[start-BASE:end-BASE],(part,code.hex());pieces.append(code)
  if a.production:
   assert (ROOT/'fireemblem8.gba').read_bytes()==rom
   assert (ROOT/('src/m4a_ply_note_entry_'+part+'.c')).read_text()==source.replace('Candidate','Body')
   assert link(ROOT/('src/m4a_ply_note_entry_'+part+'.o'),part+'-production',start)==code
  invalid=[('debug',source,options+['-g']),('unwind',source,options+['-funwind-tables']),('argument',source.replace('Candidate(void)','Candidate(u32 arg)'),options)]
  if part=='frame':
   invalid += [('wrong_first_frame',source.replace('frameSP -= 20','frameSP -= 24'),options),('wrong_local_frame',source.replace('frameSP -= 24','frameSP -= 20'),options),('wrong_lr_slot',source.replace('(frameSP + 16) = frameLR','(frameSP + 12) = frameLR'),options),('wrong_lr_value',source.replace('= frameLR;','= frameR4;'),options),('wrong_bank',source.replace('= frameR4;','= frameR5;',1),options),('wrong_high_copy',source.replace('frameR7 = frameR11','frameR7 = frameR10'),options),('missing_mode',source,options[:-1]),('duplicate_mode',source,options+[options[-1]]),('valued_mode',source,options[:-1]+[options[-1]+'=1']),('wrong_tail',source.replace('PlyNoteEntrySetup();','OtherTail();'),options)]
   attr='__attribute__((matching_thumb_saved_entry_frame))'
  else:
   invalid += [('missing_literal',source,[x for x in options if 'symbol-literal=' not in x]),('wrong_tail',source.replace('PlyNoteCommandBoundary();','OtherTail();'),options),('stack_write',source.replace('    setupR5 = setupR2;','    setupSP += 4;\n    setupR5 = setupR2;'),options)]
   attr='__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))'
  for label,text,opts in invalid:
   run,_=compile(part+'-reject-'+label,text,opts);assert run.returncode,(part,label)
  plain=source.replace(attr,'');run,obj=compile(part+'-plain',plain,[]);assert not run.returncode,run.stderr;before=obj.read_bytes()
  # Shared literal placement is an object-wide pass, so retain it on both sides.
  if part=='setup':
   run,obj=compile(part+'-plain',plain,setup[:4]);assert not run.returncode,run.stderr;before=obj.read_bytes()
  run,obj=compile(part+'-plain',plain,options);assert not run.returncode and obj.read_bytes()==before,(part,run.stderr)
  rejects[part]=len(invalid)
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(BASE,len(rom));uc.mem_write(BASE,rom);uc.mem_map(DATA,0x4000);uc.mem_map(IWRAM,0x8000)
  if candidate:uc.mem_write(ENTRY,b''.join(pieces))
  state={}
  def access(u,kind,address,size,value,state):state['trace'].append((kind,address,size,value if kind==17 else None))
  def step(u,address,size,state):
   offset=address-ENTRY;expected=state['sp']-(0 if offset==0 else 20 if offset<=10 else 36 if offset==12 else 60)
   assert u.reg_read(r.UC_ARM_REG_SP)==expected,(hex(address),expected,u.reg_read(r.UC_ARM_REG_SP))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,state);uc.hook_add(UC_HOOK_CODE,step,state,ENTRY,END-2);machines.append((uc,state))
 rng=random.Random(ENTRY);counts={'frame':0,'complete_entry':0}
 for complete in (False,True):
  inputs=itertools.product(range(49) if complete else range(64),range(16),(DATA+64,DATA+0x1000,DATA+0x2000,DATA+0x4000),range(8) if complete else range(2))
  for index,nz,sp,alias in inputs:
   local=sp-60;track=(DATA+0x600,local-4,local,local+20,sp-8,DATA+0x3fff-4,INFO-4,local+28)[alias]
   regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=index;regs[2]=track;lr=rng.getrandbits(32)
   memory=bytearray([0xa5])*0x4000;internal=bytearray([0x5a])*0x8000;info=rng.getrandbits(32);internal[INFO-IWRAM:INFO-IWRAM+4]=info.to_bytes(4,'little');wanted=memory.copy();wantinternal=internal.copy();expected=regs.copy();trace=[]
   def write(address,size,value):
    target,base=(wanted,DATA) if DATA<=address<DATA+0x4000 else (wantinternal,IWRAM)
    target[address-base:address-base+size]=value.to_bytes(size,'little');trace.append((17,address,size,value))
   for n,value in enumerate(regs[4:8]+[lr]):write(sp-20+4*n,4,value)
   for n,value in enumerate(regs[8:12]):write(sp-36+4*n,4,value)
   expected[4:8]=regs[8:12];flags=nz;end=MIDDLE
   if complete:
    end=END;write(local,4,regs[1]);expected[5]=track
    trace += [(16,0x080d003c,4,None),(16,INFO,4,None)];write(local+4,4,info)
    trace += [(16,0x080d0040,4,None),(16,CLOCK+index,1,None)]
    gate=rom[CLOCK+index-BASE];write(track+4,1,gate);expected[0]=gate;expected[1]=CLOCK;flags=0
   for uc,state in machines:
    uc.mem_write(DATA,bytes(memory));uc.mem_write(IWRAM,bytes(internal));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
    for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
    uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,lr);state.update(trace=[],sp=sp);uc.emu_start(ENTRY|1,end,count=20)
    assert uc.reg_read(r.UC_ARM_REG_PC)==end and uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
    assert uc.reg_read(r.UC_ARM_REG_SP)==local and uc.reg_read(r.UC_ARM_REG_LR)==lr
    assert bytes(uc.mem_read(DATA,0x4000))==wanted and bytes(uc.mem_read(IWRAM,0x8000))==wantinternal and state['trace']==trace,(complete,index,nz,alias,state['trace'],trace)
   counts['complete_entry' if complete else 'frame']+=1
 report=dict(cases=sum(counts.values()),outcomes=counts,instruction_bytes=32,rejected_contracts=rejects,unannotated_unchanged=True,production_integrated=a.production,scope='Separate frame and complete entry models; all 49 clock-table indices/NZCV, four stack boundaries, frame/global-pointer byte aliases, full registers/SP/LR, SP at every instruction, both RAM blocks and ordered accesses.',limitations='Prepared synthetic state and sampled saved words/pointers; stops before note command decoding. No complete note or hardware-timing claim.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
