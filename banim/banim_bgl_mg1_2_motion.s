@ vim:ft=armv4
	.global banim_bgl_mg1_2_script
	.global banim_bgl_mg1_2_oam_r
	.global banim_bgl_mg1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xBA
	.section .data.oam_l
banim_bgl_mg1_2_oam_l:
banim_bgl_mg1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0x4, -15, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -14, -32
	banim_frame_oam 0x4000, 0x9000, 0x44, -14, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x8, -12, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, -20, -32
	banim_frame_oam 0x4000, 0x9000, 0x84, -12, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x88, -12, -32
	banim_frame_oam 0x8000, 0x5000, 0x8C, -20, -32
	banim_frame_oam 0x4000, 0x9000, 0xC4, -12, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -12, -32
	banim_frame_oam 0x8000, 0x5000, 0x11, -20, -32
	banim_frame_oam 0x4000, 0x5000, 0xDC, -15, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x8D, -11, -32
	banim_frame_oam 0x8000, 0x5000, 0x91, -19, -32
	banim_frame_oam 0x0, 0x1000, 0x5F, -27, -15
	banim_frame_oam 0x4000, 0x5000, 0xFC, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0x1B, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -32
	banim_frame_oam 0x4000, 0x5000, 0xBC, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x58, 8, -26
	banim_frame_oam 0x8000, 0x1000, 0x5A, 0, -26
	banim_frame_oam 0x4000, 0x1000, 0x98, 8, -10
	banim_frame_oam 0x0, 0x1000, 0x9A, 0, -10
	banim_frame_end
banim_bgl_mg1_2_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x5000, 0xA6, -16, 8
	banim_frame_oam 0x0, 0x9000, 0x10, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x14, -24, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x5000, 0xA6, -16, 8
	banim_frame_oam 0x0, 0x9000, 0x16, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x1A, -24, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x5000, 0x6, -16, 8
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x5000, 0x26, -16, 8
	banim_frame_oam 0x0, 0x9000, 0x80, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x84, -24, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x14, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x16, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x1B, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0x9B, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xBB, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x1000, 0xDE, 0, 8
	banim_frame_oam 0x0, 0x9000, 0x17, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x7E, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0xBE, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xFE, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x5000, 0x4, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, -22, -16
	banim_frame_oam 0x0, 0x9000, 0x0, -14, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x9000, 0x24, -9, 0
	banim_frame_oam 0x0, 0x9000, 0x8, -9, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x9000, 0x64, -10, 0
	banim_frame_oam 0x0, 0x9000, 0xC, -10, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x9000, 0xA4, -10, 0
	banim_frame_oam 0x0, 0x9000, 0x10, -10, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x0, -15, -32
	banim_frame_oam 0x4000, 0x9000, 0x4, -15, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x9000, 0x4, -10, 0
	banim_frame_oam 0x0, 0x9000, 0x0, -10, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x9000, 0x44, -18, 0
	banim_frame_oam 0x0, 0x9000, 0x80, -10, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_22_l:
	banim_frame_oam 0x4000, 0x9000, 0x84, -10, 0
	banim_frame_oam 0x0, 0x9000, 0x8, -10, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_23_l:
	banim_frame_oam 0x4000, 0x9000, 0xC4, -10, 0
	banim_frame_oam 0x0, 0x9000, 0x88, -10, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_24_l:
	banim_frame_oam 0x4000, 0x9000, 0x10, -12, 0
	banim_frame_oam 0x0, 0x9000, 0xC, -12, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x9000, 0x50, -12, 0
	banim_frame_oam 0x0, 0x9000, 0x8C, -12, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_26_l:
	banim_frame_oam 0x4000, 0x9000, 0x4, -15, 0
	banim_frame_oam 0x4000, 0x5000, 0x60, -15, -8
	banim_frame_oam 0x0, 0x5000, 0x12, 1, -32
	banim_frame_oam 0x8000, 0x1000, 0x14, -7, -32
	banim_frame_oam 0x4000, 0x1000, 0x52, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x54, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x23, -15, -24
	banim_frame_end
banim_bgl_mg1_2_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x9000, 0x44, -14, 0
	banim_frame_oam 0x8000, 0x5000, 0x83, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 2, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -6, -8
	banim_frame_oam 0x0, 0x5000, 0x72, 2, -32
	banim_frame_oam 0x8000, 0x1000, 0x74, -6, -32
	banim_frame_oam 0x4000, 0x1000, 0xB2, 2, -16
	banim_frame_oam 0x0, 0x1000, 0xB4, -6, -16
	banim_frame_end
banim_bgl_mg1_2_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0xD2, 4, -16
	banim_frame_oam 0x8000, 0x1000, 0xD4, -4, -16
	banim_frame_oam 0x8000, 0x9000, 0xB, -20, -32
	banim_frame_oam 0x4000, 0x1000, 0x15, 4, -24
	banim_frame_oam 0x0, 0x1000, 0x17, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0x8, 4, -32
	banim_frame_oam 0x0, 0x1000, 0xA, -4, -32
	banim_frame_oam 0x4000, 0x9000, 0x84, -12, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x9000, 0x35, 4, -32
	banim_frame_oam 0x8000, 0x5000, 0x37, -4, -32
	banim_frame_oam 0x8000, 0x9000, 0x8B, -20, -32
	banim_frame_oam 0x4000, 0x9000, 0xC4, -12, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x5000, 0xDC, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xB5, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0xB7, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0xF5, 4, -8
	banim_frame_oam 0x0, 0x1000, 0xF7, -4, -8
	banim_frame_oam 0x8000, 0x9000, 0x10, -20, -32
	banim_frame_oam 0x4000, 0x1000, 0xE, -4, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x5000, 0xFC, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x18, 5, -24
	banim_frame_oam 0x8000, 0x1000, 0x1A, -3, -24
	banim_frame_oam 0x4000, 0x5000, 0xED, -11, -8
	banim_frame_oam 0x8000, 0x1000, 0xB0, -11, -24
	banim_frame_oam 0x8000, 0x5000, 0x91, -19, -32
	banim_frame_oam 0x4000, 0x5000, 0x8D, -11, -32
	banim_frame_oam 0x0, 0x1000, 0x5F, -27, -15
	banim_frame_end
banim_bgl_mg1_2_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x5000, 0xBC, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xB8, 8, -26
	banim_frame_oam 0x8000, 0x1000, 0xBA, 0, -26
	banim_frame_oam 0x4000, 0x1000, 0xF8, 8, -10
	banim_frame_oam 0x0, 0x1000, 0xFA, 0, -10
	banim_frame_oam 0x8000, 0x9000, 0x1B, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_33_l:
	banim_frame_oam 0x4000, 0x5000, 0xA6, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x90, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x92, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x13, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x15, -24, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_34_l:
	banim_frame_oam 0x4000, 0x5000, 0xC6, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x93, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x95, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x19, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_35_l:
	banim_frame_oam 0x4000, 0x5000, 0x6, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x3, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x5, -24, -32
	banim_frame_oam 0x8000, 0x9000, 0x96, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x98, 0, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_36_l:
	banim_frame_oam 0x8000, 0x9000, 0x99, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x9B, 0, -32
	banim_frame_oam 0x4000, 0x5000, 0x26, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x83, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x85, -24, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x1000, 0x9B, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x94, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x96, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x1B, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xBB, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x97, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x7E, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0xBE, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xDE, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xFE, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_39_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -14, -32
	banim_frame_oam 0x8000, 0x1000, 0x3F, -22, -16
	banim_frame_oam 0x4000, 0x5000, 0x4, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x88, -9, -32
	banim_frame_oam 0x4000, 0x9000, 0x24, -9, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_41_l:
	banim_frame_oam 0x4000, 0x9000, 0x64, -10, 0
	banim_frame_oam 0x0, 0x9000, 0x8C, -10, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_42_l:
	banim_frame_oam 0x4000, 0x9000, 0xA4, -10, 0
	banim_frame_oam 0x0, 0x9000, 0x90, -10, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_18_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_43_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x90, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0x3E, -6, 0
	banim_frame_oam 0x4000, 0x5000, 0x14, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_45_l:
	banim_frame_oam 0x0, 0x9000, 0x34, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0xB4, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xF4, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0x58, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0xD8, -16, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_bgl_mg1_2_oam_r:
banim_bgl_mg1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -17, -32
	banim_frame_oam 0x4000, 0x8000, 0x4, -17, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -18, -32
	banim_frame_oam 0x4000, 0x8000, 0x44, -18, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -20, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, 12, -32
	banim_frame_oam 0x4000, 0x8000, 0x84, -20, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x88, -20, -32
	banim_frame_oam 0x8000, 0x4000, 0x8C, 12, -32
	banim_frame_oam 0x4000, 0x8000, 0xC4, -20, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -20, -32
	banim_frame_oam 0x8000, 0x4000, 0x11, 12, -32
	banim_frame_oam 0x4000, 0x4000, 0xDC, -17, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x8D, -21, -32
	banim_frame_oam 0x8000, 0x4000, 0x91, 11, -32
	banim_frame_oam 0x0, 0x0, 0x5F, 19, -15
	banim_frame_oam 0x4000, 0x4000, 0xFC, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0x1B, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -32
	banim_frame_oam 0x4000, 0x4000, 0xBC, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x58, -24, -26
	banim_frame_oam 0x8000, 0x0, 0x5A, -8, -26
	banim_frame_oam 0x4000, 0x0, 0x98, -24, -10
	banim_frame_oam 0x0, 0x0, 0x9A, -8, -10
	banim_frame_end
banim_bgl_mg1_2_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x4000, 0xA6, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x10, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x14, 8, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x4000, 0xA6, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x16, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x1A, 8, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x4000, 0x6, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x4000, 0x26, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x80, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x84, 8, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x14, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x16, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x1B, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -32
	banim_frame_oam 0x4000, 0x0, 0x9B, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xBB, 0, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x0, 0xDE, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x17, -24, -32
	banim_frame_oam 0x0, 0x4000, 0x7E, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xBE, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xFE, 0, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x4000, 0x4, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, 14, -16
	banim_frame_oam 0x0, 0x8000, 0x0, -18, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x8000, 0x24, -23, 0
	banim_frame_oam 0x0, 0x8000, 0x8, -23, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x8000, 0x64, -22, 0
	banim_frame_oam 0x0, 0x8000, 0xC, -22, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x8000, 0xA4, -22, 0
	banim_frame_oam 0x0, 0x8000, 0x10, -22, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x0, -17, -32
	banim_frame_oam 0x4000, 0x8000, 0x4, -17, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x8000, 0x4, -22, 0
	banim_frame_oam 0x0, 0x8000, 0x0, -22, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x8000, 0x44, -14, 0
	banim_frame_oam 0x0, 0x8000, 0x80, -22, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_22_r:
	banim_frame_oam 0x4000, 0x8000, 0x84, -22, 0
	banim_frame_oam 0x0, 0x8000, 0x8, -22, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_23_r:
	banim_frame_oam 0x4000, 0x8000, 0xC4, -22, 0
	banim_frame_oam 0x0, 0x8000, 0x88, -22, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_24_r:
	banim_frame_oam 0x4000, 0x8000, 0x10, -20, 0
	banim_frame_oam 0x0, 0x8000, 0xC, -20, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x8000, 0x50, -20, 0
	banim_frame_oam 0x0, 0x8000, 0x8C, -20, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_26_r:
	banim_frame_oam 0x4000, 0x8000, 0x4, -17, 0
	banim_frame_oam 0x4000, 0x4000, 0x60, -17, -8
	banim_frame_oam 0x0, 0x4000, 0x12, -17, -32
	banim_frame_oam 0x8000, 0x0, 0x14, -1, -32
	banim_frame_oam 0x4000, 0x0, 0x52, -17, -16
	banim_frame_oam 0x0, 0x0, 0x54, -1, -16
	banim_frame_oam 0x8000, 0x0, 0x23, 7, -24
	banim_frame_end
banim_bgl_mg1_2_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x8000, 0x44, -18, 0
	banim_frame_oam 0x8000, 0x4000, 0x83, 6, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -18, -8
	banim_frame_oam 0x0, 0x0, 0xE2, -2, -8
	banim_frame_oam 0x0, 0x4000, 0x72, -18, -32
	banim_frame_oam 0x8000, 0x0, 0x74, -2, -32
	banim_frame_oam 0x4000, 0x0, 0xB2, -18, -16
	banim_frame_oam 0x0, 0x0, 0xB4, -2, -16
	banim_frame_end
banim_bgl_mg1_2_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0xD2, -20, -16
	banim_frame_oam 0x8000, 0x0, 0xD4, -4, -16
	banim_frame_oam 0x8000, 0x8000, 0xB, 4, -32
	banim_frame_oam 0x4000, 0x0, 0x15, -20, -24
	banim_frame_oam 0x0, 0x0, 0x17, -4, -24
	banim_frame_oam 0x4000, 0x0, 0x8, -20, -32
	banim_frame_oam 0x0, 0x0, 0xA, -4, -32
	banim_frame_oam 0x4000, 0x8000, 0x84, -20, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x8000, 0x35, -20, -32
	banim_frame_oam 0x8000, 0x4000, 0x37, -4, -32
	banim_frame_oam 0x8000, 0x8000, 0x8B, 4, -32
	banim_frame_oam 0x4000, 0x8000, 0xC4, -20, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x4000, 0xDC, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xB5, -20, -24
	banim_frame_oam 0x8000, 0x0, 0xB7, -4, -24
	banim_frame_oam 0x4000, 0x0, 0xF5, -20, -8
	banim_frame_oam 0x0, 0x0, 0xF7, -4, -8
	banim_frame_oam 0x8000, 0x8000, 0x10, 4, -32
	banim_frame_oam 0x4000, 0x0, 0xE, -12, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x4000, 0xFC, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x18, -21, -24
	banim_frame_oam 0x8000, 0x0, 0x1A, -5, -24
	banim_frame_oam 0x4000, 0x4000, 0xED, -21, -8
	banim_frame_oam 0x8000, 0x0, 0xB0, 3, -24
	banim_frame_oam 0x8000, 0x4000, 0x91, 11, -32
	banim_frame_oam 0x4000, 0x4000, 0x8D, -21, -32
	banim_frame_oam 0x0, 0x0, 0x5F, 19, -15
	banim_frame_end
banim_bgl_mg1_2_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x4000, 0xBC, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xB8, -24, -26
	banim_frame_oam 0x8000, 0x0, 0xBA, -8, -26
	banim_frame_oam 0x4000, 0x0, 0xF8, -24, -10
	banim_frame_oam 0x0, 0x0, 0xFA, -8, -10
	banim_frame_oam 0x8000, 0x8000, 0x1B, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_33_r:
	banim_frame_oam 0x4000, 0x4000, 0xA6, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x90, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x92, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x13, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x15, 16, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_34_r:
	banim_frame_oam 0x4000, 0x4000, 0xC6, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x93, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x95, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x19, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_35_r:
	banim_frame_oam 0x4000, 0x4000, 0x6, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x3, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x5, 16, -32
	banim_frame_oam 0x8000, 0x8000, 0x96, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x98, -8, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_36_r:
	banim_frame_oam 0x8000, 0x8000, 0x99, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x9B, -8, -32
	banim_frame_oam 0x4000, 0x4000, 0x26, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x83, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x85, 16, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x0, 0x9B, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x94, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x96, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x1B, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -32
	banim_frame_oam 0x4000, 0x0, 0xBB, 0, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x97, -24, -32
	banim_frame_oam 0x0, 0x4000, 0x7E, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xBE, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xDE, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xFE, 0, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_39_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -18, -32
	banim_frame_oam 0x8000, 0x0, 0x3F, 14, -16
	banim_frame_oam 0x4000, 0x4000, 0x4, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x88, -23, -32
	banim_frame_oam 0x4000, 0x8000, 0x24, -23, 0
	banim_frame_end
banim_bgl_mg1_2_oam_frame_41_r:
	banim_frame_oam 0x4000, 0x8000, 0x64, -22, 0
	banim_frame_oam 0x0, 0x8000, 0x8C, -22, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_42_r:
	banim_frame_oam 0x4000, 0x8000, 0xA4, -22, 0
	banim_frame_oam 0x0, 0x8000, 0x90, -22, -32
	banim_frame_end
banim_bgl_mg1_2_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_18_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_43_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x90, -16, -32
	banim_frame_oam 0x4000, 0x0, 0x3E, -10, 0
	banim_frame_oam 0x4000, 0x4000, 0x14, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_45_r:
	banim_frame_oam 0x0, 0x8000, 0x34, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0xB4, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xF4, -16, 8
	banim_frame_end
banim_bgl_mg1_2_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0x58, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0xD8, -16, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_bgl_mg1_2_script:
banim_bgl_mg1_2_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 1, banim_bgl_mg1_2_oam_frame_1_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 2, banim_bgl_mg1_2_oam_frame_2_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 3, banim_bgl_mg1_2_oam_frame_3_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 4, banim_bgl_mg1_2_oam_frame_4_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 5, banim_bgl_mg1_2_oam_frame_5_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magic_mogall
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 6, banim_bgl_mg1_2_oam_frame_6_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 7, banim_bgl_mg1_2_oam_frame_7_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 8, banim_bgl_mg1_2_oam_frame_8_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 9, banim_bgl_mg1_2_oam_frame_9_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 10, banim_bgl_mg1_2_oam_frame_10_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 11, banim_bgl_mg1_2_oam_frame_11_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 12, banim_bgl_mg1_2_oam_frame_12_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 13, banim_bgl_mg1_2_oam_frame_13_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 14, banim_bgl_mg1_2_oam_frame_14_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 15, banim_bgl_mg1_2_oam_frame_15_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magic_mogall
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 18, banim_bgl_mg1_2_oam_frame_20_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 19, banim_bgl_mg1_2_oam_frame_21_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink_critical
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 20, banim_bgl_mg1_2_oam_frame_22_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 21, banim_bgl_mg1_2_oam_frame_23_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 22, banim_bgl_mg1_2_oam_frame_24_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 23, banim_bgl_mg1_2_oam_frame_25_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_0, 24, banim_bgl_mg1_2_oam_frame_26_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 25, banim_bgl_mg1_2_oam_frame_27_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 26, banim_bgl_mg1_2_oam_frame_28_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 27, banim_bgl_mg1_2_oam_frame_29_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 28, banim_bgl_mg1_2_oam_frame_30_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 29, banim_bgl_mg1_2_oam_frame_31_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magical_mogall_critical
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 30, banim_bgl_mg1_2_oam_frame_32_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 31, banim_bgl_mg1_2_oam_frame_33_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 32, banim_bgl_mg1_2_oam_frame_34_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 33, banim_bgl_mg1_2_oam_frame_35_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 34, banim_bgl_mg1_2_oam_frame_36_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 35, banim_bgl_mg1_2_oam_frame_37_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 36, banim_bgl_mg1_2_oam_frame_38_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 37, banim_bgl_mg1_2_oam_frame_39_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 38, banim_bgl_mg1_2_oam_frame_40_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 16, banim_bgl_mg1_sheet_2, 39, banim_bgl_mg1_2_oam_frame_41_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 40, banim_bgl_mg1_2_oam_frame_42_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink_critical
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 43, banim_bgl_mg1_2_oam_frame_43_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magical_mogall_critical
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 42, banim_bgl_mg1_2_oam_frame_18_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 16, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 44, banim_bgl_mg1_2_oam_frame_19_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 41, banim_bgl_mg1_2_oam_frame_17_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 1, banim_bgl_mg1_2_oam_frame_1_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 2, banim_bgl_mg1_2_oam_frame_2_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 3, banim_bgl_mg1_2_oam_frame_3_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 4, banim_bgl_mg1_2_oam_frame_4_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 5, banim_bgl_mg1_2_oam_frame_5_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magic_mogall
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 6, banim_bgl_mg1_2_oam_frame_6_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 7, banim_bgl_mg1_2_oam_frame_7_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 8, banim_bgl_mg1_2_oam_frame_8_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 9, banim_bgl_mg1_2_oam_frame_9_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 10, banim_bgl_mg1_2_oam_frame_10_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 11, banim_bgl_mg1_2_oam_frame_11_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 12, banim_bgl_mg1_2_oam_frame_12_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 13, banim_bgl_mg1_2_oam_frame_13_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 14, banim_bgl_mg1_2_oam_frame_14_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 15, banim_bgl_mg1_2_oam_frame_15_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 18, banim_bgl_mg1_2_oam_frame_20_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 19, banim_bgl_mg1_2_oam_frame_21_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink_critical
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 20, banim_bgl_mg1_2_oam_frame_22_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 21, banim_bgl_mg1_2_oam_frame_23_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 22, banim_bgl_mg1_2_oam_frame_24_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_3, 23, banim_bgl_mg1_2_oam_frame_25_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 5, banim_bgl_mg1_sheet_0, 24, banim_bgl_mg1_2_oam_frame_26_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 25, banim_bgl_mg1_2_oam_frame_27_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 26, banim_bgl_mg1_2_oam_frame_28_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 27, banim_bgl_mg1_2_oam_frame_29_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 28, banim_bgl_mg1_2_oam_frame_30_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 29, banim_bgl_mg1_2_oam_frame_31_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magical_mogall_critical
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 30, banim_bgl_mg1_2_oam_frame_32_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 31, banim_bgl_mg1_2_oam_frame_33_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 32, banim_bgl_mg1_2_oam_frame_34_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 33, banim_bgl_mg1_2_oam_frame_35_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 34, banim_bgl_mg1_2_oam_frame_36_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 35, banim_bgl_mg1_2_oam_frame_37_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 36, banim_bgl_mg1_2_oam_frame_38_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 37, banim_bgl_mg1_2_oam_frame_39_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 38, banim_bgl_mg1_2_oam_frame_40_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 16, banim_bgl_mg1_sheet_2, 39, banim_bgl_mg1_2_oam_frame_41_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 40, banim_bgl_mg1_2_oam_frame_42_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bgl_mg1_sheet_3, 45, banim_bgl_mg1_2_oam_frame_44_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_3, 46, banim_bgl_mg1_2_oam_frame_45_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bgl_mg1_sheet_3, 47, banim_bgl_mg1_2_oam_frame_46_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bgl_mg1_sheet_3, 45, banim_bgl_mg1_2_oam_frame_44_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_3, 46, banim_bgl_mg1_2_oam_frame_45_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bgl_mg1_sheet_3, 47, banim_bgl_mg1_2_oam_frame_46_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bgl_mg1_2_mode_stand_close:
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bgl_mg1_2_mode_stand:
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bgl_mg1_2_mode_stand_range:
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bgl_mg1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_mogall_blink
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 1, banim_bgl_mg1_2_oam_frame_1_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 2, banim_bgl_mg1_2_oam_frame_2_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 30, banim_bgl_mg1_sheet_0, 3, banim_bgl_mg1_2_oam_frame_3_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 8, banim_bgl_mg1_sheet_0, 4, banim_bgl_mg1_2_oam_frame_4_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_0, 5, banim_bgl_mg1_2_oam_frame_5_r - banim_bgl_mg1_2_oam_r
	banim_code_sound_magic_mogall
	banim_code_frame 2, banim_bgl_mg1_sheet_0, 6, banim_bgl_mg1_2_oam_frame_6_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 7, banim_bgl_mg1_2_oam_frame_7_r - banim_bgl_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_cape_flowing
	banim_code_frame 1, banim_bgl_mg1_sheet_1, 8, banim_bgl_mg1_2_oam_frame_8_r - banim_bgl_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_bgl_mg1_sheet_1, 9, banim_bgl_mg1_2_oam_frame_9_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_1, 10, banim_bgl_mg1_2_oam_frame_10_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 11, banim_bgl_mg1_2_oam_frame_11_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 12, banim_bgl_mg1_2_oam_frame_12_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 13, banim_bgl_mg1_2_oam_frame_13_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 14, banim_bgl_mg1_2_oam_frame_14_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 15, banim_bgl_mg1_2_oam_frame_15_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 4, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bgl_mg1_sheet_2, 16, banim_bgl_mg1_2_oam_frame_16_r - banim_bgl_mg1_2_oam_r
	banim_code_frame 1, banim_bgl_mg1_sheet_0, 0, banim_bgl_mg1_2_oam_frame_0_r - banim_bgl_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bgl_mg1_2_mode_attack_close - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_attack_close_back - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_attack_close_critical - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_attack_close_critical_back - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_attack_range - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_attack_range_critical - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_dodge_close - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_dodge_range - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_stand_close - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_stand - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_stand_range - banim_bgl_mg1_2_script
	.word banim_bgl_mg1_2_mode_attack_miss - banim_bgl_mg1_2_script
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

