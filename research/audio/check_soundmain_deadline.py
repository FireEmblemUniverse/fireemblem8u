#!/usr/bin/env python3
"""Compare deadline C semantics against original control flow and ordered accesses."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY=0x080cf5e4;CONTINUE=0x080cf604;EXIT=0x080cf8d6;SP=0x02001000;DATA=0x02000000

def subflags(a,b):
 result=(a-b)&0xffffffff
 return ((result>>31)<<3)|((result==0)<<2)|((a>=b)<<1)|(((a^b)&(a^result))>>31)
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--direct',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/deadline';out.mkdir(exist_ok=True);obj=out/'candidate.o';binary=out/'candidate.bin'
 extra=[]
 if a.direct:
  extra=['-fno-reorder-blocks','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=SoundMainRAM_DeadlineContinue','-fplugin-arg-tail_transfer-destination=SoundMainRAM_DeadlineExit','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-raise-unsigned-bound','-fplugin-arg-tail_transfer-pool-adjacent-destination=SoundMainRAM_DeadlineContinue']
 source=ROOT/'src/m4a_deadline.c' if a.direct else ROOT/'research/audio/soundmain_deadline.c'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]+extra+[str(source),'-o',str(obj)],check=True)
 if a.direct:
  elf=out/'candidate.elf'
  subprocess.run(['arm-none-eabi-ld','-Ttext=0x08001000','--entry=SoundMainRAM_ChanLoop','--defsym=SoundMainRAM_DeadlineContinue=0x08001020','--defsym=SoundMainRAM_DeadlineExit='+hex(0x08001000+EXIT-ENTRY),str(obj),'-o',str(elf)],check=True)
  obj=elf
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
 code=binary.read_bytes();returns=[i for i in range(0,len(code),2) if code[i:i+2]==bytes.fromhex('7047')]
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 if a.direct:
  assert code==rom[ENTRY-0x08000000:CONTINUE-0x08000000],code.hex()
  assert (ROOT/'fireemblem8.gba').read_bytes()==rom
  symbols=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
  assert any(line.split()==['080cf5e4','00000020','T','SoundMainRAM_ChanLoop'] for line in symbols.splitlines())
 else:assert len(returns)==1
 machines=[]
 for copied in (False,True):
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(0x03000000,0x8000);uc.mem_map(DATA,0x4000);uc.mem_map(0x04000000,0x1000)
   delta=0x03002c60-0x080cf54c if copied else 0
   start=(0x03002000 if copied else 0x08001000) if candidate else ENTRY+delta
   uc.mem_write(start,code if candidate else rom[ENTRY-0x08000000:CONTINUE-0x08000000]);trace=[]
   def hook(u,kind,address,size,value,user):user.append((kind,address,size,value if kind==17 else None))
   # Exclude PC-relative code/literal reads; compare all frame/channel/MMIO accesses.
   uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,hook,trace,DATA,DATA+0x3fff)
   uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,hook,trace,0x04000000,0x04000fff)
   machines.append((uc,start,delta,candidate,trace))
 rng=random.Random(0xdeadd1);cases=0;flagdiff=0;regdiff={};paths={'no_deadline':0,'continue':0,'exit':0}
 for scan in range(256):
  normalized=scan+228 if scan<160 else scan
  for deadline in sorted({0,1,normalized-1,normalized,normalized+1,0x7fffffff,0x80000000,0xffffffff}):
   for channel in (DATA+0x100,SP-32,SP-16):
    for flags in range(16):
     memory=bytearray([0xa5])*0x4000
     def write(address,value):memory[address-DATA:address-DATA+4]=value.to_bytes(4,'little')
     wave=rng.getrandbits(32);channels=rng.getrandbits(32);write(channel+36,wave);write(SP+20,deadline)
     initial=bytes(memory);write(SP+4,channels);wave=int.from_bytes(memory[channel+36-DATA:channel+40-DATA],'little')
     exiting=bool(deadline and normalized>=deadline);paths['exit' if exiting else 'continue' if deadline else 'no_deadline']+=1
     regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=channels;regs[4]=channel;wanted=regs.copy();wanted[0]=deadline;wanted[3]=wave
     if deadline:wanted[1]=normalized
     wantedflags=subflags(normalized,deadline) if deadline else subflags(0,0)
     expected=[(17,SP+4,4,channels),(16,channel+36,4,None),(16,SP+20,4,None)]
     if deadline:expected.append((16,0x04000006,1,None))
     for uc,start,delta,candidate,trace in machines:
      uc.mem_write(DATA,initial);uc.mem_write(0x04000006,bytes([scan]));trace.clear()
      for i,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),v)
      uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
      end=(start+(EXIT if exiting else CONTINUE)-ENTRY if a.direct else start+returns[0]) if candidate else (EXIT if exiting else CONTINUE)+delta
      uc.emu_start(start|1,end,count=30)
      actual=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)];actualflags=uc.reg_read(r.UC_ARM_REG_CPSR)>>28
      assert uc.reg_read(r.UC_ARM_REG_PC)==end and uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef,(scan,deadline,candidate,'control')
      assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==expected,(scan,deadline,candidate,trace,expected)
      if not candidate or a.direct:assert actual==wanted and actualflags==wantedflags,(scan,deadline,actualflags,wantedflags)
      else:
       assert actual[2]==int(exiting)
       assert all(actual[i]==wanted[i] for i in range(13) if i!=2)
       if delta==0:
        flagdiff+=actualflags!=wantedflags
        for i,(x,y) in enumerate(zip(actual,wanted)):
         if x!=y:regdiff[str(i)]=regdiff.get(str(i),0)+1
     cases+=1
 report=dict(cases=cases,machines_per_case=4,paths=paths,original_section_bytes=32,candidate_section_bytes=len(code),register_mismatch_cases=regdiff,flag_mismatch_cases=flagdiff,production_integrated=a.direct,direct_transfers=a.direct,scope='Every VCOUNT byte, unsigned deadline boundaries including high-bit values, all initial flags, frame/channel aliases, ordered data/MMIO accesses and complete tested memory.',limitations=['Candidate decision is in r2; production branches directly. Candidate BX LR is intercepted.','Scratch-register and flag differences are measured, not accepted as matching.','PC-relative literal reads are excluded from access traces. Cycle timing is not modeled.'])
 if a.direct:report['limitations']=['PC-relative literal reads are excluded from access traces. Cycle timing is not modeled.']
 (out/('direct-report.json' if a.direct else 'report.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
