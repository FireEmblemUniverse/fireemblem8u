@ vim:ft=armv4
	.global banim_bisf_mg1_2_script
	.global banim_bisf_mg1_2_oam_r
	.global banim_bisf_mg1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x83
	.section .data.oam_l
banim_bisf_mg1_2_oam_l:
banim_bisf_mg1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -3, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -11, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -3, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -11, 8
	banim_frame_end
banim_bisf_mg1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x1000, 0xA0, 14, -24
	banim_frame_oam 0x0, 0x1000, 0xE0, 14, -8
	banim_frame_oam 0x0, 0x1000, 0xA1, -5, -24
	banim_frame_oam 0x8000, 0x9000, 0x3, -2, -16
	banim_frame_oam 0x8000, 0x5000, 0x5, -10, -16
	banim_frame_oam 0x0, 0x1000, 0xC1, -18, -5
	banim_frame_end
banim_bisf_mg1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x83, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xA2, -16, -16
	banim_frame_oam 0x4000, 0x9000, 0xC3, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -9, 8
	banim_frame_oam 0x0, 0x1000, 0xC2, 7, 8
	banim_frame_end
banim_bisf_mg1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0xE8, -10, -9
	banim_frame_oam 0x0, 0x1000, 0xC7, -6, -6
	banim_frame_oam 0x0, 0x5000, 0xDD, -13, -9
	banim_frame_oam 0x4000, 0x1000, 0xBE, -21, -17
	banim_frame_oam 0x8000, 0x9000, 0x6, -3, -18
	banim_frame_oam 0x8000, 0x5000, 0x8, -11, -18
	banim_frame_oam 0x0, 0x1000, 0x87, -5, -26
	banim_frame_end
banim_bisf_mg1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0xE8, -13, -14
	banim_frame_oam 0x0, 0x1000, 0xC7, -9, -11
	banim_frame_oam 0x0, 0x5000, 0xDD, -14, -13
	banim_frame_oam 0x4000, 0x1000, 0xBE, -22, -21
	banim_frame_oam 0x8000, 0x9000, 0x9, -1, -19
	banim_frame_oam 0x8000, 0x5000, 0xB, -9, -19
	banim_frame_oam 0x0, 0x1000, 0xA7, -5, -27
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
banim_bisf_mg1_2_oam_r:
banim_bisf_mg1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -13, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 3, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -13, 8
	banim_frame_oam 0x0, 0x0, 0x82, 3, 8
	banim_frame_end
banim_bisf_mg1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x0, 0xA0, -22, -24
	banim_frame_oam 0x0, 0x0, 0xE0, -22, -8
	banim_frame_oam 0x0, 0x0, 0xA1, -3, -24
	banim_frame_oam 0x8000, 0x8000, 0x3, -14, -16
	banim_frame_oam 0x8000, 0x4000, 0x5, 2, -16
	banim_frame_oam 0x0, 0x0, 0xC1, 10, -5
	banim_frame_end
banim_bisf_mg1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x83, -24, -24
	banim_frame_oam 0x0, 0x0, 0xA2, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0xC3, -17, -8
	banim_frame_oam 0x4000, 0x0, 0xE1, -7, 8
	banim_frame_oam 0x0, 0x0, 0xC2, -15, 8
	banim_frame_end
banim_bisf_mg1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0xE8, 2, -9
	banim_frame_oam 0x0, 0x0, 0xC7, -2, -6
	banim_frame_oam 0x0, 0x4000, 0xDD, -3, -9
	banim_frame_oam 0x4000, 0x0, 0xBE, 5, -17
	banim_frame_oam 0x8000, 0x8000, 0x6, -13, -18
	banim_frame_oam 0x8000, 0x4000, 0x8, 3, -18
	banim_frame_oam 0x0, 0x0, 0x87, -3, -26
	banim_frame_end
banim_bisf_mg1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0xE8, 5, -14
	banim_frame_oam 0x0, 0x0, 0xC7, 1, -11
	banim_frame_oam 0x0, 0x4000, 0xDD, -2, -13
	banim_frame_oam 0x4000, 0x0, 0xBE, 6, -21
	banim_frame_oam 0x8000, 0x8000, 0x9, -15, -19
	banim_frame_oam 0x8000, 0x4000, 0xB, 1, -19
	banim_frame_oam 0x0, 0x0, 0xA7, -3, -27
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
banim_bisf_mg1_2_script:
banim_bisf_mg1_2_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_2_oam_frame_2_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_2_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_2_oam_frame_2_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_2_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_2_oam_frame_2_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_2_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_2_oam_frame_2_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_2_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_2_oam_frame_2_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_2_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_2_oam_frame_2_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_2_oam_frame_3_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 4, banim_bisf_mg1_2_oam_frame_4_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_2_oam_frame_3_r - banim_bisf_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_2_oam_frame_3_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 4, banim_bisf_mg1_2_oam_frame_4_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_2_oam_frame_3_r - banim_bisf_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_2_mode_stand_close:
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bisf_mg1_2_mode_stand:
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bisf_mg1_2_mode_stand_range:
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bisf_mg1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_2_oam_frame_2_r - banim_bisf_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_2_oam_frame_1_r - banim_bisf_mg1_2_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_2_oam_frame_0_r - banim_bisf_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bisf_mg1_2_mode_attack_close - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_attack_close_back - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_attack_close_critical - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_attack_close_critical_back - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_attack_range - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_attack_range_critical - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_dodge_close - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_dodge_range - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_stand_close - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_stand - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_stand_range - banim_bisf_mg1_2_script
	.word banim_bisf_mg1_2_mode_attack_miss - banim_bisf_mg1_2_script
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

