@ vim:ft=armv4
	.global banim_arcf_ar1_2_script
	.global banim_arcf_ar1_2_oam_r
	.global banim_arcf_ar1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x28
	.section .data.oam_l
banim_arcf_ar1_2_oam_l:
banim_arcf_ar1_2_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x1000, 0x8E, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xAE, -10, -8
	banim_frame_oam 0x0, 0x5000, 0xCE, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xD0, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x2, -4, -24
	banim_frame_end
banim_arcf_ar1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x1000, 0x89, -13, -14
	banim_frame_oam 0x0, 0x1000, 0x8B, -9, -22
	banim_frame_oam 0x4000, 0x1000, 0xA9, -15, -6
	banim_frame_oam 0x4000, 0x1000, 0xC9, -16, 2
	banim_frame_oam 0x4000, 0x1000, 0xE9, -15, 10
	banim_frame_oam 0x0, 0x1000, 0xEB, -23, 10
	banim_frame_oam 0x0, 0x1000, 0xCB, 0, 7
	banim_frame_oam 0x0, 0x1000, 0xAB, -23, -3
	banim_frame_end
banim_arcf_ar1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x8C, -19, -5
	banim_frame_oam 0x4000, 0x1000, 0xCC, -19, 11
	banim_frame_oam 0x0, 0x1000, 0xEC, -3, 7
	banim_frame_oam 0x0, 0x1000, 0xED, -27, 11
	banim_frame_oam 0x0, 0x1000, 0x8E, -27, -3
	banim_frame_oam 0x0, 0x1000, 0x2F, -12, -13
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
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
banim_arcf_ar1_2_oam_r:
banim_arcf_ar1_2_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0x8E, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xAE, -6, -8
	banim_frame_oam 0x0, 0x4000, 0xCE, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xD0, 8, 0
	banim_frame_oam 0x0, 0x0, 0x2, -4, -24
	banim_frame_end
banim_arcf_ar1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x0, 0x89, -3, -14
	banim_frame_oam 0x0, 0x0, 0x8B, 1, -22
	banim_frame_oam 0x4000, 0x0, 0xA9, -1, -6
	banim_frame_oam 0x4000, 0x0, 0xC9, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE9, -1, 10
	banim_frame_oam 0x0, 0x0, 0xEB, 15, 10
	banim_frame_oam 0x0, 0x0, 0xCB, -8, 7
	banim_frame_oam 0x0, 0x0, 0xAB, 15, -3
	banim_frame_end
banim_arcf_ar1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x8C, 3, -5
	banim_frame_oam 0x4000, 0x0, 0xCC, 3, 11
	banim_frame_oam 0x0, 0x0, 0xEC, -5, 7
	banim_frame_oam 0x0, 0x0, 0xED, 19, 11
	banim_frame_oam 0x0, 0x0, 0x8E, 19, -3
	banim_frame_oam 0x0, 0x0, 0x2F, 4, -13
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
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
banim_arcf_ar1_2_script:
banim_arcf_ar1_2_mode_attack_close:
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcf_ar1_2_mode_attack_close_back:
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcf_ar1_2_mode_attack_close_critical:
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcf_ar1_2_mode_attack_close_critical_back:
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcf_ar1_2_mode_attack_range:
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcf_ar1_2_mode_attack_range_critical:
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcf_ar1_2_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_frame 3, banim_arcf_ar1_sheet_1, 1, banim_arcf_ar1_2_oam_frame_1_r - banim_arcf_ar1_2_oam_r
	banim_code_frame 1, banim_arcf_ar1_sheet_1, 2, banim_arcf_ar1_2_oam_frame_2_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_arcf_ar1_sheet_1, 1, banim_arcf_ar1_2_oam_frame_1_r - banim_arcf_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcf_ar1_2_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_frame 3, banim_arcf_ar1_sheet_1, 1, banim_arcf_ar1_2_oam_frame_1_r - banim_arcf_ar1_2_oam_r
	banim_code_frame 1, banim_arcf_ar1_sheet_1, 2, banim_arcf_ar1_2_oam_frame_2_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_arcf_ar1_sheet_1, 1, banim_arcf_ar1_2_oam_frame_1_r - banim_arcf_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcf_ar1_2_mode_stand_close:
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcf_ar1_2_mode_stand:
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcf_ar1_2_mode_stand_range:
	banim_code_frame 1, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcf_ar1_2_mode_attack_miss:
	banim_code_frame 4, banim_arcf_ar1_sheet_0, 0, banim_arcf_ar1_2_oam_frame_0_r - banim_arcf_ar1_2_oam_r
	banim_code_end_mode
	.section .data.modes
	.word banim_arcf_ar1_2_mode_attack_close - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_attack_close_back - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_attack_close_critical - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_attack_close_critical_back - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_attack_range - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_attack_range_critical - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_dodge_close - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_dodge_range - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_stand_close - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_stand - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_stand_range - banim_arcf_ar1_2_script
	.word banim_arcf_ar1_2_mode_attack_miss - banim_arcf_ar1_2_script
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

