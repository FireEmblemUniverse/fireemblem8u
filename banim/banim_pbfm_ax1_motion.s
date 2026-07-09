@ vim:ft=armv4
	.global banim_pbfm_ax1_script
	.global banim_pbfm_ax1_oam_r
	.global banim_pbfm_ax1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x91
	.section .data.oam_l
banim_pbfm_ax1_oam_l:
banim_pbfm_ax1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x8, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x86, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x88, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9, -24, -24
	banim_frame_oam 0x0, 0x1000, 0x29, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x49, -24, -32
	banim_frame_end
banim_pbfm_ax1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0xA, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0xC, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x8A, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x69, -24, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8D, -24, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x9000, 0xA9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE9, -24, -8
	banim_frame_oam 0x0, 0x5000, 0xC6, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -16, 0
	banim_frame_end
	banim_frame_end
banim_pbfm_ax1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, 40, -24
	banim_frame_oam 0x8000, 0x9000, 0x17, 24, -32
	banim_frame_oam 0x4000, 0x1000, 0x97, 24, 0
	banim_frame_oam 0x0, 0x5000, 0x19, 8, -40
	banim_frame_oam 0x8000, 0x9000, 0x59, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xD9, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xD5, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xB6, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xB7, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xD8, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xB8, 24, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_39_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, 24, -16
	banim_frame_oam 0x0, 0x5000, 0xA4, 8, -16
	banim_frame_oam 0x4000, 0x5000, 0xE0, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0xE4, 8, 0
	banim_frame_oam 0x4000, 0x1000, 0xA6, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xAD, 0, 0
	banim_frame_end
banim_pbfm_ax1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0x1B, 24, -16
	banim_frame_oam 0x0, 0x5000, 0x5B, 8, -16
	banim_frame_oam 0x0, 0x5000, 0x5D, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x5F, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x9B, 0, 0
	banim_frame_end
banim_pbfm_ax1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x9000, 0x9C, 24, -16
	banim_frame_oam 0x0, 0x5000, 0xDB, 8, -16
	banim_frame_oam 0x0, 0x5000, 0xDD, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0xDF, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0xAD, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xF8, 8, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x9000, 0x40, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0x42, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xC0, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xC2, 0, 8
	banim_frame_oam 0x4000, 0x9000, 0x0, 8, -40
	banim_frame_oam 0x8000, 0x1000, 0x4, 0, -40
	banim_frame_oam 0x0, 0x1000, 0xE0, 24, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x43, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0x45, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xC3, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xC5, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE1, 24, 8
	banim_frame_oam 0x8000, 0x1000, 0x5, -8, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x9000, 0x46, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0x48, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xC8, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0x6, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xE2, 24, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0xB, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x89, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x8B, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xE3, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xE4, 16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0x2C, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xAC, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xC, -16, -32
	banim_frame_end
banim_pbfm_ax1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x12, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x90, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x92, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, -24, -24
	banim_frame_oam 0x0, 0x1000, 0x7F, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x9F, 8, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0xCD, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xCF, -16, -8
	banim_frame_oam 0x4000, 0x9000, 0xC9, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0xE6, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x9000, 0x13, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x93, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xB0, -24, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_22_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x96, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xB1, -24, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x9000, 0x19, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x1B, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x99, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xB2, -24, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x1E, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x9C, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x9E, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xB3, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xD4, -24, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x9000, 0xB5, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xB9, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xF5, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xF9, -16, -8
	banim_frame_oam 0x4000, 0x9000, 0xBA, -16, 0
	banim_frame_end
banim_pbfm_ax1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_27_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x45, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x85, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x5, -24, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_28_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x8, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x86, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x88, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xA2, -24, -32
	banim_frame_end
banim_pbfm_ax1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x9, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0xD, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0xF, -24, -40
	banim_frame_oam 0x0, 0x5000, 0x89, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8B, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xC9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, -16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x12, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x90, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x92, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xA3, 16, -24
	banim_frame_oam 0x8000, 0x1000, 0xA5, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xC6, 16, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x9000, 0x13, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x93, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x95, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x8C, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x8E, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0xCC, 16, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x96, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xAF, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0xB1, 8, -16
	banim_frame_end
banim_pbfm_ax1_oam_frame_33_l:
	banim_frame_oam 0x8000, 0x9000, 0x19, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x1B, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x99, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xB2, 8, -40
	banim_frame_oam 0x8000, 0x1000, 0xB4, 0, -40
	banim_frame_oam 0x0, 0x1000, 0xCE, 8, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_35_l:
	banim_frame_oam 0x4000, 0x9000, 0xB5, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xF5, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xB9, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0xBB, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xF4, -16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x9000, 0x1C, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x9C, -16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x5000, 0xBC, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xBE, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xFC, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xFE, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xE9, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xEB, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xEC, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xEE, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEF, -24, -16
	banim_frame_end
banim_pbfm_ax1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0xF, 8, -40
	banim_frame_oam 0x8000, 0x9000, 0x13, -8, -40
	banim_frame_oam 0x4000, 0x9000, 0x8F, 8, -8
	banim_frame_oam 0x0, 0x5000, 0x93, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xCF, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD3, -8, 8
	banim_frame_oam 0x8000, 0x9000, 0x2D, 40, -32
	banim_frame_oam 0x4000, 0x1000, 0xAD, 40, 0
	banim_frame_end
banim_pbfm_ax1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x5000, 0xCD, 40, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0x15, 24, -16
	banim_frame_oam 0x0, 0x5000, 0x19, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x1B, 0, -16
	banim_frame_oam 0x4000, 0x5000, 0x55, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0x59, 8, 0
	banim_frame_oam 0x0, 0x1000, 0x5B, 0, 0
	banim_frame_oam 0x4000, 0x5000, 0x78, 0, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0x75, 40, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_pbfm_ax1_oam_r:
banim_pbfm_ax1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -8, 8
	banim_frame_oam 0x0, 0x0, 0x85, 8, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x8, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x86, -8, 8
	banim_frame_oam 0x0, 0x0, 0x88, 8, 8
	banim_frame_oam 0x0, 0x0, 0x9, 16, -24
	banim_frame_oam 0x0, 0x0, 0x29, 8, -32
	banim_frame_oam 0x0, 0x0, 0x49, 16, -32
	banim_frame_end
banim_pbfm_ax1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0xA, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0xC, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x8A, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x69, 16, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8D, -8, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x8000, 0xA9, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0xE9, -8, -8
	banim_frame_oam 0x0, 0x4000, 0xC6, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 8, 0
	banim_frame_end
	banim_frame_end
banim_pbfm_ax1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -56, -24
	banim_frame_oam 0x8000, 0x8000, 0x17, -40, -32
	banim_frame_oam 0x4000, 0x0, 0x97, -40, 0
	banim_frame_oam 0x0, 0x4000, 0x19, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x59, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xD9, -24, 8
	banim_frame_oam 0x0, 0x0, 0xD5, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xB6, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xB7, -8, 0
	banim_frame_oam 0x0, 0x0, 0xD8, 0, 8
	banim_frame_oam 0x0, 0x0, 0xB8, -32, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_39_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -56, -16
	banim_frame_oam 0x0, 0x4000, 0xA4, -24, -16
	banim_frame_oam 0x4000, 0x4000, 0xE0, -56, 0
	banim_frame_oam 0x4000, 0x0, 0xE4, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xA6, -32, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xAD, -8, 0
	banim_frame_end
banim_pbfm_ax1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0x1B, -56, -16
	banim_frame_oam 0x0, 0x4000, 0x5B, -24, -16
	banim_frame_oam 0x0, 0x4000, 0x5D, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x5F, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x9B, -8, 0
	banim_frame_end
banim_pbfm_ax1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x8000, 0x9C, -56, -16
	banim_frame_oam 0x0, 0x4000, 0xDB, -24, -16
	banim_frame_oam 0x0, 0x4000, 0xDD, -32, 0
	banim_frame_oam 0x8000, 0x0, 0xDF, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xAD, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xF8, -24, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x8000, 0x40, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x42, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xC0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xC2, -8, 8
	banim_frame_oam 0x4000, 0x8000, 0x0, -40, -40
	banim_frame_oam 0x8000, 0x0, 0x4, -8, -40
	banim_frame_oam 0x0, 0x0, 0xE0, -32, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x43, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x45, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xC3, -24, 8
	banim_frame_oam 0x0, 0x0, 0xC5, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE1, -32, 8
	banim_frame_oam 0x8000, 0x0, 0x5, 0, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x8000, 0x46, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x48, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -24, 8
	banim_frame_oam 0x0, 0x0, 0xC8, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x6, 0, -24
	banim_frame_oam 0x0, 0x0, 0xE2, -32, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0xB, 0, -32
	banim_frame_oam 0x0, 0x4000, 0x89, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x8B, 0, 0
	banim_frame_oam 0x0, 0x0, 0xE3, -24, -16
	banim_frame_oam 0x0, 0x0, 0xE4, -24, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0x2C, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xAC, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xC, 0, -32
	banim_frame_end
banim_pbfm_ax1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x12, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x90, -8, 8
	banim_frame_oam 0x0, 0x0, 0x92, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, 16, -24
	banim_frame_oam 0x0, 0x0, 0x7F, 16, -8
	banim_frame_oam 0x0, 0x0, 0x9F, -16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0xCD, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xCF, 8, -8
	banim_frame_oam 0x4000, 0x8000, 0xC9, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xE6, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x8000, 0x13, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x93, -8, 8
	banim_frame_oam 0x0, 0x0, 0x95, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xB0, 16, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_22_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x96, -8, 8
	banim_frame_oam 0x0, 0x0, 0x98, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xB1, 16, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x8000, 0x19, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x1B, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x99, -8, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xB2, 16, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x1E, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x9C, -8, 8
	banim_frame_oam 0x0, 0x0, 0x9E, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xB3, 8, -32
	banim_frame_oam 0x0, 0x0, 0xD4, 16, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x8000, 0xB5, -24, -24
	banim_frame_oam 0x8000, 0x0, 0xB9, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xF5, -24, -8
	banim_frame_oam 0x0, 0x0, 0xF9, 8, -8
	banim_frame_oam 0x4000, 0x8000, 0xBA, -16, 0
	banim_frame_end
banim_pbfm_ax1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_27_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x45, 8, -8
	banim_frame_oam 0x0, 0x0, 0x85, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x5, 16, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_28_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x8, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x86, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x88, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xA2, 16, -32
	banim_frame_end
banim_pbfm_ax1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x9, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0xD, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0xF, 16, -40
	banim_frame_oam 0x0, 0x4000, 0x89, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x8B, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xC9, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCB, 8, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x12, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x90, -8, 8
	banim_frame_oam 0x0, 0x0, 0x92, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xA3, -32, -24
	banim_frame_oam 0x8000, 0x0, 0xA5, -16, -24
	banim_frame_oam 0x0, 0x0, 0xC6, -24, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x8000, 0x13, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x93, -8, 8
	banim_frame_oam 0x0, 0x0, 0x95, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x8C, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x8E, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xCC, -32, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x96, -8, 8
	banim_frame_oam 0x0, 0x0, 0x98, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xAF, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xB1, -16, -16
	banim_frame_end
banim_pbfm_ax1_oam_frame_33_r:
	banim_frame_oam 0x8000, 0x8000, 0x19, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x1B, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x99, -8, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xB2, -24, -40
	banim_frame_oam 0x8000, 0x0, 0xB4, -8, -40
	banim_frame_oam 0x0, 0x0, 0xCE, -16, -24
	banim_frame_end
banim_pbfm_ax1_oam_frame_35_r:
	banim_frame_oam 0x4000, 0x8000, 0xB5, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xF5, -16, -8
	banim_frame_oam 0x0, 0x4000, 0xB9, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xBB, 0, 0
	banim_frame_oam 0x0, 0x0, 0xF4, 8, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x8000, 0x1C, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x9C, -16, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x4000, 0xBC, -8, -24
	banim_frame_oam 0x8000, 0x0, 0xBE, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xFC, -8, -8
	banim_frame_oam 0x0, 0x0, 0xFE, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xE9, -8, 0
	banim_frame_oam 0x0, 0x0, 0xEB, 8, 0
	banim_frame_oam 0x4000, 0x0, 0xEC, -8, 8
	banim_frame_oam 0x0, 0x0, 0xEE, 8, 8
	banim_frame_oam 0x0, 0x0, 0xEF, 16, -16
	banim_frame_end
banim_pbfm_ax1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0x13, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8F, -40, -8
	banim_frame_oam 0x0, 0x4000, 0x93, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCF, -40, 8
	banim_frame_oam 0x4000, 0x0, 0xD3, -8, 8
	banim_frame_oam 0x8000, 0x8000, 0x2D, -56, -32
	banim_frame_oam 0x4000, 0x0, 0xAD, -56, 0
	banim_frame_end
banim_pbfm_ax1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x4000, 0xCD, -56, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0x15, -56, -16
	banim_frame_oam 0x0, 0x4000, 0x19, -24, -16
	banim_frame_oam 0x8000, 0x0, 0x1B, -8, -16
	banim_frame_oam 0x4000, 0x4000, 0x55, -56, 0
	banim_frame_oam 0x4000, 0x0, 0x59, -24, 0
	banim_frame_oam 0x0, 0x0, 0x5B, -8, 0
	banim_frame_oam 0x4000, 0x4000, 0x78, -32, 8
	banim_frame_end
banim_pbfm_ax1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0x75, -56, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbfm_ax1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_pbfm_ax1_script:
banim_pbfm_ax1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_0, 1, banim_pbfm_ax1_oam_frame_1_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_0, 2, banim_pbfm_ax1_oam_frame_2_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 3, banim_pbfm_ax1_oam_frame_3_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 4, banim_pbfm_ax1_oam_frame_4_r - banim_pbfm_ax1_oam_r
	banim_code_frame 20, banim_pbfm_ax1_sheet_0, 5, banim_pbfm_ax1_oam_frame_5_r - banim_pbfm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_pbfm_ax1_sheet_1, 34, banim_pbfm_ax1_oam_frame_6_r - banim_pbfm_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 36, banim_pbfm_ax1_oam_frame_7_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_pbfm_ax1_sheet_0, 9, banim_pbfm_ax1_oam_frame_8_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_0, 10, banim_pbfm_ax1_oam_frame_9_r - banim_pbfm_ax1_oam_r
	banim_code_frame 2, banim_pbfm_ax1_sheet_2, 11, banim_pbfm_ax1_oam_frame_10_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_2, 12, banim_pbfm_ax1_oam_frame_11_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_2, 13, banim_pbfm_ax1_oam_frame_12_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 16, banim_pbfm_ax1_sheet_2, 12, banim_pbfm_ax1_oam_frame_11_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 14, banim_pbfm_ax1_oam_frame_13_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 15, banim_pbfm_ax1_oam_frame_14_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 16, banim_pbfm_ax1_oam_frame_15_r - banim_pbfm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 17, banim_pbfm_ax1_oam_frame_16_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 20, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_pbfm_ax1_sheet_1, 35, banim_pbfm_ax1_oam_frame_18_r - banim_pbfm_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 37, banim_pbfm_ax1_oam_frame_19_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 2, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 16, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_frame 8, banim_pbfm_ax1_sheet_2, 18, banim_pbfm_ax1_oam_frame_21_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 19, banim_pbfm_ax1_oam_frame_22_r - banim_pbfm_ax1_oam_r
	banim_code_frame 12, banim_pbfm_ax1_sheet_2, 20, banim_pbfm_ax1_oam_frame_23_r - banim_pbfm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 21, banim_pbfm_ax1_oam_frame_24_r - banim_pbfm_ax1_oam_r
	banim_code_frame 2, banim_pbfm_ax1_sheet_2, 22, banim_pbfm_ax1_oam_frame_25_r - banim_pbfm_ax1_oam_r
	banim_code_frame 20, banim_pbfm_ax1_sheet_3, 23, banim_pbfm_ax1_oam_frame_26_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_3, 24, banim_pbfm_ax1_oam_frame_27_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_3, 25, banim_pbfm_ax1_oam_frame_28_r - banim_pbfm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pbfm_ax1_sheet_3, 26, banim_pbfm_ax1_oam_frame_29_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_3, 27, banim_pbfm_ax1_oam_frame_30_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_3, 28, banim_pbfm_ax1_oam_frame_31_r - banim_pbfm_ax1_oam_r
	banim_code_frame 30, banim_pbfm_ax1_sheet_3, 29, banim_pbfm_ax1_oam_frame_32_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_3, 30, banim_pbfm_ax1_oam_frame_33_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_0, 2, banim_pbfm_ax1_oam_frame_2_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 3, banim_pbfm_ax1_oam_frame_3_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 4, banim_pbfm_ax1_oam_frame_4_r - banim_pbfm_ax1_oam_r
	banim_code_frame 20, banim_pbfm_ax1_sheet_0, 5, banim_pbfm_ax1_oam_frame_5_r - banim_pbfm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_pbfm_ax1_sheet_1, 34, banim_pbfm_ax1_oam_frame_6_r - banim_pbfm_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 36, banim_pbfm_ax1_oam_frame_7_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_pbfm_ax1_sheet_0, 9, banim_pbfm_ax1_oam_frame_8_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_0, 10, banim_pbfm_ax1_oam_frame_9_r - banim_pbfm_ax1_oam_r
	banim_code_frame 2, banim_pbfm_ax1_sheet_2, 11, banim_pbfm_ax1_oam_frame_10_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_2, 12, banim_pbfm_ax1_oam_frame_11_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 13, banim_pbfm_ax1_oam_frame_12_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 16, banim_pbfm_ax1_sheet_2, 12, banim_pbfm_ax1_oam_frame_11_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 14, banim_pbfm_ax1_oam_frame_13_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 15, banim_pbfm_ax1_oam_frame_14_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 16, banim_pbfm_ax1_oam_frame_15_r - banim_pbfm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 17, banim_pbfm_ax1_oam_frame_16_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 8, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 12, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 2, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 20, banim_pbfm_ax1_sheet_3, 40, banim_pbfm_ax1_oam_frame_34_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_3, 40, banim_pbfm_ax1_oam_frame_34_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_3, 40, banim_pbfm_ax1_oam_frame_34_r - banim_pbfm_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_pbfm_ax1_sheet_3, 40, banim_pbfm_ax1_oam_frame_34_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_3, 40, banim_pbfm_ax1_oam_frame_34_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_3, 40, banim_pbfm_ax1_oam_frame_34_r - banim_pbfm_ax1_oam_r
	banim_code_frame 30, banim_pbfm_ax1_sheet_3, 40, banim_pbfm_ax1_oam_frame_34_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_3, 40, banim_pbfm_ax1_oam_frame_34_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 20, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_pbfm_ax1_sheet_1, 34, banim_pbfm_ax1_oam_frame_6_r - banim_pbfm_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_pbfm_ax1_sheet_1, 36, banim_pbfm_ax1_oam_frame_7_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_frame 2, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 16, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 39, banim_pbfm_ax1_oam_frame_20_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 38, banim_pbfm_ax1_oam_frame_17_r - banim_pbfm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_mode_attack_range:
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_mode_attack_range_critical:
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_pbfm_ax1_sheet_3, 31, banim_pbfm_ax1_oam_frame_35_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_3, 32, banim_pbfm_ax1_oam_frame_36_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbfm_ax1_sheet_3, 33, banim_pbfm_ax1_oam_frame_37_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_pbfm_ax1_sheet_3, 31, banim_pbfm_ax1_oam_frame_35_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_3, 32, banim_pbfm_ax1_oam_frame_36_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbfm_ax1_sheet_3, 33, banim_pbfm_ax1_oam_frame_37_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbfm_ax1_mode_stand_close:
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_mode_stand:
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_mode_stand_range:
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbfm_ax1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_0, 1, banim_pbfm_ax1_oam_frame_1_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_0, 2, banim_pbfm_ax1_oam_frame_2_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 3, banim_pbfm_ax1_oam_frame_3_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_0, 4, banim_pbfm_ax1_oam_frame_4_r - banim_pbfm_ax1_oam_r
	banim_code_frame 20, banim_pbfm_ax1_sheet_0, 5, banim_pbfm_ax1_oam_frame_5_r - banim_pbfm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_pbfm_ax1_sheet_0, 7, banim_pbfm_ax1_oam_frame_38_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 8, banim_pbfm_ax1_oam_frame_39_r - banim_pbfm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_pbfm_ax1_sheet_0, 9, banim_pbfm_ax1_oam_frame_8_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_0, 10, banim_pbfm_ax1_oam_frame_9_r - banim_pbfm_ax1_oam_r
	banim_code_frame 2, banim_pbfm_ax1_sheet_2, 11, banim_pbfm_ax1_oam_frame_10_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_2, 12, banim_pbfm_ax1_oam_frame_11_r - banim_pbfm_ax1_oam_r
	banim_code_frame 3, banim_pbfm_ax1_sheet_2, 13, banim_pbfm_ax1_oam_frame_12_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 16, banim_pbfm_ax1_sheet_2, 12, banim_pbfm_ax1_oam_frame_11_r - banim_pbfm_ax1_oam_r
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 14, banim_pbfm_ax1_oam_frame_13_r - banim_pbfm_ax1_oam_r
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 15, banim_pbfm_ax1_oam_frame_14_r - banim_pbfm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbfm_ax1_sheet_2, 16, banim_pbfm_ax1_oam_frame_15_r - banim_pbfm_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_pbfm_ax1_sheet_2, 17, banim_pbfm_ax1_oam_frame_16_r - banim_pbfm_ax1_oam_r
	banim_code_frame 1, banim_pbfm_ax1_sheet_0, 0, banim_pbfm_ax1_oam_frame_0_r - banim_pbfm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pbfm_ax1_mode_attack_close - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_attack_close_back - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_attack_close_critical - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_attack_close_critical_back - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_attack_range - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_attack_range_critical - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_dodge_close - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_dodge_range - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_stand_close - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_stand - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_stand_range - banim_pbfm_ax1_script
	.word banim_pbfm_ax1_mode_attack_miss - banim_pbfm_ax1_script
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

