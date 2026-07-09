@ vim:ft=armv4
	.global banim_valf_mg1_script
	.global banim_valf_mg1_oam_r
	.global banim_valf_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x86
	.section .data.oam_l
banim_valf_mg1_oam_l:
banim_valf_mg1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -6, -31
	banim_frame_oam 0x8000, 0x1000, 0xA2, -14, -31
	banim_frame_oam 0x0, 0x5000, 0xA3, -6, -15
	banim_frame_oam 0x4000, 0x1000, 0xE3, -6, 1
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_valf_mg1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, -5, -33
	banim_frame_oam 0x0, 0x1000, 0x8F, -1, -1
	banim_frame_oam 0x0, 0x9000, 0x5, -13, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -21, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -21, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -21, -32
	banim_frame_end
banim_valf_mg1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, -2, -34
	banim_frame_oam 0x0, 0x1000, 0x8F, 1, -2
	banim_frame_oam 0x0, 0x9000, 0xA, -10, -26
	banim_frame_oam 0x8000, 0x5000, 0xE, -18, -26
	banim_frame_oam 0x4000, 0x5000, 0x8A, -10, 6
	banim_frame_oam 0x0, 0x1000, 0x8E, -18, 6
	banim_frame_oam 0x4000, 0x1000, 0xA9, -18, -34
	banim_frame_end
banim_valf_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x72, -10, -28
	banim_frame_oam 0x4000, 0x1000, 0x65, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x4000, 0x1000, 0x5, -10, -36
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_valf_mg1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x5, -10, -36
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x0, 0x1000, 0x86, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_valf_mg1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA, -16, -32
	banim_frame_end
banim_valf_mg1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x2A, -12, -36
	banim_frame_oam 0x0, 0x0, 0x2A, -20, -36
	banim_frame_oam 0x0, 0x3000, 0x2A, -12, -28
	banim_frame_oam 0x0, 0x2000, 0x2A, -20, -28
	banim_frame_end
banim_valf_mg1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xB, -13, -36
	banim_frame_oam 0x0, 0x0, 0xB, -21, -36
	banim_frame_oam 0x0, 0x3000, 0xB, -13, -28
	banim_frame_oam 0x0, 0x2000, 0xB, -21, -28
	banim_frame_end
banim_valf_mg1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x2B, -15, -46
	banim_frame_oam 0x0, 0x1000, 0x4A, -7, -38
	banim_frame_oam 0x8000, 0x0, 0x2B, -23, -46
	banim_frame_oam 0x0, 0x0, 0x4A, -31, -38
	banim_frame_oam 0x8000, 0x3000, 0x2B, -15, -30
	banim_frame_oam 0x0, 0x3000, 0x4A, -7, -30
	banim_frame_oam 0x8000, 0x2000, 0x2B, -23, -30
	banim_frame_oam 0x0, 0x2000, 0x4A, -31, -30
	banim_frame_end
banim_valf_mg1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x6A, -23, -46
	banim_frame_oam 0x4000, 0x1000, 0xAB, -15, -30
	banim_frame_oam 0x0, 0x1000, 0xAD, -23, -30
	banim_frame_oam 0x4000, 0x1000, 0xCC, -23, -22
	banim_frame_oam 0x8000, 0x1000, 0xAA, -31, -38
	banim_frame_end
banim_valf_mg1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE, -15, -46
	banim_frame_oam 0x0, 0x1000, 0x10, -23, -46
	banim_frame_oam 0x4000, 0x5000, 0x2E, -31, -38
	banim_frame_oam 0x4000, 0x5000, 0x4E, -31, -30
	banim_frame_oam 0x8000, 0x1000, 0x2D, -39, -30
	banim_frame_oam 0x0, 0x1000, 0x4C, 1, -46
	banim_frame_oam 0x4000, 0x1000, 0xC, -23, -22
	banim_frame_end
banim_valf_mg1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x6E, -27, -45
	banim_frame_oam 0x4000, 0x1000, 0xAF, -19, -29
	banim_frame_oam 0x0, 0x1000, 0xB1, -27, -29
	banim_frame_oam 0x4000, 0x1000, 0xCF, -19, -21
	banim_frame_oam 0x0, 0x1000, 0xD1, -27, -21
	banim_frame_oam 0x8000, 0x1000, 0xAE, -35, -29
	banim_frame_end
banim_valf_mg1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x4000, 0x8000, 0x6A, -39, -46
	banim_frame_oam 0x4000, 0x0, 0xAB, -31, -30
	banim_frame_oam 0x0, 0x0, 0xAD, -15, -30
	banim_frame_oam 0x4000, 0x0, 0xCC, -23, -22
	banim_frame_oam 0x8000, 0x0, 0xAA, -7, -38
	banim_frame_end
banim_valf_mg1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xE, -31, -46
	banim_frame_oam 0x0, 0x0, 0x10, -15, -46
	banim_frame_oam 0x4000, 0x4000, 0x2E, -31, -38
	banim_frame_oam 0x4000, 0x4000, 0x4E, -31, -30
	banim_frame_oam 0x8000, 0x0, 0x2D, 1, -30
	banim_frame_oam 0x0, 0x0, 0x4C, -39, -46
	banim_frame_oam 0x4000, 0x0, 0xC, -23, -22
	banim_frame_end
banim_valf_mg1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x4000, 0x8000, 0x6E, -35, -45
	banim_frame_oam 0x4000, 0x0, 0xAF, -27, -29
	banim_frame_oam 0x0, 0x0, 0xB1, -11, -29
	banim_frame_oam 0x4000, 0x0, 0xCF, -27, -21
	banim_frame_oam 0x0, 0x0, 0xD1, -11, -21
	banim_frame_oam 0x8000, 0x0, 0xAE, -3, -29
	banim_frame_end
banim_valf_mg1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x4000, 0x1000, 0x65, -10, -12
	banim_frame_oam 0x0, 0x5000, 0x32, -10, -28
	banim_frame_oam 0x4000, 0x1000, 0x5, -12, -36
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x55, -18, -28
	banim_frame_end
banim_valf_mg1_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -3, -37
	banim_frame_oam 0x0, 0x1000, 0x88, -3, -5
	banim_frame_oam 0x8000, 0x1000, 0x29, -11, -29
	banim_frame_oam 0x0, 0x1000, 0x69, -11, -13
	banim_frame_oam 0x8000, 0x1000, 0xC8, 13, -21
	banim_frame_oam 0x4000, 0x1000, 0xA7, -27, -29
	banim_frame_oam 0x0, 0x1000, 0xA6, -19, -13
	banim_frame_oam 0x0, 0x1000, 0x87, -19, -21
	banim_frame_oam 0x0, 0x1000, 0x89, -27, -21
	banim_frame_oam 0x0, 0x1000, 0x9, -27, -37
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_valf_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0xA4, -4, -36
	banim_frame_oam 0x4000, 0x1000, 0xE4, -4, -20
	banim_frame_oam 0x0, 0x1000, 0xE6, -12, -20
	banim_frame_oam 0x8000, 0x1000, 0xC7, -3, -12
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -12, -28
	banim_frame_end
banim_valf_mg1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, -7, -31
	banim_frame_oam 0x4000, 0x1000, 0x9C, -7, 1
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_valf_mg1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xEC, -16, -30
	banim_frame_oam 0x4000, 0x1000, 0xEE, -16, -22
	banim_frame_oam 0x0, 0x1000, 0xF2, 0, -30
	banim_frame_oam 0x8000, 0x1000, 0xB2, -16, -14
	banim_frame_oam 0x4000, 0x0, 0xEC, -31, -30
	banim_frame_oam 0x4000, 0x0, 0xEE, -31, -22
	banim_frame_oam 0x0, 0x0, 0xF2, -39, -30
	banim_frame_oam 0x8000, 0x0, 0xB2, -23, -14
	banim_frame_oam 0x4000, 0x2000, 0xEC, -31, -37
	banim_frame_oam 0x4000, 0x2000, 0xEE, -31, -45
	banim_frame_oam 0x0, 0x2000, 0xF2, -39, -37
	banim_frame_oam 0x8000, 0x2000, 0xB2, -23, -61
	banim_frame_oam 0x4000, 0x3000, 0xEC, -16, -37
	banim_frame_oam 0x4000, 0x3000, 0xEE, -16, -45
	banim_frame_oam 0x0, 0x3000, 0xF2, 0, -37
	banim_frame_oam 0x8000, 0x3000, 0xB2, -16, -61
	banim_frame_end
banim_valf_mg1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x11, 0, -53
	banim_frame_oam 0x4000, 0x1000, 0x12, -16, -45
	banim_frame_oam 0x0, 0x1000, 0xEB, -8, -37
	banim_frame_oam 0x0, 0x1000, 0x2C, -16, -37
	banim_frame_oam 0x0, 0x0, 0x11, -40, -53
	banim_frame_oam 0x4000, 0x0, 0x12, -32, -45
	banim_frame_oam 0x0, 0x0, 0xEB, -32, -37
	banim_frame_oam 0x0, 0x0, 0x2C, -24, -37
	banim_frame_oam 0x0, 0x3000, 0x11, 0, -13
	banim_frame_oam 0x4000, 0x3000, 0x12, -16, -21
	banim_frame_oam 0x0, 0x3000, 0xEB, -8, -29
	banim_frame_oam 0x0, 0x3000, 0x2C, -16, -29
	banim_frame_oam 0x0, 0x2000, 0x11, -40, -13
	banim_frame_oam 0x4000, 0x2000, 0x12, -32, -21
	banim_frame_oam 0x0, 0x2000, 0xEB, -32, -29
	banim_frame_oam 0x0, 0x2000, 0x2C, -24, -29
	banim_frame_end
banim_valf_mg1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x5000, 0x14, -16, -45
	banim_frame_oam 0x0, 0x4000, 0x14, -32, -45
	banim_frame_oam 0x0, 0x7000, 0x14, -16, -29
	banim_frame_oam 0x0, 0x6000, 0x14, -32, -29
	banim_frame_end
banim_valf_mg1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x74, -31, -30
	banim_frame_oam 0x0, 0x0, 0x95, -23, -22
	banim_frame_oam 0x4000, 0x1000, 0x74, -15, -30
	banim_frame_oam 0x0, 0x1000, 0x95, -15, -22
	banim_frame_oam 0x4000, 0x2000, 0x74, -31, -38
	banim_frame_oam 0x0, 0x2000, 0x95, -23, -46
	banim_frame_oam 0x4000, 0x3000, 0x74, -15, -38
	banim_frame_oam 0x0, 0x3000, 0x95, -15, -46
	banim_frame_end
banim_valf_mg1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -10, -12
	banim_frame_oam 0x0, 0x1000, 0x85, -2, -4
	banim_frame_oam 0x8000, 0x1000, 0xA9, -10, -36
	banim_frame_oam 0x0, 0x1000, 0xE9, -10, -20
	banim_frame_oam 0x8000, 0x5000, 0x5, -2, -36
	banim_frame_oam 0x0, 0x1000, 0xEA, -18, -31
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x54, -13, -36
	banim_frame_oam 0x0, 0x0, 0x54, -21, -36
	banim_frame_oam 0x0, 0x3000, 0x54, -13, -28
	banim_frame_oam 0x0, 0x2000, 0x54, -21, -28
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
banim_valf_mg1_oam_frame_12_l:
	banim_frame_end
	.section .data.oam_r
banim_valf_mg1_oam_r:
banim_valf_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -10, -31
	banim_frame_oam 0x8000, 0x0, 0xA2, 6, -31
	banim_frame_oam 0x0, 0x4000, 0xA3, -10, -15
	banim_frame_oam 0x4000, 0x0, 0xE3, -10, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_valf_mg1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -11, -33
	banim_frame_oam 0x0, 0x0, 0x8F, -7, -1
	banim_frame_oam 0x0, 0x8000, 0x5, -19, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 13, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, 13, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 13, -32
	banim_frame_end
banim_valf_mg1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, -14, -34
	banim_frame_oam 0x0, 0x0, 0x8F, -9, -2
	banim_frame_oam 0x0, 0x8000, 0xA, -22, -26
	banim_frame_oam 0x8000, 0x4000, 0xE, 10, -26
	banim_frame_oam 0x4000, 0x4000, 0x8A, -22, 6
	banim_frame_oam 0x0, 0x0, 0x8E, 10, 6
	banim_frame_oam 0x4000, 0x0, 0xA9, 2, -34
	banim_frame_end
banim_valf_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x72, -6, -28
	banim_frame_oam 0x4000, 0x0, 0x65, -6, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x4000, 0x0, 0x5, -6, -36
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_valf_mg1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x0, 0x0, 0x86, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_valf_mg1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0xA, 8, -32
	banim_frame_end
banim_valf_mg1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0x2A, 4, -36
	banim_frame_oam 0x0, 0x1000, 0x2A, 12, -36
	banim_frame_oam 0x0, 0x2000, 0x2A, 4, -28
	banim_frame_oam 0x0, 0x3000, 0x2A, 12, -28
	banim_frame_end
banim_valf_mg1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0xB, 5, -36
	banim_frame_oam 0x0, 0x1000, 0xB, 13, -36
	banim_frame_oam 0x0, 0x2000, 0xB, 5, -28
	banim_frame_oam 0x0, 0x3000, 0xB, 13, -28
	banim_frame_end
banim_valf_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x2B, 7, -46
	banim_frame_oam 0x0, 0x0, 0x4A, -1, -38
	banim_frame_oam 0x8000, 0x1000, 0x2B, 15, -46
	banim_frame_oam 0x0, 0x1000, 0x4A, 23, -38
	banim_frame_oam 0x8000, 0x2000, 0x2B, 7, -30
	banim_frame_oam 0x0, 0x2000, 0x4A, -1, -30
	banim_frame_oam 0x8000, 0x3000, 0x2B, 15, -30
	banim_frame_oam 0x0, 0x3000, 0x4A, 23, -30
	banim_frame_end
banim_valf_mg1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0x6A, -9, -46
	banim_frame_oam 0x4000, 0x0, 0xAB, -1, -30
	banim_frame_oam 0x0, 0x0, 0xAD, 15, -30
	banim_frame_oam 0x4000, 0x0, 0xCC, 7, -22
	banim_frame_oam 0x8000, 0x0, 0xAA, 23, -38
	banim_frame_end
banim_valf_mg1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE, -1, -46
	banim_frame_oam 0x0, 0x0, 0x10, 15, -46
	banim_frame_oam 0x4000, 0x4000, 0x2E, -1, -38
	banim_frame_oam 0x4000, 0x4000, 0x4E, -1, -30
	banim_frame_oam 0x8000, 0x0, 0x2D, 31, -30
	banim_frame_oam 0x0, 0x0, 0x4C, -9, -46
	banim_frame_oam 0x4000, 0x0, 0xC, 7, -22
	banim_frame_end
banim_valf_mg1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0x6E, -5, -45
	banim_frame_oam 0x4000, 0x0, 0xAF, 3, -29
	banim_frame_oam 0x0, 0x0, 0xB1, 19, -29
	banim_frame_oam 0x4000, 0x0, 0xCF, 3, -21
	banim_frame_oam 0x0, 0x0, 0xD1, 19, -21
	banim_frame_oam 0x8000, 0x0, 0xAE, 27, -29
	banim_frame_end
banim_valf_mg1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x4000, 0x9000, 0x6A, 7, -46
	banim_frame_oam 0x4000, 0x1000, 0xAB, 15, -30
	banim_frame_oam 0x0, 0x1000, 0xAD, 7, -30
	banim_frame_oam 0x4000, 0x1000, 0xCC, 7, -22
	banim_frame_oam 0x8000, 0x1000, 0xAA, -1, -38
	banim_frame_end
banim_valf_mg1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0xE, 15, -46
	banim_frame_oam 0x0, 0x1000, 0x10, 7, -46
	banim_frame_oam 0x4000, 0x5000, 0x2E, -1, -38
	banim_frame_oam 0x4000, 0x5000, 0x4E, -1, -30
	banim_frame_oam 0x8000, 0x1000, 0x2D, -9, -30
	banim_frame_oam 0x0, 0x1000, 0x4C, 31, -46
	banim_frame_oam 0x4000, 0x1000, 0xC, 7, -22
	banim_frame_end
banim_valf_mg1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x4000, 0x9000, 0x6E, 3, -45
	banim_frame_oam 0x4000, 0x1000, 0xAF, 11, -29
	banim_frame_oam 0x0, 0x1000, 0xB1, 3, -29
	banim_frame_oam 0x4000, 0x1000, 0xCF, 11, -21
	banim_frame_oam 0x0, 0x1000, 0xD1, 3, -21
	banim_frame_oam 0x8000, 0x1000, 0xAE, -5, -29
	banim_frame_end
banim_valf_mg1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x4000, 0x0, 0x65, -6, -12
	banim_frame_oam 0x0, 0x4000, 0x32, -6, -28
	banim_frame_oam 0x4000, 0x0, 0x5, -4, -36
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0x55, 10, -28
	banim_frame_end
banim_valf_mg1_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -13, -37
	banim_frame_oam 0x0, 0x0, 0x88, -5, -5
	banim_frame_oam 0x8000, 0x0, 0x29, 3, -29
	banim_frame_oam 0x0, 0x0, 0x69, 3, -13
	banim_frame_oam 0x8000, 0x0, 0xC8, -21, -21
	banim_frame_oam 0x4000, 0x0, 0xA7, 11, -29
	banim_frame_oam 0x0, 0x0, 0xA6, 11, -13
	banim_frame_oam 0x0, 0x0, 0x87, 11, -21
	banim_frame_oam 0x0, 0x0, 0x89, 19, -21
	banim_frame_oam 0x0, 0x0, 0x9, 19, -37
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_valf_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0xA4, -12, -36
	banim_frame_oam 0x4000, 0x0, 0xE4, -12, -20
	banim_frame_oam 0x0, 0x0, 0xE6, 4, -20
	banim_frame_oam 0x8000, 0x0, 0xC7, -5, -12
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 4, -28
	banim_frame_end
banim_valf_mg1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -9, -31
	banim_frame_oam 0x4000, 0x0, 0x9C, -9, 1
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_valf_mg1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xEC, 0, -30
	banim_frame_oam 0x4000, 0x0, 0xEE, 0, -22
	banim_frame_oam 0x0, 0x0, 0xF2, -8, -30
	banim_frame_oam 0x8000, 0x0, 0xB2, 8, -14
	banim_frame_oam 0x4000, 0x1000, 0xEC, 15, -30
	banim_frame_oam 0x4000, 0x1000, 0xEE, 15, -22
	banim_frame_oam 0x0, 0x1000, 0xF2, 31, -30
	banim_frame_oam 0x8000, 0x1000, 0xB2, 15, -14
	banim_frame_oam 0x4000, 0x3000, 0xEC, 15, -37
	banim_frame_oam 0x4000, 0x3000, 0xEE, 15, -45
	banim_frame_oam 0x0, 0x3000, 0xF2, 31, -37
	banim_frame_oam 0x8000, 0x3000, 0xB2, 15, -61
	banim_frame_oam 0x4000, 0x2000, 0xEC, 0, -37
	banim_frame_oam 0x4000, 0x2000, 0xEE, 0, -45
	banim_frame_oam 0x0, 0x2000, 0xF2, -8, -37
	banim_frame_oam 0x8000, 0x2000, 0xB2, 8, -61
	banim_frame_end
banim_valf_mg1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0x11, -8, -53
	banim_frame_oam 0x4000, 0x0, 0x12, 0, -45
	banim_frame_oam 0x0, 0x0, 0xEB, 0, -37
	banim_frame_oam 0x0, 0x0, 0x2C, 8, -37
	banim_frame_oam 0x0, 0x1000, 0x11, 32, -53
	banim_frame_oam 0x4000, 0x1000, 0x12, 16, -45
	banim_frame_oam 0x0, 0x1000, 0xEB, 24, -37
	banim_frame_oam 0x0, 0x1000, 0x2C, 16, -37
	banim_frame_oam 0x0, 0x2000, 0x11, -8, -13
	banim_frame_oam 0x4000, 0x2000, 0x12, 0, -21
	banim_frame_oam 0x0, 0x2000, 0xEB, 0, -29
	banim_frame_oam 0x0, 0x2000, 0x2C, 8, -29
	banim_frame_oam 0x0, 0x3000, 0x11, 32, -13
	banim_frame_oam 0x4000, 0x3000, 0x12, 16, -21
	banim_frame_oam 0x0, 0x3000, 0xEB, 24, -29
	banim_frame_oam 0x0, 0x3000, 0x2C, 16, -29
	banim_frame_end
banim_valf_mg1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x14, 0, -45
	banim_frame_oam 0x0, 0x5000, 0x14, 16, -45
	banim_frame_oam 0x0, 0x6000, 0x14, 0, -29
	banim_frame_oam 0x0, 0x7000, 0x14, 16, -29
	banim_frame_end
banim_valf_mg1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0x74, 15, -30
	banim_frame_oam 0x0, 0x1000, 0x95, 15, -22
	banim_frame_oam 0x4000, 0x0, 0x74, -1, -30
	banim_frame_oam 0x0, 0x0, 0x95, 7, -22
	banim_frame_oam 0x4000, 0x3000, 0x74, 15, -38
	banim_frame_oam 0x0, 0x3000, 0x95, 15, -46
	banim_frame_oam 0x4000, 0x2000, 0x74, -1, -38
	banim_frame_oam 0x0, 0x2000, 0x95, 7, -46
	banim_frame_end
banim_valf_mg1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x0, 0x66, 2, -12
	banim_frame_oam 0x0, 0x0, 0x85, -6, -4
	banim_frame_oam 0x8000, 0x0, 0xA9, 2, -36
	banim_frame_oam 0x0, 0x0, 0xE9, 2, -20
	banim_frame_oam 0x8000, 0x4000, 0x5, -6, -36
	banim_frame_oam 0x0, 0x0, 0xEA, 10, -31
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0x54, 5, -36
	banim_frame_oam 0x0, 0x1000, 0x54, 13, -36
	banim_frame_oam 0x0, 0x2000, 0x54, 5, -28
	banim_frame_oam 0x0, 0x3000, 0x54, 13, -28
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
banim_valf_mg1_oam_frame_12_r:
	banim_frame_end
	.section .data.script
banim_valf_mg1_script:
banim_valf_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_2, 74, banim_valf_mg1_oam_frame_12_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 19, banim_valf_mg1_oam_frame_19_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 20, banim_valf_mg1_oam_frame_20_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 21, banim_valf_mg1_oam_frame_21_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 22, banim_valf_mg1_oam_frame_22_r - banim_valf_mg1_oam_r
	banim_code_frame 8, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 19, banim_valf_mg1_oam_frame_19_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 20, banim_valf_mg1_oam_frame_20_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 21, banim_valf_mg1_oam_frame_21_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 22, banim_valf_mg1_oam_frame_22_r - banim_valf_mg1_oam_r
	banim_code_frame 8, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 9, banim_valf_mg1_oam_frame_13_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 10, banim_valf_mg1_oam_frame_14_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 11, banim_valf_mg1_oam_frame_15_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 12, banim_valf_mg1_oam_frame_16_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 13, banim_valf_mg1_oam_frame_17_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 14, banim_valf_mg1_oam_frame_18_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 19, banim_valf_mg1_oam_frame_19_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 20, banim_valf_mg1_oam_frame_20_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 21, banim_valf_mg1_oam_frame_21_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 22, banim_valf_mg1_oam_frame_22_r - banim_valf_mg1_oam_r
	banim_code_frame 8, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_valf_mg1_sheet_0, 1, banim_valf_mg1_oam_frame_23_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_0, 2, banim_valf_mg1_oam_frame_24_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_valf_mg1_sheet_0, 1, banim_valf_mg1_oam_frame_23_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_valf_mg1_sheet_0, 1, banim_valf_mg1_oam_frame_23_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_0, 2, banim_valf_mg1_oam_frame_24_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_valf_mg1_sheet_0, 1, banim_valf_mg1_oam_frame_23_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_valf_mg1_mode_stand_close:
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_valf_mg1_mode_stand:
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_valf_mg1_mode_stand_range:
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_valf_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_valf_mg1_sheet_0, 0, banim_valf_mg1_oam_frame_0_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 3, banim_valf_mg1_oam_frame_1_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_sound_magic_valkyrie
	banim_code_frame 2, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 23, banim_valf_mg1_oam_frame_6_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 8, banim_valf_mg1_oam_frame_7_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 7, banim_valf_mg1_oam_frame_5_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 6, banim_valf_mg1_oam_frame_4_r - banim_valf_mg1_oam_r
	banim_code_frame 1, banim_valf_mg1_sheet_1, 5, banim_valf_mg1_oam_frame_3_r - banim_valf_mg1_oam_r
	banim_code_frame 2, banim_valf_mg1_sheet_1, 4, banim_valf_mg1_oam_frame_2_r - banim_valf_mg1_oam_r
	banim_code_frame 10, banim_valf_mg1_sheet_1, 15, banim_valf_mg1_oam_frame_8_r - banim_valf_mg1_oam_r
	banim_code_frame 3, banim_valf_mg1_sheet_1, 16, banim_valf_mg1_oam_frame_9_r - banim_valf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_valf_mg1_sheet_1, 17, banim_valf_mg1_oam_frame_10_r - banim_valf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_valf_mg1_sheet_1, 18, banim_valf_mg1_oam_frame_11_r - banim_valf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_valf_mg1_mode_attack_close - banim_valf_mg1_script
	.word banim_valf_mg1_mode_attack_close_back - banim_valf_mg1_script
	.word banim_valf_mg1_mode_attack_close_critical - banim_valf_mg1_script
	.word banim_valf_mg1_mode_attack_close_critical_back - banim_valf_mg1_script
	.word banim_valf_mg1_mode_attack_range - banim_valf_mg1_script
	.word banim_valf_mg1_mode_attack_range_critical - banim_valf_mg1_script
	.word banim_valf_mg1_mode_dodge_close - banim_valf_mg1_script
	.word banim_valf_mg1_mode_dodge_range - banim_valf_mg1_script
	.word banim_valf_mg1_mode_stand_close - banim_valf_mg1_script
	.word banim_valf_mg1_mode_stand - banim_valf_mg1_script
	.word banim_valf_mg1_mode_stand_range - banim_valf_mg1_script
	.word banim_valf_mg1_mode_attack_miss - banim_valf_mg1_script
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

