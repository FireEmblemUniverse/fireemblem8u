@ vim:ft=armv4
	.global banim_sks_sw1_4_script
	.global banim_sks_sw1_4_oam_r
	.global banim_sks_sw1_4_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xA6
	.section .data.oam_l
banim_sks_sw1_4_oam_l:
banim_sks_sw1_4_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xA0, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xE1, -24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x5, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x83, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x85, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xA6, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA7, 8, 8
	banim_frame_oam 0x8000, 0x9000, 0x6, 8, -32
	banim_frame_oam 0x4000, 0x1000, 0x86, 8, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0xA, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x88, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x8A, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xC9, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xA6, -24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0xB, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x8B, -8, 0
	banim_frame_oam 0x8000, 0x5000, 0xD, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x8D, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xCD, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xA7, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0xA7, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, -24, 8
	banim_frame_oam 0x8000, 0x9000, 0xE, 0, -32
	banim_frame_oam 0x0, 0x5000, 0x8E, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xCE, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xD0, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xEC, -8, -32
	banim_frame_end
banim_sks_sw1_4_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x91, 0, 0
	banim_frame_oam 0x8000, 0x9000, 0x10, 0, -32
	banim_frame_oam 0x0, 0x1000, 0x90, 16, -16
	banim_frame_end
banim_sks_sw1_4_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x92, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x14, 16, -24
	banim_frame_oam 0x0, 0x1000, 0x54, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x15, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0x55, 0, -32
	banim_frame_end
banim_sks_sw1_4_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x18, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x96, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xD6, 16, -16
	banim_frame_oam 0x0, 0x5000, 0x97, 8, -32
	banim_frame_end
banim_sks_sw1_4_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x9000, 0x19, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x1B, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x99, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0x9B, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xDB, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x3C, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xBE, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xDC, 32, -16
	banim_frame_oam 0x4000, 0x1000, 0xBC, 8, -32
	banim_frame_end
banim_sks_sw1_4_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -16
	banim_frame_oam 0x0, 0x5000, 0x80, 16, -32
	banim_frame_oam 0x0, 0x1000, 0xC1, 32, -16
	banim_frame_end
banim_sks_sw1_4_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x4, 0, -16
	banim_frame_oam 0x0, 0x5000, 0x82, 24, -32
	banim_frame_oam 0x8000, 0x1000, 0x84, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0x85, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xC5, 32, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0xA, 8, -16
	banim_frame_oam 0x0, 0x5000, 0x86, 24, -32
	banim_frame_oam 0x8000, 0x1000, 0x88, 16, -32
	banim_frame_oam 0x0, 0x1000, 0xC6, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xE6, 32, 8
	banim_frame_oam 0x0, 0x1000, 0xC7, 0, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0xB, 16, -40
	banim_frame_oam 0x0, 0x5000, 0x8B, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0xCB, 16, 8
	banim_frame_oam 0x8000, 0x5000, 0x6D, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x2D, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xD, 8, -40
	banim_frame_end
banim_sks_sw1_4_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0xE, 16, -24
	banim_frame_oam 0x8000, 0x5000, 0x12, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0x8E, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x92, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x13, 48, -24
	banim_frame_oam 0x0, 0x1000, 0x53, 48, -8
	banim_frame_oam 0x0, 0x5000, 0xAE, 32, -40
	banim_frame_oam 0x8000, 0x1000, 0xB0, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xB1, 0, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x14, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0x93, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0xB3, -8, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x95, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xD4, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xF4, -8, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_17_l:
	banim_frame_oam 0x0, 0x9000, 0x19, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0x1D, 32, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_18_l:
	banim_frame_oam 0x0, 0x9000, 0x99, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xFD, 32, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_19_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x4, 24, 0
	banim_frame_oam 0x0, 0x1000, 0x44, -16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x84, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xC4, -16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x9, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xA, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2A, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x4A, 24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0x85, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x89, 16, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x8B, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_24_l:
	banim_frame_oam 0x0, 0x5000, 0xCD, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCF, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xAA, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xEA, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xCC, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x8E, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xAD, -24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x92, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x91, -24, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x9000, 0xB1, 0, -16
	banim_frame_oam 0x4000, 0x5000, 0xF1, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0x95, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0xB5, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, 0
	banim_frame_oam 0x0, 0x1000, 0xF5, 40, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x16, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0x35, 32, -8
	banim_frame_oam 0x0, 0x1000, 0x75, 32, 8
	banim_frame_oam 0x8000, 0x1000, 0x97, 40, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_32_l:
	banim_frame_oam 0x0, 0x9000, 0x3B, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x3F, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0xBB, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xBF, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x1E, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x7A, 32, -8
	banim_frame_oam 0x0, 0x1000, 0xBA, 32, 8
	banim_frame_oam 0x8000, 0x1000, 0x99, 40, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x5000, 0xA0, -8, -32
	banim_frame_oam 0x0, 0x1000, 0xE0, -8, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 40, -40
	banim_frame_oam 0x8000, 0x5000, 0x6, 32, -40
	banim_frame_oam 0x0, 0x9000, 0x84, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x88, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xA2, 32, -8
	banim_frame_oam 0x4000, 0x5000, 0x89, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x8D, 0, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_35_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, 24, -32
	banim_frame_oam 0x8000, 0x9000, 0xB, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x48, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0x67, 24, 8
	banim_frame_oam 0x4000, 0x1000, 0x7, 32, -40
	banim_frame_end
banim_sks_sw1_4_oam_frame_36_l:
	banim_frame_oam 0x0, 0x9000, 0x10, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0x90, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0xD, 40, -40
	banim_frame_oam 0x8000, 0x5000, 0xF, 32, -40
	banim_frame_oam 0x0, 0x5000, 0x8E, 32, -8
	banim_frame_oam 0x4000, 0x1000, 0xCE, 32, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0x76, 16, -24
	banim_frame_oam 0x8000, 0x9000, 0x7A, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0xF6, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0xFA, 0, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_27_l:
	banim_frame_oam 0x0, 0x5000, 0x14, 40, -40
	banim_frame_oam 0x8000, 0x1000, 0x16, 32, -40
	banim_frame_oam 0x4000, 0x1000, 0x54, 40, -24
	banim_frame_oam 0x0, 0x1000, 0x56, 32, -24
	banim_frame_oam 0x8000, 0x9000, 0x74, 40, -16
	banim_frame_end
banim_sks_sw1_4_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_26_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_37_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_39_l:
	banim_frame_oam 0x0, 0x9000, 0x1, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x80, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x20, -24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x86, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x25, -24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_45_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -8, -8
	banim_frame_oam 0x8000, 0x9000, 0xF, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x2A, 24, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0x8B, -8, -8
	banim_frame_oam 0x8000, 0x9000, 0x8F, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0xAA, 24, 0
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x11, -7, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -15, -24
	banim_frame_oam 0x4000, 0x1000, 0x91, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -15, 8
	banim_frame_oam 0x0, 0x1000, 0xB2, -23, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xB5, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x18, -24, -8
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x98, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x9C, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xDC, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xF9, -8, 16
	banim_frame_end
banim_sks_sw1_4_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE1, -24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_41_l:
	banim_frame_oam 0x8000, 0x9000, 0x5, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x7, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x85, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x87, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xC5, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC7, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -24, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_42_l:
	banim_frame_oam 0x0, 0x1000, 0xE5, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -24, 8
	banim_frame_oam 0x8000, 0x9000, 0x8, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0xA, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x88, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8A, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xC8, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCA, -16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_43_l:
	banim_frame_oam 0x0, 0x1000, 0xE5, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -24, 8
	banim_frame_oam 0x8000, 0x9000, 0xB, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0xD, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x8B, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8D, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCD, -16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_38_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, 40, -40
	banim_frame_oam 0x8000, 0x5000, 0x1E, 32, -40
	banim_frame_oam 0x0, 0x5000, 0x9C, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0x9E, 32, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_sks_sw1_4_oam_r:
banim_sks_sw1_4_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xA0, -24, 0
	banim_frame_oam 0x0, 0x0, 0xE1, 16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x5, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x83, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x85, 8, 0
	banim_frame_oam 0x0, 0x0, 0xA6, 16, 8
	banim_frame_oam 0x0, 0x0, 0xA7, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x6, -24, -32
	banim_frame_oam 0x4000, 0x0, 0x86, -24, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0xA, 0, -32
	banim_frame_oam 0x0, 0x4000, 0x88, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x8A, 0, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xC9, 8, 0
	banim_frame_oam 0x0, 0x0, 0xA6, 16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0xB, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x8B, -8, 0
	banim_frame_oam 0x8000, 0x4000, 0xD, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x8D, -16, -24
	banim_frame_oam 0x0, 0x0, 0xCD, -16, -8
	banim_frame_oam 0x0, 0x0, 0xA7, -16, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0xA7, -16, 8
	banim_frame_oam 0x0, 0x0, 0xA6, 16, 8
	banim_frame_oam 0x8000, 0x8000, 0xE, -16, -32
	banim_frame_oam 0x0, 0x4000, 0x8E, 0, -16
	banim_frame_oam 0x0, 0x4000, 0xCE, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xD0, 8, 0
	banim_frame_oam 0x0, 0x0, 0xEC, 0, -32
	banim_frame_end
banim_sks_sw1_4_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x91, -8, 0
	banim_frame_oam 0x8000, 0x8000, 0x10, -16, -32
	banim_frame_oam 0x0, 0x0, 0x90, -24, -16
	banim_frame_end
banim_sks_sw1_4_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x92, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x14, -24, -24
	banim_frame_oam 0x0, 0x0, 0x54, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x15, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x55, -8, -32
	banim_frame_end
banim_sks_sw1_4_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x18, 0, -16
	banim_frame_oam 0x0, 0x0, 0x96, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xD6, -32, -16
	banim_frame_oam 0x0, 0x4000, 0x97, -24, -32
	banim_frame_end
banim_sks_sw1_4_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x8000, 0x19, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x1B, 0, -16
	banim_frame_oam 0x8000, 0x8000, 0x99, -32, -32
	banim_frame_oam 0x8000, 0x0, 0x9B, -16, -32
	banim_frame_oam 0x0, 0x0, 0xDB, -24, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 8, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x3C, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xBE, -32, -24
	banim_frame_oam 0x0, 0x0, 0xDC, -40, -16
	banim_frame_oam 0x4000, 0x0, 0xBC, -24, -32
	banim_frame_end
banim_sks_sw1_4_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -16
	banim_frame_oam 0x0, 0x4000, 0x80, -32, -32
	banim_frame_oam 0x0, 0x0, 0xC1, -40, -16
	banim_frame_end
banim_sks_sw1_4_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -32, -16
	banim_frame_oam 0x0, 0x4000, 0x82, -40, -32
	banim_frame_oam 0x8000, 0x0, 0x84, -24, -32
	banim_frame_oam 0x8000, 0x0, 0x85, -40, -16
	banim_frame_oam 0x0, 0x0, 0xC5, -40, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0xA, -16, -16
	banim_frame_oam 0x0, 0x4000, 0x86, -40, -32
	banim_frame_oam 0x8000, 0x0, 0x88, -24, -32
	banim_frame_oam 0x0, 0x0, 0xC6, -40, -16
	banim_frame_oam 0x0, 0x0, 0xE6, -40, 8
	banim_frame_oam 0x0, 0x0, 0xC7, -8, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0xB, -32, -40
	banim_frame_oam 0x0, 0x4000, 0x8B, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xCB, -32, 8
	banim_frame_oam 0x8000, 0x4000, 0x6D, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x2D, -8, 0
	banim_frame_oam 0x0, 0x0, 0xD, -16, -40
	banim_frame_end
banim_sks_sw1_4_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -48, -24
	banim_frame_oam 0x8000, 0x4000, 0x12, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8E, -48, 8
	banim_frame_oam 0x0, 0x0, 0x92, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x13, -56, -24
	banim_frame_oam 0x0, 0x0, 0x53, -56, -8
	banim_frame_oam 0x0, 0x4000, 0xAE, -48, -40
	banim_frame_oam 0x8000, 0x0, 0xB0, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xB1, -8, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -32, -16
	banim_frame_oam 0x4000, 0x0, 0x93, -24, -24
	banim_frame_oam 0x8000, 0x0, 0xB3, 0, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x95, -32, -16
	banim_frame_oam 0x0, 0x0, 0xD4, -16, -24
	banim_frame_oam 0x0, 0x0, 0xF4, 0, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_17_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x1D, -40, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_18_r:
	banim_frame_oam 0x0, 0x8000, 0x99, -32, -16
	banim_frame_oam 0x0, 0x0, 0xFD, -40, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_19_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -16
	banim_frame_oam 0x8000, 0x0, 0x4, -32, 0
	banim_frame_oam 0x0, 0x0, 0x44, 8, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -24, -16
	banim_frame_oam 0x8000, 0x0, 0x84, -32, 0
	banim_frame_oam 0x0, 0x0, 0xC4, 8, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0x9, 8, -16
	banim_frame_oam 0x0, 0x0, 0xA, -16, -24
	banim_frame_oam 0x0, 0x0, 0x2A, -8, -24
	banim_frame_oam 0x0, 0x0, 0x4A, -32, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0x85, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x89, -24, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -16, -16
	banim_frame_oam 0x0, 0x0, 0x8B, -24, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_24_r:
	banim_frame_oam 0x0, 0x4000, 0xCD, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCF, 8, 0
	banim_frame_oam 0x0, 0x4000, 0xAA, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xEA, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xCC, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x8E, -24, 0
	banim_frame_oam 0x0, 0x0, 0xAD, 16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -16, -16
	banim_frame_oam 0x0, 0x0, 0x92, -24, 8
	banim_frame_oam 0x0, 0x0, 0x91, 16, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x8000, 0xB1, -32, -16
	banim_frame_oam 0x4000, 0x4000, 0xF1, -32, 0
	banim_frame_oam 0x4000, 0x0, 0x95, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xB5, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, 0
	banim_frame_oam 0x0, 0x0, 0xF5, -48, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x35, -40, -8
	banim_frame_oam 0x0, 0x0, 0x75, -40, 8
	banim_frame_oam 0x8000, 0x0, 0x97, -48, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_32_r:
	banim_frame_oam 0x0, 0x8000, 0x3B, -32, -24
	banim_frame_oam 0x8000, 0x4000, 0x3F, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0xBB, -32, 8
	banim_frame_oam 0x0, 0x0, 0xBF, 0, 8
	banim_frame_oam 0x0, 0x0, 0x1E, 0, -32
	banim_frame_oam 0x8000, 0x0, 0x7A, -40, -8
	banim_frame_oam 0x0, 0x0, 0xBA, -40, 8
	banim_frame_oam 0x8000, 0x0, 0x99, -48, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -32, 8
	banim_frame_oam 0x0, 0x4000, 0xA0, -8, -32
	banim_frame_oam 0x0, 0x0, 0xE0, 0, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -56, -40
	banim_frame_oam 0x8000, 0x4000, 0x6, -40, -40
	banim_frame_oam 0x0, 0x8000, 0x84, -32, -24
	banim_frame_oam 0x8000, 0x4000, 0x88, 0, -24
	banim_frame_oam 0x0, 0x4000, 0xA2, -48, -8
	banim_frame_oam 0x4000, 0x4000, 0x89, -40, 8
	banim_frame_oam 0x0, 0x0, 0x8D, -8, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_35_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -40, -32
	banim_frame_oam 0x8000, 0x8000, 0xB, -24, -16
	banim_frame_oam 0x0, 0x0, 0x48, -8, 8
	banim_frame_oam 0x4000, 0x0, 0x67, -40, 8
	banim_frame_oam 0x4000, 0x0, 0x7, -48, -40
	banim_frame_end
banim_sks_sw1_4_oam_frame_36_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0x90, -32, 8
	banim_frame_oam 0x8000, 0x8000, 0xD, -56, -40
	banim_frame_oam 0x8000, 0x4000, 0xF, -40, -40
	banim_frame_oam 0x0, 0x4000, 0x8E, -48, -8
	banim_frame_oam 0x4000, 0x0, 0xCE, -48, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0x76, -48, -24
	banim_frame_oam 0x8000, 0x8000, 0x7A, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xF6, -48, 8
	banim_frame_oam 0x4000, 0x0, 0xFA, -16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_27_r:
	banim_frame_oam 0x0, 0x4000, 0x14, -56, -40
	banim_frame_oam 0x8000, 0x0, 0x16, -40, -40
	banim_frame_oam 0x4000, 0x0, 0x54, -56, -24
	banim_frame_oam 0x0, 0x0, 0x56, -40, -24
	banim_frame_oam 0x8000, 0x8000, 0x74, -56, -16
	banim_frame_end
banim_sks_sw1_4_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_26_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_37_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sks_sw1_4_oam_frame_39_r:
	banim_frame_oam 0x0, 0x8000, 0x1, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x80, -24, 8
	banim_frame_oam 0x0, 0x0, 0x20, 16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x86, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, -24, 8
	banim_frame_oam 0x0, 0x0, 0x25, 16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_45_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -24, -8
	banim_frame_oam 0x8000, 0x8000, 0xF, 8, -8
	banim_frame_oam 0x8000, 0x0, 0x2A, -32, 0
	banim_frame_end
banim_sks_sw1_4_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0x8B, -24, -8
	banim_frame_oam 0x8000, 0x8000, 0x8F, 8, -8
	banim_frame_oam 0x8000, 0x0, 0xAA, -32, 0
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x11, -9, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 7, -24
	banim_frame_oam 0x4000, 0x0, 0x91, -9, 8
	banim_frame_oam 0x0, 0x0, 0x93, 7, 8
	banim_frame_oam 0x0, 0x0, 0xB2, 15, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB5, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x18, -8, -8
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x98, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x9C, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -16, 8
	banim_frame_oam 0x0, 0x0, 0xDC, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xF9, -8, 16
	banim_frame_end
banim_sks_sw1_4_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE1, 16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_41_r:
	banim_frame_oam 0x8000, 0x8000, 0x5, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x7, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x85, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x87, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xC5, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC7, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 16, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_42_r:
	banim_frame_oam 0x0, 0x0, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 16, 8
	banim_frame_oam 0x8000, 0x8000, 0x8, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0xA, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x88, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x8A, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xC8, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCA, 8, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_43_r:
	banim_frame_oam 0x0, 0x0, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 16, 8
	banim_frame_oam 0x8000, 0x8000, 0xB, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0xD, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x8B, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x8D, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xCB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCD, 8, 8
	banim_frame_end
banim_sks_sw1_4_oam_frame_38_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -56, -40
	banim_frame_oam 0x8000, 0x4000, 0x1E, -40, -40
	banim_frame_oam 0x0, 0x4000, 0x9C, -56, -8
	banim_frame_oam 0x8000, 0x0, 0x9E, -40, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_sks_sw1_4_script:
banim_sks_sw1_4_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sw1_sheet_0, 0, banim_sks_sw1_4_oam_frame_0_r - banim_sks_sw1_4_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sks_sw1_sheet_0, 1, banim_sks_sw1_4_oam_frame_1_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 2, banim_sks_sw1_4_oam_frame_2_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 3, banim_sks_sw1_4_oam_frame_3_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_0, 4, banim_sks_sw1_4_oam_frame_4_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 5, banim_sks_sw1_4_oam_frame_5_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 6, banim_sks_sw1_4_oam_frame_6_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sw1_sheet_0, 7, banim_sks_sw1_4_oam_frame_7_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_0, 8, banim_sks_sw1_4_oam_frame_8_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 9, banim_sks_sw1_4_oam_frame_9_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 10, banim_sks_sw1_4_oam_frame_10_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 8, banim_sks_sw1_sheet_1, 11, banim_sks_sw1_4_oam_frame_11_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 12, banim_sks_sw1_4_oam_frame_12_r - banim_sks_sw1_4_oam_r
	banim_code_frame 16, banim_sks_sw1_sheet_1, 13, banim_sks_sw1_4_oam_frame_13_r - banim_sks_sw1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_sks_sw1_sheet_2, 33, banim_sks_sw1_4_oam_frame_14_r - banim_sks_sw1_4_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_sks_sw1_sheet_1, 15, banim_sks_sw1_4_oam_frame_15_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sks_sw1_sheet_1, 16, banim_sks_sw1_4_oam_frame_16_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 17, banim_sks_sw1_4_oam_frame_17_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 18, banim_sks_sw1_4_oam_frame_18_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 8, banim_sks_sw1_sheet_3, 19, banim_sks_sw1_4_oam_frame_19_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 20, banim_sks_sw1_4_oam_frame_20_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 21, banim_sks_sw1_4_oam_frame_21_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 22, banim_sks_sw1_4_oam_frame_22_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 5, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_frame 3, banim_sks_sw1_sheet_3, 24, banim_sks_sw1_4_oam_frame_24_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_0, 0, banim_sks_sw1_4_oam_frame_0_r - banim_sks_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_4_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 8, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_frame 16, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_sks_sw1_sheet_2, 34, banim_sks_sw1_4_oam_frame_27_r - banim_sks_sw1_4_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 8, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 5, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 3, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_4_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sw1_sheet_0, 0, banim_sks_sw1_4_oam_frame_0_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 24, banim_sks_sw1_4_oam_frame_24_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 12, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 25, banim_sks_sw1_4_oam_frame_29_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 12, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 25, banim_sks_sw1_4_oam_frame_29_r - banim_sks_sw1_4_oam_r
	banim_code_frame 12, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 25, banim_sks_sw1_4_oam_frame_29_r - banim_sks_sw1_4_oam_r
	banim_code_frame 18, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 22, banim_sks_sw1_4_oam_frame_22_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 21, banim_sks_sw1_4_oam_frame_21_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sw1_sheet_3, 20, banim_sks_sw1_4_oam_frame_20_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_3, 19, banim_sks_sw1_4_oam_frame_19_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 18, banim_sks_sw1_4_oam_frame_18_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 17, banim_sks_sw1_4_oam_frame_17_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 12, banim_sks_sw1_sheet_3, 26, banim_sks_sw1_4_oam_frame_30_r - banim_sks_sw1_4_oam_r
	banim_code_frame 3, banim_sks_sw1_sheet_3, 27, banim_sks_sw1_4_oam_frame_31_r - banim_sks_sw1_4_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_sks_sw1_sheet_3, 28, banim_sks_sw1_4_oam_frame_32_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_2, 29, banim_sks_sw1_4_oam_frame_33_r - banim_sks_sw1_4_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sks_sw1_sheet_2, 30, banim_sks_sw1_4_oam_frame_34_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_2, 31, banim_sks_sw1_4_oam_frame_35_r - banim_sks_sw1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_sks_sw1_sheet_2, 32, banim_sks_sw1_4_oam_frame_36_r - banim_sks_sw1_4_oam_r
	banim_code_hit_critical_1
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_sks_sw1_sheet_1, 15, banim_sks_sw1_4_oam_frame_15_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sks_sw1_sheet_1, 16, banim_sks_sw1_4_oam_frame_16_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 17, banim_sks_sw1_4_oam_frame_17_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 18, banim_sks_sw1_4_oam_frame_18_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 8, banim_sks_sw1_sheet_3, 19, banim_sks_sw1_4_oam_frame_19_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 20, banim_sks_sw1_4_oam_frame_20_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 21, banim_sks_sw1_4_oam_frame_21_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 22, banim_sks_sw1_4_oam_frame_22_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 5, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_frame 3, banim_sks_sw1_sheet_3, 24, banim_sks_sw1_4_oam_frame_24_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_0, 0, banim_sks_sw1_4_oam_frame_0_r - banim_sks_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_4_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 12, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 12, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 12, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 18, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 12, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 3, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_2, 38, banim_sks_sw1_4_oam_frame_37_r - banim_sks_sw1_4_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sks_sw1_sheet_2, 38, banim_sks_sw1_4_oam_frame_37_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_2, 38, banim_sks_sw1_4_oam_frame_37_r - banim_sks_sw1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_sks_sw1_sheet_2, 51, banim_sks_sw1_4_oam_frame_38_r - banim_sks_sw1_4_oam_r
	banim_code_hit_critical_1
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 36, banim_sks_sw1_4_oam_frame_26_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 8, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 5, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 3, banim_sks_sw1_sheet_3, 37, banim_sks_sw1_4_oam_frame_28_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_0, 35, banim_sks_sw1_4_oam_frame_25_r - banim_sks_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_4_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sw1_sheet_4, 39, banim_sks_sw1_4_oam_frame_39_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 47, banim_sks_sw1_4_oam_frame_40_r - banim_sks_sw1_4_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sks_sw1_sheet_5, 48, banim_sks_sw1_4_oam_frame_41_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_5, 47, banim_sks_sw1_4_oam_frame_40_r - banim_sks_sw1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_sks_sw1_sheet_4, 39, banim_sks_sw1_4_oam_frame_39_r - banim_sks_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_4_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sw1_sheet_4, 39, banim_sks_sw1_4_oam_frame_39_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 47, banim_sks_sw1_4_oam_frame_40_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 48, banim_sks_sw1_4_oam_frame_41_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 49, banim_sks_sw1_4_oam_frame_42_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 50, banim_sks_sw1_4_oam_frame_43_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 49, banim_sks_sw1_4_oam_frame_42_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 50, banim_sks_sw1_4_oam_frame_43_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 49, banim_sks_sw1_4_oam_frame_42_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 50, banim_sks_sw1_4_oam_frame_43_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 49, banim_sks_sw1_4_oam_frame_42_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_5, 50, banim_sks_sw1_4_oam_frame_43_r - banim_sks_sw1_4_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sks_sw1_sheet_5, 48, banim_sks_sw1_4_oam_frame_41_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_5, 47, banim_sks_sw1_4_oam_frame_40_r - banim_sks_sw1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_sks_sw1_sheet_4, 39, banim_sks_sw1_4_oam_frame_39_r - banim_sks_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_4_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_sks_sw1_sheet_4, 39, banim_sks_sw1_4_oam_frame_39_r - banim_sks_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 40, banim_sks_sw1_4_oam_frame_44_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 41, banim_sks_sw1_4_oam_frame_45_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 42, banim_sks_sw1_4_oam_frame_46_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 41, banim_sks_sw1_4_oam_frame_45_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 40, banim_sks_sw1_4_oam_frame_44_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 39, banim_sks_sw1_4_oam_frame_39_r - banim_sks_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_4_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_sks_sw1_sheet_4, 39, banim_sks_sw1_4_oam_frame_39_r - banim_sks_sw1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sw1_sheet_4, 40, banim_sks_sw1_4_oam_frame_44_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 41, banim_sks_sw1_4_oam_frame_45_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 42, banim_sks_sw1_4_oam_frame_46_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sw1_sheet_4, 41, banim_sks_sw1_4_oam_frame_45_r - banim_sks_sw1_4_oam_r
	banim_code_frame 2, banim_sks_sw1_sheet_4, 40, banim_sks_sw1_4_oam_frame_44_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_4, 39, banim_sks_sw1_4_oam_frame_39_r - banim_sks_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sw1_4_mode_stand_close:
	banim_code_frame 1, banim_sks_sw1_sheet_0, 0, banim_sks_sw1_4_oam_frame_0_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sks_sw1_4_mode_stand:
	banim_code_frame 1, banim_sks_sw1_sheet_0, 0, banim_sks_sw1_4_oam_frame_0_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sks_sw1_4_mode_stand_range:
	banim_code_frame 1, banim_sks_sw1_sheet_0, 0, banim_sks_sw1_4_oam_frame_0_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sks_sw1_4_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sw1_sheet_0, 0, banim_sks_sw1_4_oam_frame_0_r - banim_sks_sw1_4_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sks_sw1_sheet_0, 1, banim_sks_sw1_4_oam_frame_1_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 2, banim_sks_sw1_4_oam_frame_2_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 3, banim_sks_sw1_4_oam_frame_3_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_0, 4, banim_sks_sw1_4_oam_frame_4_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 5, banim_sks_sw1_4_oam_frame_5_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 6, banim_sks_sw1_4_oam_frame_6_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sw1_sheet_0, 7, banim_sks_sw1_4_oam_frame_7_r - banim_sks_sw1_4_oam_r
	banim_code_frame 8, banim_sks_sw1_sheet_0, 8, banim_sks_sw1_4_oam_frame_8_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_0, 9, banim_sks_sw1_4_oam_frame_9_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 10, banim_sks_sw1_4_oam_frame_10_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 8, banim_sks_sw1_sheet_1, 11, banim_sks_sw1_4_oam_frame_11_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 12, banim_sks_sw1_4_oam_frame_12_r - banim_sks_sw1_4_oam_r
	banim_code_frame 16, banim_sks_sw1_sheet_1, 13, banim_sks_sw1_4_oam_frame_13_r - banim_sks_sw1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_sks_sw1_sheet_1, 14, banim_sks_sw1_4_oam_frame_47_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_1, 15, banim_sks_sw1_4_oam_frame_15_r - banim_sks_sw1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sks_sw1_sheet_1, 16, banim_sks_sw1_4_oam_frame_16_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 17, banim_sks_sw1_4_oam_frame_17_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_1, 18, banim_sks_sw1_4_oam_frame_18_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 8, banim_sks_sw1_sheet_3, 19, banim_sks_sw1_4_oam_frame_19_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 20, banim_sks_sw1_4_oam_frame_20_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 21, banim_sks_sw1_4_oam_frame_21_r - banim_sks_sw1_4_oam_r
	banim_code_frame 4, banim_sks_sw1_sheet_3, 22, banim_sks_sw1_4_oam_frame_22_r - banim_sks_sw1_4_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 5, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sks_sw1_sheet_3, 23, banim_sks_sw1_4_oam_frame_23_r - banim_sks_sw1_4_oam_r
	banim_code_frame 3, banim_sks_sw1_sheet_3, 24, banim_sks_sw1_4_oam_frame_24_r - banim_sks_sw1_4_oam_r
	banim_code_frame 1, banim_sks_sw1_sheet_0, 0, banim_sks_sw1_4_oam_frame_0_r - banim_sks_sw1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_sks_sw1_4_mode_attack_close - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_attack_close_back - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_attack_close_critical - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_attack_close_critical_back - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_attack_range - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_attack_range_critical - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_dodge_close - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_dodge_range - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_stand_close - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_stand - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_stand_range - banim_sks_sw1_4_script
	.word banim_sks_sw1_4_mode_attack_miss - banim_sks_sw1_4_script
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

