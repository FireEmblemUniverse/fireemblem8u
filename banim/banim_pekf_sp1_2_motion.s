@ vim:ft=armv4
	.global banim_pekf_sp1_2_script
	.global banim_pekf_sp1_2_oam_r
	.global banim_pekf_sp1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x66
	.section .data.oam_l
banim_pekf_sp1_2_oam_l:
banim_pekf_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x1000, 0x13, -21, -58
	banim_frame_oam 0x0, 0x1000, 0x15, -29, -58
	banim_frame_oam 0x4000, 0x5000, 0x31, -21, -50
	banim_frame_oam 0x0, 0x1000, 0x35, -29, -50
	banim_frame_oam 0x0, 0x1000, 0x11, 3, -58
	banim_frame_oam 0x4000, 0x9000, 0x51, -21, -42
	banim_frame_oam 0x8000, 0x1000, 0x55, -29, -42
	banim_frame_oam 0x4000, 0x5000, 0x91, -21, -26
	banim_frame_oam 0x0, 0x1000, 0x95, -29, -26
	banim_frame_oam 0x4000, 0x9000, 0xB1, -21, -18
	banim_frame_oam 0x4000, 0x1000, 0xF1, -5, -2
	banim_frame_oam 0x0, 0x1000, 0xF3, -13, -2
	banim_frame_oam 0x8000, 0x1000, 0xD5, -29, -10
	banim_frame_oam 0x8000, 0x1000, 0xAF, 11, -18
	banim_frame_oam 0x0, 0x1000, 0xEF, 11, -2
	banim_frame_oam 0x8000, 0x5000, 0x70, 11, -58
	banim_frame_oam 0x0, 0x1000, 0xF0, 11, -26
	banim_frame_oam 0x4000, 0x1000, 0xE4, -26, -66
	banim_frame_oam 0x0, 0x1000, 0xB5, 2, 6
	banim_frame_oam 0x0, 0x1000, 0x64, -5, 9
	banim_frame_oam 0x0, 0x1000, 0x64, -13, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -21, 9
	banim_frame_oam 0x0, 0x0, 0x65, 3, 9
	banim_frame_end
banim_pekf_sp1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x2, -23, -60
	banim_frame_oam 0x8000, 0x1000, 0x4, -31, -60
	banim_frame_oam 0x8000, 0x1000, 0x46, -7, -60
	banim_frame_oam 0x4000, 0x5000, 0x41, -31, -44
	banim_frame_oam 0x4000, 0x1000, 0x86, -23, -36
	banim_frame_oam 0x4000, 0x1000, 0x60, -7, -36
	banim_frame_oam 0x8000, 0x9000, 0x80, -7, -28
	banim_frame_oam 0x8000, 0x5000, 0x82, -15, -28
	banim_frame_oam 0x0, 0x1000, 0x45, -23, -28
	banim_frame_oam 0x0, 0x1000, 0xA3, -23, -20
	banim_frame_oam 0x8000, 0x1000, 0xC3, -23, -12
	banim_frame_oam 0x4000, 0x1000, 0xA6, -39, -20
	banim_frame_oam 0x4000, 0x1000, 0xC4, -39, -12
	banim_frame_oam 0x8000, 0x1000, 0x5, 9, -18
	banim_frame_oam 0x0, 0x1000, 0x40, 1, 4
	banim_frame_oam 0x0, 0x5000, 0x6, -22, -76
	banim_frame_oam 0x8000, 0x1000, 0x8, -30, -76
	banim_frame_oam 0x0, 0x1000, 0x64, -7, 9
	banim_frame_oam 0x0, 0x1000, 0x64, -15, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -23, 9
	banim_frame_oam 0x0, 0x0, 0x65, 1, 9
	banim_frame_end
banim_pekf_sp1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, -9, -57
	banim_frame_oam 0x8000, 0x5000, 0xB, -17, -57
	banim_frame_oam 0x0, 0x5000, 0x89, -9, -25
	banim_frame_oam 0x8000, 0x1000, 0x8B, -17, -25
	banim_frame_oam 0x4000, 0x1000, 0xC9, -9, -9
	banim_frame_oam 0x0, 0x1000, 0xCB, -17, -9
	banim_frame_oam 0x0, 0x5000, 0xF, -33, -49
	banim_frame_oam 0x4000, 0x1000, 0x4F, -33, -33
	banim_frame_oam 0x0, 0x1000, 0x6F, -25, -25
	banim_frame_oam 0x8000, 0x1000, 0xAC, -25, -17
	banim_frame_oam 0x0, 0x1000, 0xEC, -25, -1
	banim_frame_oam 0x0, 0x1000, 0xEB, -17, -1
	banim_frame_oam 0x4000, 0x1000, 0x8E, -41, -4
	banim_frame_oam 0x0, 0x1000, 0xEA, -17, 7
	banim_frame_oam 0x8000, 0x1000, 0xE, -41, -57
	banim_frame_oam 0x0, 0x1000, 0x6E, -33, -57
	banim_frame_oam 0x0, 0x1000, 0xA8, -41, -65
	banim_frame_oam 0x0, 0x5000, 0x47, -9, -73
	banim_frame_oam 0x0, 0x1000, 0x64, -12, 9
	banim_frame_oam 0x0, 0x1000, 0x64, -20, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -28, 9
	banim_frame_oam 0x0, 0x0, 0x65, -4, 9
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
banim_pekf_sp1_2_oam_r:
banim_pekf_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0x13, 5, -58
	banim_frame_oam 0x0, 0x0, 0x15, 21, -58
	banim_frame_oam 0x4000, 0x4000, 0x31, -11, -50
	banim_frame_oam 0x0, 0x0, 0x35, 21, -50
	banim_frame_oam 0x0, 0x0, 0x11, -11, -58
	banim_frame_oam 0x4000, 0x8000, 0x51, -11, -42
	banim_frame_oam 0x8000, 0x0, 0x55, 21, -42
	banim_frame_oam 0x4000, 0x4000, 0x91, -11, -26
	banim_frame_oam 0x0, 0x0, 0x95, 21, -26
	banim_frame_oam 0x4000, 0x8000, 0xB1, -11, -18
	banim_frame_oam 0x4000, 0x0, 0xF1, -11, -2
	banim_frame_oam 0x0, 0x0, 0xF3, 5, -2
	banim_frame_oam 0x8000, 0x0, 0xD5, 21, -10
	banim_frame_oam 0x8000, 0x0, 0xAF, -19, -18
	banim_frame_oam 0x0, 0x0, 0xEF, -19, -2
	banim_frame_oam 0x8000, 0x4000, 0x70, -19, -58
	banim_frame_oam 0x0, 0x0, 0xF0, -19, -26
	banim_frame_oam 0x4000, 0x0, 0xE4, 10, -66
	banim_frame_oam 0x0, 0x0, 0xB5, -10, 6
	banim_frame_oam 0x0, 0x0, 0x64, -3, 9
	banim_frame_oam 0x0, 0x0, 0x64, 5, 9
	banim_frame_oam 0x0, 0x0, 0x65, 13, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -11, 9
	banim_frame_end
banim_pekf_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x2, 7, -60
	banim_frame_oam 0x8000, 0x0, 0x4, 23, -60
	banim_frame_oam 0x8000, 0x0, 0x46, -1, -60
	banim_frame_oam 0x4000, 0x4000, 0x41, -1, -44
	banim_frame_oam 0x4000, 0x0, 0x86, 7, -36
	banim_frame_oam 0x4000, 0x0, 0x60, -9, -36
	banim_frame_oam 0x8000, 0x8000, 0x80, -9, -28
	banim_frame_oam 0x8000, 0x4000, 0x82, 7, -28
	banim_frame_oam 0x0, 0x0, 0x45, 15, -28
	banim_frame_oam 0x0, 0x0, 0xA3, 15, -20
	banim_frame_oam 0x8000, 0x0, 0xC3, 15, -12
	banim_frame_oam 0x4000, 0x0, 0xA6, 23, -20
	banim_frame_oam 0x4000, 0x0, 0xC4, 23, -12
	banim_frame_oam 0x8000, 0x0, 0x5, -17, -18
	banim_frame_oam 0x0, 0x0, 0x40, -9, 4
	banim_frame_oam 0x0, 0x4000, 0x6, 6, -76
	banim_frame_oam 0x8000, 0x0, 0x8, 22, -76
	banim_frame_oam 0x0, 0x0, 0x64, -1, 9
	banim_frame_oam 0x0, 0x0, 0x64, 7, 9
	banim_frame_oam 0x0, 0x0, 0x65, 15, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -9, 9
	banim_frame_end
banim_pekf_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -7, -57
	banim_frame_oam 0x8000, 0x4000, 0xB, 9, -57
	banim_frame_oam 0x0, 0x4000, 0x89, -7, -25
	banim_frame_oam 0x8000, 0x0, 0x8B, 9, -25
	banim_frame_oam 0x4000, 0x0, 0xC9, -7, -9
	banim_frame_oam 0x0, 0x0, 0xCB, 9, -9
	banim_frame_oam 0x0, 0x4000, 0xF, 17, -49
	banim_frame_oam 0x4000, 0x0, 0x4F, 17, -33
	banim_frame_oam 0x0, 0x0, 0x6F, 17, -25
	banim_frame_oam 0x8000, 0x0, 0xAC, 17, -17
	banim_frame_oam 0x0, 0x0, 0xEC, 17, -1
	banim_frame_oam 0x0, 0x0, 0xEB, 9, -1
	banim_frame_oam 0x4000, 0x0, 0x8E, 25, -4
	banim_frame_oam 0x0, 0x0, 0xEA, 9, 7
	banim_frame_oam 0x8000, 0x0, 0xE, 33, -57
	banim_frame_oam 0x0, 0x0, 0x6E, 25, -57
	banim_frame_oam 0x0, 0x0, 0xA8, 33, -65
	banim_frame_oam 0x0, 0x4000, 0x47, -7, -73
	banim_frame_oam 0x0, 0x0, 0x64, 4, 9
	banim_frame_oam 0x0, 0x0, 0x64, 12, 9
	banim_frame_oam 0x0, 0x0, 0x65, 20, 9
	banim_frame_oam 0x0, 0x1000, 0x65, -4, 9
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
banim_pekf_sp1_2_script:
banim_pekf_sp1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 2, banim_pekf_sp1_2_oam_frame_2_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 2, banim_pekf_sp1_2_oam_frame_2_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 2, banim_pekf_sp1_2_oam_frame_2_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 2, banim_pekf_sp1_2_oam_frame_2_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 2, banim_pekf_sp1_2_oam_frame_2_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 2, banim_pekf_sp1_2_oam_frame_2_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 2, banim_pekf_sp1_2_oam_frame_2_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 2, banim_pekf_sp1_2_oam_frame_2_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pekf_sp1_2_mode_stand_close:
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pekf_sp1_2_mode_stand:
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pekf_sp1_2_mode_stand_range:
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pekf_sp1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 0, banim_pekf_sp1_2_oam_frame_0_r - banim_pekf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_frame 1, banim_pekf_sp1_sheet_4, 2, banim_pekf_sp1_2_oam_frame_2_r - banim_pekf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pekf_sp1_sheet_4, 1, banim_pekf_sp1_2_oam_frame_1_r - banim_pekf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pekf_sp1_2_mode_attack_close - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_attack_close_back - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_attack_close_critical - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_attack_close_critical_back - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_attack_range - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_attack_range_critical - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_dodge_close - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_dodge_range - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_stand_close - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_stand - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_stand_range - banim_pekf_sp1_2_script
	.word banim_pekf_sp1_2_mode_attack_miss - banim_pekf_sp1_2_script
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

