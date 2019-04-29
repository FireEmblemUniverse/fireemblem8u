@ vim:ft=armv4
	.global banim_bram_sw1_2_script
	.global banim_bram_sw1_2_mode_attack_close
	.global banim_bram_sw1_2_mode_attack_close_back
	.global banim_bram_sw1_2_mode_attack_close_critical
	.global banim_bram_sw1_2_mode_attack_close_critical_back
	.global banim_bram_sw1_2_mode_attack_range
	.global banim_bram_sw1_2_mode_attack_range_critical
	.global banim_bram_sw1_2_mode_dodge_close
	.global banim_bram_sw1_2_mode_dodge_range
	.global banim_bram_sw1_2_mode_stand_close
	.global banim_bram_sw1_2_mode_stand
	.global banim_bram_sw1_2_mode_stand_range
	.global banim_bram_sw1_2_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_bram_sw1_2_script:
banim_bram_sw1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 1, banim_bram_sw1_2_oam_frame_1_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 2, banim_bram_sw1_2_oam_frame_2_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 3, banim_bram_sw1_2_oam_frame_3_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 4, banim_bram_sw1_2_oam_frame_4_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_bram_sw1_sheet_0, 5, banim_bram_sw1_2_oam_frame_5_r - banim_bram_sw1_2_oam_r
	banim_code_frame 5, banim_bram_sw1_sheet_0, 6, banim_bram_sw1_2_oam_frame_6_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 7, banim_bram_sw1_2_oam_frame_7_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_0, 8, banim_bram_sw1_2_oam_frame_8_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 9, banim_bram_sw1_2_oam_frame_9_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 10, banim_bram_sw1_2_oam_frame_10_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 11, banim_bram_sw1_2_oam_frame_11_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 12, banim_bram_sw1_2_oam_frame_12_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 13, banim_bram_sw1_2_oam_frame_13_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 14, banim_bram_sw1_2_oam_frame_14_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 15, banim_bram_sw1_2_oam_frame_15_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_sheet_0, 16, banim_bram_sw1_2_oam_frame_16_r - banim_bram_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 3, banim_bram_sw1_sheet_0, 17, banim_bram_sw1_2_oam_frame_17_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 18, banim_bram_sw1_2_oam_frame_18_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bram_sw1_sheet_1, 19, banim_bram_sw1_2_oam_frame_19_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 20, banim_bram_sw1_2_oam_frame_20_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 21, banim_bram_sw1_2_oam_frame_21_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 22, banim_bram_sw1_2_oam_frame_22_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 23, banim_bram_sw1_2_oam_frame_23_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 24, banim_bram_sw1_2_oam_frame_24_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_1, 25, banim_bram_sw1_2_oam_frame_25_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 26, banim_bram_sw1_2_oam_frame_26_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 27, banim_bram_sw1_2_oam_frame_27_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 28, banim_bram_sw1_2_oam_frame_28_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 29, banim_bram_sw1_2_oam_frame_29_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 30, banim_bram_sw1_2_oam_frame_30_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 31, banim_bram_sw1_2_oam_frame_31_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 32, banim_bram_sw1_2_oam_frame_32_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 33, banim_bram_sw1_2_oam_frame_33_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 34, banim_bram_sw1_2_oam_frame_34_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 35, banim_bram_sw1_2_oam_frame_35_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 36, banim_bram_sw1_2_oam_frame_36_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 37, banim_bram_sw1_2_oam_frame_37_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 38, banim_bram_sw1_2_oam_frame_38_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 39, banim_bram_sw1_2_oam_frame_39_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 40, banim_bram_sw1_2_oam_frame_40_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 41, banim_bram_sw1_2_oam_frame_41_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 42, banim_bram_sw1_2_oam_frame_42_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 43, banim_bram_sw1_2_oam_frame_43_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 44, banim_bram_sw1_2_oam_frame_44_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 45, banim_bram_sw1_2_oam_frame_45_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 46, banim_bram_sw1_2_oam_frame_46_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 47, banim_bram_sw1_2_oam_frame_47_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 48, banim_bram_sw1_2_oam_frame_48_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 49, banim_bram_sw1_2_oam_frame_49_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 50, banim_bram_sw1_2_oam_frame_50_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 51, banim_bram_sw1_2_oam_frame_51_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 52, banim_bram_sw1_2_oam_frame_52_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 53, banim_bram_sw1_2_oam_frame_53_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 54, banim_bram_sw1_2_oam_frame_54_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 55, banim_bram_sw1_2_oam_frame_55_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 56, banim_bram_sw1_2_oam_frame_56_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 57, banim_bram_sw1_2_oam_frame_57_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 58, banim_bram_sw1_2_oam_frame_58_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 59, banim_bram_sw1_2_oam_frame_59_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 60, banim_bram_sw1_2_oam_frame_60_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 61, banim_bram_sw1_2_oam_frame_61_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 62, banim_bram_sw1_2_oam_frame_62_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 63, banim_bram_sw1_2_oam_frame_63_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 64, banim_bram_sw1_2_oam_frame_64_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 66, banim_bram_sw1_2_oam_frame_66_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 67, banim_bram_sw1_2_oam_frame_67_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 5, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 3, banim_bram_sw1_sheet_0, 139, banim_bram_sw1_2_oam_frame_69_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 139, banim_bram_sw1_2_oam_frame_69_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 68, banim_bram_sw1_2_oam_frame_74_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 69, banim_bram_sw1_2_oam_frame_75_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 70, banim_bram_sw1_2_oam_frame_76_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 71, banim_bram_sw1_2_oam_frame_77_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 72, banim_bram_sw1_2_oam_frame_78_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 73, banim_bram_sw1_2_oam_frame_79_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 74, banim_bram_sw1_2_oam_frame_80_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 75, banim_bram_sw1_2_oam_frame_81_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 76, banim_bram_sw1_2_oam_frame_82_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 77, banim_bram_sw1_2_oam_frame_83_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 78, banim_bram_sw1_2_oam_frame_84_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 79, banim_bram_sw1_2_oam_frame_85_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 80, banim_bram_sw1_2_oam_frame_86_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 81, banim_bram_sw1_2_oam_frame_87_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 82, banim_bram_sw1_2_oam_frame_88_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 83, banim_bram_sw1_2_oam_frame_89_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 84, banim_bram_sw1_2_oam_frame_90_r - banim_bram_sw1_2_oam_r
	banim_code_toss_shield
	banim_code_frame 14, banim_bram_sw1_sheet_3, 85, banim_bram_sw1_2_oam_frame_91_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 86, banim_bram_sw1_2_oam_frame_92_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 87, banim_bram_sw1_2_oam_frame_93_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 88, banim_bram_sw1_2_oam_frame_94_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_bram_sw1_sheet_2, 89, banim_bram_sw1_2_oam_frame_95_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 90, banim_bram_sw1_2_oam_frame_96_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 91, banim_bram_sw1_2_oam_frame_97_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 92, banim_bram_sw1_2_oam_frame_98_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 93, banim_bram_sw1_2_oam_frame_99_r - banim_bram_sw1_2_oam_r
	banim_code_frame 35, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 94, banim_bram_sw1_2_oam_frame_100_r - banim_bram_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood
	banim_code_hit_critical_3
	banim_code_sound_axe_swing_long
	banim_code_frame 5, banim_bram_sw1_sheet_3, 95, banim_bram_sw1_2_oam_frame_101_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_sheet_3, 96, banim_bram_sw1_2_oam_frame_102_r - banim_bram_sw1_2_oam_r
	banim_code_frame 16, banim_bram_sw1_sheet_3, 97, banim_bram_sw1_2_oam_frame_103_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 98, banim_bram_sw1_2_oam_frame_104_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 99, banim_bram_sw1_2_oam_frame_105_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 100, banim_bram_sw1_2_oam_frame_106_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 101, banim_bram_sw1_2_oam_frame_107_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 102, banim_bram_sw1_2_oam_frame_108_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 103, banim_bram_sw1_2_oam_frame_109_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 104, banim_bram_sw1_2_oam_frame_110_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 105, banim_bram_sw1_2_oam_frame_111_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 106, banim_bram_sw1_2_oam_frame_112_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 107, banim_bram_sw1_2_oam_frame_113_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 108, banim_bram_sw1_2_oam_frame_114_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 109, banim_bram_sw1_2_oam_frame_115_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 110, banim_bram_sw1_2_oam_frame_116_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 111, banim_bram_sw1_2_oam_frame_117_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 112, banim_bram_sw1_2_oam_frame_118_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 113, banim_bram_sw1_2_oam_frame_119_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 114, banim_bram_sw1_2_oam_frame_120_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 115, banim_bram_sw1_2_oam_frame_121_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 116, banim_bram_sw1_2_oam_frame_122_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 117, banim_bram_sw1_2_oam_frame_123_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 118, banim_bram_sw1_2_oam_frame_124_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 119, banim_bram_sw1_2_oam_frame_125_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 120, banim_bram_sw1_2_oam_frame_126_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 121, banim_bram_sw1_2_oam_frame_127_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 122, banim_bram_sw1_2_oam_frame_128_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 123, banim_bram_sw1_2_oam_frame_129_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 124, banim_bram_sw1_2_oam_frame_130_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 125, banim_bram_sw1_2_oam_frame_131_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 126, banim_bram_sw1_2_oam_frame_132_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 127, banim_bram_sw1_2_oam_frame_133_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 128, banim_bram_sw1_2_oam_frame_134_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 129, banim_bram_sw1_2_oam_frame_135_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 130, banim_bram_sw1_2_oam_frame_136_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 131, banim_bram_sw1_2_oam_frame_137_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_1, 132, banim_bram_sw1_2_oam_frame_138_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 26, banim_bram_sw1_2_oam_frame_26_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 27, banim_bram_sw1_2_oam_frame_27_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 28, banim_bram_sw1_2_oam_frame_28_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 29, banim_bram_sw1_2_oam_frame_29_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 30, banim_bram_sw1_2_oam_frame_30_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 31, banim_bram_sw1_2_oam_frame_31_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 32, banim_bram_sw1_2_oam_frame_32_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 33, banim_bram_sw1_2_oam_frame_33_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 34, banim_bram_sw1_2_oam_frame_34_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 35, banim_bram_sw1_2_oam_frame_35_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 36, banim_bram_sw1_2_oam_frame_36_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 37, banim_bram_sw1_2_oam_frame_37_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 38, banim_bram_sw1_2_oam_frame_38_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 39, banim_bram_sw1_2_oam_frame_39_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 40, banim_bram_sw1_2_oam_frame_40_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 41, banim_bram_sw1_2_oam_frame_41_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 42, banim_bram_sw1_2_oam_frame_42_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 43, banim_bram_sw1_2_oam_frame_43_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 44, banim_bram_sw1_2_oam_frame_44_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 45, banim_bram_sw1_2_oam_frame_45_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 46, banim_bram_sw1_2_oam_frame_46_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 47, banim_bram_sw1_2_oam_frame_47_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 48, banim_bram_sw1_2_oam_frame_48_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 49, banim_bram_sw1_2_oam_frame_49_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 50, banim_bram_sw1_2_oam_frame_50_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 51, banim_bram_sw1_2_oam_frame_51_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 52, banim_bram_sw1_2_oam_frame_52_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 53, banim_bram_sw1_2_oam_frame_53_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 54, banim_bram_sw1_2_oam_frame_54_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 55, banim_bram_sw1_2_oam_frame_55_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 56, banim_bram_sw1_2_oam_frame_56_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 57, banim_bram_sw1_2_oam_frame_57_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 58, banim_bram_sw1_2_oam_frame_58_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 59, banim_bram_sw1_2_oam_frame_59_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 60, banim_bram_sw1_2_oam_frame_60_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 61, banim_bram_sw1_2_oam_frame_61_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 62, banim_bram_sw1_2_oam_frame_62_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 63, banim_bram_sw1_2_oam_frame_63_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 64, banim_bram_sw1_2_oam_frame_64_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 66, banim_bram_sw1_2_oam_frame_66_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 67, banim_bram_sw1_2_oam_frame_67_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_toss_shield
	banim_code_frame 14, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 35, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood
	banim_code_hit_critical_3
	banim_code_sound_axe_swing_long
	banim_code_frame 5, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 16, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 44, banim_bram_sw1_2_oam_frame_44_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_range:
	banim_code_frame 4, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_range_critical:
	banim_code_frame 4, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_end_mode
banim_bram_sw1_2_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 137, banim_bram_sw1_2_oam_frame_141_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 138, banim_bram_sw1_2_oam_frame_142_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 137, banim_bram_sw1_2_oam_frame_141_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 137, banim_bram_sw1_2_oam_frame_141_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 138, banim_bram_sw1_2_oam_frame_142_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 137, banim_bram_sw1_2_oam_frame_141_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_2_mode_stand:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 1, banim_bram_sw1_2_oam_frame_1_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 2, banim_bram_sw1_2_oam_frame_2_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 3, banim_bram_sw1_2_oam_frame_3_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 4, banim_bram_sw1_2_oam_frame_4_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_bram_sw1_sheet_0, 5, banim_bram_sw1_2_oam_frame_5_r - banim_bram_sw1_2_oam_r
	banim_code_frame 5, banim_bram_sw1_sheet_0, 6, banim_bram_sw1_2_oam_frame_6_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 7, banim_bram_sw1_2_oam_frame_7_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_0, 8, banim_bram_sw1_2_oam_frame_8_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 9, banim_bram_sw1_2_oam_frame_9_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 10, banim_bram_sw1_2_oam_frame_10_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 11, banim_bram_sw1_2_oam_frame_11_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 12, banim_bram_sw1_2_oam_frame_12_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 13, banim_bram_sw1_2_oam_frame_13_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 14, banim_bram_sw1_2_oam_frame_14_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 15, banim_bram_sw1_2_oam_frame_15_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_0, 16, banim_bram_sw1_2_oam_frame_16_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 143, banim_bram_sw1_2_oam_frame_143_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 144, banim_bram_sw1_2_oam_frame_144_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_sheet_2, 26, banim_bram_sw1_2_oam_frame_26_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 27, banim_bram_sw1_2_oam_frame_27_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 28, banim_bram_sw1_2_oam_frame_28_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 29, banim_bram_sw1_2_oam_frame_29_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 30, banim_bram_sw1_2_oam_frame_30_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 31, banim_bram_sw1_2_oam_frame_31_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 32, banim_bram_sw1_2_oam_frame_32_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 33, banim_bram_sw1_2_oam_frame_33_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 34, banim_bram_sw1_2_oam_frame_34_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 35, banim_bram_sw1_2_oam_frame_35_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 36, banim_bram_sw1_2_oam_frame_36_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 37, banim_bram_sw1_2_oam_frame_37_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 38, banim_bram_sw1_2_oam_frame_38_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 39, banim_bram_sw1_2_oam_frame_39_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 40, banim_bram_sw1_2_oam_frame_40_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 41, banim_bram_sw1_2_oam_frame_41_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 42, banim_bram_sw1_2_oam_frame_42_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 43, banim_bram_sw1_2_oam_frame_43_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 44, banim_bram_sw1_2_oam_frame_44_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 45, banim_bram_sw1_2_oam_frame_45_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 46, banim_bram_sw1_2_oam_frame_46_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 47, banim_bram_sw1_2_oam_frame_47_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 48, banim_bram_sw1_2_oam_frame_48_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 49, banim_bram_sw1_2_oam_frame_49_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 50, banim_bram_sw1_2_oam_frame_50_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 51, banim_bram_sw1_2_oam_frame_51_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 52, banim_bram_sw1_2_oam_frame_52_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 53, banim_bram_sw1_2_oam_frame_53_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 54, banim_bram_sw1_2_oam_frame_54_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 55, banim_bram_sw1_2_oam_frame_55_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 56, banim_bram_sw1_2_oam_frame_56_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 57, banim_bram_sw1_2_oam_frame_57_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 58, banim_bram_sw1_2_oam_frame_58_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 59, banim_bram_sw1_2_oam_frame_59_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 60, banim_bram_sw1_2_oam_frame_60_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 61, banim_bram_sw1_2_oam_frame_61_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 62, banim_bram_sw1_2_oam_frame_62_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 63, banim_bram_sw1_2_oam_frame_63_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 64, banim_bram_sw1_2_oam_frame_64_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 66, banim_bram_sw1_2_oam_frame_66_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 67, banim_bram_sw1_2_oam_frame_67_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
