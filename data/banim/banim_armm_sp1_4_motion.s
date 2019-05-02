@ vim:ft=armv4
	.global banim_armm_sp1_4_script
	.global banim_armm_sp1_4_oam_r
	.global banim_armm_sp1_4_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x42
	.section .data.oam_l
banim_armm_sp1_4_oam_l:
banim_armm_sp1_4_oam_frame_0_l:
	banim_frame_oam 0x0, 0x1000, 0x6F, 10, -16
	banim_frame_oam 0x0, 0x1000, 0x70, 10, -8
	banim_frame_oam 0x0, 0x1000, 0x71, 10, 0
	banim_frame_oam 0x0, 0x9000, 0x53, -22, -24
	banim_frame_oam 0x4000, 0x5000, 0xD3, -22, 8
	banim_frame_end
banim_armm_sp1_4_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x8E, -18, -28
	banim_frame_oam 0x8000, 0x1000, 0xB2, -26, -20
	banim_frame_oam 0x0, 0x1000, 0xF2, -26, -4
	banim_frame_oam 0x4000, 0x1000, 0xCC, -2, 4
	banim_frame_oam 0x4000, 0x1000, 0xEC, -18, 4
	banim_frame_oam 0x0, 0x1000, 0x92, -26, 4
	banim_frame_end
banim_armm_sp1_4_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xF, -19, -27
	banim_frame_oam 0x4000, 0x5000, 0x4F, -19, -11
	banim_frame_oam 0x4000, 0x9000, 0x14, -19, -3
	banim_frame_oam 0x0, 0x1000, 0x13, -27, -11
	banim_frame_oam 0x0, 0x1000, 0x33, 13, -19
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
banim_armm_sp1_4_oam_r:
banim_armm_sp1_4_oam_frame_0_r:
	banim_frame_oam 0x0, 0x0, 0x6F, -18, -16
	banim_frame_oam 0x0, 0x0, 0x70, -18, -8
	banim_frame_oam 0x0, 0x0, 0x71, -18, 0
	banim_frame_oam 0x0, 0x8000, 0x53, -10, -24
	banim_frame_oam 0x4000, 0x4000, 0xD3, -10, 8
	banim_frame_end
banim_armm_sp1_4_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x8E, -14, -28
	banim_frame_oam 0x8000, 0x0, 0xB2, 18, -20
	banim_frame_oam 0x0, 0x0, 0xF2, 18, -4
	banim_frame_oam 0x4000, 0x0, 0xCC, -14, 4
	banim_frame_oam 0x4000, 0x0, 0xEC, 2, 4
	banim_frame_oam 0x0, 0x0, 0x92, 18, 4
	banim_frame_end
banim_armm_sp1_4_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xF, -13, -27
	banim_frame_oam 0x4000, 0x4000, 0x4F, -13, -11
	banim_frame_oam 0x4000, 0x8000, 0x14, -13, -3
	banim_frame_oam 0x0, 0x0, 0x13, 19, -11
	banim_frame_oam 0x0, 0x0, 0x33, -21, -19
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
banim_armm_sp1_4_script:
banim_armm_sp1_4_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_frame 1, banim_armm_sp1_sheet_2, 2, banim_armm_sp1_4_oam_frame_2_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_4_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_frame 1, banim_armm_sp1_sheet_2, 2, banim_armm_sp1_4_oam_frame_2_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_4_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_frame 1, banim_armm_sp1_sheet_2, 2, banim_armm_sp1_4_oam_frame_2_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_4_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_frame 1, banim_armm_sp1_sheet_2, 2, banim_armm_sp1_4_oam_frame_2_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_4_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_frame 1, banim_armm_sp1_sheet_2, 2, banim_armm_sp1_4_oam_frame_2_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_4_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_frame 1, banim_armm_sp1_sheet_2, 2, banim_armm_sp1_4_oam_frame_2_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_4_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_frame 1, banim_armm_sp1_sheet_2, 2, banim_armm_sp1_4_oam_frame_2_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_4_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_frame 1, banim_armm_sp1_sheet_2, 2, banim_armm_sp1_4_oam_frame_2_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_4_mode_stand_close:
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_armm_sp1_4_mode_stand:
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_armm_sp1_4_mode_stand_range:
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_armm_sp1_4_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_2, 0, banim_armm_sp1_4_oam_frame_0_r - banim_armm_sp1_4_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_frame 1, banim_armm_sp1_sheet_2, 2, banim_armm_sp1_4_oam_frame_2_r - banim_armm_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_2, 1, banim_armm_sp1_4_oam_frame_1_r - banim_armm_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_armm_sp1_4_mode_attack_close - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_attack_close_back - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_attack_close_critical - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_attack_close_critical_back - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_attack_range - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_attack_range_critical - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_dodge_close - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_dodge_range - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_stand_close - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_stand - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_stand_range - banim_armm_sp1_4_script
	.word banim_armm_sp1_4_mode_attack_miss - banim_armm_sp1_4_script
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

