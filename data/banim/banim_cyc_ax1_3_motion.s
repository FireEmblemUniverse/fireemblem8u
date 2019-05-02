@ vim:ft=armv4
	.global banim_cyc_ax1_3_script
	.global banim_cyc_ax1_3_oam_r
	.global banim_cyc_ax1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xAF
	.section .data.oam_l
banim_cyc_ax1_3_oam_l:
banim_cyc_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x8000, 0xD000, 0x14, -16, -44
	banim_frame_oam 0x8000, 0x9000, 0x18, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0x1A, -40, -44
	banim_frame_oam 0x8000, 0x9000, 0x98, -32, -12
	banim_frame_oam 0x8000, 0x5000, 0x9A, -40, -12
	banim_frame_end
banim_cyc_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x8000, 0xD000, 0x10, -24, -44
	banim_frame_oam 0x8000, 0x9000, 0x14, -40, -44
	banim_frame_oam 0x8000, 0x9000, 0x94, -40, -12
	banim_frame_oam 0x8000, 0x5000, 0x4F, 8, -28
	banim_frame_oam 0x8000, 0x1000, 0xCF, 8, 4
	banim_frame_oam 0x8000, 0x1000, 0xF, 16, -12
	banim_frame_end
banim_cyc_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x8000, 0xD000, 0x17, -24, -44
	banim_frame_oam 0x8000, 0x9000, 0x1B, -40, -44
	banim_frame_oam 0x8000, 0x9000, 0x9B, -40, -12
	banim_frame_oam 0x0, 0x1000, 0xF6, 8, 12
	banim_frame_oam 0x8000, 0x1000, 0x76, 8, -20
	banim_frame_oam 0x0, 0x1000, 0x56, -48, -12
	banim_frame_oam 0x8000, 0x1000, 0x16, 16, -20
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
banim_cyc_ax1_3_oam_r:
banim_cyc_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x8000, 0xC000, 0x14, -16, -44
	banim_frame_oam 0x8000, 0x8000, 0x18, 16, -44
	banim_frame_oam 0x8000, 0x4000, 0x1A, 32, -44
	banim_frame_oam 0x8000, 0x8000, 0x98, 16, -12
	banim_frame_oam 0x8000, 0x4000, 0x9A, 32, -12
	banim_frame_end
banim_cyc_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x8000, 0xC000, 0x10, -8, -44
	banim_frame_oam 0x8000, 0x8000, 0x14, 24, -44
	banim_frame_oam 0x8000, 0x8000, 0x94, 24, -12
	banim_frame_oam 0x8000, 0x4000, 0x4F, -16, -28
	banim_frame_oam 0x8000, 0x0, 0xCF, -16, 4
	banim_frame_oam 0x8000, 0x0, 0xF, -24, -12
	banim_frame_end
banim_cyc_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x8000, 0xC000, 0x17, -8, -44
	banim_frame_oam 0x8000, 0x8000, 0x1B, 24, -44
	banim_frame_oam 0x8000, 0x8000, 0x9B, 24, -12
	banim_frame_oam 0x0, 0x0, 0xF6, -16, 12
	banim_frame_oam 0x8000, 0x0, 0x76, -16, -20
	banim_frame_oam 0x0, 0x0, 0x56, 40, -12
	banim_frame_oam 0x8000, 0x0, 0x16, -24, -20
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
banim_cyc_ax1_3_script:
banim_cyc_ax1_3_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 2, banim_cyc_ax1_3_oam_frame_2_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_3_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 2, banim_cyc_ax1_3_oam_frame_2_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_3_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 2, banim_cyc_ax1_3_oam_frame_2_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_3_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 2, banim_cyc_ax1_3_oam_frame_2_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_3_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 2, banim_cyc_ax1_3_oam_frame_2_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_3_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 2, banim_cyc_ax1_3_oam_frame_2_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 2, banim_cyc_ax1_3_oam_frame_2_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 2, banim_cyc_ax1_3_oam_frame_2_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_3_mode_stand_close:
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_3_mode_stand:
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_3_mode_stand_range:
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_3_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 2, banim_cyc_ax1_3_oam_frame_2_r - banim_cyc_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 1, banim_cyc_ax1_3_oam_frame_1_r - banim_cyc_ax1_3_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 0, banim_cyc_ax1_3_oam_frame_0_r - banim_cyc_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_cyc_ax1_3_mode_attack_close - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_attack_close_back - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_attack_close_critical - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_attack_close_critical_back - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_attack_range - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_attack_range_critical - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_dodge_close - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_dodge_range - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_stand_close - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_stand - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_stand_range - banim_cyc_ax1_3_script
	.word banim_cyc_ax1_3_mode_attack_miss - banim_cyc_ax1_3_script
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

