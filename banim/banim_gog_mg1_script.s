@ vim:ft=armv4
	.global banim_gog_mg1_script
	.global banim_gog_mg1_mode_attack_close
	.global banim_gog_mg1_mode_attack_close_back
	.global banim_gog_mg1_mode_attack_close_critical
	.global banim_gog_mg1_mode_attack_close_critical_back
	.global banim_gog_mg1_mode_attack_range
	.global banim_gog_mg1_mode_attack_range_critical
	.global banim_gog_mg1_mode_dodge_close
	.global banim_gog_mg1_mode_dodge_range
	.global banim_gog_mg1_mode_stand_close
	.global banim_gog_mg1_mode_stand
	.global banim_gog_mg1_mode_stand_range
	.global banim_gog_mg1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_gog_mg1_script:
banim_gog_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_sound_gorgon_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 10, banim_gog_mg1_oam_frame_10_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 11, banim_gog_mg1_oam_frame_11_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 12, banim_gog_mg1_oam_frame_12_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 13, banim_gog_mg1_oam_frame_13_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_sound_gorgon_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_scream
	banim_code_frame 3, banim_gog_mg1_sheet_5, 46, banim_gog_mg1_oam_frame_48_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 47, banim_gog_mg1_oam_frame_49_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_6, 48, banim_gog_mg1_oam_frame_50_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 47, banim_gog_mg1_oam_frame_49_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 46, banim_gog_mg1_oam_frame_48_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_1
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_scream
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_1
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_sound_gorgon_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 10, banim_gog_mg1_oam_frame_10_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 11, banim_gog_mg1_oam_frame_11_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 12, banim_gog_mg1_oam_frame_12_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 13, banim_gog_mg1_oam_frame_13_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_scream
	banim_code_frame 3, banim_gog_mg1_sheet_5, 46, banim_gog_mg1_oam_frame_48_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 47, banim_gog_mg1_oam_frame_49_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_6, 48, banim_gog_mg1_oam_frame_50_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 47, banim_gog_mg1_oam_frame_49_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 46, banim_gog_mg1_oam_frame_48_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_1
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_gog_mg1_sheet_7, 55, banim_gog_mg1_oam_frame_53_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_7, 56, banim_gog_mg1_oam_frame_54_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_gog_mg1_sheet_7, 57, banim_gog_mg1_oam_frame_55_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_gog_mg1_sheet_7, 55, banim_gog_mg1_oam_frame_53_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_7, 56, banim_gog_mg1_oam_frame_54_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_gog_mg1_sheet_7, 57, banim_gog_mg1_oam_frame_55_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_stand_close:
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gog_mg1_mode_stand:
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gog_mg1_mode_stand_range:
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gog_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_sound_gorgon_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 10, banim_gog_mg1_oam_frame_10_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 11, banim_gog_mg1_oam_frame_11_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 12, banim_gog_mg1_oam_frame_12_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 13, banim_gog_mg1_oam_frame_13_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
