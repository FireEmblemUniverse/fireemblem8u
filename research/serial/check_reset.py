#!/usr/bin/env python3
"""Compare bootstrap handshake traces; intentionally stops before BIOS handoff."""
from pathlib import Path
import itertools,json,subprocess,hashlib
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/serial-reset'
def model(trace,header):
 i=0;writes=[];stage='start';expected=0;value=0
 while True:
  if stage=='start':
   error,value=trace[i];i+=1
   if error:continue
   writes.append(0)
   if value:continue
   expected=0x8000;value=0;stage='exchange'
  elif stage=='exchange':
   writes.append(value);error,value=trace[i];i+=1
   if error:stage='start';continue
   if value!=expected:value=0;continue
   expected>>=5
   if value:continue
   stage='header0'
  else:
   index=0 if stage=='header0' else 1
   writes.append(header[index]);error,value=trace[i];i+=1
   if error or value!=header[index]:return i,writes,'halt'
   if index: writes.append(0);return i,writes,'handoff'
   stage='header1'
def main():
 OUT.mkdir(exist_ok=True);cc='arm-none-eabi-gcc'
 subprocess.run([cc,'-c','-O2','-std=gnu89','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',str(ROOT/'research/serial/reset.c'),'-o',str(OUT/'reset.o')],check=True,capture_output=True)
 (OUT/'probe.ld').write_text('SECTIONS { .text 0x080f0000 : { *(.text) } sio_polling = 0x08b1a198; SerialDecompressAndJump = 0x080ff000; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'probe.ld'),str(OUT/'reset.o'),'-o',str(OUT/'reset.elf')],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'reset.elf'),str(OUT/'reset.bin')],check=True)
 code=(OUT/'reset.bin').read_bytes();rom=(ROOT/'baserom.gba').read_bytes();cases=0;outcomes={}
 for header in itertools.product((0,1,0x8000,0xffff),repeat=2):
  base=[(False,x) for x in (0,0x8000,0x400,0x20,1,0,*header)];traces=[base,[(False,7)]+base]
  for stage in range(6):traces.append(base[:stage]+[(True,0x40)]+base)
  for stage in range(1,6):traces.append(base[:stage]+[(False,0x7777)]+base[1:])
  for stage in (6,7):
   traces.append(base[:stage]+[(True,0x40)]);traces.append(base[:stage]+[(False,header[stage-6]^1)])
  for trace in traces:
   expected=model(trace,header)
   for candidate in (False,True):
    uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,len(rom));uc.mem_write(0x08000000,rom);uc.mem_map(0x02000000,0x40000);uc.mem_map(0x03000000,0x8000);uc.mem_map(0x04000000,0x1000)
    if candidate:uc.mem_write(0x080f0000,code)
    uc.mem_write(0x020000ac,b''.join(x.to_bytes(2,'little') for x in header));uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_CPSR,0x13|((cases%16)<<28));state=dict(polls=0,writes=[],outcome=None,last=None,repeats=0)
    def hook(u,address,size,state):
     if address==0x08b1a198:
      error,value=trace[state['polls']];state['polls']+=1;u.reg_write(r.UC_ARM_REG_R1,value);flags=u.reg_read(r.UC_ARM_REG_CPSR)&0x3fffffff
      u.reg_write(r.UC_ARM_REG_CPSR,flags|(0 if error else 0x40000000));u.reg_write(r.UC_ARM_REG_PC,u.reg_read(r.UC_ARM_REG_LR));return
     if address==(0x080ff000 if candidate else 0x08b1a244):state['outcome']='handoff';u.emu_stop();return
     state['repeats']=state['repeats']+1 if address==state['last'] else 0;state['last']=address
     if state['repeats']>8:state['outcome']='halt';u.emu_stop()
    def write(u,access,address,size,value,state):
     assert address==0x0400012a and size==2;state['writes'].append(value&0xffff)
    uc.hook_add(UC_HOOK_CODE,hook,state);uc.hook_add(UC_HOOK_MEM_WRITE,write,state,0x04000000,0x04000fff);uc.emu_start(0x080f0000 if candidate else 0x08b1a1c4,0,count=2000)
    assert (state['polls'],state['writes'],state['outcome'])==expected,(candidate,trace,state,expected)
   cases+=1;outcomes[expected[2]]=outcomes.get(expected[2],0)+1
 report=dict(cases=cases,outcomes=outcomes,candidate_bytes=len(code),candidate_sha256=hashlib.sha256(code).hexdigest(),production_integrated=False,scope='Original and C draft agree with independent handshake model on poll consumption, ordered halfword sends, permanent halt or pre-BIOS handoff. Poll results are synthetic; stack, final register/flag equality, decompression and physical link timing are not validated. Candidate does not byte-match.')
 (OUT/'model.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
