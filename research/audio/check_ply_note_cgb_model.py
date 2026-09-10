#!/usr/bin/env python3
"""Model CGB channel availability, priority and owner-pointer tie breaking."""
import argparse,hashlib,itertools,json,random
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,ATTACH,EXIT,DATA=0x080cfefe,0x080cff30,0x080cff84,0x080d002a,0x02000000

def sub_flags(a,b):
 v=(a-b)&0xffffffff
 return (v>>31)<<3|(v==0)<<2|(a>=b)<<1|bool((a^b)&(a^v)&0x80000000)

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--candidate-bin',type=Path);a=p.parse_args()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 original=rom[ENTRY-0x08000000:END-0x08000000];binary=a.candidate_bin.read_bytes() if a.candidate_bin else original
 assert 0<len(binary)<=END-ENTRY
 uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_write(ENTRY,binary);uc.mem_map(DATA,0x4000)
 state={};sp=DATA+0x3000;info=DATA+0x800;bank=DATA+0x1000;track=DATA+0x400
 def code(u,address,size,user):
  if address in (ATTACH,EXIT):u.emu_stop();return
  assert ENTRY<=address<ENTRY+len(binary),hex(address)
  assert u.reg_read(r.UC_ARM_REG_SP)==sp
 def memory(u,kind,address,size,value,user):state['accesses'].append((kind,address,size,value if kind==17 else None))
 uc.hook_add(UC_HOOK_CODE,code);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,memory)
 rng=random.Random(0xfe81c6);cases=0;outcomes={k:0 for k in ('missing_bank','inactive','releasing','lower_priority','higher_priority','owner_accept','owner_reject')}
 owners=(0,track-4,track,track+4,0xffffffff)
 def inputs():
  for old,new in itertools.product(range(256),repeat=2):yield False,1+(old+new)%7,1,old,new,owners[(old+new)%5],(old^new)&15
  for kind,status,(old,new),owner,nz in itertools.product(range(1,8),range(256),((0,0),(0,255),(128,127),(128,128),(255,255)),owners,(0,3,12,15)):yield False,kind,status,old,new,owner,nz
  for kind,new,owner,nz in itertools.product(range(1,8),(256,0x80000000,0xffffffff),owners,range(16)):yield False,kind,1,128,new,owner,nz
  for kind,nz in itertools.product((0,1,7,0xffffffff),range(16)):yield True,kind,0,0,0,0,nz
 for missing,kind,status,old,new,owner,nz in inputs():
  ram=bytearray([0xa5])*0x4000
  def put(addr,value,size):ram[addr-DATA:addr-DATA+size]=value.to_bytes(size,'little')
  put(sp+4,info,4);put(sp+16,new,4);put(info+28,0 if missing else bank,4)
  if not missing:
   channel=bank+(kind-1)*64;put(channel,status,1);put(channel+19,old,1);put(channel+44,owner,4)
  regs=[rng.getrandbits(32) for _ in range(13)];regs[5]=track;regs[6]=kind;wanted=regs.copy();trace=[]
  def read(addr,size):trace.append((16,addr,size,None));return int.from_bytes(ram[addr-DATA:addr-DATA+size],'little')
  wanted[0]=read(sp+4,4);wanted[4]=read(wanted[0]+28,4);flags=sub_flags(wanted[4],0);pc=EXIT
  if not wanted[4]:outcome='missing_bank'
  else:
   wanted[6]-=1;wanted[0]=wanted[6]<<6;wanted[4]+=wanted[0];wanted[1]=read(wanted[4],1);wanted[0]=0xc7
   # For kinds 1..7 and this mapped bank, address arithmetic leaves C=V=0.
   flags=4 if not(wanted[0]&wanted[1]) else 0
   if flags&4:pc=ATTACH;outcome='inactive'
   else:
    wanted[0]=0x40;flags=4 if not(wanted[0]&wanted[1]) else 0
    if not flags&4:pc=ATTACH;outcome='releasing'
    else:
     wanted[1]=read(wanted[4]+19,1);wanted[0]=read(sp+16,4);flags=sub_flags(wanted[1],wanted[0])
     if wanted[1]<wanted[0]:pc=ATTACH;outcome='lower_priority'
     elif wanted[1]>wanted[0]:outcome='higher_priority'
     else:
      wanted[0]=read(wanted[4]+44,4);flags=sub_flags(wanted[0],wanted[5]);pc=ATTACH if wanted[0]>=wanted[5] else EXIT;outcome='owner_accept' if pc==ATTACH else 'owner_reject'
  uc.mem_write(DATA,bytes(ram));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
  for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
  uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x08000101);state['accesses']=[]
  uc.emu_start(ENTRY|1,0,count=30);context=(missing,kind,status,old,new,owner,nz,outcome)
  assert uc.reg_read(r.UC_ARM_REG_PC)==pc,context
  assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,context
  assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==0x08000101,context
  assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
  assert bytes(uc.mem_read(DATA,0x4000))==ram and state['accesses']==trace,context
  cases+=1;outcomes[outcome]+=1
 report=dict(cases=cases,outcomes=outcomes,candidate=str(a.candidate_bin) if a.candidate_bin else None,candidate_bytes=len(binary),exact_bytes=binary==original,original_instruction_bytes=50,
             scope='All 65,536 byte-priority pairs plus all statuses/kinds 1..7 at priority/owner boundaries, unsigned wide priorities and missing-bank entries. Full final registers/flags/SP/LR, unchanged RAM and ordered reads.',
             limitations='Mapped synthetic bank and track addresses; selected kind restricted to 1..7 when bank exists. Stops at attach or shared exit; does not modify channel chains or execute full ply_note. Supplied binary does not alone prove C/compiler provenance.')
 out=ROOT/'.deps/soundmain-packed/ply-note';out.mkdir(parents=True,exist_ok=True);(out/('cgb-candidate-model.json' if a.candidate_bin else 'cgb-original-model.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
