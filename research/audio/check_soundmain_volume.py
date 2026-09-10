#!/usr/bin/env python3
"""Verify exact volume/loop setup, including wraparound and alias-sensitive accesses."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cf6a4;END=0x080cf6d8;DATA=0x02000000;CHANNEL=DATA+0x400;SP=DATA+0x1000

def model(initial,level,status,wave,regs):
 memory=bytearray(initial);trace=[];wanted=regs.copy()
 def read(address,size=4):trace.append((16,address,size,None));return int.from_bytes(memory[address-DATA:address-DATA+size],'little')
 def write(address,value,size=4):value&=(1<<(8*size))-1;trace.append((17,address,size,value));memory[address-DATA:address-DATA+size]=value.to_bytes(size,'little')
 write(CHANNEL+9,level,1);info=read(SP+24);master=read(info+7,1)
 scaled=(((master+1)*level)&0xffffffff)>>4;wanted[5]=scaled
 product=(read(CHANNEL+2,1)*scaled)&0xffffffff;write(CHANNEL+10,product>>8,1)
 product=(read(CHANNEL+3,1)*scaled)&0xffffffff;write(CHANNEL+11,product>>8,1)
 value=status&16;write(SP+16,value);flags=4|(((product>>7)&1)<<1)
 if value:
  loop=read(wave+8);wanted[1]=loop;write(SP+12,wave+16+loop);size=read(wave+12);value=(size-loop)&0xffffffff;write(SP+16,value)
  flags=((value>>31)<<3)|((value==0)<<2)|((size>=loop)<<1)|(((size^loop)&(size^value))>>31)
 wanted[0]=value
 return memory,trace,wanted,flags,(master+1)*level>0xffffffff

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/volume';out.mkdir(exist_ok=True);obj=out/'candidate.o';binary=out/'candidate.bin'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=SoundMainRAM_ResumeSamples','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=SoundMainRAM_ResumeSamples','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so'),str(ROOT/'src/m4a_volume.c'),'-o',str(obj)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==rom[ENTRY-0x08000000:END-0x08000000] and len(code)==52,code.hex()
 assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 symbols=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
 assert any(line.split()==['080cf6a4','00000034','T','SoundMainRAM_EnvelopeVolume'] for line in symbols.splitlines())
 machines=[]
 for copied in (False,True):
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(0x03000000,0x8000);uc.mem_map(DATA,0x4000)
   delta=0x03002c60-0x080cf54c if copied else 0;start=(0x03002000 if copied else 0x08001000) if candidate else ENTRY+delta;uc.mem_write(start,code);trace=[]
   def hook(u,kind,address,size,value,user):user.append((kind,address,size,value&((1<<(8*size))-1) if kind==17 else None))
   uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,hook,trace,DATA,DATA+0x3fff);machines.append((uc,start,trace))
 rng=random.Random(0x7010);cases=0;loop_paths=0;wrap_cases=0
 layouts=[(DATA+0x800,DATA+0x2000),(CHANNEL+2,SP),(DATA+0x800,SP+8),(CHANNEL+4,CHANNEL-2)]
 def run(level,master,right,left,status,flags,layout):
  nonlocal cases,loop_paths,wrap_cases
  info,wave=layouts[layout];m=bytearray([0xa5])*0x4000
  for address,value in ((wave+8,rng.getrandbits(32)),(wave+12,rng.getrandbits(32)),(SP+24,info)):m[address-DATA:address-DATA+4]=value.to_bytes(4,'little')
  m[CHANNEL+2-DATA]=right;m[CHANNEL+3-DATA]=left;m[info+7-DATA]=master
  regs=[rng.getrandbits(32) for _ in range(13)];regs[3]=wave;regs[4]=CHANNEL;regs[5]=level;regs[6]=status
  memory,expected_trace,wanted,endflags,wrapped=model(bytes(m),level,status,wave,regs)
  for uc,start,trace in machines:
   uc.mem_write(DATA,bytes(m));trace.clear()
   for i,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),v)
   uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
   uc.emu_start(start|1,start+52,count=40)
   assert uc.reg_read(r.UC_ARM_REG_PC)==start+52 and uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==wanted,(level,master,layout,'registers')
   assert uc.reg_read(r.UC_ARM_REG_CPSR)>>28==endflags,(level,master,layout,'flags')
   assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==expected_trace,(level,master,layout,trace,expected_trace)
  cases+=1;loop_paths+=bool(status&16);wrap_cases+=wrapped
 for level in range(256):
  for master in range(256):run(level,master,master,level,(master^level)&16,(master+level)&15,0)
 for _ in range(1024):
  level=rng.getrandbits(32);master=rng.randrange(256);right=rng.randrange(256);left=rng.randrange(256);status=rng.getrandbits(32)
  for layout in range(4):
   for flags in range(16):run(level,master,right,left,status,flags,layout)
 report=dict(cases=cases,machines_per_case=4,loop_paths=loop_paths,initial_product_wrap_cases=wrap_cases,candidate_bytes=len(code),production_integrated=True,scope='All byte level/master pairs and stereo byte pairs; full-width randomized levels/status/wave metadata, every initial NZCV in four alias layouts, exact registers/flags/fallthrough, ordered reads/writes and complete mapped data.',limitations=['Independent envelope/master/stereo combinations are sampled, not exhaustively crossed. Cycle timing is not modeled.'])
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
