@ vim:ft=armv4
	.global banim_banm_ax1_2_script
	.global banim_banm_ax1_2_oam_r
	.global banim_banm_ax1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x20
	.section .data.oam_l
banim_banm_ax1_2_oam_l:
banim_banm_ax1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x94, -9, -32
	banim_frame_oam 0x8000, 0x5000, 0x96, -17, -32
	banim_frame_oam 0x4000, 0x9000, 0xD0, -17, 0
	banim_frame_end
banim_banm_ax1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x9B, 10, -18
	banim_frame_oam 0x4000, 0x5000, 0xDB, -22, -10
	banim_frame_oam 0x4000, 0x1000, 0x7E, -30, -18
	banim_frame_oam 0x0, 0x1000, 0x9F, -30, -10
	banim_frame_oam 0x4000, 0x5000, 0x97, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xB8, -7, -8
	banim_frame_oam 0x8000, 0x1000, 0xBA, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0xF8, -7, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -15, 8
	banim_frame_oam 0x8000, 0x1000, 0xD7, 9, 0
	banim_frame_oam 0x4000, 0x1000, 0x7A, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x7C, 17, -14
	banim_frame_end
banim_banm_ax1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0x97, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xB8, -7, -8
	banim_frame_oam 0x8000, 0x1000, 0xBA, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0xF8, -7, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -15, 8
	banim_frame_oam 0x8000, 0x1000, 0xD7, 9, 0
	banim_frame_oam 0x4000, 0x1000, 0x7A, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x7C, 17, -14
	banim_frame_end
banim_banm_ax1_2_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -11, -24
	banim_frame_oam 0x4000, 0x5000, 0x40, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x61, -3, 0
	banim_frame_oam 0x8000, 0x1000, 0x63, -11, 0
	banim_frame_oam 0x8000, 0x1000, 0x4, -19, -15
	banim_frame_oam 0x0, 0x1000, 0x60, -19, 8
	banim_frame_end
banim_banm_ax1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x44, -15, -15
	banim_frame_oam 0x8000, 0x9000, 0x48, -31, -15
	banim_frame_oam 0x0, 0x5000, 0x5, -7, -31
	banim_frame_oam 0x8000, 0x1000, 0x7, -15, -31
	banim_frame_oam 0x0, 0x1000, 0x8, 9, -23
	banim_frame_end
banim_banm_ax1_2_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x9000, 0x1A, -31, -11
	banim_frame_oam 0x4000, 0x5000, 0x5A, -31, 5
	banim_frame_oam 0x4000, 0x1000, 0xFD, 1, -8
	banim_frame_oam 0x4000, 0x1000, 0xFB, 1, -16
	banim_frame_oam 0x0, 0x1000, 0xFF, 7, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x3000, 0xA, -12, -16
	banim_frame_oam 0x0, 0x3000, 0x4A, -12, -24
	banim_frame_oam 0x0, 0x7000, 0x2B, -28, -24
	banim_frame_oam 0x4000, 0x9000, 0xA0, -17, 0
	banim_frame_oam 0x0, 0x5000, 0xC4, -9, -24
	banim_frame_oam 0x8000, 0x1000, 0xC6, -17, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xC7, -13, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x4000, 0x6A, -32, -25
	banim_frame_oam 0x0, 0x0, 0x6C, -16, -25
	banim_frame_oam 0x4000, 0x0, 0xB, -32, -9
	banim_frame_oam 0x4000, 0x9000, 0xA0, -17, 0
	banim_frame_oam 0x0, 0x5000, 0xC4, -9, -24
	banim_frame_oam 0x8000, 0x1000, 0xC6, -17, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xC7, -13, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x0, 0xA, -32, -21
	banim_frame_oam 0x0, 0x0, 0x4A, -32, -5
	banim_frame_oam 0x0, 0x4000, 0x2B, -24, -13
	banim_frame_oam 0x4000, 0x9000, 0xA0, -17, 0
	banim_frame_oam 0x0, 0x5000, 0xC4, -9, -24
	banim_frame_oam 0x8000, 0x1000, 0xC6, -17, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xC7, -13, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x7000, 0x6A, -20, -13
	banim_frame_oam 0x0, 0x3000, 0x6C, -28, -5
	banim_frame_oam 0x4000, 0x3000, 0xB, -20, -21
	banim_frame_oam 0x4000, 0x9000, 0xA0, -17, 0
	banim_frame_oam 0x0, 0x5000, 0xC4, -9, -24
	banim_frame_oam 0x8000, 0x1000, 0xC6, -17, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xC7, -13, -8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_banm_ax1_2_oam_r:
banim_banm_ax1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x94, -7, -32
	banim_frame_oam 0x8000, 0x4000, 0x96, 9, -32
	banim_frame_oam 0x4000, 0x8000, 0xD0, -15, 0
	banim_frame_end
banim_banm_ax1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x9B, -42, -18
	banim_frame_oam 0x4000, 0x4000, 0xDB, -10, -10
	banim_frame_oam 0x4000, 0x0, 0x7E, 14, -18
	banim_frame_oam 0x0, 0x0, 0x9F, 22, -10
	banim_frame_oam 0x4000, 0x4000, 0x97, -17, -16
	banim_frame_oam 0x0, 0x4000, 0xB8, -9, -8
	banim_frame_oam 0x8000, 0x0, 0xBA, 7, -8
	banim_frame_oam 0x4000, 0x0, 0xF8, -9, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 7, 8
	banim_frame_oam 0x8000, 0x0, 0xD7, -17, 0
	banim_frame_oam 0x4000, 0x0, 0x7A, -9, -24
	banim_frame_oam 0x4000, 0x0, 0x7C, -33, -14
	banim_frame_end
banim_banm_ax1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0x97, -17, -16
	banim_frame_oam 0x0, 0x4000, 0xB8, -9, -8
	banim_frame_oam 0x8000, 0x0, 0xBA, 7, -8
	banim_frame_oam 0x4000, 0x0, 0xF8, -9, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 7, 8
	banim_frame_oam 0x8000, 0x0, 0xD7, -17, 0
	banim_frame_oam 0x4000, 0x0, 0x7A, -9, -24
	banim_frame_oam 0x4000, 0x0, 0x7C, -33, -14
	banim_frame_end
banim_banm_ax1_2_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -21, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -21, -8
	banim_frame_oam 0x0, 0x4000, 0x61, -13, 0
	banim_frame_oam 0x8000, 0x0, 0x63, 3, 0
	banim_frame_oam 0x8000, 0x0, 0x4, 11, -15
	banim_frame_oam 0x0, 0x0, 0x60, 11, 8
	banim_frame_end
banim_banm_ax1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x44, -17, -15
	banim_frame_oam 0x8000, 0x8000, 0x48, 15, -15
	banim_frame_oam 0x0, 0x4000, 0x5, -9, -31
	banim_frame_oam 0x8000, 0x0, 0x7, 7, -31
	banim_frame_oam 0x0, 0x0, 0x8, -17, -23
	banim_frame_end
banim_banm_ax1_2_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x8000, 0x1A, -1, -11
	banim_frame_oam 0x4000, 0x4000, 0x5A, -1, 5
	banim_frame_oam 0x4000, 0x0, 0xFD, -17, -8
	banim_frame_oam 0x4000, 0x0, 0xFB, -17, -16
	banim_frame_oam 0x0, 0x0, 0xFF, -15, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x2000, 0xA, 4, -16
	banim_frame_oam 0x0, 0x2000, 0x4A, 4, -24
	banim_frame_oam 0x0, 0x6000, 0x2B, 12, -24
	banim_frame_oam 0x4000, 0x8000, 0xA0, -15, 0
	banim_frame_oam 0x0, 0x4000, 0xC4, -7, -24
	banim_frame_oam 0x8000, 0x0, 0xC6, 9, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, -8
	banim_frame_oam 0x0, 0x0, 0xE7, 17, -16
	banim_frame_oam 0x0, 0x0, 0xC7, 5, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x5000, 0x6A, 16, -25
	banim_frame_oam 0x0, 0x1000, 0x6C, 8, -25
	banim_frame_oam 0x4000, 0x1000, 0xB, 16, -9
	banim_frame_oam 0x4000, 0x8000, 0xA0, -15, 0
	banim_frame_oam 0x0, 0x4000, 0xC4, -7, -24
	banim_frame_oam 0x8000, 0x0, 0xC6, 9, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, -8
	banim_frame_oam 0x0, 0x0, 0xE7, 17, -16
	banim_frame_oam 0x0, 0x0, 0xC7, 5, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x1000, 0xA, 24, -21
	banim_frame_oam 0x0, 0x1000, 0x4A, 24, -5
	banim_frame_oam 0x0, 0x5000, 0x2B, 8, -13
	banim_frame_oam 0x4000, 0x8000, 0xA0, -15, 0
	banim_frame_oam 0x0, 0x4000, 0xC4, -7, -24
	banim_frame_oam 0x8000, 0x0, 0xC6, 9, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, -8
	banim_frame_oam 0x0, 0x0, 0xE7, 17, -16
	banim_frame_oam 0x0, 0x0, 0xC7, 5, -8
	banim_frame_end
banim_banm_ax1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x6000, 0x6A, 4, -13
	banim_frame_oam 0x0, 0x2000, 0x6C, 20, -5
	banim_frame_oam 0x4000, 0x2000, 0xB, 4, -21
	banim_frame_oam 0x4000, 0x8000, 0xA0, -15, 0
	banim_frame_oam 0x0, 0x4000, 0xC4, -7, -24
	banim_frame_oam 0x8000, 0x0, 0xC6, 9, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, -8
	banim_frame_oam 0x0, 0x0, 0xE7, 17, -16
	banim_frame_oam 0x0, 0x0, 0xC7, 5, -8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_banm_ax1_2_script:
banim_banm_ax1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 4, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_2_oam_frame_1_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_2_oam_frame_2_r - banim_banm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_banm_ax1_2_sheet_0, 3, banim_banm_ax1_2_oam_frame_3_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 9, banim_banm_ax1_2_oam_frame_5_r - banim_banm_ax1_2_oam_r
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 10, banim_banm_ax1_2_oam_frame_6_r - banim_banm_ax1_2_oam_r
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 11, banim_banm_ax1_2_oam_frame_7_r - banim_banm_ax1_2_oam_r
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 12, banim_banm_ax1_2_oam_frame_8_r - banim_banm_ax1_2_oam_r
	banim_code_frame 15, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 4, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_2_oam_frame_1_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_2_oam_frame_2_r - banim_banm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_banm_ax1_2_sheet_0, 3, banim_banm_ax1_2_oam_frame_3_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 8, banim_banm_ax1_2_oam_frame_9_r - banim_banm_ax1_2_oam_r
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 8, banim_banm_ax1_2_oam_frame_9_r - banim_banm_ax1_2_oam_r
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 8, banim_banm_ax1_2_oam_frame_9_r - banim_banm_ax1_2_oam_r
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 8, banim_banm_ax1_2_oam_frame_9_r - banim_banm_ax1_2_oam_r
	banim_code_frame 15, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 4, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 7, banim_banm_ax1_2_oam_frame_4_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_2_oam_frame_1_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_2_oam_frame_2_r - banim_banm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_banm_ax1_2_sheet_0, 3, banim_banm_ax1_2_oam_frame_3_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 9, banim_banm_ax1_2_oam_frame_5_r - banim_banm_ax1_2_oam_r
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 10, banim_banm_ax1_2_oam_frame_6_r - banim_banm_ax1_2_oam_r
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 11, banim_banm_ax1_2_oam_frame_7_r - banim_banm_ax1_2_oam_r
	banim_code_frame 2, banim_banm_ax1_2_sheet_0, 12, banim_banm_ax1_2_oam_frame_8_r - banim_banm_ax1_2_oam_r
	banim_code_frame 15, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 4, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_2_oam_frame_1_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_2_oam_frame_2_r - banim_banm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_sound_axe_swing_long
	banim_code_frame 3, banim_banm_ax1_2_sheet_0, 3, banim_banm_ax1_2_oam_frame_3_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_2_sheet_0, 4, banim_banm_ax1_2_oam_frame_10_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 5, banim_banm_ax1_2_oam_frame_11_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_2_sheet_0, 4, banim_banm_ax1_2_oam_frame_10_r - banim_banm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_2_sheet_0, 4, banim_banm_ax1_2_oam_frame_10_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 5, banim_banm_ax1_2_oam_frame_11_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_2_sheet_0, 4, banim_banm_ax1_2_oam_frame_10_r - banim_banm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_2_mode_stand_close:
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_banm_ax1_2_mode_stand:
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_banm_ax1_2_mode_stand_range:
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_banm_ax1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_2_oam_frame_1_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_2_oam_frame_2_r - banim_banm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_banm_ax1_2_sheet_0, 3, banim_banm_ax1_2_oam_frame_3_r - banim_banm_ax1_2_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 0, banim_banm_ax1_2_oam_frame_0_r - banim_banm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_banm_ax1_2_mode_attack_close - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_attack_close_back - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_attack_close_critical - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_attack_close_critical_back - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_attack_range - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_attack_range_critical - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_dodge_close - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_dodge_range - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_stand_close - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_stand - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_stand_range - banim_banm_ax1_2_script
	.word banim_banm_ax1_2_mode_attack_miss - banim_banm_ax1_2_script
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

