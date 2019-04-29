@ vim:ft=armv4
	.global banim_fifd_he1_script
	.global banim_fifd_he1_mode_attack_close
	.global banim_fifd_he1_mode_attack_close_back
	.global banim_fifd_he1_mode_attack_close_critical
	.global banim_fifd_he1_mode_attack_close_critical_back
	.global banim_fifd_he1_mode_attack_range
	.global banim_fifd_he1_mode_attack_range_critical
	.global banim_fifd_he1_mode_dodge_close
	.global banim_fifd_he1_mode_dodge_range
	.global banim_fifd_he1_mode_stand_close
	.global banim_fifd_he1_mode_stand
	.global banim_fifd_he1_mode_stand_range
	.global banim_fifd_he1_mode_attack_miss
	.include "../include/banim.inc"
	.section .data
banim_fifd_he1_script:
banim_fifd_he1_mode_attack_close:
	banim_code_frame 1, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_frame 6, banim_fifd_he1_sheet_0, 1, banim_fifd_he1_oam_frame_1_r - banim_fifd_he1_oam_r
	banim_code_frame 6, banim_fifd_he1_sheet_0, 2, banim_fifd_he1_oam_frame_2_r - banim_fifd_he1_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_fifd_he1_sheet_0, 3, banim_fifd_he1_oam_frame_3_r - banim_fifd_he1_oam_r
	banim_code_frame 4, banim_fifd_he1_sheet_1, 4, banim_fifd_he1_oam_frame_4_r - banim_fifd_he1_oam_r
	banim_code_frame 4, banim_fifd_he1_sheet_1, 5, banim_fifd_he1_oam_frame_5_r - banim_fifd_he1_oam_r
	banim_code_frame 2, banim_fifd_he1_sheet_1, 6, banim_fifd_he1_oam_frame_6_r - banim_fifd_he1_oam_r
	banim_code_frame 3, banim_fifd_he1_sheet_2, 7, banim_fifd_he1_oam_frame_7_r - banim_fifd_he1_oam_r
	banim_code_frame 3, banim_fifd_he1_sheet_2, 8, banim_fifd_he1_oam_frame_8_r - banim_fifd_he1_oam_r
	banim_code_frame 2, banim_fifd_he1_sheet_3, 9, banim_fifd_he1_oam_frame_9_r - banim_fifd_he1_oam_r
	banim_code_frame 1, banim_fifd_he1_sheet_3, 10, banim_fifd_he1_oam_frame_10_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_close_back:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_close_critical:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_close_critical_back:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_range:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_range_critical:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_dodge_close:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_dodge_range:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_stand_close:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_stand:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_stand_range:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_miss:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
