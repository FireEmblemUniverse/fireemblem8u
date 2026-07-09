@ vim:ft=armv4
	.global banim_sks_sw1_5_script
	.global banim_sks_sw1_5_oam_r
	.global banim_sks_sw1_5_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xA8
	.section .data.oam_l
banim_sks_sw1_5_oam_l:
banim_sks_sw1_5_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x91, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xB2, -16, 8
	banim_frame_end
banim_sks_sw1_5_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xB5, -16, 8
	banim_frame_end
banim_sks_sw1_5_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x18, -16, -8
	banim_frame_end
banim_sks_sw1_5_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0x98, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x9C, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xDC, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xF9, 0, 16
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
	banim_frame_end
	.section .data.oam_r
banim_sks_sw1_5_oam_r:
banim_sks_sw1_5_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x91, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 0, 8
	banim_frame_oam 0x0, 0x0, 0xB2, 8, 8
	banim_frame_end
banim_sks_sw1_5_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -24, 8
	banim_frame_oam 0x0, 0x0, 0xB5, 8, 8
	banim_frame_end
banim_sks_sw1_5_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -16, -8
	banim_frame_end
banim_sks_sw1_5_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0x98, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x9C, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -24, 8
	banim_frame_oam 0x0, 0x0, 0xDC, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xF9, -16, 16
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
	banim_frame_end
	.section .data.script
banim_sks_sw1_5_script:
banim_sks_sw1_5_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 3, banim_sks_sw1_5_oam_frame_3_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_5_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 3, banim_sks_sw1_5_oam_frame_3_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_5_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 3, banim_sks_sw1_5_oam_frame_3_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_5_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 3, banim_sks_sw1_5_oam_frame_3_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_5_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 3, banim_sks_sw1_5_oam_frame_3_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_5_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 3, banim_sks_sw1_5_oam_frame_3_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_5_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 3, banim_sks_sw1_5_oam_frame_3_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_5_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 3, banim_sks_sw1_5_oam_frame_3_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_5_mode_stand_close:
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sks_sw1_5_mode_stand:
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sks_sw1_5_mode_stand_range:
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sks_sw1_5_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 3, banim_sks_sw1_5_oam_frame_3_r - banim_sks_sw1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 2, banim_sks_sw1_5_oam_frame_2_r - banim_sks_sw1_5_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 1, banim_sks_sw1_5_oam_frame_1_r - banim_sks_sw1_5_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 0, banim_sks_sw1_5_oam_frame_0_r - banim_sks_sw1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_sks_sw1_5_mode_attack_close - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_attack_close_back - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_attack_close_critical - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_attack_close_critical_back - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_attack_range - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_attack_range_critical - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_dodge_close - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_dodge_range - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_stand_close - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_stand - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_stand_range - banim_sks_sw1_5_script
	.word banim_sks_sw1_5_mode_attack_miss - banim_sks_sw1_5_script
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

