#!/usr/bin/env python3
"""Check PCM selection, release preference and priority/owner ties against ROM."""
import argparse, hashlib, itertools, json, random
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,EXIT,DATA=0x080cff30,0x080cff84,0x080d002a,0x02000000
MASK=0xffffffff

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--candidate-bin',type=Path);a=p.parse_args()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 original=rom[ENTRY-0x08000000:END-0x08000000];binary=a.candidate_bin.read_bytes() if a.candidate_bin else original
 assert 0<len(binary)<=256
 uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_write(ENTRY,binary);uc.mem_map(DATA,0x10000)
 sp,info,track=DATA+0xf000,DATA+0x1000,DATA+0x400
 state={}
 def code(u,address,size,user):
  if address in (END,EXIT):u.emu_stop();return
  assert ENTRY<=address<ENTRY+len(binary),hex(address)
  assert u.reg_read(r.UC_ARM_REG_SP)==sp
 def memory(u,kind,address,size,value,user):state['trace'].append((kind,address,size,value if kind==17 else None))
 uc.hook_add(UC_HOOK_CODE,code);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,memory)
 rng=random.Random(0xfe81ac);owners=(0,track-4,track,track+4,MASK)
 def inputs():
  # Every channel status, priority boundaries and owner ties on a single channel.
  for status,(old,new),owner,nz in itertools.product(range(256),((0,0),(0,255),(128,127),(128,128),(255,255)),owners,(0,3,12,15)):
   yield 1,new,[(status,old,owner)],nz
  # Ordering and release preference over every pair of representative channels.
  choices=list(itertools.product((0,1,0x40,0x80,0xc7),(0,128,255),owners))
  for first,second in itertools.product(choices,repeat=2):yield 2,128,[first,second],(first[0]^second[0])&15
  # Count zero still examines one channel; exercise all byte loop counts.
  for count,nz in itertools.product(range(256),range(16)):
   channels=[(1,129,track)]*max(1,count)
   if count%3==0:channels[-1]=(0,255,MASK)
   elif count%3==1:channels[-1]=(0x40,255,MASK)
   yield count,128,channels,nz
  for _ in range(2048):
   count=rng.randrange(1,17)
   yield count,rng.choice((0,128,255,256,0x80000000,MASK)),[(rng.randrange(256),rng.randrange(256),rng.choice(owners)) for _ in range(count)],rng.randrange(16)
 cases=0;outcomes={'free':0,'selected':0,'none':0}
 for count,priority,channels,nz in inputs():
  ram=bytearray([0xa5])*0x10000
  def put(addr,value,size):ram[addr-DATA:addr-DATA+size]=value.to_bytes(size,'little')
  put(sp+16,priority,4);put(sp+4,info,4);put(info+6,count,1)
  for n,(status,old,owner) in enumerate(channels):
   channel=info+80+n*64;put(channel,status,1);put(channel+19,old,1);put(channel+44,owner,4)
  regs=[rng.getrandbits(32) for _ in range(13)];regs[5]=track;wanted=regs.copy();flags=nz;trace=[]
  def read(addr,size):trace.append((16,addr,size,None));return int.from_bytes(ram[addr-DATA:addr-DATA+size],'little')
  def nz_flags(v):return (v>>31)<<3|(v==0)<<2
  def mov(n,v):
   nonlocal flags
   wanted[n]=v&MASK;flags=(flags&3)|nz_flags(wanted[n])
  def add(n,left,right):
   nonlocal flags
   v=(left+right)&MASK;wanted[n]=v;flags=nz_flags(v)|((left+right>MASK)<<1)|bool((~(left^right)&(left^v))&0x80000000)
  def cmp(left,right):
   nonlocal flags
   v=(left-right)&MASK;flags=nz_flags(v)|((left>=right)<<1)|bool(((left^right)&(left^v))&0x80000000)
  def tst(left,right):
   nonlocal flags
   flags=(flags&3)|nz_flags(left&right)
  wanted[6]=read(sp+16,4);add(7,wanted[5],0);mov(2,0);wanted[8]=wanted[2];wanted[4]=read(sp+4,4);wanted[3]=read(wanted[4]+6,1);add(4,wanted[4],80)
  while True:
   wanted[1]=read(wanted[4],1);mov(0,0xc7);tst(wanted[0],wanted[1])
   if flags&4:outcome='free';pc=END;break
   mov(0,0x40);tst(wanted[0],wanted[1]);release=bool(wanted[0]&wanted[1]);select=False;compare=False
   cmp(wanted[2],0)
   if release and wanted[2]==0:
    add(2,wanted[2],1);wanted[6]=read(wanted[4]+19,1);wanted[7]=read(wanted[4]+44,4);select=True
   elif release or wanted[2]==0:compare=True
   if compare:
    wanted[0]=read(wanted[4]+19,1);cmp(wanted[0],wanted[6])
    if wanted[0]<wanted[6]:
     add(6,wanted[0],0);wanted[7]=read(wanted[4]+44,4);select=True
    elif wanted[0]==wanted[6]:
     wanted[0]=read(wanted[4]+44,4);cmp(wanted[0],wanted[7])
     if wanted[0]>wanted[7]:add(7,wanted[0],0);select=True
     elif wanted[0]==wanted[7]:select=True
   if select:wanted[8]=wanted[4]
   add(4,wanted[4],64);cmp(wanted[3],1);wanted[3]=(wanted[3]-1)&MASK
   if 0<wanted[3]<0x80000000:continue
   wanted[4]=wanted[8];cmp(wanted[4],0);pc=END if wanted[4] else EXIT;outcome='selected' if wanted[4] else 'none';break
  uc.mem_write(DATA,bytes(ram));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
  for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
  uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x08000101);state['trace']=[]
  uc.emu_start(ENTRY|1,0,count=10000);context=(cases,count,priority,channels,nz,outcome)
  assert uc.reg_read(r.UC_ARM_REG_PC)==pc,context
  assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,context
  assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==0x08000101,context
  assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
  assert bytes(uc.mem_read(DATA,0x10000))==ram and state['trace']==trace,context
  cases+=1;outcomes[outcome]+=1
 report=dict(cases=cases,outcomes=outcomes,candidate=str(a.candidate_bin) if a.candidate_bin else None,candidate_bytes=len(binary),exact_bytes=binary==original,
  scope='All statuses and boundary priorities/owners, representative channel pairs, all byte loop counts and seeded multi-channel cases; full registers/flags, SP/LR, unchanged RAM and ordered reads.',
  limitations='Synthetic mapped bank/track addresses; stops at attach/shared exit, without allocation mutations or full ply_note execution. Candidate binaries alone do not establish compiler provenance.')
 out=ROOT/'.deps/soundmain-packed/ply-note';out.mkdir(parents=True,exist_ok=True);(out/('pcm-candidate-model.json' if a.candidate_bin else 'pcm-original-model.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
