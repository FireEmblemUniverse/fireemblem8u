@ vim:ft=armv4
	.global banim_pirm_ax1_2_script
	.global banim_pirm_ax1_2_oam_r
	.global banim_pirm_ax1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x9A
	.section .data.oam_l
banim_pirm_ax1_2_oam_l:
banim_pirm_ax1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x2C, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0x2E, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x6C, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x6E, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x4A, -2, 0
	banim_frame_oam 0x0, 0x5000, 0xF, -18, 0
	banim_frame_oam 0x4000, 0x1000, 0xC, -12, -32
	banim_frame_end
banim_pirm_ax1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x80, 10, -17
	banim_frame_oam 0x8000, 0x1000, 0x84, 2, -17
	banim_frame_oam 0x4000, 0x1000, 0xA5, -14, -9
	banim_frame_oam 0x0, 0x5000, 0x4F, -30, -17
	banim_frame_oam 0x0, 0x1000, 0x85, 42, -11
	banim_frame_oam 0x0, 0x1000, 0xE6, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -2, -24
	banim_frame_oam 0x8000, 0x9000, 0x88, -13, -16
	banim_frame_oam 0x8000, 0x5000, 0x8A, -21, -16
	banim_frame_oam 0x8000, 0x1000, 0xA7, 3, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, 3, 8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x1000, 0xE6, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -2, -24
	banim_frame_oam 0x8000, 0x9000, 0x88, -13, -16
	banim_frame_oam 0x8000, 0x5000, 0x8A, -21, -16
	banim_frame_oam 0x8000, 0x1000, 0xA7, 3, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x87, 3, -16
	banim_frame_oam 0x4000, 0x1000, 0xC0, 11, -13
	banim_frame_oam 0x0, 0x1000, 0xE0, 19, -5
	banim_frame_end
banim_pirm_ax1_2_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x8B, -4, -24
	banim_frame_oam 0x8000, 0x5000, 0x8D, -12, -24
	banim_frame_oam 0x8000, 0x1000, 0xC2, 12, -19
	banim_frame_oam 0x4000, 0x1000, 0xC4, -4, 8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -20, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -20, 0
	banim_frame_oam 0x8000, 0x1000, 0xC3, -20, -16
	banim_frame_end
banim_pirm_ax1_2_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x1000, 0x90, -21, -28
	banim_frame_oam 0x8000, 0x0, 0x90, -14, -28
	banim_frame_oam 0x0, 0x1000, 0xEF, -29, -24
	banim_frame_oam 0x0, 0x0, 0xEF, -6, -24
	banim_frame_oam 0x0, 0x5000, 0x13, -10, -26
	banim_frame_oam 0x8000, 0x1000, 0x15, -18, -26
	banim_frame_oam 0x4000, 0x1000, 0x53, -10, -10
	banim_frame_oam 0x0, 0x1000, 0x55, -18, -10
	banim_frame_oam 0x0, 0x5000, 0x73, -2, -2
	banim_frame_oam 0x8000, 0x1000, 0x75, -10, -2
	banim_frame_oam 0x8000, 0x1000, 0x92, -18, -2
	banim_frame_oam 0x0, 0x1000, 0x91, -26, -20
	banim_frame_oam 0x0, 0x1000, 0xF0, -18, -16
	banim_frame_end
banim_pirm_ax1_2_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x1000, 0x90, -23, -23
	banim_frame_oam 0x8000, 0x0, 0x90, -16, -23
	banim_frame_oam 0x0, 0x1000, 0xEF, -31, -19
	banim_frame_oam 0x0, 0x0, 0xEF, -8, -19
	banim_frame_oam 0x4000, 0x9000, 0x45, -18, -2
	banim_frame_oam 0x4000, 0x1000, 0x8, -10, -10
	banim_frame_oam 0x0, 0x1000, 0x49, -18, -10
	banim_frame_oam 0x0, 0x1000, 0x69, -26, -10
	banim_frame_oam 0x0, 0x5000, 0xA, -15, -26
	banim_frame_oam 0x0, 0x1000, 0x28, -23, -26
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x3000, 0xB5, -12, -16
	banim_frame_oam 0x0, 0x3000, 0xF5, -12, -24
	banim_frame_oam 0x0, 0x7000, 0xD6, -28, -24
	banim_frame_oam 0x0, 0x5000, 0xD1, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD3, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xB3, -9, -24
	banim_frame_oam 0x0, 0x1000, 0xB1, -24, -15
	banim_frame_oam 0x0, 0x5000, 0x4A, -2, 0
	banim_frame_oam 0x0, 0x5000, 0xF, -18, 0
	banim_frame_oam 0x0, 0x1000, 0x76, -13, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x4000, 0x16, -32, -25
	banim_frame_oam 0x8000, 0x0, 0x18, -16, -25
	banim_frame_oam 0x4000, 0x0, 0xB6, -32, -9
	banim_frame_oam 0x0, 0x5000, 0xD1, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD3, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xB3, -9, -24
	banim_frame_oam 0x0, 0x1000, 0xB1, -24, -15
	banim_frame_oam 0x0, 0x5000, 0x4A, -2, 0
	banim_frame_oam 0x0, 0x5000, 0xF, -18, 0
	banim_frame_oam 0x0, 0x1000, 0x76, -13, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x0, 0xB5, -32, -21
	banim_frame_oam 0x0, 0x0, 0xF5, -32, -5
	banim_frame_oam 0x0, 0x4000, 0xD6, -24, -13
	banim_frame_oam 0x0, 0x5000, 0xD1, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD3, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xB3, -9, -24
	banim_frame_oam 0x0, 0x1000, 0xB1, -24, -15
	banim_frame_oam 0x0, 0x5000, 0x4A, -2, 0
	banim_frame_oam 0x0, 0x5000, 0xF, -18, 0
	banim_frame_oam 0x0, 0x1000, 0x76, -13, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x7000, 0x16, -20, -13
	banim_frame_oam 0x8000, 0x3000, 0x18, -28, -13
	banim_frame_oam 0x4000, 0x3000, 0xB6, -20, -21
	banim_frame_oam 0x0, 0x5000, 0xD1, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD3, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xB3, -9, -24
	banim_frame_oam 0x0, 0x1000, 0xB1, -24, -15
	banim_frame_oam 0x0, 0x5000, 0x4A, -2, 0
	banim_frame_oam 0x0, 0x5000, 0xF, -18, 0
	banim_frame_oam 0x0, 0x1000, 0x76, -13, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_pirm_ax1_2_oam_r:
banim_pirm_ax1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x2C, -8, -24
	banim_frame_oam 0x8000, 0x0, 0x2E, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x6C, -8, -8
	banim_frame_oam 0x0, 0x0, 0x6E, 8, -8
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x4000, 0x0, 0xC, -4, -32
	banim_frame_end
banim_pirm_ax1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x80, -42, -17
	banim_frame_oam 0x8000, 0x0, 0x84, -10, -17
	banim_frame_oam 0x4000, 0x0, 0xA5, -2, -9
	banim_frame_oam 0x0, 0x4000, 0x4F, 14, -17
	banim_frame_oam 0x0, 0x0, 0x85, -50, -11
	banim_frame_oam 0x0, 0x0, 0xE6, -19, 8
	banim_frame_oam 0x0, 0x0, 0x86, -6, -24
	banim_frame_oam 0x8000, 0x8000, 0x88, -3, -16
	banim_frame_oam 0x8000, 0x4000, 0x8A, 13, -16
	banim_frame_oam 0x8000, 0x0, 0xA7, -11, -8
	banim_frame_oam 0x0, 0x0, 0xE7, -11, 8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x0, 0xE6, -19, 8
	banim_frame_oam 0x0, 0x0, 0x86, -6, -24
	banim_frame_oam 0x8000, 0x8000, 0x88, -3, -16
	banim_frame_oam 0x8000, 0x4000, 0x8A, 13, -16
	banim_frame_oam 0x8000, 0x0, 0xA7, -11, -8
	banim_frame_oam 0x0, 0x0, 0xE7, -11, 8
	banim_frame_oam 0x0, 0x0, 0x87, -11, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, -27, -13
	banim_frame_oam 0x0, 0x0, 0xE0, -27, -5
	banim_frame_end
banim_pirm_ax1_2_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x8B, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x8D, 4, -24
	banim_frame_oam 0x8000, 0x0, 0xC2, -20, -19
	banim_frame_oam 0x4000, 0x0, 0xC4, -12, 8
	banim_frame_oam 0x4000, 0x0, 0xE4, 4, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 12, 0
	banim_frame_oam 0x8000, 0x0, 0xC3, 12, -16
	banim_frame_end
banim_pirm_ax1_2_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x0, 0x90, 13, -28
	banim_frame_oam 0x8000, 0x1000, 0x90, 6, -28
	banim_frame_oam 0x0, 0x0, 0xEF, 21, -24
	banim_frame_oam 0x0, 0x1000, 0xEF, -2, -24
	banim_frame_oam 0x0, 0x4000, 0x13, -6, -26
	banim_frame_oam 0x8000, 0x0, 0x15, 10, -26
	banim_frame_oam 0x4000, 0x0, 0x53, -6, -10
	banim_frame_oam 0x0, 0x0, 0x55, 10, -10
	banim_frame_oam 0x0, 0x4000, 0x73, -14, -2
	banim_frame_oam 0x8000, 0x0, 0x75, 2, -2
	banim_frame_oam 0x8000, 0x0, 0x92, 10, -2
	banim_frame_oam 0x0, 0x0, 0x91, 18, -20
	banim_frame_oam 0x0, 0x0, 0xF0, 10, -16
	banim_frame_end
banim_pirm_ax1_2_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x0, 0x90, 15, -23
	banim_frame_oam 0x8000, 0x1000, 0x90, 8, -23
	banim_frame_oam 0x0, 0x0, 0xEF, 23, -19
	banim_frame_oam 0x0, 0x1000, 0xEF, 0, -19
	banim_frame_oam 0x4000, 0x8000, 0x45, -14, -2
	banim_frame_oam 0x4000, 0x0, 0x8, -6, -10
	banim_frame_oam 0x0, 0x0, 0x49, 10, -10
	banim_frame_oam 0x0, 0x0, 0x69, 18, -10
	banim_frame_oam 0x0, 0x4000, 0xA, -1, -26
	banim_frame_oam 0x0, 0x0, 0x28, 15, -26
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x2000, 0xB5, 4, -16
	banim_frame_oam 0x0, 0x2000, 0xF5, 4, -24
	banim_frame_oam 0x0, 0x6000, 0xD6, 12, -24
	banim_frame_oam 0x0, 0x4000, 0xD1, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -7, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 16, -15
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x0, 0x0, 0x76, 5, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x5000, 0x16, 16, -25
	banim_frame_oam 0x8000, 0x1000, 0x18, 8, -25
	banim_frame_oam 0x4000, 0x1000, 0xB6, 16, -9
	banim_frame_oam 0x0, 0x4000, 0xD1, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -7, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 16, -15
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x0, 0x0, 0x76, 5, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x1000, 0xB5, 24, -21
	banim_frame_oam 0x0, 0x1000, 0xF5, 24, -5
	banim_frame_oam 0x0, 0x5000, 0xD6, 8, -13
	banim_frame_oam 0x0, 0x4000, 0xD1, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -7, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 16, -15
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x0, 0x0, 0x76, 5, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x6000, 0x16, 4, -13
	banim_frame_oam 0x8000, 0x2000, 0x18, 20, -13
	banim_frame_oam 0x4000, 0x2000, 0xB6, 4, -21
	banim_frame_oam 0x0, 0x4000, 0xD1, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -7, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 16, -15
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x0, 0x0, 0x76, 5, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_pirm_ax1_2_script:
banim_pirm_ax1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_2_oam_frame_1_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_2_oam_frame_2_r - banim_pirm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 3, banim_pirm_ax1_2_oam_frame_3_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 8, banim_pirm_ax1_2_oam_frame_5_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 9, banim_pirm_ax1_2_oam_frame_6_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 10, banim_pirm_ax1_2_oam_frame_7_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 11, banim_pirm_ax1_2_oam_frame_8_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 15, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_2_oam_frame_1_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_2_oam_frame_2_r - banim_pirm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 3, banim_pirm_ax1_2_oam_frame_3_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 15, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 7, banim_pirm_ax1_2_oam_frame_4_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_2_oam_frame_1_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_2_oam_frame_2_r - banim_pirm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 3, banim_pirm_ax1_2_oam_frame_3_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 8, banim_pirm_ax1_2_oam_frame_5_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 9, banim_pirm_ax1_2_oam_frame_6_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 10, banim_pirm_ax1_2_oam_frame_7_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 2, banim_pirm_ax1_sheet_1, 11, banim_pirm_ax1_2_oam_frame_8_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 15, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_2_oam_frame_1_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_2_oam_frame_2_r - banim_pirm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 3, banim_pirm_ax1_2_oam_frame_3_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 4, banim_pirm_ax1_2_oam_frame_9_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 5, banim_pirm_ax1_2_oam_frame_10_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 4, banim_pirm_ax1_2_oam_frame_9_r - banim_pirm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 4, banim_pirm_ax1_2_oam_frame_9_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 5, banim_pirm_ax1_2_oam_frame_10_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 4, banim_pirm_ax1_2_oam_frame_9_r - banim_pirm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_2_mode_stand_close:
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_2_mode_stand:
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_2_mode_stand_range:
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_sound_axe_swing_long
	banim_code_call_spell_anim
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_2_oam_frame_1_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_2_oam_frame_2_r - banim_pirm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 3, banim_pirm_ax1_2_oam_frame_3_r - banim_pirm_ax1_2_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 0, banim_pirm_ax1_2_oam_frame_0_r - banim_pirm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pirm_ax1_2_mode_attack_close - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_attack_close_back - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_attack_close_critical - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_attack_close_critical_back - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_attack_range - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_attack_range_critical - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_dodge_close - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_dodge_range - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_stand_close - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_stand - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_stand_range - banim_pirm_ax1_2_script
	.word banim_pirm_ax1_2_mode_attack_miss - banim_pirm_ax1_2_script
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

