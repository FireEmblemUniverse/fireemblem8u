@ vim:ft=armv4
	.global banim_smnm_ro1_2_script
	.global banim_smnm_ro1_2_mode_attack_close
	.global banim_smnm_ro1_2_mode_attack_close_back
	.global banim_smnm_ro1_2_mode_attack_close_critical
	.global banim_smnm_ro1_2_mode_attack_close_critical_back
	.global banim_smnm_ro1_2_mode_attack_range
	.global banim_smnm_ro1_2_mode_attack_range_critical
	.global banim_smnm_ro1_2_mode_dodge_close
	.global banim_smnm_ro1_2_mode_dodge_range
	.global banim_smnm_ro1_2_mode_stand_close
	.global banim_smnm_ro1_2_mode_stand
	.global banim_smnm_ro1_2_mode_stand_range
	.global banim_smnm_ro1_2_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_smnm_ro1_2_script:
banim_smnm_ro1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_2_oam_frame_18_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 54, banim_smnm_ro1_2_oam_frame_19_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_2_oam_frame_18_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_2_oam_frame_18_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 54, banim_smnm_ro1_2_oam_frame_19_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_2_oam_frame_18_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_stand_close:
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_smnm_ro1_2_mode_stand:
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_smnm_ro1_2_mode_stand_range:
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
