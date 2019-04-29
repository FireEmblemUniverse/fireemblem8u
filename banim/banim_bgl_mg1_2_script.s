@ vim:ft=armv4
	.global banim_bgl_mg1_2_script
	.global banim_bgl_mg1_2_mode_attack_close
	.global banim_bgl_mg1_2_mode_attack_close_back
	.global banim_bgl_mg1_2_mode_attack_close_critical
	.global banim_bgl_mg1_2_mode_attack_close_critical_back
	.global banim_bgl_mg1_2_mode_attack_range
	.global banim_bgl_mg1_2_mode_attack_range_critical
	.global banim_bgl_mg1_2_mode_dodge_close
	.global banim_bgl_mg1_2_mode_dodge_range
	.global banim_bgl_mg1_2_mode_stand_close
	.global banim_bgl_mg1_2_mode_stand
	.global banim_bgl_mg1_2_mode_stand_range
	.global banim_bgl_mg1_2_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_bgl_mg1_2_script:
banim_bgl_mg1_2_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 1, banim_bgl_mg1_2_oam_frame_1_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 2, banim_bgl_mg1_2_oam_frame_2_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 3, banim_bgl_mg1_2_oam_frame_3_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 4, banim_bgl_mg1_2_oam_frame_4_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 5, banim_bgl_mg1_2_oam_frame_5_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magic_mogall
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 6, banim_bgl_mg1_2_oam_frame_6_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 7, banim_bgl_mg1_2_oam_frame_7_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 8, banim_bgl_mg1_2_oam_frame_8_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 9, banim_bgl_mg1_2_oam_frame_9_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 10, banim_bgl_mg1_2_oam_frame_10_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 11, banim_bgl_mg1_2_oam_frame_11_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 12, banim_bgl_mg1_2_oam_frame_12_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 13, banim_bgl_mg1_2_oam_frame_13_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 14, banim_bgl_mg1_2_oam_frame_14_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 15, banim_bgl_mg1_2_oam_frame_15_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magic_mogall
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 18, banim_bgl_mg1_2_oam_frame_20_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 19, banim_bgl_mg1_2_oam_frame_21_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink_critical
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 20, banim_bgl_mg1_2_oam_frame_22_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 21, banim_bgl_mg1_2_oam_frame_23_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 22, banim_bgl_mg1_2_oam_frame_24_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 23, banim_bgl_mg1_2_oam_frame_25_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_0, 24, banim_bgl_mg1_2_oam_frame_26_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 25, banim_bgl_mg1_2_oam_frame_27_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 26, banim_bgl_mg1_2_oam_frame_28_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 27, banim_bgl_mg1_2_oam_frame_29_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 28, banim_bgl_mg1_2_oam_frame_30_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 29, banim_bgl_mg1_2_oam_frame_31_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magical_mogall_critical
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 30, banim_bgl_mg1_2_oam_frame_32_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 31, banim_bgl_mg1_2_oam_frame_33_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 32, banim_bgl_mg1_2_oam_frame_34_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 33, banim_bgl_mg1_2_oam_frame_35_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 34, banim_bgl_mg1_2_oam_frame_36_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 35, banim_bgl_mg1_2_oam_frame_37_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 36, banim_bgl_mg1_2_oam_frame_38_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 37, banim_bgl_mg1_2_oam_frame_39_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 38, banim_bgl_mg1_2_oam_frame_40_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 16, banim_bgl_mg1_sheet_2, 39, banim_bgl_mg1_2_oam_frame_41_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 40, banim_bgl_mg1_2_oam_frame_42_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink_critical
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magical_mogall_critical
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 16, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 1, banim_bgl_mg1_2_oam_frame_1_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 2, banim_bgl_mg1_2_oam_frame_2_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 3, banim_bgl_mg1_2_oam_frame_3_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 4, banim_bgl_mg1_2_oam_frame_4_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 5, banim_bgl_mg1_2_oam_frame_5_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magic_mogall
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 6, banim_bgl_mg1_2_oam_frame_6_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 7, banim_bgl_mg1_2_oam_frame_7_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 8, banim_bgl_mg1_2_oam_frame_8_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 9, banim_bgl_mg1_2_oam_frame_9_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 10, banim_bgl_mg1_2_oam_frame_10_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 11, banim_bgl_mg1_2_oam_frame_11_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 12, banim_bgl_mg1_2_oam_frame_12_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 13, banim_bgl_mg1_2_oam_frame_13_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 14, banim_bgl_mg1_2_oam_frame_14_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 15, banim_bgl_mg1_2_oam_frame_15_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 18, banim_bgl_mg1_2_oam_frame_20_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 19, banim_bgl_mg1_2_oam_frame_21_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink_critical
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 20, banim_bgl_mg1_2_oam_frame_22_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 21, banim_bgl_mg1_2_oam_frame_23_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 22, banim_bgl_mg1_2_oam_frame_24_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 23, banim_bgl_mg1_2_oam_frame_25_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_0, 24, banim_bgl_mg1_2_oam_frame_26_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 25, banim_bgl_mg1_2_oam_frame_27_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 26, banim_bgl_mg1_2_oam_frame_28_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 27, banim_bgl_mg1_2_oam_frame_29_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 28, banim_bgl_mg1_2_oam_frame_30_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 29, banim_bgl_mg1_2_oam_frame_31_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magical_mogall_critical
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 30, banim_bgl_mg1_2_oam_frame_32_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 31, banim_bgl_mg1_2_oam_frame_33_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 32, banim_bgl_mg1_2_oam_frame_34_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 33, banim_bgl_mg1_2_oam_frame_35_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 34, banim_bgl_mg1_2_oam_frame_36_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 35, banim_bgl_mg1_2_oam_frame_37_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 36, banim_bgl_mg1_2_oam_frame_38_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 37, banim_bgl_mg1_2_oam_frame_39_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 38, banim_bgl_mg1_2_oam_frame_40_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 16, banim_bgl_mg1_sheet_2, 39, banim_bgl_mg1_2_oam_frame_41_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 40, banim_bgl_mg1_2_oam_frame_42_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bgl_mg1_sheet_3, 45, banim_bgl_mg1_2_oam_frame_44_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_3, 46, banim_bgl_mg1_2_oam_frame_45_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bgl_mg1_sheet_3, 47, banim_bgl_mg1_2_oam_frame_46_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bgl_mg1_sheet_3, 45, banim_bgl_mg1_2_oam_frame_44_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_3, 46, banim_bgl_mg1_2_oam_frame_45_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bgl_mg1_sheet_3, 47, banim_bgl_mg1_2_oam_frame_46_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_stand_close:
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bgl_mg1_2_mode_stand:
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bgl_mg1_2_mode_stand_range:
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 1, banim_bgl_mg1_2_oam_frame_1_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 2, banim_bgl_mg1_2_oam_frame_2_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 3, banim_bgl_mg1_2_oam_frame_3_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 4, banim_bgl_mg1_2_oam_frame_4_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 5, banim_bgl_mg1_2_oam_frame_5_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magic_mogall
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 6, banim_bgl_mg1_2_oam_frame_6_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 7, banim_bgl_mg1_2_oam_frame_7_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 8, banim_bgl_mg1_2_oam_frame_8_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 9, banim_bgl_mg1_2_oam_frame_9_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 10, banim_bgl_mg1_2_oam_frame_10_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 11, banim_bgl_mg1_2_oam_frame_11_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 12, banim_bgl_mg1_2_oam_frame_12_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 13, banim_bgl_mg1_2_oam_frame_13_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 14, banim_bgl_mg1_2_oam_frame_14_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 15, banim_bgl_mg1_2_oam_frame_15_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
