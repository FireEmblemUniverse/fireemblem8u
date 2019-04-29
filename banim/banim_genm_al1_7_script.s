@ vim:ft=armv4
	.global banim_genm_al1_7_script
	.global banim_genm_al1_7_mode_attack_close
	.global banim_genm_al1_7_mode_attack_close_back
	.global banim_genm_al1_7_mode_attack_close_critical
	.global banim_genm_al1_7_mode_attack_close_critical_back
	.global banim_genm_al1_7_mode_attack_range
	.global banim_genm_al1_7_mode_attack_range_critical
	.global banim_genm_al1_7_mode_dodge_close
	.global banim_genm_al1_7_mode_dodge_range
	.global banim_genm_al1_7_mode_stand_close
	.global banim_genm_al1_7_mode_stand
	.global banim_genm_al1_7_mode_stand_range
	.global banim_genm_al1_7_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_genm_al1_7_script:
banim_genm_al1_7_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_7, 12, banim_genm_al1_7_oam_frame_12_r - banim_genm_al1_7_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_7, 13, banim_genm_al1_7_oam_frame_13_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 14, banim_genm_al1_7_oam_frame_14_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 15, banim_genm_al1_7_oam_frame_15_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 16, banim_genm_al1_7_oam_frame_16_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 17, banim_genm_al1_7_oam_frame_17_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 12, banim_genm_al1_7_oam_frame_12_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_genm_al1_sheet_7, 13, banim_genm_al1_7_oam_frame_13_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 14, banim_genm_al1_7_oam_frame_14_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 15, banim_genm_al1_7_oam_frame_15_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 16, banim_genm_al1_7_oam_frame_16_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 17, banim_genm_al1_7_oam_frame_17_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_genm_al1_sheet_7, 12, banim_genm_al1_7_oam_frame_12_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 13, banim_genm_al1_7_oam_frame_13_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 14, banim_genm_al1_7_oam_frame_14_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 15, banim_genm_al1_7_oam_frame_15_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 16, banim_genm_al1_7_oam_frame_16_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 17, banim_genm_al1_7_oam_frame_17_r - banim_genm_al1_7_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_frame 16, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 18, banim_genm_al1_7_oam_frame_18_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 19, banim_genm_al1_7_oam_frame_19_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 18, banim_genm_al1_7_oam_frame_18_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 18, banim_genm_al1_7_oam_frame_18_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 19, banim_genm_al1_7_oam_frame_19_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 18, banim_genm_al1_7_oam_frame_18_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_stand_close:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_7_mode_stand:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_7_mode_stand_range:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_7_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
