@ vim:ft=armv4
	.global banim_drmm_sp1_script
	.global banim_drmm_sp1_mode_attack_close
	.global banim_drmm_sp1_mode_attack_close_back
	.global banim_drmm_sp1_mode_attack_close_critical
	.global banim_drmm_sp1_mode_attack_close_critical_back
	.global banim_drmm_sp1_mode_attack_range
	.global banim_drmm_sp1_mode_attack_range_critical
	.global banim_drmm_sp1_mode_dodge_close
	.global banim_drmm_sp1_mode_dodge_range
	.global banim_drmm_sp1_mode_stand_close
	.global banim_drmm_sp1_mode_stand
	.global banim_drmm_sp1_mode_stand_range
	.global banim_drmm_sp1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_drmm_sp1_script:
banim_drmm_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_frame 4, banim_drmm_sp1_sheet_0, 1, banim_drmm_sp1_oam_frame_1_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 2, banim_drmm_sp1_oam_frame_2_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 3, banim_drmm_sp1_oam_frame_3_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 4, banim_drmm_sp1_oam_frame_4_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 5, banim_drmm_sp1_oam_frame_5_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_drmm_sp1_sheet_2, 6, banim_drmm_sp1_oam_frame_6_r - banim_drmm_sp1_oam_r
	banim_code_frame 23, banim_drmm_sp1_sheet_2, 7, banim_drmm_sp1_oam_frame_7_r - banim_drmm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 3, banim_drmm_sp1_sheet_3, 8, banim_drmm_sp1_oam_frame_8_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_3, 10, banim_drmm_sp1_oam_frame_9_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_drmm_sp1_sheet_4, 16, banim_drmm_sp1_oam_frame_10_r - banim_drmm_sp1_oam_r
	banim_code_frame 8, banim_drmm_sp1_sheet_4, 17, banim_drmm_sp1_oam_frame_11_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_4, 63, banim_drmm_sp1_oam_frame_12_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 18, banim_drmm_sp1_oam_frame_13_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_4, 19, banim_drmm_sp1_oam_frame_14_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 20, banim_drmm_sp1_oam_frame_15_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 58, banim_drmm_sp1_oam_frame_16_r - banim_drmm_sp1_oam_r
	banim_code_frame 19, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 59, banim_drmm_sp1_oam_frame_20_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 31, banim_drmm_sp1_oam_frame_21_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 60, banim_drmm_sp1_oam_frame_22_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 32, banim_drmm_sp1_oam_frame_23_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 61, banim_drmm_sp1_oam_frame_24_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_6, 62, banim_drmm_sp1_oam_frame_25_r - banim_drmm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 8, banim_drmm_sp1_sheet_7, 33, banim_drmm_sp1_oam_frame_26_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 2, banim_drmm_sp1_oam_frame_2_r - banim_drmm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_drmm_sp1_sheet_1, 2, banim_drmm_sp1_oam_frame_2_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_0, 1, banim_drmm_sp1_oam_frame_1_r - banim_drmm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 12, banim_drmm_sp1_oam_frame_27_r - banim_drmm_sp1_oam_r
	banim_code_frame 4, banim_drmm_sp1_sheet_0, 12, banim_drmm_sp1_oam_frame_27_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_drmm_sp1_sheet_2, 14, banim_drmm_sp1_oam_frame_29_r - banim_drmm_sp1_oam_r
	banim_code_frame 23, banim_drmm_sp1_sheet_2, 14, banim_drmm_sp1_oam_frame_29_r - banim_drmm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 3, banim_drmm_sp1_sheet_3, 9, banim_drmm_sp1_oam_frame_30_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_3, 11, banim_drmm_sp1_oam_frame_31_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 8, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 19, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 21, banim_drmm_sp1_oam_frame_32_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 22, banim_drmm_sp1_oam_frame_33_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 23, banim_drmm_sp1_oam_frame_34_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 24, banim_drmm_sp1_oam_frame_35_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 25, banim_drmm_sp1_oam_frame_36_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 26, banim_drmm_sp1_oam_frame_37_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 27, banim_drmm_sp1_oam_frame_38_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 28, banim_drmm_sp1_oam_frame_39_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_6, 29, banim_drmm_sp1_oam_frame_40_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 30, banim_drmm_sp1_oam_frame_41_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 8, banim_drmm_sp1_sheet_7, 39, banim_drmm_sp1_oam_frame_42_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_0, 12, banim_drmm_sp1_oam_frame_27_r - banim_drmm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_frame 4, banim_drmm_sp1_sheet_8, 40, banim_drmm_sp1_oam_frame_43_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 41, banim_drmm_sp1_oam_frame_44_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 42, banim_drmm_sp1_oam_frame_45_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 43, banim_drmm_sp1_oam_frame_46_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 44, banim_drmm_sp1_oam_frame_47_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 41, banim_drmm_sp1_oam_frame_44_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 42, banim_drmm_sp1_oam_frame_45_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 43, banim_drmm_sp1_oam_frame_46_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 44, banim_drmm_sp1_oam_frame_47_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 41, banim_drmm_sp1_oam_frame_44_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 42, banim_drmm_sp1_oam_frame_45_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 43, banim_drmm_sp1_oam_frame_46_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 44, banim_drmm_sp1_oam_frame_47_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 41, banim_drmm_sp1_oam_frame_44_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 42, banim_drmm_sp1_oam_frame_45_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 43, banim_drmm_sp1_oam_frame_46_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 44, banim_drmm_sp1_oam_frame_47_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_0, 1, banim_drmm_sp1_oam_frame_1_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 2, banim_drmm_sp1_oam_frame_2_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_drmm_sp1_sheet_1, 3, banim_drmm_sp1_oam_frame_3_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 4, banim_drmm_sp1_oam_frame_4_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 5, banim_drmm_sp1_oam_frame_5_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_drmm_sp1_sheet_2, 6, banim_drmm_sp1_oam_frame_6_r - banim_drmm_sp1_oam_r
	banim_code_frame 20, banim_drmm_sp1_sheet_2, 7, banim_drmm_sp1_oam_frame_7_r - banim_drmm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_hit_critical_1
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 3, banim_drmm_sp1_sheet_3, 8, banim_drmm_sp1_oam_frame_8_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_3, 10, banim_drmm_sp1_oam_frame_9_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_drmm_sp1_sheet_4, 16, banim_drmm_sp1_oam_frame_10_r - banim_drmm_sp1_oam_r
	banim_code_frame 8, banim_drmm_sp1_sheet_4, 17, banim_drmm_sp1_oam_frame_11_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_4, 63, banim_drmm_sp1_oam_frame_12_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 18, banim_drmm_sp1_oam_frame_13_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_4, 19, banim_drmm_sp1_oam_frame_14_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 20, banim_drmm_sp1_oam_frame_15_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 58, banim_drmm_sp1_oam_frame_16_r - banim_drmm_sp1_oam_r
	banim_code_frame 19, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 59, banim_drmm_sp1_oam_frame_20_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 31, banim_drmm_sp1_oam_frame_21_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 60, banim_drmm_sp1_oam_frame_22_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 32, banim_drmm_sp1_oam_frame_23_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 61, banim_drmm_sp1_oam_frame_24_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_6, 62, banim_drmm_sp1_oam_frame_25_r - banim_drmm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 8, banim_drmm_sp1_sheet_7, 33, banim_drmm_sp1_oam_frame_26_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 2, banim_drmm_sp1_oam_frame_2_r - banim_drmm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_drmm_sp1_sheet_1, 2, banim_drmm_sp1_oam_frame_2_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_0, 1, banim_drmm_sp1_oam_frame_1_r - banim_drmm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 12, banim_drmm_sp1_oam_frame_27_r - banim_drmm_sp1_oam_r
	banim_code_frame 4, banim_drmm_sp1_sheet_8, 55, banim_drmm_sp1_oam_frame_48_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_9, 56, banim_drmm_sp1_oam_frame_49_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_0, 12, banim_drmm_sp1_oam_frame_27_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_0, 12, banim_drmm_sp1_oam_frame_27_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_drmm_sp1_sheet_2, 14, banim_drmm_sp1_oam_frame_29_r - banim_drmm_sp1_oam_r
	banim_code_frame 20, banim_drmm_sp1_sheet_2, 14, banim_drmm_sp1_oam_frame_29_r - banim_drmm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_hit_critical_1
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 3, banim_drmm_sp1_sheet_3, 9, banim_drmm_sp1_oam_frame_30_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_3, 11, banim_drmm_sp1_oam_frame_31_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 8, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 37, banim_drmm_sp1_oam_frame_18_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_frame 19, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 21, banim_drmm_sp1_oam_frame_32_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 22, banim_drmm_sp1_oam_frame_33_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 23, banim_drmm_sp1_oam_frame_34_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 24, banim_drmm_sp1_oam_frame_35_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 25, banim_drmm_sp1_oam_frame_36_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 26, banim_drmm_sp1_oam_frame_37_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 27, banim_drmm_sp1_oam_frame_38_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 28, banim_drmm_sp1_oam_frame_39_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_6, 29, banim_drmm_sp1_oam_frame_40_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 30, banim_drmm_sp1_oam_frame_41_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_6, 38, banim_drmm_sp1_oam_frame_19_r - banim_drmm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 8, banim_drmm_sp1_sheet_7, 39, banim_drmm_sp1_oam_frame_42_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_drmm_sp1_sheet_1, 13, banim_drmm_sp1_oam_frame_28_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_0, 12, banim_drmm_sp1_oam_frame_27_r - banim_drmm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_frame 4, banim_drmm_sp1_sheet_8, 40, banim_drmm_sp1_oam_frame_43_r - banim_drmm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drmm_sp1_sheet_8, 45, banim_drmm_sp1_oam_frame_50_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_drmm_sp1_sheet_8, 40, banim_drmm_sp1_oam_frame_43_r - banim_drmm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_frame 4, banim_drmm_sp1_sheet_8, 40, banim_drmm_sp1_oam_frame_43_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_drmm_sp1_sheet_8, 45, banim_drmm_sp1_oam_frame_50_r - banim_drmm_sp1_oam_r
	banim_code_frame 4, banim_drmm_sp1_sheet_8, 46, banim_drmm_sp1_oam_frame_51_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_8, 45, banim_drmm_sp1_oam_frame_50_r - banim_drmm_sp1_oam_r
	banim_code_frame 4, banim_drmm_sp1_sheet_8, 46, banim_drmm_sp1_oam_frame_51_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_8, 45, banim_drmm_sp1_oam_frame_50_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_8, 46, banim_drmm_sp1_oam_frame_51_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_8, 45, banim_drmm_sp1_oam_frame_50_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_8, 46, banim_drmm_sp1_oam_frame_51_r - banim_drmm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drmm_sp1_sheet_8, 45, banim_drmm_sp1_oam_frame_50_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_drmm_sp1_sheet_8, 40, banim_drmm_sp1_oam_frame_43_r - banim_drmm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_sheet_7, 34, banim_drmm_sp1_oam_frame_52_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_7, 35, banim_drmm_sp1_oam_frame_53_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_sheet_7, 34, banim_drmm_sp1_oam_frame_52_r - banim_drmm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_sheet_7, 34, banim_drmm_sp1_oam_frame_52_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_7, 35, banim_drmm_sp1_oam_frame_53_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_sheet_7, 34, banim_drmm_sp1_oam_frame_52_r - banim_drmm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_mode_stand_close:
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drmm_sp1_mode_stand:
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drmm_sp1_mode_stand_range:
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drmm_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_oam_frame_0_r - banim_drmm_sp1_oam_r
	banim_code_frame 4, banim_drmm_sp1_sheet_0, 1, banim_drmm_sp1_oam_frame_1_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 2, banim_drmm_sp1_oam_frame_2_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 3, banim_drmm_sp1_oam_frame_3_r - banim_drmm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 4, banim_drmm_sp1_oam_frame_4_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_1, 5, banim_drmm_sp1_oam_frame_5_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_drmm_sp1_sheet_2, 6, banim_drmm_sp1_oam_frame_6_r - banim_drmm_sp1_oam_r
	banim_code_frame 23, banim_drmm_sp1_sheet_2, 7, banim_drmm_sp1_oam_frame_7_r - banim_drmm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_drmm_sp1_sheet_3, 52, banim_drmm_sp1_oam_frame_54_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_3, 53, banim_drmm_sp1_oam_frame_55_r - banim_drmm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_drmm_sp1_sheet_4, 16, banim_drmm_sp1_oam_frame_10_r - banim_drmm_sp1_oam_r
	banim_code_frame 8, banim_drmm_sp1_sheet_4, 17, banim_drmm_sp1_oam_frame_11_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_4, 63, banim_drmm_sp1_oam_frame_12_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 18, banim_drmm_sp1_oam_frame_13_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_4, 19, banim_drmm_sp1_oam_frame_14_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 20, banim_drmm_sp1_oam_frame_15_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_4, 58, banim_drmm_sp1_oam_frame_16_r - banim_drmm_sp1_oam_r
	banim_code_frame 19, banim_drmm_sp1_sheet_4, 36, banim_drmm_sp1_oam_frame_17_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 21, banim_drmm_sp1_oam_frame_32_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 22, banim_drmm_sp1_oam_frame_33_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 23, banim_drmm_sp1_oam_frame_34_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 24, banim_drmm_sp1_oam_frame_35_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_5, 25, banim_drmm_sp1_oam_frame_36_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_5, 26, banim_drmm_sp1_oam_frame_37_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 27, banim_drmm_sp1_oam_frame_38_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_5, 28, banim_drmm_sp1_oam_frame_39_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_6, 29, banim_drmm_sp1_oam_frame_40_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_6, 30, banim_drmm_sp1_oam_frame_41_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 59, banim_drmm_sp1_oam_frame_20_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 31, banim_drmm_sp1_oam_frame_21_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 60, banim_drmm_sp1_oam_frame_22_r - banim_drmm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 32, banim_drmm_sp1_oam_frame_23_r - banim_drmm_sp1_oam_r
	banim_code_frame 2, banim_drmm_sp1_sheet_6, 61, banim_drmm_sp1_oam_frame_24_r - banim_drmm_sp1_oam_r
	banim_code_frame 1, banim_drmm_sp1_sheet_6, 62, banim_drmm_sp1_oam_frame_25_r - banim_drmm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 8, banim_drmm_sp1_sheet_7, 33, banim_drmm_sp1_oam_frame_26_r - banim_drmm_sp1_oam_r
	banim_code_frame 3, banim_drmm_sp1_sheet_1, 2, banim_drmm_sp1_oam_frame_2_r - banim_drmm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_drmm_sp1_sheet_1, 2, banim_drmm_sp1_oam_frame_2_r - banim_drmm_sp1_oam_r
	banim_code_frame 5, banim_drmm_sp1_sheet_0, 1, banim_drmm_sp1_oam_frame_1_r - banim_drmm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
