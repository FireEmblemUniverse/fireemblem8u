@ vim:ft=armv4
	.global banim_wykm_sp1_2_script
	.global banim_wykm_sp1_2_oam_r
	.global banim_wykm_sp1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x62
	.section .data.oam_l
banim_wykm_sp1_2_oam_l:
banim_wykm_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x4D, -16, -24
	banim_frame_oam 0x4000, 0xD000, 0x80, -32, -16
	banim_frame_oam 0x8000, 0x9000, 0x6, -32, -48
	banim_frame_oam 0x0, 0x5000, 0x40, -48, -48
	banim_frame_oam 0x0, 0x1000, 0x62, -48, -32
	banim_frame_oam 0x4000, 0x9000, 0xC8, -64, 0
	banim_frame_oam 0x8000, 0x1000, 0xCC, -72, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, -64, -16
	banim_frame_oam 0x8000, 0x1000, 0x8C, -72, -16
	banim_frame_oam 0x4000, 0x1000, 0xA8, -72, -24
	banim_frame_oam 0x4000, 0x9000, 0x48, -48, -64
	banim_frame_oam 0x4000, 0x1000, 0x88, -56, -72
	banim_frame_oam 0x0, 0x5000, 0x8, -8, -64
	banim_frame_oam 0x8000, 0x1000, 0xA, -16, -72
	banim_frame_oam 0x0, 0x1000, 0xB, -16, -56
	banim_frame_oam 0x4000, 0x1000, 0x3, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x5, -16, -48
	banim_frame_oam 0x8000, 0x1000, 0x4C, 8, -48
	banim_frame_oam 0x0, 0x1000, 0x2B, -16, -32
	banim_frame_oam 0x0, 0x5000, 0xD, -8, -40
	banim_frame_oam 0x0, 0x1000, 0x42, 8, -32
	banim_frame_oam 0x0, 0x1000, 0x63, 0, -24
	banim_frame_end
banim_wykm_sp1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x17, -72, -48
	banim_frame_oam 0x8000, 0x9000, 0x97, -72, -16
	banim_frame_oam 0x8000, 0x1000, 0xC, -72, -64
	banim_frame_oam 0x0, 0x5000, 0xDD, -56, -64
	banim_frame_oam 0x8000, 0x1000, 0xDF, -64, -64
	banim_frame_oam 0x4000, 0x5000, 0xBC, -64, -72
	banim_frame_oam 0x4000, 0x5000, 0x9C, -64, -80
	banim_frame_oam 0x8000, 0x5000, 0x8E, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0x8D, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xCD, -80, -32
	banim_frame_oam 0x4000, 0xD000, 0x4F, -56, -32
	banim_frame_oam 0x4000, 0x9000, 0xCF, -24, 0
	banim_frame_oam 0x4000, 0x9000, 0xD3, -56, 0
	banim_frame_oam 0x0, 0x5000, 0x14, -48, -48
	banim_frame_oam 0x8000, 0x1000, 0x16, -56, -48
	banim_frame_oam 0x0, 0x1000, 0x33, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x19, -24, -48
	banim_frame_oam 0x8000, 0x1000, 0x79, -32, -64
	banim_frame_oam 0x0, 0x1000, 0xB9, -32, -48
	banim_frame_oam 0x0, 0x1000, 0x59, -40, -56
	banim_frame_oam 0x0, 0x1000, 0xDC, -40, -64
	banim_frame_end
banim_wykm_sp1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -72, -80
	banim_frame_oam 0x4000, 0x9000, 0xA0, -72, -48
	banim_frame_oam 0x4000, 0x5000, 0xE0, -72, -32
	banim_frame_oam 0x4000, 0x1000, 0x0, -56, -88
	banim_frame_oam 0x4000, 0x1000, 0x2, -56, -24
	banim_frame_oam 0x8000, 0x9000, 0x8, -40, -72
	banim_frame_oam 0x0, 0x5000, 0x88, -40, -40
	banim_frame_oam 0x0, 0x1000, 0xC9, -40, -24
	banim_frame_oam 0x4000, 0x1000, 0xC7, -40, -16
	banim_frame_oam 0x4000, 0x1000, 0xC5, -40, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -32, 0
	banim_frame_oam 0x4000, 0x5000, 0xE4, -24, 8
	banim_frame_oam 0x4000, 0x5000, 0xE8, -56, 8
	banim_frame_oam 0x4000, 0x1000, 0xEC, -72, 8
	banim_frame_oam 0x0, 0x9000, 0x4, -24, -64
	banim_frame_oam 0x4000, 0x9000, 0x84, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x6B, 8, -48
	banim_frame_oam 0x8000, 0x5000, 0x6A, 16, -40
	banim_frame_oam 0x8000, 0x1000, 0xAC, -80, -40
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
banim_wykm_sp1_2_oam_r:
banim_wykm_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x4D, 0, -24
	banim_frame_oam 0x4000, 0xC000, 0x80, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0x6, 16, -48
	banim_frame_oam 0x0, 0x4000, 0x40, 32, -48
	banim_frame_oam 0x0, 0x0, 0x62, 40, -32
	banim_frame_oam 0x4000, 0x8000, 0xC8, 32, 0
	banim_frame_oam 0x8000, 0x0, 0xCC, 64, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 48, -16
	banim_frame_oam 0x8000, 0x0, 0x8C, 64, -16
	banim_frame_oam 0x4000, 0x0, 0xA8, 56, -24
	banim_frame_oam 0x4000, 0x8000, 0x48, 16, -64
	banim_frame_oam 0x4000, 0x0, 0x88, 40, -72
	banim_frame_oam 0x0, 0x4000, 0x8, -8, -64
	banim_frame_oam 0x8000, 0x0, 0xA, 8, -72
	banim_frame_oam 0x0, 0x0, 0xB, 8, -56
	banim_frame_oam 0x4000, 0x0, 0x3, -8, -48
	banim_frame_oam 0x8000, 0x0, 0x5, 8, -48
	banim_frame_oam 0x8000, 0x0, 0x4C, -16, -48
	banim_frame_oam 0x0, 0x0, 0x2B, 8, -32
	banim_frame_oam 0x0, 0x4000, 0xD, -8, -40
	banim_frame_oam 0x0, 0x0, 0x42, -16, -32
	banim_frame_oam 0x0, 0x0, 0x63, -8, -24
	banim_frame_end
banim_wykm_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x17, 56, -48
	banim_frame_oam 0x8000, 0x8000, 0x97, 56, -16
	banim_frame_oam 0x8000, 0x0, 0xC, 64, -64
	banim_frame_oam 0x0, 0x4000, 0xDD, 40, -64
	banim_frame_oam 0x8000, 0x0, 0xDF, 56, -64
	banim_frame_oam 0x4000, 0x4000, 0xBC, 32, -72
	banim_frame_oam 0x4000, 0x4000, 0x9C, 32, -80
	banim_frame_oam 0x8000, 0x4000, 0x8E, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x8D, -24, -16
	banim_frame_oam 0x0, 0x0, 0xCD, 72, -32
	banim_frame_oam 0x4000, 0xC000, 0x4F, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0xCF, -8, 0
	banim_frame_oam 0x4000, 0x8000, 0xD3, 24, 0
	banim_frame_oam 0x0, 0x4000, 0x14, 32, -48
	banim_frame_oam 0x8000, 0x0, 0x16, 48, -48
	banim_frame_oam 0x0, 0x0, 0x33, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x19, -8, -48
	banim_frame_oam 0x8000, 0x0, 0x79, 24, -64
	banim_frame_oam 0x0, 0x0, 0xB9, 24, -48
	banim_frame_oam 0x0, 0x0, 0x59, 32, -56
	banim_frame_oam 0x0, 0x0, 0xDC, 32, -64
	banim_frame_end
banim_wykm_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x20, 40, -80
	banim_frame_oam 0x4000, 0x8000, 0xA0, 40, -48
	banim_frame_oam 0x4000, 0x4000, 0xE0, 40, -32
	banim_frame_oam 0x4000, 0x0, 0x0, 40, -88
	banim_frame_oam 0x4000, 0x0, 0x2, 40, -24
	banim_frame_oam 0x8000, 0x8000, 0x8, 24, -72
	banim_frame_oam 0x0, 0x4000, 0x88, 24, -40
	banim_frame_oam 0x0, 0x0, 0xC9, 32, -24
	banim_frame_oam 0x4000, 0x0, 0xC7, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xC5, 24, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 24, 0
	banim_frame_oam 0x4000, 0x4000, 0xE4, -8, 8
	banim_frame_oam 0x4000, 0x4000, 0xE8, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xEC, 56, 8
	banim_frame_oam 0x0, 0x8000, 0x4, -8, -64
	banim_frame_oam 0x4000, 0x8000, 0x84, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x6B, -16, -48
	banim_frame_oam 0x8000, 0x4000, 0x6A, -24, -40
	banim_frame_oam 0x8000, 0x0, 0xAC, 72, -40
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
banim_wykm_sp1_2_script:
banim_wykm_sp1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 2, banim_wykm_sp1_2_oam_frame_2_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 2, banim_wykm_sp1_2_oam_frame_2_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 2, banim_wykm_sp1_2_oam_frame_2_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 2, banim_wykm_sp1_2_oam_frame_2_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 2, banim_wykm_sp1_2_oam_frame_2_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 2, banim_wykm_sp1_2_oam_frame_2_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 2, banim_wykm_sp1_2_oam_frame_2_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 2, banim_wykm_sp1_2_oam_frame_2_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_2_mode_stand_close:
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_wykm_sp1_2_mode_stand:
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_wykm_sp1_2_mode_stand_range:
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_wykm_sp1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_2_oam_frame_0_r - banim_wykm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 2, banim_wykm_sp1_2_oam_frame_2_r - banim_wykm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 1, banim_wykm_sp1_2_oam_frame_1_r - banim_wykm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_wykm_sp1_2_mode_attack_close - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_attack_close_back - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_attack_close_critical - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_attack_close_critical_back - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_attack_range - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_attack_range_critical - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_dodge_close - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_dodge_range - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_stand_close - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_stand - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_stand_range - banim_wykm_sp1_2_script
	.word banim_wykm_sp1_2_mode_attack_miss - banim_wykm_sp1_2_script
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

