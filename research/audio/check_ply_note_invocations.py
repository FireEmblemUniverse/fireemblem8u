#!/usr/bin/env python3
"""Verify six note call boundaries with exact private callback entry/return state."""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import random
import subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
DATA=0x02000000
PARTS={
 'clear':('Clear',0x080cff86,4,'ClearChain',0x080d0550,'PlyNoteChannelLink',0x080cff8a),
 'mod':('Mod',0x080cffa6,4,'clear_modM',0x080d0084,'PlyNoteTrackVolumeSetup',0x080cffaa),
 'track_volume':('TrackVolume',0x080cffae,4,'TrkVolPitSet',0x080d0b1c,'PlyNoteChannelInit',0x080cffb2),
 'volume':('Volume',0x080cffd4,4,'ChnVolSetAsm',0x080cfe14,'PlyNoteFrequencySetup',0x080cffd8),
 'cgb_frequency':('CgbFrequency',0x080d000c,6,'call_r3',0x080cfdc0,'PlyNoteFinish',0x080d001c),
 'pcm_frequency':('PcmFrequency',0x080d0018,4,'MidiKeyToFreq',0x080d00d4,'PlyNoteFinish',0x080d001c),
}

def check(part,a,rom):
 title,entry,size,callee,tramp,continuation,end=PARTS[part];indirect=part=='cgb_frequency'
 out=ROOT/'.deps/soundmain-packed/ply-note/calls'/part;out.mkdir(parents=True,exist_ok=True)
 name='PlyNote'+title+'InvokeCandidate';source=(ROOT/('research/audio/ply_note_'+part+'_invoke.c')).read_text()
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_callback_tail.so'),
          '-fplugin-arg-thumb_callback_tail-'+('trampoline' if indirect else 'direct-callee')+'='+callee,
          '-fplugin-arg-thumb_callback_tail-continuation='+continuation]
 if not indirect:options+=['-fplugin-arg-thumb_callback_tail-fallthrough']
 def compile(label,text=source,opts=options):
  path,obj=out/(label+'.c'),out/(label+'.o');path.write_text(text)
  run=subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes',
   '-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(out/(label+'.s'))]+opts,capture_output=True,text=True)
  (out/(label+'.log')).write_text(run.stdout+run.stderr)
  if not run.returncode:run=subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(out/(label+'.s')),'-o',str(obj)],capture_output=True,text=True)
  return run,obj
 run,obj=compile('candidate');assert not run.returncode,run.stderr
 stub=out/'stub.s';stub.write_text('.syntax unified\n.thumb\n.global '+callee+'\n.thumb_func\n'+callee+':\n'+(' bx r3\n' if indirect else ' str r0, [r1]\n bx lr\n'))
 stubobj=out/'stub.o';subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(stub),'-o',str(stubobj)],check=True)
 def link(obj,label):
  script,elf,binary=out/(label+'.ld'),out/(label+'.elf'),out/(label+'.bin')
  script.write_text('SECTIONS { .text '+hex(entry)+' : { '+str(obj)+'(.text) } .stub '+hex(tramp)+' : { '+str(stubobj)+'(.text) } '+continuation+' = '+hex(end)+'; }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),str(stubobj),'-o',str(elf)],check=True)
  subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  return binary.read_bytes()
 code=link(obj,'candidate');assert code==rom[entry-0x08000000:entry-0x08000000+size],(part,code.hex())
 if a.production:
  assert (ROOT/('src/m4a_ply_note_'+part+'_invoke.c')).read_text()==source.replace(name,name.replace('Candidate','Body'))
  assert (ROOT/'fireemblem8.gba').read_bytes()==rom
  assert link(ROOT/('src/m4a_ply_note_'+part+'_invoke.o'),'production')==code
  symbols=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True)
  matches=[line.split() for line in symbols.splitlines() if line.split() and line.split()[-1]==callee]
  assert len(matches)==1 and matches[0][3]=='FUNC' and int(matches[0][1],16)==tramp|1,matches
 call='((void (*)(void))callInput3)();' if indirect else callee+'();'
 invalid=[
  ('wrong_register',source.replace('callInput3 asm("r3")','callInput3 asm("r4")'),options),
  ('post_call_work',source.replace(continuation+'();','callInput0=1; '+continuation+'();'),options),
  ('wrong_continuation',source.replace(continuation+'();','OtherContinuation();'),options),
  ('entry_argument',source.replace(name+'(void)',name+'(u32 arg)'),options),
  ('conditional_call',source.replace('    '+call,'    if (callInput0) '+call),options),
  ('missing_binding',source.replace('register volatile u32 callInput2 asm("r2");',''),options),
  ('debug',source,options+['-g']),('unwind',source,options+['-funwind-tables']),
  ('duplicate_target',source,options+[options[1]]),('missing_target',source,options[:1]+options[2:]),
  ('mixed_modes',source,options+['-fplugin-arg-thumb_callback_tail-'+('direct-callee=OtherCallee' if indirect else 'trampoline=call_r3')]),
  ('valued_fallthrough',source,options+['-fplugin-arg-thumb_callback_tail-fallthrough=1']),
 ]
 for label,text,opts in invalid:
  run,_=compile('reject-'+label,text,opts);assert run.returncode,(part,label)
 plain=source.replace('__attribute__((matching_thumb_callback_tail))','')
 run,obj=compile('plain',plain,[]);assert not run.returncode,run.stderr;before=obj.read_bytes()
 run,obj=compile('plain',plain);assert not run.returncode and before==obj.read_bytes(),run.stderr
 targets=(0x080e0001,0x080e0020) if indirect else (tramp|1,)
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(entry,code)
  if indirect:assert rom[tramp-0x08000000:tramp-0x08000000+2]==bytes.fromhex('1847')
  for target in targets:uc.mem_write(target&~1,bytes.fromhex('08607047' if target&1 else '000081e51eff2fe1'))
  state={}
  def access(u,kind,address,size,value,state):state['accesses'].append((kind,address,size,value if kind==17 else None))
  def callback(u,address,size,state):
   if address not in [t&~1 for t in targets]:return
   state['entries'].append(([u.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)],u.reg_read(r.UC_ARM_REG_SP),u.reg_read(r.UC_ARM_REG_LR),u.reg_read(r.UC_ARM_REG_CPSR)))
   for n,value in enumerate(state['clobbers']):u.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   u.reg_write(r.UC_ARM_REG_CPSR,(u.reg_read(r.UC_ARM_REG_CPSR)&0x0fffffff)|(state['flags']<<28))
  uc.hook_add(UC_HOOK_CODE,callback,state);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,state,DATA,DATA+0x3fff);machines.append((uc,state))
 rng=random.Random(entry);cases=0
 for target,initial,returned,sp,offset,trial in itertools.product(targets,range(16),range(16),(DATA+0x1000,DATA+0x1800,DATA+0x2000,DATA+0x2800),(-36,0,36),range(8)):
  memory=bytearray([0xa5])*0x4000;wanted=memory.copy();regs=[rng.getrandbits(32) for _ in range(13)]
  if indirect:regs[3]=target
  clobbers=[rng.getrandbits(32) for _ in range(13)];clobbers[1]=sp+offset;wanted[sp+offset-DATA:sp+offset-DATA+4]=clobbers[0].to_bytes(4,'little')
  for uc,state in machines:
   uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
   for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);state.update(entries=[],accesses=[],clobbers=clobbers,flags=returned)
   uc.emu_start(entry|1,end,count=12)
   assert state['entries']==[(regs,sp,(entry+4)|1,(0x33 if target&1 else 0x13)|initial<<28)],part
   assert uc.reg_read(r.UC_ARM_REG_PC)==end and uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|returned<<28,part
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==clobbers,part
   assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==(entry+4)|1,part
   assert bytes(uc.mem_read(DATA,0x4000))==wanted and state['accesses']==[(17,sp+offset,4,clobbers[0])],part
  cases+=1
 report=dict(part=part,cases=cases,instruction_bytes=size,rejected_contracts=len(invalid),unannotated_unchanged=True,production_integrated=a.production,
  source_sha256=hashlib.sha256(source.encode()).hexdigest(),scope='Synthetic STR/BX LR callbacks with all incoming/returned NZCV, all registers/SP/LR, RAM and ordered writes; four frame positions and three write aliases.',
  limitations='Tests private call/return mechanics, not actual callee behavior or full ply_note execution. Indirect call covers both ARM and Thumb callback modes.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');return report

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');p.add_argument('--part',choices=PARTS);a=p.parse_args()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 reports=[check(part,a,rom) for part in ([a.part] if a.part else PARTS)]
 result=dict(instruction_bytes=sum(x['instruction_bytes'] for x in reports),cases=sum(x['cases'] for x in reports),parts=reports)
 (ROOT/'.deps/soundmain-packed/ply-note/invocations-report.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))

if __name__=='__main__':main()
