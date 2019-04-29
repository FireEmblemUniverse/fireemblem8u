@ vim:ft=armv4
	.global banim_lorm_sp1_script
	.global banim_lorm_sp1_mode_attack_close
	.global banim_lorm_sp1_mode_attack_close_back
	.global banim_lorm_sp1_mode_attack_close_critical
	.global banim_lorm_sp1_mode_attack_close_critical_back
	.global banim_lorm_sp1_mode_attack_range
	.global banim_lorm_sp1_mode_attack_range_critical
	.global banim_lorm_sp1_mode_dodge_close
	.global banim_lorm_sp1_mode_dodge_range
	.global banim_lorm_sp1_mode_stand_close
	.global banim_lorm_sp1_mode_stand
	.global banim_lorm_sp1_mode_stand_range
	.global banim_lorm_sp1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_lorm_sp1_script:
banim_lorm_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 1, banim_lorm_sp1_oam_frame_1_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 2, banim_lorm_sp1_oam_frame_2_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 3, banim_lorm_sp1_oam_frame_3_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 4, banim_lorm_sp1_oam_frame_4_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_0, 5, banim_lorm_sp1_oam_frame_5_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 6, banim_lorm_sp1_oam_frame_6_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 7, banim_lorm_sp1_oam_frame_7_r - banim_lorm_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 8, banim_lorm_sp1_oam_frame_8_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 9, banim_lorm_sp1_oam_frame_9_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 10, banim_lorm_sp1_oam_frame_10_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 11, banim_lorm_sp1_oam_frame_11_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 12, banim_lorm_sp1_oam_frame_12_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 13, banim_lorm_sp1_oam_frame_13_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 14, banim_lorm_sp1_oam_frame_14_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 15, banim_lorm_sp1_oam_frame_15_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 16, banim_lorm_sp1_oam_frame_16_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 17, banim_lorm_sp1_oam_frame_17_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 18, banim_lorm_sp1_oam_frame_18_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 19, banim_lorm_sp1_oam_frame_19_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 20, banim_lorm_sp1_oam_frame_20_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 21, banim_lorm_sp1_oam_frame_21_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 22, banim_lorm_sp1_oam_frame_22_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 66, banim_lorm_sp1_oam_frame_24_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 67, banim_lorm_sp1_oam_frame_25_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 73, banim_lorm_sp1_oam_frame_27_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_3, 33, banim_lorm_sp1_oam_frame_30_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_3, 34, banim_lorm_sp1_oam_frame_31_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 35, banim_lorm_sp1_oam_frame_32_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 36, banim_lorm_sp1_oam_frame_33_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 37, banim_lorm_sp1_oam_frame_34_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_3, 38, banim_lorm_sp1_oam_frame_35_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 39, banim_lorm_sp1_oam_frame_36_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 40, banim_lorm_sp1_oam_frame_37_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 41, banim_lorm_sp1_oam_frame_38_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 42, banim_lorm_sp1_oam_frame_39_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 43, banim_lorm_sp1_oam_frame_40_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 44, banim_lorm_sp1_oam_frame_41_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_5, 45, banim_lorm_sp1_oam_frame_42_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_5, 46, banim_lorm_sp1_oam_frame_43_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lorm_sp1_sheet_5, 47, banim_lorm_sp1_oam_frame_44_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_5, 48, banim_lorm_sp1_oam_frame_45_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_5, 49, banim_lorm_sp1_oam_frame_46_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 50, banim_lorm_sp1_oam_frame_47_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 51, banim_lorm_sp1_oam_frame_48_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 52, banim_lorm_sp1_oam_frame_49_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 53, banim_lorm_sp1_oam_frame_50_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 54, banim_lorm_sp1_oam_frame_51_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_7, 55, banim_lorm_sp1_oam_frame_52_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_7, 56, banim_lorm_sp1_oam_frame_53_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_7, 57, banim_lorm_sp1_oam_frame_54_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 54, banim_lorm_sp1_oam_frame_51_r - banim_lorm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 8, banim_lorm_sp1_oam_frame_8_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 9, banim_lorm_sp1_oam_frame_9_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 10, banim_lorm_sp1_oam_frame_10_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 11, banim_lorm_sp1_oam_frame_11_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 12, banim_lorm_sp1_oam_frame_12_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 13, banim_lorm_sp1_oam_frame_13_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 14, banim_lorm_sp1_oam_frame_14_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 15, banim_lorm_sp1_oam_frame_15_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 16, banim_lorm_sp1_oam_frame_16_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 17, banim_lorm_sp1_oam_frame_17_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 18, banim_lorm_sp1_oam_frame_18_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 19, banim_lorm_sp1_oam_frame_19_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 20, banim_lorm_sp1_oam_frame_20_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 21, banim_lorm_sp1_oam_frame_21_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 22, banim_lorm_sp1_oam_frame_22_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 66, banim_lorm_sp1_oam_frame_24_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 67, banim_lorm_sp1_oam_frame_25_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 73, banim_lorm_sp1_oam_frame_27_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 79, banim_lorm_sp1_oam_frame_57_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_9, 80, banim_lorm_sp1_oam_frame_58_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_9, 81, banim_lorm_sp1_oam_frame_59_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 82, banim_lorm_sp1_oam_frame_60_r - banim_lorm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 83, banim_lorm_sp1_oam_frame_61_r - banim_lorm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 84, banim_lorm_sp1_oam_frame_62_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 85, banim_lorm_sp1_oam_frame_63_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 86, banim_lorm_sp1_oam_frame_64_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 87, banim_lorm_sp1_oam_frame_65_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 88, banim_lorm_sp1_oam_frame_66_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 89, banim_lorm_sp1_oam_frame_67_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 90, banim_lorm_sp1_oam_frame_68_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 79, banim_lorm_sp1_oam_frame_57_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_9, 78, banim_lorm_sp1_oam_frame_69_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 91, banim_lorm_sp1_oam_frame_70_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 92, banim_lorm_sp1_oam_frame_71_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 93, banim_lorm_sp1_oam_frame_72_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_11, 94, banim_lorm_sp1_oam_frame_73_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 91, banim_lorm_sp1_oam_frame_70_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 92, banim_lorm_sp1_oam_frame_71_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 93, banim_lorm_sp1_oam_frame_72_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_11, 94, banim_lorm_sp1_oam_frame_73_r - banim_lorm_sp1_oam_r
	banim_code_frame 20, banim_lorm_sp1_sheet_11, 95, banim_lorm_sp1_oam_frame_74_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 79, banim_lorm_sp1_oam_frame_57_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_9, 80, banim_lorm_sp1_oam_frame_58_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_9, 81, banim_lorm_sp1_oam_frame_59_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 82, banim_lorm_sp1_oam_frame_60_r - banim_lorm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 83, banim_lorm_sp1_oam_frame_61_r - banim_lorm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 84, banim_lorm_sp1_oam_frame_62_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 85, banim_lorm_sp1_oam_frame_63_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 86, banim_lorm_sp1_oam_frame_64_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 87, banim_lorm_sp1_oam_frame_65_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 88, banim_lorm_sp1_oam_frame_66_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 89, banim_lorm_sp1_oam_frame_67_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 90, banim_lorm_sp1_oam_frame_68_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 79, banim_lorm_sp1_oam_frame_57_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_9, 78, banim_lorm_sp1_oam_frame_69_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 23, banim_lorm_sp1_oam_frame_75_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 24, banim_lorm_sp1_oam_frame_76_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_2, 25, banim_lorm_sp1_oam_frame_77_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 24, banim_lorm_sp1_oam_frame_76_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 23, banim_lorm_sp1_oam_frame_75_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 26, banim_lorm_sp1_oam_frame_78_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 27, banim_lorm_sp1_oam_frame_79_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 28, banim_lorm_sp1_oam_frame_80_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 27, banim_lorm_sp1_oam_frame_79_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 26, banim_lorm_sp1_oam_frame_78_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_stand_close:
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorm_sp1_mode_stand:
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorm_sp1_mode_stand_range:
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorm_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 1, banim_lorm_sp1_oam_frame_1_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 2, banim_lorm_sp1_oam_frame_2_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 3, banim_lorm_sp1_oam_frame_3_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 4, banim_lorm_sp1_oam_frame_4_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_0, 5, banim_lorm_sp1_oam_frame_5_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 6, banim_lorm_sp1_oam_frame_6_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 7, banim_lorm_sp1_oam_frame_7_r - banim_lorm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 58, banim_lorm_sp1_oam_frame_81_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 59, banim_lorm_sp1_oam_frame_82_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 60, banim_lorm_sp1_oam_frame_83_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 61, banim_lorm_sp1_oam_frame_84_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 62, banim_lorm_sp1_oam_frame_85_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 63, banim_lorm_sp1_oam_frame_86_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 64, banim_lorm_sp1_oam_frame_87_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 65, banim_lorm_sp1_oam_frame_88_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 16, banim_lorm_sp1_oam_frame_16_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 17, banim_lorm_sp1_oam_frame_17_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 18, banim_lorm_sp1_oam_frame_18_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 19, banim_lorm_sp1_oam_frame_19_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 20, banim_lorm_sp1_oam_frame_20_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 21, banim_lorm_sp1_oam_frame_21_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 22, banim_lorm_sp1_oam_frame_22_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
