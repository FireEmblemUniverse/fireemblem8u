@ vim:ft=armv4
	.global banim_wykm_sp1_3_script
	.global banim_wykm_sp1_3_mode_attack_close
	.global banim_wykm_sp1_3_mode_attack_close_back
	.global banim_wykm_sp1_3_mode_attack_close_critical
	.global banim_wykm_sp1_3_mode_attack_close_critical_back
	.global banim_wykm_sp1_3_mode_attack_range
	.global banim_wykm_sp1_3_mode_attack_range_critical
	.global banim_wykm_sp1_3_mode_dodge_close
	.global banim_wykm_sp1_3_mode_dodge_range
	.global banim_wykm_sp1_3_mode_stand_close
	.global banim_wykm_sp1_3_mode_stand
	.global banim_wykm_sp1_3_mode_stand_range
	.global banim_wykm_sp1_3_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_wykm_sp1_3_script:
banim_wykm_sp1_3_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_3_oam_frame_1_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 2, banim_wykm_sp1_3_oam_frame_2_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_3_oam_frame_3_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_2, 4, banim_wykm_sp1_3_oam_frame_4_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_3_oam_frame_3_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 5, banim_wykm_sp1_3_oam_frame_5_r - banim_wykm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 10, banim_wykm_sp1_3_oam_frame_6_r - banim_wykm_sp1_3_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 12, banim_wykm_sp1_3_oam_frame_7_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_5, 53, banim_wykm_sp1_3_oam_frame_8_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 9, banim_wykm_sp1_3_oam_frame_9_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 16, banim_wykm_sp1_3_oam_frame_10_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_7, 17, banim_wykm_sp1_3_oam_frame_11_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_7, 18, banim_wykm_sp1_3_oam_frame_12_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 19, banim_wykm_sp1_3_oam_frame_13_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_5, 20, banim_wykm_sp1_3_oam_frame_14_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 21, banim_wykm_sp1_3_oam_frame_15_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 22, banim_wykm_sp1_3_oam_frame_16_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_3_oam_frame_17_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 24, banim_wykm_sp1_3_oam_frame_18_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 25, banim_wykm_sp1_3_oam_frame_19_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 26, banim_wykm_sp1_3_oam_frame_20_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 27, banim_wykm_sp1_3_oam_frame_21_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 28, banim_wykm_sp1_3_oam_frame_22_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_3_oam_frame_1_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 29, banim_wykm_sp1_3_oam_frame_23_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_8, 30, banim_wykm_sp1_3_oam_frame_24_r - banim_wykm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 31, banim_wykm_sp1_3_oam_frame_25_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_3_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 11, banim_wykm_sp1_3_oam_frame_30_r - banim_wykm_sp1_3_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 13, banim_wykm_sp1_3_oam_frame_31_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_3_oam_frame_17_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_3_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_3_oam_frame_1_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 2, banim_wykm_sp1_3_oam_frame_2_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_3_oam_frame_3_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 36, banim_wykm_sp1_3_oam_frame_32_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 37, banim_wykm_sp1_3_oam_frame_33_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 38, banim_wykm_sp1_3_oam_frame_34_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 39, banim_wykm_sp1_3_oam_frame_35_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 40, banim_wykm_sp1_3_oam_frame_36_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 41, banim_wykm_sp1_3_oam_frame_37_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 38, banim_wykm_sp1_3_oam_frame_34_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 39, banim_wykm_sp1_3_oam_frame_35_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 40, banim_wykm_sp1_3_oam_frame_36_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 41, banim_wykm_sp1_3_oam_frame_37_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 36, banim_wykm_sp1_3_oam_frame_32_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_2, 4, banim_wykm_sp1_3_oam_frame_4_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_3_oam_frame_3_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 5, banim_wykm_sp1_3_oam_frame_5_r - banim_wykm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 10, banim_wykm_sp1_3_oam_frame_6_r - banim_wykm_sp1_3_oam_r
	banim_code_hit_critical_5
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 12, banim_wykm_sp1_3_oam_frame_7_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_5, 53, banim_wykm_sp1_3_oam_frame_8_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 9, banim_wykm_sp1_3_oam_frame_9_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 16, banim_wykm_sp1_3_oam_frame_10_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_7, 17, banim_wykm_sp1_3_oam_frame_11_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_7, 18, banim_wykm_sp1_3_oam_frame_12_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 19, banim_wykm_sp1_3_oam_frame_13_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_5, 20, banim_wykm_sp1_3_oam_frame_14_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 21, banim_wykm_sp1_3_oam_frame_15_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 22, banim_wykm_sp1_3_oam_frame_16_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_3_oam_frame_17_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 24, banim_wykm_sp1_3_oam_frame_18_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 25, banim_wykm_sp1_3_oam_frame_19_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 26, banim_wykm_sp1_3_oam_frame_20_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 27, banim_wykm_sp1_3_oam_frame_21_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 28, banim_wykm_sp1_3_oam_frame_22_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_3_oam_frame_1_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 29, banim_wykm_sp1_3_oam_frame_23_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_8, 30, banim_wykm_sp1_3_oam_frame_24_r - banim_wykm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 31, banim_wykm_sp1_3_oam_frame_25_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_3_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 11, banim_wykm_sp1_3_oam_frame_30_r - banim_wykm_sp1_3_oam_r
	banim_code_hit_critical_5
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 13, banim_wykm_sp1_3_oam_frame_31_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_3_oam_frame_28_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_3_oam_frame_17_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_3_oam_frame_27_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_3_oam_frame_29_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_3_oam_frame_26_r - banim_wykm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_3_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_85 0x54
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 42, banim_wykm_sp1_3_oam_frame_38_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 43, banim_wykm_sp1_3_oam_frame_39_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 44, banim_wykm_sp1_3_oam_frame_40_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_11, 45, banim_wykm_sp1_3_oam_frame_41_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 44, banim_wykm_sp1_3_oam_frame_40_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 46, banim_wykm_sp1_3_oam_frame_42_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_wykm_sp1_sheet_11, 47, banim_wykm_sp1_3_oam_frame_43_r - banim_wykm_sp1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_wykm_sp1_sheet_11, 48, banim_wykm_sp1_3_oam_frame_44_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 43, banim_wykm_sp1_3_oam_frame_39_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 42, banim_wykm_sp1_3_oam_frame_38_r - banim_wykm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_3_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_85 0x54
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 42, banim_wykm_sp1_3_oam_frame_38_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 43, banim_wykm_sp1_3_oam_frame_39_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 44, banim_wykm_sp1_3_oam_frame_40_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_11, 45, banim_wykm_sp1_3_oam_frame_41_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_12, 49, banim_wykm_sp1_3_oam_frame_45_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_12, 50, banim_wykm_sp1_3_oam_frame_46_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_12, 51, banim_wykm_sp1_3_oam_frame_47_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_12, 52, banim_wykm_sp1_3_oam_frame_48_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 44, banim_wykm_sp1_3_oam_frame_40_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 46, banim_wykm_sp1_3_oam_frame_42_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_wykm_sp1_sheet_11, 47, banim_wykm_sp1_3_oam_frame_43_r - banim_wykm_sp1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_wykm_sp1_sheet_11, 48, banim_wykm_sp1_3_oam_frame_44_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 43, banim_wykm_sp1_3_oam_frame_39_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 42, banim_wykm_sp1_3_oam_frame_38_r - banim_wykm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 14, banim_wykm_sp1_3_oam_frame_49_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 15, banim_wykm_sp1_3_oam_frame_50_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 14, banim_wykm_sp1_3_oam_frame_49_r - banim_wykm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 14, banim_wykm_sp1_3_oam_frame_49_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 15, banim_wykm_sp1_3_oam_frame_50_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 14, banim_wykm_sp1_3_oam_frame_49_r - banim_wykm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_3_mode_stand_close:
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_wykm_sp1_3_mode_stand:
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_wykm_sp1_3_mode_stand_range:
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_wykm_sp1_3_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_3_oam_frame_1_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 2, banim_wykm_sp1_3_oam_frame_2_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_3_oam_frame_3_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_2, 4, banim_wykm_sp1_3_oam_frame_4_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_3_oam_frame_3_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 5, banim_wykm_sp1_3_oam_frame_5_r - banim_wykm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 6, banim_wykm_sp1_3_oam_frame_51_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 7, banim_wykm_sp1_3_oam_frame_52_r - banim_wykm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_5, 53, banim_wykm_sp1_3_oam_frame_8_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 9, banim_wykm_sp1_3_oam_frame_9_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 16, banim_wykm_sp1_3_oam_frame_10_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_7, 17, banim_wykm_sp1_3_oam_frame_11_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_7, 18, banim_wykm_sp1_3_oam_frame_12_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 19, banim_wykm_sp1_3_oam_frame_13_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_5, 20, banim_wykm_sp1_3_oam_frame_14_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 21, banim_wykm_sp1_3_oam_frame_15_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 22, banim_wykm_sp1_3_oam_frame_16_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_3_oam_frame_17_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 24, banim_wykm_sp1_3_oam_frame_18_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 25, banim_wykm_sp1_3_oam_frame_19_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 26, banim_wykm_sp1_3_oam_frame_20_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 27, banim_wykm_sp1_3_oam_frame_21_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 28, banim_wykm_sp1_3_oam_frame_22_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_3_oam_frame_1_r - banim_wykm_sp1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 29, banim_wykm_sp1_3_oam_frame_23_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_8, 30, banim_wykm_sp1_3_oam_frame_24_r - banim_wykm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 31, banim_wykm_sp1_3_oam_frame_25_r - banim_wykm_sp1_3_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_3_oam_frame_0_r - banim_wykm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
