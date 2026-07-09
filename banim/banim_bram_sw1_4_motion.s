@ vim:ft=armv4
	.global banim_bram_sw1_4_script
	.global banim_bram_sw1_4_oam_r
	.global banim_bram_sw1_4_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xF
	.section .data.oam_l
banim_bram_sw1_4_oam_l:
banim_bram_sw1_4_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -17, -10
	banim_frame_oam 0x4000, 0x1000, 0x5D, -17, 6
	banim_frame_oam 0x8000, 0x9000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_end
banim_bram_sw1_4_oam_frame_1_l:
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
banim_bram_sw1_4_oam_frame_2_l:
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
	.section .data.oam_r
banim_bram_sw1_4_oam_r:
banim_bram_sw1_4_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, 1, -10
	banim_frame_oam 0x4000, 0x0, 0x5D, 1, 6
	banim_frame_oam 0x8000, 0x8000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_4_oam_frame_1_r:
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
banim_bram_sw1_4_oam_frame_2_r:
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
	.section .data.script
banim_bram_sw1_4_script:
banim_bram_sw1_4_mode_attack_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 2, banim_bram_sw1_4_oam_frame_2_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_4_mode_attack_close_back:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 2, banim_bram_sw1_4_oam_frame_2_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_4_mode_attack_close_critical:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 2, banim_bram_sw1_4_oam_frame_2_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_4_mode_attack_close_critical_back:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 2, banim_bram_sw1_4_oam_frame_2_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_4_mode_attack_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 2, banim_bram_sw1_4_oam_frame_2_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_4_mode_attack_range_critical:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 2, banim_bram_sw1_4_oam_frame_2_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_4_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 2, banim_bram_sw1_4_oam_frame_2_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_4_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 2, banim_bram_sw1_4_oam_frame_2_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_4_mode_stand_close:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_4_mode_stand:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_4_mode_stand_range:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_4_mode_attack_miss:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_4_oam_frame_0_r - banim_bram_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 2, banim_bram_sw1_4_oam_frame_2_r - banim_bram_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 1, banim_bram_sw1_4_oam_frame_1_r - banim_bram_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bram_sw1_4_mode_attack_close - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_attack_close_back - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_attack_close_critical - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_attack_close_critical_back - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_attack_range - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_attack_range_critical - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_dodge_close - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_dodge_range - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_stand_close - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_stand - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_stand_range - banim_bram_sw1_4_script
	.word banim_bram_sw1_4_mode_attack_miss - banim_bram_sw1_4_script
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

