@ vim:ft=armv4
	.global banim_pirm_ax1_3_script
	.global banim_pirm_ax1_3_oam_r
	.global banim_pirm_ax1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x9B
	.section .data.oam_l
banim_pirm_ax1_3_oam_l:
banim_pirm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x1, -9, -16
	banim_frame_oam 0x0, 0x1000, 0x60, 7, 8
	banim_frame_oam 0x8000, 0x1000, 0x9D, 7, -16
	banim_frame_oam 0x0, 0x1000, 0xDD, 7, 0
	banim_frame_oam 0x8000, 0x5000, 0x5E, -17, -16
	banim_frame_oam 0x0, 0x1000, 0x25, -1, -24
	banim_frame_oam 0x0, 0x1000, 0xBC, -25, -8
	banim_frame_end
banim_pirm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x20, -18, -10
	banim_frame_oam 0x4000, 0x1000, 0x0, -10, -18
	banim_frame_oam 0x0, 0x1000, 0x2, -18, -18
	banim_frame_oam 0x4000, 0x5000, 0x61, -18, 6
	banim_frame_oam 0x0, 0x1000, 0x60, -11, -26
	banim_frame_end
banim_pirm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x45, -18, -2
	banim_frame_oam 0x4000, 0x1000, 0x8, -10, -10
	banim_frame_oam 0x0, 0x1000, 0x49, -18, -10
	banim_frame_oam 0x0, 0x1000, 0x69, -26, -10
	banim_frame_oam 0x0, 0x5000, 0xA, -15, -26
	banim_frame_oam 0x0, 0x1000, 0x28, -23, -26
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
banim_pirm_ax1_3_oam_r:
banim_pirm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x1, -7, -16
	banim_frame_oam 0x0, 0x0, 0x60, -15, 8
	banim_frame_oam 0x8000, 0x0, 0x9D, -15, -16
	banim_frame_oam 0x0, 0x0, 0xDD, -15, 0
	banim_frame_oam 0x8000, 0x4000, 0x5E, 9, -16
	banim_frame_oam 0x0, 0x0, 0x25, -7, -24
	banim_frame_oam 0x0, 0x0, 0xBC, 17, -8
	banim_frame_end
banim_pirm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x20, -14, -10
	banim_frame_oam 0x4000, 0x0, 0x0, -6, -18
	banim_frame_oam 0x0, 0x0, 0x2, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x61, -14, 6
	banim_frame_oam 0x0, 0x0, 0x60, 3, -26
	banim_frame_end
banim_pirm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x45, -14, -2
	banim_frame_oam 0x4000, 0x0, 0x8, -6, -10
	banim_frame_oam 0x0, 0x0, 0x49, 10, -10
	banim_frame_oam 0x0, 0x0, 0x69, 18, -10
	banim_frame_oam 0x0, 0x4000, 0xA, -1, -26
	banim_frame_oam 0x0, 0x0, 0x28, 15, -26
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
banim_pirm_ax1_3_script:
banim_pirm_ax1_3_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_3_oam_frame_2_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_3_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_3_oam_frame_2_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_3_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_3_oam_frame_2_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_3_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_3_oam_frame_2_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_3_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_3_oam_frame_2_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_3_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_3_oam_frame_2_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_3_oam_frame_2_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_3_oam_frame_2_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_3_mode_stand_close:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_3_mode_stand:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_3_mode_stand_range:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_3_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_3_oam_frame_0_r - banim_pirm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 2, banim_pirm_ax1_3_oam_frame_2_r - banim_pirm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 1, banim_pirm_ax1_3_oam_frame_1_r - banim_pirm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pirm_ax1_3_mode_attack_close - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_attack_close_back - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_attack_close_critical - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_attack_close_critical_back - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_attack_range - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_attack_range_critical - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_dodge_close - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_dodge_range - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_stand_close - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_stand - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_stand_range - banim_pirm_ax1_3_script
	.word banim_pirm_ax1_3_mode_attack_miss - banim_pirm_ax1_3_script
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

