@ vim:ft=armv4
	.global banim_sagf_mg1_script
	.global banim_sagf_mg1_oam_r
	.global banim_sagf_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x6E
	.section .data.oam_l
banim_sagf_mg1_oam_l:
banim_sagf_mg1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x21, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x23, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x61, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x63, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x0, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x60, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x1, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x14, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x24, -13, -8
	banim_frame_oam 0x4000, 0x5000, 0x64, -13, 8
	banim_frame_oam 0x4000, 0x1000, 0x4, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x6, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x7, -6, -24
	banim_frame_oam 0x0, 0x1000, 0x14, -14, -24
	banim_frame_oam 0x0, 0x1000, 0x34, -16, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x1000, 0x8, -7, -16
	banim_frame_oam 0x0, 0x1000, 0xA, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xB, -15, -24
	banim_frame_oam 0x4000, 0x9000, 0x28, -17, -8
	banim_frame_oam 0x4000, 0x5000, 0x68, -17, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0xD, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0xF, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x10, -12, -24
	banim_frame_oam 0x0, 0x1000, 0x6C, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x2C, 8, -9
	banim_frame_end
banim_sagf_mg1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0x31, -11, -16
	banim_frame_oam 0x8000, 0x1000, 0x33, -19, -16
	banim_frame_oam 0x4000, 0x1000, 0x71, -11, 0
	banim_frame_oam 0x0, 0x1000, 0x73, -19, 0
	banim_frame_oam 0x8000, 0x1000, 0x50, 5, -10
	banim_frame_oam 0x4000, 0x1000, 0x11, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x13, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x30, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE7, -19, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -23, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -23, 8
	banim_frame_oam 0x4000, 0x1000, 0x80, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -20, -16
	banim_frame_oam 0x0, 0x1000, 0x83, -7, -24
	banim_frame_oam 0x0, 0x1000, 0xE9, -17, -24
	banim_frame_oam 0x0, 0x1000, 0x14, -25, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x9000, 0x84, -26, -16
	banim_frame_oam 0x4000, 0x5000, 0xC4, -26, 0
	banim_frame_oam 0x4000, 0x1000, 0xE4, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -25, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0x89, -17, -19
	banim_frame_oam 0x8000, 0x1000, 0x8B, -25, -19
	banim_frame_oam 0x4000, 0x1000, 0xC9, -17, -3
	banim_frame_oam 0x0, 0x1000, 0xCB, -25, -3
	banim_frame_oam 0x8000, 0x1000, 0xA8, -1, -11
	banim_frame_oam 0x0, 0x5000, 0x8C, -17, 5
	banim_frame_oam 0x8000, 0x1000, 0x8E, -25, 5
	banim_frame_oam 0x0, 0x1000, 0x88, -33, -11
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x0, -36, -17
	banim_frame_oam 0x8000, 0x1000, 0x4, -44, -17
	banim_frame_oam 0x0, 0x5000, 0x41, -28, -1
	banim_frame_oam 0x8000, 0x1000, 0x43, -36, -1
	banim_frame_oam 0x0, 0x1000, 0x60, -12, 7
	banim_frame_oam 0x0, 0x1000, 0x40, -22, -25
	banim_frame_oam 0x0, 0x1000, 0x44, -4, -17
	banim_frame_oam 0x0, 0x1000, 0x7B, -30, -25
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x5, -44, -17
	banim_frame_oam 0x4000, 0x1000, 0x45, -28, -1
	banim_frame_oam 0x4000, 0x5000, 0x64, -36, 7
	banim_frame_oam 0x0, 0x1000, 0x44, -4, -17
	banim_frame_oam 0x0, 0x1000, 0x0, -12, -17
	banim_frame_oam 0x0, 0x1000, 0x20, -12, -9
	banim_frame_oam 0x0, 0x1000, 0x40, -22, -25
	banim_frame_oam 0x0, 0x1000, 0x43, -36, -1
	banim_frame_oam 0x0, 0x1000, 0x7B, -30, -25
	banim_frame_end
banim_sagf_mg1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0x4F, -28, -17
	banim_frame_oam 0x4000, 0x1000, 0x47, -44, -17
	banim_frame_oam 0x0, 0x1000, 0x40, -22, -25
	banim_frame_oam 0x8000, 0x1000, 0x0, -12, -17
	banim_frame_oam 0x0, 0x5000, 0x41, -28, -1
	banim_frame_oam 0x8000, 0x1000, 0x43, -36, -1
	banim_frame_oam 0x0, 0x1000, 0x60, -12, 7
	banim_frame_oam 0x0, 0x1000, 0x44, -4, -17
	banim_frame_oam 0x4000, 0x1000, 0x4B, -36, -25
	banim_frame_oam 0x4000, 0x1000, 0x79, -44, -9
	banim_frame_end
banim_sagf_mg1_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x9000, 0x17, -28, -17
	banim_frame_oam 0x8000, 0x1000, 0x19, -36, -17
	banim_frame_oam 0x0, 0x1000, 0x59, -36, -1
	banim_frame_oam 0x8000, 0x1000, 0x3A, -44, -9
	banim_frame_oam 0x0, 0x1000, 0x60, -12, 7
	banim_frame_oam 0x0, 0x1000, 0x63, -36, 7
	banim_frame_oam 0x8000, 0x1000, 0x0, -12, -17
	banim_frame_oam 0x0, 0x1000, 0x44, -4, -17
	banim_frame_oam 0x0, 0x1000, 0x40, -22, -25
	banim_frame_oam 0x0, 0x1000, 0x7B, -30, -25
	banim_frame_end
banim_sagf_mg1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, -28, -17
	banim_frame_oam 0x8000, 0x5000, 0x13, -36, -17
	banim_frame_oam 0x0, 0x1000, 0x60, -12, 7
	banim_frame_oam 0x8000, 0x1000, 0x0, -12, -17
	banim_frame_oam 0x0, 0x1000, 0x40, -22, -25
	banim_frame_oam 0x0, 0x1000, 0x44, -4, -17
	banim_frame_oam 0x0, 0x1000, 0x7B, -30, -25
	banim_frame_end
banim_sagf_mg1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x5000, 0x34, -28, -9
	banim_frame_oam 0x8000, 0x1000, 0x36, -36, -9
	banim_frame_oam 0x4000, 0x1000, 0x74, -28, 7
	banim_frame_oam 0x0, 0x1000, 0x76, -36, 7
	banim_frame_oam 0x4000, 0x1000, 0x14, -28, -17
	banim_frame_oam 0x8000, 0x1000, 0x0, -12, -17
	banim_frame_oam 0x0, 0x1000, 0x60, -12, 7
	banim_frame_oam 0x0, 0x1000, 0x40, -22, -25
	banim_frame_oam 0x0, 0x1000, 0x44, -4, -17
	banim_frame_oam 0x0, 0x1000, 0x7B, -30, -25
	banim_frame_end
banim_sagf_mg1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x5000, 0x30, -12, -16
	banim_frame_oam 0x8000, 0x5000, 0x11, -20, -16
	banim_frame_oam 0x8000, 0x1000, 0x32, -28, -8
	banim_frame_oam 0x0, 0x1000, 0x72, -28, 8
	banim_frame_oam 0x0, 0x1000, 0x12, -36, 0
	banim_frame_end
banim_sagf_mg1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x1000, 0x16, -28, -8
	banim_frame_oam 0x0, 0x5000, 0x13, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0x15, -20, -16
	banim_frame_oam 0x4000, 0x1000, 0x53, -12, 0
	banim_frame_oam 0x0, 0x1000, 0x55, -20, 0
	banim_frame_oam 0x4000, 0x1000, 0x73, -14, 8
	banim_frame_oam 0x0, 0x1000, 0x75, -22, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x9000, 0xC6, -11, 0
	banim_frame_oam 0x4000, 0x1000, 0xA7, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xA9, -11, -8
	banim_frame_oam 0x4000, 0x1000, 0x87, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x89, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x16, 13, -8
	banim_frame_oam 0x0, 0x1000, 0x90, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x7B, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x1000, 0x8A, -7, -15
	banim_frame_oam 0x0, 0x5000, 0xAA, -5, -7
	banim_frame_oam 0x8000, 0x1000, 0xAC, -13, -7
	banim_frame_oam 0x4000, 0x1000, 0xEA, -5, 9
	banim_frame_oam 0x0, 0x1000, 0xEC, -13, 9
	banim_frame_end
banim_sagf_mg1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x1000, 0x8D, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x8F, -8, -16
	banim_frame_oam 0x4000, 0x9000, 0xAD, -11, -8
	banim_frame_oam 0x4000, 0x5000, 0xED, -11, 8
	banim_frame_oam 0x0, 0x1000, 0x90, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x7B, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x1000, 0x91, -4, -16
	banim_frame_oam 0x0, 0x5000, 0xB1, -1, -8
	banim_frame_oam 0x8000, 0x1000, 0xB3, -9, -8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -1, 8
	banim_frame_oam 0x0, 0x1000, 0xF3, -9, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -2, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x9000, 0xB4, -13, -8
	banim_frame_oam 0x4000, 0x5000, 0xF4, -13, 8
	banim_frame_oam 0x4000, 0x1000, 0x94, 3, -16
	banim_frame_oam 0x0, 0x1000, 0x96, -5, -16
	banim_frame_oam 0x0, 0x1000, 0x97, -2, -24
	banim_frame_oam 0x0, 0x1000, 0x7B, -10, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x4, -5, -24
	banim_frame_oam 0x0, 0x1000, 0x95, -13, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_28_l:
	banim_frame_oam 0x4000, 0x9000, 0x24, -12, -8
	banim_frame_oam 0x4000, 0x5000, 0x64, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0x5, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x7, -12, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_29_l:
	banim_frame_oam 0x4000, 0x9000, 0x28, -18, -8
	banim_frame_oam 0x4000, 0x5000, 0x68, -18, 8
	banim_frame_oam 0x4000, 0x1000, 0x9, -6, -16
	banim_frame_oam 0x0, 0x1000, 0xB, -14, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -5, -24
	banim_frame_oam 0x0, 0x1000, 0xC, -22, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x9000, 0x2C, -13, -8
	banim_frame_oam 0x4000, 0x5000, 0x6C, -13, 8
	banim_frame_oam 0x4000, 0x1000, 0xD, -4, -16
	banim_frame_oam 0x0, 0x1000, 0xF, -12, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -11, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -11, 8
	banim_frame_oam 0x4000, 0x1000, 0x80, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x83, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x95, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x9000, 0x30, -12, -8
	banim_frame_oam 0x4000, 0x5000, 0x70, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0x10, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x12, -7, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, -4, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_33_l:
	banim_frame_oam 0x4000, 0x9000, 0xA4, -12, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x86, -8, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0x15, 0, -15
	banim_frame_oam 0x8000, 0x1000, 0x17, -8, -15
	banim_frame_oam 0x4000, 0x1000, 0x55, 0, 1
	banim_frame_oam 0x0, 0x1000, 0x57, -8, 1
	banim_frame_oam 0x4000, 0x1000, 0x75, -2, 9
	banim_frame_oam 0x0, 0x1000, 0x77, -10, 9
	banim_frame_oam 0x8000, 0x1000, 0x34, -16, -13
	banim_frame_oam 0x0, 0x1000, 0x74, -24, -9
	banim_frame_end
banim_sagf_mg1_oam_frame_35_l:
	banim_frame_oam 0x4000, 0x9000, 0xC4, -12, 0
	banim_frame_oam 0x0, 0x5000, 0x88, 4, -16
	banim_frame_oam 0x0, 0x5000, 0xC8, -12, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -11, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -11, 8
	banim_frame_oam 0x4000, 0x1000, 0x80, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x83, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x95, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x1000, 0x8A, -1, -16
	banim_frame_oam 0x0, 0x1000, 0x8C, -9, -16
	banim_frame_oam 0x4000, 0x1000, 0xAA, -5, -8
	banim_frame_oam 0x0, 0x1000, 0xAC, -13, -8
	banim_frame_oam 0x4000, 0x5000, 0xCA, -17, 0
	banim_frame_oam 0x4000, 0x1000, 0xEA, -5, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x8D, -1, -24
	banim_frame_oam 0x0, 0x1000, 0xAD, -9, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0x9000, 0x8E, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x90, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xED, -20, 8
	banim_frame_oam 0x8000, 0x1000, 0x91, -20, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_39_l:
	banim_frame_oam 0x8000, 0x9000, 0x92, -4, -16
	banim_frame_oam 0x8000, 0x1000, 0x94, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0xD1, -20, -16
	banim_frame_oam 0x0, 0x1000, 0xD4, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xF4, -12, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x1000, 0x3, -18, -8
	banim_frame_oam 0x0, 0x1000, 0x43, 3, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -5, -24
	banim_frame_oam 0x0, 0x5000, 0x0, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -2, 0
	banim_frame_oam 0x8000, 0x1000, 0x2, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -10, 0
	banim_frame_oam 0x4000, 0x1000, 0x60, -5, 8
	banim_frame_oam 0x0, 0x1000, 0x62, -13, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -5, -24
	banim_frame_oam 0x0, 0x1000, 0x8, -5, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x6, -7, -16
	banim_frame_oam 0x4000, 0x9000, 0x24, -13, -8
	banim_frame_oam 0x4000, 0x5000, 0x64, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x43, 1, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -4, -26
	banim_frame_oam 0x0, 0x1000, 0x10, -3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -5, -24
	banim_frame_oam 0x0, 0x1000, 0x8, -5, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x6, -7, -16
	banim_frame_oam 0x4000, 0x9000, 0x24, -13, -8
	banim_frame_oam 0x4000, 0x5000, 0x64, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x43, 1, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -4, -26
	banim_frame_oam 0x0, 0x1000, 0x10, -3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_43_l:
	banim_frame_oam 0x4000, 0x1000, 0x4, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x6, -7, -16
	banim_frame_oam 0x4000, 0x9000, 0x24, -13, -8
	banim_frame_oam 0x4000, 0x5000, 0x64, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x28, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_44_l:
	banim_frame_oam 0x4000, 0x1000, 0x4, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x6, -7, -16
	banim_frame_oam 0x4000, 0x9000, 0x24, -13, -8
	banim_frame_oam 0x4000, 0x5000, 0x64, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x28, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x1000, 0x9, -21, -8
	banim_frame_oam 0x8000, 0x9000, 0xA, -5, -16
	banim_frame_oam 0x8000, 0x5000, 0xC, -13, -16
	banim_frame_oam 0x8000, 0x1000, 0x29, 11, -8
	banim_frame_oam 0x0, 0x1000, 0x69, 11, 8
	banim_frame_oam 0x0, 0x1000, 0xD, -21, 8
	banim_frame_oam 0x0, 0x1000, 0x48, -1, -24
	banim_frame_oam 0x0, 0x1000, 0x68, -9, -24
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0xA0, -11, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -11, 8
	banim_frame_oam 0x4000, 0x1000, 0x80, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x83, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x95, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -13, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -13, 8
	banim_frame_oam 0x4000, 0x1000, 0x80, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x83, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -13, 0
	banim_frame_oam 0x0, 0x5000, 0x84, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x86, -7, -16
	banim_frame_oam 0x0, 0x1000, 0xA7, -15, -8
	banim_frame_oam 0x0, 0x1000, 0x83, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_22_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -13, 0
	banim_frame_oam 0x0, 0x5000, 0xC5, -7, -16
	banim_frame_oam 0x0, 0x1000, 0xE4, 9, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -15, -8
	banim_frame_oam 0x0, 0x1000, 0x83, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_23_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -13, 0
	banim_frame_oam 0x0, 0x5000, 0x88, -7, -16
	banim_frame_oam 0x0, 0x1000, 0xAA, -15, -8
	banim_frame_oam 0x0, 0x1000, 0x87, 9, -8
	banim_frame_oam 0x0, 0x1000, 0x83, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -11, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x5000, 0x8B, -5, -16
	banim_frame_oam 0x8000, 0x1000, 0x8D, -13, -16
	banim_frame_oam 0x4000, 0x9000, 0xC7, -13, 0
	banim_frame_oam 0x0, 0x1000, 0x8A, 11, -8
	banim_frame_oam 0x0, 0x1000, 0xCB, -5, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -13, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -36, -17
	banim_frame_oam 0x8000, 0x1000, 0x4, -44, -17
	banim_frame_oam 0x0, 0x5000, 0x41, -28, -1
	banim_frame_oam 0x8000, 0x1000, 0x43, -36, -1
	banim_frame_oam 0x0, 0x1000, 0x60, -12, 7
	banim_frame_oam 0x0, 0x1000, 0x40, -22, -25
	banim_frame_oam 0x0, 0x1000, 0x44, -4, -17
	banim_frame_oam 0x0, 0x1000, 0x7B, -30, -25
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x5, -44, -17
	banim_frame_oam 0x4000, 0x1000, 0x45, -28, -1
	banim_frame_oam 0x4000, 0x5000, 0x64, -36, 7
	banim_frame_oam 0x0, 0x1000, 0x44, -4, -17
	banim_frame_oam 0x0, 0x1000, 0x0, -12, -17
	banim_frame_oam 0x0, 0x1000, 0x20, -12, -9
	banim_frame_oam 0x0, 0x1000, 0x40, -22, -25
	banim_frame_oam 0x0, 0x1000, 0x43, -36, -1
	banim_frame_oam 0x0, 0x1000, 0x7B, -30, -25
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_sagf_mg1_oam_r:
banim_sagf_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x21, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x23, 0, -8
	banim_frame_oam 0x4000, 0x0, 0x61, -16, 8
	banim_frame_oam 0x0, 0x0, 0x63, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -16
	banim_frame_oam 0x0, 0x0, 0x40, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x0, 8, -8
	banim_frame_oam 0x0, 0x0, 0x60, 8, 8
	banim_frame_oam 0x0, 0x0, 0x1, -5, -24
	banim_frame_oam 0x0, 0x0, 0x14, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x24, -19, -8
	banim_frame_oam 0x4000, 0x4000, 0x64, -19, 8
	banim_frame_oam 0x4000, 0x0, 0x4, -16, -16
	banim_frame_oam 0x0, 0x0, 0x6, 0, -16
	banim_frame_oam 0x0, 0x0, 0x7, -2, -24
	banim_frame_oam 0x0, 0x0, 0x14, 6, -24
	banim_frame_oam 0x0, 0x0, 0x34, 8, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x0, 0x8, -9, -16
	banim_frame_oam 0x0, 0x0, 0xA, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xB, -1, -24
	banim_frame_oam 0x4000, 0x8000, 0x28, -15, -8
	banim_frame_oam 0x4000, 0x4000, 0x68, -15, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0xD, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0xF, 8, -16
	banim_frame_oam 0x0, 0x0, 0x10, 4, -24
	banim_frame_oam 0x0, 0x0, 0x6C, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x2C, -16, -9
	banim_frame_end
banim_sagf_mg1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0x31, -5, -16
	banim_frame_oam 0x8000, 0x0, 0x33, 11, -16
	banim_frame_oam 0x4000, 0x0, 0x71, -5, 0
	banim_frame_oam 0x0, 0x0, 0x73, 11, 0
	banim_frame_oam 0x8000, 0x0, 0x50, -13, -10
	banim_frame_oam 0x4000, 0x0, 0x11, -8, 8
	banim_frame_oam 0x0, 0x0, 0x13, 8, 8
	banim_frame_oam 0x0, 0x0, 0x30, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE7, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -9, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -9, 8
	banim_frame_oam 0x4000, 0x0, 0x80, -4, -16
	banim_frame_oam 0x0, 0x0, 0x82, 12, -16
	banim_frame_oam 0x0, 0x0, 0x83, -1, -24
	banim_frame_oam 0x0, 0x0, 0xE9, 9, -24
	banim_frame_oam 0x0, 0x0, 0x14, 17, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x8000, 0x84, -6, -16
	banim_frame_oam 0x4000, 0x4000, 0xC4, -6, 0
	banim_frame_oam 0x4000, 0x0, 0xE4, 1, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 17, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0x89, 1, -19
	banim_frame_oam 0x8000, 0x0, 0x8B, 17, -19
	banim_frame_oam 0x4000, 0x0, 0xC9, 1, -3
	banim_frame_oam 0x0, 0x0, 0xCB, 17, -3
	banim_frame_oam 0x8000, 0x0, 0xA8, -7, -11
	banim_frame_oam 0x0, 0x4000, 0x8C, 1, 5
	banim_frame_oam 0x8000, 0x0, 0x8E, 17, 5
	banim_frame_oam 0x0, 0x0, 0x88, 25, -11
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x0, 4, -17
	banim_frame_oam 0x8000, 0x0, 0x4, 36, -17
	banim_frame_oam 0x0, 0x4000, 0x41, 12, -1
	banim_frame_oam 0x8000, 0x0, 0x43, 28, -1
	banim_frame_oam 0x0, 0x0, 0x60, 4, 7
	banim_frame_oam 0x0, 0x0, 0x40, 14, -25
	banim_frame_oam 0x0, 0x0, 0x44, -4, -17
	banim_frame_oam 0x0, 0x0, 0x7B, 22, -25
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x5, 12, -17
	banim_frame_oam 0x4000, 0x0, 0x45, 12, -1
	banim_frame_oam 0x4000, 0x4000, 0x64, 4, 7
	banim_frame_oam 0x0, 0x0, 0x44, -4, -17
	banim_frame_oam 0x0, 0x0, 0x0, 4, -17
	banim_frame_oam 0x0, 0x0, 0x20, 4, -9
	banim_frame_oam 0x0, 0x0, 0x40, 14, -25
	banim_frame_oam 0x0, 0x0, 0x43, 28, -1
	banim_frame_oam 0x0, 0x0, 0x7B, 22, -25
	banim_frame_end
banim_sagf_mg1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0x4F, 12, -17
	banim_frame_oam 0x4000, 0x0, 0x47, 28, -17
	banim_frame_oam 0x0, 0x0, 0x40, 14, -25
	banim_frame_oam 0x8000, 0x0, 0x0, 4, -17
	banim_frame_oam 0x0, 0x4000, 0x41, 12, -1
	banim_frame_oam 0x8000, 0x0, 0x43, 28, -1
	banim_frame_oam 0x0, 0x0, 0x60, 4, 7
	banim_frame_oam 0x0, 0x0, 0x44, -4, -17
	banim_frame_oam 0x4000, 0x0, 0x4B, 20, -25
	banim_frame_oam 0x4000, 0x0, 0x79, 28, -9
	banim_frame_end
banim_sagf_mg1_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x8000, 0x17, 12, -17
	banim_frame_oam 0x8000, 0x0, 0x19, 28, -17
	banim_frame_oam 0x0, 0x0, 0x59, 28, -1
	banim_frame_oam 0x8000, 0x0, 0x3A, 36, -9
	banim_frame_oam 0x0, 0x0, 0x60, 4, 7
	banim_frame_oam 0x0, 0x0, 0x63, 28, 7
	banim_frame_oam 0x8000, 0x0, 0x0, 4, -17
	banim_frame_oam 0x0, 0x0, 0x44, -4, -17
	banim_frame_oam 0x0, 0x0, 0x40, 14, -25
	banim_frame_oam 0x0, 0x0, 0x7B, 22, -25
	banim_frame_end
banim_sagf_mg1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, 12, -17
	banim_frame_oam 0x8000, 0x4000, 0x13, 28, -17
	banim_frame_oam 0x0, 0x0, 0x60, 4, 7
	banim_frame_oam 0x8000, 0x0, 0x0, 4, -17
	banim_frame_oam 0x0, 0x0, 0x40, 14, -25
	banim_frame_oam 0x0, 0x0, 0x44, -4, -17
	banim_frame_oam 0x0, 0x0, 0x7B, 22, -25
	banim_frame_end
banim_sagf_mg1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x4000, 0x34, 12, -9
	banim_frame_oam 0x8000, 0x0, 0x36, 28, -9
	banim_frame_oam 0x4000, 0x0, 0x74, 12, 7
	banim_frame_oam 0x0, 0x0, 0x76, 28, 7
	banim_frame_oam 0x4000, 0x0, 0x14, 12, -17
	banim_frame_oam 0x8000, 0x0, 0x0, 4, -17
	banim_frame_oam 0x0, 0x0, 0x60, 4, 7
	banim_frame_oam 0x0, 0x0, 0x40, 14, -25
	banim_frame_oam 0x0, 0x0, 0x44, -4, -17
	banim_frame_oam 0x0, 0x0, 0x7B, 22, -25
	banim_frame_end
banim_sagf_mg1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x4000, 0x30, 4, -16
	banim_frame_oam 0x8000, 0x4000, 0x11, 12, -16
	banim_frame_oam 0x8000, 0x0, 0x32, 20, -8
	banim_frame_oam 0x0, 0x0, 0x72, 20, 8
	banim_frame_oam 0x0, 0x0, 0x12, 28, 0
	banim_frame_end
banim_sagf_mg1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x0, 0x16, 20, -8
	banim_frame_oam 0x0, 0x4000, 0x13, -4, -16
	banim_frame_oam 0x8000, 0x0, 0x15, 12, -16
	banim_frame_oam 0x4000, 0x0, 0x53, -4, 0
	banim_frame_oam 0x0, 0x0, 0x55, 12, 0
	banim_frame_oam 0x4000, 0x0, 0x73, -2, 8
	banim_frame_oam 0x0, 0x0, 0x75, 14, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x8000, 0xC6, -21, 0
	banim_frame_oam 0x4000, 0x0, 0xA7, -13, -8
	banim_frame_oam 0x0, 0x0, 0xA9, 3, -8
	banim_frame_oam 0x4000, 0x0, 0x87, -16, -16
	banim_frame_oam 0x0, 0x0, 0x89, 0, -16
	banim_frame_oam 0x0, 0x0, 0x16, -21, -8
	banim_frame_oam 0x0, 0x0, 0x90, -5, -24
	banim_frame_oam 0x0, 0x0, 0x7B, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x0, 0x8A, -9, -15
	banim_frame_oam 0x0, 0x4000, 0xAA, -11, -7
	banim_frame_oam 0x8000, 0x0, 0xAC, 5, -7
	banim_frame_oam 0x4000, 0x0, 0xEA, -11, 9
	banim_frame_oam 0x0, 0x0, 0xEC, 5, 9
	banim_frame_end
banim_sagf_mg1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x0, 0x8D, -16, -16
	banim_frame_oam 0x0, 0x0, 0x8F, 0, -16
	banim_frame_oam 0x4000, 0x8000, 0xAD, -21, -8
	banim_frame_oam 0x4000, 0x4000, 0xED, -21, 8
	banim_frame_oam 0x0, 0x0, 0x90, -5, -24
	banim_frame_oam 0x0, 0x0, 0x7B, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x0, 0x91, -12, -16
	banim_frame_oam 0x0, 0x4000, 0xB1, -15, -8
	banim_frame_oam 0x8000, 0x0, 0xB3, 1, -8
	banim_frame_oam 0x4000, 0x0, 0xF1, -15, 8
	banim_frame_oam 0x0, 0x0, 0xF3, 1, 8
	banim_frame_oam 0x0, 0x0, 0x93, -6, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x8000, 0xB4, -19, -8
	banim_frame_oam 0x4000, 0x4000, 0xF4, -19, 8
	banim_frame_oam 0x4000, 0x0, 0x94, -19, -16
	banim_frame_oam 0x0, 0x0, 0x96, -3, -16
	banim_frame_oam 0x0, 0x0, 0x97, -6, -24
	banim_frame_oam 0x0, 0x0, 0x7B, 2, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -20, -16
	banim_frame_oam 0x0, 0x0, 0x4, -3, -24
	banim_frame_oam 0x0, 0x0, 0x95, 5, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_28_r:
	banim_frame_oam 0x4000, 0x8000, 0x24, -20, -8
	banim_frame_oam 0x4000, 0x4000, 0x64, -20, 8
	banim_frame_oam 0x4000, 0x0, 0x5, -12, -16
	banim_frame_oam 0x0, 0x0, 0x7, 4, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_29_r:
	banim_frame_oam 0x4000, 0x8000, 0x28, -14, -8
	banim_frame_oam 0x4000, 0x4000, 0x68, -14, 8
	banim_frame_oam 0x4000, 0x0, 0x9, -10, -16
	banim_frame_oam 0x0, 0x0, 0xB, 6, -16
	banim_frame_oam 0x0, 0x0, 0x8, -3, -24
	banim_frame_oam 0x0, 0x0, 0xC, 14, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x8000, 0x2C, -19, -8
	banim_frame_oam 0x4000, 0x4000, 0x6C, -19, 8
	banim_frame_oam 0x4000, 0x0, 0xD, -12, -16
	banim_frame_oam 0x0, 0x0, 0xF, 4, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -21, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -21, 8
	banim_frame_oam 0x4000, 0x0, 0x80, -17, -16
	banim_frame_oam 0x0, 0x0, 0x82, -1, -16
	banim_frame_oam 0x0, 0x0, 0x83, -5, -24
	banim_frame_oam 0x0, 0x0, 0x95, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x8000, 0x30, -20, -8
	banim_frame_oam 0x4000, 0x4000, 0x70, -20, 8
	banim_frame_oam 0x4000, 0x0, 0x10, -17, -16
	banim_frame_oam 0x0, 0x0, 0x12, -1, -16
	banim_frame_oam 0x4000, 0x0, 0x13, -12, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_33_r:
	banim_frame_oam 0x4000, 0x8000, 0xA4, -20, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -20, 8
	banim_frame_oam 0x4000, 0x0, 0x84, -16, -16
	banim_frame_oam 0x0, 0x0, 0x86, 0, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0x15, -16, -15
	banim_frame_oam 0x8000, 0x0, 0x17, 0, -15
	banim_frame_oam 0x4000, 0x0, 0x55, -16, 1
	banim_frame_oam 0x0, 0x0, 0x57, 0, 1
	banim_frame_oam 0x4000, 0x0, 0x75, -14, 9
	banim_frame_oam 0x0, 0x0, 0x77, 2, 9
	banim_frame_oam 0x8000, 0x0, 0x34, 8, -13
	banim_frame_oam 0x0, 0x0, 0x74, 16, -9
	banim_frame_end
banim_sagf_mg1_oam_frame_35_r:
	banim_frame_oam 0x4000, 0x8000, 0xC4, -20, 0
	banim_frame_oam 0x0, 0x4000, 0x88, -20, -16
	banim_frame_oam 0x0, 0x4000, 0xC8, -4, -16
	banim_frame_end
banim_sagf_mg1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -21, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -21, 8
	banim_frame_oam 0x4000, 0x0, 0x80, -17, -16
	banim_frame_oam 0x0, 0x0, 0x82, -1, -16
	banim_frame_oam 0x0, 0x0, 0x83, -5, -24
	banim_frame_oam 0x0, 0x0, 0x95, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x0, 0x8A, -15, -16
	banim_frame_oam 0x0, 0x0, 0x8C, 1, -16
	banim_frame_oam 0x4000, 0x0, 0xAA, -11, -8
	banim_frame_oam 0x0, 0x0, 0xAC, 5, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -15, 0
	banim_frame_oam 0x4000, 0x0, 0xEA, -11, 8
	banim_frame_oam 0x0, 0x0, 0xEC, 5, 8
	banim_frame_oam 0x0, 0x0, 0x8D, -7, -24
	banim_frame_oam 0x0, 0x0, 0xAD, 1, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0x8000, 0x8E, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x90, 4, -16
	banim_frame_oam 0x0, 0x0, 0xED, 12, 8
	banim_frame_oam 0x8000, 0x0, 0x91, 12, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_39_r:
	banim_frame_oam 0x8000, 0x8000, 0x92, -12, -16
	banim_frame_oam 0x8000, 0x0, 0x94, 4, -15
	banim_frame_oam 0x8000, 0x0, 0xD1, 12, -16
	banim_frame_oam 0x0, 0x0, 0xD4, 12, 0
	banim_frame_oam 0x0, 0x0, 0xF4, 4, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x0, 0x3, 10, -8
	banim_frame_oam 0x0, 0x0, 0x43, -11, -24
	banim_frame_oam 0x0, 0x0, 0x63, -3, -24
	banim_frame_oam 0x0, 0x4000, 0x0, -14, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -14, 0
	banim_frame_oam 0x8000, 0x0, 0x2, 2, -16
	banim_frame_oam 0x0, 0x0, 0x42, 2, 0
	banim_frame_oam 0x4000, 0x0, 0x60, -11, 8
	banim_frame_oam 0x0, 0x0, 0x62, 5, 8
	banim_frame_end
banim_sagf_mg1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x0, 0x7, -3, -24
	banim_frame_oam 0x0, 0x0, 0x8, -3, -16
	banim_frame_oam 0x4000, 0x0, 0x4, -17, -16
	banim_frame_oam 0x0, 0x0, 0x6, -1, -16
	banim_frame_oam 0x4000, 0x8000, 0x24, -19, -8
	banim_frame_oam 0x4000, 0x4000, 0x64, -19, 8
	banim_frame_oam 0x0, 0x0, 0x43, -9, -24
	banim_frame_oam 0x0, 0x0, 0x10, -4, -26
	banim_frame_oam 0x0, 0x0, 0x10, -5, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x0, 0x7, -3, -24
	banim_frame_oam 0x0, 0x0, 0x8, -3, -16
	banim_frame_oam 0x4000, 0x0, 0x4, -17, -16
	banim_frame_oam 0x0, 0x0, 0x6, -1, -16
	banim_frame_oam 0x4000, 0x8000, 0x24, -19, -8
	banim_frame_oam 0x4000, 0x4000, 0x64, -19, 8
	banim_frame_oam 0x0, 0x0, 0x43, -9, -24
	banim_frame_oam 0x0, 0x0, 0x10, -4, -26
	banim_frame_oam 0x0, 0x0, 0x10, -5, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_43_r:
	banim_frame_oam 0x4000, 0x0, 0x4, -17, -16
	banim_frame_oam 0x0, 0x0, 0x6, -1, -16
	banim_frame_oam 0x4000, 0x8000, 0x24, -19, -8
	banim_frame_oam 0x4000, 0x4000, 0x64, -19, 8
	banim_frame_oam 0x0, 0x0, 0x28, -5, -24
	banim_frame_oam 0x0, 0x0, 0x10, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_44_r:
	banim_frame_oam 0x4000, 0x0, 0x4, -17, -16
	banim_frame_oam 0x0, 0x0, 0x6, -1, -16
	banim_frame_oam 0x4000, 0x8000, 0x24, -19, -8
	banim_frame_oam 0x4000, 0x4000, 0x64, -19, 8
	banim_frame_oam 0x0, 0x0, 0x28, -5, -24
	banim_frame_oam 0x0, 0x0, 0x10, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x0, 0x9, 13, -8
	banim_frame_oam 0x8000, 0x8000, 0xA, -11, -16
	banim_frame_oam 0x8000, 0x4000, 0xC, 5, -16
	banim_frame_oam 0x8000, 0x0, 0x29, -19, -8
	banim_frame_oam 0x0, 0x0, 0x69, -19, 8
	banim_frame_oam 0x0, 0x0, 0xD, 13, 8
	banim_frame_oam 0x0, 0x0, 0x48, -7, -24
	banim_frame_oam 0x0, 0x0, 0x68, 1, -24
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0xA0, -21, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -21, 8
	banim_frame_oam 0x4000, 0x0, 0x80, -17, -16
	banim_frame_oam 0x0, 0x0, 0x82, -1, -16
	banim_frame_oam 0x0, 0x0, 0x83, -5, -24
	banim_frame_oam 0x0, 0x0, 0x95, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -19, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -19, 8
	banim_frame_oam 0x4000, 0x0, 0x80, -17, -16
	banim_frame_oam 0x0, 0x0, 0x82, -1, -16
	banim_frame_oam 0x0, 0x0, 0x83, -5, -24
	banim_frame_oam 0x0, 0x0, 0x10, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -19, 0
	banim_frame_oam 0x0, 0x4000, 0x84, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x86, -1, -16
	banim_frame_oam 0x0, 0x0, 0xA7, 7, -8
	banim_frame_oam 0x0, 0x0, 0x83, -5, -24
	banim_frame_oam 0x0, 0x0, 0x10, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_22_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -19, 0
	banim_frame_oam 0x0, 0x4000, 0xC5, -9, -16
	banim_frame_oam 0x0, 0x0, 0xE4, -17, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 7, -8
	banim_frame_oam 0x0, 0x0, 0x83, -5, -24
	banim_frame_oam 0x0, 0x0, 0x10, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_23_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -19, 0
	banim_frame_oam 0x0, 0x4000, 0x88, -9, -16
	banim_frame_oam 0x0, 0x0, 0xAA, 7, -8
	banim_frame_oam 0x0, 0x0, 0x87, -17, -8
	banim_frame_oam 0x0, 0x0, 0x83, -5, -24
	banim_frame_oam 0x0, 0x0, 0x10, 3, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x4000, 0x8B, -11, -16
	banim_frame_oam 0x8000, 0x0, 0x8D, 5, -16
	banim_frame_oam 0x4000, 0x8000, 0xC7, -19, 0
	banim_frame_oam 0x0, 0x0, 0x8A, -19, -8
	banim_frame_oam 0x0, 0x0, 0xCB, -3, -24
	banim_frame_oam 0x0, 0x0, 0x10, 5, -24
	banim_frame_end
banim_sagf_mg1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sagf_mg1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, 4, -17
	banim_frame_oam 0x8000, 0x0, 0x4, 36, -17
	banim_frame_oam 0x0, 0x4000, 0x41, 12, -1
	banim_frame_oam 0x8000, 0x0, 0x43, 28, -1
	banim_frame_oam 0x0, 0x0, 0x60, 4, 7
	banim_frame_oam 0x0, 0x0, 0x40, 14, -25
	banim_frame_oam 0x0, 0x0, 0x44, -4, -17
	banim_frame_oam 0x0, 0x0, 0x7B, 22, -25
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x5, 12, -17
	banim_frame_oam 0x4000, 0x0, 0x45, 12, -1
	banim_frame_oam 0x4000, 0x4000, 0x64, 4, 7
	banim_frame_oam 0x0, 0x0, 0x44, -4, -17
	banim_frame_oam 0x0, 0x0, 0x0, 4, -17
	banim_frame_oam 0x0, 0x0, 0x20, 4, -9
	banim_frame_oam 0x0, 0x0, 0x40, 14, -25
	banim_frame_oam 0x0, 0x0, 0x43, 28, -1
	banim_frame_oam 0x0, 0x0, 0x7B, 22, -25
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_sagf_mg1_script:
banim_sagf_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 1, banim_sagf_mg1_oam_frame_1_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 2, banim_sagf_mg1_oam_frame_2_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_sagf_mg1_sheet_0, 3, banim_sagf_mg1_oam_frame_3_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 4, banim_sagf_mg1_oam_frame_4_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 11, banim_sagf_mg1_sheet_0, 5, banim_sagf_mg1_oam_frame_5_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 6, banim_sagf_mg1_oam_frame_6_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 7, banim_sagf_mg1_oam_frame_7_r - banim_sagf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_cape_flowing
	banim_code_frame 1, banim_sagf_mg1_sheet_1, 50, banim_sagf_mg1_oam_frame_8_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 10, banim_sagf_mg1_oam_frame_9_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 11, banim_sagf_mg1_oam_frame_10_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 12, banim_sagf_mg1_oam_frame_11_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 13, banim_sagf_mg1_oam_frame_12_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 14, banim_sagf_mg1_oam_frame_13_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 15, banim_sagf_mg1_oam_frame_14_r - banim_sagf_mg1_oam_r
	banim_code_frame 2, banim_sagf_mg1_sheet_1, 17, banim_sagf_mg1_oam_frame_15_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 19, banim_sagf_mg1_oam_frame_16_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 20, banim_sagf_mg1_oam_frame_17_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_1, 18, banim_sagf_mg1_oam_frame_18_r - banim_sagf_mg1_oam_r
	banim_code_frame 6, banim_sagf_mg1_sheet_1, 16, banim_sagf_mg1_oam_frame_19_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 41, banim_sagf_mg1_oam_frame_20_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 42, banim_sagf_mg1_oam_frame_21_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 43, banim_sagf_mg1_oam_frame_22_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_sagf_mg1_sheet_2, 44, banim_sagf_mg1_oam_frame_23_r - banim_sagf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagf_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 11, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_cape_flowing
	banim_code_frame 1, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 2, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 6, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagf_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 21, banim_sagf_mg1_oam_frame_27_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 22, banim_sagf_mg1_oam_frame_28_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 23, banim_sagf_mg1_oam_frame_29_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 24, banim_sagf_mg1_oam_frame_30_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_3, 25, banim_sagf_mg1_oam_frame_31_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 26, banim_sagf_mg1_oam_frame_32_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 27, banim_sagf_mg1_oam_frame_33_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 28, banim_sagf_mg1_oam_frame_34_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 29, banim_sagf_mg1_oam_frame_35_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_3, 30, banim_sagf_mg1_oam_frame_36_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 31, banim_sagf_mg1_oam_frame_37_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 32, banim_sagf_mg1_oam_frame_38_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 33, banim_sagf_mg1_oam_frame_39_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_2, 34, banim_sagf_mg1_oam_frame_40_r - banim_sagf_mg1_oam_r
	banim_code_frame 10, banim_sagf_mg1_sheet_2, 35, banim_sagf_mg1_oam_frame_41_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_2, 36, banim_sagf_mg1_oam_frame_42_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_2, 37, banim_sagf_mg1_oam_frame_43_r - banim_sagf_mg1_oam_r
	banim_code_frame 12, banim_sagf_mg1_sheet_2, 38, banim_sagf_mg1_oam_frame_44_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 2, banim_sagf_mg1_oam_frame_2_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_sagf_mg1_sheet_0, 3, banim_sagf_mg1_oam_frame_3_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 4, banim_sagf_mg1_oam_frame_4_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 11, banim_sagf_mg1_sheet_0, 5, banim_sagf_mg1_oam_frame_5_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 6, banim_sagf_mg1_oam_frame_6_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 7, banim_sagf_mg1_oam_frame_7_r - banim_sagf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_cape_flowing
	banim_code_frame 1, banim_sagf_mg1_sheet_1, 50, banim_sagf_mg1_oam_frame_8_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 10, banim_sagf_mg1_oam_frame_9_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 11, banim_sagf_mg1_oam_frame_10_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 12, banim_sagf_mg1_oam_frame_11_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 13, banim_sagf_mg1_oam_frame_12_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 14, banim_sagf_mg1_oam_frame_13_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 15, banim_sagf_mg1_oam_frame_14_r - banim_sagf_mg1_oam_r
	banim_code_frame 2, banim_sagf_mg1_sheet_1, 17, banim_sagf_mg1_oam_frame_15_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 19, banim_sagf_mg1_oam_frame_16_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 20, banim_sagf_mg1_oam_frame_17_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_1, 18, banim_sagf_mg1_oam_frame_18_r - banim_sagf_mg1_oam_r
	banim_code_frame 6, banim_sagf_mg1_sheet_1, 16, banim_sagf_mg1_oam_frame_19_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 41, banim_sagf_mg1_oam_frame_20_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 42, banim_sagf_mg1_oam_frame_21_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 43, banim_sagf_mg1_oam_frame_22_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_sagf_mg1_sheet_2, 44, banim_sagf_mg1_oam_frame_23_r - banim_sagf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagf_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 48, banim_sagf_mg1_oam_frame_45_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 10, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 12, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 11, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_cape_flowing
	banim_code_frame 1, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 2, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 6, banim_sagf_mg1_sheet_1, 47, banim_sagf_mg1_oam_frame_25_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 46, banim_sagf_mg1_oam_frame_24_r - banim_sagf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_sagf_mg1_sheet_2, 49, banim_sagf_mg1_oam_frame_26_r - banim_sagf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagf_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 1, banim_sagf_mg1_oam_frame_1_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 2, banim_sagf_mg1_oam_frame_2_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_sagf_mg1_sheet_0, 3, banim_sagf_mg1_oam_frame_3_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 4, banim_sagf_mg1_oam_frame_4_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 11, banim_sagf_mg1_sheet_0, 5, banim_sagf_mg1_oam_frame_5_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 6, banim_sagf_mg1_oam_frame_6_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 7, banim_sagf_mg1_oam_frame_7_r - banim_sagf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_cape_flowing
	banim_code_frame 1, banim_sagf_mg1_sheet_1, 50, banim_sagf_mg1_oam_frame_8_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 10, banim_sagf_mg1_oam_frame_9_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 11, banim_sagf_mg1_oam_frame_10_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 12, banim_sagf_mg1_oam_frame_11_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 13, banim_sagf_mg1_oam_frame_12_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 14, banim_sagf_mg1_oam_frame_13_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 15, banim_sagf_mg1_oam_frame_14_r - banim_sagf_mg1_oam_r
	banim_code_frame 2, banim_sagf_mg1_sheet_1, 17, banim_sagf_mg1_oam_frame_15_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 19, banim_sagf_mg1_oam_frame_16_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 20, banim_sagf_mg1_oam_frame_17_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_1, 18, banim_sagf_mg1_oam_frame_18_r - banim_sagf_mg1_oam_r
	banim_code_frame 6, banim_sagf_mg1_sheet_1, 16, banim_sagf_mg1_oam_frame_19_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 41, banim_sagf_mg1_oam_frame_20_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 42, banim_sagf_mg1_oam_frame_21_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 43, banim_sagf_mg1_oam_frame_22_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_sagf_mg1_sheet_2, 44, banim_sagf_mg1_oam_frame_23_r - banim_sagf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagf_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 21, banim_sagf_mg1_oam_frame_27_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_critical
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 22, banim_sagf_mg1_oam_frame_28_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 23, banim_sagf_mg1_oam_frame_29_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 24, banim_sagf_mg1_oam_frame_30_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_3, 25, banim_sagf_mg1_oam_frame_31_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 26, banim_sagf_mg1_oam_frame_32_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 27, banim_sagf_mg1_oam_frame_33_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 28, banim_sagf_mg1_oam_frame_34_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 29, banim_sagf_mg1_oam_frame_35_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_3, 30, banim_sagf_mg1_oam_frame_36_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 31, banim_sagf_mg1_oam_frame_37_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_3, 32, banim_sagf_mg1_oam_frame_38_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_3, 33, banim_sagf_mg1_oam_frame_39_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_2, 34, banim_sagf_mg1_oam_frame_40_r - banim_sagf_mg1_oam_r
	banim_code_frame 10, banim_sagf_mg1_sheet_2, 35, banim_sagf_mg1_oam_frame_41_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_2, 36, banim_sagf_mg1_oam_frame_42_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_2, 37, banim_sagf_mg1_oam_frame_43_r - banim_sagf_mg1_oam_r
	banim_code_frame 12, banim_sagf_mg1_sheet_2, 38, banim_sagf_mg1_oam_frame_44_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 2, banim_sagf_mg1_oam_frame_2_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_sagf_mg1_sheet_0, 3, banim_sagf_mg1_oam_frame_3_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 4, banim_sagf_mg1_oam_frame_4_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 11, banim_sagf_mg1_sheet_0, 5, banim_sagf_mg1_oam_frame_5_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 6, banim_sagf_mg1_oam_frame_6_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 7, banim_sagf_mg1_oam_frame_7_r - banim_sagf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_cape_flowing
	banim_code_frame 1, banim_sagf_mg1_sheet_1, 50, banim_sagf_mg1_oam_frame_8_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 10, banim_sagf_mg1_oam_frame_9_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 11, banim_sagf_mg1_oam_frame_10_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 12, banim_sagf_mg1_oam_frame_11_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 13, banim_sagf_mg1_oam_frame_12_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 14, banim_sagf_mg1_oam_frame_13_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 15, banim_sagf_mg1_oam_frame_14_r - banim_sagf_mg1_oam_r
	banim_code_frame 2, banim_sagf_mg1_sheet_1, 17, banim_sagf_mg1_oam_frame_15_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 19, banim_sagf_mg1_oam_frame_16_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 20, banim_sagf_mg1_oam_frame_17_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_1, 18, banim_sagf_mg1_oam_frame_18_r - banim_sagf_mg1_oam_r
	banim_code_frame 6, banim_sagf_mg1_sheet_1, 16, banim_sagf_mg1_oam_frame_19_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 41, banim_sagf_mg1_oam_frame_20_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 42, banim_sagf_mg1_oam_frame_21_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 43, banim_sagf_mg1_oam_frame_22_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_sagf_mg1_sheet_2, 44, banim_sagf_mg1_oam_frame_23_r - banim_sagf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagf_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 45, banim_sagf_mg1_oam_frame_46_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 39, banim_sagf_mg1_oam_frame_47_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 45, banim_sagf_mg1_oam_frame_46_r - banim_sagf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagf_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 45, banim_sagf_mg1_oam_frame_46_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 39, banim_sagf_mg1_oam_frame_47_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 45, banim_sagf_mg1_oam_frame_46_r - banim_sagf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sagf_mg1_mode_stand_close:
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sagf_mg1_mode_stand:
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sagf_mg1_mode_stand_range:
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sagf_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 1, banim_sagf_mg1_oam_frame_1_r - banim_sagf_mg1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 2, banim_sagf_mg1_oam_frame_2_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 7, banim_sagf_mg1_sheet_0, 3, banim_sagf_mg1_oam_frame_3_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_0, 4, banim_sagf_mg1_oam_frame_4_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 11, banim_sagf_mg1_sheet_0, 5, banim_sagf_mg1_oam_frame_5_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 6, banim_sagf_mg1_oam_frame_6_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_0, 7, banim_sagf_mg1_oam_frame_7_r - banim_sagf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_cape_flowing
	banim_code_frame 1, banim_sagf_mg1_sheet_1, 50, banim_sagf_mg1_oam_frame_8_r - banim_sagf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 10, banim_sagf_mg1_oam_frame_9_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 11, banim_sagf_mg1_oam_frame_10_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 12, banim_sagf_mg1_oam_frame_11_r - banim_sagf_mg1_oam_r
	banim_code_frame 4, banim_sagf_mg1_sheet_1, 13, banim_sagf_mg1_oam_frame_12_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 14, banim_sagf_mg1_oam_frame_13_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 15, banim_sagf_mg1_oam_frame_14_r - banim_sagf_mg1_oam_r
	banim_code_frame 2, banim_sagf_mg1_sheet_1, 17, banim_sagf_mg1_oam_frame_15_r - banim_sagf_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 19, banim_sagf_mg1_oam_frame_16_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_1, 20, banim_sagf_mg1_oam_frame_17_r - banim_sagf_mg1_oam_r
	banim_code_frame 8, banim_sagf_mg1_sheet_1, 18, banim_sagf_mg1_oam_frame_18_r - banim_sagf_mg1_oam_r
	banim_code_frame 6, banim_sagf_mg1_sheet_1, 16, banim_sagf_mg1_oam_frame_19_r - banim_sagf_mg1_oam_r
	banim_code_frame 3, banim_sagf_mg1_sheet_2, 41, banim_sagf_mg1_oam_frame_20_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 42, banim_sagf_mg1_oam_frame_21_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_2, 43, banim_sagf_mg1_oam_frame_22_r - banim_sagf_mg1_oam_r
	banim_code_frame 1, banim_sagf_mg1_sheet_0, 0, banim_sagf_mg1_oam_frame_0_r - banim_sagf_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_sagf_mg1_sheet_2, 44, banim_sagf_mg1_oam_frame_23_r - banim_sagf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_sagf_mg1_mode_attack_close - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_attack_close_back - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_attack_close_critical - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_attack_close_critical_back - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_attack_range - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_attack_range_critical - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_dodge_close - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_dodge_range - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_stand_close - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_stand - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_stand_range - banim_sagf_mg1_script
	.word banim_sagf_mg1_mode_attack_miss - banim_sagf_mg1_script
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

