#!/usr/bin/env python3
"""Verify private CGB frequency callback/return through the shared Thumb trampoline."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY,END,WAIT,TRAMP=0x080cfd7a,0x080cfd7e,0x080cfd7e,0x080cfdc0;DATA=0x02000000
CALLBACKS=(0x080e0001,0x080e0020)

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 continuation='MPlayMainPostCgbStore';candidate_name='MPlayPostCgbInvokeCandidate';prefix='command'
 out=ROOT/'.deps/soundmain-packed/mplay-post-cgb-invoke';out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'research/audio/mplay_post_cgb_invoke.c').read_text();options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_callback_tail.so'),'-fplugin-arg-thumb_callback_tail-trampoline=call_r3','-fplugin-arg-thumb_callback_tail-continuation='+continuation,'-fplugin-arg-thumb_callback_tail-fallthrough']
 def compile(name,text=source,flags=options):
  src=out/(name+'.c');asm=out/(name+'.s');obj=out/(name+'.o');src.write_text(text)
  result=subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(src),'-o',str(asm)]+flags,capture_output=True,text=True)
  if not result.returncode:result=subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('candidate');assert not result.returncode,result.stderr
 trampoline=out/'trampoline.s';trampoline.write_text('.syntax unified\n.thumb\n.global call_r3\n.thumb_func\ncall_r3:\n bx r3\n')
 subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(trampoline),'-o',str(out/'trampoline.o')],check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { '+str(obj)+'(.text) } .trampoline '+hex(TRAMP)+' : { '+str(out/'trampoline.o')+'(.text) } '+continuation+' = '+hex(WAIT)+'; }')
 elf=out/'candidate.elf';binary=out/'candidate.bin';subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),str(out/'trampoline.o'),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==END-ENTRY and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex();assert rom[TRAMP-0x08000000:TRAMP-0x08000000+2]==bytes.fromhex('1847')
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 for image in [elf]+([ROOT/'fireemblem8.elf'] if a.production else []):
  symbols=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(image)],text=True)
  entries=[line.split() for line in symbols.splitlines() if line.split() and line.split()[-1]=='call_r3']
  assert len(entries)==1 and entries[0][3]=='FUNC' and int(entries[0][1],16)==TRAMP|1,entries
 invalid=[('other_register',source.replace(prefix+'Callback asm("r3")',prefix+'Callback asm("r4")'),options),
          ('post_callback_work',source.replace(continuation+'();',prefix+'Input0 = 1; '+continuation+'();'),options),
          ('callback_arguments',source.replace('((void (*)(void))'+prefix+'Callback)();','((void (*)(u32))'+prefix+'Callback)('+prefix+'Input0);'),options),
          ('wrong_continuation',source.replace(continuation+'();','OtherContinuation();'),options),
          ('entry_argument',source.replace(candidate_name+'(void)',candidate_name+'(u32 arg)'),options),
          ('conditional_callback',source.replace('((void (*)(void))'+prefix+'Callback)();','if ('+prefix+'Callback) ((void (*)(void))'+prefix+'Callback)();'),options),
          ('missing_binding',source.replace('register volatile u32 '+prefix+'Input2 asm("r2");',''),options),
          ('debug',source,options+['-g']),('unwind',source,options+['-funwind-tables']),
          ('duplicate',source,options+[options[1]]),('missing_target',source,options[:2]+options[3:]),
          ('duplicate_fallthrough',source,options+['-fplugin-arg-thumb_callback_tail-fallthrough']*2),
          ('valued_fallthrough',source,options+['-fplugin-arg-thumb_callback_tail-fallthrough=1'])]
 for name,text,flags in invalid:
  result,_=compile('reject_'+name,text,flags);assert result.returncode,(name,result.stderr)
 plain=source.replace('__attribute__((matching_thumb_callback_tail))','');result,obj=compile('plain',plain,[]);assert not result.returncode,result.stderr;before=obj.read_bytes()
 result,obj=compile('plain',plain);assert not result.returncode and obj.read_bytes()==before,result.stderr
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  uc.mem_write(CALLBACKS[0]&~1,bytes.fromhex('08607047'));uc.mem_write(CALLBACKS[1],bytes.fromhex('000081e51eff2fe1'))
  state={}
  def access(u,kind,address,size,value,state):state['accesses'].append((kind,address,size,value if kind==17 else None))
  def callback(u,address,size,state):
   if address not in [x&~1 for x in CALLBACKS]:return
   state['entries'].append(([u.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)],u.reg_read(r.UC_ARM_REG_SP),u.reg_read(r.UC_ARM_REG_LR),u.reg_read(r.UC_ARM_REG_CPSR)))
   for n,value in enumerate(state['clobbers']):u.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   u.reg_write(r.UC_ARM_REG_CPSR,(u.reg_read(r.UC_ARM_REG_CPSR)&0x0fffffff)|(state['flags']<<28))
  uc.hook_add(UC_HOOK_CODE,callback,state,0x080e0000,0x080e0020);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,state,DATA,DATA+0x3fff);machines.append((uc,state))
 rng=random.Random(0xfe8ca11);cases=0
 for target,initial,returned,sp,offset,trial in itertools.product(CALLBACKS,range(16),range(16),(DATA+0x1000,DATA+0x1800,DATA+0x2000,DATA+0x2800),(-36,0,36),range(8)):
  memory=bytearray([0xa5])*0x4000;wanted=memory.copy();regs=[rng.getrandbits(32) for _ in range(13)];regs[3]=target;clobbers=[rng.getrandbits(32) for _ in range(13)];clobbers[1]=sp+offset;wanted[sp+offset-DATA:sp+offset-DATA+4]=clobbers[0].to_bytes(4,'little')
  for uc,state in machines:
   uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
   for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);state.update(entries=[],accesses=[],clobbers=clobbers,flags=returned)
   uc.emu_start(ENTRY|1,WAIT,count=12)
   assert state['entries']==[(regs,sp,(ENTRY+4)|1,(0x33 if target&1 else 0x13)|initial<<28)]
   assert uc.reg_read(r.UC_ARM_REG_PC)==WAIT and uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|returned<<28
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==clobbers
   assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==(ENTRY+4)|1
   assert bytes(uc.mem_read(DATA,0x4000))==wanted and state['accesses']==[(17,sp+offset,4,clobbers[0])]
  cases+=1
 report=dict(cgb_fallthrough=True,cases=cases,matching_instruction_bytes=END-ENTRY,production_integrated=a.production,rejected_contracts=len(invalid),unannotated_unchanged=True,
             scope='ARM/Thumb callbacks execute STR/BX LR; all incoming/returned NZCV combinations, four stack positions and three callback-write aliases; exact callback-entry registers/mode/SP/LR, all returned registers/flags, complete RAM and ordered writes.',
             limitations='Uses synthetic callbacks to test private dispatch/return mechanics; actual callback logic and full MPlayMain track execution remain outside this checker.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
