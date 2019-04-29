@ vim:ft=armv4
	.global banim_monm_mg1_script
	.global banim_monm_mg1_mode_attack_close
	.global banim_monm_mg1_mode_attack_close_back
	.global banim_monm_mg1_mode_attack_close_critical
	.global banim_monm_mg1_mode_attack_close_critical_back
	.global banim_monm_mg1_mode_attack_range
	.global banim_monm_mg1_mode_attack_range_critical
	.global banim_monm_mg1_mode_dodge_close
	.global banim_monm_mg1_mode_dodge_range
	.global banim_monm_mg1_mode_stand_close
	.global banim_monm_mg1_mode_stand
	.global banim_monm_mg1_mode_stand_range
	.global banim_monm_mg1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_monm_mg1_script:
banim_monm_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 3, banim_monm_mg1_oam_frame_3_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 6, banim_monm_mg1_oam_frame_6_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 7, banim_monm_mg1_oam_frame_7_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 10, banim_monm_mg1_oam_frame_10_r - banim_monm_mg1_oam_r
	banim_code_frame 15, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 8, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 3, banim_monm_mg1_oam_frame_3_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 2, banim_monm_mg1_sheet_0, 6, banim_monm_mg1_oam_frame_6_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 7, banim_monm_mg1_oam_frame_7_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 10, banim_monm_mg1_oam_frame_10_r - banim_monm_mg1_oam_r
	banim_code_frame 15, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 8, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 1, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 24, banim_monm_mg1_oam_frame_24_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 25, banim_monm_mg1_oam_frame_25_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 26, banim_monm_mg1_oam_frame_26_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 27, banim_monm_mg1_oam_frame_27_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 29, banim_monm_mg1_oam_frame_29_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 30, banim_monm_mg1_oam_frame_30_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 31, banim_monm_mg1_oam_frame_31_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 32, banim_monm_mg1_oam_frame_32_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 33, banim_monm_mg1_oam_frame_33_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 34, banim_monm_mg1_oam_frame_34_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 35, banim_monm_mg1_oam_frame_35_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 36, banim_monm_mg1_oam_frame_36_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 42, banim_monm_mg1_oam_frame_42_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 24, banim_monm_mg1_oam_frame_24_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 25, banim_monm_mg1_oam_frame_25_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 26, banim_monm_mg1_oam_frame_26_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 27, banim_monm_mg1_oam_frame_27_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 29, banim_monm_mg1_oam_frame_29_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 30, banim_monm_mg1_oam_frame_30_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 31, banim_monm_mg1_oam_frame_31_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 32, banim_monm_mg1_oam_frame_32_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 33, banim_monm_mg1_oam_frame_33_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 34, banim_monm_mg1_oam_frame_34_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 35, banim_monm_mg1_oam_frame_35_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 36, banim_monm_mg1_oam_frame_36_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 42, banim_monm_mg1_oam_frame_42_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 3, banim_monm_mg1_oam_frame_3_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 6, banim_monm_mg1_oam_frame_6_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 7, banim_monm_mg1_oam_frame_7_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 10, banim_monm_mg1_oam_frame_10_r - banim_monm_mg1_oam_r
	banim_code_frame 15, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 8, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 1, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 24, banim_monm_mg1_oam_frame_24_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 25, banim_monm_mg1_oam_frame_25_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 26, banim_monm_mg1_oam_frame_26_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 27, banim_monm_mg1_oam_frame_27_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 29, banim_monm_mg1_oam_frame_29_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 30, banim_monm_mg1_oam_frame_30_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 31, banim_monm_mg1_oam_frame_31_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 32, banim_monm_mg1_oam_frame_32_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 33, banim_monm_mg1_oam_frame_33_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 34, banim_monm_mg1_oam_frame_34_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 35, banim_monm_mg1_oam_frame_35_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 36, banim_monm_mg1_oam_frame_36_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 42, banim_monm_mg1_oam_frame_42_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_monm_mg1_sheet_1, 44, banim_monm_mg1_oam_frame_43_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 45, banim_monm_mg1_oam_frame_44_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_monm_mg1_sheet_1, 45, banim_monm_mg1_oam_frame_44_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_monm_mg1_sheet_1, 44, banim_monm_mg1_oam_frame_43_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 45, banim_monm_mg1_oam_frame_44_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_monm_mg1_sheet_1, 45, banim_monm_mg1_oam_frame_44_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_stand_close:
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_monm_mg1_mode_stand:
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_monm_mg1_mode_stand_range:
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_monm_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 3, banim_monm_mg1_oam_frame_3_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 2, banim_monm_mg1_sheet_0, 6, banim_monm_mg1_oam_frame_6_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 7, banim_monm_mg1_oam_frame_7_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 10, banim_monm_mg1_oam_frame_10_r - banim_monm_mg1_oam_r
	banim_code_frame 15, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 8, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
