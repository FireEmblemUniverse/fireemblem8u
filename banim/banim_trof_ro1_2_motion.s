@ vim:ft=armv4
	.global banim_trof_ro1_2_script
	.global banim_trof_ro1_2_oam_r
	.global banim_trof_ro1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x85
	.section .data.oam_l
banim_trof_ro1_2_oam_l:
banim_trof_ro1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -15, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -23, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -15, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -23, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -15, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -23, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -17, -40
	banim_frame_oam 0x8000, 0x5000, 0x9, -25, -40
	banim_frame_oam 0x4000, 0x9000, 0x85, -17, -8
	banim_frame_oam 0x8000, 0x1000, 0x89, -25, -8
	banim_frame_oam 0x4000, 0x5000, 0xC5, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xC9, -25, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -11, -40
	banim_frame_oam 0x8000, 0x9000, 0xE, -27, -40
	banim_frame_oam 0x4000, 0x9000, 0x8A, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x8E, -27, -8
	banim_frame_oam 0x4000, 0x5000, 0xCA, -11, 8
	banim_frame_oam 0x4000, 0x1000, 0xCE, -27, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -17, -40
	banim_frame_oam 0x8000, 0x9000, 0x14, -33, -40
	banim_frame_oam 0x4000, 0x9000, 0x90, -17, -8
	banim_frame_oam 0x0, 0x5000, 0x94, -33, -8
	banim_frame_oam 0x4000, 0x5000, 0xD0, -17, 8
	banim_frame_oam 0x4000, 0x1000, 0xD4, -33, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x16, -21, -40
	banim_frame_oam 0x8000, 0x5000, 0x1A, -29, -40
	banim_frame_oam 0x4000, 0x9000, 0x96, -21, -8
	banim_frame_oam 0x8000, 0x1000, 0x9A, -29, -8
	banim_frame_oam 0x4000, 0x5000, 0xD6, -21, 8
	banim_frame_oam 0x0, 0x1000, 0xDA, -29, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0xC6, -11, -31
	banim_frame_oam 0x8000, 0x1000, 0xC8, -19, -31
	banim_frame_oam 0x0, 0x1000, 0xE9, -3, -39
	banim_frame_oam 0x0, 0x5000, 0x88, -11, -15
	banim_frame_oam 0x0, 0x9000, 0x0, -20, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -28, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -20, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -28, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -9, -39
	banim_frame_oam 0x8000, 0x1000, 0xA2, -17, -39
	banim_frame_oam 0x4000, 0x1000, 0xE0, -9, -23
	banim_frame_oam 0x0, 0x1000, 0xE2, -17, -23
	banim_frame_oam 0x0, 0x5000, 0xC3, -9, -15
	banim_frame_oam 0x0, 0x9000, 0x0, -20, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -28, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -20, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -28, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x5, -9, -47
	banim_frame_oam 0x8000, 0x5000, 0x7, -17, -47
	banim_frame_oam 0x0, 0x5000, 0x85, -9, -15
	banim_frame_oam 0x8000, 0x1000, 0x87, -17, -15
	banim_frame_oam 0x0, 0x9000, 0x0, -20, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -28, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -20, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -28, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -18, -40
	banim_frame_oam 0x8000, 0x5000, 0xE, -26, -40
	banim_frame_oam 0x4000, 0x9000, 0x8A, -18, -8
	banim_frame_oam 0x8000, 0x1000, 0x8E, -26, -8
	banim_frame_oam 0x4000, 0x5000, 0xCA, -18, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, -26, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -42
	banim_frame_oam 0x4000, 0x9000, 0x8F, -16, -10
	banim_frame_oam 0x4000, 0x5000, 0xCF, -16, 6
	banim_frame_end
banim_trof_ro1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x13, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x93, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xD3, -16, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -19, -40
	banim_frame_oam 0x4000, 0x9000, 0x97, -19, -8
	banim_frame_oam 0x4000, 0x5000, 0xD7, -19, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x1B, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x1F, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x9B, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x9F, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xDB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xDF, -24, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_13_l:
	banim_frame_oam 0x0, 0x5000, 0xA5, -4, -40
	banim_frame_oam 0x8000, 0x1000, 0xA7, -12, -40
	banim_frame_oam 0x4000, 0x1000, 0xE5, -4, -24
	banim_frame_oam 0x0, 0x1000, 0xE7, -12, -24
	banim_frame_oam 0x0, 0x5000, 0xC8, -4, -16
	banim_frame_oam 0x0, 0x9000, 0x5, -13, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -21, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -21, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0xCB, -2, -42
	banim_frame_oam 0x8000, 0x1000, 0xCD, -10, -42
	banim_frame_oam 0x0, 0x5000, 0xCE, -2, -26
	banim_frame_oam 0x8000, 0x1000, 0xD0, -10, -26
	banim_frame_oam 0x0, 0x1000, 0x8F, -2, -10
	banim_frame_oam 0x0, 0x9000, 0xA, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0xE, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x8A, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x8E, -16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -2, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -2, -3
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
banim_trof_ro1_2_oam_r:
banim_trof_ro1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -17, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 15, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -17, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 15, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -17, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 15, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -15, -40
	banim_frame_oam 0x8000, 0x4000, 0x9, 17, -40
	banim_frame_oam 0x4000, 0x8000, 0x85, -15, -8
	banim_frame_oam 0x8000, 0x0, 0x89, 17, -8
	banim_frame_oam 0x4000, 0x4000, 0xC5, -15, 8
	banim_frame_oam 0x0, 0x0, 0xC9, 17, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -21, -40
	banim_frame_oam 0x8000, 0x8000, 0xE, 11, -40
	banim_frame_oam 0x4000, 0x8000, 0x8A, -21, -8
	banim_frame_oam 0x0, 0x4000, 0x8E, 11, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -21, 8
	banim_frame_oam 0x4000, 0x0, 0xCE, 11, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -15, -40
	banim_frame_oam 0x8000, 0x8000, 0x14, 17, -40
	banim_frame_oam 0x4000, 0x8000, 0x90, -15, -8
	banim_frame_oam 0x0, 0x4000, 0x94, 17, -8
	banim_frame_oam 0x4000, 0x4000, 0xD0, -15, 8
	banim_frame_oam 0x4000, 0x0, 0xD4, 17, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -11, -40
	banim_frame_oam 0x8000, 0x4000, 0x1A, 21, -40
	banim_frame_oam 0x4000, 0x8000, 0x96, -11, -8
	banim_frame_oam 0x8000, 0x0, 0x9A, 21, -8
	banim_frame_oam 0x4000, 0x4000, 0xD6, -11, 8
	banim_frame_oam 0x0, 0x0, 0xDA, 21, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0xC6, -5, -31
	banim_frame_oam 0x8000, 0x0, 0xC8, 11, -31
	banim_frame_oam 0x0, 0x0, 0xE9, -5, -39
	banim_frame_oam 0x0, 0x4000, 0x88, -5, -15
	banim_frame_oam 0x0, 0x8000, 0x0, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 20, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -12, 8
	banim_frame_oam 0x0, 0x0, 0x84, 20, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -7, -39
	banim_frame_oam 0x8000, 0x0, 0xA2, 9, -39
	banim_frame_oam 0x4000, 0x0, 0xE0, -7, -23
	banim_frame_oam 0x0, 0x0, 0xE2, 9, -23
	banim_frame_oam 0x0, 0x4000, 0xC3, -7, -15
	banim_frame_oam 0x0, 0x8000, 0x0, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 20, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -12, 8
	banim_frame_oam 0x0, 0x0, 0x84, 20, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x5, -7, -47
	banim_frame_oam 0x8000, 0x4000, 0x7, 9, -47
	banim_frame_oam 0x0, 0x4000, 0x85, -7, -15
	banim_frame_oam 0x8000, 0x0, 0x87, 9, -15
	banim_frame_oam 0x0, 0x8000, 0x0, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 20, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -12, 8
	banim_frame_oam 0x0, 0x0, 0x84, 20, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -14, -40
	banim_frame_oam 0x8000, 0x4000, 0xE, 18, -40
	banim_frame_oam 0x4000, 0x8000, 0x8A, -14, -8
	banim_frame_oam 0x8000, 0x0, 0x8E, 18, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -14, 8
	banim_frame_oam 0x0, 0x0, 0xCE, 18, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -42
	banim_frame_oam 0x4000, 0x8000, 0x8F, -16, -10
	banim_frame_oam 0x4000, 0x4000, 0xCF, -16, 6
	banim_frame_end
banim_trof_ro1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x93, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD3, -16, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -13, -40
	banim_frame_oam 0x4000, 0x8000, 0x97, -13, -8
	banim_frame_oam 0x4000, 0x4000, 0xD7, -13, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x1B, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x1F, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x9B, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x9F, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xDB, -16, 8
	banim_frame_oam 0x0, 0x0, 0xDF, 16, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0xA5, -12, -40
	banim_frame_oam 0x8000, 0x0, 0xA7, 4, -40
	banim_frame_oam 0x4000, 0x0, 0xE5, -12, -24
	banim_frame_oam 0x0, 0x0, 0xE7, 4, -24
	banim_frame_oam 0x0, 0x4000, 0xC8, -12, -16
	banim_frame_oam 0x0, 0x8000, 0x5, -19, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 13, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, 13, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0xCB, -14, -42
	banim_frame_oam 0x8000, 0x0, 0xCD, 2, -42
	banim_frame_oam 0x0, 0x4000, 0xCE, -14, -26
	banim_frame_oam 0x8000, 0x0, 0xD0, 2, -26
	banim_frame_oam 0x0, 0x0, 0x8F, -6, -10
	banim_frame_oam 0x0, 0x8000, 0xA, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0xE, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x8A, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x8E, 8, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -6, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -6, -3
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
banim_trof_ro1_2_script:
banim_trof_ro1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 1, banim_trof_ro1_2_oam_frame_1_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 2, banim_trof_ro1_2_oam_frame_2_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_trof_ro1_2_sheet_0, 3, banim_trof_ro1_2_oam_frame_3_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 4, banim_trof_ro1_2_oam_frame_4_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 6, banim_trof_ro1_2_oam_frame_6_r - banim_trof_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 7, banim_trof_ro1_2_oam_frame_7_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 8, banim_trof_ro1_2_oam_frame_8_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 9, banim_trof_ro1_2_oam_frame_9_r - banim_trof_ro1_2_oam_r
	banim_code_frame 7, banim_trof_ro1_2_sheet_1, 10, banim_trof_ro1_2_oam_frame_10_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 12, banim_trof_ro1_2_oam_frame_12_r - banim_trof_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 1, banim_trof_ro1_2_oam_frame_1_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 2, banim_trof_ro1_2_oam_frame_2_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_trof_ro1_2_sheet_0, 3, banim_trof_ro1_2_oam_frame_3_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 4, banim_trof_ro1_2_oam_frame_4_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 6, banim_trof_ro1_2_oam_frame_6_r - banim_trof_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 7, banim_trof_ro1_2_oam_frame_7_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 8, banim_trof_ro1_2_oam_frame_8_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 9, banim_trof_ro1_2_oam_frame_9_r - banim_trof_ro1_2_oam_r
	banim_code_frame 7, banim_trof_ro1_2_sheet_1, 10, banim_trof_ro1_2_oam_frame_10_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 12, banim_trof_ro1_2_oam_frame_12_r - banim_trof_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 1, banim_trof_ro1_2_oam_frame_1_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 2, banim_trof_ro1_2_oam_frame_2_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_trof_ro1_2_sheet_0, 3, banim_trof_ro1_2_oam_frame_3_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 4, banim_trof_ro1_2_oam_frame_4_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 6, banim_trof_ro1_2_oam_frame_6_r - banim_trof_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 7, banim_trof_ro1_2_oam_frame_7_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 8, banim_trof_ro1_2_oam_frame_8_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 9, banim_trof_ro1_2_oam_frame_9_r - banim_trof_ro1_2_oam_r
	banim_code_frame 7, banim_trof_ro1_2_sheet_1, 10, banim_trof_ro1_2_oam_frame_10_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 12, banim_trof_ro1_2_oam_frame_12_r - banim_trof_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 1, banim_trof_ro1_2_oam_frame_1_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 2, banim_trof_ro1_2_oam_frame_2_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_trof_ro1_2_sheet_0, 3, banim_trof_ro1_2_oam_frame_3_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 4, banim_trof_ro1_2_oam_frame_4_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 6, banim_trof_ro1_2_oam_frame_6_r - banim_trof_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 7, banim_trof_ro1_2_oam_frame_7_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 8, banim_trof_ro1_2_oam_frame_8_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 9, banim_trof_ro1_2_oam_frame_9_r - banim_trof_ro1_2_oam_r
	banim_code_frame 7, banim_trof_ro1_2_sheet_1, 10, banim_trof_ro1_2_oam_frame_10_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 12, banim_trof_ro1_2_oam_frame_12_r - banim_trof_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 1, banim_trof_ro1_2_oam_frame_1_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 2, banim_trof_ro1_2_oam_frame_2_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_trof_ro1_2_sheet_0, 3, banim_trof_ro1_2_oam_frame_3_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 4, banim_trof_ro1_2_oam_frame_4_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 6, banim_trof_ro1_2_oam_frame_6_r - banim_trof_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 7, banim_trof_ro1_2_oam_frame_7_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 8, banim_trof_ro1_2_oam_frame_8_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 9, banim_trof_ro1_2_oam_frame_9_r - banim_trof_ro1_2_oam_r
	banim_code_frame 7, banim_trof_ro1_2_sheet_1, 10, banim_trof_ro1_2_oam_frame_10_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 12, banim_trof_ro1_2_oam_frame_12_r - banim_trof_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 1, banim_trof_ro1_2_oam_frame_1_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 2, banim_trof_ro1_2_oam_frame_2_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_trof_ro1_2_sheet_0, 3, banim_trof_ro1_2_oam_frame_3_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 4, banim_trof_ro1_2_oam_frame_4_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 6, banim_trof_ro1_2_oam_frame_6_r - banim_trof_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 7, banim_trof_ro1_2_oam_frame_7_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 8, banim_trof_ro1_2_oam_frame_8_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 9, banim_trof_ro1_2_oam_frame_9_r - banim_trof_ro1_2_oam_r
	banim_code_frame 7, banim_trof_ro1_2_sheet_1, 10, banim_trof_ro1_2_oam_frame_10_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 12, banim_trof_ro1_2_oam_frame_12_r - banim_trof_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 13, banim_trof_ro1_2_oam_frame_13_r - banim_trof_ro1_2_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 14, banim_trof_ro1_2_oam_frame_14_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 13, banim_trof_ro1_2_oam_frame_13_r - banim_trof_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_trof_ro1_sheet_0, 13, banim_trof_ro1_2_oam_frame_13_r - banim_trof_ro1_2_oam_r
	banim_code_frame 1, banim_trof_ro1_sheet_0, 14, banim_trof_ro1_2_oam_frame_14_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_trof_ro1_sheet_0, 13, banim_trof_ro1_2_oam_frame_13_r - banim_trof_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_trof_ro1_2_mode_stand_close:
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_trof_ro1_2_mode_stand:
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_trof_ro1_2_mode_stand_range:
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_trof_ro1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_trof_ro1_2_sheet_0, 0, banim_trof_ro1_2_oam_frame_0_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 1, banim_trof_ro1_2_oam_frame_1_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 2, banim_trof_ro1_2_oam_frame_2_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_trof_ro1_2_sheet_0, 3, banim_trof_ro1_2_oam_frame_3_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_0, 4, banim_trof_ro1_2_oam_frame_4_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 10, banim_trof_ro1_2_sheet_1, 6, banim_trof_ro1_2_oam_frame_6_r - banim_trof_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 7, banim_trof_ro1_2_oam_frame_7_r - banim_trof_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 5, banim_trof_ro1_2_oam_frame_5_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 8, banim_trof_ro1_2_oam_frame_8_r - banim_trof_ro1_2_oam_r
	banim_code_frame 4, banim_trof_ro1_2_sheet_1, 9, banim_trof_ro1_2_oam_frame_9_r - banim_trof_ro1_2_oam_r
	banim_code_frame 7, banim_trof_ro1_2_sheet_1, 10, banim_trof_ro1_2_oam_frame_10_r - banim_trof_ro1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 1, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 11, banim_trof_ro1_2_oam_frame_11_r - banim_trof_ro1_2_oam_r
	banim_code_frame 3, banim_trof_ro1_2_sheet_1, 12, banim_trof_ro1_2_oam_frame_12_r - banim_trof_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_trof_ro1_2_mode_attack_close - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_attack_close_back - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_attack_close_critical - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_attack_close_critical_back - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_attack_range - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_attack_range_critical - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_dodge_close - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_dodge_range - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_stand_close - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_stand - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_stand_range - banim_trof_ro1_2_script
	.word banim_trof_ro1_2_mode_attack_miss - banim_trof_ro1_2_script
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

