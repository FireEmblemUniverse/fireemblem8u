@ vim:ft=armv4
	.global banim_asnm_sw1_3_script
	.global banim_asnm_sw1_3_mode_attack_close
	.global banim_asnm_sw1_3_mode_attack_close_back
	.global banim_asnm_sw1_3_mode_attack_close_critical
	.global banim_asnm_sw1_3_mode_attack_close_critical_back
	.global banim_asnm_sw1_3_mode_attack_range
	.global banim_asnm_sw1_3_mode_attack_range_critical
	.global banim_asnm_sw1_3_mode_dodge_close
	.global banim_asnm_sw1_3_mode_dodge_range
	.global banim_asnm_sw1_3_mode_stand_close
	.global banim_asnm_sw1_3_mode_stand
	.global banim_asnm_sw1_3_mode_stand_range
	.global banim_asnm_sw1_3_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_asnm_sw1_3_script:
banim_asnm_sw1_3_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 1, banim_asnm_sw1_3_oam_frame_1_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 2, banim_asnm_sw1_3_oam_frame_2_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 3, banim_asnm_sw1_3_oam_frame_3_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 4, banim_asnm_sw1_3_oam_frame_4_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_3_oam_frame_5_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_3_oam_frame_5_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_3_oam_frame_5_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 7, banim_asnm_sw1_3_oam_frame_7_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 7, banim_asnm_sw1_3_oam_frame_7_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 7, banim_asnm_sw1_3_oam_frame_7_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 8, banim_asnm_sw1_3_oam_frame_8_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 9, banim_asnm_sw1_3_oam_frame_9_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_1, 10, banim_asnm_sw1_3_oam_frame_10_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 12, banim_asnm_sw1_3_oam_frame_11_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 14, banim_asnm_sw1_3_oam_frame_12_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 16, banim_asnm_sw1_3_oam_frame_13_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 17, banim_asnm_sw1_3_oam_frame_14_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 18, banim_asnm_sw1_3_oam_frame_15_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_0, 19, banim_asnm_sw1_3_oam_frame_16_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 9, banim_asnm_sw1_sheet_0, 20, banim_asnm_sw1_3_oam_frame_17_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_click
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 21, banim_asnm_sw1_3_oam_frame_18_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 22, banim_asnm_sw1_3_oam_frame_19_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 10, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_3_oam_frame_20_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 24, banim_asnm_sw1_3_oam_frame_21_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 25, banim_asnm_sw1_3_oam_frame_22_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 26, banim_asnm_sw1_3_oam_frame_23_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 27, banim_asnm_sw1_3_oam_frame_24_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 28, banim_asnm_sw1_3_oam_frame_25_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 29, banim_asnm_sw1_3_oam_frame_26_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 30, banim_asnm_sw1_3_oam_frame_27_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 31, banim_asnm_sw1_3_oam_frame_28_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 32, banim_asnm_sw1_3_oam_frame_29_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 33, banim_asnm_sw1_3_oam_frame_30_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 35, banim_asnm_sw1_3_oam_frame_31_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 36, banim_asnm_sw1_3_oam_frame_32_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 37, banim_asnm_sw1_3_oam_frame_33_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 38, banim_asnm_sw1_3_oam_frame_34_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 39, banim_asnm_sw1_3_oam_frame_35_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 40, banim_asnm_sw1_3_oam_frame_36_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_3_oam_frame_37_r - banim_asnm_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_3_oam_frame_37_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 42, banim_asnm_sw1_3_oam_frame_38_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 43, banim_asnm_sw1_3_oam_frame_39_r - banim_asnm_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_3_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 13, banim_asnm_sw1_3_oam_frame_41_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 15, banim_asnm_sw1_3_oam_frame_42_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 9, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_click
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 10, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_3_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_effect_instant_kill_1
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 48, banim_asnm_sw1_3_oam_frame_45_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 49, banim_asnm_sw1_3_oam_frame_46_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_3, 50, banim_asnm_sw1_3_oam_frame_47_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 51, banim_asnm_sw1_3_oam_frame_48_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 52, banim_asnm_sw1_3_oam_frame_49_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 53, banim_asnm_sw1_3_oam_frame_50_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_3, 54, banim_asnm_sw1_3_oam_frame_51_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 55, banim_asnm_sw1_3_oam_frame_52_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 56, banim_asnm_sw1_3_oam_frame_53_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 57, banim_asnm_sw1_3_oam_frame_54_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 58, banim_asnm_sw1_3_oam_frame_55_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 59, banim_asnm_sw1_3_oam_frame_56_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 60, banim_asnm_sw1_3_oam_frame_57_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 61, banim_asnm_sw1_3_oam_frame_58_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 11, banim_asnm_sw1_sheet_3, 62, banim_asnm_sw1_3_oam_frame_59_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 63, banim_asnm_sw1_3_oam_frame_60_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_3_oam_frame_5_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_3_oam_frame_5_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_3_oam_frame_5_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 74, banim_asnm_sw1_3_oam_frame_61_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 74, banim_asnm_sw1_3_oam_frame_61_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 74, banim_asnm_sw1_3_oam_frame_61_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 75, banim_asnm_sw1_3_oam_frame_62_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 76, banim_asnm_sw1_3_oam_frame_63_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 77, banim_asnm_sw1_3_oam_frame_64_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 78, banim_asnm_sw1_3_oam_frame_65_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 79, banim_asnm_sw1_3_oam_frame_66_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 6, banim_asnm_sw1_sheet_1, 80, banim_asnm_sw1_3_oam_frame_67_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_1, 81, banim_asnm_sw1_3_oam_frame_68_r - banim_asnm_sw1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_1
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 82, banim_asnm_sw1_3_oam_frame_69_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 83, banim_asnm_sw1_3_oam_frame_70_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 84, banim_asnm_sw1_3_oam_frame_71_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 85, banim_asnm_sw1_3_oam_frame_72_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 86, banim_asnm_sw1_3_oam_frame_73_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_3_oam_frame_20_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_3_oam_frame_20_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_3_oam_frame_20_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 24, banim_asnm_sw1_3_oam_frame_21_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 25, banim_asnm_sw1_3_oam_frame_22_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 26, banim_asnm_sw1_3_oam_frame_23_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 27, banim_asnm_sw1_3_oam_frame_24_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 28, banim_asnm_sw1_3_oam_frame_25_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 29, banim_asnm_sw1_3_oam_frame_26_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 30, banim_asnm_sw1_3_oam_frame_27_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 31, banim_asnm_sw1_3_oam_frame_28_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 32, banim_asnm_sw1_3_oam_frame_29_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 33, banim_asnm_sw1_3_oam_frame_30_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 35, banim_asnm_sw1_3_oam_frame_31_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 36, banim_asnm_sw1_3_oam_frame_32_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 37, banim_asnm_sw1_3_oam_frame_33_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 38, banim_asnm_sw1_3_oam_frame_34_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 39, banim_asnm_sw1_3_oam_frame_35_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 40, banim_asnm_sw1_3_oam_frame_36_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_3_oam_frame_37_r - banim_asnm_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_3_oam_frame_37_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 42, banim_asnm_sw1_3_oam_frame_38_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 43, banim_asnm_sw1_3_oam_frame_39_r - banim_asnm_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_3_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_effect_instant_kill_1
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 11, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_hit_eliwood
	banim_code_frame 6, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_1
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 47, banim_asnm_sw1_3_oam_frame_40_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 6, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 45, banim_asnm_sw1_3_oam_frame_43_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 46, banim_asnm_sw1_3_oam_frame_44_r - banim_asnm_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_3_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 66, banim_asnm_sw1_3_oam_frame_74_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 67, banim_asnm_sw1_3_oam_frame_75_r - banim_asnm_sw1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 68, banim_asnm_sw1_3_oam_frame_76_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_3_oam_frame_77_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 67, banim_asnm_sw1_3_oam_frame_75_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_click
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 71, banim_asnm_sw1_3_oam_frame_78_r - banim_asnm_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_3_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 66, banim_asnm_sw1_3_oam_frame_74_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 67, banim_asnm_sw1_3_oam_frame_75_r - banim_asnm_sw1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 68, banim_asnm_sw1_3_oam_frame_76_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_3_oam_frame_77_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_3_oam_frame_79_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_3_oam_frame_77_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_3_oam_frame_79_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_3_oam_frame_77_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_3_oam_frame_79_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_3_oam_frame_77_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_3_oam_frame_79_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_3_oam_frame_77_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 70, banim_asnm_sw1_3_oam_frame_79_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_3, 69, banim_asnm_sw1_3_oam_frame_77_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 67, banim_asnm_sw1_3_oam_frame_75_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_click
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_asnm_sw1_sheet_3, 71, banim_asnm_sw1_3_oam_frame_78_r - banim_asnm_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_3_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 64, banim_asnm_sw1_3_oam_frame_80_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 65, banim_asnm_sw1_3_oam_frame_81_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 64, banim_asnm_sw1_3_oam_frame_80_r - banim_asnm_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_3_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 64, banim_asnm_sw1_3_oam_frame_80_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 65, banim_asnm_sw1_3_oam_frame_81_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_asnm_sw1_sheet_3, 64, banim_asnm_sw1_3_oam_frame_80_r - banim_asnm_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_asnm_sw1_3_mode_stand_close:
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_asnm_sw1_3_mode_stand:
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_asnm_sw1_3_mode_stand_range:
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_asnm_sw1_3_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 0, banim_asnm_sw1_3_oam_frame_0_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 1, banim_asnm_sw1_3_oam_frame_1_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 2, banim_asnm_sw1_3_oam_frame_2_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 3, banim_asnm_sw1_3_oam_frame_3_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 3, banim_asnm_sw1_sheet_0, 4, banim_asnm_sw1_3_oam_frame_4_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_3_oam_frame_5_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_3_oam_frame_5_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 5, banim_asnm_sw1_3_oam_frame_5_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 8, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 6, banim_asnm_sw1_3_oam_frame_82_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 6, banim_asnm_sw1_3_oam_frame_82_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 44, banim_asnm_sw1_3_oam_frame_6_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 6, banim_asnm_sw1_3_oam_frame_82_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 7, banim_asnm_sw1_3_oam_frame_7_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 8, banim_asnm_sw1_3_oam_frame_8_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_1, 9, banim_asnm_sw1_3_oam_frame_9_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_asnm_sw1_sheet_1, 10, banim_asnm_sw1_3_oam_frame_10_r - banim_asnm_sw1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 72, banim_asnm_sw1_3_oam_frame_83_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 73, banim_asnm_sw1_3_oam_frame_84_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_0, 16, banim_asnm_sw1_3_oam_frame_13_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 17, banim_asnm_sw1_3_oam_frame_14_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_0, 18, banim_asnm_sw1_3_oam_frame_15_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_0, 19, banim_asnm_sw1_3_oam_frame_16_r - banim_asnm_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 9, banim_asnm_sw1_sheet_0, 20, banim_asnm_sw1_3_oam_frame_17_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_sword_click
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 21, banim_asnm_sw1_3_oam_frame_18_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 22, banim_asnm_sw1_3_oam_frame_19_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 10, banim_asnm_sw1_sheet_2, 23, banim_asnm_sw1_3_oam_frame_20_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 24, banim_asnm_sw1_3_oam_frame_21_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 25, banim_asnm_sw1_3_oam_frame_22_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 26, banim_asnm_sw1_3_oam_frame_23_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 27, banim_asnm_sw1_3_oam_frame_24_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 28, banim_asnm_sw1_3_oam_frame_25_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 29, banim_asnm_sw1_3_oam_frame_26_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 30, banim_asnm_sw1_3_oam_frame_27_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 31, banim_asnm_sw1_3_oam_frame_28_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 32, banim_asnm_sw1_3_oam_frame_29_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 33, banim_asnm_sw1_3_oam_frame_30_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 35, banim_asnm_sw1_3_oam_frame_31_r - banim_asnm_sw1_3_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 5, banim_asnm_sw1_sheet_2, 36, banim_asnm_sw1_3_oam_frame_32_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 7, banim_asnm_sw1_sheet_2, 37, banim_asnm_sw1_3_oam_frame_33_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 38, banim_asnm_sw1_3_oam_frame_34_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 3, banim_asnm_sw1_sheet_2, 39, banim_asnm_sw1_3_oam_frame_35_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 4, banim_asnm_sw1_sheet_2, 40, banim_asnm_sw1_3_oam_frame_36_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 1, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_3_oam_frame_37_r - banim_asnm_sw1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 41, banim_asnm_sw1_3_oam_frame_37_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_2, 42, banim_asnm_sw1_3_oam_frame_38_r - banim_asnm_sw1_3_oam_r
	banim_code_frame 2, banim_asnm_sw1_sheet_3, 43, banim_asnm_sw1_3_oam_frame_39_r - banim_asnm_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
