@ vim:ft=armv4
	.global banim_warm_ax1_3_script
	.global banim_warm_ax1_3_oam_r
	.global banim_warm_ax1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1E
	.section .data.oam_l
banim_warm_ax1_3_oam_l:
banim_warm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -7, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -7, 0
	banim_frame_oam 0x8000, 0x1000, 0x84, -15, 0
	banim_frame_end
banim_warm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x1000, 0xB0, -28, -23
	banim_frame_oam 0x0, 0x1000, 0xAF, -28, -15
	banim_frame_oam 0x0, 0x1000, 0xAE, -27, -7
	banim_frame_oam 0x4000, 0x1000, 0xAC, -28, 1
	banim_frame_oam 0x4000, 0x9000, 0x88, -17, 1
	banim_frame_oam 0x8000, 0x9000, 0x8, -1, -31
	banim_frame_oam 0x8000, 0x5000, 0xA, -9, -31
	banim_frame_oam 0x8000, 0x1000, 0x2B, -17, -23
	banim_frame_oam 0x0, 0x1000, 0xB, -25, -17
	banim_frame_end
banim_warm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x88, -17, 1
	banim_frame_oam 0x8000, 0x9000, 0x8, -1, -31
	banim_frame_oam 0x8000, 0x5000, 0xA, -9, -31
	banim_frame_oam 0x8000, 0x1000, 0x2B, -17, -23
	banim_frame_oam 0x0, 0x1000, 0xB, -25, -17
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_warm_ax1_3_oam_r:
banim_warm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -25, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, 7, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -25, 0
	banim_frame_oam 0x8000, 0x0, 0x84, 7, 0
	banim_frame_end
banim_warm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x0, 0xB0, 12, -23
	banim_frame_oam 0x0, 0x0, 0xAF, 20, -15
	banim_frame_oam 0x0, 0x0, 0xAE, 19, -7
	banim_frame_oam 0x4000, 0x0, 0xAC, 12, 1
	banim_frame_oam 0x4000, 0x8000, 0x88, -15, 1
	banim_frame_oam 0x8000, 0x8000, 0x8, -15, -31
	banim_frame_oam 0x8000, 0x4000, 0xA, 1, -31
	banim_frame_oam 0x8000, 0x0, 0x2B, 9, -23
	banim_frame_oam 0x0, 0x0, 0xB, 17, -17
	banim_frame_end
banim_warm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x88, -15, 1
	banim_frame_oam 0x8000, 0x8000, 0x8, -15, -31
	banim_frame_oam 0x8000, 0x4000, 0xA, 1, -31
	banim_frame_oam 0x8000, 0x0, 0x2B, 9, -23
	banim_frame_oam 0x0, 0x0, 0xB, 17, -17
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_warm_ax1_3_script:
banim_warm_ax1_3_mode_attack_close:
banim_warm_ax1_3_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_3_oam_frame_2_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_3_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_3_oam_frame_2_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_3_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_3_oam_frame_2_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_3_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_3_oam_frame_2_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_3_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_3_oam_frame_2_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_3_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_3_oam_frame_2_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_3_oam_frame_2_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_3_oam_frame_2_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_3_oam_frame_1_r - banim_warm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_3_mode_stand_close:
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ax1_3_mode_stand:
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ax1_3_mode_stand_range:
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_3_oam_frame_0_r - banim_warm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
	.section .data.modes
	.word banim_warm_ax1_3_mode_attack_close - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_attack_close_back - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_attack_close_critical - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_attack_close_critical_back - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_attack_range - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_attack_range_critical - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_dodge_close - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_dodge_range - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_stand_close - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_stand - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_stand_range - banim_warm_ax1_3_script
	.word banim_warm_ax1_3_mode_attack_miss - banim_warm_ax1_3_script
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

