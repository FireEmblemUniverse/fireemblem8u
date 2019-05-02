@ vim:ft=armv4
	.global banim_bram_sw1_3_script
	.global banim_bram_sw1_3_oam_r
	.global banim_bram_sw1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xE
	.section .data.oam_l
banim_bram_sw1_3_oam_l:
banim_bram_sw1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -17, -10
	banim_frame_oam 0x4000, 0x1000, 0x5D, -17, 6
	banim_frame_oam 0x0, 0x5000, 0x1B, -17, -17
	banim_frame_oam 0x0, 0x1000, 0x5C, -1, -9
	banim_frame_oam 0x0, 0x1000, 0x5B, -9, -1
	banim_frame_oam 0x8000, 0x9000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_end
banim_bram_sw1_3_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x8000, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x5000, 0x40, -15, -8
	banim_frame_oam 0x0, 0x1000, 0x44, -23, -8
	banim_frame_oam 0x4000, 0x5000, 0x60, -23, 0
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_end
banim_bram_sw1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x25, -15, -16
	banim_frame_oam 0x4000, 0x9000, 0x64, -15, 0
	banim_frame_oam 0x8000, 0x1000, 0x68, -23, 0
	banim_frame_oam 0x4000, 0x1000, 0x5, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x7, -31, -8
	banim_frame_oam 0x0, 0x1000, 0x9, -31, 0
	banim_frame_end
banim_bram_sw1_3_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x9000, 0x29, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0x69, -15, 0
	banim_frame_oam 0x4000, 0x5000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x5, -7, -24
	banim_frame_oam 0x0, 0x1000, 0xA, -23, -8
	banim_frame_oam 0x4000, 0x1000, 0xB, -21, -5
	banim_frame_oam 0x0, 0x1000, 0xD, -29, -5
	banim_frame_oam 0x4000, 0x1000, 0x2D, -21, 3
	banim_frame_oam 0x0, 0x1000, 0x2F, -29, 3
	banim_frame_end
banim_bram_sw1_3_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0x29, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0x69, -15, 0
	banim_frame_oam 0x4000, 0x5000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x5, -7, -24
	banim_frame_oam 0x0, 0x1000, 0xA, -23, -8
	banim_frame_oam 0x0, 0x5000, 0x4D, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0x8D, -17, 0
	banim_frame_end
banim_bram_sw1_3_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0x29, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0x69, -15, 0
	banim_frame_oam 0x4000, 0x5000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x5, -7, -24
	banim_frame_oam 0x0, 0x1000, 0xA, -23, -8
	banim_frame_oam 0x4000, 0x2000, 0xB, -28, -9
	banim_frame_oam 0x0, 0x2000, 0xD, -12, -9
	banim_frame_oam 0x4000, 0x2000, 0x2D, -28, -17
	banim_frame_oam 0x0, 0x2000, 0x2F, -12, -17
	banim_frame_end
banim_bram_sw1_3_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x9000, 0x29, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0x69, -15, 0
	banim_frame_oam 0x4000, 0x5000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x5, -7, -24
	banim_frame_oam 0x0, 0x1000, 0xA, -23, -8
	banim_frame_oam 0x0, 0x6000, 0x4D, -30, -7
	banim_frame_oam 0x4000, 0x2000, 0x8D, -30, -15
	banim_frame_end
banim_bram_sw1_3_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0x10, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x14, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x4F, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0xE, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, 8, 8
	banim_frame_end
banim_bram_sw1_3_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0x15, -26, -20
	banim_frame_oam 0x4000, 0x1000, 0x17, -26, -4
	banim_frame_oam 0x0, 0x1000, 0x37, -26, 4
	banim_frame_oam 0x0, 0x5000, 0x54, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x56, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x94, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x96, -16, 0
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xE, -7, -24
	banim_frame_oam 0x0, 0x1000, 0x57, 8, -15
	banim_frame_oam 0x0, 0x1000, 0x38, 16, -16
	banim_frame_end
banim_bram_sw1_3_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0x15, -25, -20
	banim_frame_oam 0x4000, 0x1000, 0x17, -25, -4
	banim_frame_oam 0x0, 0x1000, 0x37, -25, 4
	banim_frame_oam 0x4000, 0x9000, 0x53, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x94, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x96, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xE, -7, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x93, 16, -16
	banim_frame_end
banim_bram_sw1_3_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x9000, 0xA1, -29, -10
	banim_frame_oam 0x4000, 0x5000, 0xE1, -29, 6
	banim_frame_oam 0x0, 0x1000, 0xA0, 3, -10
	banim_frame_oam 0x0, 0x1000, 0xE0, 3, 6
	banim_frame_oam 0x0, 0x1000, 0xA5, -37, -2
	banim_frame_oam 0x4000, 0x5000, 0x16, -21, -18
	banim_frame_oam 0x4000, 0x1000, 0xE5, -28, 14
	banim_frame_oam 0x4000, 0x1000, 0xC5, -12, 14
	banim_frame_oam 0x0, 0x1000, 0xC0, -36, 14
	banim_frame_end
banim_bram_sw1_3_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x5000, 0x13, -32, -9
	banim_frame_oam 0x4000, 0x9000, 0x33, -33, -1
	banim_frame_oam 0x4000, 0x5000, 0x73, -33, 15
	banim_frame_oam 0x4000, 0x1000, 0x70, -16, -17
	banim_frame_oam 0x0, 0x1000, 0x72, -24, -17
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_bram_sw1_3_oam_r:
banim_bram_sw1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, 1, -10
	banim_frame_oam 0x4000, 0x0, 0x5D, 1, 6
	banim_frame_oam 0x0, 0x4000, 0x1B, 1, -17
	banim_frame_oam 0x0, 0x0, 0x5C, -7, -9
	banim_frame_oam 0x0, 0x0, 0x5B, 1, -1
	banim_frame_oam 0x8000, 0x8000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x8000, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -17, -8
	banim_frame_oam 0x0, 0x0, 0x44, 15, -8
	banim_frame_oam 0x4000, 0x4000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_end
banim_bram_sw1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x25, -17, -16
	banim_frame_oam 0x4000, 0x8000, 0x64, -17, 0
	banim_frame_oam 0x8000, 0x0, 0x68, 15, 0
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x4000, 0x0, 0x7, 15, -8
	banim_frame_oam 0x0, 0x0, 0x9, 23, 0
	banim_frame_end
banim_bram_sw1_3_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x8000, 0x29, -17, -16
	banim_frame_oam 0x4000, 0x4000, 0x69, -17, 0
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x0, 0x0, 0xA, 15, -8
	banim_frame_oam 0x4000, 0x0, 0xB, 5, -5
	banim_frame_oam 0x0, 0x0, 0xD, 21, -5
	banim_frame_oam 0x4000, 0x0, 0x2D, 5, 3
	banim_frame_oam 0x0, 0x0, 0x2F, 21, 3
	banim_frame_end
banim_bram_sw1_3_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0x29, -17, -16
	banim_frame_oam 0x4000, 0x4000, 0x69, -17, 0
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x0, 0x0, 0xA, 15, -8
	banim_frame_oam 0x0, 0x4000, 0x4D, 1, -16
	banim_frame_oam 0x4000, 0x0, 0x8D, 1, 0
	banim_frame_end
banim_bram_sw1_3_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0x29, -17, -16
	banim_frame_oam 0x4000, 0x4000, 0x69, -17, 0
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x0, 0x0, 0xA, 15, -8
	banim_frame_oam 0x4000, 0x3000, 0xB, 12, -9
	banim_frame_oam 0x0, 0x3000, 0xD, 4, -9
	banim_frame_oam 0x4000, 0x3000, 0x2D, 12, -17
	banim_frame_oam 0x0, 0x3000, 0x2F, 4, -17
	banim_frame_end
banim_bram_sw1_3_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x8000, 0x29, -17, -16
	banim_frame_oam 0x4000, 0x4000, 0x69, -17, 0
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x0, 0x0, 0xA, 15, -8
	banim_frame_oam 0x0, 0x7000, 0x4D, 14, -7
	banim_frame_oam 0x4000, 0x3000, 0x8D, 14, -15
	banim_frame_end
banim_bram_sw1_3_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0x10, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x14, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x4F, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE, -8, -24
	banim_frame_oam 0x0, 0x0, 0x8F, -16, 8
	banim_frame_end
banim_bram_sw1_3_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0x15, 10, -20
	banim_frame_oam 0x4000, 0x0, 0x17, 10, -4
	banim_frame_oam 0x0, 0x0, 0x37, 18, 4
	banim_frame_oam 0x0, 0x4000, 0x54, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x56, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x94, -8, 0
	banim_frame_oam 0x0, 0x0, 0x96, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE, -9, -24
	banim_frame_oam 0x0, 0x0, 0x57, -16, -15
	banim_frame_oam 0x0, 0x0, 0x38, -24, -16
	banim_frame_end
banim_bram_sw1_3_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0x15, 9, -20
	banim_frame_oam 0x4000, 0x0, 0x17, 9, -4
	banim_frame_oam 0x0, 0x0, 0x37, 17, 4
	banim_frame_oam 0x4000, 0x8000, 0x53, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x94, -8, 0
	banim_frame_oam 0x0, 0x0, 0x96, 8, 0
	banim_frame_oam 0x4000, 0x0, 0xE, -9, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, -24, -16
	banim_frame_end
banim_bram_sw1_3_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x8000, 0xA1, -3, -10
	banim_frame_oam 0x4000, 0x4000, 0xE1, -3, 6
	banim_frame_oam 0x0, 0x0, 0xA0, -11, -10
	banim_frame_oam 0x0, 0x0, 0xE0, -11, 6
	banim_frame_oam 0x0, 0x0, 0xA5, 29, -2
	banim_frame_oam 0x4000, 0x4000, 0x16, -11, -18
	banim_frame_oam 0x4000, 0x0, 0xE5, 12, 14
	banim_frame_oam 0x4000, 0x0, 0xC5, -4, 14
	banim_frame_oam 0x0, 0x0, 0xC0, 28, 14
	banim_frame_end
banim_bram_sw1_3_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x4000, 0x13, 0, -9
	banim_frame_oam 0x4000, 0x8000, 0x33, 1, -1
	banim_frame_oam 0x4000, 0x4000, 0x73, 1, 15
	banim_frame_oam 0x4000, 0x0, 0x70, 0, -17
	banim_frame_oam 0x0, 0x0, 0x72, 16, -17
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_bram_sw1_3_script:
banim_bram_sw1_3_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_frame 13, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 8, banim_bram_sw1_3_oam_frame_4_r - banim_bram_sw1_3_oam_r
	banim_code_frame 1, banim_bram_sw1_3_sheet_0, 9, banim_bram_sw1_3_oam_frame_5_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_range_attack
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_3_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_frame 13, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 8, banim_bram_sw1_3_oam_frame_4_r - banim_bram_sw1_3_oam_r
	banim_code_frame 1, banim_bram_sw1_3_sheet_0, 9, banim_bram_sw1_3_oam_frame_5_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_range_attack
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_3_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 3, banim_bram_sw1_3_oam_frame_6_r - banim_bram_sw1_3_oam_r
	banim_code_frame 4, banim_bram_sw1_3_sheet_0, 4, banim_bram_sw1_3_oam_frame_7_r - banim_bram_sw1_3_oam_r
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 5, banim_bram_sw1_3_oam_frame_8_r - banim_bram_sw1_3_oam_r
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 6, banim_bram_sw1_3_oam_frame_9_r - banim_bram_sw1_3_oam_r
	banim_code_frame 13, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 8, banim_bram_sw1_3_oam_frame_4_r - banim_bram_sw1_3_oam_r
	banim_code_frame 1, banim_bram_sw1_3_sheet_0, 9, banim_bram_sw1_3_oam_frame_5_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_range_attack
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_3_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 3, banim_bram_sw1_3_oam_frame_6_r - banim_bram_sw1_3_oam_r
	banim_code_frame 4, banim_bram_sw1_3_sheet_0, 4, banim_bram_sw1_3_oam_frame_7_r - banim_bram_sw1_3_oam_r
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 5, banim_bram_sw1_3_oam_frame_8_r - banim_bram_sw1_3_oam_r
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 6, banim_bram_sw1_3_oam_frame_9_r - banim_bram_sw1_3_oam_r
	banim_code_frame 13, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 8, banim_bram_sw1_3_oam_frame_4_r - banim_bram_sw1_3_oam_r
	banim_code_frame 1, banim_bram_sw1_3_sheet_0, 9, banim_bram_sw1_3_oam_frame_5_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_range_attack
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_3_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_frame 13, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 8, banim_bram_sw1_3_oam_frame_4_r - banim_bram_sw1_3_oam_r
	banim_code_frame 1, banim_bram_sw1_3_sheet_0, 9, banim_bram_sw1_3_oam_frame_5_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_range_attack
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_3_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 3, banim_bram_sw1_3_oam_frame_6_r - banim_bram_sw1_3_oam_r
	banim_code_frame 4, banim_bram_sw1_3_sheet_0, 4, banim_bram_sw1_3_oam_frame_7_r - banim_bram_sw1_3_oam_r
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 5, banim_bram_sw1_3_oam_frame_8_r - banim_bram_sw1_3_oam_r
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 6, banim_bram_sw1_3_oam_frame_9_r - banim_bram_sw1_3_oam_r
	banim_code_frame 13, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 8, banim_bram_sw1_3_oam_frame_4_r - banim_bram_sw1_3_oam_r
	banim_code_frame 1, banim_bram_sw1_3_sheet_0, 9, banim_bram_sw1_3_oam_frame_5_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_range_attack
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_3_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 10, banim_bram_sw1_3_oam_frame_10_r - banim_bram_sw1_3_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 11, banim_bram_sw1_3_oam_frame_11_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 10, banim_bram_sw1_3_oam_frame_10_r - banim_bram_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_3_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 10, banim_bram_sw1_3_oam_frame_10_r - banim_bram_sw1_3_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 11, banim_bram_sw1_3_oam_frame_11_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 10, banim_bram_sw1_3_oam_frame_10_r - banim_bram_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_3_mode_stand_close:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_3_mode_stand:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_3_mode_stand_range:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_3_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_3_oam_frame_0_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_frame 13, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 8, banim_bram_sw1_3_oam_frame_4_r - banim_bram_sw1_3_oam_r
	banim_code_frame 1, banim_bram_sw1_3_sheet_0, 9, banim_bram_sw1_3_oam_frame_5_r - banim_bram_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_range_attack
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 7, banim_bram_sw1_3_oam_frame_3_r - banim_bram_sw1_3_oam_r
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bram_sw1_3_sheet_0, 2, banim_bram_sw1_3_oam_frame_2_r - banim_bram_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_3_sheet_0, 1, banim_bram_sw1_3_oam_frame_1_r - banim_bram_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bram_sw1_3_mode_attack_close - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_attack_close_back - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_attack_close_critical - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_attack_close_critical_back - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_attack_range - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_attack_range_critical - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_dodge_close - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_dodge_range - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_stand_close - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_stand - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_stand_range - banim_bram_sw1_3_script
	.word banim_bram_sw1_3_mode_attack_miss - banim_bram_sw1_3_script
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

