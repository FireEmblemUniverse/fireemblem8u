@ vim:ft=armv4
	.global banim_magf_mg1_script
	.global banim_magf_mg1_mode_attack_close
	.global banim_magf_mg1_mode_attack_close_back
	.global banim_magf_mg1_mode_attack_close_critical
	.global banim_magf_mg1_mode_attack_close_critical_back
	.global banim_magf_mg1_mode_attack_range
	.global banim_magf_mg1_mode_attack_range_critical
	.global banim_magf_mg1_mode_dodge_close
	.global banim_magf_mg1_mode_dodge_range
	.global banim_magf_mg1_mode_stand_close
	.global banim_magf_mg1_mode_stand
	.global banim_magf_mg1_mode_stand_range
	.global banim_magf_mg1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_magf_mg1_script:
banim_magf_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 21, banim_magf_mg1_oam_frame_25_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 22, banim_magf_mg1_oam_frame_26_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 23, banim_magf_mg1_oam_frame_27_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 24, banim_magf_mg1_oam_frame_28_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_2, 25, banim_magf_mg1_oam_frame_29_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 3, banim_magf_mg1_sheet_2, 26, banim_magf_mg1_oam_frame_30_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 34, banim_magf_mg1_oam_frame_31_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 35, banim_magf_mg1_oam_frame_32_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 36, banim_magf_mg1_oam_frame_33_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 37, banim_magf_mg1_oam_frame_34_r - banim_magf_mg1_oam_r
	banim_code_frame 11, banim_magf_mg1_sheet_2, 38, banim_magf_mg1_oam_frame_35_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 32, banim_magf_mg1_oam_frame_36_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 32, banim_magf_mg1_oam_frame_36_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 32, banim_magf_mg1_oam_frame_36_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 32, banim_magf_mg1_oam_frame_36_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 3, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 11, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 21, banim_magf_mg1_oam_frame_25_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 22, banim_magf_mg1_oam_frame_26_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 23, banim_magf_mg1_oam_frame_27_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 24, banim_magf_mg1_oam_frame_28_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_2, 25, banim_magf_mg1_oam_frame_29_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 3, banim_magf_mg1_sheet_2, 26, banim_magf_mg1_oam_frame_30_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 34, banim_magf_mg1_oam_frame_31_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 35, banim_magf_mg1_oam_frame_32_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 36, banim_magf_mg1_oam_frame_33_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 37, banim_magf_mg1_oam_frame_34_r - banim_magf_mg1_oam_r
	banim_code_frame 11, banim_magf_mg1_sheet_2, 38, banim_magf_mg1_oam_frame_35_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_magf_mg1_sheet_2, 27, banim_magf_mg1_oam_frame_37_r - banim_magf_mg1_oam_r
	banim_code_frame 1, banim_magf_mg1_sheet_2, 28, banim_magf_mg1_oam_frame_38_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_magf_mg1_sheet_2, 27, banim_magf_mg1_oam_frame_37_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_magf_mg1_sheet_2, 27, banim_magf_mg1_oam_frame_37_r - banim_magf_mg1_oam_r
	banim_code_frame 1, banim_magf_mg1_sheet_2, 28, banim_magf_mg1_oam_frame_38_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_magf_mg1_sheet_2, 27, banim_magf_mg1_oam_frame_37_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_stand_close:
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_magf_mg1_mode_stand:
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_magf_mg1_mode_stand_range:
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_magf_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
