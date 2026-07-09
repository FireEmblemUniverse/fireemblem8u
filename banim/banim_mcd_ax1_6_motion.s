@ vim:ft=armv4
	.global banim_mcd_ax1_6_script
	.global banim_mcd_ax1_6_oam_r
	.global banim_mcd_ax1_6_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB8
	.section .data.oam_l
banim_mcd_ax1_6_oam_l:
banim_mcd_ax1_6_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x86, -24, 0
	banim_frame_end
banim_mcd_ax1_6_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x27, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x2B, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x2D, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0xA7, 0, 0
	banim_frame_oam 0x0, 0x5000, 0xAB, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xAD, -24, 0
	banim_frame_end
banim_mcd_ax1_6_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x12, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x14, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x8E, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x92, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x94, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCE, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD2, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD4, -32, 8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_mcd_ax1_6_oam_r:
banim_mcd_ax1_6_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x86, 16, 0
	banim_frame_end
banim_mcd_ax1_6_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x27, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x2B, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x2D, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0xA7, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xAB, 0, 0
	banim_frame_oam 0x8000, 0x0, 0xAD, 16, 0
	banim_frame_end
banim_mcd_ax1_6_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x12, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x14, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x8E, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x92, 8, -8
	banim_frame_oam 0x8000, 0x0, 0x94, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xCE, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD2, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD4, 24, 8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
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
	.section .data.modes
	.word banim_mcd_ax1_6_mode_attack_close - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_attack_close_back - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_attack_close_critical - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_attack_close_critical_back - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_attack_range - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_attack_range_critical - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_dodge_close - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_dodge_range - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_stand_close - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_stand - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_stand_range - banim_mcd_ax1_6_script
	.word banim_mcd_ax1_6_mode_attack_miss - banim_mcd_ax1_6_script
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

