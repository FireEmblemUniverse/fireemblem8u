@ vim:ft=armv4
	.global banim_trof_ro1_script
	.global banim_trof_ro1_oam_r
	.global banim_trof_ro1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x84
	.section .data.oam_l
banim_trof_ro1_oam_l:
banim_trof_ro1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -10, -31
	banim_frame_oam 0x4000, 0x1000, 0xE0, -10, -15
	banim_frame_oam 0x4000, 0x1000, 0xE2, -10, -7
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_trof_ro1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, -3, -32
	banim_frame_oam 0x8000, 0x5000, 0x12, -11, -32
	banim_frame_oam 0x0, 0x9000, 0x5, -13, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -21, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -21, 8
	banim_frame_oam 0x8000, 0x1000, 0xA4, 19, -8
	banim_frame_end
banim_trof_ro1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x91, -1, -34
	banim_frame_oam 0x8000, 0x5000, 0x93, -9, -34
	banim_frame_oam 0x0, 0x9000, 0xA, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0xE, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x8A, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x8E, -16, 0
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
banim_trof_ro1_oam_r:
banim_trof_ro1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -6, -31
	banim_frame_oam 0x4000, 0x0, 0xE0, -6, -15
	banim_frame_oam 0x4000, 0x0, 0xE2, -6, -7
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_trof_ro1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -13, -32
	banim_frame_oam 0x8000, 0x4000, 0x12, 3, -32
	banim_frame_oam 0x0, 0x8000, 0x5, -19, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 13, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, 13, 8
	banim_frame_oam 0x8000, 0x0, 0xA4, -27, -8
	banim_frame_end
banim_trof_ro1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x91, -15, -34
	banim_frame_oam 0x8000, 0x4000, 0x93, 1, -34
	banim_frame_oam 0x0, 0x8000, 0xA, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0xE, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x8A, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x8E, 8, 0
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
banim_trof_ro1_script:
banim_trof_ro1_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 2, banim_trof_ro1_oam_frame_2_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 2, banim_trof_ro1_oam_frame_2_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 2, banim_trof_ro1_oam_frame_2_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 2, banim_trof_ro1_oam_frame_2_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 2, banim_trof_ro1_oam_frame_2_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 2, banim_trof_ro1_oam_frame_2_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 2, banim_trof_ro1_oam_frame_2_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 2, banim_trof_ro1_oam_frame_2_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 1, banim_trof_ro1_oam_frame_1_r - banim_trof_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_mode_stand_close:
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_trof_ro1_mode_stand:
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_trof_ro1_mode_stand_range:
	banim_code_frame 1, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_trof_ro1_mode_attack_miss:
	banim_code_frame 4, banim_trof_ro1_sheet_0, 0, banim_trof_ro1_oam_frame_0_r - banim_trof_ro1_oam_r
	banim_code_end_mode
	.section .data.modes
	.word banim_trof_ro1_mode_attack_close - banim_trof_ro1_script
	.word banim_trof_ro1_mode_attack_close_back - banim_trof_ro1_script
	.word banim_trof_ro1_mode_attack_close_critical - banim_trof_ro1_script
	.word banim_trof_ro1_mode_attack_close_critical_back - banim_trof_ro1_script
	.word banim_trof_ro1_mode_attack_range - banim_trof_ro1_script
	.word banim_trof_ro1_mode_attack_range_critical - banim_trof_ro1_script
	.word banim_trof_ro1_mode_dodge_close - banim_trof_ro1_script
	.word banim_trof_ro1_mode_dodge_range - banim_trof_ro1_script
	.word banim_trof_ro1_mode_stand_close - banim_trof_ro1_script
	.word banim_trof_ro1_mode_stand - banim_trof_ro1_script
	.word banim_trof_ro1_mode_stand_range - banim_trof_ro1_script
	.word banim_trof_ro1_mode_attack_miss - banim_trof_ro1_script
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

