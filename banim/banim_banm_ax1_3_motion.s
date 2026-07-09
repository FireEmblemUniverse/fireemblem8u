@ vim:ft=armv4
	.global banim_banm_ax1_3_script
	.global banim_banm_ax1_3_oam_r
	.global banim_banm_ax1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x21
	.section .data.oam_l
banim_banm_ax1_3_oam_l:
banim_banm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -20, -16
	banim_frame_oam 0x0, 0x1000, 0x4, -4, -24
	banim_frame_end
banim_banm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0x1000, 0x8C, 1, -15
	banim_frame_oam 0x0, 0x9000, 0x16, -31, -15
	banim_frame_oam 0x0, 0x1000, 0xCB, 9, -15
	banim_frame_oam 0x4000, 0x1000, 0xE9, 1, -7
	banim_frame_oam 0x0, 0x1000, 0xC6, 9, 1
	banim_frame_oam 0x0, 0x1000, 0xEB, 1, 1
	banim_frame_oam 0x0, 0x1000, 0x70, 9, 9
	banim_frame_oam 0x0, 0x1000, 0xB7, 1, 9
	banim_frame_end
banim_banm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x1A, -31, -11
	banim_frame_oam 0x4000, 0x5000, 0x5A, -31, 5
	banim_frame_oam 0x0, 0x1000, 0xDF, 1, -10
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_banm_ax1_3_oam_r:
banim_banm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -12, -16
	banim_frame_oam 0x0, 0x0, 0x4, -4, -24
	banim_frame_end
banim_banm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0x0, 0x8C, -9, -15
	banim_frame_oam 0x0, 0x8000, 0x16, -1, -15
	banim_frame_oam 0x0, 0x0, 0xCB, -17, -15
	banim_frame_oam 0x4000, 0x0, 0xE9, -17, -7
	banim_frame_oam 0x0, 0x0, 0xC6, -17, 1
	banim_frame_oam 0x0, 0x0, 0xEB, -9, 1
	banim_frame_oam 0x0, 0x0, 0x70, -17, 9
	banim_frame_oam 0x0, 0x0, 0xB7, -9, 9
	banim_frame_end
banim_banm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x1A, -1, -11
	banim_frame_oam 0x4000, 0x4000, 0x5A, -1, 5
	banim_frame_oam 0x0, 0x0, 0xDF, -9, -10
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_banm_ax1_3_script:
banim_banm_ax1_3_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_3_oam_frame_2_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_3_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_3_oam_frame_2_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_3_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_3_oam_frame_2_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_3_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_3_oam_frame_2_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_3_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_3_oam_frame_2_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_3_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_3_oam_frame_2_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_3_oam_frame_2_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_3_oam_frame_2_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_banm_ax1_3_mode_stand_close:
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_banm_ax1_3_mode_stand:
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_banm_ax1_3_mode_stand_range:
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_banm_ax1_3_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_banm_ax1_sheet_0, 0, banim_banm_ax1_3_oam_frame_0_r - banim_banm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_frame 1, banim_banm_ax1_sheet_1, 2, banim_banm_ax1_3_oam_frame_2_r - banim_banm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_banm_ax1_sheet_1, 1, banim_banm_ax1_3_oam_frame_1_r - banim_banm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_banm_ax1_3_mode_attack_close - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_attack_close_back - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_attack_close_critical - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_attack_close_critical_back - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_attack_range - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_attack_range_critical - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_dodge_close - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_dodge_range - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_stand_close - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_stand - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_stand_range - banim_banm_ax1_3_script
	.word banim_banm_ax1_3_mode_attack_miss - banim_banm_ax1_3_script
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

