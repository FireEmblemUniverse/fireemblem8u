@ vim:ft=armv4
	.global banim_danf_da1_script
	.global banim_danf_da1_oam_r
	.global banim_danf_da1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x90
	.section .data.oam_l
banim_danf_da1_oam_l:
banim_danf_da1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x1D, -8, -24
	banim_frame_end
banim_danf_da1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x8, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x9, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x49, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x69, -8, -24
	banim_frame_end
banim_danf_da1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x4F, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x2F, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x6F, -8, -24
	banim_frame_end
banim_danf_da1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x14, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x3D, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x3F, -8, -24
	banim_frame_end
banim_danf_da1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x5D, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xDA, 16, -16
	banim_frame_end
banim_danf_da1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x7D, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xDB, 16, -16
	banim_frame_end
banim_danf_da1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x8C, -8, -24
	banim_frame_end
banim_danf_da1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x84, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xAC, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xAE, -24, -16
	banim_frame_end
banim_danf_da1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x88, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xCC, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xCE, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xCF, -24, -16
	banim_frame_end
banim_danf_da1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x90, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0xEC, -16, -24
	banim_frame_end
banim_danf_da1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x95, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x99, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x9A, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x9E, -24, -24
	banim_frame_end
banim_danf_da1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF, -32, -8
	banim_frame_oam 0x0, 0x1000, 0x8F, -32, 0
	banim_frame_end
banim_danf_da1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x14, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x90, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x94, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x6F, -32, -8
	banim_frame_end
banim_danf_da1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x19, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x99, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x1A, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x1E, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x9B, -16, -24
	banim_frame_end
banim_danf_da1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xA4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xA5, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xA9, -24, 0
	banim_frame_end
banim_danf_da1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0xAA, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xAE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xEA, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xEE, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xB0, -24, 0
	banim_frame_end
banim_danf_da1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x9000, 0xB5, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0xB9, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xF5, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xF9, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 0
	banim_frame_oam 0x4000, 0x5000, 0xF0, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x9000, 0x41, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x40, 8, -32
	banim_frame_end
banim_danf_da1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -24, 8
	banim_frame_oam 0x0, 0x5000, 0x9, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x4A, 8, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xB, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xF, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8B, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8F, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x69, -16, -32
	banim_frame_end
banim_danf_da1_oam_frame_22_l:
	banim_frame_oam 0x4000, 0x9000, 0x10, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0x14, -24, -24
	banim_frame_oam 0x4000, 0x9000, 0x51, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x91, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x19, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x99, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_24_l:
	banim_frame_oam 0x4000, 0x9000, 0x1A, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x1E, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x5A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x5E, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x7A, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x7E, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x9F, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x7F, -24, -16
	banim_frame_end
banim_danf_da1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xA4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xA6, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xAA, -24, 0
	banim_frame_end
banim_danf_da1_oam_frame_26_l:
	banim_frame_oam 0x4000, 0x9000, 0xAB, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xAF, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xEB, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xE6, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xB1, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x9000, 0xBA, -16, -24
	banim_frame_oam 0x0, 0x5000, 0xBE, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xB5, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xB9, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xD6, -24, 0
	banim_frame_end
banim_danf_da1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -32, 8
	banim_frame_end
banim_danf_da1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x9, -24, -16
	banim_frame_end
banim_danf_da1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xF, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8B, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8F, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x15, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x95, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -16, 8
	banim_frame_end
banim_danf_da1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x9000, 0x1B, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x9B, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x3F, 16, -16
	banim_frame_end
banim_danf_da1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x81, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x83, -16, 8
	banim_frame_end
banim_danf_da1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x8B, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8D, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8A, 16, -16
	banim_frame_end
banim_danf_da1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x90, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x92, -16, 8
	banim_frame_end
banim_danf_da1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9D, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_38_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xA4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xA5, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xA9, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xD9, 16, -8
	banim_frame_end
banim_danf_da1_oam_frame_39_l:
	banim_frame_oam 0x4000, 0x9000, 0xAA, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xAE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xEA, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xEE, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xAF, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xB3, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xEF, 16, 0
	banim_frame_end
banim_danf_da1_oam_frame_40_l:
	banim_frame_oam 0x4000, 0x9000, 0xB4, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xB8, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0xF4, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xF8, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xB9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xBD, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF3, 16, 8
	banim_frame_end
banim_danf_da1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x6, -32, -16
	banim_frame_end
banim_danf_da1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0xB, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0xD, -32, -16
	banim_frame_end
banim_danf_da1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_danf_da1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_danf_da1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_danf_da1_oam_frame_46_l:
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
	.section .data.oam_r
banim_danf_da1_oam_r:
banim_danf_da1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x1D, -8, -24
	banim_frame_end
banim_danf_da1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0x8, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x9, 16, -16
	banim_frame_oam 0x0, 0x0, 0x49, -8, -24
	banim_frame_oam 0x0, 0x0, 0x69, 0, -24
	banim_frame_end
banim_danf_da1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, 8, -16
	banim_frame_oam 0x0, 0x0, 0x4F, -8, -24
	banim_frame_oam 0x0, 0x0, 0x2F, 16, -8
	banim_frame_oam 0x0, 0x0, 0x6F, 0, -24
	banim_frame_end
banim_danf_da1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0x14, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x3D, -16, -24
	banim_frame_oam 0x0, 0x0, 0x3F, 0, -24
	banim_frame_end
banim_danf_da1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x5D, -8, -24
	banim_frame_oam 0x0, 0x0, 0xDA, -24, -16
	banim_frame_end
banim_danf_da1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x7D, -8, -24
	banim_frame_oam 0x0, 0x0, 0xDB, -24, -16
	banim_frame_end
banim_danf_da1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x8C, -8, -24
	banim_frame_end
banim_danf_da1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x84, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xAC, -8, -24
	banim_frame_oam 0x0, 0x0, 0xAE, 16, -16
	banim_frame_end
banim_danf_da1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x88, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xCC, -8, -24
	banim_frame_oam 0x0, 0x0, 0xCE, 8, -24
	banim_frame_oam 0x0, 0x0, 0xCF, 16, -16
	banim_frame_end
banim_danf_da1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x90, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xEC, -16, -24
	banim_frame_end
banim_danf_da1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x95, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x99, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0x9A, -16, -24
	banim_frame_oam 0x0, 0x0, 0x9E, 16, -24
	banim_frame_end
banim_danf_da1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_danf_da1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_danf_da1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF, 24, -8
	banim_frame_oam 0x0, 0x0, 0x8F, 24, 0
	banim_frame_end
banim_danf_da1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x14, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x90, -16, 8
	banim_frame_oam 0x0, 0x0, 0x94, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x6F, 24, -8
	banim_frame_end
banim_danf_da1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x19, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x0, 0x0, 0x99, 16, 8
	banim_frame_end
banim_danf_da1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x1A, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x1E, 16, -16
	banim_frame_oam 0x0, 0x0, 0x9B, 8, -24
	banim_frame_end
banim_danf_da1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xA4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x0, 0x0, 0xE4, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0xA5, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xA9, 16, 0
	banim_frame_end
banim_danf_da1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0xAA, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xAE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xEA, -16, -8
	banim_frame_oam 0x0, 0x0, 0xEE, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0xB0, -8, 0
	banim_frame_end
banim_danf_da1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x8000, 0xB5, -8, -24
	banim_frame_oam 0x8000, 0x0, 0xB9, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xF5, -8, -8
	banim_frame_oam 0x0, 0x0, 0xF9, 24, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -8, 0
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0xF0, -8, 8
	banim_frame_end
banim_danf_da1_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x4, 8, -24
	banim_frame_oam 0x4000, 0x8000, 0x41, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x40, -16, -32
	banim_frame_end
banim_danf_da1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -8, 8
	banim_frame_oam 0x0, 0x4000, 0x9, -24, -24
	banim_frame_oam 0x0, 0x0, 0x4A, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xB, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xF, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8B, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8F, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x69, 0, -32
	banim_frame_end
banim_danf_da1_oam_frame_22_r:
	banim_frame_oam 0x4000, 0x8000, 0x10, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x14, 16, -24
	banim_frame_oam 0x4000, 0x8000, 0x51, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0x91, -8, 8
	banim_frame_end
banim_danf_da1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x19, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x0, 0x0, 0x99, 16, 8
	banim_frame_end
banim_danf_da1_oam_frame_24_r:
	banim_frame_oam 0x4000, 0x8000, 0x1A, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x1E, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0x5A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x5E, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0x7A, -32, -24
	banim_frame_oam 0x8000, 0x0, 0x7E, 0, -24
	banim_frame_oam 0x0, 0x0, 0x9F, 8, -16
	banim_frame_oam 0x0, 0x0, 0x7F, 16, -16
	banim_frame_end
banim_danf_da1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -24, -24
	banim_frame_oam 0x0, 0x4000, 0xA4, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xE4, 8, -8
	banim_frame_oam 0x4000, 0x8000, 0xA6, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xAA, 16, 0
	banim_frame_end
banim_danf_da1_oam_frame_26_r:
	banim_frame_oam 0x4000, 0x8000, 0xAB, -24, -24
	banim_frame_oam 0x0, 0x4000, 0xAF, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xEB, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xE6, -8, 0
	banim_frame_oam 0x4000, 0x4000, 0xB1, -8, 8
	banim_frame_end
banim_danf_da1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x8000, 0xBA, -16, -24
	banim_frame_oam 0x0, 0x4000, 0xBE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xB5, -16, -8
	banim_frame_oam 0x0, 0x0, 0xB9, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0xD6, -8, 0
	banim_frame_end
banim_danf_da1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x84, 24, 8
	banim_frame_end
banim_danf_da1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x9, 8, -16
	banim_frame_end
banim_danf_da1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xF, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8B, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8F, 8, 8
	banim_frame_end
banim_danf_da1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x95, 8, 8
	banim_frame_end
banim_danf_da1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -16, 8
	banim_frame_end
banim_danf_da1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x8000, 0x1B, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x9B, -16, 8
	banim_frame_oam 0x0, 0x0, 0x3F, -24, -16
	banim_frame_end
banim_danf_da1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x81, -8, 8
	banim_frame_oam 0x0, 0x0, 0x83, 8, 8
	banim_frame_end
banim_danf_da1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_danf_da1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x8B, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8D, 8, 8
	banim_frame_oam 0x0, 0x0, 0x8A, -24, -16
	banim_frame_end
banim_danf_da1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x90, -8, 8
	banim_frame_oam 0x0, 0x0, 0x92, 8, 8
	banim_frame_end
banim_danf_da1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x98, 16, 8
	banim_frame_end
banim_danf_da1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9D, 16, 8
	banim_frame_end
banim_danf_da1_oam_frame_38_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xA4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x0, 0x0, 0xE4, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0xA5, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xA9, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xD9, -24, -8
	banim_frame_end
banim_danf_da1_oam_frame_39_r:
	banim_frame_oam 0x4000, 0x8000, 0xAA, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xAE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xEA, -16, -8
	banim_frame_oam 0x0, 0x0, 0xEE, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0xAF, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xB3, 16, 0
	banim_frame_oam 0x0, 0x0, 0xEF, -24, 0
	banim_frame_end
banim_danf_da1_oam_frame_40_r:
	banim_frame_oam 0x4000, 0x8000, 0xB4, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xB8, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xF4, -16, 0
	banim_frame_oam 0x0, 0x0, 0xF8, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xB9, -16, 8
	banim_frame_oam 0x0, 0x0, 0xBD, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF3, -24, 8
	banim_frame_end
banim_danf_da1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x6, 24, -16
	banim_frame_end
banim_danf_da1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0xB, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0xD, 24, -16
	banim_frame_end
banim_danf_da1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_danf_da1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_danf_da1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_danf_da1_oam_frame_46_r:
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
	.section .data.script
banim_danf_da1_script:
banim_danf_da1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 1, banim_danf_da1_oam_frame_1_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 2, banim_danf_da1_oam_frame_2_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_0, 3, banim_danf_da1_oam_frame_3_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 4, banim_danf_da1_oam_frame_4_r - banim_danf_da1_oam_r
	banim_code_frame 12, banim_danf_da1_sheet_0, 5, banim_danf_da1_oam_frame_5_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_0, 6, banim_danf_da1_oam_frame_6_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_0, 7, banim_danf_da1_oam_frame_7_r - banim_danf_da1_oam_r
	banim_code_sound_dance
	banim_code_frame 4, banim_danf_da1_sheet_0, 8, banim_danf_da1_oam_frame_8_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 9, banim_danf_da1_oam_frame_9_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 10, banim_danf_da1_oam_frame_10_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_1, 11, banim_danf_da1_oam_frame_11_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 12, banim_danf_da1_oam_frame_12_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 13, banim_danf_da1_oam_frame_13_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 14, banim_danf_da1_oam_frame_14_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_1, 15, banim_danf_da1_oam_frame_15_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 16, banim_danf_da1_oam_frame_16_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 17, banim_danf_da1_oam_frame_17_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 18, banim_danf_da1_oam_frame_18_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 24, banim_danf_da1_oam_frame_23_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 31, banim_danf_da1_oam_frame_30_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 32, banim_danf_da1_oam_frame_31_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 7, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 35, banim_danf_da1_oam_frame_32_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 36, banim_danf_da1_oam_frame_33_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 37, banim_danf_da1_oam_frame_34_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 38, banim_danf_da1_oam_frame_35_r - banim_danf_da1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 6, banim_danf_da1_sheet_4, 39, banim_danf_da1_oam_frame_36_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 40, banim_danf_da1_oam_frame_37_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 41, banim_danf_da1_oam_frame_38_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 42, banim_danf_da1_oam_frame_39_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 43, banim_danf_da1_oam_frame_40_r - banim_danf_da1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_danf_da1_sheet_5, 44, banim_danf_da1_oam_frame_41_r - banim_danf_da1_oam_r
	banim_code_frame 50, banim_danf_da1_sheet_5, 45, banim_danf_da1_oam_frame_42_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_danf_da1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 12, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_sound_dance
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 7, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 6, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 50, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_danf_da1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 1, banim_danf_da1_oam_frame_1_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 2, banim_danf_da1_oam_frame_2_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_0, 3, banim_danf_da1_oam_frame_3_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 4, banim_danf_da1_oam_frame_4_r - banim_danf_da1_oam_r
	banim_code_frame 12, banim_danf_da1_sheet_0, 5, banim_danf_da1_oam_frame_5_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_0, 6, banim_danf_da1_oam_frame_6_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_0, 7, banim_danf_da1_oam_frame_7_r - banim_danf_da1_oam_r
	banim_code_sound_dance
	banim_code_frame 4, banim_danf_da1_sheet_0, 8, banim_danf_da1_oam_frame_8_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 9, banim_danf_da1_oam_frame_9_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 10, banim_danf_da1_oam_frame_10_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_1, 11, banim_danf_da1_oam_frame_11_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 12, banim_danf_da1_oam_frame_12_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 13, banim_danf_da1_oam_frame_13_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 14, banim_danf_da1_oam_frame_14_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_1, 15, banim_danf_da1_oam_frame_15_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 16, banim_danf_da1_oam_frame_16_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 17, banim_danf_da1_oam_frame_17_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 18, banim_danf_da1_oam_frame_18_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 24, banim_danf_da1_oam_frame_23_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 31, banim_danf_da1_oam_frame_30_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 32, banim_danf_da1_oam_frame_31_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 7, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 35, banim_danf_da1_oam_frame_32_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 36, banim_danf_da1_oam_frame_33_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 37, banim_danf_da1_oam_frame_34_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 38, banim_danf_da1_oam_frame_35_r - banim_danf_da1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 6, banim_danf_da1_sheet_4, 39, banim_danf_da1_oam_frame_36_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 40, banim_danf_da1_oam_frame_37_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 41, banim_danf_da1_oam_frame_38_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 42, banim_danf_da1_oam_frame_39_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 43, banim_danf_da1_oam_frame_40_r - banim_danf_da1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_danf_da1_sheet_5, 44, banim_danf_da1_oam_frame_41_r - banim_danf_da1_oam_r
	banim_code_frame 50, banim_danf_da1_sheet_5, 45, banim_danf_da1_oam_frame_42_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_danf_da1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 12, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_sound_dance
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 49, banim_danf_da1_oam_frame_46_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 7, banim_danf_da1_sheet_2, 48, banim_danf_da1_oam_frame_45_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 6, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 46, banim_danf_da1_oam_frame_43_r - banim_danf_da1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_frame 50, banim_danf_da1_sheet_5, 47, banim_danf_da1_oam_frame_44_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_danf_da1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 1, banim_danf_da1_oam_frame_1_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 2, banim_danf_da1_oam_frame_2_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_0, 3, banim_danf_da1_oam_frame_3_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 4, banim_danf_da1_oam_frame_4_r - banim_danf_da1_oam_r
	banim_code_frame 12, banim_danf_da1_sheet_0, 5, banim_danf_da1_oam_frame_5_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_0, 6, banim_danf_da1_oam_frame_6_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_0, 7, banim_danf_da1_oam_frame_7_r - banim_danf_da1_oam_r
	banim_code_sound_dance
	banim_code_frame 4, banim_danf_da1_sheet_0, 8, banim_danf_da1_oam_frame_8_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 9, banim_danf_da1_oam_frame_9_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 10, banim_danf_da1_oam_frame_10_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_1, 11, banim_danf_da1_oam_frame_11_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 12, banim_danf_da1_oam_frame_12_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 13, banim_danf_da1_oam_frame_13_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 14, banim_danf_da1_oam_frame_14_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_1, 15, banim_danf_da1_oam_frame_15_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 16, banim_danf_da1_oam_frame_16_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 17, banim_danf_da1_oam_frame_17_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 18, banim_danf_da1_oam_frame_18_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 24, banim_danf_da1_oam_frame_23_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 31, banim_danf_da1_oam_frame_30_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 32, banim_danf_da1_oam_frame_31_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 7, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 35, banim_danf_da1_oam_frame_32_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 36, banim_danf_da1_oam_frame_33_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 37, banim_danf_da1_oam_frame_34_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 38, banim_danf_da1_oam_frame_35_r - banim_danf_da1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 6, banim_danf_da1_sheet_4, 39, banim_danf_da1_oam_frame_36_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 40, banim_danf_da1_oam_frame_37_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 41, banim_danf_da1_oam_frame_38_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 42, banim_danf_da1_oam_frame_39_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 43, banim_danf_da1_oam_frame_40_r - banim_danf_da1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_danf_da1_sheet_5, 44, banim_danf_da1_oam_frame_41_r - banim_danf_da1_oam_r
	banim_code_frame 50, banim_danf_da1_sheet_5, 45, banim_danf_da1_oam_frame_42_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_danf_da1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 1, banim_danf_da1_oam_frame_1_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 2, banim_danf_da1_oam_frame_2_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_0, 3, banim_danf_da1_oam_frame_3_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 4, banim_danf_da1_oam_frame_4_r - banim_danf_da1_oam_r
	banim_code_frame 12, banim_danf_da1_sheet_0, 5, banim_danf_da1_oam_frame_5_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_0, 6, banim_danf_da1_oam_frame_6_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_0, 7, banim_danf_da1_oam_frame_7_r - banim_danf_da1_oam_r
	banim_code_sound_dance
	banim_code_frame 4, banim_danf_da1_sheet_0, 8, banim_danf_da1_oam_frame_8_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 9, banim_danf_da1_oam_frame_9_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 10, banim_danf_da1_oam_frame_10_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_1, 11, banim_danf_da1_oam_frame_11_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 12, banim_danf_da1_oam_frame_12_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 13, banim_danf_da1_oam_frame_13_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 14, banim_danf_da1_oam_frame_14_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_1, 15, banim_danf_da1_oam_frame_15_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 16, banim_danf_da1_oam_frame_16_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 17, banim_danf_da1_oam_frame_17_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 18, banim_danf_da1_oam_frame_18_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 24, banim_danf_da1_oam_frame_23_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 31, banim_danf_da1_oam_frame_30_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 32, banim_danf_da1_oam_frame_31_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 7, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 35, banim_danf_da1_oam_frame_32_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 36, banim_danf_da1_oam_frame_33_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 37, banim_danf_da1_oam_frame_34_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 38, banim_danf_da1_oam_frame_35_r - banim_danf_da1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 6, banim_danf_da1_sheet_4, 39, banim_danf_da1_oam_frame_36_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 40, banim_danf_da1_oam_frame_37_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 41, banim_danf_da1_oam_frame_38_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 42, banim_danf_da1_oam_frame_39_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 43, banim_danf_da1_oam_frame_40_r - banim_danf_da1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_danf_da1_sheet_5, 44, banim_danf_da1_oam_frame_41_r - banim_danf_da1_oam_r
	banim_code_frame 50, banim_danf_da1_sheet_5, 45, banim_danf_da1_oam_frame_42_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_danf_da1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_danf_da1_sheet_3, 33, banim_danf_da1_oam_frame_47_r - banim_danf_da1_oam_r
	banim_code_frame 1, banim_danf_da1_sheet_3, 34, banim_danf_da1_oam_frame_48_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_danf_da1_sheet_3, 33, banim_danf_da1_oam_frame_47_r - banim_danf_da1_oam_r
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_danf_da1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_danf_da1_sheet_3, 33, banim_danf_da1_oam_frame_47_r - banim_danf_da1_oam_r
	banim_code_frame 1, banim_danf_da1_sheet_3, 34, banim_danf_da1_oam_frame_48_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_danf_da1_sheet_3, 33, banim_danf_da1_oam_frame_47_r - banim_danf_da1_oam_r
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_danf_da1_mode_stand_close:
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_danf_da1_mode_stand:
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_danf_da1_mode_stand_range:
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_danf_da1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_danf_da1_sheet_0, 0, banim_danf_da1_oam_frame_0_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 1, banim_danf_da1_oam_frame_1_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 2, banim_danf_da1_oam_frame_2_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_0, 3, banim_danf_da1_oam_frame_3_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 4, banim_danf_da1_oam_frame_4_r - banim_danf_da1_oam_r
	banim_code_frame 12, banim_danf_da1_sheet_0, 5, banim_danf_da1_oam_frame_5_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_0, 6, banim_danf_da1_oam_frame_6_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_0, 7, banim_danf_da1_oam_frame_7_r - banim_danf_da1_oam_r
	banim_code_sound_dance
	banim_code_frame 4, banim_danf_da1_sheet_0, 8, banim_danf_da1_oam_frame_8_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 9, banim_danf_da1_oam_frame_9_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_0, 10, banim_danf_da1_oam_frame_10_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_1, 11, banim_danf_da1_oam_frame_11_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 12, banim_danf_da1_oam_frame_12_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 13, banim_danf_da1_oam_frame_13_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 14, banim_danf_da1_oam_frame_14_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_1, 15, banim_danf_da1_oam_frame_15_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 16, banim_danf_da1_oam_frame_16_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 17, banim_danf_da1_oam_frame_17_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_1, 18, banim_danf_da1_oam_frame_18_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 24, banim_danf_da1_oam_frame_23_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 25, banim_danf_da1_oam_frame_24_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 26, banim_danf_da1_oam_frame_25_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 27, banim_danf_da1_oam_frame_26_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_2, 28, banim_danf_da1_oam_frame_27_r - banim_danf_da1_oam_r
	banim_code_frame 2, banim_danf_da1_sheet_3, 29, banim_danf_da1_oam_frame_28_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 30, banim_danf_da1_oam_frame_29_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 31, banim_danf_da1_oam_frame_30_r - banim_danf_da1_oam_r
	banim_code_frame 3, banim_danf_da1_sheet_3, 32, banim_danf_da1_oam_frame_31_r - banim_danf_da1_oam_r
	banim_code_frame 4, banim_danf_da1_sheet_2, 23, banim_danf_da1_oam_frame_22_r - banim_danf_da1_oam_r
	banim_code_frame 5, banim_danf_da1_sheet_1, 19, banim_danf_da1_oam_frame_19_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_2, 20, banim_danf_da1_oam_frame_20_r - banim_danf_da1_oam_r
	banim_code_frame 7, banim_danf_da1_sheet_2, 21, banim_danf_da1_oam_frame_21_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 35, banim_danf_da1_oam_frame_32_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 36, banim_danf_da1_oam_frame_33_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 37, banim_danf_da1_oam_frame_34_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 38, banim_danf_da1_oam_frame_35_r - banim_danf_da1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 6, banim_danf_da1_sheet_4, 39, banim_danf_da1_oam_frame_36_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 40, banim_danf_da1_oam_frame_37_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 41, banim_danf_da1_oam_frame_38_r - banim_danf_da1_oam_r
	banim_code_frame 8, banim_danf_da1_sheet_4, 42, banim_danf_da1_oam_frame_39_r - banim_danf_da1_oam_r
	banim_code_frame 6, banim_danf_da1_sheet_4, 43, banim_danf_da1_oam_frame_40_r - banim_danf_da1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_danf_da1_sheet_5, 44, banim_danf_da1_oam_frame_41_r - banim_danf_da1_oam_r
	banim_code_frame 50, banim_danf_da1_sheet_5, 45, banim_danf_da1_oam_frame_42_r - banim_danf_da1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
	.section .data.modes
	.word banim_danf_da1_mode_attack_close - banim_danf_da1_script
	.word banim_danf_da1_mode_attack_close_back - banim_danf_da1_script
	.word banim_danf_da1_mode_attack_close_critical - banim_danf_da1_script
	.word banim_danf_da1_mode_attack_close_critical_back - banim_danf_da1_script
	.word banim_danf_da1_mode_attack_range - banim_danf_da1_script
	.word banim_danf_da1_mode_attack_range_critical - banim_danf_da1_script
	.word banim_danf_da1_mode_dodge_close - banim_danf_da1_script
	.word banim_danf_da1_mode_dodge_range - banim_danf_da1_script
	.word banim_danf_da1_mode_stand_close - banim_danf_da1_script
	.word banim_danf_da1_mode_stand - banim_danf_da1_script
	.word banim_danf_da1_mode_stand_range - banim_danf_da1_script
	.word banim_danf_da1_mode_attack_miss - banim_danf_da1_script
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

