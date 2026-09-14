#!/usr/bin/env python3
"""Model startup initialization/restart and expose the draft's extra entry save."""
from pathlib import Path
import argparse,hashlib,json,random,subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/startup';OUT.mkdir(parents=True,exist_ok=True)
parser=argparse.ArgumentParser()
parser.add_argument('--source',type=Path,default=ROOT/'research/irq/startup.c')
parser.add_argument('--plugin',type=Path)
args=parser.parse_args()
extra=['-DRESEARCH_STARTUP_FRAME','-fplugin='+str(args.plugin.resolve())] if args.plugin else []
source=args.source
subprocess.run(['arm-none-eabi-gcc','-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',]+extra+[str(source),'-o',str(OUT/'startup.o')],check=True,capture_output=True)
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
rom=(ROOT/'baserom.gba').read_bytes();rng=random.Random(0xc0fa);cases=0;hashes={}
for thumb in (False,True):
 target=0x02021001 if thumb else 0x02020000
 (OUT/'startup.ld').write_text('SECTIONS { .text 0x080f0000 : { *(.text) } IrqMain = 0x080000fc; AgbMain = %d; __sp_irq = %d; __sp_usr = %d; }'%(target,symbols['__sp_irq'],symbols['__sp_usr']))
 subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'startup.ld'),str(OUT/'startup.o'),'-o',str(OUT/'startup.elf')],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'startup.elf'),str(OUT/'startup.bin')],check=True)
 candidate=(OUT/'startup.bin').read_bytes();words=[int.from_bytes(candidate[i:i+4],'little') for i in range(0,len(candidate),4)]
 call=words.index(0xe12fff11);assert words[call-1]==0xe1a0e00f
 candidate_return=0x080f0000+4*(call+1);hashes['thumb' if thumb else 'arm']=hashlib.sha256(candidate).hexdigest()
 for mode in (0x12,0x13,0x1f):
  for flags in range(16):
   seeds=[rng.getrandbits(32) for _ in range(13)];snapshots=[]
   bank_sp={0x12:0x03006000,0x13:0x03006200,0x1f:0x03006400}
   bank_lr={0x12:0x08040000,0x13:0x08050000,0x1f:0x08060000}
   for draft in (False,True):
    u=Uc(UC_ARCH_ARM,UC_MODE_ARM);u.mem_map(0x08000000,len(rom));u.mem_write(0x08000000,rom)
    u.mem_map(0x03000000,0x8000);u.mem_map(0x02000000,0x40000)
    u.mem_write(0x02020000,bytes.fromhex('1eff2fe1'));u.mem_write(0x02021000,bytes.fromhex('7047'))
    u.mem_write(0x08000220,target.to_bytes(4,'little'))
    if draft:u.mem_write(0x080f0000,candidate)
    for m in bank_sp:
     u.reg_write(r.UC_ARM_REG_CPSR,m);u.reg_write(r.UC_ARM_REG_SP,bank_sp[m]);u.reg_write(r.UC_ARM_REG_LR,bank_lr[m])
     u.mem_write(bank_sp[m]-32,b'\xa5'*64)
    u.reg_write(r.UC_ARM_REG_CPSR,mode|(flags<<28))
    for n,value in enumerate(seeds):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
    state={'calls':0,'writes':[],'snapshots':[]}
    def write(u,access,address,size,value,state):state['writes'].append((address,size,value))
    def hook(u,address,size,state):
     if address!=(target&~1):return
     state['calls']+=1
     assert u.reg_read(r.UC_ARM_REG_CPSR)==(0x3f if thumb else 0x1f)
     assert u.reg_read(r.UC_ARM_REG_SP)==symbols['__sp_usr']
     assert u.reg_read(r.UC_ARM_REG_LR)==(candidate_return if draft else 0x080000f0)
     assert int.from_bytes(u.mem_read(0x03007ffc,4),'little')==0x080000fc
     assert u.reg_read(r.UC_ARM_REG_R0)==0x080000fc and u.reg_read(r.UC_ARM_REG_R1)==target
     state['snapshots'].append([u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(13)])
     if state['calls']==2:u.emu_stop();return
     for n in (0,1,2,3,12):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),0xabcdef00+n)
     u.reg_write(r.UC_ARM_REG_CPSR,u.reg_read(r.UC_ARM_REG_CPSR)|(15-flags)<<28)
    u.hook_add(UC_HOOK_CODE,hook,state);u.hook_add(UC_HOOK_MEM_WRITE,write,state)
    u.emu_start(0x080f0000 if draft else 0x080000c0,0,count=100)
    assert state['calls']==2
    expected_writes=[(0x03007ffc,4,0x080000fc)]*2
    if draft and not args.plugin:expected_writes.insert(0,(bank_sp[mode]-4,4,bank_lr[mode]))
    assert state['writes']==expected_writes,(draft,state['writes'])
    for m in bank_sp:
     expected=bytearray(b'\xa5'*64)
     if draft and not args.plugin and m==mode:expected[28:32]=bank_lr[mode].to_bytes(4,'little')
     assert bytes(u.mem_read(bank_sp[m]-32,64))==expected
    u.reg_write(r.UC_ARM_REG_CPSR,0x12);assert u.reg_read(r.UC_ARM_REG_SP)==symbols['__sp_irq']
    u.reg_write(r.UC_ARM_REG_CPSR,0x13);assert u.reg_read(r.UC_ARM_REG_SP)==bank_sp[0x13]-(4 if draft and not args.plugin and mode==0x13 else 0)
    snapshots.append(state['snapshots'])
   assert snapshots[0]==snapshots[1], [(entry,n,hex(a),hex(b)) for entry,(left,right) in enumerate(zip(*snapshots)) for n,(a,b) in enumerate(zip(left,right)) if a!=b]
   cases+=1
report=dict(cases=cases,handoffs_per_case=2,initial_modes=['IRQ','Supervisor','System'],flag_profiles=16,handler_modes=['ARM','Thumb'],candidate_bytes=len(candidate),candidate_sha256=hashes,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),extra_entry_stack_write_bytes=0 if args.plugin else 4,production_integrated=False,scope='Synthetic main entry and return/restart: vector value, IRQ/System SP setup, main registers/flags and mode agree. Relocated return addresses are checked separately. Draft writes LR to the initial stack once; Supervisor SP also remains four bytes low when entered in Supervisor mode. Hardware reset/BIOS entry, real AgbMain and exact byte equality are not covered.')
if args.plugin:
 report['scope']=report['scope'].replace('Draft writes LR to the initial stack once; Supervisor SP also remains four bytes low when entered in Supervisor mode.', 'No initial-stack writes; Supervisor SP is preserved. Modeled memory-write traces agree exactly.')
print(json.dumps(report,indent=2))
