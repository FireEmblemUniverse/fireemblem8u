@ vim:ft=armv4
	.global banim_mcd_ax1_6_script
	.global banim_mcd_ax1_6_mode_attack_close
	.global banim_mcd_ax1_6_mode_attack_close_back
	.global banim_mcd_ax1_6_mode_attack_close_critical
	.global banim_mcd_ax1_6_mode_attack_close_critical_back
	.global banim_mcd_ax1_6_mode_attack_range
	.global banim_mcd_ax1_6_mode_attack_range_critical
	.global banim_mcd_ax1_6_mode_dodge_close
	.global banim_mcd_ax1_6_mode_dodge_range
	.global banim_mcd_ax1_6_mode_stand_close
	.global banim_mcd_ax1_6_mode_stand
	.global banim_mcd_ax1_6_mode_stand_range
	.global banim_mcd_ax1_6_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_mcd_ax1_6_script:
banim_mcd_ax1_6_mode_attack_close:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_6_mode_attack_close_back:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_6_mode_attack_close_critical:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_6_mode_attack_close_critical_back:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_6_mode_attack_range:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_6_mode_attack_range_critical:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_6_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_mcd_ax1_3_sheet_0, 1, banim_mcd_ax1_6_oam_frame_1_r - banim_mcd_ax1_6_oam_r
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 2, banim_mcd_ax1_6_oam_frame_2_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_mcd_ax1_3_sheet_0, 1, banim_mcd_ax1_6_oam_frame_1_r - banim_mcd_ax1_6_oam_r
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_6_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_mcd_ax1_3_sheet_0, 1, banim_mcd_ax1_6_oam_frame_1_r - banim_mcd_ax1_6_oam_r
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 2, banim_mcd_ax1_6_oam_frame_2_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_mcd_ax1_3_sheet_0, 1, banim_mcd_ax1_6_oam_frame_1_r - banim_mcd_ax1_6_oam_r
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_6_mode_stand_close:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_6_mode_stand:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_6_mode_stand_range:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_6_mode_attack_miss:
	banim_code_frame 1, banim_mcd_ax1_3_sheet_0, 0, banim_mcd_ax1_6_oam_frame_0_r - banim_mcd_ax1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
