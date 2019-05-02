@ vim:ft=armv4
	.global banim_sagm_mg1_2_script
	.global banim_sagm_mg1_2_oam_r
	.global banim_sagm_mg1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x6D
	.section .data.oam_l
banim_sagm_mg1_2_oam_l:
banim_sagm_mg1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x1000, 0xCC, 6, -16
	banim_frame_oam 0x0, 0x1000, 0xEC, 6, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, 4, -8
	banim_frame_oam 0x0, 0x1000, 0xEB, 4, 0
	banim_frame_oam 0x0, 0x1000, 0xCD, -2, -16
	banim_frame_oam 0x0, 0x5000, 0x21, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x23, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x61, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x63, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x0, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x60, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x1, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x14, -11, -24
	banim_frame_end
banim_sagm_mg1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xAF, -14, -8
	banim_frame_oam 0x4000, 0x5000, 0xEF, -14, 8
	banim_frame_oam 0x4000, 0x1000, 0x8F, 2, -16
	banim_frame_oam 0x0, 0x1000, 0x91, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x92, -2, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, 10, -19
	banim_frame_oam 0x0, 0x1000, 0xCE, 10, -11
	banim_frame_oam 0x0, 0x1000, 0x14, -10, -24
	banim_frame_end
banim_sagm_mg1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xB3, -12, -8
	banim_frame_oam 0x4000, 0x5000, 0xF3, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0x93, 2, -16
	banim_frame_oam 0x0, 0x1000, 0x95, -6, -16
	banim_frame_oam 0x4000, 0x1000, 0x96, -6, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, 11, -25
	banim_frame_oam 0x0, 0x1000, 0xCE, 11, -17
	banim_frame_oam 0x0, 0x1000, 0xB7, -20, 1
	banim_frame_end
banim_sagm_mg1_2_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x9000, 0xAE, -14, -8
	banim_frame_oam 0x4000, 0x5000, 0xEE, -14, 8
	banim_frame_oam 0x4000, 0x1000, 0xCC, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xEC, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xEB, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x8E, 0, -24
	banim_frame_end
banim_sagm_mg1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0x69, 10, 8
	banim_frame_oam 0x0, 0x1000, 0xD, -22, 8
	banim_frame_oam 0x0, 0x1000, 0x48, -2, -24
	banim_frame_oam 0x0, 0x1000, 0x68, -10, -24
	banim_frame_oam 0x0, 0x1000, 0x6A, 2, 8
	banim_frame_oam 0x4000, 0x1000, 0xE, -14, 8
	banim_frame_oam 0x0, 0x5000, 0x4D, -17, -8
	banim_frame_oam 0x4000, 0x1000, 0x2D, -17, -16
	banim_frame_oam 0x0, 0x1000, 0x2F, -25, -16
	banim_frame_oam 0x0, 0x1000, 0x4F, -17, -24
	banim_frame_oam 0x0, 0x5000, 0xA, -6, -16
	banim_frame_oam 0x4000, 0x1000, 0x4A, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x29, 10, -8
	banim_frame_end
banim_sagm_mg1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
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
banim_sagm_mg1_2_oam_r:
banim_sagm_mg1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x0, 0xCC, -14, -16
	banim_frame_oam 0x0, 0x0, 0xEC, -14, 8
	banim_frame_oam 0x0, 0x0, 0xEA, -12, -8
	banim_frame_oam 0x0, 0x0, 0xEB, -12, 0
	banim_frame_oam 0x0, 0x0, 0xCD, -6, -16
	banim_frame_oam 0x0, 0x4000, 0x21, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x23, 0, -8
	banim_frame_oam 0x4000, 0x0, 0x61, -16, 8
	banim_frame_oam 0x0, 0x0, 0x63, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -16
	banim_frame_oam 0x0, 0x0, 0x40, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x0, 8, -8
	banim_frame_oam 0x0, 0x0, 0x60, 8, 8
	banim_frame_oam 0x0, 0x0, 0x1, -5, -24
	banim_frame_oam 0x0, 0x0, 0x14, 3, -24
	banim_frame_end
banim_sagm_mg1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xAF, -18, -8
	banim_frame_oam 0x4000, 0x4000, 0xEF, -18, 8
	banim_frame_oam 0x4000, 0x0, 0x8F, -18, -16
	banim_frame_oam 0x0, 0x0, 0x91, -2, -16
	banim_frame_oam 0x0, 0x0, 0x92, -6, -24
	banim_frame_oam 0x4000, 0x0, 0xED, -26, -19
	banim_frame_oam 0x0, 0x0, 0xCE, -18, -11
	banim_frame_oam 0x0, 0x0, 0x14, 2, -24
	banim_frame_end
banim_sagm_mg1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xB3, -20, -8
	banim_frame_oam 0x4000, 0x4000, 0xF3, -20, 8
	banim_frame_oam 0x4000, 0x0, 0x93, -18, -16
	banim_frame_oam 0x0, 0x0, 0x95, -2, -16
	banim_frame_oam 0x4000, 0x0, 0x96, -10, -24
	banim_frame_oam 0x4000, 0x0, 0xED, -27, -25
	banim_frame_oam 0x0, 0x0, 0xCE, -19, -17
	banim_frame_oam 0x0, 0x0, 0xB7, 12, 1
	banim_frame_end
banim_sagm_mg1_2_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x8000, 0xAE, -18, -8
	banim_frame_oam 0x4000, 0x4000, 0xEE, -18, 8
	banim_frame_oam 0x4000, 0x0, 0xCC, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xEC, 0, -16
	banim_frame_oam 0x0, 0x0, 0xEB, 0, -24
	banim_frame_oam 0x0, 0x0, 0x8E, -8, -24
	banim_frame_end
banim_sagm_mg1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0x69, -18, 8
	banim_frame_oam 0x0, 0x0, 0xD, 14, 8
	banim_frame_oam 0x0, 0x0, 0x48, -6, -24
	banim_frame_oam 0x0, 0x0, 0x68, 2, -24
	banim_frame_oam 0x0, 0x0, 0x6A, -10, 8
	banim_frame_oam 0x4000, 0x0, 0xE, -2, 8
	banim_frame_oam 0x0, 0x4000, 0x4D, 1, -8
	banim_frame_oam 0x4000, 0x0, 0x2D, 1, -16
	banim_frame_oam 0x0, 0x0, 0x2F, 17, -16
	banim_frame_oam 0x0, 0x0, 0x4F, 9, -24
	banim_frame_oam 0x0, 0x4000, 0xA, -10, -16
	banim_frame_oam 0x4000, 0x0, 0x4A, -10, 0
	banim_frame_oam 0x8000, 0x0, 0x29, -18, -8
	banim_frame_end
banim_sagm_mg1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -8, -8
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
banim_sagm_mg1_2_script:
banim_sagm_mg1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 2, banim_sagm_mg1_2_oam_frame_2_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagm_mg1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 5, banim_sagm_mg1_2_oam_frame_3_r - banim_sagm_mg1_2_oam_r
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 5, banim_sagm_mg1_2_oam_frame_3_r - banim_sagm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 5, banim_sagm_mg1_2_oam_frame_3_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 5, banim_sagm_mg1_2_oam_frame_3_r - banim_sagm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagm_mg1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 2, banim_sagm_mg1_2_oam_frame_2_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagm_mg1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 5, banim_sagm_mg1_2_oam_frame_3_r - banim_sagm_mg1_2_oam_r
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 5, banim_sagm_mg1_2_oam_frame_3_r - banim_sagm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 5, banim_sagm_mg1_2_oam_frame_3_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 5, banim_sagm_mg1_2_oam_frame_3_r - banim_sagm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagm_mg1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 2, banim_sagm_mg1_2_oam_frame_2_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagm_mg1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 2, banim_sagm_mg1_2_oam_frame_2_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagm_mg1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sagm_mg1_sheet_2, 3, banim_sagm_mg1_2_oam_frame_4_r - banim_sagm_mg1_2_oam_r
	banim_code_frame 1, banim_sagm_mg1_sheet_2, 4, banim_sagm_mg1_2_oam_frame_5_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sagm_mg1_sheet_2, 3, banim_sagm_mg1_2_oam_frame_4_r - banim_sagm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagm_mg1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sagm_mg1_sheet_2, 3, banim_sagm_mg1_2_oam_frame_4_r - banim_sagm_mg1_2_oam_r
	banim_code_frame 1, banim_sagm_mg1_sheet_2, 4, banim_sagm_mg1_2_oam_frame_5_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sagm_mg1_sheet_2, 3, banim_sagm_mg1_2_oam_frame_4_r - banim_sagm_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagm_mg1_2_mode_stand_close:
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sagm_mg1_2_mode_stand:
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sagm_mg1_2_mode_stand_range:
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sagm_mg1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_hit_critical_1
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 0, banim_sagm_mg1_2_oam_frame_0_r - banim_sagm_mg1_2_oam_r
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sagm_mg1_sheet_0, 2, banim_sagm_mg1_2_oam_frame_2_r - banim_sagm_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_attack_2
	banim_code_frame 4, banim_sagm_mg1_sheet_0, 1, banim_sagm_mg1_2_oam_frame_1_r - banim_sagm_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_sagm_mg1_2_mode_attack_close - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_attack_close_back - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_attack_close_critical - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_attack_close_critical_back - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_attack_range - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_attack_range_critical - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_dodge_close - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_dodge_range - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_stand_close - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_stand - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_stand_range - banim_sagm_mg1_2_script
	.word banim_sagm_mg1_2_mode_attack_miss - banim_sagm_mg1_2_script
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

