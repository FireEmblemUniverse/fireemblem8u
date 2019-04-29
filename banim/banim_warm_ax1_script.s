@ vim:ft=armv4
	.global banim_warm_ax1_script
	.global banim_warm_ax1_mode_attack_close
	.global banim_warm_ax1_mode_attack_close_back
	.global banim_warm_ax1_mode_attack_close_critical
	.global banim_warm_ax1_mode_attack_close_critical_back
	.global banim_warm_ax1_mode_attack_range
	.global banim_warm_ax1_mode_attack_range_critical
	.global banim_warm_ax1_mode_dodge_close
	.global banim_warm_ax1_mode_dodge_range
	.global banim_warm_ax1_mode_stand_close
	.global banim_warm_ax1_mode_stand
	.global banim_warm_ax1_mode_stand_range
	.global banim_warm_ax1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_warm_ax1_script:
banim_warm_ax1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_oam_frame_0_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_1, 23, banim_warm_ax1_oam_frame_1_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_1, 24, banim_warm_ax1_oam_frame_2_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_1, 25, banim_warm_ax1_oam_frame_3_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_2, 26, banim_warm_ax1_oam_frame_4_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_2, 27, banim_warm_ax1_oam_frame_5_r - banim_warm_ax1_oam_r
	banim_code_frame 8, banim_warm_ax1_sheet_2, 28, banim_warm_ax1_oam_frame_6_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_2, 29, banim_warm_ax1_oam_frame_7_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_warm_ax1_sheet_2, 30, banim_warm_ax1_oam_frame_8_r - banim_warm_ax1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 3, banim_warm_ax1_sheet_3, 31, banim_warm_ax1_oam_frame_9_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_3, 32, banim_warm_ax1_oam_frame_10_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_warm_ax1_sheet_3, 33, banim_warm_ax1_oam_frame_11_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 99, banim_warm_ax1_oam_frame_12_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 36, banim_warm_ax1_oam_frame_13_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 100, banim_warm_ax1_oam_frame_14_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_4, 101, banim_warm_ax1_oam_frame_15_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 64, banim_warm_ax1_oam_frame_16_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 65, banim_warm_ax1_oam_frame_17_r - banim_warm_ax1_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_4, 67, banim_warm_ax1_oam_frame_18_r - banim_warm_ax1_oam_r
	banim_code_frame 4, banim_warm_ax1_sheet_4, 68, banim_warm_ax1_oam_frame_19_r - banim_warm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_warm_ax1_sheet_4, 69, banim_warm_ax1_oam_frame_20_r - banim_warm_ax1_oam_r
	banim_code_frame 6, banim_warm_ax1_sheet_5, 103, banim_warm_ax1_oam_frame_21_r - banim_warm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_oam_frame_22_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_oam_frame_23_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_oam_frame_23_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_1, 73, banim_warm_ax1_oam_frame_23_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_2, 74, banim_warm_ax1_oam_frame_24_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_2, 74, banim_warm_ax1_oam_frame_24_r - banim_warm_ax1_oam_r
	banim_code_frame 8, banim_warm_ax1_sheet_2, 74, banim_warm_ax1_oam_frame_24_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_2, 74, banim_warm_ax1_oam_frame_24_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_warm_ax1_sheet_2, 74, banim_warm_ax1_oam_frame_24_r - banim_warm_ax1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 3, banim_warm_ax1_sheet_3, 70, banim_warm_ax1_oam_frame_25_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_3, 71, banim_warm_ax1_oam_frame_26_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_warm_ax1_sheet_3, 71, banim_warm_ax1_oam_frame_26_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 71, banim_warm_ax1_oam_frame_26_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 71, banim_warm_ax1_oam_frame_26_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 75, banim_warm_ax1_oam_frame_27_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_frame 4, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_frame 6, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_oam_frame_0_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_4, 80, banim_warm_ax1_oam_frame_30_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_4, 81, banim_warm_ax1_oam_frame_31_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_4, 82, banim_warm_ax1_oam_frame_32_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_6, 86, banim_warm_ax1_oam_frame_33_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_6, 87, banim_warm_ax1_oam_frame_34_r - banim_warm_ax1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_6, 88, banim_warm_ax1_oam_frame_35_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_6, 89, banim_warm_ax1_oam_frame_36_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 90, banim_warm_ax1_oam_frame_37_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_6, 91, banim_warm_ax1_oam_frame_38_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 83, banim_warm_ax1_oam_frame_39_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 84, banim_warm_ax1_oam_frame_40_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 85, banim_warm_ax1_oam_frame_41_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 83, banim_warm_ax1_oam_frame_39_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 84, banim_warm_ax1_oam_frame_40_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 85, banim_warm_ax1_oam_frame_41_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 83, banim_warm_ax1_oam_frame_39_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 84, banim_warm_ax1_oam_frame_40_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 85, banim_warm_ax1_oam_frame_41_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 83, banim_warm_ax1_oam_frame_39_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 84, banim_warm_ax1_oam_frame_40_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 85, banim_warm_ax1_oam_frame_41_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 83, banim_warm_ax1_oam_frame_39_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 84, banim_warm_ax1_oam_frame_40_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 85, banim_warm_ax1_oam_frame_41_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 1, banim_warm_ax1_sheet_7, 83, banim_warm_ax1_oam_frame_39_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 84, banim_warm_ax1_oam_frame_40_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 85, banim_warm_ax1_oam_frame_41_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 1, banim_warm_ax1_sheet_7, 83, banim_warm_ax1_oam_frame_39_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 84, banim_warm_ax1_oam_frame_40_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 85, banim_warm_ax1_oam_frame_41_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 1, banim_warm_ax1_sheet_7, 83, banim_warm_ax1_oam_frame_39_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 84, banim_warm_ax1_oam_frame_40_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 85, banim_warm_ax1_oam_frame_41_r - banim_warm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_warm_ax1_sheet_2, 30, banim_warm_ax1_oam_frame_8_r - banim_warm_ax1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 3, banim_warm_ax1_sheet_3, 31, banim_warm_ax1_oam_frame_9_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_3, 32, banim_warm_ax1_oam_frame_10_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_warm_ax1_sheet_3, 33, banim_warm_ax1_oam_frame_11_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 34, banim_warm_ax1_oam_frame_42_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 35, banim_warm_ax1_oam_frame_43_r - banim_warm_ax1_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_3, 36, banim_warm_ax1_oam_frame_13_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_3, 37, banim_warm_ax1_oam_frame_44_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 38, banim_warm_ax1_oam_frame_45_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 39, banim_warm_ax1_oam_frame_46_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 40, banim_warm_ax1_oam_frame_47_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 41, banim_warm_ax1_oam_frame_48_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 42, banim_warm_ax1_oam_frame_49_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 43, banim_warm_ax1_oam_frame_50_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 44, banim_warm_ax1_oam_frame_51_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 45, banim_warm_ax1_oam_frame_52_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 46, banim_warm_ax1_oam_frame_53_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 47, banim_warm_ax1_oam_frame_54_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 48, banim_warm_ax1_oam_frame_55_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 49, banim_warm_ax1_oam_frame_56_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 50, banim_warm_ax1_oam_frame_57_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 51, banim_warm_ax1_oam_frame_58_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 52, banim_warm_ax1_oam_frame_59_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 53, banim_warm_ax1_oam_frame_60_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 54, banim_warm_ax1_oam_frame_61_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 55, banim_warm_ax1_oam_frame_62_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 56, banim_warm_ax1_oam_frame_63_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 57, banim_warm_ax1_oam_frame_64_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 58, banim_warm_ax1_oam_frame_65_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 59, banim_warm_ax1_oam_frame_66_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 60, banim_warm_ax1_oam_frame_67_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 61, banim_warm_ax1_oam_frame_68_r - banim_warm_ax1_oam_r
	banim_code_frame 6, banim_warm_ax1_sheet_5, 62, banim_warm_ax1_oam_frame_69_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 63, banim_warm_ax1_oam_frame_70_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 64, banim_warm_ax1_oam_frame_16_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 65, banim_warm_ax1_oam_frame_17_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_4, 66, banim_warm_ax1_oam_frame_71_r - banim_warm_ax1_oam_r
	banim_code_frame 6, banim_warm_ax1_sheet_4, 67, banim_warm_ax1_oam_frame_18_r - banim_warm_ax1_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_4, 68, banim_warm_ax1_oam_frame_19_r - banim_warm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_warm_ax1_sheet_4, 69, banim_warm_ax1_oam_frame_20_r - banim_warm_ax1_oam_r
	banim_code_frame 6, banim_warm_ax1_sheet_5, 103, banim_warm_ax1_oam_frame_21_r - banim_warm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ax1_sheet_0, 72, banim_warm_ax1_oam_frame_22_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_6, 78, banim_warm_ax1_oam_frame_72_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_6, 78, banim_warm_ax1_oam_frame_72_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_6, 78, banim_warm_ax1_oam_frame_72_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_6, 78, banim_warm_ax1_oam_frame_72_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_6, 78, banim_warm_ax1_oam_frame_72_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_warm_ax1_sheet_2, 74, banim_warm_ax1_oam_frame_24_r - banim_warm_ax1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 3, banim_warm_ax1_sheet_3, 70, banim_warm_ax1_oam_frame_25_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_3, 71, banim_warm_ax1_oam_frame_26_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_warm_ax1_sheet_3, 71, banim_warm_ax1_oam_frame_26_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 71, banim_warm_ax1_oam_frame_26_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 71, banim_warm_ax1_oam_frame_26_r - banim_warm_ax1_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_3, 71, banim_warm_ax1_oam_frame_26_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_3, 75, banim_warm_ax1_oam_frame_27_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 6, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 76, banim_warm_ax1_oam_frame_29_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_frame 6, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_warm_ax1_sheet_4, 77, banim_warm_ax1_oam_frame_28_r - banim_warm_ax1_oam_r
	banim_code_frame 6, banim_warm_ax1_sheet_7, 79, banim_warm_ax1_oam_frame_73_r - banim_warm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 10, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_oam_frame_74_r - banim_warm_ax1_oam_r
	banim_code_end_mode
banim_warm_ax1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 10, banim_warm_ax1_sheet_0, 8, banim_warm_ax1_oam_frame_74_r - banim_warm_ax1_oam_r
	banim_code_end_mode
banim_warm_ax1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_oam_frame_0_r - banim_warm_ax1_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_oam_frame_75_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_oam_frame_76_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_oam_frame_75_r - banim_warm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_oam_frame_0_r - banim_warm_ax1_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_oam_frame_75_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_0, 2, banim_warm_ax1_oam_frame_76_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ax1_sheet_0, 1, banim_warm_ax1_oam_frame_75_r - banim_warm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ax1_mode_stand_close:
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_oam_frame_0_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ax1_mode_stand:
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_oam_frame_0_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ax1_mode_stand_range:
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_oam_frame_0_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ax1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ax1_sheet_0, 0, banim_warm_ax1_oam_frame_0_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_1, 23, banim_warm_ax1_oam_frame_1_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_1, 24, banim_warm_ax1_oam_frame_2_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_1, 25, banim_warm_ax1_oam_frame_3_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 2, banim_warm_ax1_sheet_2, 26, banim_warm_ax1_oam_frame_4_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_2, 27, banim_warm_ax1_oam_frame_5_r - banim_warm_ax1_oam_r
	banim_code_frame 8, banim_warm_ax1_sheet_2, 28, banim_warm_ax1_oam_frame_6_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_2, 29, banim_warm_ax1_oam_frame_7_r - banim_warm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_warm_ax1_sheet_2, 30, banim_warm_ax1_oam_frame_8_r - banim_warm_ax1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_warm_ax1_sheet_1, 105, banim_warm_ax1_oam_frame_77_r - banim_warm_ax1_oam_r
	banim_code_frame 1, banim_warm_ax1_sheet_1, 106, banim_warm_ax1_oam_frame_78_r - banim_warm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_warm_ax1_sheet_3, 95, banim_warm_ax1_oam_frame_79_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 104, banim_warm_ax1_oam_frame_80_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 98, banim_warm_ax1_oam_frame_81_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_3, 100, banim_warm_ax1_oam_frame_14_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_4, 101, banim_warm_ax1_oam_frame_15_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 64, banim_warm_ax1_oam_frame_16_r - banim_warm_ax1_oam_r
	banim_code_frame 2, banim_warm_ax1_sheet_5, 65, banim_warm_ax1_oam_frame_17_r - banim_warm_ax1_oam_r
	banim_code_frame 3, banim_warm_ax1_sheet_4, 67, banim_warm_ax1_oam_frame_18_r - banim_warm_ax1_oam_r
	banim_code_frame 4, banim_warm_ax1_sheet_4, 68, banim_warm_ax1_oam_frame_19_r - banim_warm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_warm_ax1_sheet_4, 69, banim_warm_ax1_oam_frame_20_r - banim_warm_ax1_oam_r
	banim_code_frame 6, banim_warm_ax1_sheet_5, 103, banim_warm_ax1_oam_frame_21_r - banim_warm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
