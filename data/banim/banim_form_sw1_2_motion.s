@ vim:ft=armv4
	.global banim_form_sw1_2_script
	.global banim_form_sw1_2_oam_r
	.global banim_form_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x2F
	.section .data.oam_l
banim_form_sw1_2_oam_l:
banim_form_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x1, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x5, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x81, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x85, -32, 0
	banim_frame_end
banim_form_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x16, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1A, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x96, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x9A, -24, 0
	banim_frame_end
banim_form_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x1B, -15, -33
	banim_frame_oam 0x4000, 0x9000, 0x9B, -15, -1
	banim_frame_oam 0x8000, 0x5000, 0x3F, -23, -25
	banim_frame_oam 0x0, 0x1000, 0xBF, -23, 7
	banim_frame_oam 0x0, 0x1000, 0xFC, -23, -33
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
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
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_form_sw1_2_oam_r:
banim_form_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x1, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x5, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x81, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x85, 24, 0
	banim_frame_end
banim_form_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x1A, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x96, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x9A, 16, 0
	banim_frame_end
banim_form_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x1B, -17, -33
	banim_frame_oam 0x4000, 0x8000, 0x9B, -17, -1
	banim_frame_oam 0x8000, 0x4000, 0x3F, 15, -25
	banim_frame_oam 0x0, 0x0, 0xBF, 15, 7
	banim_frame_oam 0x0, 0x0, 0xFC, 15, -33
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
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
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_form_sw1_2_script:
banim_form_sw1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 2, banim_form_sw1_2_oam_frame_2_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_sw1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 2, banim_form_sw1_2_oam_frame_2_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_sw1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 2, banim_form_sw1_2_oam_frame_2_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_sw1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 2, banim_form_sw1_2_oam_frame_2_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_sw1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 2, banim_form_sw1_2_oam_frame_2_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_sw1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 2, banim_form_sw1_2_oam_frame_2_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 2, banim_form_sw1_2_oam_frame_2_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 2, banim_form_sw1_2_oam_frame_2_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_form_sw1_2_mode_stand:
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_form_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_form_sw1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 2, banim_form_sw1_2_oam_frame_2_r - banim_form_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_form_sw1_sheet_0, 1, banim_form_sw1_2_oam_frame_1_r - banim_form_sw1_2_oam_r
	banim_code_frame 1, banim_form_sw1_sheet_0, 0, banim_form_sw1_2_oam_frame_0_r - banim_form_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_form_sw1_2_mode_attack_close - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_attack_close_back - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_attack_close_critical - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_attack_close_critical_back - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_attack_range - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_attack_range_critical - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_dodge_close - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_dodge_range - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_stand_close - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_stand - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_stand_range - banim_form_sw1_2_script
	.word banim_form_sw1_2_mode_attack_miss - banim_form_sw1_2_script
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

