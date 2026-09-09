@ vim:ft=armv4
	.global banim_pbfm_ax1_3_script
	.global banim_pbfm_ax1_3_oam_r
	.global banim_pbfm_ax1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x93
	.section .data.oam_l
banim_pbfm_ax1_3_oam_l:
banim_pbfm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x3, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x83, -24, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x87, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, 8, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0xA, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0xC, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x8A, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -16, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_pbfm_ax1_3_oam_r:
banim_pbfm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x3, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x83, -8, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x87, -8, 8
	banim_frame_oam 0x0, 0x0, 0x89, 8, 8
	banim_frame_oam 0x0, 0x0, 0xA0, -16, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0xA, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0xC, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x8A, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 8, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_pbfm_ax1_3_script:
banim_pbfm_ax1_3_mode_attack_close:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_3_mode_attack_close_back:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_3_mode_attack_close_critical:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_3_mode_attack_close_critical_back:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_3_mode_attack_range:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_3_mode_attack_range_critical:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_pbfm_ax1_sheet_1, 1, banim_pbfm_ax1_3_oam_frame_1_r - banim_pbfm_ax1_3_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 2, banim_pbfm_ax1_3_oam_frame_2_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pbfm_ax1_sheet_1, 3, banim_pbfm_ax1_3_oam_frame_3_r - banim_pbfm_ax1_3_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_pbfm_ax1_sheet_1, 1, banim_pbfm_ax1_3_oam_frame_1_r - banim_pbfm_ax1_3_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 2, banim_pbfm_ax1_3_oam_frame_2_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pbfm_ax1_sheet_1, 3, banim_pbfm_ax1_3_oam_frame_3_r - banim_pbfm_ax1_3_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_3_mode_stand_close:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_3_mode_stand:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_3_mode_stand_range:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_3_mode_attack_miss:
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 0, banim_pbfm_ax1_3_oam_frame_0_r - banim_pbfm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
	.section .data.modes
	.word banim_pbfm_ax1_3_mode_attack_close - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_attack_close_back - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_attack_close_critical - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_attack_close_critical_back - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_attack_range - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_attack_range_critical - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_dodge_close - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_dodge_range - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_stand_close - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_stand - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_stand_range - banim_pbfm_ax1_3_script
	.word banim_pbfm_ax1_3_mode_attack_miss - banim_pbfm_ax1_3_script
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0

