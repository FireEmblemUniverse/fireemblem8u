#!/usr/bin/env python3
"""Check exact 36-byte saved-frame restoration and shared ARM/Thumb return."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];BASE=0x08000000;ENTRY=0x080cfdb4;END=0x080cfdc2;DATA=0x02000000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-exit-restore';out.mkdir(parents=True,exist_ok=True);obj=out/'candidate.o';binary=out/'candidate.bin'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_exit_restore.c'),'-o',str(obj),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_frame_return.so'),'-fplugin-arg-thumb_frame_return-grouped','-fplugin-arg-thumb_frame_return-frame36'],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True);code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==rom[ENTRY-BASE:END-BASE]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(BASE,0x1000000);uc.mem_write(BASE,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  state={}
  def access(u,kind,address,size,value,state):state['memory'].append((kind,address,size,value if kind==17 else None))
  def step(u,address,size,state):
   if ENTRY<=address<END:state['steps'].append((address,u.reg_read(r.UC_ARM_REG_SP)))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,state);uc.hook_add(UC_HOOK_CODE,step,state);machines.append((uc,state))
 rng=random.Random(0xfe8e817);counts=dict(full=0,shared=0)
 for shared in (False,True):
  for sp in (DATA+0x1000,DATA+0x1800,DATA+0x2000,DATA+0x4000-36):
   for target in (0x080e0001,0x080e0020):
    for nz in range(16):
     for trial in range(128):
      regs=[rng.getrandbits(32) for _ in range(13)];words=[rng.getrandbits(32) for _ in range(8)]+[target];memory=bytearray([0xa5])*0x4000
      for k,value in enumerate(words):memory[sp-DATA+k*4:sp-DATA+k*4+4]=value.to_bytes(4,'little')
      expected=regs.copy();start=ENTRY
      if shared:regs[3]=target;expected=regs.copy();start=ENTRY+12;steps=[(start,sp)];reads=[];finalsp=sp
      else:
       expected[:8]=words[:8];expected[8:12]=words[:4];expected[3]=target;finalsp=sp+36
       steps=[(ENTRY,sp)]+[(ENTRY+offset,sp+32) for offset in (2,4,6,8,10)]+[(ENTRY+12,sp+36)];reads=[(16,sp+k*4,4,None) for k in range(9)]
      for uc,state in machines:
       uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
       for k,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(k)),value)
       uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);state.update(memory=[],steps=[]);uc.emu_start(start|1,target&~1,count=10)
       assert uc.reg_read(r.UC_ARM_REG_PC)==target&~1
       assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(k))) for k in range(13)]==expected
       assert uc.reg_read(r.UC_ARM_REG_CPSR)==(0x33 if target&1 else 0x13)|nz<<28
       assert uc.reg_read(r.UC_ARM_REG_SP)==finalsp and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
       assert bytes(uc.mem_read(DATA,0x4000))==memory and state['memory']==reads and state['steps']==steps
      counts['shared' if shared else 'full']+=1
 report=dict(cases=sum(counts.values()),outcomes=counts,matching_instruction_bytes=len(code),production_integrated=False,scope='Full restore and shared BX entry; ARM/Thumb returns, four stack positions including final RAM frame, all NZCV and random frame/register words. Exact all-register/CPSR/RAM/access state and SP at every instruction.',limitations='Candidate return fragment only; does not execute the preceding identifier store, MPlayMain body, or physical hardware timing.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
