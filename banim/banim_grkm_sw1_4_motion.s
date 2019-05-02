@ vim:ft=armv4
	.global banim_grkm_sw1_4_script
	.global banim_grkm_sw1_4_oam_r
	.global banim_grkm_sw1_4_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x56
	.section .data.oam_l
banim_grkm_sw1_4_oam_l:
banim_grkm_sw1_4_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0xB, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0xD, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x8B, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8D, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCD, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0xE, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0x8E, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xAE, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xAF, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xEC, 24, -24
	banim_frame_end
banim_grkm_sw1_4_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x14, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x90, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x94, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xB1, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0xB0, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xF0, 16, -8
	banim_frame_end
banim_grkm_sw1_4_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x19, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x99, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xB5, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0xB9, 16, -24
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
banim_grkm_sw1_4_oam_r:
banim_grkm_sw1_4_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0xB, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0xD, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x8B, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x8D, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xCB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCD, 8, 8
	banim_frame_oam 0x8000, 0x8000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x0, 0x8E, -24, 8
	banim_frame_oam 0x8000, 0x0, 0xAE, 16, -16
	banim_frame_oam 0x8000, 0x0, 0xAF, 16, 0
	banim_frame_oam 0x0, 0x0, 0xEC, -32, -24
	banim_frame_end
banim_grkm_sw1_4_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x14, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x90, -16, 8
	banim_frame_oam 0x0, 0x0, 0x94, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0xB1, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xB0, -24, -24
	banim_frame_oam 0x0, 0x0, 0xF0, -24, -8
	banim_frame_end
banim_grkm_sw1_4_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x19, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x0, 0x0, 0x99, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0xB5, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xB9, -24, -24
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
banim_grkm_sw1_4_script:
banim_grkm_sw1_4_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 2, banim_grkm_sw1_4_oam_frame_2_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sw1_4_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 2, banim_grkm_sw1_4_oam_frame_2_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sw1_4_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 2, banim_grkm_sw1_4_oam_frame_2_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sw1_4_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 2, banim_grkm_sw1_4_oam_frame_2_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sw1_4_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 2, banim_grkm_sw1_4_oam_frame_2_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sw1_4_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 2, banim_grkm_sw1_4_oam_frame_2_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sw1_4_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 2, banim_grkm_sw1_4_oam_frame_2_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sw1_4_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 2, banim_grkm_sw1_4_oam_frame_2_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sw1_4_mode_stand_close:
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_sw1_4_mode_stand:
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_sw1_4_mode_stand_range:
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_sw1_4_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 2, banim_grkm_sw1_4_oam_frame_2_r - banim_grkm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sw1_sheet_11, 1, banim_grkm_sw1_4_oam_frame_1_r - banim_grkm_sw1_4_oam_r
	banim_code_frame 1, banim_grkm_sw1_sheet_11, 0, banim_grkm_sw1_4_oam_frame_0_r - banim_grkm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_grkm_sw1_4_mode_attack_close - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_attack_close_back - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_attack_close_critical - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_attack_close_critical_back - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_attack_range - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_attack_range_critical - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_dodge_close - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_dodge_range - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_stand_close - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_stand - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_stand_range - banim_grkm_sw1_4_script
	.word banim_grkm_sw1_4_mode_attack_miss - banim_grkm_sw1_4_script
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

