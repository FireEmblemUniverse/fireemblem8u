#!/usr/bin/env python3
"""Verify a private optional/mandatory callback chain against the original ROM."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cf4fc;END=ENTRY+20;DATA=0x02000000;SP=DATA+0x1000
OPTIONAL=(0,0x080e0001,0x080e0010);MANDATORY=(0x080e0041,0x080e0060)
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/callbacks';out.mkdir(exist_ok=True)
 source=(ROOT/'research/audio/soundmain_callbacks.c').read_text().replace('void SoundMainCallbacksCandidate','__attribute__((matching_thumb_callback_chain))\nvoid SoundMainCallbacksCandidate')
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_callback_chain.so'),'-fplugin-arg-thumb_callback_chain-trampoline=SoundMainRAM_ExitRestore','-fplugin-arg-thumb_callback_chain-offset=18']
 def compile(name,text=source,extra=options):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
  result=subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]+extra+[str(src),'-o',str(obj.with_suffix('.s'))],capture_output=True,text=True)
  if not result.returncode:result=subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(obj.with_suffix('.s')),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('matching');assert not result.returncode,result.stderr
 script=out/'candidate.ld';script.write_text('SECTIONS { .text 0x080cf4fc : { '+str(obj)+'(.text) } .trampoline 0x080cf8d8 : { '+str(ROOT/'src/m4a_exit_restore.o')+'(.text) } }')
 elf=out/'candidate.elf';binary=out/'candidate.bin';subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),str(ROOT/'src/m4a_exit_restore.o'),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==20 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 assert rom[0xcf8ea:0xcf8ec]==bytes.fromhex('1847')
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes()
  assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
  assert code==production[ENTRY-0x08000000:END-0x08000000]
  code=production[ENTRY-0x08000000:END-0x08000000]

 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  for address in OPTIONAL[1:]+MANDATORY:uc.mem_write(address&~1,bytes.fromhex('7047' if address&1 else '1eff2fe1'))
  state={}
  def read(u,kind,address,size,value,state):state['reads'].append((address,size))
  def callback(u,address,size,state):
   if address not in [x&~1 for x in OPTIONAL[1:]+MANDATORY]:return
   first=address in [x&~1 for x in OPTIONAL[1:]];index=0 if first else 1
   values=[u.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]
   state['calls'].append((address,values,u.reg_read(r.UC_ARM_REG_SP),u.reg_read(r.UC_ARM_REG_LR),u.reg_read(r.UC_ARM_REG_CPSR)>>28,bool(u.reg_read(r.UC_ARM_REG_CPSR)&32)))
   if first and state['policy']:
    u.mem_write(SP+24,state['next_info'].to_bytes(4,'little'))
    if state['policy']==2:u.mem_write(state['next_info']+40,state['changed_target'].to_bytes(4,'little'))
   if not first:u.mem_write(SP+12,state['clobbers'][1][0].to_bytes(4,'little'))
   for i,value in enumerate(state['clobbers'][index]):u.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
   u.reg_write(r.UC_ARM_REG_CPSR,(u.reg_read(r.UC_ARM_REG_CPSR)&0xfffffff)|(state['flags'][index]<<28))
  uc.hook_add(UC_HOOK_MEM_READ,read,state,DATA,DATA+0x3fff);uc.hook_add(UC_HOOK_CODE,callback,state,0x080e0000,0x080e0060);machines.append((uc,state))
 rng=random.Random(0xca11);cases=0
 for optional,mandatory,info,next_info,policy,initial_flags,first_flags in itertools.product(OPTIONAL,MANDATORY,(DATA+0x400,SP-12),(DATA+0x400,DATA+0x800,SP-12),range(3),range(16),range(16)):
  memory=bytearray([0xa5])*0x4000
  def put(memory,address,value):memory[address-DATA:address-DATA+4]=value.to_bytes(4,'little')
  for base in (DATA+0x400,DATA+0x800,SP-12):put(memory,base+40,mandatory)
  put(memory,info+32,optional);put(memory,info+36,0x11223344);put(memory,SP+24,info)
  argument=int.from_bytes(memory[info+36-DATA:info+40-DATA],'little');changed=MANDATORY[1-MANDATORY.index(mandatory)]
  regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=info;clobbers=[[rng.getrandbits(32) for _ in range(13)] for _ in range(2)];last_flags=initial_flags^first_flags
  expected=memory.copy();reads=[(info+32,4)];calls=[]
  if optional:
   at=regs.copy();at[0]=argument;at[3]=optional;calls.append((optional&~1,at,SP,ENTRY+13,2,bool(optional&1)));reads.append((info+36,4))
   current=next_info if policy else info
   if policy:put(expected,SP+24,current)
   if policy==2:put(expected,current+40,changed)
   at=clobbers[0].copy();at[0]=current;at[3]=int.from_bytes(expected[current+40-DATA:current+44-DATA],'little');reads.extend([(SP+24,4),(current+40,4)]);flags=first_flags
  else:
   at=regs.copy();at[3]=mandatory;reads.append((info+40,4));flags=6
  calls.append((at[3]&~1,at,SP,END|1,flags,bool(at[3]&1)));put(expected,SP+12,clobbers[1][0])
  for uc,state in machines:
   uc.mem_write(DATA,bytes(memory));state.clear();state.update(reads=[],calls=[],policy=policy,next_info=next_info,changed_target=changed,clobbers=clobbers,flags=(first_flags,last_flags))
   for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
   uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial_flags<<28);uc.emu_start(ENTRY|1,END,count=30)
   assert uc.reg_read(r.UC_ARM_REG_PC)==END and uc.reg_read(r.UC_ARM_REG_CPSR)&32
   assert state['calls']==calls,(optional,mandatory,info,next_info,policy,state['calls'],calls)
   assert state['reads']==reads and bytes(uc.mem_read(DATA,0x4000))==expected
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==clobbers[1]
   assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==END|1 and uc.reg_read(r.UC_ARM_REG_CPSR)>>28==last_flags
  cases+=1
 negatives={
  'missing_tie':(source.replace('    asm("" : "+r"(callbackTarget));\n',''),options),
  'nonempty_tie':(source.replace('asm(""','asm("nop"'),options),
  'wrong_register':(source.replace('asm("r3")','asm("r2")'),options),
  'wrong_branch':(source.replace('if (callbackTarget)','if (!callbackTarget)'),options),
  'post_call_work':(source.replace('    ((void (*)(void))callbackTarget)();\n}', '    ((void (*)(void))callbackTarget)();\n    callbackArgument++;\n}'),options),
  'frame_outside':(source.replace('callbackFrame->soundInfo','*(volatile u32 *)((u32)callbackFrame+64)'),options),
  'stack_args':(source.replace('((void (*)(void))callbackTarget)();','((void (*)(int,int,int,int,int))callbackTarget)(1,2,3,4,5);'),options),
  'debug':(source,options+['-g']),
  'arm':(source,options+['-marm']),
  'odd_offset':(source,[o.replace('offset=18','offset=19') for o in options]),
  'missing_offset':(source,[o for o in options if '-offset=' not in o]),
  'duplicate_offset':(source,options+['-fplugin-arg-thumb_callback_chain-offset=18']),
 }
 for name,(text,extra) in negatives.items():
  result,_=compile(name,text,extra);assert result.returncode,(name,result.stderr)
 plain=source.replace('__attribute__((matching_thumb_callback_chain))','');result,obj=compile('plain',plain,[]);assert not result.returncode,result.stderr
 original=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and original==obj.read_bytes(),result.stderr
 report=dict(cases=cases,section_bytes=20,byte_exact=True,production_integrated=a.production,invalid_contracts_rejected=len(negatives),scope='Optional absent/Thumb/ARM callbacks, mandatory Thumb/ARM callbacks, mutable saved info and mandatory pointers, aliasing argument/frame slots, all initial and callback flag values, all registers and exact callback-entry SP/LR, ordered source reads and complete RAM.',limitations='Shared trampoline must remain BX r3 and continuation must be adjacent; no cycle-timing claim.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
