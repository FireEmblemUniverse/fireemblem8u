@ vim:ft=armv4
	.global banim_snim_ar1_2_script
	.global banim_snim_ar1_2_oam_r
	.global banim_snim_ar1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x2A
	.section .data.oam_l
banim_snim_ar1_2_oam_l:
banim_snim_ar1_2_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x1000, 0xEF, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, 8, 8
	banim_frame_oam 0x0, 0x5000, 0x8F, -6, -16
	banim_frame_oam 0x4000, 0x1000, 0xCF, -6, 0
	banim_frame_oam 0x0, 0x1000, 0xAB, -14, -5
	banim_frame_oam 0x0, 0x1000, 0x3, -3, -24
	banim_frame_end
banim_snim_ar1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0xA, 0, -13
	banim_frame_oam 0x8000, 0x5000, 0xC, -8, -13
	banim_frame_oam 0x0, 0x1000, 0x6D, -16, -7
	banim_frame_oam 0x0, 0x1000, 0x6E, -16, 11
	banim_frame_end
banim_snim_ar1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0xD, -2, -5
	banim_frame_oam 0x8000, 0x1000, 0xF, -10, -5
	banim_frame_oam 0x4000, 0x1000, 0x4D, 0, 11
	banim_frame_oam 0x0, 0x1000, 0x4F, -8, 11
	banim_frame_oam 0x0, 0x1000, 0x6E, -16, 11
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
banim_snim_ar1_2_oam_r:
banim_snim_ar1_2_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0xEF, -8, 8
	banim_frame_oam 0x0, 0x0, 0xEC, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x8F, -10, -16
	banim_frame_oam 0x4000, 0x0, 0xCF, -10, 0
	banim_frame_oam 0x0, 0x0, 0xAB, 6, -5
	banim_frame_oam 0x0, 0x0, 0x3, -5, -24
	banim_frame_end
banim_snim_ar1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0xA, -16, -13
	banim_frame_oam 0x8000, 0x4000, 0xC, 0, -13
	banim_frame_oam 0x0, 0x0, 0x6D, 8, -7
	banim_frame_oam 0x0, 0x0, 0x6E, 8, 11
	banim_frame_end
banim_snim_ar1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0xD, -14, -5
	banim_frame_oam 0x8000, 0x0, 0xF, 2, -5
	banim_frame_oam 0x4000, 0x0, 0x4D, -16, 11
	banim_frame_oam 0x0, 0x0, 0x4F, 0, 11
	banim_frame_oam 0x0, 0x0, 0x6E, 8, 11
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
banim_snim_ar1_2_script:
banim_snim_ar1_2_mode_attack_close:
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snim_ar1_2_mode_attack_close_back:
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snim_ar1_2_mode_attack_close_critical:
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snim_ar1_2_mode_attack_close_critical_back:
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snim_ar1_2_mode_attack_range:
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snim_ar1_2_mode_attack_range_critical:
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snim_ar1_2_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_frame 3, banim_snim_ar1_sheet_2, 1, banim_snim_ar1_2_oam_frame_1_r - banim_snim_ar1_2_oam_r
	banim_code_frame 1, banim_snim_ar1_sheet_2, 2, banim_snim_ar1_2_oam_frame_2_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_snim_ar1_sheet_2, 1, banim_snim_ar1_2_oam_frame_1_r - banim_snim_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snim_ar1_2_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_frame 3, banim_snim_ar1_sheet_2, 1, banim_snim_ar1_2_oam_frame_1_r - banim_snim_ar1_2_oam_r
	banim_code_frame 1, banim_snim_ar1_sheet_2, 2, banim_snim_ar1_2_oam_frame_2_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_snim_ar1_sheet_2, 1, banim_snim_ar1_2_oam_frame_1_r - banim_snim_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snim_ar1_2_mode_stand_close:
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snim_ar1_2_mode_stand:
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snim_ar1_2_mode_stand_range:
	banim_code_frame 1, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snim_ar1_2_mode_attack_miss:
	banim_code_frame 4, banim_snim_ar1_sheet_0, 0, banim_snim_ar1_2_oam_frame_0_r - banim_snim_ar1_2_oam_r
	banim_code_end_mode
	.section .data.modes
	.word banim_snim_ar1_2_mode_attack_close - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_attack_close_back - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_attack_close_critical - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_attack_close_critical_back - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_attack_range - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_attack_range_critical - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_dodge_close - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_dodge_range - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_stand_close - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_stand - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_stand_range - banim_snim_ar1_2_script
	.word banim_snim_ar1_2_mode_attack_miss - banim_snim_ar1_2_script
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

