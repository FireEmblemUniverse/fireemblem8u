#!/usr/bin/env python3
"""Model ply_note priority saturation and flag-preserving channel-type dispatch."""
import argparse,hashlib,itertools,json,random
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,CGB,PCM,DATA=0x080cfee0,0x080cfefe,0x080cff30,0x02000000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--candidate-bin',type=Path);args=p.parse_args()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 original=rom[ENTRY-0x08000000:CGB-0x08000000];binary=args.candidate_bin.read_bytes() if args.candidate_bin else original;assert len(binary)==30
 uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_write(ENTRY,binary);uc.mem_map(DATA,0x4000)
 state={}
 def code(u,address,size,user):
  if address in (CGB,PCM):u.emu_stop();return
  assert ENTRY<=address<CGB
  assert u.reg_read(r.UC_ARM_REG_SP)==state['sp']
 def memory(u,kind,address,size,value,user):state['accesses'].append((kind,address,size,(value&((1<<(size*8))-1)) if kind==17 else None))
 uc.hook_add(UC_HOOK_CODE,code);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,memory)
 rng=random.Random(0xfe81a0);cases=0;outcomes={'pcm':0,'cgb':0};sums={'below':0,'equal':0,'above':0}
 player,track,tone=DATA+0x1000,DATA+0x2000,DATA+0x3000
 # Exhaust every independent priority pair with rotating type/flags, then
 # exhaust types and flags at saturation boundaries and alias placements.
 def inputs():
  for a,b in itertools.product(range(256),repeat=2):yield a,b,(a*17+b)&255,(a+b)&15,0
  for (a,b),ty,nz,alias in itertools.product(((0,0),(0,255),(128,127),(128,128),(255,255)),range(256),range(16),range(4)):yield a,b,ty,nz,alias
 for a,b,ty,nz,alias in inputs():
  sp=(DATA+0x800,player,track+20,tone-16)[alias]
  initial=bytearray([0xa5])*0x4000
  initial[player+9-DATA]=a;initial[track+29-DATA]=b;initial[tone-DATA]=ty
  initial[sp-DATA:sp-DATA+4]=player.to_bytes(4,'little')
  regs=[rng.getrandbits(32) for _ in range(13)];regs[5]=track;regs[9]=tone;wanted=regs.copy();ram=initial.copy();trace=[]
  def write(addr,value):ram[addr-DATA:addr-DATA+4]=value.to_bytes(4,'little');trace.append((17,addr,4,value))
  def read(addr,size):trace.append((16,addr,size,None));return int.from_bytes(ram[addr-DATA:addr-DATA+size],'little')
  write(sp+8,wanted[3]);wanted[6]=read(sp,4);wanted[1]=read(wanted[6]+9,1);wanted[0]=read(track+29,1)
  total=wanted[0]+wanted[1];wanted[0]=min(total,255);write(sp+16,wanted[0]);wanted[6]=wanted[9];wanted[0]=read(wanted[6],1);wanted[6]=wanted[0]&7;write(sp+12,wanted[6])
  # CMP sum,#255 sets carry; MOVS #255, MOVS #7 and ANDS retain it.
  flags=(4 if wanted[6]==0 else 0)|(2 if total>=255 else 0)
  pc=CGB if wanted[6] else PCM;outcome='cgb' if wanted[6] else 'pcm'
  uc.mem_write(DATA,bytes(initial));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
  for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
  uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x08000101);state.update(sp=sp,accesses=[])
  uc.emu_start(ENTRY|1,0,count=20);context=(a,b,ty,nz,alias,total)
  assert uc.reg_read(r.UC_ARM_REG_PC)==pc,context
  assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,context
  assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==0x08000101,context
  assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
  assert bytes(uc.mem_read(DATA,0x4000))==ram,context
  assert state['accesses']==trace,(context,state['accesses'],trace)
  outcomes[outcome]+=1;sums['below' if total<255 else 'equal' if total==255 else 'above']+=1;cases+=1
 report=dict(candidate=str(args.candidate_bin) if args.candidate_bin else None,exact_bytes=binary==original,cases=cases,outcomes=outcomes,priority_sum_classes=sums,original_instruction_bytes=30,
             scope='All 65,536 priority pairs; all type bytes and incoming NZCV at five saturation boundaries and four stack placements. Saved key can overwrite player/track priority, and clamped priority can overwrite tone type. Full registers/CPSR/SP/LR/RAM and ordered accesses.',
             limitations='Checks the original or a supplied 30-byte binary; does not establish C/compiler provenance. Stops at CGB/PCM selection entry; does not allocate channels or execute complete ply_note.')
 out=ROOT/'.deps/soundmain-packed/ply-note';out.mkdir(parents=True,exist_ok=True);(out/('priority-candidate-model.json' if args.candidate_bin else 'priority-original-model.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
