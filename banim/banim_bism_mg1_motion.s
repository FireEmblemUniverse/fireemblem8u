@ vim:ft=armv4
	.global banim_bism_mg1_script
	.global banim_bism_mg1_oam_r
	.global banim_bism_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x80
	.section .data.oam_l
banim_bism_mg1_oam_l:
banim_bism_mg1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x1000, 0x81, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x9E, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xDE, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x5E, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x1, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xFF, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xBF, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x62, -8, 0
	banim_frame_end
banim_bism_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x1000, 0xB1, -3, -5
	banim_frame_oam 0x0, 0x5000, 0xB2, -9, -25
	banim_frame_oam 0x4000, 0x1000, 0xF2, -9, -9
	banim_frame_oam 0x8000, 0x1000, 0xD1, 7, -17
	banim_frame_oam 0x0, 0x5000, 0xD4, -1, -1
	banim_frame_oam 0x8000, 0x1000, 0xD6, -9, -1
	banim_frame_end
banim_bism_mg1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -8, -11
	banim_frame_oam 0x8000, 0x9000, 0x20, 0, -18
	banim_frame_oam 0x8000, 0x5000, 0x22, -8, -18
	banim_frame_oam 0x4000, 0x1000, 0x1, -8, -26
	banim_frame_oam 0x8000, 0x1000, 0x23, -16, -19
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
banim_bism_mg1_oam_r:
banim_bism_mg1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0x81, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x9E, -16, -8
	banim_frame_oam 0x0, 0x0, 0xDE, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x42, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x5E, -8, -16
	banim_frame_oam 0x0, 0x0, 0x1, -8, -24
	banim_frame_oam 0x0, 0x0, 0xFF, -8, 0
	banim_frame_oam 0x0, 0x0, 0xBF, -16, -16
	banim_frame_oam 0x0, 0x0, 0x62, 0, 0
	banim_frame_end
banim_bism_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x0, 0xB1, -5, -5
	banim_frame_oam 0x0, 0x4000, 0xB2, -7, -25
	banim_frame_oam 0x4000, 0x0, 0xF2, -7, -9
	banim_frame_oam 0x8000, 0x0, 0xD1, -15, -17
	banim_frame_oam 0x0, 0x4000, 0xD4, -15, -1
	banim_frame_oam 0x8000, 0x0, 0xD6, 1, -1
	banim_frame_end
banim_bism_mg1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x0, 0x0, 0, -11
	banim_frame_oam 0x8000, 0x8000, 0x20, -16, -18
	banim_frame_oam 0x8000, 0x4000, 0x22, 0, -18
	banim_frame_oam 0x4000, 0x0, 0x1, -8, -26
	banim_frame_oam 0x8000, 0x0, 0x23, 8, -19
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
banim_bism_mg1_script:
banim_bism_mg1_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 2, banim_bism_mg1_oam_frame_2_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 2, banim_bism_mg1_oam_frame_2_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 2, banim_bism_mg1_oam_frame_2_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 2, banim_bism_mg1_oam_frame_2_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 2, banim_bism_mg1_oam_frame_2_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 2, banim_bism_mg1_oam_frame_2_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 2, banim_bism_mg1_oam_frame_2_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 2, banim_bism_mg1_oam_frame_2_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bism_mg1_mode_stand_close:
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bism_mg1_mode_stand:
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bism_mg1_mode_stand_range:
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bism_mg1_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bism_mg1_sheet_0, 0, banim_bism_mg1_oam_frame_0_r - banim_bism_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_frame 1, banim_bism_mg1_sheet_2, 2, banim_bism_mg1_oam_frame_2_r - banim_bism_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bism_mg1_sheet_1, 1, banim_bism_mg1_oam_frame_1_r - banim_bism_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bism_mg1_mode_attack_close - banim_bism_mg1_script
	.word banim_bism_mg1_mode_attack_close_back - banim_bism_mg1_script
	.word banim_bism_mg1_mode_attack_close_critical - banim_bism_mg1_script
	.word banim_bism_mg1_mode_attack_close_critical_back - banim_bism_mg1_script
	.word banim_bism_mg1_mode_attack_range - banim_bism_mg1_script
	.word banim_bism_mg1_mode_attack_range_critical - banim_bism_mg1_script
	.word banim_bism_mg1_mode_dodge_close - banim_bism_mg1_script
	.word banim_bism_mg1_mode_dodge_range - banim_bism_mg1_script
	.word banim_bism_mg1_mode_stand_close - banim_bism_mg1_script
	.word banim_bism_mg1_mode_stand - banim_bism_mg1_script
	.word banim_bism_mg1_mode_stand_range - banim_bism_mg1_script
	.word banim_bism_mg1_mode_attack_miss - banim_bism_mg1_script
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

