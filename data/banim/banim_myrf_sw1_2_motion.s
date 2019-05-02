@ vim:ft=armv4
	.global banim_myrf_sw1_2_script
	.global banim_myrf_sw1_2_oam_r
	.global banim_myrf_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x13
	.section .data.oam_l
banim_myrf_sw1_2_oam_l:
banim_myrf_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -5, -21
	banim_frame_oam 0x4000, 0x1000, 0x20, -12, -13
	banim_frame_oam 0x4000, 0x1000, 0x40, -5, -5
	banim_frame_oam 0x0, 0x5000, 0x60, -5, 3
	banim_frame_oam 0x0, 0x5000, 0x3E, -21, 3
	banim_frame_oam 0x0, 0x1000, 0x7F, -13, -21
	banim_frame_oam 0x0, 0x1000, 0xFF, 4, -13
	banim_frame_oam 0x0, 0x1000, 0xDF, -13, -5
	banim_frame_end
banim_myrf_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x8D, -6, -16
	banim_frame_oam 0x0, 0x5000, 0x95, -22, -16
	banim_frame_oam 0x4000, 0x1000, 0xD5, -22, 0
	banim_frame_oam 0x4000, 0x1000, 0xEF, -22, 8
	banim_frame_end
banim_myrf_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x5000, 0x91, -6, -17
	banim_frame_oam 0x8000, 0x1000, 0x92, -14, -17
	banim_frame_oam 0x4000, 0x1000, 0xF2, -22, 7
	banim_frame_oam 0x0, 0x1000, 0xF4, -30, 7
	banim_frame_oam 0x0, 0x5000, 0x97, -30, -17
	banim_frame_oam 0x4000, 0x1000, 0xF5, -22, -1
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_myrf_sw1_2_oam_r:
banim_myrf_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x0, 0x0, -3, -21
	banim_frame_oam 0x4000, 0x0, 0x20, -4, -13
	banim_frame_oam 0x4000, 0x0, 0x40, -11, -5
	banim_frame_oam 0x0, 0x4000, 0x60, -11, 3
	banim_frame_oam 0x0, 0x4000, 0x3E, 5, 3
	banim_frame_oam 0x0, 0x0, 0x7F, 5, -21
	banim_frame_oam 0x0, 0x0, 0xFF, -12, -13
	banim_frame_oam 0x0, 0x0, 0xDF, 5, -5
	banim_frame_end
banim_myrf_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x8D, -10, -16
	banim_frame_oam 0x0, 0x4000, 0x95, 6, -16
	banim_frame_oam 0x4000, 0x0, 0xD5, 6, 0
	banim_frame_oam 0x4000, 0x0, 0xEF, 6, 8
	banim_frame_end
banim_myrf_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x4000, 0x91, -2, -17
	banim_frame_oam 0x8000, 0x0, 0x92, 6, -17
	banim_frame_oam 0x4000, 0x0, 0xF2, 6, 7
	banim_frame_oam 0x0, 0x0, 0xF4, 22, 7
	banim_frame_oam 0x0, 0x4000, 0x97, 14, -17
	banim_frame_oam 0x4000, 0x0, 0xF5, 6, -1
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_myrf_sw1_2_script:
banim_myrf_sw1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_frame 1, banim_myrf_sw1_sheet_1, 2, banim_myrf_sw1_2_oam_frame_2_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrf_sw1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_frame 1, banim_myrf_sw1_sheet_1, 2, banim_myrf_sw1_2_oam_frame_2_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrf_sw1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_frame 1, banim_myrf_sw1_sheet_1, 2, banim_myrf_sw1_2_oam_frame_2_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrf_sw1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_frame 1, banim_myrf_sw1_sheet_1, 2, banim_myrf_sw1_2_oam_frame_2_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrf_sw1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_frame 1, banim_myrf_sw1_sheet_1, 2, banim_myrf_sw1_2_oam_frame_2_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrf_sw1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_frame 1, banim_myrf_sw1_sheet_1, 2, banim_myrf_sw1_2_oam_frame_2_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrf_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_frame 1, banim_myrf_sw1_sheet_1, 2, banim_myrf_sw1_2_oam_frame_2_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrf_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_frame 1, banim_myrf_sw1_sheet_1, 2, banim_myrf_sw1_2_oam_frame_2_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_myrf_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_myrf_sw1_2_mode_stand:
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_myrf_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_myrf_sw1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_myrf_sw1_sheet_0, 0, banim_myrf_sw1_2_oam_frame_0_r - banim_myrf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_frame 1, banim_myrf_sw1_sheet_1, 2, banim_myrf_sw1_2_oam_frame_2_r - banim_myrf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_myrf_sw1_sheet_1, 1, banim_myrf_sw1_2_oam_frame_1_r - banim_myrf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_myrf_sw1_2_mode_attack_close - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_attack_close_back - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_attack_close_critical - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_attack_close_critical_back - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_attack_range - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_attack_range_critical - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_dodge_close - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_dodge_range - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_stand_close - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_stand - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_stand_range - banim_myrf_sw1_2_script
	.word banim_myrf_sw1_2_mode_attack_miss - banim_myrf_sw1_2_script
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

