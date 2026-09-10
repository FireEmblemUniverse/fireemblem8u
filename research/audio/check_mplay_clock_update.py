#!/usr/bin/env python3
"""Verify exact clock increment and inactive-player status transfer."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY,END,EXIT=0x080cfce8,0x080cfcfa,0x080cfdb0;DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-clock-update';out.mkdir(parents=True,exist_ok=True)
 obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_clock_update.c'),'-o',str(obj),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainExit','-fplugin-arg-tail_transfer-destination=MPlayMainTempoFinish','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTempoFinish'],check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainTempoFinish = '+hex(END)+'; MPlayMainExit = '+hex(EXIT)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==18 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  def stop(u,address,size,data):
   if address in (END,EXIT):u.emu_stop()
  uc.hook_add(UC_HOOK_CODE,stop);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
 rng=random.Random(0xfe8c10c);clocks=list(range(256))+[256,65535,0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(128)];counts=dict(active=0,inactive=0)
 for clock in clocks:
  for player in (DATA+0x400,SP-12,SP-4,DATA+0x3ff0):
   for active in (0,1,0x80000000,0xffffffff):
    for initial in range(16):
     result=(clock+1)&0xffffffff;memory=bytearray([0xa5])*0x4000;memory[player+12-DATA:player+16-DATA]=clock.to_bytes(4,'little');changed=memory.copy();changed[player+12-DATA:player+16-DATA]=result.to_bytes(4,'little')
     regs=[rng.getrandbits(32) for _ in range(13)];regs[4]=active;regs[7]=player;expected=regs.copy();expected[0]=result if active else 0x80000000
     accesses=[(16,player+12,4,None),(17,player+12,4,result)]
     if not active:
      changed[player+4-DATA:player+8-DATA]=(0x80000000).to_bytes(4,'little');accesses.append((17,player+4,4,0x80000000))
     flags=((active>>31)<<3|2) if active else 8;target=END if active else EXIT
     for uc,trace in machines:
      uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
      for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
      uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,0,count=12)
      assert uc.reg_read(r.UC_ARM_REG_PC)==target
      assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
      assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
      assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
      assert bytes(uc.mem_read(DATA,0x4000))==changed and trace==accesses
     counts['active' if active else 'inactive']+=1
 report=dict(cases=sum(counts.values()),outcomes=counts,matching_instruction_bytes=18,production_integrated=a.production,
             scope='Clock bytes plus full-width boundaries/random words; all NZCV; four player placements including clock/status at SP and last RAM word; zero/low/high active-track words; exact registers, flags, complete RAM and ordered increment/conditional status store.',
             limitations='Stops at tempo finish or shared exit; complete MPlayMain execution is outside this fragment.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
