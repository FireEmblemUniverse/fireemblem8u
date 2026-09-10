#!/usr/bin/env python3
"""Model original MPlayMain lock/callback/frame entry, including overlapping frame writes."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cfb68;END=0x080cfb92;TRAMP=0x080cfdc0;LITERAL=0x080cfdcc;ID=0x68736d53;DATA=0x02000000
CALLBACKS=(0,0x08000101,0x08000180);RETURNS=(0x08000201,0x08000280)

def flags_sub(a,b):
 result=(a-b)&0xffffffff
 return (result>>31)<<3|((result==0)<<2)|((a>=b)<<1)|bool(((a^b)&(a^result))&0x80000000)

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler');p.add_argument('--candidate',action='store_true');p.add_argument('--production',action='store_true');p.add_argument('--frame-candidate',action='store_true');p.add_argument('--lock-candidate',action='store_true');a=p.parse_args()
 if a.candidate:
  assert a.compiler,'--candidate requires --compiler'
  out=ROOT/'.deps/soundmain-packed/mplay-entry/callback-setup';out.mkdir(parents=True,exist_ok=True);obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
  options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainEntryFrame','-fplugin-arg-tail_transfer-destination=MPlayMainEntryCallbackInvoke','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainEntryCallbackInvoke','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_direct_tails.so'),'-fplugin-arg-thumb_direct_tails-destination=MPlayMainEntryFrame','-fplugin-arg-thumb_direct_tails-expected-transfers=1']
  subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_entry_callback_setup.c'),'-o',str(obj)]+options,check=True)
  script=out/'candidate.ld';script.write_text('SECTIONS { .text 0x080cfb78 : { *(.text) } MPlayMainEntryFrame = 0x080cfb84; MPlayMainEntryCallbackInvoke = 0x080cfb80; }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 if a.production:assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
 if a.candidate:
  assert (ROOT/'.deps/soundmain-packed/mplay-entry-callback-invoke/candidate.c').read_text()==(ROOT/'research/audio/mplay_entry_callback_invoke.c').read_text(),'Run check_mplay_entry_callback_invoke.py for the current source first'
  setup=binary.read_bytes();invoke=(ROOT/'.deps/soundmain-packed/mplay-entry-callback-invoke/candidate.bin').read_bytes()
  assert len(setup)==8 and len(invoke)==4 and setup+invoke==rom[0xcfb78:0xcfb84]
  uc.mem_write(0x080cfb78,setup+invoke)
 if a.lock_candidate:
  out=ROOT/'.deps/soundmain-packed/mplay-lock'
  assert (out/'candidate.c').read_text()==(ROOT/'research/audio/mplay_lock.c').read_text(),'Run check_mplay_lock.py for current source first'
  lock=(out/'candidate.bin').read_bytes();assert len(lock)==16 and lock==rom[0xcfb68:0xcfb78]
  uc.mem_write(ENTRY,lock)
 if a.frame_candidate:
  out=ROOT/'.deps/soundmain-packed/entry-frame'
  assert (out/'candidate.c').read_text()==(ROOT/'research/audio/mplay_entry_frame.c').read_text(),'Run check_mplay_entry_frame.py for current source first'
  frame=(out/'candidate.bin').read_bytes();assert len(frame)==14 and frame==rom[0xcfb84:0xcfb92]
  uc.mem_write(0x080cfb84,frame)
 uc.mem_write(CALLBACKS[1]&~1,bytes.fromhex('08607047'));uc.mem_write(CALLBACKS[2],bytes.fromhex('000081e51eff2fe1'))
 state={}
 def memory_hook(u,kind,address,size,value,user):state['accesses'].append((kind,address,size,value if kind==17 else None))
 def code_hook(u,address,size,user):
  if address in (END,state['return']&~1):u.emu_stop();return
  if address in (CALLBACKS[1]&~1,CALLBACKS[2]):
   assert state['callback'] and not state['entries']
   state['entries'].append(([u.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)],u.reg_read(r.UC_ARM_REG_SP),u.reg_read(r.UC_ARM_REG_LR),u.reg_read(r.UC_ARM_REG_CPSR)))
   for n,value in enumerate(state['clobbers']):u.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   u.reg_write(r.UC_ARM_REG_CPSR,(u.reg_read(r.UC_ARM_REG_CPSR)&0x0fffffff)|(state['returned_flags']<<28))
  if ENTRY<=address<=0x080cfb76:expected_sp=state['sp']
  elif address==0x080cfb86:expected_sp=state['sp']-4
  elif 0x080cfb88<=address<=0x080cfb90:expected_sp=state['sp']-20
  else:expected_sp=state['sp']-8
  assert u.reg_read(r.UC_ARM_REG_SP)==expected_sp,(hex(address),hex(u.reg_read(r.UC_ARM_REG_SP)),hex(expected_sp))
 uc.hook_add(UC_HOOK_CODE,code_hook);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,memory_hook)
 rng=random.Random(0xfe81c0);cases=0;outcomes=dict(rejected=0,no_callback=0,thumb_callback=0,arm_callback=0)
 for ident,location,callback,nz,returned,alias,sp,ret in itertools.product((ID,ID+1,0,0xffffffff),range(7),CALLBACKS,range(16),(0,3,12,15),range(4),(DATA+0x1000,DATA+0x2000),RETURNS):
  player=(DATA+0x100,sp-88,sp-84,sp-80,sp-76,sp-52,sp)[location];memory=bytearray([0xa5])*0x4000
  argument=rng.getrandbits(32)
  for off,value in ((52,ident),(56,callback),(60,argument)):memory[player+off-DATA:player+off-DATA+4]=value.to_bytes(4,'little')
  regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=player;expected=regs.copy();expected[2]=ID;expected[3]=ident;wanted=memory.copy();accesses=[(16,LITERAL,4,None),(16,player+52,4,None)];expected_entries=[]
  clobbers=[rng.getrandbits(32) for _ in range(13)];clobbers[1]=(sp-8,sp-4,player+52,sp-36)[alias]
  def store(address,value):wanted[address-DATA:address-DATA+4]=value.to_bytes(4,'little');accesses.append((17,address,4,value))
  def read(address):accesses.append((16,address,4,None));return int.from_bytes(wanted[address-DATA:address-DATA+4],'little')
  if ident!=ID:
   expected_sp=sp;expected_lr=ret;expected_pc=ret&~1;expected_cpsr=(0x33 if ret&1 else 0x13)|(flags_sub(ID,ident)<<28);outcome='rejected'
  else:
   expected[3]=ID+1;store(player+52,ID+1);store(sp-8,player);store(sp-4,ret)
   expected[3]=read(player+56);assert expected[3]==callback
   flags=flags_sub(callback,0);expected_lr=ret
   if callback:
    expected[0]=read(player+60);expected_lr=0x080cfb85
    expected_entries=[(expected.copy(),sp-8,expected_lr,(0x33 if callback&1 else 0x13)|(flags<<28))]
    expected=clobbers.copy();flags=returned;store(clobbers[1],clobbers[0]);outcome='thumb_callback' if callback&1 else 'arm_callback'
   else:outcome='no_callback'
   expected[0]=read(sp-8)
   for n in range(4):store(sp-20+4*n,expected[4+n])
   expected[4:8]=expected[8:12]
   for n in range(4):store(sp-36+4*n,expected[4+n])
   expected_sp=sp-36;expected_pc=END;expected_cpsr=0x33|(flags<<28)
  uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
  for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
  uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,ret);state.update(sp=sp,callback=callback,clobbers=clobbers,returned_flags=returned,entries=[],accesses=[],**{'return':ret})
  uc.emu_start(ENTRY|1,0,count=32)
  assert uc.reg_read(r.UC_ARM_REG_PC)==expected_pc
  assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
  assert uc.reg_read(r.UC_ARM_REG_CPSR)==expected_cpsr
  assert uc.reg_read(r.UC_ARM_REG_SP)==expected_sp and uc.reg_read(r.UC_ARM_REG_LR)==expected_lr
  assert state['entries']==expected_entries
  assert bytes(uc.mem_read(DATA,0x4000))==wanted and state['accesses']==accesses,(state['accesses'],accesses)
  cases+=1;outcomes[outcome]+=1
 report=dict(candidate_lock_bytes=16 if a.lock_candidate else 0,candidate_frame_bytes=14 if a.frame_candidate else 0,production_integrated=a.production,candidate_callback_bytes=12 if a.candidate else 0,cases=cases,outcomes=outcomes,original_instruction_bytes=42,scope='Independent original-ROM model of lock rejection, identifier store, callback dispatch, ordered frame writes and low/high register saves; seven player locations, four callback-write aliases, ARM/Thumb callbacks and rejection returns, two stacks, all incoming NZCV and four returned flag patterns; exact SP at each executed entry instruction, complete registers/CPSR/LR/RAM and ordered accesses.',limitations='Synthetic callback bodies at controlled ROM addresses; stops at entry-status continuation and does not execute complete MPlayMain. Player locations avoid callback-pointer fields overwritten by the initial two-word push.')
 out=ROOT/'.deps/soundmain-packed/mplay-entry';out.mkdir(parents=True,exist_ok=True);(out/('lock-candidate-entry-model.json' if a.lock_candidate else 'saved-frame-candidate-model.json' if a.frame_candidate else 'lock-callback-frame-candidate.json' if a.candidate else 'lock-callback-frame-model.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
