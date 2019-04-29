@ vim:ft=armv4
	.global banim_grkm_ax1_2_script
	.global banim_grkm_ax1_2_mode_attack_close
	.global banim_grkm_ax1_2_mode_attack_close_back
	.global banim_grkm_ax1_2_mode_attack_close_critical
	.global banim_grkm_ax1_2_mode_attack_close_critical_back
	.global banim_grkm_ax1_2_mode_attack_range
	.global banim_grkm_ax1_2_mode_attack_range_critical
	.global banim_grkm_ax1_2_mode_dodge_close
	.global banim_grkm_ax1_2_mode_dodge_range
	.global banim_grkm_ax1_2_mode_stand_close
	.global banim_grkm_ax1_2_mode_stand
	.global banim_grkm_ax1_2_mode_stand_range
	.global banim_grkm_ax1_2_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_grkm_ax1_2_script:
banim_grkm_ax1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 69, banim_grkm_ax1_2_oam_frame_1_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 12, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 73, banim_grkm_ax1_2_oam_frame_5_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_1, 74, banim_grkm_ax1_2_oam_frame_6_r - banim_grkm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 75, banim_grkm_ax1_2_oam_frame_7_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 6, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 12, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 6, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 69, banim_grkm_ax1_2_oam_frame_1_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 76, banim_grkm_ax1_2_oam_frame_10_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 77, banim_grkm_ax1_2_oam_frame_11_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 78, banim_grkm_ax1_2_oam_frame_12_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 79, banim_grkm_ax1_2_oam_frame_13_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 16, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 73, banim_grkm_ax1_2_oam_frame_5_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_1, 74, banim_grkm_ax1_2_oam_frame_6_r - banim_grkm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 75, banim_grkm_ax1_2_oam_frame_7_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 6, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 16, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 42, banim_grkm_ax1_2_oam_frame_9_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 6, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 41, banim_grkm_ax1_2_oam_frame_8_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 69, banim_grkm_ax1_2_oam_frame_1_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 12, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 73, banim_grkm_ax1_2_oam_frame_5_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_1, 74, banim_grkm_ax1_2_oam_frame_6_r - banim_grkm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 75, banim_grkm_ax1_2_oam_frame_7_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 6, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 69, banim_grkm_ax1_2_oam_frame_1_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 76, banim_grkm_ax1_2_oam_frame_10_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 77, banim_grkm_ax1_2_oam_frame_11_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 78, banim_grkm_ax1_2_oam_frame_12_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 79, banim_grkm_ax1_2_oam_frame_13_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 16, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 73, banim_grkm_ax1_2_oam_frame_5_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_1, 74, banim_grkm_ax1_2_oam_frame_6_r - banim_grkm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 75, banim_grkm_ax1_2_oam_frame_7_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 6, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_ax1_2_sheet_2, 80, banim_grkm_ax1_2_oam_frame_14_r - banim_grkm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_ax1_2_sheet_2, 81, banim_grkm_ax1_2_oam_frame_15_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_2, 82, banim_grkm_ax1_2_oam_frame_16_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_ax1_2_sheet_2, 81, banim_grkm_ax1_2_oam_frame_15_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_2, 80, banim_grkm_ax1_2_oam_frame_14_r - banim_grkm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_ax1_2_sheet_2, 80, banim_grkm_ax1_2_oam_frame_14_r - banim_grkm_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_ax1_2_sheet_2, 81, banim_grkm_ax1_2_oam_frame_15_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_2, 82, banim_grkm_ax1_2_oam_frame_16_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_ax1_2_sheet_2, 81, banim_grkm_ax1_2_oam_frame_15_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_2, 80, banim_grkm_ax1_2_oam_frame_14_r - banim_grkm_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_2_mode_stand_close:
	banim_code_frame 1, banim_grkm_ax1_2_sheet_2, 80, banim_grkm_ax1_2_oam_frame_14_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_ax1_2_mode_stand:
	banim_code_frame 1, banim_grkm_ax1_2_sheet_2, 80, banim_grkm_ax1_2_oam_frame_14_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_ax1_2_mode_stand_range:
	banim_code_frame 1, banim_grkm_ax1_2_sheet_2, 80, banim_grkm_ax1_2_oam_frame_14_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_ax1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 69, banim_grkm_ax1_2_oam_frame_1_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 12, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 73, banim_grkm_ax1_2_oam_frame_5_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_1, 74, banim_grkm_ax1_2_oam_frame_6_r - banim_grkm_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_grkm_ax1_2_sheet_1, 75, banim_grkm_ax1_2_oam_frame_7_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 71, banim_grkm_ax1_2_oam_frame_3_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 6, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_grkm_ax1_2_sheet_0, 72, banim_grkm_ax1_2_oam_frame_4_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 3, banim_grkm_ax1_2_sheet_0, 70, banim_grkm_ax1_2_oam_frame_2_r - banim_grkm_ax1_2_oam_r
	banim_code_frame 1, banim_grkm_ax1_2_sheet_0, 68, banim_grkm_ax1_2_oam_frame_0_r - banim_grkm_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
