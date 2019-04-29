@ vim:ft=armv4
	.global banim_mgkm_mg1_script
	.global banim_mgkm_mg1_mode_attack_close
	.global banim_mgkm_mg1_mode_attack_close_back
	.global banim_mgkm_mg1_mode_attack_close_critical
	.global banim_mgkm_mg1_mode_attack_close_critical_back
	.global banim_mgkm_mg1_mode_attack_range
	.global banim_mgkm_mg1_mode_attack_range_critical
	.global banim_mgkm_mg1_mode_dodge_close
	.global banim_mgkm_mg1_mode_dodge_range
	.global banim_mgkm_mg1_mode_stand_close
	.global banim_mgkm_mg1_mode_stand
	.global banim_mgkm_mg1_mode_stand_range
	.global banim_mgkm_mg1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_mgkm_mg1_script:
banim_mgkm_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 54, banim_mgkm_mg1_oam_frame_1_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 55, banim_mgkm_mg1_oam_frame_2_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 56, banim_mgkm_mg1_oam_frame_3_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 57, banim_mgkm_mg1_oam_frame_4_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 58, banim_mgkm_mg1_oam_frame_5_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 59, banim_mgkm_mg1_oam_frame_6_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 60, banim_mgkm_mg1_oam_frame_7_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 61, banim_mgkm_mg1_oam_frame_8_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 62, banim_mgkm_mg1_oam_frame_9_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_sound_892
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 67, banim_mgkm_mg1_oam_frame_14_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 68, banim_mgkm_mg1_oam_frame_15_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 69, banim_mgkm_mg1_oam_frame_16_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 70, banim_mgkm_mg1_oam_frame_17_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 71, banim_mgkm_mg1_oam_frame_18_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 72, banim_mgkm_mg1_oam_frame_19_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 73, banim_mgkm_mg1_oam_frame_20_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 74, banim_mgkm_mg1_oam_frame_21_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 9, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 75, banim_mgkm_mg1_oam_frame_22_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 76, banim_mgkm_mg1_oam_frame_23_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 77, banim_mgkm_mg1_oam_frame_24_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_2, 78, banim_mgkm_mg1_oam_frame_25_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 79, banim_mgkm_mg1_oam_frame_26_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 80, banim_mgkm_mg1_oam_frame_27_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_sound_892
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 84, banim_mgkm_mg1_oam_frame_30_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_2, 84, banim_mgkm_mg1_oam_frame_30_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 84, banim_mgkm_mg1_oam_frame_30_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 84, banim_mgkm_mg1_oam_frame_30_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 6, banim_mgkm_mg1_sheet_0, 1, banim_mgkm_mg1_oam_frame_31_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 2, banim_mgkm_mg1_oam_frame_32_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 3, banim_mgkm_mg1_oam_frame_33_r - banim_mgkm_mg1_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_0, 4, banim_mgkm_mg1_oam_frame_34_r - banim_mgkm_mg1_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_0, 5, banim_mgkm_mg1_oam_frame_35_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 6, banim_mgkm_mg1_oam_frame_36_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 7, banim_mgkm_mg1_oam_frame_37_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 8, banim_mgkm_mg1_oam_frame_38_r - banim_mgkm_mg1_oam_r
	banim_code_sound_elec_jee
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 9, banim_mgkm_mg1_oam_frame_39_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 10, banim_mgkm_mg1_oam_frame_40_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 9, banim_mgkm_mg1_oam_frame_39_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 10, banim_mgkm_mg1_oam_frame_40_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 11, banim_mgkm_mg1_oam_frame_41_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 12, banim_mgkm_mg1_oam_frame_42_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 12, banim_mgkm_mg1_oam_frame_42_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 13, banim_mgkm_mg1_oam_frame_43_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 14, banim_mgkm_mg1_oam_frame_44_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 15, banim_mgkm_mg1_oam_frame_45_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 16, banim_mgkm_mg1_oam_frame_46_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 17, banim_mgkm_mg1_oam_frame_47_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 18, banim_mgkm_mg1_oam_frame_48_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 19, banim_mgkm_mg1_oam_frame_49_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 20, banim_mgkm_mg1_oam_frame_50_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 21, banim_mgkm_mg1_oam_frame_51_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 22, banim_mgkm_mg1_oam_frame_52_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 23, banim_mgkm_mg1_oam_frame_53_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 24, banim_mgkm_mg1_oam_frame_54_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 25, banim_mgkm_mg1_oam_frame_55_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 26, banim_mgkm_mg1_oam_frame_56_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 27, banim_mgkm_mg1_oam_frame_57_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 28, banim_mgkm_mg1_oam_frame_58_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 29, banim_mgkm_mg1_oam_frame_59_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 30, banim_mgkm_mg1_oam_frame_60_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 31, banim_mgkm_mg1_oam_frame_61_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 32, banim_mgkm_mg1_oam_frame_62_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 33, banim_mgkm_mg1_oam_frame_63_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 34, banim_mgkm_mg1_oam_frame_64_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 35, banim_mgkm_mg1_oam_frame_65_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 37, banim_mgkm_mg1_oam_frame_66_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 36, banim_mgkm_mg1_oam_frame_67_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 38, banim_mgkm_mg1_oam_frame_69_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 39, banim_mgkm_mg1_oam_frame_70_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 40, banim_mgkm_mg1_oam_frame_71_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 41, banim_mgkm_mg1_oam_frame_72_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 42, banim_mgkm_mg1_oam_frame_73_r - banim_mgkm_mg1_oam_r
	banim_code_frame 6, banim_mgkm_mg1_sheet_1, 44, banim_mgkm_mg1_oam_frame_74_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 45, banim_mgkm_mg1_oam_frame_75_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 47, banim_mgkm_mg1_oam_frame_76_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 48, banim_mgkm_mg1_oam_frame_77_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 49, banim_mgkm_mg1_oam_frame_78_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 50, banim_mgkm_mg1_oam_frame_79_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 51, banim_mgkm_mg1_oam_frame_80_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 52, banim_mgkm_mg1_oam_frame_81_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 6, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_sound_elec_jee
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 6, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 54, banim_mgkm_mg1_oam_frame_1_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 55, banim_mgkm_mg1_oam_frame_2_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 56, banim_mgkm_mg1_oam_frame_3_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 57, banim_mgkm_mg1_oam_frame_4_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 58, banim_mgkm_mg1_oam_frame_5_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 59, banim_mgkm_mg1_oam_frame_6_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 60, banim_mgkm_mg1_oam_frame_7_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 61, banim_mgkm_mg1_oam_frame_8_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 62, banim_mgkm_mg1_oam_frame_9_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_sound_892
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 67, banim_mgkm_mg1_oam_frame_14_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 68, banim_mgkm_mg1_oam_frame_15_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 69, banim_mgkm_mg1_oam_frame_16_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 70, banim_mgkm_mg1_oam_frame_17_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 71, banim_mgkm_mg1_oam_frame_18_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 72, banim_mgkm_mg1_oam_frame_19_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 73, banim_mgkm_mg1_oam_frame_20_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 74, banim_mgkm_mg1_oam_frame_21_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 9, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 75, banim_mgkm_mg1_oam_frame_22_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 76, banim_mgkm_mg1_oam_frame_23_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 77, banim_mgkm_mg1_oam_frame_24_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_2, 78, banim_mgkm_mg1_oam_frame_25_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 79, banim_mgkm_mg1_oam_frame_26_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 80, banim_mgkm_mg1_oam_frame_27_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 1, banim_mgkm_mg1_oam_frame_31_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 2, banim_mgkm_mg1_oam_frame_32_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 3, banim_mgkm_mg1_oam_frame_33_r - banim_mgkm_mg1_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_0, 4, banim_mgkm_mg1_oam_frame_34_r - banim_mgkm_mg1_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_0, 5, banim_mgkm_mg1_oam_frame_35_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 6, banim_mgkm_mg1_oam_frame_36_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 7, banim_mgkm_mg1_oam_frame_37_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 8, banim_mgkm_mg1_oam_frame_38_r - banim_mgkm_mg1_oam_r
	banim_code_sound_elec_jee
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 9, banim_mgkm_mg1_oam_frame_39_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 10, banim_mgkm_mg1_oam_frame_40_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 9, banim_mgkm_mg1_oam_frame_39_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 10, banim_mgkm_mg1_oam_frame_40_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 11, banim_mgkm_mg1_oam_frame_41_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 12, banim_mgkm_mg1_oam_frame_42_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 12, banim_mgkm_mg1_oam_frame_42_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 13, banim_mgkm_mg1_oam_frame_43_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 14, banim_mgkm_mg1_oam_frame_44_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 15, banim_mgkm_mg1_oam_frame_45_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 16, banim_mgkm_mg1_oam_frame_46_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 17, banim_mgkm_mg1_oam_frame_47_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 18, banim_mgkm_mg1_oam_frame_48_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 19, banim_mgkm_mg1_oam_frame_49_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 20, banim_mgkm_mg1_oam_frame_50_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 21, banim_mgkm_mg1_oam_frame_51_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 22, banim_mgkm_mg1_oam_frame_52_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 23, banim_mgkm_mg1_oam_frame_53_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 24, banim_mgkm_mg1_oam_frame_54_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 25, banim_mgkm_mg1_oam_frame_55_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 26, banim_mgkm_mg1_oam_frame_56_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 27, banim_mgkm_mg1_oam_frame_57_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 28, banim_mgkm_mg1_oam_frame_58_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 29, banim_mgkm_mg1_oam_frame_59_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 30, banim_mgkm_mg1_oam_frame_60_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 31, banim_mgkm_mg1_oam_frame_61_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 32, banim_mgkm_mg1_oam_frame_62_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 33, banim_mgkm_mg1_oam_frame_63_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 34, banim_mgkm_mg1_oam_frame_64_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 35, banim_mgkm_mg1_oam_frame_65_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 37, banim_mgkm_mg1_oam_frame_66_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 36, banim_mgkm_mg1_oam_frame_67_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 38, banim_mgkm_mg1_oam_frame_69_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 39, banim_mgkm_mg1_oam_frame_70_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 40, banim_mgkm_mg1_oam_frame_71_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 41, banim_mgkm_mg1_oam_frame_72_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 42, banim_mgkm_mg1_oam_frame_73_r - banim_mgkm_mg1_oam_r
	banim_code_frame 6, banim_mgkm_mg1_sheet_1, 44, banim_mgkm_mg1_oam_frame_74_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 45, banim_mgkm_mg1_oam_frame_75_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 47, banim_mgkm_mg1_oam_frame_76_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 48, banim_mgkm_mg1_oam_frame_77_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 49, banim_mgkm_mg1_oam_frame_78_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 50, banim_mgkm_mg1_oam_frame_79_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 51, banim_mgkm_mg1_oam_frame_80_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 52, banim_mgkm_mg1_oam_frame_81_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 81, banim_mgkm_mg1_oam_frame_82_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 82, banim_mgkm_mg1_oam_frame_83_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 81, banim_mgkm_mg1_oam_frame_82_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 81, banim_mgkm_mg1_oam_frame_82_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 82, banim_mgkm_mg1_oam_frame_83_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 81, banim_mgkm_mg1_oam_frame_82_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_stand_close:
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mgkm_mg1_mode_stand:
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mgkm_mg1_mode_stand_range:
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 54, banim_mgkm_mg1_oam_frame_1_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 55, banim_mgkm_mg1_oam_frame_2_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 56, banim_mgkm_mg1_oam_frame_3_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 57, banim_mgkm_mg1_oam_frame_4_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 58, banim_mgkm_mg1_oam_frame_5_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 59, banim_mgkm_mg1_oam_frame_6_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 60, banim_mgkm_mg1_oam_frame_7_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 61, banim_mgkm_mg1_oam_frame_8_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 62, banim_mgkm_mg1_oam_frame_9_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_sound_892
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 67, banim_mgkm_mg1_oam_frame_14_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 68, banim_mgkm_mg1_oam_frame_15_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 69, banim_mgkm_mg1_oam_frame_16_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 70, banim_mgkm_mg1_oam_frame_17_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 71, banim_mgkm_mg1_oam_frame_18_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 72, banim_mgkm_mg1_oam_frame_19_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 73, banim_mgkm_mg1_oam_frame_20_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 74, banim_mgkm_mg1_oam_frame_21_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 9, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 75, banim_mgkm_mg1_oam_frame_22_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 76, banim_mgkm_mg1_oam_frame_23_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 77, banim_mgkm_mg1_oam_frame_24_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_2, 78, banim_mgkm_mg1_oam_frame_25_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 79, banim_mgkm_mg1_oam_frame_26_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 80, banim_mgkm_mg1_oam_frame_27_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
