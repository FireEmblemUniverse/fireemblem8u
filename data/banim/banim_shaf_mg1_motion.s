@ vim:ft=armv4
	.global banim_shaf_mg1_script
	.global banim_shaf_mg1_oam_r
	.global banim_shaf_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x75
	.section .data.oam_l
banim_shaf_mg1_oam_l:
banim_shaf_mg1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_end
banim_shaf_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0x0, -16, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0x0, -16, -24
	banim_frame_oam 0x0, 0x9000, 0x8, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0xC, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0x1C, -1, -9
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0xC, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x10, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x1000, 0x1C, -1, -9
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x10, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x1C, -1, -9
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x1000, 0x1D, -1, -10
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x10, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x1000, 0x1E, -1, -10
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x18, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x1000, 0x1D, -1, -10
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x18, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x84, -15, -16
	banim_frame_oam 0x8000, 0x1000, 0xDE, -23, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x3C, -5, -14
	banim_frame_oam 0x0, 0x0, 0x3C, 3, -14
	banim_frame_oam 0x0, 0x3000, 0x3C, -5, -6
	banim_frame_oam 0x0, 0x2000, 0x3C, 3, -6
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x84, -15, -16
	banim_frame_oam 0x8000, 0x1000, 0xDE, -23, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x88, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x8C, -23, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x3C, -5, -14
	banim_frame_oam 0x0, 0x0, 0x3C, 3, -14
	banim_frame_oam 0x0, 0x3000, 0x3C, -5, -6
	banim_frame_oam 0x0, 0x2000, 0x3C, 3, -6
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x88, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x8C, -23, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x8D, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x91, -23, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x1000, 0x5C, -5, -14
	banim_frame_oam 0x0, 0x0, 0x5C, 3, -14
	banim_frame_oam 0x0, 0x3000, 0x5C, -5, -6
	banim_frame_oam 0x0, 0x2000, 0x5C, 3, -6
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x9000, 0x8D, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x91, -23, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x9000, 0x92, -10, -16
	banim_frame_oam 0x8000, 0x9000, 0x96, -26, -16
	banim_frame_oam 0x4000, 0x5000, 0xC0, -18, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x5C, -5, -14
	banim_frame_oam 0x0, 0x0, 0x5C, 3, -14
	banim_frame_oam 0x0, 0x3000, 0x5C, -5, -6
	banim_frame_oam 0x0, 0x2000, 0x5C, 3, -6
	banim_frame_oam 0x0, 0x9000, 0x92, -10, -16
	banim_frame_oam 0x8000, 0x9000, 0x96, -26, -16
	banim_frame_oam 0x4000, 0x5000, 0xC0, -18, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x98, -11, -16
	banim_frame_oam 0x8000, 0x9000, 0x9C, -27, -16
	banim_frame_oam 0x4000, 0x5000, 0xA0, -19, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x5000, 0x3D, -4, -14
	banim_frame_oam 0x0, 0x9000, 0x98, -11, -16
	banim_frame_oam 0x8000, 0x9000, 0x9C, -27, -16
	banim_frame_oam 0x4000, 0x5000, 0xA0, -19, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -15, 8
	banim_frame_oam 0x0, 0x1000, 0xA3, -23, 8
	banim_frame_oam 0x4000, 0x9000, 0x8, -15, -31
	banim_frame_oam 0x0, 0x5000, 0xC, -31, -31
	banim_frame_oam 0x4000, 0x5000, 0x48, -15, -15
	banim_frame_oam 0x4000, 0x1000, 0x4C, -31, -15
	banim_frame_oam 0x0, 0x1000, 0xA6, 17, -23
	banim_frame_oam 0x0, 0x1000, 0xCB, 17, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x1000, 0x9D, -4, -14
	banim_frame_oam 0x8000, 0x1000, 0xDD, 4, -14
	banim_frame_oam 0x0, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -15, 8
	banim_frame_oam 0x0, 0x1000, 0xA3, -23, 8
	banim_frame_oam 0x4000, 0x9000, 0x8, -15, -31
	banim_frame_oam 0x0, 0x5000, 0xC, -31, -31
	banim_frame_oam 0x4000, 0x5000, 0x48, -15, -15
	banim_frame_oam 0x4000, 0x1000, 0x4C, -31, -15
	banim_frame_oam 0x0, 0x1000, 0xA6, 17, -23
	banim_frame_oam 0x0, 0x1000, 0xCB, 17, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0xA2, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, -4, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -12, -8
	banim_frame_oam 0x4000, 0x9000, 0xC3, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xA5, -28, 8
	banim_frame_oam 0x4000, 0x9000, 0x68, -13, -26
	banim_frame_oam 0x0, 0x5000, 0x6C, -29, -26
	banim_frame_oam 0x4000, 0x5000, 0xA8, -13, -10
	banim_frame_oam 0x4000, 0x1000, 0xAC, -29, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x3000, 0x9D, -4, -15
	banim_frame_oam 0x8000, 0x3000, 0xDD, 4, -15
	banim_frame_oam 0x0, 0x5000, 0xA0, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0xA2, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, -4, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -12, -8
	banim_frame_oam 0x4000, 0x9000, 0xC3, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xA5, -28, 8
	banim_frame_oam 0x4000, 0x9000, 0x68, -13, -26
	banim_frame_oam 0x0, 0x5000, 0x6C, -29, -26
	banim_frame_oam 0x4000, 0x5000, 0xA8, -13, -10
	banim_frame_oam 0x4000, 0x1000, 0xAC, -29, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -19, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -27, 8
	banim_frame_oam 0x4000, 0x9000, 0xE, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x12, -30, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0x4F, -30, -8
	banim_frame_oam 0x0, 0x1000, 0x4E, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x51, -14, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_28_l:
	banim_frame_oam 0x8000, 0x2000, 0x9D, 3, -15
	banim_frame_oam 0x8000, 0x2000, 0xDD, -5, -15
	banim_frame_oam 0x0, 0x9000, 0x4, -19, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -27, 8
	banim_frame_oam 0x4000, 0x9000, 0xE, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x12, -30, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0x4F, -30, -8
	banim_frame_oam 0x0, 0x1000, 0x4E, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x51, -14, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x0, 0x9D, 3, -14
	banim_frame_oam 0x8000, 0x0, 0xDD, -5, -14
	banim_frame_oam 0x0, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -15, 8
	banim_frame_oam 0x0, 0x1000, 0xA3, -23, 8
	banim_frame_oam 0x4000, 0x9000, 0x8, -15, -31
	banim_frame_oam 0x0, 0x5000, 0xC, -31, -31
	banim_frame_oam 0x4000, 0x5000, 0x48, -15, -15
	banim_frame_oam 0x4000, 0x1000, 0x4C, -31, -15
	banim_frame_oam 0x0, 0x1000, 0xA6, 17, -23
	banim_frame_oam 0x0, 0x1000, 0xCB, 17, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x3F, -4, -15
	banim_frame_oam 0x0, 0x0, 0x3F, 4, -15
	banim_frame_oam 0x0, 0x3000, 0x3F, -4, -7
	banim_frame_oam 0x0, 0x2000, 0x3F, 4, -7
	banim_frame_oam 0x0, 0x5000, 0xA0, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0xA2, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, -4, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -12, -8
	banim_frame_oam 0x4000, 0x9000, 0xC3, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xA5, -28, 8
	banim_frame_oam 0x4000, 0x9000, 0x68, -13, -26
	banim_frame_oam 0x0, 0x5000, 0x6C, -29, -26
	banim_frame_oam 0x4000, 0x5000, 0xA8, -13, -10
	banim_frame_oam 0x4000, 0x1000, 0xAC, -29, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x1000, 0x1D, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x1D, 4, -15
	banim_frame_oam 0x0, 0x9000, 0x4, -19, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -27, 8
	banim_frame_oam 0x4000, 0x9000, 0xE, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x12, -30, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0x4F, -30, -8
	banim_frame_oam 0x0, 0x1000, 0x4E, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x51, -14, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x1000, 0x1D, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x1D, 4, -15
	banim_frame_oam 0x0, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -15, 8
	banim_frame_oam 0x0, 0x1000, 0xA3, -23, 8
	banim_frame_oam 0x4000, 0x9000, 0x8, -15, -31
	banim_frame_oam 0x0, 0x5000, 0xC, -31, -31
	banim_frame_oam 0x4000, 0x5000, 0x48, -15, -15
	banim_frame_oam 0x4000, 0x1000, 0x4C, -31, -15
	banim_frame_oam 0x0, 0x1000, 0xA6, 17, -23
	banim_frame_oam 0x0, 0x1000, 0xCB, 17, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_33_l:
	banim_frame_oam 0x8000, 0x1000, 0x5D, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x5D, 4, -15
	banim_frame_oam 0x0, 0x5000, 0xA0, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0xA2, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, -4, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -12, -8
	banim_frame_oam 0x4000, 0x9000, 0xC3, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xA5, -28, 8
	banim_frame_oam 0x4000, 0x9000, 0x68, -13, -26
	banim_frame_oam 0x0, 0x5000, 0x6C, -29, -26
	banim_frame_oam 0x4000, 0x5000, 0xA8, -13, -10
	banim_frame_oam 0x4000, 0x1000, 0xAC, -29, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x1000, 0x1E, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x1E, 4, -15
	banim_frame_oam 0x0, 0x9000, 0x4, -19, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -27, 8
	banim_frame_oam 0x4000, 0x9000, 0xE, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x12, -30, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0x4F, -30, -8
	banim_frame_oam 0x0, 0x1000, 0x4E, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x51, -14, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0xBE, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xFE, -12, -3
	banim_frame_oam 0x0, 0x4000, 0xBE, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xFE, 4, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -15, 8
	banim_frame_oam 0x0, 0x1000, 0xA3, -23, 8
	banim_frame_oam 0x4000, 0x9000, 0x8, -15, -31
	banim_frame_oam 0x0, 0x5000, 0xC, -31, -31
	banim_frame_oam 0x4000, 0x5000, 0x48, -15, -15
	banim_frame_oam 0x4000, 0x1000, 0x4C, -31, -15
	banim_frame_oam 0x0, 0x1000, 0xA6, 17, -23
	banim_frame_oam 0x0, 0x1000, 0xCB, 17, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0xBE, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xFE, -12, -3
	banim_frame_oam 0x0, 0x4000, 0xBE, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xFE, 4, -3
	banim_frame_oam 0x0, 0x5000, 0xA0, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0xA2, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, -4, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -12, -8
	banim_frame_oam 0x4000, 0x9000, 0xC3, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xA5, -28, 8
	banim_frame_oam 0x4000, 0x9000, 0x68, -13, -26
	banim_frame_oam 0x0, 0x5000, 0x6C, -29, -26
	banim_frame_oam 0x4000, 0x5000, 0xA8, -13, -10
	banim_frame_oam 0x4000, 0x1000, 0xAC, -29, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x5000, 0xBE, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xFE, -12, -3
	banim_frame_oam 0x0, 0x4000, 0xBE, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xFE, 4, -3
	banim_frame_oam 0x0, 0x9000, 0x4, -19, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -27, 8
	banim_frame_oam 0x4000, 0x9000, 0xE, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x12, -30, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0x4F, -30, -8
	banim_frame_oam 0x0, 0x1000, 0x4E, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x51, -14, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0x5E, -12, -19
	banim_frame_oam 0x4000, 0x0, 0x9E, -12, -3
	banim_frame_oam 0x0, 0x5000, 0x5E, 4, -19
	banim_frame_oam 0x4000, 0x1000, 0x9E, 4, -3
	banim_frame_oam 0x0, 0x9000, 0x4, -19, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -27, 8
	banim_frame_oam 0x4000, 0x9000, 0xE, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x12, -30, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0x4F, -30, -8
	banim_frame_oam 0x0, 0x1000, 0x4E, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x51, -14, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x4000, 0x5E, -12, -19
	banim_frame_oam 0x4000, 0x0, 0x9E, -12, -3
	banim_frame_oam 0x0, 0x5000, 0x5E, 4, -19
	banim_frame_oam 0x4000, 0x1000, 0x9E, 4, -3
	banim_frame_oam 0x0, 0x5000, 0x6E, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0x70, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0xAE, -4, -8
	banim_frame_oam 0x0, 0x1000, 0xB0, -12, -8
	banim_frame_oam 0x4000, 0x9000, 0x60, -15, 0
	banim_frame_oam 0x0, 0x1000, 0xA3, -23, 8
	banim_frame_oam 0x4000, 0x9000, 0x8, -15, -31
	banim_frame_oam 0x0, 0x5000, 0xC, -31, -31
	banim_frame_oam 0x4000, 0x5000, 0x48, -15, -15
	banim_frame_oam 0x4000, 0x1000, 0x4C, -31, -15
	banim_frame_oam 0x0, 0x1000, 0xA6, 17, -23
	banim_frame_oam 0x0, 0x1000, 0xCB, 17, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0x6E, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0x70, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0xAE, -4, -8
	banim_frame_oam 0x0, 0x1000, 0xB0, -12, -8
	banim_frame_oam 0x4000, 0x9000, 0x60, -15, 0
	banim_frame_oam 0x0, 0x1000, 0xA3, -23, 8
	banim_frame_oam 0x4000, 0x9000, 0x8, -15, -31
	banim_frame_oam 0x0, 0x5000, 0xC, -31, -31
	banim_frame_oam 0x4000, 0x5000, 0x48, -15, -15
	banim_frame_oam 0x4000, 0x1000, 0x4C, -31, -15
	banim_frame_oam 0x0, 0x1000, 0xA6, 17, -23
	banim_frame_oam 0x0, 0x1000, 0xCB, 17, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_40_l:
	banim_frame_oam 0x4000, 0x9000, 0xCC, -14, -24
	banim_frame_oam 0x4000, 0x1000, 0xF0, -6, -8
	banim_frame_oam 0x0, 0x1000, 0xF2, -14, -8
	banim_frame_oam 0x4000, 0x9000, 0xC7, -22, 0
	banim_frame_oam 0x0, 0x1000, 0xEB, -30, 8
	banim_frame_oam 0x4000, 0x9000, 0x68, -13, -26
	banim_frame_oam 0x0, 0x5000, 0x6C, -29, -26
	banim_frame_oam 0x4000, 0x5000, 0xA8, -13, -10
	banim_frame_oam 0x4000, 0x1000, 0xAC, -29, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0x71, -15, -24
	banim_frame_oam 0x8000, 0x5000, 0x75, -23, -24
	banim_frame_oam 0x8000, 0x1000, 0x14, -31, -16
	banim_frame_oam 0x0, 0x1000, 0x54, -31, 0
	banim_frame_oam 0x4000, 0x5000, 0xF3, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF7, -24, 8
	banim_frame_end
banim_shaf_mg1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x16, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x1A, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0xF8, -7, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_43_l:
	banim_frame_oam 0x4000, 0x1000, 0xF8, -7, -24
	banim_frame_oam 0x4000, 0x9000, 0x96, -17, -16
	banim_frame_oam 0x4000, 0x5000, 0xD6, -17, 0
	banim_frame_oam 0x4000, 0x1000, 0x9A, -9, 8
	banim_frame_oam 0x0, 0x1000, 0x9C, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xBA, 7, 8
	banim_frame_end
banim_shaf_mg1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x1000, 0x5B, -1, -9
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, 6, 5
	banim_frame_oam 0x0, 0x1000, 0x84, -2, 5
	banim_frame_end
banim_shaf_mg1_oam_frame_48_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0x68, -15, 8
	banim_frame_oam 0x4000, 0x5000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x1000, 0x5B, -1, -9
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0x68, -15, 8
	banim_frame_oam 0x4000, 0x5000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x9000, 0xA0, 6, 6
	banim_frame_oam 0x8000, 0x1000, 0xA4, -2, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x1000, 0x5C, -1, -10
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, 6, 14
	banim_frame_oam 0x4000, 0x5000, 0x89, -26, 14
	banim_frame_oam 0x4000, 0x1000, 0x8D, -42, 14
	banim_frame_oam 0x4000, 0x5000, 0xA0, 6, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, -2, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_52_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0x68, -15, 8
	banim_frame_oam 0x4000, 0x5000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_53_l:
	banim_frame_oam 0x0, 0x1000, 0x5D, -5, -14
	banim_frame_oam 0x0, 0x0, 0x5D, 3, -14
	banim_frame_oam 0x0, 0x3000, 0x5D, -5, -6
	banim_frame_oam 0x0, 0x2000, 0x5D, 3, -6
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0x68, -15, 8
	banim_frame_oam 0x4000, 0x5000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, 6, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, -2, 6
	banim_frame_oam 0x4000, 0x5000, 0xC5, 6, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, -2, 14
	banim_frame_oam 0x4000, 0x4000, 0xA0, -42, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -10, 6
	banim_frame_oam 0x4000, 0x4000, 0xC5, -42, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -10, 14
	banim_frame_end
banim_shaf_mg1_oam_frame_54_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_55_l:
	banim_frame_oam 0x4000, 0x1000, 0x7B, -4, -14
	banim_frame_oam 0x4000, 0x1000, 0xDB, -4, -6
	banim_frame_oam 0x0, 0x9000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x9000, 0xAA, 6, 1
	banim_frame_oam 0x8000, 0x1000, 0xAE, -2, 1
	banim_frame_oam 0x4000, 0x5000, 0xEA, 6, 17
	banim_frame_oam 0x0, 0x1000, 0xEE, -2, 17
	banim_frame_oam 0x4000, 0x4000, 0xC5, -42, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -10, 14
	banim_frame_oam 0x4000, 0x4000, 0xA0, -42, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -10, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_56_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_57_l:
	banim_frame_oam 0x0, 0x6000, 0x7D, -4, -15
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -2, 9
	banim_frame_oam 0x4000, 0x9000, 0xAA, 6, 1
	banim_frame_oam 0x8000, 0x1000, 0xAE, -2, 1
	banim_frame_oam 0x4000, 0x5000, 0xEA, 6, 17
	banim_frame_oam 0x0, 0x1000, 0xEE, -2, 17
	banim_frame_oam 0x4000, 0x4000, 0xC5, -42, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -10, 14
	banim_frame_oam 0x4000, 0x4000, 0xA0, -42, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -10, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_58_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0x68, -15, 8
	banim_frame_oam 0x4000, 0x5000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_59_l:
	banim_frame_oam 0x0, 0x7000, 0x7D, -4, -15
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0x68, -15, 8
	banim_frame_oam 0x4000, 0x5000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0xAF, -2, 9
	banim_frame_oam 0x4000, 0x9000, 0xAA, 6, 1
	banim_frame_oam 0x8000, 0x1000, 0xAE, -2, 1
	banim_frame_oam 0x4000, 0x5000, 0xEA, 6, 17
	banim_frame_oam 0x0, 0x1000, 0xEE, -2, 17
	banim_frame_oam 0x4000, 0x4000, 0xC5, -42, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -10, 14
	banim_frame_oam 0x4000, 0x4000, 0xA0, -42, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -10, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_60_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_61_l:
	banim_frame_oam 0x0, 0x5000, 0x7D, -4, -14
	banim_frame_oam 0x0, 0x9000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x9000, 0x93, 6, 1
	banim_frame_oam 0x0, 0x5000, 0x97, -10, 1
	banim_frame_oam 0x4000, 0x5000, 0xD3, 6, 17
	banim_frame_oam 0x4000, 0x1000, 0xD7, -10, 17
	banim_frame_oam 0x4000, 0x4000, 0xC5, -42, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -10, 14
	banim_frame_oam 0x4000, 0x4000, 0xA0, -42, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -10, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_62_l:
	banim_frame_oam 0x0, 0x9000, 0x8, -15, -16
	banim_frame_oam 0x8000, 0x1000, 0x5A, -23, -8
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_63_l:
	banim_frame_oam 0x0, 0x1000, 0x5E, -4, -15
	banim_frame_oam 0x0, 0x0, 0x5E, 4, -15
	banim_frame_oam 0x0, 0x3000, 0x5E, -4, -7
	banim_frame_oam 0x0, 0x2000, 0x5E, 4, -7
	banim_frame_oam 0x0, 0x9000, 0x8, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xCF, -18, 9
	banim_frame_oam 0x4000, 0x9000, 0x93, 6, 1
	banim_frame_oam 0x0, 0x5000, 0x97, -10, 1
	banim_frame_oam 0x4000, 0x5000, 0xD3, 6, 17
	banim_frame_oam 0x4000, 0x1000, 0xD7, -10, 17
	banim_frame_oam 0x4000, 0x4000, 0xC5, -42, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -18, 14
	banim_frame_oam 0x4000, 0x4000, 0xA0, -42, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -18, 6
	banim_frame_oam 0x8000, 0x1000, 0x3F, -23, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_64_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x10, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_65_l:
	banim_frame_oam 0x8000, 0x1000, 0x1C, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x1C, 4, -15
	banim_frame_oam 0x0, 0x9000, 0xC, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x10, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0xD9, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xD1, -26, 9
	banim_frame_oam 0x0, 0x5000, 0xCF, -18, 9
	banim_frame_oam 0x4000, 0x9000, 0x93, 6, 1
	banim_frame_oam 0x0, 0x5000, 0x97, -10, 1
	banim_frame_oam 0x4000, 0x5000, 0xD3, 6, 17
	banim_frame_oam 0x4000, 0x1000, 0xD7, -10, 17
	banim_frame_oam 0x4000, 0x4000, 0xC5, -42, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -10, 14
	banim_frame_oam 0x4000, 0x4000, 0xA0, -42, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -10, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_66_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -10, -16
	banim_frame_oam 0x8000, 0x1000, 0x15, -18, -16
	banim_frame_oam 0x8000, 0x1000, 0x55, -26, -16
	banim_frame_oam 0x4000, 0x5000, 0x99, -18, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_67_l:
	banim_frame_oam 0x8000, 0x1000, 0x1D, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x1D, 4, -15
	banim_frame_oam 0x0, 0x9000, 0x11, -10, -16
	banim_frame_oam 0x8000, 0x1000, 0x15, -18, -16
	banim_frame_oam 0x8000, 0x1000, 0x55, -26, -16
	banim_frame_oam 0x4000, 0x5000, 0x99, -18, -24
	banim_frame_oam 0x4000, 0x1000, 0xF3, -26, 9
	banim_frame_oam 0x0, 0x5000, 0xCF, -18, 9
	banim_frame_oam 0x4000, 0x9000, 0x93, 6, 1
	banim_frame_oam 0x0, 0x5000, 0x97, -10, 1
	banim_frame_oam 0x4000, 0x5000, 0xD3, 6, 17
	banim_frame_oam 0x4000, 0x1000, 0xD7, -10, 17
	banim_frame_oam 0x4000, 0x4000, 0xC5, -42, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -10, 14
	banim_frame_oam 0x4000, 0x4000, 0xA0, -42, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -10, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_68_l:
	banim_frame_oam 0x0, 0x9000, 0x16, -11, -16
	banim_frame_oam 0x0, 0x5000, 0x1A, -27, -16
	banim_frame_oam 0x4000, 0x5000, 0xB9, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0x5A, -19, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_69_l:
	banim_frame_oam 0x8000, 0x0, 0x1E, 4, -15
	banim_frame_oam 0x8000, 0x1000, 0x1E, -4, -15
	banim_frame_oam 0x0, 0x9000, 0x16, -11, -16
	banim_frame_oam 0x0, 0x5000, 0x1A, -27, -16
	banim_frame_oam 0x4000, 0x5000, 0xB9, -19, -24
	banim_frame_oam 0x4000, 0x9000, 0x93, 6, 1
	banim_frame_oam 0x8000, 0x1000, 0x97, -2, 1
	banim_frame_oam 0x4000, 0x5000, 0xD3, 6, 17
	banim_frame_oam 0x0, 0x1000, 0xD7, -2, 17
	banim_frame_oam 0x4000, 0x8000, 0x93, -42, 1
	banim_frame_oam 0x8000, 0x0, 0x97, -10, 1
	banim_frame_oam 0x4000, 0x4000, 0xD3, -42, 17
	banim_frame_oam 0x0, 0x0, 0xD7, -10, 17
	banim_frame_oam 0x8000, 0x1000, 0x5A, -19, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_70_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x0, 0x5000, 0x4, -31, -24
	banim_frame_oam 0x4000, 0x5000, 0x40, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -31, -8
	banim_frame_oam 0x0, 0x1000, 0x60, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0x12, -7, 8
	banim_frame_oam 0x4000, 0x1000, 0x61, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x52, 17, -16
	banim_frame_oam 0x4000, 0x1000, 0x8A, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0x63, -23, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_71_l:
	banim_frame_oam 0x0, 0x5000, 0x73, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -12, -3
	banim_frame_oam 0x0, 0x4000, 0x73, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, 4, -3
	banim_frame_oam 0x4000, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x0, 0x5000, 0x4, -31, -24
	banim_frame_oam 0x4000, 0x5000, 0x40, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -31, -8
	banim_frame_oam 0x4000, 0x1000, 0x63, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x60, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0x12, -7, 8
	banim_frame_oam 0x4000, 0x1000, 0x61, -7, 0
	banim_frame_oam 0x4000, 0x1000, 0x63, -23, 0
	banim_frame_oam 0x4000, 0x9000, 0x19, 6, -2
	banim_frame_oam 0x8000, 0x1000, 0x1D, -2, -2
	banim_frame_oam 0x4000, 0x5000, 0x59, 6, 14
	banim_frame_oam 0x0, 0x1000, 0x5D, -2, 14
	banim_frame_oam 0x4000, 0x8000, 0x19, -42, -2
	banim_frame_oam 0x8000, 0x0, 0x1D, -10, -2
	banim_frame_oam 0x4000, 0x4000, 0x59, -42, 14
	banim_frame_oam 0x0, 0x0, 0x5D, -10, 14
	banim_frame_oam 0x0, 0x1000, 0x52, 17, -16
	banim_frame_oam 0x4000, 0x1000, 0x8A, -8, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_72_l:
	banim_frame_oam 0x4000, 0x9000, 0x6, -13, -24
	banim_frame_oam 0x0, 0x5000, 0xA, -29, -24
	banim_frame_oam 0x4000, 0x5000, 0x46, -13, -8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -29, -8
	banim_frame_oam 0x4000, 0x1000, 0x67, -5, 0
	banim_frame_oam 0x4000, 0x1000, 0x32, -6, 8
	banim_frame_oam 0x4000, 0x1000, 0xAA, -5, -32
	banim_frame_oam 0x0, 0x1000, 0xAC, -13, -32
	banim_frame_oam 0x4000, 0x1000, 0x69, -21, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_73_l:
	banim_frame_oam 0x0, 0x5000, 0x71, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xB1, -12, -3
	banim_frame_oam 0x0, 0x4000, 0x71, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xB1, 4, -3
	banim_frame_oam 0x4000, 0x9000, 0x6, -13, -24
	banim_frame_oam 0x0, 0x5000, 0xA, -29, -24
	banim_frame_oam 0x4000, 0x5000, 0x46, -13, -8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -29, -8
	banim_frame_oam 0x4000, 0x1000, 0x67, -5, 0
	banim_frame_oam 0x4000, 0x1000, 0x32, -6, 8
	banim_frame_oam 0x4000, 0x1000, 0x69, -21, 0
	banim_frame_oam 0x4000, 0x9000, 0x14, 6, -2
	banim_frame_oam 0x8000, 0x1000, 0x18, -2, -2
	banim_frame_oam 0x4000, 0x5000, 0x54, 6, 14
	banim_frame_oam 0x0, 0x1000, 0x58, -2, 14
	banim_frame_oam 0x4000, 0x8000, 0x14, -42, -2
	banim_frame_oam 0x8000, 0x0, 0x18, -10, -2
	banim_frame_oam 0x4000, 0x4000, 0x54, -42, 14
	banim_frame_oam 0x0, 0x0, 0x58, -10, 14
	banim_frame_oam 0x4000, 0x1000, 0xAA, -5, -32
	banim_frame_oam 0x0, 0x1000, 0xAC, -13, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_74_l:
	banim_frame_oam 0x4000, 0x9000, 0xC, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x10, -30, -24
	banim_frame_oam 0x4000, 0x5000, 0x4C, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x50, -30, -8
	banim_frame_oam 0x4000, 0x1000, 0x6D, -6, 0
	banim_frame_oam 0x4000, 0x1000, 0x12, -7, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x6F, -22, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, 18, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_75_l:
	banim_frame_oam 0x0, 0x5000, 0x73, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -12, -3
	banim_frame_oam 0x0, 0x4000, 0x73, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, 4, -3
	banim_frame_oam 0x4000, 0x9000, 0xC, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x10, -30, -24
	banim_frame_oam 0x4000, 0x5000, 0x4C, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x50, -30, -8
	banim_frame_oam 0x4000, 0x1000, 0x6D, -6, 0
	banim_frame_oam 0x4000, 0x1000, 0x12, -7, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x6F, -22, 0
	banim_frame_oam 0x4000, 0x9000, 0x19, 6, -2
	banim_frame_oam 0x8000, 0x1000, 0x1D, -2, -2
	banim_frame_oam 0x4000, 0x5000, 0x59, 6, 14
	banim_frame_oam 0x0, 0x1000, 0x5D, -2, 14
	banim_frame_oam 0x4000, 0x8000, 0x19, -42, -2
	banim_frame_oam 0x8000, 0x0, 0x1D, -10, -2
	banim_frame_oam 0x4000, 0x4000, 0x59, -42, 14
	banim_frame_oam 0x0, 0x0, 0x5D, -10, 14
	banim_frame_oam 0x0, 0x1000, 0xEA, 18, -16
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x0, 0x5000, 0x4, -31, -24
	banim_frame_oam 0x4000, 0x5000, 0x40, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -31, -8
	banim_frame_oam 0x0, 0x1000, 0x60, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0x12, -7, 8
	banim_frame_oam 0x4000, 0x1000, 0x61, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x52, 17, -16
	banim_frame_oam 0x4000, 0x1000, 0x8A, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0x63, -23, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0x73, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -12, -3
	banim_frame_oam 0x0, 0x4000, 0x73, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, 4, -3
	banim_frame_oam 0x4000, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x0, 0x5000, 0x4, -31, -24
	banim_frame_oam 0x4000, 0x5000, 0x40, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -31, -8
	banim_frame_oam 0x0, 0x1000, 0x60, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0x12, -7, 8
	banim_frame_oam 0x4000, 0x1000, 0x61, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x52, 17, -16
	banim_frame_oam 0x4000, 0x1000, 0x8A, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0x63, -23, 0
	banim_frame_oam 0x4000, 0x9000, 0x80, 6, 1
	banim_frame_oam 0x8000, 0x1000, 0x84, -2, 1
	banim_frame_oam 0x4000, 0x5000, 0xC0, 6, 17
	banim_frame_oam 0x0, 0x1000, 0xC4, -2, 17
	banim_frame_oam 0x4000, 0x8000, 0x80, -42, 1
	banim_frame_oam 0x8000, 0x0, 0x84, -10, 1
	banim_frame_oam 0x4000, 0x4000, 0xC0, -42, 17
	banim_frame_oam 0x0, 0x0, 0xC4, -10, 17
	banim_frame_end
banim_shaf_mg1_oam_frame_76_l:
	banim_frame_oam 0x4000, 0x9000, 0x6, -13, -24
	banim_frame_oam 0x0, 0x5000, 0xA, -29, -24
	banim_frame_oam 0x4000, 0x5000, 0x46, -13, -8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -29, -8
	banim_frame_oam 0x4000, 0x1000, 0x67, -5, 0
	banim_frame_oam 0x4000, 0x1000, 0x32, -6, 8
	banim_frame_oam 0x4000, 0x1000, 0xAA, -5, -32
	banim_frame_oam 0x0, 0x1000, 0xAC, -13, -32
	banim_frame_oam 0x4000, 0x1000, 0x69, -21, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_77_l:
	banim_frame_oam 0x0, 0x5000, 0x71, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xB1, -12, -3
	banim_frame_oam 0x0, 0x4000, 0x71, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xB1, 4, -3
	banim_frame_oam 0x4000, 0x9000, 0x6, -13, -24
	banim_frame_oam 0x0, 0x5000, 0xA, -29, -24
	banim_frame_oam 0x4000, 0x5000, 0x46, -13, -8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -29, -8
	banim_frame_oam 0x4000, 0x1000, 0x67, -5, 0
	banim_frame_oam 0x4000, 0x1000, 0x32, -6, 8
	banim_frame_oam 0x4000, 0x1000, 0xAA, -5, -32
	banim_frame_oam 0x0, 0x1000, 0xAC, -13, -32
	banim_frame_oam 0x4000, 0x1000, 0x69, -21, 0
	banim_frame_oam 0x4000, 0x9000, 0x85, 5, 5
	banim_frame_oam 0x8000, 0x1000, 0x89, -3, 5
	banim_frame_oam 0x4000, 0x8000, 0x85, -43, 5
	banim_frame_oam 0x8000, 0x0, 0x89, -11, 5
	banim_frame_end
banim_shaf_mg1_oam_frame_78_l:
	banim_frame_oam 0x4000, 0x1000, 0xD1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD3, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0xC, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x10, -30, -24
	banim_frame_oam 0x4000, 0x5000, 0x4C, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x50, -30, -8
	banim_frame_oam 0x4000, 0x1000, 0x6D, -6, 0
	banim_frame_oam 0x4000, 0x1000, 0x12, -7, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x6F, -22, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, 18, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_79_l:
	banim_frame_oam 0x0, 0x5000, 0x73, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -12, -3
	banim_frame_oam 0x0, 0x4000, 0x73, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, 4, -3
	banim_frame_oam 0x4000, 0x1000, 0xD1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD3, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0xC, -14, -24
	banim_frame_oam 0x0, 0x5000, 0x10, -30, -24
	banim_frame_oam 0x4000, 0x5000, 0x4C, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0x50, -30, -8
	banim_frame_oam 0x4000, 0x1000, 0x6D, -6, 0
	banim_frame_oam 0x4000, 0x1000, 0x12, -7, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x6F, -22, 0
	banim_frame_oam 0x4000, 0x9000, 0xC6, -3, 9
	banim_frame_oam 0x4000, 0x8000, 0xC6, -35, 9
	banim_frame_oam 0x0, 0x1000, 0xEA, 18, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_80_l:
	banim_frame_oam 0x4000, 0x5000, 0xF0, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x0, 0x5000, 0x4, -31, -24
	banim_frame_oam 0x4000, 0x5000, 0x40, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -31, -8
	banim_frame_oam 0x0, 0x1000, 0x60, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0x12, -7, 8
	banim_frame_oam 0x4000, 0x1000, 0x61, -7, 0
	banim_frame_oam 0x4000, 0x1000, 0x8A, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x52, 17, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_81_l:
	banim_frame_oam 0x0, 0x5000, 0x71, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xB1, -12, -3
	banim_frame_oam 0x0, 0x4000, 0x71, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xB1, 4, -3
	banim_frame_oam 0x4000, 0x5000, 0xF0, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -4, 9
	banim_frame_oam 0x4000, 0x4000, 0xE0, -36, 9
	banim_frame_oam 0x0, 0x1000, 0x52, 17, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -15, -24
	banim_frame_oam 0x0, 0x5000, 0x4, -31, -24
	banim_frame_oam 0x4000, 0x5000, 0x40, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -31, -8
	banim_frame_oam 0x0, 0x1000, 0x60, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0x61, -7, 0
	banim_frame_oam 0x4000, 0x1000, 0x8A, -8, -32
	banim_frame_end
	banim_frame_oam 0x4000, 0x5000, 0xEB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEF, -24, 8
	banim_frame_oam 0x0, 0x9000, 0x6, -13, -24
	banim_frame_oam 0x8000, 0x9000, 0xA, -29, -24
	banim_frame_oam 0x4000, 0x1000, 0xAA, -5, -32
	banim_frame_oam 0x0, 0x1000, 0xAC, -13, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_82_l:
	banim_frame_oam 0x0, 0x5000, 0x73, -12, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -12, -3
	banim_frame_oam 0x0, 0x4000, 0x73, 4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, 4, -3
	banim_frame_oam 0x4000, 0x5000, 0xEB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEF, -24, 8
	banim_frame_oam 0x0, 0x9000, 0x6, -13, -24
	banim_frame_oam 0x8000, 0x9000, 0xA, -29, -24
	banim_frame_oam 0x4000, 0x1000, 0xAA, -5, -32
	banim_frame_oam 0x0, 0x1000, 0xAC, -13, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, -1, 9
	banim_frame_oam 0x4000, 0x0, 0xE4, -17, 9
	banim_frame_end
banim_shaf_mg1_oam_frame_85_l:
	banim_frame_oam 0x0, 0x9000, 0x7A, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0xFA, -20, 8
	banim_frame_oam 0x8000, 0x5000, 0x79, 12, -24
	banim_frame_oam 0x0, 0x1000, 0xF9, 12, 8
	banim_frame_end
banim_shaf_mg1_oam_frame_86_l:
	banim_frame_oam 0x8000, 0x9000, 0x76, -6, -25
	banim_frame_oam 0x8000, 0x5000, 0x78, -14, -25
	banim_frame_oam 0x4000, 0x1000, 0xF6, -6, 7
	banim_frame_oam 0x0, 0x1000, 0xF8, -14, 7
	banim_frame_end
banim_shaf_mg1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_83_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_84_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	.section .data.oam_r
banim_shaf_mg1_oam_r:
banim_shaf_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_end
banim_shaf_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x4000, 0x0, -16, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0x0, -16, -24
	banim_frame_oam 0x0, 0x8000, 0x8, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0xC, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0x1C, -7, -9
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0xC, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x10, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x0, 0x1C, -7, -9
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x10, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x1C, -7, -9
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x0, 0x1D, -7, -10
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x10, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x0, 0x1E, -7, -10
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x18, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x0, 0x1D, -7, -10
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x18, -16, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x84, -17, -16
	banim_frame_oam 0x8000, 0x0, 0xDE, 15, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x3C, -3, -14
	banim_frame_oam 0x0, 0x1000, 0x3C, -11, -14
	banim_frame_oam 0x0, 0x2000, 0x3C, -3, -6
	banim_frame_oam 0x0, 0x3000, 0x3C, -11, -6
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x84, -17, -16
	banim_frame_oam 0x8000, 0x0, 0xDE, 15, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x88, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x8C, 15, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x3C, -3, -14
	banim_frame_oam 0x0, 0x1000, 0x3C, -11, -14
	banim_frame_oam 0x0, 0x2000, 0x3C, -3, -6
	banim_frame_oam 0x0, 0x3000, 0x3C, -11, -6
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x88, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x8C, 15, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x8D, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x91, 15, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x0, 0x5C, -3, -14
	banim_frame_oam 0x0, 0x1000, 0x5C, -11, -14
	banim_frame_oam 0x0, 0x2000, 0x5C, -3, -6
	banim_frame_oam 0x0, 0x3000, 0x5C, -11, -6
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x8D, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x91, 15, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x8000, 0x92, -22, -16
	banim_frame_oam 0x8000, 0x8000, 0x96, 10, -16
	banim_frame_oam 0x4000, 0x4000, 0xC0, -14, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x5C, -3, -14
	banim_frame_oam 0x0, 0x1000, 0x5C, -11, -14
	banim_frame_oam 0x0, 0x2000, 0x5C, -3, -6
	banim_frame_oam 0x0, 0x3000, 0x5C, -11, -6
	banim_frame_oam 0x0, 0x8000, 0x92, -22, -16
	banim_frame_oam 0x8000, 0x8000, 0x96, 10, -16
	banim_frame_oam 0x4000, 0x4000, 0xC0, -14, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x98, -21, -16
	banim_frame_oam 0x8000, 0x8000, 0x9C, 11, -16
	banim_frame_oam 0x4000, 0x4000, 0xA0, -13, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x4000, 0x3D, -12, -14
	banim_frame_oam 0x0, 0x8000, 0x98, -21, -16
	banim_frame_oam 0x8000, 0x8000, 0x9C, 11, -16
	banim_frame_oam 0x4000, 0x4000, 0xA0, -13, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -17, 8
	banim_frame_oam 0x0, 0x0, 0xA3, 15, 8
	banim_frame_oam 0x4000, 0x8000, 0x8, -17, -31
	banim_frame_oam 0x0, 0x4000, 0xC, 15, -31
	banim_frame_oam 0x4000, 0x4000, 0x48, -17, -15
	banim_frame_oam 0x4000, 0x0, 0x4C, 15, -15
	banim_frame_oam 0x0, 0x0, 0xA6, -25, -23
	banim_frame_oam 0x0, 0x0, 0xCB, -25, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x0, 0x9D, -4, -14
	banim_frame_oam 0x8000, 0x0, 0xDD, -12, -14
	banim_frame_oam 0x0, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -17, 8
	banim_frame_oam 0x0, 0x0, 0xA3, 15, 8
	banim_frame_oam 0x4000, 0x8000, 0x8, -17, -31
	banim_frame_oam 0x0, 0x4000, 0xC, 15, -31
	banim_frame_oam 0x4000, 0x4000, 0x48, -17, -15
	banim_frame_oam 0x4000, 0x0, 0x4C, 15, -15
	banim_frame_oam 0x0, 0x0, 0xA6, -25, -23
	banim_frame_oam 0x0, 0x0, 0xCB, -25, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -12, -24
	banim_frame_oam 0x8000, 0x0, 0xA2, 4, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -12, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 4, -8
	banim_frame_oam 0x4000, 0x8000, 0xC3, -12, 0
	banim_frame_oam 0x0, 0x0, 0xA5, 20, 8
	banim_frame_oam 0x4000, 0x8000, 0x68, -19, -26
	banim_frame_oam 0x0, 0x4000, 0x6C, 13, -26
	banim_frame_oam 0x4000, 0x4000, 0xA8, -19, -10
	banim_frame_oam 0x4000, 0x0, 0xAC, 13, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x2000, 0x9D, -4, -15
	banim_frame_oam 0x8000, 0x2000, 0xDD, -12, -15
	banim_frame_oam 0x0, 0x4000, 0xA0, -12, -24
	banim_frame_oam 0x8000, 0x0, 0xA2, 4, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -12, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 4, -8
	banim_frame_oam 0x4000, 0x8000, 0xC3, -12, 0
	banim_frame_oam 0x0, 0x0, 0xA5, 20, 8
	banim_frame_oam 0x4000, 0x8000, 0x68, -19, -26
	banim_frame_oam 0x0, 0x4000, 0x6C, 13, -26
	banim_frame_oam 0x4000, 0x4000, 0xA8, -19, -10
	banim_frame_oam 0x4000, 0x0, 0xAC, 13, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -13, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, -13, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 19, 8
	banim_frame_oam 0x4000, 0x8000, 0xE, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x12, 14, -24
	banim_frame_oam 0x0, 0x0, 0xA7, -26, -16
	banim_frame_oam 0x4000, 0x0, 0x4F, 14, -8
	banim_frame_oam 0x0, 0x0, 0x4E, 6, -8
	banim_frame_oam 0x4000, 0x0, 0x51, -2, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_28_r:
	banim_frame_oam 0x8000, 0x3000, 0x9D, -11, -15
	banim_frame_oam 0x8000, 0x3000, 0xDD, -3, -15
	banim_frame_oam 0x0, 0x8000, 0x4, -13, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, -13, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 19, 8
	banim_frame_oam 0x4000, 0x8000, 0xE, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x12, 14, -24
	banim_frame_oam 0x0, 0x0, 0xA7, -26, -16
	banim_frame_oam 0x4000, 0x0, 0x4F, 14, -8
	banim_frame_oam 0x0, 0x0, 0x4E, 6, -8
	banim_frame_oam 0x4000, 0x0, 0x51, -2, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x1000, 0x9D, -11, -14
	banim_frame_oam 0x8000, 0x1000, 0xDD, -3, -14
	banim_frame_oam 0x0, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -17, 8
	banim_frame_oam 0x0, 0x0, 0xA3, 15, 8
	banim_frame_oam 0x4000, 0x8000, 0x8, -17, -31
	banim_frame_oam 0x0, 0x4000, 0xC, 15, -31
	banim_frame_oam 0x4000, 0x4000, 0x48, -17, -15
	banim_frame_oam 0x4000, 0x0, 0x4C, 15, -15
	banim_frame_oam 0x0, 0x0, 0xA6, -25, -23
	banim_frame_oam 0x0, 0x0, 0xCB, -25, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x3F, -4, -15
	banim_frame_oam 0x0, 0x1000, 0x3F, -12, -15
	banim_frame_oam 0x0, 0x2000, 0x3F, -4, -7
	banim_frame_oam 0x0, 0x3000, 0x3F, -12, -7
	banim_frame_oam 0x0, 0x4000, 0xA0, -12, -24
	banim_frame_oam 0x8000, 0x0, 0xA2, 4, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -12, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 4, -8
	banim_frame_oam 0x4000, 0x8000, 0xC3, -12, 0
	banim_frame_oam 0x0, 0x0, 0xA5, 20, 8
	banim_frame_oam 0x4000, 0x8000, 0x68, -19, -26
	banim_frame_oam 0x0, 0x4000, 0x6C, 13, -26
	banim_frame_oam 0x4000, 0x4000, 0xA8, -19, -10
	banim_frame_oam 0x4000, 0x0, 0xAC, 13, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x0, 0x1D, -4, -15
	banim_frame_oam 0x8000, 0x1000, 0x1D, -12, -15
	banim_frame_oam 0x0, 0x8000, 0x4, -13, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, -13, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 19, 8
	banim_frame_oam 0x4000, 0x8000, 0xE, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x12, 14, -24
	banim_frame_oam 0x0, 0x0, 0xA7, -26, -16
	banim_frame_oam 0x4000, 0x0, 0x4F, 14, -8
	banim_frame_oam 0x0, 0x0, 0x4E, 6, -8
	banim_frame_oam 0x4000, 0x0, 0x51, -2, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x0, 0x1D, -4, -15
	banim_frame_oam 0x8000, 0x1000, 0x1D, -12, -15
	banim_frame_oam 0x0, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -17, 8
	banim_frame_oam 0x0, 0x0, 0xA3, 15, 8
	banim_frame_oam 0x4000, 0x8000, 0x8, -17, -31
	banim_frame_oam 0x0, 0x4000, 0xC, 15, -31
	banim_frame_oam 0x4000, 0x4000, 0x48, -17, -15
	banim_frame_oam 0x4000, 0x0, 0x4C, 15, -15
	banim_frame_oam 0x0, 0x0, 0xA6, -25, -23
	banim_frame_oam 0x0, 0x0, 0xCB, -25, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_33_r:
	banim_frame_oam 0x8000, 0x0, 0x5D, -4, -15
	banim_frame_oam 0x8000, 0x1000, 0x5D, -12, -15
	banim_frame_oam 0x0, 0x4000, 0xA0, -12, -24
	banim_frame_oam 0x8000, 0x0, 0xA2, 4, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -12, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 4, -8
	banim_frame_oam 0x4000, 0x8000, 0xC3, -12, 0
	banim_frame_oam 0x0, 0x0, 0xA5, 20, 8
	banim_frame_oam 0x4000, 0x8000, 0x68, -19, -26
	banim_frame_oam 0x0, 0x4000, 0x6C, 13, -26
	banim_frame_oam 0x4000, 0x4000, 0xA8, -19, -10
	banim_frame_oam 0x4000, 0x0, 0xAC, 13, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x0, 0x1E, -4, -15
	banim_frame_oam 0x8000, 0x1000, 0x1E, -12, -15
	banim_frame_oam 0x0, 0x8000, 0x4, -13, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, -13, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 19, 8
	banim_frame_oam 0x4000, 0x8000, 0xE, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x12, 14, -24
	banim_frame_oam 0x0, 0x0, 0xA7, -26, -16
	banim_frame_oam 0x4000, 0x0, 0x4F, 14, -8
	banim_frame_oam 0x0, 0x0, 0x4E, 6, -8
	banim_frame_oam 0x4000, 0x0, 0x51, -2, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0xBE, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xFE, -4, -3
	banim_frame_oam 0x0, 0x5000, 0xBE, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xFE, -20, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -17, 8
	banim_frame_oam 0x0, 0x0, 0xA3, 15, 8
	banim_frame_oam 0x4000, 0x8000, 0x8, -17, -31
	banim_frame_oam 0x0, 0x4000, 0xC, 15, -31
	banim_frame_oam 0x4000, 0x4000, 0x48, -17, -15
	banim_frame_oam 0x4000, 0x0, 0x4C, 15, -15
	banim_frame_oam 0x0, 0x0, 0xA6, -25, -23
	banim_frame_oam 0x0, 0x0, 0xCB, -25, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0xBE, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xFE, -4, -3
	banim_frame_oam 0x0, 0x5000, 0xBE, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xFE, -20, -3
	banim_frame_oam 0x0, 0x4000, 0xA0, -12, -24
	banim_frame_oam 0x8000, 0x0, 0xA2, 4, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -12, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 4, -8
	banim_frame_oam 0x4000, 0x8000, 0xC3, -12, 0
	banim_frame_oam 0x0, 0x0, 0xA5, 20, 8
	banim_frame_oam 0x4000, 0x8000, 0x68, -19, -26
	banim_frame_oam 0x0, 0x4000, 0x6C, 13, -26
	banim_frame_oam 0x4000, 0x4000, 0xA8, -19, -10
	banim_frame_oam 0x4000, 0x0, 0xAC, 13, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x4000, 0xBE, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xFE, -4, -3
	banim_frame_oam 0x0, 0x5000, 0xBE, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xFE, -20, -3
	banim_frame_oam 0x0, 0x8000, 0x4, -13, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, -13, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 19, 8
	banim_frame_oam 0x4000, 0x8000, 0xE, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x12, 14, -24
	banim_frame_oam 0x0, 0x0, 0xA7, -26, -16
	banim_frame_oam 0x4000, 0x0, 0x4F, 14, -8
	banim_frame_oam 0x0, 0x0, 0x4E, 6, -8
	banim_frame_oam 0x4000, 0x0, 0x51, -2, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0x5E, -4, -19
	banim_frame_oam 0x4000, 0x1000, 0x9E, -4, -3
	banim_frame_oam 0x0, 0x4000, 0x5E, -20, -19
	banim_frame_oam 0x4000, 0x0, 0x9E, -20, -3
	banim_frame_oam 0x0, 0x8000, 0x4, -13, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, -13, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 19, 8
	banim_frame_oam 0x4000, 0x8000, 0xE, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x12, 14, -24
	banim_frame_oam 0x0, 0x0, 0xA7, -26, -16
	banim_frame_oam 0x4000, 0x0, 0x4F, 14, -8
	banim_frame_oam 0x0, 0x0, 0x4E, 6, -8
	banim_frame_oam 0x4000, 0x0, 0x51, -2, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x5000, 0x5E, -4, -19
	banim_frame_oam 0x4000, 0x1000, 0x9E, -4, -3
	banim_frame_oam 0x0, 0x4000, 0x5E, -20, -19
	banim_frame_oam 0x4000, 0x0, 0x9E, -20, -3
	banim_frame_oam 0x0, 0x4000, 0x6E, -12, -24
	banim_frame_oam 0x8000, 0x0, 0x70, 4, -24
	banim_frame_oam 0x4000, 0x0, 0xAE, -12, -8
	banim_frame_oam 0x0, 0x0, 0xB0, 4, -8
	banim_frame_oam 0x4000, 0x8000, 0x60, -17, 0
	banim_frame_oam 0x0, 0x0, 0xA3, 15, 8
	banim_frame_oam 0x4000, 0x8000, 0x8, -17, -31
	banim_frame_oam 0x0, 0x4000, 0xC, 15, -31
	banim_frame_oam 0x4000, 0x4000, 0x48, -17, -15
	banim_frame_oam 0x4000, 0x0, 0x4C, 15, -15
	banim_frame_oam 0x0, 0x0, 0xA6, -25, -23
	banim_frame_oam 0x0, 0x0, 0xCB, -25, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0x6E, -12, -24
	banim_frame_oam 0x8000, 0x0, 0x70, 4, -24
	banim_frame_oam 0x4000, 0x0, 0xAE, -12, -8
	banim_frame_oam 0x0, 0x0, 0xB0, 4, -8
	banim_frame_oam 0x4000, 0x8000, 0x60, -17, 0
	banim_frame_oam 0x0, 0x0, 0xA3, 15, 8
	banim_frame_oam 0x4000, 0x8000, 0x8, -17, -31
	banim_frame_oam 0x0, 0x4000, 0xC, 15, -31
	banim_frame_oam 0x4000, 0x4000, 0x48, -17, -15
	banim_frame_oam 0x4000, 0x0, 0x4C, 15, -15
	banim_frame_oam 0x0, 0x0, 0xA6, -25, -23
	banim_frame_oam 0x0, 0x0, 0xCB, -25, -15
	banim_frame_end
banim_shaf_mg1_oam_frame_40_r:
	banim_frame_oam 0x4000, 0x8000, 0xCC, -18, -24
	banim_frame_oam 0x4000, 0x0, 0xF0, -10, -8
	banim_frame_oam 0x0, 0x0, 0xF2, 6, -8
	banim_frame_oam 0x4000, 0x8000, 0xC7, -10, 0
	banim_frame_oam 0x0, 0x0, 0xEB, 22, 8
	banim_frame_oam 0x4000, 0x8000, 0x68, -19, -26
	banim_frame_oam 0x0, 0x4000, 0x6C, 13, -26
	banim_frame_oam 0x4000, 0x4000, 0xA8, -19, -10
	banim_frame_oam 0x4000, 0x0, 0xAC, 13, -10
	banim_frame_end
banim_shaf_mg1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0x71, -17, -24
	banim_frame_oam 0x8000, 0x4000, 0x75, 15, -24
	banim_frame_oam 0x8000, 0x0, 0x14, 23, -16
	banim_frame_oam 0x0, 0x0, 0x54, 23, 0
	banim_frame_oam 0x4000, 0x4000, 0xF3, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF7, 16, 8
	banim_frame_end
banim_shaf_mg1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x1A, 15, -16
	banim_frame_oam 0x4000, 0x0, 0xF8, -9, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_43_r:
	banim_frame_oam 0x4000, 0x0, 0xF8, -9, -24
	banim_frame_oam 0x4000, 0x8000, 0x96, -15, -16
	banim_frame_oam 0x4000, 0x4000, 0xD6, -15, 0
	banim_frame_oam 0x4000, 0x0, 0x9A, -7, 8
	banim_frame_oam 0x0, 0x0, 0x9C, 9, 8
	banim_frame_oam 0x0, 0x0, 0xBA, -15, 8
	banim_frame_end
banim_shaf_mg1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x0, 0x5B, -7, -9
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -38, 5
	banim_frame_oam 0x0, 0x0, 0x84, -6, 5
	banim_frame_end
banim_shaf_mg1_oam_frame_48_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 8
	banim_frame_oam 0x4000, 0x4000, 0x68, -17, 8
	banim_frame_oam 0x4000, 0x4000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x0, 0x5B, -7, -9
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 8
	banim_frame_oam 0x4000, 0x4000, 0x68, -17, 8
	banim_frame_oam 0x4000, 0x4000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x8000, 0xA0, -38, 6
	banim_frame_oam 0x8000, 0x0, 0xA4, -6, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x0, 0x5C, -7, -10
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -38, 14
	banim_frame_oam 0x4000, 0x4000, 0x89, -6, 14
	banim_frame_oam 0x4000, 0x0, 0x8D, 26, 14
	banim_frame_oam 0x4000, 0x4000, 0xA0, -38, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -6, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_52_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 8
	banim_frame_oam 0x4000, 0x4000, 0x68, -17, 8
	banim_frame_oam 0x4000, 0x4000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_53_r:
	banim_frame_oam 0x0, 0x0, 0x5D, -3, -14
	banim_frame_oam 0x0, 0x1000, 0x5D, -11, -14
	banim_frame_oam 0x0, 0x2000, 0x5D, -3, -6
	banim_frame_oam 0x0, 0x3000, 0x5D, -11, -6
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 8
	banim_frame_oam 0x4000, 0x4000, 0x68, -17, 8
	banim_frame_oam 0x4000, 0x4000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -38, 6
	banim_frame_oam 0x0, 0x0, 0xA4, -6, 6
	banim_frame_oam 0x4000, 0x4000, 0xC5, -38, 14
	banim_frame_oam 0x0, 0x0, 0xC9, -6, 14
	banim_frame_oam 0x4000, 0x5000, 0xA0, 10, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, 2, 6
	banim_frame_oam 0x4000, 0x5000, 0xC5, 10, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 2, 14
	banim_frame_end
banim_shaf_mg1_oam_frame_54_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_55_r:
	banim_frame_oam 0x4000, 0x0, 0x7B, -12, -14
	banim_frame_oam 0x4000, 0x0, 0xDB, -12, -6
	banim_frame_oam 0x0, 0x8000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x8000, 0xAA, -38, 1
	banim_frame_oam 0x8000, 0x0, 0xAE, -6, 1
	banim_frame_oam 0x4000, 0x4000, 0xEA, -38, 17
	banim_frame_oam 0x0, 0x0, 0xEE, -6, 17
	banim_frame_oam 0x4000, 0x5000, 0xC5, 10, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 2, 14
	banim_frame_oam 0x4000, 0x5000, 0xA0, 10, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, 2, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_56_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_57_r:
	banim_frame_oam 0x0, 0x7000, 0x7D, -12, -15
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -30, 9
	banim_frame_oam 0x4000, 0x8000, 0xAA, -38, 1
	banim_frame_oam 0x8000, 0x0, 0xAE, -6, 1
	banim_frame_oam 0x4000, 0x4000, 0xEA, -38, 17
	banim_frame_oam 0x0, 0x0, 0xEE, -6, 17
	banim_frame_oam 0x4000, 0x5000, 0xC5, 10, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 2, 14
	banim_frame_oam 0x4000, 0x5000, 0xA0, 10, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, 2, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_58_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 8
	banim_frame_oam 0x4000, 0x4000, 0x68, -17, 8
	banim_frame_oam 0x4000, 0x4000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_59_r:
	banim_frame_oam 0x0, 0x6000, 0x7D, -12, -15
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -16, 0
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 8
	banim_frame_oam 0x4000, 0x4000, 0x68, -17, 8
	banim_frame_oam 0x4000, 0x4000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0xAF, -30, 9
	banim_frame_oam 0x4000, 0x8000, 0xAA, -38, 1
	banim_frame_oam 0x8000, 0x0, 0xAE, -6, 1
	banim_frame_oam 0x4000, 0x4000, 0xEA, -38, 17
	banim_frame_oam 0x0, 0x0, 0xEE, -6, 17
	banim_frame_oam 0x4000, 0x5000, 0xC5, 10, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 2, 14
	banim_frame_oam 0x4000, 0x5000, 0xA0, 10, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, 2, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_60_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_61_r:
	banim_frame_oam 0x0, 0x4000, 0x7D, -12, -14
	banim_frame_oam 0x0, 0x8000, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x8000, 0x93, -38, 1
	banim_frame_oam 0x0, 0x4000, 0x97, -6, 1
	banim_frame_oam 0x4000, 0x4000, 0xD3, -38, 17
	banim_frame_oam 0x4000, 0x0, 0xD7, -6, 17
	banim_frame_oam 0x4000, 0x5000, 0xC5, 10, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 2, 14
	banim_frame_oam 0x4000, 0x5000, 0xA0, 10, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, 2, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_62_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x5A, 15, -8
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_63_r:
	banim_frame_oam 0x0, 0x0, 0x5E, -4, -15
	banim_frame_oam 0x0, 0x1000, 0x5E, -12, -15
	banim_frame_oam 0x0, 0x2000, 0x5E, -4, -7
	banim_frame_oam 0x0, 0x3000, 0x5E, -12, -7
	banim_frame_oam 0x0, 0x8000, 0x8, -17, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x0, 0x4000, 0xCF, 2, 9
	banim_frame_oam 0x4000, 0x8000, 0x93, -38, 1
	banim_frame_oam 0x0, 0x4000, 0x97, -6, 1
	banim_frame_oam 0x4000, 0x4000, 0xD3, -38, 17
	banim_frame_oam 0x4000, 0x0, 0xD7, -6, 17
	banim_frame_oam 0x4000, 0x5000, 0xC5, 10, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 10, 14
	banim_frame_oam 0x4000, 0x5000, 0xA0, 10, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, 10, 6
	banim_frame_oam 0x8000, 0x0, 0x3F, 15, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_64_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x10, 15, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_65_r:
	banim_frame_oam 0x8000, 0x0, 0x1C, -4, -15
	banim_frame_oam 0x8000, 0x1000, 0x1C, -12, -15
	banim_frame_oam 0x0, 0x8000, 0xC, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x10, 15, -16
	banim_frame_oam 0x4000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x0, 0x4000, 0xD1, 10, 9
	banim_frame_oam 0x0, 0x4000, 0xCF, 2, 9
	banim_frame_oam 0x4000, 0x8000, 0x93, -38, 1
	banim_frame_oam 0x0, 0x4000, 0x97, -6, 1
	banim_frame_oam 0x4000, 0x4000, 0xD3, -38, 17
	banim_frame_oam 0x4000, 0x0, 0xD7, -6, 17
	banim_frame_oam 0x4000, 0x5000, 0xC5, 10, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 2, 14
	banim_frame_oam 0x4000, 0x5000, 0xA0, 10, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, 2, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_66_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -22, -16
	banim_frame_oam 0x8000, 0x0, 0x15, 10, -16
	banim_frame_oam 0x8000, 0x0, 0x55, 18, -16
	banim_frame_oam 0x4000, 0x4000, 0x99, -14, -24
	banim_frame_end
banim_shaf_mg1_oam_frame_67_r:
	banim_frame_oam 0x8000, 0x0, 0x1D, -4, -15
	banim_frame_oam 0x8000, 0x1000, 0x1D, -12, -15
	banim_frame_oam 0x0, 0x8000, 0x11, -22, -16
	banim_frame_oam 0x8000, 0x0, 0x15, 10, -16
	banim_frame_oam 0x8000, 0x0, 0x55, 18, -16
	banim_frame_oam 0x4000, 0x4000, 0x99, -14, -24
	banim_frame_oam 0x4000, 0x0, 0xF3, 10, 9
	banim_frame_oam 0x0, 0x4000, 0xCF, 2, 9
	banim_frame_oam 0x4000, 0x8000, 0x93, -38, 1
	banim_frame_oam 0x0, 0x4000, 0x97, -6, 1
	banim_frame_oam 0x4000, 0x4000, 0xD3, -38, 17
	banim_frame_oam 0x4000, 0x0, 0xD7, -6, 17
	banim_frame_oam 0x4000, 0x5000, 0xC5, 10, 14
	banim_frame_oam 0x0, 0x1000, 0xC9, 2, 14
	banim_frame_oam 0x4000, 0x5000, 0xA0, 10, 6
	banim_frame_oam 0x0, 0x1000, 0xA4, 2, 6
	banim_frame_end
banim_shaf_mg1_oam_frame_68_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -21, -16
	banim_frame_oam 0x0, 0x4000, 0x1A, 11, -16
	banim_frame_oam 0x4000, 0x4000, 0xB9, -13, -24
	banim_frame_oam 0x8000, 0x0, 0x5A, 11, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_69_r:
	banim_frame_oam 0x8000, 0x1000, 0x1E, -12, -15
	banim_frame_oam 0x8000, 0x0, 0x1E, -4, -15
	banim_frame_oam 0x0, 0x8000, 0x16, -21, -16
	banim_frame_oam 0x0, 0x4000, 0x1A, 11, -16
	banim_frame_oam 0x4000, 0x4000, 0xB9, -13, -24
	banim_frame_oam 0x4000, 0x8000, 0x93, -38, 1
	banim_frame_oam 0x8000, 0x0, 0x97, -6, 1
	banim_frame_oam 0x4000, 0x4000, 0xD3, -38, 17
	banim_frame_oam 0x0, 0x0, 0xD7, -6, 17
	banim_frame_oam 0x4000, 0x9000, 0x93, 10, 1
	banim_frame_oam 0x8000, 0x1000, 0x97, 2, 1
	banim_frame_oam 0x4000, 0x5000, 0xD3, 10, 17
	banim_frame_oam 0x0, 0x1000, 0xD7, 2, 17
	banim_frame_oam 0x8000, 0x0, 0x5A, 11, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_70_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x0, 0x4000, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -17, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 15, -8
	banim_frame_oam 0x0, 0x0, 0x60, -25, -24
	banim_frame_oam 0x4000, 0x0, 0x12, -9, 8
	banim_frame_oam 0x4000, 0x0, 0x61, -9, 0
	banim_frame_oam 0x0, 0x0, 0x52, -25, -16
	banim_frame_oam 0x4000, 0x0, 0x8A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0x63, 7, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_71_r:
	banim_frame_oam 0x0, 0x4000, 0x73, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, -4, -3
	banim_frame_oam 0x0, 0x5000, 0x73, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -20, -3
	banim_frame_oam 0x4000, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x0, 0x4000, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -17, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 15, -8
	banim_frame_oam 0x4000, 0x0, 0x63, -8, -32
	banim_frame_oam 0x0, 0x0, 0x60, -25, -24
	banim_frame_oam 0x4000, 0x0, 0x12, -9, 8
	banim_frame_oam 0x4000, 0x0, 0x61, -9, 0
	banim_frame_oam 0x4000, 0x0, 0x63, 7, 0
	banim_frame_oam 0x4000, 0x8000, 0x19, -38, -2
	banim_frame_oam 0x8000, 0x0, 0x1D, -6, -2
	banim_frame_oam 0x4000, 0x4000, 0x59, -38, 14
	banim_frame_oam 0x0, 0x0, 0x5D, -6, 14
	banim_frame_oam 0x4000, 0x9000, 0x19, 10, -2
	banim_frame_oam 0x8000, 0x1000, 0x1D, 2, -2
	banim_frame_oam 0x4000, 0x5000, 0x59, 10, 14
	banim_frame_oam 0x0, 0x1000, 0x5D, 2, 14
	banim_frame_oam 0x0, 0x0, 0x52, -25, -16
	banim_frame_oam 0x4000, 0x0, 0x8A, -8, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_72_r:
	banim_frame_oam 0x4000, 0x8000, 0x6, -19, -24
	banim_frame_oam 0x0, 0x4000, 0xA, 13, -24
	banim_frame_oam 0x4000, 0x4000, 0x46, -19, -8
	banim_frame_oam 0x4000, 0x0, 0x4A, 13, -8
	banim_frame_oam 0x4000, 0x0, 0x67, -11, 0
	banim_frame_oam 0x4000, 0x0, 0x32, -10, 8
	banim_frame_oam 0x4000, 0x0, 0xAA, -11, -32
	banim_frame_oam 0x0, 0x0, 0xAC, 5, -32
	banim_frame_oam 0x4000, 0x0, 0x69, 5, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_73_r:
	banim_frame_oam 0x0, 0x4000, 0x71, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xB1, -4, -3
	banim_frame_oam 0x0, 0x5000, 0x71, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xB1, -20, -3
	banim_frame_oam 0x4000, 0x8000, 0x6, -19, -24
	banim_frame_oam 0x0, 0x4000, 0xA, 13, -24
	banim_frame_oam 0x4000, 0x4000, 0x46, -19, -8
	banim_frame_oam 0x4000, 0x0, 0x4A, 13, -8
	banim_frame_oam 0x4000, 0x0, 0x67, -11, 0
	banim_frame_oam 0x4000, 0x0, 0x32, -10, 8
	banim_frame_oam 0x4000, 0x0, 0x69, 5, 0
	banim_frame_oam 0x4000, 0x8000, 0x14, -38, -2
	banim_frame_oam 0x8000, 0x0, 0x18, -6, -2
	banim_frame_oam 0x4000, 0x4000, 0x54, -38, 14
	banim_frame_oam 0x0, 0x0, 0x58, -6, 14
	banim_frame_oam 0x4000, 0x9000, 0x14, 10, -2
	banim_frame_oam 0x8000, 0x1000, 0x18, 2, -2
	banim_frame_oam 0x4000, 0x5000, 0x54, 10, 14
	banim_frame_oam 0x0, 0x1000, 0x58, 2, 14
	banim_frame_oam 0x4000, 0x0, 0xAA, -11, -32
	banim_frame_oam 0x0, 0x0, 0xAC, 5, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_74_r:
	banim_frame_oam 0x4000, 0x8000, 0xC, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x10, 14, -24
	banim_frame_oam 0x4000, 0x4000, 0x4C, -18, -8
	banim_frame_oam 0x4000, 0x0, 0x50, 14, -8
	banim_frame_oam 0x4000, 0x0, 0x6D, -10, 0
	banim_frame_oam 0x4000, 0x0, 0x12, -9, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, -2, -32
	banim_frame_oam 0x4000, 0x0, 0x6F, 6, 0
	banim_frame_oam 0x0, 0x0, 0xEA, -26, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_75_r:
	banim_frame_oam 0x0, 0x4000, 0x73, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, -4, -3
	banim_frame_oam 0x0, 0x5000, 0x73, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -20, -3
	banim_frame_oam 0x4000, 0x8000, 0xC, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x10, 14, -24
	banim_frame_oam 0x4000, 0x4000, 0x4C, -18, -8
	banim_frame_oam 0x4000, 0x0, 0x50, 14, -8
	banim_frame_oam 0x4000, 0x0, 0x6D, -10, 0
	banim_frame_oam 0x4000, 0x0, 0x12, -9, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, -2, -32
	banim_frame_oam 0x4000, 0x0, 0x6F, 6, 0
	banim_frame_oam 0x4000, 0x8000, 0x19, -38, -2
	banim_frame_oam 0x8000, 0x0, 0x1D, -6, -2
	banim_frame_oam 0x4000, 0x4000, 0x59, -38, 14
	banim_frame_oam 0x0, 0x0, 0x5D, -6, 14
	banim_frame_oam 0x4000, 0x9000, 0x19, 10, -2
	banim_frame_oam 0x8000, 0x1000, 0x1D, 2, -2
	banim_frame_oam 0x4000, 0x5000, 0x59, 10, 14
	banim_frame_oam 0x0, 0x1000, 0x5D, 2, 14
	banim_frame_oam 0x0, 0x0, 0xEA, -26, -16
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x0, 0x4000, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -17, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 15, -8
	banim_frame_oam 0x0, 0x0, 0x60, -25, -24
	banim_frame_oam 0x4000, 0x0, 0x12, -9, 8
	banim_frame_oam 0x4000, 0x0, 0x61, -9, 0
	banim_frame_oam 0x0, 0x0, 0x52, -25, -16
	banim_frame_oam 0x4000, 0x0, 0x8A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0x63, 7, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0x73, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, -4, -3
	banim_frame_oam 0x0, 0x5000, 0x73, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -20, -3
	banim_frame_oam 0x4000, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x0, 0x4000, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -17, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 15, -8
	banim_frame_oam 0x0, 0x0, 0x60, -25, -24
	banim_frame_oam 0x4000, 0x0, 0x12, -9, 8
	banim_frame_oam 0x4000, 0x0, 0x61, -9, 0
	banim_frame_oam 0x0, 0x0, 0x52, -25, -16
	banim_frame_oam 0x4000, 0x0, 0x8A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0x63, 7, 0
	banim_frame_oam 0x4000, 0x8000, 0x80, -38, 1
	banim_frame_oam 0x8000, 0x0, 0x84, -6, 1
	banim_frame_oam 0x4000, 0x4000, 0xC0, -38, 17
	banim_frame_oam 0x0, 0x0, 0xC4, -6, 17
	banim_frame_oam 0x4000, 0x9000, 0x80, 10, 1
	banim_frame_oam 0x8000, 0x1000, 0x84, 2, 1
	banim_frame_oam 0x4000, 0x5000, 0xC0, 10, 17
	banim_frame_oam 0x0, 0x1000, 0xC4, 2, 17
	banim_frame_end
banim_shaf_mg1_oam_frame_76_r:
	banim_frame_oam 0x4000, 0x8000, 0x6, -19, -24
	banim_frame_oam 0x0, 0x4000, 0xA, 13, -24
	banim_frame_oam 0x4000, 0x4000, 0x46, -19, -8
	banim_frame_oam 0x4000, 0x0, 0x4A, 13, -8
	banim_frame_oam 0x4000, 0x0, 0x67, -11, 0
	banim_frame_oam 0x4000, 0x0, 0x32, -10, 8
	banim_frame_oam 0x4000, 0x0, 0xAA, -11, -32
	banim_frame_oam 0x0, 0x0, 0xAC, 5, -32
	banim_frame_oam 0x4000, 0x0, 0x69, 5, 0
	banim_frame_end
banim_shaf_mg1_oam_frame_77_r:
	banim_frame_oam 0x0, 0x4000, 0x71, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xB1, -4, -3
	banim_frame_oam 0x0, 0x5000, 0x71, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xB1, -20, -3
	banim_frame_oam 0x4000, 0x8000, 0x6, -19, -24
	banim_frame_oam 0x0, 0x4000, 0xA, 13, -24
	banim_frame_oam 0x4000, 0x4000, 0x46, -19, -8
	banim_frame_oam 0x4000, 0x0, 0x4A, 13, -8
	banim_frame_oam 0x4000, 0x0, 0x67, -11, 0
	banim_frame_oam 0x4000, 0x0, 0x32, -10, 8
	banim_frame_oam 0x4000, 0x0, 0xAA, -11, -32
	banim_frame_oam 0x0, 0x0, 0xAC, 5, -32
	banim_frame_oam 0x4000, 0x0, 0x69, 5, 0
	banim_frame_oam 0x4000, 0x8000, 0x85, -37, 5
	banim_frame_oam 0x8000, 0x0, 0x89, -5, 5
	banim_frame_oam 0x4000, 0x9000, 0x85, 11, 5
	banim_frame_oam 0x8000, 0x1000, 0x89, 3, 5
	banim_frame_end
banim_shaf_mg1_oam_frame_78_r:
	banim_frame_oam 0x4000, 0x0, 0xD1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD3, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xC, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x10, 14, -24
	banim_frame_oam 0x4000, 0x4000, 0x4C, -18, -8
	banim_frame_oam 0x4000, 0x0, 0x50, 14, -8
	banim_frame_oam 0x4000, 0x0, 0x6D, -10, 0
	banim_frame_oam 0x4000, 0x0, 0x12, -9, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, -2, -32
	banim_frame_oam 0x4000, 0x0, 0x6F, 6, 0
	banim_frame_oam 0x0, 0x0, 0xEA, -26, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_79_r:
	banim_frame_oam 0x0, 0x4000, 0x73, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, -4, -3
	banim_frame_oam 0x0, 0x5000, 0x73, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -20, -3
	banim_frame_oam 0x4000, 0x0, 0xD1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD3, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xC, -18, -24
	banim_frame_oam 0x0, 0x4000, 0x10, 14, -24
	banim_frame_oam 0x4000, 0x4000, 0x4C, -18, -8
	banim_frame_oam 0x4000, 0x0, 0x50, 14, -8
	banim_frame_oam 0x4000, 0x0, 0x6D, -10, 0
	banim_frame_oam 0x4000, 0x0, 0x12, -9, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, -2, -32
	banim_frame_oam 0x4000, 0x0, 0x6F, 6, 0
	banim_frame_oam 0x4000, 0x8000, 0xC6, -29, 9
	banim_frame_oam 0x4000, 0x9000, 0xC6, 3, 9
	banim_frame_oam 0x0, 0x0, 0xEA, -26, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_80_r:
	banim_frame_oam 0x4000, 0x4000, 0xF0, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x0, 0x4000, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -17, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 15, -8
	banim_frame_oam 0x0, 0x0, 0x60, -25, -24
	banim_frame_oam 0x4000, 0x0, 0x12, -9, 8
	banim_frame_oam 0x4000, 0x0, 0x61, -9, 0
	banim_frame_oam 0x4000, 0x0, 0x8A, -8, -32
	banim_frame_oam 0x0, 0x0, 0x52, -25, -16
	banim_frame_end
banim_shaf_mg1_oam_frame_81_r:
	banim_frame_oam 0x0, 0x4000, 0x71, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xB1, -4, -3
	banim_frame_oam 0x0, 0x5000, 0x71, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xB1, -20, -3
	banim_frame_oam 0x4000, 0x4000, 0xF0, -16, 8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -28, 9
	banim_frame_oam 0x4000, 0x5000, 0xE0, 4, 9
	banim_frame_oam 0x0, 0x0, 0x52, -25, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, -17, -24
	banim_frame_oam 0x0, 0x4000, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -17, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 15, -8
	banim_frame_oam 0x0, 0x0, 0x60, -25, -24
	banim_frame_oam 0x4000, 0x0, 0x61, -9, 0
	banim_frame_oam 0x4000, 0x0, 0x8A, -8, -32
	banim_frame_end
	banim_frame_oam 0x4000, 0x4000, 0xEB, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEF, 16, 8
	banim_frame_oam 0x0, 0x8000, 0x6, -19, -24
	banim_frame_oam 0x8000, 0x8000, 0xA, 13, -24
	banim_frame_oam 0x4000, 0x0, 0xAA, -11, -32
	banim_frame_oam 0x0, 0x0, 0xAC, 5, -32
	banim_frame_end
banim_shaf_mg1_oam_frame_82_r:
	banim_frame_oam 0x0, 0x4000, 0x73, -4, -19
	banim_frame_oam 0x4000, 0x0, 0xB3, -4, -3
	banim_frame_oam 0x0, 0x5000, 0x73, -20, -19
	banim_frame_oam 0x4000, 0x1000, 0xB3, -20, -3
	banim_frame_oam 0x4000, 0x4000, 0xEB, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEF, 16, 8
	banim_frame_oam 0x0, 0x8000, 0x6, -19, -24
	banim_frame_oam 0x8000, 0x8000, 0xA, 13, -24
	banim_frame_oam 0x4000, 0x0, 0xAA, -11, -32
	banim_frame_oam 0x0, 0x0, 0xAC, 5, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -15, 9
	banim_frame_oam 0x4000, 0x1000, 0xE4, 1, 9
	banim_frame_end
banim_shaf_mg1_oam_frame_85_r:
	banim_frame_oam 0x0, 0x8000, 0x7A, -12, -24
	banim_frame_oam 0x4000, 0x4000, 0xFA, -12, 8
	banim_frame_oam 0x8000, 0x4000, 0x79, -20, -24
	banim_frame_oam 0x0, 0x0, 0xF9, -20, 8
	banim_frame_end
banim_shaf_mg1_oam_frame_86_r:
	banim_frame_oam 0x8000, 0x8000, 0x76, -10, -25
	banim_frame_oam 0x8000, 0x4000, 0x78, 6, -25
	banim_frame_oam 0x4000, 0x0, 0xF6, -10, 7
	banim_frame_oam 0x0, 0x0, 0xF8, 6, 7
	banim_frame_end
banim_shaf_mg1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_83_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_shaf_mg1_oam_frame_84_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	.section .data.script
banim_shaf_mg1_script:
banim_shaf_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_frame 6, banim_shaf_mg1_sheet_0, 1, banim_shaf_mg1_oam_frame_1_r - banim_shaf_mg1_oam_r
	banim_code_frame 5, banim_shaf_mg1_sheet_0, 2, banim_shaf_mg1_oam_frame_2_r - banim_shaf_mg1_oam_r
	banim_code_frame 13, banim_shaf_mg1_sheet_0, 3, banim_shaf_mg1_oam_frame_3_r - banim_shaf_mg1_oam_r
	banim_code_sound_elec_charge
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 4, banim_shaf_mg1_oam_frame_4_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 5, banim_shaf_mg1_oam_frame_5_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 6, banim_shaf_mg1_oam_frame_6_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 7, banim_shaf_mg1_oam_frame_7_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 8, banim_shaf_mg1_oam_frame_8_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 5, banim_shaf_mg1_oam_frame_5_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 9, banim_shaf_mg1_oam_frame_9_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 7, banim_shaf_mg1_oam_frame_7_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 10, banim_shaf_mg1_oam_frame_10_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 7, banim_shaf_mg1_oam_frame_7_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 11, banim_shaf_mg1_oam_frame_11_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 12, banim_shaf_mg1_oam_frame_12_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 9, banim_shaf_mg1_oam_frame_9_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 11, banim_shaf_mg1_oam_frame_11_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 12, banim_shaf_mg1_oam_frame_12_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 13, banim_shaf_mg1_oam_frame_13_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 14, banim_shaf_mg1_oam_frame_14_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 15, banim_shaf_mg1_oam_frame_15_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 16, banim_shaf_mg1_oam_frame_16_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 17, banim_shaf_mg1_oam_frame_17_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 18, banim_shaf_mg1_oam_frame_18_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 19, banim_shaf_mg1_oam_frame_19_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 20, banim_shaf_mg1_oam_frame_20_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 21, banim_shaf_mg1_oam_frame_21_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 22, banim_shaf_mg1_oam_frame_22_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 24, banim_shaf_mg1_oam_frame_24_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 26, banim_shaf_mg1_oam_frame_26_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 28, banim_shaf_mg1_oam_frame_28_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 29, banim_shaf_mg1_oam_frame_29_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 30, banim_shaf_mg1_oam_frame_30_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 31, banim_shaf_mg1_oam_frame_31_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 32, banim_shaf_mg1_oam_frame_32_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 33, banim_shaf_mg1_oam_frame_33_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 34, banim_shaf_mg1_oam_frame_34_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 35, banim_shaf_mg1_oam_frame_35_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 36, banim_shaf_mg1_oam_frame_36_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 37, banim_shaf_mg1_oam_frame_37_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 39, banim_shaf_mg1_oam_frame_38_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 40, banim_shaf_mg1_oam_frame_39_r - banim_shaf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 41, banim_shaf_mg1_oam_frame_40_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_shaf_mg1_sheet_1, 42, banim_shaf_mg1_oam_frame_41_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 44, banim_shaf_mg1_oam_frame_43_r - banim_shaf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_shaf_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 6, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 5, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 13, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_sound_elec_charge
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_shaf_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_frame 6, banim_shaf_mg1_sheet_0, 1, banim_shaf_mg1_oam_frame_1_r - banim_shaf_mg1_oam_r
	banim_code_frame 5, banim_shaf_mg1_sheet_0, 2, banim_shaf_mg1_oam_frame_2_r - banim_shaf_mg1_oam_r
	banim_code_frame 18, banim_shaf_mg1_sheet_0, 3, banim_shaf_mg1_oam_frame_3_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 45, banim_shaf_mg1_oam_frame_46_r - banim_shaf_mg1_oam_r
	banim_code_sound_elec_charge
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 46, banim_shaf_mg1_oam_frame_47_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 47, banim_shaf_mg1_oam_frame_48_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 48, banim_shaf_mg1_oam_frame_49_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 49, banim_shaf_mg1_oam_frame_50_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 50, banim_shaf_mg1_oam_frame_51_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 51, banim_shaf_mg1_oam_frame_52_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 52, banim_shaf_mg1_oam_frame_53_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 53, banim_shaf_mg1_oam_frame_54_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 54, banim_shaf_mg1_oam_frame_55_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 55, banim_shaf_mg1_oam_frame_56_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 56, banim_shaf_mg1_oam_frame_57_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 57, banim_shaf_mg1_oam_frame_58_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 58, banim_shaf_mg1_oam_frame_59_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 59, banim_shaf_mg1_oam_frame_60_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 60, banim_shaf_mg1_oam_frame_61_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 61, banim_shaf_mg1_oam_frame_62_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 62, banim_shaf_mg1_oam_frame_63_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 63, banim_shaf_mg1_oam_frame_64_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 64, banim_shaf_mg1_oam_frame_65_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 65, banim_shaf_mg1_oam_frame_66_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 66, banim_shaf_mg1_oam_frame_67_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 67, banim_shaf_mg1_oam_frame_68_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 68, banim_shaf_mg1_oam_frame_69_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 71, banim_shaf_mg1_oam_frame_72_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 72, banim_shaf_mg1_oam_frame_73_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 71, banim_shaf_mg1_oam_frame_72_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 72, banim_shaf_mg1_oam_frame_73_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 73, banim_shaf_mg1_oam_frame_74_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 74, banim_shaf_mg1_oam_frame_75_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 73, banim_shaf_mg1_oam_frame_74_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 74, banim_shaf_mg1_oam_frame_75_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 71, banim_shaf_mg1_oam_frame_72_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 72, banim_shaf_mg1_oam_frame_73_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 71, banim_shaf_mg1_oam_frame_72_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 72, banim_shaf_mg1_oam_frame_73_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 73, banim_shaf_mg1_oam_frame_74_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 74, banim_shaf_mg1_oam_frame_75_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 73, banim_shaf_mg1_oam_frame_74_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 74, banim_shaf_mg1_oam_frame_75_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 77, banim_shaf_mg1_oam_frame_76_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 78, banim_shaf_mg1_oam_frame_77_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 77, banim_shaf_mg1_oam_frame_76_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 78, banim_shaf_mg1_oam_frame_77_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 79, banim_shaf_mg1_oam_frame_78_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 80, banim_shaf_mg1_oam_frame_79_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 79, banim_shaf_mg1_oam_frame_78_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 80, banim_shaf_mg1_oam_frame_79_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 81, banim_shaf_mg1_oam_frame_80_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 82, banim_shaf_mg1_oam_frame_81_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 81, banim_shaf_mg1_oam_frame_80_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 82, banim_shaf_mg1_oam_frame_81_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 84, banim_shaf_mg1_oam_frame_82_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 40, banim_shaf_mg1_oam_frame_39_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 39, banim_shaf_mg1_oam_frame_38_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 40, banim_shaf_mg1_oam_frame_39_r - banim_shaf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 41, banim_shaf_mg1_oam_frame_40_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_shaf_mg1_sheet_1, 42, banim_shaf_mg1_oam_frame_41_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 44, banim_shaf_mg1_oam_frame_43_r - banim_shaf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_shaf_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 6, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 5, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 18, banim_shaf_mg1_sheet_0, 87, banim_shaf_mg1_oam_frame_44_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_sound_elec_charge
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 89, banim_shaf_mg1_oam_frame_83_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 90, banim_shaf_mg1_oam_frame_84_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 88, banim_shaf_mg1_oam_frame_45_r - banim_shaf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_shaf_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_frame 6, banim_shaf_mg1_sheet_0, 1, banim_shaf_mg1_oam_frame_1_r - banim_shaf_mg1_oam_r
	banim_code_frame 5, banim_shaf_mg1_sheet_0, 2, banim_shaf_mg1_oam_frame_2_r - banim_shaf_mg1_oam_r
	banim_code_frame 13, banim_shaf_mg1_sheet_0, 3, banim_shaf_mg1_oam_frame_3_r - banim_shaf_mg1_oam_r
	banim_code_sound_elec_charge
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 4, banim_shaf_mg1_oam_frame_4_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 5, banim_shaf_mg1_oam_frame_5_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 6, banim_shaf_mg1_oam_frame_6_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 7, banim_shaf_mg1_oam_frame_7_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 8, banim_shaf_mg1_oam_frame_8_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 5, banim_shaf_mg1_oam_frame_5_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 9, banim_shaf_mg1_oam_frame_9_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 7, banim_shaf_mg1_oam_frame_7_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 10, banim_shaf_mg1_oam_frame_10_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 7, banim_shaf_mg1_oam_frame_7_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 11, banim_shaf_mg1_oam_frame_11_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 12, banim_shaf_mg1_oam_frame_12_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 9, banim_shaf_mg1_oam_frame_9_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 11, banim_shaf_mg1_oam_frame_11_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 12, banim_shaf_mg1_oam_frame_12_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 13, banim_shaf_mg1_oam_frame_13_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 14, banim_shaf_mg1_oam_frame_14_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 15, banim_shaf_mg1_oam_frame_15_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 16, banim_shaf_mg1_oam_frame_16_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 17, banim_shaf_mg1_oam_frame_17_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 18, banim_shaf_mg1_oam_frame_18_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 19, banim_shaf_mg1_oam_frame_19_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 20, banim_shaf_mg1_oam_frame_20_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 21, banim_shaf_mg1_oam_frame_21_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 22, banim_shaf_mg1_oam_frame_22_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 24, banim_shaf_mg1_oam_frame_24_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 26, banim_shaf_mg1_oam_frame_26_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 28, banim_shaf_mg1_oam_frame_28_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 29, banim_shaf_mg1_oam_frame_29_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 30, banim_shaf_mg1_oam_frame_30_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 31, banim_shaf_mg1_oam_frame_31_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 32, banim_shaf_mg1_oam_frame_32_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 33, banim_shaf_mg1_oam_frame_33_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 34, banim_shaf_mg1_oam_frame_34_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 35, banim_shaf_mg1_oam_frame_35_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 36, banim_shaf_mg1_oam_frame_36_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 37, banim_shaf_mg1_oam_frame_37_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 39, banim_shaf_mg1_oam_frame_38_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 40, banim_shaf_mg1_oam_frame_39_r - banim_shaf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 41, banim_shaf_mg1_oam_frame_40_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_shaf_mg1_sheet_1, 42, banim_shaf_mg1_oam_frame_41_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 44, banim_shaf_mg1_oam_frame_43_r - banim_shaf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_shaf_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_frame 6, banim_shaf_mg1_sheet_0, 1, banim_shaf_mg1_oam_frame_1_r - banim_shaf_mg1_oam_r
	banim_code_frame 5, banim_shaf_mg1_sheet_0, 2, banim_shaf_mg1_oam_frame_2_r - banim_shaf_mg1_oam_r
	banim_code_frame 18, banim_shaf_mg1_sheet_0, 3, banim_shaf_mg1_oam_frame_3_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 45, banim_shaf_mg1_oam_frame_46_r - banim_shaf_mg1_oam_r
	banim_code_sound_elec_charge
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 46, banim_shaf_mg1_oam_frame_47_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 47, banim_shaf_mg1_oam_frame_48_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 48, banim_shaf_mg1_oam_frame_49_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 49, banim_shaf_mg1_oam_frame_50_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 50, banim_shaf_mg1_oam_frame_51_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 51, banim_shaf_mg1_oam_frame_52_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 52, banim_shaf_mg1_oam_frame_53_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 53, banim_shaf_mg1_oam_frame_54_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 54, banim_shaf_mg1_oam_frame_55_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 55, banim_shaf_mg1_oam_frame_56_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 56, banim_shaf_mg1_oam_frame_57_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 57, banim_shaf_mg1_oam_frame_58_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 58, banim_shaf_mg1_oam_frame_59_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_2, 59, banim_shaf_mg1_oam_frame_60_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 60, banim_shaf_mg1_oam_frame_61_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 61, banim_shaf_mg1_oam_frame_62_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 62, banim_shaf_mg1_oam_frame_63_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 63, banim_shaf_mg1_oam_frame_64_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 64, banim_shaf_mg1_oam_frame_65_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 65, banim_shaf_mg1_oam_frame_66_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 66, banim_shaf_mg1_oam_frame_67_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 67, banim_shaf_mg1_oam_frame_68_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_2, 68, banim_shaf_mg1_oam_frame_69_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 71, banim_shaf_mg1_oam_frame_72_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 72, banim_shaf_mg1_oam_frame_73_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 71, banim_shaf_mg1_oam_frame_72_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 72, banim_shaf_mg1_oam_frame_73_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 73, banim_shaf_mg1_oam_frame_74_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 74, banim_shaf_mg1_oam_frame_75_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 73, banim_shaf_mg1_oam_frame_74_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 74, banim_shaf_mg1_oam_frame_75_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 71, banim_shaf_mg1_oam_frame_72_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 72, banim_shaf_mg1_oam_frame_73_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 71, banim_shaf_mg1_oam_frame_72_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 72, banim_shaf_mg1_oam_frame_73_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 73, banim_shaf_mg1_oam_frame_74_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 74, banim_shaf_mg1_oam_frame_75_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 73, banim_shaf_mg1_oam_frame_74_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 74, banim_shaf_mg1_oam_frame_75_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 69, banim_shaf_mg1_oam_frame_70_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 70, banim_shaf_mg1_oam_frame_71_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 77, banim_shaf_mg1_oam_frame_76_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 78, banim_shaf_mg1_oam_frame_77_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 77, banim_shaf_mg1_oam_frame_76_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 78, banim_shaf_mg1_oam_frame_77_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 79, banim_shaf_mg1_oam_frame_78_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 80, banim_shaf_mg1_oam_frame_79_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 79, banim_shaf_mg1_oam_frame_78_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 80, banim_shaf_mg1_oam_frame_79_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 81, banim_shaf_mg1_oam_frame_80_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 82, banim_shaf_mg1_oam_frame_81_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_3, 81, banim_shaf_mg1_oam_frame_80_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 82, banim_shaf_mg1_oam_frame_81_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 84, banim_shaf_mg1_oam_frame_82_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 40, banim_shaf_mg1_oam_frame_39_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 39, banim_shaf_mg1_oam_frame_38_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 40, banim_shaf_mg1_oam_frame_39_r - banim_shaf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 41, banim_shaf_mg1_oam_frame_40_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_shaf_mg1_sheet_1, 42, banim_shaf_mg1_oam_frame_41_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 44, banim_shaf_mg1_oam_frame_43_r - banim_shaf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_shaf_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_shaf_mg1_sheet_3, 85, banim_shaf_mg1_oam_frame_85_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 86, banim_shaf_mg1_oam_frame_86_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_shaf_mg1_sheet_3, 85, banim_shaf_mg1_oam_frame_85_r - banim_shaf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_shaf_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_shaf_mg1_sheet_3, 85, banim_shaf_mg1_oam_frame_85_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_3, 86, banim_shaf_mg1_oam_frame_86_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_shaf_mg1_sheet_3, 85, banim_shaf_mg1_oam_frame_85_r - banim_shaf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_shaf_mg1_mode_stand_close:
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_shaf_mg1_mode_stand:
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_shaf_mg1_mode_stand_range:
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_shaf_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_shaf_mg1_sheet_0, 0, banim_shaf_mg1_oam_frame_0_r - banim_shaf_mg1_oam_r
	banim_code_frame 6, banim_shaf_mg1_sheet_0, 1, banim_shaf_mg1_oam_frame_1_r - banim_shaf_mg1_oam_r
	banim_code_frame 5, banim_shaf_mg1_sheet_0, 2, banim_shaf_mg1_oam_frame_2_r - banim_shaf_mg1_oam_r
	banim_code_frame 13, banim_shaf_mg1_sheet_0, 3, banim_shaf_mg1_oam_frame_3_r - banim_shaf_mg1_oam_r
	banim_code_sound_elec_charge
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 4, banim_shaf_mg1_oam_frame_4_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 5, banim_shaf_mg1_oam_frame_5_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 6, banim_shaf_mg1_oam_frame_6_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 7, banim_shaf_mg1_oam_frame_7_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 8, banim_shaf_mg1_oam_frame_8_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 5, banim_shaf_mg1_oam_frame_5_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 9, banim_shaf_mg1_oam_frame_9_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 7, banim_shaf_mg1_oam_frame_7_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 10, banim_shaf_mg1_oam_frame_10_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 7, banim_shaf_mg1_oam_frame_7_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 11, banim_shaf_mg1_oam_frame_11_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 12, banim_shaf_mg1_oam_frame_12_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 9, banim_shaf_mg1_oam_frame_9_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 11, banim_shaf_mg1_oam_frame_11_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 12, banim_shaf_mg1_oam_frame_12_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 13, banim_shaf_mg1_oam_frame_13_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 14, banim_shaf_mg1_oam_frame_14_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 15, banim_shaf_mg1_oam_frame_15_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 16, banim_shaf_mg1_oam_frame_16_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 17, banim_shaf_mg1_oam_frame_17_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 18, banim_shaf_mg1_oam_frame_18_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 19, banim_shaf_mg1_oam_frame_19_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 20, banim_shaf_mg1_oam_frame_20_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 21, banim_shaf_mg1_oam_frame_21_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_0, 22, banim_shaf_mg1_oam_frame_22_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 24, banim_shaf_mg1_oam_frame_24_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 26, banim_shaf_mg1_oam_frame_26_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 28, banim_shaf_mg1_oam_frame_28_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 29, banim_shaf_mg1_oam_frame_29_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 30, banim_shaf_mg1_oam_frame_30_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 31, banim_shaf_mg1_oam_frame_31_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 32, banim_shaf_mg1_oam_frame_32_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 33, banim_shaf_mg1_oam_frame_33_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 34, banim_shaf_mg1_oam_frame_34_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 23, banim_shaf_mg1_oam_frame_23_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 35, banim_shaf_mg1_oam_frame_35_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 25, banim_shaf_mg1_oam_frame_25_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 36, banim_shaf_mg1_oam_frame_36_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 27, banim_shaf_mg1_oam_frame_27_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 37, banim_shaf_mg1_oam_frame_37_r - banim_shaf_mg1_oam_r
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 39, banim_shaf_mg1_oam_frame_38_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 40, banim_shaf_mg1_oam_frame_39_r - banim_shaf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_shaf_mg1_sheet_1, 41, banim_shaf_mg1_oam_frame_40_r - banim_shaf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_shaf_mg1_sheet_1, 42, banim_shaf_mg1_oam_frame_41_r - banim_shaf_mg1_oam_r
	banim_code_frame 2, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 43, banim_shaf_mg1_oam_frame_42_r - banim_shaf_mg1_oam_r
	banim_code_frame 3, banim_shaf_mg1_sheet_1, 44, banim_shaf_mg1_oam_frame_43_r - banim_shaf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_shaf_mg1_mode_attack_close - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_attack_close_back - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_attack_close_critical - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_attack_close_critical_back - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_attack_range - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_attack_range_critical - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_dodge_close - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_dodge_range - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_stand_close - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_stand - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_stand_range - banim_shaf_mg1_script
	.word banim_shaf_mg1_mode_attack_miss - banim_shaf_mg1_script
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

