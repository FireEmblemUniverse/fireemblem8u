@ vim:ft=armv4
	.global banim_forf_sw1_script
	.global banim_forf_sw1_oam_r
	.global banim_forf_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x30
	.section .data.oam_l
banim_forf_sw1_oam_l:
banim_forf_sw1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xDD, -19, -15
	banim_frame_oam 0x8000, 0x1000, 0xDF, -27, -15
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -32, 0
	banim_frame_end
banim_forf_sw1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0xC7, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xC9, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0x7, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0xB, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0x47, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x4B, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x65, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xA1, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA5, -32, 8
	banim_frame_end
banim_forf_sw1_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x9000, 0x7, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0xB, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0x47, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x4B, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x65, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xA1, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA5, -32, 8
	banim_frame_oam 0x0, 0x6000, 0xC7, -4, -25
	banim_frame_oam 0x0, 0x6000, 0xC9, 4, -33
	banim_frame_end
banim_forf_sw1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x9000, 0x7, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0xB, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0x47, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x4B, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x65, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xA1, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA5, -32, 8
	banim_frame_oam 0x0, 0x6000, 0xC7, -2, -28
	banim_frame_oam 0x0, 0x6000, 0xC9, 6, -36
	banim_frame_end
banim_forf_sw1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x5000, 0x12, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x14, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x52, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x54, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x67, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x6B, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0xA7, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xAB, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x65, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xA1, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA5, -32, 8
	banim_frame_end
banim_forf_sw1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0x72, -31, -27
	banim_frame_oam 0x8000, 0x1000, 0x74, -39, -27
	banim_frame_oam 0x4000, 0x1000, 0xB2, -31, -11
	banim_frame_oam 0x0, 0x1000, 0xB4, -39, -11
	banim_frame_oam 0x4000, 0x9000, 0xC, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x10, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0x4C, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x50, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x65, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xA1, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA5, -32, 8
	banim_frame_end
banim_forf_sw1_oam_frame_24_l:
	banim_frame_oam 0x4000, 0x9000, 0xC, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x10, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0x4C, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x50, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x65, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xA1, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA5, -32, 8
	banim_frame_end
banim_forf_sw1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x6C, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x70, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x61, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x65, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xA1, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA5, -32, 8
	banim_frame_end
banim_forf_sw1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x9C, -32, -48
	banim_frame_oam 0x0, 0x9000, 0x401, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x405, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x481, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x485, -32, 0
	banim_frame_end
banim_forf_sw1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x4000, 0xDD, -1, -20
	banim_frame_oam 0x8000, 0x0, 0xDF, 15, -20
	banim_frame_oam 0x0, 0x9000, 0x1, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x5, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x81, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x85, -32, 0
	banim_frame_end
banim_forf_sw1_oam_frame_28_l:
	banim_frame_oam 0x8000, 0xD000, 0x6, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0xA, -32, -48
	banim_frame_oam 0x8000, 0x9000, 0x8A, -32, -16
	banim_frame_end
banim_forf_sw1_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x9000, 0x1D, -5, -64
	banim_frame_oam 0x8000, 0xD000, 0xC, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x10, -32, -48
	banim_frame_oam 0x8000, 0x5000, 0x90, -32, -16
	banim_frame_end
banim_forf_sw1_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x1000, 0x3F, -6, -56
	banim_frame_oam 0x0, 0x1000, 0x7F, -6, -40
	banim_frame_oam 0x8000, 0xD000, 0x40C, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x410, -32, -48
	banim_frame_oam 0x8000, 0x5000, 0x490, -32, -16
	banim_frame_end
banim_forf_sw1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x8000, 0x1D, -12, -62
	banim_frame_oam 0x8000, 0xD000, 0xC, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x10, -32, -48
	banim_frame_oam 0x8000, 0x5000, 0x90, -32, -16
	banim_frame_end
banim_forf_sw1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x9000, 0x97, -8, -48
	banim_frame_oam 0x8000, 0xD000, 0x11, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0x15, -32, -48
	banim_frame_oam 0x8000, 0x9000, 0x95, -32, -16
	banim_frame_end
banim_forf_sw1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x5000, 0x57, 13, -31
	banim_frame_oam 0x8000, 0x1000, 0x59, 5, -31
	banim_frame_oam 0x8000, 0xD000, 0x11, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0x15, -32, -48
	banim_frame_oam 0x8000, 0x9000, 0x95, -32, -16
	banim_frame_end
banim_forf_sw1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xC4, -40, -16
	banim_frame_oam 0x4000, 0xD000, 0x0, -56, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -24, 0
	banim_frame_oam 0x4000, 0x9000, 0x84, -56, 0
	banim_frame_end
banim_forf_sw1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xD000, 0x7, -56, -32
	banim_frame_oam 0x4000, 0x9000, 0x87, -24, 0
	banim_frame_oam 0x4000, 0x9000, 0x8B, -56, 0
	banim_frame_end
banim_forf_sw1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -24, -32
	banim_frame_oam 0x8000, 0x9000, 0x13, -40, -32
	banim_frame_oam 0x8000, 0x5000, 0x15, -48, -32
	banim_frame_oam 0x4000, 0x9000, 0x8F, -24, 0
	banim_frame_oam 0x0, 0x5000, 0x93, -40, 0
	banim_frame_oam 0x8000, 0x1000, 0x95, -48, 0
	banim_frame_end
banim_forf_sw1_oam_frame_4_l:
	banim_frame_oam 0x0, 0xD000, 0xB, -40, -48
	banim_frame_end
banim_forf_sw1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0xDF, 24, -16
	banim_frame_oam 0x8000, 0x9000, 0x1E, 24, -16
	banim_frame_oam 0x8000, 0xD000, 0x17, 8, -48
	banim_frame_oam 0x8000, 0x9000, 0x1B, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0x1D, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0x9B, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x9D, -16, -16
	banim_frame_end
banim_forf_sw1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, 32, -48
	banim_frame_oam 0x8000, 0x9000, 0x8, 16, -48
	banim_frame_oam 0x8000, 0x5000, 0xA, 8, -48
	banim_frame_oam 0x8000, 0x9000, 0x88, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x8A, 8, -16
	banim_frame_end
banim_forf_sw1_oam_frame_39_l:
	banim_frame_oam 0x8000, 0xD000, 0x4, 32, -48
	banim_frame_oam 0x8000, 0x9000, 0x8, 16, -48
	banim_frame_oam 0x8000, 0x5000, 0xA, 8, -48
	banim_frame_oam 0x8000, 0x9000, 0x88, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x8A, 8, -16
	banim_frame_end
banim_forf_sw1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0xC4, -16, -16
	banim_frame_oam 0x4000, 0x9000, 0xC0, 16, -12
	banim_frame_oam 0x4000, 0xD000, 0x0, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, 0
	banim_frame_oam 0x4000, 0x9000, 0x84, -32, 0
	banim_frame_end
banim_forf_sw1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x8000, 0xD7, -40, 0
	banim_frame_oam 0x4000, 0x8000, 0xDB, -8, 0
	banim_frame_oam 0x4000, 0x9000, 0xC7, -8, -16
	banim_frame_oam 0x4000, 0x9000, 0xCB, -40, -16
	banim_frame_oam 0x4000, 0x9000, 0xCF, -16, -32
	banim_frame_oam 0x0, 0x5000, 0xD3, -32, -32
	banim_frame_end
banim_forf_sw1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0xD000, 0x7, -48, -32
	banim_frame_oam 0x4000, 0x9000, 0x87, -16, 0
	banim_frame_oam 0x4000, 0x9000, 0x8B, -48, 0
	banim_frame_end
banim_forf_sw1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0xD000, 0xF, -64, -32
	banim_frame_oam 0x4000, 0x9000, 0x8F, -32, 0
	banim_frame_oam 0x4000, 0x9000, 0x93, -64, 0
	banim_frame_end
banim_forf_sw1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x53, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x57, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xD3, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xD7, -32, 0
	banim_frame_end
banim_forf_sw1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x5000, 0x5D, -16, -16
	banim_frame_oam 0x8000, 0xD000, 0x18, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x1C, -32, -48
	banim_frame_oam 0x8000, 0x5000, 0x9C, -32, -16
	banim_frame_end
banim_forf_sw1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0xDD, -10, -18
	banim_frame_oam 0x8000, 0x1000, 0xDF, -18, -18
	banim_frame_oam 0x0, 0x9000, 0x16, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1A, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x96, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x9A, -24, 0
	banim_frame_end
banim_forf_sw1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x1000, 0xFC, -23, -33
	banim_frame_oam 0x4000, 0x9000, 0xD6, -15, -9
	banim_frame_oam 0x4000, 0x1000, 0xF4, -7, -17
	banim_frame_oam 0x0, 0x9000, 0x1B, -15, -33
	banim_frame_oam 0x8000, 0x5000, 0x1F, -23, -33
	banim_frame_oam 0x4000, 0x9000, 0x9B, -15, -1
	banim_frame_oam 0x8000, 0x1000, 0x9F, -23, -1
	banim_frame_end
banim_forf_sw1_oam_frame_35_l:
	banim_frame_oam 0x8000, 0x5000, 0x9B, -6, -58
	banim_frame_oam 0x8000, 0xD000, 0xC, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x10, -32, -48
	banim_frame_oam 0x8000, 0x5000, 0x90, -32, -16
	banim_frame_end
banim_forf_sw1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_forf_sw1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_forf_sw1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_forf_sw1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_forf_sw1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0x48, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x4A, 8, -32
	banim_frame_oam 0x0, 0x5000, 0xC8, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0xCA, 8, 0
	banim_frame_oam 0x8000, 0x9000, 0x21, 40, -40
	banim_frame_oam 0x8000, 0x5000, 0x23, 32, -40
	banim_frame_oam 0x0, 0x5000, 0xA1, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xA3, 32, -8
	banim_frame_oam 0x4000, 0x1000, 0xE1, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xE3, 32, 8
	banim_frame_end
banim_forf_sw1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x5000, 0x40, 56, -32
	banim_frame_end
banim_forf_sw1_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, 16, -48
	banim_frame_oam 0x8000, 0x5000, 0xA, 8, -48
	banim_frame_oam 0x8000, 0x9000, 0x88, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x8A, 8, -16
	banim_frame_oam 0x8000, 0x9000, 0x45, 40, -32
	banim_frame_oam 0x8000, 0x5000, 0x47, 32, -32
	banim_frame_oam 0x0, 0x5000, 0xC5, 40, 0
	banim_frame_oam 0x8000, 0x1000, 0xC7, 32, 0
	banim_frame_end
banim_forf_sw1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x1000, 0x84, 56, -16
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_forf_sw1_oam_r:
banim_forf_sw1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xDD, 3, -15
	banim_frame_oam 0x8000, 0x0, 0xDF, 19, -15
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 16, 0
	banim_frame_end
banim_forf_sw1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0xC7, 0, -16
	banim_frame_oam 0x0, 0x4000, 0xC9, 8, -8
	banim_frame_oam 0x4000, 0x8000, 0x7, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xB, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0x47, -8, -16
	banim_frame_oam 0x0, 0x0, 0x4B, 24, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x65, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xA1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xA5, 24, 8
	banim_frame_end
banim_forf_sw1_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x8000, 0x7, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xB, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0x47, -8, -16
	banim_frame_oam 0x0, 0x0, 0x4B, 24, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x65, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xA1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xA5, 24, 8
	banim_frame_oam 0x0, 0x7000, 0xC7, -12, -25
	banim_frame_oam 0x0, 0x7000, 0xC9, -20, -33
	banim_frame_end
banim_forf_sw1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x8000, 0x7, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xB, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0x47, -8, -16
	banim_frame_oam 0x0, 0x0, 0x4B, 24, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x65, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xA1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xA5, 24, 8
	banim_frame_oam 0x0, 0x7000, 0xC7, -14, -28
	banim_frame_oam 0x0, 0x7000, 0xC9, -22, -36
	banim_frame_end
banim_forf_sw1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x4000, 0x12, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x14, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x52, -16, -8
	banim_frame_oam 0x0, 0x0, 0x54, 0, -8
	banim_frame_oam 0x4000, 0x8000, 0x67, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x6B, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0xA7, -8, -16
	banim_frame_oam 0x0, 0x0, 0xAB, 24, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x65, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xA1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xA5, 24, 8
	banim_frame_end
banim_forf_sw1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0x72, 15, -27
	banim_frame_oam 0x8000, 0x0, 0x74, 31, -27
	banim_frame_oam 0x4000, 0x0, 0xB2, 15, -11
	banim_frame_oam 0x0, 0x0, 0xB4, 31, -11
	banim_frame_oam 0x4000, 0x8000, 0xC, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x10, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0x4C, -8, -16
	banim_frame_oam 0x0, 0x0, 0x50, 24, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x65, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xA1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xA5, 24, 8
	banim_frame_end
banim_forf_sw1_oam_frame_24_r:
	banim_frame_oam 0x4000, 0x8000, 0xC, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x10, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0x4C, -8, -16
	banim_frame_oam 0x0, 0x0, 0x50, 24, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x65, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xA1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xA5, 24, 8
	banim_frame_end
banim_forf_sw1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x6C, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x70, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x61, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x65, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xA1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xA5, 24, 8
	banim_frame_end
banim_forf_sw1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x9C, 0, -48
	banim_frame_oam 0x0, 0x8000, 0x401, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x405, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x481, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x485, 24, 0
	banim_frame_end
banim_forf_sw1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x5000, 0xDD, -15, -20
	banim_frame_oam 0x8000, 0x1000, 0xDF, -23, -20
	banim_frame_oam 0x0, 0x8000, 0x1, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x5, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x81, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x85, 24, 0
	banim_frame_end
banim_forf_sw1_oam_frame_28_r:
	banim_frame_oam 0x8000, 0xC000, 0x6, -16, -48
	banim_frame_oam 0x8000, 0x8000, 0xA, 16, -48
	banim_frame_oam 0x8000, 0x8000, 0x8A, 16, -16
	banim_frame_end
banim_forf_sw1_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x8000, 0x1D, -11, -64
	banim_frame_oam 0x8000, 0xC000, 0xC, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x10, 24, -48
	banim_frame_oam 0x8000, 0x4000, 0x90, 24, -16
	banim_frame_end
banim_forf_sw1_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x0, 0x3F, -2, -56
	banim_frame_oam 0x0, 0x0, 0x7F, -2, -40
	banim_frame_oam 0x8000, 0xC000, 0x40C, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x410, 24, -48
	banim_frame_oam 0x8000, 0x4000, 0x490, 24, -16
	banim_frame_end
banim_forf_sw1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x9000, 0x1D, -4, -62
	banim_frame_oam 0x8000, 0xC000, 0xC, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x10, 24, -48
	banim_frame_oam 0x8000, 0x4000, 0x90, 24, -16
	banim_frame_end
banim_forf_sw1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x8000, 0x97, -24, -48
	banim_frame_oam 0x8000, 0xC000, 0x11, -16, -48
	banim_frame_oam 0x8000, 0x8000, 0x15, 16, -48
	banim_frame_oam 0x8000, 0x8000, 0x95, 16, -16
	banim_frame_end
banim_forf_sw1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x4000, 0x57, -29, -31
	banim_frame_oam 0x8000, 0x0, 0x59, -13, -31
	banim_frame_oam 0x8000, 0xC000, 0x11, -16, -48
	banim_frame_oam 0x8000, 0x8000, 0x15, 16, -48
	banim_frame_oam 0x8000, 0x8000, 0x95, 16, -16
	banim_frame_end
banim_forf_sw1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xC4, 8, -16
	banim_frame_oam 0x4000, 0xC000, 0x0, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -8, 0
	banim_frame_oam 0x4000, 0x8000, 0x84, 24, 0
	banim_frame_end
banim_forf_sw1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xC000, 0x7, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x87, -8, 0
	banim_frame_oam 0x4000, 0x8000, 0x8B, 24, 0
	banim_frame_end
banim_forf_sw1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x13, 24, -32
	banim_frame_oam 0x8000, 0x4000, 0x15, 40, -32
	banim_frame_oam 0x4000, 0x8000, 0x8F, -8, 0
	banim_frame_oam 0x0, 0x4000, 0x93, 24, 0
	banim_frame_oam 0x8000, 0x0, 0x95, 40, 0
	banim_frame_end
banim_forf_sw1_oam_frame_4_r:
	banim_frame_oam 0x0, 0xC000, 0xB, -24, -48
	banim_frame_end
banim_forf_sw1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0xDF, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0x1E, -40, -16
	banim_frame_oam 0x8000, 0xC000, 0x17, -40, -48
	banim_frame_oam 0x8000, 0x8000, 0x1B, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x1D, 8, -48
	banim_frame_oam 0x8000, 0x8000, 0x9B, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x9D, 8, -16
	banim_frame_end
banim_forf_sw1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -64, -48
	banim_frame_oam 0x8000, 0x8000, 0x8, -32, -48
	banim_frame_oam 0x8000, 0x4000, 0xA, -16, -48
	banim_frame_oam 0x8000, 0x8000, 0x88, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x8A, -16, -16
	banim_frame_end
banim_forf_sw1_oam_frame_39_r:
	banim_frame_oam 0x8000, 0xC000, 0x4, -64, -48
	banim_frame_oam 0x8000, 0x8000, 0x8, -32, -48
	banim_frame_oam 0x8000, 0x4000, 0xA, -16, -48
	banim_frame_oam 0x8000, 0x8000, 0x88, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x8A, -16, -16
	banim_frame_end
banim_forf_sw1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0xC4, -16, -16
	banim_frame_oam 0x4000, 0x8000, 0xC0, -48, -12
	banim_frame_oam 0x4000, 0xC000, 0x0, -32, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, 0
	banim_frame_oam 0x4000, 0x8000, 0x84, 0, 0
	banim_frame_end
banim_forf_sw1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x9000, 0xD7, 8, 0
	banim_frame_oam 0x4000, 0x9000, 0xDB, -24, 0
	banim_frame_oam 0x4000, 0x8000, 0xC7, -24, -16
	banim_frame_oam 0x4000, 0x8000, 0xCB, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0xCF, -16, -32
	banim_frame_oam 0x0, 0x4000, 0xD3, 16, -32
	banim_frame_end
banim_forf_sw1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0xC000, 0x7, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x87, -16, 0
	banim_frame_oam 0x4000, 0x8000, 0x8B, 16, 0
	banim_frame_end
banim_forf_sw1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0xC000, 0xF, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0x8F, 0, 0
	banim_frame_oam 0x4000, 0x8000, 0x93, 32, 0
	banim_frame_end
banim_forf_sw1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x53, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x57, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xD3, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xD7, 24, 0
	banim_frame_end
banim_forf_sw1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0x5D, 0, -16
	banim_frame_oam 0x8000, 0xC000, 0x18, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x1C, 24, -48
	banim_frame_oam 0x8000, 0x4000, 0x9C, 24, -16
	banim_frame_end
banim_forf_sw1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0xDD, -6, -18
	banim_frame_oam 0x8000, 0x0, 0xDF, 10, -18
	banim_frame_oam 0x0, 0x8000, 0x16, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x1A, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x96, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x9A, 16, 0
	banim_frame_end
banim_forf_sw1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x0, 0xFC, 15, -33
	banim_frame_oam 0x4000, 0x8000, 0xD6, -17, -9
	banim_frame_oam 0x4000, 0x0, 0xF4, -9, -17
	banim_frame_oam 0x0, 0x8000, 0x1B, -17, -33
	banim_frame_oam 0x8000, 0x4000, 0x1F, 15, -33
	banim_frame_oam 0x4000, 0x8000, 0x9B, -17, -1
	banim_frame_oam 0x8000, 0x0, 0x9F, 15, -1
	banim_frame_end
banim_forf_sw1_oam_frame_35_r:
	banim_frame_oam 0x8000, 0x4000, 0x9B, -2, -58
	banim_frame_oam 0x8000, 0xC000, 0xC, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x10, 24, -48
	banim_frame_oam 0x8000, 0x4000, 0x90, 24, -16
	banim_frame_end
banim_forf_sw1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_forf_sw1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_forf_sw1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_forf_sw1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_forf_sw1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0x48, -32, -32
	banim_frame_oam 0x8000, 0x4000, 0x4A, -16, -32
	banim_frame_oam 0x0, 0x4000, 0xC8, -32, 0
	banim_frame_oam 0x8000, 0x0, 0xCA, -16, 0
	banim_frame_oam 0x8000, 0x8000, 0x21, -56, -40
	banim_frame_oam 0x8000, 0x4000, 0x23, -40, -40
	banim_frame_oam 0x0, 0x4000, 0xA1, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xA3, -40, -8
	banim_frame_oam 0x4000, 0x0, 0xE1, -56, 8
	banim_frame_oam 0x0, 0x0, 0xE3, -40, 8
	banim_frame_end
banim_forf_sw1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x4000, 0x40, -64, -32
	banim_frame_end
banim_forf_sw1_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, -32, -48
	banim_frame_oam 0x8000, 0x4000, 0xA, -16, -48
	banim_frame_oam 0x8000, 0x8000, 0x88, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x8A, -16, -16
	banim_frame_oam 0x8000, 0x8000, 0x45, -56, -32
	banim_frame_oam 0x8000, 0x4000, 0x47, -40, -32
	banim_frame_oam 0x0, 0x4000, 0xC5, -56, 0
	banim_frame_oam 0x8000, 0x0, 0xC7, -40, 0
	banim_frame_end
banim_forf_sw1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x0, 0x84, -64, -16
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_forf_sw1_script:
banim_forf_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_forf_sw1_sheet_1, 16, banim_forf_sw1_oam_frame_1_r - banim_forf_sw1_oam_r
	banim_code_frame 6, banim_forf_sw1_sheet_1, 17, banim_forf_sw1_oam_frame_2_r - banim_forf_sw1_oam_r
	banim_code_frame 9, banim_forf_sw1_sheet_1, 18, banim_forf_sw1_oam_frame_3_r - banim_forf_sw1_oam_r
	banim_code_frame 5, banim_forf_sw1_sheet_2, 19, banim_forf_sw1_oam_frame_4_r - banim_forf_sw1_oam_r
	banim_code_frame 10, banim_forf_sw1_sheet_1, 20, banim_forf_sw1_oam_frame_5_r - banim_forf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_forf_sw1_sheet_2, 36, banim_forf_sw1_oam_frame_6_r - banim_forf_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_forf_sw1_sheet_2, 38, banim_forf_sw1_oam_frame_7_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_forf_sw1_sheet_1, 23, banim_forf_sw1_oam_frame_8_r - banim_forf_sw1_oam_r
	banim_code_frame 5, banim_forf_sw1_sheet_1, 24, banim_forf_sw1_oam_frame_9_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 25, banim_forf_sw1_oam_frame_10_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 26, banim_forf_sw1_oam_frame_11_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_2, 27, banim_forf_sw1_oam_frame_12_r - banim_forf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_forf_sw1_sheet_2, 28, banim_forf_sw1_oam_frame_13_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_forf_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 6, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 9, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 5, banim_forf_sw1_sheet_2, 35, banim_forf_sw1_oam_frame_16_r - banim_forf_sw1_oam_r
	banim_code_frame 10, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_forf_sw1_sheet_2, 37, banim_forf_sw1_oam_frame_17_r - banim_forf_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_forf_sw1_sheet_2, 39, banim_forf_sw1_oam_frame_18_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 5, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_2, 35, banim_forf_sw1_oam_frame_16_r - banim_forf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_forf_sw1_sheet_2, 35, banim_forf_sw1_oam_frame_16_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_forf_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_frame 2, banim_forf_sw1_sheet_0, 1, banim_forf_sw1_oam_frame_19_r - banim_forf_sw1_oam_r
	banim_code_frame 2, banim_forf_sw1_sheet_0, 2, banim_forf_sw1_oam_frame_20_r - banim_forf_sw1_oam_r
	banim_code_frame 10, banim_forf_sw1_sheet_0, 3, banim_forf_sw1_oam_frame_21_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 4, banim_forf_sw1_sheet_0, 4, banim_forf_sw1_oam_frame_22_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_0, 5, banim_forf_sw1_oam_frame_23_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_0, 6, banim_forf_sw1_oam_frame_24_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_forf_sw1_sheet_0, 7, banim_forf_sw1_oam_frame_25_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_3, 8, banim_forf_sw1_oam_frame_26_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_0, 9, banim_forf_sw1_oam_frame_27_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_forf_sw1_sheet_3, 10, banim_forf_sw1_oam_frame_28_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_3, 11, banim_forf_sw1_oam_frame_29_r - banim_forf_sw1_oam_r
	banim_code_frame 10, banim_forf_sw1_sheet_3, 12, banim_forf_sw1_oam_frame_30_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_forf_sw1_sheet_3, 13, banim_forf_sw1_oam_frame_31_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_3, 14, banim_forf_sw1_oam_frame_32_r - banim_forf_sw1_oam_r
	banim_code_frame 12, banim_forf_sw1_sheet_3, 15, banim_forf_sw1_oam_frame_33_r - banim_forf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_forf_sw1_sheet_1, 16, banim_forf_sw1_oam_frame_1_r - banim_forf_sw1_oam_r
	banim_code_frame 10, banim_forf_sw1_sheet_1, 17, banim_forf_sw1_oam_frame_2_r - banim_forf_sw1_oam_r
	banim_code_frame 6, banim_forf_sw1_sheet_1, 18, banim_forf_sw1_oam_frame_3_r - banim_forf_sw1_oam_r
	banim_code_frame 6, banim_forf_sw1_sheet_2, 19, banim_forf_sw1_oam_frame_4_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 10, banim_forf_sw1_sheet_1, 20, banim_forf_sw1_oam_frame_5_r - banim_forf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_forf_sw1_sheet_2, 36, banim_forf_sw1_oam_frame_6_r - banim_forf_sw1_oam_r
	banim_code_hit_critical_1
	banim_code_sound_hit_eliwood
	banim_code_frame 20, banim_forf_sw1_sheet_2, 38, banim_forf_sw1_oam_frame_7_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_forf_sw1_sheet_1, 23, banim_forf_sw1_oam_frame_8_r - banim_forf_sw1_oam_r
	banim_code_frame 5, banim_forf_sw1_sheet_1, 24, banim_forf_sw1_oam_frame_9_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 25, banim_forf_sw1_oam_frame_10_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 26, banim_forf_sw1_oam_frame_11_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_2, 27, banim_forf_sw1_oam_frame_12_r - banim_forf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_forf_sw1_sheet_2, 28, banim_forf_sw1_oam_frame_13_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_forf_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_frame 2, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_frame 2, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_frame 10, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 4, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_3, 33, banim_forf_sw1_oam_frame_34_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_3, 33, banim_forf_sw1_oam_frame_34_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_forf_sw1_sheet_3, 33, banim_forf_sw1_oam_frame_34_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_3, 33, banim_forf_sw1_oam_frame_34_r - banim_forf_sw1_oam_r
	banim_code_frame 10, banim_forf_sw1_sheet_3, 33, banim_forf_sw1_oam_frame_34_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 4, banim_forf_sw1_sheet_3, 33, banim_forf_sw1_oam_frame_34_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_3, 33, banim_forf_sw1_oam_frame_34_r - banim_forf_sw1_oam_r
	banim_code_frame 12, banim_forf_sw1_sheet_3, 33, banim_forf_sw1_oam_frame_34_r - banim_forf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 10, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 6, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 6, banim_forf_sw1_sheet_2, 35, banim_forf_sw1_oam_frame_16_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 10, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_forf_sw1_sheet_2, 37, banim_forf_sw1_oam_frame_17_r - banim_forf_sw1_oam_r
	banim_code_hit_critical_1
	banim_code_sound_hit_eliwood
	banim_code_frame 20, banim_forf_sw1_sheet_2, 39, banim_forf_sw1_oam_frame_18_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 5, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 34, banim_forf_sw1_oam_frame_15_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_2, 35, banim_forf_sw1_oam_frame_16_r - banim_forf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_forf_sw1_sheet_2, 35, banim_forf_sw1_oam_frame_16_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_0, 32, banim_forf_sw1_oam_frame_14_r - banim_forf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_forf_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_sword_swing_short
	banim_code_frame 4, banim_forf_sw1_sheet_3, 10, banim_forf_sw1_oam_frame_28_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_3, 11, banim_forf_sw1_oam_frame_29_r - banim_forf_sw1_oam_r
	banim_code_frame 20, banim_forf_sw1_sheet_3, 12, banim_forf_sw1_oam_frame_30_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_forf_sw1_sheet_3, 11, banim_forf_sw1_oam_frame_29_r - banim_forf_sw1_oam_r
	banim_code_frame 2, banim_forf_sw1_sheet_3, 10, banim_forf_sw1_oam_frame_28_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_forf_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 4, banim_forf_sw1_sheet_3, 10, banim_forf_sw1_oam_frame_28_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_3, 11, banim_forf_sw1_oam_frame_29_r - banim_forf_sw1_oam_r
	banim_code_frame 2, banim_forf_sw1_sheet_3, 12, banim_forf_sw1_oam_frame_30_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_3, 31, banim_forf_sw1_oam_frame_35_r - banim_forf_sw1_oam_r
	banim_code_frame 2, banim_forf_sw1_sheet_3, 12, banim_forf_sw1_oam_frame_30_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_3, 31, banim_forf_sw1_oam_frame_35_r - banim_forf_sw1_oam_r
	banim_code_frame 2, banim_forf_sw1_sheet_3, 12, banim_forf_sw1_oam_frame_30_r - banim_forf_sw1_oam_r
	banim_code_frame 3, banim_forf_sw1_sheet_3, 31, banim_forf_sw1_oam_frame_35_r - banim_forf_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 10, banim_forf_sw1_sheet_3, 12, banim_forf_sw1_oam_frame_30_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_forf_sw1_sheet_3, 11, banim_forf_sw1_oam_frame_29_r - banim_forf_sw1_oam_r
	banim_code_frame 2, banim_forf_sw1_sheet_3, 10, banim_forf_sw1_oam_frame_28_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_forf_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_forf_sw1_sheet_0, 29, banim_forf_sw1_oam_frame_36_r - banim_forf_sw1_oam_r
	banim_code_frame 20, banim_forf_sw1_sheet_0, 30, banim_forf_sw1_oam_frame_37_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_forf_sw1_sheet_0, 29, banim_forf_sw1_oam_frame_36_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_forf_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_forf_sw1_sheet_0, 29, banim_forf_sw1_oam_frame_36_r - banim_forf_sw1_oam_r
	banim_code_frame 20, banim_forf_sw1_sheet_0, 30, banim_forf_sw1_oam_frame_37_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_forf_sw1_sheet_0, 29, banim_forf_sw1_oam_frame_36_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_forf_sw1_mode_stand_close:
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_forf_sw1_mode_stand:
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_forf_sw1_mode_stand_range:
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_forf_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_forf_sw1_sheet_1, 16, banim_forf_sw1_oam_frame_1_r - banim_forf_sw1_oam_r
	banim_code_frame 6, banim_forf_sw1_sheet_1, 17, banim_forf_sw1_oam_frame_2_r - banim_forf_sw1_oam_r
	banim_code_frame 9, banim_forf_sw1_sheet_1, 18, banim_forf_sw1_oam_frame_3_r - banim_forf_sw1_oam_r
	banim_code_frame 5, banim_forf_sw1_sheet_2, 19, banim_forf_sw1_oam_frame_4_r - banim_forf_sw1_oam_r
	banim_code_frame 10, banim_forf_sw1_sheet_1, 20, banim_forf_sw1_oam_frame_5_r - banim_forf_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_forf_sw1_sheet_2, 21, banim_forf_sw1_oam_frame_38_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_2, 22, banim_forf_sw1_oam_frame_39_r - banim_forf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_forf_sw1_sheet_1, 23, banim_forf_sw1_oam_frame_8_r - banim_forf_sw1_oam_r
	banim_code_frame 5, banim_forf_sw1_sheet_1, 24, banim_forf_sw1_oam_frame_9_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 25, banim_forf_sw1_oam_frame_10_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_1, 26, banim_forf_sw1_oam_frame_11_r - banim_forf_sw1_oam_r
	banim_code_frame 4, banim_forf_sw1_sheet_2, 27, banim_forf_sw1_oam_frame_12_r - banim_forf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_forf_sw1_sheet_2, 28, banim_forf_sw1_oam_frame_13_r - banim_forf_sw1_oam_r
	banim_code_frame 1, banim_forf_sw1_sheet_0, 0, banim_forf_sw1_oam_frame_0_r - banim_forf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_forf_sw1_mode_attack_close - banim_forf_sw1_script
	.word banim_forf_sw1_mode_attack_close_back - banim_forf_sw1_script
	.word banim_forf_sw1_mode_attack_close_critical - banim_forf_sw1_script
	.word banim_forf_sw1_mode_attack_close_critical_back - banim_forf_sw1_script
	.word banim_forf_sw1_mode_attack_range - banim_forf_sw1_script
	.word banim_forf_sw1_mode_attack_range_critical - banim_forf_sw1_script
	.word banim_forf_sw1_mode_dodge_close - banim_forf_sw1_script
	.word banim_forf_sw1_mode_dodge_range - banim_forf_sw1_script
	.word banim_forf_sw1_mode_stand_close - banim_forf_sw1_script
	.word banim_forf_sw1_mode_stand - banim_forf_sw1_script
	.word banim_forf_sw1_mode_stand_range - banim_forf_sw1_script
	.word banim_forf_sw1_mode_attack_miss - banim_forf_sw1_script
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

