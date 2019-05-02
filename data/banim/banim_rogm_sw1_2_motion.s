@ vim:ft=armv4
	.global banim_rogm_sw1_2_script
	.global banim_rogm_sw1_2_oam_r
	.global banim_rogm_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x8F
	.section .data.oam_l
banim_rogm_sw1_2_oam_l:
banim_rogm_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x6, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -16, 8
	banim_frame_end
banim_rogm_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x87, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xA, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x2A, 8, 0
	banim_frame_end
banim_rogm_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x60, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xC2, -24, -16
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
banim_rogm_sw1_2_oam_r:
banim_rogm_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x6, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x84, -8, 8
	banim_frame_oam 0x0, 0x0, 0x86, 8, 8
	banim_frame_end
banim_rogm_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x87, -8, 8
	banim_frame_oam 0x0, 0x0, 0x89, 8, 8
	banim_frame_oam 0x0, 0x0, 0xA, 16, -8
	banim_frame_oam 0x0, 0x0, 0x2A, -16, 0
	banim_frame_end
banim_rogm_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x60, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -8, 8
	banim_frame_oam 0x4000, 0x0, 0xC2, 8, -16
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
banim_rogm_sw1_2_script:
banim_rogm_sw1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 2, banim_rogm_sw1_2_oam_frame_2_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 2, banim_rogm_sw1_2_oam_frame_2_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 2, banim_rogm_sw1_2_oam_frame_2_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 2, banim_rogm_sw1_2_oam_frame_2_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 2, banim_rogm_sw1_2_oam_frame_2_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 2, banim_rogm_sw1_2_oam_frame_2_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 2, banim_rogm_sw1_2_oam_frame_2_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 2, banim_rogm_sw1_2_oam_frame_2_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_rogm_sw1_2_mode_stand:
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_rogm_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_rogm_sw1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 0, banim_rogm_sw1_2_oam_frame_0_r - banim_rogm_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 2, banim_rogm_sw1_2_oam_frame_2_r - banim_rogm_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 1, banim_rogm_sw1_2_oam_frame_1_r - banim_rogm_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_rogm_sw1_2_mode_attack_close - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_attack_close_back - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_attack_close_critical - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_attack_close_critical_back - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_attack_range - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_attack_range_critical - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_dodge_close - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_dodge_range - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_stand_close - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_stand - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_stand_range - banim_rogm_sw1_2_script
	.word banim_rogm_sw1_2_mode_attack_miss - banim_rogm_sw1_2_script
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

