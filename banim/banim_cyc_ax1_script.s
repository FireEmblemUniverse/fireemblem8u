@ vim:ft=armv4
	.global banim_cyc_ax1_script
	.global banim_cyc_ax1_mode_attack_close
	.global banim_cyc_ax1_mode_attack_close_back
	.global banim_cyc_ax1_mode_attack_close_critical
	.global banim_cyc_ax1_mode_attack_close_critical_back
	.global banim_cyc_ax1_mode_attack_range
	.global banim_cyc_ax1_mode_attack_range_critical
	.global banim_cyc_ax1_mode_dodge_close
	.global banim_cyc_ax1_mode_dodge_range
	.global banim_cyc_ax1_mode_stand_close
	.global banim_cyc_ax1_mode_stand
	.global banim_cyc_ax1_mode_stand_range
	.global banim_cyc_ax1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_cyc_ax1_script:
banim_cyc_ax1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 1, banim_cyc_ax1_oam_frame_1_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 2, banim_cyc_ax1_oam_frame_2_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 3, banim_cyc_ax1_oam_frame_3_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 4, banim_cyc_ax1_oam_frame_4_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 5, banim_cyc_ax1_oam_frame_5_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_1, 6, banim_cyc_ax1_oam_frame_6_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_1, 7, banim_cyc_ax1_oam_frame_7_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_2, 8, banim_cyc_ax1_oam_frame_8_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 9, banim_cyc_ax1_oam_frame_9_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_3, 10, banim_cyc_ax1_oam_frame_10_r - banim_cyc_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_3, 19, banim_cyc_ax1_oam_frame_13_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_4, 22, banim_cyc_ax1_oam_frame_14_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_4, 25, banim_cyc_ax1_oam_frame_15_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_4, 28, banim_cyc_ax1_oam_frame_16_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 31, banim_cyc_ax1_oam_frame_17_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 32, banim_cyc_ax1_oam_frame_18_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 33, banim_cyc_ax1_oam_frame_19_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 38, banim_cyc_ax1_oam_frame_22_r - banim_cyc_ax1_oam_r
	banim_code_sound_mauthedoog_roar
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 40, banim_cyc_ax1_oam_frame_24_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 40, banim_cyc_ax1_oam_frame_24_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 40, banim_cyc_ax1_oam_frame_24_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 40, banim_cyc_ax1_oam_frame_24_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 2, banim_cyc_ax1_oam_frame_2_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 3, banim_cyc_ax1_oam_frame_3_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 4, banim_cyc_ax1_oam_frame_4_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 5, banim_cyc_ax1_oam_frame_5_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_1, 6, banim_cyc_ax1_oam_frame_6_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_1, 7, banim_cyc_ax1_oam_frame_7_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_2, 8, banim_cyc_ax1_oam_frame_8_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 9, banim_cyc_ax1_oam_frame_9_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_3, 10, banim_cyc_ax1_oam_frame_10_r - banim_cyc_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_3, 19, banim_cyc_ax1_oam_frame_13_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_4, 22, banim_cyc_ax1_oam_frame_14_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_4, 25, banim_cyc_ax1_oam_frame_15_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_4, 28, banim_cyc_ax1_oam_frame_16_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 31, banim_cyc_ax1_oam_frame_17_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 32, banim_cyc_ax1_oam_frame_18_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 33, banim_cyc_ax1_oam_frame_19_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_sound_mauthedoog_roar
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_attack_range:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_attack_range_critical:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_cyc_ax1_sheet_7, 41, banim_cyc_ax1_oam_frame_26_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_7, 42, banim_cyc_ax1_oam_frame_27_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_sheet_7, 41, banim_cyc_ax1_oam_frame_26_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_cyc_ax1_sheet_7, 41, banim_cyc_ax1_oam_frame_26_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_7, 42, banim_cyc_ax1_oam_frame_27_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_sheet_7, 41, banim_cyc_ax1_oam_frame_26_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_stand_close:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_stand:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_stand_range:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 1, banim_cyc_ax1_oam_frame_1_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 2, banim_cyc_ax1_oam_frame_2_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 3, banim_cyc_ax1_oam_frame_3_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 4, banim_cyc_ax1_oam_frame_4_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 5, banim_cyc_ax1_oam_frame_5_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_1, 6, banim_cyc_ax1_oam_frame_6_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_1, 7, banim_cyc_ax1_oam_frame_7_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_2, 8, banim_cyc_ax1_oam_frame_8_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 9, banim_cyc_ax1_oam_frame_9_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_3, 10, banim_cyc_ax1_oam_frame_10_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_3, 19, banim_cyc_ax1_oam_frame_13_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_4, 22, banim_cyc_ax1_oam_frame_14_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_4, 25, banim_cyc_ax1_oam_frame_15_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_4, 28, banim_cyc_ax1_oam_frame_16_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 31, banim_cyc_ax1_oam_frame_17_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 32, banim_cyc_ax1_oam_frame_18_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 33, banim_cyc_ax1_oam_frame_19_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
