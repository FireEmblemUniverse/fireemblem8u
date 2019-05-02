@ vim:ft=armv4
	.global banim_solm_sp1_2_script
	.global banim_solm_sp1_2_oam_r
	.global banim_solm_sp1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x98
	.section .data.oam_l
banim_solm_sp1_2_oam_l:
banim_solm_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x40, -9, -8
	banim_frame_oam 0x8000, 0x1000, 0x42, -17, -8
	banim_frame_oam 0x4000, 0x1000, 0x80, -9, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -17, 8
	banim_frame_oam 0x4000, 0x1000, 0x20, -11, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -9, -24
	banim_frame_end
banim_solm_sp1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x3, -11, -21
	banim_frame_oam 0x0, 0x1000, 0x25, -19, -13
	banim_frame_oam 0x4000, 0x9000, 0x43, -26, -5
	banim_frame_oam 0x4000, 0x5000, 0x83, -26, 11
	banim_frame_oam 0x0, 0x1000, 0x1, -34, 3
	banim_frame_end
banim_solm_sp1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x7, -12, -13
	banim_frame_oam 0x8000, 0x1000, 0x9, -20, -13
	banim_frame_oam 0x4000, 0x1000, 0x47, -12, 3
	banim_frame_oam 0x0, 0x1000, 0x49, -20, 3
	banim_frame_oam 0x4000, 0x1000, 0x5, -15, 11
	banim_frame_oam 0x0, 0x1000, 0x26, -23, 11
	banim_frame_oam 0x8000, 0x1000, 0x2, -28, -5
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
banim_solm_sp1_2_oam_r:
banim_solm_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x40, -7, -8
	banim_frame_oam 0x8000, 0x0, 0x42, 9, -8
	banim_frame_oam 0x4000, 0x0, 0x80, -7, 8
	banim_frame_oam 0x0, 0x0, 0x82, 9, 8
	banim_frame_oam 0x4000, 0x0, 0x20, -5, -16
	banim_frame_oam 0x0, 0x0, 0x0, 1, -24
	banim_frame_end
banim_solm_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x3, -5, -21
	banim_frame_oam 0x0, 0x0, 0x25, 11, -13
	banim_frame_oam 0x4000, 0x8000, 0x43, -6, -5
	banim_frame_oam 0x4000, 0x4000, 0x83, -6, 11
	banim_frame_oam 0x0, 0x0, 0x1, 26, 3
	banim_frame_end
banim_solm_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x7, -4, -13
	banim_frame_oam 0x8000, 0x0, 0x9, 12, -13
	banim_frame_oam 0x4000, 0x0, 0x47, -4, 3
	banim_frame_oam 0x0, 0x0, 0x49, 12, 3
	banim_frame_oam 0x4000, 0x0, 0x5, -1, 11
	banim_frame_oam 0x0, 0x0, 0x26, 15, 11
	banim_frame_oam 0x8000, 0x0, 0x2, 20, -5
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
banim_solm_sp1_2_script:
banim_solm_sp1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 2, banim_solm_sp1_2_oam_frame_2_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 2, banim_solm_sp1_2_oam_frame_2_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 2, banim_solm_sp1_2_oam_frame_2_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 2, banim_solm_sp1_2_oam_frame_2_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 2, banim_solm_sp1_2_oam_frame_2_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 2, banim_solm_sp1_2_oam_frame_2_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 2, banim_solm_sp1_2_oam_frame_2_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 2, banim_solm_sp1_2_oam_frame_2_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_solm_sp1_2_mode_stand_close:
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_solm_sp1_2_mode_stand:
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_solm_sp1_2_mode_stand_range:
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_solm_sp1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 0, banim_solm_sp1_2_oam_frame_0_r - banim_solm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_frame 1, banim_solm_sp1_2_sheet_0, 2, banim_solm_sp1_2_oam_frame_2_r - banim_solm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_solm_sp1_2_sheet_0, 1, banim_solm_sp1_2_oam_frame_1_r - banim_solm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_solm_sp1_2_mode_attack_close - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_attack_close_back - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_attack_close_critical - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_attack_close_critical_back - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_attack_range - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_attack_range_critical - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_dodge_close - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_dodge_range - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_stand_close - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_stand - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_stand_range - banim_solm_sp1_2_script
	.word banim_solm_sp1_2_mode_attack_miss - banim_solm_sp1_2_script
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

