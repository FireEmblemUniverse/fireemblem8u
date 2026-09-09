@ vim:ft=armv4
	.global banim_asnm_sw1_4_script
	.global banim_asnm_sw1_4_oam_r
	.global banim_asnm_sw1_4_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x8D
	.section .data.oam_l
banim_asnm_sw1_4_oam_l:
banim_asnm_sw1_4_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x81, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x60, 0, 0
	banim_frame_oam 0x0, 0x1000, 0x0, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0xDC, -16, 0
	banim_frame_end
banim_asnm_sw1_4_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xAA, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x8D, -7, -24
	banim_frame_oam 0x4000, 0x5000, 0x8E, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xAF, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, -24, 0
	banim_frame_end
banim_asnm_sw1_4_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xB3, -21, -8
	banim_frame_oam 0x4000, 0x5000, 0xF3, -21, 8
	banim_frame_oam 0x4000, 0x1000, 0x94, -11, -16
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
banim_asnm_sw1_4_oam_r:
banim_asnm_sw1_4_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x81, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x60, -8, 0
	banim_frame_oam 0x0, 0x0, 0x0, -1, -24
	banim_frame_oam 0x4000, 0x0, 0xDC, 0, 0
	banim_frame_end
banim_asnm_sw1_4_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xAA, -16, -16
	banim_frame_oam 0x0, 0x0, 0x8D, -1, -24
	banim_frame_oam 0x4000, 0x4000, 0x8E, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xAF, -8, 8
	banim_frame_oam 0x0, 0x0, 0xB1, 8, 8
	banim_frame_oam 0x0, 0x0, 0xAE, 16, 0
	banim_frame_end
banim_asnm_sw1_4_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xB3, -11, -8
	banim_frame_oam 0x4000, 0x4000, 0xF3, -11, 8
	banim_frame_oam 0x4000, 0x0, 0x94, -5, -16
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
banim_asnm_sw1_4_script:
banim_asnm_sw1_4_mode_attack_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 5, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 2, banim_asnm_sw1_4_oam_frame_2_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_4_mode_attack_close_back:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 5, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 2, banim_asnm_sw1_4_oam_frame_2_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_4_mode_attack_close_critical:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 5, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 2, banim_asnm_sw1_4_oam_frame_2_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_4_mode_attack_close_critical_back:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 5, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 2, banim_asnm_sw1_4_oam_frame_2_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_4_mode_attack_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 5, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 2, banim_asnm_sw1_4_oam_frame_2_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_4_mode_attack_range_critical:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 5, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 2, banim_asnm_sw1_4_oam_frame_2_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_4_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 5, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 2, banim_asnm_sw1_4_oam_frame_2_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_4_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 5, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 2, banim_asnm_sw1_4_oam_frame_2_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_4_mode_stand_close:
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_asnm_sw1_4_mode_stand:
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_asnm_sw1_4_mode_stand_range:
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_asnm_sw1_4_mode_attack_miss:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_4_oam_frame_0_r - banim_asnm_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 5, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 2, banim_asnm_sw1_4_oam_frame_2_r - banim_asnm_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 1, banim_asnm_sw1_4_oam_frame_1_r - banim_asnm_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_asnm_sw1_4_mode_attack_close - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_attack_close_back - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_attack_close_critical - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_attack_close_critical_back - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_attack_range - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_attack_range_critical - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_dodge_close - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_dodge_range - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_stand_close - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_stand - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_stand_range - banim_asnm_sw1_4_script
	.word banim_asnm_sw1_4_mode_attack_miss - banim_asnm_sw1_4_script
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

