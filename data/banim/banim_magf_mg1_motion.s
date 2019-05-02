@ vim:ft=armv4
	.global banim_magf_mg1_script
	.global banim_magf_mg1_oam_r
	.global banim_magf_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x6B
	.section .data.oam_l
banim_magf_mg1_oam_l:
banim_magf_mg1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, -8, -24
	banim_frame_end
banim_magf_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0x44, -9, -24
	banim_frame_end
banim_magf_mg1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -18, -16
	banim_frame_oam 0x4000, 0x1000, 0xE, -12, -24
	banim_frame_end
banim_magf_mg1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -25, -16
	banim_frame_oam 0x4000, 0x1000, 0x2E, -17, -24
	banim_frame_end
banim_magf_mg1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -25, -16
	banim_frame_oam 0x4000, 0x1000, 0x4E, -25, -24
	banim_frame_end
banim_magf_mg1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x18, -30, -17
	banim_frame_oam 0x4000, 0x1000, 0x1C, -22, -25
	banim_frame_oam 0x0, 0x1000, 0x1E, -30, -25
	banim_frame_end
banim_magf_mg1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -33, -18
	banim_frame_oam 0x4000, 0x1000, 0x84, -17, -26
	banim_frame_oam 0x4000, 0x1000, 0xA4, -33, -26
	banim_frame_end
banim_magf_mg1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0xDA, -12, -22
	banim_frame_oam 0x0, 0x9000, 0x86, -33, -18
	banim_frame_oam 0x4000, 0x1000, 0x84, -17, -26
	banim_frame_oam 0x4000, 0x1000, 0xA4, -33, -26
	banim_frame_oam 0x8000, 0x1000, 0xC4, -41, -18
	banim_frame_oam 0x0, 0x1000, 0xC5, -41, -2
	banim_frame_end
banim_magf_mg1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x8A, -38, -17
	banim_frame_oam 0x0, 0x1000, 0xEF, -6, 7
	banim_frame_oam 0x8000, 0x1000, 0xCE, -6, -17
	banim_frame_oam 0x4000, 0x1000, 0xAE, -30, -25
	banim_frame_oam 0x4000, 0x1000, 0x8E, -14, -25
	banim_frame_end
banim_magf_mg1_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x9000, 0x9C, -4, -23
	banim_frame_oam 0x8000, 0x5000, 0x9E, -12, -23
	banim_frame_oam 0x0, 0x1000, 0xFF, -20, 1
	banim_frame_oam 0x0, 0x9000, 0x90, -37, -17
	banim_frame_oam 0x0, 0x1000, 0xF4, -45, 7
	banim_frame_oam 0x0, 0x5000, 0x94, -53, -14
	banim_frame_oam 0x0, 0x1000, 0xD4, -29, -25
	banim_frame_end
banim_magf_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x96, -37, -17
	banim_frame_oam 0x0, 0x5000, 0x9A, -53, -14
	banim_frame_oam 0x0, 0x1000, 0xE5, -29, -25
	banim_frame_end
banim_magf_mg1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -37, -17
	banim_frame_oam 0x0, 0x5000, 0x44, -53, -17
	banim_frame_oam 0x4000, 0x1000, 0x4, -37, -25
	banim_frame_oam 0x4000, 0x1000, 0x24, -53, -25
	banim_frame_end
banim_magf_mg1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -37, -17
	banim_frame_oam 0x0, 0x5000, 0xA, -53, -17
	banim_frame_oam 0x4000, 0x1000, 0x4A, -53, -1
	banim_frame_oam 0x0, 0x1000, 0x6A, -29, -25
	banim_frame_end
banim_magf_mg1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -37, -17
	banim_frame_oam 0x0, 0x5000, 0x10, -53, -9
	banim_frame_oam 0x4000, 0x1000, 0x50, -53, 7
	banim_frame_oam 0x0, 0x1000, 0x70, -29, -25
	banim_frame_end
banim_magf_mg1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -37, -17
	banim_frame_oam 0x8000, 0x1000, 0x16, -45, -1
	banim_frame_oam 0x0, 0x1000, 0x76, -29, -25
	banim_frame_oam 0x0, 0x1000, 0x3F, -45, -9
	banim_frame_end
banim_magf_mg1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -37, -17
	banim_frame_oam 0x0, 0x1000, 0x7F, -29, -25
	banim_frame_end
banim_magf_mg1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x9000, 0x1B, -37, -17
	banim_frame_oam 0x0, 0x1000, 0x5F, -24, -25
	banim_frame_end
banim_magf_mg1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -33, -15
	banim_frame_oam 0x4000, 0x1000, 0x84, -25, -23
	banim_frame_end
banim_magf_mg1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x9000, 0x86, -27, -16
	banim_frame_oam 0x4000, 0x1000, 0xA4, -19, -24
	banim_frame_end
banim_magf_mg1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x8A, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xBE, -10, -24
	banim_frame_end
banim_magf_mg1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x24, 6, -15
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, -8, -24
	banim_frame_end
banim_magf_mg1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x8E, -19, -16
	banim_frame_oam 0x4000, 0x1000, 0xC4, -11, -24
	banim_frame_end
banim_magf_mg1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x92, -21, -15
	banim_frame_end
banim_magf_mg1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0x96, -19, -15
	banim_frame_oam 0x8000, 0x1000, 0xDE, -27, -7
	banim_frame_end
banim_magf_mg1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x9000, 0x9A, -26, -15
	banim_frame_end
banim_magf_mg1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -19, -16
	banim_frame_end
banim_magf_mg1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x1D, -3, -24
	banim_frame_end
banim_magf_mg1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x8, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0x10, -9, -24
	banim_frame_end
banim_magf_mg1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -26, -14
	banim_frame_oam 0x4000, 0x1000, 0x30, -20, -22
	banim_frame_end
banim_magf_mg1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x9F, -8, -8
	banim_frame_end
banim_magf_mg1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_magf_mg1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x1000, 0x9F, -8, -8
	banim_frame_end
banim_magf_mg1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_magf_mg1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x1D, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x1E, 6, -24
	banim_frame_end
banim_magf_mg1_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x9000, 0x56, -17, 0
	banim_frame_oam 0x0, 0x5000, 0x1A, -1, -16
	banim_frame_oam 0x8000, 0x1000, 0x1C, -9, -16
	banim_frame_oam 0x0, 0x1000, 0x39, -17, -8
	banim_frame_oam 0x4000, 0x1000, 0x50, -10, -24
	banim_frame_end
banim_magf_mg1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0x16, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0x50, -10, -24
	banim_frame_end
banim_magf_mg1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0x50, -9, -24
	banim_frame_end
banim_magf_mg1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x9000, 0x84, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0x50, -9, -24
	banim_frame_end
banim_magf_mg1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x5000, 0x8E, -33, -17
	banim_frame_oam 0x8000, 0x1000, 0x90, -41, -17
	banim_frame_oam 0x4000, 0x1000, 0xCE, -33, -1
	banim_frame_oam 0x0, 0x1000, 0xB1, -49, -9
	banim_frame_oam 0x8000, 0x1000, 0xAD, -17, -9
	banim_frame_oam 0x4000, 0x1000, 0xE8, -25, 7
	banim_frame_oam 0x0, 0x1000, 0xEA, -33, 7
	banim_frame_oam 0x0, 0x1000, 0x8D, -17, -17
	banim_frame_oam 0x0, 0x1000, 0xCB, -25, -25
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_magf_mg1_oam_r:
banim_magf_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x4, -8, -24
	banim_frame_end
banim_magf_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -15, -16
	banim_frame_oam 0x4000, 0x0, 0x44, -7, -24
	banim_frame_end
banim_magf_mg1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -14, -16
	banim_frame_oam 0x4000, 0x0, 0xE, -4, -24
	banim_frame_end
banim_magf_mg1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -7, -16
	banim_frame_oam 0x4000, 0x0, 0x2E, 1, -24
	banim_frame_end
banim_magf_mg1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -7, -16
	banim_frame_oam 0x4000, 0x0, 0x4E, 9, -24
	banim_frame_end
banim_magf_mg1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -2, -17
	banim_frame_oam 0x4000, 0x0, 0x1C, 6, -25
	banim_frame_oam 0x0, 0x0, 0x1E, 22, -25
	banim_frame_end
banim_magf_mg1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x80, 1, -18
	banim_frame_oam 0x4000, 0x0, 0x84, 1, -26
	banim_frame_oam 0x4000, 0x0, 0xA4, 17, -26
	banim_frame_end
banim_magf_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0xDA, -4, -22
	banim_frame_oam 0x0, 0x8000, 0x86, 1, -18
	banim_frame_oam 0x4000, 0x0, 0x84, 1, -26
	banim_frame_oam 0x4000, 0x0, 0xA4, 17, -26
	banim_frame_oam 0x8000, 0x0, 0xC4, 33, -18
	banim_frame_oam 0x0, 0x0, 0xC5, 33, -2
	banim_frame_end
banim_magf_mg1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x8A, 6, -17
	banim_frame_oam 0x0, 0x0, 0xEF, -2, 7
	banim_frame_oam 0x8000, 0x0, 0xCE, -2, -17
	banim_frame_oam 0x4000, 0x0, 0xAE, 14, -25
	banim_frame_oam 0x4000, 0x0, 0x8E, -2, -25
	banim_frame_end
banim_magf_mg1_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x8000, 0x9C, -12, -23
	banim_frame_oam 0x8000, 0x4000, 0x9E, 4, -23
	banim_frame_oam 0x0, 0x0, 0xFF, 12, 1
	banim_frame_oam 0x0, 0x8000, 0x90, 5, -17
	banim_frame_oam 0x0, 0x0, 0xF4, 37, 7
	banim_frame_oam 0x0, 0x4000, 0x94, 37, -14
	banim_frame_oam 0x0, 0x0, 0xD4, 21, -25
	banim_frame_end
banim_magf_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x96, 5, -17
	banim_frame_oam 0x0, 0x4000, 0x9A, 37, -14
	banim_frame_oam 0x0, 0x0, 0xE5, 21, -25
	banim_frame_end
banim_magf_mg1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x0, 5, -17
	banim_frame_oam 0x0, 0x4000, 0x44, 37, -17
	banim_frame_oam 0x4000, 0x0, 0x4, 21, -25
	banim_frame_oam 0x4000, 0x0, 0x24, 37, -25
	banim_frame_end
banim_magf_mg1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x6, 5, -17
	banim_frame_oam 0x0, 0x4000, 0xA, 37, -17
	banim_frame_oam 0x4000, 0x0, 0x4A, 37, -1
	banim_frame_oam 0x0, 0x0, 0x6A, 21, -25
	banim_frame_end
banim_magf_mg1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0xC, 5, -17
	banim_frame_oam 0x0, 0x4000, 0x10, 37, -9
	banim_frame_oam 0x4000, 0x0, 0x50, 37, 7
	banim_frame_oam 0x0, 0x0, 0x70, 21, -25
	banim_frame_end
banim_magf_mg1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x12, 5, -17
	banim_frame_oam 0x8000, 0x0, 0x16, 37, -1
	banim_frame_oam 0x0, 0x0, 0x76, 21, -25
	banim_frame_oam 0x0, 0x0, 0x3F, 37, -9
	banim_frame_end
banim_magf_mg1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x17, 5, -17
	banim_frame_oam 0x0, 0x0, 0x7F, 21, -25
	banim_frame_end
banim_magf_mg1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x8000, 0x1B, 5, -17
	banim_frame_oam 0x0, 0x0, 0x5F, 16, -25
	banim_frame_end
banim_magf_mg1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x8000, 0x80, 1, -15
	banim_frame_oam 0x4000, 0x0, 0x84, 9, -23
	banim_frame_end
banim_magf_mg1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x8000, 0x86, -5, -16
	banim_frame_oam 0x4000, 0x0, 0xA4, 3, -24
	banim_frame_end
banim_magf_mg1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x8A, -7, -16
	banim_frame_oam 0x0, 0x0, 0xBE, 2, -24
	banim_frame_end
banim_magf_mg1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x24, -14, -15
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x4, -8, -24
	banim_frame_end
banim_magf_mg1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x8E, -13, -16
	banim_frame_oam 0x4000, 0x0, 0xC4, -5, -24
	banim_frame_end
banim_magf_mg1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x92, -11, -15
	banim_frame_end
banim_magf_mg1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0x96, -13, -15
	banim_frame_oam 0x8000, 0x0, 0xDE, 19, -7
	banim_frame_end
banim_magf_mg1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x8000, 0x9A, -6, -15
	banim_frame_end
banim_magf_mg1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -13, -16
	banim_frame_end
banim_magf_mg1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -16, -16
	banim_frame_oam 0x0, 0x0, 0x1D, -5, -24
	banim_frame_end
banim_magf_mg1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -15, -16
	banim_frame_oam 0x4000, 0x0, 0x10, -7, -24
	banim_frame_end
banim_magf_mg1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -6, -14
	banim_frame_oam 0x4000, 0x0, 0x30, 4, -22
	banim_frame_end
banim_magf_mg1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x9F, 0, -8
	banim_frame_end
banim_magf_mg1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_magf_mg1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x0, 0x9F, 0, -8
	banim_frame_end
banim_magf_mg1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_magf_mg1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -16, -16
	banim_frame_oam 0x0, 0x0, 0x1D, -5, -24
	banim_frame_oam 0x0, 0x0, 0x1E, -14, -24
	banim_frame_end
banim_magf_mg1_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x8000, 0x56, -15, 0
	banim_frame_oam 0x0, 0x4000, 0x1A, -15, -16
	banim_frame_oam 0x8000, 0x0, 0x1C, 1, -16
	banim_frame_oam 0x0, 0x0, 0x39, 9, -8
	banim_frame_oam 0x4000, 0x0, 0x50, -6, -24
	banim_frame_end
banim_magf_mg1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -15, -16
	banim_frame_oam 0x4000, 0x0, 0x50, -6, -24
	banim_frame_end
banim_magf_mg1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -15, -16
	banim_frame_oam 0x4000, 0x0, 0x50, -7, -24
	banim_frame_end
banim_magf_mg1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x8000, 0x84, -15, -16
	banim_frame_oam 0x4000, 0x0, 0x50, -7, -24
	banim_frame_end
banim_magf_mg1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x4000, 0x8E, 17, -17
	banim_frame_oam 0x8000, 0x0, 0x90, 33, -17
	banim_frame_oam 0x4000, 0x0, 0xCE, 17, -1
	banim_frame_oam 0x0, 0x0, 0xB1, 41, -9
	banim_frame_oam 0x8000, 0x0, 0xAD, 9, -9
	banim_frame_oam 0x4000, 0x0, 0xE8, 9, 7
	banim_frame_oam 0x0, 0x0, 0xEA, 25, 7
	banim_frame_oam 0x0, 0x0, 0x8D, 9, -17
	banim_frame_oam 0x0, 0x0, 0xCB, 17, -25
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_magf_mg1_script:
banim_magf_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 21, banim_magf_mg1_oam_frame_25_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 22, banim_magf_mg1_oam_frame_26_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 23, banim_magf_mg1_oam_frame_27_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 24, banim_magf_mg1_oam_frame_28_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_2, 25, banim_magf_mg1_oam_frame_29_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 3, banim_magf_mg1_sheet_2, 26, banim_magf_mg1_oam_frame_30_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 34, banim_magf_mg1_oam_frame_31_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 35, banim_magf_mg1_oam_frame_32_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 36, banim_magf_mg1_oam_frame_33_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 37, banim_magf_mg1_oam_frame_34_r - banim_magf_mg1_oam_r
	banim_code_frame 11, banim_magf_mg1_sheet_2, 38, banim_magf_mg1_oam_frame_35_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 32, banim_magf_mg1_oam_frame_36_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 32, banim_magf_mg1_oam_frame_36_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 32, banim_magf_mg1_oam_frame_36_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 32, banim_magf_mg1_oam_frame_36_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 3, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 11, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 33, banim_magf_mg1_oam_frame_24_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 31, banim_magf_mg1_oam_frame_23_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 29, banim_magf_mg1_oam_frame_22_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 21, banim_magf_mg1_oam_frame_25_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 22, banim_magf_mg1_oam_frame_26_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 23, banim_magf_mg1_oam_frame_27_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_1, 24, banim_magf_mg1_oam_frame_28_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_2, 25, banim_magf_mg1_oam_frame_29_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 3, banim_magf_mg1_sheet_2, 26, banim_magf_mg1_oam_frame_30_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 34, banim_magf_mg1_oam_frame_31_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 35, banim_magf_mg1_oam_frame_32_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_2, 36, banim_magf_mg1_oam_frame_33_r - banim_magf_mg1_oam_r
	banim_code_frame 3, banim_magf_mg1_sheet_2, 37, banim_magf_mg1_oam_frame_34_r - banim_magf_mg1_oam_r
	banim_code_frame 11, banim_magf_mg1_sheet_2, 38, banim_magf_mg1_oam_frame_35_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_magf_mg1_sheet_2, 27, banim_magf_mg1_oam_frame_37_r - banim_magf_mg1_oam_r
	banim_code_frame 1, banim_magf_mg1_sheet_2, 28, banim_magf_mg1_oam_frame_38_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_magf_mg1_sheet_2, 27, banim_magf_mg1_oam_frame_37_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_magf_mg1_sheet_2, 27, banim_magf_mg1_oam_frame_37_r - banim_magf_mg1_oam_r
	banim_code_frame 1, banim_magf_mg1_sheet_2, 28, banim_magf_mg1_oam_frame_38_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_magf_mg1_sheet_2, 27, banim_magf_mg1_oam_frame_37_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_magf_mg1_mode_stand_close:
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_magf_mg1_mode_stand:
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_magf_mg1_mode_stand_range:
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_magf_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_magf_mg1_sheet_0, 0, banim_magf_mg1_oam_frame_0_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 1, banim_magf_mg1_oam_frame_1_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 2, banim_magf_mg1_oam_frame_2_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 3, banim_magf_mg1_oam_frame_3_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_magf_mg1_sheet_0, 4, banim_magf_mg1_oam_frame_4_r - banim_magf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 4, banim_magf_mg1_sheet_0, 5, banim_magf_mg1_oam_frame_5_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 6, banim_magf_mg1_oam_frame_6_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_0, 7, banim_magf_mg1_oam_frame_7_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_0, 8, banim_magf_mg1_oam_frame_8_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_call_spell_anim
	banim_code_frame 3, banim_magf_mg1_sheet_0, 9, banim_magf_mg1_oam_frame_9_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_0, 10, banim_magf_mg1_oam_frame_10_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 11, banim_magf_mg1_oam_frame_11_r - banim_magf_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_magf_mg1_sheet_2, 39, banim_magf_mg1_oam_frame_12_r - banim_magf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_magf_mg1_sheet_1, 12, banim_magf_mg1_oam_frame_13_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 13, banim_magf_mg1_oam_frame_14_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 14, banim_magf_mg1_oam_frame_15_r - banim_magf_mg1_oam_r
	banim_code_frame 8, banim_magf_mg1_sheet_1, 15, banim_magf_mg1_oam_frame_16_r - banim_magf_mg1_oam_r
	banim_code_frame 2, banim_magf_mg1_sheet_1, 16, banim_magf_mg1_oam_frame_17_r - banim_magf_mg1_oam_r
	banim_code_frame 4, banim_magf_mg1_sheet_1, 17, banim_magf_mg1_oam_frame_18_r - banim_magf_mg1_oam_r
	banim_code_frame 5, banim_magf_mg1_sheet_1, 18, banim_magf_mg1_oam_frame_19_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_magf_mg1_sheet_1, 19, banim_magf_mg1_oam_frame_20_r - banim_magf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_magf_mg1_sheet_0, 20, banim_magf_mg1_oam_frame_21_r - banim_magf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_magf_mg1_mode_attack_close - banim_magf_mg1_script
	.word banim_magf_mg1_mode_attack_close_back - banim_magf_mg1_script
	.word banim_magf_mg1_mode_attack_close_critical - banim_magf_mg1_script
	.word banim_magf_mg1_mode_attack_close_critical_back - banim_magf_mg1_script
	.word banim_magf_mg1_mode_attack_range - banim_magf_mg1_script
	.word banim_magf_mg1_mode_attack_range_critical - banim_magf_mg1_script
	.word banim_magf_mg1_mode_dodge_close - banim_magf_mg1_script
	.word banim_magf_mg1_mode_dodge_range - banim_magf_mg1_script
	.word banim_magf_mg1_mode_stand_close - banim_magf_mg1_script
	.word banim_magf_mg1_mode_stand - banim_magf_mg1_script
	.word banim_magf_mg1_mode_stand_range - banim_magf_mg1_script
	.word banim_magf_mg1_mode_attack_miss - banim_magf_mg1_script
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

