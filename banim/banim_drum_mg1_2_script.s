@ vim:ft=armv4
	.global banim_drum_mg1_2_script
	.global banim_drum_mg1_2_mode_attack_close
	.global banim_drum_mg1_2_mode_attack_close_back
	.global banim_drum_mg1_2_mode_attack_close_critical
	.global banim_drum_mg1_2_mode_attack_close_critical_back
	.global banim_drum_mg1_2_mode_attack_range
	.global banim_drum_mg1_2_mode_attack_range_critical
	.global banim_drum_mg1_2_mode_dodge_close
	.global banim_drum_mg1_2_mode_dodge_range
	.global banim_drum_mg1_2_mode_stand_close
	.global banim_drum_mg1_2_mode_stand
	.global banim_drum_mg1_2_mode_stand_range
	.global banim_drum_mg1_2_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_drum_mg1_2_script:
banim_drum_mg1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_2_oam_frame_17_r - banim_drum_mg1_2_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_2_oam_frame_18_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_2_oam_frame_17_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_2_oam_frame_17_r - banim_drum_mg1_2_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_2_oam_frame_18_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_2_oam_frame_17_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_stand_close:
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drum_mg1_2_mode_stand:
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drum_mg1_2_mode_stand_range:
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
