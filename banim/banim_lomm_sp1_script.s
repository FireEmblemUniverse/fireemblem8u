@ vim:ft=armv4
	.global banim_lomm_sp1_script
	.global banim_lomm_sp1_mode_attack_close
	.global banim_lomm_sp1_mode_attack_close_back
	.global banim_lomm_sp1_mode_attack_close_critical
	.global banim_lomm_sp1_mode_attack_close_critical_back
	.global banim_lomm_sp1_mode_attack_range
	.global banim_lomm_sp1_mode_attack_range_critical
	.global banim_lomm_sp1_mode_dodge_close
	.global banim_lomm_sp1_mode_dodge_range
	.global banim_lomm_sp1_mode_stand_close
	.global banim_lomm_sp1_mode_stand
	.global banim_lomm_sp1_mode_stand_range
	.global banim_lomm_sp1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_lomm_sp1_script:
banim_lomm_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 1, banim_lomm_sp1_oam_frame_1_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 2, banim_lomm_sp1_oam_frame_2_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 3, banim_lomm_sp1_oam_frame_3_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 4, banim_lomm_sp1_oam_frame_4_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 5, banim_lomm_sp1_oam_frame_5_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 6, banim_lomm_sp1_oam_frame_6_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_0, 7, banim_lomm_sp1_oam_frame_7_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 60, banim_lomm_sp1_oam_frame_8_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 8, banim_lomm_sp1_oam_frame_9_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 9, banim_lomm_sp1_oam_frame_10_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 10, banim_lomm_sp1_oam_frame_11_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 60, banim_lomm_sp1_oam_frame_8_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 8, banim_lomm_sp1_oam_frame_9_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 9, banim_lomm_sp1_oam_frame_10_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 10, banim_lomm_sp1_oam_frame_11_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 11, banim_lomm_sp1_oam_frame_12_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 12, banim_lomm_sp1_oam_frame_13_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 13, banim_lomm_sp1_oam_frame_14_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 14, banim_lomm_sp1_oam_frame_15_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 15, banim_lomm_sp1_oam_frame_16_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 17, banim_lomm_sp1_oam_frame_17_r - banim_lomm_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 20, banim_lomm_sp1_oam_frame_18_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 23, banim_lomm_sp1_oam_frame_19_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 26, banim_lomm_sp1_oam_frame_20_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_3, 61, banim_lomm_sp1_oam_frame_21_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 62, banim_lomm_sp1_oam_frame_22_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 28, banim_lomm_sp1_oam_frame_23_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 29, banim_lomm_sp1_oam_frame_24_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 31, banim_lomm_sp1_oam_frame_25_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 32, banim_lomm_sp1_oam_frame_26_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 33, banim_lomm_sp1_oam_frame_27_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 36, banim_lomm_sp1_oam_frame_30_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 18, banim_lomm_sp1_oam_frame_31_r - banim_lomm_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 21, banim_lomm_sp1_oam_frame_32_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 24, banim_lomm_sp1_oam_frame_33_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 27, banim_lomm_sp1_oam_frame_34_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 1, banim_lomm_sp1_oam_frame_1_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 2, banim_lomm_sp1_oam_frame_2_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 3, banim_lomm_sp1_oam_frame_3_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 4, banim_lomm_sp1_oam_frame_4_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 5, banim_lomm_sp1_oam_frame_5_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 6, banim_lomm_sp1_oam_frame_6_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 38, banim_lomm_sp1_oam_frame_36_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 39, banim_lomm_sp1_oam_frame_37_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 40, banim_lomm_sp1_oam_frame_38_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 41, banim_lomm_sp1_oam_frame_39_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 42, banim_lomm_sp1_oam_frame_40_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 39, banim_lomm_sp1_oam_frame_37_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 40, banim_lomm_sp1_oam_frame_38_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 41, banim_lomm_sp1_oam_frame_39_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 42, banim_lomm_sp1_oam_frame_40_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 11, banim_lomm_sp1_oam_frame_12_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 12, banim_lomm_sp1_oam_frame_13_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 13, banim_lomm_sp1_oam_frame_14_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 14, banim_lomm_sp1_oam_frame_15_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 15, banim_lomm_sp1_oam_frame_16_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 17, banim_lomm_sp1_oam_frame_17_r - banim_lomm_sp1_oam_r
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 20, banim_lomm_sp1_oam_frame_18_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 23, banim_lomm_sp1_oam_frame_19_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 26, banim_lomm_sp1_oam_frame_20_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_3, 61, banim_lomm_sp1_oam_frame_21_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 62, banim_lomm_sp1_oam_frame_22_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 28, banim_lomm_sp1_oam_frame_23_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 29, banim_lomm_sp1_oam_frame_24_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 31, banim_lomm_sp1_oam_frame_25_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 32, banim_lomm_sp1_oam_frame_26_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 33, banim_lomm_sp1_oam_frame_27_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 36, banim_lomm_sp1_oam_frame_30_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 18, banim_lomm_sp1_oam_frame_31_r - banim_lomm_sp1_oam_r
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 21, banim_lomm_sp1_oam_frame_32_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 24, banim_lomm_sp1_oam_frame_33_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 27, banim_lomm_sp1_oam_frame_34_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 44, banim_lomm_sp1_oam_frame_42_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 45, banim_lomm_sp1_oam_frame_43_r - banim_lomm_sp1_oam_r
	banim_code_frame 15, banim_lomm_sp1_sheet_6, 46, banim_lomm_sp1_oam_frame_44_r - banim_lomm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_call_spell_anim
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 47, banim_lomm_sp1_oam_frame_45_r - banim_lomm_sp1_oam_r
	banim_code_frame 15, banim_lomm_sp1_sheet_6, 48, banim_lomm_sp1_oam_frame_46_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lomm_sp1_sheet_6, 49, banim_lomm_sp1_oam_frame_47_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 44, banim_lomm_sp1_oam_frame_42_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 45, banim_lomm_sp1_oam_frame_43_r - banim_lomm_sp1_oam_r
	banim_code_frame 15, banim_lomm_sp1_sheet_6, 46, banim_lomm_sp1_oam_frame_44_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 50, banim_lomm_sp1_oam_frame_48_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 51, banim_lomm_sp1_oam_frame_49_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 52, banim_lomm_sp1_oam_frame_50_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 53, banim_lomm_sp1_oam_frame_51_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 50, banim_lomm_sp1_oam_frame_48_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 51, banim_lomm_sp1_oam_frame_49_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 52, banim_lomm_sp1_oam_frame_50_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 53, banim_lomm_sp1_oam_frame_51_r - banim_lomm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_call_spell_anim
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 47, banim_lomm_sp1_oam_frame_45_r - banim_lomm_sp1_oam_r
	banim_code_frame 15, banim_lomm_sp1_sheet_6, 48, banim_lomm_sp1_oam_frame_46_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lomm_sp1_sheet_6, 49, banim_lomm_sp1_oam_frame_47_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 54, banim_lomm_sp1_oam_frame_52_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 55, banim_lomm_sp1_oam_frame_53_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 56, banim_lomm_sp1_oam_frame_54_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 55, banim_lomm_sp1_oam_frame_53_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 54, banim_lomm_sp1_oam_frame_52_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 57, banim_lomm_sp1_oam_frame_55_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 58, banim_lomm_sp1_oam_frame_56_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 59, banim_lomm_sp1_oam_frame_57_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 58, banim_lomm_sp1_oam_frame_56_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 57, banim_lomm_sp1_oam_frame_55_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_stand_close:
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomm_sp1_mode_stand:
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomm_sp1_mode_stand_range:
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomm_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 1, banim_lomm_sp1_oam_frame_1_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 2, banim_lomm_sp1_oam_frame_2_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 3, banim_lomm_sp1_oam_frame_3_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 4, banim_lomm_sp1_oam_frame_4_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 5, banim_lomm_sp1_oam_frame_5_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 6, banim_lomm_sp1_oam_frame_6_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_0, 7, banim_lomm_sp1_oam_frame_7_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 60, banim_lomm_sp1_oam_frame_8_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 8, banim_lomm_sp1_oam_frame_9_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 9, banim_lomm_sp1_oam_frame_10_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 10, banim_lomm_sp1_oam_frame_11_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 60, banim_lomm_sp1_oam_frame_8_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 8, banim_lomm_sp1_oam_frame_9_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 9, banim_lomm_sp1_oam_frame_10_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 10, banim_lomm_sp1_oam_frame_11_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 11, banim_lomm_sp1_oam_frame_12_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 12, banim_lomm_sp1_oam_frame_13_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 13, banim_lomm_sp1_oam_frame_14_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 14, banim_lomm_sp1_oam_frame_15_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 15, banim_lomm_sp1_oam_frame_16_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 16, banim_lomm_sp1_oam_frame_58_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 19, banim_lomm_sp1_oam_frame_59_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 22, banim_lomm_sp1_oam_frame_60_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 25, banim_lomm_sp1_oam_frame_61_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_3, 61, banim_lomm_sp1_oam_frame_21_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 62, banim_lomm_sp1_oam_frame_22_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 28, banim_lomm_sp1_oam_frame_23_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 29, banim_lomm_sp1_oam_frame_24_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 31, banim_lomm_sp1_oam_frame_25_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 32, banim_lomm_sp1_oam_frame_26_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 33, banim_lomm_sp1_oam_frame_27_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
