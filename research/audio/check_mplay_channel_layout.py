#!/usr/bin/env python3
"""Reject altered production channel-gate extents and unsafe short-tail targets."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 out=ROOT/'.deps/soundmain-packed/mplay-channel-gate-direct/layout';out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'ldscript.txt').read_text()
 def link(name,text):
  script=out/(name+'.ld');script.write_text(text)
  result=subprocess.run(['arm-none-eabi-ld','-T',str(script),'@objects.lst','-R','banim/data_banim.o.sym.o','-L','tools/agbcc/lib','-o',str(out/(name+'.elf')),'-lc','-lgcc'],cwd=ROOT,capture_output=True,text=True)
  (out/(name+'.log')).write_text(result.stdout+result.stderr)
  return result
 r=link('valid',source);assert not r.returncode,r.stderr
 cases=[('extent',source.replace('        __mplay_channel_gate_end = .;', '        . += 2;\n        __mplay_channel_gate_end = .;'),'extent or continuation'),
        ('continuation',source.replace('        src/m4a_1.o(.text.after_mplay_channel_gate);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_channel_gate);'),'extent or continuation')]
 first=source.index('        ASSERT((MPlayMainChannelGate & ~1)')
 second=source.index('        ASSERT(MPlayMainChannelClear >=',first)
 range_only=source[:first]+source[second:]
 for name,expression in [('far','__mplay_channel_gate_start + 512'),('backward','__mplay_channel_gate_start - 512'),('odd','__mplay_channel_gate_start + 35')]:
  target='__mplay_channel_next_start' if name=='odd' else 'MPlayMainChannelNext'
  text=range_only.replace('        ASSERT(MPlayMainChannelClear >=','        '+target+' = '+expression+';\n        ASSERT(MPlayMainChannelClear >=',1)
  cases.append((name,text,'conditional tail out of range'))
 cases += [('next_extent',source.replace('        __mplay_channel_next_end = .;','        . += 2;\n        __mplay_channel_next_end = .;'),'channel next extent or continuation'),
           ('track_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_channel_next);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_channel_next);'),'channel next extent or continuation'),
           ('next_far_gate',source.replace('        ASSERT((MPlayMainChannelGate & ~1) + 256 >=','        MPlayMainChannelGate = __mplay_channel_next_start + 264;\n        ASSERT((MPlayMainChannelGate & ~1) + 256 >=',1),'channel next conditional tail out of range')]
 cases += [('track_guard_extent',source.replace('        __mplay_track_init_guard_end = .;','        . += 2;\n        __mplay_track_init_guard_end = .;'),'track init guard extent'),
           ('track_defaults_extent',source.replace('        __mplay_track_init_defaults_end = .;','        . += 2;\n        __mplay_track_init_defaults_end = .;'),'track defaults extent'),
           ('track_dispatch_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_track_init_defaults);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_track_init_defaults);'),'track defaults extent')]
 for name,expression in [('track_wait_far','__mplay_track_init_guard_start + 512'),('track_wait_odd','__mplay_track_init_guard_start + 127')]:
  text=source.replace('        ASSERT((MPlayMainTrackWait & ~1) >=','        MPlayMainTrackWait = '+expression+';\n        ASSERT((MPlayMainTrackWait & ~1) >=',1)
  cases.append((name,text,'track init transfer out of range'))
 cases += [('command_read_extent',source.replace('        __mplay_command_read_end = .;','        . += 2;\n        __mplay_command_read_end = .;'),'command read extent or decode'),
           ('command_decode_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_command_read);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_command_read);'),'command read extent or decode')]
 cases += [('note_setup_extent',source.replace('        __mplay_note_setup_end = .;','        . += 2;\n        __mplay_note_setup_end = .;'),'note setup extent or callback'),
           ('note_callback_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_note_setup);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_note_setup);'),'note setup extent or callback')]
 cases += [('note_invoke_extent',source.replace('        __mplay_note_invoke_end = .;','        . += 2;\n        __mplay_note_invoke_end = .;'),'note invoke extent or following'),
           ('note_following_entry',source.replace('        src/m4a_1.o(.text.after_mplay_note_invoke);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_note_invoke);'),'note invoke extent or following'),
           ('note_trampoline',source.replace('        ASSERT((call_r3 & ~1) ==','        call_r3 = (MPlayMain & ~1) + 599;\n        ASSERT((call_r3 & ~1) ==',1),'note invoke trampoline or continuation'),
           ('note_far_continuation',source.replace('        ASSERT((call_r3 & ~1) ==','        MPlayMainTrackWait = __mplay_note_invoke_start + 2056;\n        ASSERT((call_r3 & ~1) ==',1),'note invoke trampoline or continuation')]
 cases += [('command_setup_extent',source.replace('        __mplay_command_setup_end = .;','        . += 2;\n        __mplay_command_setup_end = .;'),'command setup extent or callback'),
           ('command_callback_entry',source.replace('        src/m4a_1.o(.text.after_mplay_command_setup);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_command_setup);'),'command setup extent or callback')]
 cases += [('command_invoke_extent',source.replace('        __mplay_command_invoke_end = .;','        . += 2;\n        __mplay_command_invoke_end = .;'),'command invoke extent or continuation'),
           ('command_status_entry',source.replace('        src/m4a_1.o(.text.after_mplay_command_invoke);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_command_invoke);'),'command invoke extent or continuation')]
 cases += [('command_status_extent',source.replace('        __mplay_command_status_end = .;','        . += 2;\n        __mplay_command_status_end = .;'),'command status extent or continuation'),
           ('wait_command_entry',source.replace('        src/m4a_1.o(.text.after_mplay_command_status);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_command_status);'),'command status extent or continuation')]
 for name,expression in [('finish_far','__mplay_command_status_start + 264'),('finish_backward','__mplay_command_status_start - 256'),('finish_odd','__mplay_command_status_start + 109')]:
  text=source.replace('        ASSERT((MPlayMainTrackFinish & ~1) >=','        MPlayMainTrackFinish = '+expression+';\n        ASSERT((MPlayMainTrackFinish & ~1) >=',1)
  cases.append((name,text,'command status transfer out of range'))
 cases += [('wait_command_extent',source.replace('        __mplay_wait_command_end = .;','        . += 2;\n        __mplay_wait_command_end = .;'),'wait command extent or continuation'),
           ('wait_track_entry',source.replace('        src/m4a_1.o(.text.after_mplay_wait_command);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_wait_command);'),'wait command extent or continuation')]
 for name,expression in [('clock_far','((__mplay_wait_command_start + 4) & ~3) + 1024'),('clock_backward','((__mplay_wait_command_start + 4) & ~3) - 4'),('clock_unaligned','((__mplay_wait_command_start + 4) & ~3) + 2')]:
  text=source.replace('        ASSERT((lt_gClockTable & 3) ==','        lt_gClockTable = '+expression+';\n        ASSERT((lt_gClockTable & 3) ==',1)
  cases.append((name,text,'wait command shared literal out of range'))
 cases += [('track_wait_extent',source.replace('        __mplay_track_wait_end = .;','        . += 2;\n        __mplay_track_wait_end = .;'),'track wait extent or continuation'),
           ('modulation_entry',source.replace('        src/m4a_1.o(.text.after_mplay_track_wait);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_track_wait);'),'track wait extent or continuation')]
 for name,expression in [('wait_dispatch_far','__mplay_track_wait_start + 264'),('wait_dispatch_backward','__mplay_track_wait_start - 250')]:
  text=source.replace('        ASSERT((MPlayMainTrackDispatch & ~1) + 256 >=','        MPlayMainTrackDispatch = '+expression+';\n        ASSERT((MPlayMainTrackDispatch & ~1) + 256 >=',1)
  cases.append((name,text,'track wait command transfer out of range'))
 cases += [('modulation_guard_extent',source.replace('        __mplay_modulation_guard_end = .;','        . += 2;\n        __mplay_modulation_guard_end = .;'),'modulation guard extent or continuation'),
           ('modulation_update_entry',source.replace('        src/m4a_1.o(.text.after_mplay_modulation_guard);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_modulation_guard);'),'modulation guard extent or continuation')]
 for name,expression in [('modulation_finish_far','__mplay_modulation_guard_start + 264'),('modulation_finish_backward','__mplay_modulation_guard_start - 256'),('modulation_finish_odd','__mplay_modulation_guard_start + 83')]:
  text=source.replace('        ASSERT((MPlayMainTrackFinish & ~1) >= __mplay_modulation_guard','        MPlayMainTrackFinish = '+expression+';\n        ASSERT((MPlayMainTrackFinish & ~1) >= __mplay_modulation_guard',1)
  cases.append((name,text,'modulation guard transfer out of range'))
 cases += [('modulation_update_extent',source.replace('        __mplay_modulation_update_end = .;','        . += 2;\n        __mplay_modulation_update_end = .;'),'modulation update extent or continuation'),
           ('track_finish_entry',source.replace('        src/m4a_1.o(.text.after_mplay_modulation_update);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_modulation_update);'),'modulation update extent or continuation')]
 cases += [('track_finish_extent',source.replace('        __mplay_track_finish_end = .;','        . += 2;\n        __mplay_track_finish_end = .;'),'track finish extent or continuation'),
           ('track_advance_entry',source.replace('        src/m4a_1.o(.text.after_mplay_track_finish);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_track_finish);'),'track finish extent or continuation'),
           ('track_advance_extent',source.replace('        __mplay_track_advance_end = .;','        . += 2;\n        __mplay_track_advance_end = .;'),'track advance extent or continuation'),
           ('clock_update_entry',source.replace('        src/m4a_1.o(.text.after_mplay_track_advance);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_track_advance);'),'track advance extent or continuation')]
 for name,expression in [('advance_loop_far','__mplay_track_advance_start + 2062'),('advance_loop_backward','__mplay_track_advance_start - 2036'),('advance_loop_odd','__mplay_track_advance_start - 283')]:
  text=source.replace('        ASSERT(MPlayMainTrackLoop + 2048 >=','        MPlayMainTrackLoop = '+expression+';\n        ASSERT(MPlayMainTrackLoop + 2048 >=',1)
  cases.append((name,text,'track advance loop transfer out of range'))
 cases += [('clock_update_extent',source.replace('        __mplay_clock_update_end = .;','        . += 2;\n        __mplay_clock_update_end = .;'),'clock update extent or continuation'),
           ('tempo_finish_entry',source.replace('        src/m4a_1.o(.text.after_mplay_clock_update);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_clock_update);'),'clock update extent or continuation')]
 for name,expression in [('clock_exit_far','__mplay_clock_update_start + 2068'),('clock_exit_backward','__mplay_clock_update_start - 2048'),('clock_exit_odd','__mplay_clock_update_start + 201')]:
  text=source.replace('        ASSERT(MPlayMainExit >=','        MPlayMainExit = '+expression+';\n        ASSERT(MPlayMainExit >=',1)
  cases.append((name,text,'clock update exit transfer out of range'))
 cases += [('post_track_guard_extent',source.replace('        __mplay_post_track_guard_end = .;','        . += 2;\n        __mplay_post_track_guard_end = .;'),'post track guard extent or continuation'),
           ('post_track_setup_entry',source.replace('        src/m4a_1.o(.text.after_mplay_post_track_guard);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_track_guard);'),'post track guard extent or continuation')]
 for name,expression in [('post_track_skip_far','__mplay_post_track_guard_start + 264'),('post_track_skip_backward','__mplay_post_track_guard_start - 256'),('post_track_skip_odd','__mplay_post_track_guard_start + 155')]:
  text=source.replace('        ASSERT(MPlayMainPostTrackNext >=','        MPlayMainPostTrackNext = '+expression+';\n        ASSERT(MPlayMainPostTrackNext >=',1)
  cases.append((name,text,'post track guard transfer out of range'))
 cases += [('mplay_pool_placement',source.replace('        src/m4a_1.o(.text.mplay_main_literals);','        . += 2;\n        src/m4a_1.o(.text.mplay_main_literals);'),'MPlay shared literal placement changed')]
 for part in ('entry','setup'):
  cases.append(('post_'+part+'_extent',source.replace('        __mplay_post_'+part+'_end = .;','        . += 2;\n        __mplay_post_'+part+'_end = .;'),'post '+part+' extent or continuation'))
  cases.append(('post_'+part+'_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_post_'+part+');','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_'+part+');'),'post '+part+' extent or continuation'))
 cases += [('post_invoke_extent',source.replace('        __mplay_post_invoke_end = .;','        . += 2;\n        __mplay_post_invoke_end = .;'),'post invoke extent or continuation'),
           ('post_channel_load_entry',source.replace('        src/m4a_1.o(.text.after_mplay_post_invoke);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_invoke);'),'post invoke extent or continuation')]
 for name,expression in [('post_direct_far','__mplay_post_invoke_start + 4194308'),('post_direct_backward','__mplay_post_invoke_start - 4194304')]:
  text=source.replace('        ASSERT((TrkVolPitSet & ~1) >=','        TrkVolPitSet = '+expression+';\n        ASSERT((TrkVolPitSet & ~1) >=',1)
  cases.append((name,text,'post invoke direct callee out of range'))
 for part in ('channel_load','channel_next','track_finish'):
  cases.append(('post_'+part+'_extent',source.replace('        __mplay_post_'+part+'_end = .;','        . += 2;\n        __mplay_post_'+part+'_end = .;'),'post '+part+' extent or continuation'))
  cases.append(('post_'+part+'_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_post_'+part+');','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_'+part+');'),'post '+part+' extent or continuation'))
 for name,expression in [('post_channel_gate_far','__mplay_post_channel_next_start + 264'),('post_channel_gate_backward','__mplay_post_channel_next_start - 250'),('post_channel_gate_odd','__mplay_post_channel_next_start - 107')]:
  text=source.replace('        ASSERT((MPlayMainPostTrackFinish & ~1) >=','        MPlayMainPostChannelGate = '+expression+';\n        ASSERT((MPlayMainPostTrackFinish & ~1) >=',1)
  cases.append((name,text,'post channel transfer out of range'))
 for part in ('channel_gate','clear_setup','clear_invoke'):
  cases.append(('post_'+part+'_extent',source.replace('        __mplay_post_'+part+'_end = .;','        . += 2;\n        __mplay_post_'+part+'_end = .;'),'post '+part+' extent or continuation'))
  cases.append(('post_'+part+'_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_post_'+part+');','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_'+part+');'),'post '+part+' extent or continuation'))
 for name,expression in [('body_far','__mplay_post_channel_gate_start + 266'),('body_backward','__mplay_post_channel_gate_start - 248'),('body_odd','__mplay_post_channel_gate_start + 17')]:
  text=source.replace('        ASSERT(MPlayMainPostChannelBody >=','        MPlayMainPostChannelBody = '+expression+';\n        ASSERT(MPlayMainPostChannelBody >=',1)
  cases.append((name,text,'post channel_gate transfer out of range'))
 for name,symbol,expression in [('clear_far','ClearChain','__mplay_post_clear_invoke_start + 4194308'),('clear_backward','ClearChain','__mplay_post_clear_invoke_start - 4194304'),('clear_next_far','MPlayMainPostChannelNext','__mplay_post_clear_invoke_start + 2056'),('clear_next_backward','MPlayMainPostChannelNext','__mplay_post_clear_invoke_start - 2048')]:
  text=source.replace('        ASSERT((ClearChain & ~1) >=','        '+symbol+' = '+expression+';\n        ASSERT((ClearChain & ~1) >=',1)
  cases.append((name,text,'post clear_invoke transfer out of range'))
 for part in ('volume_guard','volume_invoke','volume_finish'):
  cases.append(('post_'+part+'_extent',source.replace('        __mplay_post_'+part+'_end = .;','        . += 2;\n        __mplay_post_'+part+'_end = .;'),'post '+part+' extent or continuation'))
  cases.append(('post_'+part+'_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_post_'+part+');','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_'+part+');'),'post '+part+' extent or continuation'))
 for name,expression in [('pitch_far','__mplay_post_volume_guard_start + 272'),('pitch_backward','__mplay_post_volume_guard_start - 240'),('pitch_odd','__mplay_post_volume_guard_start + 31')]:
  text=source.replace('        ASSERT(MPlayMainPostPitchGuard >=','        MPlayMainPostPitchGuard = '+expression+';\n        ASSERT(MPlayMainPostPitchGuard >=',1)
  cases.append((name,text,'post volume_guard transfer out of range'))
 for name,expression in [('volume_callee_far','__mplay_post_volume_invoke_start + 4194308'),('volume_callee_backward','__mplay_post_volume_invoke_start - 4194304')]:
  text=source.replace('        ASSERT((ChnVolSetAsm & ~1) >=','        ChnVolSetAsm = '+expression+';\n        ASSERT((ChnVolSetAsm & ~1) >=',1)
  cases.append((name,text,'post volume_invoke callee out of range'))
 for part in ('pitch_guard','key_adjust'):
  cases.append(('post_'+part+'_extent',source.replace('        __mplay_post_'+part+'_end = .;','        . += 2;\n        __mplay_post_'+part+'_end = .;'),'post '+part+' extent or continuation'))
  cases.append(('post_'+part+'_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_post_'+part+');','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_'+part+');'),'post '+part+' extent or continuation'))
 for name,expression in [('pitch_next_far','__mplay_post_pitch_guard_start + 266'),('pitch_next_backward','__mplay_post_pitch_guard_start - 248')]:
  text=source.replace('        ASSERT((MPlayMainPostChannelNext & ~1) >=','        MPlayMainPostChannelNext = '+expression+';\n        ASSERT((MPlayMainPostChannelNext & ~1) >=',1)
  cases.append((name,text,'post pitch_guard transfer out of range'))
 for part in ('frequency_select','cgb_setup','pcm_setup'):
  cases.append(('post_'+part+'_extent',source.replace('        __mplay_post_'+part+'_end = .;','        . += 2;\n        __mplay_post_'+part+'_end = .;'),'post '+part+' extent or continuation'))
  cases.append(('post_'+part+'_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_post_'+part+');','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_'+part+');'),'post '+part+' extent or continuation'))
 for name,expression in [('pcm_setup_far','__mplay_post_frequency_select_start + 262'),('pcm_setup_backward','__mplay_post_frequency_select_start - 252')]:
  text=source.replace('        ASSERT((MPlayMainPostPcmSetup & ~1) >=','        MPlayMainPostPcmSetup = '+expression+';\n        ASSERT((MPlayMainPostPcmSetup & ~1) >=',1)
  cases.append((name,text,'post frequency_select transfer out of range'))
 for part in ('cgb_invoke','cgb_store','pcm_invoke','pcm_store'):
  cases.append(('post_'+part+'_extent',source.replace('        __mplay_post_'+part+'_end = .;','        . += 2;\n        __mplay_post_'+part+'_end = .;'),'post '+part+' extent or continuation'))
  cases.append(('post_'+part+'_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_post_'+part+');','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_'+part+');'),'post '+part+' extent or continuation'))
 for name,symbol,expression in [('cgb_call_far','call_r3','__mplay_post_cgb_invoke_start + 4194308'),('cgb_call_backward','call_r3','__mplay_post_cgb_invoke_start - 4194304'),('cgb_store_far','MPlayMainPostChannelNext','__mplay_post_cgb_store_start + 2062'),('cgb_store_backward','MPlayMainPostChannelNext','__mplay_post_cgb_store_start - 2048')]:
  text=source.replace('        ASSERT((call_r3 & ~1) >= __mplay_post_cgb','        '+symbol+' = '+expression+';\n        ASSERT((call_r3 & ~1) >= __mplay_post_cgb',1)
  cases.append((name,text,'post cgb call or store transfer out of range'))
 for name,expression in [('pcm_callee_far','__mplay_post_pcm_invoke_start + 4194308'),('pcm_callee_backward','__mplay_post_pcm_invoke_start - 4194304')]:
  text=source.replace('        ASSERT((MidiKeyToFreq & ~1) >=','        MidiKeyToFreq = '+expression+';\n        ASSERT((MidiKeyToFreq & ~1) >=',1)
  cases.append((name,text,'post pcm callee out of range'))
 for part in ('unlock','restore'):
  cases.append(('exit_'+part+'_extent',source.replace('        __mplay_exit_'+part+'_end = .;','        . += 2;\n        __mplay_exit_'+part+'_end = .;'),'exit '+part+' extent or'))
  cases.append(('exit_'+part+'_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_exit_'+part+');','        . += 2;\n        src/m4a_1.o(.text.after_mplay_exit_'+part+');'),('exit unlock extent or' if part=='unlock' else 'MPlay shared literal placement changed')))
 for name,expression in [('exit_literal_far','__mplay_exit_unlock_start + 1028'),('exit_literal_backward','__mplay_exit_unlock_start'),('exit_literal_unaligned','__mplay_exit_unlock_start + 6')]:
  text=source.replace('        ASSERT((__mplay_exit_unlock_start & 3) ==','        lt2_ID_NUMBER = '+expression+';\n        ASSERT((__mplay_exit_unlock_start & 3) ==',1)
  cases.append((name,text,'exit identifier literal out of range'))
 cases.append(('post_track_next_extent',source.replace('        __mplay_post_track_next_end = .;','        . += 2;\n        __mplay_post_track_next_end = .;'),'post track_next extent or continuation'))
 cases.append(('post_track_next_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_post_track_next);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_post_track_next);'),'post track_next extent or continuation'))
 for name,expression in [('post_loop_far','__mplay_post_track_next_start + 268'),('post_loop_backward','__mplay_post_track_next_start - 246')]:
  text=source.replace('        ASSERT((MPlayMainPostTrackGuard & ~1) + 256 >=','        MPlayMainPostTrackGuard = '+expression+';\n        ASSERT((MPlayMainPostTrackGuard & ~1) + 256 >=',1)
  cases.append((name,text,'post track_next transfer out of range'))
 for kind,callee in [('channel','ClearChain'),('track','Clear64byte')]:
  for part in ('setup','invoke'):
   stem='mplay_'+kind+'_clear_'+part
   cases.append((kind+'_clear_'+part+'_extent',source.replace('        __'+stem+'_end = .;','        . += 2;\n        __'+stem+'_end = .;'),kind+' clear '+part+' extent or continuation'))
   cases.append((kind+'_clear_'+part+'_continuation',source.replace('        src/m4a_1.o(.text.after_'+stem+');','        . += 2;\n        src/m4a_1.o(.text.after_'+stem+');'),kind+' clear '+part+' extent or continuation'))
  stem='__mplay_'+kind+'_clear_invoke_start'
  needle='        ASSERT(('+callee+' & ~1) >= ABSOLUTE('+stem+') + 4 - 4194304'
  for name,offset in [('far',4194308),('backward',-4194304)]:
   cases.append((kind+'_clear_'+name,source.replace(needle,'        '+callee+' = '+stem+' + ('+str(offset)+');\n'+needle,1),kind+' clear callee out of range'))
 for name,target in [('note','MPlayMainNonNoteCommand'),('wait','MPlayMainWaitCommand')]:
  stem='mplay_'+name+'_guard'
  cases.append((name+'_guard_extent',source.replace('        __'+stem+'_end = .;','        . += 2;\n        __'+stem+'_end = .;'),name+' guard extent or continuation'))
  cases.append((name+'_guard_continuation',source.replace('        src/m4a_1.o(.text.after_'+stem+');','        . += 2;\n        src/m4a_1.o(.text.after_'+stem+');'),name+' guard extent or continuation'))
  needle='        ASSERT(('+target+' & ~1) >= __'+stem+'_start + 6'
  for direction,offset in [('far',262),('backward',-252)]:
   cases.append((name+'_guard_'+direction,source.replace(needle,'        '+target+' = __'+stem+'_start + ('+str(offset)+');\n'+needle,1),name+' guard conditional tail out of range'))
 for part in ('tick_setup','track_dispatch'):
  stem='mplay_'+part
  cases.append((part+'_extent',source.replace('        __'+stem+'_end = .;','        . += 2;\n        __'+stem+'_end = .;'),part+' extent or continuation'))
  cases.append((part+'_continuation',source.replace('        src/m4a_1.o(.text.after_'+stem+');','        . += 2;\n        src/m4a_1.o(.text.after_'+stem+');'),part+' extent or continuation'))
 for part,target,pc,far in [('advance','MPlayMainTrackAdvance',12,2060),('init','MPlayMainTrackInit',24,280)]:
  needle='        ASSERT(('+target+' & ~1) >= __mplay_track_dispatch_start + '+str(pc)
  for direction,offset in [('far',far),('backward',pc-2)]:
   cases.append(('dispatch_'+part+'_'+direction,source.replace(needle,'        '+target+' = __mplay_track_dispatch_start + ('+str(offset)+');\n'+needle,1),'track dispatch '+part+' out of range'))
 for part in ('entry_status','sound_info_setup','fade_invoke','fade_status'):
  stem='mplay_'+part
  cases.append((part+'_extent',source.replace('        __'+stem+'_end = .;','        . += 2;\n        __'+stem+'_end = .;'),part+' extent or continuation'))
  cases.append((part+'_continuation',source.replace('        src/m4a_1.o(.text.after_'+stem+');','        . += 2;\n        src/m4a_1.o(.text.after_'+stem+');'),part+' extent or continuation'))
 for name,expression in [('status_exit_far','__mplay_entry_status_start + 2060'),('status_exit_backward','__mplay_fade_status_start + 8')]:
  needle='        ASSERT((MPlayMainExit & ~1) >= __mplay_entry_status_start + 12'
  cases.append((name,source.replace(needle,'        MPlayMainExit = '+expression+';\n'+needle,1),'entry status exit out of range'))
 for name,offset in [('info_literal_far',1028),('info_literal_backward',0),('info_literal_unaligned',6)]:
  needle='        ASSERT((__mplay_sound_info_setup_start & 3) == 0'
  cases.append((name,source.replace(needle,'        lt2_SOUND_INFO_PTR = __mplay_sound_info_setup_start + '+str(offset)+';\n'+needle,1),'sound info literal out of range or alignment'))
 for name,offset in [('fade_callee_far',4194308),('fade_callee_backward',0)]:
  needle='        ASSERT((FadeOutBody & ~1) >= __mplay_fade_invoke_start + 4'
  cases.append((name,source.replace(needle,'        FadeOutBody = __mplay_fade_invoke_start + '+str(offset)+';\n'+needle,1),'fade callee out of range'))
 cases.append(('entry_frame_tail_extent',source.replace('        __mplay_entry_frame_tail_end = .;','        . += 2;\n        __mplay_entry_frame_tail_end = .;'),'entry frame tail extent or continuation'))
 cases.append(('entry_frame_tail_continuation',source.replace('        __mplay_entry_status_start = .;','        . += 2;\n        __mplay_entry_status_start = .;'),'entry frame tail extent or continuation'))
 for name,text,message in cases:
  r=link(name,text);assert r.returncode and message in r.stderr,(name,r.stderr)
 report=dict(valid_layouts=1,rejected_layouts=len(cases),scope='Full production link; altered fragment size/continuation and isolated forward/backward/odd conditional-target constraints.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
