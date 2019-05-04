@ vim:ft=armv4
	.global banim_gar_sp1_4_script
	.global banim_gar_sp1_4_oam_r
	.global banim_gar_sp1_4_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xBF
	.section .data.oam_l
banim_gar_sp1_4_oam_l:
banim_gar_sp1_4_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x69, -32, -48
	banim_frame_oam 0x8000, 0x9000, 0x3B, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x3D, -16, -40
	banim_frame_oam 0x0, 0x5000, 0xBB, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xBD, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xFB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xFD, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x9E, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x9A, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x48, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0xC5, 16, -32
	banim_frame_oam 0x0, 0x1000, 0xC7, 8, -32
	banim_frame_oam 0x4000, 0x1000, 0xED, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE5, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0xA2, 16, -16
	banim_frame_end
banim_gar_sp1_4_oam_frame_1_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -8, -48
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -48
	banim_frame_oam 0x8000, 0x9000, 0x84, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x6, 24, -48
	banim_frame_oam 0x0, 0x1000, 0x46, 24, -32
	banim_frame_oam 0x4000, 0x9000, 0xA6, -24, -72
	banim_frame_oam 0x4000, 0x5000, 0xE6, -24, -56
	banim_frame_oam 0x4000, 0x1000, 0x88, 8, -56
	banim_frame_oam 0x8000, 0x9000, 0x7, -40, -64
	banim_frame_oam 0x0, 0x1000, 0x87, -32, -32
	banim_frame_end
banim_gar_sp1_4_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -32, -72
	banim_frame_oam 0x4000, 0x9000, 0x8D, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0xCD, -32, -24
	banim_frame_oam 0x8000, 0x9000, 0x4A, 8, -56
	banim_frame_oam 0x8000, 0x5000, 0x4C, 0, -56
	banim_frame_oam 0x4000, 0x1000, 0xCA, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xCC, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xEF, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x29, -40, -56
	banim_frame_oam 0x0, 0x1000, 0x9, 24, -40
	banim_frame_oam 0x4000, 0x1000, 0xA, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xF0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xC, 0, -72
	banim_frame_end
banim_gar_sp1_4_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -24, -80
	banim_frame_oam 0x8000, 0x9000, 0x18, -40, -80
	banim_frame_oam 0x4000, 0x9000, 0x94, -24, -48
	banim_frame_oam 0x0, 0x5000, 0x98, -40, -48
	banim_frame_oam 0x4000, 0x5000, 0xD4, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xD8, -40, -32
	banim_frame_oam 0x4000, 0x5000, 0xF0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, 8
	banim_frame_oam 0x8000, 0x9000, 0x11, 16, -64
	banim_frame_oam 0x8000, 0x5000, 0x13, 8, -64
	banim_frame_oam 0x0, 0x5000, 0x91, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0x93, 8, -32
	banim_frame_oam 0x4000, 0x5000, 0xF5, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xF9, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0xD2, -16, -16
	banim_frame_end
banim_gar_sp1_4_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x100E, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x108A, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x108E, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xCA, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x10CE, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x1089, -16, -56
	banim_frame_oam 0x0, 0x1000, 0x10C9, 24, -48
	banim_frame_oam 0x0, 0x1000, 0x10EE, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x1009, 24, -40
	banim_frame_end
banim_gar_sp1_4_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -8, -48
	banim_frame_oam 0x8000, 0x9000, 0x1014, -24, -48
	banim_frame_oam 0x4000, 0x9000, 0x90, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x1094, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x10D0, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x10D4, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x10F1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 24, -40
	banim_frame_oam 0x4000, 0x1000, 0x10EF, -24, -56
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
banim_gar_sp1_4_oam_r:
banim_gar_sp1_4_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x69, 16, -48
	banim_frame_oam 0x8000, 0x8000, 0x3B, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x3D, 8, -40
	banim_frame_oam 0x0, 0x4000, 0xBB, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xBD, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xFB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xFD, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x9E, 16, -16
	banim_frame_oam 0x8000, 0x4000, 0x9A, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x48, -24, -40
	banim_frame_oam 0x4000, 0x0, 0xC5, -32, -32
	banim_frame_oam 0x0, 0x0, 0xC7, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xED, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xE5, -8, -48
	banim_frame_oam 0x8000, 0x0, 0xA2, -24, -16
	banim_frame_end
banim_gar_sp1_4_oam_frame_1_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -48
	banim_frame_oam 0x8000, 0x8000, 0x84, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x6, -32, -48
	banim_frame_oam 0x0, 0x0, 0x46, -32, -32
	banim_frame_oam 0x4000, 0x8000, 0xA6, -8, -72
	banim_frame_oam 0x4000, 0x4000, 0xE6, -8, -56
	banim_frame_oam 0x4000, 0x0, 0x88, -24, -56
	banim_frame_oam 0x8000, 0x8000, 0x7, 24, -64
	banim_frame_oam 0x0, 0x0, 0x87, 24, -32
	banim_frame_end
banim_gar_sp1_4_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xD, 0, -72
	banim_frame_oam 0x4000, 0x8000, 0x8D, 0, -40
	banim_frame_oam 0x4000, 0x4000, 0xCD, 0, -24
	banim_frame_oam 0x8000, 0x8000, 0x4A, -24, -56
	banim_frame_oam 0x8000, 0x4000, 0x4C, -8, -56
	banim_frame_oam 0x4000, 0x0, 0xCA, -24, -24
	banim_frame_oam 0x0, 0x0, 0xCC, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xED, 0, -16
	banim_frame_oam 0x0, 0x0, 0xEF, 16, -16
	banim_frame_oam 0x0, 0x0, 0x29, 32, -56
	banim_frame_oam 0x0, 0x0, 0x9, -32, -40
	banim_frame_oam 0x4000, 0x0, 0xA, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xF0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF4, 16, 8
	banim_frame_oam 0x0, 0x0, 0xC, -8, -72
	banim_frame_end
banim_gar_sp1_4_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -8, -80
	banim_frame_oam 0x8000, 0x8000, 0x18, 24, -80
	banim_frame_oam 0x4000, 0x8000, 0x94, -8, -48
	banim_frame_oam 0x0, 0x4000, 0x98, 24, -48
	banim_frame_oam 0x4000, 0x4000, 0xD4, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xD8, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0xF0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF4, 16, 8
	banim_frame_oam 0x8000, 0x8000, 0x11, -32, -64
	banim_frame_oam 0x8000, 0x4000, 0x13, -16, -64
	banim_frame_oam 0x0, 0x4000, 0x91, -32, -32
	banim_frame_oam 0x8000, 0x0, 0x93, -16, -32
	banim_frame_oam 0x4000, 0x4000, 0xF5, -8, -24
	banim_frame_oam 0x0, 0x0, 0xF9, 24, -24
	banim_frame_oam 0x4000, 0x0, 0xD2, 0, -16
	banim_frame_end
banim_gar_sp1_4_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x100E, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x108A, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x108E, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x10CE, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x1089, 8, -56
	banim_frame_oam 0x0, 0x0, 0x10C9, -32, -48
	banim_frame_oam 0x0, 0x0, 0x10EE, 16, -48
	banim_frame_oam 0x8000, 0x4000, 0x1009, -32, -40
	banim_frame_end
banim_gar_sp1_4_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0x1014, 8, -48
	banim_frame_oam 0x4000, 0x8000, 0x90, -24, -16
	banim_frame_oam 0x0, 0x4000, 0x1094, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x10D0, -24, 0
	banim_frame_oam 0x4000, 0x0, 0x10D4, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0x10F1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF5, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, -32, -40
	banim_frame_oam 0x4000, 0x0, 0x10EF, 8, -56
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
banim_gar_sp1_4_script:
banim_gar_sp1_4_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_2_sheet_0, 1, banim_gar_sp1_4_oam_frame_1_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 2, banim_gar_sp1_4_oam_frame_2_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 3, banim_gar_sp1_4_oam_frame_3_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 4, banim_gar_sp1_4_oam_frame_4_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_8, 5, banim_gar_sp1_4_oam_frame_5_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_4_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_2_sheet_0, 1, banim_gar_sp1_4_oam_frame_1_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 2, banim_gar_sp1_4_oam_frame_2_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 3, banim_gar_sp1_4_oam_frame_3_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 4, banim_gar_sp1_4_oam_frame_4_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_8, 5, banim_gar_sp1_4_oam_frame_5_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_4_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_2_sheet_0, 1, banim_gar_sp1_4_oam_frame_1_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 2, banim_gar_sp1_4_oam_frame_2_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 3, banim_gar_sp1_4_oam_frame_3_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 4, banim_gar_sp1_4_oam_frame_4_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_8, 5, banim_gar_sp1_4_oam_frame_5_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_4_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_2_sheet_0, 1, banim_gar_sp1_4_oam_frame_1_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 2, banim_gar_sp1_4_oam_frame_2_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 3, banim_gar_sp1_4_oam_frame_3_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 4, banim_gar_sp1_4_oam_frame_4_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_8, 5, banim_gar_sp1_4_oam_frame_5_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_4_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_2_sheet_0, 1, banim_gar_sp1_4_oam_frame_1_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 2, banim_gar_sp1_4_oam_frame_2_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 3, banim_gar_sp1_4_oam_frame_3_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 4, banim_gar_sp1_4_oam_frame_4_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_8, 5, banim_gar_sp1_4_oam_frame_5_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_4_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_2_sheet_0, 1, banim_gar_sp1_4_oam_frame_1_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 2, banim_gar_sp1_4_oam_frame_2_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 3, banim_gar_sp1_4_oam_frame_3_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 4, banim_gar_sp1_4_oam_frame_4_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_8, 5, banim_gar_sp1_4_oam_frame_5_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_4_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_2_sheet_0, 1, banim_gar_sp1_4_oam_frame_1_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 2, banim_gar_sp1_4_oam_frame_2_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 3, banim_gar_sp1_4_oam_frame_3_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 4, banim_gar_sp1_4_oam_frame_4_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_8, 5, banim_gar_sp1_4_oam_frame_5_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_4_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_2_sheet_0, 1, banim_gar_sp1_4_oam_frame_1_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 2, banim_gar_sp1_4_oam_frame_2_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 3, banim_gar_sp1_4_oam_frame_3_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 4, banim_gar_sp1_4_oam_frame_4_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_8, 5, banim_gar_sp1_4_oam_frame_5_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_4_mode_stand_close:
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gar_sp1_4_mode_stand:
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gar_sp1_4_mode_stand_range:
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gar_sp1_4_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_2_sheet_0, 1, banim_gar_sp1_4_oam_frame_1_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 2, banim_gar_sp1_4_oam_frame_2_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_2_sheet_0, 3, banim_gar_sp1_4_oam_frame_3_r - banim_gar_sp1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 4, banim_gar_sp1_4_oam_frame_4_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_8, 5, banim_gar_sp1_4_oam_frame_5_r - banim_gar_sp1_4_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_3, 0, banim_gar_sp1_4_oam_frame_0_r - banim_gar_sp1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_gar_sp1_4_mode_attack_close - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_attack_close_back - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_attack_close_critical - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_attack_close_critical_back - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_attack_range - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_attack_range_critical - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_dodge_close - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_dodge_range - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_stand_close - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_stand - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_stand_range - banim_gar_sp1_4_script
	.word banim_gar_sp1_4_mode_attack_miss - banim_gar_sp1_4_script
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

