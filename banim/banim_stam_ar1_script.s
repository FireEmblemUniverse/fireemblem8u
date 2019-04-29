@ vim:ft=armv4
	.global banim_stam_ar1_script
	.global banim_stam_ar1_mode_attack_close
	.global banim_stam_ar1_mode_attack_close_back
	.global banim_stam_ar1_mode_attack_close_critical
	.global banim_stam_ar1_mode_attack_close_critical_back
	.global banim_stam_ar1_mode_attack_range
	.global banim_stam_ar1_mode_attack_range_critical
	.global banim_stam_ar1_mode_dodge_close
	.global banim_stam_ar1_mode_dodge_range
	.global banim_stam_ar1_mode_stand_close
	.global banim_stam_ar1_mode_stand
	.global banim_stam_ar1_mode_stand_range
	.global banim_stam_ar1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_stam_ar1_script:
banim_stam_ar1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_stam_ar1_mode_dodge_close:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_dodge_range:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_stand_close:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_stand:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_stand_range:
	banim_code_frame 4, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_end_mode
banim_stam_ar1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_stam_ar1_sheet_0, 0, banim_stam_ar1_oam_frame_0_r - banim_stam_ar1_oam_r
	banim_code_frame 23, banim_stam_ar1_sheet_0, 1, banim_stam_ar1_oam_frame_1_r - banim_stam_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_stam_ar1_sheet_0, 2, banim_stam_ar1_oam_frame_2_r - banim_stam_ar1_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 1, banim_stam_ar1_sheet_0, 3, banim_stam_ar1_oam_frame_3_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 4, banim_stam_ar1_oam_frame_4_r - banim_stam_ar1_oam_r
	banim_code_frame 1, banim_stam_ar1_sheet_0, 5, banim_stam_ar1_oam_frame_5_r - banim_stam_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
