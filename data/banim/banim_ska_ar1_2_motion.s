@ vim:ft=armv4
	.global banim_ska_ar1_2_script
	.global banim_ska_ar1_2_oam_r
	.global banim_ska_ar1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xA9
	.section .data.oam_l
banim_ska_ar1_2_oam_l:
banim_ska_ar1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x1, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x3, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x81, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x83, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x80, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x20, 16, -16
	banim_frame_end
banim_ska_ar1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x5, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x7, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x85, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x87, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x24, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x64, 16, 0
	banim_frame_end
banim_ska_ar1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0xA, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x88, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x8A, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x2B, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xB, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x8C, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x2F, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xF, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0x12, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x90, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x92, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x33, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x13, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x95, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x94, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x37, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x17, -16, -8
	banim_frame_oam 0x8000, 0x5000, 0x14, 16, -24
	banim_frame_end
banim_ska_ar1_2_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0x1A, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x98, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x9A, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0x5B, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x9B, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x3B, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x1B, -16, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0x9C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x7C, -16, -8
	banim_frame_oam 0x8000, 0x9000, 0x1D, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x9D, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0x1C, 16, -24
	banim_frame_oam 0x8000, 0x5000, 0x3F, -8, -16
	banim_frame_end
banim_ska_ar1_2_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xA1, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xA0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -16, -8
	banim_frame_oam 0x4000, 0x9000, 0xA4, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xA3, 24, 0
	banim_frame_end
banim_ska_ar1_2_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x9000, 0xA9, -8, -16
	banim_frame_oam 0x4000, 0x5000, 0xE9, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xAD, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xA8, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xCD, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xC8, 24, 0
	banim_frame_oam 0x4000, 0x5000, 0xE5, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x5000, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAD, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xA8, 8, -24
	banim_frame_oam 0x0, 0x5000, 0xC9, 8, -8
	banim_frame_oam 0x0, 0x5000, 0xAE, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xED, -16, 0
	banim_frame_oam 0x4000, 0x5000, 0xA9, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xC8, 24, 0
	banim_frame_end
banim_ska_ar1_2_oam_frame_11_l:
	banim_frame_oam 0x0, 0x1000, 0xAD, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xA8, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0xA9, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xC9, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xC8, 24, 0
	banim_frame_oam 0x4000, 0x5000, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xB0, -8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0x1000, 0xAD, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xA8, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0xA9, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xC9, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xC8, 24, 0
	banim_frame_oam 0x4000, 0x5000, 0xE5, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xF0, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xEE, -8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0xAD, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xA8, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0xA9, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xC9, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xC8, 24, 0
	banim_frame_oam 0x4000, 0x5000, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xB2, -8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x5000, 0xE5, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0xB4, -8, -16
	banim_frame_oam 0x4000, 0x5000, 0xF4, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xF2, 0, -24
	banim_frame_end
banim_ska_ar1_2_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x9000, 0xB8, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0xF8, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0xBC, -16, 0
	banim_frame_end
banim_ska_ar1_2_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x1000, 0x60, -16, -16
	banim_frame_oam 0x8000, 0x9000, 0x21, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x23, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x0, 16, -24
	banim_frame_oam 0x0, 0x1000, 0x40, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0x1, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x3, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x8, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x86, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x88, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x9, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x49, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x89, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x4, 16, -24
	banim_frame_oam 0x0, 0x1000, 0x45, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0x64, 8, -32
	banim_frame_end
banim_ska_ar1_2_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x9000, 0xB, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0xD, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x8B, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x8D, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0xE, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x4E, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x8E, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA, 16, -24
	banim_frame_oam 0x0, 0x1000, 0x4A, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x6A, 24, -24
	banim_frame_end
banim_ska_ar1_2_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x69, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x10, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x12, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x90, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x92, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x6F, 24, -24
	banim_frame_oam 0x8000, 0x1000, 0xF, 16, -24
	banim_frame_oam 0x0, 0x1000, 0x4F, 16, -8
	banim_frame_oam 0x0, 0x1000, 0x6E, -16, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_22_l:
	banim_frame_oam 0x8000, 0x9000, 0x14, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x16, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x94, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x96, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x13, 16, -24
	banim_frame_end
banim_ska_ar1_2_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x17, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x1B, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x5F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x3F, -16, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x1E, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x9C, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x9E, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x5F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x7F, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xA0, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xE1, 16, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0xA6, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xE2, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -8, 8
	banim_frame_oam 0x4000, 0x9000, 0xA7, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x5F, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_26_l:
	banim_frame_oam 0x4000, 0x5000, 0xB0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xB4, -8, 8
	banim_frame_oam 0x4000, 0x9000, 0xAB, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xAF, -8, -16
	banim_frame_oam 0x4000, 0x5000, 0xEB, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xEF, -8, 0
	banim_frame_oam 0x4000, 0x5000, 0xE7, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x5F, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_27_l:
	banim_frame_oam 0x0, 0x5000, 0xB5, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0xB7, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xF5, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xF7, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD4, 16, -8
	banim_frame_oam 0x4000, 0x9000, 0xD0, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xF4, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x5F, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_28_l:
	banim_frame_oam 0x4000, 0x9000, 0xB8, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0xBC, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xF8, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xFC, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x5F, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xBE, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xDD, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xBD, -8, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x4, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -32, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x8, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x88, -32, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xC, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_30_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -8, -8
	banim_frame_oam 0x8000, 0x5000, 0x9, -16, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x85, 0, -8
	banim_frame_oam 0x8000, 0x9000, 0x89, -16, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_ska_ar1_2_oam_r:
banim_ska_ar1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x1, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x3, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x83, 0, 8
	banim_frame_oam 0x0, 0x0, 0x80, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x20, -24, -16
	banim_frame_end
banim_ska_ar1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x7, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x87, 0, 8
	banim_frame_oam 0x0, 0x0, 0x84, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x24, -24, -16
	banim_frame_oam 0x0, 0x0, 0x64, -24, 0
	banim_frame_end
banim_ska_ar1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0xA, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x88, -24, 8
	banim_frame_oam 0x0, 0x0, 0x8A, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x2B, 0, -16
	banim_frame_oam 0x0, 0x0, 0xB, 8, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x8C, -24, 8
	banim_frame_oam 0x0, 0x0, 0x8E, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x2F, 0, -16
	banim_frame_oam 0x0, 0x0, 0xF, 8, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x12, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x90, -24, 8
	banim_frame_oam 0x0, 0x0, 0x92, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x33, 0, -16
	banim_frame_oam 0x0, 0x0, 0x13, 8, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x95, -16, 8
	banim_frame_oam 0x0, 0x0, 0x94, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x37, 0, -16
	banim_frame_oam 0x0, 0x0, 0x17, 8, -8
	banim_frame_oam 0x8000, 0x4000, 0x14, -24, -24
	banim_frame_end
banim_ska_ar1_2_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x1A, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x98, -24, 8
	banim_frame_oam 0x0, 0x0, 0x9A, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x5B, 0, -8
	banim_frame_oam 0x0, 0x0, 0x9B, 0, 8
	banim_frame_oam 0x0, 0x0, 0x3B, 8, 8
	banim_frame_oam 0x0, 0x0, 0x1B, 8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0x9C, 8, 8
	banim_frame_oam 0x0, 0x0, 0x7C, 8, -8
	banim_frame_oam 0x8000, 0x8000, 0x1D, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x9D, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x1C, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x3F, 0, -16
	banim_frame_end
banim_ska_ar1_2_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -24, -16
	banim_frame_oam 0x4000, 0x0, 0xA1, -16, -24
	banim_frame_oam 0x0, 0x0, 0xA0, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 8, -8
	banim_frame_oam 0x4000, 0x8000, 0xA4, -24, 0
	banim_frame_oam 0x0, 0x0, 0xA3, -32, 0
	banim_frame_end
banim_ska_ar1_2_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x8000, 0xA9, -24, -16
	banim_frame_oam 0x4000, 0x4000, 0xE9, -24, 0
	banim_frame_oam 0x0, 0x0, 0xAD, -8, -24
	banim_frame_oam 0x0, 0x0, 0xA8, -16, -24
	banim_frame_oam 0x0, 0x0, 0xCD, 8, -8
	banim_frame_oam 0x0, 0x0, 0xC8, -32, 0
	banim_frame_oam 0x4000, 0x4000, 0xE5, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x4000, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xAD, -8, -24
	banim_frame_oam 0x0, 0x0, 0xA8, -16, -24
	banim_frame_oam 0x0, 0x4000, 0xC9, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xAE, -8, -8
	banim_frame_oam 0x0, 0x0, 0xED, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0xA9, -24, -16
	banim_frame_oam 0x0, 0x0, 0xC8, -32, 0
	banim_frame_end
banim_ska_ar1_2_oam_frame_11_r:
	banim_frame_oam 0x0, 0x0, 0xAD, -8, -24
	banim_frame_oam 0x0, 0x0, 0xA8, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xA9, -24, -16
	banim_frame_oam 0x0, 0x4000, 0xC9, -24, -8
	banim_frame_oam 0x0, 0x0, 0xC8, -32, 0
	banim_frame_oam 0x4000, 0x4000, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xB0, -8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0x0, 0xAD, -8, -24
	banim_frame_oam 0x0, 0x0, 0xA8, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xA9, -24, -16
	banim_frame_oam 0x0, 0x4000, 0xC9, -24, -8
	banim_frame_oam 0x0, 0x0, 0xC8, -32, 0
	banim_frame_oam 0x4000, 0x4000, 0xE5, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xF0, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xEE, -8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0xAD, -8, -24
	banim_frame_oam 0x0, 0x0, 0xA8, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xA9, -24, -16
	banim_frame_oam 0x0, 0x4000, 0xC9, -24, -8
	banim_frame_oam 0x0, 0x0, 0xC8, -32, 0
	banim_frame_oam 0x4000, 0x4000, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xB2, -8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x4000, 0xE5, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0xB4, -24, -16
	banim_frame_oam 0x4000, 0x4000, 0xF4, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xF2, -16, -24
	banim_frame_end
banim_ska_ar1_2_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x8000, 0xB8, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0xF8, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0xBC, -16, 0
	banim_frame_end
banim_ska_ar1_2_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x0, 0x60, 8, -16
	banim_frame_oam 0x8000, 0x8000, 0x21, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x23, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x1, -16, -24
	banim_frame_oam 0x0, 0x0, 0x3, 8, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x8, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x86, -16, 8
	banim_frame_oam 0x0, 0x0, 0x88, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x9, 8, -24
	banim_frame_oam 0x0, 0x0, 0x49, 8, -8
	banim_frame_oam 0x0, 0x0, 0x89, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x4, -32, -24
	banim_frame_oam 0x0, 0x0, 0x45, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x64, -24, -32
	banim_frame_end
banim_ska_ar1_2_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x8000, 0xB, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xD, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x8B, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8D, 0, 8
	banim_frame_oam 0x8000, 0x0, 0xE, 8, -24
	banim_frame_oam 0x0, 0x0, 0x4E, 8, -8
	banim_frame_oam 0x0, 0x0, 0x8E, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xA, -24, -24
	banim_frame_oam 0x0, 0x0, 0x4A, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x6A, -32, -24
	banim_frame_end
banim_ska_ar1_2_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x69, 8, 8
	banim_frame_oam 0x8000, 0x8000, 0x10, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x12, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x90, -16, 8
	banim_frame_oam 0x0, 0x0, 0x92, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x6F, -32, -24
	banim_frame_oam 0x8000, 0x0, 0xF, -24, -24
	banim_frame_oam 0x0, 0x0, 0x4F, -24, -8
	banim_frame_oam 0x0, 0x0, 0x6E, 8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_22_r:
	banim_frame_oam 0x8000, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x16, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x96, 0, 8
	banim_frame_oam 0x0, 0x0, 0x93, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x13, -24, -24
	banim_frame_end
banim_ska_ar1_2_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -32, -24
	banim_frame_oam 0x8000, 0x4000, 0x1B, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -32, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 0, 8
	banim_frame_oam 0x0, 0x0, 0x5F, 8, 8
	banim_frame_oam 0x0, 0x0, 0x3F, 8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1E, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x9C, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9E, 0, 8
	banim_frame_oam 0x0, 0x0, 0x5F, 8, 8
	banim_frame_oam 0x0, 0x0, 0x7F, 8, 0
	banim_frame_oam 0x0, 0x4000, 0xA0, -32, -24
	banim_frame_oam 0x0, 0x0, 0xE1, -24, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, -32, -8
	banim_frame_oam 0x8000, 0x0, 0xA6, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xE2, -32, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 0, 8
	banim_frame_oam 0x4000, 0x8000, 0xA7, -24, -24
	banim_frame_oam 0x0, 0x0, 0x5F, 8, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_26_r:
	banim_frame_oam 0x4000, 0x4000, 0xB0, -32, 8
	banim_frame_oam 0x0, 0x0, 0xB4, 0, 8
	banim_frame_oam 0x4000, 0x8000, 0xAB, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xAF, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xEB, -32, 0
	banim_frame_oam 0x0, 0x0, 0xEF, 0, 0
	banim_frame_oam 0x4000, 0x4000, 0xE7, -32, -24
	banim_frame_oam 0x0, 0x0, 0x5F, 8, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_27_r:
	banim_frame_oam 0x0, 0x4000, 0xB5, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xB7, 0, -8
	banim_frame_oam 0x4000, 0x0, 0xF5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF7, 0, 8
	banim_frame_oam 0x0, 0x0, 0xD4, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0xD0, -32, -24
	banim_frame_oam 0x0, 0x0, 0xF4, 0, -16
	banim_frame_oam 0x0, 0x0, 0x5F, 8, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_28_r:
	banim_frame_oam 0x4000, 0x8000, 0xB8, -32, -8
	banim_frame_oam 0x8000, 0x0, 0xBC, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xF8, -32, 8
	banim_frame_oam 0x0, 0x0, 0xFC, 0, 8
	banim_frame_oam 0x0, 0x0, 0x5F, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xBE, -16, -24
	banim_frame_oam 0x0, 0x0, 0xDD, -24, -16
	banim_frame_oam 0x0, 0x0, 0xBD, 0, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x4, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, 0, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x8, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0x88, 0, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xC, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -16, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -24, 8
	banim_frame_oam 0x0, 0x0, 0x84, 8, 8
	banim_frame_end
banim_ska_ar1_2_oam_frame_30_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -24, -8
	banim_frame_oam 0x8000, 0x4000, 0x9, 8, -8
	banim_frame_end
banim_ska_ar1_2_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x85, -32, -8
	banim_frame_oam 0x8000, 0x8000, 0x89, 0, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_ska_ar1_2_script:
banim_ska_ar1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_frame 6, banim_ska_ar1_sheet_0, 1, banim_ska_ar1_2_oam_frame_1_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 2, banim_ska_ar1_2_oam_frame_2_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 4, banim_ska_ar1_2_oam_frame_4_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 5, banim_ska_ar1_2_oam_frame_5_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 6, banim_ska_ar1_2_oam_frame_6_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 7, banim_ska_ar1_2_oam_frame_7_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 8, banim_ska_ar1_2_oam_frame_8_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 9, banim_ska_ar1_2_oam_frame_9_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 10, banim_ska_ar1_2_oam_frame_10_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 11, banim_ska_ar1_2_oam_frame_11_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 12, banim_ska_ar1_2_oam_frame_12_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 13, banim_ska_ar1_2_oam_frame_13_r - banim_ska_ar1_2_oam_r
	banim_code_frame 3, banim_ska_ar1_sheet_0, 14, banim_ska_ar1_2_oam_frame_14_r - banim_ska_ar1_2_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_ska_ar1_sheet_0, 15, banim_ska_ar1_2_oam_frame_15_r - banim_ska_ar1_2_oam_r
	banim_code_frame 14, banim_ska_ar1_sheet_1, 16, banim_ska_ar1_2_oam_frame_16_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 17, banim_ska_ar1_2_oam_frame_17_r - banim_ska_ar1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 8, banim_ska_ar1_sheet_1, 18, banim_ska_ar1_2_oam_frame_18_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_ska_ar1_sheet_1, 19, banim_ska_ar1_2_oam_frame_19_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_ska_ar1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 6, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 3, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 14, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 8, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_ska_ar1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_frame 6, banim_ska_ar1_sheet_0, 1, banim_ska_ar1_2_oam_frame_1_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 2, banim_ska_ar1_2_oam_frame_2_r - banim_ska_ar1_2_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 4, banim_ska_ar1_2_oam_frame_4_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 5, banim_ska_ar1_2_oam_frame_5_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 6, banim_ska_ar1_2_oam_frame_6_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 7, banim_ska_ar1_2_oam_frame_7_r - banim_ska_ar1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_ska_ar1_sheet_0, 8, banim_ska_ar1_2_oam_frame_8_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 25, banim_ska_ar1_2_oam_frame_23_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 26, banim_ska_ar1_2_oam_frame_24_r - banim_ska_ar1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_ska_ar1_sheet_1, 27, banim_ska_ar1_2_oam_frame_25_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 28, banim_ska_ar1_2_oam_frame_26_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 29, banim_ska_ar1_2_oam_frame_27_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 30, banim_ska_ar1_2_oam_frame_28_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 13, banim_ska_ar1_2_oam_frame_13_r - banim_ska_ar1_2_oam_r
	banim_code_frame 3, banim_ska_ar1_sheet_0, 14, banim_ska_ar1_2_oam_frame_14_r - banim_ska_ar1_2_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_ska_ar1_sheet_0, 15, banim_ska_ar1_2_oam_frame_15_r - banim_ska_ar1_2_oam_r
	banim_code_frame 14, banim_ska_ar1_sheet_1, 16, banim_ska_ar1_2_oam_frame_16_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 17, banim_ska_ar1_2_oam_frame_17_r - banim_ska_ar1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 8, banim_ska_ar1_sheet_1, 18, banim_ska_ar1_2_oam_frame_18_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_ska_ar1_sheet_1, 19, banim_ska_ar1_2_oam_frame_19_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_ska_ar1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 6, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 8, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 8, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 8, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 3, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_frame 14, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 8, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_ska_ar1_sheet_1, 21, banim_ska_ar1_2_oam_frame_21_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_0, 20, banim_ska_ar1_2_oam_frame_20_r - banim_ska_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_ska_ar1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_frame 6, banim_ska_ar1_sheet_0, 1, banim_ska_ar1_2_oam_frame_1_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 2, banim_ska_ar1_2_oam_frame_2_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 4, banim_ska_ar1_2_oam_frame_4_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 5, banim_ska_ar1_2_oam_frame_5_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 6, banim_ska_ar1_2_oam_frame_6_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 7, banim_ska_ar1_2_oam_frame_7_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 8, banim_ska_ar1_2_oam_frame_8_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 9, banim_ska_ar1_2_oam_frame_9_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 10, banim_ska_ar1_2_oam_frame_10_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 11, banim_ska_ar1_2_oam_frame_11_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 12, banim_ska_ar1_2_oam_frame_12_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 13, banim_ska_ar1_2_oam_frame_13_r - banim_ska_ar1_2_oam_r
	banim_code_frame 3, banim_ska_ar1_sheet_0, 14, banim_ska_ar1_2_oam_frame_14_r - banim_ska_ar1_2_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_ska_ar1_sheet_0, 15, banim_ska_ar1_2_oam_frame_15_r - banim_ska_ar1_2_oam_r
	banim_code_frame 14, banim_ska_ar1_sheet_1, 16, banim_ska_ar1_2_oam_frame_16_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 17, banim_ska_ar1_2_oam_frame_17_r - banim_ska_ar1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 8, banim_ska_ar1_sheet_1, 18, banim_ska_ar1_2_oam_frame_18_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_ska_ar1_sheet_1, 19, banim_ska_ar1_2_oam_frame_19_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_ska_ar1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_frame 6, banim_ska_ar1_sheet_0, 1, banim_ska_ar1_2_oam_frame_1_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 2, banim_ska_ar1_2_oam_frame_2_r - banim_ska_ar1_2_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_1, 24, banim_ska_ar1_2_oam_frame_22_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 4, banim_ska_ar1_2_oam_frame_4_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 5, banim_ska_ar1_2_oam_frame_5_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 6, banim_ska_ar1_2_oam_frame_6_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 7, banim_ska_ar1_2_oam_frame_7_r - banim_ska_ar1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_ska_ar1_sheet_0, 8, banim_ska_ar1_2_oam_frame_8_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 25, banim_ska_ar1_2_oam_frame_23_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 26, banim_ska_ar1_2_oam_frame_24_r - banim_ska_ar1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_ska_ar1_sheet_1, 27, banim_ska_ar1_2_oam_frame_25_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 28, banim_ska_ar1_2_oam_frame_26_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 29, banim_ska_ar1_2_oam_frame_27_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 30, banim_ska_ar1_2_oam_frame_28_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 13, banim_ska_ar1_2_oam_frame_13_r - banim_ska_ar1_2_oam_r
	banim_code_frame 3, banim_ska_ar1_sheet_0, 14, banim_ska_ar1_2_oam_frame_14_r - banim_ska_ar1_2_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_ska_ar1_sheet_0, 15, banim_ska_ar1_2_oam_frame_15_r - banim_ska_ar1_2_oam_r
	banim_code_frame 14, banim_ska_ar1_sheet_1, 16, banim_ska_ar1_2_oam_frame_16_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 17, banim_ska_ar1_2_oam_frame_17_r - banim_ska_ar1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 8, banim_ska_ar1_sheet_1, 18, banim_ska_ar1_2_oam_frame_18_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_ska_ar1_sheet_1, 19, banim_ska_ar1_2_oam_frame_19_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_ska_ar1_2_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_ska_ar1_sheet_2, 35, banim_ska_ar1_2_oam_frame_29_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_2, 36, banim_ska_ar1_2_oam_frame_30_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_2, 37, banim_ska_ar1_2_oam_frame_31_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_ska_ar1_sheet_2, 36, banim_ska_ar1_2_oam_frame_30_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_2, 35, banim_ska_ar1_2_oam_frame_29_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_ska_ar1_2_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_ska_ar1_sheet_2, 35, banim_ska_ar1_2_oam_frame_29_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_2, 36, banim_ska_ar1_2_oam_frame_30_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_2, 37, banim_ska_ar1_2_oam_frame_31_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_ska_ar1_sheet_2, 36, banim_ska_ar1_2_oam_frame_30_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_2, 35, banim_ska_ar1_2_oam_frame_29_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_ska_ar1_2_mode_stand_close:
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_ska_ar1_2_mode_stand:
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_ska_ar1_2_mode_stand_range:
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_ska_ar1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_frame 6, banim_ska_ar1_sheet_0, 1, banim_ska_ar1_2_oam_frame_1_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 2, banim_ska_ar1_2_oam_frame_2_r - banim_ska_ar1_2_oam_r
	banim_code_frame 8, banim_ska_ar1_sheet_0, 3, banim_ska_ar1_2_oam_frame_3_r - banim_ska_ar1_2_oam_r
	banim_code_frame 4, banim_ska_ar1_sheet_0, 4, banim_ska_ar1_2_oam_frame_4_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 5, banim_ska_ar1_2_oam_frame_5_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 6, banim_ska_ar1_2_oam_frame_6_r - banim_ska_ar1_2_oam_r
	banim_code_frame 5, banim_ska_ar1_sheet_0, 7, banim_ska_ar1_2_oam_frame_7_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 8, banim_ska_ar1_2_oam_frame_8_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 9, banim_ska_ar1_2_oam_frame_9_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 10, banim_ska_ar1_2_oam_frame_10_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 11, banim_ska_ar1_2_oam_frame_11_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 12, banim_ska_ar1_2_oam_frame_12_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_0, 13, banim_ska_ar1_2_oam_frame_13_r - banim_ska_ar1_2_oam_r
	banim_code_frame 3, banim_ska_ar1_sheet_0, 14, banim_ska_ar1_2_oam_frame_14_r - banim_ska_ar1_2_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_ska_ar1_sheet_0, 15, banim_ska_ar1_2_oam_frame_15_r - banim_ska_ar1_2_oam_r
	banim_code_frame 14, banim_ska_ar1_sheet_1, 16, banim_ska_ar1_2_oam_frame_16_r - banim_ska_ar1_2_oam_r
	banim_code_frame 2, banim_ska_ar1_sheet_1, 17, banim_ska_ar1_2_oam_frame_17_r - banim_ska_ar1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 8, banim_ska_ar1_sheet_1, 18, banim_ska_ar1_2_oam_frame_18_r - banim_ska_ar1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_ska_ar1_sheet_1, 19, banim_ska_ar1_2_oam_frame_19_r - banim_ska_ar1_2_oam_r
	banim_code_frame 1, banim_ska_ar1_sheet_0, 0, banim_ska_ar1_2_oam_frame_0_r - banim_ska_ar1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_ska_ar1_2_mode_attack_close - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_attack_close_back - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_attack_close_critical - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_attack_close_critical_back - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_attack_range - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_attack_range_critical - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_dodge_close - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_dodge_range - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_stand_close - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_stand - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_stand_range - banim_ska_ar1_2_script
	.word banim_ska_ar1_2_mode_attack_miss - banim_ska_ar1_2_script
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

