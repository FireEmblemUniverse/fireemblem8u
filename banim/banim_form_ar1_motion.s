@ vim:ft=armv4
	.global banim_form_ar1_script
	.global banim_form_ar1_oam_r
	.global banim_form_ar1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x2E
	.section .data.oam_l
banim_form_ar1_oam_l:
banim_form_ar1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -3, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -11, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -19, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 13, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -2, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -24, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -24, -23
	banim_frame_oam 0x8000, 0x1000, 0xBA, 1, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, 1, 1
	banim_frame_oam 0x0, 0x5000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -11, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -15, -16
	banim_frame_end
banim_form_ar1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -5, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -13, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -21, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 11, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -4, 0
	banim_frame_oam 0x0, 0x9000, 0x27, -23, -15
	banim_frame_oam 0x4000, 0x1000, 0x9, -23, -23
	banim_frame_oam 0x8000, 0x1000, 0x62, -31, -20
	banim_frame_oam 0x0, 0x5000, 0x0, -10, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -18, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -13, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -17, -16
	banim_frame_end
banim_form_ar1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xDB, -15, -21
	banim_frame_oam 0x8000, 0x1000, 0xDF, -23, -21
	banim_frame_oam 0x0, 0x5000, 0x40, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -4, 0
	banim_frame_oam 0x0, 0x9000, 0x27, -23, -15
	banim_frame_oam 0x4000, 0x1000, 0x9, -23, -23
	banim_frame_oam 0x8000, 0x1000, 0x62, -31, -20
	banim_frame_oam 0x0, 0x5000, 0x0, -10, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -18, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -13, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -17, -16
	banim_frame_end
banim_form_ar1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -7, -23
	banim_frame_oam 0x0, 0x1000, 0x17, -19, -11
	banim_frame_oam 0x0, 0x5000, 0xD2, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xF4, -20, -8
	banim_frame_oam 0x8000, 0x1000, 0xD1, 0, -32
	banim_frame_oam 0x0, 0x5000, 0x40, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -6, 0
	banim_frame_oam 0x0, 0x9000, 0x2B, -23, -15
	banim_frame_oam 0x8000, 0x5000, 0x2F, -31, -15
	banim_frame_oam 0x4000, 0x1000, 0xE, -31, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -12, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -20, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -15, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -19, -16
	banim_frame_end
banim_form_ar1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -10, -23
	banim_frame_oam 0x0, 0x1000, 0x17, -22, -11
	banim_frame_oam 0x0, 0x5000, 0xD2, -15, -16
	banim_frame_oam 0x0, 0x1000, 0xF4, -23, -8
	banim_frame_oam 0x8000, 0x1000, 0xD1, -3, -32
	banim_frame_oam 0x0, 0x5000, 0x40, -15, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -9, 0
	banim_frame_oam 0x0, 0x9000, 0x30, -23, -16
	banim_frame_oam 0x8000, 0x5000, 0x34, -31, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, -31, -24
	banim_frame_oam 0x8000, 0x1000, 0x62, -39, -16
	banim_frame_oam 0x0, 0x1000, 0x95, -39, 8
	banim_frame_oam 0x0, 0x5000, 0x0, -15, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -23, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -18, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -22, -16
	banim_frame_end
banim_form_ar1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -10, -21
	banim_frame_oam 0x0, 0x1000, 0x17, -22, -9
	banim_frame_oam 0x0, 0x5000, 0xD2, -16, -13
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, -5
	banim_frame_oam 0x8000, 0x1000, 0xD1, -4, -29
	banim_frame_oam 0x0, 0x5000, 0x40, -16, -15
	banim_frame_oam 0x0, 0x1000, 0x80, -10, 1
	banim_frame_oam 0x0, 0x9000, 0x36, -30, -16
	banim_frame_oam 0x8000, 0x5000, 0x3A, -38, -16
	banim_frame_oam 0x8000, 0x5000, 0x15, 2, -24
	banim_frame_oam 0x0, 0x1000, 0x16, -6, -24
	banim_frame_oam 0x4000, 0x1000, 0x18, -30, -24
	banim_frame_oam 0x0, 0x1000, 0x1A, -38, -24
	banim_frame_oam 0x0, 0x1000, 0x42, -14, -39
	banim_frame_oam 0x0, 0x5000, 0xC3, -16, -31
	banim_frame_oam 0x0, 0x1000, 0xE5, -24, -23
	banim_frame_oam 0x0, 0x1000, 0xBF, -22, -16
	banim_frame_end
banim_form_ar1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -12, -21
	banim_frame_oam 0x0, 0x1000, 0x17, -24, -9
	banim_frame_oam 0x0, 0x5000, 0xD2, -18, -13
	banim_frame_oam 0x0, 0x1000, 0xF4, -26, -5
	banim_frame_oam 0x8000, 0x1000, 0xD1, -6, -29
	banim_frame_oam 0x0, 0x5000, 0x40, -18, -15
	banim_frame_oam 0x0, 0x1000, 0x80, -12, 1
	banim_frame_oam 0x0, 0x9000, 0x3B, -28, -14
	banim_frame_oam 0x8000, 0x5000, 0x3F, -36, -14
	banim_frame_oam 0x4000, 0x1000, 0x1B, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0x1E, -36, -22
	banim_frame_oam 0x0, 0x1000, 0x1D, 4, -6
	banim_frame_oam 0x0, 0x5000, 0xC3, -18, -31
	banim_frame_oam 0x0, 0x1000, 0xE5, -26, -23
	banim_frame_oam 0x0, 0x1000, 0x3, -16, -36
	banim_frame_oam 0x0, 0x1000, 0xBF, -24, -17
	banim_frame_end
banim_form_ar1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0x12, -10, -27
	banim_frame_oam 0x0, 0x1000, 0x17, -22, -15
	banim_frame_oam 0x4000, 0x1000, 0xE0, -17, -33
	banim_frame_oam 0x0, 0x1000, 0xE2, -25, -33
	banim_frame_oam 0x0, 0x5000, 0xD2, -16, -19
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, -11
	banim_frame_oam 0x8000, 0x1000, 0xD1, -4, -35
	banim_frame_oam 0x0, 0x5000, 0xAC, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, -1
	banim_frame_oam 0x0, 0x9000, 0x3B, -28, -14
	banim_frame_oam 0x8000, 0x5000, 0x3F, -36, -14
	banim_frame_oam 0x4000, 0x1000, 0x1B, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0x1E, -36, -22
	banim_frame_oam 0x0, 0x1000, 0x1D, 4, -6
	banim_frame_oam 0x0, 0x5000, 0xAA, -18, -32
	banim_frame_oam 0x8000, 0x1000, 0xA9, -26, -32
	banim_frame_oam 0x0, 0x1000, 0x3, -22, -37
	banim_frame_end
banim_form_ar1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x12, -11, -27
	banim_frame_oam 0x0, 0x1000, 0x17, -23, -15
	banim_frame_oam 0x4000, 0x1000, 0xE0, -18, -33
	banim_frame_oam 0x0, 0x1000, 0xE2, -26, -33
	banim_frame_oam 0x0, 0x5000, 0xD2, -17, -19
	banim_frame_oam 0x0, 0x1000, 0xF4, -25, -11
	banim_frame_oam 0x8000, 0x1000, 0xD1, -5, -35
	banim_frame_oam 0x0, 0x5000, 0xAC, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -14, -1
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x8000, 0x1000, 0xB8, -8, -15
	banim_frame_oam 0x4000, 0x1000, 0xF7, -8, 1
	banim_frame_oam 0x0, 0x5000, 0xAA, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0xA9, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x3, -23, -37
	banim_frame_end
banim_form_ar1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x1000, 0x12, -11, -27
	banim_frame_oam 0x0, 0x1000, 0x17, -23, -15
	banim_frame_oam 0x4000, 0x5000, 0xB1, -24, -46
	banim_frame_oam 0x4000, 0x1000, 0xB5, -12, -38
	banim_frame_oam 0x0, 0x1000, 0xD4, -20, -38
	banim_frame_oam 0x0, 0x5000, 0xD2, -17, -19
	banim_frame_oam 0x0, 0x1000, 0xF4, -25, -11
	banim_frame_oam 0x8000, 0x1000, 0xD1, -5, -35
	banim_frame_oam 0x0, 0x5000, 0xAC, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -14, -1
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x1000, 0x42, -23, -40
	banim_frame_oam 0x8000, 0x1000, 0xB8, -8, -15
	banim_frame_oam 0x4000, 0x1000, 0xF7, -8, 1
	banim_frame_oam 0x0, 0x5000, 0xAA, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0xA9, -27, -32
	banim_frame_end
banim_form_ar1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x1000, 0x12, -11, -27
	banim_frame_oam 0x0, 0x1000, 0x17, -23, -15
	banim_frame_oam 0x4000, 0x1000, 0xEC, -5, -44
	banim_frame_oam 0x0, 0x1000, 0xEE, -5, -36
	banim_frame_oam 0x0, 0x5000, 0xD2, -17, -19
	banim_frame_oam 0x0, 0x1000, 0xF4, -25, -11
	banim_frame_oam 0x8000, 0x1000, 0xD1, -5, -35
	banim_frame_oam 0x0, 0x5000, 0xAC, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -14, -1
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x1000, 0x42, -23, -40
	banim_frame_oam 0x8000, 0x1000, 0xBA, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, -10, 1
	banim_frame_oam 0x0, 0x5000, 0xAA, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0xA9, -27, -32
	banim_frame_end
banim_form_ar1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x1000, 0x12, -11, -27
	banim_frame_oam 0x0, 0x1000, 0x17, -23, -15
	banim_frame_oam 0x4000, 0x1000, 0xEC, -5, -44
	banim_frame_oam 0x0, 0x1000, 0xEE, -5, -36
	banim_frame_oam 0x0, 0x5000, 0xD2, -17, -19
	banim_frame_oam 0x0, 0x1000, 0xF4, -25, -11
	banim_frame_oam 0x8000, 0x1000, 0xD1, -5, -35
	banim_frame_oam 0x0, 0x5000, 0xAC, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -14, -1
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x1000, 0x42, -23, -40
	banim_frame_oam 0x8000, 0x1000, 0xB7, -9, -15
	banim_frame_oam 0x0, 0x1000, 0xD6, -13, 1
	banim_frame_oam 0x0, 0x5000, 0xAA, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0xA9, -27, -32
	banim_frame_end
banim_form_ar1_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x1000, 0xD5, -2, -39
	banim_frame_oam 0x0, 0x1000, 0xF6, -10, -31
	banim_frame_oam 0x0, 0x1000, 0x12, -11, -28
	banim_frame_oam 0x0, 0x1000, 0x17, -22, -17
	banim_frame_oam 0x0, 0x5000, 0xD2, -16, -21
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, -13
	banim_frame_oam 0x8000, 0x1000, 0xD1, -4, -37
	banim_frame_oam 0x0, 0x5000, 0xAC, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -14, -1
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x1000, 0x42, -23, -40
	banim_frame_oam 0x8000, 0x1000, 0xB9, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xF9, -10, 1
	banim_frame_oam 0x0, 0x5000, 0xAF, -27, -32
	banim_frame_oam 0x8000, 0x1000, 0xAE, -11, -32
	banim_frame_end
banim_form_ar1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x1000, 0xE9, -3, -28
	banim_frame_oam 0x0, 0x1000, 0xEB, -11, -28
	banim_frame_oam 0x0, 0x1000, 0x12, -11, -28
	banim_frame_oam 0x0, 0x1000, 0x17, -22, -17
	banim_frame_oam 0x0, 0x5000, 0xD2, -16, -21
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, -13
	banim_frame_oam 0x8000, 0x1000, 0xD1, -4, -37
	banim_frame_oam 0x0, 0x5000, 0xAC, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -14, -1
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x1000, 0x42, -23, -40
	banim_frame_oam 0x8000, 0x1000, 0xB9, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xF9, -10, 1
	banim_frame_oam 0x0, 0x5000, 0xAF, -27, -32
	banim_frame_oam 0x8000, 0x1000, 0xAE, -11, -32
	banim_frame_end
banim_form_ar1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x1000, 0x85, -2, -27
	banim_frame_oam 0x0, 0x1000, 0x87, -10, -27
	banim_frame_oam 0x8000, 0x1000, 0x5, -7, -32
	banim_frame_oam 0x0, 0x7000, 0xD, -7, -23
	banim_frame_oam 0x0, 0x7000, 0x4D, -7, -39
	banim_frame_oam 0x0, 0x7000, 0xF, -23, -23
	banim_frame_oam 0x4000, 0x1000, 0xA2, -23, -27
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x1000, 0x45, -21, -40
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x6, -23, -32
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x1000, 0x85, -8, -27
	banim_frame_oam 0x0, 0x1000, 0x87, -16, -27
	banim_frame_oam 0x0, 0x1000, 0x1F, -13, -36
	banim_frame_oam 0x0, 0x1000, 0x55, -20, -29
	banim_frame_oam 0x8000, 0x3000, 0x7F, -16, -21
	banim_frame_oam 0x8000, 0x9000, 0x8, -12, -45
	banim_frame_oam 0x0, 0x5000, 0x88, -12, -13
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x4000, 0x1000, 0xA2, -29, -27
	banim_frame_oam 0x0, 0x1000, 0x45, -21, -40
	banim_frame_oam 0x0, 0x5000, 0x6, -23, -32
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x1000, 0x85, -11, -27
	banim_frame_oam 0x0, 0x1000, 0x87, -19, -27
	banim_frame_oam 0x0, 0x1000, 0x1F, -14, -36
	banim_frame_oam 0x0, 0x1000, 0x55, -21, -29
	banim_frame_oam 0x8000, 0x3000, 0x7F, -17, -21
	banim_frame_oam 0x8000, 0x9000, 0x8, -12, -45
	banim_frame_oam 0x0, 0x5000, 0x88, -12, -13
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x4000, 0x1000, 0xA2, -32, -27
	banim_frame_oam 0x0, 0x1000, 0x45, -21, -40
	banim_frame_oam 0x0, 0x5000, 0x6, -23, -32
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, -11, -25
	banim_frame_oam 0x8000, 0x1000, 0x13, -3, -41
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x1000, 0x45, -21, -40
	banim_frame_oam 0x0, 0x5000, 0x6, -23, -32
	banim_frame_oam 0x4000, 0x1000, 0xE2, -36, -27
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x1000, 0x4, -15, -41
	banim_frame_oam 0x0, 0x5000, 0xD, -14, -48
	banim_frame_oam 0x0, 0x5000, 0x4D, -14, -32
	banim_frame_oam 0x0, 0x5000, 0xF, -30, -48
	banim_frame_oam 0x0, 0x5000, 0x4A, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x45, -26, -40
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x1000, 0x0, -32, -24
	banim_frame_oam 0x0, 0x5000, 0xB, -26, -32
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x1000, 0x53, -12, -42
	banim_frame_oam 0x0, 0x5000, 0xD, -12, -46
	banim_frame_oam 0x0, 0x5000, 0x4D, -12, -30
	banim_frame_oam 0x0, 0x5000, 0xF, -28, -46
	banim_frame_oam 0x0, 0x5000, 0x4A, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x45, -26, -40
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x1000, 0x0, -34, -24
	banim_frame_oam 0x0, 0x5000, 0xB, -26, -32
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x2000, 0x3F, -21, -51
	banim_frame_oam 0x8000, 0x1000, 0x3F, -23, -39
	banim_frame_oam 0x0, 0x5000, 0x8, -23, -62
	banim_frame_oam 0x0, 0x5000, 0x88, -23, -30
	banim_frame_oam 0x8000, 0x1000, 0x44, -15, -46
	banim_frame_oam 0x0, 0x5000, 0x4A, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x45, -26, -40
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xB, -26, -32
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x1000, 0x35, -27, -17
	banim_frame_oam 0x0, 0x1000, 0x16, -27, -25
	banim_frame_oam 0x8000, 0x5000, 0x14, 0, -47
	banim_frame_oam 0x0, 0x1000, 0x75, -8, -23
	banim_frame_oam 0x0, 0x1000, 0x45, -24, -40
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xB4, -27, -32
	banim_frame_oam 0x8000, 0x1000, 0xD3, -11, -25
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -14, -16
	banim_frame_oam 0x8000, 0x1000, 0xA2, -22, -16
	banim_frame_oam 0x0, 0x1000, 0xA3, -30, -16
	banim_frame_oam 0x0, 0x1000, 0x81, 2, -16
	banim_frame_oam 0x0, 0x5000, 0x40, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x8000, 0x1000, 0xBA, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, -10, 1
	banim_frame_oam 0x0, 0x5000, 0x0, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -22, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -14, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -22, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -30, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 2, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x8000, 0x1000, 0xBA, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, -10, 1
	banim_frame_oam 0x0, 0x5000, 0x0, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -22, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_24_l:
	banim_frame_oam 0x4000, 0x9000, 0xDB, -24, -20
	banim_frame_oam 0x8000, 0x1000, 0xDF, -32, -20
	banim_frame_oam 0x0, 0x5000, 0x40, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x8000, 0x1000, 0xBA, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, -10, 1
	banim_frame_oam 0x0, 0x5000, 0x0, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -22, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0x6E, -14, -17
	banim_frame_oam 0x0, 0x5000, 0x3, -14, -25
	banim_frame_oam 0x4000, 0x1000, 0x43, -20, -9
	banim_frame_oam 0x0, 0x5000, 0x40, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x62, -14, 0
	banim_frame_oam 0x0, 0x9000, 0x80, -27, -15
	banim_frame_oam 0x8000, 0x5000, 0x84, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x63, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x1, -26, -32
	banim_frame_oam 0x8000, 0x1000, 0x0, -10, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -21, -40
	banim_frame_end
banim_form_ar1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x85, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0x65, -32, -24
	banim_frame_oam 0x4000, 0x0, 0x43, -14, -12
	banim_frame_oam 0x0, 0x0, 0x6E, -12, -20
	banim_frame_oam 0x0, 0x5000, 0x5, -17, -31
	banim_frame_oam 0x0, 0x5000, 0x7, -33, -29
	banim_frame_oam 0x0, 0x1000, 0x45, -19, -39
	banim_frame_end
banim_form_ar1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x5000, 0x10, -14, -20
	banim_frame_oam 0x0, 0x9000, 0x9, -29, -27
	banim_frame_oam 0x4000, 0x9000, 0x89, -29, 5
	banim_frame_oam 0x4000, 0x1000, 0xD, -14, -28
	banim_frame_oam 0x0, 0x1000, 0x2D, -6, -20
	banim_frame_oam 0x4000, 0x0, 0x43, -5, -17
	banim_frame_oam 0x0, 0x5000, 0x5, -16, -36
	banim_frame_oam 0x0, 0x5000, 0x7, -32, -34
	banim_frame_oam 0x0, 0x1000, 0x46, -18, -40
	banim_frame_oam 0x0, 0x5000, 0xC9, -9, -29
	banim_frame_oam 0x0, 0x0, 0x6E, -3, -25
	banim_frame_end
banim_form_ar1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0x10, -13, -20
	banim_frame_oam 0x0, 0x9000, 0x9, -28, -27
	banim_frame_oam 0x4000, 0x9000, 0x89, -28, 5
	banim_frame_oam 0x4000, 0x1000, 0xD, -13, -29
	banim_frame_oam 0x0, 0x1000, 0x2D, -5, -21
	banim_frame_oam 0x4000, 0x0, 0x43, -4, -18
	banim_frame_oam 0x0, 0x5000, 0x5, -16, -36
	banim_frame_oam 0x8000, 0x1000, 0x4D, -22, -33
	banim_frame_oam 0x0, 0x1000, 0x45, -18, -44
	banim_frame_oam 0x0, 0x0, 0x6E, -2, -26
	banim_frame_oam 0x0, 0x5000, 0xCB, -9, -29
	banim_frame_end
banim_form_ar1_oam_frame_29_l:
	banim_frame_oam 0x4000, 0x1000, 0xD, -11, -28
	banim_frame_oam 0x0, 0x1000, 0x2D, -3, -20
	banim_frame_oam 0x4000, 0x0, 0x43, -2, -17
	banim_frame_oam 0x0, 0x5000, 0x10, -12, -19
	banim_frame_oam 0x0, 0x5000, 0x5, -14, -35
	banim_frame_oam 0x0, 0x9000, 0x6F, -31, -24
	banim_frame_oam 0x0, 0x5000, 0x8D, 1, -16
	banim_frame_oam 0x0, 0x5000, 0x2E, -7, -40
	banim_frame_oam 0x4000, 0x1000, 0xF0, -23, 8
	banim_frame_oam 0x8000, 0x1000, 0x4D, -20, -32
	banim_frame_oam 0x0, 0x1000, 0x45, -16, -43
	banim_frame_oam 0x0, 0x0, 0x6E, 0, -25
	banim_frame_oam 0x4000, 0x1000, 0x9E, -7, 8
	banim_frame_oam 0x0, 0x1000, 0xEF, -18, -19
	banim_frame_oam 0x0, 0x1000, 0xF2, -21, -20
	banim_frame_end
banim_form_ar1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x6E, -4, -23
	banim_frame_oam 0x4000, 0x1000, 0x43, -9, -16
	banim_frame_oam 0x8000, 0x1000, 0x12, 1, -30
	banim_frame_oam 0x0, 0x1000, 0x3, 3, -30
	banim_frame_oam 0x0, 0x5000, 0x40, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x62, -6, 0
	banim_frame_oam 0x0, 0x9000, 0x93, -15, -15
	banim_frame_oam 0x8000, 0x9000, 0x97, -31, -15
	banim_frame_oam 0x0, 0x5000, 0x53, 1, -31
	banim_frame_oam 0x0, 0x5000, 0x13, -15, -32
	banim_frame_oam 0x0, 0x1000, 0x52, -16, -18
	banim_frame_oam 0x0, 0x1000, 0x42, -14, -40
	banim_frame_end
banim_form_ar1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -3, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -11, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -19, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 13, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -2, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -24, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -24, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -11, -40
	banim_frame_oam 0x8000, 0x1000, 0xB8, 3, -15
	banim_frame_oam 0x4000, 0x1000, 0xF7, 3, 1
	banim_frame_oam 0x0, 0x1000, 0xBF, -15, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, -3, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -11, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -19, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 13, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -2, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -24, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -24, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -11, -40
	banim_frame_oam 0x8000, 0x1000, 0xB7, 2, -15
	banim_frame_oam 0x0, 0x1000, 0xD6, -2, 1
	banim_frame_oam 0x0, 0x1000, 0xBF, -15, -16
	banim_frame_end
banim_form_ar1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -3, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -11, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -19, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 13, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -2, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -24, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -24, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -11, -40
	banim_frame_oam 0x8000, 0x1000, 0xB9, 1, -15
	banim_frame_oam 0x0, 0x1000, 0xF9, 1, 1
	banim_frame_oam 0x0, 0x1000, 0xBF, -15, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, -3, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -11, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -19, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 13, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -2, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -24, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -24, -23
	banim_frame_oam 0x8000, 0x1000, 0xBA, 1, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, 1, 1
	banim_frame_oam 0x0, 0x5000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -11, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -15, -16
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, -3, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -11, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -19, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 13, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -2, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -24, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -24, -23
	banim_frame_oam 0x8000, 0x1000, 0xBA, 1, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, 1, 1
	banim_frame_oam 0x0, 0x5000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -11, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -15, -16
	banim_frame_end
banim_form_ar1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -5, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -13, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -21, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 11, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -4, 0
	banim_frame_oam 0x0, 0x9000, 0x27, -23, -15
	banim_frame_oam 0x4000, 0x1000, 0x9, -23, -23
	banim_frame_oam 0x8000, 0x1000, 0x62, -31, -20
	banim_frame_oam 0x0, 0x5000, 0x0, -10, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -18, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -13, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -17, -16
	banim_frame_end
banim_form_ar1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -7, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -15, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -23, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 9, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -6, 0
	banim_frame_oam 0x0, 0x9000, 0x2B, -23, -15
	banim_frame_oam 0x8000, 0x5000, 0x2F, -31, -15
	banim_frame_oam 0x4000, 0x1000, 0xE, -31, -23
	banim_frame_oam 0x0, 0x1000, 0xD, -15, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -12, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -20, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -15, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -19, -16
	banim_frame_end
banim_form_ar1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -10, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -18, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -26, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 6, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -15, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -9, 0
	banim_frame_oam 0x0, 0x9000, 0x30, -23, -16
	banim_frame_oam 0x8000, 0x5000, 0x34, -31, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, -31, -24
	banim_frame_oam 0x8000, 0x1000, 0x62, -39, -16
	banim_frame_oam 0x0, 0x1000, 0x95, -39, 8
	banim_frame_oam 0x0, 0x5000, 0x0, -15, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -23, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -18, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -22, -16
	banim_frame_end
banim_form_ar1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -12, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -20, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -28, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 4, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -17, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -11, 0
	banim_frame_oam 0x0, 0x9000, 0x36, -30, -16
	banim_frame_oam 0x8000, 0x5000, 0x3A, -38, -16
	banim_frame_oam 0x8000, 0x5000, 0x15, 2, -24
	banim_frame_oam 0x0, 0x1000, 0x16, -6, -24
	banim_frame_oam 0x4000, 0x1000, 0x18, -30, -24
	banim_frame_oam 0x0, 0x1000, 0x1A, -38, -24
	banim_frame_oam 0x0, 0x5000, 0x0, -17, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -25, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -20, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -24, -16
	banim_frame_end
banim_form_ar1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -13, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -21, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -29, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 3, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -12, 0
	banim_frame_oam 0x0, 0x9000, 0x3B, -28, -14
	banim_frame_oam 0x8000, 0x5000, 0x3F, -36, -14
	banim_frame_oam 0x4000, 0x1000, 0x1B, -12, -22
	banim_frame_oam 0x4000, 0x1000, 0x1E, -36, -22
	banim_frame_oam 0x0, 0x1000, 0x1D, 4, -6
	banim_frame_oam 0x0, 0x5000, 0x0, -18, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -26, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -21, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -25, -16
	banim_frame_end
banim_form_ar1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -14, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -22, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -30, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 2, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -22, -40
	banim_frame_oam 0x8000, 0x1000, 0xB8, -8, -15
	banim_frame_oam 0x4000, 0x1000, 0xF7, -8, 1
	banim_frame_oam 0x0, 0x1000, 0xBF, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -14, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -22, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -30, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 2, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -22, -40
	banim_frame_oam 0x8000, 0x1000, 0xBA, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, -10, 1
	banim_frame_oam 0x0, 0x1000, 0xBF, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -14, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -22, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -30, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 2, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -22, -40
	banim_frame_oam 0x8000, 0x1000, 0xB7, -9, -15
	banim_frame_oam 0x0, 0x1000, 0xD6, -13, 1
	banim_frame_oam 0x0, 0x1000, 0xBF, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -14, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -22, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -30, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 2, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -22, -40
	banim_frame_oam 0x8000, 0x1000, 0xB9, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xF9, -10, 1
	banim_frame_oam 0x0, 0x1000, 0xBF, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -14, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -22, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -30, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 2, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x0, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -22, -40
	banim_frame_oam 0x8000, 0x1000, 0xBA, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, -10, 1
	banim_frame_oam 0x0, 0x1000, 0xBF, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -14, -16
	banim_frame_oam 0x8000, 0x1000, 0xA2, -22, -16
	banim_frame_oam 0x0, 0x1000, 0xA3, -30, -16
	banim_frame_oam 0x0, 0x1000, 0x81, 2, -16
	banim_frame_oam 0x0, 0x5000, 0x40, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -13, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -35, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -25, -22
	banim_frame_oam 0x0, 0x5000, 0x0, -19, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -27, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -22, -40
	banim_frame_oam 0x8000, 0x1000, 0xBA, -10, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, -10, 1
	banim_frame_end
banim_form_ar1_oam_frame_44_l:
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -20
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -20
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x8000, 0x1000, 0x1C, -24, -38
	banim_frame_oam 0x0, 0x1000, 0x5C, -24, -22
	banim_frame_oam 0x0, 0x5000, 0xDE, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xBE, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_45_l:
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -20
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -20
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x8000, 0x1000, 0x84, -24, -41
	banim_frame_oam 0x0, 0x1000, 0xA5, -32, -33
	banim_frame_oam 0x0, 0x5000, 0xDE, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xBE, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x6000, 0x3D, -36, -49
	banim_frame_oam 0x4000, 0x2000, 0x1D, -36, -33
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -20
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -20
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xDE, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xBE, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x5000, 0xD0, -19, -55
	banim_frame_oam 0x8000, 0x1000, 0xD2, -27, -55
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -20
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -20
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xDE, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xBE, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x5000, 0x3D, -13, -39
	banim_frame_oam 0x4000, 0x1000, 0x1D, -13, -47
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -20
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -20
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xDE, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xBE, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x6000, 0xD0, -30, -32
	banim_frame_oam 0x8000, 0x2000, 0xD2, -14, -32
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -20
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -20
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xDE, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0xBE, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x6000, 0x3D, -31, -46
	banim_frame_oam 0x4000, 0x2000, 0x1D, -31, -30
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -19
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -19
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xDC, -24, -31
	banim_frame_oam 0x4000, 0x1000, 0xBC, -24, -39
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x5000, 0xD0, -16, -53
	banim_frame_oam 0x8000, 0x1000, 0xD2, -24, -53
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -19
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -19
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xDC, -24, -31
	banim_frame_oam 0x4000, 0x1000, 0xBC, -24, -39
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x5000, 0x3D, -10, -38
	banim_frame_oam 0x4000, 0x1000, 0x1D, -10, -46
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -19
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -19
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xDC, -24, -31
	banim_frame_oam 0x4000, 0x1000, 0xBC, -24, -39
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_53_l:
	banim_frame_oam 0x0, 0x6000, 0xD0, -24, -32
	banim_frame_oam 0x8000, 0x2000, 0xD2, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -19
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -19
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0xDC, -24, -31
	banim_frame_oam 0x4000, 0x1000, 0xBC, -24, -39
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_54_l:
	banim_frame_oam 0x0, 0x6000, 0x3D, -23, -36
	banim_frame_oam 0x4000, 0x2000, 0x1D, -23, -20
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -19
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -19
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x7D, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x7C, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x45, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_55_l:
	banim_frame_oam 0x0, 0x5000, 0xD0, -13, -42
	banim_frame_oam 0x8000, 0x1000, 0xD2, -21, -42
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -19
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -19
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x7D, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x7C, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x45, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_56_l:
	banim_frame_oam 0x0, 0x5000, 0x3D, -7, -32
	banim_frame_oam 0x4000, 0x1000, 0x1D, -7, -40
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -19
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -19
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x7D, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x7C, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x45, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
banim_form_ar1_oam_frame_57_l:
	banim_frame_oam 0x0, 0x6000, 0xD0, -17, -26
	banim_frame_oam 0x8000, 0x2000, 0xD2, -1, -26
	banim_frame_oam 0x4000, 0x9000, 0xD6, -33, -19
	banim_frame_oam 0x0, 0x1000, 0xF5, -1, -19
	banim_frame_oam 0x0, 0x5000, 0x46, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x65, -15, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -35, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -35, -23
	banim_frame_oam 0x0, 0x5000, 0x7D, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x7C, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x45, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x39, -10, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -10, 1
	banim_frame_oam 0x0, 0x1000, 0x19, -26, -16
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, -3, -17
	banim_frame_oam 0x8000, 0x1000, 0xA2, -11, -17
	banim_frame_oam 0x0, 0x1000, 0xA3, -19, -17
	banim_frame_oam 0x0, 0x1000, 0x81, 13, -17
	banim_frame_oam 0x0, 0x5000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x80, -2, 0
	banim_frame_oam 0x0, 0x9000, 0x23, -24, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -24, -23
	banim_frame_oam 0x8000, 0x1000, 0xBA, 1, -15
	banim_frame_oam 0x0, 0x1000, 0xFA, 1, 1
	banim_frame_oam 0x0, 0x5000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x42, -11, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, -15, -16
	banim_frame_end
banim_form_ar1_oam_frame_58_l:
	banim_frame_oam 0x4000, 0x9000, 0xDC, -16, -27
	banim_frame_oam 0x8000, 0x1000, 0xDB, 16, -27
	banim_frame_oam 0x4000, 0x1000, 0xBE, -16, -35
	banim_frame_oam 0x0, 0x5000, 0xCD, -6, -14
	banim_frame_oam 0x0, 0x9000, 0x1C, -23, -17
	banim_frame_oam 0x8000, 0x5000, 0x1B, 9, -17
	banim_frame_oam 0x0, 0x1000, 0x3A, -15, -25
	banim_frame_oam 0x0, 0x1000, 0x5A, -23, -25
	banim_frame_end
banim_form_ar1_oam_frame_59_l:
	banim_frame_oam 0x4000, 0x9000, 0xDC, -12, -30
	banim_frame_oam 0x8000, 0x1000, 0xDB, 20, -30
	banim_frame_oam 0x4000, 0x1000, 0xBE, -12, -38
	banim_frame_oam 0x0, 0x5000, 0xCD, -3, -17
	banim_frame_oam 0x0, 0x9000, 0x15, -13, -15
	banim_frame_oam 0x8000, 0x1000, 0x19, -21, -15
	banim_frame_oam 0x0, 0x1000, 0x79, -21, 9
	banim_frame_oam 0x0, 0x1000, 0x59, 19, -7
	banim_frame_oam 0x0, 0x5000, 0xD9, -21, -31
	banim_frame_oam 0x0, 0x1000, 0x1A, -5, -23
	banim_frame_end
	.section .data.oam_r
banim_form_ar1_oam_r:
banim_form_ar1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -13, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 3, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 11, -17
	banim_frame_oam 0x0, 0x0, 0x81, -21, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x0, 0x80, -6, 0
	banim_frame_oam 0x0, 0x8000, 0x23, -8, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 8, -23
	banim_frame_oam 0x8000, 0x0, 0xBA, -9, -15
	banim_frame_oam 0x0, 0x0, 0xFA, -9, 1
	banim_frame_oam 0x0, 0x4000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 8, -32
	banim_frame_oam 0x0, 0x0, 0x42, 3, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 7, -16
	banim_frame_end
banim_form_ar1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -11, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 5, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 13, -17
	banim_frame_oam 0x0, 0x0, 0x81, -19, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -6, -16
	banim_frame_oam 0x0, 0x0, 0x80, -4, 0
	banim_frame_oam 0x0, 0x8000, 0x27, -9, -15
	banim_frame_oam 0x4000, 0x0, 0x9, 7, -23
	banim_frame_oam 0x8000, 0x0, 0x62, 23, -20
	banim_frame_oam 0x0, 0x4000, 0x0, -6, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 10, -32
	banim_frame_oam 0x0, 0x0, 0x42, 5, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 9, -16
	banim_frame_end
banim_form_ar1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xDB, -17, -21
	banim_frame_oam 0x8000, 0x0, 0xDF, 15, -21
	banim_frame_oam 0x0, 0x4000, 0x40, -6, -16
	banim_frame_oam 0x0, 0x0, 0x80, -4, 0
	banim_frame_oam 0x0, 0x8000, 0x27, -9, -15
	banim_frame_oam 0x4000, 0x0, 0x9, 7, -23
	banim_frame_oam 0x8000, 0x0, 0x62, 23, -20
	banim_frame_oam 0x0, 0x4000, 0x0, -6, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 10, -32
	banim_frame_oam 0x0, 0x0, 0x42, 5, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 9, -16
	banim_frame_end
banim_form_ar1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0x7, -1, -23
	banim_frame_oam 0x0, 0x0, 0x17, 11, -11
	banim_frame_oam 0x0, 0x4000, 0xD2, -4, -16
	banim_frame_oam 0x0, 0x0, 0xF4, 12, -8
	banim_frame_oam 0x8000, 0x0, 0xD1, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x40, -4, -16
	banim_frame_oam 0x0, 0x0, 0x80, -2, 0
	banim_frame_oam 0x0, 0x8000, 0x2B, -9, -15
	banim_frame_oam 0x8000, 0x4000, 0x2F, 23, -15
	banim_frame_oam 0x4000, 0x0, 0xE, 15, -23
	banim_frame_oam 0x0, 0x4000, 0x0, -4, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 12, -32
	banim_frame_oam 0x0, 0x0, 0x42, 7, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 11, -16
	banim_frame_end
banim_form_ar1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0x7, 2, -23
	banim_frame_oam 0x0, 0x0, 0x17, 14, -11
	banim_frame_oam 0x0, 0x4000, 0xD2, -1, -16
	banim_frame_oam 0x0, 0x0, 0xF4, 15, -8
	banim_frame_oam 0x8000, 0x0, 0xD1, -5, -32
	banim_frame_oam 0x0, 0x4000, 0x40, -1, -16
	banim_frame_oam 0x0, 0x0, 0x80, 1, 0
	banim_frame_oam 0x0, 0x8000, 0x30, -9, -16
	banim_frame_oam 0x8000, 0x4000, 0x34, 23, -16
	banim_frame_oam 0x4000, 0x0, 0x13, 15, -24
	banim_frame_oam 0x8000, 0x0, 0x62, 31, -16
	banim_frame_oam 0x0, 0x0, 0x95, 31, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -1, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 15, -32
	banim_frame_oam 0x0, 0x0, 0x42, 10, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 14, -16
	banim_frame_end
banim_form_ar1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0x7, 2, -21
	banim_frame_oam 0x0, 0x0, 0x17, 14, -9
	banim_frame_oam 0x0, 0x4000, 0xD2, 0, -13
	banim_frame_oam 0x0, 0x0, 0xF4, 16, -5
	banim_frame_oam 0x8000, 0x0, 0xD1, -4, -29
	banim_frame_oam 0x0, 0x4000, 0x40, 0, -15
	banim_frame_oam 0x0, 0x0, 0x80, 2, 1
	banim_frame_oam 0x0, 0x8000, 0x36, -2, -16
	banim_frame_oam 0x8000, 0x4000, 0x3A, 30, -16
	banim_frame_oam 0x8000, 0x4000, 0x15, -10, -24
	banim_frame_oam 0x0, 0x0, 0x16, -2, -24
	banim_frame_oam 0x4000, 0x0, 0x18, 14, -24
	banim_frame_oam 0x0, 0x0, 0x1A, 30, -24
	banim_frame_oam 0x0, 0x0, 0x42, 6, -39
	banim_frame_oam 0x0, 0x4000, 0xC3, 0, -31
	banim_frame_oam 0x0, 0x0, 0xE5, 16, -23
	banim_frame_oam 0x0, 0x0, 0xBF, 14, -16
	banim_frame_end
banim_form_ar1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x0, 0x7, 4, -21
	banim_frame_oam 0x0, 0x0, 0x17, 16, -9
	banim_frame_oam 0x0, 0x4000, 0xD2, 2, -13
	banim_frame_oam 0x0, 0x0, 0xF4, 18, -5
	banim_frame_oam 0x8000, 0x0, 0xD1, -2, -29
	banim_frame_oam 0x0, 0x4000, 0x40, 2, -15
	banim_frame_oam 0x0, 0x0, 0x80, 4, 1
	banim_frame_oam 0x0, 0x8000, 0x3B, -4, -14
	banim_frame_oam 0x8000, 0x4000, 0x3F, 28, -14
	banim_frame_oam 0x4000, 0x0, 0x1B, -4, -22
	banim_frame_oam 0x4000, 0x0, 0x1E, 20, -22
	banim_frame_oam 0x0, 0x0, 0x1D, -12, -6
	banim_frame_oam 0x0, 0x4000, 0xC3, 2, -31
	banim_frame_oam 0x0, 0x0, 0xE5, 18, -23
	banim_frame_oam 0x0, 0x0, 0x3, 8, -36
	banim_frame_oam 0x0, 0x0, 0xBF, 16, -17
	banim_frame_end
banim_form_ar1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0x12, 2, -27
	banim_frame_oam 0x0, 0x0, 0x17, 14, -15
	banim_frame_oam 0x4000, 0x0, 0xE0, 1, -33
	banim_frame_oam 0x0, 0x0, 0xE2, 17, -33
	banim_frame_oam 0x0, 0x4000, 0xD2, 0, -19
	banim_frame_oam 0x0, 0x0, 0xF4, 16, -11
	banim_frame_oam 0x8000, 0x0, 0xD1, -4, -35
	banim_frame_oam 0x0, 0x4000, 0xAC, 2, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, -1
	banim_frame_oam 0x0, 0x8000, 0x3B, -4, -14
	banim_frame_oam 0x8000, 0x4000, 0x3F, 28, -14
	banim_frame_oam 0x4000, 0x0, 0x1B, -4, -22
	banim_frame_oam 0x4000, 0x0, 0x1E, 20, -22
	banim_frame_oam 0x0, 0x0, 0x1D, -12, -6
	banim_frame_oam 0x0, 0x4000, 0xAA, 2, -32
	banim_frame_oam 0x8000, 0x0, 0xA9, 18, -32
	banim_frame_oam 0x0, 0x0, 0x3, 14, -37
	banim_frame_end
banim_form_ar1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x12, 3, -27
	banim_frame_oam 0x0, 0x0, 0x17, 15, -15
	banim_frame_oam 0x4000, 0x0, 0xE0, 2, -33
	banim_frame_oam 0x0, 0x0, 0xE2, 18, -33
	banim_frame_oam 0x0, 0x4000, 0xD2, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF4, 17, -11
	banim_frame_oam 0x8000, 0x0, 0xD1, -3, -35
	banim_frame_oam 0x0, 0x4000, 0xAC, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 6, -1
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x8000, 0x0, 0xB8, 0, -15
	banim_frame_oam 0x4000, 0x0, 0xF7, -8, 1
	banim_frame_oam 0x0, 0x4000, 0xAA, 3, -32
	banim_frame_oam 0x8000, 0x0, 0xA9, 19, -32
	banim_frame_oam 0x0, 0x0, 0x3, 15, -37
	banim_frame_end
banim_form_ar1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x0, 0x12, 3, -27
	banim_frame_oam 0x0, 0x0, 0x17, 15, -15
	banim_frame_oam 0x4000, 0x4000, 0xB1, -8, -46
	banim_frame_oam 0x4000, 0x0, 0xB5, -4, -38
	banim_frame_oam 0x0, 0x0, 0xD4, 12, -38
	banim_frame_oam 0x0, 0x4000, 0xD2, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF4, 17, -11
	banim_frame_oam 0x8000, 0x0, 0xD1, -3, -35
	banim_frame_oam 0x0, 0x4000, 0xAC, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 6, -1
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x0, 0x42, 15, -40
	banim_frame_oam 0x8000, 0x0, 0xB8, 0, -15
	banim_frame_oam 0x4000, 0x0, 0xF7, -8, 1
	banim_frame_oam 0x0, 0x4000, 0xAA, 3, -32
	banim_frame_oam 0x8000, 0x0, 0xA9, 19, -32
	banim_frame_end
banim_form_ar1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x0, 0x12, 3, -27
	banim_frame_oam 0x0, 0x0, 0x17, 15, -15
	banim_frame_oam 0x4000, 0x0, 0xEC, -11, -44
	banim_frame_oam 0x0, 0x0, 0xEE, -3, -36
	banim_frame_oam 0x0, 0x4000, 0xD2, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF4, 17, -11
	banim_frame_oam 0x8000, 0x0, 0xD1, -3, -35
	banim_frame_oam 0x0, 0x4000, 0xAC, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 6, -1
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x0, 0x42, 15, -40
	banim_frame_oam 0x8000, 0x0, 0xBA, 2, -15
	banim_frame_oam 0x0, 0x0, 0xFA, 2, 1
	banim_frame_oam 0x0, 0x4000, 0xAA, 3, -32
	banim_frame_oam 0x8000, 0x0, 0xA9, 19, -32
	banim_frame_end
banim_form_ar1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x0, 0x12, 3, -27
	banim_frame_oam 0x0, 0x0, 0x17, 15, -15
	banim_frame_oam 0x4000, 0x0, 0xEC, -11, -44
	banim_frame_oam 0x0, 0x0, 0xEE, -3, -36
	banim_frame_oam 0x0, 0x4000, 0xD2, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF4, 17, -11
	banim_frame_oam 0x8000, 0x0, 0xD1, -3, -35
	banim_frame_oam 0x0, 0x4000, 0xAC, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 6, -1
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x0, 0x42, 15, -40
	banim_frame_oam 0x8000, 0x0, 0xB7, 1, -15
	banim_frame_oam 0x0, 0x0, 0xD6, 5, 1
	banim_frame_oam 0x0, 0x4000, 0xAA, 3, -32
	banim_frame_oam 0x8000, 0x0, 0xA9, 19, -32
	banim_frame_end
banim_form_ar1_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x0, 0xD5, -6, -39
	banim_frame_oam 0x0, 0x0, 0xF6, 2, -31
	banim_frame_oam 0x0, 0x0, 0x12, 3, -28
	banim_frame_oam 0x0, 0x0, 0x17, 14, -17
	banim_frame_oam 0x0, 0x4000, 0xD2, 0, -21
	banim_frame_oam 0x0, 0x0, 0xF4, 16, -13
	banim_frame_oam 0x8000, 0x0, 0xD1, -4, -37
	banim_frame_oam 0x0, 0x4000, 0xAC, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 6, -1
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x0, 0x42, 15, -40
	banim_frame_oam 0x8000, 0x0, 0xB9, 2, -15
	banim_frame_oam 0x0, 0x0, 0xF9, 2, 1
	banim_frame_oam 0x0, 0x4000, 0xAF, 11, -32
	banim_frame_oam 0x8000, 0x0, 0xAE, 3, -32
	banim_frame_end
banim_form_ar1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x0, 0xE9, -13, -28
	banim_frame_oam 0x0, 0x0, 0xEB, 3, -28
	banim_frame_oam 0x0, 0x0, 0x12, 3, -28
	banim_frame_oam 0x0, 0x0, 0x17, 14, -17
	banim_frame_oam 0x0, 0x4000, 0xD2, 0, -21
	banim_frame_oam 0x0, 0x0, 0xF4, 16, -13
	banim_frame_oam 0x8000, 0x0, 0xD1, -4, -37
	banim_frame_oam 0x0, 0x4000, 0xAC, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 6, -1
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x0, 0x42, 15, -40
	banim_frame_oam 0x8000, 0x0, 0xB9, 2, -15
	banim_frame_oam 0x0, 0x0, 0xF9, 2, 1
	banim_frame_oam 0x0, 0x4000, 0xAF, 11, -32
	banim_frame_oam 0x8000, 0x0, 0xAE, 3, -32
	banim_frame_end
banim_form_ar1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x0, 0x85, -14, -27
	banim_frame_oam 0x0, 0x0, 0x87, 2, -27
	banim_frame_oam 0x8000, 0x0, 0x5, -1, -32
	banim_frame_oam 0x0, 0x6000, 0xD, -9, -23
	banim_frame_oam 0x0, 0x6000, 0x4D, -9, -39
	banim_frame_oam 0x0, 0x6000, 0xF, 7, -23
	banim_frame_oam 0x4000, 0x0, 0xA2, 7, -27
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x0, 0x45, 13, -40
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x6, 7, -32
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x0, 0x85, -8, -27
	banim_frame_oam 0x0, 0x0, 0x87, 8, -27
	banim_frame_oam 0x0, 0x0, 0x1F, 5, -36
	banim_frame_oam 0x0, 0x0, 0x55, 12, -29
	banim_frame_oam 0x8000, 0x2000, 0x7F, 8, -21
	banim_frame_oam 0x8000, 0x8000, 0x8, -4, -45
	banim_frame_oam 0x0, 0x4000, 0x88, -4, -13
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x4000, 0x0, 0xA2, 13, -27
	banim_frame_oam 0x0, 0x0, 0x45, 13, -40
	banim_frame_oam 0x0, 0x4000, 0x6, 7, -32
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x0, 0x85, -5, -27
	banim_frame_oam 0x0, 0x0, 0x87, 11, -27
	banim_frame_oam 0x0, 0x0, 0x1F, 6, -36
	banim_frame_oam 0x0, 0x0, 0x55, 13, -29
	banim_frame_oam 0x8000, 0x2000, 0x7F, 9, -21
	banim_frame_oam 0x8000, 0x8000, 0x8, -4, -45
	banim_frame_oam 0x0, 0x4000, 0x88, -4, -13
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x4000, 0x0, 0xA2, 16, -27
	banim_frame_oam 0x0, 0x0, 0x45, 13, -40
	banim_frame_oam 0x0, 0x4000, 0x6, 7, -32
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, -5, -25
	banim_frame_oam 0x8000, 0x0, 0x13, -5, -41
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x0, 0x45, 13, -40
	banim_frame_oam 0x0, 0x4000, 0x6, 7, -32
	banim_frame_oam 0x4000, 0x0, 0xE2, 20, -27
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x0, 0x4, 7, -41
	banim_frame_oam 0x0, 0x4000, 0xD, -2, -48
	banim_frame_oam 0x0, 0x4000, 0x4D, -2, -32
	banim_frame_oam 0x0, 0x4000, 0xF, 14, -48
	banim_frame_oam 0x0, 0x4000, 0x4A, 2, -16
	banim_frame_oam 0x0, 0x0, 0x45, 18, -40
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x0, 0x0, 24, -24
	banim_frame_oam 0x0, 0x4000, 0xB, 10, -32
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x0, 0x53, 4, -42
	banim_frame_oam 0x0, 0x4000, 0xD, -4, -46
	banim_frame_oam 0x0, 0x4000, 0x4D, -4, -30
	banim_frame_oam 0x0, 0x4000, 0xF, 12, -46
	banim_frame_oam 0x0, 0x4000, 0x4A, 2, -16
	banim_frame_oam 0x0, 0x0, 0x45, 18, -40
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x0, 0x0, 26, -24
	banim_frame_oam 0x0, 0x4000, 0xB, 10, -32
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x3000, 0x3F, 13, -51
	banim_frame_oam 0x8000, 0x0, 0x3F, 15, -39
	banim_frame_oam 0x0, 0x4000, 0x8, 7, -62
	banim_frame_oam 0x0, 0x4000, 0x88, 7, -30
	banim_frame_oam 0x8000, 0x0, 0x44, 7, -46
	banim_frame_oam 0x0, 0x4000, 0x4A, 2, -16
	banim_frame_oam 0x0, 0x0, 0x45, 18, -40
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xB, 10, -32
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x0, 0x35, 11, -17
	banim_frame_oam 0x0, 0x0, 0x16, 19, -25
	banim_frame_oam 0x8000, 0x4000, 0x14, -8, -47
	banim_frame_oam 0x0, 0x0, 0x75, 0, -23
	banim_frame_oam 0x0, 0x0, 0x45, 16, -40
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xB4, 11, -32
	banim_frame_oam 0x8000, 0x0, 0xD3, 3, -25
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -2, -16
	banim_frame_oam 0x8000, 0x0, 0xA2, 14, -16
	banim_frame_oam 0x0, 0x0, 0xA3, 22, -16
	banim_frame_oam 0x0, 0x0, 0x81, -10, -16
	banim_frame_oam 0x0, 0x4000, 0x40, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, 0
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x8000, 0x0, 0xBA, 2, -15
	banim_frame_oam 0x0, 0x0, 0xFA, 2, 1
	banim_frame_oam 0x0, 0x4000, 0x0, 3, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 19, -32
	banim_frame_oam 0x0, 0x0, 0x42, 14, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -2, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 14, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 22, -17
	banim_frame_oam 0x0, 0x0, 0x81, -10, -17
	banim_frame_oam 0x0, 0x4000, 0x40, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, 0
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x8000, 0x0, 0xBA, 2, -15
	banim_frame_oam 0x0, 0x0, 0xFA, 2, 1
	banim_frame_oam 0x0, 0x4000, 0x0, 3, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 19, -32
	banim_frame_oam 0x0, 0x0, 0x42, 14, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_24_r:
	banim_frame_oam 0x4000, 0x8000, 0xDB, -8, -20
	banim_frame_oam 0x8000, 0x0, 0xDF, 24, -20
	banim_frame_oam 0x0, 0x4000, 0x40, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, 0
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x8000, 0x0, 0xBA, 2, -15
	banim_frame_oam 0x0, 0x0, 0xFA, 2, 1
	banim_frame_oam 0x0, 0x4000, 0x0, 3, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 19, -32
	banim_frame_oam 0x0, 0x0, 0x42, 14, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0x6E, 6, -17
	banim_frame_oam 0x0, 0x4000, 0x3, -2, -25
	banim_frame_oam 0x4000, 0x0, 0x43, 4, -9
	banim_frame_oam 0x0, 0x4000, 0x40, 2, -16
	banim_frame_oam 0x0, 0x0, 0x62, 6, 0
	banim_frame_oam 0x0, 0x8000, 0x80, -5, -15
	banim_frame_oam 0x8000, 0x4000, 0x84, 27, -15
	banim_frame_oam 0x4000, 0x0, 0x63, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x1, 10, -32
	banim_frame_oam 0x8000, 0x0, 0x0, 2, -32
	banim_frame_oam 0x0, 0x0, 0x42, 13, -40
	banim_frame_end
banim_form_ar1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x85, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0x65, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x43, -2, -12
	banim_frame_oam 0x0, 0x1000, 0x6E, 4, -20
	banim_frame_oam 0x0, 0x4000, 0x5, 1, -31
	banim_frame_oam 0x0, 0x4000, 0x7, 17, -29
	banim_frame_oam 0x0, 0x0, 0x45, 11, -39
	banim_frame_end
banim_form_ar1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x4000, 0x10, -2, -20
	banim_frame_oam 0x0, 0x8000, 0x9, -3, -27
	banim_frame_oam 0x4000, 0x8000, 0x89, -3, 5
	banim_frame_oam 0x4000, 0x0, 0xD, -2, -28
	banim_frame_oam 0x0, 0x0, 0x2D, -2, -20
	banim_frame_oam 0x4000, 0x1000, 0x43, -11, -17
	banim_frame_oam 0x0, 0x4000, 0x5, 0, -36
	banim_frame_oam 0x0, 0x4000, 0x7, 16, -34
	banim_frame_oam 0x0, 0x0, 0x46, 10, -40
	banim_frame_oam 0x0, 0x4000, 0xC9, -7, -29
	banim_frame_oam 0x0, 0x1000, 0x6E, -5, -25
	banim_frame_end
banim_form_ar1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0x10, -3, -20
	banim_frame_oam 0x0, 0x8000, 0x9, -4, -27
	banim_frame_oam 0x4000, 0x8000, 0x89, -4, 5
	banim_frame_oam 0x4000, 0x0, 0xD, -3, -29
	banim_frame_oam 0x0, 0x0, 0x2D, -3, -21
	banim_frame_oam 0x4000, 0x1000, 0x43, -12, -18
	banim_frame_oam 0x0, 0x4000, 0x5, 0, -36
	banim_frame_oam 0x8000, 0x0, 0x4D, 14, -33
	banim_frame_oam 0x0, 0x0, 0x45, 10, -44
	banim_frame_oam 0x0, 0x1000, 0x6E, -6, -26
	banim_frame_oam 0x0, 0x4000, 0xCB, -7, -29
	banim_frame_end
banim_form_ar1_oam_frame_29_r:
	banim_frame_oam 0x4000, 0x0, 0xD, -5, -28
	banim_frame_oam 0x0, 0x0, 0x2D, -5, -20
	banim_frame_oam 0x4000, 0x1000, 0x43, -14, -17
	banim_frame_oam 0x0, 0x4000, 0x10, -4, -19
	banim_frame_oam 0x0, 0x4000, 0x5, -2, -35
	banim_frame_oam 0x0, 0x8000, 0x6F, -1, -24
	banim_frame_oam 0x0, 0x4000, 0x8D, -17, -16
	banim_frame_oam 0x0, 0x4000, 0x2E, -9, -40
	banim_frame_oam 0x4000, 0x0, 0xF0, 7, 8
	banim_frame_oam 0x8000, 0x0, 0x4D, 12, -32
	banim_frame_oam 0x0, 0x0, 0x45, 8, -43
	banim_frame_oam 0x0, 0x1000, 0x6E, -8, -25
	banim_frame_oam 0x4000, 0x0, 0x9E, -9, 8
	banim_frame_oam 0x0, 0x0, 0xEF, 10, -19
	banim_frame_oam 0x0, 0x0, 0xF2, 13, -20
	banim_frame_end
banim_form_ar1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x6E, -4, -23
	banim_frame_oam 0x4000, 0x0, 0x43, -7, -16
	banim_frame_oam 0x8000, 0x0, 0x12, -9, -30
	banim_frame_oam 0x0, 0x0, 0x3, -11, -30
	banim_frame_oam 0x0, 0x4000, 0x40, -6, -16
	banim_frame_oam 0x0, 0x0, 0x62, -2, 0
	banim_frame_oam 0x0, 0x8000, 0x93, -17, -15
	banim_frame_oam 0x8000, 0x8000, 0x97, 15, -15
	banim_frame_oam 0x0, 0x4000, 0x53, -17, -31
	banim_frame_oam 0x0, 0x4000, 0x13, -1, -32
	banim_frame_oam 0x0, 0x0, 0x52, 8, -18
	banim_frame_oam 0x0, 0x0, 0x42, 6, -40
	banim_frame_end
banim_form_ar1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -13, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 3, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 11, -17
	banim_frame_oam 0x0, 0x0, 0x81, -21, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x0, 0x80, -6, 0
	banim_frame_oam 0x0, 0x8000, 0x23, -8, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 8, -23
	banim_frame_oam 0x0, 0x4000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 8, -32
	banim_frame_oam 0x0, 0x0, 0x42, 3, -40
	banim_frame_oam 0x8000, 0x0, 0xB8, -11, -15
	banim_frame_oam 0x4000, 0x0, 0xF7, -19, 1
	banim_frame_oam 0x0, 0x0, 0xBF, 7, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -13, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 3, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 11, -17
	banim_frame_oam 0x0, 0x0, 0x81, -21, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x0, 0x80, -6, 0
	banim_frame_oam 0x0, 0x8000, 0x23, -8, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 8, -23
	banim_frame_oam 0x0, 0x4000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 8, -32
	banim_frame_oam 0x0, 0x0, 0x42, 3, -40
	banim_frame_oam 0x8000, 0x0, 0xB7, -10, -15
	banim_frame_oam 0x0, 0x0, 0xD6, -6, 1
	banim_frame_oam 0x0, 0x0, 0xBF, 7, -16
	banim_frame_end
banim_form_ar1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -13, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 3, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 11, -17
	banim_frame_oam 0x0, 0x0, 0x81, -21, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x0, 0x80, -6, 0
	banim_frame_oam 0x0, 0x8000, 0x23, -8, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 8, -23
	banim_frame_oam 0x0, 0x4000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 8, -32
	banim_frame_oam 0x0, 0x0, 0x42, 3, -40
	banim_frame_oam 0x8000, 0x0, 0xB9, -9, -15
	banim_frame_oam 0x0, 0x0, 0xF9, -9, 1
	banim_frame_oam 0x0, 0x0, 0xBF, 7, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -13, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 3, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 11, -17
	banim_frame_oam 0x0, 0x0, 0x81, -21, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x0, 0x80, -6, 0
	banim_frame_oam 0x0, 0x8000, 0x23, -8, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 8, -23
	banim_frame_oam 0x8000, 0x0, 0xBA, -9, -15
	banim_frame_oam 0x0, 0x0, 0xFA, -9, 1
	banim_frame_oam 0x0, 0x4000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 8, -32
	banim_frame_oam 0x0, 0x0, 0x42, 3, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 7, -16
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -13, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 3, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 11, -17
	banim_frame_oam 0x0, 0x0, 0x81, -21, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x0, 0x80, -6, 0
	banim_frame_oam 0x0, 0x8000, 0x23, -8, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 8, -23
	banim_frame_oam 0x8000, 0x0, 0xBA, -9, -15
	banim_frame_oam 0x0, 0x0, 0xFA, -9, 1
	banim_frame_oam 0x0, 0x4000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 8, -32
	banim_frame_oam 0x0, 0x0, 0x42, 3, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 7, -16
	banim_frame_end
banim_form_ar1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -11, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 5, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 13, -17
	banim_frame_oam 0x0, 0x0, 0x81, -19, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -6, -16
	banim_frame_oam 0x0, 0x0, 0x80, -4, 0
	banim_frame_oam 0x0, 0x8000, 0x27, -9, -15
	banim_frame_oam 0x4000, 0x0, 0x9, 7, -23
	banim_frame_oam 0x8000, 0x0, 0x62, 23, -20
	banim_frame_oam 0x0, 0x4000, 0x0, -6, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 10, -32
	banim_frame_oam 0x0, 0x0, 0x42, 5, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 9, -16
	banim_frame_end
banim_form_ar1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -9, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 7, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 15, -17
	banim_frame_oam 0x0, 0x0, 0x81, -17, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -4, -16
	banim_frame_oam 0x0, 0x0, 0x80, -2, 0
	banim_frame_oam 0x0, 0x8000, 0x2B, -9, -15
	banim_frame_oam 0x8000, 0x4000, 0x2F, 23, -15
	banim_frame_oam 0x4000, 0x0, 0xE, 15, -23
	banim_frame_oam 0x0, 0x0, 0xD, 7, -23
	banim_frame_oam 0x0, 0x4000, 0x0, -4, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 12, -32
	banim_frame_oam 0x0, 0x0, 0x42, 7, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 11, -16
	banim_frame_end
banim_form_ar1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -6, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 10, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 18, -17
	banim_frame_oam 0x0, 0x0, 0x81, -14, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -1, -16
	banim_frame_oam 0x0, 0x0, 0x80, 1, 0
	banim_frame_oam 0x0, 0x8000, 0x30, -9, -16
	banim_frame_oam 0x8000, 0x4000, 0x34, 23, -16
	banim_frame_oam 0x4000, 0x0, 0x13, 15, -24
	banim_frame_oam 0x8000, 0x0, 0x62, 31, -16
	banim_frame_oam 0x0, 0x0, 0x95, 31, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -1, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 15, -32
	banim_frame_oam 0x0, 0x0, 0x42, 10, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 14, -16
	banim_frame_end
banim_form_ar1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -4, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 12, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 20, -17
	banim_frame_oam 0x0, 0x0, 0x81, -12, -17
	banim_frame_oam 0x0, 0x4000, 0x40, 1, -16
	banim_frame_oam 0x0, 0x0, 0x80, 3, 0
	banim_frame_oam 0x0, 0x8000, 0x36, -2, -16
	banim_frame_oam 0x8000, 0x4000, 0x3A, 30, -16
	banim_frame_oam 0x8000, 0x4000, 0x15, -10, -24
	banim_frame_oam 0x0, 0x0, 0x16, -2, -24
	banim_frame_oam 0x4000, 0x0, 0x18, 14, -24
	banim_frame_oam 0x0, 0x0, 0x1A, 30, -24
	banim_frame_oam 0x0, 0x4000, 0x0, 1, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 17, -32
	banim_frame_oam 0x0, 0x0, 0x42, 12, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 16, -16
	banim_frame_end
banim_form_ar1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -3, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 13, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 21, -17
	banim_frame_oam 0x0, 0x0, 0x81, -11, -17
	banim_frame_oam 0x0, 0x4000, 0x40, 2, -16
	banim_frame_oam 0x0, 0x0, 0x80, 4, 0
	banim_frame_oam 0x0, 0x8000, 0x3B, -4, -14
	banim_frame_oam 0x8000, 0x4000, 0x3F, 28, -14
	banim_frame_oam 0x4000, 0x0, 0x1B, -4, -22
	banim_frame_oam 0x4000, 0x0, 0x1E, 20, -22
	banim_frame_oam 0x0, 0x0, 0x1D, -12, -6
	banim_frame_oam 0x0, 0x4000, 0x0, 2, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 18, -32
	banim_frame_oam 0x0, 0x0, 0x42, 13, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 17, -16
	banim_frame_end
banim_form_ar1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -2, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 14, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 22, -17
	banim_frame_oam 0x0, 0x0, 0x81, -10, -17
	banim_frame_oam 0x0, 0x4000, 0x40, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, 0
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x0, 3, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 19, -32
	banim_frame_oam 0x0, 0x0, 0x42, 14, -40
	banim_frame_oam 0x8000, 0x0, 0xB8, 0, -15
	banim_frame_oam 0x4000, 0x0, 0xF7, -8, 1
	banim_frame_oam 0x0, 0x0, 0xBF, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -2, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 14, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 22, -17
	banim_frame_oam 0x0, 0x0, 0x81, -10, -17
	banim_frame_oam 0x0, 0x4000, 0x40, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, 0
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x0, 3, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 19, -32
	banim_frame_oam 0x0, 0x0, 0x42, 14, -40
	banim_frame_oam 0x8000, 0x0, 0xBA, 2, -15
	banim_frame_oam 0x0, 0x0, 0xFA, 2, 1
	banim_frame_oam 0x0, 0x0, 0xBF, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -2, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 14, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 22, -17
	banim_frame_oam 0x0, 0x0, 0x81, -10, -17
	banim_frame_oam 0x0, 0x4000, 0x40, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, 0
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x0, 3, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 19, -32
	banim_frame_oam 0x0, 0x0, 0x42, 14, -40
	banim_frame_oam 0x8000, 0x0, 0xB7, 1, -15
	banim_frame_oam 0x0, 0x0, 0xD6, 5, 1
	banim_frame_oam 0x0, 0x0, 0xBF, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -2, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 14, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 22, -17
	banim_frame_oam 0x0, 0x0, 0x81, -10, -17
	banim_frame_oam 0x0, 0x4000, 0x40, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, 0
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x0, 3, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 19, -32
	banim_frame_oam 0x0, 0x0, 0x42, 14, -40
	banim_frame_oam 0x8000, 0x0, 0xB9, 2, -15
	banim_frame_oam 0x0, 0x0, 0xF9, 2, 1
	banim_frame_oam 0x0, 0x0, 0xBF, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -2, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 14, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 22, -17
	banim_frame_oam 0x0, 0x0, 0x81, -10, -17
	banim_frame_oam 0x0, 0x4000, 0x40, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, 0
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x0, 3, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 19, -32
	banim_frame_oam 0x0, 0x0, 0x42, 14, -40
	banim_frame_oam 0x8000, 0x0, 0xBA, 2, -15
	banim_frame_oam 0x0, 0x0, 0xFA, 2, 1
	banim_frame_oam 0x0, 0x0, 0xBF, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -2, -16
	banim_frame_oam 0x8000, 0x0, 0xA2, 14, -16
	banim_frame_oam 0x0, 0x0, 0xA3, 22, -16
	banim_frame_oam 0x0, 0x0, 0x81, -10, -16
	banim_frame_oam 0x0, 0x4000, 0x40, 3, -16
	banim_frame_oam 0x0, 0x0, 0x80, 5, 0
	banim_frame_oam 0x0, 0x8000, 0x23, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 19, -23
	banim_frame_oam 0x0, 0x0, 0x4, 17, -22
	banim_frame_oam 0x0, 0x4000, 0x0, 3, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 19, -32
	banim_frame_oam 0x0, 0x0, 0x42, 14, -40
	banim_frame_oam 0x8000, 0x0, 0xBA, 2, -15
	banim_frame_oam 0x0, 0x0, 0xFA, 2, 1
	banim_frame_end
banim_form_ar1_oam_frame_44_r:
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -20
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -20
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x8000, 0x0, 0x1C, 16, -38
	banim_frame_oam 0x0, 0x0, 0x5C, 16, -22
	banim_frame_oam 0x0, 0x4000, 0xDE, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xBE, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_45_r:
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -20
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -20
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x8000, 0x0, 0x84, 16, -41
	banim_frame_oam 0x0, 0x0, 0xA5, 24, -33
	banim_frame_oam 0x0, 0x4000, 0xDE, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xBE, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x7000, 0x3D, 20, -49
	banim_frame_oam 0x4000, 0x3000, 0x1D, 20, -33
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -20
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -20
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xDE, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xBE, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x4000, 0xD0, 3, -55
	banim_frame_oam 0x8000, 0x0, 0xD2, 19, -55
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -20
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -20
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xDE, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xBE, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x4000, 0x3D, -3, -39
	banim_frame_oam 0x4000, 0x0, 0x1D, -3, -47
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -20
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -20
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xDE, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xBE, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x7000, 0xD0, 14, -32
	banim_frame_oam 0x8000, 0x3000, 0xD2, 6, -32
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -20
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -20
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xDE, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xBE, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x7000, 0x3D, 15, -46
	banim_frame_oam 0x4000, 0x3000, 0x1D, 15, -30
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -19
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xDC, 8, -31
	banim_frame_oam 0x4000, 0x0, 0xBC, 8, -39
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x4000, 0xD0, 0, -53
	banim_frame_oam 0x8000, 0x0, 0xD2, 16, -53
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -19
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xDC, 8, -31
	banim_frame_oam 0x4000, 0x0, 0xBC, 8, -39
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x4000, 0x3D, -6, -38
	banim_frame_oam 0x4000, 0x0, 0x1D, -6, -46
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -19
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xDC, 8, -31
	banim_frame_oam 0x4000, 0x0, 0xBC, 8, -39
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_53_r:
	banim_frame_oam 0x0, 0x7000, 0xD0, 8, -32
	banim_frame_oam 0x8000, 0x3000, 0xD2, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -19
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0xDC, 8, -31
	banim_frame_oam 0x4000, 0x0, 0xBC, 8, -39
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_54_r:
	banim_frame_oam 0x0, 0x7000, 0x3D, 7, -36
	banim_frame_oam 0x4000, 0x3000, 0x1D, 7, -20
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -19
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x7D, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x7C, 0, -32
	banim_frame_oam 0x0, 0x0, 0x45, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_55_r:
	banim_frame_oam 0x0, 0x4000, 0xD0, -3, -42
	banim_frame_oam 0x8000, 0x0, 0xD2, 13, -42
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -19
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x7D, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x7C, 0, -32
	banim_frame_oam 0x0, 0x0, 0x45, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_56_r:
	banim_frame_oam 0x0, 0x4000, 0x3D, -9, -32
	banim_frame_oam 0x4000, 0x0, 0x1D, -9, -40
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -19
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x7D, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x7C, 0, -32
	banim_frame_oam 0x0, 0x0, 0x45, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
banim_form_ar1_oam_frame_57_r:
	banim_frame_oam 0x0, 0x7000, 0xD0, 1, -26
	banim_frame_oam 0x8000, 0x3000, 0xD2, -7, -26
	banim_frame_oam 0x4000, 0x8000, 0xD6, 1, -19
	banim_frame_oam 0x0, 0x0, 0xF5, -7, -19
	banim_frame_oam 0x0, 0x4000, 0x46, 3, -16
	banim_frame_oam 0x0, 0x0, 0x65, 7, 0
	banim_frame_oam 0x0, 0x8000, 0x20, 3, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 19, -23
	banim_frame_oam 0x0, 0x4000, 0x7D, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x7C, 0, -32
	banim_frame_oam 0x0, 0x0, 0x45, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x39, 2, -15
	banim_frame_oam 0x0, 0x0, 0x79, 2, 1
	banim_frame_oam 0x0, 0x0, 0x19, 18, -16
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -13, -17
	banim_frame_oam 0x8000, 0x0, 0xA2, 3, -17
	banim_frame_oam 0x0, 0x0, 0xA3, 11, -17
	banim_frame_oam 0x0, 0x0, 0x81, -21, -17
	banim_frame_oam 0x0, 0x4000, 0x40, -8, -16
	banim_frame_oam 0x0, 0x0, 0x80, -6, 0
	banim_frame_oam 0x0, 0x8000, 0x23, -8, -15
	banim_frame_oam 0x4000, 0x0, 0x5, 8, -23
	banim_frame_oam 0x8000, 0x0, 0xBA, -9, -15
	banim_frame_oam 0x0, 0x0, 0xFA, -9, 1
	banim_frame_oam 0x0, 0x4000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x2, 8, -32
	banim_frame_oam 0x0, 0x0, 0x42, 3, -40
	banim_frame_oam 0x0, 0x0, 0xBF, 7, -16
	banim_frame_end
banim_form_ar1_oam_frame_58_r:
	banim_frame_oam 0x4000, 0x8000, 0xDC, -16, -27
	banim_frame_oam 0x8000, 0x0, 0xDB, -24, -27
	banim_frame_oam 0x4000, 0x0, 0xBE, 0, -35
	banim_frame_oam 0x0, 0x4000, 0xCD, -10, -14
	banim_frame_oam 0x0, 0x8000, 0x1C, -9, -17
	banim_frame_oam 0x8000, 0x4000, 0x1B, -17, -17
	banim_frame_oam 0x0, 0x0, 0x3A, 7, -25
	banim_frame_oam 0x0, 0x0, 0x5A, 15, -25
	banim_frame_end
banim_form_ar1_oam_frame_59_r:
	banim_frame_oam 0x4000, 0x8000, 0xDC, -20, -30
	banim_frame_oam 0x8000, 0x0, 0xDB, -28, -30
	banim_frame_oam 0x4000, 0x0, 0xBE, -4, -38
	banim_frame_oam 0x0, 0x4000, 0xCD, -13, -17
	banim_frame_oam 0x0, 0x8000, 0x15, -19, -15
	banim_frame_oam 0x8000, 0x0, 0x19, 13, -15
	banim_frame_oam 0x0, 0x0, 0x79, 13, 9
	banim_frame_oam 0x0, 0x0, 0x59, -27, -7
	banim_frame_oam 0x0, 0x4000, 0xD9, 5, -31
	banim_frame_oam 0x0, 0x0, 0x1A, -3, -23
	banim_frame_end
	.section .data.script
banim_form_ar1_script:
banim_form_ar1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 1, banim_form_ar1_oam_frame_1_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 2, banim_form_ar1_oam_frame_2_r - banim_form_ar1_oam_r
	banim_code_frame 6, banim_form_ar1_sheet_0, 3, banim_form_ar1_oam_frame_3_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_form_ar1_sheet_0, 4, banim_form_ar1_oam_frame_4_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_0, 5, banim_form_ar1_oam_frame_5_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 6, banim_form_ar1_oam_frame_6_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 7, banim_form_ar1_oam_frame_7_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 8, banim_form_ar1_oam_frame_8_r - banim_form_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_form_ar1_sheet_0, 9, banim_form_ar1_oam_frame_9_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 10, banim_form_ar1_oam_frame_10_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 11, banim_form_ar1_oam_frame_11_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 12, banim_form_ar1_oam_frame_12_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 13, banim_form_ar1_oam_frame_13_r - banim_form_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 1, banim_form_ar1_sheet_1, 14, banim_form_ar1_oam_frame_14_r - banim_form_ar1_oam_r
	banim_code_frame 20, banim_form_ar1_sheet_1, 15, banim_form_ar1_oam_frame_15_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_1, 16, banim_form_ar1_oam_frame_16_r - banim_form_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_form_ar1_sheet_1, 17, banim_form_ar1_oam_frame_17_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 18, banim_form_ar1_oam_frame_18_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_1, 19, banim_form_ar1_oam_frame_19_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_form_ar1_sheet_1, 20, banim_form_ar1_oam_frame_20_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 21, banim_form_ar1_oam_frame_21_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 22, banim_form_ar1_oam_frame_22_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 23, banim_form_ar1_oam_frame_23_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 24, banim_form_ar1_oam_frame_24_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 25, banim_form_ar1_oam_frame_25_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_form_ar1_sheet_2, 26, banim_form_ar1_oam_frame_26_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 27, banim_form_ar1_oam_frame_27_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 28, banim_form_ar1_oam_frame_28_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 29, banim_form_ar1_oam_frame_29_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 30, banim_form_ar1_oam_frame_30_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 31, banim_form_ar1_oam_frame_31_r - banim_form_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_form_ar1_sheet_0, 33, banim_form_ar1_oam_frame_32_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_ar1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 1, banim_form_ar1_oam_frame_1_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 2, banim_form_ar1_oam_frame_2_r - banim_form_ar1_oam_r
	banim_code_frame 6, banim_form_ar1_sheet_0, 3, banim_form_ar1_oam_frame_3_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_form_ar1_sheet_0, 4, banim_form_ar1_oam_frame_4_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_0, 5, banim_form_ar1_oam_frame_5_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 6, banim_form_ar1_oam_frame_6_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 7, banim_form_ar1_oam_frame_7_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 8, banim_form_ar1_oam_frame_8_r - banim_form_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_form_ar1_sheet_0, 9, banim_form_ar1_oam_frame_9_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 10, banim_form_ar1_oam_frame_10_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 11, banim_form_ar1_oam_frame_11_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 12, banim_form_ar1_oam_frame_12_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 13, banim_form_ar1_oam_frame_13_r - banim_form_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 1, banim_form_ar1_sheet_1, 14, banim_form_ar1_oam_frame_14_r - banim_form_ar1_oam_r
	banim_code_frame 20, banim_form_ar1_sheet_1, 15, banim_form_ar1_oam_frame_15_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_1, 16, banim_form_ar1_oam_frame_16_r - banim_form_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_form_ar1_sheet_1, 17, banim_form_ar1_oam_frame_17_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 18, banim_form_ar1_oam_frame_18_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_1, 19, banim_form_ar1_oam_frame_19_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_form_ar1_sheet_1, 20, banim_form_ar1_oam_frame_20_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 21, banim_form_ar1_oam_frame_21_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 22, banim_form_ar1_oam_frame_22_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 23, banim_form_ar1_oam_frame_23_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 24, banim_form_ar1_oam_frame_24_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 25, banim_form_ar1_oam_frame_25_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_form_ar1_sheet_2, 26, banim_form_ar1_oam_frame_26_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 27, banim_form_ar1_oam_frame_27_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 28, banim_form_ar1_oam_frame_28_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 29, banim_form_ar1_oam_frame_29_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 30, banim_form_ar1_oam_frame_30_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 31, banim_form_ar1_oam_frame_31_r - banim_form_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_form_ar1_sheet_0, 33, banim_form_ar1_oam_frame_32_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_ar1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 1, banim_form_ar1_oam_frame_1_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 2, banim_form_ar1_oam_frame_2_r - banim_form_ar1_oam_r
	banim_code_frame 6, banim_form_ar1_sheet_0, 3, banim_form_ar1_oam_frame_3_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_form_ar1_sheet_0, 4, banim_form_ar1_oam_frame_4_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_0, 5, banim_form_ar1_oam_frame_5_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 6, banim_form_ar1_oam_frame_6_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 7, banim_form_ar1_oam_frame_7_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 8, banim_form_ar1_oam_frame_8_r - banim_form_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_form_ar1_sheet_0, 9, banim_form_ar1_oam_frame_9_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 10, banim_form_ar1_oam_frame_10_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 11, banim_form_ar1_oam_frame_11_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 12, banim_form_ar1_oam_frame_12_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 13, banim_form_ar1_oam_frame_13_r - banim_form_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 1, banim_form_ar1_sheet_1, 14, banim_form_ar1_oam_frame_14_r - banim_form_ar1_oam_r
	banim_code_frame 20, banim_form_ar1_sheet_1, 15, banim_form_ar1_oam_frame_15_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_1, 16, banim_form_ar1_oam_frame_16_r - banim_form_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_form_ar1_sheet_1, 17, banim_form_ar1_oam_frame_17_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 18, banim_form_ar1_oam_frame_18_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_1, 19, banim_form_ar1_oam_frame_19_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_form_ar1_sheet_1, 20, banim_form_ar1_oam_frame_20_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 21, banim_form_ar1_oam_frame_21_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 22, banim_form_ar1_oam_frame_22_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 23, banim_form_ar1_oam_frame_23_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 24, banim_form_ar1_oam_frame_24_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 25, banim_form_ar1_oam_frame_25_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_form_ar1_sheet_2, 26, banim_form_ar1_oam_frame_26_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 27, banim_form_ar1_oam_frame_27_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 28, banim_form_ar1_oam_frame_28_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 29, banim_form_ar1_oam_frame_29_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 30, banim_form_ar1_oam_frame_30_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 31, banim_form_ar1_oam_frame_31_r - banim_form_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_form_ar1_sheet_0, 33, banim_form_ar1_oam_frame_32_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_ar1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 1, banim_form_ar1_oam_frame_1_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 2, banim_form_ar1_oam_frame_2_r - banim_form_ar1_oam_r
	banim_code_frame 6, banim_form_ar1_sheet_0, 3, banim_form_ar1_oam_frame_3_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_form_ar1_sheet_0, 4, banim_form_ar1_oam_frame_4_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_0, 5, banim_form_ar1_oam_frame_5_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 6, banim_form_ar1_oam_frame_6_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 7, banim_form_ar1_oam_frame_7_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 8, banim_form_ar1_oam_frame_8_r - banim_form_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_form_ar1_sheet_0, 9, banim_form_ar1_oam_frame_9_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 10, banim_form_ar1_oam_frame_10_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 11, banim_form_ar1_oam_frame_11_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 12, banim_form_ar1_oam_frame_12_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 13, banim_form_ar1_oam_frame_13_r - banim_form_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 1, banim_form_ar1_sheet_1, 14, banim_form_ar1_oam_frame_14_r - banim_form_ar1_oam_r
	banim_code_frame 20, banim_form_ar1_sheet_1, 15, banim_form_ar1_oam_frame_15_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_1, 16, banim_form_ar1_oam_frame_16_r - banim_form_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_form_ar1_sheet_1, 17, banim_form_ar1_oam_frame_17_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 18, banim_form_ar1_oam_frame_18_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_1, 19, banim_form_ar1_oam_frame_19_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_form_ar1_sheet_1, 20, banim_form_ar1_oam_frame_20_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 21, banim_form_ar1_oam_frame_21_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 22, banim_form_ar1_oam_frame_22_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 23, banim_form_ar1_oam_frame_23_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 24, banim_form_ar1_oam_frame_24_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 25, banim_form_ar1_oam_frame_25_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_form_ar1_sheet_2, 26, banim_form_ar1_oam_frame_26_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 27, banim_form_ar1_oam_frame_27_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 28, banim_form_ar1_oam_frame_28_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 29, banim_form_ar1_oam_frame_29_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 30, banim_form_ar1_oam_frame_30_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 31, banim_form_ar1_oam_frame_31_r - banim_form_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_form_ar1_sheet_0, 33, banim_form_ar1_oam_frame_32_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_ar1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 1, banim_form_ar1_oam_frame_1_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 2, banim_form_ar1_oam_frame_2_r - banim_form_ar1_oam_r
	banim_code_frame 6, banim_form_ar1_sheet_0, 3, banim_form_ar1_oam_frame_3_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_form_ar1_sheet_0, 4, banim_form_ar1_oam_frame_4_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_0, 5, banim_form_ar1_oam_frame_5_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 6, banim_form_ar1_oam_frame_6_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 7, banim_form_ar1_oam_frame_7_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 8, banim_form_ar1_oam_frame_8_r - banim_form_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_form_ar1_sheet_0, 9, banim_form_ar1_oam_frame_9_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 10, banim_form_ar1_oam_frame_10_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 11, banim_form_ar1_oam_frame_11_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 12, banim_form_ar1_oam_frame_12_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 13, banim_form_ar1_oam_frame_13_r - banim_form_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 1, banim_form_ar1_sheet_1, 14, banim_form_ar1_oam_frame_14_r - banim_form_ar1_oam_r
	banim_code_frame 20, banim_form_ar1_sheet_1, 15, banim_form_ar1_oam_frame_15_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_1, 16, banim_form_ar1_oam_frame_16_r - banim_form_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_form_ar1_sheet_1, 17, banim_form_ar1_oam_frame_17_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 18, banim_form_ar1_oam_frame_18_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_1, 19, banim_form_ar1_oam_frame_19_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_form_ar1_sheet_1, 20, banim_form_ar1_oam_frame_20_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 21, banim_form_ar1_oam_frame_21_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 22, banim_form_ar1_oam_frame_22_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 23, banim_form_ar1_oam_frame_23_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 24, banim_form_ar1_oam_frame_24_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 25, banim_form_ar1_oam_frame_25_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_form_ar1_sheet_2, 26, banim_form_ar1_oam_frame_26_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 27, banim_form_ar1_oam_frame_27_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 28, banim_form_ar1_oam_frame_28_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 29, banim_form_ar1_oam_frame_29_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 30, banim_form_ar1_oam_frame_30_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 31, banim_form_ar1_oam_frame_31_r - banim_form_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_form_ar1_sheet_0, 33, banim_form_ar1_oam_frame_32_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_ar1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_0, 42, banim_form_ar1_oam_frame_33_r - banim_form_ar1_oam_r
	banim_code_frame 6, banim_form_ar1_sheet_0, 43, banim_form_ar1_oam_frame_34_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_form_ar1_sheet_0, 44, banim_form_ar1_oam_frame_35_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_0, 45, banim_form_ar1_oam_frame_36_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 46, banim_form_ar1_oam_frame_37_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 47, banim_form_ar1_oam_frame_38_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 48, banim_form_ar1_oam_frame_39_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 49, banim_form_ar1_oam_frame_40_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 50, banim_form_ar1_oam_frame_41_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 51, banim_form_ar1_oam_frame_42_r - banim_form_ar1_oam_r
	banim_code_frame 6, banim_form_ar1_sheet_0, 52, banim_form_ar1_oam_frame_43_r - banim_form_ar1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_form_ar1_sheet_1, 53, banim_form_ar1_oam_frame_44_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 54, banim_form_ar1_oam_frame_45_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 55, banim_form_ar1_oam_frame_46_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 56, banim_form_ar1_oam_frame_47_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 57, banim_form_ar1_oam_frame_48_r - banim_form_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_form_ar1_sheet_1, 58, banim_form_ar1_oam_frame_49_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 59, banim_form_ar1_oam_frame_50_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 60, banim_form_ar1_oam_frame_51_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 61, banim_form_ar1_oam_frame_52_r - banim_form_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_form_ar1_sheet_1, 62, banim_form_ar1_oam_frame_53_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 63, banim_form_ar1_oam_frame_54_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 64, banim_form_ar1_oam_frame_55_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 65, banim_form_ar1_oam_frame_56_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 66, banim_form_ar1_oam_frame_57_r - banim_form_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_form_ar1_sheet_1, 14, banim_form_ar1_oam_frame_14_r - banim_form_ar1_oam_r
	banim_code_frame 8, banim_form_ar1_sheet_1, 15, banim_form_ar1_oam_frame_15_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 16, banim_form_ar1_oam_frame_16_r - banim_form_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_form_ar1_sheet_1, 17, banim_form_ar1_oam_frame_17_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 18, banim_form_ar1_oam_frame_18_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_1, 19, banim_form_ar1_oam_frame_19_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_form_ar1_sheet_1, 20, banim_form_ar1_oam_frame_20_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 21, banim_form_ar1_oam_frame_21_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 22, banim_form_ar1_oam_frame_22_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 23, banim_form_ar1_oam_frame_23_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 24, banim_form_ar1_oam_frame_24_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_form_ar1_sheet_2, 25, banim_form_ar1_oam_frame_25_r - banim_form_ar1_oam_r
	banim_code_frame 6, banim_form_ar1_sheet_2, 26, banim_form_ar1_oam_frame_26_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 27, banim_form_ar1_oam_frame_27_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 28, banim_form_ar1_oam_frame_28_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 29, banim_form_ar1_oam_frame_29_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 30, banim_form_ar1_oam_frame_30_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 31, banim_form_ar1_oam_frame_31_r - banim_form_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_form_ar1_sheet_0, 33, banim_form_ar1_oam_frame_32_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_ar1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_form_ar1_sheet_2, 69, banim_form_ar1_oam_frame_58_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_2, 70, banim_form_ar1_oam_frame_59_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_form_ar1_sheet_2, 69, banim_form_ar1_oam_frame_58_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_ar1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_form_ar1_sheet_2, 69, banim_form_ar1_oam_frame_58_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_2, 70, banim_form_ar1_oam_frame_59_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_form_ar1_sheet_2, 69, banim_form_ar1_oam_frame_58_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_form_ar1_mode_stand_close:
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_form_ar1_mode_stand:
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_form_ar1_mode_stand_range:
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_form_ar1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 1, banim_form_ar1_oam_frame_1_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 2, banim_form_ar1_oam_frame_2_r - banim_form_ar1_oam_r
	banim_code_frame 6, banim_form_ar1_sheet_0, 3, banim_form_ar1_oam_frame_3_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_form_ar1_sheet_0, 4, banim_form_ar1_oam_frame_4_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_0, 5, banim_form_ar1_oam_frame_5_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 6, banim_form_ar1_oam_frame_6_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 7, banim_form_ar1_oam_frame_7_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 8, banim_form_ar1_oam_frame_8_r - banim_form_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_form_ar1_sheet_0, 9, banim_form_ar1_oam_frame_9_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 10, banim_form_ar1_oam_frame_10_r - banim_form_ar1_oam_r
	banim_code_frame 3, banim_form_ar1_sheet_0, 11, banim_form_ar1_oam_frame_11_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_0, 12, banim_form_ar1_oam_frame_12_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 13, banim_form_ar1_oam_frame_13_r - banim_form_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 1, banim_form_ar1_sheet_1, 14, banim_form_ar1_oam_frame_14_r - banim_form_ar1_oam_r
	banim_code_frame 20, banim_form_ar1_sheet_1, 15, banim_form_ar1_oam_frame_15_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_1, 16, banim_form_ar1_oam_frame_16_r - banim_form_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_form_ar1_sheet_1, 17, banim_form_ar1_oam_frame_17_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 18, banim_form_ar1_oam_frame_18_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_1, 19, banim_form_ar1_oam_frame_19_r - banim_form_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_form_ar1_sheet_1, 20, banim_form_ar1_oam_frame_20_r - banim_form_ar1_oam_r
	banim_code_frame 2, banim_form_ar1_sheet_1, 21, banim_form_ar1_oam_frame_21_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 22, banim_form_ar1_oam_frame_22_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 23, banim_form_ar1_oam_frame_23_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 24, banim_form_ar1_oam_frame_24_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 25, banim_form_ar1_oam_frame_25_r - banim_form_ar1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 6, banim_form_ar1_sheet_2, 26, banim_form_ar1_oam_frame_26_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 27, banim_form_ar1_oam_frame_27_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_2, 28, banim_form_ar1_oam_frame_28_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 29, banim_form_ar1_oam_frame_29_r - banim_form_ar1_oam_r
	banim_code_frame 5, banim_form_ar1_sheet_2, 30, banim_form_ar1_oam_frame_30_r - banim_form_ar1_oam_r
	banim_code_frame 4, banim_form_ar1_sheet_0, 31, banim_form_ar1_oam_frame_31_r - banim_form_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_form_ar1_sheet_0, 33, banim_form_ar1_oam_frame_32_r - banim_form_ar1_oam_r
	banim_code_frame 1, banim_form_ar1_sheet_0, 0, banim_form_ar1_oam_frame_0_r - banim_form_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_form_ar1_mode_attack_close - banim_form_ar1_script
	.word banim_form_ar1_mode_attack_close_back - banim_form_ar1_script
	.word banim_form_ar1_mode_attack_close_critical - banim_form_ar1_script
	.word banim_form_ar1_mode_attack_close_critical_back - banim_form_ar1_script
	.word banim_form_ar1_mode_attack_range - banim_form_ar1_script
	.word banim_form_ar1_mode_attack_range_critical - banim_form_ar1_script
	.word banim_form_ar1_mode_dodge_close - banim_form_ar1_script
	.word banim_form_ar1_mode_dodge_range - banim_form_ar1_script
	.word banim_form_ar1_mode_stand_close - banim_form_ar1_script
	.word banim_form_ar1_mode_stand - banim_form_ar1_script
	.word banim_form_ar1_mode_stand_range - banim_form_ar1_script
	.word banim_form_ar1_mode_attack_miss - banim_form_ar1_script
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

