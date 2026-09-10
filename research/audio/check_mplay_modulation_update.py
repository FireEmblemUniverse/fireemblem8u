#!/usr/bin/env python3
"""Verify private modulation arithmetic, byte state and conditional flag updates."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY,END=0x080cfc9e,0x080cfcd8;DATA,SP=0x02000000,0x02001000;MASK=0xffffffff

def signed(v):return v if v<0x80000000 else v-0x100000000

def model(phase,speed,depth):
 phase=(phase+speed)&MASK;t=(phase-64)&MASK
 if (t&128):
  wave=(phase&255)-(256 if phase&128 else 0)
  overflow=int(bool(((phase^64)&(phase^t))&0x80000000))
 else:
  wave=(128-phase)&MASK
  overflow=int(bool(((128^phase)&(128^wave))&0x80000000))
 result=(signed((depth*wave)&MASK)>>6)&MASK
 return phase,result,overflow

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-modulation-update';out.mkdir(parents=True,exist_ok=True)
 source=ROOT/'research/audio/mplay_modulation_update.c';obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainTrackFinish','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTrackFinish','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so')]
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-fno-if-conversion','-fno-if-conversion2','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(source),'-o',str(obj)]+options,check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainTrackFinish = '+hex(END)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==58 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
 rng=random.Random(0xfe8d45a);counts=dict(unchanged=0,pitch=0,volume=0);tracks=(DATA+0x400,SP-26,SP-22,DATA+0x3fe5)
 def case(oldphase,speed,depth,old,type_,flags,track,initial):
  phase,result,overflow=model(oldphase,speed,depth)
  memory=bytearray([0xa5])*0x4000
  for offset,value in ((26,oldphase),(23,depth),(22,old),(24,type_),(0,flags)):memory[track+offset-DATA]=value
  changed=memory.copy();changed[track+26-DATA]=phase&255
  regs=[rng.getrandbits(32) for _ in range(13)];regs[1]=speed;regs[5]=track;expected=regs.copy();expected[:3]=[0,phase,result]
  accesses=[(16,track+26,1,None),(17,track+26,1,phase),(16,track+23,1,None),(16,track+22,1,None)]
  if old==(result&255):
   outcome='unchanged';nzcv=4|(((old^result)>>8&1)<<1)|overflow
  else:
   mask=3 if type_ else 12;outcome='volume' if type_ else 'pitch';nzcv=2
   expected[0]=flags|mask;expected[1]=mask;changed[track+22-DATA]=result&255;changed[track-DATA]=flags|mask
   accesses += [(17,track+22,1,result),(16,track,1,None),(16,track+24,1,None),(17,track,1,flags|mask)]
  for uc,trace in machines:
   uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
   for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
   uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,END,count=40)
   assert uc.reg_read(r.UC_ARM_REG_PC)==END
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected,(oldphase,speed,depth,old,type_,expected)
   assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|nzcv<<28,(oldphase,speed,depth,old,type_,nzcv,uc.reg_read(r.UC_ARM_REG_CPSR))
   assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   assert bytes(uc.mem_read(DATA,0x4000))==changed and trace==accesses,(trace,accesses)
  counts[outcome]+=1
 for phase in range(256):
  for speed in range(256):
   for depth in (0,1,64,255):
    result=model(phase,speed,depth)[1]&255
    for change in (0,1):
     n=phase+speed+depth+change
     case(phase,speed,depth,(result+change)&255,n&1,(phase^speed)&255,tracks[n&3],n&15)
 for phase in range(256):
  for depth in range(256):case(phase,0,depth,phase^depth,depth,phase,tracks[(phase+depth)&3],(phase+depth)&15)
 for phase in (0,63,64,127,192,255):
  for speed in (0,1,255,256,65535,0x7fffff80,0x7fffffff,0x80000000,0x80000040,0x80000080,0xfffffffe,0xffffffff):
   for depth in (0,1,64,255):
    result=model(phase,speed,depth)[1]&255
    for change in (0,1):
     for type_ in (0,1,255):
      for track in tracks:
       for initial in range(16):case(phase,speed,depth,(result+change)&255,type_,initial*17,track,initial)
 report=dict(cases=sum(counts.values()),outcomes=counts,matching_instruction_bytes=58,production_integrated=a.production,
             candidate_sha256=hashlib.sha256(code).hexdigest(),source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
             scope='All phase/speed byte pairs at four depths with changed/unchanged values; all phase/depth byte pairs; full-width incoming speed boundaries crossed with all NZCV and stack/boundary aliases. Independent wrapped/signed arithmetic model, exact registers/flags, complete RAM and ordered byte accesses.',
             limitations='Stops at track-finish; does not execute the complete MPlayMain loop or evaluate audible output.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
