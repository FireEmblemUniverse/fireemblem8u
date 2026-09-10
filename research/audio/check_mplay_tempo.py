#!/usr/bin/env python3
"""Verify MPlayMain tempo arithmetic, halfword truncation and full-width loop decisions."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ACC=0x080cfbb0;FIN=0x080cfcfa;GATE=0x080cfd00;TICK=0x080cfbb8;POST=0x080cfd08;DATA=0x02000000;SP=DATA+0x1000
NAMES={'accumulate':('MPlayTempoAccumulateCandidate',ACC,8),'finish':('MPlayTempoFinishCandidate',FIN,6),'gate':('MPlayTempoGateCandidate',GATE,8)}
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-tempo';out.mkdir(exist_ok=True)
 common=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so')]
 opts={
 'accumulate':common+['-fplugin-arg-tail_transfer-destination=MPlayMainTempoStore'],
 'finish':common+['-fplugin-arg-tail_transfer-destination=MPlayMainTempoStore','-fplugin-arg-tail_transfer-adjacent-destination=MPlayMainTempoStore'],
 'gate':common+['-fplugin-arg-tail_transfer-destination=MPlayMainTickLoop','-fplugin-arg-tail_transfer-destination=MPlayMainPostTick','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostTick','-fplugin-arg-tail_transfer-raise-unsigned-le-bound'],
 }
 for name in NAMES:
  subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/('research/audio/mplay_tempo_'+name+'.c')),'-o',str(out/(name+'.o'))]+opts[name],check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { '+''.join('.'+name+' '+hex(address)+' : { '+str(out/(name+'.o'))+'(.text) } ' for name,(_,address,_) in NAMES.items())+'MPlayMainTempoStore = '+hex(GATE)+'; MPlayMainTickLoop = '+hex(TICK)+'; MPlayMainPostTick = '+hex(POST)+'; }')
 elf=out/'candidate.elf';subprocess.run(['arm-none-eabi-ld','-T',str(script)]+[str(out/(name+'.o')) for name in NAMES]+['-o',str(elf)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';codes={}
 production=(ROOT/'fireemblem8.gba').read_bytes() if a.production else None
 if production is not None:assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 for name,(_,address,size) in NAMES.items():
  path=out/(name+'.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.'+name,str(elf),str(path)],check=True);code=path.read_bytes()
  assert len(code)==size and code==rom[address-0x08000000:address-0x08000000+size],(name,code.hex())
  if production is not None:assert code==production[address-0x08000000:address-0x08000000+size]
  codes[address]=code
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:
   for address,code in codes.items():uc.mem_write(address,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,trace))
 rng=random.Random(0x7e4f0);counts={name:0 for name in NAMES};outcomes={'tick':0,'post':0,'wide_register':0}
 def check(name,tempo,increment,initial,info):
  memory=bytearray([0xa5])*0x4000;memory[info+32-DATA:info+34-DATA]=(increment&65535).to_bytes(2,'little');memory[info+34-DATA:info+36-DATA]=(tempo&65535).to_bytes(2,'little');wanted=memory.copy()
  regs=[rng.getrandbits(32) for _ in range(13)];regs[7]=info;expected=regs.copy()
  if name=='accumulate':
   value=tempo+increment;expected[1]=increment;trace_wanted=[(16,info+34,2,None),(16,info+32,2,None)]
  elif name=='finish':
   value=(tempo-150)&0xffffffff;wanted[info+4-DATA:info+8-DATA]=regs[4].to_bytes(4,'little');trace_wanted=[(17,info+4,4,regs[4]),(16,info+34,2,None)]
  else:value=tempo;regs[0]=tempo;expected[0]=tempo;trace_wanted=[]
  expected[0]=value;wanted[info+34-DATA:info+36-DATA]=(value&65535).to_bytes(2,'little');trace_wanted.append((17,info+34,2,value))
  difference=(value-150)&0xffffffff;flags=(difference>>31)<<3|((difference==0)<<2)|((value>=150)<<1)|((((value^150)&(value^difference))>>31)&1);target=TICK if value>=150 else POST
  for uc,trace in machines:
   uc.mem_write(DATA,bytes(memory));trace.clear()
   for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
   uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28);uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679)
   uc.emu_start(NAMES[name][1]|1,target,count=15)
   assert uc.reg_read(r.UC_ARM_REG_PC)==target and uc.reg_read(r.UC_ARM_REG_CPSR)&32
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected,(name,tempo,increment)
   assert uc.reg_read(r.UC_ARM_REG_CPSR)>>28==flags and uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   assert bytes(uc.mem_read(DATA,0x4000))==wanted and trace==trace_wanted,(name,trace,trace_wanted)
  counts[name]+=1;outcomes['tick' if target==TICK else 'post']+=1;outcomes['wide_register']+=value>65535
 for tempo,increment in itertools.product(range(65536),(0,150,65535)):
  for info in (DATA+0x400,SP-32):check('accumulate',tempo,increment,tempo&15,info)
 for tempo in range(65536):
  for info in (DATA+0x400,SP-32):check('finish',tempo,0,tempo&15,info)
 values=[0,1,148,149,150,151,65535,65536,65537,0x7fffffff,0x80000000,0xffffffff]+[1<<n for n in range(32)]+[rng.getrandbits(32) for _ in range(256)]
 for value,initial,info in itertools.product(values,range(16),(DATA+0x400,SP-32)):check('gate',value,0,initial,info)
 report=dict(cases=counts,outcomes=outcomes,matching_instruction_bytes=22,production_integrated=a.production,scope='All halfword tempos with three increments and both normal/frame aliases; all halfword tick subtractions; full-width gate boundaries/random words with all NZCV; exact registers, flags, SP/LR, complete RAM and ordered halfword accesses.',limitations='MPlayMain track processing, callbacks, loop body and full return are outside these fragments.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
