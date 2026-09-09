@ vim:ft=armv4
	.global banim_fakf_sp1_3_script
	.global banim_fakf_sp1_3_oam_r
	.global banim_fakf_sp1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x69
	.section .data.oam_l
banim_fakf_sp1_3_oam_l:
banim_fakf_sp1_3_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0xBB, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0xFB, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x0, 8, -48
	banim_frame_oam 0x8000, 0x1000, 0x80, 8, -16
	banim_frame_oam 0x4000, 0x5000, 0xA1, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xA5, -32, -8
	banim_frame_oam 0x0, 0x5000, 0xC1, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC3, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 8
	banim_frame_oam 0x8000, 0x9000, 0x3, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x5, -32, -48
	banim_frame_oam 0x4000, 0x1000, 0x83, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x85, -32, -16
	banim_frame_oam 0x0, 0x5000, 0x1, -8, -48
	banim_frame_oam 0x0, 0x5000, 0x6, -2, -64
	banim_frame_oam 0x4000, 0x5000, 0x28, -34, -56
	banim_frame_oam 0x4000, 0x1000, 0x9, -26, -64
	banim_frame_oam 0x0, 0x1000, 0xB, -34, -64
	banim_frame_oam 0x0, 0x1000, 0x8, -24, -72
	banim_frame_oam 0x0, 0x1000, 0xC0, 16, -13
	banim_frame_end
banim_fakf_sp1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xAF, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0xEF, -8, -16
	banim_frame_oam 0x0, 0x9000, 0x89, -17, -32
	banim_frame_oam 0x8000, 0x9000, 0x8D, -33, -32
	banim_frame_oam 0x4000, 0x9000, 0x4B, -33, -48
	banim_frame_oam 0x8000, 0x9000, 0x9, -1, -64
	banim_frame_oam 0x0, 0x5000, 0xB, -25, -64
	banim_frame_oam 0x8000, 0x1000, 0xD, -33, -64
	banim_frame_oam 0x0, 0x1000, 0x2E, -9, -56
	banim_frame_oam 0x0, 0x1000, 0x88, -23, -72
	banim_frame_oam 0x4000, 0x1000, 0xE, -17, 0
	banim_frame_oam 0x8000, 0x1000, 0x8, -1, 0
	banim_frame_oam 0x0, 0x1000, 0x48, 15, -33
	banim_frame_oam 0x0, 0x1000, 0x68, 15, -12
	banim_frame_oam 0x4000, 0x1000, 0xE4, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -16, 8
	banim_frame_end
banim_fakf_sp1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x4F, -9, -32
	banim_frame_oam 0x4000, 0x1000, 0x8F, -9, -16
	banim_frame_oam 0x4000, 0x1000, 0xF1, -17, -1
	banim_frame_oam 0x0, 0x5000, 0xB1, -31, -17
	banim_frame_oam 0x8000, 0x1000, 0xD3, -1, -1
	banim_frame_oam 0x8000, 0x1000, 0xD4, -23, -33
	banim_frame_oam 0x4000, 0x9000, 0x93, -31, -49
	banim_frame_oam 0x0, 0x5000, 0xD5, -23, -65
	banim_frame_oam 0x8000, 0x1000, 0xD7, -31, -65
	banim_frame_oam 0x0, 0x1000, 0xB7, -7, -57
	banim_frame_oam 0x0, 0x1000, 0x73, -18, -73
	banim_frame_oam 0x0, 0x1000, 0x74, 17, -10
	banim_frame_oam 0x0, 0x1000, 0x54, -31, -25
	banim_frame_oam 0x0, 0x9000, 0x15, -15, -33
	banim_frame_oam 0x8000, 0x9000, 0x19, 1, -65
	banim_frame_oam 0x4000, 0x1000, 0xE4, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -16, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_fakf_sp1_3_oam_r:
banim_fakf_sp1_3_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0xBB, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xFB, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x0, -16, -48
	banim_frame_oam 0x8000, 0x0, 0x80, -16, -16
	banim_frame_oam 0x4000, 0x4000, 0xA1, -8, -8
	banim_frame_oam 0x0, 0x0, 0xA5, 24, -8
	banim_frame_oam 0x0, 0x4000, 0xC1, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xC3, 8, 0
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 8
	banim_frame_oam 0x8000, 0x8000, 0x3, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x5, 24, -48
	banim_frame_oam 0x4000, 0x0, 0x83, 8, -16
	banim_frame_oam 0x0, 0x0, 0x85, 24, -16
	banim_frame_oam 0x0, 0x4000, 0x1, -8, -48
	banim_frame_oam 0x0, 0x4000, 0x6, -14, -64
	banim_frame_oam 0x4000, 0x4000, 0x28, 2, -56
	banim_frame_oam 0x4000, 0x0, 0x9, 10, -64
	banim_frame_oam 0x0, 0x0, 0xB, 26, -64
	banim_frame_oam 0x0, 0x0, 0x8, 16, -72
	banim_frame_oam 0x0, 0x0, 0xC0, -24, -13
	banim_frame_end
banim_fakf_sp1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xAF, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xEF, -8, -16
	banim_frame_oam 0x0, 0x8000, 0x89, -15, -32
	banim_frame_oam 0x8000, 0x8000, 0x8D, 17, -32
	banim_frame_oam 0x4000, 0x8000, 0x4B, 1, -48
	banim_frame_oam 0x8000, 0x8000, 0x9, -15, -64
	banim_frame_oam 0x0, 0x4000, 0xB, 9, -64
	banim_frame_oam 0x8000, 0x0, 0xD, 25, -64
	banim_frame_oam 0x0, 0x0, 0x2E, 1, -56
	banim_frame_oam 0x0, 0x0, 0x88, 15, -72
	banim_frame_oam 0x4000, 0x0, 0xE, 1, 0
	banim_frame_oam 0x8000, 0x0, 0x8, -7, 0
	banim_frame_oam 0x0, 0x0, 0x48, -23, -33
	banim_frame_oam 0x0, 0x0, 0x68, -23, -12
	banim_frame_oam 0x4000, 0x0, 0xE4, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 8, 8
	banim_frame_end
banim_fakf_sp1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x4F, -7, -32
	banim_frame_oam 0x4000, 0x0, 0x8F, -7, -16
	banim_frame_oam 0x4000, 0x0, 0xF1, 1, -1
	banim_frame_oam 0x0, 0x4000, 0xB1, 15, -17
	banim_frame_oam 0x8000, 0x0, 0xD3, -7, -1
	banim_frame_oam 0x8000, 0x0, 0xD4, 15, -33
	banim_frame_oam 0x4000, 0x8000, 0x93, -1, -49
	banim_frame_oam 0x0, 0x4000, 0xD5, 7, -65
	banim_frame_oam 0x8000, 0x0, 0xD7, 23, -65
	banim_frame_oam 0x0, 0x0, 0xB7, -1, -57
	banim_frame_oam 0x0, 0x0, 0x73, 10, -73
	banim_frame_oam 0x0, 0x0, 0x74, -25, -10
	banim_frame_oam 0x0, 0x0, 0x54, 23, -25
	banim_frame_oam 0x0, 0x8000, 0x15, -17, -33
	banim_frame_oam 0x8000, 0x8000, 0x19, -17, -65
	banim_frame_oam 0x4000, 0x0, 0xE4, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 8, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_fakf_sp1_3_script:
banim_fakf_sp1_3_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 2, banim_fakf_sp1_3_oam_frame_1_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_3_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 2, banim_fakf_sp1_3_oam_frame_1_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_3_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 2, banim_fakf_sp1_3_oam_frame_1_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_3_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 2, banim_fakf_sp1_3_oam_frame_1_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_3_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 2, banim_fakf_sp1_3_oam_frame_1_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_3_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 2, banim_fakf_sp1_3_oam_frame_1_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 2, banim_fakf_sp1_3_oam_frame_1_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 2, banim_fakf_sp1_3_oam_frame_1_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_3_mode_stand_close:
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_fakf_sp1_3_mode_stand:
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_fakf_sp1_3_mode_stand_range:
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_fakf_sp1_3_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_3_oam_frame_2_r - banim_fakf_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 2, banim_fakf_sp1_3_oam_frame_1_r - banim_fakf_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 1, banim_fakf_sp1_3_oam_frame_0_r - banim_fakf_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_fakf_sp1_3_mode_attack_close - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_attack_close_back - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_attack_close_critical - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_attack_close_critical_back - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_attack_range - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_attack_range_critical - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_dodge_close - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_dodge_range - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_stand_close - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_stand - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_stand_range - banim_fakf_sp1_3_script
	.word banim_fakf_sp1_3_mode_attack_miss - banim_fakf_sp1_3_script
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

