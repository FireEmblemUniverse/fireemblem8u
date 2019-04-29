@ vim:ft=armv4
	.global banim_genm_al1_2_script
	.global banim_genm_al1_2_mode_attack_close
	.global banim_genm_al1_2_mode_attack_close_back
	.global banim_genm_al1_2_mode_attack_close_critical
	.global banim_genm_al1_2_mode_attack_close_critical_back
	.global banim_genm_al1_2_mode_attack_range
	.global banim_genm_al1_2_mode_attack_range_critical
	.global banim_genm_al1_2_mode_dodge_close
	.global banim_genm_al1_2_mode_dodge_range
	.global banim_genm_al1_2_mode_stand_close
	.global banim_genm_al1_2_mode_stand
	.global banim_genm_al1_2_mode_stand_range
	.global banim_genm_al1_2_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_genm_al1_2_script:
banim_genm_al1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_1, 3, banim_genm_al1_2_oam_frame_3_r - banim_genm_al1_2_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_1, 4, banim_genm_al1_2_oam_frame_4_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_1, 5, banim_genm_al1_2_oam_frame_5_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_heavily
	banim_code_frame 4, banim_genm_al1_sheet_1, 6, banim_genm_al1_2_oam_frame_6_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 30, banim_genm_al1_sheet_2, 7, banim_genm_al1_2_oam_frame_7_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 10, banim_genm_al1_2_oam_frame_10_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_2_oam_frame_11_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_2_oam_frame_12_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_2_oam_frame_13_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_2_oam_frame_14_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_2_oam_frame_15_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_2_oam_frame_16_r - banim_genm_al1_2_oam_r
	banim_code_frame 20, banim_genm_al1_sheet_4, 17, banim_genm_al1_2_oam_frame_17_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_2_oam_frame_18_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_2_oam_frame_19_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_2_oam_frame_22_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_heavily
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 30, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 50, banim_genm_al1_2_oam_frame_31_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 20, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_genm_al1_sheet_8, 52, banim_genm_al1_2_oam_frame_33_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_al1_sheet_7, 59, banim_genm_al1_2_oam_frame_40_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 60, banim_genm_al1_2_oam_frame_41_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 61, banim_genm_al1_2_oam_frame_42_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 10, banim_genm_al1_2_oam_frame_10_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_2_oam_frame_11_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_2_oam_frame_12_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_2_oam_frame_13_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_2_oam_frame_14_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_2_oam_frame_15_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_2_oam_frame_16_r - banim_genm_al1_2_oam_r
	banim_code_frame 53, banim_genm_al1_sheet_4, 17, banim_genm_al1_2_oam_frame_17_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_2_oam_frame_18_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_2_oam_frame_19_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_2_oam_frame_22_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 50, banim_genm_al1_2_oam_frame_31_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 53, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_1, 3, banim_genm_al1_2_oam_frame_3_r - banim_genm_al1_2_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_1, 4, banim_genm_al1_2_oam_frame_4_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_1, 5, banim_genm_al1_2_oam_frame_5_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_heavily
	banim_code_frame 4, banim_genm_al1_sheet_1, 6, banim_genm_al1_2_oam_frame_6_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 30, banim_genm_al1_sheet_2, 7, banim_genm_al1_2_oam_frame_7_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 10, banim_genm_al1_2_oam_frame_10_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_2_oam_frame_11_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_2_oam_frame_12_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_2_oam_frame_13_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_2_oam_frame_14_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_2_oam_frame_15_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_2_oam_frame_16_r - banim_genm_al1_2_oam_r
	banim_code_frame 20, banim_genm_al1_sheet_4, 17, banim_genm_al1_2_oam_frame_17_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_2_oam_frame_18_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_2_oam_frame_19_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_2_oam_frame_22_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_genm_al1_sheet_8, 52, banim_genm_al1_2_oam_frame_33_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_al1_sheet_7, 59, banim_genm_al1_2_oam_frame_40_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 60, banim_genm_al1_2_oam_frame_41_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 61, banim_genm_al1_2_oam_frame_42_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 10, banim_genm_al1_2_oam_frame_10_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_normal
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_2_oam_frame_11_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_2_oam_frame_12_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_2_oam_frame_13_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_2_oam_frame_14_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_2_oam_frame_15_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_2_oam_frame_16_r - banim_genm_al1_2_oam_r
	banim_code_frame 53, banim_genm_al1_sheet_4, 17, banim_genm_al1_2_oam_frame_17_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_2_oam_frame_18_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_2_oam_frame_19_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_2_oam_frame_22_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_2_oam_frame_49_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 31, banim_genm_al1_2_oam_frame_50_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_2_oam_frame_49_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_2_oam_frame_49_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 31, banim_genm_al1_2_oam_frame_50_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_2_oam_frame_49_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_stand_close:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_2_mode_stand:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_2_mode_stand_range:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_1, 3, banim_genm_al1_2_oam_frame_3_r - banim_genm_al1_2_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_1, 4, banim_genm_al1_2_oam_frame_4_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_1, 5, banim_genm_al1_2_oam_frame_5_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_heavily
	banim_code_frame 4, banim_genm_al1_sheet_1, 6, banim_genm_al1_2_oam_frame_6_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_2, 7, banim_genm_al1_2_oam_frame_7_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_3, 34, banim_genm_al1_2_oam_frame_51_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_4, 47, banim_genm_al1_2_oam_frame_52_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_4, 48, banim_genm_al1_2_oam_frame_53_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
