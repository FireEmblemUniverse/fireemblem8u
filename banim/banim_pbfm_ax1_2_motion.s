@ vim:ft=armv4
	.global banim_pbfm_ax1_2_script
	.global banim_pbfm_ax1_2_oam_r
	.global banim_pbfm_ax1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x92
	.section .data.oam_l
banim_pbfm_ax1_2_oam_l:
banim_pbfm_ax1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x80, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x82, -16, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x5, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x83, -32, -32
	banim_frame_oam 0x8000, 0x1000, 0x85, -40, -32
	banim_frame_oam 0x4000, 0x1000, 0xC3, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xC5, -40, -16
	banim_frame_oam 0x0, 0x5000, 0xC0, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0xC2, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xE3, -16, -32
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x43, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x45, -16, 0
	banim_frame_oam 0x4000, 0x9000, 0x6, -16, -16
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x46, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x48, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC8, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0xA, 8, -8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x49, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x4D, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xC9, -40, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x12, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0x8E, -40, -8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x8F, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x93, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xCE, -40, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -32, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x3, -16, -16
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x6, 0, -32
	banim_frame_oam 0x0, 0x5000, 0x84, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x86, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x43, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x83, -8, 8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x9, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x87, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x89, -16, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x9000, 0x2A, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x2C, -16, -32
	banim_frame_oam 0x0, 0x5000, 0xAA, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xAC, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xCD, -24, 8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x9000, 0xD, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0xF, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x8D, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x8F, -16, 0
	banim_frame_oam 0x8000, 0x5000, 0x10, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xB0, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xD0, -32, -24
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x14, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x15, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x55, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x11, -32, -24
	banim_frame_oam 0x8000, 0x1000, 0x51, 0, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x9000, 0x91, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x93, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x94, -32, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x96, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -16, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_pbfm_ax1_2_oam_r:
banim_pbfm_ax1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x80, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x82, 8, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x5, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x83, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x85, 32, -32
	banim_frame_oam 0x4000, 0x0, 0xC3, 16, -16
	banim_frame_oam 0x0, 0x0, 0xC5, 32, -16
	banim_frame_oam 0x0, 0x4000, 0xC0, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xC2, -16, -16
	banim_frame_oam 0x0, 0x0, 0xE3, 8, -32
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x43, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x45, 8, 0
	banim_frame_oam 0x4000, 0x8000, 0x6, -16, -16
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x46, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x48, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC8, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xA, -40, -8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x49, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x4D, 24, -16
	banim_frame_oam 0x0, 0x0, 0xC9, 32, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x12, 24, -16
	banim_frame_oam 0x8000, 0x0, 0x8E, 32, -8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x8F, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x93, 24, -16
	banim_frame_oam 0x0, 0x0, 0xCE, 32, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -8, 8
	banim_frame_oam 0x0, 0x0, 0x98, 24, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x82, 0, 8
	banim_frame_oam 0x0, 0x0, 0x3, 8, -16
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x6, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x84, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x86, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x43, 0, -16
	banim_frame_oam 0x0, 0x0, 0x83, 0, 8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x9, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x87, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x89, 8, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x8000, 0x2A, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x2C, 8, -32
	banim_frame_oam 0x0, 0x4000, 0xAA, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xAC, 8, 0
	banim_frame_oam 0x0, 0x0, 0xCD, 16, 8
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x8000, 0xD, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0xF, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x8D, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x8F, 8, 0
	banim_frame_oam 0x8000, 0x4000, 0x10, 16, -32
	banim_frame_oam 0x0, 0x0, 0xB0, 16, 8
	banim_frame_oam 0x8000, 0x0, 0xD0, 24, -24
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x14, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x15, 24, -16
	banim_frame_oam 0x0, 0x0, 0x55, 24, 0
	banim_frame_oam 0x0, 0x0, 0x11, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x51, -8, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x8000, 0x91, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x93, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x94, 16, 0
	banim_frame_end
banim_pbfm_ax1_2_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x96, -8, 8
	banim_frame_oam 0x0, 0x0, 0x98, 8, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_pbfm_ax1_2_script:
banim_pbfm_ax1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pbfm_ax1_2_sheet_0, 1, banim_pbfm_ax1_2_oam_frame_1_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 2, banim_pbfm_ax1_2_oam_frame_2_r - banim_pbfm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pbfm_ax1_2_sheet_0, 3, banim_pbfm_ax1_2_oam_frame_3_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 4, banim_pbfm_ax1_2_oam_frame_4_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 5, banim_pbfm_ax1_2_oam_frame_5_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 8, banim_pbfm_ax1_2_sheet_0, 6, banim_pbfm_ax1_2_oam_frame_6_r - banim_pbfm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 7, banim_pbfm_ax1_2_oam_frame_7_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 8, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_1, 16, banim_pbfm_ax1_2_oam_frame_9_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 17, banim_pbfm_ax1_2_oam_frame_10_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 18, banim_pbfm_ax1_2_oam_frame_11_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 19, banim_pbfm_ax1_2_oam_frame_12_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 20, banim_pbfm_ax1_2_oam_frame_13_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 17, banim_pbfm_ax1_2_oam_frame_10_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 18, banim_pbfm_ax1_2_oam_frame_11_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 19, banim_pbfm_ax1_2_oam_frame_12_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 20, banim_pbfm_ax1_2_sheet_1, 16, banim_pbfm_ax1_2_oam_frame_9_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 1, banim_pbfm_ax1_2_oam_frame_1_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 2, banim_pbfm_ax1_2_oam_frame_2_r - banim_pbfm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 3, banim_pbfm_ax1_2_oam_frame_3_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 4, banim_pbfm_ax1_2_oam_frame_4_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 5, banim_pbfm_ax1_2_oam_frame_5_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 8, banim_pbfm_ax1_2_sheet_0, 6, banim_pbfm_ax1_2_oam_frame_6_r - banim_pbfm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 7, banim_pbfm_ax1_2_oam_frame_7_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_1, 15, banim_pbfm_ax1_2_oam_frame_14_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 15, banim_pbfm_ax1_2_oam_frame_14_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 15, banim_pbfm_ax1_2_oam_frame_14_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 15, banim_pbfm_ax1_2_oam_frame_14_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 15, banim_pbfm_ax1_2_oam_frame_14_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 15, banim_pbfm_ax1_2_oam_frame_14_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 15, banim_pbfm_ax1_2_oam_frame_14_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 15, banim_pbfm_ax1_2_oam_frame_14_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 20, banim_pbfm_ax1_2_sheet_1, 15, banim_pbfm_ax1_2_oam_frame_14_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 8, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 14, banim_pbfm_ax1_2_oam_frame_8_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pbfm_ax1_2_sheet_0, 1, banim_pbfm_ax1_2_oam_frame_1_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 2, banim_pbfm_ax1_2_oam_frame_2_r - banim_pbfm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pbfm_ax1_2_sheet_0, 3, banim_pbfm_ax1_2_oam_frame_3_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 4, banim_pbfm_ax1_2_oam_frame_4_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 5, banim_pbfm_ax1_2_oam_frame_5_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 8, banim_pbfm_ax1_2_sheet_0, 6, banim_pbfm_ax1_2_oam_frame_6_r - banim_pbfm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 7, banim_pbfm_ax1_2_oam_frame_7_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_1, 16, banim_pbfm_ax1_2_oam_frame_9_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 17, banim_pbfm_ax1_2_oam_frame_10_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 18, banim_pbfm_ax1_2_oam_frame_11_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 19, banim_pbfm_ax1_2_oam_frame_12_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 20, banim_pbfm_ax1_2_oam_frame_13_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 17, banim_pbfm_ax1_2_oam_frame_10_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 18, banim_pbfm_ax1_2_oam_frame_11_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 19, banim_pbfm_ax1_2_oam_frame_12_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 20, banim_pbfm_ax1_2_sheet_1, 16, banim_pbfm_ax1_2_oam_frame_9_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 1, banim_pbfm_ax1_2_oam_frame_1_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 2, banim_pbfm_ax1_2_oam_frame_2_r - banim_pbfm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 3, banim_pbfm_ax1_2_oam_frame_3_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 4, banim_pbfm_ax1_2_oam_frame_4_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 5, banim_pbfm_ax1_2_oam_frame_5_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 8, banim_pbfm_ax1_2_sheet_0, 6, banim_pbfm_ax1_2_oam_frame_6_r - banim_pbfm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 7, banim_pbfm_ax1_2_oam_frame_7_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 11, banim_pbfm_ax1_2_oam_frame_15_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_1, 12, banim_pbfm_ax1_2_oam_frame_16_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_1, 13, banim_pbfm_ax1_2_oam_frame_17_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_1, 11, banim_pbfm_ax1_2_oam_frame_15_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_1, 12, banim_pbfm_ax1_2_oam_frame_16_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_1, 13, banim_pbfm_ax1_2_oam_frame_17_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_2_mode_stand_close:
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_2_mode_stand:
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_2_mode_stand_range:
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pbfm_ax1_2_sheet_0, 1, banim_pbfm_ax1_2_oam_frame_1_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 2, banim_pbfm_ax1_2_oam_frame_2_r - banim_pbfm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pbfm_ax1_2_sheet_0, 3, banim_pbfm_ax1_2_oam_frame_3_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 4, banim_pbfm_ax1_2_oam_frame_4_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 2, banim_pbfm_ax1_2_sheet_0, 5, banim_pbfm_ax1_2_oam_frame_5_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 8, banim_pbfm_ax1_2_sheet_0, 6, banim_pbfm_ax1_2_oam_frame_6_r - banim_pbfm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_pbfm_ax1_2_sheet_0, 7, banim_pbfm_ax1_2_oam_frame_7_r - banim_pbfm_ax1_2_oam_r
	banim_code_frame 1, banim_pbfm_ax1_2_sheet_0, 0, banim_pbfm_ax1_2_oam_frame_0_r - banim_pbfm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pbfm_ax1_2_mode_attack_close - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_attack_close_back - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_attack_close_critical - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_attack_close_critical_back - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_attack_range - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_attack_range_critical - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_dodge_close - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_dodge_range - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_stand_close - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_stand - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_stand_range - banim_pbfm_ax1_2_script
	.word banim_pbfm_ax1_2_mode_attack_miss - banim_pbfm_ax1_2_script
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0

