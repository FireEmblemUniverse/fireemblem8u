@ vim:ft=armv4
	.global banim_paif_sw1_2_script
	.global banim_paif_sw1_2_mode_attack_close
	.global banim_paif_sw1_2_mode_attack_close_back
	.global banim_paif_sw1_2_mode_attack_close_critical
	.global banim_paif_sw1_2_mode_attack_close_critical_back
	.global banim_paif_sw1_2_mode_attack_range
	.global banim_paif_sw1_2_mode_attack_range_critical
	.global banim_paif_sw1_2_mode_dodge_close
	.global banim_paif_sw1_2_mode_dodge_range
	.global banim_paif_sw1_2_mode_stand_close
	.global banim_paif_sw1_2_mode_stand
	.global banim_paif_sw1_2_mode_stand_range
	.global banim_paif_sw1_2_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_paif_sw1_2_script:
banim_paif_sw1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_0, 5, banim_paif_sw1_2_oam_frame_5_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_paif_sw1_sheet_1, 6, banim_paif_sw1_2_oam_frame_6_r - banim_paif_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_normal
	banim_code_frame 1, banim_paif_sw1_sheet_2, 7, banim_paif_sw1_2_oam_frame_7_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 8, banim_paif_sw1_2_oam_frame_8_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 9, banim_paif_sw1_2_oam_frame_9_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 10, banim_paif_sw1_2_oam_frame_10_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 11, banim_paif_sw1_2_oam_frame_11_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 12, banim_paif_sw1_2_oam_frame_12_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 14, banim_paif_sw1_2_oam_frame_13_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 15, banim_paif_sw1_2_oam_frame_14_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 16, banim_paif_sw1_2_oam_frame_15_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 17, banim_paif_sw1_2_oam_frame_16_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 18, banim_paif_sw1_2_oam_frame_17_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 19, banim_paif_sw1_2_oam_frame_18_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 21, banim_paif_sw1_2_oam_frame_19_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_2, 22, banim_paif_sw1_2_oam_frame_20_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 23, banim_paif_sw1_2_oam_frame_21_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_paif_sw1_sheet_3, 24, banim_paif_sw1_2_oam_frame_22_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 25, banim_paif_sw1_2_oam_frame_23_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 26, banim_paif_sw1_2_oam_frame_24_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 28, banim_paif_sw1_2_oam_frame_26_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 29, banim_paif_sw1_2_oam_frame_27_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 31, banim_paif_sw1_2_oam_frame_29_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_normal
	banim_code_frame 1, banim_paif_sw1_sheet_2, 33, banim_paif_sw1_2_oam_frame_32_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 34, banim_paif_sw1_2_oam_frame_35_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_paif_sw1_sheet_4, 35, banim_paif_sw1_2_oam_frame_36_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 36, banim_paif_sw1_2_oam_frame_37_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 37, banim_paif_sw1_2_oam_frame_38_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 38, banim_paif_sw1_2_oam_frame_39_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 39, banim_paif_sw1_2_oam_frame_40_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 40, banim_paif_sw1_2_oam_frame_41_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 41, banim_paif_sw1_2_oam_frame_42_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 42, banim_paif_sw1_2_oam_frame_43_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 39, banim_paif_sw1_2_oam_frame_40_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 40, banim_paif_sw1_2_oam_frame_41_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 43, banim_paif_sw1_2_oam_frame_44_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 44, banim_paif_sw1_2_oam_frame_45_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 45, banim_paif_sw1_2_oam_frame_46_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 46, banim_paif_sw1_2_oam_frame_47_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 47, banim_paif_sw1_2_oam_frame_48_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 48, banim_paif_sw1_2_oam_frame_49_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 49, banim_paif_sw1_2_oam_frame_50_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 50, banim_paif_sw1_2_oam_frame_51_r - banim_paif_sw1_2_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_2, 7, banim_paif_sw1_2_oam_frame_7_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 8, banim_paif_sw1_2_oam_frame_8_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 9, banim_paif_sw1_2_oam_frame_9_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 10, banim_paif_sw1_2_oam_frame_10_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 11, banim_paif_sw1_2_oam_frame_11_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 12, banim_paif_sw1_2_oam_frame_12_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 14, banim_paif_sw1_2_oam_frame_13_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 15, banim_paif_sw1_2_oam_frame_14_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 16, banim_paif_sw1_2_oam_frame_15_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 17, banim_paif_sw1_2_oam_frame_16_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 18, banim_paif_sw1_2_oam_frame_17_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 19, banim_paif_sw1_2_oam_frame_18_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 21, banim_paif_sw1_2_oam_frame_19_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_2, 22, banim_paif_sw1_2_oam_frame_20_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 23, banim_paif_sw1_2_oam_frame_21_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_paif_sw1_sheet_3, 24, banim_paif_sw1_2_oam_frame_22_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 25, banim_paif_sw1_2_oam_frame_23_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 26, banim_paif_sw1_2_oam_frame_24_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 28, banim_paif_sw1_2_oam_frame_26_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 29, banim_paif_sw1_2_oam_frame_27_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 31, banim_paif_sw1_2_oam_frame_29_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 64, banim_paif_sw1_2_oam_frame_30_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 69, banim_paif_sw1_2_oam_frame_52_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_5, 68, banim_paif_sw1_2_oam_frame_53_r - banim_paif_sw1_2_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_2, 33, banim_paif_sw1_2_oam_frame_32_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_paif_sw1_sheet_2, 66, banim_paif_sw1_2_oam_frame_33_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 65, banim_paif_sw1_2_oam_frame_31_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 67, banim_paif_sw1_2_oam_frame_34_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 51, banim_paif_sw1_2_oam_frame_54_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_5, 52, banim_paif_sw1_2_oam_frame_55_r - banim_paif_sw1_2_oam_r
	banim_code_frame 7, banim_paif_sw1_sheet_5, 53, banim_paif_sw1_2_oam_frame_56_r - banim_paif_sw1_2_oam_r
	banim_code_frame 11, banim_paif_sw1_sheet_5, 54, banim_paif_sw1_2_oam_frame_57_r - banim_paif_sw1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_paif_sw1_sheet_5, 55, banim_paif_sw1_2_oam_frame_58_r - banim_paif_sw1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_paif_sw1_sheet_5, 56, banim_paif_sw1_2_oam_frame_59_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_4, 57, banim_paif_sw1_2_oam_frame_60_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_paif_sw1_sheet_4, 58, banim_paif_sw1_2_oam_frame_61_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_4, 59, banim_paif_sw1_2_oam_frame_62_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_4, 60, banim_paif_sw1_2_oam_frame_63_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_4, 61, banim_paif_sw1_2_oam_frame_64_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_4, 71, banim_paif_sw1_2_oam_frame_65_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_5, 51, banim_paif_sw1_2_oam_frame_54_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_5, 52, banim_paif_sw1_2_oam_frame_55_r - banim_paif_sw1_2_oam_r
	banim_code_frame 7, banim_paif_sw1_sheet_5, 53, banim_paif_sw1_2_oam_frame_56_r - banim_paif_sw1_2_oam_r
	banim_code_frame 11, banim_paif_sw1_sheet_5, 54, banim_paif_sw1_2_oam_frame_57_r - banim_paif_sw1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_paif_sw1_sheet_5, 55, banim_paif_sw1_2_oam_frame_58_r - banim_paif_sw1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_paif_sw1_sheet_5, 56, banim_paif_sw1_2_oam_frame_59_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_paif_sw1_sheet_6, 62, banim_paif_sw1_2_oam_frame_66_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_6, 63, banim_paif_sw1_2_oam_frame_67_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_paif_sw1_sheet_6, 62, banim_paif_sw1_2_oam_frame_66_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_paif_sw1_sheet_6, 62, banim_paif_sw1_2_oam_frame_66_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_6, 63, banim_paif_sw1_2_oam_frame_67_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_paif_sw1_sheet_6, 62, banim_paif_sw1_2_oam_frame_66_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_paif_sw1_2_mode_stand:
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_paif_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_paif_sw1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_2_oam_frame_0_r - banim_paif_sw1_2_oam_r
	banim_code_frame 10, banim_paif_sw1_sheet_0, 1, banim_paif_sw1_2_oam_frame_1_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_0, 2, banim_paif_sw1_2_oam_frame_2_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_paif_sw1_sheet_0, 3, banim_paif_sw1_2_oam_frame_3_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_0, 4, banim_paif_sw1_2_oam_frame_4_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_0, 5, banim_paif_sw1_2_oam_frame_5_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_paif_sw1_sheet_1, 6, banim_paif_sw1_2_oam_frame_6_r - banim_paif_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_paif_sw1_sheet_2, 32, banim_paif_sw1_2_oam_frame_68_r - banim_paif_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_paif_sw1_sheet_1, 8, banim_paif_sw1_2_oam_frame_8_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_paif_sw1_sheet_1, 9, banim_paif_sw1_2_oam_frame_9_r - banim_paif_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_paif_sw1_sheet_1, 10, banim_paif_sw1_2_oam_frame_10_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 11, banim_paif_sw1_2_oam_frame_11_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 12, banim_paif_sw1_2_oam_frame_12_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 14, banim_paif_sw1_2_oam_frame_13_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 15, banim_paif_sw1_2_oam_frame_14_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_2, 16, banim_paif_sw1_2_oam_frame_15_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 17, banim_paif_sw1_2_oam_frame_16_r - banim_paif_sw1_2_oam_r
	banim_code_frame 2, banim_paif_sw1_sheet_2, 18, banim_paif_sw1_2_oam_frame_17_r - banim_paif_sw1_2_oam_r
	banim_code_frame 1, banim_paif_sw1_sheet_2, 19, banim_paif_sw1_2_oam_frame_18_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 21, banim_paif_sw1_2_oam_frame_19_r - banim_paif_sw1_2_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_2, 22, banim_paif_sw1_2_oam_frame_20_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_1, 23, banim_paif_sw1_2_oam_frame_21_r - banim_paif_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_paif_sw1_sheet_3, 24, banim_paif_sw1_2_oam_frame_22_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 25, banim_paif_sw1_2_oam_frame_23_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_paif_sw1_sheet_3, 26, banim_paif_sw1_2_oam_frame_24_r - banim_paif_sw1_2_oam_r
	banim_code_frame 4, banim_paif_sw1_sheet_3, 27, banim_paif_sw1_2_oam_frame_25_r - banim_paif_sw1_2_oam_r
	banim_code_frame 16, banim_paif_sw1_sheet_3, 28, banim_paif_sw1_2_oam_frame_26_r - banim_paif_sw1_2_oam_r
	banim_code_frame 6, banim_paif_sw1_sheet_3, 29, banim_paif_sw1_2_oam_frame_27_r - banim_paif_sw1_2_oam_r
	banim_code_frame 5, banim_paif_sw1_sheet_3, 30, banim_paif_sw1_2_oam_frame_28_r - banim_paif_sw1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_paif_sw1_sheet_3, 31, banim_paif_sw1_2_oam_frame_29_r - banim_paif_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
