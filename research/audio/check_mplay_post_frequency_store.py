#!/usr/bin/env python3
"""Verify frequency-result stores and the CGB hardware-update flag."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];BASE=0x08000000;DATA=0x02000000;SP=DATA+0x1000;NEXT=0x080cfd96

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-post-frequency-store';out.mkdir(parents=True,exist_ok=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 if a.production:assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 rng=random.Random(0xfe8f570);reports={}
 for part,entry,end in [('cgb',0x080cfd7e,0x080cfd8a),('pcm',0x080cfd94,NEXT)]:
  source=ROOT/('research/audio/mplay_post_'+part+'_store.c');obj=out/(part+'.o');elf=out/(part+'.elf');binary=out/(part+'.bin')
  opts=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainPostChannelNext','-fplugin-arg-tail_transfer-private-frame64']
  if part=='pcm':opts+=['-fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostChannelNext']
  subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(source),'-o',str(obj)]+opts,check=True)
  script=out/(part+'.ld');script.write_text('SECTIONS { .text '+hex(entry)+' : { *(.text) } MPlayMainPostChannelNext = '+hex(NEXT)+'; }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  code=binary.read_bytes();assert len(code)==end-entry and code==rom[entry-BASE:end-BASE],(part,code.hex())
  machines=[]
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(BASE,0x1000000);uc.mem_write(BASE,rom);uc.mem_map(DATA,0x4000)
   if candidate:uc.mem_write(entry,code)
   trace=[]
   def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
   uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,trace))
  bounds=[0,1,0x7fffffff,0x80000000,0xfffffffe,0xffffffff];channels=[DATA+0x400,SP-32,SP-29,DATA+0x4000-36]
  if part=='cgb':
   regular=((value,mode,channel,nz) for value,mode,channel,nz in itertools.product(bounds,range(256),channels,range(16)))
   extra=[(rng.getrandbits(32),rng.randrange(256),channel,nz) for _ in range(32) for channel,nz in itertools.product(channels,range(16))]
  else:
   values=list(range(256))+bounds+[1<<n for n in range(32)]+[rng.getrandbits(32) for _ in range(128)]
   regular=((value,0,channel,nz) for value,channel,nz in itertools.product(values,channels,range(16)));extra=[]
  cases=0
  for value,mode,channel,nz in itertools.chain(regular,extra):
   regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=value;regs[4]=channel;expected=regs.copy();memory=bytearray([0xa5])*0x4000;memory[channel+29-DATA]=mode;wanted=memory.copy();wanted[channel+32-DATA:channel+36-DATA]=value.to_bytes(4,'little')
   accesses=[(17,channel+32,4,value)];flags=nz
   if part=='cgb':
    expected[0]=mode|2;expected[1]=2;wanted[channel+29-DATA]=mode|2;accesses += [(16,channel+29,1,None),(17,channel+29,1,mode|2)];flags=nz&3
   for uc,trace in machines:
    uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
    for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
    uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(entry|1,NEXT,count=10)
    assert uc.reg_read(r.UC_ARM_REG_PC)==NEXT
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
    assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
    assert bytes(uc.mem_read(DATA,0x4000))==wanted and trace==accesses
   cases+=1
  reports[part]=dict(cases=cases,matching_instruction_bytes=len(code),candidate_sha256=hashlib.sha256(code).hexdigest())
 report=dict(parts=reports,cases=sum(x['cases'] for x in reports.values()),production_integrated=a.production,scope='CGB: every mode byte and six frequency boundaries plus random frequencies; PCM: all byte values, full-width boundaries/single bits/random frequencies. Four channel aliases and every NZCV; exact registers, flags, RAM and ordered writes/reads. Includes unaligned frequency words when mode byte is at SP.',limitations='Starts after frequency conversion; no actual conversion-function or full MPlayMain execution.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
