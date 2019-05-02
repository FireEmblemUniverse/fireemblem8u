@ vim:ft=armv4
	.global banim_lomm_sp1_2_script
	.global banim_lomm_sp1_2_oam_r
	.global banim_lomm_sp1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x6
	.section .data.oam_l
banim_lomm_sp1_2_oam_l:
banim_lomm_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0xDC, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xBC, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x9F, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xBE, -16, -40
	banim_frame_end
banim_lomm_sp1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x32, 0, -32
	banim_frame_oam 0x0, 0x5000, 0xB2, 0, 0
	banim_frame_oam 0x0, 0x9000, 0x1C, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x9C, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xDC, -32, 8
	banim_frame_end
banim_lomm_sp1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x60, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x62, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x41, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x27, -24, -40
	banim_frame_oam 0x0, 0x5000, 0xA7, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xE7, -24, 8
	banim_frame_end
banim_lomm_sp1_2_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x69, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x6B, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x31, -24, -40
	banim_frame_oam 0x0, 0x5000, 0xB1, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -24, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_lomm_sp1_2_oam_r:
banim_lomm_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0xDC, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xBC, 16, -24
	banim_frame_oam 0x0, 0x0, 0x9F, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xBE, 0, -40
	banim_frame_end
banim_lomm_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x32, -16, -32
	banim_frame_oam 0x0, 0x4000, 0xB2, -16, 0
	banim_frame_oam 0x0, 0x8000, 0x1C, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x9C, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xDC, 0, 8
	banim_frame_end
banim_lomm_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x60, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x62, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE2, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x41, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x27, 8, -40
	banim_frame_oam 0x0, 0x4000, 0xA7, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xE7, 8, 8
	banim_frame_end
banim_lomm_sp1_2_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x69, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x6B, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x4A, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x31, 8, -40
	banim_frame_oam 0x0, 0x4000, 0xB1, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xF1, 8, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_lomm_sp1_2_script:
banim_lomm_sp1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 3, banim_lomm_sp1_2_oam_frame_3_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 3, banim_lomm_sp1_2_oam_frame_3_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 3, banim_lomm_sp1_2_oam_frame_3_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 3, banim_lomm_sp1_2_oam_frame_3_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 3, banim_lomm_sp1_2_oam_frame_3_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 3, banim_lomm_sp1_2_oam_frame_3_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 3, banim_lomm_sp1_2_oam_frame_3_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 3, banim_lomm_sp1_2_oam_frame_3_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_2_mode_stand_close:
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomm_sp1_2_mode_stand:
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomm_sp1_2_mode_stand_range:
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomm_sp1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 3, banim_lomm_sp1_2_oam_frame_3_r - banim_lomm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 2, banim_lomm_sp1_2_oam_frame_2_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 1, banim_lomm_sp1_2_oam_frame_1_r - banim_lomm_sp1_2_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 0, banim_lomm_sp1_2_oam_frame_0_r - banim_lomm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_lomm_sp1_2_mode_attack_close - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_attack_close_back - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_attack_close_critical - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_attack_close_critical_back - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_attack_range - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_attack_range_critical - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_dodge_close - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_dodge_range - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_stand_close - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_stand - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_stand_range - banim_lomm_sp1_2_script
	.word banim_lomm_sp1_2_mode_attack_miss - banim_lomm_sp1_2_script
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

