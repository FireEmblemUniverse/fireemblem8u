#!/usr/bin/env python3
"""Compare mixer entry state; candidate return and relocation are not integrated."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cf54c;ARM=ENTRY+12;CLEAR=ARM+84;DATA=0x02000000;SP=DATA+0x1000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--transfers',action='store_true');p.add_argument('--split',action='store_true');p.add_argument('--production',action='store_true');a=p.parse_args();a.split |= a.production;a.transfers |= a.split
 out=ROOT/'.deps/soundmain-packed/mixer-entry';out.mkdir(exist_ok=True);obj=out/'candidate.o'
 extra=[]
 if a.transfers:extra=['-fno-reorder-blocks','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=SoundMainRAM_NoReverb','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-indirect-register=1']
 source=ROOT/('src/m4a_mixer_entry.c' if a.production else 'research/audio/soundmain_mixer_entry_transfers.c' if a.transfers else 'research/audio/soundmain_mixer_entry.c')
 if a.split:
  replacement=out/'split.c';replacement.write_text(source.read_text().replace('matching_tail_transfer)', 'matching_tail_transfer, matching_thumb_split_handoff)'));source=replacement
  extra+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_split_handoff.so'),'-fplugin-arg-thumb_split_handoff-arm-destination=SoundMainRAM_Reverb','-fplugin-arg-thumb_split_handoff-thumb-destination=SoundMainRAM_NoReverb']
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(source),'-o',str(obj)]+extra,check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';original=rom[ENTRY-0x08000000:ARM-0x08000000]
 if a.production:
  assert (ROOT/'fireemblem8.gba').read_bytes()==rom
  symbols=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
  assert any(line.split()==['080cf54c','0000000c','T','SoundMainRAM'] for line in symbols.splitlines())
 machines=[]
 for copied in (False,True):
  delta=0x03002c60-ENTRY if copied else 0;target=ARM+delta;base=ENTRY+delta if a.split else (ENTRY-0x100+delta if a.transfers else (0x03002000 if copied else 0x08001000))
  elf=out/('ram.elf' if copied else 'rom.elf');binary=elf.with_suffix('.bin')
  subprocess.run(['arm-none-eabi-ld','-Ttext='+hex(base),'--entry='+('SoundMainRAM' if a.production else 'SoundMainRAM_EntryTransfersCandidate' if a.transfers else 'SoundMainRAM_EntryCandidate'), '--defsym=SoundMainRAM_NoReverb='+hex(CLEAR+delta),'--defsym=SoundMainRAM_Reverb='+hex(target),str(obj),'-o',str(elf)],check=True)
  subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  code=binary.read_bytes();assert len(code)==(12 if a.split else 16) and code[:4]==original[:4] and code[8:10]==bytes.fromhex('0847' if a.transfers else '7047')
  if a.split:assert code==original
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_map(0x03000000,0x8000);uc.mem_map(DATA,0x4000)
   start=base if candidate else ENTRY+delta;uc.mem_write(start,code if candidate else original);trace=[]
   def access(u,kind,address,size,value,log):log.append((kind,address,size,value if kind==17 else None))
   uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,start,target,CLEAR+delta,candidate,trace))
 rng=random.Random(0xe478);cases=0;zero=0
 for strength in range(256):
  for info in (DATA+0x400,DATA+0x401,SP-5):
   for flags in range(16):
    memory=bytearray([0xa5])*0x4000;memory[info+5-DATA]=strength
    regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=info;wanted=regs.copy();wanted[3]=strength
    for uc,start,target,clear,candidate,trace in machines:
     wanted[1]=target if strength else regs[1];uc.mem_write(DATA,bytes(memory));trace.clear()
     for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
     uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
     end=(target if strength else clear) if a.transfers else (start+8 if candidate or strength else clear)
     uc.emu_start(start|1,end,count=8)
     assert uc.reg_read(r.UC_ARM_REG_PC)==end
     assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==wanted
     assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
     assert uc.reg_read(r.UC_ARM_REG_CPSR)==(0x13 if a.transfers and strength else 0x33)|((6 if strength==0 else 2)<<28)
     assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==[(16,info+5,1,None)]
    cases+=1;zero+=strength==0
 report=dict(cases=cases,machines_per_case=4,zero_reverb_cases=zero,candidate_section_bytes=len(code),original_section_bytes=12,matching_prefix_bytes=4,production_integrated=a.production,full_transfers=a.transfers,exact_relative_transfer=a.split,scope=('Full selected-path transfers; ' if a.transfers else 'Decision-boundary state; ')+'all reverb bytes and initial NZCV, three info addresses, exact registers/flags/SP/LR/data and ordered byte read.',limitations=[('' if a.transfers else 'Candidate returns normally instead of transferring to the selected path. ')+('' if a.split else 'The ARM target literal is linked separately for ROM/RAM and is not position-independent. ')+'Cycle timing is not modeled.'])
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
