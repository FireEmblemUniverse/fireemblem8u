@ vim:ft=armv4
	.global banim_drmm_sp1_6_script
	.global banim_drmm_sp1_6_oam_r
	.global banim_drmm_sp1_6_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x60
	.section .data.oam_l
banim_drmm_sp1_6_oam_l:
banim_drmm_sp1_6_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x9A, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0x9C, -8, -40
	banim_frame_oam 0x4000, 0x1000, 0x80, 16, -16
	banim_frame_oam 0x4000, 0x5000, 0xA0, 0, -8
	banim_frame_oam 0x4000, 0x1000, 0xA4, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xA6, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xC2, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xC6, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x20, -40, 0
	banim_frame_oam 0x0, 0x1000, 0x0, -48, -1
	banim_frame_oam 0x0, 0x5000, 0x40, -64, -13
	banim_frame_oam 0x4000, 0x1000, 0x85, -24, -16
	banim_frame_oam 0x8000, 0x9000, 0x5, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x7, -32, -48
	banim_frame_oam 0x8000, 0x1000, 0x1, 16, -48
	banim_frame_oam 0x4000, 0x1000, 0x2, 0, -48
	banim_frame_oam 0x0, 0x1000, 0x4, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xC0, -40, -48
	banim_frame_oam 0x4000, 0x9000, 0x8, -16, -64
	banim_frame_oam 0x0, 0x5000, 0xC, -32, -64
	banim_frame_oam 0x8000, 0x1000, 0xE, -40, -64
	banim_frame_oam 0x0, 0x1000, 0xA7, -48, -72
	banim_frame_oam 0x0, 0x1000, 0x87, -8, -72
	banim_frame_oam 0x4000, 0x1000, 0xE0, -40, -72
	banim_frame_end
banim_drmm_sp1_6_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, -16
	banim_frame_oam 0x0, 0x5000, 0x84, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x86, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0xC2, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xC6, -32, 0
	banim_frame_oam 0x0, 0x9000, 0x2, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -48
	banim_frame_oam 0x8000, 0x1000, 0x1, 16, -48
	banim_frame_oam 0x0, 0x1000, 0x41, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0x7, -32, -48
	banim_frame_oam 0x0, 0x5000, 0x8, 3, -64
	banim_frame_oam 0x0, 0x1000, 0x47, 3, -72
	banim_frame_oam 0x4000, 0x5000, 0x49, -32, -56
	banim_frame_oam 0x0, 0x5000, 0xA, -24, -72
	banim_frame_oam 0x8000, 0x1000, 0xC, -32, -72
	banim_frame_oam 0x0, 0x1000, 0xD, -40, -72
	banim_frame_oam 0x0, 0x1000, 0x48, -40, -80
	banim_frame_oam 0x4000, 0x1000, 0x60, -48, 0
	banim_frame_oam 0x0, 0x1000, 0x40, -40, -48
	banim_frame_oam 0x0, 0x5000, 0x70, -56, -16
	banim_frame_oam 0x8000, 0x1000, 0x2D, -32, -32
	banim_frame_end
banim_drmm_sp1_6_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x87, 0, -16
	banim_frame_oam 0x0, 0x5000, 0x8B, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x8D, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0xC9, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xCD, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, 16, 8
	banim_frame_oam 0x8000, 0x1000, 0x72, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x67, -40, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -40, -16
	banim_frame_oam 0x4000, 0x5000, 0x69, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x6D, -24, -24
	banim_frame_oam 0x4000, 0x9000, 0xE, 0, -48
	banim_frame_oam 0x0, 0x5000, 0x12, -16, -48
	banim_frame_oam 0x8000, 0x1000, 0x14, -24, -48
	banim_frame_oam 0x4000, 0x5000, 0x4E, 0, -32
	banim_frame_oam 0x4000, 0x1000, 0x52, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x54, -24, -32
	banim_frame_oam 0x0, 0x5000, 0xB0, -16, -72
	banim_frame_oam 0x8000, 0x1000, 0xB2, -24, -72
	banim_frame_oam 0x4000, 0x1000, 0xF0, -16, -56
	banim_frame_oam 0x0, 0x1000, 0xF2, -24, -56
	banim_frame_oam 0x0, 0x1000, 0xEF, 0, -56
	banim_frame_oam 0x0, 0x1000, 0xCF, -32, -48
	banim_frame_oam 0x8000, 0x1000, 0x73, -32, -80
	banim_frame_oam 0x0, 0x5000, 0x6E, 10, -72
	banim_frame_oam 0x4000, 0x1000, 0xAE, 10, -56
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_drmm_sp1_6_oam_r:
banim_drmm_sp1_6_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x9A, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x9C, 0, -40
	banim_frame_oam 0x4000, 0x0, 0x80, -32, -16
	banim_frame_oam 0x4000, 0x4000, 0xA0, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xA4, 0, -8
	banim_frame_oam 0x0, 0x0, 0xA6, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0xC2, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xC6, 16, 0
	banim_frame_oam 0x0, 0x0, 0x20, 32, 0
	banim_frame_oam 0x0, 0x0, 0x0, 40, -1
	banim_frame_oam 0x0, 0x4000, 0x40, 48, -13
	banim_frame_oam 0x4000, 0x0, 0x85, 8, -16
	banim_frame_oam 0x8000, 0x8000, 0x5, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x7, 24, -48
	banim_frame_oam 0x8000, 0x0, 0x1, -24, -48
	banim_frame_oam 0x4000, 0x0, 0x2, -16, -48
	banim_frame_oam 0x0, 0x0, 0x4, 0, -48
	banim_frame_oam 0x0, 0x0, 0xC0, 32, -48
	banim_frame_oam 0x4000, 0x8000, 0x8, -16, -64
	banim_frame_oam 0x0, 0x4000, 0xC, 16, -64
	banim_frame_oam 0x8000, 0x0, 0xE, 32, -64
	banim_frame_oam 0x0, 0x0, 0xA7, 40, -72
	banim_frame_oam 0x0, 0x0, 0x87, 0, -72
	banim_frame_oam 0x4000, 0x0, 0xE0, 24, -72
	banim_frame_end
banim_drmm_sp1_6_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, -16
	banim_frame_oam 0x0, 0x4000, 0x84, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x86, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0xC2, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xC6, 16, 0
	banim_frame_oam 0x0, 0x8000, 0x2, -16, -48
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -48
	banim_frame_oam 0x8000, 0x0, 0x1, -24, -48
	banim_frame_oam 0x0, 0x0, 0x41, -24, -32
	banim_frame_oam 0x8000, 0x0, 0x7, 24, -48
	banim_frame_oam 0x0, 0x4000, 0x8, -19, -64
	banim_frame_oam 0x0, 0x0, 0x47, -11, -72
	banim_frame_oam 0x4000, 0x4000, 0x49, 0, -56
	banim_frame_oam 0x0, 0x4000, 0xA, 8, -72
	banim_frame_oam 0x8000, 0x0, 0xC, 24, -72
	banim_frame_oam 0x0, 0x0, 0xD, 32, -72
	banim_frame_oam 0x0, 0x0, 0x48, 32, -80
	banim_frame_oam 0x4000, 0x0, 0x60, 32, 0
	banim_frame_oam 0x0, 0x0, 0x40, 32, -48
	banim_frame_oam 0x0, 0x4000, 0x70, 40, -16
	banim_frame_oam 0x8000, 0x0, 0x2D, 24, -32
	banim_frame_end
banim_drmm_sp1_6_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x87, -32, -16
	banim_frame_oam 0x0, 0x4000, 0x8B, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x8D, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0xC9, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xCD, 16, 0
	banim_frame_oam 0x0, 0x0, 0xE8, -24, 8
	banim_frame_oam 0x8000, 0x0, 0x72, 24, 0
	banim_frame_oam 0x0, 0x0, 0x67, 32, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, 24, -16
	banim_frame_oam 0x4000, 0x4000, 0x69, -16, -24
	banim_frame_oam 0x0, 0x0, 0x6D, 16, -24
	banim_frame_oam 0x4000, 0x8000, 0xE, -32, -48
	banim_frame_oam 0x0, 0x4000, 0x12, 0, -48
	banim_frame_oam 0x8000, 0x0, 0x14, 16, -48
	banim_frame_oam 0x4000, 0x4000, 0x4E, -32, -32
	banim_frame_oam 0x4000, 0x0, 0x52, 0, -32
	banim_frame_oam 0x0, 0x0, 0x54, 16, -32
	banim_frame_oam 0x0, 0x4000, 0xB0, 0, -72
	banim_frame_oam 0x8000, 0x0, 0xB2, 16, -72
	banim_frame_oam 0x4000, 0x0, 0xF0, 0, -56
	banim_frame_oam 0x0, 0x0, 0xF2, 16, -56
	banim_frame_oam 0x0, 0x0, 0xEF, -8, -56
	banim_frame_oam 0x0, 0x0, 0xCF, 24, -48
	banim_frame_oam 0x8000, 0x0, 0x73, 24, -80
	banim_frame_oam 0x0, 0x4000, 0x6E, -26, -72
	banim_frame_oam 0x4000, 0x0, 0xAE, -26, -56
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_drmm_sp1_6_script:
banim_drmm_sp1_6_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_frame 1, banim_drmm_sp1_3_sheet_0, 2, banim_drmm_sp1_6_oam_frame_2_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_6_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_frame 1, banim_drmm_sp1_3_sheet_0, 2, banim_drmm_sp1_6_oam_frame_2_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_6_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_frame 1, banim_drmm_sp1_3_sheet_0, 2, banim_drmm_sp1_6_oam_frame_2_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_6_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_frame 1, banim_drmm_sp1_3_sheet_0, 2, banim_drmm_sp1_6_oam_frame_2_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_6_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_frame 1, banim_drmm_sp1_3_sheet_0, 2, banim_drmm_sp1_6_oam_frame_2_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_6_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_frame 1, banim_drmm_sp1_3_sheet_0, 2, banim_drmm_sp1_6_oam_frame_2_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_6_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_frame 1, banim_drmm_sp1_3_sheet_0, 2, banim_drmm_sp1_6_oam_frame_2_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_6_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_frame 1, banim_drmm_sp1_3_sheet_0, 2, banim_drmm_sp1_6_oam_frame_2_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drmm_sp1_6_mode_stand_close:
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drmm_sp1_6_mode_stand:
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drmm_sp1_6_mode_stand_range:
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drmm_sp1_6_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drmm_sp1_sheet_0, 0, banim_drmm_sp1_6_oam_frame_0_r - banim_drmm_sp1_6_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_frame 1, banim_drmm_sp1_3_sheet_0, 2, banim_drmm_sp1_6_oam_frame_2_r - banim_drmm_sp1_6_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drmm_sp1_3_sheet_0, 1, banim_drmm_sp1_6_oam_frame_1_r - banim_drmm_sp1_6_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_drmm_sp1_6_mode_attack_close - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_attack_close_back - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_attack_close_critical - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_attack_close_critical_back - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_attack_range - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_attack_range_critical - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_dodge_close - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_dodge_range - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_stand_close - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_stand - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_stand_range - banim_drmm_sp1_6_script
	.word banim_drmm_sp1_6_mode_attack_miss - banim_drmm_sp1_6_script
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

