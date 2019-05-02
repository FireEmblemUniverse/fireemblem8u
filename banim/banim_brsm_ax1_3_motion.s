@ vim:ft=armv4
	.global banim_brsm_ax1_3_script
	.global banim_brsm_ax1_3_oam_r
	.global banim_brsm_ax1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x24
	.section .data.oam_l
banim_brsm_ax1_3_oam_l:
banim_brsm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x87, -16, 8
	banim_frame_oam 0x0, 0x9000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x87, -16, 8
	banim_frame_end
banim_brsm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xB, -19, -25
	banim_frame_oam 0x4000, 0x1000, 0xA6, -2, -9
	banim_frame_oam 0x4000, 0x1000, 0xE8, -18, -9
	banim_frame_oam 0x4000, 0x9000, 0xA8, -19, -1
	banim_frame_oam 0x0, 0x1000, 0xEB, 2, -33
	banim_frame_oam 0x0, 0x1000, 0xEB, -7, -33
	banim_frame_end
banim_brsm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0xEC, -17, 6
	banim_frame_oam 0x4000, 0x1000, 0xCE, -17, -2
	banim_frame_oam 0x4000, 0x1000, 0xAE, -1, -2
	banim_frame_oam 0x4000, 0x5000, 0x8B, -17, -10
	banim_frame_oam 0x4000, 0x9000, 0x4B, -17, -26
	banim_frame_oam 0x0, 0x1000, 0xEB, 1, -34
	banim_frame_oam 0x0, 0x1000, 0xEB, -8, -34
	banim_frame_oam 0x8000, 0x1000, 0xAD, -25, -18
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
banim_brsm_ax1_3_oam_r:
banim_brsm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x87, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x87, -16, 8
	banim_frame_end
banim_brsm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xB, -13, -25
	banim_frame_oam 0x4000, 0x0, 0xA6, -14, -9
	banim_frame_oam 0x4000, 0x0, 0xE8, 2, -9
	banim_frame_oam 0x4000, 0x8000, 0xA8, -13, -1
	banim_frame_oam 0x0, 0x0, 0xEB, -10, -33
	banim_frame_oam 0x0, 0x0, 0xEB, -1, -33
	banim_frame_end
banim_brsm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0xEC, -15, 6
	banim_frame_oam 0x4000, 0x0, 0xCE, 1, -2
	banim_frame_oam 0x4000, 0x0, 0xAE, -15, -2
	banim_frame_oam 0x4000, 0x4000, 0x8B, -15, -10
	banim_frame_oam 0x4000, 0x8000, 0x4B, -15, -26
	banim_frame_oam 0x0, 0x0, 0xEB, -9, -34
	banim_frame_oam 0x0, 0x0, 0xEB, 0, -34
	banim_frame_oam 0x8000, 0x0, 0xAD, 17, -18
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
banim_brsm_ax1_3_script:
banim_brsm_ax1_3_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 2, banim_brsm_ax1_3_oam_frame_2_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_3_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 2, banim_brsm_ax1_3_oam_frame_2_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_3_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 2, banim_brsm_ax1_3_oam_frame_2_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_3_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 2, banim_brsm_ax1_3_oam_frame_2_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_3_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 2, banim_brsm_ax1_3_oam_frame_2_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_3_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 2, banim_brsm_ax1_3_oam_frame_2_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 2, banim_brsm_ax1_3_oam_frame_2_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 2, banim_brsm_ax1_3_oam_frame_2_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_brsm_ax1_3_mode_stand_close:
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_brsm_ax1_3_mode_stand:
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_brsm_ax1_3_mode_stand_range:
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_brsm_ax1_3_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 0, banim_brsm_ax1_3_oam_frame_0_r - banim_brsm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_frame 1, banim_brsm_ax1_2_sheet_0, 2, banim_brsm_ax1_3_oam_frame_2_r - banim_brsm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_brsm_ax1_2_sheet_0, 1, banim_brsm_ax1_3_oam_frame_1_r - banim_brsm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_brsm_ax1_3_mode_attack_close - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_attack_close_back - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_attack_close_critical - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_attack_close_critical_back - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_attack_range - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_attack_range_critical - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_dodge_close - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_dodge_range - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_stand_close - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_stand - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_stand_range - banim_brsm_ax1_3_script
	.word banim_brsm_ax1_3_mode_attack_miss - banim_brsm_ax1_3_script
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

