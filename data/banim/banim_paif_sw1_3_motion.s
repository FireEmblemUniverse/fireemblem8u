@ vim:ft=armv4
	.global banim_paif_sw1_3_script
	.global banim_paif_sw1_3_oam_r
	.global banim_paif_sw1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x3E
	.section .data.oam_l
banim_paif_sw1_3_oam_l:
banim_paif_sw1_3_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x1000, 0x84, -10, -32
	banim_frame_oam 0x4000, 0x9000, 0xC0, -19, 0
	banim_frame_oam 0x4000, 0x9000, 0x80, -17, -16
	banim_frame_oam 0x0, 0x1000, 0x20, 0, -40
	banim_frame_oam 0x0, 0x5000, 0x40, 5, -32
	banim_frame_oam 0x8000, 0x1000, 0x42, -3, -32
	banim_frame_end
banim_paif_sw1_3_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, 8
	banim_frame_oam 0x0, 0x9000, 0x60, -20, -24
	banim_frame_oam 0x8000, 0x5000, 0x64, -28, -24
	banim_frame_oam 0x0, 0x5000, 0x20, -13, -40
	banim_frame_oam 0x8000, 0x1000, 0x22, -21, -40
	banim_frame_oam 0x0, 0x1000, 0x43, 3, -32
	banim_frame_oam 0x0, 0x1000, 0xE4, -36, 0
	banim_frame_end
banim_paif_sw1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0x0, -26, 8
	banim_frame_oam 0x0, 0x5000, 0x4, -15, -40
	banim_frame_oam 0x8000, 0x1000, 0x6, -23, -40
	banim_frame_oam 0x0, 0x1000, 0x23, 1, -32
	banim_frame_oam 0x0, 0x9000, 0x7, -22, -24
	banim_frame_oam 0x8000, 0x1000, 0x87, -38, -8
	banim_frame_oam 0x8000, 0x5000, 0xB, -30, -24
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
	banim_frame_end
	.section .data.oam_r
banim_paif_sw1_3_oam_r:
banim_paif_sw1_3_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x0, 0x84, 2, -32
	banim_frame_oam 0x4000, 0x8000, 0xC0, -13, 0
	banim_frame_oam 0x4000, 0x8000, 0x80, -15, -16
	banim_frame_oam 0x0, 0x0, 0x20, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x40, -21, -32
	banim_frame_oam 0x8000, 0x0, 0x42, -5, -32
	banim_frame_end
banim_paif_sw1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, 8
	banim_frame_oam 0x0, 0x8000, 0x60, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x64, 20, -24
	banim_frame_oam 0x0, 0x4000, 0x20, -3, -40
	banim_frame_oam 0x8000, 0x0, 0x22, 13, -40
	banim_frame_oam 0x0, 0x0, 0x43, -11, -32
	banim_frame_oam 0x0, 0x0, 0xE4, 28, 0
	banim_frame_end
banim_paif_sw1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0x0, -6, 8
	banim_frame_oam 0x0, 0x4000, 0x4, -1, -40
	banim_frame_oam 0x8000, 0x0, 0x6, 15, -40
	banim_frame_oam 0x0, 0x0, 0x23, -9, -32
	banim_frame_oam 0x0, 0x8000, 0x7, -10, -24
	banim_frame_oam 0x8000, 0x0, 0x87, 30, -8
	banim_frame_oam 0x8000, 0x4000, 0xB, 22, -24
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
	banim_frame_end
	.section .data.script
banim_paif_sw1_3_script:
banim_paif_sw1_3_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_6, 2, banim_paif_sw1_3_oam_frame_2_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_3_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_6, 2, banim_paif_sw1_3_oam_frame_2_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_3_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_6, 2, banim_paif_sw1_3_oam_frame_2_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_3_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_6, 2, banim_paif_sw1_3_oam_frame_2_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_3_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_6, 2, banim_paif_sw1_3_oam_frame_2_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_3_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_6, 2, banim_paif_sw1_3_oam_frame_2_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_6, 2, banim_paif_sw1_3_oam_frame_2_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_6, 2, banim_paif_sw1_3_oam_frame_2_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_paif_sw1_3_mode_stand_close:
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_paif_sw1_3_mode_stand:
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_paif_sw1_3_mode_stand_range:
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_paif_sw1_3_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_paif_sw1_sheet_0, 0, banim_paif_sw1_3_oam_frame_0_r - banim_paif_sw1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_frame 3, banim_paif_sw1_sheet_6, 2, banim_paif_sw1_3_oam_frame_2_r - banim_paif_sw1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_paif_sw1_sheet_6, 1, banim_paif_sw1_3_oam_frame_1_r - banim_paif_sw1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_paif_sw1_3_mode_attack_close - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_attack_close_back - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_attack_close_critical - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_attack_close_critical_back - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_attack_range - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_attack_range_critical - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_dodge_close - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_dodge_range - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_stand_close - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_stand - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_stand_range - banim_paif_sw1_3_script
	.word banim_paif_sw1_3_mode_attack_miss - banim_paif_sw1_3_script
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

