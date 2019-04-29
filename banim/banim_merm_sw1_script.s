@ vim:ft=armv4
	.global banim_merm_sw1_script
	.global banim_merm_sw1_mode_attack_close
	.global banim_merm_sw1_mode_attack_close_back
	.global banim_merm_sw1_mode_attack_close_critical
	.global banim_merm_sw1_mode_attack_close_critical_back
	.global banim_merm_sw1_mode_attack_range
	.global banim_merm_sw1_mode_attack_range_critical
	.global banim_merm_sw1_mode_dodge_close
	.global banim_merm_sw1_mode_dodge_range
	.global banim_merm_sw1_mode_stand_close
	.global banim_merm_sw1_mode_stand
	.global banim_merm_sw1_mode_stand_range
	.global banim_merm_sw1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_merm_sw1_script:
banim_merm_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_frame 5, banim_merm_sw1_sheet_0, 2, banim_merm_sw1_oam_frame_2_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 3, banim_merm_sw1_oam_frame_3_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 4, banim_merm_sw1_oam_frame_4_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 5, banim_merm_sw1_oam_frame_5_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 6, banim_merm_sw1_oam_frame_6_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 7, banim_merm_sw1_oam_frame_7_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 8, banim_merm_sw1_oam_frame_8_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 9, banim_merm_sw1_oam_frame_9_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 10, banim_merm_sw1_oam_frame_10_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 11, banim_merm_sw1_oam_frame_11_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 12, banim_merm_sw1_oam_frame_12_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 13, banim_merm_sw1_oam_frame_13_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 14, banim_merm_sw1_oam_frame_14_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 15, banim_merm_sw1_oam_frame_15_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 16, banim_merm_sw1_oam_frame_16_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 17, banim_merm_sw1_oam_frame_17_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_0, 18, banim_merm_sw1_oam_frame_18_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_merm_sw1_sheet_1, 19, banim_merm_sw1_oam_frame_19_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 20, banim_merm_sw1_oam_frame_20_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 21, banim_merm_sw1_oam_frame_21_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_merm_sw1_sheet_1, 22, banim_merm_sw1_oam_frame_22_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 23, banim_merm_sw1_oam_frame_23_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 24, banim_merm_sw1_oam_frame_24_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 25, banim_merm_sw1_oam_frame_25_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 26, banim_merm_sw1_oam_frame_26_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 27, banim_merm_sw1_oam_frame_27_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 28, banim_merm_sw1_oam_frame_28_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 29, banim_merm_sw1_oam_frame_29_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 30, banim_merm_sw1_oam_frame_30_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 31, banim_merm_sw1_oam_frame_31_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 5, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_merm_sw1_sheet_1, 89, banim_merm_sw1_oam_frame_33_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 90, banim_merm_sw1_oam_frame_34_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 32, banim_merm_sw1_oam_frame_36_r - banim_merm_sw1_oam_r
	banim_code_frame 30, banim_merm_sw1_sheet_1, 33, banim_merm_sw1_oam_frame_37_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 32, banim_merm_sw1_oam_frame_36_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 33, banim_merm_sw1_oam_frame_37_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 32, banim_merm_sw1_oam_frame_36_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 33, banim_merm_sw1_oam_frame_37_r - banim_merm_sw1_oam_r
	banim_code_frame 15, banim_merm_sw1_sheet_1, 34, banim_merm_sw1_oam_frame_38_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 35, banim_merm_sw1_oam_frame_39_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 36, banim_merm_sw1_oam_frame_40_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 37, banim_merm_sw1_oam_frame_41_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 38, banim_merm_sw1_oam_frame_42_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 39, banim_merm_sw1_oam_frame_43_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_merm_sw1_sheet_2, 40, banim_merm_sw1_oam_frame_44_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 41, banim_merm_sw1_oam_frame_45_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 42, banim_merm_sw1_oam_frame_46_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 43, banim_merm_sw1_oam_frame_47_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 44, banim_merm_sw1_oam_frame_48_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 45, banim_merm_sw1_oam_frame_49_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 46, banim_merm_sw1_oam_frame_50_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 47, banim_merm_sw1_oam_frame_51_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 48, banim_merm_sw1_oam_frame_52_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 49, banim_merm_sw1_oam_frame_53_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 50, banim_merm_sw1_oam_frame_54_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 51, banim_merm_sw1_oam_frame_55_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 52, banim_merm_sw1_oam_frame_56_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 53, banim_merm_sw1_oam_frame_57_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 54, banim_merm_sw1_oam_frame_58_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 55, banim_merm_sw1_oam_frame_59_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 56, banim_merm_sw1_oam_frame_60_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 57, banim_merm_sw1_oam_frame_61_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 58, banim_merm_sw1_oam_frame_62_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_merm_sw1_sheet_2, 59, banim_merm_sw1_oam_frame_63_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 60, banim_merm_sw1_oam_frame_64_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 61, banim_merm_sw1_oam_frame_65_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 62, banim_merm_sw1_oam_frame_66_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 63, banim_merm_sw1_oam_frame_67_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 64, banim_merm_sw1_oam_frame_68_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 65, banim_merm_sw1_oam_frame_69_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 66, banim_merm_sw1_oam_frame_70_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 67, banim_merm_sw1_oam_frame_71_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 68, banim_merm_sw1_oam_frame_72_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 69, banim_merm_sw1_oam_frame_73_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 70, banim_merm_sw1_oam_frame_74_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 71, banim_merm_sw1_oam_frame_75_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 72, banim_merm_sw1_oam_frame_76_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 73, banim_merm_sw1_oam_frame_77_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 74, banim_merm_sw1_oam_frame_78_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 75, banim_merm_sw1_oam_frame_79_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 76, banim_merm_sw1_oam_frame_80_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 77, banim_merm_sw1_oam_frame_81_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 78, banim_merm_sw1_oam_frame_82_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 79, banim_merm_sw1_oam_frame_83_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 13, banim_merm_sw1_oam_frame_13_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 14, banim_merm_sw1_oam_frame_14_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 15, banim_merm_sw1_oam_frame_15_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 16, banim_merm_sw1_oam_frame_16_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 17, banim_merm_sw1_oam_frame_17_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_merm_sw1_sheet_0, 18, banim_merm_sw1_oam_frame_18_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_hit_critical_1
	banim_code_shake_screnn_heavily
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_merm_sw1_sheet_1, 19, banim_merm_sw1_oam_frame_19_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 20, banim_merm_sw1_oam_frame_20_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_1, 21, banim_merm_sw1_oam_frame_21_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 22, banim_merm_sw1_oam_frame_22_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 23, banim_merm_sw1_oam_frame_23_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 24, banim_merm_sw1_oam_frame_24_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 25, banim_merm_sw1_oam_frame_25_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 26, banim_merm_sw1_oam_frame_26_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 27, banim_merm_sw1_oam_frame_27_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 28, banim_merm_sw1_oam_frame_28_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 29, banim_merm_sw1_oam_frame_29_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 30, banim_merm_sw1_oam_frame_30_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 31, banim_merm_sw1_oam_frame_31_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 30, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 8, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 15, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 4, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 82, banim_merm_sw1_oam_frame_84_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_hit_critical_1
	banim_code_shake_screnn_heavily
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_merm_sw1_sheet_1, 89, banim_merm_sw1_oam_frame_33_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 90, banim_merm_sw1_oam_frame_34_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 81, banim_merm_sw1_oam_frame_35_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 80, banim_merm_sw1_oam_frame_32_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 50, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 86, banim_merm_sw1_oam_frame_85_r - banim_merm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 50, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_merm_sw1_sheet_2, 86, banim_merm_sw1_oam_frame_85_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 50, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 86, banim_merm_sw1_oam_frame_85_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 88, banim_merm_sw1_oam_frame_87_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 88, banim_merm_sw1_oam_frame_87_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_2, 88, banim_merm_sw1_oam_frame_87_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_2, 88, banim_merm_sw1_oam_frame_87_r - banim_merm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 50, banim_merm_sw1_sheet_2, 87, banim_merm_sw1_oam_frame_86_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_merm_sw1_sheet_2, 86, banim_merm_sw1_oam_frame_85_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 84, banim_merm_sw1_oam_frame_88_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 85, banim_merm_sw1_oam_frame_89_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 84, banim_merm_sw1_oam_frame_88_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_merm_sw1_sheet_2, 84, banim_merm_sw1_oam_frame_88_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_2, 85, banim_merm_sw1_oam_frame_89_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_merm_sw1_sheet_2, 84, banim_merm_sw1_oam_frame_88_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_merm_sw1_mode_stand_close:
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_merm_sw1_mode_stand:
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_merm_sw1_mode_stand_range:
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_merm_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_merm_sw1_sheet_0, 0, banim_merm_sw1_oam_frame_0_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_frame 5, banim_merm_sw1_sheet_0, 2, banim_merm_sw1_oam_frame_2_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 3, banim_merm_sw1_oam_frame_3_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 4, banim_merm_sw1_oam_frame_4_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 5, banim_merm_sw1_oam_frame_5_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 6, banim_merm_sw1_oam_frame_6_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 7, banim_merm_sw1_oam_frame_7_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 8, banim_merm_sw1_oam_frame_8_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 9, banim_merm_sw1_oam_frame_9_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 10, banim_merm_sw1_oam_frame_10_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_0, 11, banim_merm_sw1_oam_frame_11_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_0, 12, banim_merm_sw1_oam_frame_12_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 13, banim_merm_sw1_oam_frame_13_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 14, banim_merm_sw1_oam_frame_14_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 15, banim_merm_sw1_oam_frame_15_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 16, banim_merm_sw1_oam_frame_16_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 17, banim_merm_sw1_oam_frame_17_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_merm_sw1_sheet_0, 18, banim_merm_sw1_oam_frame_18_r - banim_merm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_merm_sw1_sheet_1, 91, banim_merm_sw1_oam_frame_90_r - banim_merm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_merm_sw1_sheet_1, 92, banim_merm_sw1_oam_frame_91_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 21, banim_merm_sw1_oam_frame_21_r - banim_merm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_merm_sw1_sheet_1, 22, banim_merm_sw1_oam_frame_22_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 23, banim_merm_sw1_oam_frame_23_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_0, 24, banim_merm_sw1_oam_frame_24_r - banim_merm_sw1_oam_r
	banim_code_frame 3, banim_merm_sw1_sheet_1, 25, banim_merm_sw1_oam_frame_25_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 26, banim_merm_sw1_oam_frame_26_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 27, banim_merm_sw1_oam_frame_27_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 28, banim_merm_sw1_oam_frame_28_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 29, banim_merm_sw1_oam_frame_29_r - banim_merm_sw1_oam_r
	banim_code_frame 1, banim_merm_sw1_sheet_1, 30, banim_merm_sw1_oam_frame_30_r - banim_merm_sw1_oam_r
	banim_code_frame 2, banim_merm_sw1_sheet_1, 31, banim_merm_sw1_oam_frame_31_r - banim_merm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_merm_sw1_sheet_0, 1, banim_merm_sw1_oam_frame_1_r - banim_merm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
