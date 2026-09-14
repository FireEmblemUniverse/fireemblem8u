	.include "macro.inc"
	.include "gba.inc"
	.include "m4a.inc"

	.syntax unified

	.bss

@	.global gUnknown_030007B8
@gUnknown_030007B8:
@	.space 0x770

	.text

	thumb_func_start umul3232H32
umul3232H32:
	adr r2, __umul3232H32
	bx r2
	thumb_func_end umul3232H32
@ ARM body is linked here from m4a_multiply_high.c; ADR targets this boundary.
__umul3232H32:
	.section .text.after_multiply_high, "ax", %progbits

	.global SoundMainEntryBoundary
SoundMainEntryBoundary:
@ Lock checking and mixer frame allocation are generated from C.
	.section .text.after_entry_frame, "ax", %progbits
	.global SoundMainDeadlineSetupBoundary
SoundMainDeadlineSetupBoundary:
@ Scanline deadline calculation is generated from matching C.
	.section .text.after_deadline_setup, "ax", %progbits
	.global SoundMainCallbacksBoundary
SoundMainCallbacksBoundary:
@ Both callbacks and their private frame convention are generated from C.
	.section .text.after_callbacks, "ax", %progbits
	.global SoundMainBufferEntryBoundary
SoundMainBufferEntryBoundary:
@ Post-callback buffer setup and its RAM transfer are generated from C.
	.section .text.after_buffer_entry, "ax", %progbits
	.align 2, 0
	.global SoundMainEntryLiteralsBoundary
SoundMainEntryLiteralsBoundary:
@ The six shared literal words are defined in m4a_entry_literals.c.
	.section .text.after_entry_literals, "ax", %progbits
	.global SoundMainRAM_EntryBoundary
SoundMainRAM_EntryBoundary:
@ Byte selection and both Thumb/ARM transfers are generated from C.
	.section .text.after_mixer_entry, "ax", %progbits
	.arm
	.global SoundMainRAM_ReverbBoundary
SoundMainRAM_ReverbBoundary:
	.section .text.after_reverb, "ax", %progbits
	.thumb
	.global SoundMainRAM_NoReverbBoundary
SoundMainRAM_NoReverbBoundary:
@ The 46-byte Thumb clearing block is generated from m4a_no_reverb.c.
	.section .text.after_no_reverb, "ax", %progbits
	.thumb
	.global SoundMainRAM_ChanSetupBoundary
SoundMainRAM_ChanSetupBoundary:
@ The ten-byte private Thumb setup comes from m4a_channel_setup.c.
	.section .text.after_channel_setup, "ax", %progbits
	.thumb
	.global SoundMainRAM_ChanLoopBoundary
SoundMainRAM_ChanLoopBoundary:
@ Deadline control and its literal pool come from m4a_deadline.c.
	.section .text.after_deadline, "ax", %progbits
	.thumb
	.global SoundMainRAM_DeadlineContinueBoundary
SoundMainRAM_DeadlineContinueBoundary:
@ The 160-byte status/envelope block is generated from m4a_envelope.c.
	.section .text.after_envelope, "ax", %progbits
	.thumb
	.global SoundMainRAM_EnvelopeVolumeBoundary
SoundMainRAM_EnvelopeVolumeBoundary:
@ Volume and loop metadata come from the 52-byte matching C block.
	.section .text.after_volume, "ax", %progbits
	.thumb
	.global SoundMainRAM_SampleHandoffBoundary
SoundMainRAM_SampleHandoffBoundary:
@ State loads, PC-relative address and ARM handoff come from matching C.
	.section .text.after_sample_handoff, "ax", %progbits
	.arm
    .global SoundMainRAM_SampleEntryBoundary
SoundMainRAM_SampleEntryBoundary:
@ Count preservation, volume expansion and sample-path selection come from C.
    .section .text.after_sample_entry, "ax", %progbits
    .arm
_081DD07C:
    .global SoundMainRAM_FixedSetupBoundary
SoundMainRAM_FixedSetupBoundary:
@ Signed fixed-rate count selection and packed remainder come from C.
    .section .text.after_fixed_setup, "ax", %progbits
    .arm
_081DD0A8:
@ The packed word loop is linked here from m4a_packed.c.
	.global SoundMainRAM_PackedBoundary
SoundMainRAM_PackedBoundary:
	.section .text.after_packed, "ax", %progbits
	.arm
_081DD0EC:
    .global SoundMainRAM_ShortBoundary
SoundMainRAM_ShortBoundary:
@ Stereo word loads and one sample are linked here from m4a_short.c.
    .section .text.after_short, "ax", %progbits
    .arm
    .global SoundMainRAM_FixedLaneBoundary
SoundMainRAM_FixedLaneBoundary:
@ Fixed-rate packed-lane advance is linked from m4a_fixed_lane.c.
    .section .text.after_fixed_lane, "ax", %progbits
    .arm
	.global SoundMainRAM_FixedWordBoundary
SoundMainRAM_FixedWordBoundary:
@ Fixed-rate stereo stores and sample-count control come from C.
	.section .text.after_fixed_word_finish, "ax", %progbits
	.arm
_081DD134:
	.global SoundMainRAM_ResampleLoopBoundary
SoundMainRAM_ResampleLoopBoundary:
@ Loop-length selection and source reset are linked from m4a_resample_loop.c.
	.section .text.after_resample_loop, "ax", %progbits
	.arm
	.global SoundMainRAM_WrapBoundary
SoundMainRAM_WrapBoundary:
@ One signed-overflow-aware wrapping iteration is linked from m4a_wrap.c.
	.section .text.after_wrap, "ax", %progbits
	.arm
_081DD158:
	.global SoundMainRAM_StopBoundary
SoundMainRAM_StopBoundary:
@ Restore the resampling frame and enter partial completion from m4a_stop.c.
	.section .text.after_stop, "ax", %progbits
	.arm
_081DD164:
	.global SoundMainRAM_LoopBoundary
SoundMainRAM_LoopBoundary:
@ Loop metadata and selection are linked here from m4a_loop.c.
	.section .text.after_loop, "ax", %progbits
	.arm
_081DD174:
	.global SoundMainRAM_PartialBoundary
SoundMainRAM_PartialBoundary:
@ Partial-word completion is linked here from m4a_partial.c.
	.section .text.after_partial, "ax", %progbits
	.arm
_081DD19C:
    .global SoundMainRAM_ResampleSetupBoundary
SoundMainRAM_ResampleSetupBoundary:
@ Resampling stack entry and first samples are linked from C.
    .section .text.after_resample_setup, "ax", %progbits
    .arm
_081DD1B4:
	.global SoundMainRAM_ResampleBoundary
SoundMainRAM_ResampleBoundary:
@ Word loads and interpolation are linked here from m4a_resample.c.
	.section .text.after_resample, "ax", %progbits
	.arm
	.global SoundMainRAM_AdvanceBoundary
SoundMainRAM_AdvanceBoundary:
@ Source advancement and shared reload are linked here from m4a_advance.c.
	.section .text.after_advance, "ax", %progbits
	.arm
_081DD208:
	.global SoundMainRAM_ResampleLaneBoundary
SoundMainRAM_ResampleLaneBoundary:
@ Resampling packed-lane advance is linked from m4a_resample_lane.c.
	.section .text.after_resample_lane, "ax", %progbits
	.arm
	.global SoundMainRAM_WordFinishBoundary
SoundMainRAM_WordFinishBoundary:
@ Stereo stores and sample-count decision are linked from m4a_word_finish.c.
	.section .text.after_word_finish, "ax", %progbits
	.arm
    .global SoundMainRAM_ResampleFinishBoundary
SoundMainRAM_ResampleFinishBoundary:
@ Source rewind and resampling register restoration come from C.
    .section .text.after_resample_finish, "ax", %progbits
    .arm
_081DD228:
	.global SoundMainRAM_SaveBoundary
SoundMainRAM_SaveBoundary:
@ Channel save and frame restore are linked here from m4a_save_channel.c.
	.section .text.after_save_channel, "ax", %progbits
	.thumb
_081DD240:
	.global SoundMainRAM_ChanAdvanceBoundary
SoundMainRAM_ChanAdvanceBoundary:
@ Channel advancement and the shared exit's frame read come from C.
	.section .text.after_channel_advance, "ax", %progbits
	.thumb
	.global SoundMainRAM_ExitRestoreBoundary
SoundMainRAM_ExitRestoreBoundary:
@ The complete restore sequence and literal come from matching C.
	.section .text.after_exit_restore, "ax", %progbits
	.thumb
	.global SoundMainRAM_End
SoundMainRAM_End:

@ SoundMainBTM is generated from m4a_clear_block.c.
	.align 2, 0

@ RealClearChain is linked here from m4a_clear_chain.c.
	.align 2, 0
	.section .text.after_real_clear_chain, "ax", %progbits

@ ply_fine is linked here from m4a_fine.c.
	.align 2, 0
	.section .text.after_ply_fine, "ax", %progbits

@ MPlayJumpTableCopy is generated from matching C.
	.align 2, 0
	.section .text.after_jump_table_copy, "ax", %progbits

@ ldrb_r3_r2 is generated from m4a_byte_load.c.

@ chk_adr_r2 is generated from m4a_address_filter.c.
	.section .text.after_address_filter, "ax", %progbits

	.align 2, 0
	.global lt_MPlayJumpTableTemplate
lt_MPlayJumpTableTemplate: .word gMPlayJumpTableTemplate

@ Checked byte reader is generated from m4a_checked_reader.c.
	.align 2, 0

@ ply_goto and its shared-stack entry are generated from matching C.
	.align 2, 0
	.section .text.after_ply_goto, "ax", %progbits

@ ply_patt is generated from matching C.
	.align 2, 0
	.section .text.after_ply_patt, "ax", %progbits

@ ply_pend is linked here from m4a_pend.c.
	.align 2, 0
	.section .text.after_ply_pend, "ax", %progbits

@ ply_rept is generated from matching C.
	.align 2, 0
	.section .text.after_ply_rept, "ax", %progbits

@ ply_prio is generated from matching C.
	.align 2, 0
	.section .text.after_ply_prio, "ax", %progbits

@ ply_tempo is generated from matching C.
	.align 2, 0
	.section .text.after_ply_tempo, "ax", %progbits

@ ply_keysh is generated from matching C.
	.align 2, 0
	.section .text.after_ply_keysh, "ax", %progbits

@ ply_voice is generated from matching C.
	.align 2, 0
	.section .text.after_ply_voice, "ax", %progbits

@ ply_vol is generated from matching C.
	.align 2, 0
	.section .text.after_ply_vol, "ax", %progbits

@ ply_pan is generated from matching C.
	.align 2, 0
	.section .text.after_ply_pan, "ax", %progbits

@ ply_bend is generated from matching C.
	.align 2, 0
	.section .text.after_ply_bend, "ax", %progbits

@ ply_bendr is generated from matching C.
	.align 2, 0
	.section .text.after_ply_bendr, "ax", %progbits

@ ply_lfodl is generated from matching C.
	.align 2, 0
	.section .text.after_ply_lfodl, "ax", %progbits

@ ply_modt is generated from matching C.
	.align 2, 0
	.section .text.after_ply_modt, "ax", %progbits

@ ply_tune is generated from matching C.
	.align 2, 0
	.section .text.after_ply_tune, "ax", %progbits

@ ply_port is generated from matching C.
	.align 2, 0
	.section .text.after_ply_port, "ax", %progbits

@ VSync/DMA handling is generated from matching C.
	.section .text.after_sound_vsync, "ax", %progbits

@ MPlayMain lock and initial save are generated from matching C.
	.align 2, 0
	.global MPlayMainLockBoundary
MPlayMainLockBoundary:
	.section .text.after_mplay_lock, "ax", %progbits
	.global MPlayMainEntryCallbackSetupBoundary
MPlayMainEntryCallbackSetupBoundary:
	.section .text.after_mplay_entry_callback_setup, "ax", %progbits
	.global MPlayMainEntryCallbackInvokeBoundary
MPlayMainEntryCallbackInvokeBoundary:
	.section .text.after_mplay_entry_callback_invoke, "ax", %progbits
	.global MPlayMainEntryFrameBoundary
MPlayMainEntryFrameBoundary:
_081DD840:
	.section .text.after_mplay_entry_frame, "ax", %progbits
	.global MPlayMainEntryStatusBoundary
MPlayMainEntryStatusBoundary:
	.section .text.after_mplay_entry_status, "ax", %progbits
	.global MPlayMainSoundInfoSetupBoundary
MPlayMainSoundInfoSetupBoundary:
_081DD858:
	.section .text.after_mplay_sound_info_setup, "ax", %progbits
	.global MPlayMainFadeInvokeBoundary
MPlayMainFadeInvokeBoundary:
	.section .text.after_mplay_fade_invoke, "ax", %progbits
	.global MPlayMainFadeStatusBoundary
MPlayMainFadeStatusBoundary:
	.section .text.after_mplay_fade_status, "ax", %progbits
_081DD86C:
	.global MPlayMainTempoAccumulateBoundary
MPlayMainTempoAccumulateBoundary:
@ Halfword loads and full-width addition are generated from C.
	.section .text.after_mplay_tempo_accumulate, "ax", %progbits
	.global MPlayMainTickLoopBoundary
MPlayMainTickLoopBoundary:
_081DD874:
	.section .text.after_mplay_tick_setup, "ax", %progbits
	.global MPlayMainTrackLoopBoundary
MPlayMainTrackLoopBoundary:
_081DD87C:
	.section .text.after_mplay_track_dispatch, "ax", %progbits
	.global MPlayMainChannelGateBoundary
MPlayMainChannelGateBoundary:
	.section .text.after_mplay_channel_gate, "ax", %progbits
	.global MPlayMainChannelClearBoundary
MPlayMainChannelClearBoundary:
_081DD8AE:
	.section .text.after_mplay_channel_clear_setup, "ax", %progbits
	.global MPlayMainChannelClearInvokeBoundary
MPlayMainChannelClearInvokeBoundary:
	.section .text.after_mplay_channel_clear_invoke, "ax", %progbits
	.global MPlayMainChannelNextBoundary
MPlayMainChannelNextBoundary:
_081DD8B4:
	.section .text.after_mplay_channel_next, "ax", %progbits
	.global MPlayMainTrackInitBoundary
MPlayMainTrackInitBoundary:
_081DD8BA:
	.section .text.after_mplay_track_init_guard, "ax", %progbits
	.global MPlayMainTrackClearBoundary
MPlayMainTrackClearBoundary:
	.section .text.after_mplay_track_clear_setup, "ax", %progbits
	.global MPlayMainTrackClearInvokeBoundary
MPlayMainTrackClearInvokeBoundary:
	.section .text.after_mplay_track_clear_invoke, "ax", %progbits
	.global MPlayMainTrackDefaultsBoundary
MPlayMainTrackDefaultsBoundary:
	.section .text.after_mplay_track_init_defaults, "ax", %progbits
	.global MPlayMainTrackDispatchBoundary
MPlayMainTrackDispatchBoundary:
_081DD8E0:
	.section .text.after_mplay_command_read, "ax", %progbits
	.global MPlayMainCommandDecodeBoundary
MPlayMainCommandDecodeBoundary:
_081DD8F6:
	.section .text.after_mplay_note_guard, "ax", %progbits
	.global MPlayMainNoteSetupBoundary
MPlayMainNoteSetupBoundary:
	.section .text.after_mplay_note_setup, "ax", %progbits
	.global MPlayMainNoteInvokeBoundary
MPlayMainNoteInvokeBoundary:
	.section .text.after_mplay_note_invoke, "ax", %progbits
	.global MPlayMainNonNoteCommandBoundary
MPlayMainNonNoteCommandBoundary:
_081DD90C:
	.section .text.after_mplay_wait_guard, "ax", %progbits
	.global MPlayMainCommandSetupBoundary
MPlayMainCommandSetupBoundary:
	.section .text.after_mplay_command_setup, "ax", %progbits
	.global MPlayMainCommandInvokeBoundary
MPlayMainCommandInvokeBoundary:
	.section .text.after_mplay_command_invoke, "ax", %progbits
	.global MPlayMainCommandStatusBoundary
MPlayMainCommandStatusBoundary:
	.section .text.after_mplay_command_status, "ax", %progbits
	.global MPlayMainWaitCommandBoundary
MPlayMainWaitCommandBoundary:
_081DD92E:
	.section .text.after_mplay_wait_command, "ax", %progbits
	.global MPlayMainTrackWaitBoundary
MPlayMainTrackWaitBoundary:
_081DD938:
	.section .text.after_mplay_track_wait, "ax", %progbits
	.global MPlayMainModulationStartBoundary
MPlayMainModulationStartBoundary:
	.section .text.after_mplay_modulation_guard, "ax", %progbits
	.global MPlayMainModulationUpdateBoundary
MPlayMainModulationUpdateBoundary:
_081DD95A:
	.section .text.after_mplay_modulation_update, "ax", %progbits
	.global MPlayMainTrackFinishBoundary
MPlayMainTrackFinishBoundary:
_081DD994:
	.section .text.after_mplay_track_finish, "ax", %progbits
	.global MPlayMainTrackAdvanceBoundary
MPlayMainTrackAdvanceBoundary:
_081DD998:
	.section .text.after_mplay_track_advance, "ax", %progbits
	.global MPlayMainClockUpdateBoundary
MPlayMainClockUpdateBoundary:
_081DD9A4:
	.section .text.after_mplay_clock_update, "ax", %progbits
_081DD9B6:
	.global MPlayMainTempoFinishBoundary
MPlayMainTempoFinishBoundary:
@ Tick completion and the full-width loop gate are generated from C.
	.section .text.after_mplay_tempo_finish, "ax", %progbits
	.global MPlayMainTempoStoreBoundary
MPlayMainTempoStoreBoundary:
	.section .text.after_mplay_tempo_gate, "ax", %progbits
	.global MPlayMainPostTickBoundary
MPlayMainPostTickBoundary:
_081DD9C4:
	.section .text.after_mplay_post_entry, "ax", %progbits
	.global MPlayMainPostTrackGuardBoundary
MPlayMainPostTrackGuardBoundary:
_081DD9C8:
	.section .text.after_mplay_post_track_guard, "ax", %progbits
	.global MPlayMainPostTrackSetupBoundary
MPlayMainPostTrackSetupBoundary:
	.section .text.after_mplay_post_setup, "ax", %progbits
	.global MPlayMainPostTrackInvokeBoundary
MPlayMainPostTrackInvokeBoundary:
	.section .text.after_mplay_post_invoke, "ax", %progbits
	.global MPlayMainPostChannelLoadBoundary
MPlayMainPostChannelLoadBoundary:
	.section .text.after_mplay_post_channel_load, "ax", %progbits
	.global MPlayMainPostChannelGateBoundary
MPlayMainPostChannelGateBoundary:
_081DD9E6:
	.section .text.after_mplay_post_channel_gate, "ax", %progbits
	.global MPlayMainPostClearSetupBoundary
MPlayMainPostClearSetupBoundary:
	.section .text.after_mplay_post_clear_setup, "ax", %progbits
	.global MPlayMainPostClearInvokeBoundary
MPlayMainPostClearInvokeBoundary:
	.section .text.after_mplay_post_clear_invoke, "ax", %progbits
	.global MPlayMainPostChannelBodyBoundary
MPlayMainPostChannelBodyBoundary:
_081DD9F6:
	.section .text.after_mplay_post_volume_guard, "ax", %progbits
	.global MPlayMainPostVolumeInvokeBoundary
MPlayMainPostVolumeInvokeBoundary:
	.section .text.after_mplay_post_volume_invoke, "ax", %progbits
	.global MPlayMainPostVolumeFinishBoundary
MPlayMainPostVolumeFinishBoundary:
	.section .text.after_mplay_post_volume_finish, "ax", %progbits
	.global MPlayMainPostPitchGuardBoundary
MPlayMainPostPitchGuardBoundary:
_081DDA14:
	.section .text.after_mplay_post_pitch_guard, "ax", %progbits
	.global MPlayMainPostKeyAdjustBoundary
MPlayMainPostKeyAdjustBoundary:
	.section .text.after_mplay_post_key_adjust, "ax", %progbits
	.global MPlayMainPostFrequencySelectBoundary
MPlayMainPostFrequencySelectBoundary:
_081DDA28:
	.section .text.after_mplay_post_frequency_select, "ax", %progbits
	.global MPlayMainPostCgbSetupBoundary
MPlayMainPostCgbSetupBoundary:
	.section .text.after_mplay_post_cgb_setup, "ax", %progbits
	.global MPlayMainPostCgbInvokeBoundary
MPlayMainPostCgbInvokeBoundary:
	.section .text.after_mplay_post_cgb_invoke, "ax", %progbits
	.global MPlayMainPostCgbStoreBoundary
MPlayMainPostCgbStoreBoundary:
	.section .text.after_mplay_post_cgb_store, "ax", %progbits
	.global MPlayMainPostPcmSetupBoundary
MPlayMainPostPcmSetupBoundary:
_081DDA46:
	.section .text.after_mplay_post_pcm_setup, "ax", %progbits
	.global MPlayMainPostPcmInvokeBoundary
MPlayMainPostPcmInvokeBoundary:
	.section .text.after_mplay_post_pcm_invoke, "ax", %progbits
	.global MPlayMainPostPcmStoreBoundary
MPlayMainPostPcmStoreBoundary:
	.section .text.after_mplay_post_pcm_store, "ax", %progbits
	.global MPlayMainPostChannelNextBoundary
MPlayMainPostChannelNextBoundary:
_081DDA52:
	.section .text.after_mplay_post_channel_next, "ax", %progbits
	.global MPlayMainPostTrackFinishBoundary
MPlayMainPostTrackFinishBoundary:
_081DDA58:
	.section .text.after_mplay_post_track_finish, "ax", %progbits
	.global MPlayMainPostTrackNextBoundary
MPlayMainPostTrackNextBoundary:
_081DDA62:
	.section .text.after_mplay_post_track_next, "ax", %progbits
	.global MPlayMainExitBoundary
MPlayMainExitBoundary:
_081DDA6C:
	.section .text.after_mplay_exit_unlock, "ax", %progbits
	.global MPlayMainExitRestoreBoundary
MPlayMainExitRestoreBoundary:
	.section .text.after_mplay_exit_restore, "ax", %progbits
	.section .text.mplay_main_literals, "ax", %progbits
	.2byte 0 @ Original padding after the shared BX trampoline.
	.global lt_gClockTable
lt_gClockTable:     .word gClockTable
	.global lt2_SOUND_INFO_PTR
	.global lt2_ID_NUMBER
lt2_SOUND_INFO_PTR: .word SOUND_INFO_PTR
lt2_ID_NUMBER:      .word ID_NUMBER

@ TrackStop and its sound-info pointer pool are generated from matching C.
	.section .text.after_track_stop, "ax", %progbits

@ Stereo channel volumes are generated from matching C.
	.section .text.after_channel_volume, "ax", %progbits

	thumb_func_start ply_note
ply_note:
	push {r4-r7,lr}
	mov r4, r8
	mov r5, r9
	mov r6, r10
	mov r7, r11
	push {r4-r7}
	sub sp, 0x18
	str r1, [sp]
	adds r5, r2, 0
	ldr r1, [pc, #1020]
	.reloc .-2, R_ARM_THM_PC8, lt_PlyNoteSoundInfo
	ldr r1, [r1]
	str r1, [sp, 0x4]
	ldr r1, [pc, #1020]
	.reloc .-2, R_ARM_THM_PC8, lt_PlyNoteClockTable
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r5, o_MusicPlayerTrack_gateTime]
	thumb_func_end ply_note
	.global PlyNoteCommandBoundary
PlyNoteCommandBoundary:
	.section .text.after_ply_note_command, "ax", %progbits
	.global PlyNoteToneBoundary
PlyNoteToneBoundary:
	.section .text.after_ply_note_tone, "ax", %progbits
	.global PlyNotePriorityBoundary
PlyNotePriorityBoundary:
	.section .text.after_ply_note_priority, "ax", %progbits
	.global PlyNoteCgbBoundary
PlyNoteCgbBoundary:
	.section .text.after_ply_note_cgb, "ax", %progbits
	.global PlyNotePcmSelect
PlyNotePcmSelect:
_081DDBEC:
	.section .text.after_ply_note_pcm_setup, "ax", %progbits
	.global PlyNotePcmLoop
PlyNotePcmLoop:
_081DDBFA:
	.section .text.after_ply_note_pcm_choose, "ax", %progbits
	.global PlyNotePcmAdvance
PlyNotePcmAdvance:
_081DDC34:
	.section .text.after_ply_note_pcm_advance, "ax", %progbits
	.global PlyNoteChannelAttach
PlyNoteChannelAttach:
_081DDC40:
	adds r0, r4, 0
	.global PlyNoteClearInvoke
PlyNoteClearInvoke:
	.section .text.after_ply_note_clear_invoke, "ax", %progbits
	.global PlyNoteChannelLink
PlyNoteChannelLink:
	.section .text.after_ply_note_channel_link, "ax", %progbits
	.global PlyNoteLfoDelay
PlyNoteLfoDelay:
	ldrb r0, [r5, 0x1B]
	strb r0, [r5, 0x1C]
	cmp r0, r1
	beq _081DDC66
	adds r1, r5, 0
	.global PlyNoteModInvoke
PlyNoteModInvoke:
	.section .text.after_ply_note_mod_invoke, "ax", %progbits
	.global PlyNoteTrackVolumeSetup
PlyNoteTrackVolumeSetup:
_081DDC66:
	ldr r0, [sp]
	adds r1, r5, 0
	.global PlyNoteTrackVolumeInvoke
PlyNoteTrackVolumeInvoke:
	.section .text.after_ply_note_track_volume_invoke, "ax", %progbits
	.global PlyNoteChannelInit
PlyNoteChannelInit:
	.section .text.after_ply_note_channel_init, "ax", %progbits
	.global PlyNoteVolumeInvoke
PlyNoteVolumeInvoke:
	.section .text.after_ply_note_volume_invoke, "ax", %progbits
	.global PlyNoteFrequencySetup
PlyNoteFrequencySetup:
	.section .text.after_ply_note_frequency_setup, "ax", %progbits
	.global PlyNoteCgbFrequencyInvoke
PlyNoteCgbFrequencyInvoke:
	.section .text.after_ply_note_cgb_frequency_invoke, "ax", %progbits
	.global PlyNotePcmFrequencySetup
PlyNotePcmFrequencySetup:
_081DDCCE:
	ldrb r2, [r5, 0x9]
	adds r1, r3, 0
	adds r0, r7, 0
	.global PlyNotePcmFrequencyInvoke
PlyNotePcmFrequencyInvoke:
	.section .text.after_ply_note_pcm_frequency_invoke, "ax", %progbits
_081DDCDC:
	.global PlyNoteFinish
PlyNoteFinish:
	.section .text.after_ply_note_finish, "ax", %progbits
	.global PlyNoteExit
PlyNoteExit:
_081DDCEA:
	add sp, 0x18
	pop {r0-r7}
	mov r8, r0
	mov r9, r1
	mov r10, r2
	mov r11, r3
	pop {r0}
	bx r0
	.2byte 0 @ Original padding before the note literals.
	.global lt_PlyNoteSoundInfo
lt_PlyNoteSoundInfo: .word SOUND_INFO_PTR
	.global lt_PlyNoteClockTable
lt_PlyNoteClockTable: .word gClockTable


@ ply_endtie is generated from matching C.

@ clear_modM is linked here from m4a_clear_mod.c.
	.section .text.after_clear_mod, "ax", %progbits

@ Command-byte reader is generated from matching C.

@ ply_lfos and ply_mod are generated from matching C.
	.align 2, 0
	.section .text.after_ply_lfos, "ax", %progbits
	.align 2, 0
	.section .text.after_ply_mod, "ax", %progbits

	.align 2, 0 @ Don't pad with nop.
