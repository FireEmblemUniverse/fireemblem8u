@ vim:ft=armv4
	.global banim_lorf_sw1_2_script
	.global banim_lorf_sw1_2_oam_r
	.global banim_lorf_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x3
	.section .data.oam_l
banim_lorf_sw1_2_oam_l:
banim_lorf_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x17, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x39, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x19, 8, 8
	banim_frame_end
banim_lorf_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x1A, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x9A, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x3C, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x1C, 8, 8
	banim_frame_end
banim_lorf_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0xB5, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xB7, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xF5, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xF7, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xB8, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xBA, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xF8, 8, 8
	banim_frame_end
banim_lorf_sw1_2_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x3D, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x3F, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xBD, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xBF, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xDE, 8, 8
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
banim_lorf_sw1_2_oam_r:
banim_lorf_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x17, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x39, 8, -16
	banim_frame_oam 0x0, 0x0, 0x19, -16, 8
	banim_frame_end
banim_lorf_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x1A, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x9A, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x3C, 8, -16
	banim_frame_oam 0x0, 0x0, 0x1C, -16, 8
	banim_frame_end
banim_lorf_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0xB5, -8, -24
	banim_frame_oam 0x8000, 0x0, 0xB7, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xF5, -8, -8
	banim_frame_oam 0x0, 0x0, 0xF7, 8, -8
	banim_frame_oam 0x0, 0x4000, 0xB8, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xBA, 8, 0
	banim_frame_oam 0x0, 0x0, 0xF8, -16, 8
	banim_frame_end
banim_lorf_sw1_2_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x3D, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x3F, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xBD, -8, 8
	banim_frame_oam 0x0, 0x0, 0xBF, 8, 8
	banim_frame_oam 0x0, 0x0, 0xDE, -16, 8
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
banim_lorf_sw1_2_script:
banim_lorf_sw1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 3, banim_lorf_sw1_2_oam_frame_3_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 3, banim_lorf_sw1_2_oam_frame_3_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 3, banim_lorf_sw1_2_oam_frame_3_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 3, banim_lorf_sw1_2_oam_frame_3_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 3, banim_lorf_sw1_2_oam_frame_3_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 3, banim_lorf_sw1_2_oam_frame_3_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 3, banim_lorf_sw1_2_oam_frame_3_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 3, banim_lorf_sw1_2_oam_frame_3_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorf_sw1_2_mode_stand:
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorf_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorf_sw1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 0, banim_lorf_sw1_2_oam_frame_0_r - banim_lorf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 3, banim_lorf_sw1_2_oam_frame_3_r - banim_lorf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 2, banim_lorf_sw1_2_oam_frame_2_r - banim_lorf_sw1_2_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_3, 1, banim_lorf_sw1_2_oam_frame_1_r - banim_lorf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_lorf_sw1_2_mode_attack_close - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_attack_close_back - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_attack_close_critical - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_attack_close_critical_back - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_attack_range - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_attack_range_critical - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_dodge_close - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_dodge_range - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_stand_close - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_stand - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_stand_range - banim_lorf_sw1_2_script
	.word banim_lorf_sw1_2_mode_attack_miss - banim_lorf_sw1_2_script
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

