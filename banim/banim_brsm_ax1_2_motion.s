@ vim:ft=armv4
	.global banim_brsm_ax1_2_script
	.global banim_brsm_ax1_2_oam_r
	.global banim_brsm_ax1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x23
	.section .data.oam_l
banim_brsm_ax1_2_oam_l:
banim_brsm_ax1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x31, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x33, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x11, -11, -32
	banim_frame_end
banim_brsm_ax1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x97, 12, -19
	banim_frame_oam 0x4000, 0x1000, 0xD7, -4, -11
	banim_frame_oam 0x0, 0x1000, 0xD9, -12, -11
	banim_frame_oam 0x0, 0x5000, 0x58, -28, -19
	banim_frame_oam 0x0, 0x9000, 0x93, -17, -24
	banim_frame_oam 0x4000, 0x5000, 0xF7, -17, 8
	banim_frame_oam 0x4000, 0x1000, 0x52, 15, -15
	banim_frame_end
banim_brsm_ax1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x93, -17, -24
	banim_frame_oam 0x4000, 0x5000, 0xF7, -17, 8
	banim_frame_oam 0x4000, 0x1000, 0x52, 15, -15
	banim_frame_end
banim_brsm_ax1_2_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0x18, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0x1C, -16, -24
	banim_frame_oam 0x4000, 0x9000, 0x5A, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xDA, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0x9B, -16, 8
	banim_frame_end
banim_brsm_ax1_2_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x1000, 0x71, -19, -27
	banim_frame_oam 0x0, 0x1000, 0x92, -19, -19
	banim_frame_oam 0x0, 0x1000, 0xB2, -11, -19
	banim_frame_oam 0x0, 0x1000, 0x73, -3, -19
	banim_frame_oam 0x0, 0x5000, 0x1D, -3, -34
	banim_frame_oam 0x0, 0x1000, 0x3F, -11, -26
	banim_frame_oam 0x4000, 0x1000, 0x5E, 0, -18
	banim_frame_oam 0x4000, 0x1000, 0x7E, -16, -18
	banim_frame_oam 0x4000, 0x9000, 0xBB, -16, -10
	banim_frame_oam 0x4000, 0x5000, 0xFB, -16, 6
	banim_frame_end
banim_brsm_ax1_2_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -12, -27
	banim_frame_oam 0x4000, 0x5000, 0x80, -12, 5
	banim_frame_oam 0x0, 0x1000, 0xEA, -20, 5
	banim_frame_oam 0x0, 0x1000, 0xEB, 4, -35
	banim_frame_oam 0x0, 0x1000, 0xEB, -5, -35
	banim_frame_oam 0x8000, 0x1000, 0xAC, -20, -20
	banim_frame_end
banim_brsm_ax1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x7000, 0x25, -28, -27
	banim_frame_oam 0x8000, 0x3000, 0x4, -12, -19
	banim_frame_oam 0x0, 0x3000, 0x44, -12, -27
	banim_frame_oam 0x4000, 0x1000, 0xA1, -9, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -1, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -9, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, -17, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -1, 0
	banim_frame_oam 0x0, 0x1000, 0xC6, -9, 0
	banim_frame_oam 0x4000, 0x5000, 0xE4, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xA3, -9, -8
	banim_frame_oam 0x0, 0x1000, 0xC7, -17, 0
	banim_frame_end
banim_brsm_ax1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x0, 0x66, -13, -27
	banim_frame_oam 0x4000, 0x0, 0x5, -29, -11
	banim_frame_oam 0x0, 0x4000, 0x64, -29, -27
	banim_frame_oam 0x4000, 0x1000, 0xA1, -9, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -1, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -9, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, -17, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -1, 0
	banim_frame_oam 0x0, 0x1000, 0xC6, -9, 0
	banim_frame_oam 0x4000, 0x5000, 0xE4, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xA3, -9, -8
	banim_frame_oam 0x0, 0x1000, 0xC7, -17, 0
	banim_frame_end
banim_brsm_ax1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x4000, 0x25, -21, -14
	banim_frame_oam 0x8000, 0x0, 0x4, -29, -22
	banim_frame_oam 0x0, 0x0, 0x44, -29, -6
	banim_frame_oam 0x4000, 0x1000, 0xA1, -9, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -1, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -9, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, -17, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -1, 0
	banim_frame_oam 0x0, 0x1000, 0xC6, -9, 0
	banim_frame_oam 0x4000, 0x5000, 0xE4, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xA3, -9, -8
	banim_frame_oam 0x0, 0x1000, 0xC7, -17, 0
	banim_frame_end
banim_brsm_ax1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x3000, 0x66, -24, -6
	banim_frame_oam 0x4000, 0x3000, 0x5, -16, -22
	banim_frame_oam 0x0, 0x7000, 0x64, -16, -14
	banim_frame_oam 0x4000, 0x1000, 0xA1, -9, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -1, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -9, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, -17, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -1, 0
	banim_frame_oam 0x0, 0x1000, 0xC6, -9, 0
	banim_frame_oam 0x4000, 0x5000, 0xE4, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xA3, -9, -8
	banim_frame_oam 0x0, 0x1000, 0xC7, -17, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_brsm_ax1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_brsm_ax1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
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
banim_brsm_ax1_2_oam_r:
banim_brsm_ax1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x31, -8, -24
	banim_frame_oam 0x0, 0x0, 0x33, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x11, -5, -32
	banim_frame_end
banim_brsm_ax1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x97, -44, -19
	banim_frame_oam 0x4000, 0x0, 0xD7, -12, -11
	banim_frame_oam 0x0, 0x0, 0xD9, 4, -11
	banim_frame_oam 0x0, 0x4000, 0x58, 12, -19
	banim_frame_oam 0x0, 0x8000, 0x93, -15, -24
	banim_frame_oam 0x4000, 0x4000, 0xF7, -15, 8
	banim_frame_oam 0x4000, 0x0, 0x52, -31, -15
	banim_frame_end
banim_brsm_ax1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x93, -15, -24
	banim_frame_oam 0x4000, 0x4000, 0xF7, -15, 8
	banim_frame_oam 0x4000, 0x0, 0x52, -31, -15
	banim_frame_end
banim_brsm_ax1_2_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0x18, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x1C, 8, -24
	banim_frame_oam 0x4000, 0x8000, 0x5A, -16, -8
	banim_frame_oam 0x0, 0x0, 0xDA, -24, -8
	banim_frame_oam 0x4000, 0x4000, 0x9B, -16, 8
	banim_frame_end
banim_brsm_ax1_2_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x0, 0x71, 3, -27
	banim_frame_oam 0x0, 0x0, 0x92, 11, -19
	banim_frame_oam 0x0, 0x0, 0xB2, 3, -19
	banim_frame_oam 0x0, 0x0, 0x73, -5, -19
	banim_frame_oam 0x0, 0x4000, 0x1D, -13, -34
	banim_frame_oam 0x0, 0x0, 0x3F, 3, -26
	banim_frame_oam 0x4000, 0x0, 0x5E, -16, -18
	banim_frame_oam 0x4000, 0x0, 0x7E, 0, -18
	banim_frame_oam 0x4000, 0x8000, 0xBB, -16, -10
	banim_frame_oam 0x4000, 0x4000, 0xFB, -16, 6
	banim_frame_end
banim_brsm_ax1_2_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -20, -27
	banim_frame_oam 0x4000, 0x4000, 0x80, -20, 5
	banim_frame_oam 0x0, 0x0, 0xEA, 12, 5
	banim_frame_oam 0x0, 0x0, 0xEB, -12, -35
	banim_frame_oam 0x0, 0x0, 0xEB, -3, -35
	banim_frame_oam 0x8000, 0x0, 0xAC, 12, -20
	banim_frame_end
banim_brsm_ax1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x6000, 0x25, 12, -27
	banim_frame_oam 0x8000, 0x2000, 0x4, 4, -19
	banim_frame_oam 0x0, 0x2000, 0x44, 4, -27
	banim_frame_oam 0x4000, 0x0, 0xA1, -7, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, -15, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, -15, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 1, -8
	banim_frame_oam 0x0, 0x0, 0xE3, 9, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -15, 0
	banim_frame_oam 0x0, 0x0, 0xC6, 1, 0
	banim_frame_oam 0x4000, 0x4000, 0xE4, -15, 8
	banim_frame_oam 0x0, 0x0, 0xA0, 17, -16
	banim_frame_oam 0x0, 0x0, 0xA3, 1, -8
	banim_frame_oam 0x0, 0x0, 0xC7, 9, 0
	banim_frame_end
banim_brsm_ax1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x1000, 0x66, 5, -27
	banim_frame_oam 0x4000, 0x1000, 0x5, 13, -11
	banim_frame_oam 0x0, 0x5000, 0x64, 13, -27
	banim_frame_oam 0x4000, 0x0, 0xA1, -7, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, -15, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, -15, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 1, -8
	banim_frame_oam 0x0, 0x0, 0xE3, 9, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -15, 0
	banim_frame_oam 0x0, 0x0, 0xC6, 1, 0
	banim_frame_oam 0x4000, 0x4000, 0xE4, -15, 8
	banim_frame_oam 0x0, 0x0, 0xA0, 17, -16
	banim_frame_oam 0x0, 0x0, 0xA3, 1, -8
	banim_frame_oam 0x0, 0x0, 0xC7, 9, 0
	banim_frame_end
banim_brsm_ax1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x5000, 0x25, 5, -14
	banim_frame_oam 0x8000, 0x1000, 0x4, 21, -22
	banim_frame_oam 0x0, 0x1000, 0x44, 21, -6
	banim_frame_oam 0x4000, 0x0, 0xA1, -7, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, -15, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, -15, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 1, -8
	banim_frame_oam 0x0, 0x0, 0xE3, 9, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -15, 0
	banim_frame_oam 0x0, 0x0, 0xC6, 1, 0
	banim_frame_oam 0x4000, 0x4000, 0xE4, -15, 8
	banim_frame_oam 0x0, 0x0, 0xA0, 17, -16
	banim_frame_oam 0x0, 0x0, 0xA3, 1, -8
	banim_frame_oam 0x0, 0x0, 0xC7, 9, 0
	banim_frame_end
banim_brsm_ax1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x2000, 0x66, 16, -6
	banim_frame_oam 0x4000, 0x2000, 0x5, 0, -22
	banim_frame_oam 0x0, 0x6000, 0x64, 0, -14
	banim_frame_oam 0x4000, 0x0, 0xA1, -7, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, -15, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, -15, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 1, -8
	banim_frame_oam 0x0, 0x0, 0xE3, 9, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -15, 0
	banim_frame_oam 0x0, 0x0, 0xC6, 1, 0
	banim_frame_oam 0x4000, 0x4000, 0xE4, -15, 8
	banim_frame_oam 0x0, 0x0, 0xA0, 17, -16
	banim_frame_oam 0x0, 0x0, 0xA3, 1, -8
	banim_frame_oam 0x0, 0x0, 0xC7, 9, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_brsm_ax1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_brsm_ax1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
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
banim_brsm_ax1_2_script:
banim_brsm_ax1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 1, banim_brsm_ax1_2_oam_frame_1_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 2, banim_brsm_ax1_2_oam_frame_2_r - banim_brsm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 3, banim_brsm_ax1_2_oam_frame_3_r - banim_brsm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 1, banim_brsm_ax1_2_oam_frame_1_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 6, banim_brsm_ax1_2_oam_frame_5_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 7, banim_brsm_ax1_2_oam_frame_6_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 8, banim_brsm_ax1_2_oam_frame_7_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 9, banim_brsm_ax1_2_oam_frame_8_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 15, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 1, banim_brsm_ax1_2_oam_frame_1_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 2, banim_brsm_ax1_2_oam_frame_2_r - banim_brsm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 3, banim_brsm_ax1_2_oam_frame_3_r - banim_brsm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 12, banim_brsm_ax1_2_oam_frame_9_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 12, banim_brsm_ax1_2_oam_frame_9_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 12, banim_brsm_ax1_2_oam_frame_9_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 12, banim_brsm_ax1_2_oam_frame_9_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 15, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 11, banim_brsm_ax1_2_oam_frame_4_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 1, banim_brsm_ax1_2_oam_frame_1_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 2, banim_brsm_ax1_2_oam_frame_2_r - banim_brsm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 3, banim_brsm_ax1_2_oam_frame_3_r - banim_brsm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 6, banim_brsm_ax1_2_oam_frame_5_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 7, banim_brsm_ax1_2_oam_frame_6_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 8, banim_brsm_ax1_2_oam_frame_7_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 2, banim_brsm_ax1_2_sheet_0, 9, banim_brsm_ax1_2_oam_frame_8_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 15, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 1, banim_brsm_ax1_2_oam_frame_1_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 2, banim_brsm_ax1_2_oam_frame_2_r - banim_brsm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 3, banim_brsm_ax1_2_oam_frame_3_r - banim_brsm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 4, banim_brsm_ax1_2_oam_frame_10_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 5, banim_brsm_ax1_2_oam_frame_11_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 4, banim_brsm_ax1_2_oam_frame_10_r - banim_brsm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 4, banim_brsm_ax1_2_oam_frame_10_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 5, banim_brsm_ax1_2_oam_frame_11_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 4, banim_brsm_ax1_2_oam_frame_10_r - banim_brsm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_2_mode_stand_close:
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_brsm_ax1_2_mode_stand:
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_brsm_ax1_2_mode_stand_range:
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_brsm_ax1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 1, banim_brsm_ax1_2_oam_frame_1_r - banim_brsm_ax1_2_oam_r
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 2, banim_brsm_ax1_2_oam_frame_2_r - banim_brsm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_brsm_ax1_sheet_1, 3, banim_brsm_ax1_2_oam_frame_3_r - banim_brsm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_brsm_ax1_sheet_1, 0, banim_brsm_ax1_2_oam_frame_0_r - banim_brsm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_brsm_ax1_2_mode_attack_close - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_attack_close_back - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_attack_close_critical - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_attack_close_critical_back - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_attack_range - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_attack_range_critical - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_dodge_close - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_dodge_range - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_stand_close - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_stand - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_stand_range - banim_brsm_ax1_2_script
	.word banim_brsm_ax1_2_mode_attack_miss - banim_brsm_ax1_2_script
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

