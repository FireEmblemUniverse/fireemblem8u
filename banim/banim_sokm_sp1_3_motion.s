@ vim:ft=armv4
	.global banim_sokm_sp1_3_script
	.global banim_sokm_sp1_3_oam_r
	.global banim_sokm_sp1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x35
	.section .data.oam_l
banim_sokm_sp1_3_oam_l:
banim_sokm_sp1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x7, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0x47, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x26, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_end
banim_sokm_sp1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -23, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -23, 8
	banim_frame_oam 0x8000, 0x9000, 0x30, -39, -16
	banim_frame_oam 0x4000, 0x1000, 0x10, -21, -32
	banim_frame_oam 0x8000, 0x1000, 0x65, 9, -24
	banim_frame_end
banim_sokm_sp1_3_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -27, -32
	banim_frame_oam 0x8000, 0x5000, 0x16, -35, -32
	banim_frame_oam 0x4000, 0x1000, 0x94, -27, 0
	banim_frame_oam 0x0, 0x1000, 0x96, -35, 0
	banim_frame_oam 0x4000, 0x5000, 0xB2, -27, 8
	banim_frame_oam 0x0, 0x1000, 0xB6, -35, 8
	banim_frame_oam 0x8000, 0x1000, 0xC8, -43, -6
	banim_frame_oam 0x0, 0x1000, 0x93, 5, -30
	banim_frame_oam 0x0, 0x1000, 0x92, -20, -40
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_sokm_sp1_3_oam_r:
banim_sokm_sp1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x7, 0, -32
	banim_frame_oam 0x4000, 0x0, 0x47, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x26, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_end
banim_sokm_sp1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -9, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -9, 8
	banim_frame_oam 0x8000, 0x8000, 0x30, 23, -16
	banim_frame_oam 0x4000, 0x0, 0x10, 5, -32
	banim_frame_oam 0x8000, 0x0, 0x65, -17, -24
	banim_frame_end
banim_sokm_sp1_3_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -5, -32
	banim_frame_oam 0x8000, 0x4000, 0x16, 27, -32
	banim_frame_oam 0x4000, 0x0, 0x94, 11, 0
	banim_frame_oam 0x0, 0x0, 0x96, 27, 0
	banim_frame_oam 0x4000, 0x4000, 0xB2, -5, 8
	banim_frame_oam 0x0, 0x0, 0xB6, 27, 8
	banim_frame_oam 0x8000, 0x0, 0xC8, 35, -6
	banim_frame_oam 0x0, 0x0, 0x93, -13, -30
	banim_frame_oam 0x0, 0x0, 0x92, 12, -40
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_sokm_sp1_3_script:
banim_sokm_sp1_3_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 2, banim_sokm_sp1_3_oam_frame_2_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_3_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 2, banim_sokm_sp1_3_oam_frame_2_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_3_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 2, banim_sokm_sp1_3_oam_frame_2_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_3_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 2, banim_sokm_sp1_3_oam_frame_2_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_3_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 2, banim_sokm_sp1_3_oam_frame_2_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_3_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 2, banim_sokm_sp1_3_oam_frame_2_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 2, banim_sokm_sp1_3_oam_frame_2_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 2, banim_sokm_sp1_3_oam_frame_2_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_3_mode_stand_close:
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sokm_sp1_3_mode_stand:
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sokm_sp1_3_mode_stand_range:
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sokm_sp1_3_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_3_oam_frame_0_r - banim_sokm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 2, banim_sokm_sp1_3_oam_frame_2_r - banim_sokm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 1, banim_sokm_sp1_3_oam_frame_1_r - banim_sokm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_sokm_sp1_3_mode_attack_close - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_attack_close_back - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_attack_close_critical - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_attack_close_critical_back - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_attack_range - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_attack_range_critical - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_dodge_close - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_dodge_range - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_stand_close - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_stand - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_stand_range - banim_sokm_sp1_3_script
	.word banim_sokm_sp1_3_mode_attack_miss - banim_sokm_sp1_3_script
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

