@ vim:ft=armv4
	.global banim_lorf_sw1_script
	.global banim_lorf_sw1_oam_r
	.global banim_lorf_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x2
	.section .data.oam_l
banim_lorf_sw1_oam_l:
banim_lorf_sw1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA0, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xA1, 16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA3, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, 16, 0
	banim_frame_oam 0x0, 0x1000, 0xA5, -24, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x8, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x86, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x88, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -24, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0xB, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x89, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8B, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC9, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xA9, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xAC, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xEC, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xAD, -24, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x11, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x91, -24, 0
	banim_frame_oam 0x0, 0x1000, 0x90, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x8F, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xCF, 8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x14, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x93, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x92, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xD2, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xF2, 8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x17, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x95, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xD5, 8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x18, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x98, 40, -8
	banim_frame_oam 0x0, 0x1000, 0x9A, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0x9B, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xBA, -16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x3C, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x1C, 48, -8
	banim_frame_oam 0x0, 0x1000, 0x1E, 40, -8
	banim_frame_oam 0x0, 0x1000, 0xBC, 40, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, 0, -16
	banim_frame_end
banim_lorf_sw1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x80, 48, -8
	banim_frame_oam 0x0, 0x1000, 0x82, 40, -8
	banim_frame_oam 0x0, 0x1000, 0x83, 40, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x9000, 0x4, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x84, 48, -8
	banim_frame_oam 0x0, 0x1000, 0x86, 40, -8
	banim_frame_oam 0x0, 0x1000, 0x87, 40, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x8, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x88, 48, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, 40, -8
	banim_frame_oam 0x0, 0x1000, 0x8B, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x8D, 40, -8
	banim_frame_oam 0x0, 0x1000, 0x8F, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x12, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x90, 32, -8
	banim_frame_oam 0x0, 0x1000, 0x92, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x13, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0x93, 8, 8
	banim_frame_oam 0x0, 0x5000, 0xB3, 24, -8
	banim_frame_oam 0x0, 0x1000, 0xF3, 24, 8
	banim_frame_oam 0x0, 0x1000, 0xF4, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0x17, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x95, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x97, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, 4, -24
	banim_frame_oam 0x8000, 0x5000, 0x17, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0x95, 4, 8
	banim_frame_oam 0x0, 0x1000, 0x97, -4, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x98, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0xB9, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xB7, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xF8, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xF9, -16, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x3C, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xBC, 40, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0x1D, 40, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x83, 40, 0
	banim_frame_oam 0x4000, 0x1000, 0x81, 40, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x4, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x87, 40, 0
	banim_frame_oam 0x4000, 0x1000, 0x85, 40, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x1C, 56, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x9000, 0x1A, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1C, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x9A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9C, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xBA, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xFA, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0x1D, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x9D, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xBD, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xDD, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xBE, -32, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_25_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xC0, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x5, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x83, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xA3, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_27_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x8, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x86, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x87, -24, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_28_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0xB, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x89, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x8B, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xA9, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x8C, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xAC, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x11, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x8F, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x91, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xAF, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x14, -32, -16
	banim_frame_oam 0x0, 0x5000, 0x92, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x94, -24, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x17, -32, -16
	banim_frame_oam 0x0, 0x5000, 0x95, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x97, -24, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_33_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x1A, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x98, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x9A, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0xB8, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xB9, -16, -32
	banim_frame_end
banim_lorf_sw1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x9000, 0x1B, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, -32, -32
	banim_frame_oam 0x0, 0x5000, 0x9B, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x9D, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xDB, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xDC, -8, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_35_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -24, -32
	banim_frame_oam 0x0, 0x5000, 0x80, -24, 0
	banim_frame_oam 0x8000, 0x5000, 0x2, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0x82, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xC2, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC1, -32, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_36_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x5, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0x83, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xC3, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -40, 0
	banim_frame_oam 0x0, 0x1000, 0xA4, -24, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_37_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x8, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0x86, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x87, -40, 0
	banim_frame_oam 0x0, 0x1000, 0xA7, -32, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0xB, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x89, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_47_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x91, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x50, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x90, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, 16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x5000, 0xB2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xF2, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xD1, 0, -16
	banim_frame_oam 0x4000, 0x9000, 0xCD, -16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_49_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x34, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x14, 8, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x17, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x39, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x19, 8, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x1A, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x9A, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x3C, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x1C, 8, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xB5, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xB7, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xF5, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xF7, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xB8, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xBA, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xF8, 8, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x3D, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x3F, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xBD, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xBF, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xDE, 8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_41_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA0, 8, -8
	banim_frame_oam 0x8000, 0x1000, 0xA1, 16, 0
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_42_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA3, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, 16, 0
	banim_frame_oam 0x0, 0x1000, 0xC4, -24, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_43_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0x8, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x86, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x88, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xC6, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xC8, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x9, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x89, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA9, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xE9, 16, 0
	banim_frame_oam 0x0, 0x1000, 0xE7, -24, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_44_l:
	banim_frame_oam 0x8000, 0x9000, 0xA, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x8A, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0xC, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAC, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xCC, 8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_45_l:
	banim_frame_oam 0x8000, 0x9000, 0xD, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x8D, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xCD, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0xF, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAF, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xCF, 8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_46_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x90, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xD0, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x12, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x92, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xB2, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xD2, 8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x80, 56, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_lorf_sw1_oam_r:
banim_lorf_sw1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xA0, -16, -8
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xA1, -24, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -8, 8
	banim_frame_oam 0x0, 0x0, 0x85, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xA3, -16, -8
	banim_frame_oam 0x0, 0x0, 0xE3, -16, 8
	banim_frame_oam 0x0, 0x0, 0xA4, -24, 0
	banim_frame_oam 0x0, 0x0, 0xA5, 16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x8, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x86, -8, 8
	banim_frame_oam 0x0, 0x0, 0x88, 8, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0xB, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x89, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8B, 8, 8
	banim_frame_oam 0x0, 0x0, 0xC9, -8, -32
	banim_frame_oam 0x0, 0x0, 0xA9, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xAC, -16, 0
	banim_frame_oam 0x0, 0x0, 0xEC, -8, -32
	banim_frame_oam 0x0, 0x0, 0xAD, 16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x11, 8, -16
	banim_frame_oam 0x0, 0x0, 0x91, 16, 0
	banim_frame_oam 0x0, 0x0, 0x90, -8, -24
	banim_frame_oam 0x8000, 0x0, 0x8F, -16, -8
	banim_frame_oam 0x0, 0x0, 0xCF, -16, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x14, 8, -16
	banim_frame_oam 0x0, 0x0, 0x93, 16, 0
	banim_frame_oam 0x8000, 0x0, 0x92, -16, -16
	banim_frame_oam 0x0, 0x0, 0xD2, -16, 0
	banim_frame_oam 0x0, 0x0, 0xF2, -16, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x17, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x95, -16, -8
	banim_frame_oam 0x0, 0x0, 0xD5, -16, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x98, -56, -8
	banim_frame_oam 0x0, 0x0, 0x9A, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x9B, -32, -16
	banim_frame_oam 0x0, 0x0, 0xBA, 8, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x3C, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x1C, -64, -8
	banim_frame_oam 0x0, 0x0, 0x1E, -48, -8
	banim_frame_oam 0x0, 0x0, 0xBC, -48, 0
	banim_frame_oam 0x0, 0x0, 0xBD, -8, -16
	banim_frame_end
banim_lorf_sw1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x80, -64, -8
	banim_frame_oam 0x0, 0x0, 0x82, -48, -8
	banim_frame_oam 0x0, 0x0, 0x83, -48, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x84, -64, -8
	banim_frame_oam 0x0, 0x0, 0x86, -48, -8
	banim_frame_oam 0x0, 0x0, 0x87, -48, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x88, -64, -8
	banim_frame_oam 0x0, 0x0, 0x8A, -48, -8
	banim_frame_oam 0x0, 0x0, 0x8B, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x8D, -56, -8
	banim_frame_oam 0x0, 0x0, 0x8F, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x12, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x90, -48, -8
	banim_frame_oam 0x0, 0x0, 0x92, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x0, 0x93, -24, 8
	banim_frame_oam 0x0, 0x4000, 0xB3, -40, -8
	banim_frame_oam 0x0, 0x0, 0xF3, -32, 8
	banim_frame_oam 0x0, 0x0, 0xF4, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x17, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x95, -24, 8
	banim_frame_oam 0x0, 0x0, 0x97, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -20, -24
	banim_frame_oam 0x8000, 0x4000, 0x17, -4, -24
	banim_frame_oam 0x4000, 0x0, 0x95, -20, 8
	banim_frame_oam 0x0, 0x0, 0x97, -4, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x98, -8, 8
	banim_frame_oam 0x8000, 0x0, 0xB9, 8, -8
	banim_frame_oam 0x0, 0x4000, 0xB7, -24, -8
	banim_frame_oam 0x0, 0x0, 0xF8, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF9, 8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x3C, -40, -16
	banim_frame_oam 0x0, 0x0, 0xBC, -48, 0
	banim_frame_oam 0x0, 0x0, 0xBD, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x1D, -56, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -40, -16
	banim_frame_oam 0x0, 0x0, 0x83, -48, 0
	banim_frame_oam 0x4000, 0x0, 0x81, -56, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -40, -16
	banim_frame_oam 0x0, 0x0, 0x87, -48, 0
	banim_frame_oam 0x4000, 0x0, 0x85, -56, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x1C, -64, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x8000, 0x1A, 0, -24
	banim_frame_oam 0x8000, 0x4000, 0x1C, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x9A, 0, 8
	banim_frame_oam 0x0, 0x0, 0x9C, 16, 8
	banim_frame_oam 0x8000, 0x0, 0xBA, -8, -8
	banim_frame_oam 0x0, 0x0, 0xFA, -8, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0x1D, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x9D, 8, 8
	banim_frame_oam 0x0, 0x0, 0xBD, 0, -8
	banim_frame_oam 0x0, 0x0, 0xDD, 0, 8
	banim_frame_oam 0x0, 0x0, 0xBE, 24, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_25_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, 8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 24, -24
	banim_frame_oam 0x4000, 0x0, 0x80, 8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 24, 8
	banim_frame_oam 0x0, 0x0, 0xA0, 0, -8
	banim_frame_oam 0x0, 0x0, 0xC0, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x5, 24, -16
	banim_frame_oam 0x0, 0x0, 0x83, 0, -8
	banim_frame_oam 0x0, 0x0, 0xA3, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_27_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x8, 24, -16
	banim_frame_oam 0x0, 0x0, 0x86, 0, 8
	banim_frame_oam 0x0, 0x0, 0x87, 16, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_28_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, 8, -24
	banim_frame_oam 0x8000, 0x4000, 0xB, 24, -24
	banim_frame_oam 0x4000, 0x0, 0x89, 8, 8
	banim_frame_oam 0x0, 0x0, 0x8B, 24, 8
	banim_frame_oam 0x0, 0x0, 0xA9, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, 8, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 24, -24
	banim_frame_oam 0x4000, 0x0, 0x8C, 8, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 24, 8
	banim_frame_oam 0x0, 0x0, 0xAC, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, 8, -24
	banim_frame_oam 0x8000, 0x4000, 0x11, 24, -24
	banim_frame_oam 0x4000, 0x0, 0x8F, 8, 8
	banim_frame_oam 0x0, 0x0, 0x91, 24, 8
	banim_frame_oam 0x0, 0x0, 0xAF, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x14, 24, -16
	banim_frame_oam 0x0, 0x4000, 0x92, -8, 0
	banim_frame_oam 0x0, 0x0, 0x94, 16, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x17, 24, -16
	banim_frame_oam 0x0, 0x4000, 0x95, -8, -8
	banim_frame_oam 0x0, 0x0, 0x97, 16, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_33_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, 8, -24
	banim_frame_oam 0x8000, 0x4000, 0x1A, 24, -24
	banim_frame_oam 0x4000, 0x0, 0x98, 8, 8
	banim_frame_oam 0x0, 0x0, 0x9A, 24, 8
	banim_frame_oam 0x8000, 0x0, 0xB8, 0, -8
	banim_frame_oam 0x0, 0x0, 0xB9, 8, -32
	banim_frame_end
banim_lorf_sw1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x8000, 0x1B, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, 24, -32
	banim_frame_oam 0x0, 0x4000, 0x9B, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x9D, 24, 0
	banim_frame_oam 0x0, 0x0, 0xDB, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xDC, 0, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_35_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x80, 8, 0
	banim_frame_oam 0x8000, 0x4000, 0x2, 24, -16
	banim_frame_oam 0x8000, 0x0, 0x82, 0, -8
	banim_frame_oam 0x0, 0x0, 0xC2, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC1, 24, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_36_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x5, 24, -16
	banim_frame_oam 0x8000, 0x0, 0x83, 0, -8
	banim_frame_oam 0x0, 0x0, 0xC3, 0, 8
	banim_frame_oam 0x0, 0x0, 0x84, 32, 0
	banim_frame_oam 0x0, 0x0, 0xA4, 16, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_37_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x8, 24, -16
	banim_frame_oam 0x8000, 0x0, 0x86, 0, 0
	banim_frame_oam 0x0, 0x0, 0x87, 32, 0
	banim_frame_oam 0x0, 0x0, 0xA7, 24, -24
	banim_frame_end
banim_lorf_sw1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0xB, 24, -16
	banim_frame_oam 0x0, 0x0, 0x89, 0, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_47_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x91, -8, 8
	banim_frame_oam 0x0, 0x0, 0x93, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x50, -16, -8
	banim_frame_oam 0x0, 0x0, 0x90, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB0, -24, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x4000, 0xB2, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xF2, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xD1, -8, -16
	banim_frame_oam 0x4000, 0x8000, 0xCD, -16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_49_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x95, 0, 8
	banim_frame_oam 0x8000, 0x4000, 0x34, -8, -16
	banim_frame_oam 0x0, 0x0, 0x14, -16, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x17, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x39, 8, -16
	banim_frame_oam 0x0, 0x0, 0x19, -16, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x1A, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x9A, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x3C, 8, -16
	banim_frame_oam 0x0, 0x0, 0x1C, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xB5, -8, -24
	banim_frame_oam 0x8000, 0x0, 0xB7, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xF5, -8, -8
	banim_frame_oam 0x0, 0x0, 0xF7, 8, -8
	banim_frame_oam 0x0, 0x4000, 0xB8, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xBA, 8, 0
	banim_frame_oam 0x0, 0x0, 0xF8, -16, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x3D, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x3F, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xBD, -8, 8
	banim_frame_oam 0x0, 0x0, 0xBF, 8, 8
	banim_frame_oam 0x0, 0x0, 0xDE, -16, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lorf_sw1_oam_frame_41_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xA0, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xA1, -24, 0
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_42_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -8, 8
	banim_frame_oam 0x0, 0x0, 0x85, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xA3, -16, -8
	banim_frame_oam 0x0, 0x0, 0xE3, -16, 8
	banim_frame_oam 0x0, 0x0, 0xA4, -24, 0
	banim_frame_oam 0x0, 0x0, 0xC4, 16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_43_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x8, 0, -40
	banim_frame_oam 0x0, 0x4000, 0x86, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x88, 0, -8
	banim_frame_oam 0x4000, 0x0, 0xC6, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC8, 0, 8
	banim_frame_oam 0x8000, 0x4000, 0x9, 8, -24
	banim_frame_oam 0x0, 0x0, 0x89, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xA9, -24, -16
	banim_frame_oam 0x0, 0x0, 0xE9, -24, 0
	banim_frame_oam 0x0, 0x0, 0xE7, 16, 0
	banim_frame_end
banim_lorf_sw1_oam_frame_44_r:
	banim_frame_oam 0x8000, 0x8000, 0xA, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x8A, -8, -8
	banim_frame_oam 0x4000, 0x0, 0xCA, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0xC, 8, -24
	banim_frame_oam 0x0, 0x0, 0x8C, 8, 8
	banim_frame_oam 0x0, 0x0, 0xAC, 16, 0
	banim_frame_oam 0x0, 0x0, 0xCC, -16, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_45_r:
	banim_frame_oam 0x8000, 0x8000, 0xD, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x8D, -8, -8
	banim_frame_oam 0x4000, 0x0, 0xCD, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0xF, 8, -24
	banim_frame_oam 0x0, 0x0, 0x8F, 8, 8
	banim_frame_oam 0x0, 0x0, 0xAF, 16, 0
	banim_frame_oam 0x0, 0x0, 0xCF, -16, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_46_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x90, -8, -8
	banim_frame_oam 0x4000, 0x0, 0xD0, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x12, 8, -24
	banim_frame_oam 0x0, 0x0, 0x92, 8, 8
	banim_frame_oam 0x0, 0x0, 0xB2, 16, 0
	banim_frame_oam 0x0, 0x0, 0xD2, -16, 8
	banim_frame_end
banim_lorf_sw1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x80, -64, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_lorf_sw1_script:
banim_lorf_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_0, 1, banim_lorf_sw1_oam_frame_1_r - banim_lorf_sw1_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 2, banim_lorf_sw1_oam_frame_2_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 3, banim_lorf_sw1_oam_frame_3_r - banim_lorf_sw1_oam_r
	banim_code_frame 10, banim_lorf_sw1_sheet_0, 4, banim_lorf_sw1_oam_frame_4_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_0, 5, banim_lorf_sw1_oam_frame_5_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_0, 6, banim_lorf_sw1_oam_frame_6_r - banim_lorf_sw1_oam_r
	banim_code_frame 5, banim_lorf_sw1_sheet_0, 7, banim_lorf_sw1_oam_frame_7_r - banim_lorf_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 8, banim_lorf_sw1_oam_frame_8_r - banim_lorf_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 19, banim_lorf_sw1_oam_frame_9_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 20, banim_lorf_sw1_oam_frame_10_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 21, banim_lorf_sw1_oam_frame_11_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 12, banim_lorf_sw1_oam_frame_12_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 13, banim_lorf_sw1_oam_frame_13_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 14, banim_lorf_sw1_oam_frame_14_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 15, banim_lorf_sw1_oam_frame_15_r - banim_lorf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 16, banim_lorf_sw1_oam_frame_16_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 17, banim_lorf_sw1_oam_frame_17_r - banim_lorf_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 18, banim_lorf_sw1_oam_frame_18_r - banim_lorf_sw1_oam_r
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_frame 10, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_frame 5, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 22, banim_lorf_sw1_oam_frame_20_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 56, banim_lorf_sw1_oam_frame_21_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 56, banim_lorf_sw1_oam_frame_21_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 23, banim_lorf_sw1_oam_frame_23_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 24, banim_lorf_sw1_oam_frame_24_r - banim_lorf_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 25, banim_lorf_sw1_oam_frame_25_r - banim_lorf_sw1_oam_r
	banim_code_frame 5, banim_lorf_sw1_sheet_2, 26, banim_lorf_sw1_oam_frame_26_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_2, 27, banim_lorf_sw1_oam_frame_27_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 28, banim_lorf_sw1_oam_frame_28_r - banim_lorf_sw1_oam_r
	banim_code_frame 10, banim_lorf_sw1_sheet_2, 29, banim_lorf_sw1_oam_frame_29_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 30, banim_lorf_sw1_oam_frame_30_r - banim_lorf_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 31, banim_lorf_sw1_oam_frame_31_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 32, banim_lorf_sw1_oam_frame_32_r - banim_lorf_sw1_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 2, banim_lorf_sw1_sheet_2, 33, banim_lorf_sw1_oam_frame_33_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 34, banim_lorf_sw1_oam_frame_34_r - banim_lorf_sw1_oam_r
	banim_code_frame 8, banim_lorf_sw1_sheet_3, 35, banim_lorf_sw1_oam_frame_35_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 36, banim_lorf_sw1_oam_frame_36_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 37, banim_lorf_sw1_oam_frame_37_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 38, banim_lorf_sw1_oam_frame_38_r - banim_lorf_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 8, banim_lorf_sw1_oam_frame_8_r - banim_lorf_sw1_oam_r
	banim_code_hit_critical_2
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 19, banim_lorf_sw1_oam_frame_9_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 20, banim_lorf_sw1_oam_frame_10_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 21, banim_lorf_sw1_oam_frame_11_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 12, banim_lorf_sw1_oam_frame_12_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 13, banim_lorf_sw1_oam_frame_13_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 14, banim_lorf_sw1_oam_frame_14_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 15, banim_lorf_sw1_oam_frame_15_r - banim_lorf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 16, banim_lorf_sw1_oam_frame_16_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 17, banim_lorf_sw1_oam_frame_17_r - banim_lorf_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 18, banim_lorf_sw1_oam_frame_18_r - banim_lorf_sw1_oam_r
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_frame 5, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_frame 10, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 2, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_2, 48, banim_lorf_sw1_oam_frame_39_r - banim_lorf_sw1_oam_r
	banim_code_frame 8, banim_lorf_sw1_sheet_3, 49, banim_lorf_sw1_oam_frame_40_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 49, banim_lorf_sw1_oam_frame_40_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 49, banim_lorf_sw1_oam_frame_40_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 49, banim_lorf_sw1_oam_frame_40_r - banim_lorf_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_hit_critical_2
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 22, banim_lorf_sw1_oam_frame_20_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 56, banim_lorf_sw1_oam_frame_21_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 56, banim_lorf_sw1_oam_frame_21_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 47, banim_lorf_sw1_oam_frame_22_r - banim_lorf_sw1_oam_r
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 46, banim_lorf_sw1_oam_frame_19_r - banim_lorf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorf_sw1_sheet_4, 50, banim_lorf_sw1_oam_frame_41_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 51, banim_lorf_sw1_oam_frame_42_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 52, banim_lorf_sw1_oam_frame_43_r - banim_lorf_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 53, banim_lorf_sw1_oam_frame_44_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 51, banim_lorf_sw1_oam_frame_42_r - banim_lorf_sw1_oam_r
	banim_code_frame 1, banim_lorf_sw1_sheet_4, 50, banim_lorf_sw1_oam_frame_41_r - banim_lorf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorf_sw1_sheet_4, 50, banim_lorf_sw1_oam_frame_41_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 51, banim_lorf_sw1_oam_frame_42_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 52, banim_lorf_sw1_oam_frame_43_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 53, banim_lorf_sw1_oam_frame_44_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 54, banim_lorf_sw1_oam_frame_45_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 55, banim_lorf_sw1_oam_frame_46_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 54, banim_lorf_sw1_oam_frame_45_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 55, banim_lorf_sw1_oam_frame_46_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 54, banim_lorf_sw1_oam_frame_45_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 55, banim_lorf_sw1_oam_frame_46_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 54, banim_lorf_sw1_oam_frame_45_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 55, banim_lorf_sw1_oam_frame_46_r - banim_lorf_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_lorf_sw1_sheet_4, 53, banim_lorf_sw1_oam_frame_44_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_lorf_sw1_sheet_4, 51, banim_lorf_sw1_oam_frame_42_r - banim_lorf_sw1_oam_r
	banim_code_frame 1, banim_lorf_sw1_sheet_4, 50, banim_lorf_sw1_oam_frame_41_r - banim_lorf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 39, banim_lorf_sw1_oam_frame_47_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 40, banim_lorf_sw1_oam_frame_48_r - banim_lorf_sw1_oam_r
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 41, banim_lorf_sw1_oam_frame_49_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 40, banim_lorf_sw1_oam_frame_48_r - banim_lorf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 39, banim_lorf_sw1_oam_frame_47_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 40, banim_lorf_sw1_oam_frame_48_r - banim_lorf_sw1_oam_r
	banim_code_frame 1, banim_lorf_sw1_sheet_3, 41, banim_lorf_sw1_oam_frame_49_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_3, 40, banim_lorf_sw1_oam_frame_48_r - banim_lorf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorf_sw1_mode_stand_close:
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorf_sw1_mode_stand:
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorf_sw1_mode_stand_range:
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorf_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_0, 1, banim_lorf_sw1_oam_frame_1_r - banim_lorf_sw1_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 2, banim_lorf_sw1_oam_frame_2_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 3, banim_lorf_sw1_oam_frame_3_r - banim_lorf_sw1_oam_r
	banim_code_frame 10, banim_lorf_sw1_sheet_0, 4, banim_lorf_sw1_oam_frame_4_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_0, 5, banim_lorf_sw1_oam_frame_5_r - banim_lorf_sw1_oam_r
	banim_code_frame 4, banim_lorf_sw1_sheet_0, 6, banim_lorf_sw1_oam_frame_6_r - banim_lorf_sw1_oam_r
	banim_code_frame 5, banim_lorf_sw1_sheet_0, 7, banim_lorf_sw1_oam_frame_7_r - banim_lorf_sw1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 8, banim_lorf_sw1_oam_frame_8_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_0, 9, banim_lorf_sw1_oam_frame_50_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 10, banim_lorf_sw1_oam_frame_51_r - banim_lorf_sw1_oam_r
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 11, banim_lorf_sw1_oam_frame_52_r - banim_lorf_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_lorf_sw1_sheet_1, 12, banim_lorf_sw1_oam_frame_12_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 13, banim_lorf_sw1_oam_frame_13_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 14, banim_lorf_sw1_oam_frame_14_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 15, banim_lorf_sw1_oam_frame_15_r - banim_lorf_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 16, banim_lorf_sw1_oam_frame_16_r - banim_lorf_sw1_oam_r
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 17, banim_lorf_sw1_oam_frame_17_r - banim_lorf_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_frame 2, banim_lorf_sw1_sheet_1, 18, banim_lorf_sw1_oam_frame_18_r - banim_lorf_sw1_oam_r
	banim_code_frame 1, banim_lorf_sw1_sheet_0, 0, banim_lorf_sw1_oam_frame_0_r - banim_lorf_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_lorf_sw1_mode_attack_close - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_attack_close_back - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_attack_close_critical - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_attack_close_critical_back - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_attack_range - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_attack_range_critical - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_dodge_close - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_dodge_range - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_stand_close - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_stand - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_stand_range - banim_lorf_sw1_script
	.word banim_lorf_sw1_mode_attack_miss - banim_lorf_sw1_script
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

