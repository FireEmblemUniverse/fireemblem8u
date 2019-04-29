@ vim:ft=armv4
	.global banim_valf_mg1_script
	.global banim_valf_mg1_mode_attack_close
	.global banim_valf_mg1_mode_attack_close_back
	.global banim_valf_mg1_mode_attack_close_critical
	.global banim_valf_mg1_mode_attack_close_critical_back
	.global banim_valf_mg1_mode_attack_range
	.global banim_valf_mg1_mode_attack_range_critical
	.global banim_valf_mg1_mode_dodge_close
	.global banim_valf_mg1_mode_dodge_range
	.global banim_valf_mg1_mode_stand_close
	.global banim_valf_mg1_mode_stand
	.global banim_valf_mg1_mode_stand_range
	.global banim_valf_mg1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_valf_mg1_script:
banim_valf_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_2, 74, banim_valf_mg1_oam_frame_12_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 19, banim_valf_mg1_oam_frame_19_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 20, banim_valf_mg1_oam_frame_20_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 21, banim_valf_mg1_oam_frame_21_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 22, banim_valf_mg1_oam_frame_22_r - banim_valf_mg1_oam_r
	banim_code_frame 8, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 19, banim_valf_mg1_oam_frame_19_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 20, banim_valf_mg1_oam_frame_20_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 21, banim_valf_mg1_oam_frame_21_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 22, banim_valf_mg1_oam_frame_22_r - banim_valf_mg1_oam_r
	banim_code_frame 8, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 19, banim_valf_mg1_oam_frame_19_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 20, banim_valf_mg1_oam_frame_20_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 21, banim_valf_mg1_oam_frame_21_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 22, banim_valf_mg1_oam_frame_22_r - banim_valf_mg1_oam_r
	banim_code_frame 8, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_valf_mg1_sheet_0, 1, banim_valf_mg1_oam_frame_23_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_0, 2, banim_valf_mg1_oam_frame_24_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_valf_mg1_sheet_0, 1, banim_valf_mg1_oam_frame_23_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_valf_mg1_sheet_0, 1, banim_valf_mg1_oam_frame_23_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_0, 2, banim_valf_mg1_oam_frame_24_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_valf_mg1_sheet_0, 1, banim_valf_mg1_oam_frame_23_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_stand_close:
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_valf_mg1_mode_stand:
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_valf_mg1_mode_stand_range:
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_valf_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
