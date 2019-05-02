@ vim:ft=armv4
	.global banim_drkm_sp1_4_script
	.global banim_drkm_sp1_4_oam_r
	.global banim_drkm_sp1_4_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x5A
	.section .data.oam_l
banim_drkm_sp1_4_oam_l:
banim_drkm_sp1_4_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -16
	banim_frame_oam 0x0, 0x5000, 0x41, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x43, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x40, -40, 0
	banim_frame_oam 0x8000, 0x1000, 0x26, -32, -8
	banim_frame_oam 0x0, 0x1000, 0x66, -32, 8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0xC4, -32, -40
	banim_frame_oam 0x0, 0x1000, 0xC6, -40, -40
	banim_frame_oam 0x4000, 0x5000, 0xA0, -17, -48
	banim_frame_oam 0x4000, 0x1000, 0xA4, -33, -48
	banim_frame_oam 0x4000, 0x1000, 0x80, -7, -56
	banim_frame_oam 0x4000, 0x1000, 0x82, -31, -56
	banim_frame_oam 0x0, 0x1000, 0x84, -39, -56
	banim_frame_oam 0x4000, 0x1000, 0x85, -42, -64
	banim_frame_oam 0x0, 0x1000, 0xE5, -7, -64
	banim_frame_oam 0x4000, 0x1000, 0x6, -56, 0
	banim_frame_oam 0x0, 0x1000, 0x8, -64, -3
	banim_frame_oam 0x0, 0x1000, 0xEA, -32, -24
	banim_frame_oam 0x0, 0x1000, 0xE4, -32, -32
	banim_frame_oam 0x0, 0x5000, 0xA7, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xC9, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0xE2, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xE8, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x22, 0, -8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x23, -8, -8
	banim_frame_end
banim_drkm_sp1_4_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x1000, 0x0, -22, -72
	banim_frame_oam 0x4000, 0x5000, 0x20, -37, -64
	banim_frame_oam 0x0, 0x1000, 0x24, -45, -64
	banim_frame_oam 0x4000, 0x9000, 0x40, -30, -56
	banim_frame_oam 0x0, 0x5000, 0x44, -46, -56
	banim_frame_oam 0x4000, 0x9000, 0x80, -14, -40
	banim_frame_oam 0x4000, 0x9000, 0x84, -46, -40
	banim_frame_oam 0x4000, 0x5000, 0xC0, -14, -24
	banim_frame_oam 0x4000, 0x5000, 0xC4, -46, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 2, -16
	banim_frame_oam 0x4000, 0x5000, 0xE2, -38, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, -33, -8
	banim_frame_oam 0x0, 0x1000, 0x25, -34, 0
	banim_frame_oam 0x4000, 0x1000, 0x2, 2, -8
	banim_frame_oam 0x8000, 0x1000, 0x6, 18, -24
	banim_frame_oam 0x0, 0x1000, 0x46, 18, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, -13, 8
	banim_frame_oam 0x4000, 0x0, 0xE6, -29, 8
	banim_frame_end
banim_drkm_sp1_4_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0x36, -38, -66
	banim_frame_oam 0x4000, 0x1000, 0x16, -22, -74
	banim_frame_oam 0x0, 0x1000, 0x18, -30, -74
	banim_frame_oam 0x0, 0x1000, 0x3A, -46, -66
	banim_frame_oam 0x4000, 0x9000, 0x56, -30, -58
	banim_frame_oam 0x0, 0x5000, 0x5A, -46, -58
	banim_frame_oam 0x4000, 0x1000, 0x19, -46, -42
	banim_frame_oam 0x4000, 0x1000, 0x1B, -46, -34
	banim_frame_oam 0x0, 0x1000, 0x3B, -46, -26
	banim_frame_oam 0x4000, 0x1000, 0xF7, -30, -18
	banim_frame_oam 0x0, 0x1000, 0xF9, -38, -18
	banim_frame_oam 0x4000, 0x1000, 0xF5, -38, -10
	banim_frame_oam 0x4000, 0x9000, 0x96, -14, -42
	banim_frame_oam 0x0, 0x5000, 0x9A, -30, -42
	banim_frame_oam 0x4000, 0x5000, 0xD5, -14, -26
	banim_frame_oam 0x4000, 0x1000, 0xF3, -1, -18
	banim_frame_oam 0x0, 0x1000, 0xD4, 5, -10
	banim_frame_oam 0x4000, 0x1000, 0xD9, -30, -26
	banim_frame_oam 0x0, 0x1000, 0xDB, -38, -26
	banim_frame_oam 0x4000, 0x0, 0xFA, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xFA, -16, 8
	banim_frame_end
banim_drkm_sp1_4_oam_frame_3_l:
	banim_frame_end
banim_drkm_sp1_4_oam_frame_5_l:
	banim_frame_end
banim_drkm_sp1_4_oam_frame_4_l:
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_drkm_sp1_4_oam_r:
banim_drkm_sp1_4_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x41, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x43, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x40, 32, 0
	banim_frame_oam 0x8000, 0x0, 0x26, 24, -8
	banim_frame_oam 0x0, 0x0, 0x66, 24, 8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -16, -40
	banim_frame_oam 0x4000, 0x0, 0xC4, 16, -40
	banim_frame_oam 0x0, 0x0, 0xC6, 32, -40
	banim_frame_oam 0x4000, 0x4000, 0xA0, -15, -48
	banim_frame_oam 0x4000, 0x0, 0xA4, 17, -48
	banim_frame_oam 0x4000, 0x0, 0x80, -9, -56
	banim_frame_oam 0x4000, 0x0, 0x82, 15, -56
	banim_frame_oam 0x0, 0x0, 0x84, 31, -56
	banim_frame_oam 0x4000, 0x0, 0x85, 26, -64
	banim_frame_oam 0x0, 0x0, 0xE5, -1, -64
	banim_frame_oam 0x4000, 0x0, 0x6, 40, 0
	banim_frame_oam 0x0, 0x0, 0x8, 56, -3
	banim_frame_oam 0x0, 0x0, 0xEA, 24, -24
	banim_frame_oam 0x0, 0x0, 0xE4, 24, -32
	banim_frame_oam 0x0, 0x4000, 0xA7, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xC9, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xE2, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xE8, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -24, -8
	banim_frame_oam 0x0, 0x0, 0x22, -8, -8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -16
	banim_frame_oam 0x0, 0x0, 0x23, 0, -8
	banim_frame_end
banim_drkm_sp1_4_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x0, 0x0, 6, -72
	banim_frame_oam 0x4000, 0x4000, 0x20, 5, -64
	banim_frame_oam 0x0, 0x0, 0x24, 37, -64
	banim_frame_oam 0x4000, 0x8000, 0x40, -2, -56
	banim_frame_oam 0x0, 0x4000, 0x44, 30, -56
	banim_frame_oam 0x4000, 0x8000, 0x80, -18, -40
	banim_frame_oam 0x4000, 0x8000, 0x84, 14, -40
	banim_frame_oam 0x4000, 0x4000, 0xC0, -18, -24
	banim_frame_oam 0x4000, 0x4000, 0xC4, 14, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -18, -16
	banim_frame_oam 0x4000, 0x4000, 0xE2, 6, -16
	banim_frame_oam 0x4000, 0x0, 0x4, 17, -8
	banim_frame_oam 0x0, 0x0, 0x25, 26, 0
	banim_frame_oam 0x4000, 0x0, 0x2, -18, -8
	banim_frame_oam 0x8000, 0x0, 0x6, -26, -24
	banim_frame_oam 0x0, 0x0, 0x46, -26, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -3, 8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 13, 8
	banim_frame_end
banim_drkm_sp1_4_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0x36, 6, -66
	banim_frame_oam 0x4000, 0x0, 0x16, 6, -74
	banim_frame_oam 0x0, 0x0, 0x18, 22, -74
	banim_frame_oam 0x0, 0x0, 0x3A, 38, -66
	banim_frame_oam 0x4000, 0x8000, 0x56, -2, -58
	banim_frame_oam 0x0, 0x4000, 0x5A, 30, -58
	banim_frame_oam 0x4000, 0x0, 0x19, 30, -42
	banim_frame_oam 0x4000, 0x0, 0x1B, 30, -34
	banim_frame_oam 0x0, 0x0, 0x3B, 38, -26
	banim_frame_oam 0x4000, 0x0, 0xF7, 14, -18
	banim_frame_oam 0x0, 0x0, 0xF9, 30, -18
	banim_frame_oam 0x4000, 0x0, 0xF5, 22, -10
	banim_frame_oam 0x4000, 0x8000, 0x96, -18, -42
	banim_frame_oam 0x0, 0x4000, 0x9A, 14, -42
	banim_frame_oam 0x4000, 0x4000, 0xD5, -18, -26
	banim_frame_oam 0x4000, 0x0, 0xF3, -15, -18
	banim_frame_oam 0x0, 0x0, 0xD4, -13, -10
	banim_frame_oam 0x4000, 0x0, 0xD9, 14, -26
	banim_frame_oam 0x0, 0x0, 0xDB, 30, -26
	banim_frame_oam 0x4000, 0x1000, 0xFA, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xFA, 0, 8
	banim_frame_end
banim_drkm_sp1_4_oam_frame_3_r:
	banim_frame_end
banim_drkm_sp1_4_oam_frame_5_r:
	banim_frame_end
banim_drkm_sp1_4_oam_frame_4_r:
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_drkm_sp1_4_script:
banim_drkm_sp1_4_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_frame 1, banim_drkm_sp1_sheet_4, 2, banim_drkm_sp1_4_oam_frame_2_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drkm_sp1_4_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 3, banim_drkm_sp1_4_oam_frame_3_r - banim_drkm_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drkm_sp1_sheet_0, 5, banim_drkm_sp1_4_oam_frame_4_r - banim_drkm_sp1_4_oam_r
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 4, banim_drkm_sp1_4_oam_frame_5_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drkm_sp1_sheet_0, 5, banim_drkm_sp1_4_oam_frame_4_r - banim_drkm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drkm_sp1_4_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_frame 1, banim_drkm_sp1_sheet_4, 2, banim_drkm_sp1_4_oam_frame_2_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drkm_sp1_4_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 3, banim_drkm_sp1_4_oam_frame_3_r - banim_drkm_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drkm_sp1_sheet_0, 5, banim_drkm_sp1_4_oam_frame_4_r - banim_drkm_sp1_4_oam_r
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 4, banim_drkm_sp1_4_oam_frame_5_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drkm_sp1_sheet_0, 5, banim_drkm_sp1_4_oam_frame_4_r - banim_drkm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drkm_sp1_4_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_frame 1, banim_drkm_sp1_sheet_4, 2, banim_drkm_sp1_4_oam_frame_2_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drkm_sp1_4_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_frame 1, banim_drkm_sp1_sheet_4, 2, banim_drkm_sp1_4_oam_frame_2_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drkm_sp1_4_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_frame 1, banim_drkm_sp1_sheet_4, 2, banim_drkm_sp1_4_oam_frame_2_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drkm_sp1_4_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_frame 1, banim_drkm_sp1_sheet_4, 2, banim_drkm_sp1_4_oam_frame_2_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drkm_sp1_4_mode_stand_close:
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drkm_sp1_4_mode_stand:
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drkm_sp1_4_mode_stand_range:
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drkm_sp1_4_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drkm_sp1_sheet_0, 0, banim_drkm_sp1_4_oam_frame_0_r - banim_drkm_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_frame 1, banim_drkm_sp1_sheet_4, 2, banim_drkm_sp1_4_oam_frame_2_r - banim_drkm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drkm_sp1_sheet_5, 1, banim_drkm_sp1_4_oam_frame_1_r - banim_drkm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_drkm_sp1_4_mode_attack_close - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_attack_close_back - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_attack_close_critical - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_attack_close_critical_back - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_attack_range - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_attack_range_critical - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_dodge_close - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_dodge_range - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_stand_close - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_stand - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_stand_range - banim_drkm_sp1_4_script
	.word banim_drkm_sp1_4_mode_attack_miss - banim_drkm_sp1_4_script
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

