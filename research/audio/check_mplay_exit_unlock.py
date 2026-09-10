#!/usr/bin/env python3
"""Verify exit identifier restoration before saved-frame loads."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,POOL=0x080cfdb0,0x080cfdb4,0x080cfdcc
DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-exit-unlock';out.mkdir(parents=True,exist_ok=True)
 source=ROOT/'research/audio/mplay_exit_unlock.c';obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_shared_literal.so'),'-fplugin-arg-thumb_shared_literal-literal=0x68736d53,lt2_ID_NUMBER','-fplugin-arg-thumb_shared_literal-omit-pool-alignment','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-after-shared-literals','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-destination=MPlayMainExitRestore','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainExitRestore']
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(source),'-o',str(obj)]+options,check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } lt2_ID_NUMBER = '+hex(POOL)+'; MPlayMainExitRestore = '+hex(END)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==4 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
 rng=random.Random(0xfe8e117);values=[0,1,0x68736d53,0x7fffffff,0x80000000,0xffffffff]+[1<<n for n in range(32)]+[rng.getrandbits(32) for _ in range(128)]
 cases=0
 # Every saved-frame word can alias the identifier destination, including saved LR.
 players=[DATA+0x400]+[SP+offset-52 for offset in range(0,36,4)]+[DATA+0x4000-56]
 for value in values:
  for player in players:
   for nz in range(16):
    regs=[rng.getrandbits(32) for _ in range(13)];regs[7]=player;expected=regs.copy();expected[0]=value
    memory=bytes(rng.getrandbits(8) for _ in range(64))+bytes([0xa5])*(0x4000-64);wanted=bytearray(memory);wanted[player+52-DATA:player+56-DATA]=value.to_bytes(4,'little')
    for uc,trace in machines:
     uc.mem_write(DATA,memory);uc.mem_write(POOL,value.to_bytes(4,'little'));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
     for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
     uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,END,count=4)
     assert uc.reg_read(r.UC_ARM_REG_PC)==END
     assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
     assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|nz<<28
     assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
     assert bytes(uc.mem_read(DATA,0x4000))==wanted and trace==[(16,POOL,4,None),(17,player+52,4,value)]
    cases+=1
 report=dict(cases=cases,matching_instruction_bytes=4,production_integrated=a.production,
 scope='Original identifier plus synthetic literal boundaries/single bits/random words; eleven player placements including each saved-frame word and final RAM word, all NZCV; exact registers/CPSR/SP/LR/RAM and literal-read then identifier-write order.',
 limitations='Synthetic cases patch the shared ROM literal in both images; stops before stack restoration and does not execute a complete return.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
