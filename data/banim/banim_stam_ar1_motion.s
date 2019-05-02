@ vim:ft=armv4
	.global banim_stam_ar1_script
	.global banim_stam_ar1_oam_r
	.global banim_stam_ar1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x9E
	.section .data.oam_l
banim_stam_ar1_oam_l:
banim_stam_ar1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x9000, 0x1046, -7, -29
	banim_frame_oam 0x4000, 0x5000, 0x1026, -1, -37
	banim_frame_oam 0x4000, 0x1000, 0x1006, -1, -45
	banim_frame_oam 0x4000, 0x5000, 0x1040, -1, 3
	banim_frame_oam 0x4000, 0x1000, 0x1044, -17, 3
	banim_frame_oam 0x4000, 0x5000, 0x1060, -2, 11
	banim_frame_oam 0x4000, 0x1000, 0x1064, -18, 11
	banim_frame_oam 0x4000, 0x5000, 0x102E, -1, -5
	banim_frame_oam 0x4000, 0x5000, 0x100E, -3, -13
	banim_frame_oam 0x0, 0x1000, 0x1004, -17, -13
	banim_frame_oam 0x4000, 0x1000, 0x106D, -17, -5
	banim_frame_oam 0x8000, 0x9000, 0x80, -25, -16
	banim_frame_oam 0x8000, 0x1000, 0xA2, -33, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -33, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, -25, -24
	banim_frame_oam 0x0, 0x1000, 0x88, -9, -8
	banim_frame_oam 0x0, 0x1000, 0x82, -33, -16
	banim_frame_end
banim_stam_ar1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x1046, -7, -29
	banim_frame_oam 0x4000, 0x5000, 0x1026, -1, -37
	banim_frame_oam 0x4000, 0x1000, 0x1006, -1, -45
	banim_frame_oam 0x4000, 0x5000, 0x1040, -1, 3
	banim_frame_oam 0x4000, 0x1000, 0x1044, -17, 3
	banim_frame_oam 0x4000, 0x5000, 0x1060, -2, 11
	banim_frame_oam 0x4000, 0x1000, 0x1064, -18, 11
	banim_frame_oam 0x4000, 0x5000, 0x102E, -1, -5
	banim_frame_oam 0x4000, 0x5000, 0x100E, -3, -13
	banim_frame_oam 0x0, 0x1000, 0x1004, -17, -13
	banim_frame_oam 0x4000, 0x1000, 0x106D, -17, -5
	banim_frame_oam 0x0, 0x5000, 0xA5, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0xA7, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0xE5, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE7, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0x86, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xC8, -40, -1
	banim_frame_end
banim_stam_ar1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x1000, 23, -47
	banim_frame_oam 0x4000, 0x1000, 0x106A, 13, -13
	banim_frame_oam 0x0, 0x5000, 0x100C, -7, -29
	banim_frame_oam 0x4000, 0x1000, 0x104C, -3, -13
	banim_frame_oam 0x0, 0x5000, 0x102A, 9, -29
	banim_frame_oam 0x4000, 0x1000, 0x100A, 5, -37
	banim_frame_oam 0x4000, 0x1000, 0x1008, 0, -45
	banim_frame_oam 0x4000, 0x5000, 0x1040, -1, 3
	banim_frame_oam 0x4000, 0x5000, 0x102E, -1, -5
	banim_frame_oam 0x4000, 0x5000, 0x1060, -2, 11
	banim_frame_oam 0x4000, 0x1000, 0x1064, -18, 11
	banim_frame_oam 0x4000, 0x1000, 0x104E, -17, 3
	banim_frame_oam 0x0, 0x1000, 0x106C, -17, -5
	banim_frame_oam 0x8000, 0x9000, 0x83, -31, -16
	banim_frame_oam 0x0, 0x1000, 0xE8, -39, -1
	banim_frame_oam 0x0, 0x1000, 0x85, -15, 8
	banim_frame_end
banim_stam_ar1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0x1000, 64, -69
	banim_frame_oam 0x4000, 0x1000, 0x106A, 13, -13
	banim_frame_oam 0x0, 0x5000, 0x100C, -7, -29
	banim_frame_oam 0x4000, 0x1000, 0x104C, -3, -13
	banim_frame_oam 0x0, 0x5000, 0x102A, 9, -29
	banim_frame_oam 0x4000, 0x1000, 0x100A, 5, -37
	banim_frame_oam 0x4000, 0x1000, 0x1008, 0, -45
	banim_frame_oam 0x4000, 0x1000, 0x1024, -17, 3
	banim_frame_oam 0x0, 0x1000, 0x1005, -17, -5
	banim_frame_oam 0x4000, 0x5000, 0x1040, -1, 3
	banim_frame_oam 0x4000, 0x5000, 0x102E, -1, -5
	banim_frame_oam 0x4000, 0x5000, 0x1060, -2, 11
	banim_frame_oam 0x4000, 0x1000, 0x1064, -18, 11
	banim_frame_oam 0x8000, 0x9000, 0x83, -31, -16
	banim_frame_oam 0x0, 0x1000, 0xE8, -39, -1
	banim_frame_oam 0x0, 0x1000, 0x85, -15, 8
	banim_frame_end
banim_stam_ar1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x9000, 0x1000, 96, -85
	banim_frame_oam 0x4000, 0x1000, 0x106A, 13, -13
	banim_frame_oam 0x0, 0x5000, 0x100C, -7, -29
	banim_frame_oam 0x4000, 0x1000, 0x104C, -3, -13
	banim_frame_oam 0x0, 0x5000, 0x102A, 9, -29
	banim_frame_oam 0x4000, 0x1000, 0x100A, 5, -37
	banim_frame_oam 0x4000, 0x1000, 0x1008, 0, -45
	banim_frame_oam 0x4000, 0x1000, 0x1024, -17, 3
	banim_frame_oam 0x0, 0x1000, 0x1005, -17, -5
	banim_frame_oam 0x4000, 0x5000, 0x1040, -1, 3
	banim_frame_oam 0x4000, 0x5000, 0x102E, -1, -5
	banim_frame_oam 0x4000, 0x5000, 0x1060, -2, 11
	banim_frame_oam 0x4000, 0x1000, 0x1064, -18, 11
	banim_frame_oam 0x8000, 0x9000, 0x83, -31, -16
	banim_frame_oam 0x0, 0x1000, 0xE8, -39, -1
	banim_frame_oam 0x0, 0x1000, 0x85, -15, 8
	banim_frame_end
banim_stam_ar1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x1000, 0x106A, 13, -13
	banim_frame_oam 0x0, 0x5000, 0x100C, -7, -29
	banim_frame_oam 0x4000, 0x1000, 0x104C, -3, -13
	banim_frame_oam 0x0, 0x5000, 0x102A, 9, -29
	banim_frame_oam 0x4000, 0x1000, 0x100A, 5, -37
	banim_frame_oam 0x4000, 0x1000, 0x1008, 0, -45
	banim_frame_oam 0x4000, 0x1000, 0x1024, -17, 3
	banim_frame_oam 0x0, 0x1000, 0x1005, -17, -5
	banim_frame_oam 0x4000, 0x5000, 0x1040, -1, 3
	banim_frame_oam 0x4000, 0x5000, 0x102E, -1, -5
	banim_frame_oam 0x4000, 0x5000, 0x1060, -2, 11
	banim_frame_oam 0x4000, 0x1000, 0x1064, -18, 11
	banim_frame_oam 0x8000, 0x9000, 0x83, -31, -16
	banim_frame_oam 0x0, 0x1000, 0xE8, -39, -1
	banim_frame_oam 0x0, 0x1000, 0x85, -15, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_stam_ar1_oam_r:
banim_stam_ar1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x8000, 0x1046, -25, -29
	banim_frame_oam 0x4000, 0x4000, 0x1026, -31, -37
	banim_frame_oam 0x4000, 0x0, 0x1006, -15, -45
	banim_frame_oam 0x4000, 0x4000, 0x1040, -31, 3
	banim_frame_oam 0x4000, 0x0, 0x1044, 1, 3
	banim_frame_oam 0x4000, 0x4000, 0x1060, -30, 11
	banim_frame_oam 0x4000, 0x0, 0x1064, 2, 11
	banim_frame_oam 0x4000, 0x4000, 0x102E, -31, -5
	banim_frame_oam 0x4000, 0x4000, 0x100E, -29, -13
	banim_frame_oam 0x0, 0x0, 0x1004, 9, -13
	banim_frame_oam 0x4000, 0x0, 0x106D, 1, -5
	banim_frame_oam 0x8000, 0x8000, 0x80, 9, -16
	banim_frame_oam 0x8000, 0x0, 0xA2, 25, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 25, 8
	banim_frame_oam 0x0, 0x0, 0xA8, 17, -24
	banim_frame_oam 0x0, 0x0, 0x88, 1, -8
	banim_frame_oam 0x0, 0x0, 0x82, 25, -16
	banim_frame_end
banim_stam_ar1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x1046, -25, -29
	banim_frame_oam 0x4000, 0x4000, 0x1026, -31, -37
	banim_frame_oam 0x4000, 0x0, 0x1006, -15, -45
	banim_frame_oam 0x4000, 0x4000, 0x1040, -31, 3
	banim_frame_oam 0x4000, 0x0, 0x1044, 1, 3
	banim_frame_oam 0x4000, 0x4000, 0x1060, -30, 11
	banim_frame_oam 0x4000, 0x0, 0x1064, 2, 11
	banim_frame_oam 0x4000, 0x4000, 0x102E, -31, -5
	banim_frame_oam 0x4000, 0x4000, 0x100E, -29, -13
	banim_frame_oam 0x0, 0x0, 0x1004, 9, -13
	banim_frame_oam 0x4000, 0x0, 0x106D, 1, -5
	banim_frame_oam 0x0, 0x4000, 0xA5, 8, -8
	banim_frame_oam 0x8000, 0x0, 0xA7, 24, -8
	banim_frame_oam 0x4000, 0x0, 0xE5, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE7, 24, 8
	banim_frame_oam 0x4000, 0x0, 0x86, 16, -16
	banim_frame_oam 0x0, 0x0, 0xC8, 32, -1
	banim_frame_end
banim_stam_ar1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x1000, -55, -47
	banim_frame_oam 0x4000, 0x0, 0x106A, -29, -13
	banim_frame_oam 0x0, 0x4000, 0x100C, -9, -29
	banim_frame_oam 0x4000, 0x0, 0x104C, -13, -13
	banim_frame_oam 0x0, 0x4000, 0x102A, -25, -29
	banim_frame_oam 0x4000, 0x0, 0x100A, -21, -37
	banim_frame_oam 0x4000, 0x0, 0x1008, -16, -45
	banim_frame_oam 0x4000, 0x4000, 0x1040, -31, 3
	banim_frame_oam 0x4000, 0x4000, 0x102E, -31, -5
	banim_frame_oam 0x4000, 0x4000, 0x1060, -30, 11
	banim_frame_oam 0x4000, 0x0, 0x1064, 2, 11
	banim_frame_oam 0x4000, 0x0, 0x104E, 1, 3
	banim_frame_oam 0x0, 0x0, 0x106C, 9, -5
	banim_frame_oam 0x8000, 0x8000, 0x83, 15, -16
	banim_frame_oam 0x0, 0x0, 0xE8, 31, -1
	banim_frame_oam 0x0, 0x0, 0x85, 7, 8
	banim_frame_end
banim_stam_ar1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0x1000, -96, -69
	banim_frame_oam 0x4000, 0x0, 0x106A, -29, -13
	banim_frame_oam 0x0, 0x4000, 0x100C, -9, -29
	banim_frame_oam 0x4000, 0x0, 0x104C, -13, -13
	banim_frame_oam 0x0, 0x4000, 0x102A, -25, -29
	banim_frame_oam 0x4000, 0x0, 0x100A, -21, -37
	banim_frame_oam 0x4000, 0x0, 0x1008, -16, -45
	banim_frame_oam 0x4000, 0x0, 0x1024, 1, 3
	banim_frame_oam 0x0, 0x0, 0x1005, 9, -5
	banim_frame_oam 0x4000, 0x4000, 0x1040, -31, 3
	banim_frame_oam 0x4000, 0x4000, 0x102E, -31, -5
	banim_frame_oam 0x4000, 0x4000, 0x1060, -30, 11
	banim_frame_oam 0x4000, 0x0, 0x1064, 2, 11
	banim_frame_oam 0x8000, 0x8000, 0x83, 15, -16
	banim_frame_oam 0x0, 0x0, 0xE8, 31, -1
	banim_frame_oam 0x0, 0x0, 0x85, 7, 8
	banim_frame_end
banim_stam_ar1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x8000, 0x1000, -128, -85
	banim_frame_oam 0x4000, 0x0, 0x106A, -29, -13
	banim_frame_oam 0x0, 0x4000, 0x100C, -9, -29
	banim_frame_oam 0x4000, 0x0, 0x104C, -13, -13
	banim_frame_oam 0x0, 0x4000, 0x102A, -25, -29
	banim_frame_oam 0x4000, 0x0, 0x100A, -21, -37
	banim_frame_oam 0x4000, 0x0, 0x1008, -16, -45
	banim_frame_oam 0x4000, 0x0, 0x1024, 1, 3
	banim_frame_oam 0x0, 0x0, 0x1005, 9, -5
	banim_frame_oam 0x4000, 0x4000, 0x1040, -31, 3
	banim_frame_oam 0x4000, 0x4000, 0x102E, -31, -5
	banim_frame_oam 0x4000, 0x4000, 0x1060, -30, 11
	banim_frame_oam 0x4000, 0x0, 0x1064, 2, 11
	banim_frame_oam 0x8000, 0x8000, 0x83, 15, -16
	banim_frame_oam 0x0, 0x0, 0xE8, 31, -1
	banim_frame_oam 0x0, 0x0, 0x85, 7, 8
	banim_frame_end
banim_stam_ar1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x0, 0x106A, -29, -13
	banim_frame_oam 0x0, 0x4000, 0x100C, -9, -29
	banim_frame_oam 0x4000, 0x0, 0x104C, -13, -13
	banim_frame_oam 0x0, 0x4000, 0x102A, -25, -29
	banim_frame_oam 0x4000, 0x0, 0x100A, -21, -37
	banim_frame_oam 0x4000, 0x0, 0x1008, -16, -45
	banim_frame_oam 0x4000, 0x0, 0x1024, 1, 3
	banim_frame_oam 0x0, 0x0, 0x1005, 9, -5
	banim_frame_oam 0x4000, 0x4000, 0x1040, -31, 3
	banim_frame_oam 0x4000, 0x4000, 0x102E, -31, -5
	banim_frame_oam 0x4000, 0x4000, 0x1060, -30, 11
	banim_frame_oam 0x4000, 0x0, 0x1064, 2, 11
	banim_frame_oam 0x8000, 0x8000, 0x83, 15, -16
	banim_frame_oam 0x0, 0x0, 0xE8, 31, -1
	banim_frame_oam 0x0, 0x0, 0x85, 7, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_stam_ar1_script:
banim_stam_ar1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_dodge_close:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_dodge_range:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_stand_close:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_stand:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_stand_range:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_stam_ar1_mode_attack_close - banim_stam_ar1_script
	.word banim_stam_ar1_mode_attack_close_back - banim_stam_ar1_script
	.word banim_stam_ar1_mode_attack_close_critical - banim_stam_ar1_script
	.word banim_stam_ar1_mode_attack_close_critical_back - banim_stam_ar1_script
	.word banim_stam_ar1_mode_attack_range - banim_stam_ar1_script
	.word banim_stam_ar1_mode_attack_range_critical - banim_stam_ar1_script
	.word banim_stam_ar1_mode_dodge_close - banim_stam_ar1_script
	.word banim_stam_ar1_mode_dodge_range - banim_stam_ar1_script
	.word banim_stam_ar1_mode_stand_close - banim_stam_ar1_script
	.word banim_stam_ar1_mode_stand - banim_stam_ar1_script
	.word banim_stam_ar1_mode_stand_range - banim_stam_ar1_script
	.word banim_stam_ar1_mode_attack_miss - banim_stam_ar1_script
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

