#!/usr/bin/env python3
"""Verify frequency-path selection and ordered CGB/PCM argument setup."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];BASE=0x08000000;DATA=0x02000000;SP=DATA+0x1000
PARTS=[('frequency_select',0x080cfd6c,0x080cfd70,'MPlayMainPostCgbSetup'),('cgb_setup',0x080cfd70,0x080cfd7a,'MPlayMainPostCgbInvoke'),('pcm_setup',0x080cfd8a,0x080cfd90,'MPlayMainPostPcmInvoke')]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-post-frequency-setup';out.mkdir(parents=True,exist_ok=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert production==rom
 rng=random.Random(0xfe8f2e9);reports={}
 for part,entry,end,destination in PARTS:
  source=ROOT/('research/audio/mplay_post_'+part+'.c');obj=out/(part+'.o');elf=out/(part+'.elf');binary=out/(part+'.bin')
  options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination='+destination,'-fplugin-arg-tail_transfer-private-frame64']
  if part=='frequency_select':
   options+=['-fplugin-arg-tail_transfer-destination=MPlayMainPostPcmSetup','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination='+destination,'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_direct_tails.so'),'-fplugin-arg-thumb_direct_tails-destination=MPlayMainPostPcmSetup','-fplugin-arg-thumb_direct_tails-expected-transfers=1']
  else:
   options+=['-fplugin-arg-tail_transfer-adjacent-destination='+destination,'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so')]
   if part=='cgb_setup':options+=['-fplugin-arg-copy_add_zero-preserve-thumb-high-copies']
  command=[a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
  subprocess.run(command+[str(source),'-o',str(obj)]+options,check=True)
  script=out/(part+'.ld');script.write_text('SECTIONS { .text '+hex(entry)+' : { *(.text) } '+destination+' = '+hex(end)+'; '+('MPlayMainPostPcmSetup = 0x080cfd8a;' if part=='frequency_select' else '')+' }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  code=binary.read_bytes();assert len(code)==end-entry and code==rom[entry-BASE:end-BASE],(part,code.hex())
  if a.production:assert code==production[entry-BASE:end-BASE]
  machines=[];exits=(end,0x080cfd8a) if part=='frequency_select' else (end,)
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(BASE,0x1000000);uc.mem_write(BASE,rom);uc.mem_map(DATA,0x4000)
   if candidate:uc.mem_write(entry,code)
   trace=[]
   def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
   def stop(u,address,size,exits):
    if address in exits:u.emu_stop()
   uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);uc.hook_add(UC_HOOK_CODE,stop,exits);machines.append((uc,trace))
  cases=0
  bounds=[0,1,0x7fffffff,0x80000000,0xfffffffe,0xffffffff]
  if part=='frequency_select':
   values=list(range(256))+bounds+[1<<n for n in range(32)]+[rng.getrandbits(32) for _ in range(128)]
   inputs=((typ,0,0,0,nz) for typ in values for nz in range(16))
  else:
   types=list(range(8))+bounds
   regular=((typ,key,pitch,alias,(typ+key+pitch+alias)%16) for typ,key,pitch,alias in itertools.product(types,bounds,range(256),range(4)))
   randoms=[(rng.getrandbits(32),rng.getrandbits(32),rng.randrange(256),rng.randrange(4),nz) for _ in range(128) for nz in range(16)]
   inputs=itertools.chain(regular,randoms)
  for typ,key,pitch,alias,nz in inputs:
   regs=[rng.getrandbits(32) for _ in range(13)];memory=bytearray([0xa5])*0x4000;target=end;accesses=[]
   regs[6]=typ
   if part=='frequency_select':
    expected=regs.copy();flags=((typ>>31)<<3)|((typ==0)<<2)|2;target=0x080cfd8a if typ==0 else end
   else:
    track=DATA+0x800;pointer=DATA+0x400;offset=48 if part=='cgb_setup' else 36
    if alias==1:pointer=SP-offset
    elif alias==2:track=SP-9
    elif alias==3:pointer=SP-offset;track=SP-9
    memory[pointer+offset-DATA:pointer+offset-DATA+4]=rng.getrandbits(32).to_bytes(4,'little');memory[track+9-DATA]=pitch
    word=int.from_bytes(memory[pointer+offset-DATA:pointer+offset-DATA+4],'little')
    regs[2]=key;regs[5]=track;regs[8 if part=='cgb_setup' else 4]=pointer
    expected=regs.copy();expected[1]=key;expected[2]=pitch
    if part=='cgb_setup':
     expected[0]=typ;expected[3]=word;flagvalue=typ;accesses=[(16,pointer+48,4,None),(16,track+9,1,None)]
    else:
     expected[0]=word;flagvalue=key;accesses=[(16,track+9,1,None),(16,pointer+36,4,None)]
    flags=((flagvalue>>31)<<3)|((flagvalue==0)<<2)
   for uc,trace in machines:
    uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
    for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
    uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(entry|1,0,count=10)
    assert uc.reg_read(r.UC_ARM_REG_PC)==target
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,(part,typ,key,pitch,alias,nz)
    assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
    assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==accesses
   cases+=1
  reports[part]=dict(cases=cases,matching_instruction_bytes=len(code),candidate_sha256=hashlib.sha256(code).hexdigest())
 report=dict(parts=reports,cases=sum(x['cases'] for x in reports.values()),production_integrated=a.production,
 scope='Full-width type selection; all pitch bytes with boundary keys/types across four aliases and cycling NZCV, plus random cases at every NZCV. Exact r0-r12/SP/LR/CPSR/RAM and ordered pointer/byte reads, including shared-byte pointer aliases.',limitations='Stops before frequency calls; no target invocation or whole MPlayMain execution.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
