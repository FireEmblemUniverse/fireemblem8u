@ vim:ft=armv4
	.global banim_bae_at1_2_script
	.global banim_bae_at1_2_oam_r
	.global banim_bae_at1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xAC
	.section .data.oam_l
banim_bae_at1_2_oam_l:
banim_bae_at1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -32, -38
	banim_frame_oam 0x8000, 0x5000, 0x8, -40, -38
	banim_frame_oam 0x8000, 0x5000, 0x88, -40, -6
	banim_frame_end
banim_bae_at1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0xD000, 0x9, -26, -38
	banim_frame_oam 0x8000, 0x5000, 0x11, -34, -38
	banim_frame_oam 0x4000, 0x9000, 0x89, 6, -6
	banim_frame_oam 0x4000, 0x9000, 0x8D, -26, -6
	banim_frame_oam 0x8000, 0x1000, 0x91, -34, -6
	banim_frame_oam 0x4000, 0x5000, 0xC9, 6, 10
	banim_frame_oam 0x4000, 0x5000, 0xCD, -26, 10
	banim_frame_oam 0x0, 0x1000, 0xD1, -34, 10
	banim_frame_oam 0x0, 0x1000, 0x3F, -8, 18
	banim_frame_end
banim_bae_at1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x16, -9, -41
	banim_frame_oam 0x8000, 0x9000, 0x1A, -25, -41
	banim_frame_oam 0x8000, 0x5000, 0x1C, -33, -41
	banim_frame_oam 0x4000, 0x9000, 0x96, -9, -9
	banim_frame_oam 0x0, 0x5000, 0x9A, -25, -9
	banim_frame_oam 0x8000, 0x1000, 0x9C, -33, -9
	banim_frame_oam 0x4000, 0x5000, 0xD6, -9, 7
	banim_frame_oam 0x4000, 0x1000, 0xDA, -25, 7
	banim_frame_oam 0x0, 0x1000, 0xDC, -33, 7
	banim_frame_oam 0x0, 0x9000, 0x52, 23, -25
	banim_frame_oam 0x4000, 0x5000, 0xD2, 23, 7
	banim_frame_oam 0x4000, 0x5000, 0xF8, -25, 15
	banim_frame_end
banim_bae_at1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0x0, 40, 14
	banim_frame_oam 0x4000, 0x5000, 0x1, 0, -42
	banim_frame_oam 0x4000, 0x5000, 0x5, -32, -42
	banim_frame_oam 0x4000, 0xD000, 0x20, -24, -34
	banim_frame_oam 0x8000, 0x5000, 0x28, -32, -34
	banim_frame_oam 0x4000, 0x9000, 0xA0, 8, -2
	banim_frame_oam 0x4000, 0x9000, 0xA4, -24, -2
	banim_frame_oam 0x8000, 0x1000, 0xA8, -32, -2
	banim_frame_oam 0x4000, 0x5000, 0xE0, 8, 14
	banim_frame_oam 0x4000, 0x5000, 0xE4, -24, 14
	banim_frame_oam 0x0, 0x1000, 0xE8, -32, 14
	banim_frame_end
banim_bae_at1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -26, -42
	banim_frame_oam 0x8000, 0x5000, 0x8, -34, -42
	banim_frame_oam 0x8000, 0x5000, 0x88, -34, -10
	banim_frame_end
banim_bae_at1_2_oam_frame_5_l:
	banim_frame_oam 0x4000, 0xD000, 0x9, -22, -43
	banim_frame_oam 0x8000, 0x5000, 0x11, -30, -43
	banim_frame_oam 0x4000, 0x9000, 0x89, 10, -11
	banim_frame_oam 0x4000, 0x9000, 0x8D, -22, -11
	banim_frame_oam 0x8000, 0x1000, 0x91, -30, -11
	banim_frame_oam 0x4000, 0x5000, 0xC9, 10, 5
	banim_frame_oam 0x4000, 0x5000, 0xCD, -22, 5
	banim_frame_oam 0x0, 0x1000, 0xD1, -30, 5
	banim_frame_oam 0x0, 0x1000, 0x3F, -4, 13
	banim_frame_end
banim_bae_at1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x16, -5, -43
	banim_frame_oam 0x8000, 0x9000, 0x1A, -21, -43
	banim_frame_oam 0x8000, 0x5000, 0x1C, -29, -43
	banim_frame_oam 0x4000, 0x9000, 0x96, -5, -11
	banim_frame_oam 0x0, 0x5000, 0x9A, -21, -11
	banim_frame_oam 0x8000, 0x1000, 0x9C, -29, -11
	banim_frame_oam 0x4000, 0x5000, 0xD6, -5, 5
	banim_frame_oam 0x4000, 0x1000, 0xDA, -21, 5
	banim_frame_oam 0x0, 0x1000, 0xDC, -29, 5
	banim_frame_oam 0x0, 0x9000, 0x52, 27, -27
	banim_frame_oam 0x4000, 0x5000, 0xD2, 27, 5
	banim_frame_oam 0x4000, 0x5000, 0xF8, -21, 13
	banim_frame_end
banim_bae_at1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0x0, 44, 13
	banim_frame_oam 0x4000, 0x5000, 0x1, 4, -43
	banim_frame_oam 0x4000, 0x5000, 0x5, -28, -43
	banim_frame_oam 0x4000, 0xD000, 0x20, -20, -35
	banim_frame_oam 0x8000, 0x5000, 0x28, -28, -35
	banim_frame_oam 0x4000, 0x9000, 0xA0, 12, -3
	banim_frame_oam 0x4000, 0x9000, 0xA4, -20, -3
	banim_frame_oam 0x8000, 0x1000, 0xA8, -28, -3
	banim_frame_oam 0x4000, 0x5000, 0xE0, 12, 13
	banim_frame_oam 0x4000, 0x5000, 0xE4, -20, 13
	banim_frame_oam 0x0, 0x1000, 0xE8, -28, 13
	banim_frame_end
banim_bae_at1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -14, -43
	banim_frame_oam 0x8000, 0x5000, 0x8, -22, -43
	banim_frame_oam 0x8000, 0x5000, 0x88, -22, -11
	banim_frame_end
banim_bae_at1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0xD000, 0x9, -17, -42
	banim_frame_oam 0x8000, 0x9000, 0x11, -33, -42
	banim_frame_oam 0x8000, 0x9000, 0x91, -33, -10
	banim_frame_end
banim_bae_at1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0xD000, 0x13, -17, -42
	banim_frame_oam 0x8000, 0x9000, 0x1B, -33, -42
	banim_frame_oam 0x8000, 0x9000, 0x9B, -33, -10
	banim_frame_oam 0x4000, 0x1000, 0x1D, 15, -50
	banim_frame_oam 0x0, 0x1000, 0x3F, 7, -50
	banim_frame_end
banim_bae_at1_2_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, -25, -42
	banim_frame_oam 0x8000, 0x5000, 0xA, -33, -42
	banim_frame_oam 0x8000, 0x9000, 0x88, -25, -10
	banim_frame_oam 0x8000, 0x5000, 0x8A, -33, -10
	banim_frame_oam 0x8000, 0xD000, 0x2, 7, -42
	banim_frame_oam 0x8000, 0x9000, 0x6, -9, -42
	banim_frame_oam 0x8000, 0x9000, 0x86, -9, -10
	banim_frame_oam 0x8000, 0x9000, 0x40, 39, -26
	banim_frame_oam 0x0, 0x5000, 0xC0, 39, 6
	banim_frame_oam 0x4000, 0x1000, 0x0, 23, -50
	banim_frame_oam 0x0, 0x1000, 0x20, 7, -50
	banim_frame_end
banim_bae_at1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0xD000, 0xC, -24, -50
	banim_frame_oam 0x8000, 0x5000, 0x14, -32, -50
	banim_frame_oam 0x8000, 0x5000, 0x94, -32, -18
	banim_frame_oam 0x8000, 0x5000, 0xB, 40, -42
	banim_frame_oam 0x8000, 0x5000, 0x8B, 48, -26
	banim_frame_end
banim_bae_at1_2_oam_frame_13_l:
	banim_frame_oam 0x0, 0xD000, 0x15, -24, -50
	banim_frame_oam 0x8000, 0x5000, 0x9D, -32, -18
	banim_frame_oam 0x4000, 0x1000, 0x1D, 48, -42
	banim_frame_oam 0x8000, 0x1000, 0x3E, 40, -18
	banim_frame_oam 0x0, 0x1000, 0x3F, 40, -42
	banim_frame_end
banim_bae_at1_2_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x5000, 0x0, 48, -27
	banim_frame_oam 0x0, 0x1000, 0x80, 48, 5
	banim_frame_oam 0x8000, 0x1000, 0xA0, 56, -11
	banim_frame_oam 0x0, 0x1000, 0xE0, 56, 5
	banim_frame_oam 0x0, 0x1000, 0x1, 56, -19
	banim_frame_oam 0x8000, 0x5000, 0x21, 40, -43
	banim_frame_oam 0x8000, 0x1000, 0xA1, 40, -11
	banim_frame_oam 0x0, 0x1000, 0xE1, 40, 5
	banim_frame_oam 0x0, 0xD000, 0x2, -24, -50
	banim_frame_oam 0x8000, 0x5000, 0xA, -32, -50
	banim_frame_oam 0x8000, 0x5000, 0x8A, -32, -18
	banim_frame_end
banim_bae_at1_2_oam_frame_31_l:
	banim_frame_oam 0x4000, 0xD000, 0xB, -16, -42
	banim_frame_oam 0x8000, 0x9000, 0x13, -32, -42
	banim_frame_oam 0x4000, 0x9000, 0x8B, 16, -10
	banim_frame_oam 0x4000, 0x9000, 0x8F, -16, -10
	banim_frame_oam 0x0, 0x5000, 0x93, -32, -10
	banim_frame_oam 0x4000, 0x5000, 0xCB, 16, 6
	banim_frame_oam 0x4000, 0x5000, 0xCF, -16, 6
	banim_frame_oam 0x4000, 0x1000, 0xD3, -32, 6
	banim_frame_oam 0x8000, 0x5000, 0x3F, 48, -43
	banim_frame_oam 0x8000, 0x1000, 0xBF, 48, -11
	banim_frame_oam 0x0, 0x1000, 0xFF, 48, 5
	banim_frame_end
banim_bae_at1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0xD000, 0x15, -16, -42
	banim_frame_oam 0x8000, 0x9000, 0x1D, -32, -42
	banim_frame_oam 0x8000, 0x9000, 0x9D, -32, -10
	banim_frame_end
banim_bae_at1_2_oam_frame_17_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -16, -42
	banim_frame_oam 0x8000, 0x9000, 0x8, -32, -42
	banim_frame_oam 0x8000, 0x9000, 0x88, -32, -10
	banim_frame_end
banim_bae_at1_2_oam_frame_18_l:
	banim_frame_oam 0x0, 0xD000, 0xA, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x12, -32, -40
	banim_frame_oam 0x8000, 0x9000, 0x92, -32, -8
	banim_frame_end
banim_bae_at1_2_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bae_at1_2_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bae_at1_2_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bae_at1_2_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0xD000, 0x0, -32, -38
	banim_frame_oam 0x8000, 0x5000, 0x8, -40, -38
	banim_frame_oam 0x8000, 0x5000, 0x88, -40, -6
	banim_frame_end
banim_bae_at1_2_oam_frame_25_l:
	banim_frame_oam 0x4000, 0xD000, 0x14, -24, -38
	banim_frame_oam 0x8000, 0x9000, 0x1C, -40, -38
	banim_frame_oam 0x4000, 0x9000, 0x94, 8, -6
	banim_frame_oam 0x4000, 0x9000, 0x98, -24, -6
	banim_frame_oam 0x0, 0x5000, 0x9C, -40, -6
	banim_frame_oam 0x4000, 0x5000, 0xD4, 8, 10
	banim_frame_oam 0x4000, 0x5000, 0xD8, -24, 10
	banim_frame_oam 0x4000, 0x1000, 0xDC, -40, 10
	banim_frame_oam 0x4000, 0x1000, 0xF9, -16, 18
	banim_frame_oam 0x0, 0x1000, 0xF8, -8, -46
	banim_frame_end
banim_bae_at1_2_oam_frame_26_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -32, -46
	banim_frame_oam 0x8000, 0x5000, 0x8, -40, -46
	banim_frame_oam 0x8000, 0x5000, 0x88, -40, -14
	banim_frame_oam 0x0, 0x5000, 0x9, 32, -38
	banim_frame_oam 0x4000, 0x1000, 0x49, 40, -22
	banim_frame_end
banim_bae_at1_2_oam_frame_27_l:
	banim_frame_oam 0x0, 0xD000, 0xB, -32, -46
	banim_frame_oam 0x8000, 0x5000, 0x13, -40, -46
	banim_frame_oam 0x8000, 0x5000, 0x93, -40, -14
	banim_frame_oam 0x0, 0x5000, 0x69, 32, -38
	banim_frame_oam 0x4000, 0x1000, 0xA9, 40, -22
	banim_frame_end
banim_bae_at1_2_oam_frame_28_l:
	banim_frame_oam 0x0, 0xD000, 0x14, -32, -38
	banim_frame_oam 0x8000, 0x9000, 0x1C, -48, -38
	banim_frame_oam 0x8000, 0x9000, 0x9C, -48, -6
	banim_frame_end
banim_bae_at1_2_oam_frame_29_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -24, -38
	banim_frame_oam 0x8000, 0xD000, 0x8, -56, -38
	banim_frame_end
banim_bae_at1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -8, -50
	banim_frame_oam 0x8000, 0x9000, 0x8, -24, -50
	banim_frame_oam 0x8000, 0x5000, 0xA, -32, -50
	banim_frame_oam 0x8000, 0x9000, 0x88, -24, -18
	banim_frame_oam 0x8000, 0x5000, 0x8A, -32, -18
	banim_frame_end
banim_bae_at1_2_oam_frame_15_l:
	banim_frame_oam 0x4000, 0xD000, 0xB, -8, -42
	banim_frame_oam 0x8000, 0x9000, 0x13, -24, -42
	banim_frame_oam 0x8000, 0x5000, 0x15, -32, -42
	banim_frame_oam 0x4000, 0x9000, 0x8B, 24, -10
	banim_frame_oam 0x4000, 0x9000, 0x8F, -8, -10
	banim_frame_oam 0x0, 0x5000, 0x93, -24, -10
	banim_frame_oam 0x8000, 0x1000, 0x95, -32, -10
	banim_frame_oam 0x4000, 0x5000, 0xCB, 24, 6
	banim_frame_oam 0x4000, 0x5000, 0xCF, -8, 6
	banim_frame_oam 0x4000, 0x1000, 0xD3, -24, 6
	banim_frame_oam 0x0, 0x1000, 0xD5, -32, 6
	banim_frame_end
banim_bae_at1_2_oam_frame_22_l:
	banim_frame_oam 0x8000, 0x9000, 0x9A, 48, -18
	banim_frame_end
banim_bae_at1_2_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x1000, 0xB7, 48, -10
	banim_frame_oam 0x0, 0x1000, 0xF7, 48, 6
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_bae_at1_2_oam_r:
banim_bae_at1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -32, -38
	banim_frame_oam 0x8000, 0x4000, 0x8, 32, -38
	banim_frame_oam 0x8000, 0x4000, 0x88, 32, -6
	banim_frame_end
banim_bae_at1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0xC000, 0x9, -38, -38
	banim_frame_oam 0x8000, 0x4000, 0x11, 26, -38
	banim_frame_oam 0x4000, 0x8000, 0x89, -38, -6
	banim_frame_oam 0x4000, 0x8000, 0x8D, -6, -6
	banim_frame_oam 0x8000, 0x0, 0x91, 26, -6
	banim_frame_oam 0x4000, 0x4000, 0xC9, -38, 10
	banim_frame_oam 0x4000, 0x4000, 0xCD, -6, 10
	banim_frame_oam 0x0, 0x0, 0xD1, 26, 10
	banim_frame_oam 0x0, 0x0, 0x3F, 0, 18
	banim_frame_end
banim_bae_at1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -23, -41
	banim_frame_oam 0x8000, 0x8000, 0x1A, 9, -41
	banim_frame_oam 0x8000, 0x4000, 0x1C, 25, -41
	banim_frame_oam 0x4000, 0x8000, 0x96, -23, -9
	banim_frame_oam 0x0, 0x4000, 0x9A, 9, -9
	banim_frame_oam 0x8000, 0x0, 0x9C, 25, -9
	banim_frame_oam 0x4000, 0x4000, 0xD6, -23, 7
	banim_frame_oam 0x4000, 0x0, 0xDA, 9, 7
	banim_frame_oam 0x0, 0x0, 0xDC, 25, 7
	banim_frame_oam 0x0, 0x8000, 0x52, -55, -25
	banim_frame_oam 0x4000, 0x4000, 0xD2, -55, 7
	banim_frame_oam 0x4000, 0x4000, 0xF8, -7, 15
	banim_frame_end
banim_bae_at1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0x0, -48, 14
	banim_frame_oam 0x4000, 0x4000, 0x1, -32, -42
	banim_frame_oam 0x4000, 0x4000, 0x5, 0, -42
	banim_frame_oam 0x4000, 0xC000, 0x20, -40, -34
	banim_frame_oam 0x8000, 0x4000, 0x28, 24, -34
	banim_frame_oam 0x4000, 0x8000, 0xA0, -40, -2
	banim_frame_oam 0x4000, 0x8000, 0xA4, -8, -2
	banim_frame_oam 0x8000, 0x0, 0xA8, 24, -2
	banim_frame_oam 0x4000, 0x4000, 0xE0, -40, 14
	banim_frame_oam 0x4000, 0x4000, 0xE4, -8, 14
	banim_frame_oam 0x0, 0x0, 0xE8, 24, 14
	banim_frame_end
banim_bae_at1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -38, -42
	banim_frame_oam 0x8000, 0x4000, 0x8, 26, -42
	banim_frame_oam 0x8000, 0x4000, 0x88, 26, -10
	banim_frame_end
banim_bae_at1_2_oam_frame_5_r:
	banim_frame_oam 0x4000, 0xC000, 0x9, -42, -43
	banim_frame_oam 0x8000, 0x4000, 0x11, 22, -43
	banim_frame_oam 0x4000, 0x8000, 0x89, -42, -11
	banim_frame_oam 0x4000, 0x8000, 0x8D, -10, -11
	banim_frame_oam 0x8000, 0x0, 0x91, 22, -11
	banim_frame_oam 0x4000, 0x4000, 0xC9, -42, 5
	banim_frame_oam 0x4000, 0x4000, 0xCD, -10, 5
	banim_frame_oam 0x0, 0x0, 0xD1, 22, 5
	banim_frame_oam 0x0, 0x0, 0x3F, -4, 13
	banim_frame_end
banim_bae_at1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -27, -43
	banim_frame_oam 0x8000, 0x8000, 0x1A, 5, -43
	banim_frame_oam 0x8000, 0x4000, 0x1C, 21, -43
	banim_frame_oam 0x4000, 0x8000, 0x96, -27, -11
	banim_frame_oam 0x0, 0x4000, 0x9A, 5, -11
	banim_frame_oam 0x8000, 0x0, 0x9C, 21, -11
	banim_frame_oam 0x4000, 0x4000, 0xD6, -27, 5
	banim_frame_oam 0x4000, 0x0, 0xDA, 5, 5
	banim_frame_oam 0x0, 0x0, 0xDC, 21, 5
	banim_frame_oam 0x0, 0x8000, 0x52, -59, -27
	banim_frame_oam 0x4000, 0x4000, 0xD2, -59, 5
	banim_frame_oam 0x4000, 0x4000, 0xF8, -11, 13
	banim_frame_end
banim_bae_at1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0x0, -52, 13
	banim_frame_oam 0x4000, 0x4000, 0x1, -36, -43
	banim_frame_oam 0x4000, 0x4000, 0x5, -4, -43
	banim_frame_oam 0x4000, 0xC000, 0x20, -44, -35
	banim_frame_oam 0x8000, 0x4000, 0x28, 20, -35
	banim_frame_oam 0x4000, 0x8000, 0xA0, -44, -3
	banim_frame_oam 0x4000, 0x8000, 0xA4, -12, -3
	banim_frame_oam 0x8000, 0x0, 0xA8, 20, -3
	banim_frame_oam 0x4000, 0x4000, 0xE0, -44, 13
	banim_frame_oam 0x4000, 0x4000, 0xE4, -12, 13
	banim_frame_oam 0x0, 0x0, 0xE8, 20, 13
	banim_frame_end
banim_bae_at1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -50, -43
	banim_frame_oam 0x8000, 0x4000, 0x8, 14, -43
	banim_frame_oam 0x8000, 0x4000, 0x88, 14, -11
	banim_frame_end
banim_bae_at1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0xC000, 0x9, -47, -42
	banim_frame_oam 0x8000, 0x8000, 0x11, 17, -42
	banim_frame_oam 0x8000, 0x8000, 0x91, 17, -10
	banim_frame_end
banim_bae_at1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0xC000, 0x13, -47, -42
	banim_frame_oam 0x8000, 0x8000, 0x1B, 17, -42
	banim_frame_oam 0x8000, 0x8000, 0x9B, 17, -10
	banim_frame_oam 0x4000, 0x0, 0x1D, -31, -50
	banim_frame_oam 0x0, 0x0, 0x3F, -15, -50
	banim_frame_end
banim_bae_at1_2_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, 9, -42
	banim_frame_oam 0x8000, 0x4000, 0xA, 25, -42
	banim_frame_oam 0x8000, 0x8000, 0x88, 9, -10
	banim_frame_oam 0x8000, 0x4000, 0x8A, 25, -10
	banim_frame_oam 0x8000, 0xC000, 0x2, -39, -42
	banim_frame_oam 0x8000, 0x8000, 0x6, -7, -42
	banim_frame_oam 0x8000, 0x8000, 0x86, -7, -10
	banim_frame_oam 0x8000, 0x8000, 0x40, -55, -26
	banim_frame_oam 0x0, 0x4000, 0xC0, -55, 6
	banim_frame_oam 0x4000, 0x0, 0x0, -39, -50
	banim_frame_oam 0x0, 0x0, 0x20, -15, -50
	banim_frame_end
banim_bae_at1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0xC000, 0xC, -40, -50
	banim_frame_oam 0x8000, 0x4000, 0x14, 24, -50
	banim_frame_oam 0x8000, 0x4000, 0x94, 24, -18
	banim_frame_oam 0x8000, 0x4000, 0xB, -48, -42
	banim_frame_oam 0x8000, 0x4000, 0x8B, -56, -26
	banim_frame_end
banim_bae_at1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0xC000, 0x15, -40, -50
	banim_frame_oam 0x8000, 0x4000, 0x9D, 24, -18
	banim_frame_oam 0x4000, 0x0, 0x1D, -64, -42
	banim_frame_oam 0x8000, 0x0, 0x3E, -48, -18
	banim_frame_oam 0x0, 0x0, 0x3F, -48, -42
	banim_frame_end
banim_bae_at1_2_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x4000, 0x0, -56, -27
	banim_frame_oam 0x0, 0x0, 0x80, -56, 5
	banim_frame_oam 0x8000, 0x0, 0xA0, -64, -11
	banim_frame_oam 0x0, 0x0, 0xE0, -64, 5
	banim_frame_oam 0x0, 0x0, 0x1, -64, -19
	banim_frame_oam 0x8000, 0x4000, 0x21, -48, -43
	banim_frame_oam 0x8000, 0x0, 0xA1, -48, -11
	banim_frame_oam 0x0, 0x0, 0xE1, -48, 5
	banim_frame_oam 0x0, 0xC000, 0x2, -40, -50
	banim_frame_oam 0x8000, 0x4000, 0xA, 24, -50
	banim_frame_oam 0x8000, 0x4000, 0x8A, 24, -18
	banim_frame_end
banim_bae_at1_2_oam_frame_31_r:
	banim_frame_oam 0x4000, 0xC000, 0xB, -48, -42
	banim_frame_oam 0x8000, 0x8000, 0x13, 16, -42
	banim_frame_oam 0x4000, 0x8000, 0x8B, -48, -10
	banim_frame_oam 0x4000, 0x8000, 0x8F, -16, -10
	banim_frame_oam 0x0, 0x4000, 0x93, 16, -10
	banim_frame_oam 0x4000, 0x4000, 0xCB, -48, 6
	banim_frame_oam 0x4000, 0x4000, 0xCF, -16, 6
	banim_frame_oam 0x4000, 0x0, 0xD3, 16, 6
	banim_frame_oam 0x8000, 0x4000, 0x3F, -56, -43
	banim_frame_oam 0x8000, 0x0, 0xBF, -56, -11
	banim_frame_oam 0x0, 0x0, 0xFF, -56, 5
	banim_frame_end
banim_bae_at1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0xC000, 0x15, -48, -42
	banim_frame_oam 0x8000, 0x8000, 0x1D, 16, -42
	banim_frame_oam 0x8000, 0x8000, 0x9D, 16, -10
	banim_frame_end
banim_bae_at1_2_oam_frame_17_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -48, -42
	banim_frame_oam 0x8000, 0x8000, 0x8, 16, -42
	banim_frame_oam 0x8000, 0x8000, 0x88, 16, -10
	banim_frame_end
banim_bae_at1_2_oam_frame_18_r:
	banim_frame_oam 0x0, 0xC000, 0xA, -48, -40
	banim_frame_oam 0x8000, 0x8000, 0x12, 16, -40
	banim_frame_oam 0x8000, 0x8000, 0x92, 16, -8
	banim_frame_end
banim_bae_at1_2_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bae_at1_2_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bae_at1_2_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bae_at1_2_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0xC000, 0x0, -32, -38
	banim_frame_oam 0x8000, 0x4000, 0x8, 32, -38
	banim_frame_oam 0x8000, 0x4000, 0x88, 32, -6
	banim_frame_end
banim_bae_at1_2_oam_frame_25_r:
	banim_frame_oam 0x4000, 0xC000, 0x14, -40, -38
	banim_frame_oam 0x8000, 0x8000, 0x1C, 24, -38
	banim_frame_oam 0x4000, 0x8000, 0x94, -40, -6
	banim_frame_oam 0x4000, 0x8000, 0x98, -8, -6
	banim_frame_oam 0x0, 0x4000, 0x9C, 24, -6
	banim_frame_oam 0x4000, 0x4000, 0xD4, -40, 10
	banim_frame_oam 0x4000, 0x4000, 0xD8, -8, 10
	banim_frame_oam 0x4000, 0x0, 0xDC, 24, 10
	banim_frame_oam 0x4000, 0x0, 0xF9, 0, 18
	banim_frame_oam 0x0, 0x0, 0xF8, 0, -46
	banim_frame_end
banim_bae_at1_2_oam_frame_26_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -32, -46
	banim_frame_oam 0x8000, 0x4000, 0x8, 32, -46
	banim_frame_oam 0x8000, 0x4000, 0x88, 32, -14
	banim_frame_oam 0x0, 0x4000, 0x9, -48, -38
	banim_frame_oam 0x4000, 0x0, 0x49, -56, -22
	banim_frame_end
banim_bae_at1_2_oam_frame_27_r:
	banim_frame_oam 0x0, 0xC000, 0xB, -32, -46
	banim_frame_oam 0x8000, 0x4000, 0x13, 32, -46
	banim_frame_oam 0x8000, 0x4000, 0x93, 32, -14
	banim_frame_oam 0x0, 0x4000, 0x69, -48, -38
	banim_frame_oam 0x4000, 0x0, 0xA9, -56, -22
	banim_frame_end
banim_bae_at1_2_oam_frame_28_r:
	banim_frame_oam 0x0, 0xC000, 0x14, -32, -38
	banim_frame_oam 0x8000, 0x8000, 0x1C, 32, -38
	banim_frame_oam 0x8000, 0x8000, 0x9C, 32, -6
	banim_frame_end
banim_bae_at1_2_oam_frame_29_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -40, -38
	banim_frame_oam 0x8000, 0xC000, 0x8, 24, -38
	banim_frame_end
banim_bae_at1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -56, -50
	banim_frame_oam 0x8000, 0x8000, 0x8, 8, -50
	banim_frame_oam 0x8000, 0x4000, 0xA, 24, -50
	banim_frame_oam 0x8000, 0x8000, 0x88, 8, -18
	banim_frame_oam 0x8000, 0x4000, 0x8A, 24, -18
	banim_frame_end
banim_bae_at1_2_oam_frame_15_r:
	banim_frame_oam 0x4000, 0xC000, 0xB, -56, -42
	banim_frame_oam 0x8000, 0x8000, 0x13, 8, -42
	banim_frame_oam 0x8000, 0x4000, 0x15, 24, -42
	banim_frame_oam 0x4000, 0x8000, 0x8B, -56, -10
	banim_frame_oam 0x4000, 0x8000, 0x8F, -24, -10
	banim_frame_oam 0x0, 0x4000, 0x93, 8, -10
	banim_frame_oam 0x8000, 0x0, 0x95, 24, -10
	banim_frame_oam 0x4000, 0x4000, 0xCB, -56, 6
	banim_frame_oam 0x4000, 0x4000, 0xCF, -24, 6
	banim_frame_oam 0x4000, 0x0, 0xD3, 8, 6
	banim_frame_oam 0x0, 0x0, 0xD5, 24, 6
	banim_frame_end
banim_bae_at1_2_oam_frame_22_r:
	banim_frame_oam 0x8000, 0x8000, 0x9A, -64, -18
	banim_frame_end
banim_bae_at1_2_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x0, 0xB7, -56, -10
	banim_frame_oam 0x0, 0x0, 0xF7, -56, 6
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_bae_at1_2_script:
banim_bae_at1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_sound_bael_move
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 1, banim_bae_at1_2_oam_frame_1_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 2, banim_bae_at1_2_oam_frame_2_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_1, 3, banim_bae_at1_2_oam_frame_3_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 3, banim_bae_at1_sheet_0, 4, banim_bae_at1_2_oam_frame_4_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 5, banim_bae_at1_2_oam_frame_5_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 6, banim_bae_at1_2_oam_frame_6_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 3, banim_bae_at1_sheet_1, 7, banim_bae_at1_2_oam_frame_7_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 8, banim_bae_at1_2_oam_frame_8_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_1, 9, banim_bae_at1_2_oam_frame_9_r - banim_bae_at1_2_oam_r
	banim_code_frame 12, banim_bae_at1_sheet_1, 10, banim_bae_at1_2_oam_frame_10_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_1
	banim_code_frame 2, banim_bae_at1_sheet_2, 11, banim_bae_at1_2_oam_frame_11_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_2, 12, banim_bae_at1_2_oam_frame_12_r - banim_bae_at1_2_oam_r
	banim_code_frame 18, banim_bae_at1_sheet_2, 13, banim_bae_at1_2_oam_frame_13_r - banim_bae_at1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_bael_2
	banim_code_frame 2, banim_bae_at1_sheet_3, 29, banim_bae_at1_2_oam_frame_14_r - banim_bae_at1_2_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_bae_at1_sheet_3, 30, banim_bae_at1_2_oam_frame_15_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_bae_at1_sheet_2, 12, banim_bae_at1_2_oam_frame_12_r - banim_bae_at1_2_oam_r
	banim_code_frame 12, banim_bae_at1_sheet_2, 13, banim_bae_at1_2_oam_frame_13_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_4, 16, banim_bae_at1_2_oam_frame_16_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_5, 17, banim_bae_at1_2_oam_frame_17_r - banim_bae_at1_2_oam_r
	banim_code_frame 24, banim_bae_at1_sheet_5, 18, banim_bae_at1_2_oam_frame_18_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 7, banim_bae_at1_2_oam_frame_7_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 6, banim_bae_at1_2_oam_frame_6_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 5, banim_bae_at1_2_oam_frame_5_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 2, banim_bae_at1_sheet_0, 4, banim_bae_at1_2_oam_frame_4_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 3, banim_bae_at1_2_oam_frame_3_r - banim_bae_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bae_at1_sheet_0, 2, banim_bae_at1_2_oam_frame_2_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 1, banim_bae_at1_2_oam_frame_1_r - banim_bae_at1_2_oam_r
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bae_at1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_sound_bael_move
	banim_code_frame 1, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 3, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 3, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 12, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_1
	banim_code_frame 2, banim_bae_at1_sheet_2, 21, banim_bae_at1_2_oam_frame_21_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_2, 21, banim_bae_at1_2_oam_frame_21_r - banim_bae_at1_2_oam_r
	banim_code_frame 18, banim_bae_at1_sheet_2, 21, banim_bae_at1_2_oam_frame_21_r - banim_bae_at1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_bael_2
	banim_code_frame 2, banim_bae_at1_sheet_3, 31, banim_bae_at1_2_oam_frame_22_r - banim_bae_at1_2_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_bae_at1_sheet_3, 32, banim_bae_at1_2_oam_frame_23_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_bae_at1_sheet_2, 21, banim_bae_at1_2_oam_frame_21_r - banim_bae_at1_2_oam_r
	banim_code_frame 12, banim_bae_at1_sheet_2, 21, banim_bae_at1_2_oam_frame_21_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_4, 22, banim_bae_at1_2_oam_frame_24_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 24, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 1, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bae_at1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_5, 24, banim_bae_at1_2_oam_frame_25_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_3
	banim_code_frame 4, banim_bae_at1_sheet_6, 25, banim_bae_at1_2_oam_frame_26_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_6, 26, banim_bae_at1_2_oam_frame_27_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_6, 25, banim_bae_at1_2_oam_frame_26_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_6, 26, banim_bae_at1_2_oam_frame_27_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_6, 25, banim_bae_at1_2_oam_frame_26_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_6, 26, banim_bae_at1_2_oam_frame_27_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_6, 25, banim_bae_at1_2_oam_frame_26_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_6, 26, banim_bae_at1_2_oam_frame_27_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 2, banim_bae_at1_sheet_0, 1, banim_bae_at1_2_oam_frame_1_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 2, banim_bae_at1_2_oam_frame_2_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 3, banim_bae_at1_2_oam_frame_3_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 4, banim_bae_at1_2_oam_frame_4_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 5, banim_bae_at1_2_oam_frame_5_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 2, banim_bae_at1_sheet_0, 6, banim_bae_at1_2_oam_frame_6_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 7, banim_bae_at1_2_oam_frame_7_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 8, banim_bae_at1_2_oam_frame_8_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_1, 9, banim_bae_at1_2_oam_frame_9_r - banim_bae_at1_2_oam_r
	banim_code_frame 8, banim_bae_at1_sheet_1, 10, banim_bae_at1_2_oam_frame_10_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_1
	banim_code_frame 2, banim_bae_at1_sheet_2, 11, banim_bae_at1_2_oam_frame_11_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_2, 12, banim_bae_at1_2_oam_frame_12_r - banim_bae_at1_2_oam_r
	banim_code_frame 24, banim_bae_at1_sheet_2, 13, banim_bae_at1_2_oam_frame_13_r - banim_bae_at1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_bael_2
	banim_code_frame 2, banim_bae_at1_sheet_3, 29, banim_bae_at1_2_oam_frame_14_r - banim_bae_at1_2_oam_r
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_bae_at1_sheet_3, 30, banim_bae_at1_2_oam_frame_15_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_bae_at1_sheet_4, 16, banim_bae_at1_2_oam_frame_16_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_5, 17, banim_bae_at1_2_oam_frame_17_r - banim_bae_at1_2_oam_r
	banim_code_frame 24, banim_bae_at1_sheet_5, 18, banim_bae_at1_2_oam_frame_18_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 8, banim_bae_at1_2_oam_frame_8_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 7, banim_bae_at1_2_oam_frame_7_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 6, banim_bae_at1_2_oam_frame_6_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 5, banim_bae_at1_2_oam_frame_5_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 2, banim_bae_at1_sheet_0, 4, banim_bae_at1_2_oam_frame_4_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 3, banim_bae_at1_2_oam_frame_3_r - banim_bae_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bae_at1_sheet_0, 2, banim_bae_at1_2_oam_frame_2_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 1, banim_bae_at1_2_oam_frame_1_r - banim_bae_at1_2_oam_r
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bae_at1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_3
	banim_code_frame 4, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 8, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_1
	banim_code_frame 2, banim_bae_at1_sheet_2, 21, banim_bae_at1_2_oam_frame_21_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_2, 21, banim_bae_at1_2_oam_frame_21_r - banim_bae_at1_2_oam_r
	banim_code_frame 24, banim_bae_at1_sheet_2, 21, banim_bae_at1_2_oam_frame_21_r - banim_bae_at1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_bael_2
	banim_code_frame 2, banim_bae_at1_sheet_3, 31, banim_bae_at1_2_oam_frame_22_r - banim_bae_at1_2_oam_r
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_bae_at1_sheet_3, 32, banim_bae_at1_2_oam_frame_23_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_bae_at1_sheet_4, 22, banim_bae_at1_2_oam_frame_24_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 24, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 20, banim_bae_at1_2_oam_frame_20_r - banim_bae_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_frame 1, banim_bae_at1_sheet_0, 19, banim_bae_at1_2_oam_frame_19_r - banim_bae_at1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bae_at1_2_mode_attack_range:
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bae_at1_2_mode_attack_range_critical:
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bae_at1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bae_at1_sheet_6, 27, banim_bae_at1_2_oam_frame_28_r - banim_bae_at1_2_oam_r
	banim_code_frame 1, banim_bae_at1_sheet_7, 28, banim_bae_at1_2_oam_frame_29_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bae_at1_sheet_6, 27, banim_bae_at1_2_oam_frame_28_r - banim_bae_at1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bae_at1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bae_at1_sheet_6, 27, banim_bae_at1_2_oam_frame_28_r - banim_bae_at1_2_oam_r
	banim_code_frame 1, banim_bae_at1_sheet_7, 28, banim_bae_at1_2_oam_frame_29_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bae_at1_sheet_6, 27, banim_bae_at1_2_oam_frame_28_r - banim_bae_at1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bae_at1_2_mode_stand_close:
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bae_at1_2_mode_stand:
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bae_at1_2_mode_stand_range:
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bae_at1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_sound_bael_move
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 1, banim_bae_at1_2_oam_frame_1_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 2, banim_bae_at1_2_oam_frame_2_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_1, 3, banim_bae_at1_2_oam_frame_3_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 3, banim_bae_at1_sheet_0, 4, banim_bae_at1_2_oam_frame_4_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 5, banim_bae_at1_2_oam_frame_5_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 6, banim_bae_at1_2_oam_frame_6_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 3, banim_bae_at1_sheet_1, 7, banim_bae_at1_2_oam_frame_7_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_0, 8, banim_bae_at1_2_oam_frame_8_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_1, 9, banim_bae_at1_2_oam_frame_9_r - banim_bae_at1_2_oam_r
	banim_code_frame 12, banim_bae_at1_sheet_1, 10, banim_bae_at1_2_oam_frame_10_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_1
	banim_code_frame 2, banim_bae_at1_sheet_2, 11, banim_bae_at1_2_oam_frame_11_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_2, 12, banim_bae_at1_2_oam_frame_12_r - banim_bae_at1_2_oam_r
	banim_code_frame 18, banim_bae_at1_sheet_2, 13, banim_bae_at1_2_oam_frame_13_r - banim_bae_at1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_bael_2
	banim_code_frame 2, banim_bae_at1_sheet_4, 14, banim_bae_at1_2_oam_frame_30_r - banim_bae_at1_2_oam_r
	banim_code_frame 1, banim_bae_at1_sheet_4, 15, banim_bae_at1_2_oam_frame_31_r - banim_bae_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_bae_at1_sheet_2, 12, banim_bae_at1_2_oam_frame_12_r - banim_bae_at1_2_oam_r
	banim_code_frame 12, banim_bae_at1_sheet_2, 13, banim_bae_at1_2_oam_frame_13_r - banim_bae_at1_2_oam_r
	banim_code_frame 4, banim_bae_at1_sheet_4, 16, banim_bae_at1_2_oam_frame_16_r - banim_bae_at1_2_oam_r
	banim_code_frame 3, banim_bae_at1_sheet_5, 17, banim_bae_at1_2_oam_frame_17_r - banim_bae_at1_2_oam_r
	banim_code_frame 24, banim_bae_at1_sheet_5, 18, banim_bae_at1_2_oam_frame_18_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 7, banim_bae_at1_2_oam_frame_7_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 6, banim_bae_at1_2_oam_frame_6_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 5, banim_bae_at1_2_oam_frame_5_r - banim_bae_at1_2_oam_r
	banim_code_sound_bael_move
	banim_code_frame 2, banim_bae_at1_sheet_0, 4, banim_bae_at1_2_oam_frame_4_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_1, 3, banim_bae_at1_2_oam_frame_3_r - banim_bae_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bae_at1_sheet_0, 2, banim_bae_at1_2_oam_frame_2_r - banim_bae_at1_2_oam_r
	banim_code_frame 2, banim_bae_at1_sheet_0, 2, banim_bae_at1_2_oam_frame_2_r - banim_bae_at1_2_oam_r
	banim_code_frame 1, banim_bae_at1_sheet_0, 0, banim_bae_at1_2_oam_frame_0_r - banim_bae_at1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bae_at1_2_mode_attack_close - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_attack_close_back - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_attack_close_critical - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_attack_close_critical_back - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_attack_range - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_attack_range_critical - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_dodge_close - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_dodge_range - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_stand_close - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_stand - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_stand_range - banim_bae_at1_2_script
	.word banim_bae_at1_2_mode_attack_miss - banim_bae_at1_2_script
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

