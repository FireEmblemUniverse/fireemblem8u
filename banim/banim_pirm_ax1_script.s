@ vim:ft=armv4
	.global banim_pirm_ax1_script
	.global banim_pirm_ax1_mode_attack_close
	.global banim_pirm_ax1_mode_attack_close_back
	.global banim_pirm_ax1_mode_attack_close_critical
	.global banim_pirm_ax1_mode_attack_close_critical_back
	.global banim_pirm_ax1_mode_attack_range
	.global banim_pirm_ax1_mode_attack_range_critical
	.global banim_pirm_ax1_mode_dodge_close
	.global banim_pirm_ax1_mode_dodge_range
	.global banim_pirm_ax1_mode_stand_close
	.global banim_pirm_ax1_mode_stand
	.global banim_pirm_ax1_mode_stand_range
	.global banim_pirm_ax1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_pirm_ax1_script:
banim_pirm_ax1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 1, banim_pirm_ax1_oam_frame_1_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 2, banim_pirm_ax1_oam_frame_2_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 3, banim_pirm_ax1_oam_frame_3_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 5, banim_pirm_ax1_oam_frame_4_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 7, banim_pirm_ax1_oam_frame_5_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 8, banim_pirm_ax1_oam_frame_6_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 4, banim_pirm_ax1_oam_frame_8_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 6, banim_pirm_ax1_oam_frame_9_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 15, banim_pirm_ax1_sheet_0, 9, banim_pirm_ax1_oam_frame_10_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_pirm_ax1_sheet_0, 10, banim_pirm_ax1_oam_frame_11_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 11, banim_pirm_ax1_oam_frame_12_r - banim_pirm_ax1_oam_r
	banim_code_frame 30, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 1, banim_pirm_ax1_oam_frame_1_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 2, banim_pirm_ax1_oam_frame_2_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 3, banim_pirm_ax1_oam_frame_3_r - banim_pirm_ax1_oam_r
	banim_code_hit_critical_4
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 5, banim_pirm_ax1_oam_frame_4_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 7, banim_pirm_ax1_oam_frame_5_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 8, banim_pirm_ax1_oam_frame_6_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 15, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_frame 30, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 4, banim_pirm_ax1_oam_frame_8_r - banim_pirm_ax1_oam_r
	banim_code_hit_critical_4
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 6, banim_pirm_ax1_oam_frame_9_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_attack_range:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_end_mode
banim_pirm_ax1_mode_attack_range_critical:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_end_mode
banim_pirm_ax1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 12, banim_pirm_ax1_oam_frame_13_r - banim_pirm_ax1_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 13, banim_pirm_ax1_oam_frame_14_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 12, banim_pirm_ax1_oam_frame_13_r - banim_pirm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 12, banim_pirm_ax1_oam_frame_13_r - banim_pirm_ax1_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 13, banim_pirm_ax1_oam_frame_14_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 12, banim_pirm_ax1_oam_frame_13_r - banim_pirm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_stand_close:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_mode_stand:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_mode_stand_range:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 1, banim_pirm_ax1_oam_frame_1_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 2, banim_pirm_ax1_oam_frame_2_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 14, banim_pirm_ax1_oam_frame_15_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 15, banim_pirm_ax1_oam_frame_16_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 7, banim_pirm_ax1_oam_frame_5_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 8, banim_pirm_ax1_oam_frame_6_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
