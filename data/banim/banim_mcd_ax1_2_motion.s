@ vim:ft=armv4
	.global banim_mcd_ax1_2_script
	.global banim_mcd_ax1_2_oam_r
	.global banim_mcd_ax1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB3
	.section .data.oam_l
banim_mcd_ax1_2_oam_l:
banim_mcd_ax1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xC0, -8, -40
	banim_frame_end
banim_mcd_ax1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0xA, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xC6, -32, 0
	banim_frame_end
banim_mcd_ax1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x8C, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xCC, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x10, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x90, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, 16, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x92, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xD2, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xD1, 16, 8
	banim_frame_oam 0x8000, 0x9000, 0x16, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x96, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xF3, -16, -48
	banim_frame_end
banim_mcd_ax1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x18, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x1C, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x98, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x9C, -24, 0
	banim_frame_oam 0x0, 0x5000, 0xD8, 24, -24
	banim_frame_oam 0x0, 0x1000, 0xDA, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0xDB, -32, -16
	banim_frame_end
banim_mcd_ax1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, 0
	banim_frame_oam 0x8000, 0x9000, 0x24, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0xA4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, 24, -24
	banim_frame_end
banim_mcd_ax1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0xA, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0xC6, 24, -16
	banim_frame_end
banim_mcd_ax1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x10, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x8C, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x90, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xF1, -8, -40
	banim_frame_end
banim_mcd_ax1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x16, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x92, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x96, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xD2, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xD6, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xF2, 16, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x18, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x1C, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x98, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x9C, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xDC, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xF8, 16, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xC0, 16, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0xA, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xC6, 16, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x10, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x12, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x8C, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x90, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x92, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCC, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD0, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD2, -32, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x13, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x17, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x19, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x93, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x97, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x99, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xD3, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD7, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD9, -32, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
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
	.section .data.oam_r
banim_mcd_ax1_2_oam_r:
banim_mcd_ax1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC0, 0, -40
	banim_frame_end
banim_mcd_ax1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0xA, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC6, 24, 0
	banim_frame_end
banim_mcd_ax1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x8C, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x10, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x90, 16, 8
	banim_frame_oam 0x0, 0x0, 0xB0, -24, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x92, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD2, -16, 8
	banim_frame_oam 0x0, 0x0, 0xD1, -24, 8
	banim_frame_oam 0x8000, 0x8000, 0x16, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x96, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xF1, -8, -48
	banim_frame_oam 0x0, 0x0, 0xF3, 8, -48
	banim_frame_end
banim_mcd_ax1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x1C, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x98, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x9C, 8, 0
	banim_frame_oam 0x0, 0x4000, 0xD8, -40, -24
	banim_frame_oam 0x0, 0x0, 0xDA, 8, -40
	banim_frame_oam 0x8000, 0x0, 0xDB, 24, -16
	banim_frame_end
banim_mcd_ax1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, 0
	banim_frame_oam 0x8000, 0x8000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 24, -16
	banim_frame_oam 0x4000, 0x0, 0x4, -40, -24
	banim_frame_end
banim_mcd_ax1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0xA, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 8, 0
	banim_frame_oam 0x4000, 0x0, 0xC6, -40, -16
	banim_frame_end
banim_mcd_ax1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x10, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x8C, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x90, 8, 0
	banim_frame_oam 0x0, 0x0, 0xF1, 0, -40
	banim_frame_end
banim_mcd_ax1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x16, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x92, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x96, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD2, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xD6, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF2, -24, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x1C, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x98, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x9C, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xDC, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF8, -24, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 16, 0
	banim_frame_oam 0x0, 0x0, 0xC0, -24, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0xA, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 16, 0
	banim_frame_oam 0x0, 0x0, 0xC6, -24, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x10, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x12, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x8C, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x90, 8, -8
	banim_frame_oam 0x8000, 0x0, 0x92, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD0, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD2, 24, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x17, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x19, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x93, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x97, 8, -8
	banim_frame_oam 0x8000, 0x0, 0x99, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xD3, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD7, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD9, 24, 8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mcd_ax1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
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
	.section .data.script
banim_mcd_ax1_2_script:
banim_mcd_ax1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 6, banim_mcd_ax1_2_sheet_0, 1, banim_mcd_ax1_2_oam_frame_1_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 4, banim_mcd_ax1_2_sheet_0, 2, banim_mcd_ax1_2_oam_frame_2_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 16, banim_mcd_ax1_2_sheet_0, 3, banim_mcd_ax1_2_oam_frame_3_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mcd_ax1_2_sheet_0, 4, banim_mcd_ax1_2_oam_frame_4_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_1, 5, banim_mcd_ax1_2_oam_frame_5_r - banim_mcd_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 6, banim_mcd_ax1_2_oam_frame_6_r - banim_mcd_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_mcd_ax1_2_sheet_1, 7, banim_mcd_ax1_2_oam_frame_7_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 6, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 4, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 16, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 6, banim_mcd_ax1_2_sheet_0, 1, banim_mcd_ax1_2_oam_frame_1_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 4, banim_mcd_ax1_2_sheet_0, 2, banim_mcd_ax1_2_oam_frame_2_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 8, banim_mcd_ax1_2_oam_frame_10_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 9, banim_mcd_ax1_2_oam_frame_11_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 10, banim_mcd_ax1_2_oam_frame_12_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 11, banim_mcd_ax1_2_oam_frame_13_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 8, banim_mcd_ax1_2_oam_frame_10_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 9, banim_mcd_ax1_2_oam_frame_11_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 10, banim_mcd_ax1_2_oam_frame_12_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 16, banim_mcd_ax1_2_sheet_0, 3, banim_mcd_ax1_2_oam_frame_3_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mcd_ax1_2_sheet_0, 4, banim_mcd_ax1_2_oam_frame_4_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_1, 5, banim_mcd_ax1_2_oam_frame_5_r - banim_mcd_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 6, banim_mcd_ax1_2_oam_frame_6_r - banim_mcd_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_mcd_ax1_2_sheet_1, 7, banim_mcd_ax1_2_oam_frame_7_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 6, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 4, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 16, banim_mcd_ax1_2_oam_frame_14_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 16, banim_mcd_ax1_2_oam_frame_14_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 16, banim_mcd_ax1_2_oam_frame_14_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 16, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_mcd_ax1_2_sheet_1, 15, banim_mcd_ax1_2_oam_frame_9_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 14, banim_mcd_ax1_2_oam_frame_8_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 6, banim_mcd_ax1_2_sheet_0, 1, banim_mcd_ax1_2_oam_frame_1_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 4, banim_mcd_ax1_2_sheet_0, 2, banim_mcd_ax1_2_oam_frame_2_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 16, banim_mcd_ax1_2_sheet_0, 3, banim_mcd_ax1_2_oam_frame_3_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mcd_ax1_2_sheet_0, 4, banim_mcd_ax1_2_oam_frame_4_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_1, 5, banim_mcd_ax1_2_oam_frame_5_r - banim_mcd_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 6, banim_mcd_ax1_2_oam_frame_6_r - banim_mcd_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_mcd_ax1_2_sheet_1, 7, banim_mcd_ax1_2_oam_frame_7_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 6, banim_mcd_ax1_2_sheet_0, 1, banim_mcd_ax1_2_oam_frame_1_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 4, banim_mcd_ax1_2_sheet_0, 2, banim_mcd_ax1_2_oam_frame_2_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 8, banim_mcd_ax1_2_oam_frame_10_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 9, banim_mcd_ax1_2_oam_frame_11_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 10, banim_mcd_ax1_2_oam_frame_12_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 11, banim_mcd_ax1_2_oam_frame_13_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 8, banim_mcd_ax1_2_oam_frame_10_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 9, banim_mcd_ax1_2_oam_frame_11_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 10, banim_mcd_ax1_2_oam_frame_12_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 16, banim_mcd_ax1_2_sheet_0, 3, banim_mcd_ax1_2_oam_frame_3_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mcd_ax1_2_sheet_0, 4, banim_mcd_ax1_2_oam_frame_4_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_1, 5, banim_mcd_ax1_2_oam_frame_5_r - banim_mcd_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 6, banim_mcd_ax1_2_oam_frame_6_r - banim_mcd_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_mcd_ax1_2_sheet_1, 7, banim_mcd_ax1_2_oam_frame_7_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 12, banim_mcd_ax1_2_oam_frame_15_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_2, 13, banim_mcd_ax1_2_oam_frame_16_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 12, banim_mcd_ax1_2_oam_frame_15_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 12, banim_mcd_ax1_2_oam_frame_15_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_2, 13, banim_mcd_ax1_2_oam_frame_16_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_mcd_ax1_2_sheet_2, 12, banim_mcd_ax1_2_oam_frame_15_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_2_mode_stand_close:
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_2_mode_stand:
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_2_mode_stand_range:
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 6, banim_mcd_ax1_2_sheet_0, 1, banim_mcd_ax1_2_oam_frame_1_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 4, banim_mcd_ax1_2_sheet_0, 2, banim_mcd_ax1_2_oam_frame_2_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 16, banim_mcd_ax1_2_sheet_0, 3, banim_mcd_ax1_2_oam_frame_3_r - banim_mcd_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mcd_ax1_2_sheet_0, 4, banim_mcd_ax1_2_oam_frame_4_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_1, 5, banim_mcd_ax1_2_oam_frame_5_r - banim_mcd_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_mcd_ax1_2_sheet_1, 6, banim_mcd_ax1_2_oam_frame_6_r - banim_mcd_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_mcd_ax1_2_sheet_1, 7, banim_mcd_ax1_2_oam_frame_7_r - banim_mcd_ax1_2_oam_r
	banim_code_frame 1, banim_mcd_ax1_2_sheet_0, 0, banim_mcd_ax1_2_oam_frame_0_r - banim_mcd_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_mcd_ax1_2_mode_attack_close - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_attack_close_back - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_attack_close_critical - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_attack_close_critical_back - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_attack_range - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_attack_range_critical - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_dodge_close - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_dodge_range - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_stand_close - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_stand - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_stand_range - banim_mcd_ax1_2_script
	.word banim_mcd_ax1_2_mode_attack_miss - banim_mcd_ax1_2_script
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

