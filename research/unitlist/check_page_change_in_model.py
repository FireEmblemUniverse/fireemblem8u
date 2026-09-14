#!/usr/bin/env python3
"""Check the near-matching C page transition against an independent tile-copy model."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/unitlist-page-in';ENTRY=0x08091f10;RETURN=0x080e0000;DATA=0x02000000;PROC=DATA+0x30000;STACK=0x03007000

def main():
 parser=argparse.ArgumentParser(description=__doc__)
 parser.add_argument('--candidate',type=Path,default=OUT/'baseline.bin')
 parser.add_argument('--report',type=Path,default=OUT/'model-report.json')
 args=parser.parse_args()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';code=args.candidate.read_bytes();assert len(code)==436
 symbols={x.split()[-1]:int(x.split()[1],16)&~1 for x in subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(x.split())>=8 and x.split()[0].rstrip(':').isdigit()}
 bg0,bg2,src0,src1,table=[symbols[x] for x in ('gBG0TilemapBuffer','gBG2TilemapBuffer','gUnitlistscreen_0','gUnitlistscreen_1','gUnitlistscreen_11')];sync=symbols['BG_EnableSyncByMask'];brk=symbols['Proc_Break'];machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,len(rom));uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x40000);uc.mem_map(0x03000000,0x8000)
  if candidate:uc.mem_write(ENTRY,code)
  for address in (sync,brk):uc.mem_write(address,bytes.fromhex('7047'))
  state={}
  def callback(u,address,size,state):
   if address not in (sync,brk):return
   state['calls'].append((address,u.reg_read(r.UC_ARM_REG_R0)))
   for n in (0,1,2,3,12):u.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),0xfeed0000+n)
   u.reg_write(r.UC_ARM_REG_CPSR,(u.reg_read(r.UC_ARM_REG_CPSR)&0x0fffffff)|(state['flags']<<28))
  def write(u,kind,address,size,value,state):state['writes'].append((address,size,value & ((1 << (8*size))-1)))
  uc.hook_add(UC_HOOK_CODE,callback,state);uc.hook_add(UC_HOOK_MEM_WRITE,write,state,DATA,DATA+0x3ffff);machines.append((uc,state))
 initial=bytearray([0xa5])*0x40000
 for address,count in ((src0,1024),(src1,64)):
  for index in range(count):initial[address-DATA+2*index:address-DATA+2*index+2]=((index*37+address)&65535).to_bytes(2,'little')
 rng=random.Random(0x91f10);cases=0;counts={'right':0,'left_or_equal':0,'break':0,'wrap':0}
 for width,tick,scroll,(target,previous) in itertools.product(list(range(21))+[250,255],range(10),(0,7,8,247,248,255,256,65535),((1,0),(0,1),(2,2))):
  flags=cases%16;regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=PROC;memory=initial.copy();offset=PROC-DATA
  memory[offset+0x36]=target;memory[offset+0x37]=previous;memory[offset+0x38]=width;memory[offset+0x3c:offset+0x3e]=tick.to_bytes(2,'little');memory[offset+0x3e:offset+0x40]=scroll.to_bytes(2,'little');wanted=memory.copy();writes=[]
  def write(address,size,value):wanted[address-DATA:address-DATA+size]=value.to_bytes(size,'little');writes.append((address,size,value))
  raw=width+rom[table-0x08000000+tick];amount=raw&255;write(PROC+0x38,1,amount)
  if amount>20:amount=20;write(PROC+0x38,1,amount)
  write(PROC+0x3c,2,tick+1)
  for column in range(amount):
   destination=column+28-amount if target>previous else column+8;source=column+8 if target>previous else column+28-amount
   for row in range(scroll//8,scroll//8+12):
    address=src0+2*((row&31)*32+source);value=int.from_bytes(wanted[address-DATA:address-DATA+2],'little');write(bg0+2*((row&31)*32+destination),2,value)
   for row in range(2):
    address=src1+2*(row*32+source);value=int.from_bytes(wanted[address-DATA:address-DATA+2],'little');write(bg2+2*((row+5)*32+destination),2,value)
  calls=[(sync,5)]+([(brk,PROC)] if amount>=20 else []);results=[]
  for uc,state in machines:
   uc.mem_write(DATA,bytes(memory));uc.mem_write(0x03000000,bytes([0x5a])*0x8000);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
   for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   uc.reg_write(r.UC_ARM_REG_SP,STACK);uc.reg_write(r.UC_ARM_REG_LR,RETURN|1);state.update(calls=[],writes=[],flags=(flags+3)%16);uc.emu_start(ENTRY|1,RETURN,count=30000)
   assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN and uc.reg_read(r.UC_ARM_REG_SP)==STACK
   assert state['calls']==calls and state['writes']==writes,(width,tick,scroll,target,previous,state['calls'],len(state['writes']),len(writes))
   assert bytes(uc.mem_read(DATA,0x40000))==wanted
   results.append(([uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)],uc.reg_read(r.UC_ARM_REG_LR),uc.reg_read(r.UC_ARM_REG_CPSR),bytes(uc.mem_read(0x03000000,0x8000))))
  assert results[0]==results[1],(width,tick,scroll,target,previous)
  counts['right' if target>previous else 'left_or_equal']+=1;counts['break']+=amount>=20;counts['wrap']+=raw>255;cases+=1
 report=dict(cases=cases,outcomes=counts,candidate_sha256=hashlib.sha256(code).hexdigest(),candidate_bytes=len(code),matching_bytes=sum(x==y for x,y in zip(code,rom[0x91f10:0x920c4])),production_integrated=False,scope='All ten speed-table indices; widths 0..20 plus overflow cases; eight scroll boundaries; both directions and equal pages. Independent full EWRAM/write-order/callback model; original/C final registers, flags, LR and IWRAM agree with synthetic caller-clobbering callbacks. Incoming NZCV cycles across cases.',limitations='Not byte-matching. Calls are synthetic and do not validate BG sync or Proc_Break implementations. No hardware timing, all-input flag Cartesian product, or arbitrary pointer aliases.')
 args.report.write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
