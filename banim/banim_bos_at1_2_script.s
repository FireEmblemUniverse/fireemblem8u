@ vim:ft=armv4
	.global banim_bos_at1_2_script
	.global banim_bos_at1_2_mode_attack_close
	.global banim_bos_at1_2_mode_attack_close_back
	.global banim_bos_at1_2_mode_attack_close_critical
	.global banim_bos_at1_2_mode_attack_close_critical_back
	.global banim_bos_at1_2_mode_attack_range
	.global banim_bos_at1_2_mode_attack_range_critical
	.global banim_bos_at1_2_mode_dodge_close
	.global banim_bos_at1_2_mode_dodge_range
	.global banim_bos_at1_2_mode_stand_close
	.global banim_bos_at1_2_mode_stand
	.global banim_bos_at1_2_mode_stand_range
	.global banim_bos_at1_2_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_bos_at1_2_script:
banim_bos_at1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 1, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 1, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 6, banim_bos_at1_sheet_4, 9, banim_bos_at1_2_oam_frame_7_r - banim_bos_at1_2_oam_r
	banim_code_frame 6, banim_bos_at1_sheet_5, 10, banim_bos_at1_2_oam_frame_8_r - banim_bos_at1_2_oam_r
	banim_code_frame 30, banim_bos_at1_sheet_5, 11, banim_bos_at1_2_oam_frame_9_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_5, 10, banim_bos_at1_2_oam_frame_8_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 9, banim_bos_at1_2_oam_frame_7_r - banim_bos_at1_2_oam_r
	banim_code_sound_demon_king_scream
	banim_code_frame 2, banim_bos_at1_sheet_6, 12, banim_bos_at1_2_oam_frame_10_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 20, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 4, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_6, 12, banim_bos_at1_2_oam_frame_10_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_7, 15, banim_bos_at1_2_oam_frame_13_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 6, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 6, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 30, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_sound_demon_king_scream
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 20, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_frame 4, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 1, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 6, banim_bos_at1_sheet_4, 9, banim_bos_at1_2_oam_frame_7_r - banim_bos_at1_2_oam_r
	banim_code_frame 6, banim_bos_at1_sheet_5, 10, banim_bos_at1_2_oam_frame_8_r - banim_bos_at1_2_oam_r
	banim_code_frame 30, banim_bos_at1_sheet_5, 11, banim_bos_at1_2_oam_frame_9_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_5, 10, banim_bos_at1_2_oam_frame_8_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 9, banim_bos_at1_2_oam_frame_7_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 12, banim_bos_at1_2_oam_frame_10_r - banim_bos_at1_2_oam_r
	banim_code_sound_demon_king_scream
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 20, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 4, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_6, 12, banim_bos_at1_2_oam_frame_10_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_7, 15, banim_bos_at1_2_oam_frame_13_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_dodge_close:
	banim_code_frame 1, banim_bos_at1_sheet_0, 120, banim_bos_at1_2_oam_frame_16_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_dodge_range:
	banim_code_frame 1, banim_bos_at1_sheet_0, 120, banim_bos_at1_2_oam_frame_16_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_stand_close:
	banim_code_frame 1, banim_bos_at1_sheet_0, 7, banim_bos_at1_2_oam_frame_17_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_stand:
	banim_code_frame 1, banim_bos_at1_sheet_0, 7, banim_bos_at1_2_oam_frame_17_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_stand_range:
	banim_code_frame 1, banim_bos_at1_sheet_0, 7, banim_bos_at1_2_oam_frame_17_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 1, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
