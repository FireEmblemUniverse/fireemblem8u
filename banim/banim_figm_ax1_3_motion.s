@ vim:ft=armv4
	.global banim_figm_ax1_3_script
	.global banim_figm_ax1_3_oam_r
	.global banim_figm_ax1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1A
	.section .data.oam_l
banim_figm_ax1_3_oam_l:
banim_figm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x43, -19, -14
	banim_frame_oam 0x0, 0x5000, 0xCF, -3, 2
	banim_frame_oam 0x0, 0x5000, 0xCD, -3, -14
	banim_frame_oam 0x4000, 0x1000, 0xC2, -10, -22
	banim_frame_oam 0x0, 0x1000, 0xA0, 13, 10
	banim_frame_end
banim_figm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0xCA, 0, -1
	banim_frame_oam 0x8000, 0x1000, 0xCC, -8, -1
	banim_frame_oam 0x4000, 0x1000, 0xF1, 0, -9
	banim_frame_oam 0x0, 0x1000, 0xF3, -8, -9
	banim_frame_oam 0x0, 0x5000, 0x1C, 0, -25
	banim_frame_oam 0x8000, 0x1000, 0x1E, -8, -25
	banim_frame_end
banim_figm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x96, 11, -1
	banim_frame_oam 0x4000, 0x5000, 0xE5, -5, -9
	banim_frame_oam 0x0, 0x1000, 0xE9, -5, -17
	banim_frame_oam 0x4000, 0x1000, 0xE2, 11, -17
	banim_frame_oam 0x0, 0x1000, 0xE4, 3, -17
	banim_frame_oam 0x4000, 0x1000, 0xE0, 10, -25
	banim_frame_oam 0x4000, 0x1000, 0xF4, 27, -17
	banim_frame_oam 0x8000, 0x1000, 0xD6, 3, -1
	banim_frame_oam 0x0, 0x1000, 0xF7, -5, 7
	banim_frame_oam 0x0, 0x1000, 0xD7, 27, 7
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_figm_ax1_3_oam_r:
banim_figm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x43, 3, -14
	banim_frame_oam 0x0, 0x4000, 0xCF, -13, 2
	banim_frame_oam 0x0, 0x4000, 0xCD, -13, -14
	banim_frame_oam 0x4000, 0x0, 0xC2, -6, -22
	banim_frame_oam 0x0, 0x0, 0xA0, -21, 10
	banim_frame_end
banim_figm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0xCA, -16, -1
	banim_frame_oam 0x8000, 0x0, 0xCC, 0, -1
	banim_frame_oam 0x4000, 0x0, 0xF1, -16, -9
	banim_frame_oam 0x0, 0x0, 0xF3, 0, -9
	banim_frame_oam 0x0, 0x4000, 0x1C, -16, -25
	banim_frame_oam 0x8000, 0x0, 0x1E, 0, -25
	banim_frame_end
banim_figm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x96, -27, -1
	banim_frame_oam 0x4000, 0x4000, 0xE5, -27, -9
	banim_frame_oam 0x0, 0x0, 0xE9, -3, -17
	banim_frame_oam 0x4000, 0x0, 0xE2, -27, -17
	banim_frame_oam 0x0, 0x0, 0xE4, -11, -17
	banim_frame_oam 0x4000, 0x0, 0xE0, -26, -25
	banim_frame_oam 0x4000, 0x0, 0xF4, -43, -17
	banim_frame_oam 0x8000, 0x0, 0xD6, -11, -1
	banim_frame_oam 0x0, 0x0, 0xF7, -3, 7
	banim_frame_oam 0x0, 0x0, 0xD7, -35, 7
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_figm_ax1_3_script:
banim_figm_ax1_3_mode_attack_close:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_3_mode_attack_close_back:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_3_mode_attack_close_critical:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_3_mode_attack_close_critical_back:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_3_mode_attack_range:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_3_mode_attack_range_critical:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_figm_ax1_sheet_0, 1, banim_figm_ax1_3_oam_frame_1_r - banim_figm_ax1_3_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_0, 2, banim_figm_ax1_3_oam_frame_2_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_0, 1, banim_figm_ax1_3_oam_frame_1_r - banim_figm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_figm_ax1_sheet_0, 1, banim_figm_ax1_3_oam_frame_1_r - banim_figm_ax1_3_oam_r
	banim_code_frame 1, banim_figm_ax1_sheet_0, 2, banim_figm_ax1_3_oam_frame_2_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_figm_ax1_sheet_0, 1, banim_figm_ax1_3_oam_frame_1_r - banim_figm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_figm_ax1_3_mode_stand_close:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_3_mode_stand:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_3_mode_stand_range:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_figm_ax1_3_mode_attack_miss:
	banim_code_frame 1, banim_figm_ax1_sheet_0, 0, banim_figm_ax1_3_oam_frame_0_r - banim_figm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
	.section .data.modes
	.word banim_figm_ax1_3_mode_attack_close - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_attack_close_back - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_attack_close_critical - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_attack_close_critical_back - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_attack_range - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_attack_range_critical - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_dodge_close - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_dodge_range - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_stand_close - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_stand - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_stand_range - banim_figm_ax1_3_script
	.word banim_figm_ax1_3_mode_attack_miss - banim_figm_ax1_3_script
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

