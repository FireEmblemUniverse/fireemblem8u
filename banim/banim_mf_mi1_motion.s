@ vim:ft=armv4
	.global banim_mf_mi1_script
	.global banim_mf_mi1_oam_r
	.global banim_mf_mi1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC6
	.section .data.oam_l
banim_mf_mi1_oam_l:
banim_mf_mi1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x84, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC5, -24, 8
	banim_frame_end
banim_mf_mi1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x5000, 0xC1, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xC5, -27, 8
	banim_frame_oam 0x8000, 0x9000, 0xC, -14, -48
	banim_frame_oam 0x4000, 0x9000, 0x88, -46, -40
	banim_frame_oam 0x0, 0x5000, 0x8C, -62, -40
	banim_frame_oam 0x4000, 0x5000, 0xC8, -46, -24
	banim_frame_oam 0x4000, 0x1000, 0xCC, -62, -24
	banim_frame_oam 0x4000, 0x9000, 0x8, 2, -48
	banim_frame_oam 0x4000, 0x5000, 0x48, 2, -32
	banim_frame_oam 0x0, 0x1000, 0x6B, 2, -24
	banim_frame_end
banim_mf_mi1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0xE2, -27, 8
	banim_frame_oam 0x0, 0x9000, 0xE, -8, -56
	banim_frame_oam 0x8000, 0x9000, 0x12, -24, -56
	banim_frame_oam 0x8000, 0x5000, 0x14, -32, -56
	banim_frame_oam 0x4000, 0x9000, 0x8E, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x92, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x94, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xCE, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xD2, -24, -8
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
banim_mf_mi1_oam_r:
banim_mf_mi1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -24, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x84, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC5, 16, 8
	banim_frame_end
banim_mf_mi1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x4000, 0xC1, -13, 8
	banim_frame_oam 0x0, 0x0, 0xC5, 19, 8
	banim_frame_oam 0x8000, 0x8000, 0xC, -2, -48
	banim_frame_oam 0x4000, 0x8000, 0x88, 14, -40
	banim_frame_oam 0x0, 0x4000, 0x8C, 46, -40
	banim_frame_oam 0x4000, 0x4000, 0xC8, 14, -24
	banim_frame_oam 0x4000, 0x0, 0xCC, 46, -24
	banim_frame_oam 0x4000, 0x8000, 0x8, -34, -48
	banim_frame_oam 0x4000, 0x4000, 0x48, -34, -32
	banim_frame_oam 0x0, 0x0, 0x6B, -10, -24
	banim_frame_end
banim_mf_mi1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0xE2, -5, 8
	banim_frame_oam 0x0, 0x8000, 0xE, -24, -56
	banim_frame_oam 0x8000, 0x8000, 0x12, 8, -56
	banim_frame_oam 0x8000, 0x4000, 0x14, 24, -56
	banim_frame_oam 0x4000, 0x8000, 0x8E, -24, -24
	banim_frame_oam 0x0, 0x4000, 0x92, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x94, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xCE, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xD2, 8, -8
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
banim_mf_mi1_script:
banim_mf_mi1_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_frame 1, banim_mf_mi1_sheet_0, 2, banim_mf_mi1_oam_frame_2_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mf_mi1_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_frame 1, banim_mf_mi1_sheet_0, 2, banim_mf_mi1_oam_frame_2_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mf_mi1_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_frame 1, banim_mf_mi1_sheet_0, 2, banim_mf_mi1_oam_frame_2_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mf_mi1_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_frame 1, banim_mf_mi1_sheet_0, 2, banim_mf_mi1_oam_frame_2_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mf_mi1_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_frame 1, banim_mf_mi1_sheet_0, 2, banim_mf_mi1_oam_frame_2_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mf_mi1_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_frame 1, banim_mf_mi1_sheet_0, 2, banim_mf_mi1_oam_frame_2_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mf_mi1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_frame 1, banim_mf_mi1_sheet_0, 2, banim_mf_mi1_oam_frame_2_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mf_mi1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_frame 1, banim_mf_mi1_sheet_0, 2, banim_mf_mi1_oam_frame_2_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mf_mi1_mode_stand_close:
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mf_mi1_mode_stand:
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mf_mi1_mode_stand_range:
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mf_mi1_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mf_mi1_sheet_0, 0, banim_mf_mi1_oam_frame_0_r - banim_mf_mi1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_frame 1, banim_mf_mi1_sheet_0, 2, banim_mf_mi1_oam_frame_2_r - banim_mf_mi1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mf_mi1_sheet_0, 1, banim_mf_mi1_oam_frame_1_r - banim_mf_mi1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_mf_mi1_mode_attack_close - banim_mf_mi1_script
	.word banim_mf_mi1_mode_attack_close_back - banim_mf_mi1_script
	.word banim_mf_mi1_mode_attack_close_critical - banim_mf_mi1_script
	.word banim_mf_mi1_mode_attack_close_critical_back - banim_mf_mi1_script
	.word banim_mf_mi1_mode_attack_range - banim_mf_mi1_script
	.word banim_mf_mi1_mode_attack_range_critical - banim_mf_mi1_script
	.word banim_mf_mi1_mode_dodge_close - banim_mf_mi1_script
	.word banim_mf_mi1_mode_dodge_range - banim_mf_mi1_script
	.word banim_mf_mi1_mode_stand_close - banim_mf_mi1_script
	.word banim_mf_mi1_mode_stand - banim_mf_mi1_script
	.word banim_mf_mi1_mode_stand_range - banim_mf_mi1_script
	.word banim_mf_mi1_mode_attack_miss - banim_mf_mi1_script
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

