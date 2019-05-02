@ vim:ft=armv4
	.global banim_lomf_sw1_script
	.global banim_lomf_sw1_oam_r
	.global banim_lomf_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x7
	.section .data.oam_l
banim_lomf_sw1_oam_l:
banim_lomf_sw1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x84, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xC0, -32, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x85, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x89, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xC1, -32, -24
	banim_frame_oam 0x0, 0x1000, 0xC4, -32, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xDA, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xDE, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xC7, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xC9, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE7, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xD5, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xD9, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x3F, 0, -48
	banim_frame_oam 0x0, 0x1000, 0x7F, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x9F, -8, -40
	banim_frame_oam 0x0, 0x1000, 0xDF, -16, -32
	banim_frame_oam 0x8000, 0x1000, 0xC3, -32, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x1000, 0xC5, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xC6, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xE4, -8, -56
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x8A, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8E, -24, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x2F, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x33, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xAF, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xB3, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x54, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0x11, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xF, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0xC2, -8, -56
	banim_frame_end
banim_lomf_sw1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x15, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x95, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xB9, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x19, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x59, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xD0, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xFF, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, -40, -40
	banim_frame_oam 0x0, 0x1000, 0xEF, -48, -40
	banim_frame_oam 0x4000, 0x1000, 0xCE, -48, -48
	banim_frame_end
banim_lomf_sw1_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x1000, 0x27, 32, -24
	banim_frame_oam 0x0, 0x9000, 0x1, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x5, -24, -40
	banim_frame_oam 0x4000, 0x5000, 0x81, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x85, -24, -8
	banim_frame_oam 0x8000, 0x5000, 0x20, 24, -32
	banim_frame_oam 0x0, 0x1000, 0x0, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x7, -32, -40
	banim_frame_oam 0x4000, 0x1000, 0xA5, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xA1, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x67, -32, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, -32, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -8, -48
	banim_frame_oam 0x4000, 0x9000, 0x8A, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x48, 24, -32
	banim_frame_oam 0x0, 0x5000, 0xC8, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xCA, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xEB, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x29, 24, -40
	banim_frame_oam 0x4000, 0x1000, 0x8, 0, -56
	banim_frame_oam 0x0, 0x5000, 0xC5, 40, -24
	banim_frame_oam 0x0, 0x1000, 0xE4, 56, -16
	banim_frame_oam 0x4000, 0x9000, 0xC0, -40, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xC8, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xCA, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xEB, 0, 8
	banim_frame_oam 0x4000, 0x9000, 0x8A, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xA8, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0x8, 0, -56
	banim_frame_oam 0x0, 0x9000, 0x11, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0x10, 24, -40
	banim_frame_oam 0x0, 0x5000, 0x2E, 32, -32
	banim_frame_oam 0x4000, 0x1000, 0x6E, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xE, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0xCB, 48, -16
	banim_frame_oam 0x0, 0x1000, 0xC4, 48, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0xC8, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xCA, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xEB, 0, 8
	banim_frame_oam 0x4000, 0x9000, 0x8A, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xA8, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0x8, 0, -56
	banim_frame_oam 0x0, 0x9000, 0x11, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0x10, 24, -40
	banim_frame_oam 0x0, 0x5000, 0x2E, 32, -32
	banim_frame_oam 0x4000, 0x1000, 0x6E, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xE, -16, -40
	banim_frame_oam 0x0, 0x1000, 0xC4, 48, -24
	banim_frame_oam 0x0, 0x1000, 0x28, 48, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x1000, 0xCB, 48, -16
	banim_frame_oam 0x0, 0x1000, 0xC4, 48, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0x8E, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x8F, 32, -32
	banim_frame_oam 0x0, 0x9000, 0x90, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, 0, -16
	banim_frame_oam 0x0, 0x5000, 0xCE, 40, -24
	banim_frame_oam 0x0, 0x1000, 0xED, 56, -16
	banim_frame_oam 0x0, 0x1000, 0xCD, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x95, 8, -56
	banim_frame_oam 0x0, 0x1000, 0x97, 0, -56
	banim_frame_oam 0x0, 0x9000, 0x15, 0, -48
	banim_frame_end
banim_lomf_sw1_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x1000, 0x8E, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x8F, 32, -32
	banim_frame_oam 0x0, 0x9000, 0x90, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xCD, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x95, 8, -56
	banim_frame_oam 0x0, 0x1000, 0x97, 0, -56
	banim_frame_oam 0x0, 0x9000, 0x15, 0, -48
	banim_frame_oam 0x8000, 0x1000, 0xC7, 48, -24
	banim_frame_oam 0x8000, 0x1000, 0xCF, 40, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x1000, 0xED, 56, -16
	banim_frame_oam 0x8000, 0x1000, 0xCE, 48, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0xF5, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xF6, 40, 8
	banim_frame_oam 0x8000, 0x9000, 0x98, 24, -16
	banim_frame_oam 0x8000, 0x5000, 0x9A, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xFB, 8, 8
	banim_frame_oam 0x0, 0x9000, 0x19, 0, -48
	banim_frame_oam 0x8000, 0x1000, 0xD7, 32, -32
	banim_frame_oam 0x0, 0x1000, 0xB7, -8, -32
	banim_frame_end
banim_lomf_sw1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x5000, 0x5, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x4, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x0, 0x9000, 0x0, 16, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 16, 8
	banim_frame_end
banim_lomf_sw1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xE3, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x46, 48, -16
	banim_frame_oam 0x0, 0x9000, 0x7, 16, -32
	banim_frame_oam 0x4000, 0x9000, 0x87, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x44, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x64, 8, -32
	banim_frame_end
banim_lomf_sw1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x9000, 0x75, 16, -16
	banim_frame_oam 0x4000, 0x9000, 0x36, 8, -32
	banim_frame_oam 0x0, 0x1000, 0x19, 8, -40
	banim_frame_oam 0x0, 0x5000, 0x93, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0xD3, -8, -32
	banim_frame_oam 0x0, 0x1000, 0xD9, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x79, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x74, 48, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0xE9, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xEA, 40, 0
	banim_frame_oam 0x8000, 0x1000, 0xAF, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0xAD, 8, -48
	banim_frame_oam 0x4000, 0x5000, 0xCB, 0, 8
	banim_frame_oam 0x0, 0x9000, 0xB, 8, -40
	banim_frame_oam 0x8000, 0x9000, 0xF, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x11, -16, -40
	banim_frame_oam 0x4000, 0x5000, 0x8B, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0x8F, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x91, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xAB, 24, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0xE9, 36, -16
	banim_frame_oam 0x0, 0x1000, 0xEA, 36, 0
	banim_frame_oam 0x8000, 0x1000, 0xAF, -28, -24
	banim_frame_oam 0x4000, 0x1000, 0xAD, 4, -48
	banim_frame_oam 0x4000, 0x5000, 0xCB, -4, 8
	banim_frame_oam 0x0, 0x9000, 0xB, 4, -40
	banim_frame_oam 0x8000, 0x9000, 0xF, -12, -40
	banim_frame_oam 0x8000, 0x5000, 0x11, -20, -40
	banim_frame_oam 0x4000, 0x5000, 0x8B, 4, -8
	banim_frame_oam 0x4000, 0x1000, 0x8F, -12, -8
	banim_frame_oam 0x0, 0x1000, 0x91, -20, -8
	banim_frame_oam 0x4000, 0x1000, 0xAB, 20, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x1000, 0xEB, 0, -48
	banim_frame_oam 0x0, 0x1000, 0xED, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0xEE, -40, -24
	banim_frame_oam 0x0, 0x5000, 0xB1, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xB3, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF3, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF0, 0, 8
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x16, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0x57, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xD0, -32, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0x18, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0xB4, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xF4, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x92, -40, -8
	banim_frame_oam 0x0, 0x1000, 0x94, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x95, 8, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_23_l:
	banim_frame_oam 0x4000, 0x9000, 0xDC, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x1C, -32, -8
	banim_frame_oam 0x8000, 0x9000, 0x5D, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x5F, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x5C, 0, -32
	banim_frame_end
banim_lomf_sw1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x96, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x1D, -24, -32
	banim_frame_oam 0x0, 0x9000, 0x98, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x9C, -32, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_25_l:
	banim_frame_oam 0x8000, 0x1000, 0xC0, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x0, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x1, -24, -32
	banim_frame_oam 0x0, 0x5000, 0x81, -24, 0
	banim_frame_oam 0x8000, 0x5000, 0x20, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xA0, -8, 8
	banim_frame_end
banim_lomf_sw1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x1000, 0xC1, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x3, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x4, -16, -32
	banim_frame_oam 0x0, 0x9000, 0x23, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xA3, -24, 8
	banim_frame_end
banim_lomf_sw1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xB, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x87, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8B, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xC2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xE2, -32, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x10, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x90, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -8, -32
	banim_frame_oam 0x0, 0x1000, 0xE5, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xE2, -32, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x5000, 0xAB, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xAD, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xEB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xED, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, 8
	banim_frame_oam 0x0, 0x5000, 0xA8, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0xAA, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xE8, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xEA, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xC7, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0xAE, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xEE, -24, -16
	banim_frame_oam 0x0, 0x5000, 0xAF, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0xEF, -32, 8
	banim_frame_end
banim_lomf_sw1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0x31, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x12, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x14, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x15, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x95, -24, 0
	banim_frame_oam 0x8000, 0x5000, 0x16, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xD1, -40, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x17, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x97, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xD2, -32, -24
	banim_frame_oam 0x8000, 0x5000, 0x96, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xD3, -24, -24
	banim_frame_end
	banim_frame_oam 0x4000, 0x5000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x90, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -8, -32
	banim_frame_oam 0x0, 0x1000, 0xE5, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xE2, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0xC, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -24, -24
	banim_frame_oam 0x4000, 0x9000, 0xD7, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xDB, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0x2C, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xF3, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xF5, -24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xAB, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xAD, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xEB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xED, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, 8
	banim_frame_oam 0x0, 0x5000, 0xA8, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0xAA, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xE8, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xEA, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xC7, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x9B, -24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x31, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x12, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x14, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1C, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x9C, -24, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_34_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xE4, -32, 8
	banim_frame_oam 0x4000, 0x9000, 0x60, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x64, -32, -24
	banim_frame_oam 0x0, 0x1000, 0xA4, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0x41, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x23, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0x20, 8, -16
	banim_frame_oam 0x0, 0x5000, 0x5, -48, -24
	banim_frame_oam 0x4000, 0x1000, 0x45, -48, -8
	banim_frame_oam 0x8000, 0x1000, 0x7, -56, -24
	banim_frame_oam 0x0, 0x1000, 0x3, -40, -32
	banim_frame_oam 0x0, 0x5000, 0x1, -56, -40
	banim_frame_oam 0x0, 0x1000, 0x0, -48, -48
	banim_frame_end
banim_lomf_sw1_oam_frame_35_l:
	banim_frame_oam 0x8000, 0x1000, 0x20, 8, -16
	banim_frame_oam 0x0, 0x9000, 0x65, -24, -32
	banim_frame_oam 0x8000, 0x9000, 0x69, -40, -32
	banim_frame_oam 0x4000, 0x5000, 0xE5, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0xE9, -40, 0
	banim_frame_oam 0x4000, 0x5000, 0xE0, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x47, -48, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xE4, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x20, 8, -16
	banim_frame_oam 0x0, 0x5000, 0x8, -16, -56
	banim_frame_oam 0x8000, 0x1000, 0xA, -24, -56
	banim_frame_oam 0x4000, 0x1000, 0x48, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x4A, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xC4, -32, -40
	banim_frame_oam 0x0, 0x9000, 0xB, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0xF, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x4, -40, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xE4, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x20, 8, -16
	banim_frame_oam 0x0, 0x9000, 0x8B, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x8F, -32, -32
	banim_frame_oam 0x8000, 0x1000, 0x90, -40, -32
	banim_frame_oam 0x4000, 0x9000, 0x11, -48, -56
	banim_frame_oam 0x4000, 0x5000, 0x51, -48, -40
	banim_frame_oam 0x8000, 0x1000, 0x10, -16, -56
	banim_frame_oam 0x0, 0x1000, 0x50, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0xD0, -56, -48
	banim_frame_end
banim_lomf_sw1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x71, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x75, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xF1, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xF5, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0x55, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x15, -40, -24
	banim_frame_oam 0x4000, 0x1000, 0x35, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x37, -40, -32
	banim_frame_oam 0x0, 0x5000, 0x18, -56, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_39_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x64, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x85, -32, -16
	banim_frame_oam 0x0, 0x5000, 0x4, -8, -64
	banim_frame_oam 0x8000, 0x1000, 0x45, -16, -64
	banim_frame_end
banim_lomf_sw1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x66, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x6A, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -24, 8
	banim_frame_oam 0x0, 0x5000, 0x8, -16, -48
	banim_frame_oam 0x4000, 0x1000, 0x48, -16, -32
	banim_frame_oam 0x8000, 0x1000, 0xC5, -32, -16
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -64
	banim_frame_end
banim_lomf_sw1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0x66, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x6A, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xC5, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xEB, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x6B, -16, -64
	banim_frame_oam 0x0, 0x1000, 0xCC, -24, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x2C, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x30, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xAC, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE, -16, -32
	banim_frame_oam 0x8000, 0x1000, 0xCD, -32, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x9000, 0x66, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x6A, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xC5, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xEB, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xCC, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x11, -16, -64
	banim_frame_end
banim_lomf_sw1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x66, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x6A, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xC5, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xEB, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xCC, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x91, -16, -64
	banim_frame_end
banim_lomf_sw1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x40, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x44, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -32, 8
	banim_frame_oam 0x4000, 0x5000, 0x22, -32, -32
	banim_frame_oam 0x0, 0x5000, 0x6, -48, -40
	banim_frame_oam 0x0, 0x1000, 0x8, -56, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x46, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x4A, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xC6, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -32, 8
	banim_frame_oam 0x4000, 0x5000, 0x28, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x0, -40, -24
	banim_frame_oam 0x0, 0x5000, 0x6, -48, -40
	banim_frame_oam 0x0, 0x1000, 0x8, -56, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x4C, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x50, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xCC, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xD0, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x52, -40, -24
	banim_frame_oam 0x4000, 0x5000, 0x2E, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0x32, -48, -32
	banim_frame_oam 0x0, 0x1000, 0x34, -56, -32
	banim_frame_oam 0x4000, 0x1000, 0x13, -56, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0x3D, 24, -40
	banim_frame_oam 0x8000, 0x5000, 0x3F, 16, -40
	banim_frame_oam 0x0, 0x5000, 0xBD, 24, -8
	banim_frame_oam 0x8000, 0x1000, 0xBF, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0xFD, 24, 8
	banim_frame_oam 0x0, 0x1000, 0xFF, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0x1D, 24, -48
	banim_frame_oam 0x0, 0x1000, 0xBC, 40, -8
	banim_frame_oam 0x0, 0x1000, 0xFC, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xDC, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xD6, 16, -48
	banim_frame_oam 0x8000, 0x1000, 0xB5, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xB6, 0, -32
	banim_frame_end
banim_lomf_sw1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x9000, 0x3A, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x3E, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0xBA, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0xBE, 8, 0
	banim_frame_oam 0x4000, 0x1000, 0xFE, -8, -40
	banim_frame_oam 0x0, 0x1000, 0xFD, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x5F, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xDF, 0, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_lomf_sw1_oam_r:
banim_lomf_sw1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x84, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xC0, 24, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x85, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x89, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xC1, 24, -24
	banim_frame_oam 0x0, 0x0, 0xC4, 24, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xDA, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xDE, 16, -8
	banim_frame_oam 0x4000, 0x0, 0xC7, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC9, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xE7, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xD5, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xD9, 16, -24
	banim_frame_oam 0x8000, 0x0, 0x3F, -8, -48
	banim_frame_oam 0x0, 0x0, 0x7F, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x9F, 0, -40
	banim_frame_oam 0x0, 0x0, 0xDF, 8, -32
	banim_frame_oam 0x8000, 0x0, 0xC3, 24, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x0, 0xC5, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xC6, 0, -48
	banim_frame_oam 0x0, 0x0, 0xE4, 0, -56
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x8A, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x8E, 16, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x2F, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x33, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xAF, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB3, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x54, 24, -16
	banim_frame_oam 0x4000, 0x0, 0x11, 0, -32
	banim_frame_oam 0x4000, 0x0, 0xF, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xC2, 0, -56
	banim_frame_end
banim_lomf_sw1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x95, -8, 0
	banim_frame_oam 0x0, 0x0, 0xB9, 24, 8
	banim_frame_oam 0x8000, 0x0, 0x19, 24, -32
	banim_frame_oam 0x0, 0x0, 0x59, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xD0, -16, -16
	banim_frame_oam 0x0, 0x0, 0xFF, -16, -24
	banim_frame_oam 0x4000, 0x0, 0xED, 24, -40
	banim_frame_oam 0x0, 0x0, 0xEF, 40, -40
	banim_frame_oam 0x4000, 0x0, 0xCE, 32, -48
	banim_frame_end
banim_lomf_sw1_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x0, 0x27, -40, -24
	banim_frame_oam 0x0, 0x8000, 0x1, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x5, 8, -40
	banim_frame_oam 0x4000, 0x4000, 0x81, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x85, 8, -8
	banim_frame_oam 0x8000, 0x4000, 0x20, -32, -32
	banim_frame_oam 0x0, 0x0, 0x0, 32, -40
	banim_frame_oam 0x0, 0x0, 0x7, 24, -40
	banim_frame_oam 0x4000, 0x0, 0xA5, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0xA1, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x67, 24, -24
	banim_frame_oam 0x0, 0x0, 0xA7, 24, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -24, -48
	banim_frame_oam 0x4000, 0x8000, 0x8A, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x48, -40, -32
	banim_frame_oam 0x0, 0x4000, 0xC8, -40, 0
	banim_frame_oam 0x8000, 0x0, 0xCA, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xEB, -16, 8
	banim_frame_oam 0x0, 0x0, 0x29, -32, -40
	banim_frame_oam 0x4000, 0x0, 0x8, -16, -56
	banim_frame_oam 0x0, 0x4000, 0xC5, -56, -24
	banim_frame_oam 0x0, 0x0, 0xE4, -64, -16
	banim_frame_oam 0x4000, 0x8000, 0xC0, 8, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xC8, -40, 0
	banim_frame_oam 0x8000, 0x0, 0xCA, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xEB, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x8A, -24, -16
	banim_frame_oam 0x4000, 0x0, 0xA8, -40, -8
	banim_frame_oam 0x4000, 0x0, 0x8, -16, -56
	banim_frame_oam 0x0, 0x8000, 0x11, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0x10, -32, -40
	banim_frame_oam 0x0, 0x4000, 0x2E, -48, -32
	banim_frame_oam 0x4000, 0x0, 0x6E, -48, -16
	banim_frame_oam 0x0, 0x0, 0xE, 8, -40
	banim_frame_oam 0x4000, 0x0, 0xCB, -64, -16
	banim_frame_oam 0x0, 0x0, 0xC4, -56, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0xC8, -40, 0
	banim_frame_oam 0x8000, 0x0, 0xCA, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xEB, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x8A, -24, -16
	banim_frame_oam 0x4000, 0x0, 0xA8, -40, -8
	banim_frame_oam 0x4000, 0x0, 0x8, -16, -56
	banim_frame_oam 0x0, 0x8000, 0x11, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0x10, -32, -40
	banim_frame_oam 0x0, 0x4000, 0x2E, -48, -32
	banim_frame_oam 0x4000, 0x0, 0x6E, -48, -16
	banim_frame_oam 0x0, 0x0, 0xE, 8, -40
	banim_frame_oam 0x0, 0x0, 0xC4, -56, -24
	banim_frame_oam 0x0, 0x0, 0x28, -56, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x0, 0xCB, -64, -16
	banim_frame_oam 0x0, 0x0, 0xC4, -56, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0x8E, 0, -48
	banim_frame_oam 0x8000, 0x0, 0x8F, -40, -32
	banim_frame_oam 0x0, 0x8000, 0x90, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, -8, -16
	banim_frame_oam 0x0, 0x4000, 0xCE, -56, -24
	banim_frame_oam 0x0, 0x0, 0xED, -64, -16
	banim_frame_oam 0x0, 0x0, 0xCD, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x95, -24, -56
	banim_frame_oam 0x0, 0x0, 0x97, -8, -56
	banim_frame_oam 0x0, 0x8000, 0x15, -32, -48
	banim_frame_end
banim_lomf_sw1_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x0, 0x8E, 0, -48
	banim_frame_oam 0x8000, 0x0, 0x8F, -40, -32
	banim_frame_oam 0x0, 0x8000, 0x90, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, -8, -16
	banim_frame_oam 0x0, 0x0, 0xCD, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x95, -24, -56
	banim_frame_oam 0x0, 0x0, 0x97, -8, -56
	banim_frame_oam 0x0, 0x8000, 0x15, -32, -48
	banim_frame_oam 0x8000, 0x0, 0xC7, -56, -24
	banim_frame_oam 0x8000, 0x0, 0xCF, -48, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x0, 0xED, -64, -16
	banim_frame_oam 0x8000, 0x0, 0xCE, -56, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0xF5, -48, -16
	banim_frame_oam 0x0, 0x0, 0xF6, -48, 8
	banim_frame_oam 0x8000, 0x8000, 0x98, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x9A, -24, -16
	banim_frame_oam 0x0, 0x0, 0xFB, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x19, -32, -48
	banim_frame_oam 0x8000, 0x0, 0xD7, -40, -32
	banim_frame_oam 0x0, 0x0, 0xB7, 0, -32
	banim_frame_end
banim_lomf_sw1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x4000, 0x5, -8, -48
	banim_frame_oam 0x8000, 0x0, 0x4, -16, -40
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -48, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -48, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -48, 8
	banim_frame_end
banim_lomf_sw1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, -48
	banim_frame_oam 0x0, 0x0, 0xE3, 0, -40
	banim_frame_oam 0x8000, 0x0, 0x46, -56, -16
	banim_frame_oam 0x0, 0x8000, 0x7, -48, -32
	banim_frame_oam 0x4000, 0x8000, 0x87, -48, 0
	banim_frame_oam 0x0, 0x0, 0x65, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x44, -16, -40
	banim_frame_oam 0x0, 0x0, 0x64, -16, -32
	banim_frame_end
banim_lomf_sw1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x8000, 0x75, -48, -16
	banim_frame_oam 0x4000, 0x8000, 0x36, -40, -32
	banim_frame_oam 0x0, 0x0, 0x19, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x93, -8, -48
	banim_frame_oam 0x4000, 0x0, 0xD3, -8, -32
	banim_frame_oam 0x0, 0x0, 0xD9, -16, 8
	banim_frame_oam 0x0, 0x0, 0x79, -16, -16
	banim_frame_oam 0x0, 0x0, 0x74, -56, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0xE9, -48, -16
	banim_frame_oam 0x0, 0x0, 0xEA, -48, 0
	banim_frame_oam 0x8000, 0x0, 0xAF, 16, -24
	banim_frame_oam 0x4000, 0x0, 0xAD, -24, -48
	banim_frame_oam 0x4000, 0x4000, 0xCB, -32, 8
	banim_frame_oam 0x0, 0x8000, 0xB, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0xF, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x11, 8, -40
	banim_frame_oam 0x4000, 0x4000, 0x8B, -40, -8
	banim_frame_oam 0x4000, 0x0, 0x8F, -8, -8
	banim_frame_oam 0x0, 0x0, 0x91, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xAB, -40, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0xE9, -44, -16
	banim_frame_oam 0x0, 0x0, 0xEA, -44, 0
	banim_frame_oam 0x8000, 0x0, 0xAF, 20, -24
	banim_frame_oam 0x4000, 0x0, 0xAD, -20, -48
	banim_frame_oam 0x4000, 0x4000, 0xCB, -28, 8
	banim_frame_oam 0x0, 0x8000, 0xB, -36, -40
	banim_frame_oam 0x8000, 0x8000, 0xF, -4, -40
	banim_frame_oam 0x8000, 0x4000, 0x11, 12, -40
	banim_frame_oam 0x4000, 0x4000, 0x8B, -36, -8
	banim_frame_oam 0x4000, 0x0, 0x8F, -4, -8
	banim_frame_oam 0x0, 0x0, 0x91, 12, -8
	banim_frame_oam 0x4000, 0x0, 0xAB, -36, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x0, 0xEB, -16, -48
	banim_frame_oam 0x0, 0x0, 0xED, 0, -48
	banim_frame_oam 0x4000, 0x0, 0xEE, 24, -24
	banim_frame_oam 0x0, 0x4000, 0xB1, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xB3, 16, -8
	banim_frame_oam 0x4000, 0x0, 0xF1, 0, 8
	banim_frame_oam 0x0, 0x0, 0xF3, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF0, -8, 8
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x16, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x57, 16, -24
	banim_frame_oam 0x0, 0x0, 0xD0, 24, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0xB4, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xF4, -8, 8
	banim_frame_oam 0x4000, 0x0, 0x92, 24, -8
	banim_frame_oam 0x0, 0x0, 0x94, 24, -16
	banim_frame_oam 0x0, 0x0, 0x95, -16, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_23_r:
	banim_frame_oam 0x4000, 0x8000, 0xDC, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x1C, 24, -8
	banim_frame_oam 0x8000, 0x8000, 0x5D, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x5F, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x5C, -8, -32
	banim_frame_end
banim_lomf_sw1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x96, 0, -24
	banim_frame_oam 0x0, 0x4000, 0x1D, 8, -32
	banim_frame_oam 0x0, 0x8000, 0x98, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x9C, 24, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_25_r:
	banim_frame_oam 0x8000, 0x0, 0xC0, 24, -16
	banim_frame_oam 0x0, 0x0, 0x0, -8, 8
	banim_frame_oam 0x8000, 0x8000, 0x1, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x81, 8, 0
	banim_frame_oam 0x8000, 0x4000, 0x20, 0, -24
	banim_frame_oam 0x0, 0x0, 0xA0, 0, 8
	banim_frame_end
banim_lomf_sw1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x0, 0xC1, 24, -16
	banim_frame_oam 0x0, 0x0, 0x3, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x4, 0, -32
	banim_frame_oam 0x0, 0x8000, 0x23, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA3, -8, 8
	banim_frame_end
banim_lomf_sw1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xB, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x87, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8B, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xC2, 0, -32
	banim_frame_oam 0x0, 0x0, 0xE2, 24, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x10, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x0, 0x90, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, -8, -32
	banim_frame_oam 0x0, 0x0, 0xE5, 8, -32
	banim_frame_oam 0x0, 0x0, 0xE2, 24, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x4000, 0xAB, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xAD, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xEB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xED, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xA8, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xAA, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xE8, -8, -16
	banim_frame_oam 0x0, 0x0, 0xEA, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xC7, -16, -24
	banim_frame_oam 0x0, 0x0, 0xA7, 8, -40
	banim_frame_oam 0x8000, 0x0, 0xAE, 16, -32
	banim_frame_oam 0x0, 0x0, 0xEE, 16, -16
	banim_frame_oam 0x0, 0x4000, 0xAF, 16, -8
	banim_frame_oam 0x4000, 0x0, 0xEF, 16, 8
	banim_frame_end
banim_lomf_sw1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0x31, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x0, 0x11, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x12, -8, -32
	banim_frame_oam 0x0, 0x0, 0x14, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x15, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x95, 16, 0
	banim_frame_oam 0x8000, 0x4000, 0x16, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xD1, 32, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x17, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x97, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xD2, 24, -24
	banim_frame_oam 0x8000, 0x4000, 0x96, 16, -16
	banim_frame_oam 0x0, 0x0, 0xD3, 16, -24
	banim_frame_end
	banim_frame_oam 0x4000, 0x4000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x0, 0x90, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, -8, -32
	banim_frame_oam 0x0, 0x0, 0xE5, 8, -32
	banim_frame_oam 0x0, 0x0, 0xE2, 24, -16
	banim_frame_oam 0x4000, 0x4000, 0xC, -16, -24
	banim_frame_oam 0x0, 0x0, 0x10, 16, -24
	banim_frame_oam 0x4000, 0x8000, 0xD7, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xDB, 16, -8
	banim_frame_oam 0x4000, 0x0, 0x2C, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xF3, 0, -16
	banim_frame_oam 0x0, 0x0, 0xF5, 16, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xAB, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xAD, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xEB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xED, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xA8, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xAA, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xE8, -8, -16
	banim_frame_oam 0x0, 0x0, 0xEA, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xC7, -16, -24
	banim_frame_oam 0x0, 0x0, 0xA7, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x9B, 16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x31, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x0, 0x11, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x12, -8, -32
	banim_frame_oam 0x0, 0x0, 0x14, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x1C, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x9C, 16, 0
	banim_frame_end
banim_lomf_sw1_oam_frame_34_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -8, 0
	banim_frame_oam 0x0, 0x0, 0xE4, 24, 8
	banim_frame_oam 0x4000, 0x8000, 0x60, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x64, 24, -24
	banim_frame_oam 0x0, 0x0, 0xA4, 24, -8
	banim_frame_oam 0x4000, 0x0, 0x41, 0, -32
	banim_frame_oam 0x0, 0x4000, 0x23, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x20, -16, -16
	banim_frame_oam 0x0, 0x4000, 0x5, 32, -24
	banim_frame_oam 0x4000, 0x0, 0x45, 32, -8
	banim_frame_oam 0x8000, 0x0, 0x7, 48, -24
	banim_frame_oam 0x0, 0x0, 0x3, 32, -32
	banim_frame_oam 0x0, 0x4000, 0x1, 40, -40
	banim_frame_oam 0x0, 0x0, 0x0, 40, -48
	banim_frame_end
banim_lomf_sw1_oam_frame_35_r:
	banim_frame_oam 0x8000, 0x0, 0x20, -16, -16
	banim_frame_oam 0x0, 0x8000, 0x65, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x69, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0xE5, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE9, 24, 0
	banim_frame_oam 0x4000, 0x4000, 0xE0, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 24, 8
	banim_frame_oam 0x0, 0x0, 0x47, 40, -8
	banim_frame_end
banim_lomf_sw1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -8, 0
	banim_frame_oam 0x0, 0x0, 0xE4, 24, 8
	banim_frame_oam 0x8000, 0x0, 0x20, -16, -16
	banim_frame_oam 0x0, 0x4000, 0x8, 0, -56
	banim_frame_oam 0x8000, 0x0, 0xA, 16, -56
	banim_frame_oam 0x4000, 0x0, 0x48, 0, -40
	banim_frame_oam 0x0, 0x0, 0x4A, 16, -40
	banim_frame_oam 0x0, 0x0, 0xC4, 24, -40
	banim_frame_oam 0x0, 0x8000, 0xB, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0xF, 24, -32
	banim_frame_oam 0x0, 0x0, 0x4, 32, -24
	banim_frame_end
banim_lomf_sw1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -8, 0
	banim_frame_oam 0x0, 0x0, 0xE4, 24, 8
	banim_frame_oam 0x8000, 0x0, 0x20, -16, -16
	banim_frame_oam 0x0, 0x8000, 0x8B, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x8F, 24, -32
	banim_frame_oam 0x8000, 0x0, 0x90, 32, -32
	banim_frame_oam 0x4000, 0x8000, 0x11, 16, -56
	banim_frame_oam 0x4000, 0x4000, 0x51, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x10, 8, -56
	banim_frame_oam 0x0, 0x0, 0x50, 0, -48
	banim_frame_oam 0x8000, 0x0, 0xD0, 48, -48
	banim_frame_end
banim_lomf_sw1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x71, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x75, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xF1, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xF5, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x55, 0, -32
	banim_frame_oam 0x0, 0x0, 0x15, 32, -24
	banim_frame_oam 0x4000, 0x0, 0x35, 16, -32
	banim_frame_oam 0x0, 0x0, 0x37, 32, -32
	banim_frame_oam 0x0, 0x4000, 0x18, 40, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_39_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -16, -48
	banim_frame_oam 0x8000, 0x4000, 0x64, 16, -24
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x85, 24, -16
	banim_frame_oam 0x0, 0x4000, 0x4, -8, -64
	banim_frame_oam 0x8000, 0x0, 0x45, 8, -64
	banim_frame_end
banim_lomf_sw1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x66, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x6A, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x8, 0, -48
	banim_frame_oam 0x4000, 0x0, 0x48, 0, -32
	banim_frame_oam 0x8000, 0x0, 0xC5, 24, -16
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -64
	banim_frame_end
banim_lomf_sw1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0x66, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x6A, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 16, 8
	banim_frame_oam 0x8000, 0x0, 0xC5, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xEB, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x6B, 8, -64
	banim_frame_oam 0x0, 0x0, 0xCC, 16, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x2C, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x30, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xAC, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB0, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE, 0, -32
	banim_frame_oam 0x8000, 0x0, 0xCD, 24, -16
	banim_frame_end
banim_lomf_sw1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x8000, 0x66, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x6A, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 16, 8
	banim_frame_oam 0x8000, 0x0, 0xC5, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xEB, 0, -32
	banim_frame_oam 0x0, 0x0, 0xCC, 16, -40
	banim_frame_oam 0x8000, 0x4000, 0x11, 8, -64
	banim_frame_end
banim_lomf_sw1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x66, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x6A, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 16, 8
	banim_frame_oam 0x8000, 0x0, 0xC5, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xEB, 0, -32
	banim_frame_oam 0x0, 0x0, 0xCC, 16, -40
	banim_frame_oam 0x8000, 0x4000, 0x91, 8, -64
	banim_frame_end
banim_lomf_sw1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x40, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x44, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xC4, 16, 8
	banim_frame_oam 0x4000, 0x4000, 0x22, 0, -32
	banim_frame_oam 0x0, 0x4000, 0x6, 32, -40
	banim_frame_oam 0x0, 0x0, 0x8, 48, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x46, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x4A, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xC6, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, 16, 8
	banim_frame_oam 0x4000, 0x4000, 0x28, 0, -32
	banim_frame_oam 0x0, 0x0, 0x0, 32, -24
	banim_frame_oam 0x0, 0x4000, 0x6, 32, -40
	banim_frame_oam 0x0, 0x0, 0x8, 48, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x4C, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x50, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xCC, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xD0, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x52, 32, -24
	banim_frame_oam 0x4000, 0x4000, 0x2E, 0, -32
	banim_frame_oam 0x4000, 0x0, 0x32, 32, -32
	banim_frame_oam 0x0, 0x0, 0x34, 48, -32
	banim_frame_oam 0x4000, 0x0, 0x13, 40, -40
	banim_frame_end
banim_lomf_sw1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0x3D, -40, -40
	banim_frame_oam 0x8000, 0x4000, 0x3F, -24, -40
	banim_frame_oam 0x0, 0x4000, 0xBD, -40, -8
	banim_frame_oam 0x8000, 0x0, 0xBF, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xFD, -40, 8
	banim_frame_oam 0x0, 0x0, 0xFF, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x1D, -40, -48
	banim_frame_oam 0x0, 0x0, 0xBC, -48, -8
	banim_frame_oam 0x0, 0x0, 0xFC, -48, 8
	banim_frame_oam 0x0, 0x0, 0xDC, -16, 8
	banim_frame_oam 0x0, 0x0, 0xD6, -24, -48
	banim_frame_oam 0x8000, 0x0, 0xB5, -16, -32
	banim_frame_oam 0x0, 0x0, 0xB6, -8, -32
	banim_frame_end
banim_lomf_sw1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x8000, 0x3A, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0x3E, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0xBA, -48, 0
	banim_frame_oam 0x8000, 0x0, 0xBE, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xFE, -8, -40
	banim_frame_oam 0x0, 0x0, 0xFD, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x5F, -8, -24
	banim_frame_oam 0x0, 0x0, 0xDF, -8, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_lomf_sw1_script:
banim_lomf_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 1, banim_lomf_sw1_oam_frame_1_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 2, banim_lomf_sw1_oam_frame_2_r - banim_lomf_sw1_oam_r
	banim_code_frame 25, banim_lomf_sw1_sheet_0, 3, banim_lomf_sw1_oam_frame_3_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 4, banim_lomf_sw1_oam_frame_4_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 5, banim_lomf_sw1_oam_frame_5_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_1, 49, banim_lomf_sw1_oam_frame_6_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_1, 50, banim_lomf_sw1_oam_frame_7_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_1, 51, banim_lomf_sw1_oam_frame_8_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 6, banim_lomf_sw1_oam_frame_9_r - banim_lomf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 7, banim_lomf_sw1_oam_frame_10_r - banim_lomf_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_lomf_sw1_sheet_2, 9, banim_lomf_sw1_oam_frame_11_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 12, banim_lomf_sw1_oam_frame_12_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 14, banim_lomf_sw1_oam_frame_13_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 52, banim_lomf_sw1_oam_frame_14_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 15, banim_lomf_sw1_oam_frame_15_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 16, banim_lomf_sw1_oam_frame_16_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_1, 17, banim_lomf_sw1_oam_frame_17_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_1, 53, banim_lomf_sw1_oam_frame_18_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 18, banim_lomf_sw1_oam_frame_19_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 19, banim_lomf_sw1_oam_frame_20_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 20, banim_lomf_sw1_oam_frame_21_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 21, banim_lomf_sw1_oam_frame_22_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 22, banim_lomf_sw1_oam_frame_23_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 23, banim_lomf_sw1_oam_frame_24_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 24, banim_lomf_sw1_oam_frame_25_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 25, banim_lomf_sw1_oam_frame_26_r - banim_lomf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 26, banim_lomf_sw1_oam_frame_27_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 25, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 28, banim_lomf_sw1_oam_frame_30_r - banim_lomf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 28, banim_lomf_sw1_oam_frame_30_r - banim_lomf_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_lomf_sw1_sheet_2, 10, banim_lomf_sw1_oam_frame_31_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 13, banim_lomf_sw1_oam_frame_32_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 28, banim_lomf_sw1_oam_frame_30_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 28, banim_lomf_sw1_oam_frame_30_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 30, banim_lomf_sw1_oam_frame_33_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 30, banim_lomf_sw1_oam_frame_33_r - banim_lomf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 30, banim_lomf_sw1_oam_frame_33_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 1, banim_lomf_sw1_oam_frame_1_r - banim_lomf_sw1_oam_r
	banim_code_frame 15, banim_lomf_sw1_sheet_0, 2, banim_lomf_sw1_oam_frame_2_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 3, banim_lomf_sw1_oam_frame_3_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 4, banim_lomf_sw1_oam_frame_4_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 5, banim_lomf_sw1_oam_frame_5_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lomf_sw1_sheet_5, 38, banim_lomf_sw1_oam_frame_34_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_5, 39, banim_lomf_sw1_oam_frame_35_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_5, 40, banim_lomf_sw1_oam_frame_36_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_5, 41, banim_lomf_sw1_oam_frame_37_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_5, 42, banim_lomf_sw1_oam_frame_38_r - banim_lomf_sw1_oam_r
	banim_code_frame 10, banim_lomf_sw1_sheet_1, 50, banim_lomf_sw1_oam_frame_7_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_1, 51, banim_lomf_sw1_oam_frame_8_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 6, banim_lomf_sw1_oam_frame_9_r - banim_lomf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 7, banim_lomf_sw1_oam_frame_10_r - banim_lomf_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_lomf_sw1_sheet_2, 9, banim_lomf_sw1_oam_frame_11_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 12, banim_lomf_sw1_oam_frame_12_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 14, banim_lomf_sw1_oam_frame_13_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 52, banim_lomf_sw1_oam_frame_14_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 15, banim_lomf_sw1_oam_frame_15_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 16, banim_lomf_sw1_oam_frame_16_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_1, 17, banim_lomf_sw1_oam_frame_17_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_1, 53, banim_lomf_sw1_oam_frame_18_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 18, banim_lomf_sw1_oam_frame_19_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 19, banim_lomf_sw1_oam_frame_20_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 20, banim_lomf_sw1_oam_frame_21_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 21, banim_lomf_sw1_oam_frame_22_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 22, banim_lomf_sw1_oam_frame_23_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 23, banim_lomf_sw1_oam_frame_24_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 24, banim_lomf_sw1_oam_frame_25_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 25, banim_lomf_sw1_oam_frame_26_r - banim_lomf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 26, banim_lomf_sw1_oam_frame_27_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 15, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_frame 10, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 28, banim_lomf_sw1_oam_frame_30_r - banim_lomf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 28, banim_lomf_sw1_oam_frame_30_r - banim_lomf_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_lomf_sw1_sheet_2, 10, banim_lomf_sw1_oam_frame_31_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 13, banim_lomf_sw1_oam_frame_32_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 28, banim_lomf_sw1_oam_frame_30_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 28, banim_lomf_sw1_oam_frame_30_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 29, banim_lomf_sw1_oam_frame_29_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 30, banim_lomf_sw1_oam_frame_33_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 30, banim_lomf_sw1_oam_frame_33_r - banim_lomf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 30, banim_lomf_sw1_oam_frame_33_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 27, banim_lomf_sw1_oam_frame_28_r - banim_lomf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 43, banim_lomf_sw1_oam_frame_39_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 44, banim_lomf_sw1_oam_frame_40_r - banim_lomf_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_lomf_sw1_sheet_6, 45, banim_lomf_sw1_oam_frame_41_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 44, banim_lomf_sw1_oam_frame_40_r - banim_lomf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 46, banim_lomf_sw1_oam_frame_42_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 43, banim_lomf_sw1_oam_frame_39_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 44, banim_lomf_sw1_oam_frame_40_r - banim_lomf_sw1_oam_r
	banim_code_frame 30, banim_lomf_sw1_sheet_6, 45, banim_lomf_sw1_oam_frame_41_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 47, banim_lomf_sw1_oam_frame_43_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 48, banim_lomf_sw1_oam_frame_44_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 47, banim_lomf_sw1_oam_frame_43_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 48, banim_lomf_sw1_oam_frame_44_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 47, banim_lomf_sw1_oam_frame_43_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 48, banim_lomf_sw1_oam_frame_44_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 47, banim_lomf_sw1_oam_frame_43_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 48, banim_lomf_sw1_oam_frame_44_r - banim_lomf_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_lomf_sw1_sheet_6, 45, banim_lomf_sw1_oam_frame_41_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 44, banim_lomf_sw1_oam_frame_40_r - banim_lomf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_lomf_sw1_sheet_6, 46, banim_lomf_sw1_oam_frame_42_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 31, banim_lomf_sw1_oam_frame_45_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 32, banim_lomf_sw1_oam_frame_46_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 33, banim_lomf_sw1_oam_frame_47_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 32, banim_lomf_sw1_oam_frame_46_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 31, banim_lomf_sw1_oam_frame_45_r - banim_lomf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 31, banim_lomf_sw1_oam_frame_45_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 32, banim_lomf_sw1_oam_frame_46_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 33, banim_lomf_sw1_oam_frame_47_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 32, banim_lomf_sw1_oam_frame_46_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 31, banim_lomf_sw1_oam_frame_45_r - banim_lomf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_mode_stand_close:
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomf_sw1_mode_stand:
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomf_sw1_mode_stand_range:
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomf_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 1, banim_lomf_sw1_oam_frame_1_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_lomf_sw1_sheet_0, 2, banim_lomf_sw1_oam_frame_2_r - banim_lomf_sw1_oam_r
	banim_code_frame 25, banim_lomf_sw1_sheet_0, 3, banim_lomf_sw1_oam_frame_3_r - banim_lomf_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 4, banim_lomf_sw1_oam_frame_4_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_0, 5, banim_lomf_sw1_oam_frame_5_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_1, 49, banim_lomf_sw1_oam_frame_6_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_1, 50, banim_lomf_sw1_oam_frame_7_r - banim_lomf_sw1_oam_r
	banim_code_frame 4, banim_lomf_sw1_sheet_1, 51, banim_lomf_sw1_oam_frame_8_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 6, banim_lomf_sw1_oam_frame_9_r - banim_lomf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 7, banim_lomf_sw1_oam_frame_10_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_2, 9, banim_lomf_sw1_oam_frame_11_r - banim_lomf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomf_sw1_sheet_2, 12, banim_lomf_sw1_oam_frame_12_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 14, banim_lomf_sw1_oam_frame_13_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_2, 52, banim_lomf_sw1_oam_frame_14_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 15, banim_lomf_sw1_oam_frame_15_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 16, banim_lomf_sw1_oam_frame_16_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_1, 17, banim_lomf_sw1_oam_frame_17_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_1, 53, banim_lomf_sw1_oam_frame_18_r - banim_lomf_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 18, banim_lomf_sw1_oam_frame_19_r - banim_lomf_sw1_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_3, 19, banim_lomf_sw1_oam_frame_20_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 20, banim_lomf_sw1_oam_frame_21_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 21, banim_lomf_sw1_oam_frame_22_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 22, banim_lomf_sw1_oam_frame_23_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_3, 23, banim_lomf_sw1_oam_frame_24_r - banim_lomf_sw1_oam_r
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 24, banim_lomf_sw1_oam_frame_25_r - banim_lomf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 25, banim_lomf_sw1_oam_frame_26_r - banim_lomf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lomf_sw1_sheet_4, 26, banim_lomf_sw1_oam_frame_27_r - banim_lomf_sw1_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_0, 0, banim_lomf_sw1_oam_frame_0_r - banim_lomf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_lomf_sw1_mode_attack_close - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_attack_close_back - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_attack_close_critical - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_attack_close_critical_back - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_attack_range - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_attack_range_critical - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_dodge_close - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_dodge_range - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_stand_close - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_stand - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_stand_range - banim_lomf_sw1_script
	.word banim_lomf_sw1_mode_attack_miss - banim_lomf_sw1_script
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

