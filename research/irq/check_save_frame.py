#!/usr/bin/env python3
"""Fresh-build the exact IRQ save frame and reject unsupported contracts."""
from pathlib import Path
import hashlib,json,random,subprocess,sys
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/irq-save-frame';OUT.mkdir(parents=True,exist_ok=True)
compiler=str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc')
subprocess.run([sys.executable,str(ROOT/'tools/arm-dispatch/build_irq_frame.py'),'--output-dir',str(OUT)],check=True,capture_output=True)
source=(ROOT/'research/irq/save_frame.c').read_text()
flags=[compiler,'-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
plugin=['-fplugin='+str(OUT/'irq_frame.so'),'-fplugin-arg-irq_frame-save-adjacent=IrqSearch']
def compile(name,text,extra):
 p=OUT/(name+'.c');p.write_text(text)
 return subprocess.run(flags+extra+[str(p),'-o',str(OUT/(name+'.o'))],capture_output=True,text=True)
result=compile('candidate',source,plugin+['-DRESEARCH_IRQ_SAVE']);assert result.returncode==0,result.stderr
layout='SECTIONS { .text 0x08000110 : { *(.text) } IrqSearch = 0x08000118; ASSERT(IrqSearch == IrqSaveFrame + SIZEOF(.text), "IRQ save adjacency changed") }'
(OUT/'candidate.ld').write_text(layout)
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'candidate.ld'),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
code=(OUT/'candidate.bin').read_bytes();assert code==(ROOT/'baserom.gba').read_bytes()[0x110:0x118]
rng=random.Random(0x110118)
for case in range(4096):
 u=Uc(UC_ARCH_ARM,UC_MODE_ARM);u.mem_map(0x08000000,0x1000);u.mem_write(0x08000110,code);u.mem_map(0x03000000,0x8000)
 cpsr=0x92|((case%16)<<28);spsr=(rng.getrandbits(4)<<28)|(0x3f if case&1 else 0x1f)
 u.reg_write(r.UC_ARM_REG_CPSR,cpsr);u.reg_write(r.UC_ARM_REG_SPSR,spsr)
 regs=[rng.getrandbits(32) for _ in range(15)];regs[13]=0x03007000
 for n,value in enumerate(regs):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
 u.mem_write(regs[13]-32,b'\xa5'*48)
 u.emu_start(0x08000110,0x08000118,count=2)
 expected=regs.copy();expected[0]=spsr;expected[13]-=16
 assert [u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(15)]==expected
 assert u.reg_read(r.UC_ARM_REG_CPSR)==cpsr and u.reg_read(r.UC_ARM_REG_SPSR)==spsr
 frame=b''.join(value.to_bytes(4,'little') for value in (spsr,regs[1],regs[3],regs[14]))
 assert bytes(u.mem_read(regs[13]-32,48))==b'\xa5'*16+frame+b'\xa5'*16
mutants=[('wrong_status',source.replace('mrs %0, spsr','mrs %0, cpsr'),[]),('wrong_size',source.replace('stack -= 4','stack -= 5'),[]),('wrong_register',source.replace('stack[2] = base','stack[2] = word'),[]),('wrong_target',source.replace('IrqSearch','OtherSearch'),[]),('argument',source.replace('IrqSaveFrame(void)','IrqSaveFrame(unsigned unused)'),[]),('debug',source,['-g']),('unwind',source,['-funwind-tables']),('thumb',source,['-mthumb'])]
for name,text,extra in mutants:
 result=compile(name,text,plugin+['-DRESEARCH_IRQ_SAVE']+extra)
 assert result.returncode!=0 and 'IRQ frame' in result.stderr,(name,result.stderr)
(OUT/'displaced.ld').write_text(layout.replace('0x08000118','0x0800011c'))
result=subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'displaced.ld'),str(OUT/'candidate.o'),'-o',str(OUT/'displaced.elf')],capture_output=True,text=True)
assert result.returncode!=0 and 'IRQ save adjacency changed' in result.stderr
for name,extra in [('plain',[]),('unannotated',plugin)]:
 result=compile(name,source,extra);assert result.returncode==0,result.stderr
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/(name+'.o')),str(OUT/(name+'.bin'))],check=True)
assert (OUT/'plain.bin').read_bytes()==(OUT/'unannotated.bin').read_bytes()
print(json.dumps(dict(cases=4096,bytes=len(code),c_generated_instruction_bytes=4,retained_status_assembly_bytes=4,sha256=hashlib.sha256(code).hexdigest(),source_sha256=hashlib.sha256(source.encode()).hexdigest(),backend_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/irq_frame.cc').read_bytes()).hexdigest(),rejected=[m[0] for m in mutants],displaced_handoff_rejected=True,unannotated_control_unchanged=True,production_integrated=False,scope='Exact eight-byte isolated region; random register/SPSR states, all sixteen NZCV profiles, exact sixteen-byte frame and untouched surrounding stack bytes. Stops at IrqSearch; no hardware interrupt-entry claim.'),indent=2))
