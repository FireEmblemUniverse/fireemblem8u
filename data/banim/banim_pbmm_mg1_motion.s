@ vim:ft=armv4
	.global banim_pbmm_mg1_script
	.global banim_pbmm_mg1_oam_r
	.global banim_pbmm_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x94
	.section .data.oam_l
banim_pbmm_mg1_oam_l:
banim_pbmm_mg1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x23, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x63, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x80, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x82, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xA3, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x27, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x67, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x84, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x86, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xA7, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0xA, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x2B, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x6B, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x88, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x8A, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xAB, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xEB, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x2F, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x6F, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x8C, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x8E, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xAF, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xEF, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x12, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x73, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x9000, 0x90, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x92, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x93, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xB3, 0, -24
	banim_frame_end
banim_pbmm_mg1_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x9000, 0x14, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x94, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x36, -8, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x17, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0x19, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x99, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x3A, -8, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x9000, 0x1B, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0x1D, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x9B, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x9D, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x3E, -8, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x9000, 0xB4, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0xF4, -8, -8
	banim_frame_oam 0x0, 0x5000, 0xB8, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0xBA, -8, 0
	banim_frame_end
banim_pbmm_mg1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x23, -8, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x26, -8, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, -8
	banim_frame_oam 0x0, 0x5000, 0xC2, -16, -16
	banim_frame_oam 0x4000, 0x9000, 0xA4, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xA2, 16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x2B, -24, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x9000, 0x88, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x8A, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xAB, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xEB, -24, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x2F, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x6F, -24, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x9000, 0x8C, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x8E, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xAF, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xEF, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x8F, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x10, 8, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_22_l:
	banim_frame_oam 0x4000, 0x9000, 0x90, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x94, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0xD0, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x64, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x44, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -24, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x84, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x9000, 0x5, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x7, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x28, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x68, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x9000, 0x85, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x87, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xA8, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_35_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0xB, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x2C, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x6C, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x9000, 0x89, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xAD, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xED, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x31, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x71, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x8E, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xF2, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x36, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x76, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x9000, 0x93, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x95, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xB6, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xF6, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0x18, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x37, 16, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_42_l:
	banim_frame_oam 0x8000, 0x9000, 0x98, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x9A, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xB7, 16, -8
	banim_frame_oam 0x0, 0x1000, 0xF7, 16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_43_l:
	banim_frame_oam 0x8000, 0x9000, 0x1D, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x3F, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x7F, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x3C, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x7C, 8, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_pbmm_mg1_oam_r:
banim_pbmm_mg1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x23, 8, -8
	banim_frame_oam 0x0, 0x0, 0x63, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x80, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x82, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xA3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE3, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x27, 8, -8
	banim_frame_oam 0x0, 0x0, 0x67, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x84, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x86, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xA7, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE7, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0xA, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x2B, 8, -8
	banim_frame_oam 0x0, 0x0, 0x6B, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x88, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x8A, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xAB, 8, -8
	banim_frame_oam 0x0, 0x0, 0xEB, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x2F, 8, -8
	banim_frame_oam 0x0, 0x0, 0x6F, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x8C, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x8E, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xAF, 8, -8
	banim_frame_oam 0x0, 0x0, 0xEF, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x12, 0, -16
	banim_frame_oam 0x0, 0x0, 0x73, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x8000, 0x90, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x92, 0, -16
	banim_frame_oam 0x0, 0x0, 0x93, -16, -24
	banim_frame_oam 0x0, 0x0, 0xB3, -8, -24
	banim_frame_end
banim_pbmm_mg1_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x94, -16, 8
	banim_frame_oam 0x8000, 0x4000, 0x36, 0, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x17, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x19, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -24, 8
	banim_frame_oam 0x0, 0x0, 0x99, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x3A, 0, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x8000, 0x1B, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x1D, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x9B, -24, 8
	banim_frame_oam 0x0, 0x0, 0x9D, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x3E, 0, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x8000, 0xB4, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0xF4, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xB8, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xBA, 0, 0
	banim_frame_end
banim_pbmm_mg1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -24, 8
	banim_frame_oam 0x0, 0x0, 0x82, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x23, 0, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x84, -16, 8
	banim_frame_oam 0x8000, 0x4000, 0x26, 0, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -16, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, -8
	banim_frame_oam 0x0, 0x4000, 0xC2, 0, -16
	banim_frame_oam 0x4000, 0x8000, 0xA4, -16, 0
	banim_frame_oam 0x0, 0x0, 0xA2, -24, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x2B, 16, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x8000, 0x88, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x8A, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xAB, 16, -8
	banim_frame_oam 0x0, 0x0, 0xEB, 16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x2F, 16, -8
	banim_frame_oam 0x0, 0x0, 0x6F, 16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x8000, 0x8C, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x8E, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xAF, 16, -8
	banim_frame_oam 0x0, 0x0, 0xEF, 16, 8
	banim_frame_oam 0x0, 0x0, 0x8F, -16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x10, -16, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_22_r:
	banim_frame_oam 0x4000, 0x8000, 0x90, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x94, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0xD0, -16, 0
	banim_frame_oam 0x0, 0x0, 0xF4, 16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x0, 0x0, 0x64, 16, 8
	banim_frame_oam 0x0, 0x0, 0x44, 0, -24
	banim_frame_oam 0x0, 0x0, 0x4, 16, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -16
	banim_frame_end
banim_pbmm_mg1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -16, -16
	banim_frame_oam 0x0, 0x0, 0x84, 16, -16
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x8000, 0x5, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x7, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x28, 8, -8
	banim_frame_oam 0x0, 0x0, 0x68, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x8000, 0x85, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x87, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xA8, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_35_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0xB, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x2C, 8, -8
	banim_frame_oam 0x0, 0x0, 0x6C, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x8000, 0x89, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xAD, 8, -8
	banim_frame_oam 0x0, 0x0, 0xED, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -24, -16
	banim_frame_oam 0x8000, 0x0, 0x31, 8, -8
	banim_frame_oam 0x0, 0x0, 0x71, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x8E, -24, -16
	banim_frame_oam 0x0, 0x0, 0xF2, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -16
	banim_frame_oam 0x8000, 0x0, 0x36, 8, -8
	banim_frame_oam 0x0, 0x0, 0x76, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x8000, 0x93, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x95, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xB6, 8, -8
	banim_frame_oam 0x0, 0x0, 0xF6, 8, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x37, -24, -8
	banim_frame_end
banim_pbmm_mg1_oam_frame_42_r:
	banim_frame_oam 0x8000, 0x8000, 0x98, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x9A, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xB7, -24, -8
	banim_frame_oam 0x0, 0x0, 0xF7, -24, 8
	banim_frame_end
banim_pbmm_mg1_oam_frame_43_r:
	banim_frame_oam 0x8000, 0x8000, 0x1D, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x3F, 8, -8
	banim_frame_oam 0x0, 0x0, 0x7F, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x3C, -16, -8
	banim_frame_oam 0x0, 0x0, 0x7C, -16, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_pbmm_mg1_script:
banim_pbmm_mg1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_0, 1, banim_pbmm_mg1_oam_frame_1_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 2, banim_pbmm_mg1_oam_frame_2_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 3, banim_pbmm_mg1_oam_frame_3_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 4, banim_pbmm_mg1_oam_frame_4_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 5, banim_pbmm_mg1_oam_frame_5_r - banim_pbmm_mg1_oam_r
	banim_code_frame 10, banim_pbmm_mg1_sheet_0, 6, banim_pbmm_mg1_oam_frame_6_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 7, banim_pbmm_mg1_oam_frame_7_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 8, banim_pbmm_mg1_oam_frame_8_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 9, banim_pbmm_mg1_oam_frame_9_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 10, banim_pbmm_mg1_oam_frame_10_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 11, banim_pbmm_mg1_oam_frame_11_r - banim_pbmm_mg1_oam_r
	banim_code_frame 20, banim_pbmm_mg1_sheet_0, 12, banim_pbmm_mg1_oam_frame_12_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 13, banim_pbmm_mg1_oam_frame_13_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 14, banim_pbmm_mg1_oam_frame_14_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_1, 15, banim_pbmm_mg1_oam_frame_15_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 16, banim_pbmm_mg1_oam_frame_16_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 17, banim_pbmm_mg1_oam_frame_17_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 18, banim_pbmm_mg1_oam_frame_18_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 19, banim_pbmm_mg1_oam_frame_19_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 20, banim_pbmm_mg1_oam_frame_20_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 21, banim_pbmm_mg1_oam_frame_21_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 22, banim_pbmm_mg1_oam_frame_22_r - banim_pbmm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 23, banim_pbmm_mg1_oam_frame_23_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 24, banim_pbmm_mg1_oam_frame_24_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 26, banim_pbmm_mg1_oam_frame_26_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 27, banim_pbmm_mg1_oam_frame_27_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_3, 28, banim_pbmm_mg1_oam_frame_28_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 29, banim_pbmm_mg1_oam_frame_29_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbmm_mg1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 10, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 20, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbmm_mg1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 31, banim_pbmm_mg1_oam_frame_35_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 32, banim_pbmm_mg1_oam_frame_36_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 33, banim_pbmm_mg1_oam_frame_37_r - banim_pbmm_mg1_oam_r
	banim_code_frame 8, banim_pbmm_mg1_sheet_3, 34, banim_pbmm_mg1_oam_frame_38_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 35, banim_pbmm_mg1_oam_frame_39_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 36, banim_pbmm_mg1_oam_frame_40_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 3, banim_pbmm_mg1_oam_frame_3_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 4, banim_pbmm_mg1_oam_frame_4_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 5, banim_pbmm_mg1_oam_frame_5_r - banim_pbmm_mg1_oam_r
	banim_code_frame 10, banim_pbmm_mg1_sheet_0, 6, banim_pbmm_mg1_oam_frame_6_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 7, banim_pbmm_mg1_oam_frame_7_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 8, banim_pbmm_mg1_oam_frame_8_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 9, banim_pbmm_mg1_oam_frame_9_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 10, banim_pbmm_mg1_oam_frame_10_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 11, banim_pbmm_mg1_oam_frame_11_r - banim_pbmm_mg1_oam_r
	banim_code_frame 20, banim_pbmm_mg1_sheet_0, 12, banim_pbmm_mg1_oam_frame_12_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 13, banim_pbmm_mg1_oam_frame_13_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 14, banim_pbmm_mg1_oam_frame_14_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 15, banim_pbmm_mg1_oam_frame_15_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 16, banim_pbmm_mg1_oam_frame_16_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 17, banim_pbmm_mg1_oam_frame_17_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 18, banim_pbmm_mg1_oam_frame_18_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 19, banim_pbmm_mg1_oam_frame_19_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 20, banim_pbmm_mg1_oam_frame_20_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 21, banim_pbmm_mg1_oam_frame_21_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 22, banim_pbmm_mg1_oam_frame_22_r - banim_pbmm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 23, banim_pbmm_mg1_oam_frame_23_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 24, banim_pbmm_mg1_oam_frame_24_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 26, banim_pbmm_mg1_oam_frame_26_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 27, banim_pbmm_mg1_oam_frame_27_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_3, 28, banim_pbmm_mg1_oam_frame_28_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 29, banim_pbmm_mg1_oam_frame_29_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbmm_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_frame 8, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 10, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 20, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 38, banim_pbmm_mg1_oam_frame_32_r - banim_pbmm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 40, banim_pbmm_mg1_oam_frame_33_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_pbmm_mg1_sheet_3, 39, banim_pbmm_mg1_oam_frame_34_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 37, banim_pbmm_mg1_oam_frame_31_r - banim_pbmm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbmm_mg1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_0, 1, banim_pbmm_mg1_oam_frame_1_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 2, banim_pbmm_mg1_oam_frame_2_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 3, banim_pbmm_mg1_oam_frame_3_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 4, banim_pbmm_mg1_oam_frame_4_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 5, banim_pbmm_mg1_oam_frame_5_r - banim_pbmm_mg1_oam_r
	banim_code_frame 10, banim_pbmm_mg1_sheet_0, 6, banim_pbmm_mg1_oam_frame_6_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 7, banim_pbmm_mg1_oam_frame_7_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 8, banim_pbmm_mg1_oam_frame_8_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 9, banim_pbmm_mg1_oam_frame_9_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 10, banim_pbmm_mg1_oam_frame_10_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 11, banim_pbmm_mg1_oam_frame_11_r - banim_pbmm_mg1_oam_r
	banim_code_frame 20, banim_pbmm_mg1_sheet_0, 12, banim_pbmm_mg1_oam_frame_12_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 13, banim_pbmm_mg1_oam_frame_13_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 14, banim_pbmm_mg1_oam_frame_14_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_1, 15, banim_pbmm_mg1_oam_frame_15_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 16, banim_pbmm_mg1_oam_frame_16_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 17, banim_pbmm_mg1_oam_frame_17_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 18, banim_pbmm_mg1_oam_frame_18_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 19, banim_pbmm_mg1_oam_frame_19_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 20, banim_pbmm_mg1_oam_frame_20_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 21, banim_pbmm_mg1_oam_frame_21_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 22, banim_pbmm_mg1_oam_frame_22_r - banim_pbmm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 23, banim_pbmm_mg1_oam_frame_23_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 24, banim_pbmm_mg1_oam_frame_24_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 26, banim_pbmm_mg1_oam_frame_26_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 27, banim_pbmm_mg1_oam_frame_27_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_3, 28, banim_pbmm_mg1_oam_frame_28_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 29, banim_pbmm_mg1_oam_frame_29_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbmm_mg1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 31, banim_pbmm_mg1_oam_frame_35_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 32, banim_pbmm_mg1_oam_frame_36_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 33, banim_pbmm_mg1_oam_frame_37_r - banim_pbmm_mg1_oam_r
	banim_code_frame 8, banim_pbmm_mg1_sheet_3, 34, banim_pbmm_mg1_oam_frame_38_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 35, banim_pbmm_mg1_oam_frame_39_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 36, banim_pbmm_mg1_oam_frame_40_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 3, banim_pbmm_mg1_oam_frame_3_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 4, banim_pbmm_mg1_oam_frame_4_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 5, banim_pbmm_mg1_oam_frame_5_r - banim_pbmm_mg1_oam_r
	banim_code_frame 10, banim_pbmm_mg1_sheet_0, 6, banim_pbmm_mg1_oam_frame_6_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 7, banim_pbmm_mg1_oam_frame_7_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 8, banim_pbmm_mg1_oam_frame_8_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 9, banim_pbmm_mg1_oam_frame_9_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 10, banim_pbmm_mg1_oam_frame_10_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 11, banim_pbmm_mg1_oam_frame_11_r - banim_pbmm_mg1_oam_r
	banim_code_frame 20, banim_pbmm_mg1_sheet_0, 12, banim_pbmm_mg1_oam_frame_12_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 13, banim_pbmm_mg1_oam_frame_13_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 14, banim_pbmm_mg1_oam_frame_14_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 15, banim_pbmm_mg1_oam_frame_15_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 16, banim_pbmm_mg1_oam_frame_16_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 17, banim_pbmm_mg1_oam_frame_17_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 18, banim_pbmm_mg1_oam_frame_18_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 19, banim_pbmm_mg1_oam_frame_19_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 20, banim_pbmm_mg1_oam_frame_20_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 21, banim_pbmm_mg1_oam_frame_21_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 22, banim_pbmm_mg1_oam_frame_22_r - banim_pbmm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 23, banim_pbmm_mg1_oam_frame_23_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 24, banim_pbmm_mg1_oam_frame_24_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 26, banim_pbmm_mg1_oam_frame_26_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 27, banim_pbmm_mg1_oam_frame_27_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_3, 28, banim_pbmm_mg1_oam_frame_28_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 29, banim_pbmm_mg1_oam_frame_29_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbmm_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 41, banim_pbmm_mg1_oam_frame_41_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_3, 42, banim_pbmm_mg1_oam_frame_42_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbmm_mg1_sheet_3, 43, banim_pbmm_mg1_oam_frame_43_r - banim_pbmm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbmm_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_pbmm_mg1_sheet_3, 41, banim_pbmm_mg1_oam_frame_41_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_3, 42, banim_pbmm_mg1_oam_frame_42_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbmm_mg1_sheet_3, 43, banim_pbmm_mg1_oam_frame_43_r - banim_pbmm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbmm_mg1_mode_stand_close:
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbmm_mg1_mode_stand:
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbmm_mg1_mode_stand_range:
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbmm_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_0, 1, banim_pbmm_mg1_oam_frame_1_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 2, banim_pbmm_mg1_oam_frame_2_r - banim_pbmm_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 3, banim_pbmm_mg1_oam_frame_3_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 4, banim_pbmm_mg1_oam_frame_4_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 5, banim_pbmm_mg1_oam_frame_5_r - banim_pbmm_mg1_oam_r
	banim_code_frame 10, banim_pbmm_mg1_sheet_0, 6, banim_pbmm_mg1_oam_frame_6_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 7, banim_pbmm_mg1_oam_frame_7_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 8, banim_pbmm_mg1_oam_frame_8_r - banim_pbmm_mg1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 9, banim_pbmm_mg1_oam_frame_9_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_0, 10, banim_pbmm_mg1_oam_frame_10_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_0, 11, banim_pbmm_mg1_oam_frame_11_r - banim_pbmm_mg1_oam_r
	banim_code_frame 20, banim_pbmm_mg1_sheet_0, 12, banim_pbmm_mg1_oam_frame_12_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_0, 13, banim_pbmm_mg1_oam_frame_13_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 14, banim_pbmm_mg1_oam_frame_14_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_1, 15, banim_pbmm_mg1_oam_frame_15_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 16, banim_pbmm_mg1_oam_frame_16_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 17, banim_pbmm_mg1_oam_frame_17_r - banim_pbmm_mg1_oam_r
	banim_code_frame 2, banim_pbmm_mg1_sheet_1, 18, banim_pbmm_mg1_oam_frame_18_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 19, banim_pbmm_mg1_oam_frame_19_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_1, 20, banim_pbmm_mg1_oam_frame_20_r - banim_pbmm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 21, banim_pbmm_mg1_oam_frame_21_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_1, 22, banim_pbmm_mg1_oam_frame_22_r - banim_pbmm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 23, banim_pbmm_mg1_oam_frame_23_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 24, banim_pbmm_mg1_oam_frame_24_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 26, banim_pbmm_mg1_oam_frame_26_r - banim_pbmm_mg1_oam_r
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 27, banim_pbmm_mg1_oam_frame_27_r - banim_pbmm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbmm_mg1_sheet_2, 25, banim_pbmm_mg1_oam_frame_25_r - banim_pbmm_mg1_oam_r
	banim_code_frame 6, banim_pbmm_mg1_sheet_3, 28, banim_pbmm_mg1_oam_frame_28_r - banim_pbmm_mg1_oam_r
	banim_code_frame 4, banim_pbmm_mg1_sheet_3, 29, banim_pbmm_mg1_oam_frame_29_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_pbmm_mg1_sheet_3, 30, banim_pbmm_mg1_oam_frame_30_r - banim_pbmm_mg1_oam_r
	banim_code_frame 1, banim_pbmm_mg1_sheet_0, 0, banim_pbmm_mg1_oam_frame_0_r - banim_pbmm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pbmm_mg1_mode_attack_close - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_attack_close_back - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_attack_close_critical - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_attack_close_critical_back - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_attack_range - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_attack_range_critical - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_dodge_close - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_dodge_range - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_stand_close - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_stand - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_stand_range - banim_pbmm_mg1_script
	.word banim_pbmm_mg1_mode_attack_miss - banim_pbmm_mg1_script
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

