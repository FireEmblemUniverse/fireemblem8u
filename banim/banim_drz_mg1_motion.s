@ vim:ft=armv4
	.global banim_drz_mg1_script
	.global banim_drz_mg1_oam_r
	.global banim_drz_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC0
	.section .data.oam_l
banim_drz_mg1_oam_l:
banim_drz_mg1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -9, -76
	banim_frame_oam 0x8000, 0x9000, 0x8, -25, -76
	banim_frame_oam 0x4000, 0x5000, 0x84, -9, -44
	banim_frame_oam 0x4000, 0x1000, 0x88, -25, -44
	banim_frame_oam 0x8000, 0x8000, 0xA, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0xC, 2, -49
	banim_frame_end
banim_drz_mg1_oam_frame_1_l:
	banim_frame_affine -252, 44, 44, 252, 1
	banim_frame_oam 0x100, 0xC000, 0x18, -25, -94
	banim_frame_oam 0x8000, 0x8000, 0xA, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0xC, 2, -49
	banim_frame_end
banim_drz_mg1_oam_frame_2_l:
	banim_frame_affine -240, 87, 87, 240, 1
	banim_frame_oam 0x100, 0xC000, 0x18, -25, -96
	banim_frame_oam 0x8000, 0x8000, 0xA, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0xC, 2, -49
	banim_frame_end
banim_drz_mg1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -7, -82
	banim_frame_oam 0x0, 0x5000, 0xA4, -23, -82
	banim_frame_oam 0x4000, 0x5000, 0xE0, -7, -66
	banim_frame_oam 0x4000, 0x1000, 0xE4, -23, -66
	banim_frame_oam 0x4000, 0x9000, 0xA6, -15, -58
	banim_frame_oam 0x0, 0x5000, 0xAA, -31, -58
	banim_frame_oam 0x0, 0x1000, 0xE6, -31, -66
	banim_frame_oam 0x8000, 0x8000, 0xD, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0xF, 2, -49
	banim_frame_end
banim_drz_mg1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -5, -83
	banim_frame_oam 0x0, 0x5000, 0xA4, -21, -83
	banim_frame_oam 0x4000, 0x5000, 0xE0, -5, -67
	banim_frame_oam 0x4000, 0x1000, 0xE4, -21, -67
	banim_frame_oam 0x4000, 0x9000, 0xA6, -13, -59
	banim_frame_oam 0x0, 0x5000, 0xAA, -29, -59
	banim_frame_oam 0x0, 0x1000, 0xE6, -29, -67
	banim_frame_oam 0x8000, 0x8000, 0x1, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0x3, 2, -49
	banim_frame_end
banim_drz_mg1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -4, -84
	banim_frame_oam 0x0, 0x5000, 0xA4, -20, -84
	banim_frame_oam 0x4000, 0x5000, 0xE0, -4, -68
	banim_frame_oam 0x4000, 0x1000, 0xE4, -20, -68
	banim_frame_oam 0x4000, 0x9000, 0xA6, -12, -60
	banim_frame_oam 0x0, 0x5000, 0xAA, -28, -60
	banim_frame_oam 0x8000, 0x8000, 0x1, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0x3, 2, -49
	banim_frame_oam 0x4000, 0x0, 0x82, -6, -57
	banim_frame_end
banim_drz_mg1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x8C, -11, -81
	banim_frame_oam 0x8000, 0x9000, 0x90, -27, -81
	banim_frame_oam 0x0, 0x1000, 0xF2, -35, -57
	banim_frame_oam 0x4000, 0x5000, 0x92, -19, -49
	banim_frame_oam 0x0, 0x1000, 0x96, -27, -49
	banim_frame_oam 0x8000, 0x8000, 0xA, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0xC, 2, -49
	banim_frame_end
banim_drz_mg1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x8C, -12, -80
	banim_frame_oam 0x8000, 0x9000, 0x90, -28, -80
	banim_frame_oam 0x0, 0x1000, 0xF2, -36, -56
	banim_frame_oam 0x4000, 0x5000, 0x92, -20, -48
	banim_frame_oam 0x0, 0x1000, 0x96, -28, -48
	banim_frame_oam 0x8000, 0x8000, 0xA, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0xC, 2, -49
	banim_frame_end
banim_drz_mg1_oam_frame_8_l:
	banim_frame_affine -240, 87, 87, 240, 1
	banim_frame_oam 0x100, 0xC000, 0x18, -25, -94
	banim_frame_oam 0x8000, 0x8000, 0xA, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0xC, 2, -49
	banim_frame_end
banim_drz_mg1_oam_frame_9_l:
	banim_frame_affine -252, 44, 44, 252, 1
	banim_frame_oam 0x100, 0xC000, 0x18, -25, -94
	banim_frame_oam 0x8000, 0x8000, 0xA, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0xC, 2, -49
	banim_frame_end
banim_drz_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_drz_mg1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_drz_mg1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -13, -76
	banim_frame_oam 0x8000, 0x9000, 0x8, -29, -76
	banim_frame_oam 0x4000, 0x5000, 0x84, -13, -44
	banim_frame_oam 0x4000, 0x1000, 0x88, -29, -44
	banim_frame_oam 0x8000, 0x8000, 0x11, -14, -49
	banim_frame_oam 0x8000, 0x4000, 0x13, 2, -49
	banim_frame_oam 0x8000, 0x4000, 0x10, -22, -49
	banim_frame_end
banim_drz_mg1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -15, -76
	banim_frame_oam 0x8000, 0x9000, 0x8, -31, -76
	banim_frame_oam 0x4000, 0x5000, 0x84, -15, -44
	banim_frame_oam 0x4000, 0x1000, 0x88, -31, -44
	banim_frame_oam 0x0, 0x8000, 0x14, -22, -49
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_drz_mg1_oam_r:
banim_drz_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -23, -76
	banim_frame_oam 0x8000, 0x8000, 0x8, 9, -76
	banim_frame_oam 0x4000, 0x4000, 0x84, -23, -44
	banim_frame_oam 0x4000, 0x0, 0x88, 9, -44
	banim_frame_oam 0x8000, 0x9000, 0xA, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_1_r:
	banim_frame_affine 252, 44, -44, 252, 1
	banim_frame_oam 0x100, 0xC000, 0x18, -39, -94
	banim_frame_oam 0x8000, 0x9000, 0xA, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_2_r:
	banim_frame_affine 240, 87, -87, 240, 1
	banim_frame_oam 0x100, 0xC000, 0x18, -39, -96
	banim_frame_oam 0x8000, 0x9000, 0xA, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -25, -82
	banim_frame_oam 0x0, 0x4000, 0xA4, 7, -82
	banim_frame_oam 0x4000, 0x4000, 0xE0, -25, -66
	banim_frame_oam 0x4000, 0x0, 0xE4, 7, -66
	banim_frame_oam 0x4000, 0x8000, 0xA6, -17, -58
	banim_frame_oam 0x0, 0x4000, 0xAA, 15, -58
	banim_frame_oam 0x0, 0x0, 0xE6, 23, -66
	banim_frame_oam 0x8000, 0x9000, 0xD, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0xF, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -27, -83
	banim_frame_oam 0x0, 0x4000, 0xA4, 5, -83
	banim_frame_oam 0x4000, 0x4000, 0xE0, -27, -67
	banim_frame_oam 0x4000, 0x0, 0xE4, 5, -67
	banim_frame_oam 0x4000, 0x8000, 0xA6, -19, -59
	banim_frame_oam 0x0, 0x4000, 0xAA, 13, -59
	banim_frame_oam 0x0, 0x0, 0xE6, 21, -67
	banim_frame_oam 0x8000, 0x9000, 0x1, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0x3, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -28, -84
	banim_frame_oam 0x0, 0x4000, 0xA4, 4, -84
	banim_frame_oam 0x4000, 0x4000, 0xE0, -28, -68
	banim_frame_oam 0x4000, 0x0, 0xE4, 4, -68
	banim_frame_oam 0x4000, 0x8000, 0xA6, -20, -60
	banim_frame_oam 0x0, 0x4000, 0xAA, 12, -60
	banim_frame_oam 0x8000, 0x9000, 0x1, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0x3, -10, -49
	banim_frame_oam 0x4000, 0x1000, 0x82, -10, -57
	banim_frame_end
banim_drz_mg1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x8C, -21, -81
	banim_frame_oam 0x8000, 0x8000, 0x90, 11, -81
	banim_frame_oam 0x0, 0x0, 0xF2, 27, -57
	banim_frame_oam 0x4000, 0x4000, 0x92, -13, -49
	banim_frame_oam 0x0, 0x0, 0x96, 19, -49
	banim_frame_oam 0x8000, 0x9000, 0xA, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x8C, -20, -80
	banim_frame_oam 0x8000, 0x8000, 0x90, 12, -80
	banim_frame_oam 0x0, 0x0, 0xF2, 28, -56
	banim_frame_oam 0x4000, 0x4000, 0x92, -12, -48
	banim_frame_oam 0x0, 0x0, 0x96, 20, -48
	banim_frame_oam 0x8000, 0x9000, 0xA, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_8_r:
	banim_frame_affine 240, 87, -87, 240, 1
	banim_frame_oam 0x100, 0xC000, 0x18, -39, -94
	banim_frame_oam 0x8000, 0x9000, 0xA, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_9_r:
	banim_frame_affine 252, 44, -44, 252, 1
	banim_frame_oam 0x100, 0xC000, 0x18, -39, -94
	banim_frame_oam 0x8000, 0x9000, 0xA, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0xC, -10, -49
	banim_frame_end
banim_drz_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_drz_mg1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_drz_mg1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -19, -76
	banim_frame_oam 0x8000, 0x8000, 0x8, 13, -76
	banim_frame_oam 0x4000, 0x4000, 0x84, -19, -44
	banim_frame_oam 0x4000, 0x0, 0x88, 13, -44
	banim_frame_oam 0x8000, 0x9000, 0x11, -2, -49
	banim_frame_oam 0x8000, 0x5000, 0x13, -10, -49
	banim_frame_oam 0x8000, 0x5000, 0x10, 14, -49
	banim_frame_end
banim_drz_mg1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -17, -76
	banim_frame_oam 0x8000, 0x8000, 0x8, 15, -76
	banim_frame_oam 0x4000, 0x4000, 0x84, -17, -44
	banim_frame_oam 0x4000, 0x0, 0x88, 15, -44
	banim_frame_oam 0x0, 0x9000, 0x14, -10, -49
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_drz_mg1_script:
banim_drz_mg1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 1, banim_drz_mg1_oam_frame_1_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 2, banim_drz_mg1_oam_frame_2_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 3, banim_drz_mg1_oam_frame_3_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 20, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_drz_mg1_sheet_0, 6, banim_drz_mg1_oam_frame_6_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 7, banim_drz_mg1_oam_frame_7_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_drz_mg1_sheet_0, 8, banim_drz_mg1_oam_frame_8_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 9, banim_drz_mg1_oam_frame_9_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drz_mg1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 11, banim_drz_mg1_oam_frame_11_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 11, banim_drz_mg1_oam_frame_11_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 20, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_drz_mg1_sheet_0, 11, banim_drz_mg1_oam_frame_11_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 11, banim_drz_mg1_oam_frame_11_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drz_mg1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 1, banim_drz_mg1_oam_frame_1_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 2, banim_drz_mg1_oam_frame_2_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 3, banim_drz_mg1_oam_frame_3_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 3, banim_drz_mg1_oam_frame_3_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 60, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_drz_mg1_sheet_0, 6, banim_drz_mg1_oam_frame_6_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 7, banim_drz_mg1_oam_frame_7_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_drz_mg1_sheet_0, 8, banim_drz_mg1_oam_frame_8_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 9, banim_drz_mg1_oam_frame_9_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drz_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 11, banim_drz_mg1_oam_frame_11_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 11, banim_drz_mg1_oam_frame_11_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 60, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 10, banim_drz_mg1_oam_frame_10_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_drz_mg1_sheet_0, 11, banim_drz_mg1_oam_frame_11_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 11, banim_drz_mg1_oam_frame_11_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drz_mg1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 1, banim_drz_mg1_oam_frame_1_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 2, banim_drz_mg1_oam_frame_2_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 3, banim_drz_mg1_oam_frame_3_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 20, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_drz_mg1_sheet_0, 6, banim_drz_mg1_oam_frame_6_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 7, banim_drz_mg1_oam_frame_7_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_drz_mg1_sheet_0, 8, banim_drz_mg1_oam_frame_8_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 9, banim_drz_mg1_oam_frame_9_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drz_mg1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 1, banim_drz_mg1_oam_frame_1_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 2, banim_drz_mg1_oam_frame_2_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 3, banim_drz_mg1_oam_frame_3_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 3, banim_drz_mg1_oam_frame_3_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 60, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_drz_mg1_sheet_0, 6, banim_drz_mg1_oam_frame_6_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 7, banim_drz_mg1_oam_frame_7_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_drz_mg1_sheet_0, 8, banim_drz_mg1_oam_frame_8_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 9, banim_drz_mg1_oam_frame_9_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 1, banim_drz_mg1_oam_frame_1_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 2, banim_drz_mg1_oam_frame_2_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 3, banim_drz_mg1_oam_frame_3_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 20, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_drz_mg1_sheet_0, 6, banim_drz_mg1_oam_frame_6_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 7, banim_drz_mg1_oam_frame_7_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_drz_mg1_sheet_0, 8, banim_drz_mg1_oam_frame_8_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 9, banim_drz_mg1_oam_frame_9_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drz_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drz_mg1_sheet_0, 12, banim_drz_mg1_oam_frame_12_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 13, banim_drz_mg1_oam_frame_13_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drz_mg1_sheet_0, 12, banim_drz_mg1_oam_frame_12_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drz_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drz_mg1_sheet_0, 12, banim_drz_mg1_oam_frame_12_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 13, banim_drz_mg1_oam_frame_13_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drz_mg1_sheet_0, 12, banim_drz_mg1_oam_frame_12_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drz_mg1_mode_stand_close:
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drz_mg1_mode_stand:
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drz_mg1_mode_stand_range:
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drz_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drz_mg1_sheet_0, 0, banim_drz_mg1_oam_frame_0_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 1, banim_drz_mg1_oam_frame_1_r - banim_drz_mg1_oam_r
	banim_code_frame 2, banim_drz_mg1_sheet_0, 2, banim_drz_mg1_oam_frame_2_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 3, banim_drz_mg1_oam_frame_3_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 4, banim_drz_mg1_oam_frame_4_r - banim_drz_mg1_oam_r
	banim_code_frame 20, banim_drz_mg1_sheet_0, 5, banim_drz_mg1_oam_frame_5_r - banim_drz_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_drz_mg1_sheet_0, 6, banim_drz_mg1_oam_frame_6_r - banim_drz_mg1_oam_r
	banim_code_frame 1, banim_drz_mg1_sheet_0, 7, banim_drz_mg1_oam_frame_7_r - banim_drz_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_drz_mg1_sheet_0, 8, banim_drz_mg1_oam_frame_8_r - banim_drz_mg1_oam_r
	banim_code_frame 3, banim_drz_mg1_sheet_0, 9, banim_drz_mg1_oam_frame_9_r - banim_drz_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_drz_mg1_mode_attack_close - banim_drz_mg1_script
	.word banim_drz_mg1_mode_attack_close_back - banim_drz_mg1_script
	.word banim_drz_mg1_mode_attack_close_critical - banim_drz_mg1_script
	.word banim_drz_mg1_mode_attack_close_critical_back - banim_drz_mg1_script
	.word banim_drz_mg1_mode_attack_range - banim_drz_mg1_script
	.word banim_drz_mg1_mode_attack_range_critical - banim_drz_mg1_script
	.word banim_drz_mg1_mode_dodge_close - banim_drz_mg1_script
	.word banim_drz_mg1_mode_dodge_range - banim_drz_mg1_script
	.word banim_drz_mg1_mode_stand_close - banim_drz_mg1_script
	.word banim_drz_mg1_mode_stand - banim_drz_mg1_script
	.word banim_drz_mg1_mode_stand_range - banim_drz_mg1_script
	.word banim_drz_mg1_mode_attack_miss - banim_drz_mg1_script
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

