@ vim:ft=armv4
	.global banim_prim_ro1_script
	.global banim_prim_ro1_oam_r
	.global banim_prim_ro1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x7D
	.section .data.oam_l
banim_prim_ro1_oam_l:
banim_prim_ro1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xCB, -7, 0
	banim_frame_oam 0x8000, 0x1000, 0xCD, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x4, -5, -24
	banim_frame_end
banim_prim_ro1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, -3, -18
	banim_frame_oam 0x8000, 0x5000, 0x12, -11, -18
	banim_frame_oam 0x4000, 0x1000, 0x4, -5, -26
	banim_frame_end
banim_prim_ro1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x90, -5, -19
	banim_frame_oam 0x8000, 0x1000, 0x92, -13, -19
	banim_frame_oam 0x0, 0x5000, 0xCE, -5, -3
	banim_frame_oam 0x8000, 0x1000, 0xD0, -13, -3
	banim_frame_oam 0x4000, 0x1000, 0x4, -6, -27
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
banim_prim_ro1_oam_r:
banim_prim_ro1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, -16
	banim_frame_oam 0x0, 0x4000, 0xCB, -9, 0
	banim_frame_oam 0x8000, 0x0, 0xCD, 7, 0
	banim_frame_oam 0x4000, 0x0, 0x4, -11, -24
	banim_frame_end
banim_prim_ro1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -13, -18
	banim_frame_oam 0x8000, 0x4000, 0x12, 3, -18
	banim_frame_oam 0x4000, 0x0, 0x4, -11, -26
	banim_frame_end
banim_prim_ro1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x90, -11, -19
	banim_frame_oam 0x8000, 0x0, 0x92, 5, -19
	banim_frame_oam 0x0, 0x4000, 0xCE, -11, -3
	banim_frame_oam 0x8000, 0x0, 0xD0, 5, -3
	banim_frame_oam 0x4000, 0x0, 0x4, -10, -27
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
banim_prim_ro1_script:
banim_prim_ro1_mode_attack_close:
banim_prim_ro1_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_oam_frame_2_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_oam_frame_2_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_oam_frame_2_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_oam_frame_2_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_oam_frame_2_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_oam_frame_2_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_oam_frame_2_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_oam_frame_2_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_oam_frame_1_r - banim_prim_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_mode_stand_close:
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_prim_ro1_mode_stand:
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_prim_ro1_mode_stand_range:
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_oam_frame_0_r - banim_prim_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
	.section .data.modes
	.word banim_prim_ro1_mode_attack_close - banim_prim_ro1_script
	.word banim_prim_ro1_mode_attack_close_back - banim_prim_ro1_script
	.word banim_prim_ro1_mode_attack_close_critical - banim_prim_ro1_script
	.word banim_prim_ro1_mode_attack_close_critical_back - banim_prim_ro1_script
	.word banim_prim_ro1_mode_attack_range - banim_prim_ro1_script
	.word banim_prim_ro1_mode_attack_range_critical - banim_prim_ro1_script
	.word banim_prim_ro1_mode_dodge_close - banim_prim_ro1_script
	.word banim_prim_ro1_mode_dodge_range - banim_prim_ro1_script
	.word banim_prim_ro1_mode_stand_close - banim_prim_ro1_script
	.word banim_prim_ro1_mode_stand - banim_prim_ro1_script
	.word banim_prim_ro1_mode_stand_range - banim_prim_ro1_script
	.word banim_prim_ro1_mode_attack_miss - banim_prim_ro1_script
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

