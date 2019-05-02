@ vim:ft=armv4
	.global banim_mcd_ar1_script
	.global banim_mcd_ar1_oam_r
	.global banim_mcd_ar1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB7
	.section .data.oam_l
banim_mcd_ar1_oam_l:
banim_mcd_ar1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x84, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x86, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -24, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x7, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0xB, -8, -40
	banim_frame_oam 0x4000, 0x9000, 0x87, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x8B, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xC7, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x6C, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xC, -24, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xD, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x11, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x8D, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x91, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x93, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0xCD, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0xCF, 8, -48
	banim_frame_oam 0x8000, 0x1000, 0xD0, -32, -32
	banim_frame_end
banim_mcd_ar1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x18, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x1A, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x94, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x98, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x9A, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xDA, 24, -24
	banim_frame_oam 0x8000, 0x1000, 0xD4, -40, -32
	banim_frame_oam 0x0, 0x5000, 0xD5, 0, -48
	banim_frame_oam 0x8000, 0x1000, 0xD7, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0xF8, -24, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x24, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x26, -32, -40
	banim_frame_oam 0x0, 0x5000, 0xA4, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0xA6, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -32, 8
	banim_frame_oam 0x8000, 0x9000, 0x2, -8, -48
	banim_frame_oam 0x8000, 0x9000, 0x82, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x0, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, -40, -32
	banim_frame_oam 0x4000, 0x1000, 0x5, -32, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -8, -48
	banim_frame_oam 0x8000, 0x9000, 0x87, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x9, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0xB, -32, -32
	banim_frame_oam 0x0, 0x5000, 0x89, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x8B, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xC9, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0xCA, 8, 0
	banim_frame_end
banim_mcd_ar1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x5000, 0x8C, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x4D, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0xCD, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xC, -40, -32
	banim_frame_oam 0x0, 0x1000, 0x2D, -40, -24
	banim_frame_oam 0x0, 0x9000, 0x4E, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xCE, -32, 0
	banim_frame_oam 0x0, 0x5000, 0xE, -16, -56
	banim_frame_oam 0x0, 0x1000, 0x2C, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x10, -8, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0x13, -24, -32
	banim_frame_oam 0x0, 0x5000, 0x17, -40, -32
	banim_frame_oam 0x4000, 0x5000, 0x53, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0x57, -40, -16
	banim_frame_oam 0x0, 0x1000, 0x52, 8, -16
	banim_frame_oam 0x0, 0x5000, 0x19, -16, -56
	banim_frame_oam 0x4000, 0x1000, 0x59, -8, -40
	banim_frame_oam 0x4000, 0x9000, 0xAC, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xB0, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xF0, -32, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x73, -32, -56
	banim_frame_oam 0x8000, 0x9000, 0x77, -48, -56
	banim_frame_oam 0x4000, 0x5000, 0xF3, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0xF7, -48, -24
	banim_frame_oam 0x4000, 0x5000, 0xF9, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xFD, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x7A, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x7E, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xBA, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xBE, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x5C, 0, -24
	banim_frame_end
banim_mcd_ar1_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -24, -64
	banim_frame_oam 0x8000, 0x5000, 0x2, -32, -64
	banim_frame_oam 0x0, 0x5000, 0x80, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x82, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0xC0, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xC2, -32, -16
	banim_frame_oam 0x8000, 0x9000, 0x3, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xE5, -32, -8
	banim_frame_oam 0x0, 0x5000, 0xA3, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA5, -32, 0
	banim_frame_end
banim_mcd_ar1_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xE5, -32, -8
	banim_frame_oam 0x0, 0x5000, 0xA3, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA5, -32, 0
	banim_frame_oam 0x8000, 0x9000, 0x6, -24, -64
	banim_frame_oam 0x8000, 0x5000, 0x8, -32, -64
	banim_frame_oam 0x0, 0x5000, 0x86, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x88, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0xC6, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xC8, -32, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xE5, -32, -8
	banim_frame_oam 0x0, 0x5000, 0xA3, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA5, -32, 0
	banim_frame_oam 0x8000, 0x9000, 0x9, -24, -64
	banim_frame_oam 0x0, 0x5000, 0x89, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xC9, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x6B, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0xB, -8, -56
	banim_frame_end
banim_mcd_ar1_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xE5, -32, -8
	banim_frame_oam 0x0, 0x5000, 0xA3, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA5, -32, 0
	banim_frame_oam 0x8000, 0x9000, 0xC, -24, -64
	banim_frame_oam 0x8000, 0x5000, 0xE, -32, -64
	banim_frame_oam 0x0, 0x5000, 0x8C, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x8E, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0xCC, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xCE, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xED, -8, -48
	banim_frame_end
banim_mcd_ar1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xE5, -32, -8
	banim_frame_oam 0x0, 0x5000, 0xA3, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA5, -32, 0
	banim_frame_oam 0x8000, 0x9000, 0xF, -24, -64
	banim_frame_oam 0x8000, 0x5000, 0x11, -32, -64
	banim_frame_oam 0x0, 0x5000, 0x8F, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x91, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0xCF, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xD1, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xF0, -8, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xE5, -32, -8
	banim_frame_oam 0x0, 0x5000, 0xA3, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA5, -32, 0
	banim_frame_oam 0x8000, 0x9000, 0x12, -24, -64
	banim_frame_oam 0x8000, 0x5000, 0x14, -32, -64
	banim_frame_oam 0x0, 0x5000, 0x92, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x94, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0xD2, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xD4, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xF3, -8, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0x17, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0x95, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x97, -16, -16
	banim_frame_oam 0x8000, 0x9000, 0x58, -32, -32
	banim_frame_oam 0x0, 0x5000, 0xD8, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x18, 8, 0
	banim_frame_oam 0x0, 0x1000, 0x38, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x19, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x39, -40, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0xB8, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0xF8, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x39, -40, 8
	banim_frame_oam 0x0, 0x9000, 0x1A, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x1E, -32, -48
	banim_frame_oam 0x4000, 0x5000, 0x9A, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x9E, -32, -16
	banim_frame_oam 0x0, 0x5000, 0xBA, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xBC, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xF5, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xF7, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x18, 8, 0
	banim_frame_oam 0x0, 0x1000, 0x19, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x38, 8, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -48
	banim_frame_oam 0x0, 0x5000, 0x80, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xC0, -8, 0
	banim_frame_oam 0x4000, 0x9000, 0x2, -40, -32
	banim_frame_oam 0x4000, 0x1000, 0x42, 8, -24
	banim_frame_oam 0x0, 0x9000, 0x1C, -40, -16
	banim_frame_oam 0x4000, 0x1000, 0x7A, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x9A, 8, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -8, -48
	banim_frame_oam 0x0, 0x5000, 0x86, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xC6, -8, 0
	banim_frame_oam 0x4000, 0x9000, 0x62, -40, -32
	banim_frame_oam 0x0, 0x9000, 0x1C, -40, -16
	banim_frame_oam 0x4000, 0x1000, 0x7A, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x9A, 8, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x1000, 0x7A, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x9A, 8, -16
	banim_frame_oam 0x8000, 0x9000, 0x8, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x88, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0xA, -40, -32
	banim_frame_oam 0x4000, 0x5000, 0x4A, -40, -16
	banim_frame_oam 0x4000, 0x9000, 0x3C, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0x7C, -40, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x12, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x8E, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x92, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xCE, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xD2, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x6D, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xCD, -32, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x13, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, -16, 0
	banim_frame_oam 0x8000, 0x9000, 0x17, -32, -24
	banim_frame_oam 0x8000, 0x5000, 0x19, -40, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x99, -40, 8
	banim_frame_oam 0x4000, 0x1000, 0xB7, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xD6, 16, -32
	banim_frame_oam 0x0, 0x5000, 0xD7, 8, -48
	banim_frame_end
banim_mcd_ar1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -24
	banim_frame_oam 0x8000, 0x5000, 0x6, -40, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -40, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -48, -24
	banim_frame_oam 0x0, 0x5000, 0xA5, 8, -48
	banim_frame_oam 0x8000, 0x1000, 0xC4, 16, -32
	banim_frame_end
banim_mcd_ar1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0xB, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x87, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x8B, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x4D, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xD, -40, -16
	banim_frame_oam 0x0, 0x5000, 0xC8, 8, -48
	banim_frame_end
banim_mcd_ar1_oam_frame_24_l:
	banim_frame_oam 0x4000, 0xD000, 0xE, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x8E, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0x92, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCE, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0xD2, -32, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x9000, 0x6A, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x6C, -32, -48
	banim_frame_oam 0x4000, 0x1000, 0xEA, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xEC, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x44, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x9000, 0xC6, -40, -64
	banim_frame_end
banim_mcd_ar1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x44, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x2D, -24, -64
	banim_frame_oam 0x0, 0x5000, 0xAD, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xED, -24, -16
	banim_frame_oam 0x0, 0x5000, 0xAF, -40, -40
	banim_frame_oam 0x8000, 0x1000, 0xB1, -48, -40
	banim_frame_oam 0x4000, 0x1000, 0xEF, -40, -24
	banim_frame_oam 0x0, 0x1000, 0xF1, -48, -24
	banim_frame_oam 0x0, 0x1000, 0xEC, -32, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_28_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x44, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x32, -24, -64
	banim_frame_oam 0x0, 0x5000, 0xB2, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xF2, -24, -16
	banim_frame_oam 0x8000, 0x9000, 0xF, -40, -56
	banim_frame_oam 0x8000, 0x5000, 0x11, -48, -56
	banim_frame_oam 0x4000, 0x1000, 0x8F, -40, -24
	banim_frame_oam 0x0, 0x1000, 0x91, -48, -24
	banim_frame_oam 0x0, 0x1000, 0xEC, -32, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_29_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x44, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x34, -24, -64
	banim_frame_oam 0x0, 0x5000, 0xB4, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xF4, -24, -16
	banim_frame_oam 0x8000, 0x9000, 0x96, -40, -40
	banim_frame_oam 0x8000, 0x1000, 0x56, -48, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x44, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x38, -24, -64
	banim_frame_oam 0x0, 0x5000, 0xB8, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xF8, -24, -16
	banim_frame_oam 0x8000, 0x9000, 0x1A, -40, -56
	banim_frame_oam 0x8000, 0x5000, 0x1C, -48, -56
	banim_frame_oam 0x4000, 0x1000, 0x9A, -40, -24
	banim_frame_oam 0x0, 0x1000, 0x9C, -48, -24
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x44, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x3D, -24, -64
	banim_frame_oam 0x8000, 0x5000, 0x3F, -32, -64
	banim_frame_oam 0x0, 0x5000, 0xBD, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0xBF, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0xFD, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xFF, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xDC, -40, -56
	banim_frame_end
banim_mcd_ar1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x84, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x86, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -24, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x9000, 0x7, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0xB, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0xD, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x87, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x8B, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x8D, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC7, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xCD, -24, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x12, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x8E, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x92, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xCE, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD2, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x53, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0xD3, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x13, 8, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
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
	.section .data.oam_r
banim_mcd_ar1_oam_r:
banim_mcd_ar1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x84, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x86, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xC4, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 16, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0xB, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x87, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x8B, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xC7, -32, 8
	banim_frame_oam 0x0, 0x0, 0xCB, 0, 8
	banim_frame_oam 0x8000, 0x4000, 0x6C, 8, -16
	banim_frame_oam 0x0, 0x0, 0xC, 16, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x11, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x8D, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x91, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x93, 16, 0
	banim_frame_oam 0x4000, 0x0, 0xCD, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xCF, -16, -48
	banim_frame_oam 0x8000, 0x0, 0xD0, 24, -32
	banim_frame_end
banim_mcd_ar1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x18, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x1A, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x94, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x98, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x9A, 24, 0
	banim_frame_oam 0x8000, 0x0, 0xDA, -32, -24
	banim_frame_oam 0x8000, 0x0, 0xD4, 32, -32
	banim_frame_oam 0x0, 0x4000, 0xD5, -16, -48
	banim_frame_oam 0x8000, 0x0, 0xD7, 0, -48
	banim_frame_oam 0x4000, 0x0, 0xF8, 8, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x24, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x26, 24, -40
	banim_frame_oam 0x0, 0x4000, 0xA4, 8, -8
	banim_frame_oam 0x8000, 0x0, 0xA6, 24, -8
	banim_frame_oam 0x4000, 0x0, 0xE4, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 24, 8
	banim_frame_oam 0x8000, 0x8000, 0x2, -8, -48
	banim_frame_oam 0x8000, 0x8000, 0x82, -8, -16
	banim_frame_oam 0x8000, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -24, 8
	banim_frame_oam 0x0, 0x0, 0x4, 32, -32
	banim_frame_oam 0x4000, 0x0, 0x5, 16, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -8, -48
	banim_frame_oam 0x8000, 0x8000, 0x87, -8, -16
	banim_frame_oam 0x8000, 0x8000, 0x9, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0xB, 24, -32
	banim_frame_oam 0x0, 0x4000, 0x89, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x8B, 24, 0
	banim_frame_oam 0x8000, 0x0, 0xC9, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xCA, -16, 0
	banim_frame_end
banim_mcd_ar1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x4000, 0x8C, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x4D, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xCD, -8, 0
	banim_frame_oam 0x0, 0x0, 0xC, 32, -32
	banim_frame_oam 0x0, 0x0, 0x2D, 32, -24
	banim_frame_oam 0x0, 0x8000, 0x4E, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0xCE, 0, 0
	banim_frame_oam 0x0, 0x4000, 0xE, 0, -56
	banim_frame_oam 0x0, 0x0, 0x2C, -8, -40
	banim_frame_oam 0x0, 0x0, 0x10, 0, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0x13, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x17, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0x53, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x57, 24, -16
	banim_frame_oam 0x0, 0x0, 0x52, -16, -16
	banim_frame_oam 0x0, 0x4000, 0x19, 0, -56
	banim_frame_oam 0x4000, 0x0, 0x59, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0xAC, -16, -8
	banim_frame_oam 0x0, 0x4000, 0xB0, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xEC, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xF0, 16, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x73, 0, -56
	banim_frame_oam 0x8000, 0x8000, 0x77, 32, -56
	banim_frame_oam 0x4000, 0x4000, 0xF3, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xF7, 32, -24
	banim_frame_oam 0x4000, 0x4000, 0xF9, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xFD, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x7A, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x7E, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xBA, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xBE, 16, 8
	banim_frame_oam 0x0, 0x0, 0x5C, -8, -24
	banim_frame_end
banim_mcd_ar1_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, 8, -64
	banim_frame_oam 0x8000, 0x4000, 0x2, 24, -64
	banim_frame_oam 0x0, 0x4000, 0x80, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x82, 24, -32
	banim_frame_oam 0x4000, 0x0, 0xC0, 8, -16
	banim_frame_oam 0x0, 0x0, 0xC2, 24, -16
	banim_frame_oam 0x8000, 0x8000, 0x3, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE5, 24, -8
	banim_frame_oam 0x0, 0x4000, 0xA3, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xA5, 24, 0
	banim_frame_end
banim_mcd_ar1_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE5, 24, -8
	banim_frame_oam 0x0, 0x4000, 0xA3, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xA5, 24, 0
	banim_frame_oam 0x8000, 0x8000, 0x6, 8, -64
	banim_frame_oam 0x8000, 0x4000, 0x8, 24, -64
	banim_frame_oam 0x0, 0x4000, 0x86, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x88, 24, -32
	banim_frame_oam 0x4000, 0x0, 0xC6, 8, -16
	banim_frame_oam 0x0, 0x0, 0xC8, 24, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE5, 24, -8
	banim_frame_oam 0x0, 0x4000, 0xA3, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xA5, 24, 0
	banim_frame_oam 0x8000, 0x8000, 0x9, 8, -64
	banim_frame_oam 0x0, 0x4000, 0x89, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xC9, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x6B, 24, -40
	banim_frame_oam 0x8000, 0x0, 0xB, 0, -56
	banim_frame_end
banim_mcd_ar1_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE5, 24, -8
	banim_frame_oam 0x0, 0x4000, 0xA3, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xA5, 24, 0
	banim_frame_oam 0x8000, 0x8000, 0xC, 8, -64
	banim_frame_oam 0x8000, 0x4000, 0xE, 24, -64
	banim_frame_oam 0x0, 0x4000, 0x8C, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x8E, 24, -32
	banim_frame_oam 0x4000, 0x0, 0xCC, 8, -16
	banim_frame_oam 0x0, 0x0, 0xCE, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xED, -8, -48
	banim_frame_end
banim_mcd_ar1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE5, 24, -8
	banim_frame_oam 0x0, 0x4000, 0xA3, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xA5, 24, 0
	banim_frame_oam 0x8000, 0x8000, 0xF, 8, -64
	banim_frame_oam 0x8000, 0x4000, 0x11, 24, -64
	banim_frame_oam 0x0, 0x4000, 0x8F, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x91, 24, -32
	banim_frame_oam 0x4000, 0x0, 0xCF, 8, -16
	banim_frame_oam 0x0, 0x0, 0xD1, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xF0, -8, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE5, 24, -8
	banim_frame_oam 0x0, 0x4000, 0xA3, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xA5, 24, 0
	banim_frame_oam 0x8000, 0x8000, 0x12, 8, -64
	banim_frame_oam 0x8000, 0x4000, 0x14, 24, -64
	banim_frame_oam 0x0, 0x4000, 0x92, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x94, 24, -32
	banim_frame_oam 0x4000, 0x0, 0xD2, 8, -16
	banim_frame_oam 0x0, 0x0, 0xD4, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xF3, -8, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x17, 8, -48
	banim_frame_oam 0x8000, 0x8000, 0x95, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x97, 8, -16
	banim_frame_oam 0x8000, 0x8000, 0x58, 16, -32
	banim_frame_oam 0x0, 0x4000, 0xD8, 16, 0
	banim_frame_oam 0x0, 0x0, 0x18, -16, 0
	banim_frame_oam 0x0, 0x0, 0x38, -16, 8
	banim_frame_oam 0x0, 0x0, 0x19, -16, -16
	banim_frame_oam 0x0, 0x0, 0x39, 32, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0xB8, 16, -8
	banim_frame_oam 0x4000, 0x0, 0xF8, 16, 8
	banim_frame_oam 0x0, 0x0, 0x39, 32, 8
	banim_frame_oam 0x0, 0x8000, 0x1A, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x1E, 24, -48
	banim_frame_oam 0x4000, 0x4000, 0x9A, -8, -16
	banim_frame_oam 0x0, 0x0, 0x9E, 24, -16
	banim_frame_oam 0x0, 0x4000, 0xBA, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xBC, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xF5, -8, 8
	banim_frame_oam 0x0, 0x0, 0xF7, 8, 8
	banim_frame_oam 0x0, 0x0, 0x18, -16, 0
	banim_frame_oam 0x0, 0x0, 0x19, -16, -16
	banim_frame_oam 0x0, 0x0, 0x38, -16, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -48
	banim_frame_oam 0x0, 0x4000, 0x80, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, -8, 0
	banim_frame_oam 0x4000, 0x8000, 0x2, 8, -32
	banim_frame_oam 0x4000, 0x0, 0x42, -24, -24
	banim_frame_oam 0x0, 0x8000, 0x1C, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x7A, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x9A, -16, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, -8, -48
	banim_frame_oam 0x0, 0x4000, 0x86, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xC6, -8, 0
	banim_frame_oam 0x4000, 0x8000, 0x62, 8, -32
	banim_frame_oam 0x0, 0x8000, 0x1C, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x7A, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x9A, -16, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x0, 0x7A, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x9A, -16, -16
	banim_frame_oam 0x8000, 0x8000, 0x8, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x88, -8, -8
	banim_frame_oam 0x4000, 0x8000, 0xA, 8, -32
	banim_frame_oam 0x4000, 0x4000, 0x4A, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0x3C, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x7C, 8, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x12, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x8E, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x92, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xCE, -16, 8
	banim_frame_oam 0x0, 0x0, 0xD2, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x6D, -24, -24
	banim_frame_oam 0x0, 0x0, 0xCD, 24, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -16, 0
	banim_frame_oam 0x8000, 0x8000, 0x17, 16, -24
	banim_frame_oam 0x8000, 0x4000, 0x19, 32, -24
	banim_frame_oam 0x4000, 0x0, 0x97, 16, 8
	banim_frame_oam 0x0, 0x0, 0x99, 32, 8
	banim_frame_oam 0x4000, 0x0, 0xB7, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xD6, -24, -32
	banim_frame_oam 0x0, 0x4000, 0xD7, -24, -48
	banim_frame_end
banim_mcd_ar1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -24
	banim_frame_oam 0x8000, 0x4000, 0x6, 32, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0x86, 32, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 40, -24
	banim_frame_oam 0x0, 0x4000, 0xA5, -24, -48
	banim_frame_oam 0x8000, 0x0, 0xC4, -24, -32
	banim_frame_end
banim_mcd_ar1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0xB, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x87, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x8B, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x4D, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xD, 32, -16
	banim_frame_oam 0x0, 0x4000, 0xC8, -24, -48
	banim_frame_end
banim_mcd_ar1_oam_frame_24_r:
	banim_frame_oam 0x4000, 0xC000, 0xE, -32, -40
	banim_frame_oam 0x4000, 0x8000, 0x8E, -32, -8
	banim_frame_oam 0x4000, 0x8000, 0x92, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xCE, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0xD2, 0, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x8000, 0x6A, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x6C, 24, -48
	banim_frame_oam 0x4000, 0x0, 0xEA, 8, -16
	banim_frame_oam 0x0, 0x0, 0xEC, 24, -16
	banim_frame_oam 0x4000, 0x8000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x44, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x8000, 0xC6, 8, -64
	banim_frame_end
banim_mcd_ar1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x44, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -24
	banim_frame_oam 0x8000, 0x8000, 0x2D, 8, -64
	banim_frame_oam 0x0, 0x4000, 0xAD, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xED, 8, -16
	banim_frame_oam 0x0, 0x4000, 0xAF, 24, -40
	banim_frame_oam 0x8000, 0x0, 0xB1, 40, -40
	banim_frame_oam 0x4000, 0x0, 0xEF, 24, -24
	banim_frame_oam 0x0, 0x0, 0xF1, 40, -24
	banim_frame_oam 0x0, 0x0, 0xEC, 24, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_28_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x44, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -24
	banim_frame_oam 0x8000, 0x8000, 0x32, 8, -64
	banim_frame_oam 0x0, 0x4000, 0xB2, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xF2, 8, -16
	banim_frame_oam 0x8000, 0x8000, 0xF, 24, -56
	banim_frame_oam 0x8000, 0x4000, 0x11, 40, -56
	banim_frame_oam 0x4000, 0x0, 0x8F, 24, -24
	banim_frame_oam 0x0, 0x0, 0x91, 40, -24
	banim_frame_oam 0x0, 0x0, 0xEC, 24, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_29_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x44, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -24
	banim_frame_oam 0x8000, 0x8000, 0x34, 8, -64
	banim_frame_oam 0x0, 0x4000, 0xB4, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xF4, 8, -16
	banim_frame_oam 0x8000, 0x8000, 0x96, 24, -40
	banim_frame_oam 0x8000, 0x0, 0x56, 40, -40
	banim_frame_end
banim_mcd_ar1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x44, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -24
	banim_frame_oam 0x8000, 0x8000, 0x38, 8, -64
	banim_frame_oam 0x0, 0x4000, 0xB8, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xF8, 8, -16
	banim_frame_oam 0x8000, 0x8000, 0x1A, 24, -56
	banim_frame_oam 0x8000, 0x4000, 0x1C, 40, -56
	banim_frame_oam 0x4000, 0x0, 0x9A, 24, -24
	banim_frame_oam 0x0, 0x0, 0x9C, 40, -24
	banim_frame_oam 0x0, 0x0, 0xF6, 24, -16
	banim_frame_end
banim_mcd_ar1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x44, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x2, 0, -24
	banim_frame_oam 0x8000, 0x8000, 0x3D, 8, -64
	banim_frame_oam 0x8000, 0x4000, 0x3F, 24, -64
	banim_frame_oam 0x0, 0x4000, 0xBD, 8, -32
	banim_frame_oam 0x8000, 0x0, 0xBF, 24, -32
	banim_frame_oam 0x4000, 0x0, 0xFD, 8, -16
	banim_frame_oam 0x0, 0x0, 0xFF, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xDC, 32, -56
	banim_frame_end
banim_mcd_ar1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x84, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x86, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xC4, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 16, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0xB, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0xD, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x87, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x8B, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x8D, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC7, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xCB, 0, 8
	banim_frame_oam 0x0, 0x0, 0xCD, 16, 8
	banim_frame_end
banim_mcd_ar1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x12, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8E, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x92, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCE, -24, 8
	banim_frame_oam 0x0, 0x0, 0xD2, 8, 8
	banim_frame_oam 0x8000, 0x8000, 0x53, 16, -24
	banim_frame_oam 0x4000, 0x0, 0xD3, 16, 8
	banim_frame_oam 0x0, 0x0, 0x13, -16, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
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
	.section .data.script
banim_mcd_ar1_script:
banim_mcd_ar1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_0, 1, banim_mcd_ar1_oam_frame_1_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_0, 2, banim_mcd_ar1_oam_frame_2_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_0, 3, banim_mcd_ar1_oam_frame_3_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mcd_ar1_sheet_1, 4, banim_mcd_ar1_oam_frame_4_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 5, banim_mcd_ar1_oam_frame_5_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 8, banim_mcd_ar1_sheet_1, 6, banim_mcd_ar1_oam_frame_6_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 7, banim_mcd_ar1_oam_frame_7_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_1, 8, banim_mcd_ar1_oam_frame_8_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 9, banim_mcd_ar1_oam_frame_9_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 10, banim_mcd_ar1_oam_frame_10_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 11, banim_mcd_ar1_oam_frame_11_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 12, banim_mcd_ar1_oam_frame_12_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_2, 13, banim_mcd_ar1_oam_frame_13_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 14, banim_mcd_ar1_oam_frame_14_r - banim_mcd_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 15, banim_mcd_ar1_oam_frame_15_r - banim_mcd_ar1_oam_r
	banim_code_frame 20, banim_mcd_ar1_sheet_2, 16, banim_mcd_ar1_oam_frame_16_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_3, 17, banim_mcd_ar1_oam_frame_17_r - banim_mcd_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mcd_ar1_sheet_3, 18, banim_mcd_ar1_oam_frame_18_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ar1_sheet_3, 19, banim_mcd_ar1_oam_frame_19_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_3, 20, banim_mcd_ar1_oam_frame_20_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_3, 21, banim_mcd_ar1_oam_frame_21_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_4, 22, banim_mcd_ar1_oam_frame_22_r - banim_mcd_ar1_oam_r
	banim_code_frame 4, banim_mcd_ar1_sheet_4, 23, banim_mcd_ar1_oam_frame_23_r - banim_mcd_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ar1_sheet_4, 24, banim_mcd_ar1_oam_frame_24_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ar1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_0, 1, banim_mcd_ar1_oam_frame_1_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_0, 2, banim_mcd_ar1_oam_frame_2_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_0, 3, banim_mcd_ar1_oam_frame_3_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mcd_ar1_sheet_1, 4, banim_mcd_ar1_oam_frame_4_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 5, banim_mcd_ar1_oam_frame_5_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 8, banim_mcd_ar1_sheet_1, 6, banim_mcd_ar1_oam_frame_6_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 7, banim_mcd_ar1_oam_frame_7_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_1, 8, banim_mcd_ar1_oam_frame_8_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 9, banim_mcd_ar1_oam_frame_9_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 10, banim_mcd_ar1_oam_frame_10_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 11, banim_mcd_ar1_oam_frame_11_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 12, banim_mcd_ar1_oam_frame_12_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_2, 13, banim_mcd_ar1_oam_frame_13_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 14, banim_mcd_ar1_oam_frame_14_r - banim_mcd_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 15, banim_mcd_ar1_oam_frame_15_r - banim_mcd_ar1_oam_r
	banim_code_frame 20, banim_mcd_ar1_sheet_2, 16, banim_mcd_ar1_oam_frame_16_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_3, 17, banim_mcd_ar1_oam_frame_17_r - banim_mcd_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mcd_ar1_sheet_3, 18, banim_mcd_ar1_oam_frame_18_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ar1_sheet_3, 19, banim_mcd_ar1_oam_frame_19_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_3, 20, banim_mcd_ar1_oam_frame_20_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_3, 21, banim_mcd_ar1_oam_frame_21_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_4, 22, banim_mcd_ar1_oam_frame_22_r - banim_mcd_ar1_oam_r
	banim_code_frame 4, banim_mcd_ar1_sheet_4, 23, banim_mcd_ar1_oam_frame_23_r - banim_mcd_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ar1_sheet_4, 24, banim_mcd_ar1_oam_frame_24_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ar1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_0, 1, banim_mcd_ar1_oam_frame_1_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_0, 2, banim_mcd_ar1_oam_frame_2_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_0, 3, banim_mcd_ar1_oam_frame_3_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mcd_ar1_sheet_1, 4, banim_mcd_ar1_oam_frame_4_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 5, banim_mcd_ar1_oam_frame_5_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 8, banim_mcd_ar1_sheet_1, 6, banim_mcd_ar1_oam_frame_6_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 7, banim_mcd_ar1_oam_frame_7_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_1, 8, banim_mcd_ar1_oam_frame_8_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 25, banim_mcd_ar1_oam_frame_26_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 26, banim_mcd_ar1_oam_frame_27_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 27, banim_mcd_ar1_oam_frame_28_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 25, banim_mcd_ar1_oam_frame_26_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 26, banim_mcd_ar1_oam_frame_27_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 27, banim_mcd_ar1_oam_frame_28_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 25, banim_mcd_ar1_oam_frame_26_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 28, banim_mcd_ar1_oam_frame_29_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 29, banim_mcd_ar1_oam_frame_30_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 30, banim_mcd_ar1_oam_frame_31_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 28, banim_mcd_ar1_oam_frame_29_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 29, banim_mcd_ar1_oam_frame_30_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 9, banim_mcd_ar1_oam_frame_9_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 10, banim_mcd_ar1_oam_frame_10_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 11, banim_mcd_ar1_oam_frame_11_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 12, banim_mcd_ar1_oam_frame_12_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_2, 13, banim_mcd_ar1_oam_frame_13_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 14, banim_mcd_ar1_oam_frame_14_r - banim_mcd_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 15, banim_mcd_ar1_oam_frame_15_r - banim_mcd_ar1_oam_r
	banim_code_frame 20, banim_mcd_ar1_sheet_2, 16, banim_mcd_ar1_oam_frame_16_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_3, 17, banim_mcd_ar1_oam_frame_17_r - banim_mcd_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mcd_ar1_sheet_3, 18, banim_mcd_ar1_oam_frame_18_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ar1_sheet_3, 19, banim_mcd_ar1_oam_frame_19_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_3, 20, banim_mcd_ar1_oam_frame_20_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_3, 21, banim_mcd_ar1_oam_frame_21_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_4, 22, banim_mcd_ar1_oam_frame_22_r - banim_mcd_ar1_oam_r
	banim_code_frame 4, banim_mcd_ar1_sheet_4, 23, banim_mcd_ar1_oam_frame_23_r - banim_mcd_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ar1_sheet_4, 24, banim_mcd_ar1_oam_frame_24_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ar1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_0, 1, banim_mcd_ar1_oam_frame_1_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_0, 2, banim_mcd_ar1_oam_frame_2_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_0, 3, banim_mcd_ar1_oam_frame_3_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mcd_ar1_sheet_1, 4, banim_mcd_ar1_oam_frame_4_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 5, banim_mcd_ar1_oam_frame_5_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 8, banim_mcd_ar1_sheet_1, 6, banim_mcd_ar1_oam_frame_6_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 7, banim_mcd_ar1_oam_frame_7_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_1, 8, banim_mcd_ar1_oam_frame_8_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 25, banim_mcd_ar1_oam_frame_26_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 26, banim_mcd_ar1_oam_frame_27_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 27, banim_mcd_ar1_oam_frame_28_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 25, banim_mcd_ar1_oam_frame_26_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 26, banim_mcd_ar1_oam_frame_27_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 27, banim_mcd_ar1_oam_frame_28_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 25, banim_mcd_ar1_oam_frame_26_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 28, banim_mcd_ar1_oam_frame_29_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 29, banim_mcd_ar1_oam_frame_30_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 30, banim_mcd_ar1_oam_frame_31_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 28, banim_mcd_ar1_oam_frame_29_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 29, banim_mcd_ar1_oam_frame_30_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 9, banim_mcd_ar1_oam_frame_9_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 10, banim_mcd_ar1_oam_frame_10_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 11, banim_mcd_ar1_oam_frame_11_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 12, banim_mcd_ar1_oam_frame_12_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_2, 13, banim_mcd_ar1_oam_frame_13_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 14, banim_mcd_ar1_oam_frame_14_r - banim_mcd_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 15, banim_mcd_ar1_oam_frame_15_r - banim_mcd_ar1_oam_r
	banim_code_frame 20, banim_mcd_ar1_sheet_2, 16, banim_mcd_ar1_oam_frame_16_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_3, 17, banim_mcd_ar1_oam_frame_17_r - banim_mcd_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mcd_ar1_sheet_3, 18, banim_mcd_ar1_oam_frame_18_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ar1_sheet_3, 19, banim_mcd_ar1_oam_frame_19_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_3, 20, banim_mcd_ar1_oam_frame_20_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_3, 21, banim_mcd_ar1_oam_frame_21_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_4, 22, banim_mcd_ar1_oam_frame_22_r - banim_mcd_ar1_oam_r
	banim_code_frame 4, banim_mcd_ar1_sheet_4, 23, banim_mcd_ar1_oam_frame_23_r - banim_mcd_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ar1_sheet_4, 24, banim_mcd_ar1_oam_frame_24_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ar1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_0, 1, banim_mcd_ar1_oam_frame_1_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_0, 2, banim_mcd_ar1_oam_frame_2_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_0, 3, banim_mcd_ar1_oam_frame_3_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mcd_ar1_sheet_1, 4, banim_mcd_ar1_oam_frame_4_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 5, banim_mcd_ar1_oam_frame_5_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 8, banim_mcd_ar1_sheet_1, 6, banim_mcd_ar1_oam_frame_6_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 7, banim_mcd_ar1_oam_frame_7_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_1, 8, banim_mcd_ar1_oam_frame_8_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 9, banim_mcd_ar1_oam_frame_9_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 10, banim_mcd_ar1_oam_frame_10_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 11, banim_mcd_ar1_oam_frame_11_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 12, banim_mcd_ar1_oam_frame_12_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_2, 13, banim_mcd_ar1_oam_frame_13_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 14, banim_mcd_ar1_oam_frame_14_r - banim_mcd_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 15, banim_mcd_ar1_oam_frame_15_r - banim_mcd_ar1_oam_r
	banim_code_frame 20, banim_mcd_ar1_sheet_2, 16, banim_mcd_ar1_oam_frame_16_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_3, 17, banim_mcd_ar1_oam_frame_17_r - banim_mcd_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mcd_ar1_sheet_3, 18, banim_mcd_ar1_oam_frame_18_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ar1_sheet_3, 19, banim_mcd_ar1_oam_frame_19_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_3, 20, banim_mcd_ar1_oam_frame_20_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_3, 21, banim_mcd_ar1_oam_frame_21_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_4, 22, banim_mcd_ar1_oam_frame_22_r - banim_mcd_ar1_oam_r
	banim_code_frame 4, banim_mcd_ar1_sheet_4, 23, banim_mcd_ar1_oam_frame_23_r - banim_mcd_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ar1_sheet_4, 24, banim_mcd_ar1_oam_frame_24_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ar1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_0, 1, banim_mcd_ar1_oam_frame_1_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_0, 2, banim_mcd_ar1_oam_frame_2_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_0, 3, banim_mcd_ar1_oam_frame_3_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mcd_ar1_sheet_1, 4, banim_mcd_ar1_oam_frame_4_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 5, banim_mcd_ar1_oam_frame_5_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 8, banim_mcd_ar1_sheet_1, 6, banim_mcd_ar1_oam_frame_6_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 7, banim_mcd_ar1_oam_frame_7_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_1, 8, banim_mcd_ar1_oam_frame_8_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 25, banim_mcd_ar1_oam_frame_26_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 26, banim_mcd_ar1_oam_frame_27_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 27, banim_mcd_ar1_oam_frame_28_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 25, banim_mcd_ar1_oam_frame_26_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 26, banim_mcd_ar1_oam_frame_27_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 27, banim_mcd_ar1_oam_frame_28_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 25, banim_mcd_ar1_oam_frame_26_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 28, banim_mcd_ar1_oam_frame_29_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 29, banim_mcd_ar1_oam_frame_30_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 30, banim_mcd_ar1_oam_frame_31_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 28, banim_mcd_ar1_oam_frame_29_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_6, 29, banim_mcd_ar1_oam_frame_30_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 9, banim_mcd_ar1_oam_frame_9_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 10, banim_mcd_ar1_oam_frame_10_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 11, banim_mcd_ar1_oam_frame_11_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 12, banim_mcd_ar1_oam_frame_12_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_2, 13, banim_mcd_ar1_oam_frame_13_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 14, banim_mcd_ar1_oam_frame_14_r - banim_mcd_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 15, banim_mcd_ar1_oam_frame_15_r - banim_mcd_ar1_oam_r
	banim_code_frame 20, banim_mcd_ar1_sheet_2, 16, banim_mcd_ar1_oam_frame_16_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_3, 17, banim_mcd_ar1_oam_frame_17_r - banim_mcd_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mcd_ar1_sheet_3, 18, banim_mcd_ar1_oam_frame_18_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ar1_sheet_3, 19, banim_mcd_ar1_oam_frame_19_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_3, 20, banim_mcd_ar1_oam_frame_20_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_3, 21, banim_mcd_ar1_oam_frame_21_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_4, 22, banim_mcd_ar1_oam_frame_22_r - banim_mcd_ar1_oam_r
	banim_code_frame 4, banim_mcd_ar1_sheet_4, 23, banim_mcd_ar1_oam_frame_23_r - banim_mcd_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ar1_sheet_4, 24, banim_mcd_ar1_oam_frame_24_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ar1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_mcd_ar1_sheet_5, 32, banim_mcd_ar1_oam_frame_32_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 33, banim_mcd_ar1_oam_frame_33_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_mcd_ar1_sheet_5, 32, banim_mcd_ar1_oam_frame_32_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ar1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_mcd_ar1_sheet_5, 32, banim_mcd_ar1_oam_frame_32_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 33, banim_mcd_ar1_oam_frame_33_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_mcd_ar1_sheet_5, 32, banim_mcd_ar1_oam_frame_32_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ar1_mode_stand_close:
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ar1_mode_stand:
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ar1_mode_stand_range:
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ar1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ar1_sheet_0, 0, banim_mcd_ar1_oam_frame_0_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_0, 1, banim_mcd_ar1_oam_frame_1_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_0, 2, banim_mcd_ar1_oam_frame_2_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_0, 3, banim_mcd_ar1_oam_frame_3_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_mcd_ar1_sheet_1, 4, banim_mcd_ar1_oam_frame_4_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 5, banim_mcd_ar1_oam_frame_5_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 8, banim_mcd_ar1_sheet_1, 6, banim_mcd_ar1_oam_frame_6_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_1, 7, banim_mcd_ar1_oam_frame_7_r - banim_mcd_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_mcd_ar1_sheet_1, 8, banim_mcd_ar1_oam_frame_8_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 9, banim_mcd_ar1_oam_frame_9_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 10, banim_mcd_ar1_oam_frame_10_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 11, banim_mcd_ar1_oam_frame_11_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_2, 12, banim_mcd_ar1_oam_frame_12_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_2, 13, banim_mcd_ar1_oam_frame_13_r - banim_mcd_ar1_oam_r
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 14, banim_mcd_ar1_oam_frame_14_r - banim_mcd_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 6, banim_mcd_ar1_sheet_2, 15, banim_mcd_ar1_oam_frame_15_r - banim_mcd_ar1_oam_r
	banim_code_frame 20, banim_mcd_ar1_sheet_2, 16, banim_mcd_ar1_oam_frame_16_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_3, 17, banim_mcd_ar1_oam_frame_17_r - banim_mcd_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_mcd_ar1_sheet_3, 18, banim_mcd_ar1_oam_frame_18_r - banim_mcd_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ar1_sheet_3, 19, banim_mcd_ar1_oam_frame_19_r - banim_mcd_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ar1_sheet_3, 20, banim_mcd_ar1_oam_frame_20_r - banim_mcd_ar1_oam_r
	banim_code_frame 3, banim_mcd_ar1_sheet_3, 21, banim_mcd_ar1_oam_frame_21_r - banim_mcd_ar1_oam_r
	banim_code_frame 2, banim_mcd_ar1_sheet_4, 22, banim_mcd_ar1_oam_frame_22_r - banim_mcd_ar1_oam_r
	banim_code_frame 4, banim_mcd_ar1_sheet_4, 23, banim_mcd_ar1_oam_frame_23_r - banim_mcd_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ar1_sheet_4, 24, banim_mcd_ar1_oam_frame_24_r - banim_mcd_ar1_oam_r
	banim_code_frame 1, banim_mcd_ar1_sheet_5, 31, banim_mcd_ar1_oam_frame_25_r - banim_mcd_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_mcd_ar1_mode_attack_close - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_attack_close_back - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_attack_close_critical - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_attack_close_critical_back - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_attack_range - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_attack_range_critical - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_dodge_close - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_dodge_range - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_stand_close - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_stand - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_stand_range - banim_mcd_ar1_script
	.word banim_mcd_ar1_mode_attack_miss - banim_mcd_ar1_script
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

