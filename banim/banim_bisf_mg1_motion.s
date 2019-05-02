@ vim:ft=armv4
	.global banim_bisf_mg1_script
	.global banim_bisf_mg1_oam_r
	.global banim_bisf_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x82
	.section .data.oam_l
banim_bisf_mg1_oam_l:
banim_bisf_mg1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -4, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -12, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x89, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x8B, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xC8, -7, -24
	banim_frame_oam 0x8000, 0x1000, 0x88, 12, -21
	banim_frame_oam 0x0, 0x1000, 0xE7, 1, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, -10, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, -18, -16
	banim_frame_oam 0x8000, 0x1000, 0xCC, 6, -8
	banim_frame_oam 0x0, 0x5000, 0x8C, 6, -24
	banim_frame_oam 0x0, 0x1000, 0xCD, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xED, -10, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, -10, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, -18, -16
	banim_frame_oam 0x8000, 0x1000, 0xCC, 6, -8
	banim_frame_oam 0x4000, 0x1000, 0xED, -10, -24
	banim_frame_oam 0x0, 0x5000, 0xAE, 6, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, -5, -16
	banim_frame_oam 0x8000, 0x5000, 0x11, -13, -16
	banim_frame_oam 0x4000, 0x1000, 0x8E, -5, -24
	banim_frame_oam 0x0, 0x1000, 0x90, -13, -24
	banim_frame_oam 0x0, 0x1000, 0xEF, -21, -5
	banim_frame_oam 0x0, 0x1000, 0xB0, 11, -14
	banim_frame_end
banim_bisf_mg1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0x63, -14, -36
	banim_frame_oam 0x4000, 0x1000, 0xA3, -14, -20
	banim_frame_oam 0x0, 0x1000, 0xE1, 2, -31
	banim_frame_oam 0x0, 0x1000, 0xE2, 2, -39
	banim_frame_oam 0x0, 0x1000, 0x62, -12, 8
	banim_frame_oam 0x8000, 0x1000, 0x3, -20, -16
	banim_frame_oam 0x0, 0x1000, 0x43, -20, 0
	banim_frame_oam 0x8000, 0x9000, 0x0, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x24, -3, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0x80, -8, -36
	banim_frame_oam 0x8000, 0x1000, 0x82, -16, -36
	banim_frame_oam 0x4000, 0x1000, 0xC0, -8, -20
	banim_frame_oam 0x0, 0x1000, 0xC2, -16, -20
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, -28
	banim_frame_oam 0x0, 0x1000, 0x62, -12, 8
	banim_frame_oam 0x8000, 0x1000, 0x3, -20, -16
	banim_frame_oam 0x0, 0x1000, 0x43, -20, 0
	banim_frame_oam 0x8000, 0x9000, 0x0, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, -12, -16
	banim_frame_end
banim_bisf_mg1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x62, -12, 8
	banim_frame_oam 0x8000, 0x1000, 0x3, -20, -16
	banim_frame_oam 0x0, 0x1000, 0x43, -20, 0
	banim_frame_oam 0x4000, 0x9000, 0x6, -17, -38
	banim_frame_oam 0x4000, 0x5000, 0x44, -17, -22
	banim_frame_oam 0x0, 0x1000, 0x48, -17, -14
	banim_frame_oam 0x8000, 0x9000, 0x0, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, -12, -16
	banim_frame_end
banim_bisf_mg1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, -12, -16
	banim_frame_oam 0x0, 0x5000, 0x4, -11, -32
	banim_frame_oam 0x8000, 0x1000, 0x3, -20, -16
	banim_frame_oam 0x0, 0x1000, 0x43, -20, 0
	banim_frame_end
banim_bisf_mg1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0x52, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x54, -16, 0
	banim_frame_oam 0x4000, 0x9000, 0x12, -14, -16
	banim_frame_oam 0x4000, 0x1000, 0x16, -6, -24
	banim_frame_oam 0x0, 0x1000, 0x18, -14, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0x36, -2, -24
	banim_frame_oam 0x8000, 0x1000, 0x38, -10, -24
	banim_frame_oam 0x4000, 0x1000, 0x76, -2, -8
	banim_frame_oam 0x0, 0x1000, 0x78, -10, -8
	banim_frame_oam 0x8000, 0x1000, 0x55, -18, -18
	banim_frame_oam 0x0, 0x5000, 0x52, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x54, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x91, 14, -16
	banim_frame_end
banim_bisf_mg1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0x19, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0x1B, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0x59, -4, -8
	banim_frame_oam 0x0, 0x1000, 0x5B, -12, -8
	banim_frame_oam 0x0, 0x5000, 0x79, -4, 0
	banim_frame_oam 0x8000, 0x1000, 0x7B, -12, 0
	banim_frame_oam 0x4000, 0x1000, 0xF0, 12, -16
	banim_frame_end
banim_bisf_mg1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, -4, -24
	banim_frame_oam 0x8000, 0x5000, 0x1E, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0x9C, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x9E, -12, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x92, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x96, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x98, -12, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x5000, 0xD5, 0, -27
	banim_frame_oam 0x8000, 0x9000, 0x92, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x96, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x98, -12, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0xD7, 0, -27
	banim_frame_oam 0x8000, 0x9000, 0x92, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x96, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x98, -12, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x9000, 0x85, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x87, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0xC4, -20, -8
	banim_frame_oam 0x4000, 0x1000, 0x65, -2, -24
	banim_frame_oam 0x0, 0x1000, 0x67, -10, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x1000, 0xC3, 6, -45
	banim_frame_oam 0x4000, 0x1000, 0x88, -9, -24
	banim_frame_oam 0x4000, 0x0, 0x88, 12, -24
	banim_frame_oam 0x4000, 0x9000, 0xA8, -6, -40
	banim_frame_oam 0x4000, 0x5000, 0xE8, -6, -24
	banim_frame_oam 0x8000, 0x9000, 0x85, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x87, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0xC4, -20, -8
	banim_frame_oam 0x4000, 0x1000, 0x65, -2, -24
	banim_frame_oam 0x0, 0x1000, 0x67, -10, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -19, -40
	banim_frame_oam 0x4000, 0x9000, 0xCC, -19, -8
	banim_frame_oam 0x4000, 0x1000, 0x8A, -5, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -13, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x1000, 0xC3, -8, -62
	banim_frame_oam 0x4000, 0x1000, 0x88, -43, -29
	banim_frame_oam 0x4000, 0x0, 0x88, 18, -29
	banim_frame_oam 0x0, 0x9000, 0xE, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x12, -24, -44
	banim_frame_oam 0x4000, 0x5000, 0x8D, -16, -12
	banim_frame_oam 0x0, 0x1000, 0x91, -24, -12
	banim_frame_oam 0x4000, 0x9000, 0xCC, -19, -8
	banim_frame_oam 0x4000, 0x1000, 0x8A, -5, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -13, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0xC7, -7, -5
	banim_frame_oam 0x8000, 0x1000, 0xBE, -14, -17
	banim_frame_oam 0x0, 0x1000, 0xBD, -6, -1
	banim_frame_oam 0x0, 0x1000, 0xDD, -6, -9
	banim_frame_oam 0x0, 0x1000, 0xFD, -1, 7
	banim_frame_oam 0x8000, 0x9000, 0x6, -5, -17
	banim_frame_oam 0x8000, 0x5000, 0x8, -13, -17
	banim_frame_oam 0x0, 0x1000, 0x87, -7, -25
	banim_frame_oam 0x0, 0x1000, 0xE7, 1, -25
	banim_frame_end
banim_bisf_mg1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0xE8, -12, -10
	banim_frame_oam 0x8000, 0x1000, 0xBE, -16, -19
	banim_frame_oam 0x0, 0x1000, 0xBD, -8, -3
	banim_frame_oam 0x0, 0x1000, 0xDD, -8, -11
	banim_frame_oam 0x0, 0x1000, 0xFD, -3, 5
	banim_frame_oam 0x8000, 0x9000, 0x9, -4, -18
	banim_frame_oam 0x8000, 0x5000, 0xB, -12, -18
	banim_frame_oam 0x0, 0x1000, 0xA7, -8, -26
	banim_frame_oam 0x0, 0x1000, 0xE7, 0, -26
	banim_frame_end
banim_bisf_mg1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bisf_mg1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bisf_mg1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x1000, 0x1D, -12, -24
	banim_frame_oam 0x0, 0x5000, 0xBA, -4, -16
	banim_frame_oam 0x8000, 0x1000, 0xBC, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0xFA, -4, 0
	banim_frame_oam 0x0, 0x1000, 0xFC, -12, 0
	banim_frame_oam 0x0, 0x1000, 0xF9, 12, 0
	banim_frame_oam 0x0, 0x1000, 0xB9, 4, -24
	banim_frame_oam 0x0, 0x1000, 0xD9, 4, 8
	banim_frame_oam 0x4000, 0x1000, 0x9D, -12, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x1000, 0x58, -9, -15
	banim_frame_oam 0x0, 0x1000, 0x75, -17, -8
	banim_frame_oam 0x8000, 0x9000, 0x92, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x96, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x98, -12, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_bisf_mg1_oam_r:
banim_bisf_mg1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 4, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -12, 8
	banim_frame_oam 0x0, 0x0, 0x82, 4, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x89, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x8B, 4, -16
	banim_frame_oam 0x0, 0x0, 0xC8, -1, -24
	banim_frame_oam 0x8000, 0x0, 0x88, -20, -21
	banim_frame_oam 0x0, 0x0, 0xE7, -9, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -6, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, 10, -16
	banim_frame_oam 0x8000, 0x0, 0xCC, -14, -8
	banim_frame_oam 0x0, 0x4000, 0x8C, -22, -24
	banim_frame_oam 0x0, 0x0, 0xCD, -20, -32
	banim_frame_oam 0x4000, 0x0, 0xED, -6, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -6, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, 10, -16
	banim_frame_oam 0x8000, 0x0, 0xCC, -14, -8
	banim_frame_oam 0x4000, 0x0, 0xED, -6, -24
	banim_frame_oam 0x0, 0x4000, 0xAE, -22, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -11, -16
	banim_frame_oam 0x8000, 0x4000, 0x11, 5, -16
	banim_frame_oam 0x4000, 0x0, 0x8E, -11, -24
	banim_frame_oam 0x0, 0x0, 0x90, 5, -24
	banim_frame_oam 0x0, 0x0, 0xEF, 13, -5
	banim_frame_oam 0x0, 0x0, 0xB0, -19, -14
	banim_frame_end
banim_bisf_mg1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0x63, -2, -36
	banim_frame_oam 0x4000, 0x0, 0xA3, -2, -20
	banim_frame_oam 0x0, 0x0, 0xE1, -10, -31
	banim_frame_oam 0x0, 0x0, 0xE2, -10, -39
	banim_frame_oam 0x0, 0x0, 0x62, 4, 8
	banim_frame_oam 0x8000, 0x0, 0x3, 12, -16
	banim_frame_oam 0x0, 0x0, 0x43, 12, 0
	banim_frame_oam 0x8000, 0x8000, 0x0, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, 4, -16
	banim_frame_oam 0x0, 0x0, 0x24, -5, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0x80, -8, -36
	banim_frame_oam 0x8000, 0x0, 0x82, 8, -36
	banim_frame_oam 0x4000, 0x0, 0xC0, -8, -20
	banim_frame_oam 0x0, 0x0, 0xC2, 8, -20
	banim_frame_oam 0x0, 0x0, 0xE0, -16, -28
	banim_frame_oam 0x0, 0x0, 0x62, 4, 8
	banim_frame_oam 0x8000, 0x0, 0x3, 12, -16
	banim_frame_oam 0x0, 0x0, 0x43, 12, 0
	banim_frame_oam 0x8000, 0x8000, 0x0, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, 4, -16
	banim_frame_end
banim_bisf_mg1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x62, 4, 8
	banim_frame_oam 0x8000, 0x0, 0x3, 12, -16
	banim_frame_oam 0x0, 0x0, 0x43, 12, 0
	banim_frame_oam 0x4000, 0x8000, 0x6, -15, -38
	banim_frame_oam 0x4000, 0x4000, 0x44, -15, -22
	banim_frame_oam 0x0, 0x0, 0x48, 9, -14
	banim_frame_oam 0x8000, 0x8000, 0x0, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, 4, -16
	banim_frame_end
banim_bisf_mg1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, 4, -16
	banim_frame_oam 0x0, 0x4000, 0x4, -5, -32
	banim_frame_oam 0x8000, 0x0, 0x3, 12, -16
	banim_frame_oam 0x0, 0x0, 0x43, 12, 0
	banim_frame_end
banim_bisf_mg1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0x52, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x54, 8, 0
	banim_frame_oam 0x4000, 0x8000, 0x12, -18, -16
	banim_frame_oam 0x4000, 0x0, 0x16, -10, -24
	banim_frame_oam 0x0, 0x0, 0x18, 6, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0x36, -14, -24
	banim_frame_oam 0x8000, 0x0, 0x38, 2, -24
	banim_frame_oam 0x4000, 0x0, 0x76, -14, -8
	banim_frame_oam 0x0, 0x0, 0x78, 2, -8
	banim_frame_oam 0x8000, 0x0, 0x55, 10, -18
	banim_frame_oam 0x0, 0x4000, 0x52, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x54, 8, 0
	banim_frame_oam 0x0, 0x0, 0x91, -22, -16
	banim_frame_end
banim_bisf_mg1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0x19, -12, -24
	banim_frame_oam 0x8000, 0x0, 0x1B, 4, -24
	banim_frame_oam 0x4000, 0x0, 0x59, -12, -8
	banim_frame_oam 0x0, 0x0, 0x5B, 4, -8
	banim_frame_oam 0x0, 0x4000, 0x79, -12, 0
	banim_frame_oam 0x8000, 0x0, 0x7B, 4, 0
	banim_frame_oam 0x4000, 0x0, 0xF0, -28, -16
	banim_frame_end
banim_bisf_mg1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x1E, 4, -24
	banim_frame_oam 0x4000, 0x0, 0x9C, -12, 8
	banim_frame_oam 0x0, 0x0, 0x9E, 4, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x92, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, 4, -16
	banim_frame_oam 0x4000, 0x0, 0x96, -12, -24
	banim_frame_oam 0x0, 0x0, 0x98, 4, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x4000, 0xD5, -16, -27
	banim_frame_oam 0x8000, 0x8000, 0x92, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, 4, -16
	banim_frame_oam 0x4000, 0x0, 0x96, -12, -24
	banim_frame_oam 0x0, 0x0, 0x98, 4, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0xD7, -16, -27
	banim_frame_oam 0x8000, 0x8000, 0x92, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, 4, -16
	banim_frame_oam 0x4000, 0x0, 0x96, -12, -24
	banim_frame_oam 0x0, 0x0, 0x98, 4, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x8000, 0x85, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x87, 4, -16
	banim_frame_oam 0x8000, 0x0, 0xC4, 12, -8
	banim_frame_oam 0x4000, 0x0, 0x65, -14, -24
	banim_frame_oam 0x0, 0x0, 0x67, 2, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x0, 0xC3, -14, -45
	banim_frame_oam 0x4000, 0x0, 0x88, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x88, -28, -24
	banim_frame_oam 0x4000, 0x8000, 0xA8, -26, -40
	banim_frame_oam 0x4000, 0x4000, 0xE8, -26, -24
	banim_frame_oam 0x8000, 0x8000, 0x85, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x87, 4, -16
	banim_frame_oam 0x8000, 0x0, 0xC4, 12, -8
	banim_frame_oam 0x4000, 0x0, 0x65, -14, -24
	banim_frame_oam 0x0, 0x0, 0x67, 2, -24
	banim_frame_end
banim_bisf_mg1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -13, -40
	banim_frame_oam 0x4000, 0x8000, 0xCC, -13, -8
	banim_frame_oam 0x4000, 0x0, 0x8A, -11, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 5, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x0, 0xC3, 0, -62
	banim_frame_oam 0x4000, 0x0, 0x88, 27, -29
	banim_frame_oam 0x4000, 0x1000, 0x88, -34, -29
	banim_frame_oam 0x0, 0x8000, 0xE, -16, -44
	banim_frame_oam 0x8000, 0x4000, 0x12, 16, -44
	banim_frame_oam 0x4000, 0x4000, 0x8D, -16, -12
	banim_frame_oam 0x0, 0x0, 0x91, 16, -12
	banim_frame_oam 0x4000, 0x8000, 0xCC, -13, -8
	banim_frame_oam 0x4000, 0x0, 0x8A, -11, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 5, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0xC7, -1, -5
	banim_frame_oam 0x8000, 0x0, 0xBE, 6, -17
	banim_frame_oam 0x0, 0x0, 0xBD, -2, -1
	banim_frame_oam 0x0, 0x0, 0xDD, -2, -9
	banim_frame_oam 0x0, 0x0, 0xFD, -7, 7
	banim_frame_oam 0x8000, 0x8000, 0x6, -11, -17
	banim_frame_oam 0x8000, 0x4000, 0x8, 5, -17
	banim_frame_oam 0x0, 0x0, 0x87, -1, -25
	banim_frame_oam 0x0, 0x0, 0xE7, -9, -25
	banim_frame_end
banim_bisf_mg1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0xE8, 4, -10
	banim_frame_oam 0x8000, 0x0, 0xBE, 8, -19
	banim_frame_oam 0x0, 0x0, 0xBD, 0, -3
	banim_frame_oam 0x0, 0x0, 0xDD, 0, -11
	banim_frame_oam 0x0, 0x0, 0xFD, -5, 5
	banim_frame_oam 0x8000, 0x8000, 0x9, -12, -18
	banim_frame_oam 0x8000, 0x4000, 0xB, 4, -18
	banim_frame_oam 0x0, 0x0, 0xA7, 0, -26
	banim_frame_oam 0x0, 0x0, 0xE7, -8, -26
	banim_frame_end
banim_bisf_mg1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bisf_mg1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bisf_mg1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x0, 0x1D, -4, -24
	banim_frame_oam 0x0, 0x4000, 0xBA, -12, -16
	banim_frame_oam 0x8000, 0x0, 0xBC, 4, -16
	banim_frame_oam 0x4000, 0x0, 0xFA, -12, 0
	banim_frame_oam 0x0, 0x0, 0xFC, 4, 0
	banim_frame_oam 0x0, 0x0, 0xF9, -20, 0
	banim_frame_oam 0x0, 0x0, 0xB9, -12, -24
	banim_frame_oam 0x0, 0x0, 0xD9, -12, 8
	banim_frame_oam 0x4000, 0x0, 0x9D, -4, 8
	banim_frame_end
banim_bisf_mg1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x0, 0x58, 1, -15
	banim_frame_oam 0x0, 0x0, 0x75, 9, -8
	banim_frame_oam 0x8000, 0x8000, 0x92, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, 4, -16
	banim_frame_oam 0x4000, 0x0, 0x96, -12, -24
	banim_frame_oam 0x0, 0x0, 0x98, 4, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_bisf_mg1_script:
banim_bisf_mg1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_oam_frame_1_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_oam_frame_2_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_oam_frame_3_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_oam_frame_2_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_oam_frame_3_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_oam_frame_2_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 4, banim_bisf_mg1_oam_frame_4_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 5, banim_bisf_mg1_oam_frame_6_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 6, banim_bisf_mg1_oam_frame_7_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 7, banim_bisf_mg1_oam_frame_8_r - banim_bisf_mg1_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 9, banim_bisf_mg1_oam_frame_9_r - banim_bisf_mg1_oam_r
	banim_code_frame 6, banim_bisf_mg1_sheet_0, 10, banim_bisf_mg1_oam_frame_10_r - banim_bisf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 11, banim_bisf_mg1_oam_frame_11_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 24, banim_bisf_mg1_oam_frame_12_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 12, banim_bisf_mg1_oam_frame_13_r - banim_bisf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 6, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 25, banim_bisf_mg1_oam_frame_16_r - banim_bisf_mg1_oam_r
	banim_code_frame 13, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 15, banim_bisf_mg1_oam_frame_19_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 15, banim_bisf_mg1_oam_frame_19_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 15, banim_bisf_mg1_oam_frame_19_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 17, banim_bisf_mg1_oam_frame_20_r - banim_bisf_mg1_oam_r
	banim_code_frame 2, banim_bisf_mg1_sheet_1, 16, banim_bisf_mg1_oam_frame_21_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 17, banim_bisf_mg1_oam_frame_20_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 16, banim_bisf_mg1_oam_frame_21_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 17, banim_bisf_mg1_oam_frame_20_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 16, banim_bisf_mg1_oam_frame_21_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 17, banim_bisf_mg1_oam_frame_20_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 4, banim_bisf_mg1_oam_frame_4_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 5, banim_bisf_mg1_oam_frame_6_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 5, banim_bisf_mg1_oam_frame_6_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 6, banim_bisf_mg1_oam_frame_7_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 7, banim_bisf_mg1_oam_frame_8_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 18, banim_bisf_mg1_oam_frame_22_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 19, banim_bisf_mg1_oam_frame_23_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 9, banim_bisf_mg1_oam_frame_9_r - banim_bisf_mg1_oam_r
	banim_code_frame 5, banim_bisf_mg1_sheet_0, 10, banim_bisf_mg1_oam_frame_10_r - banim_bisf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 11, banim_bisf_mg1_oam_frame_11_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 24, banim_bisf_mg1_oam_frame_12_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 12, banim_bisf_mg1_oam_frame_13_r - banim_bisf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 13, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 2, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 5, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 22, banim_bisf_mg1_oam_frame_14_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_1, 23, banim_bisf_mg1_oam_frame_15_r - banim_bisf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_oam_frame_1_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_oam_frame_2_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_oam_frame_3_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_oam_frame_2_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_oam_frame_3_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_oam_frame_2_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 4, banim_bisf_mg1_oam_frame_4_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 5, banim_bisf_mg1_oam_frame_6_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 6, banim_bisf_mg1_oam_frame_7_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 7, banim_bisf_mg1_oam_frame_8_r - banim_bisf_mg1_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 9, banim_bisf_mg1_oam_frame_9_r - banim_bisf_mg1_oam_r
	banim_code_frame 6, banim_bisf_mg1_sheet_0, 10, banim_bisf_mg1_oam_frame_10_r - banim_bisf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 11, banim_bisf_mg1_oam_frame_11_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 24, banim_bisf_mg1_oam_frame_12_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 12, banim_bisf_mg1_oam_frame_13_r - banim_bisf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 25, banim_bisf_mg1_oam_frame_16_r - banim_bisf_mg1_oam_r
	banim_code_frame 13, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 15, banim_bisf_mg1_oam_frame_19_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 14, banim_bisf_mg1_oam_frame_18_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 15, banim_bisf_mg1_oam_frame_19_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 13, banim_bisf_mg1_oam_frame_17_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 15, banim_bisf_mg1_oam_frame_19_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 17, banim_bisf_mg1_oam_frame_20_r - banim_bisf_mg1_oam_r
	banim_code_frame 2, banim_bisf_mg1_sheet_1, 16, banim_bisf_mg1_oam_frame_21_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 17, banim_bisf_mg1_oam_frame_20_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 16, banim_bisf_mg1_oam_frame_21_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 17, banim_bisf_mg1_oam_frame_20_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 16, banim_bisf_mg1_oam_frame_21_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 17, banim_bisf_mg1_oam_frame_20_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 4, banim_bisf_mg1_oam_frame_4_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 5, banim_bisf_mg1_oam_frame_6_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 5, banim_bisf_mg1_oam_frame_6_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 6, banim_bisf_mg1_oam_frame_7_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 7, banim_bisf_mg1_oam_frame_8_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 18, banim_bisf_mg1_oam_frame_22_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 19, banim_bisf_mg1_oam_frame_23_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 9, banim_bisf_mg1_oam_frame_9_r - banim_bisf_mg1_oam_r
	banim_code_frame 5, banim_bisf_mg1_sheet_0, 10, banim_bisf_mg1_oam_frame_10_r - banim_bisf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 11, banim_bisf_mg1_oam_frame_11_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 24, banim_bisf_mg1_oam_frame_12_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 12, banim_bisf_mg1_oam_frame_13_r - banim_bisf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 20, banim_bisf_mg1_oam_frame_24_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 21, banim_bisf_mg1_oam_frame_25_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 20, banim_bisf_mg1_oam_frame_24_r - banim_bisf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 20, banim_bisf_mg1_oam_frame_24_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 21, banim_bisf_mg1_oam_frame_25_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 20, banim_bisf_mg1_oam_frame_24_r - banim_bisf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bisf_mg1_mode_stand_close:
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bisf_mg1_mode_stand:
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bisf_mg1_mode_stand_range:
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bisf_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 0, banim_bisf_mg1_oam_frame_0_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 1, banim_bisf_mg1_oam_frame_1_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_oam_frame_2_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_oam_frame_3_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_oam_frame_2_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 3, banim_bisf_mg1_oam_frame_3_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 2, banim_bisf_mg1_oam_frame_2_r - banim_bisf_mg1_oam_r
	banim_code_frame 7, banim_bisf_mg1_sheet_0, 4, banim_bisf_mg1_oam_frame_4_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 5, banim_bisf_mg1_oam_frame_6_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 6, banim_bisf_mg1_oam_frame_7_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 8, banim_bisf_mg1_oam_frame_5_r - banim_bisf_mg1_oam_r
	banim_code_frame 1, banim_bisf_mg1_sheet_1, 7, banim_bisf_mg1_oam_frame_8_r - banim_bisf_mg1_oam_r
	banim_code_frame 4, banim_bisf_mg1_sheet_0, 9, banim_bisf_mg1_oam_frame_9_r - banim_bisf_mg1_oam_r
	banim_code_frame 6, banim_bisf_mg1_sheet_0, 10, banim_bisf_mg1_oam_frame_10_r - banim_bisf_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_bisf_mg1_sheet_0, 11, banim_bisf_mg1_oam_frame_11_r - banim_bisf_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_bisf_mg1_sheet_0, 24, banim_bisf_mg1_oam_frame_12_r - banim_bisf_mg1_oam_r
	banim_code_frame 3, banim_bisf_mg1_sheet_0, 12, banim_bisf_mg1_oam_frame_13_r - banim_bisf_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bisf_mg1_mode_attack_close - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_attack_close_back - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_attack_close_critical - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_attack_close_critical_back - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_attack_range - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_attack_range_critical - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_dodge_close - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_dodge_range - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_stand_close - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_stand - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_stand_range - banim_bisf_mg1_script
	.word banim_bisf_mg1_mode_attack_miss - banim_bisf_mg1_script
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

