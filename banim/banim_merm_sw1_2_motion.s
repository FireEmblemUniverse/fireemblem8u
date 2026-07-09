@ vim:ft=armv4
	.global banim_merm_sw1_2_script
	.global banim_merm_sw1_2_oam_r
	.global banim_merm_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB
	.section .data.oam_l
banim_merm_sw1_2_oam_l:
banim_merm_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xB9, -3, -8
	banim_frame_oam 0x8000, 0x1000, 0xBB, -11, -8
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_oam 0x4000, 0x1000, 0x9A, -3, -16
	banim_frame_oam 0x0, 0x1000, 0x9C, -11, -16
	banim_frame_oam 0x4000, 0x1000, 0x7A, -11, -24
	banim_frame_end
banim_merm_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x19, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x59, -7, -8
	banim_frame_oam 0x0, 0x1000, 0x3B, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0x1B, -7, 0
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_end
banim_merm_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x5B, 6, 0
	banim_frame_oam 0x0, 0x1000, 0x7C, -2, 0
	banim_frame_oam 0x4000, 0x1000, 0x1D, -2, -24
	banim_frame_oam 0x0, 0x5000, 0x3C, -2, -16
	banim_frame_oam 0x8000, 0x1000, 0x94, -10, -16
	banim_frame_oam 0x0, 0x1000, 0xD4, -10, 0
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
banim_merm_sw1_2_oam_r:
banim_merm_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xB9, -13, -8
	banim_frame_oam 0x8000, 0x0, 0xBB, 3, -8
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_oam 0x4000, 0x0, 0x9A, -13, -16
	banim_frame_oam 0x0, 0x0, 0x9C, 3, -16
	banim_frame_oam 0x4000, 0x0, 0x7A, -5, -24
	banim_frame_end
banim_merm_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x19, -9, -24
	banim_frame_oam 0x4000, 0x0, 0x59, -9, -8
	banim_frame_oam 0x0, 0x0, 0x3B, 7, -8
	banim_frame_oam 0x4000, 0x0, 0x1B, -9, 0
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_end
banim_merm_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_oam 0x0, 0x0, 0x5B, -14, 0
	banim_frame_oam 0x0, 0x0, 0x7C, -6, 0
	banim_frame_oam 0x4000, 0x0, 0x1D, -14, -24
	banim_frame_oam 0x0, 0x4000, 0x3C, -14, -16
	banim_frame_oam 0x8000, 0x0, 0x94, 2, -16
	banim_frame_oam 0x0, 0x0, 0xD4, 2, 0
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
banim_merm_sw1_2_script:
banim_merm_sw1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 2, banim_merm_sw1_2_oam_frame_2_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 2, banim_merm_sw1_2_oam_frame_2_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 2, banim_merm_sw1_2_oam_frame_2_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 2, banim_merm_sw1_2_oam_frame_2_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 2, banim_merm_sw1_2_oam_frame_2_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 2, banim_merm_sw1_2_oam_frame_2_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 2, banim_merm_sw1_2_oam_frame_2_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 2, banim_merm_sw1_2_oam_frame_2_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_merm_sw1_2_mode_stand:
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_merm_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_merm_sw1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_2, 0, banim_merm_sw1_2_oam_frame_0_r - banim_merm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 2, banim_merm_sw1_2_oam_frame_2_r - banim_merm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 1, banim_merm_sw1_2_oam_frame_1_r - banim_merm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_merm_sw1_2_mode_attack_close - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_attack_close_back - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_attack_close_critical - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_attack_close_critical_back - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_attack_range - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_attack_range_critical - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_dodge_close - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_dodge_range - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_stand_close - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_stand - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_stand_range - banim_merm_sw1_2_script
	.word banim_merm_sw1_2_mode_attack_miss - banim_merm_sw1_2_script
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

