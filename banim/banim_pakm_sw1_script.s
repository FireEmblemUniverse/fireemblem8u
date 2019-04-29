@ vim:ft=armv4
	.global banim_pakm_sw1_script
	.global banim_pakm_sw1_mode_attack_close
	.global banim_pakm_sw1_mode_attack_close_back
	.global banim_pakm_sw1_mode_attack_close_critical
	.global banim_pakm_sw1_mode_attack_close_critical_back
	.global banim_pakm_sw1_mode_attack_range
	.global banim_pakm_sw1_mode_attack_range_critical
	.global banim_pakm_sw1_mode_dodge_close
	.global banim_pakm_sw1_mode_dodge_range
	.global banim_pakm_sw1_mode_stand_close
	.global banim_pakm_sw1_mode_stand
	.global banim_pakm_sw1_mode_stand_range
	.global banim_pakm_sw1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_pakm_sw1_script:
banim_pakm_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x54
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 16, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_0, 5, banim_pakm_sw1_oam_frame_5_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_pakm_sw1_sheet_1, 6, banim_pakm_sw1_oam_frame_6_r - banim_pakm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_normal
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 7, banim_pakm_sw1_oam_frame_7_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 8, banim_pakm_sw1_oam_frame_8_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 9, banim_pakm_sw1_oam_frame_9_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_1, 29, banim_pakm_sw1_oam_frame_10_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 10, banim_pakm_sw1_oam_frame_11_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 11, banim_pakm_sw1_oam_frame_12_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 12, banim_pakm_sw1_oam_frame_13_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 13, banim_pakm_sw1_oam_frame_14_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 14, banim_pakm_sw1_oam_frame_15_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 15, banim_pakm_sw1_oam_frame_16_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_2, 16, banim_pakm_sw1_oam_frame_17_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_2, 17, banim_pakm_sw1_oam_frame_18_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 18, banim_pakm_sw1_oam_frame_19_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 20, banim_pakm_sw1_oam_frame_20_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 21, banim_pakm_sw1_oam_frame_21_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 22, banim_pakm_sw1_oam_frame_22_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 23, banim_pakm_sw1_oam_frame_23_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 24, banim_pakm_sw1_oam_frame_24_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 25, banim_pakm_sw1_oam_frame_25_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 26, banim_pakm_sw1_oam_frame_26_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x54
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 16, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_normal
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 42, banim_pakm_sw1_oam_frame_31_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x54
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 43, banim_pakm_sw1_oam_frame_34_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 44, banim_pakm_sw1_oam_frame_35_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 45, banim_pakm_sw1_oam_frame_36_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 46, banim_pakm_sw1_oam_frame_37_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 47, banim_pakm_sw1_oam_frame_38_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 48, banim_pakm_sw1_oam_frame_39_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 49, banim_pakm_sw1_oam_frame_40_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 50, banim_pakm_sw1_oam_frame_41_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 51, banim_pakm_sw1_oam_frame_42_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 48, banim_pakm_sw1_oam_frame_39_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 49, banim_pakm_sw1_oam_frame_40_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 52, banim_pakm_sw1_oam_frame_43_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 53, banim_pakm_sw1_oam_frame_44_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 54, banim_pakm_sw1_oam_frame_45_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 55, banim_pakm_sw1_oam_frame_46_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 56, banim_pakm_sw1_oam_frame_47_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 57, banim_pakm_sw1_oam_frame_48_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 58, banim_pakm_sw1_oam_frame_49_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 59, banim_pakm_sw1_oam_frame_50_r - banim_pakm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 7, banim_pakm_sw1_oam_frame_7_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_pakm_sw1_sheet_1, 8, banim_pakm_sw1_oam_frame_8_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 9, banim_pakm_sw1_oam_frame_9_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 29, banim_pakm_sw1_oam_frame_10_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 10, banim_pakm_sw1_oam_frame_11_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 11, banim_pakm_sw1_oam_frame_12_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 12, banim_pakm_sw1_oam_frame_13_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 13, banim_pakm_sw1_oam_frame_14_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 14, banim_pakm_sw1_oam_frame_15_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 15, banim_pakm_sw1_oam_frame_16_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_2, 16, banim_pakm_sw1_oam_frame_17_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_2, 17, banim_pakm_sw1_oam_frame_18_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 18, banim_pakm_sw1_oam_frame_19_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 20, banim_pakm_sw1_oam_frame_20_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 21, banim_pakm_sw1_oam_frame_21_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 22, banim_pakm_sw1_oam_frame_22_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 23, banim_pakm_sw1_oam_frame_23_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 24, banim_pakm_sw1_oam_frame_24_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 25, banim_pakm_sw1_oam_frame_25_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 26, banim_pakm_sw1_oam_frame_26_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x54
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 33, banim_pakm_sw1_oam_frame_29_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_4, 38, banim_pakm_sw1_oam_frame_51_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_5, 37, banim_pakm_sw1_oam_frame_52_r - banim_pakm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 42, banim_pakm_sw1_oam_frame_31_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 2, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 35, banim_pakm_sw1_oam_frame_32_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 34, banim_pakm_sw1_oam_frame_30_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 36, banim_pakm_sw1_oam_frame_33_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 5, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 28, banim_pakm_sw1_oam_frame_53_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 7, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 7, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 5, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_pakm_sw1_sheet_0, 60, banim_pakm_sw1_oam_frame_54_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_0, 60, banim_pakm_sw1_oam_frame_54_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_0, 60, banim_pakm_sw1_oam_frame_54_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 60, banim_pakm_sw1_oam_frame_54_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 28, banim_pakm_sw1_oam_frame_53_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 7, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_start_dodge
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_pakm_sw1_sheet_6, 31, banim_pakm_sw1_oam_frame_55_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_6, 32, banim_pakm_sw1_oam_frame_56_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_pakm_sw1_sheet_6, 31, banim_pakm_sw1_oam_frame_55_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_start_dodge
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_pakm_sw1_sheet_6, 31, banim_pakm_sw1_oam_frame_55_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_6, 32, banim_pakm_sw1_oam_frame_56_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_pakm_sw1_sheet_6, 31, banim_pakm_sw1_oam_frame_55_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pakm_sw1_mode_stand_close:
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pakm_sw1_mode_stand:
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pakm_sw1_mode_stand_range:
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pakm_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pakm_sw1_sheet_0, 0, banim_pakm_sw1_oam_frame_0_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_0, 1, banim_pakm_sw1_oam_frame_1_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 2, banim_pakm_sw1_oam_frame_2_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_pakm_sw1_sheet_0, 3, banim_pakm_sw1_oam_frame_3_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 14, banim_pakm_sw1_sheet_0, 4, banim_pakm_sw1_oam_frame_4_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_0, 5, banim_pakm_sw1_oam_frame_5_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_pakm_sw1_sheet_1, 6, banim_pakm_sw1_oam_frame_6_r - banim_pakm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 41, banim_pakm_sw1_oam_frame_57_r - banim_pakm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 8, banim_pakm_sw1_oam_frame_8_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_pakm_sw1_sheet_1, 29, banim_pakm_sw1_oam_frame_10_r - banim_pakm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 10, banim_pakm_sw1_oam_frame_11_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_1, 11, banim_pakm_sw1_oam_frame_12_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 12, banim_pakm_sw1_oam_frame_13_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 13, banim_pakm_sw1_oam_frame_14_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 14, banim_pakm_sw1_oam_frame_15_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 15, banim_pakm_sw1_oam_frame_16_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_2, 16, banim_pakm_sw1_oam_frame_17_r - banim_pakm_sw1_oam_r
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 17, banim_pakm_sw1_oam_frame_18_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 18, banim_pakm_sw1_oam_frame_19_r - banim_pakm_sw1_oam_r
	banim_code_frame 1, banim_pakm_sw1_sheet_2, 20, banim_pakm_sw1_oam_frame_20_r - banim_pakm_sw1_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_pakm_sw1_sheet_2, 21, banim_pakm_sw1_oam_frame_21_r - banim_pakm_sw1_oam_r
	banim_code_frame 4, banim_pakm_sw1_sheet_1, 22, banim_pakm_sw1_oam_frame_22_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 23, banim_pakm_sw1_oam_frame_23_r - banim_pakm_sw1_oam_r
	banim_code_frame 5, banim_pakm_sw1_sheet_3, 24, banim_pakm_sw1_oam_frame_24_r - banim_pakm_sw1_oam_r
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 25, banim_pakm_sw1_oam_frame_25_r - banim_pakm_sw1_oam_r
	banim_code_frame 8, banim_pakm_sw1_sheet_3, 26, banim_pakm_sw1_oam_frame_26_r - banim_pakm_sw1_oam_r
	banim_code_frame 10, banim_pakm_sw1_sheet_3, 27, banim_pakm_sw1_oam_frame_27_r - banim_pakm_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pakm_sw1_sheet_3, 30, banim_pakm_sw1_oam_frame_28_r - banim_pakm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
