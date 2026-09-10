#!/usr/bin/env python3
"""Independent ply_note tone-selection model with flags and ordered stack/track aliases."""
import argparse,hashlib,itertools,json,random
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,EXIT,DATA=0x080cfe8a,0x080cfee0,0x080d002a,0x02000000
MASK=0xffffffff

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--candidate-bin',type=Path);args=p.parse_args()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 original=rom[ENTRY-0x08000000:END-0x08000000];code=args.candidate_bin.read_bytes() if args.candidate_bin else original;assert len(code)==86
 uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_write(ENTRY,code);uc.mem_map(DATA,0x8000)
 state={}
 def code_hook(u,address,size,user):
  if address in (END,EXIT):u.emu_stop();return
  assert ENTRY<=address<END
  assert u.reg_read(r.UC_ARM_REG_SP)==state['sp']
 def mem_hook(u,kind,address,size,value,user):state['accesses'].append((kind,address,size,(value&((1<<(8*size))-1)) if kind==17 else None))
 uc.hook_add(UC_HOOK_CODE,code_hook);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,mem_hook)
 rng=random.Random(0xfe8170)
 track,table,tones=DATA+0x400,DATA+0x2000,DATA+0x3000
 cases=0;outcomes={'plain':0,'split':0,'rhythm':0,'invalid_child':0};pan_writes=0
 for ty,child,pan,key,nz,alias in itertools.product((0,1,7,0x40,0x47,0x80,0x87,0xc0,0xc7,0xff),(0,7,0x40,0x80,0xc0,0xff),(0,0x7f,0x80,0xbf,0xc0,0xff),(0,1,127,255),range(16),range(4)):
  memory=bytearray([0xa5])*0x8000
  memory[track+5-DATA]=key;memory[track+36-DATA]=ty
  memory[track+40-DATA:track+44-DATA]=tones.to_bytes(4,'little');memory[track+44-DATA:track+48-DATA]=table.to_bytes(4,'little')
  for k in range(256):
   memory[table+k-DATA]=(k*17+3)&255
   off=tones+12*k-DATA;memory[off:off+4]=bytes((child,(k*3+11)&255,0x55,pan))
  selected=tones+12*(((key*17+3)&255) if ty&0x40 else key)
  sp=(DATA+0x1800,track-16,track+16,selected-20)[alias]
  regs=[rng.getrandbits(32) for _ in range(13)];regs[5]=track;wanted=regs.copy();ram=memory.copy();accesses=[];flags=nz
  def read(address,size):
   accesses.append((16,address,size,None));return int.from_bytes(ram[address-DATA:address-DATA+size],'little')
  def store(address,value):
   accesses.append((17,address,4,value&MASK));ram[address-DATA:address-DATA+4]=(value&MASK).to_bytes(4,'little')
  def logical(value):
   nonlocal flags
   flags=((value>>31)<<3)|((value==0)<<2)|(flags&3)
  def mov(n,value):wanted[n]=value;logical(value)
  def add(n,a,b):
   nonlocal flags
   value=(a+b)&MASK;flags=(value>>31)<<3|(value==0)<<2|((a+b)>MASK)<<1|bool((~(a^b)&(a^value))&0x80000000);wanted[n]=value
  def sub(n,a,b):
   nonlocal flags
   value=(a-b)&MASK;flags=(value>>31)<<3|(value==0)<<2|(a>=b)<<1|bool(((a^b)&(a^value))&0x80000000);wanted[n]=value
  def shift(n,count):
   nonlocal flags
   old=wanted[n];value=(old<<count)&MASK;flags=(value>>31)<<3|(value==0)<<2|((old>>(32-count))&1)<<1|(flags&1);wanted[n]=value
  mov(0,0);store(sp+20,wanted[0]);add(4,wanted[5],0);add(4,wanted[4],36);wanted[2]=read(wanted[4],1);mov(0,0xc0);logical(wanted[0]&wanted[2]);pc=END
  if not wanted[0]&wanted[2]:
   wanted[9]=wanted[4];wanted[3]=read(track+5,1);outcome='plain'
  else:
   wanted[3]=read(track+5,1);mov(0,0x40);logical(wanted[0]&wanted[2])
   if wanted[0]&wanted[2]:
    wanted[1]=read(track+44,4);add(1,wanted[1],wanted[3]);wanted[0]=read(wanted[1],1)
   else:add(0,wanted[3],0)
   wanted[1]=wanted[0];shift(1,1);add(1,wanted[1],wanted[0]);shift(1,2);wanted[0]=read(track+40,4);add(1,wanted[1],wanted[0]);wanted[9]=wanted[1];wanted[6]=wanted[9];wanted[1]=read(wanted[6],1);mov(0,0xc0);logical(wanted[0]&wanted[1])
   if wanted[0]&wanted[1]:pc=EXIT;outcome='invalid_child'
   else:
    mov(0,0x80);logical(wanted[0]&wanted[2]);outcome='split'
    if wanted[0]&wanted[2]:
     outcome='rhythm';wanted[1]=read(wanted[6]+3,1);mov(0,0x80);logical(wanted[0]&wanted[1])
     if wanted[0]&wanted[1]:sub(1,wanted[1],0xc0);shift(1,1);store(sp+20,wanted[1]);pan_writes+=1
     wanted[3]=read(wanted[6]+1,1)
  uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
  for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
  uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x08000101);state.update(sp=sp,accesses=[])
  uc.emu_start(ENTRY|1,0,count=50);context=(ty,child,pan,key,nz,alias,outcome)
  assert uc.reg_read(r.UC_ARM_REG_PC)==pc,context
  assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,context
  assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==0x08000101,context
  assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
  assert bytes(uc.mem_read(DATA,0x8000))==ram,context
  assert state['accesses']==accesses,(context,state['accesses'],accesses)
  cases+=1;outcomes[outcome]+=1
 report=dict(candidate=str(args.candidate_bin) if args.candidate_bin else None,exact_bytes=code==original,cases=cases,outcomes=outcomes,rhythm_pan_writes=pan_writes,original_instruction_bytes=86,
             scope='Tone selection, split lookup, invalid nested-tone exit and rhythm key/pan overrides. Ten parent types, six child types, six pans, four keys, all NZCV and four stack placements including key/type/selected-tone aliases. Full registers/CPSR/SP/LR/RAM and ordered accesses.',
             limitations='Stops before priority/channel allocation or at the shared exit entry. Mapped synthetic tone/split tables; no complete ply_note execution or invalid pointers.')
 out=ROOT/'.deps/soundmain-packed/ply-note';out.mkdir(parents=True,exist_ok=True);(out/('tone-candidate-model.json' if args.candidate_bin else 'tone-original-model.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
