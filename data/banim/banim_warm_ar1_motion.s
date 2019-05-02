@ vim:ft=armv4
	.global banim_warm_ar1_script
	.global banim_warm_ar1_oam_r
	.global banim_warm_ar1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1D
	.section .data.oam_l
banim_warm_ar1_oam_l:
banim_warm_ar1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -6, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, -14, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x84, -14, 0
	banim_frame_end
banim_warm_ar1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -6, -32
	banim_frame_oam 0x8000, 0x5000, 0x9, -14, -32
	banim_frame_oam 0x4000, 0x9000, 0x85, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x89, -14, 0
	banim_frame_oam 0x8000, 0x1000, 0xC2, 26, -32
	banim_frame_oam 0x0, 0x5000, 0xC0, -22, -19
	banim_frame_oam 0x4000, 0x1000, 0xC3, -25, 3
	banim_frame_oam 0x0, 0x1000, 0xC5, -33, 3
	banim_frame_end
banim_warm_ar1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -6, -32
	banim_frame_oam 0x8000, 0x5000, 0x9, -14, -32
	banim_frame_oam 0x4000, 0x9000, 0x85, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x89, -14, 0
	banim_frame_oam 0x0, 0x5000, 0xC8, -22, -24
	banim_frame_oam 0x0, 0x5000, 0xC6, -30, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, -14, -8
	banim_frame_oam 0x8000, 0x1000, 0xC2, 26, -32
	banim_frame_oam 0x0, 0x1000, 0xCE, -36, 6
	banim_frame_end
banim_warm_ar1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -13, -32
	banim_frame_oam 0x8000, 0x5000, 0xE, -21, -32
	banim_frame_oam 0x4000, 0x9000, 0x8A, -13, 0
	banim_frame_oam 0x8000, 0x1000, 0x8E, -21, 0
	banim_frame_oam 0x0, 0x1000, 0xCA, 19, -10
	banim_frame_oam 0x0, 0x1000, 0xE4, -29, -14
	banim_frame_oam 0x4000, 0x0, 0xBE, -45, -14
	banim_frame_end
banim_warm_ar1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -9, -32
	banim_frame_oam 0x8000, 0x9000, 0x13, -25, -32
	banim_frame_oam 0x4000, 0x9000, 0x8F, -9, 0
	banim_frame_oam 0x0, 0x5000, 0x93, -25, 0
	banim_frame_oam 0x4000, 0x1000, 0xEA, -20, -40
	banim_frame_end
banim_warm_ar1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x15, -14, -32
	banim_frame_oam 0x4000, 0x9000, 0x95, -14, 0
	banim_frame_oam 0x0, 0x1000, 0xCB, -8, -40
	banim_frame_oam 0x0, 0x1000, 0xCF, 2, -40
	banim_frame_end
banim_warm_ar1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x9000, 0xDC, -16, 0
	banim_frame_oam 0x4000, 0x9000, 0xD6, -4, -16
	banim_frame_oam 0x0, 0x5000, 0xDA, -20, -16
	banim_frame_oam 0x4000, 0x9000, 0xD0, -4, -32
	banim_frame_oam 0x0, 0x5000, 0xD4, -20, -32
	banim_frame_end
banim_warm_ar1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x1000, 0xBE, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x9E, -8, -16
	banim_frame_oam 0x4000, 0x5000, 0xEC, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xCC, -20, -16
	banim_frame_oam 0x0, 0x9000, 0x19, -11, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, -19, -32
	banim_frame_oam 0x4000, 0x9000, 0x99, -11, 0
	banim_frame_oam 0x8000, 0x1000, 0x9D, -19, 0
	banim_frame_end
banim_warm_ar1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x1000, 0xCC, -21, -16
	banim_frame_oam 0x4000, 0x1000, 0x9E, -10, -16
	banim_frame_oam 0x4000, 0x1000, 0xBE, 6, -16
	banim_frame_oam 0x0, 0x9000, 0x19, -11, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, -19, -32
	banim_frame_oam 0x4000, 0x9000, 0x99, -11, 0
	banim_frame_oam 0x8000, 0x1000, 0x9D, -19, 0
	banim_frame_end
banim_warm_ar1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x1000, 0xCC, -22, -16
	banim_frame_oam 0x4000, 0x1000, 0xBE, 5, -16
	banim_frame_oam 0x4000, 0x1000, 0x9E, -11, -16
	banim_frame_oam 0x0, 0x9000, 0x19, -11, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, -19, -32
	banim_frame_oam 0x4000, 0x9000, 0x99, -11, 0
	banim_frame_oam 0x8000, 0x1000, 0x9D, -19, 0
	banim_frame_end
banim_warm_ar1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -3, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -19, -32
	banim_frame_oam 0x0, 0x5000, 0x84, -19, 0
	banim_frame_oam 0x0, 0x5000, 0x81, 5, 0
	banim_frame_oam 0x8000, 0x1000, 0x83, -3, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 8, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, 0
	banim_frame_end
banim_warm_ar1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -7, -32
	banim_frame_oam 0x8000, 0x5000, 0xA, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, -7, 0
	banim_frame_oam 0x8000, 0x1000, 0x8A, -15, 0
	banim_frame_oam 0x0, 0x1000, 0xA0, -23, -14
	banim_frame_oam 0x0, 0x1000, 0xC0, 9, -40
	banim_frame_end
banim_warm_ar1_oam_frame_12_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -27, -41
	banim_frame_oam 0x4000, 0x5000, 0x88, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -23, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 1, -32
	banim_frame_oam 0x4000, 0x1000, 0x69, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x6B, -15, 0
	banim_frame_oam 0x4000, 0x9000, 0xB0, -15, -16
	banim_frame_oam 0x8000, 0x1000, 0xB4, -23, -16
	banim_frame_oam 0x4000, 0x5000, 0x8, -15, -24
	banim_frame_end
banim_warm_ar1_oam_frame_13_l:
	banim_frame_affine -209, 146, 146, 209, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -28, -41
	banim_frame_oam 0x4000, 0x5000, 0x88, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -23, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 1, -32
	banim_frame_oam 0x4000, 0x1000, 0x69, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x6B, -15, 0
	banim_frame_oam 0x4000, 0x9000, 0xB0, -15, -16
	banim_frame_oam 0x8000, 0x1000, 0xB4, -23, -16
	banim_frame_oam 0x4000, 0x5000, 0x8, -15, -24
	banim_frame_end
banim_warm_ar1_oam_frame_14_l:
	banim_frame_affine -87, 240, 240, 87, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -31, -41
	banim_frame_oam 0x0, 0x9000, 0x8, -15, -24
	banim_frame_oam 0x8000, 0x5000, 0xC, -23, -24
	banim_frame_oam 0x4000, 0x5000, 0x88, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -23, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 1, -32
	banim_frame_end
banim_warm_ar1_oam_frame_15_l:
	banim_frame_affine 66, 247, 247, -66, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -33, -41
	banim_frame_oam 0x0, 0x9000, 0x8, -15, -24
	banim_frame_oam 0x8000, 0x5000, 0xC, -23, -24
	banim_frame_oam 0x4000, 0x5000, 0x88, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -23, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 1, -32
	banim_frame_end
banim_warm_ar1_oam_frame_16_l:
	banim_frame_affine 195, 164, 164, -195, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -35, -41
	banim_frame_oam 0x0, 0x9000, 0x8, -15, -24
	banim_frame_oam 0x8000, 0x5000, 0xC, -23, -24
	banim_frame_oam 0x4000, 0x5000, 0x88, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -23, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 1, -32
	banim_frame_end
banim_warm_ar1_oam_frame_17_l:
	banim_frame_affine 254, 22, 22, -254, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -37, -41
	banim_frame_oam 0x4000, 0x5000, 0x88, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -23, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 1, -32
	banim_frame_oam 0x4000, 0x1000, 0x69, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x6B, -15, 0
	banim_frame_oam 0x0, 0x5000, 0x8, 1, -24
	banim_frame_oam 0x8000, 0x1000, 0xA, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x48, 1, -8
	banim_frame_oam 0x0, 0x1000, 0x4A, -7, -8
	banim_frame_oam 0x0, 0x1000, 0xB, -15, -24
	banim_frame_oam 0x0, 0x5000, 0xB5, -23, -16
	banim_frame_end
banim_warm_ar1_oam_frame_18_l:
	banim_frame_affine 221, -127, -127, -221, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -39, -42
	banim_frame_oam 0x4000, 0x5000, 0x88, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -23, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 1, -32
	banim_frame_oam 0x4000, 0x1000, 0x69, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x6B, -15, 0
	banim_frame_oam 0x0, 0x5000, 0x28, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x2A, -7, -16
	banim_frame_oam 0x4000, 0x5000, 0x8, -15, -24
	banim_frame_oam 0x0, 0x5000, 0xB5, -23, -16
	banim_frame_end
banim_warm_ar1_oam_frame_19_l:
	banim_frame_affine 108, -231, -231, -108, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -39, -43
	banim_frame_oam 0x4000, 0x5000, 0x88, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -23, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 1, -32
	banim_frame_oam 0x0, 0x5000, 0xB5, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x69, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x6B, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x49, -7, -8
	banim_frame_oam 0x0, 0x5000, 0x8, 1, -24
	banim_frame_oam 0x8000, 0x1000, 0xA, -7, -24
	banim_frame_oam 0x0, 0x1000, 0xB, -15, -24
	banim_frame_end
banim_warm_ar1_oam_frame_20_l:
	banim_frame_affine 0, -255, -255, 0, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -43, -44
	banim_frame_oam 0x4000, 0x5000, 0x88, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -23, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 1, -32
	banim_frame_oam 0x4000, 0x1000, 0x69, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x6B, -15, 0
	banim_frame_oam 0x0, 0x5000, 0xB5, -23, -16
	banim_frame_oam 0x0, 0x5000, 0x8, 1, -24
	banim_frame_oam 0x8000, 0x1000, 0xA, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x48, 1, -8
	banim_frame_oam 0x0, 0x1000, 0x4A, -7, -8
	banim_frame_oam 0x0, 0x1000, 0xB, -15, -24
	banim_frame_end
banim_warm_ar1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0xC8, 11, 8
	banim_frame_oam 0x0, 0x1000, 0xA9, -37, 0
	banim_frame_oam 0x0, 0x9000, 0xD, -21, -24
	banim_frame_oam 0x8000, 0x5000, 0x11, -29, -24
	banim_frame_oam 0x4000, 0x5000, 0x8D, -21, 8
	banim_frame_oam 0x0, 0x1000, 0x91, -29, 8
	banim_frame_oam 0x0, 0x1000, 0xAA, -5, -32
	banim_frame_end
banim_warm_ar1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -19, -24
	banim_frame_oam 0x8000, 0x5000, 0x16, -27, -24
	banim_frame_oam 0x4000, 0x5000, 0x92, -19, 8
	banim_frame_oam 0x0, 0x1000, 0x96, -27, 8
	banim_frame_oam 0x4000, 0x1000, 0xC9, -43, 2
	banim_frame_end
banim_warm_ar1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -19, -24
	banim_frame_oam 0x8000, 0x9000, 0x1B, -35, -24
	banim_frame_oam 0x8000, 0x5000, 0x1D, -43, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -19, 8
	banim_frame_oam 0x4000, 0x1000, 0x9B, -35, 8
	banim_frame_oam 0x0, 0x1000, 0x9D, -43, 8
	banim_frame_oam 0x4000, 0x9000, 0xAB, -43, -40
	banim_frame_oam 0x8000, 0x1000, 0xAF, -51, -16
	banim_frame_end
banim_warm_ar1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x21, -12, -39
	banim_frame_oam 0x8000, 0x5000, 0x25, -20, -39
	banim_frame_oam 0x8000, 0x1000, 0x0, 20, -31
	banim_frame_oam 0x8000, 0x1000, 0x40, -28, -31
	banim_frame_oam 0x4000, 0x1000, 0x3, -12, -47
	banim_frame_oam 0x8000, 0x1000, 0x80, -20, -55
	banim_frame_oam 0x4000, 0x1000, 0x8, -12, -55
	banim_frame_oam 0x4000, 0x9000, 0xA1, -12, -7
	banim_frame_oam 0x8000, 0x1000, 0xA5, -20, -7
	banim_frame_oam 0x4000, 0x5000, 0xE1, -12, 9
	banim_frame_oam 0x0, 0x1000, 0xE5, -20, 9
	banim_frame_end
banim_warm_ar1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x26, -12, -39
	banim_frame_oam 0x8000, 0x5000, 0x2A, -20, -39
	banim_frame_oam 0x0, 0x1000, 0x6, -3, -47
	banim_frame_oam 0x0, 0x1000, 0x7, 0, -55
	banim_frame_oam 0x8000, 0x1000, 0x0, 20, -31
	banim_frame_oam 0x8000, 0x1000, 0x40, -28, -31
	banim_frame_oam 0x4000, 0x9000, 0xA6, -12, -7
	banim_frame_oam 0x8000, 0x1000, 0xAA, -20, -7
	banim_frame_oam 0x4000, 0x5000, 0xE6, -12, 9
	banim_frame_oam 0x0, 0x1000, 0xEA, -20, 9
	banim_frame_end
banim_warm_ar1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x5000, 0x2F, -20, -19
	banim_frame_oam 0x4000, 0x5000, 0xF, -10, -14
	banim_frame_oam 0x0, 0x9000, 0x19, -12, -34
	banim_frame_oam 0x4000, 0x9000, 0x99, -12, -2
	banim_frame_oam 0x0, 0x9000, 0x6F, -12, -24
	banim_frame_oam 0x8000, 0x5000, 0x73, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0xEF, -12, 8
	banim_frame_oam 0x0, 0x1000, 0xF3, -20, 8
	banim_frame_oam 0x0, 0x1000, 0x31, 20, -13
	banim_frame_oam 0x0, 0x1000, 0x51, -12, -32
	banim_frame_end
banim_warm_ar1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0x2F, -22, -19
	banim_frame_oam 0x4000, 0x5000, 0xF, -12, -14
	banim_frame_oam 0x8000, 0x9000, 0x3D, 4, -26
	banim_frame_oam 0x8000, 0x5000, 0x3F, -4, -26
	banim_frame_oam 0x8000, 0x1000, 0xD9, -12, -18
	banim_frame_oam 0x0, 0x9000, 0x6F, -12, -24
	banim_frame_oam 0x8000, 0x5000, 0x73, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0xEF, -12, 8
	banim_frame_oam 0x0, 0x1000, 0xF3, -20, 8
	banim_frame_oam 0x0, 0x1000, 0x31, 20, -13
	banim_frame_oam 0x0, 0x1000, 0x51, -12, -32
	banim_frame_oam 0x4000, 0x1000, 0xBD, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xBF, -8, -16
	banim_frame_end
banim_warm_ar1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x5000, 0x2F, -23, -19
	banim_frame_oam 0x4000, 0x5000, 0xF, -14, -14
	banim_frame_oam 0x0, 0x9000, 0xB, -12, -26
	banim_frame_oam 0x0, 0x9000, 0x6F, -12, -24
	banim_frame_oam 0x8000, 0x5000, 0x73, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0xEF, -12, 8
	banim_frame_oam 0x0, 0x1000, 0xF3, -20, 8
	banim_frame_oam 0x0, 0x1000, 0x31, 20, -13
	banim_frame_oam 0x0, 0x1000, 0x51, -12, -32
	banim_frame_end
banim_warm_ar1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x54, -12, -32
	banim_frame_oam 0x8000, 0x5000, 0x58, -20, -32
	banim_frame_oam 0x4000, 0x9000, 0xD4, -12, 0
	banim_frame_oam 0x8000, 0x1000, 0xD8, -20, 0
	banim_frame_oam 0x0, 0x5000, 0x14, 4, -48
	banim_frame_oam 0x8000, 0x1000, 0x13, -28, -32
	banim_frame_end
banim_warm_ar1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -38, -25
	banim_frame_oam 0x4000, 0x1000, 0x8F, -22, 7
	banim_frame_oam 0x0, 0x1000, 0xB2, -6, 7
	banim_frame_oam 0x0, 0x9000, 0x4B, -18, -15
	banim_frame_oam 0x0, 0x5000, 0xB, -2, -31
	banim_frame_oam 0x8000, 0x1000, 0xD, -10, -31
	banim_frame_oam 0x0, 0x1000, 0x2E, -18, -23
	banim_frame_oam 0x0, 0x1000, 0xE, -26, -17
	banim_frame_end
banim_warm_ar1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x4B, -18, -15
	banim_frame_oam 0x0, 0x5000, 0xB, -2, -31
	banim_frame_oam 0x8000, 0x1000, 0xD, -10, -31
	banim_frame_oam 0x0, 0x1000, 0x2E, -18, -23
	banim_frame_oam 0x0, 0x1000, 0xE, -26, -17
	banim_frame_oam 0x8000, 0x9000, 0x13, -32, -39
	banim_frame_oam 0x0, 0x5000, 0x93, -16, -15
	banim_frame_oam 0x0, 0x1000, 0xE0, 0, -7
	banim_frame_oam 0x0, 0x1000, 0xC1, -16, -23
	banim_frame_end
	.section .data.oam_r
banim_warm_ar1_oam_r:
banim_warm_ar1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -26, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, 6, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -26, 0
	banim_frame_oam 0x8000, 0x0, 0x84, 6, 0
	banim_frame_end
banim_warm_ar1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -26, -32
	banim_frame_oam 0x8000, 0x4000, 0x9, 6, -32
	banim_frame_oam 0x4000, 0x8000, 0x85, -26, 0
	banim_frame_oam 0x8000, 0x0, 0x89, 6, 0
	banim_frame_oam 0x8000, 0x0, 0xC2, -34, -32
	banim_frame_oam 0x0, 0x4000, 0xC0, 6, -19
	banim_frame_oam 0x4000, 0x0, 0xC3, 9, 3
	banim_frame_oam 0x0, 0x0, 0xC5, 25, 3
	banim_frame_end
banim_warm_ar1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -26, -32
	banim_frame_oam 0x8000, 0x4000, 0x9, 6, -32
	banim_frame_oam 0x4000, 0x8000, 0x85, -26, 0
	banim_frame_oam 0x8000, 0x0, 0x89, 6, 0
	banim_frame_oam 0x0, 0x4000, 0xC8, 6, -24
	banim_frame_oam 0x0, 0x4000, 0xC6, 14, -8
	banim_frame_oam 0x0, 0x0, 0xE3, 6, -8
	banim_frame_oam 0x8000, 0x0, 0xC2, -34, -32
	banim_frame_oam 0x0, 0x0, 0xCE, 28, 6
	banim_frame_end
banim_warm_ar1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -19, -32
	banim_frame_oam 0x8000, 0x4000, 0xE, 13, -32
	banim_frame_oam 0x4000, 0x8000, 0x8A, -19, 0
	banim_frame_oam 0x8000, 0x0, 0x8E, 13, 0
	banim_frame_oam 0x0, 0x0, 0xCA, -27, -10
	banim_frame_oam 0x0, 0x0, 0xE4, 21, -14
	banim_frame_oam 0x4000, 0x1000, 0xBE, 29, -14
	banim_frame_end
banim_warm_ar1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -23, -32
	banim_frame_oam 0x8000, 0x8000, 0x13, 9, -32
	banim_frame_oam 0x4000, 0x8000, 0x8F, -23, 0
	banim_frame_oam 0x0, 0x4000, 0x93, 9, 0
	banim_frame_oam 0x4000, 0x0, 0xEA, 4, -40
	banim_frame_end
banim_warm_ar1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -18, -32
	banim_frame_oam 0x4000, 0x8000, 0x95, -18, 0
	banim_frame_oam 0x0, 0x0, 0xCB, 0, -40
	banim_frame_oam 0x0, 0x0, 0xCF, -10, -40
	banim_frame_end
banim_warm_ar1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x8000, 0xDC, -16, 0
	banim_frame_oam 0x4000, 0x8000, 0xD6, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xDA, 4, -16
	banim_frame_oam 0x4000, 0x8000, 0xD0, -28, -32
	banim_frame_oam 0x0, 0x4000, 0xD4, 4, -32
	banim_frame_end
banim_warm_ar1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x0, 0xBE, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x9E, -8, -16
	banim_frame_oam 0x4000, 0x4000, 0xEC, -22, -16
	banim_frame_oam 0x4000, 0x0, 0xCC, 4, -16
	banim_frame_oam 0x0, 0x8000, 0x19, -21, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, 11, -32
	banim_frame_oam 0x4000, 0x8000, 0x99, -21, 0
	banim_frame_oam 0x8000, 0x0, 0x9D, 11, 0
	banim_frame_end
banim_warm_ar1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x0, 0xCC, 5, -16
	banim_frame_oam 0x4000, 0x0, 0x9E, -6, -16
	banim_frame_oam 0x4000, 0x0, 0xBE, -22, -16
	banim_frame_oam 0x0, 0x8000, 0x19, -21, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, 11, -32
	banim_frame_oam 0x4000, 0x8000, 0x99, -21, 0
	banim_frame_oam 0x8000, 0x0, 0x9D, 11, 0
	banim_frame_end
banim_warm_ar1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x0, 0xCC, 6, -16
	banim_frame_oam 0x4000, 0x0, 0xBE, -21, -16
	banim_frame_oam 0x4000, 0x0, 0x9E, -5, -16
	banim_frame_oam 0x0, 0x8000, 0x19, -21, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, 11, -32
	banim_frame_oam 0x4000, 0x8000, 0x99, -21, 0
	banim_frame_oam 0x8000, 0x0, 0x9D, 11, 0
	banim_frame_end
banim_warm_ar1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -29, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 3, -32
	banim_frame_oam 0x0, 0x4000, 0x84, 3, 0
	banim_frame_oam 0x0, 0x4000, 0x81, -21, 0
	banim_frame_oam 0x8000, 0x0, 0x83, -5, 0
	banim_frame_oam 0x0, 0x0, 0x80, -16, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, 0
	banim_frame_end
banim_warm_ar1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -25, -32
	banim_frame_oam 0x8000, 0x4000, 0xA, 7, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -25, 0
	banim_frame_oam 0x8000, 0x0, 0x8A, 7, 0
	banim_frame_oam 0x0, 0x0, 0xA0, 15, -14
	banim_frame_oam 0x0, 0x0, 0xC0, -17, -40
	banim_frame_end
banim_warm_ar1_oam_frame_12_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -37, -41
	banim_frame_oam 0x4000, 0x4000, 0x88, -17, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 15, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -9, -32
	banim_frame_oam 0x4000, 0x0, 0x69, -9, 0
	banim_frame_oam 0x0, 0x0, 0x6B, 7, 0
	banim_frame_oam 0x4000, 0x8000, 0xB0, -17, -16
	banim_frame_oam 0x8000, 0x0, 0xB4, 15, -16
	banim_frame_oam 0x4000, 0x4000, 0x8, -17, -24
	banim_frame_end
banim_warm_ar1_oam_frame_13_r:
	banim_frame_affine 209, 146, -146, 209, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -36, -41
	banim_frame_oam 0x4000, 0x4000, 0x88, -17, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 15, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -9, -32
	banim_frame_oam 0x4000, 0x0, 0x69, -9, 0
	banim_frame_oam 0x0, 0x0, 0x6B, 7, 0
	banim_frame_oam 0x4000, 0x8000, 0xB0, -17, -16
	banim_frame_oam 0x8000, 0x0, 0xB4, 15, -16
	banim_frame_oam 0x4000, 0x4000, 0x8, -17, -24
	banim_frame_end
banim_warm_ar1_oam_frame_14_r:
	banim_frame_affine 87, 240, -240, 87, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -33, -41
	banim_frame_oam 0x0, 0x8000, 0x8, -17, -24
	banim_frame_oam 0x8000, 0x4000, 0xC, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x88, -17, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 15, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -9, -32
	banim_frame_end
banim_warm_ar1_oam_frame_15_r:
	banim_frame_affine -66, 247, -247, -66, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -31, -41
	banim_frame_oam 0x0, 0x8000, 0x8, -17, -24
	banim_frame_oam 0x8000, 0x4000, 0xC, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x88, -17, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 15, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -9, -32
	banim_frame_end
banim_warm_ar1_oam_frame_16_r:
	banim_frame_affine -195, 164, -164, -195, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -29, -41
	banim_frame_oam 0x0, 0x8000, 0x8, -17, -24
	banim_frame_oam 0x8000, 0x4000, 0xC, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x88, -17, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 15, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -9, -32
	banim_frame_end
banim_warm_ar1_oam_frame_17_r:
	banim_frame_affine -254, 22, -22, -254, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -27, -41
	banim_frame_oam 0x4000, 0x4000, 0x88, -17, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 15, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -9, -32
	banim_frame_oam 0x4000, 0x0, 0x69, -9, 0
	banim_frame_oam 0x0, 0x0, 0x6B, 7, 0
	banim_frame_oam 0x0, 0x4000, 0x8, -17, -24
	banim_frame_oam 0x8000, 0x0, 0xA, -1, -24
	banim_frame_oam 0x4000, 0x0, 0x48, -17, -8
	banim_frame_oam 0x0, 0x0, 0x4A, -1, -8
	banim_frame_oam 0x0, 0x0, 0xB, 7, -24
	banim_frame_oam 0x0, 0x4000, 0xB5, 7, -16
	banim_frame_end
banim_warm_ar1_oam_frame_18_r:
	banim_frame_affine -221, -127, 127, -221, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -25, -42
	banim_frame_oam 0x4000, 0x4000, 0x88, -17, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 15, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -9, -32
	banim_frame_oam 0x4000, 0x0, 0x69, -9, 0
	banim_frame_oam 0x0, 0x0, 0x6B, 7, 0
	banim_frame_oam 0x0, 0x4000, 0x28, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x2A, -1, -16
	banim_frame_oam 0x4000, 0x4000, 0x8, -17, -24
	banim_frame_oam 0x0, 0x4000, 0xB5, 7, -16
	banim_frame_end
banim_warm_ar1_oam_frame_19_r:
	banim_frame_affine -108, -231, 231, -108, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -25, -43
	banim_frame_oam 0x4000, 0x4000, 0x88, -17, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 15, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -9, -32
	banim_frame_oam 0x0, 0x4000, 0xB5, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x69, -9, 0
	banim_frame_oam 0x0, 0x0, 0x6B, 7, 0
	banim_frame_oam 0x4000, 0x0, 0x49, -9, -8
	banim_frame_oam 0x0, 0x4000, 0x8, -17, -24
	banim_frame_oam 0x8000, 0x0, 0xA, -1, -24
	banim_frame_oam 0x0, 0x0, 0xB, 7, -24
	banim_frame_end
banim_warm_ar1_oam_frame_20_r:
	banim_frame_affine 0, -255, 255, 0, 1
	banim_frame_oam 0x100, 0xC000, 0x0, -21, -44
	banim_frame_oam 0x4000, 0x4000, 0x88, -17, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 15, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -9, -32
	banim_frame_oam 0x4000, 0x0, 0x69, -9, 0
	banim_frame_oam 0x0, 0x0, 0x6B, 7, 0
	banim_frame_oam 0x0, 0x4000, 0xB5, 7, -16
	banim_frame_oam 0x0, 0x4000, 0x8, -17, -24
	banim_frame_oam 0x8000, 0x0, 0xA, -1, -24
	banim_frame_oam 0x4000, 0x0, 0x48, -17, -8
	banim_frame_oam 0x0, 0x0, 0x4A, -1, -8
	banim_frame_oam 0x0, 0x0, 0xB, 7, -24
	banim_frame_end
banim_warm_ar1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0xC8, -19, 8
	banim_frame_oam 0x0, 0x0, 0xA9, 29, 0
	banim_frame_oam 0x0, 0x8000, 0xD, -11, -24
	banim_frame_oam 0x8000, 0x4000, 0x11, 21, -24
	banim_frame_oam 0x4000, 0x4000, 0x8D, -11, 8
	banim_frame_oam 0x0, 0x0, 0x91, 21, 8
	banim_frame_oam 0x0, 0x0, 0xAA, -3, -32
	banim_frame_end
banim_warm_ar1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -13, -24
	banim_frame_oam 0x8000, 0x4000, 0x16, 19, -24
	banim_frame_oam 0x4000, 0x4000, 0x92, -13, 8
	banim_frame_oam 0x0, 0x0, 0x96, 19, 8
	banim_frame_oam 0x4000, 0x0, 0xC9, 27, 2
	banim_frame_end
banim_warm_ar1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -13, -24
	banim_frame_oam 0x8000, 0x8000, 0x1B, 19, -24
	banim_frame_oam 0x8000, 0x4000, 0x1D, 35, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -13, 8
	banim_frame_oam 0x4000, 0x0, 0x9B, 19, 8
	banim_frame_oam 0x0, 0x0, 0x9D, 35, 8
	banim_frame_oam 0x4000, 0x8000, 0xAB, 11, -40
	banim_frame_oam 0x8000, 0x0, 0xAF, 43, -16
	banim_frame_end
banim_warm_ar1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x21, -20, -39
	banim_frame_oam 0x8000, 0x4000, 0x25, 12, -39
	banim_frame_oam 0x8000, 0x0, 0x0, -28, -31
	banim_frame_oam 0x8000, 0x0, 0x40, 20, -31
	banim_frame_oam 0x4000, 0x0, 0x3, -4, -47
	banim_frame_oam 0x8000, 0x0, 0x80, 12, -55
	banim_frame_oam 0x4000, 0x0, 0x8, -4, -55
	banim_frame_oam 0x4000, 0x8000, 0xA1, -20, -7
	banim_frame_oam 0x8000, 0x0, 0xA5, 12, -7
	banim_frame_oam 0x4000, 0x4000, 0xE1, -20, 9
	banim_frame_oam 0x0, 0x0, 0xE5, 12, 9
	banim_frame_end
banim_warm_ar1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x26, -20, -39
	banim_frame_oam 0x8000, 0x4000, 0x2A, 12, -39
	banim_frame_oam 0x0, 0x0, 0x6, -5, -47
	banim_frame_oam 0x0, 0x0, 0x7, -8, -55
	banim_frame_oam 0x8000, 0x0, 0x0, -28, -31
	banim_frame_oam 0x8000, 0x0, 0x40, 20, -31
	banim_frame_oam 0x4000, 0x8000, 0xA6, -20, -7
	banim_frame_oam 0x8000, 0x0, 0xAA, 12, -7
	banim_frame_oam 0x4000, 0x4000, 0xE6, -20, 9
	banim_frame_oam 0x0, 0x0, 0xEA, 12, 9
	banim_frame_end
banim_warm_ar1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x4000, 0x2F, 4, -19
	banim_frame_oam 0x4000, 0x4000, 0xF, -22, -14
	banim_frame_oam 0x0, 0x8000, 0x19, -20, -34
	banim_frame_oam 0x4000, 0x8000, 0x99, -20, -2
	banim_frame_oam 0x0, 0x8000, 0x6F, -20, -24
	banim_frame_oam 0x8000, 0x4000, 0x73, 12, -24
	banim_frame_oam 0x4000, 0x4000, 0xEF, -20, 8
	banim_frame_oam 0x0, 0x0, 0xF3, 12, 8
	banim_frame_oam 0x0, 0x0, 0x31, -28, -13
	banim_frame_oam 0x0, 0x0, 0x51, 4, -32
	banim_frame_end
banim_warm_ar1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0x2F, 6, -19
	banim_frame_oam 0x4000, 0x4000, 0xF, -20, -14
	banim_frame_oam 0x8000, 0x8000, 0x3D, -20, -26
	banim_frame_oam 0x8000, 0x4000, 0x3F, -4, -26
	banim_frame_oam 0x8000, 0x0, 0xD9, 4, -18
	banim_frame_oam 0x0, 0x8000, 0x6F, -20, -24
	banim_frame_oam 0x8000, 0x4000, 0x73, 12, -24
	banim_frame_oam 0x4000, 0x4000, 0xEF, -20, 8
	banim_frame_oam 0x0, 0x0, 0xF3, 12, 8
	banim_frame_oam 0x0, 0x0, 0x31, -28, -13
	banim_frame_oam 0x0, 0x0, 0x51, 4, -32
	banim_frame_oam 0x4000, 0x0, 0xBD, -16, -16
	banim_frame_oam 0x0, 0x0, 0xBF, 0, -16
	banim_frame_end
banim_warm_ar1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x4000, 0x2F, 7, -19
	banim_frame_oam 0x4000, 0x4000, 0xF, -18, -14
	banim_frame_oam 0x0, 0x8000, 0xB, -20, -26
	banim_frame_oam 0x0, 0x8000, 0x6F, -20, -24
	banim_frame_oam 0x8000, 0x4000, 0x73, 12, -24
	banim_frame_oam 0x4000, 0x4000, 0xEF, -20, 8
	banim_frame_oam 0x0, 0x0, 0xF3, 12, 8
	banim_frame_oam 0x0, 0x0, 0x31, -28, -13
	banim_frame_oam 0x0, 0x0, 0x51, 4, -32
	banim_frame_end
banim_warm_ar1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x54, -20, -32
	banim_frame_oam 0x8000, 0x4000, 0x58, 12, -32
	banim_frame_oam 0x4000, 0x8000, 0xD4, -20, 0
	banim_frame_oam 0x8000, 0x0, 0xD8, 12, 0
	banim_frame_oam 0x0, 0x4000, 0x14, -20, -48
	banim_frame_oam 0x8000, 0x0, 0x13, 20, -32
	banim_frame_end
banim_warm_ar1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x8000, 0xF, 6, -25
	banim_frame_oam 0x4000, 0x0, 0x8F, 6, 7
	banim_frame_oam 0x0, 0x0, 0xB2, -2, 7
	banim_frame_oam 0x0, 0x8000, 0x4B, -14, -15
	banim_frame_oam 0x0, 0x4000, 0xB, -14, -31
	banim_frame_oam 0x8000, 0x0, 0xD, 2, -31
	banim_frame_oam 0x0, 0x0, 0x2E, 10, -23
	banim_frame_oam 0x0, 0x0, 0xE, 18, -17
	banim_frame_end
banim_warm_ar1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x4B, -14, -15
	banim_frame_oam 0x0, 0x4000, 0xB, -14, -31
	banim_frame_oam 0x8000, 0x0, 0xD, 2, -31
	banim_frame_oam 0x0, 0x0, 0x2E, 10, -23
	banim_frame_oam 0x0, 0x0, 0xE, 18, -17
	banim_frame_oam 0x8000, 0x8000, 0x13, 16, -39
	banim_frame_oam 0x0, 0x4000, 0x93, 0, -15
	banim_frame_oam 0x0, 0x0, 0xE0, -8, -7
	banim_frame_oam 0x0, 0x0, 0xC1, 8, -23
	banim_frame_end
	.section .data.script
banim_warm_ar1_script:
banim_warm_ar1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 1, banim_warm_ar1_oam_frame_1_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_0, 2, banim_warm_ar1_oam_frame_2_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_0, 3, banim_warm_ar1_oam_frame_3_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 4, banim_warm_ar1_oam_frame_4_r - banim_warm_ar1_oam_r
	banim_code_frame 8, banim_warm_ar1_sheet_0, 5, banim_warm_ar1_oam_frame_5_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 6, banim_warm_ar1_oam_frame_6_r - banim_warm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_warm_ar1_sheet_0, 7, banim_warm_ar1_oam_frame_7_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 8, banim_warm_ar1_oam_frame_8_r - banim_warm_ar1_oam_r
	banim_code_frame 15, banim_warm_ar1_sheet_0, 9, banim_warm_ar1_oam_frame_9_r - banim_warm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_warm_ar1_sheet_1, 10, banim_warm_ar1_oam_frame_10_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ar1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 1, banim_warm_ar1_oam_frame_1_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_0, 2, banim_warm_ar1_oam_frame_2_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_0, 3, banim_warm_ar1_oam_frame_3_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 4, banim_warm_ar1_oam_frame_4_r - banim_warm_ar1_oam_r
	banim_code_frame 8, banim_warm_ar1_sheet_0, 5, banim_warm_ar1_oam_frame_5_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 6, banim_warm_ar1_oam_frame_6_r - banim_warm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_warm_ar1_sheet_0, 7, banim_warm_ar1_oam_frame_7_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 8, banim_warm_ar1_oam_frame_8_r - banim_warm_ar1_oam_r
	banim_code_frame 15, banim_warm_ar1_sheet_0, 9, banim_warm_ar1_oam_frame_9_r - banim_warm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_warm_ar1_sheet_1, 10, banim_warm_ar1_oam_frame_10_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ar1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_1, 15, banim_warm_ar1_oam_frame_11_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ar1_sheet_2, 16, banim_warm_ar1_oam_frame_12_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_2, 17, banim_warm_ar1_oam_frame_13_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_2, 18, banim_warm_ar1_oam_frame_14_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_warm_ar1_sheet_2, 19, banim_warm_ar1_oam_frame_15_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 20, banim_warm_ar1_oam_frame_16_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 21, banim_warm_ar1_oam_frame_17_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_warm_ar1_sheet_2, 22, banim_warm_ar1_oam_frame_18_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 23, banim_warm_ar1_oam_frame_19_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 24, banim_warm_ar1_oam_frame_20_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_2, 25, banim_warm_ar1_oam_frame_21_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_2, 26, banim_warm_ar1_oam_frame_22_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ar1_sheet_2, 27, banim_warm_ar1_oam_frame_23_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 28, banim_warm_ar1_oam_frame_24_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 29, banim_warm_ar1_oam_frame_25_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 33, banim_warm_ar1_oam_frame_26_r - banim_warm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 1, banim_warm_ar1_sheet_3, 30, banim_warm_ar1_oam_frame_27_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 31, banim_warm_ar1_oam_frame_28_r - banim_warm_ar1_oam_r
	banim_code_frame 25, banim_warm_ar1_sheet_3, 32, banim_warm_ar1_oam_frame_29_r - banim_warm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_warm_ar1_sheet_1, 10, banim_warm_ar1_oam_frame_10_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ar1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_1, 15, banim_warm_ar1_oam_frame_11_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ar1_sheet_2, 16, banim_warm_ar1_oam_frame_12_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_2, 17, banim_warm_ar1_oam_frame_13_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_2, 18, banim_warm_ar1_oam_frame_14_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_warm_ar1_sheet_2, 19, banim_warm_ar1_oam_frame_15_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 20, banim_warm_ar1_oam_frame_16_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 21, banim_warm_ar1_oam_frame_17_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_warm_ar1_sheet_2, 22, banim_warm_ar1_oam_frame_18_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 23, banim_warm_ar1_oam_frame_19_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 24, banim_warm_ar1_oam_frame_20_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_2, 25, banim_warm_ar1_oam_frame_21_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_2, 26, banim_warm_ar1_oam_frame_22_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ar1_sheet_2, 27, banim_warm_ar1_oam_frame_23_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 28, banim_warm_ar1_oam_frame_24_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 29, banim_warm_ar1_oam_frame_25_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 33, banim_warm_ar1_oam_frame_26_r - banim_warm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 1, banim_warm_ar1_sheet_3, 30, banim_warm_ar1_oam_frame_27_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 31, banim_warm_ar1_oam_frame_28_r - banim_warm_ar1_oam_r
	banim_code_frame 25, banim_warm_ar1_sheet_3, 32, banim_warm_ar1_oam_frame_29_r - banim_warm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_warm_ar1_sheet_1, 10, banim_warm_ar1_oam_frame_10_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ar1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 1, banim_warm_ar1_oam_frame_1_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_0, 2, banim_warm_ar1_oam_frame_2_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_0, 3, banim_warm_ar1_oam_frame_3_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 4, banim_warm_ar1_oam_frame_4_r - banim_warm_ar1_oam_r
	banim_code_frame 8, banim_warm_ar1_sheet_0, 5, banim_warm_ar1_oam_frame_5_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 6, banim_warm_ar1_oam_frame_6_r - banim_warm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_warm_ar1_sheet_0, 7, banim_warm_ar1_oam_frame_7_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 8, banim_warm_ar1_oam_frame_8_r - banim_warm_ar1_oam_r
	banim_code_frame 15, banim_warm_ar1_sheet_0, 9, banim_warm_ar1_oam_frame_9_r - banim_warm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_warm_ar1_sheet_1, 10, banim_warm_ar1_oam_frame_10_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ar1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_1, 15, banim_warm_ar1_oam_frame_11_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ar1_sheet_2, 16, banim_warm_ar1_oam_frame_12_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_2, 17, banim_warm_ar1_oam_frame_13_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_2, 18, banim_warm_ar1_oam_frame_14_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_warm_ar1_sheet_2, 19, banim_warm_ar1_oam_frame_15_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 20, banim_warm_ar1_oam_frame_16_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 21, banim_warm_ar1_oam_frame_17_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_warm_ar1_sheet_2, 22, banim_warm_ar1_oam_frame_18_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 23, banim_warm_ar1_oam_frame_19_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_2, 24, banim_warm_ar1_oam_frame_20_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_2, 25, banim_warm_ar1_oam_frame_21_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_2, 26, banim_warm_ar1_oam_frame_22_r - banim_warm_ar1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_warm_ar1_sheet_2, 27, banim_warm_ar1_oam_frame_23_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 28, banim_warm_ar1_oam_frame_24_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 29, banim_warm_ar1_oam_frame_25_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 33, banim_warm_ar1_oam_frame_26_r - banim_warm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 1, banim_warm_ar1_sheet_3, 30, banim_warm_ar1_oam_frame_27_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_3, 31, banim_warm_ar1_oam_frame_28_r - banim_warm_ar1_oam_r
	banim_code_frame 25, banim_warm_ar1_sheet_3, 32, banim_warm_ar1_oam_frame_29_r - banim_warm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_warm_ar1_sheet_1, 10, banim_warm_ar1_oam_frame_10_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ar1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_1, 34, banim_warm_ar1_oam_frame_30_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_1, 35, banim_warm_ar1_oam_frame_31_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ar1_sheet_1, 34, banim_warm_ar1_oam_frame_30_r - banim_warm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ar1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_1, 34, banim_warm_ar1_oam_frame_30_r - banim_warm_ar1_oam_r
	banim_code_frame 1, banim_warm_ar1_sheet_1, 35, banim_warm_ar1_oam_frame_31_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_warm_ar1_sheet_1, 34, banim_warm_ar1_oam_frame_30_r - banim_warm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_warm_ar1_mode_stand_close:
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ar1_mode_stand:
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ar1_mode_stand_range:
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_warm_ar1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_warm_ar1_sheet_0, 0, banim_warm_ar1_oam_frame_0_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 1, banim_warm_ar1_oam_frame_1_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_0, 2, banim_warm_ar1_oam_frame_2_r - banim_warm_ar1_oam_r
	banim_code_frame 2, banim_warm_ar1_sheet_0, 3, banim_warm_ar1_oam_frame_3_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 4, banim_warm_ar1_oam_frame_4_r - banim_warm_ar1_oam_r
	banim_code_frame 8, banim_warm_ar1_sheet_0, 5, banim_warm_ar1_oam_frame_5_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 6, banim_warm_ar1_oam_frame_6_r - banim_warm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_warm_ar1_sheet_0, 7, banim_warm_ar1_oam_frame_7_r - banim_warm_ar1_oam_r
	banim_code_frame 3, banim_warm_ar1_sheet_0, 8, banim_warm_ar1_oam_frame_8_r - banim_warm_ar1_oam_r
	banim_code_frame 15, banim_warm_ar1_sheet_0, 9, banim_warm_ar1_oam_frame_9_r - banim_warm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_warm_ar1_sheet_1, 10, banim_warm_ar1_oam_frame_10_r - banim_warm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_warm_ar1_mode_attack_close - banim_warm_ar1_script
	.word banim_warm_ar1_mode_attack_close_back - banim_warm_ar1_script
	.word banim_warm_ar1_mode_attack_close_critical - banim_warm_ar1_script
	.word banim_warm_ar1_mode_attack_close_critical_back - banim_warm_ar1_script
	.word banim_warm_ar1_mode_attack_range - banim_warm_ar1_script
	.word banim_warm_ar1_mode_attack_range_critical - banim_warm_ar1_script
	.word banim_warm_ar1_mode_dodge_close - banim_warm_ar1_script
	.word banim_warm_ar1_mode_dodge_range - banim_warm_ar1_script
	.word banim_warm_ar1_mode_stand_close - banim_warm_ar1_script
	.word banim_warm_ar1_mode_stand - banim_warm_ar1_script
	.word banim_warm_ar1_mode_stand_range - banim_warm_ar1_script
	.word banim_warm_ar1_mode_attack_miss - banim_warm_ar1_script
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

