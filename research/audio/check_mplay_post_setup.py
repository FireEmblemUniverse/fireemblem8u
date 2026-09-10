#!/usr/bin/env python3
"""Verify post-tick list loads and saved-count/callback argument setup."""
import argparse,hashlib,json,random,subprocess,itertools
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-post-setup';out.mkdir(parents=True,exist_ok=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 if a.production:assert hashlib.sha1((ROOT/'fireemblem8.gba').read_bytes()).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 rng=random.Random(0xfe8f057);counts={}
 for name,entry,end,target in [('entry',0x080cfd08,0x080cfd0c,'MPlayMainPostTrackGuard'),('setup',0x080cfd1a,0x080cfd20,'MPlayMainPostTrackInvoke')]:
  obj=out/(name+'.o');elf=out/(name+'.elf');binary=out/(name+'.bin')
  options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-destination='+target,'-fplugin-arg-tail_transfer-adjacent-destination='+target]
  if name=='setup':options+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so'),'-fplugin-arg-copy_add_zero-preserve-thumb-high-copies']
  subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/('research/audio/mplay_post_'+name+'.c')),'-o',str(obj)]+options,check=True)
  script=out/(name+'.ld');script.write_text('SECTIONS { .text '+hex(entry)+' : { *(.text) } '+target+' = '+hex(end)+'; }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  code=binary.read_bytes();assert len(code)==end-entry and code==rom[entry-0x08000000:end-0x08000000],code.hex()
  if a.production:assert code==(ROOT/'fireemblem8.gba').read_bytes()[entry-0x08000000:end-0x08000000]
  machines=[]
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
   if candidate:uc.mem_write(entry,code)
   trace=[]
   def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
   uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
  words=(0,1,0x80000000,0xffffffff)
  fixtures=itertools.product(range(256),(DATA+0x400,SP-8,SP-44,DATA+0x3fd0),words,range(16)) if name=='entry' else itertools.product(list(range(256))+[256,65535,0x7fffffff,0x80000000,0xfffffffe,0xffffffff],words,words,range(16))
  cases=0
  for count,player,track,initial in fixtures:
   regs=[rng.getrandbits(32) for _ in range(13)];regs[7]=player;expected=regs.copy();memory=bytearray([0xa5])*0x4000
   if name=='entry':
    memory[player+8-DATA]=count;memory[player+44-DATA:player+48-DATA]=track.to_bytes(4,'little');expected[2]=count;expected[5]=track;flags=initial;accesses=[(16,player+8,1,None),(16,player+44,4,None)]
   else:
    regs[2]=expected[2]=count;regs[5]=expected[5]=track;expected[9]=count;expected[0]=player;expected[1]=track;flags=(track>>31)<<3|((track==0)<<2);accesses=[]
   for uc,trace in machines:
    uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
    for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
    uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(entry|1,end,count=6)
    assert uc.reg_read(r.UC_ARM_REG_PC)==end
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
    assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
    assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==accesses
   cases+=1
  counts[name]=cases
 report=dict(cases=sum(counts.values()),outcomes=counts,matching_instruction_bytes=10,production_integrated=a.production,scope='All track-count bytes for entry and extra full-width saved-count values for setup; zero/low/high argument words; all NZCV; ordered player reads at stack/final-word aliases; exact registers/flags and unchanged memory.',limitations='Stops before track guard or TrkVolPitSet invocation; complete post-tick processing remains outside this checker.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
