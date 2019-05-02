@ vim:ft=armv4
	.global banim_lorm_sp1_2_script
	.global banim_lorm_sp1_2_oam_r
	.global banim_lorm_sp1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1
	.section .data.oam_l
banim_lorm_sp1_2_oam_l:
banim_lorm_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x25, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x29, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xA5, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xA9, -24, 8
	banim_frame_end
banim_lorm_sp1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x2A, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x2E, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xAA, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, -24, 8
	banim_frame_end
banim_lorm_sp1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x2F, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x33, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xAF, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xB3, -24, 8
	banim_frame_end
banim_lorm_sp1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x34, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x38, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xB4, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xB8, -24, 8
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
banim_lorm_sp1_2_oam_r:
banim_lorm_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x25, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x29, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xA5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xA9, 16, 8
	banim_frame_end
banim_lorm_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x2A, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x2E, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xAA, -16, 8
	banim_frame_oam 0x0, 0x0, 0xAE, 16, 8
	banim_frame_end
banim_lorm_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x2F, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x33, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xAF, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB3, 16, 8
	banim_frame_end
banim_lorm_sp1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x34, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x38, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xB4, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB8, 16, 8
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
banim_lorm_sp1_2_script:
banim_lorm_sp1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 3, banim_lorm_sp1_2_oam_frame_3_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 3, banim_lorm_sp1_2_oam_frame_3_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 3, banim_lorm_sp1_2_oam_frame_3_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 3, banim_lorm_sp1_2_oam_frame_3_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 3, banim_lorm_sp1_2_oam_frame_3_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 3, banim_lorm_sp1_2_oam_frame_3_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 3, banim_lorm_sp1_2_oam_frame_3_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 3, banim_lorm_sp1_2_oam_frame_3_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_2_mode_stand_close:
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorm_sp1_2_mode_stand:
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorm_sp1_2_mode_stand_range:
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorm_sp1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 3, banim_lorm_sp1_2_oam_frame_3_r - banim_lorm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 2, banim_lorm_sp1_2_oam_frame_2_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_8, 1, banim_lorm_sp1_2_oam_frame_1_r - banim_lorm_sp1_2_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 0, banim_lorm_sp1_2_oam_frame_0_r - banim_lorm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_lorm_sp1_2_mode_attack_close - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_attack_close_back - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_attack_close_critical - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_attack_close_critical_back - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_attack_range - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_attack_range_critical - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_dodge_close - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_dodge_range - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_stand_close - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_stand - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_stand_range - banim_lorm_sp1_2_script
	.word banim_lorm_sp1_2_mode_attack_miss - banim_lorm_sp1_2_script
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

