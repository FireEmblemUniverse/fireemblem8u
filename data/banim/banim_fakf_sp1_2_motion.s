@ vim:ft=armv4
	.global banim_fakf_sp1_2_script
	.global banim_fakf_sp1_2_oam_r
	.global banim_fakf_sp1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x68
	.section .data.oam_l
banim_fakf_sp1_2_oam_l:
banim_fakf_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x1000, 0x46, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x48, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0x66, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xE0, 31, -37
	banim_frame_oam 0x0, 0x5000, 0x86, 15, -37
	banim_frame_oam 0x4000, 0x1000, 0x88, -1, -30
	banim_frame_oam 0x4000, 0x1000, 0xA8, -17, -26
	banim_frame_oam 0x4000, 0x1000, 0xC6, -33, -25
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -48
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x84, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xC1, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xC3, -16, 0
	banim_frame_oam 0x4000, 0x5000, 0xE1, -24, 8
	banim_frame_oam 0x0, 0x5000, 0x6, -2, -64
	banim_frame_oam 0x4000, 0x5000, 0x28, -34, -56
	banim_frame_oam 0x4000, 0x1000, 0x9, -26, -64
	banim_frame_oam 0x0, 0x1000, 0xB, -34, -64
	banim_frame_oam 0x0, 0x1000, 0x8, -24, -72
	banim_frame_oam 0x0, 0x1000, 0xC0, 16, -13
	banim_frame_end
banim_fakf_sp1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x5000, 0xB1, -24, -33
	banim_frame_oam 0x4000, 0x1000, 0xD2, -16, -25
	banim_frame_oam 0x0, 0x1000, 0xD4, -24, -25
	banim_frame_oam 0x0, 0x5000, 0x11, 20, -45
	banim_frame_oam 0x4000, 0x1000, 0x51, -4, -35
	banim_frame_oam 0x4000, 0x1000, 0x72, -12, -27
	banim_frame_oam 0x8000, 0x1000, 0x71, -20, -29
	banim_frame_oam 0x0, 0x1000, 0x92, -28, -21
	banim_frame_oam 0x0, 0x1000, 0x93, 12, -38
	banim_frame_oam 0x8000, 0xD000, 0xC, -16, -56
	banim_frame_oam 0x8000, 0x5000, 0x10, -24, -56
	banim_frame_oam 0x8000, 0x5000, 0x90, -24, -24
	banim_frame_oam 0x0, 0x5000, 0x49, -26, -72
	banim_frame_oam 0x8000, 0x1000, 0x4B, -34, -72
	banim_frame_oam 0x0, 0x1000, 0xC0, 16, -14
	banim_frame_oam 0x0, 0x1000, 0xE6, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x68, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xE7, -40, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xC9, 8, -72
	banim_frame_oam 0x0, 0x1000, 0xEA, 0, -64
	banim_frame_oam 0x0, 0x1000, 0xAB, -32, -40
	banim_frame_oam 0x4000, 0x1000, 0x8A, -40, -56
	banim_frame_oam 0x0, 0x1000, 0xAA, -32, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, -10, -35
	banim_frame_oam 0x8000, 0x1000, 0x1D, -18, -35
	banim_frame_oam 0x0, 0x5000, 0x11, 20, -46
	banim_frame_oam 0x4000, 0x1000, 0x51, -4, -36
	banim_frame_oam 0x4000, 0x1000, 0x72, -12, -28
	banim_frame_oam 0x8000, 0x1000, 0x71, -20, -30
	banim_frame_oam 0x0, 0x1000, 0x92, -28, -22
	banim_frame_oam 0x0, 0x1000, 0x93, 12, -39
	banim_frame_oam 0x8000, 0x1000, 0xD1, 14, -19
	banim_frame_oam 0x0, 0x5000, 0x14, 6, -59
	banim_frame_oam 0x8000, 0x1000, 0x16, -2, -59
	banim_frame_oam 0x4000, 0x9000, 0x55, -18, -43
	banim_frame_oam 0x0, 0x5000, 0x59, -34, -43
	banim_frame_oam 0x0, 0x9000, 0x95, -18, -27
	banim_frame_oam 0x8000, 0x1000, 0xB9, -26, -19
	banim_frame_oam 0x0, 0x1000, 0xF9, -26, -3
	banim_frame_oam 0x8000, 0x1000, 0xBA, -34, -19
	banim_frame_oam 0x0, 0x1000, 0x37, -10, -51
	banim_frame_oam 0x0, 0x5000, 0x18, -26, -59
	banim_frame_oam 0x8000, 0x1000, 0x1A, -34, -59
	banim_frame_oam 0x4000, 0x1000, 0xF3, -31, -67
	banim_frame_oam 0x0, 0x1000, 0xF2, -23, -75
	banim_frame_oam 0x0, 0x1000, 0x17, 9, -67
	banim_frame_oam 0x0, 0x1000, 0x99, -26, -27
	banim_frame_oam 0x0, 0x1000, 0xE6, -25, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -9, 8
	banim_frame_oam 0x0, 0x1000, 0x68, -1, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0x5, -3, -41
	banim_frame_oam 0x0, 0x5000, 0xD, 15, -58
	banim_frame_oam 0x0, 0x1000, 0x4D, 7, -48
	banim_frame_oam 0x0, 0x1000, 0xF, -1, -43
	banim_frame_oam 0x8000, 0x1000, 0x2F, -9, -42
	banim_frame_oam 0x0, 0x1000, 0x4E, -17, -32
	banim_frame_oam 0x0, 0x1000, 0x10, -25, -29
	banim_frame_oam 0x4000, 0x5000, 0x40, -9, -26
	banim_frame_oam 0x4000, 0x1000, 0x44, -25, -26
	banim_frame_oam 0x4000, 0x5000, 0x60, -9, -18
	banim_frame_oam 0x4000, 0x1000, 0x64, -25, -18
	banim_frame_oam 0x0, 0x1000, 0x66, -33, -18
	banim_frame_oam 0x4000, 0x9000, 0x82, -25, -10
	banim_frame_oam 0x8000, 0x1000, 0x86, -33, -10
	banim_frame_oam 0x8000, 0x1000, 0x80, 23, -26
	banim_frame_oam 0x8000, 0x1000, 0x0, -41, -16
	banim_frame_oam 0x8000, 0x1000, 0x81, -49, -16
	banim_frame_oam 0x0, 0x1000, 0x1, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -28, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -12, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -20, 8
	banim_frame_oam 0x4000, 0x5000, 0x21, -17, -34
	banim_frame_oam 0x4000, 0x1000, 0x2, -9, -42
	banim_frame_oam 0x0, 0x1000, 0x4, -17, -42
	banim_frame_end
banim_fakf_sp1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0xEC, -40, -67
	banim_frame_oam 0x0, 0x5000, 0xC1, -25, -90
	banim_frame_oam 0x4000, 0x1000, 0xC3, -33, -75
	banim_frame_oam 0x4000, 0x1000, 0xE3, -41, -67
	banim_frame_oam 0x4000, 0x1000, 0xC5, -49, -59
	banim_frame_oam 0x4000, 0x1000, 0xE5, -57, -51
	banim_frame_oam 0x4000, 0x5000, 0x87, -25, -32
	banim_frame_oam 0x0, 0x5000, 0xA9, -25, -24
	banim_frame_oam 0x8000, 0x5000, 0x2B, -33, -56
	banim_frame_oam 0x8000, 0x1000, 0xAB, -33, -24
	banim_frame_oam 0x8000, 0x5000, 0x2C, -41, -56
	banim_frame_oam 0x0, 0x1000, 0xAC, -41, -24
	banim_frame_oam 0x8000, 0x1000, 0x6D, -49, -40
	banim_frame_oam 0x8000, 0x1000, 0x6, 7, -44
	banim_frame_oam 0x0, 0x1000, 0x46, 7, -28
	banim_frame_oam 0x0, 0x1000, 0xA8, -9, -16
	banim_frame_oam 0x0, 0x1000, 0x1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -24, 8
	banim_frame_oam 0x4000, 0x5000, 0x7, -25, -64
	banim_frame_oam 0x0, 0x1000, 0xB, -33, -64
	banim_frame_oam 0x4000, 0x5000, 0x27, -25, -56
	banim_frame_oam 0x4000, 0x5000, 0x47, -25, -48
	banim_frame_oam 0x4000, 0x1000, 0x68, -17, -40
	banim_frame_oam 0x0, 0x1000, 0x6A, -25, -40
	banim_frame_oam 0x0, 0x1000, 0x67, -1, -40
	banim_frame_oam 0x0, 0x1000, 0xC, -41, -64
	banim_frame_oam 0x4000, 0x1000, 0xE9, -33, -72
	banim_frame_oam 0x0, 0x1000, 0xEB, -41, -72
	banim_frame_end
banim_fakf_sp1_2_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x5000, 0x87, -25, -32
	banim_frame_oam 0x0, 0x5000, 0xA9, -25, -24
	banim_frame_oam 0x8000, 0x5000, 0x2B, -33, -56
	banim_frame_oam 0x8000, 0x1000, 0xAB, -33, -24
	banim_frame_oam 0x8000, 0x5000, 0x2C, -41, -56
	banim_frame_oam 0x0, 0x1000, 0xAC, -41, -24
	banim_frame_oam 0x0, 0x5000, 0xCF, -19, -88
	banim_frame_oam 0x0, 0x5000, 0xD1, -35, -80
	banim_frame_oam 0x0, 0x1000, 0xCE, -35, -64
	banim_frame_oam 0x0, 0x1000, 0xAF, -27, -88
	banim_frame_oam 0x8000, 0x1000, 0x6F, -3, -88
	banim_frame_oam 0x0, 0x1000, 0x90, -14, -72
	banim_frame_oam 0x4000, 0x9000, 0x12, -67, -77
	banim_frame_oam 0x4000, 0x5000, 0x52, -67, -61
	banim_frame_oam 0x8000, 0x1000, 0x6E, -60, -53
	banim_frame_oam 0x0, 0x1000, 0x70, -52, -53
	banim_frame_oam 0x8000, 0x1000, 0x6D, -49, -40
	banim_frame_oam 0x8000, 0x1000, 0x6, 7, -44
	banim_frame_oam 0x0, 0x1000, 0x46, 7, -28
	banim_frame_oam 0x4000, 0x5000, 0x7, -25, -64
	banim_frame_oam 0x4000, 0x5000, 0x27, -25, -56
	banim_frame_oam 0x4000, 0x5000, 0x47, -25, -48
	banim_frame_oam 0x4000, 0x1000, 0x68, -17, -40
	banim_frame_oam 0x0, 0x1000, 0x6A, -25, -40
	banim_frame_oam 0x0, 0x1000, 0x67, -1, -40
	banim_frame_oam 0x0, 0x1000, 0xA8, -9, -16
	banim_frame_oam 0x0, 0x5000, 0x30, -41, -72
	banim_frame_oam 0x0, 0x1000, 0xE9, -25, -72
	banim_frame_oam 0x0, 0x1000, 0x1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -24, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x1000, 0x11, -41, -81
	banim_frame_oam 0x4000, 0x5000, 0x87, -25, -32
	banim_frame_oam 0x0, 0x5000, 0xA9, -25, -24
	banim_frame_oam 0x8000, 0x5000, 0x2B, -33, -56
	banim_frame_oam 0x8000, 0x1000, 0xAB, -33, -24
	banim_frame_oam 0x8000, 0x5000, 0x2C, -41, -56
	banim_frame_oam 0x0, 0x1000, 0xAC, -41, -24
	banim_frame_oam 0x8000, 0x1000, 0x6D, -49, -40
	banim_frame_oam 0x8000, 0x1000, 0x6, 7, -44
	banim_frame_oam 0x0, 0x1000, 0x46, 7, -28
	banim_frame_oam 0x4000, 0x5000, 0x7, -25, -64
	banim_frame_oam 0x4000, 0x5000, 0x27, -25, -56
	banim_frame_oam 0x4000, 0x5000, 0x47, -25, -48
	banim_frame_oam 0x4000, 0x1000, 0x68, -17, -40
	banim_frame_oam 0x0, 0x1000, 0x6A, -25, -40
	banim_frame_oam 0x0, 0x1000, 0x67, -1, -40
	banim_frame_oam 0x0, 0x1000, 0xA8, -9, -16
	banim_frame_oam 0x0, 0x5000, 0x30, -41, -72
	banim_frame_oam 0x0, 0x1000, 0xE9, -25, -72
	banim_frame_oam 0x0, 0x1000, 0x1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xA7, -7, -70
	banim_frame_oam 0x0, 0x5000, 0xC7, -23, -78
	banim_frame_oam 0x4000, 0x1000, 0xCC, -39, -77
	banim_frame_oam 0x4000, 0x1000, 0xED, -55, -80
	banim_frame_oam 0x4000, 0x1000, 0xAD, -71, -85
	banim_frame_end
banim_fakf_sp1_2_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0xAA, -47, -80
	banim_frame_oam 0x0, 0x1000, 0xED, -7, -70
	banim_frame_oam 0x0, 0x5000, 0x4C, -23, -78
	banim_frame_oam 0x4000, 0x1000, 0x8C, -39, -77
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -90
	banim_frame_oam 0x4000, 0x9000, 0xC4, -39, -26
	banim_frame_oam 0x0, 0x9000, 0x4, -47, -74
	banim_frame_oam 0x4000, 0x9000, 0x84, -47, -42
	banim_frame_oam 0x8000, 0x9000, 0x8, -63, -92
	banim_frame_oam 0x0, 0x5000, 0x88, -63, -60
	banim_frame_oam 0x8000, 0x5000, 0xA, -71, -92
	banim_frame_oam 0x4000, 0x1000, 0xCC, -71, -86
	banim_frame_oam 0x0, 0x5000, 0xC8, -4, -106
	banim_frame_oam 0x0, 0x1000, 0xEA, -12, -98
	banim_frame_oam 0x4000, 0x1000, 0x8A, 1, -26
	banim_frame_oam 0x8000, 0x1000, 0x4B, -55, -44
	banim_frame_oam 0x0, 0x1000, 0xB, -69, -100
	banim_frame_oam 0x0, 0x1000, 0x2B, -47, -26
	banim_frame_oam 0x0, 0x1000, 0xCA, -23, -82
	banim_frame_oam 0x4000, 0x1000, 0xAC, -55, -80
	banim_frame_oam 0x4000, 0x1000, 0xEB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, -32, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0x1000, 0xA7, -7, -70
	banim_frame_oam 0x0, 0x5000, 0xC7, -23, -78
	banim_frame_oam 0x4000, 0x1000, 0xCC, -39, -77
	banim_frame_oam 0x0, 0x9000, 0x9C, -46, -56
	banim_frame_oam 0x8000, 0x9000, 0x5A, -14, -90
	banim_frame_oam 0x0, 0x5000, 0xDA, -14, -58
	banim_frame_oam 0x4000, 0x9000, 0x5C, -54, -72
	banim_frame_oam 0x0, 0x5000, 0x1A, -63, -88
	banim_frame_oam 0x8000, 0x1000, 0x1C, -71, -88
	banim_frame_oam 0x8000, 0x1000, 0xD9, -14, -42
	banim_frame_oam 0x4000, 0x1000, 0x16, -70, -72
	banim_frame_oam 0x0, 0x1000, 0x36, -62, -64
	banim_frame_oam 0x0, 0x1000, 0x37, 2, -58
	banim_frame_oam 0x4000, 0x1000, 0x56, -47, -80
	banim_frame_oam 0x0, 0x5000, 0x18, -71, -104
	banim_frame_oam 0x8000, 0x5000, 0x59, -22, -88
	banim_frame_oam 0x0, 0x5000, 0x1D, -10, -106
	banim_frame_oam 0x4000, 0x1000, 0xED, -55, -80
	banim_frame_oam 0x4000, 0x1000, 0xAD, -71, -85
	banim_frame_oam 0x0, 0x1000, 0x1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -24, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x9000, 0xCE, -7, -86
	banim_frame_oam 0x0, 0x5000, 0xD2, -23, -86
	banim_frame_oam 0x8000, 0x9000, 0x12, -39, -94
	banim_frame_oam 0x0, 0x5000, 0x92, -39, -62
	banim_frame_oam 0x0, 0x5000, 0x90, -39, -38
	banim_frame_oam 0x4000, 0x9000, 0x4E, 9, -6
	banim_frame_oam 0x4000, 0x1000, 0x30, -7, -6
	banim_frame_oam 0x8000, 0x5000, 0x14, 41, -70
	banim_frame_oam 0x0, 0x1000, 0x94, 41, -38
	banim_frame_oam 0x0, 0x5000, 0xB4, -55, -94
	banim_frame_oam 0x4000, 0x1000, 0x2E, -22, -94
	banim_frame_oam 0x4000, 0x1000, 0x2C, 33, -78
	banim_frame_oam 0x4000, 0x1000, 0xF4, -55, -63
	banim_frame_oam 0x8000, 0x1000, 0x15, 25, -86
	banim_frame_oam 0x4000, 0x1000, 0xEB, 19, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, 11, 8
	banim_frame_oam 0x0, 0x5000, 0x9E, 33, -30
	banim_frame_oam 0x4000, 0x1000, 0xDE, 33, -14
	banim_frame_oam 0x0, 0x5000, 0x5E, 49, -22
	banim_frame_oam 0x8000, 0x1000, 0x1E, 25, -30
	banim_frame_oam 0x0, 0x1000, 0x3F, 41, -6
	banim_frame_oam 0x8000, 0xD000, 0x1A, -23, -70
	banim_frame_oam 0x0, 0x9000, 0x16, 9, -70
	banim_frame_oam 0x4000, 0x5000, 0x96, 9, -38
	banim_frame_oam 0x0, 0x5000, 0xB8, 9, -30
	banim_frame_oam 0x4000, 0x1000, 0xF8, 9, -14
	banim_frame_oam 0x0, 0x1000, 0xF7, 25, -14
	banim_frame_end
banim_fakf_sp1_2_oam_frame_36_l:
	banim_frame_oam 0x0, 0x1000, 0x95, 71, -7
	banim_frame_oam 0x8000, 0x1000, 0x55, 63, -15
	banim_frame_end
banim_fakf_sp1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0x1A, 30, -59
	banim_frame_oam 0x0, 0x5000, 0x1C, 8, -59
	banim_frame_oam 0x8000, 0x1000, 0x1E, 0, -59
	banim_frame_oam 0x4000, 0x9000, 0x5A, 13, -43
	banim_frame_oam 0x0, 0x5000, 0x5E, -3, -43
	banim_frame_oam 0x4000, 0x9000, 0xDA, 21, -11
	banim_frame_oam 0x0, 0x5000, 0xDE, 5, -11
	banim_frame_oam 0x4000, 0x9000, 0x9A, 12, -27
	banim_frame_oam 0x0, 0x5000, 0x9E, -4, -27
	banim_frame_oam 0x4000, 0x1000, 0x98, 31, -67
	banim_frame_oam 0x0, 0x5000, 0xB8, 7, -75
	banim_frame_oam 0x0, 0x1000, 0x3F, 15, -83
	banim_frame_oam 0x4000, 0x1000, 0xF8, 18, 5
	banim_frame_oam 0x0, 0x1000, 0x23, 27, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, 19, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, 11, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, 3, 8
	banim_frame_oam 0x8000, 0x1000, 0x96, -3, -11
	banim_frame_end
banim_fakf_sp1_2_oam_frame_37_l:
	banim_frame_oam 0x8000, 0x3000, 0x22, 61, -15
	banim_frame_oam 0x0, 0x3000, 0x0, 69, -7
	banim_frame_oam 0x0, 0x3000, 0x1, 53, -9
	banim_frame_end
banim_fakf_sp1_2_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_34_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_35_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_61_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, 17, -11
	banim_frame_oam 0x0, 0x5000, 0xC4, 1, -11
	banim_frame_oam 0x8000, 0x1000, 0x85, -7, -19
	banim_frame_oam 0x4000, 0x9000, 0x80, 9, -27
	banim_frame_oam 0x8000, 0x1000, 0x84, 1, -27
	banim_frame_oam 0x4000, 0x1000, 0x66, 18, 5
	banim_frame_oam 0x4000, 0x9000, 0x40, 17, -43
	banim_frame_oam 0x0, 0x5000, 0x44, 1, -43
	banim_frame_oam 0x4000, 0x1000, 0x46, 31, -51
	banim_frame_oam 0x0, 0x5000, 0x0, 33, -67
	banim_frame_oam 0x0, 0x5000, 0x2, 9, -59
	banim_frame_oam 0x8000, 0x1000, 0x4, 1, -59
	banim_frame_oam 0x0, 0x5000, 0x5, 9, -75
	banim_frame_oam 0x0, 0x1000, 0x7, 17, -83
	banim_frame_oam 0x0, 0x1000, 0x27, 49, -11
	banim_frame_oam 0x0, 0x1000, 0x87, 27, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 19, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xA7, 9, -23
	banim_frame_oam 0x0, 0x1000, 0x4E, 41, -19
	banim_frame_end
banim_fakf_sp1_2_oam_frame_38_l:
	banim_frame_oam 0x0, 0x5000, 0x8, 62, -9
	banim_frame_oam 0x4000, 0x1000, 0xA8, 46, -9
	banim_frame_end
banim_fakf_sp1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0x14, 33, -67
	banim_frame_oam 0x4000, 0x1000, 0x95, 33, -51
	banim_frame_oam 0x0, 0x1000, 0x97, 25, -51
	banim_frame_oam 0x8000, 0x1000, 0x16, 12, -75
	banim_frame_oam 0x0, 0x1000, 0x37, 4, -67
	banim_frame_oam 0x0, 0x1000, 0x17, 15, -83
	banim_frame_oam 0x0, 0x5000, 0x55, 9, -59
	banim_frame_oam 0x8000, 0x1000, 0x57, 1, -59
	banim_frame_oam 0x4000, 0x1000, 0xB6, 18, 5
	banim_frame_oam 0x0, 0x5000, 0xCF, -15, -27
	banim_frame_oam 0x0, 0x5000, 0xCD, 33, -11
	banim_frame_oam 0x0, 0x1000, 0xB5, 49, -11
	banim_frame_oam 0x0, 0x9000, 0x10, 1, -27
	banim_frame_oam 0x4000, 0x9000, 0xA, 17, -43
	banim_frame_oam 0x0, 0x5000, 0xE, 1, -43
	banim_frame_oam 0x8000, 0x1000, 0x4F, 33, -27
	banim_frame_oam 0x0, 0x1000, 0x87, 27, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 19, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xA7, 9, -23
	banim_frame_oam 0x0, 0x1000, 0x6E, -7, -11
	banim_frame_oam 0x0, 0x1000, 0x4E, 41, -19
	banim_frame_end
banim_fakf_sp1_2_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x1000, 0x1B, -15, -15
	banim_frame_oam 0x0, 0x1000, 0x1D, -23, -15
	banim_frame_oam 0x4000, 0x1000, 0x3B, -4, -39
	banim_frame_oam 0x0, 0x1000, 0x3D, -12, -39
	banim_frame_oam 0x4000, 0x9000, 0xD8, -20, -31
	banim_frame_oam 0x8000, 0x9000, 0x5A, 33, -39
	banim_frame_oam 0x8000, 0x1000, 0x5C, 25, -39
	banim_frame_oam 0x0, 0x1000, 0x5D, 17, -39
	banim_frame_oam 0x8000, 0x9000, 0x58, 49, -33
	banim_frame_oam 0x0, 0x5000, 0x14, 33, -67
	banim_frame_oam 0x4000, 0x1000, 0x95, 33, -51
	banim_frame_oam 0x0, 0x1000, 0x97, 25, -51
	banim_frame_oam 0x8000, 0x1000, 0x16, 12, -75
	banim_frame_oam 0x0, 0x1000, 0x37, 4, -67
	banim_frame_oam 0x0, 0x1000, 0x17, 15, -83
	banim_frame_oam 0x0, 0x5000, 0x55, 9, -59
	banim_frame_oam 0x8000, 0x1000, 0x57, 1, -59
	banim_frame_oam 0x4000, 0x1000, 0xB6, 18, 5
	banim_frame_oam 0x0, 0x5000, 0xCF, -15, -27
	banim_frame_oam 0x0, 0x5000, 0xCD, 33, -11
	banim_frame_oam 0x0, 0x1000, 0xB5, 49, -11
	banim_frame_oam 0x0, 0x9000, 0x10, 1, -27
	banim_frame_oam 0x4000, 0x9000, 0xA, 17, -43
	banim_frame_oam 0x0, 0x5000, 0xE, 1, -43
	banim_frame_oam 0x8000, 0x1000, 0x4F, 33, -27
	banim_frame_oam 0x0, 0x1000, 0x87, 27, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 19, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xA7, 9, -23
	banim_frame_oam 0x0, 0x1000, 0x6E, -7, -11
	banim_frame_oam 0x0, 0x1000, 0x4E, 41, -19
	banim_frame_end
banim_fakf_sp1_2_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0x18, 65, -15
	banim_frame_oam 0x0, 0x1000, 0x1A, 65, -23
	banim_frame_end
banim_fakf_sp1_2_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0x4A, 9, -33
	banim_frame_oam 0x4000, 0x5000, 0x8A, 9, -17
	banim_frame_oam 0x4000, 0x1000, 0x68, 33, -9
	banim_frame_oam 0x4000, 0x9000, 0x91, -23, -25
	banim_frame_oam 0x0, 0x1000, 0x49, 41, -33
	banim_frame_oam 0x0, 0x5000, 0x14, 33, -67
	banim_frame_oam 0x4000, 0x1000, 0x95, 33, -51
	banim_frame_oam 0x0, 0x1000, 0x97, 25, -51
	banim_frame_oam 0x8000, 0x1000, 0x16, 12, -75
	banim_frame_oam 0x0, 0x1000, 0x37, 4, -67
	banim_frame_oam 0x0, 0x1000, 0x17, 15, -83
	banim_frame_oam 0x0, 0x5000, 0x55, 9, -59
	banim_frame_oam 0x8000, 0x1000, 0x57, 1, -59
	banim_frame_oam 0x4000, 0x1000, 0xB6, 18, 5
	banim_frame_oam 0x4000, 0x9000, 0xA, 17, -43
	banim_frame_oam 0x0, 0x5000, 0xE, 1, -43
	banim_frame_oam 0x4000, 0x9000, 0x50, 1, -11
	banim_frame_oam 0x0, 0x1000, 0x6E, -7, -11
	banim_frame_oam 0x0, 0x1000, 0x87, 27, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 19, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 3, 8
	banim_frame_oam 0x4000, 0x1000, 0xED, 33, -3
	banim_frame_end
banim_fakf_sp1_2_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0xD, -17, -24
	banim_frame_oam 0x0, 0x1000, 0xF, -25, -17
	banim_frame_oam 0x4000, 0x1000, 0x2F, -1, -24
	banim_frame_oam 0x4000, 0x1000, 0x10, 31, -32
	banim_frame_oam 0x0, 0x1000, 0x12, 23, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 17, 7
	banim_frame_oam 0x4000, 0x9000, 0xA0, 9, -9
	banim_frame_oam 0x8000, 0x1000, 0xA4, 1, -9
	banim_frame_oam 0x4000, 0x9000, 0x60, 6, -25
	banim_frame_oam 0x8000, 0x1000, 0x64, -2, -25
	banim_frame_oam 0x0, 0x1000, 0x85, -10, -17
	banim_frame_oam 0x4000, 0x1000, 0xE2, -15, -9
	banim_frame_oam 0x4000, 0x5000, 0x40, 15, -33
	banim_frame_oam 0x0, 0x1000, 0x44, 7, -33
	banim_frame_oam 0x4000, 0x9000, 0x0, 17, -49
	banim_frame_oam 0x0, 0x5000, 0x4, 1, -49
	banim_frame_oam 0x0, 0x5000, 0x45, 33, -65
	banim_frame_oam 0x0, 0x1000, 0x86, 41, -73
	banim_frame_oam 0x8000, 0x1000, 0x6, 13, -73
	banim_frame_oam 0x0, 0x1000, 0x27, 5, -65
	banim_frame_oam 0x0, 0x1000, 0xE4, 41, -3
	banim_frame_oam 0x4000, 0x1000, 0x7, 9, -57
	banim_frame_oam 0x0, 0x1000, 0x9, 1, -57
	banim_frame_oam 0x4000, 0x1000, 0x28, 19, 8
	banim_frame_oam 0x0, 0x1000, 0x29, 11, 8
	banim_frame_oam 0x0, 0x1000, 0xA, 3, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_20_l:
	banim_frame_oam 0x4000, 0xD000, 0x98, 29, -21
	banim_frame_oam 0x0, 0x9000, 0x91, 55, 11
	banim_frame_oam 0x0, 0x5000, 0x95, 39, 11
	banim_frame_oam 0x4000, 0x1000, 0xD5, 39, 27
	banim_frame_oam 0x8000, 0x1000, 0x97, 31, 11
	banim_frame_oam 0x0, 0x1000, 0xD7, 23, 11
	banim_frame_oam 0x4000, 0x1000, 0xF5, 64, 43
	banim_frame_oam 0x0, 0x1000, 0xF7, 87, 30
	banim_frame_oam 0x4000, 0x9000, 0x55, 61, -37
	banim_frame_oam 0x4000, 0x9000, 0x59, 29, -37
	banim_frame_oam 0x8000, 0x9000, 0x13, 13, -21
	banim_frame_oam 0x0, 0x5000, 0x50, 13, -37
	banim_frame_oam 0x4000, 0x5000, 0x3A, 45, -45
	banim_frame_oam 0x4000, 0x9000, 0x16, 13, -53
	banim_frame_end
banim_fakf_sp1_2_oam_frame_21_l:
	banim_frame_oam 0x0, 0x5000, 0xD, 45, 33
	banim_frame_oam 0x0, 0x1000, 0xF, 37, 40
	banim_frame_oam 0x4000, 0x1000, 0x2F, 61, 33
	banim_frame_oam 0x4000, 0x1000, 0x10, 93, 25
	banim_frame_oam 0x0, 0x1000, 0x12, 85, 25
	banim_frame_oam 0x4000, 0x9000, 0xC5, 73, 46
	banim_frame_oam 0x4000, 0x1000, 0xC9, 57, 46
	banim_frame_oam 0x0, 0x1000, 0xE9, 105, 48
	banim_frame_oam 0x4000, 0x9000, 0x87, 73, 30
	banim_frame_oam 0x0, 0x5000, 0x8B, 57, 30
	banim_frame_oam 0x4000, 0x9000, 0x47, 79, 14
	banim_frame_oam 0x4000, 0x1000, 0x2A, 95, -10
	banim_frame_oam 0x4000, 0x1000, 0x4D, 69, -10
	banim_frame_oam 0x8000, 0x1000, 0xC, 77, -26
	banim_frame_oam 0x4000, 0x9000, 0xCB, 79, -2
	banim_frame_oam 0x0, 0x5000, 0xCF, 63, -2
	banim_frame_oam 0x0, 0x5000, 0x4B, 63, 14
	banim_frame_oam 0x0, 0x1000, 0x6D, 55, 22
	banim_frame_oam 0x4000, 0x1000, 0xA5, 82, 62
	banim_frame_end
banim_fakf_sp1_2_oam_frame_22_l:
	banim_frame_oam 0x0, 0x5000, 0xD, 75, 56
	banim_frame_oam 0x0, 0x1000, 0xF, 67, 63
	banim_frame_oam 0x4000, 0x1000, 0x2F, 91, 56
	banim_frame_oam 0x4000, 0x1000, 0xC9, 87, 69
	banim_frame_oam 0x0, 0x5000, 0x8B, 87, 53
	banim_frame_oam 0x4000, 0x1000, 0x4D, 99, 13
	banim_frame_oam 0x8000, 0x1000, 0xC, 107, -3
	banim_frame_oam 0x0, 0x5000, 0xCF, 93, 21
	banim_frame_oam 0x0, 0x5000, 0x4B, 93, 37
	banim_frame_oam 0x0, 0x1000, 0x6D, 85, 45
	banim_frame_oam 0x8000, 0x1000, 0xCE, 109, 21
	banim_frame_oam 0x0, 0x5000, 0x89, 103, 53
	banim_frame_oam 0x4000, 0x1000, 0xC7, 103, 69
	banim_frame_oam 0x0, 0x5000, 0x49, 109, 37
	banim_frame_end
banim_fakf_sp1_2_oam_frame_41_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, 88, -96
	banim_frame_oam 0x0, 0x5000, 0x4, 72, -96
	banim_frame_oam 0x0, 0x1000, 0x6, 120, -88
	banim_frame_oam 0x0, 0x1000, 0x26, 64, -94
	banim_frame_oam 0x0, 0x5000, 0x40, 104, -128
	banim_frame_oam 0x8000, 0x1000, 0x42, 96, -128
	banim_frame_oam 0x0, 0x1000, 0x63, 88, -120
	banim_frame_oam 0x0, 0x5000, 0x80, 96, -112
	banim_frame_oam 0x8000, 0x1000, 0x82, 88, -112
	banim_frame_oam 0x0, 0x5000, 0xC0, 96, -80
	banim_frame_oam 0x8000, 0x1000, 0xC2, 88, -80
	banim_frame_oam 0x0, 0x1000, 0x64, 80, -80
	banim_frame_oam 0x4000, 0x9000, 0x83, 88, -64
	banim_frame_oam 0x0, 0x5000, 0xC3, 104, -48
	banim_frame_oam 0x0, 0x1000, 0xC5, 96, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_42_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, 84, -96
	banim_frame_oam 0x0, 0x5000, 0x4, 68, -96
	banim_frame_oam 0x0, 0x1000, 0x6, 116, -88
	banim_frame_oam 0x0, 0x1000, 0x26, 60, -94
	banim_frame_oam 0x0, 0x5000, 0x40, 100, -128
	banim_frame_oam 0x8000, 0x1000, 0x42, 92, -128
	banim_frame_oam 0x0, 0x1000, 0x63, 84, -120
	banim_frame_oam 0x0, 0x5000, 0x80, 92, -112
	banim_frame_oam 0x8000, 0x1000, 0x82, 84, -112
	banim_frame_oam 0x0, 0x5000, 0xC0, 92, -80
	banim_frame_oam 0x8000, 0x1000, 0xC2, 84, -80
	banim_frame_oam 0x0, 0x1000, 0x64, 76, -80
	banim_frame_oam 0x4000, 0x9000, 0x83, 84, -64
	banim_frame_oam 0x0, 0x5000, 0xC3, 100, -48
	banim_frame_oam 0x0, 0x1000, 0xC5, 92, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_43_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, 80, -96
	banim_frame_oam 0x0, 0x5000, 0x4, 64, -96
	banim_frame_oam 0x0, 0x1000, 0x6, 112, -88
	banim_frame_oam 0x0, 0x1000, 0x26, 56, -94
	banim_frame_oam 0x0, 0x5000, 0x40, 96, -128
	banim_frame_oam 0x8000, 0x1000, 0x42, 88, -128
	banim_frame_oam 0x0, 0x1000, 0x63, 80, -120
	banim_frame_oam 0x0, 0x5000, 0x80, 88, -112
	banim_frame_oam 0x8000, 0x1000, 0x82, 80, -112
	banim_frame_oam 0x0, 0x5000, 0xC0, 88, -80
	banim_frame_oam 0x8000, 0x1000, 0xC2, 80, -80
	banim_frame_oam 0x0, 0x1000, 0x64, 72, -80
	banim_frame_oam 0x4000, 0x9000, 0x83, 80, -64
	banim_frame_oam 0x0, 0x5000, 0xC3, 96, -48
	banim_frame_oam 0x0, 0x1000, 0xC5, 88, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_44_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, 76, -96
	banim_frame_oam 0x0, 0x5000, 0x4, 60, -96
	banim_frame_oam 0x0, 0x1000, 0x6, 108, -88
	banim_frame_oam 0x0, 0x1000, 0x26, 52, -94
	banim_frame_oam 0x0, 0x5000, 0x40, 92, -128
	banim_frame_oam 0x8000, 0x1000, 0x42, 84, -128
	banim_frame_oam 0x0, 0x1000, 0x63, 76, -120
	banim_frame_oam 0x0, 0x5000, 0x80, 84, -112
	banim_frame_oam 0x8000, 0x1000, 0x82, 76, -112
	banim_frame_oam 0x0, 0x5000, 0xC0, 84, -80
	banim_frame_oam 0x8000, 0x1000, 0xC2, 76, -80
	banim_frame_oam 0x0, 0x1000, 0x64, 68, -80
	banim_frame_oam 0x4000, 0x9000, 0x83, 76, -64
	banim_frame_oam 0x0, 0x5000, 0xC3, 92, -48
	banim_frame_oam 0x0, 0x1000, 0xC5, 84, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_45_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, 68, -95
	banim_frame_oam 0x0, 0x5000, 0x4, 52, -95
	banim_frame_oam 0x0, 0x1000, 0x6, 100, -87
	banim_frame_oam 0x0, 0x1000, 0x26, 44, -93
	banim_frame_oam 0x0, 0x5000, 0x40, 84, -127
	banim_frame_oam 0x8000, 0x1000, 0x42, 76, -127
	banim_frame_oam 0x0, 0x1000, 0x63, 68, -119
	banim_frame_oam 0x0, 0x5000, 0x80, 76, -111
	banim_frame_oam 0x8000, 0x1000, 0x82, 68, -111
	banim_frame_oam 0x0, 0x5000, 0xC0, 76, -79
	banim_frame_oam 0x8000, 0x1000, 0xC2, 68, -79
	banim_frame_oam 0x0, 0x1000, 0x64, 60, -79
	banim_frame_oam 0x4000, 0x9000, 0x83, 68, -63
	banim_frame_oam 0x0, 0x5000, 0xC3, 84, -47
	banim_frame_oam 0x0, 0x1000, 0xC5, 76, -47
	banim_frame_end
banim_fakf_sp1_2_oam_frame_46_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, 58, -92
	banim_frame_oam 0x0, 0x5000, 0x4, 42, -92
	banim_frame_oam 0x0, 0x1000, 0x6, 90, -84
	banim_frame_oam 0x0, 0x1000, 0x26, 34, -90
	banim_frame_oam 0x0, 0x5000, 0x40, 74, -124
	banim_frame_oam 0x8000, 0x1000, 0x42, 66, -124
	banim_frame_oam 0x0, 0x1000, 0x63, 58, -116
	banim_frame_oam 0x0, 0x5000, 0x80, 66, -108
	banim_frame_oam 0x8000, 0x1000, 0x82, 58, -108
	banim_frame_oam 0x0, 0x5000, 0xC0, 66, -76
	banim_frame_oam 0x8000, 0x1000, 0xC2, 58, -76
	banim_frame_oam 0x0, 0x1000, 0x64, 50, -76
	banim_frame_oam 0x4000, 0x9000, 0x83, 58, -60
	banim_frame_oam 0x0, 0x5000, 0xC3, 74, -44
	banim_frame_oam 0x0, 0x1000, 0xC5, 66, -44
	banim_frame_end
banim_fakf_sp1_2_oam_frame_47_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, 45, -89
	banim_frame_oam 0x0, 0x5000, 0x4, 29, -89
	banim_frame_oam 0x0, 0x1000, 0x6, 77, -81
	banim_frame_oam 0x0, 0x1000, 0x26, 21, -87
	banim_frame_oam 0x0, 0x5000, 0x40, 61, -121
	banim_frame_oam 0x8000, 0x1000, 0x42, 53, -121
	banim_frame_oam 0x0, 0x1000, 0x63, 45, -113
	banim_frame_oam 0x4000, 0x1000, 0x43, 61, 127
	banim_frame_oam 0x0, 0x5000, 0x80, 53, -105
	banim_frame_oam 0x8000, 0x1000, 0x82, 45, -105
	banim_frame_oam 0x0, 0x5000, 0xC0, 53, -73
	banim_frame_oam 0x8000, 0x1000, 0xC2, 45, -73
	banim_frame_oam 0x0, 0x1000, 0x64, 37, -73
	banim_frame_oam 0x4000, 0x9000, 0x83, 45, -57
	banim_frame_oam 0x0, 0x5000, 0xC3, 61, -41
	banim_frame_oam 0x0, 0x1000, 0xC5, 53, -41
	banim_frame_end
banim_fakf_sp1_2_oam_frame_48_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, 29, -84
	banim_frame_oam 0x0, 0x5000, 0x4, 13, -84
	banim_frame_oam 0x0, 0x1000, 0x6, 61, -76
	banim_frame_oam 0x0, 0x1000, 0x26, 5, -82
	banim_frame_oam 0x0, 0x5000, 0x40, 45, -116
	banim_frame_oam 0x8000, 0x1000, 0x42, 37, -116
	banim_frame_oam 0x0, 0x1000, 0x63, 29, -108
	banim_frame_oam 0x4000, 0x1000, 0x43, 45, -124
	banim_frame_oam 0x0, 0x5000, 0x80, 37, -100
	banim_frame_oam 0x8000, 0x1000, 0x82, 29, -100
	banim_frame_oam 0x0, 0x5000, 0xC0, 37, -68
	banim_frame_oam 0x8000, 0x1000, 0xC2, 29, -68
	banim_frame_oam 0x0, 0x1000, 0x64, 21, -68
	banim_frame_oam 0x4000, 0x9000, 0x83, 29, -52
	banim_frame_oam 0x0, 0x5000, 0xC3, 45, -36
	banim_frame_oam 0x0, 0x1000, 0xC5, 37, -36
	banim_frame_end
banim_fakf_sp1_2_oam_frame_49_l:
	banim_frame_oam 0x4000, 0x1000, 0xE5, 29, 3
	banim_frame_oam 0x0, 0x1000, 0xE6, 21, 3
	banim_frame_oam 0x0, 0x1000, 0xC6, 13, 3
	banim_frame_oam 0x0, 0x1000, 0x7, 0, -49
	banim_frame_oam 0x4000, 0x9000, 0x8, 8, -65
	banim_frame_oam 0x8000, 0x1000, 0xC, 0, -65
	banim_frame_oam 0x0, 0x1000, 0x27, 40, -57
	banim_frame_oam 0x4000, 0x9000, 0xD, 24, -81
	banim_frame_oam 0x0, 0x5000, 0x11, 8, -81
	banim_frame_oam 0x0, 0x1000, 0x6B, 0, -73
	banim_frame_oam 0x4000, 0x1000, 0x49, 30, -49
	banim_frame_oam 0x0, 0x1000, 0x4B, 22, -49
	banim_frame_oam 0x4000, 0x5000, 0x4C, 16, -89
	banim_frame_oam 0x0, 0x1000, 0x50, 8, -89
	banim_frame_oam 0x0, 0x1000, 0x6A, 40, -65
	banim_frame_oam 0x4000, 0x1000, 0x6C, 48, -65
	banim_frame_end
banim_fakf_sp1_2_oam_frame_50_l:
	banim_frame_oam 0x4000, 0x1000, 0xE5, 27, 4
	banim_frame_oam 0x0, 0x1000, 0xE6, 19, 4
	banim_frame_oam 0x0, 0x1000, 0xC6, 11, 4
	banim_frame_oam 0x0, 0x1000, 0x7, -2, -48
	banim_frame_oam 0x4000, 0x9000, 0x8, 6, -64
	banim_frame_oam 0x8000, 0x1000, 0xC, -2, -64
	banim_frame_oam 0x0, 0x1000, 0x27, 38, -56
	banim_frame_oam 0x4000, 0x9000, 0xD, 22, -80
	banim_frame_oam 0x0, 0x5000, 0x11, 6, -80
	banim_frame_oam 0x0, 0x1000, 0x6B, -2, -72
	banim_frame_oam 0x4000, 0x1000, 0x49, 28, -48
	banim_frame_oam 0x0, 0x1000, 0x4B, 20, -48
	banim_frame_oam 0x4000, 0x5000, 0x4C, 14, -88
	banim_frame_oam 0x0, 0x1000, 0x50, 6, -88
	banim_frame_oam 0x0, 0x1000, 0x6A, 38, -64
	banim_frame_oam 0x4000, 0x1000, 0x6C, 46, -64
	banim_frame_end
banim_fakf_sp1_2_oam_frame_51_l:
	banim_frame_oam 0x4000, 0x1000, 0xE5, 21, 5
	banim_frame_oam 0x0, 0x1000, 0xE6, 13, 5
	banim_frame_oam 0x0, 0x1000, 0xC6, 5, 5
	banim_frame_oam 0x4000, 0x9000, 0x87, 5, -69
	banim_frame_oam 0x8000, 0x1000, 0x8B, -3, -69
	banim_frame_oam 0x4000, 0x9000, 0xC7, 13, -53
	banim_frame_oam 0x0, 0x5000, 0xCB, -3, -53
	banim_frame_oam 0x0, 0x1000, 0xAC, 37, -61
	banim_frame_oam 0x0, 0x5000, 0x8D, 5, -37
	banim_frame_oam 0x0, 0x1000, 0x8C, 21, -37
	banim_frame_oam 0x4000, 0x9000, 0xCD, -3, -85
	banim_frame_oam 0x0, 0x1000, 0x69, 29, -77
	banim_frame_end
banim_fakf_sp1_2_oam_frame_52_l:
	banim_frame_oam 0x4000, 0x1000, 0xE5, 19, 5
	banim_frame_oam 0x0, 0x1000, 0xE6, 11, 5
	banim_frame_oam 0x0, 0x1000, 0xC6, 3, 5
	banim_frame_oam 0x4000, 0x9000, 0x87, 3, -68
	banim_frame_oam 0x8000, 0x1000, 0x8B, -5, -68
	banim_frame_oam 0x4000, 0x9000, 0xC7, 11, -52
	banim_frame_oam 0x0, 0x5000, 0xCB, -5, -52
	banim_frame_oam 0x0, 0x1000, 0xAC, 35, -60
	banim_frame_oam 0x0, 0x5000, 0x8D, 3, -36
	banim_frame_oam 0x0, 0x1000, 0x8C, 19, -36
	banim_frame_oam 0x4000, 0x9000, 0xCD, -5, -84
	banim_frame_oam 0x0, 0x1000, 0x69, 27, -76
	banim_frame_end
banim_fakf_sp1_2_oam_frame_53_l:
	banim_frame_oam 0x4000, 0x1000, 0xE5, 12, 6
	banim_frame_oam 0x0, 0x1000, 0xE6, 4, 6
	banim_frame_oam 0x0, 0x1000, 0xC6, -4, 6
	banim_frame_oam 0x4000, 0x9000, 0x15, -9, -73
	banim_frame_oam 0x4000, 0x1000, 0x33, 23, -65
	banim_frame_oam 0x4000, 0x1000, 0x13, -11, -41
	banim_frame_oam 0x4000, 0x9000, 0x51, 9, -57
	banim_frame_oam 0x0, 0x5000, 0x55, -7, -57
	banim_frame_oam 0x4000, 0x1000, 0x6E, 13, -25
	banim_frame_oam 0x0, 0x1000, 0x70, 5, -25
	banim_frame_oam 0x4000, 0x9000, 0x8F, 5, -41
	banim_frame_oam 0x8000, 0x1000, 0x93, -15, -57
	banim_frame_oam 0x0, 0x1000, 0xD1, -23, -49
	banim_frame_oam 0x0, 0x1000, 0xF1, 7, -17
	banim_frame_oam 0x8000, 0x1000, 0x94, -3, -33
	banim_frame_end
banim_fakf_sp1_2_oam_frame_54_l:
	banim_frame_oam 0x4000, 0x9000, 0x15, -11, -71
	banim_frame_oam 0x4000, 0x1000, 0x33, 21, -63
	banim_frame_oam 0x4000, 0x1000, 0x13, -13, -39
	banim_frame_oam 0x4000, 0x9000, 0x51, 7, -55
	banim_frame_oam 0x0, 0x5000, 0x55, -9, -55
	banim_frame_oam 0x4000, 0x1000, 0x6E, 11, -23
	banim_frame_oam 0x0, 0x1000, 0x70, 3, -23
	banim_frame_oam 0x4000, 0x9000, 0x8F, 3, -39
	banim_frame_oam 0x8000, 0x1000, 0x93, -17, -55
	banim_frame_oam 0x0, 0x1000, 0xD1, -25, -47
	banim_frame_oam 0x0, 0x1000, 0xF1, 5, -15
	banim_frame_oam 0x8000, 0x1000, 0x94, -5, -31
	banim_frame_oam 0x4000, 0x1000, 0xE5, 10, 7
	banim_frame_oam 0x0, 0x1000, 0xE6, 2, 7
	banim_frame_oam 0x0, 0x1000, 0xC6, -6, 7
	banim_frame_end
banim_fakf_sp1_2_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x99, -23, -57
	banim_frame_oam 0x8000, 0x5000, 0x9D, -31, -73
	banim_frame_oam 0x0, 0x1000, 0x79, -23, -65
	banim_frame_oam 0x8000, 0x1000, 0xD4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x97, 9, -65
	banim_frame_oam 0x8000, 0x9000, 0x95, 25, -81
	banim_frame_oam 0x0, 0x1000, 0x77, 25, -49
	banim_frame_oam 0x0, 0x1000, 0x78, 17, -73
	banim_frame_oam 0x0, 0x1000, 0x57, 1, -65
	banim_frame_oam 0x0, 0x1000, 0x58, 9, -33
	banim_frame_oam 0x0, 0x1000, 0x59, -47, -89
	banim_frame_oam 0x8000, 0x9000, 0x5E, -47, -81
	banim_frame_oam 0x0, 0x5000, 0xDE, -13, -25
	banim_frame_oam 0x4000, 0x1000, 0xE5, -1, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -9, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x99, -24, -56
	banim_frame_oam 0x8000, 0x5000, 0x9D, -32, -72
	banim_frame_oam 0x0, 0x1000, 0x79, -24, -64
	banim_frame_oam 0x8000, 0x1000, 0xD4, -32, -40
	banim_frame_oam 0x8000, 0x9000, 0x97, 8, -64
	banim_frame_oam 0x8000, 0x9000, 0x95, 24, -80
	banim_frame_oam 0x0, 0x1000, 0x77, 24, -48
	banim_frame_oam 0x0, 0x1000, 0x78, 16, -72
	banim_frame_oam 0x0, 0x1000, 0x57, 0, -64
	banim_frame_oam 0x0, 0x1000, 0x58, 8, -32
	banim_frame_oam 0x0, 0x1000, 0x59, -48, -88
	banim_frame_oam 0x8000, 0x9000, 0x5E, -48, -80
	banim_frame_oam 0x0, 0x5000, 0xDE, -14, -24
	banim_frame_oam 0x4000, 0x1000, 0xE5, -1, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -9, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0x99, -24, -55
	banim_frame_oam 0x8000, 0x5000, 0x9D, -32, -71
	banim_frame_oam 0x0, 0x1000, 0x79, -24, -63
	banim_frame_oam 0x8000, 0x1000, 0xD4, -32, -39
	banim_frame_oam 0x8000, 0x9000, 0x97, 8, -63
	banim_frame_oam 0x8000, 0x9000, 0x95, 24, -79
	banim_frame_oam 0x0, 0x1000, 0x77, 24, -47
	banim_frame_oam 0x0, 0x1000, 0x78, 16, -71
	banim_frame_oam 0x0, 0x1000, 0x57, 0, -63
	banim_frame_oam 0x0, 0x1000, 0x58, 8, -31
	banim_frame_oam 0x0, 0x1000, 0x59, -48, -87
	banim_frame_oam 0x8000, 0x9000, 0x5E, -48, -79
	banim_frame_oam 0x0, 0x5000, 0xDE, -14, -23
	banim_frame_oam 0x4000, 0x1000, 0xE5, -3, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -11, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_28_l:
	banim_frame_oam 0x0, 0x9000, 0x99, -25, -54
	banim_frame_oam 0x8000, 0x5000, 0x9D, -33, -70
	banim_frame_oam 0x0, 0x1000, 0x79, -25, -62
	banim_frame_oam 0x8000, 0x1000, 0xD4, -33, -38
	banim_frame_oam 0x8000, 0x9000, 0x97, 7, -62
	banim_frame_oam 0x8000, 0x9000, 0x95, 23, -78
	banim_frame_oam 0x0, 0x1000, 0x77, 23, -46
	banim_frame_oam 0x0, 0x1000, 0x78, 15, -70
	banim_frame_oam 0x0, 0x1000, 0x57, -1, -62
	banim_frame_oam 0x0, 0x1000, 0x58, 7, -30
	banim_frame_oam 0x0, 0x1000, 0x59, -49, -86
	banim_frame_oam 0x8000, 0x9000, 0x5E, -49, -78
	banim_frame_oam 0x0, 0x5000, 0xDE, -15, -22
	banim_frame_oam 0x4000, 0x1000, 0xE5, -3, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -11, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x99, -25, -53
	banim_frame_oam 0x8000, 0x5000, 0x9D, -33, -69
	banim_frame_oam 0x0, 0x1000, 0x79, -25, -61
	banim_frame_oam 0x8000, 0x1000, 0xD4, -33, -37
	banim_frame_oam 0x8000, 0x9000, 0x97, 7, -61
	banim_frame_oam 0x8000, 0x9000, 0x95, 23, -77
	banim_frame_oam 0x0, 0x1000, 0x77, 23, -45
	banim_frame_oam 0x0, 0x1000, 0x78, 15, -69
	banim_frame_oam 0x0, 0x1000, 0x57, -1, -61
	banim_frame_oam 0x0, 0x1000, 0x58, 7, -29
	banim_frame_oam 0x0, 0x1000, 0x59, -49, -85
	banim_frame_oam 0x8000, 0x9000, 0x5E, -49, -77
	banim_frame_oam 0x0, 0x5000, 0xDE, -15, -21
	banim_frame_oam 0x4000, 0x1000, 0xE5, -5, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -21, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -13, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -36, -52
	banim_frame_oam 0x4000, 0x1000, 0x86, -36, -20
	banim_frame_oam 0x8000, 0x9000, 0x4, -20, -52
	banim_frame_oam 0x0, 0x5000, 0x84, -20, -20
	banim_frame_oam 0x8000, 0x9000, 0x2, -4, -63
	banim_frame_oam 0x0, 0x5000, 0x82, -4, -31
	banim_frame_oam 0x0, 0x5000, 0x40, 12, -49
	banim_frame_oam 0x4000, 0x1000, 0x80, 12, -33
	banim_frame_oam 0x0, 0x1000, 0xA1, 12, -25
	banim_frame_oam 0x0, 0x5000, 0x0, 28, -41
	banim_frame_oam 0x8000, 0x1000, 0xC0, -4, -15
	banim_frame_oam 0x0, 0x1000, 0xA0, 4, -15
	banim_frame_oam 0x0, 0x1000, 0xE3, -28, -12
	banim_frame_oam 0x0, 0x5000, 0xC1, -52, -36
	banim_frame_oam 0x0, 0x1000, 0xC3, -44, -44
	banim_frame_oam 0x4000, 0x1000, 0xE4, -11, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -27, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -19, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -36, -51
	banim_frame_oam 0x4000, 0x1000, 0x86, -36, -19
	banim_frame_oam 0x8000, 0x9000, 0x4, -20, -51
	banim_frame_oam 0x0, 0x5000, 0x84, -20, -19
	banim_frame_oam 0x8000, 0x9000, 0x2, -4, -62
	banim_frame_oam 0x0, 0x5000, 0x82, -4, -30
	banim_frame_oam 0x0, 0x5000, 0x40, 12, -48
	banim_frame_oam 0x4000, 0x1000, 0x80, 12, -32
	banim_frame_oam 0x0, 0x1000, 0xA1, 12, -24
	banim_frame_oam 0x0, 0x5000, 0x0, 28, -40
	banim_frame_oam 0x8000, 0x1000, 0xC0, -4, -14
	banim_frame_oam 0x0, 0x1000, 0xA0, 4, -14
	banim_frame_oam 0x0, 0x1000, 0xE3, -28, -11
	banim_frame_oam 0x0, 0x5000, 0xC1, -52, -35
	banim_frame_oam 0x0, 0x1000, 0xC3, -44, -43
	banim_frame_oam 0x4000, 0x1000, 0xE4, -11, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -27, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -19, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -35, -50
	banim_frame_oam 0x4000, 0x1000, 0x86, -35, -18
	banim_frame_oam 0x8000, 0x9000, 0x4, -19, -50
	banim_frame_oam 0x0, 0x5000, 0x84, -19, -18
	banim_frame_oam 0x8000, 0x9000, 0x2, -3, -61
	banim_frame_oam 0x0, 0x5000, 0x82, -3, -29
	banim_frame_oam 0x0, 0x5000, 0x40, 13, -47
	banim_frame_oam 0x4000, 0x1000, 0x80, 13, -31
	banim_frame_oam 0x0, 0x1000, 0xA1, 13, -23
	banim_frame_oam 0x0, 0x5000, 0x0, 29, -39
	banim_frame_oam 0x8000, 0x1000, 0xC0, -3, -13
	banim_frame_oam 0x0, 0x1000, 0xA0, 5, -13
	banim_frame_oam 0x0, 0x1000, 0xE3, -27, -10
	banim_frame_oam 0x0, 0x5000, 0xC1, -51, -34
	banim_frame_oam 0x0, 0x1000, 0xC3, -43, -42
	banim_frame_oam 0x4000, 0x1000, 0xE4, -10, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -26, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -18, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_40_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_55_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_56_l:
	banim_frame_oam 0x0, 0x1000, 0x0, 29, -41
	banim_frame_oam 0x8000, 0x1000, 0x22, 21, -41
	banim_frame_oam 0x0, 0x1000, 0x1, 13, -39
	banim_frame_oam 0x4000, 0x1000, 0x2, -3, -34
	banim_frame_oam 0x0, 0x1000, 0x4, -11, -34
	banim_frame_oam 0x4000, 0x9000, 0x80, -11, -32
	banim_frame_oam 0x4000, 0x9000, 0xC0, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xC4, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x84, -43, -32
	banim_frame_oam 0x4000, 0x1000, 0x60, 0, -40
	banim_frame_oam 0x4000, 0x1000, 0x62, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x20, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x21, -48, -41
	banim_frame_oam 0x4000, 0x1000, 0x64, -40, -40
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x0, 0x1000, 0xC7, 16, -11
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -24, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_57_l:
	banim_frame_oam 0x4000, 0x9000, 0xA8, -49, -53
	banim_frame_oam 0x4000, 0x5000, 0x88, -32, -61
	banim_frame_oam 0x0, 0x1000, 0x8C, -40, -61
	banim_frame_oam 0x0, 0x1000, 0xF, -17, -45
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x0, 0x1000, 0x47, -11, -39
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x48, -9, -31
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_end
banim_fakf_sp1_2_oam_frame_58_l:
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x0, 0x1000, 0x47, -11, -39
	banim_frame_oam 0x0, 0x5000, 0x48, -9, -31
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x0, 0x5000, 0xD3, -18, -36
	banim_frame_oam 0x8000, 0x1000, 0xD5, -26, -36
	banim_frame_oam 0x4000, 0x1000, 0xF0, -42, -31
	banim_frame_oam 0x8000, 0x1000, 0xD2, -50, -45
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_59_l:
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x0, 0x1000, 0x47, -11, -39
	banim_frame_oam 0x0, 0x5000, 0x48, -9, -31
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_oam 0x4000, 0x5000, 0xEA, -11, -24
	banim_frame_oam 0x4000, 0x1000, 0xEE, -3, -40
	banim_frame_oam 0x0, 0x5000, 0x53, 21, -39
	banim_frame_oam 0x8000, 0x1000, 0x55, 13, -40
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_60_l:
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x0, 0x1000, 0x47, -11, -39
	banim_frame_oam 0x0, 0x1000, 0x10, 24, -54
	banim_frame_oam 0x8000, 0x1000, 0x11, 32, -52
	banim_frame_oam 0x0, 0x1000, 0x30, -8, -44
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x48, -9, -31
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_oam 0x0, 0x5000, 0x13, 0, -60
	banim_frame_oam 0x8000, 0x1000, 0x15, -8, -60
	banim_frame_oam 0x0, 0x1000, 0x12, 16, -58
	banim_frame_end
banim_fakf_sp1_2_oam_frame_62_l:
	banim_frame_oam 0x0, 0x1000, 0x46, -10, -40
	banim_frame_oam 0x4000, 0x5000, 0xB2, -40, -42
	banim_frame_oam 0x0, 0x5000, 0xAF, 8, -42
	banim_frame_oam 0x4000, 0x1000, 0xB1, -8, -42
	banim_frame_oam 0x0, 0x1000, 0xD1, 24, -42
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x0, 0x1000, 0x47, -11, -39
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x48, -9, -31
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_end
banim_fakf_sp1_2_oam_frame_63_l:
	banim_frame_oam 0x4000, 0x1000, 0x8D, -12, -32
	banim_frame_oam 0x0, 0x1000, 0x8F, -11, -40
	banim_frame_oam 0x4000, 0x5000, 0xB2, -40, -43
	banim_frame_oam 0x0, 0x5000, 0xAF, 8, -43
	banim_frame_oam 0x4000, 0x1000, 0xB1, -8, -43
	banim_frame_oam 0x0, 0x1000, 0xD1, 24, -43
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x0, 0x1000, 0x47, -11, -39
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_oam 0x0, 0x5000, 0x48, -9, -31
	banim_frame_end
banim_fakf_sp1_2_oam_frame_64_l:
	banim_frame_oam 0x0, 0x1000, 0x67, -11, -39
	banim_frame_oam 0x4000, 0x5000, 0xB2, -41, -42
	banim_frame_oam 0x0, 0x5000, 0xAF, 7, -42
	banim_frame_oam 0x4000, 0x1000, 0xB1, -9, -42
	banim_frame_oam 0x0, 0x1000, 0xD1, 23, -42
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_oam 0x0, 0x5000, 0x48, -9, -31
	banim_frame_end
banim_fakf_sp1_2_oam_frame_65_l:
	banim_frame_oam 0x8000, 0x1000, 0x4F, -13, -31
	banim_frame_oam 0x0, 0x1000, 0x2F, -13, -39
	banim_frame_oam 0x4000, 0x5000, 0xB2, -44, -41
	banim_frame_oam 0x0, 0x5000, 0xAF, 4, -41
	banim_frame_oam 0x4000, 0x1000, 0xB1, -12, -41
	banim_frame_oam 0x0, 0x1000, 0xD1, 20, -41
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_oam 0x8000, 0x1000, 0x4E, -5, -31
	banim_frame_oam 0x0, 0x1000, 0x6D, 3, -23
	banim_frame_oam 0x0, 0x1000, 0x48, -2, -31
	banim_frame_end
banim_fakf_sp1_2_oam_frame_66_l:
	banim_frame_oam 0x4000, 0x5000, 0x90, -3, -37
	banim_frame_oam 0x4000, 0x1000, 0x94, -19, -37
	banim_frame_oam 0x8000, 0x1000, 0xAE, -9, -31
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xAC, -1, -31
	banim_frame_oam 0x0, 0x1000, 0xCD, -1, -23
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_end
banim_fakf_sp1_2_oam_frame_67_l:
	banim_frame_oam 0x4000, 0x9000, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x9000, 0x9, -36, -15
	banim_frame_oam 0x0, 0x5000, 0xD, -52, -15
	banim_frame_oam 0x0, 0x1000, 0x24, -60, -13
	banim_frame_oam 0x8000, 0x1000, 0xC6, -1, 0
	banim_frame_oam 0x4000, 0x1000, 0xE7, -17, 0
	banim_frame_oam 0x8000, 0x1000, 0x4C, -33, -31
	banim_frame_oam 0x0, 0x1000, 0x23, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x6A, -17, -23
	banim_frame_oam 0x0, 0x1000, 0x6B, -25, -26
	banim_frame_oam 0x8000, 0x1000, 0xAE, -9, -31
	banim_frame_oam 0x4000, 0x1000, 0xAC, -1, -31
	banim_frame_oam 0x0, 0x1000, 0xCD, -1, -23
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x40, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x44, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x46, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0x21, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x25, -32, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -8, -48
	banim_frame_oam 0x0, 0x5000, 0xC2, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC4, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -48, -40
	banim_frame_oam 0x0, 0x1000, 0xC1, -48, -48
	banim_frame_oam 0x4000, 0x1000, 0xC5, -48, -32
	banim_frame_oam 0x0, 0x1000, 0xE5, -40, -24
	banim_frame_oam 0x0, 0x1000, 0xC0, -24, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_68_l:
	banim_frame_oam 0x0, 0x5000, 0x71, -17, -32
	banim_frame_oam 0x0, 0x1000, 0x2F, 32, -38
	banim_frame_oam 0x0, 0x5000, 0x10, 16, -38
	banim_frame_oam 0x0, 0x1000, 0x12, 8, -30
	banim_frame_oam 0x4000, 0x1000, 0x13, -8, -29
	banim_frame_oam 0x4000, 0x1000, 0x32, -24, -25
	banim_frame_oam 0x0, 0x1000, 0x34, -32, -25
	banim_frame_oam 0x0, 0x9000, 0x89, -17, -32
	banim_frame_oam 0x8000, 0x9000, 0x8D, -33, -32
	banim_frame_oam 0x4000, 0x9000, 0x4B, -33, -48
	banim_frame_oam 0x8000, 0x9000, 0x9, -1, -64
	banim_frame_oam 0x0, 0x5000, 0xB, -25, -64
	banim_frame_oam 0x8000, 0x1000, 0xD, -33, -64
	banim_frame_oam 0x0, 0x1000, 0x2E, -9, -56
	banim_frame_oam 0x0, 0x1000, 0x88, -23, -72
	banim_frame_oam 0x4000, 0x1000, 0xE, -17, 0
	banim_frame_oam 0x8000, 0x1000, 0x8, -1, 0
	banim_frame_oam 0x0, 0x1000, 0x48, 15, -33
	banim_frame_oam 0x0, 0x1000, 0x68, 15, -12
	banim_frame_oam 0x4000, 0x1000, 0xE4, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -16, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_69_l:
	banim_frame_oam 0x0, 0x5000, 0xD8, -17, -32
	banim_frame_oam 0x0, 0x1000, 0x2F, 31, -38
	banim_frame_oam 0x0, 0x5000, 0x10, 15, -38
	banim_frame_oam 0x0, 0x1000, 0x12, 7, -30
	banim_frame_oam 0x4000, 0x1000, 0x13, -9, -29
	banim_frame_oam 0x4000, 0x1000, 0x32, -25, -25
	banim_frame_oam 0x0, 0x1000, 0x34, -33, -25
	banim_frame_oam 0x4000, 0x1000, 0xF1, -17, -1
	banim_frame_oam 0x0, 0x5000, 0xB1, -31, -17
	banim_frame_oam 0x8000, 0x1000, 0xD3, -1, -1
	banim_frame_oam 0x8000, 0x1000, 0xD4, -23, -33
	banim_frame_oam 0x4000, 0x9000, 0x93, -31, -49
	banim_frame_oam 0x0, 0x5000, 0xD5, -23, -65
	banim_frame_oam 0x8000, 0x1000, 0xD7, -31, -65
	banim_frame_oam 0x0, 0x1000, 0xB7, -7, -57
	banim_frame_oam 0x0, 0x1000, 0x73, -18, -73
	banim_frame_oam 0x0, 0x1000, 0x74, 17, -10
	banim_frame_oam 0x0, 0x1000, 0x54, -31, -25
	banim_frame_oam 0x0, 0x9000, 0x15, -15, -33
	banim_frame_oam 0x8000, 0x9000, 0x19, 1, -65
	banim_frame_oam 0x4000, 0x1000, 0xE4, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_70_l:
	banim_frame_oam 0x4000, 0x9000, 0xCE, -7, -86
	banim_frame_oam 0x0, 0x5000, 0xD2, -23, -86
	banim_frame_oam 0x8000, 0x9000, 0x12, -39, -94
	banim_frame_oam 0x0, 0x5000, 0x92, -39, -62
	banim_frame_oam 0x0, 0x5000, 0x90, -39, -38
	banim_frame_oam 0x4000, 0x9000, 0x4E, 9, -6
	banim_frame_oam 0x4000, 0x1000, 0x30, -7, -6
	banim_frame_oam 0x8000, 0x5000, 0x14, 41, -70
	banim_frame_oam 0x0, 0x1000, 0x94, 41, -38
	banim_frame_oam 0x0, 0x5000, 0xB4, -55, -94
	banim_frame_oam 0x4000, 0x1000, 0x2E, -22, -94
	banim_frame_oam 0x4000, 0x1000, 0x2C, 33, -78
	banim_frame_oam 0x4000, 0x1000, 0xF4, -55, -63
	banim_frame_oam 0x8000, 0x1000, 0x15, 25, -86
	banim_frame_oam 0x4000, 0x1000, 0xEB, 19, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, 11, 8
	banim_frame_oam 0x0, 0x5000, 0x9E, 33, -30
	banim_frame_oam 0x4000, 0x1000, 0xDE, 33, -14
	banim_frame_oam 0x0, 0x5000, 0x5E, 49, -22
	banim_frame_oam 0x8000, 0x1000, 0x1E, 25, -30
	banim_frame_oam 0x0, 0x1000, 0x3F, 41, -6
	banim_frame_oam 0x8000, 0xD000, 0x1A, -23, -70
	banim_frame_oam 0x0, 0x9000, 0x16, 9, -70
	banim_frame_oam 0x4000, 0x5000, 0x96, 9, -38
	banim_frame_oam 0x0, 0x5000, 0xB8, 9, -30
	banim_frame_oam 0x4000, 0x1000, 0xF8, 9, -14
	banim_frame_oam 0x0, 0x1000, 0xF7, 25, -14
	banim_frame_end
banim_fakf_sp1_2_oam_frame_71_l:
	banim_frame_oam 0x0, 0x5000, 0x1A, 30, -59
	banim_frame_oam 0x0, 0x5000, 0x1C, 8, -59
	banim_frame_oam 0x8000, 0x1000, 0x1E, 0, -59
	banim_frame_oam 0x4000, 0x9000, 0x5A, 13, -43
	banim_frame_oam 0x0, 0x5000, 0x5E, -3, -43
	banim_frame_oam 0x4000, 0x9000, 0xDA, 21, -11
	banim_frame_oam 0x0, 0x5000, 0xDE, 5, -11
	banim_frame_oam 0x4000, 0x9000, 0x9A, 12, -27
	banim_frame_oam 0x0, 0x5000, 0x9E, -4, -27
	banim_frame_oam 0x4000, 0x1000, 0x98, 31, -67
	banim_frame_oam 0x0, 0x5000, 0xB8, 7, -75
	banim_frame_oam 0x0, 0x1000, 0x3F, 15, -83
	banim_frame_oam 0x4000, 0x1000, 0xF8, 18, 5
	banim_frame_oam 0x0, 0x1000, 0x23, 27, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, 19, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, 11, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, 3, 8
	banim_frame_oam 0x8000, 0x1000, 0x96, -3, -11
	banim_frame_oam 0x8000, 0x3000, 0x22, 61, -15
	banim_frame_oam 0x0, 0x3000, 0x0, 69, -7
	banim_frame_oam 0x0, 0x3000, 0x1, 53, -9
	banim_frame_end
banim_fakf_sp1_2_oam_frame_72_l:
	banim_frame_oam 0x0, 0x5000, 0x8, 62, -9
	banim_frame_oam 0x4000, 0x1000, 0xA8, 46, -9
	banim_frame_oam 0x4000, 0x9000, 0xC0, 17, -11
	banim_frame_oam 0x0, 0x5000, 0xC4, 1, -11
	banim_frame_oam 0x8000, 0x1000, 0x85, -7, -19
	banim_frame_oam 0x4000, 0x9000, 0x80, 9, -27
	banim_frame_oam 0x8000, 0x1000, 0x84, 1, -27
	banim_frame_oam 0x4000, 0x1000, 0x66, 18, 5
	banim_frame_oam 0x4000, 0x9000, 0x40, 17, -43
	banim_frame_oam 0x0, 0x5000, 0x44, 1, -43
	banim_frame_oam 0x4000, 0x1000, 0x46, 31, -51
	banim_frame_oam 0x0, 0x5000, 0x0, 33, -67
	banim_frame_oam 0x0, 0x5000, 0x2, 9, -59
	banim_frame_oam 0x8000, 0x1000, 0x4, 1, -59
	banim_frame_oam 0x0, 0x5000, 0x5, 9, -75
	banim_frame_oam 0x0, 0x1000, 0x7, 17, -83
	banim_frame_oam 0x0, 0x1000, 0x27, 49, -11
	banim_frame_oam 0x0, 0x1000, 0x87, 27, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 19, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xA7, 9, -23
	banim_frame_oam 0x0, 0x1000, 0x4E, 41, -19
	banim_frame_end
banim_fakf_sp1_2_oam_frame_73_l:
	banim_frame_oam 0x0, 0x5000, 0x14, 33, -67
	banim_frame_oam 0x4000, 0x1000, 0x95, 33, -51
	banim_frame_oam 0x0, 0x1000, 0x97, 25, -51
	banim_frame_oam 0x8000, 0x1000, 0x16, 12, -75
	banim_frame_oam 0x0, 0x1000, 0x37, 4, -67
	banim_frame_oam 0x0, 0x1000, 0x17, 15, -83
	banim_frame_oam 0x0, 0x5000, 0x55, 9, -59
	banim_frame_oam 0x8000, 0x1000, 0x57, 1, -59
	banim_frame_oam 0x4000, 0x1000, 0xB6, 18, 5
	banim_frame_oam 0x0, 0x5000, 0xCF, -15, -27
	banim_frame_oam 0x0, 0x5000, 0xCD, 33, -11
	banim_frame_oam 0x0, 0x1000, 0xB5, 49, -11
	banim_frame_oam 0x0, 0x9000, 0x10, 1, -27
	banim_frame_oam 0x4000, 0x9000, 0xA, 17, -43
	banim_frame_oam 0x0, 0x5000, 0xE, 1, -43
	banim_frame_oam 0x8000, 0x1000, 0x4F, 33, -27
	banim_frame_oam 0x0, 0x1000, 0x87, 27, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 19, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xA7, 9, -23
	banim_frame_oam 0x0, 0x1000, 0x6E, -7, -11
	banim_frame_oam 0x0, 0x1000, 0x4E, 41, -19
	banim_frame_oam 0x0, 0x5000, 0x8, 62, -9
	banim_frame_oam 0x4000, 0x1000, 0xA8, 46, -9
	banim_frame_end
banim_fakf_sp1_2_oam_frame_74_l:
	banim_frame_oam 0x4000, 0x1000, 0x1B, -15, -15
	banim_frame_oam 0x0, 0x1000, 0x1D, -23, -15
	banim_frame_oam 0x4000, 0x1000, 0x3B, -4, -39
	banim_frame_oam 0x0, 0x1000, 0x3D, -12, -39
	banim_frame_oam 0x4000, 0x9000, 0xD8, -20, -31
	banim_frame_oam 0x8000, 0x9000, 0x5A, 33, -39
	banim_frame_oam 0x8000, 0x1000, 0x5C, 25, -39
	banim_frame_oam 0x0, 0x1000, 0x5D, 17, -39
	banim_frame_oam 0x8000, 0x9000, 0x58, 49, -33
	banim_frame_oam 0x0, 0x5000, 0x14, 33, -67
	banim_frame_oam 0x4000, 0x1000, 0x95, 33, -51
	banim_frame_oam 0x0, 0x1000, 0x97, 25, -51
	banim_frame_oam 0x8000, 0x1000, 0x16, 12, -75
	banim_frame_oam 0x0, 0x1000, 0x37, 4, -67
	banim_frame_oam 0x0, 0x1000, 0x17, 15, -83
	banim_frame_oam 0x0, 0x5000, 0x55, 9, -59
	banim_frame_oam 0x8000, 0x1000, 0x57, 1, -59
	banim_frame_oam 0x4000, 0x1000, 0xB6, 18, 5
	banim_frame_oam 0x0, 0x5000, 0xCF, -15, -27
	banim_frame_oam 0x0, 0x5000, 0xCD, 33, -11
	banim_frame_oam 0x0, 0x1000, 0xB5, 49, -11
	banim_frame_oam 0x0, 0x9000, 0x10, 1, -27
	banim_frame_oam 0x4000, 0x9000, 0xA, 17, -43
	banim_frame_oam 0x0, 0x5000, 0xE, 1, -43
	banim_frame_oam 0x8000, 0x1000, 0x4F, 33, -27
	banim_frame_oam 0x0, 0x1000, 0x87, 27, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 19, 8
	banim_frame_oam 0x0, 0x1000, 0x88, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xA7, 9, -23
	banim_frame_oam 0x0, 0x1000, 0x6E, -7, -11
	banim_frame_oam 0x0, 0x1000, 0x4E, 41, -19
	banim_frame_oam 0x0, 0x5000, 0x18, 65, -15
	banim_frame_oam 0x0, 0x1000, 0x1A, 65, -23
	banim_frame_end
banim_fakf_sp1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0xEC, -33, -53
	banim_frame_oam 0x0, 0x5000, 0xC1, -18, -76
	banim_frame_oam 0x4000, 0x1000, 0xC3, -26, -61
	banim_frame_oam 0x4000, 0x1000, 0xE3, -34, -53
	banim_frame_oam 0x4000, 0x1000, 0xC5, -42, -45
	banim_frame_oam 0x4000, 0x1000, 0xE5, -50, -37
	banim_frame_oam 0x4000, 0x5000, 0x87, -18, -18
	banim_frame_oam 0x0, 0x5000, 0xA9, -18, -10
	banim_frame_oam 0x8000, 0x5000, 0x2B, -26, -42
	banim_frame_oam 0x8000, 0x1000, 0xAB, -26, -10
	banim_frame_oam 0x8000, 0x5000, 0x2C, -34, -42
	banim_frame_oam 0x0, 0x1000, 0xAC, -34, -10
	banim_frame_oam 0x8000, 0x1000, 0x6D, -42, -26
	banim_frame_oam 0x8000, 0x1000, 0x6, 14, -30
	banim_frame_oam 0x0, 0x1000, 0x46, 14, -14
	banim_frame_oam 0x0, 0x1000, 0xA8, -3, -3
	banim_frame_oam 0x0, 0x1000, 0x1, -3, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -27, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -11, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -19, 8
	banim_frame_oam 0x4000, 0x5000, 0x7, -18, -50
	banim_frame_oam 0x0, 0x1000, 0xB, -26, -50
	banim_frame_oam 0x4000, 0x5000, 0x27, -18, -42
	banim_frame_oam 0x4000, 0x5000, 0x47, -18, -34
	banim_frame_oam 0x4000, 0x1000, 0x68, -10, -26
	banim_frame_oam 0x0, 0x1000, 0x6A, -18, -26
	banim_frame_oam 0x0, 0x1000, 0x67, 6, -26
	banim_frame_oam 0x0, 0x1000, 0xC, -34, -50
	banim_frame_oam 0x4000, 0x1000, 0xE9, -26, -58
	banim_frame_oam 0x0, 0x1000, 0xEB, -34, -58
	banim_frame_end
banim_fakf_sp1_2_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x1000, 0x7D, -39, -50
	banim_frame_oam 0x0, 0x1000, 0x5E, -39, -58
	banim_frame_oam 0x0, 0x1000, 0x57, -40, -66
	banim_frame_oam 0x0, 0x5000, 0x71, -39, -50
	banim_frame_oam 0x4000, 0x1000, 0x73, -39, -58
	banim_frame_oam 0x8000, 0x1000, 0x5F, -47, -58
	banim_frame_oam 0x0, 0x5000, 0xC1, -20, -77
	banim_frame_oam 0x4000, 0x1000, 0xC3, -28, -62
	banim_frame_oam 0x4000, 0x1000, 0xE3, -36, -54
	banim_frame_oam 0x4000, 0x1000, 0xC5, -44, -46
	banim_frame_oam 0x4000, 0x1000, 0xE5, -52, -38
	banim_frame_oam 0x0, 0x9000, 0x9C, -39, -42
	banim_frame_oam 0x8000, 0x9000, 0x5A, -7, -76
	banim_frame_oam 0x0, 0x5000, 0xDA, -7, -44
	banim_frame_oam 0x0, 0x5000, 0x1A, -56, -74
	banim_frame_oam 0x8000, 0x1000, 0x1C, -64, -74
	banim_frame_oam 0x8000, 0x1000, 0xD9, -7, -28
	banim_frame_oam 0x4000, 0x1000, 0x16, -62, -58
	banim_frame_oam 0x0, 0x1000, 0x36, -54, -50
	banim_frame_oam 0x0, 0x1000, 0x37, 9, -44
	banim_frame_oam 0x0, 0x5000, 0x18, -64, -90
	banim_frame_oam 0x8000, 0x5000, 0x59, -15, -74
	banim_frame_oam 0x0, 0x5000, 0x1D, -3, -92
	banim_frame_oam 0x8000, 0x1000, 0x5C, -23, -58
	banim_frame_oam 0x0, 0x1000, 0x1, -6, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -30, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -14, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -22, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x1000, 0xEC, -34, -57
	banim_frame_oam 0x0, 0x5000, 0xC1, -19, -80
	banim_frame_oam 0x4000, 0x1000, 0xC3, -27, -65
	banim_frame_oam 0x4000, 0x1000, 0xE3, -35, -57
	banim_frame_oam 0x4000, 0x1000, 0xC5, -43, -49
	banim_frame_oam 0x4000, 0x1000, 0xE5, -51, -41
	banim_frame_oam 0x4000, 0x5000, 0x40, -19, -46
	banim_frame_oam 0x4000, 0x1000, 0x44, -35, -46
	banim_frame_oam 0x4000, 0x5000, 0x60, -19, -38
	banim_frame_oam 0x4000, 0x1000, 0x64, -35, -38
	banim_frame_oam 0x0, 0x1000, 0x66, -43, -38
	banim_frame_oam 0x4000, 0x9000, 0x82, -35, -30
	banim_frame_oam 0x8000, 0x1000, 0x86, -43, -30
	banim_frame_oam 0x8000, 0x1000, 0x80, 13, -46
	banim_frame_oam 0x8000, 0x1000, 0x0, -51, -36
	banim_frame_oam 0x8000, 0x1000, 0x81, -59, -36
	banim_frame_oam 0x0, 0x1000, 0x1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x21, -11, -54
	banim_frame_oam 0x4000, 0x1000, 0xA, -27, -54
	banim_frame_oam 0x0, 0x1000, 0xC, -35, -54
	banim_frame_oam 0x4000, 0x1000, 0xE9, -27, -62
	banim_frame_oam 0x0, 0x1000, 0xEB, -35, -62
	banim_frame_end
banim_fakf_sp1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0xEC, -35, -59
	banim_frame_oam 0x0, 0x5000, 0xC1, -20, -82
	banim_frame_oam 0x4000, 0x1000, 0xC3, -28, -67
	banim_frame_oam 0x4000, 0x1000, 0xE3, -36, -59
	banim_frame_oam 0x4000, 0x1000, 0xC5, -44, -51
	banim_frame_oam 0x4000, 0x1000, 0xE5, -52, -43
	banim_frame_oam 0x4000, 0x5000, 0x40, -20, -48
	banim_frame_oam 0x4000, 0x1000, 0x44, -36, -48
	banim_frame_oam 0x4000, 0x5000, 0x60, -20, -40
	banim_frame_oam 0x4000, 0x1000, 0x64, -36, -40
	banim_frame_oam 0x0, 0x1000, 0x66, -44, -40
	banim_frame_oam 0x4000, 0x9000, 0x82, -36, -32
	banim_frame_oam 0x8000, 0x1000, 0x86, -44, -32
	banim_frame_oam 0x8000, 0x1000, 0x80, 12, -48
	banim_frame_oam 0x8000, 0x1000, 0x0, -52, -38
	banim_frame_oam 0x8000, 0x1000, 0x81, -60, -38
	banim_frame_oam 0x0, 0x1000, 0x1, -9, 8
	banim_frame_oam 0x0, 0x1000, 0xC0, -33, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -17, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -25, 8
	banim_frame_oam 0x4000, 0x1000, 0x21, -12, -56
	banim_frame_oam 0x4000, 0x1000, 0xA, -28, -56
	banim_frame_oam 0x0, 0x1000, 0xC, -36, -56
	banim_frame_oam 0x4000, 0x1000, 0xE9, -28, -64
	banim_frame_oam 0x0, 0x1000, 0xEB, -36, -64
	banim_frame_end
	.section .data.oam_r
banim_fakf_sp1_2_oam_r:
banim_fakf_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0x46, 0, -32
	banim_frame_oam 0x0, 0x0, 0x48, 16, -32
	banim_frame_oam 0x4000, 0x0, 0x66, 0, -24
	banim_frame_oam 0x0, 0x0, 0xE0, -39, -37
	banim_frame_oam 0x0, 0x4000, 0x86, -31, -37
	banim_frame_oam 0x4000, 0x0, 0x88, -15, -30
	banim_frame_oam 0x4000, 0x0, 0xA8, 1, -26
	banim_frame_oam 0x4000, 0x0, 0xC6, 17, -25
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -48
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -48
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, -16
	banim_frame_oam 0x0, 0x4000, 0x84, 16, -16
	banim_frame_oam 0x4000, 0x0, 0xC1, -8, 0
	banim_frame_oam 0x0, 0x0, 0xC3, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x4000, 0x6, -14, -64
	banim_frame_oam 0x4000, 0x4000, 0x28, 2, -56
	banim_frame_oam 0x4000, 0x0, 0x9, 10, -64
	banim_frame_oam 0x0, 0x0, 0xB, 26, -64
	banim_frame_oam 0x0, 0x0, 0x8, 16, -72
	banim_frame_oam 0x0, 0x0, 0xC0, -24, -13
	banim_frame_end
banim_fakf_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x4000, 0xB1, -8, -33
	banim_frame_oam 0x4000, 0x0, 0xD2, 0, -25
	banim_frame_oam 0x0, 0x0, 0xD4, 16, -25
	banim_frame_oam 0x0, 0x4000, 0x11, -36, -45
	banim_frame_oam 0x4000, 0x0, 0x51, -12, -35
	banim_frame_oam 0x4000, 0x0, 0x72, -4, -27
	banim_frame_oam 0x8000, 0x0, 0x71, 12, -29
	banim_frame_oam 0x0, 0x0, 0x92, 20, -21
	banim_frame_oam 0x0, 0x0, 0x93, -20, -38
	banim_frame_oam 0x8000, 0xC000, 0xC, -16, -56
	banim_frame_oam 0x8000, 0x4000, 0x10, 16, -56
	banim_frame_oam 0x8000, 0x4000, 0x90, 16, -24
	banim_frame_oam 0x0, 0x4000, 0x49, 10, -72
	banim_frame_oam 0x8000, 0x0, 0x4B, 26, -72
	banim_frame_oam 0x0, 0x0, 0xC0, -24, -14
	banim_frame_oam 0x0, 0x0, 0xE6, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 0, 8
	banim_frame_oam 0x0, 0x0, 0x68, -8, 8
	banim_frame_oam 0x4000, 0x0, 0xE7, 24, -24
	banim_frame_oam 0x0, 0x0, 0xC8, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xC9, -16, -72
	banim_frame_oam 0x0, 0x0, 0xEA, -8, -64
	banim_frame_oam 0x0, 0x0, 0xAB, 24, -40
	banim_frame_oam 0x4000, 0x0, 0x8A, 24, -56
	banim_frame_oam 0x0, 0x0, 0xAA, 24, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, -6, -35
	banim_frame_oam 0x8000, 0x0, 0x1D, 10, -35
	banim_frame_oam 0x0, 0x4000, 0x11, -36, -46
	banim_frame_oam 0x4000, 0x0, 0x51, -12, -36
	banim_frame_oam 0x4000, 0x0, 0x72, -4, -28
	banim_frame_oam 0x8000, 0x0, 0x71, 12, -30
	banim_frame_oam 0x0, 0x0, 0x92, 20, -22
	banim_frame_oam 0x0, 0x0, 0x93, -20, -39
	banim_frame_oam 0x8000, 0x0, 0xD1, -22, -19
	banim_frame_oam 0x0, 0x4000, 0x14, -22, -59
	banim_frame_oam 0x8000, 0x0, 0x16, -6, -59
	banim_frame_oam 0x4000, 0x8000, 0x55, -14, -43
	banim_frame_oam 0x0, 0x4000, 0x59, 18, -43
	banim_frame_oam 0x0, 0x8000, 0x95, -14, -27
	banim_frame_oam 0x8000, 0x0, 0xB9, 18, -19
	banim_frame_oam 0x0, 0x0, 0xF9, 18, -3
	banim_frame_oam 0x8000, 0x0, 0xBA, 26, -19
	banim_frame_oam 0x0, 0x0, 0x37, 2, -51
	banim_frame_oam 0x0, 0x4000, 0x18, 10, -59
	banim_frame_oam 0x8000, 0x0, 0x1A, 26, -59
	banim_frame_oam 0x4000, 0x0, 0xF3, 15, -67
	banim_frame_oam 0x0, 0x0, 0xF2, 15, -75
	banim_frame_oam 0x0, 0x0, 0x17, -17, -67
	banim_frame_oam 0x0, 0x0, 0x99, 18, -27
	banim_frame_oam 0x0, 0x0, 0xE6, 17, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 9, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 1, 8
	banim_frame_oam 0x0, 0x0, 0x68, -7, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0x5, -5, -41
	banim_frame_oam 0x0, 0x4000, 0xD, -31, -58
	banim_frame_oam 0x0, 0x0, 0x4D, -15, -48
	banim_frame_oam 0x0, 0x0, 0xF, -7, -43
	banim_frame_oam 0x8000, 0x0, 0x2F, 1, -42
	banim_frame_oam 0x0, 0x0, 0x4E, 9, -32
	banim_frame_oam 0x0, 0x0, 0x10, 17, -29
	banim_frame_oam 0x4000, 0x4000, 0x40, -23, -26
	banim_frame_oam 0x4000, 0x0, 0x44, 9, -26
	banim_frame_oam 0x4000, 0x4000, 0x60, -23, -18
	banim_frame_oam 0x4000, 0x0, 0x64, 9, -18
	banim_frame_oam 0x0, 0x0, 0x66, 25, -18
	banim_frame_oam 0x4000, 0x8000, 0x82, -7, -10
	banim_frame_oam 0x8000, 0x0, 0x86, 25, -10
	banim_frame_oam 0x8000, 0x0, 0x80, -31, -26
	banim_frame_oam 0x8000, 0x0, 0x0, 33, -16
	banim_frame_oam 0x8000, 0x0, 0x81, 41, -16
	banim_frame_oam 0x0, 0x0, 0x1, -4, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 20, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 4, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 12, 8
	banim_frame_oam 0x4000, 0x4000, 0x21, -15, -34
	banim_frame_oam 0x4000, 0x0, 0x2, -7, -42
	banim_frame_oam 0x0, 0x0, 0x4, 9, -42
	banim_frame_end
banim_fakf_sp1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0xEC, 32, -67
	banim_frame_oam 0x0, 0x4000, 0xC1, 9, -90
	banim_frame_oam 0x4000, 0x0, 0xC3, 17, -75
	banim_frame_oam 0x4000, 0x0, 0xE3, 25, -67
	banim_frame_oam 0x4000, 0x0, 0xC5, 33, -59
	banim_frame_oam 0x4000, 0x0, 0xE5, 41, -51
	banim_frame_oam 0x4000, 0x4000, 0x87, -7, -32
	banim_frame_oam 0x0, 0x4000, 0xA9, 9, -24
	banim_frame_oam 0x8000, 0x4000, 0x2B, 25, -56
	banim_frame_oam 0x8000, 0x0, 0xAB, 25, -24
	banim_frame_oam 0x8000, 0x4000, 0x2C, 33, -56
	banim_frame_oam 0x0, 0x0, 0xAC, 33, -24
	banim_frame_oam 0x8000, 0x0, 0x6D, 41, -40
	banim_frame_oam 0x8000, 0x0, 0x6, -15, -44
	banim_frame_oam 0x0, 0x0, 0x46, -15, -28
	banim_frame_oam 0x0, 0x0, 0xA8, 1, -16
	banim_frame_oam 0x0, 0x0, 0x1, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 24, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 16, 8
	banim_frame_oam 0x4000, 0x4000, 0x7, -7, -64
	banim_frame_oam 0x0, 0x0, 0xB, 25, -64
	banim_frame_oam 0x4000, 0x4000, 0x27, -7, -56
	banim_frame_oam 0x4000, 0x4000, 0x47, -7, -48
	banim_frame_oam 0x4000, 0x0, 0x68, 1, -40
	banim_frame_oam 0x0, 0x0, 0x6A, 17, -40
	banim_frame_oam 0x0, 0x0, 0x67, -7, -40
	banim_frame_oam 0x0, 0x0, 0xC, 33, -64
	banim_frame_oam 0x4000, 0x0, 0xE9, 17, -72
	banim_frame_oam 0x0, 0x0, 0xEB, 33, -72
	banim_frame_end
banim_fakf_sp1_2_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x4000, 0x87, -7, -32
	banim_frame_oam 0x0, 0x4000, 0xA9, 9, -24
	banim_frame_oam 0x8000, 0x4000, 0x2B, 25, -56
	banim_frame_oam 0x8000, 0x0, 0xAB, 25, -24
	banim_frame_oam 0x8000, 0x4000, 0x2C, 33, -56
	banim_frame_oam 0x0, 0x0, 0xAC, 33, -24
	banim_frame_oam 0x0, 0x4000, 0xCF, 3, -88
	banim_frame_oam 0x0, 0x4000, 0xD1, 19, -80
	banim_frame_oam 0x0, 0x0, 0xCE, 27, -64
	banim_frame_oam 0x0, 0x0, 0xAF, 19, -88
	banim_frame_oam 0x8000, 0x0, 0x6F, -5, -88
	banim_frame_oam 0x0, 0x0, 0x90, 6, -72
	banim_frame_oam 0x4000, 0x8000, 0x12, 35, -77
	banim_frame_oam 0x4000, 0x4000, 0x52, 35, -61
	banim_frame_oam 0x8000, 0x0, 0x6E, 52, -53
	banim_frame_oam 0x0, 0x0, 0x70, 44, -53
	banim_frame_oam 0x8000, 0x0, 0x6D, 41, -40
	banim_frame_oam 0x8000, 0x0, 0x6, -15, -44
	banim_frame_oam 0x0, 0x0, 0x46, -15, -28
	banim_frame_oam 0x4000, 0x4000, 0x7, -7, -64
	banim_frame_oam 0x4000, 0x4000, 0x27, -7, -56
	banim_frame_oam 0x4000, 0x4000, 0x47, -7, -48
	banim_frame_oam 0x4000, 0x0, 0x68, 1, -40
	banim_frame_oam 0x0, 0x0, 0x6A, 17, -40
	banim_frame_oam 0x0, 0x0, 0x67, -7, -40
	banim_frame_oam 0x0, 0x0, 0xA8, 1, -16
	banim_frame_oam 0x0, 0x4000, 0x30, 25, -72
	banim_frame_oam 0x0, 0x0, 0xE9, 17, -72
	banim_frame_oam 0x0, 0x0, 0x1, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 24, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 16, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x0, 0x11, 33, -81
	banim_frame_oam 0x4000, 0x4000, 0x87, -7, -32
	banim_frame_oam 0x0, 0x4000, 0xA9, 9, -24
	banim_frame_oam 0x8000, 0x4000, 0x2B, 25, -56
	banim_frame_oam 0x8000, 0x0, 0xAB, 25, -24
	banim_frame_oam 0x8000, 0x4000, 0x2C, 33, -56
	banim_frame_oam 0x0, 0x0, 0xAC, 33, -24
	banim_frame_oam 0x8000, 0x0, 0x6D, 41, -40
	banim_frame_oam 0x8000, 0x0, 0x6, -15, -44
	banim_frame_oam 0x0, 0x0, 0x46, -15, -28
	banim_frame_oam 0x4000, 0x4000, 0x7, -7, -64
	banim_frame_oam 0x4000, 0x4000, 0x27, -7, -56
	banim_frame_oam 0x4000, 0x4000, 0x47, -7, -48
	banim_frame_oam 0x4000, 0x0, 0x68, 1, -40
	banim_frame_oam 0x0, 0x0, 0x6A, 17, -40
	banim_frame_oam 0x0, 0x0, 0x67, -7, -40
	banim_frame_oam 0x0, 0x0, 0xA8, 1, -16
	banim_frame_oam 0x0, 0x4000, 0x30, 25, -72
	banim_frame_oam 0x0, 0x0, 0xE9, 17, -72
	banim_frame_oam 0x0, 0x0, 0x1, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 24, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 16, 8
	banim_frame_oam 0x0, 0x0, 0xA7, -1, -70
	banim_frame_oam 0x0, 0x4000, 0xC7, 7, -78
	banim_frame_oam 0x4000, 0x0, 0xCC, 23, -77
	banim_frame_oam 0x4000, 0x0, 0xED, 39, -80
	banim_frame_oam 0x4000, 0x0, 0xAD, 55, -85
	banim_frame_end
banim_fakf_sp1_2_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0xAA, 31, -80
	banim_frame_oam 0x0, 0x0, 0xED, -1, -70
	banim_frame_oam 0x0, 0x4000, 0x4C, 7, -78
	banim_frame_oam 0x4000, 0x0, 0x8C, 23, -77
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -90
	banim_frame_oam 0x4000, 0x8000, 0xC4, 7, -26
	banim_frame_oam 0x0, 0x8000, 0x4, 15, -74
	banim_frame_oam 0x4000, 0x8000, 0x84, 15, -42
	banim_frame_oam 0x8000, 0x8000, 0x8, 47, -92
	banim_frame_oam 0x0, 0x4000, 0x88, 47, -60
	banim_frame_oam 0x8000, 0x4000, 0xA, 63, -92
	banim_frame_oam 0x4000, 0x0, 0xCC, 55, -86
	banim_frame_oam 0x0, 0x4000, 0xC8, -12, -106
	banim_frame_oam 0x0, 0x0, 0xEA, 4, -98
	banim_frame_oam 0x4000, 0x0, 0x8A, -17, -26
	banim_frame_oam 0x8000, 0x0, 0x4B, 47, -44
	banim_frame_oam 0x0, 0x0, 0xB, 61, -100
	banim_frame_oam 0x0, 0x0, 0x2B, 39, -26
	banim_frame_oam 0x0, 0x0, 0xCA, 15, -82
	banim_frame_oam 0x4000, 0x0, 0xAC, 39, -80
	banim_frame_oam 0x4000, 0x0, 0xEB, 0, 8
	banim_frame_oam 0x0, 0x0, 0xEC, 16, 8
	banim_frame_oam 0x0, 0x0, 0xCB, 24, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0x0, 0xA7, -1, -70
	banim_frame_oam 0x0, 0x4000, 0xC7, 7, -78
	banim_frame_oam 0x4000, 0x0, 0xCC, 23, -77
	banim_frame_oam 0x0, 0x8000, 0x9C, 14, -56
	banim_frame_oam 0x8000, 0x8000, 0x5A, -2, -90
	banim_frame_oam 0x0, 0x4000, 0xDA, -2, -58
	banim_frame_oam 0x4000, 0x8000, 0x5C, 22, -72
	banim_frame_oam 0x0, 0x4000, 0x1A, 47, -88
	banim_frame_oam 0x8000, 0x0, 0x1C, 63, -88
	banim_frame_oam 0x8000, 0x0, 0xD9, 6, -42
	banim_frame_oam 0x4000, 0x0, 0x16, 54, -72
	banim_frame_oam 0x0, 0x0, 0x36, 54, -64
	banim_frame_oam 0x0, 0x0, 0x37, -10, -58
	banim_frame_oam 0x4000, 0x0, 0x56, 31, -80
	banim_frame_oam 0x0, 0x4000, 0x18, 55, -104
	banim_frame_oam 0x8000, 0x4000, 0x59, 14, -88
	banim_frame_oam 0x0, 0x4000, 0x1D, -6, -106
	banim_frame_oam 0x4000, 0x0, 0xED, 39, -80
	banim_frame_oam 0x4000, 0x0, 0xAD, 55, -85
	banim_frame_oam 0x0, 0x0, 0x1, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 24, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 16, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x8000, 0xCE, -25, -86
	banim_frame_oam 0x0, 0x4000, 0xD2, 7, -86
	banim_frame_oam 0x8000, 0x8000, 0x12, 23, -94
	banim_frame_oam 0x0, 0x4000, 0x92, 23, -62
	banim_frame_oam 0x0, 0x4000, 0x90, 23, -38
	banim_frame_oam 0x4000, 0x8000, 0x4E, -41, -6
	banim_frame_oam 0x4000, 0x0, 0x30, -9, -6
	banim_frame_oam 0x8000, 0x4000, 0x14, -49, -70
	banim_frame_oam 0x0, 0x0, 0x94, -49, -38
	banim_frame_oam 0x0, 0x4000, 0xB4, 39, -94
	banim_frame_oam 0x4000, 0x0, 0x2E, 6, -94
	banim_frame_oam 0x4000, 0x0, 0x2C, -49, -78
	banim_frame_oam 0x4000, 0x0, 0xF4, 39, -63
	banim_frame_oam 0x8000, 0x0, 0x15, -33, -86
	banim_frame_oam 0x4000, 0x0, 0xEB, -35, 8
	banim_frame_oam 0x0, 0x0, 0xCB, -11, 8
	banim_frame_oam 0x0, 0x0, 0xEC, -19, 8
	banim_frame_oam 0x0, 0x4000, 0x9E, -49, -30
	banim_frame_oam 0x4000, 0x0, 0xDE, -49, -14
	banim_frame_oam 0x0, 0x4000, 0x5E, -65, -22
	banim_frame_oam 0x8000, 0x0, 0x1E, -33, -30
	banim_frame_oam 0x0, 0x0, 0x3F, -49, -6
	banim_frame_oam 0x8000, 0xC000, 0x1A, -9, -70
	banim_frame_oam 0x0, 0x8000, 0x16, -41, -70
	banim_frame_oam 0x4000, 0x4000, 0x96, -41, -38
	banim_frame_oam 0x0, 0x4000, 0xB8, -25, -30
	banim_frame_oam 0x4000, 0x0, 0xF8, -25, -14
	banim_frame_oam 0x0, 0x0, 0xF7, -33, -14
	banim_frame_end
banim_fakf_sp1_2_oam_frame_36_r:
	banim_frame_oam 0x0, 0x0, 0x95, -79, -7
	banim_frame_oam 0x8000, 0x0, 0x55, -71, -15
	banim_frame_end
banim_fakf_sp1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0x1A, -46, -59
	banim_frame_oam 0x0, 0x4000, 0x1C, -24, -59
	banim_frame_oam 0x8000, 0x0, 0x1E, -8, -59
	banim_frame_oam 0x4000, 0x8000, 0x5A, -45, -43
	banim_frame_oam 0x0, 0x4000, 0x5E, -13, -43
	banim_frame_oam 0x4000, 0x8000, 0xDA, -53, -11
	banim_frame_oam 0x0, 0x4000, 0xDE, -21, -11
	banim_frame_oam 0x4000, 0x8000, 0x9A, -44, -27
	banim_frame_oam 0x0, 0x4000, 0x9E, -12, -27
	banim_frame_oam 0x4000, 0x0, 0x98, -47, -67
	banim_frame_oam 0x0, 0x4000, 0xB8, -23, -75
	banim_frame_oam 0x0, 0x0, 0x3F, -23, -83
	banim_frame_oam 0x4000, 0x0, 0xF8, -34, 5
	banim_frame_oam 0x0, 0x0, 0x23, -35, 8
	banim_frame_oam 0x0, 0x0, 0xE9, -27, 8
	banim_frame_oam 0x0, 0x0, 0xE9, -19, 8
	banim_frame_oam 0x0, 0x0, 0xF6, -11, 8
	banim_frame_oam 0x8000, 0x0, 0x96, -5, -11
	banim_frame_end
banim_fakf_sp1_2_oam_frame_37_r:
	banim_frame_oam 0x8000, 0x2000, 0x22, -69, -15
	banim_frame_oam 0x0, 0x2000, 0x0, -77, -7
	banim_frame_oam 0x0, 0x2000, 0x1, -61, -9
	banim_frame_end
banim_fakf_sp1_2_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_34_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_35_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_61_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -49, -11
	banim_frame_oam 0x0, 0x4000, 0xC4, -17, -11
	banim_frame_oam 0x8000, 0x0, 0x85, -1, -19
	banim_frame_oam 0x4000, 0x8000, 0x80, -41, -27
	banim_frame_oam 0x8000, 0x0, 0x84, -9, -27
	banim_frame_oam 0x4000, 0x0, 0x66, -34, 5
	banim_frame_oam 0x4000, 0x8000, 0x40, -49, -43
	banim_frame_oam 0x0, 0x4000, 0x44, -17, -43
	banim_frame_oam 0x4000, 0x0, 0x46, -47, -51
	banim_frame_oam 0x0, 0x4000, 0x0, -49, -67
	banim_frame_oam 0x0, 0x4000, 0x2, -25, -59
	banim_frame_oam 0x8000, 0x0, 0x4, -9, -59
	banim_frame_oam 0x0, 0x4000, 0x5, -25, -75
	banim_frame_oam 0x0, 0x0, 0x7, -25, -83
	banim_frame_oam 0x0, 0x0, 0x27, -57, -11
	banim_frame_oam 0x0, 0x0, 0x87, -35, 8
	banim_frame_oam 0x0, 0x0, 0x88, -27, 8
	banim_frame_oam 0x0, 0x0, 0x88, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, -11, 8
	banim_frame_oam 0x0, 0x0, 0xA7, -17, -23
	banim_frame_oam 0x0, 0x0, 0x4E, -49, -19
	banim_frame_end
banim_fakf_sp1_2_oam_frame_38_r:
	banim_frame_oam 0x0, 0x4000, 0x8, -78, -9
	banim_frame_oam 0x4000, 0x0, 0xA8, -62, -9
	banim_frame_end
banim_fakf_sp1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0x14, -49, -67
	banim_frame_oam 0x4000, 0x0, 0x95, -49, -51
	banim_frame_oam 0x0, 0x0, 0x97, -33, -51
	banim_frame_oam 0x8000, 0x0, 0x16, -20, -75
	banim_frame_oam 0x0, 0x0, 0x37, -12, -67
	banim_frame_oam 0x0, 0x0, 0x17, -23, -83
	banim_frame_oam 0x0, 0x4000, 0x55, -25, -59
	banim_frame_oam 0x8000, 0x0, 0x57, -9, -59
	banim_frame_oam 0x4000, 0x0, 0xB6, -34, 5
	banim_frame_oam 0x0, 0x4000, 0xCF, -1, -27
	banim_frame_oam 0x0, 0x4000, 0xCD, -49, -11
	banim_frame_oam 0x0, 0x0, 0xB5, -57, -11
	banim_frame_oam 0x0, 0x8000, 0x10, -33, -27
	banim_frame_oam 0x4000, 0x8000, 0xA, -49, -43
	banim_frame_oam 0x0, 0x4000, 0xE, -17, -43
	banim_frame_oam 0x8000, 0x0, 0x4F, -41, -27
	banim_frame_oam 0x0, 0x0, 0x87, -35, 8
	banim_frame_oam 0x0, 0x0, 0x88, -27, 8
	banim_frame_oam 0x0, 0x0, 0x88, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, -11, 8
	banim_frame_oam 0x0, 0x0, 0xA7, -17, -23
	banim_frame_oam 0x0, 0x0, 0x6E, -1, -11
	banim_frame_oam 0x0, 0x0, 0x4E, -49, -19
	banim_frame_end
banim_fakf_sp1_2_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x0, 0x1B, -1, -15
	banim_frame_oam 0x0, 0x0, 0x1D, 15, -15
	banim_frame_oam 0x4000, 0x0, 0x3B, -12, -39
	banim_frame_oam 0x0, 0x0, 0x3D, 4, -39
	banim_frame_oam 0x4000, 0x8000, 0xD8, -12, -31
	banim_frame_oam 0x8000, 0x8000, 0x5A, -49, -39
	banim_frame_oam 0x8000, 0x0, 0x5C, -33, -39
	banim_frame_oam 0x0, 0x0, 0x5D, -25, -39
	banim_frame_oam 0x8000, 0x8000, 0x58, -65, -33
	banim_frame_oam 0x0, 0x4000, 0x14, -49, -67
	banim_frame_oam 0x4000, 0x0, 0x95, -49, -51
	banim_frame_oam 0x0, 0x0, 0x97, -33, -51
	banim_frame_oam 0x8000, 0x0, 0x16, -20, -75
	banim_frame_oam 0x0, 0x0, 0x37, -12, -67
	banim_frame_oam 0x0, 0x0, 0x17, -23, -83
	banim_frame_oam 0x0, 0x4000, 0x55, -25, -59
	banim_frame_oam 0x8000, 0x0, 0x57, -9, -59
	banim_frame_oam 0x4000, 0x0, 0xB6, -34, 5
	banim_frame_oam 0x0, 0x4000, 0xCF, -1, -27
	banim_frame_oam 0x0, 0x4000, 0xCD, -49, -11
	banim_frame_oam 0x0, 0x0, 0xB5, -57, -11
	banim_frame_oam 0x0, 0x8000, 0x10, -33, -27
	banim_frame_oam 0x4000, 0x8000, 0xA, -49, -43
	banim_frame_oam 0x0, 0x4000, 0xE, -17, -43
	banim_frame_oam 0x8000, 0x0, 0x4F, -41, -27
	banim_frame_oam 0x0, 0x0, 0x87, -35, 8
	banim_frame_oam 0x0, 0x0, 0x88, -27, 8
	banim_frame_oam 0x0, 0x0, 0x88, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, -11, 8
	banim_frame_oam 0x0, 0x0, 0xA7, -17, -23
	banim_frame_oam 0x0, 0x0, 0x6E, -1, -11
	banim_frame_oam 0x0, 0x0, 0x4E, -49, -19
	banim_frame_end
banim_fakf_sp1_2_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0x18, -81, -15
	banim_frame_oam 0x0, 0x0, 0x1A, -73, -23
	banim_frame_end
banim_fakf_sp1_2_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0x4A, -41, -33
	banim_frame_oam 0x4000, 0x4000, 0x8A, -41, -17
	banim_frame_oam 0x4000, 0x0, 0x68, -49, -9
	banim_frame_oam 0x4000, 0x8000, 0x91, -9, -25
	banim_frame_oam 0x0, 0x0, 0x49, -49, -33
	banim_frame_oam 0x0, 0x4000, 0x14, -49, -67
	banim_frame_oam 0x4000, 0x0, 0x95, -49, -51
	banim_frame_oam 0x0, 0x0, 0x97, -33, -51
	banim_frame_oam 0x8000, 0x0, 0x16, -20, -75
	banim_frame_oam 0x0, 0x0, 0x37, -12, -67
	banim_frame_oam 0x0, 0x0, 0x17, -23, -83
	banim_frame_oam 0x0, 0x4000, 0x55, -25, -59
	banim_frame_oam 0x8000, 0x0, 0x57, -9, -59
	banim_frame_oam 0x4000, 0x0, 0xB6, -34, 5
	banim_frame_oam 0x4000, 0x8000, 0xA, -49, -43
	banim_frame_oam 0x0, 0x4000, 0xE, -17, -43
	banim_frame_oam 0x4000, 0x8000, 0x50, -33, -11
	banim_frame_oam 0x0, 0x0, 0x6E, -1, -11
	banim_frame_oam 0x0, 0x0, 0x87, -35, 8
	banim_frame_oam 0x0, 0x0, 0x88, -27, 8
	banim_frame_oam 0x0, 0x0, 0x88, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, -11, 8
	banim_frame_oam 0x4000, 0x0, 0xED, -49, -3
	banim_frame_end
banim_fakf_sp1_2_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0xD, 1, -24
	banim_frame_oam 0x0, 0x0, 0xF, 17, -17
	banim_frame_oam 0x4000, 0x0, 0x2F, -15, -24
	banim_frame_oam 0x4000, 0x0, 0x10, -47, -32
	banim_frame_oam 0x0, 0x0, 0x12, -31, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -33, 7
	banim_frame_oam 0x4000, 0x8000, 0xA0, -41, -9
	banim_frame_oam 0x8000, 0x0, 0xA4, -9, -9
	banim_frame_oam 0x4000, 0x8000, 0x60, -38, -25
	banim_frame_oam 0x8000, 0x0, 0x64, -6, -25
	banim_frame_oam 0x0, 0x0, 0x85, 2, -17
	banim_frame_oam 0x4000, 0x0, 0xE2, -1, -9
	banim_frame_oam 0x4000, 0x4000, 0x40, -47, -33
	banim_frame_oam 0x0, 0x0, 0x44, -15, -33
	banim_frame_oam 0x4000, 0x8000, 0x0, -49, -49
	banim_frame_oam 0x0, 0x4000, 0x4, -17, -49
	banim_frame_oam 0x0, 0x4000, 0x45, -49, -65
	banim_frame_oam 0x0, 0x0, 0x86, -49, -73
	banim_frame_oam 0x8000, 0x0, 0x6, -21, -73
	banim_frame_oam 0x0, 0x0, 0x27, -13, -65
	banim_frame_oam 0x0, 0x0, 0xE4, -49, -3
	banim_frame_oam 0x4000, 0x0, 0x7, -25, -57
	banim_frame_oam 0x0, 0x0, 0x9, -9, -57
	banim_frame_oam 0x4000, 0x0, 0x28, -35, 8
	banim_frame_oam 0x0, 0x0, 0x29, -19, 8
	banim_frame_oam 0x0, 0x0, 0xA, -11, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_20_r:
	banim_frame_oam 0x4000, 0xC000, 0x98, -93, -21
	banim_frame_oam 0x0, 0x8000, 0x91, -87, 11
	banim_frame_oam 0x0, 0x4000, 0x95, -55, 11
	banim_frame_oam 0x4000, 0x0, 0xD5, -55, 27
	banim_frame_oam 0x8000, 0x0, 0x97, -39, 11
	banim_frame_oam 0x0, 0x0, 0xD7, -31, 11
	banim_frame_oam 0x4000, 0x0, 0xF5, -80, 43
	banim_frame_oam 0x0, 0x0, 0xF7, -95, 30
	banim_frame_oam 0x4000, 0x8000, 0x55, -93, -37
	banim_frame_oam 0x4000, 0x8000, 0x59, -61, -37
	banim_frame_oam 0x8000, 0x8000, 0x13, -29, -21
	banim_frame_oam 0x0, 0x4000, 0x50, -29, -37
	banim_frame_oam 0x4000, 0x4000, 0x3A, -77, -45
	banim_frame_oam 0x4000, 0x8000, 0x16, -45, -53
	banim_frame_end
banim_fakf_sp1_2_oam_frame_21_r:
	banim_frame_oam 0x0, 0x4000, 0xD, -61, 33
	banim_frame_oam 0x0, 0x0, 0xF, -45, 40
	banim_frame_oam 0x4000, 0x0, 0x2F, -77, 33
	banim_frame_oam 0x4000, 0x0, 0x10, -109, 25
	banim_frame_oam 0x0, 0x0, 0x12, -93, 25
	banim_frame_oam 0x4000, 0x8000, 0xC5, -105, 46
	banim_frame_oam 0x4000, 0x0, 0xC9, -73, 46
	banim_frame_oam 0x0, 0x0, 0xE9, -113, 48
	banim_frame_oam 0x4000, 0x8000, 0x87, -105, 30
	banim_frame_oam 0x0, 0x4000, 0x8B, -73, 30
	banim_frame_oam 0x4000, 0x8000, 0x47, -111, 14
	banim_frame_oam 0x4000, 0x0, 0x2A, -111, -10
	banim_frame_oam 0x4000, 0x0, 0x4D, -85, -10
	banim_frame_oam 0x8000, 0x0, 0xC, -85, -26
	banim_frame_oam 0x4000, 0x8000, 0xCB, -111, -2
	banim_frame_oam 0x0, 0x4000, 0xCF, -79, -2
	banim_frame_oam 0x0, 0x4000, 0x4B, -79, 14
	banim_frame_oam 0x0, 0x0, 0x6D, -63, 22
	banim_frame_oam 0x4000, 0x0, 0xA5, -98, 62
	banim_frame_end
banim_fakf_sp1_2_oam_frame_22_r:
	banim_frame_oam 0x0, 0x4000, 0xD, -91, 56
	banim_frame_oam 0x0, 0x0, 0xF, -75, 63
	banim_frame_oam 0x4000, 0x0, 0x2F, -107, 56
	banim_frame_oam 0x4000, 0x0, 0xC9, -103, 69
	banim_frame_oam 0x0, 0x4000, 0x8B, -103, 53
	banim_frame_oam 0x4000, 0x0, 0x4D, -115, 13
	banim_frame_oam 0x8000, 0x0, 0xC, -115, -3
	banim_frame_oam 0x0, 0x4000, 0xCF, -109, 21
	banim_frame_oam 0x0, 0x4000, 0x4B, -109, 37
	banim_frame_oam 0x0, 0x0, 0x6D, -93, 45
	banim_frame_oam 0x8000, 0x0, 0xCE, -117, 21
	banim_frame_oam 0x0, 0x4000, 0x89, -119, 53
	banim_frame_oam 0x4000, 0x0, 0xC7, -119, 69
	banim_frame_oam 0x0, 0x4000, 0x49, -125, 37
	banim_frame_end
banim_fakf_sp1_2_oam_frame_41_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -120, -96
	banim_frame_oam 0x0, 0x4000, 0x4, -88, -96
	banim_frame_oam 0x0, 0x0, 0x6, -128, -88
	banim_frame_oam 0x0, 0x0, 0x26, -72, -94
	banim_frame_oam 0x0, 0x4000, 0x40, -120, -128
	banim_frame_oam 0x8000, 0x0, 0x42, -104, -128
	banim_frame_oam 0x0, 0x0, 0x63, -96, -120
	banim_frame_oam 0x0, 0x4000, 0x80, -112, -112
	banim_frame_oam 0x8000, 0x0, 0x82, -96, -112
	banim_frame_oam 0x0, 0x4000, 0xC0, -112, -80
	banim_frame_oam 0x8000, 0x0, 0xC2, -96, -80
	banim_frame_oam 0x0, 0x0, 0x64, -88, -80
	banim_frame_oam 0x4000, 0x8000, 0x83, -120, -64
	banim_frame_oam 0x0, 0x4000, 0xC3, -120, -48
	banim_frame_oam 0x0, 0x0, 0xC5, -104, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_42_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -116, -96
	banim_frame_oam 0x0, 0x4000, 0x4, -84, -96
	banim_frame_oam 0x0, 0x0, 0x6, -124, -88
	banim_frame_oam 0x0, 0x0, 0x26, -68, -94
	banim_frame_oam 0x0, 0x4000, 0x40, -116, -128
	banim_frame_oam 0x8000, 0x0, 0x42, -100, -128
	banim_frame_oam 0x0, 0x0, 0x63, -92, -120
	banim_frame_oam 0x0, 0x4000, 0x80, -108, -112
	banim_frame_oam 0x8000, 0x0, 0x82, -92, -112
	banim_frame_oam 0x0, 0x4000, 0xC0, -108, -80
	banim_frame_oam 0x8000, 0x0, 0xC2, -92, -80
	banim_frame_oam 0x0, 0x0, 0x64, -84, -80
	banim_frame_oam 0x4000, 0x8000, 0x83, -116, -64
	banim_frame_oam 0x0, 0x4000, 0xC3, -116, -48
	banim_frame_oam 0x0, 0x0, 0xC5, -100, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_43_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -112, -96
	banim_frame_oam 0x0, 0x4000, 0x4, -80, -96
	banim_frame_oam 0x0, 0x0, 0x6, -120, -88
	banim_frame_oam 0x0, 0x0, 0x26, -64, -94
	banim_frame_oam 0x0, 0x4000, 0x40, -112, -128
	banim_frame_oam 0x8000, 0x0, 0x42, -96, -128
	banim_frame_oam 0x0, 0x0, 0x63, -88, -120
	banim_frame_oam 0x0, 0x4000, 0x80, -104, -112
	banim_frame_oam 0x8000, 0x0, 0x82, -88, -112
	banim_frame_oam 0x0, 0x4000, 0xC0, -104, -80
	banim_frame_oam 0x8000, 0x0, 0xC2, -88, -80
	banim_frame_oam 0x0, 0x0, 0x64, -80, -80
	banim_frame_oam 0x4000, 0x8000, 0x83, -112, -64
	banim_frame_oam 0x0, 0x4000, 0xC3, -112, -48
	banim_frame_oam 0x0, 0x0, 0xC5, -96, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_44_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -108, -96
	banim_frame_oam 0x0, 0x4000, 0x4, -76, -96
	banim_frame_oam 0x0, 0x0, 0x6, -116, -88
	banim_frame_oam 0x0, 0x0, 0x26, -60, -94
	banim_frame_oam 0x0, 0x4000, 0x40, -108, -128
	banim_frame_oam 0x8000, 0x0, 0x42, -92, -128
	banim_frame_oam 0x0, 0x0, 0x63, -84, -120
	banim_frame_oam 0x0, 0x4000, 0x80, -100, -112
	banim_frame_oam 0x8000, 0x0, 0x82, -84, -112
	banim_frame_oam 0x0, 0x4000, 0xC0, -100, -80
	banim_frame_oam 0x8000, 0x0, 0xC2, -84, -80
	banim_frame_oam 0x0, 0x0, 0x64, -76, -80
	banim_frame_oam 0x4000, 0x8000, 0x83, -108, -64
	banim_frame_oam 0x0, 0x4000, 0xC3, -108, -48
	banim_frame_oam 0x0, 0x0, 0xC5, -92, -48
	banim_frame_end
banim_fakf_sp1_2_oam_frame_45_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -100, -95
	banim_frame_oam 0x0, 0x4000, 0x4, -68, -95
	banim_frame_oam 0x0, 0x0, 0x6, -108, -87
	banim_frame_oam 0x0, 0x0, 0x26, -52, -93
	banim_frame_oam 0x0, 0x4000, 0x40, -100, -127
	banim_frame_oam 0x8000, 0x0, 0x42, -84, -127
	banim_frame_oam 0x0, 0x0, 0x63, -76, -119
	banim_frame_oam 0x0, 0x4000, 0x80, -92, -111
	banim_frame_oam 0x8000, 0x0, 0x82, -76, -111
	banim_frame_oam 0x0, 0x4000, 0xC0, -92, -79
	banim_frame_oam 0x8000, 0x0, 0xC2, -76, -79
	banim_frame_oam 0x0, 0x0, 0x64, -68, -79
	banim_frame_oam 0x4000, 0x8000, 0x83, -100, -63
	banim_frame_oam 0x0, 0x4000, 0xC3, -100, -47
	banim_frame_oam 0x0, 0x0, 0xC5, -84, -47
	banim_frame_end
banim_fakf_sp1_2_oam_frame_46_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -90, -92
	banim_frame_oam 0x0, 0x4000, 0x4, -58, -92
	banim_frame_oam 0x0, 0x0, 0x6, -98, -84
	banim_frame_oam 0x0, 0x0, 0x26, -42, -90
	banim_frame_oam 0x0, 0x4000, 0x40, -90, -124
	banim_frame_oam 0x8000, 0x0, 0x42, -74, -124
	banim_frame_oam 0x0, 0x0, 0x63, -66, -116
	banim_frame_oam 0x0, 0x4000, 0x80, -82, -108
	banim_frame_oam 0x8000, 0x0, 0x82, -66, -108
	banim_frame_oam 0x0, 0x4000, 0xC0, -82, -76
	banim_frame_oam 0x8000, 0x0, 0xC2, -66, -76
	banim_frame_oam 0x0, 0x0, 0x64, -58, -76
	banim_frame_oam 0x4000, 0x8000, 0x83, -90, -60
	banim_frame_oam 0x0, 0x4000, 0xC3, -90, -44
	banim_frame_oam 0x0, 0x0, 0xC5, -74, -44
	banim_frame_end
banim_fakf_sp1_2_oam_frame_47_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -77, -89
	banim_frame_oam 0x0, 0x4000, 0x4, -45, -89
	banim_frame_oam 0x0, 0x0, 0x6, -85, -81
	banim_frame_oam 0x0, 0x0, 0x26, -29, -87
	banim_frame_oam 0x0, 0x4000, 0x40, -77, -121
	banim_frame_oam 0x8000, 0x0, 0x42, -61, -121
	banim_frame_oam 0x0, 0x0, 0x63, -53, -113
	banim_frame_oam 0x4000, 0x0, 0x43, -77, 127
	banim_frame_oam 0x0, 0x4000, 0x80, -69, -105
	banim_frame_oam 0x8000, 0x0, 0x82, -53, -105
	banim_frame_oam 0x0, 0x4000, 0xC0, -69, -73
	banim_frame_oam 0x8000, 0x0, 0xC2, -53, -73
	banim_frame_oam 0x0, 0x0, 0x64, -45, -73
	banim_frame_oam 0x4000, 0x8000, 0x83, -77, -57
	banim_frame_oam 0x0, 0x4000, 0xC3, -77, -41
	banim_frame_oam 0x0, 0x0, 0xC5, -61, -41
	banim_frame_end
banim_fakf_sp1_2_oam_frame_48_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -61, -84
	banim_frame_oam 0x0, 0x4000, 0x4, -29, -84
	banim_frame_oam 0x0, 0x0, 0x6, -69, -76
	banim_frame_oam 0x0, 0x0, 0x26, -13, -82
	banim_frame_oam 0x0, 0x4000, 0x40, -61, -116
	banim_frame_oam 0x8000, 0x0, 0x42, -45, -116
	banim_frame_oam 0x0, 0x0, 0x63, -37, -108
	banim_frame_oam 0x4000, 0x0, 0x43, -61, -124
	banim_frame_oam 0x0, 0x4000, 0x80, -53, -100
	banim_frame_oam 0x8000, 0x0, 0x82, -37, -100
	banim_frame_oam 0x0, 0x4000, 0xC0, -53, -68
	banim_frame_oam 0x8000, 0x0, 0xC2, -37, -68
	banim_frame_oam 0x0, 0x0, 0x64, -29, -68
	banim_frame_oam 0x4000, 0x8000, 0x83, -61, -52
	banim_frame_oam 0x0, 0x4000, 0xC3, -61, -36
	banim_frame_oam 0x0, 0x0, 0xC5, -45, -36
	banim_frame_end
banim_fakf_sp1_2_oam_frame_49_r:
	banim_frame_oam 0x4000, 0x0, 0xE5, -45, 3
	banim_frame_oam 0x0, 0x0, 0xE6, -29, 3
	banim_frame_oam 0x0, 0x0, 0xC6, -21, 3
	banim_frame_oam 0x0, 0x0, 0x7, -8, -49
	banim_frame_oam 0x4000, 0x8000, 0x8, -40, -65
	banim_frame_oam 0x8000, 0x0, 0xC, -8, -65
	banim_frame_oam 0x0, 0x0, 0x27, -48, -57
	banim_frame_oam 0x4000, 0x8000, 0xD, -56, -81
	banim_frame_oam 0x0, 0x4000, 0x11, -24, -81
	banim_frame_oam 0x0, 0x0, 0x6B, -8, -73
	banim_frame_oam 0x4000, 0x0, 0x49, -46, -49
	banim_frame_oam 0x0, 0x0, 0x4B, -30, -49
	banim_frame_oam 0x4000, 0x4000, 0x4C, -48, -89
	banim_frame_oam 0x0, 0x0, 0x50, -16, -89
	banim_frame_oam 0x0, 0x0, 0x6A, -48, -65
	banim_frame_oam 0x4000, 0x0, 0x6C, -64, -65
	banim_frame_end
banim_fakf_sp1_2_oam_frame_50_r:
	banim_frame_oam 0x4000, 0x0, 0xE5, -43, 4
	banim_frame_oam 0x0, 0x0, 0xE6, -27, 4
	banim_frame_oam 0x0, 0x0, 0xC6, -19, 4
	banim_frame_oam 0x0, 0x0, 0x7, -6, -48
	banim_frame_oam 0x4000, 0x8000, 0x8, -38, -64
	banim_frame_oam 0x8000, 0x0, 0xC, -6, -64
	banim_frame_oam 0x0, 0x0, 0x27, -46, -56
	banim_frame_oam 0x4000, 0x8000, 0xD, -54, -80
	banim_frame_oam 0x0, 0x4000, 0x11, -22, -80
	banim_frame_oam 0x0, 0x0, 0x6B, -6, -72
	banim_frame_oam 0x4000, 0x0, 0x49, -44, -48
	banim_frame_oam 0x0, 0x0, 0x4B, -28, -48
	banim_frame_oam 0x4000, 0x4000, 0x4C, -46, -88
	banim_frame_oam 0x0, 0x0, 0x50, -14, -88
	banim_frame_oam 0x0, 0x0, 0x6A, -46, -64
	banim_frame_oam 0x4000, 0x0, 0x6C, -62, -64
	banim_frame_end
banim_fakf_sp1_2_oam_frame_51_r:
	banim_frame_oam 0x4000, 0x0, 0xE5, -37, 5
	banim_frame_oam 0x0, 0x0, 0xE6, -21, 5
	banim_frame_oam 0x0, 0x0, 0xC6, -13, 5
	banim_frame_oam 0x4000, 0x8000, 0x87, -37, -69
	banim_frame_oam 0x8000, 0x0, 0x8B, -5, -69
	banim_frame_oam 0x4000, 0x8000, 0xC7, -45, -53
	banim_frame_oam 0x0, 0x4000, 0xCB, -13, -53
	banim_frame_oam 0x0, 0x0, 0xAC, -45, -61
	banim_frame_oam 0x0, 0x4000, 0x8D, -21, -37
	banim_frame_oam 0x0, 0x0, 0x8C, -29, -37
	banim_frame_oam 0x4000, 0x8000, 0xCD, -29, -85
	banim_frame_oam 0x0, 0x0, 0x69, -37, -77
	banim_frame_end
banim_fakf_sp1_2_oam_frame_52_r:
	banim_frame_oam 0x4000, 0x0, 0xE5, -35, 5
	banim_frame_oam 0x0, 0x0, 0xE6, -19, 5
	banim_frame_oam 0x0, 0x0, 0xC6, -11, 5
	banim_frame_oam 0x4000, 0x8000, 0x87, -35, -68
	banim_frame_oam 0x8000, 0x0, 0x8B, -3, -68
	banim_frame_oam 0x4000, 0x8000, 0xC7, -43, -52
	banim_frame_oam 0x0, 0x4000, 0xCB, -11, -52
	banim_frame_oam 0x0, 0x0, 0xAC, -43, -60
	banim_frame_oam 0x0, 0x4000, 0x8D, -19, -36
	banim_frame_oam 0x0, 0x0, 0x8C, -27, -36
	banim_frame_oam 0x4000, 0x8000, 0xCD, -27, -84
	banim_frame_oam 0x0, 0x0, 0x69, -35, -76
	banim_frame_end
banim_fakf_sp1_2_oam_frame_53_r:
	banim_frame_oam 0x4000, 0x0, 0xE5, -28, 6
	banim_frame_oam 0x0, 0x0, 0xE6, -12, 6
	banim_frame_oam 0x0, 0x0, 0xC6, -4, 6
	banim_frame_oam 0x4000, 0x8000, 0x15, -23, -73
	banim_frame_oam 0x4000, 0x0, 0x33, -39, -65
	banim_frame_oam 0x4000, 0x0, 0x13, -5, -41
	banim_frame_oam 0x4000, 0x8000, 0x51, -41, -57
	banim_frame_oam 0x0, 0x4000, 0x55, -9, -57
	banim_frame_oam 0x4000, 0x0, 0x6E, -29, -25
	banim_frame_oam 0x0, 0x0, 0x70, -13, -25
	banim_frame_oam 0x4000, 0x8000, 0x8F, -37, -41
	banim_frame_oam 0x8000, 0x0, 0x93, 7, -57
	banim_frame_oam 0x0, 0x0, 0xD1, 15, -49
	banim_frame_oam 0x0, 0x0, 0xF1, -15, -17
	banim_frame_oam 0x8000, 0x0, 0x94, -5, -33
	banim_frame_end
banim_fakf_sp1_2_oam_frame_54_r:
	banim_frame_oam 0x4000, 0x8000, 0x15, -21, -71
	banim_frame_oam 0x4000, 0x0, 0x33, -37, -63
	banim_frame_oam 0x4000, 0x0, 0x13, -3, -39
	banim_frame_oam 0x4000, 0x8000, 0x51, -39, -55
	banim_frame_oam 0x0, 0x4000, 0x55, -7, -55
	banim_frame_oam 0x4000, 0x0, 0x6E, -27, -23
	banim_frame_oam 0x0, 0x0, 0x70, -11, -23
	banim_frame_oam 0x4000, 0x8000, 0x8F, -35, -39
	banim_frame_oam 0x8000, 0x0, 0x93, 9, -55
	banim_frame_oam 0x0, 0x0, 0xD1, 17, -47
	banim_frame_oam 0x0, 0x0, 0xF1, -13, -15
	banim_frame_oam 0x8000, 0x0, 0x94, -3, -31
	banim_frame_oam 0x4000, 0x0, 0xE5, -26, 7
	banim_frame_oam 0x0, 0x0, 0xE6, -10, 7
	banim_frame_oam 0x0, 0x0, 0xC6, -2, 7
	banim_frame_end
banim_fakf_sp1_2_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x99, -9, -57
	banim_frame_oam 0x8000, 0x4000, 0x9D, 23, -73
	banim_frame_oam 0x0, 0x0, 0x79, 15, -65
	banim_frame_oam 0x8000, 0x0, 0xD4, 23, -41
	banim_frame_oam 0x8000, 0x8000, 0x97, -25, -65
	banim_frame_oam 0x8000, 0x8000, 0x95, -41, -81
	banim_frame_oam 0x0, 0x0, 0x77, -33, -49
	banim_frame_oam 0x0, 0x0, 0x78, -25, -73
	banim_frame_oam 0x0, 0x0, 0x57, -9, -65
	banim_frame_oam 0x0, 0x0, 0x58, -17, -33
	banim_frame_oam 0x0, 0x0, 0x59, 39, -89
	banim_frame_oam 0x8000, 0x8000, 0x5E, 31, -81
	banim_frame_oam 0x0, 0x4000, 0xDE, -3, -25
	banim_frame_oam 0x4000, 0x0, 0xE5, -15, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 9, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 1, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x99, -8, -56
	banim_frame_oam 0x8000, 0x4000, 0x9D, 24, -72
	banim_frame_oam 0x0, 0x0, 0x79, 16, -64
	banim_frame_oam 0x8000, 0x0, 0xD4, 24, -40
	banim_frame_oam 0x8000, 0x8000, 0x97, -24, -64
	banim_frame_oam 0x8000, 0x8000, 0x95, -40, -80
	banim_frame_oam 0x0, 0x0, 0x77, -32, -48
	banim_frame_oam 0x0, 0x0, 0x78, -24, -72
	banim_frame_oam 0x0, 0x0, 0x57, -8, -64
	banim_frame_oam 0x0, 0x0, 0x58, -16, -32
	banim_frame_oam 0x0, 0x0, 0x59, 40, -88
	banim_frame_oam 0x8000, 0x8000, 0x5E, 32, -80
	banim_frame_oam 0x0, 0x4000, 0xDE, -2, -24
	banim_frame_oam 0x4000, 0x0, 0xE5, -15, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 9, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 1, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0x99, -8, -55
	banim_frame_oam 0x8000, 0x4000, 0x9D, 24, -71
	banim_frame_oam 0x0, 0x0, 0x79, 16, -63
	banim_frame_oam 0x8000, 0x0, 0xD4, 24, -39
	banim_frame_oam 0x8000, 0x8000, 0x97, -24, -63
	banim_frame_oam 0x8000, 0x8000, 0x95, -40, -79
	banim_frame_oam 0x0, 0x0, 0x77, -32, -47
	banim_frame_oam 0x0, 0x0, 0x78, -24, -71
	banim_frame_oam 0x0, 0x0, 0x57, -8, -63
	banim_frame_oam 0x0, 0x0, 0x58, -16, -31
	banim_frame_oam 0x0, 0x0, 0x59, 40, -87
	banim_frame_oam 0x8000, 0x8000, 0x5E, 32, -79
	banim_frame_oam 0x0, 0x4000, 0xDE, -2, -23
	banim_frame_oam 0x4000, 0x0, 0xE5, -13, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 11, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 3, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_28_r:
	banim_frame_oam 0x0, 0x8000, 0x99, -7, -54
	banim_frame_oam 0x8000, 0x4000, 0x9D, 25, -70
	banim_frame_oam 0x0, 0x0, 0x79, 17, -62
	banim_frame_oam 0x8000, 0x0, 0xD4, 25, -38
	banim_frame_oam 0x8000, 0x8000, 0x97, -23, -62
	banim_frame_oam 0x8000, 0x8000, 0x95, -39, -78
	banim_frame_oam 0x0, 0x0, 0x77, -31, -46
	banim_frame_oam 0x0, 0x0, 0x78, -23, -70
	banim_frame_oam 0x0, 0x0, 0x57, -7, -62
	banim_frame_oam 0x0, 0x0, 0x58, -15, -30
	banim_frame_oam 0x0, 0x0, 0x59, 41, -86
	banim_frame_oam 0x8000, 0x8000, 0x5E, 33, -78
	banim_frame_oam 0x0, 0x4000, 0xDE, -1, -22
	banim_frame_oam 0x4000, 0x0, 0xE5, -13, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 11, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 3, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x99, -7, -53
	banim_frame_oam 0x8000, 0x4000, 0x9D, 25, -69
	banim_frame_oam 0x0, 0x0, 0x79, 17, -61
	banim_frame_oam 0x8000, 0x0, 0xD4, 25, -37
	banim_frame_oam 0x8000, 0x8000, 0x97, -23, -61
	banim_frame_oam 0x8000, 0x8000, 0x95, -39, -77
	banim_frame_oam 0x0, 0x0, 0x77, -31, -45
	banim_frame_oam 0x0, 0x0, 0x78, -23, -69
	banim_frame_oam 0x0, 0x0, 0x57, -7, -61
	banim_frame_oam 0x0, 0x0, 0x58, -15, -29
	banim_frame_oam 0x0, 0x0, 0x59, 41, -85
	banim_frame_oam 0x8000, 0x8000, 0x5E, 33, -77
	banim_frame_oam 0x0, 0x4000, 0xDE, -1, -21
	banim_frame_oam 0x4000, 0x0, 0xE5, -11, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 13, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 5, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, 20, -52
	banim_frame_oam 0x4000, 0x0, 0x86, 20, -20
	banim_frame_oam 0x8000, 0x8000, 0x4, 4, -52
	banim_frame_oam 0x0, 0x4000, 0x84, 4, -20
	banim_frame_oam 0x8000, 0x8000, 0x2, -12, -63
	banim_frame_oam 0x0, 0x4000, 0x82, -12, -31
	banim_frame_oam 0x0, 0x4000, 0x40, -28, -49
	banim_frame_oam 0x4000, 0x0, 0x80, -28, -33
	banim_frame_oam 0x0, 0x0, 0xA1, -20, -25
	banim_frame_oam 0x0, 0x4000, 0x0, -44, -41
	banim_frame_oam 0x8000, 0x0, 0xC0, -4, -15
	banim_frame_oam 0x0, 0x0, 0xA0, -12, -15
	banim_frame_oam 0x0, 0x0, 0xE3, 20, -12
	banim_frame_oam 0x0, 0x4000, 0xC1, 36, -36
	banim_frame_oam 0x0, 0x0, 0xC3, 36, -44
	banim_frame_oam 0x4000, 0x0, 0xE4, -5, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 19, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 11, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, 20, -51
	banim_frame_oam 0x4000, 0x0, 0x86, 20, -19
	banim_frame_oam 0x8000, 0x8000, 0x4, 4, -51
	banim_frame_oam 0x0, 0x4000, 0x84, 4, -19
	banim_frame_oam 0x8000, 0x8000, 0x2, -12, -62
	banim_frame_oam 0x0, 0x4000, 0x82, -12, -30
	banim_frame_oam 0x0, 0x4000, 0x40, -28, -48
	banim_frame_oam 0x4000, 0x0, 0x80, -28, -32
	banim_frame_oam 0x0, 0x0, 0xA1, -20, -24
	banim_frame_oam 0x0, 0x4000, 0x0, -44, -40
	banim_frame_oam 0x8000, 0x0, 0xC0, -4, -14
	banim_frame_oam 0x0, 0x0, 0xA0, -12, -14
	banim_frame_oam 0x0, 0x0, 0xE3, 20, -11
	banim_frame_oam 0x0, 0x4000, 0xC1, 36, -35
	banim_frame_oam 0x0, 0x0, 0xC3, 36, -43
	banim_frame_oam 0x4000, 0x0, 0xE4, -5, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 19, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 11, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, 19, -50
	banim_frame_oam 0x4000, 0x0, 0x86, 19, -18
	banim_frame_oam 0x8000, 0x8000, 0x4, 3, -50
	banim_frame_oam 0x0, 0x4000, 0x84, 3, -18
	banim_frame_oam 0x8000, 0x8000, 0x2, -13, -61
	banim_frame_oam 0x0, 0x4000, 0x82, -13, -29
	banim_frame_oam 0x0, 0x4000, 0x40, -29, -47
	banim_frame_oam 0x4000, 0x0, 0x80, -29, -31
	banim_frame_oam 0x0, 0x0, 0xA1, -21, -23
	banim_frame_oam 0x0, 0x4000, 0x0, -45, -39
	banim_frame_oam 0x8000, 0x0, 0xC0, -5, -13
	banim_frame_oam 0x0, 0x0, 0xA0, -13, -13
	banim_frame_oam 0x0, 0x0, 0xE3, 19, -10
	banim_frame_oam 0x0, 0x4000, 0xC1, 35, -34
	banim_frame_oam 0x0, 0x0, 0xC3, 35, -42
	banim_frame_oam 0x4000, 0x0, 0xE4, -6, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 18, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 10, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_40_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_55_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_56_r:
	banim_frame_oam 0x0, 0x0, 0x0, -37, -41
	banim_frame_oam 0x8000, 0x0, 0x22, -29, -41
	banim_frame_oam 0x0, 0x0, 0x1, -21, -39
	banim_frame_oam 0x4000, 0x0, 0x2, -13, -34
	banim_frame_oam 0x0, 0x0, 0x4, 3, -34
	banim_frame_oam 0x4000, 0x8000, 0x80, -21, -32
	banim_frame_oam 0x4000, 0x8000, 0xC0, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xC4, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x84, 11, -32
	banim_frame_oam 0x4000, 0x0, 0x60, -16, -40
	banim_frame_oam 0x4000, 0x0, 0x62, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x20, 0, -48
	banim_frame_oam 0x8000, 0x0, 0x21, 40, -41
	banim_frame_oam 0x4000, 0x0, 0x64, 24, -40
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x0, 0x0, 0xC7, -24, -11
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 16, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_57_r:
	banim_frame_oam 0x4000, 0x8000, 0xA8, 17, -53
	banim_frame_oam 0x4000, 0x4000, 0x88, 0, -61
	banim_frame_oam 0x0, 0x0, 0x8C, 32, -61
	banim_frame_oam 0x0, 0x0, 0xF, 9, -45
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x0, 0x0, 0x47, 3, -39
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_oam 0x0, 0x4000, 0x48, -7, -31
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_end
banim_fakf_sp1_2_oam_frame_58_r:
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x0, 0x0, 0x47, 3, -39
	banim_frame_oam 0x0, 0x4000, 0x48, -7, -31
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x0, 0x4000, 0xD3, 2, -36
	banim_frame_oam 0x8000, 0x0, 0xD5, 18, -36
	banim_frame_oam 0x4000, 0x0, 0xF0, 26, -31
	banim_frame_oam 0x8000, 0x0, 0xD2, 42, -45
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_59_r:
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x0, 0x0, 0x47, 3, -39
	banim_frame_oam 0x0, 0x4000, 0x48, -7, -31
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_oam 0x4000, 0x4000, 0xEA, -21, -24
	banim_frame_oam 0x4000, 0x0, 0xEE, -13, -40
	banim_frame_oam 0x0, 0x4000, 0x53, -37, -39
	banim_frame_oam 0x8000, 0x0, 0x55, -21, -40
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_60_r:
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x0, 0x0, 0x47, 3, -39
	banim_frame_oam 0x0, 0x0, 0x10, -32, -54
	banim_frame_oam 0x8000, 0x0, 0x11, -40, -52
	banim_frame_oam 0x0, 0x0, 0x30, 0, -44
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_oam 0x0, 0x4000, 0x48, -7, -31
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_oam 0x0, 0x4000, 0x13, -16, -60
	banim_frame_oam 0x8000, 0x0, 0x15, 0, -60
	banim_frame_oam 0x0, 0x0, 0x12, -24, -58
	banim_frame_end
banim_fakf_sp1_2_oam_frame_62_r:
	banim_frame_oam 0x0, 0x0, 0x46, 2, -40
	banim_frame_oam 0x4000, 0x4000, 0xB2, 8, -42
	banim_frame_oam 0x0, 0x4000, 0xAF, -24, -42
	banim_frame_oam 0x4000, 0x0, 0xB1, -8, -42
	banim_frame_oam 0x0, 0x0, 0xD1, -32, -42
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x0, 0x0, 0x47, 3, -39
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_oam 0x0, 0x4000, 0x48, -7, -31
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_end
banim_fakf_sp1_2_oam_frame_63_r:
	banim_frame_oam 0x4000, 0x0, 0x8D, -4, -32
	banim_frame_oam 0x0, 0x0, 0x8F, 3, -40
	banim_frame_oam 0x4000, 0x4000, 0xB2, 8, -43
	banim_frame_oam 0x0, 0x4000, 0xAF, -24, -43
	banim_frame_oam 0x4000, 0x0, 0xB1, -8, -43
	banim_frame_oam 0x0, 0x0, 0xD1, -32, -43
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x0, 0x0, 0x47, 3, -39
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_oam 0x0, 0x4000, 0x48, -7, -31
	banim_frame_end
banim_fakf_sp1_2_oam_frame_64_r:
	banim_frame_oam 0x0, 0x0, 0x67, 3, -39
	banim_frame_oam 0x4000, 0x4000, 0xB2, 9, -42
	banim_frame_oam 0x0, 0x4000, 0xAF, -23, -42
	banim_frame_oam 0x4000, 0x0, 0xB1, -7, -42
	banim_frame_oam 0x0, 0x0, 0xD1, -31, -42
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_oam 0x0, 0x4000, 0x48, -7, -31
	banim_frame_end
banim_fakf_sp1_2_oam_frame_65_r:
	banim_frame_oam 0x8000, 0x0, 0x4F, 5, -31
	banim_frame_oam 0x0, 0x0, 0x2F, 5, -39
	banim_frame_oam 0x4000, 0x4000, 0xB2, 12, -41
	banim_frame_oam 0x0, 0x4000, 0xAF, -20, -41
	banim_frame_oam 0x4000, 0x0, 0xB1, -4, -41
	banim_frame_oam 0x0, 0x0, 0xD1, -28, -41
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_oam 0x8000, 0x0, 0x4E, -3, -31
	banim_frame_oam 0x0, 0x0, 0x6D, -11, -23
	banim_frame_oam 0x0, 0x0, 0x48, -6, -31
	banim_frame_end
banim_fakf_sp1_2_oam_frame_66_r:
	banim_frame_oam 0x4000, 0x4000, 0x90, -29, -37
	banim_frame_oam 0x4000, 0x0, 0x94, 3, -37
	banim_frame_oam 0x8000, 0x0, 0xAE, 1, -31
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xAC, -15, -31
	banim_frame_oam 0x0, 0x0, 0xCD, -7, -23
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_end
banim_fakf_sp1_2_oam_frame_67_r:
	banim_frame_oam 0x4000, 0x8000, 0x5, -28, -15
	banim_frame_oam 0x4000, 0x8000, 0x9, 4, -15
	banim_frame_oam 0x0, 0x4000, 0xD, 36, -15
	banim_frame_oam 0x0, 0x0, 0x24, 52, -13
	banim_frame_oam 0x8000, 0x0, 0xC6, -7, 0
	banim_frame_oam 0x4000, 0x0, 0xE7, 1, 0
	banim_frame_oam 0x8000, 0x0, 0x4C, 25, -31
	banim_frame_oam 0x0, 0x0, 0x23, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 24, 8
	banim_frame_oam 0x0, 0x0, 0x6A, 9, -23
	banim_frame_oam 0x0, 0x0, 0x6B, 17, -26
	banim_frame_oam 0x8000, 0x0, 0xAE, 1, -31
	banim_frame_oam 0x4000, 0x0, 0xAC, -15, -31
	banim_frame_oam 0x0, 0x0, 0xCD, -7, -23
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x40, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x44, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x46, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0x21, -16, -40
	banim_frame_oam 0x4000, 0x0, 0x25, 16, -40
	banim_frame_oam 0x0, 0x0, 0x3, 0, -48
	banim_frame_oam 0x0, 0x4000, 0xC2, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xC4, 8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, 32, -40
	banim_frame_oam 0x0, 0x0, 0xC1, 40, -48
	banim_frame_oam 0x4000, 0x0, 0xC5, 32, -32
	banim_frame_oam 0x0, 0x0, 0xE5, 32, -24
	banim_frame_oam 0x0, 0x0, 0xC0, 16, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_68_r:
	banim_frame_oam 0x0, 0x4000, 0x71, 1, -32
	banim_frame_oam 0x0, 0x0, 0x2F, -40, -38
	banim_frame_oam 0x0, 0x4000, 0x10, -32, -38
	banim_frame_oam 0x0, 0x0, 0x12, -16, -30
	banim_frame_oam 0x4000, 0x0, 0x13, -8, -29
	banim_frame_oam 0x4000, 0x0, 0x32, 8, -25
	banim_frame_oam 0x0, 0x0, 0x34, 24, -25
	banim_frame_oam 0x0, 0x8000, 0x89, -15, -32
	banim_frame_oam 0x8000, 0x8000, 0x8D, 17, -32
	banim_frame_oam 0x4000, 0x8000, 0x4B, 1, -48
	banim_frame_oam 0x8000, 0x8000, 0x9, -15, -64
	banim_frame_oam 0x0, 0x4000, 0xB, 9, -64
	banim_frame_oam 0x8000, 0x0, 0xD, 25, -64
	banim_frame_oam 0x0, 0x0, 0x2E, 1, -56
	banim_frame_oam 0x0, 0x0, 0x88, 15, -72
	banim_frame_oam 0x4000, 0x0, 0xE, 1, 0
	banim_frame_oam 0x8000, 0x0, 0x8, -7, 0
	banim_frame_oam 0x0, 0x0, 0x48, -23, -33
	banim_frame_oam 0x0, 0x0, 0x68, -23, -12
	banim_frame_oam 0x4000, 0x0, 0xE4, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 8, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_69_r:
	banim_frame_oam 0x0, 0x4000, 0xD8, 1, -32
	banim_frame_oam 0x0, 0x0, 0x2F, -39, -38
	banim_frame_oam 0x0, 0x4000, 0x10, -31, -38
	banim_frame_oam 0x0, 0x0, 0x12, -15, -30
	banim_frame_oam 0x4000, 0x0, 0x13, -7, -29
	banim_frame_oam 0x4000, 0x0, 0x32, 9, -25
	banim_frame_oam 0x0, 0x0, 0x34, 25, -25
	banim_frame_oam 0x4000, 0x0, 0xF1, 1, -1
	banim_frame_oam 0x0, 0x4000, 0xB1, 15, -17
	banim_frame_oam 0x8000, 0x0, 0xD3, -7, -1
	banim_frame_oam 0x8000, 0x0, 0xD4, 15, -33
	banim_frame_oam 0x4000, 0x8000, 0x93, -1, -49
	banim_frame_oam 0x0, 0x4000, 0xD5, 7, -65
	banim_frame_oam 0x8000, 0x0, 0xD7, 23, -65
	banim_frame_oam 0x0, 0x0, 0xB7, -1, -57
	banim_frame_oam 0x0, 0x0, 0x73, 10, -73
	banim_frame_oam 0x0, 0x0, 0x74, -25, -10
	banim_frame_oam 0x0, 0x0, 0x54, 23, -25
	banim_frame_oam 0x0, 0x8000, 0x15, -17, -33
	banim_frame_oam 0x8000, 0x8000, 0x19, -17, -65
	banim_frame_oam 0x4000, 0x0, 0xE4, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 8, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_70_r:
	banim_frame_oam 0x4000, 0x8000, 0xCE, -25, -86
	banim_frame_oam 0x0, 0x4000, 0xD2, 7, -86
	banim_frame_oam 0x8000, 0x8000, 0x12, 23, -94
	banim_frame_oam 0x0, 0x4000, 0x92, 23, -62
	banim_frame_oam 0x0, 0x4000, 0x90, 23, -38
	banim_frame_oam 0x4000, 0x8000, 0x4E, -41, -6
	banim_frame_oam 0x4000, 0x0, 0x30, -9, -6
	banim_frame_oam 0x8000, 0x4000, 0x14, -49, -70
	banim_frame_oam 0x0, 0x0, 0x94, -49, -38
	banim_frame_oam 0x0, 0x4000, 0xB4, 39, -94
	banim_frame_oam 0x4000, 0x0, 0x2E, 6, -94
	banim_frame_oam 0x4000, 0x0, 0x2C, -49, -78
	banim_frame_oam 0x4000, 0x0, 0xF4, 39, -63
	banim_frame_oam 0x8000, 0x0, 0x15, -33, -86
	banim_frame_oam 0x4000, 0x0, 0xEB, -35, 8
	banim_frame_oam 0x0, 0x0, 0xCB, -11, 8
	banim_frame_oam 0x0, 0x0, 0xEC, -19, 8
	banim_frame_oam 0x0, 0x4000, 0x9E, -49, -30
	banim_frame_oam 0x4000, 0x0, 0xDE, -49, -14
	banim_frame_oam 0x0, 0x4000, 0x5E, -65, -22
	banim_frame_oam 0x8000, 0x0, 0x1E, -33, -30
	banim_frame_oam 0x0, 0x0, 0x3F, -49, -6
	banim_frame_oam 0x8000, 0xC000, 0x1A, -9, -70
	banim_frame_oam 0x0, 0x8000, 0x16, -41, -70
	banim_frame_oam 0x4000, 0x4000, 0x96, -41, -38
	banim_frame_oam 0x0, 0x4000, 0xB8, -25, -30
	banim_frame_oam 0x4000, 0x0, 0xF8, -25, -14
	banim_frame_oam 0x0, 0x0, 0xF7, -33, -14
	banim_frame_end
banim_fakf_sp1_2_oam_frame_71_r:
	banim_frame_oam 0x0, 0x4000, 0x1A, -46, -59
	banim_frame_oam 0x0, 0x4000, 0x1C, -24, -59
	banim_frame_oam 0x8000, 0x0, 0x1E, -8, -59
	banim_frame_oam 0x4000, 0x8000, 0x5A, -45, -43
	banim_frame_oam 0x0, 0x4000, 0x5E, -13, -43
	banim_frame_oam 0x4000, 0x8000, 0xDA, -53, -11
	banim_frame_oam 0x0, 0x4000, 0xDE, -21, -11
	banim_frame_oam 0x4000, 0x8000, 0x9A, -44, -27
	banim_frame_oam 0x0, 0x4000, 0x9E, -12, -27
	banim_frame_oam 0x4000, 0x0, 0x98, -47, -67
	banim_frame_oam 0x0, 0x4000, 0xB8, -23, -75
	banim_frame_oam 0x0, 0x0, 0x3F, -23, -83
	banim_frame_oam 0x4000, 0x0, 0xF8, -34, 5
	banim_frame_oam 0x0, 0x0, 0x23, -35, 8
	banim_frame_oam 0x0, 0x0, 0xE9, -27, 8
	banim_frame_oam 0x0, 0x0, 0xE9, -19, 8
	banim_frame_oam 0x0, 0x0, 0xF6, -11, 8
	banim_frame_oam 0x8000, 0x0, 0x96, -5, -11
	banim_frame_oam 0x8000, 0x2000, 0x22, -69, -15
	banim_frame_oam 0x0, 0x2000, 0x0, -77, -7
	banim_frame_oam 0x0, 0x2000, 0x1, -61, -9
	banim_frame_end
banim_fakf_sp1_2_oam_frame_72_r:
	banim_frame_oam 0x0, 0x4000, 0x8, -78, -9
	banim_frame_oam 0x4000, 0x0, 0xA8, -62, -9
	banim_frame_oam 0x4000, 0x8000, 0xC0, -49, -11
	banim_frame_oam 0x0, 0x4000, 0xC4, -17, -11
	banim_frame_oam 0x8000, 0x0, 0x85, -1, -19
	banim_frame_oam 0x4000, 0x8000, 0x80, -41, -27
	banim_frame_oam 0x8000, 0x0, 0x84, -9, -27
	banim_frame_oam 0x4000, 0x0, 0x66, -34, 5
	banim_frame_oam 0x4000, 0x8000, 0x40, -49, -43
	banim_frame_oam 0x0, 0x4000, 0x44, -17, -43
	banim_frame_oam 0x4000, 0x0, 0x46, -47, -51
	banim_frame_oam 0x0, 0x4000, 0x0, -49, -67
	banim_frame_oam 0x0, 0x4000, 0x2, -25, -59
	banim_frame_oam 0x8000, 0x0, 0x4, -9, -59
	banim_frame_oam 0x0, 0x4000, 0x5, -25, -75
	banim_frame_oam 0x0, 0x0, 0x7, -25, -83
	banim_frame_oam 0x0, 0x0, 0x27, -57, -11
	banim_frame_oam 0x0, 0x0, 0x87, -35, 8
	banim_frame_oam 0x0, 0x0, 0x88, -27, 8
	banim_frame_oam 0x0, 0x0, 0x88, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, -11, 8
	banim_frame_oam 0x0, 0x0, 0xA7, -17, -23
	banim_frame_oam 0x0, 0x0, 0x4E, -49, -19
	banim_frame_end
banim_fakf_sp1_2_oam_frame_73_r:
	banim_frame_oam 0x0, 0x4000, 0x14, -49, -67
	banim_frame_oam 0x4000, 0x0, 0x95, -49, -51
	banim_frame_oam 0x0, 0x0, 0x97, -33, -51
	banim_frame_oam 0x8000, 0x0, 0x16, -20, -75
	banim_frame_oam 0x0, 0x0, 0x37, -12, -67
	banim_frame_oam 0x0, 0x0, 0x17, -23, -83
	banim_frame_oam 0x0, 0x4000, 0x55, -25, -59
	banim_frame_oam 0x8000, 0x0, 0x57, -9, -59
	banim_frame_oam 0x4000, 0x0, 0xB6, -34, 5
	banim_frame_oam 0x0, 0x4000, 0xCF, -1, -27
	banim_frame_oam 0x0, 0x4000, 0xCD, -49, -11
	banim_frame_oam 0x0, 0x0, 0xB5, -57, -11
	banim_frame_oam 0x0, 0x8000, 0x10, -33, -27
	banim_frame_oam 0x4000, 0x8000, 0xA, -49, -43
	banim_frame_oam 0x0, 0x4000, 0xE, -17, -43
	banim_frame_oam 0x8000, 0x0, 0x4F, -41, -27
	banim_frame_oam 0x0, 0x0, 0x87, -35, 8
	banim_frame_oam 0x0, 0x0, 0x88, -27, 8
	banim_frame_oam 0x0, 0x0, 0x88, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, -11, 8
	banim_frame_oam 0x0, 0x0, 0xA7, -17, -23
	banim_frame_oam 0x0, 0x0, 0x6E, -1, -11
	banim_frame_oam 0x0, 0x0, 0x4E, -49, -19
	banim_frame_oam 0x0, 0x4000, 0x8, -78, -9
	banim_frame_oam 0x4000, 0x0, 0xA8, -62, -9
	banim_frame_end
banim_fakf_sp1_2_oam_frame_74_r:
	banim_frame_oam 0x4000, 0x0, 0x1B, -1, -15
	banim_frame_oam 0x0, 0x0, 0x1D, 15, -15
	banim_frame_oam 0x4000, 0x0, 0x3B, -12, -39
	banim_frame_oam 0x0, 0x0, 0x3D, 4, -39
	banim_frame_oam 0x4000, 0x8000, 0xD8, -12, -31
	banim_frame_oam 0x8000, 0x8000, 0x5A, -49, -39
	banim_frame_oam 0x8000, 0x0, 0x5C, -33, -39
	banim_frame_oam 0x0, 0x0, 0x5D, -25, -39
	banim_frame_oam 0x8000, 0x8000, 0x58, -65, -33
	banim_frame_oam 0x0, 0x4000, 0x14, -49, -67
	banim_frame_oam 0x4000, 0x0, 0x95, -49, -51
	banim_frame_oam 0x0, 0x0, 0x97, -33, -51
	banim_frame_oam 0x8000, 0x0, 0x16, -20, -75
	banim_frame_oam 0x0, 0x0, 0x37, -12, -67
	banim_frame_oam 0x0, 0x0, 0x17, -23, -83
	banim_frame_oam 0x0, 0x4000, 0x55, -25, -59
	banim_frame_oam 0x8000, 0x0, 0x57, -9, -59
	banim_frame_oam 0x4000, 0x0, 0xB6, -34, 5
	banim_frame_oam 0x0, 0x4000, 0xCF, -1, -27
	banim_frame_oam 0x0, 0x4000, 0xCD, -49, -11
	banim_frame_oam 0x0, 0x0, 0xB5, -57, -11
	banim_frame_oam 0x0, 0x8000, 0x10, -33, -27
	banim_frame_oam 0x4000, 0x8000, 0xA, -49, -43
	banim_frame_oam 0x0, 0x4000, 0xE, -17, -43
	banim_frame_oam 0x8000, 0x0, 0x4F, -41, -27
	banim_frame_oam 0x0, 0x0, 0x87, -35, 8
	banim_frame_oam 0x0, 0x0, 0x88, -27, 8
	banim_frame_oam 0x0, 0x0, 0x88, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, -11, 8
	banim_frame_oam 0x0, 0x0, 0xA7, -17, -23
	banim_frame_oam 0x0, 0x0, 0x6E, -1, -11
	banim_frame_oam 0x0, 0x0, 0x4E, -49, -19
	banim_frame_oam 0x0, 0x4000, 0x18, -81, -15
	banim_frame_oam 0x0, 0x0, 0x1A, -73, -23
	banim_frame_end
banim_fakf_sp1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0xEC, 25, -53
	banim_frame_oam 0x0, 0x4000, 0xC1, 2, -76
	banim_frame_oam 0x4000, 0x0, 0xC3, 10, -61
	banim_frame_oam 0x4000, 0x0, 0xE3, 18, -53
	banim_frame_oam 0x4000, 0x0, 0xC5, 26, -45
	banim_frame_oam 0x4000, 0x0, 0xE5, 34, -37
	banim_frame_oam 0x4000, 0x4000, 0x87, -14, -18
	banim_frame_oam 0x0, 0x4000, 0xA9, 2, -10
	banim_frame_oam 0x8000, 0x4000, 0x2B, 18, -42
	banim_frame_oam 0x8000, 0x0, 0xAB, 18, -10
	banim_frame_oam 0x8000, 0x4000, 0x2C, 26, -42
	banim_frame_oam 0x0, 0x0, 0xAC, 26, -10
	banim_frame_oam 0x8000, 0x0, 0x6D, 34, -26
	banim_frame_oam 0x8000, 0x0, 0x6, -22, -30
	banim_frame_oam 0x0, 0x0, 0x46, -22, -14
	banim_frame_oam 0x0, 0x0, 0xA8, -5, -3
	banim_frame_oam 0x0, 0x0, 0x1, -5, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 19, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 3, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 11, 8
	banim_frame_oam 0x4000, 0x4000, 0x7, -14, -50
	banim_frame_oam 0x0, 0x0, 0xB, 18, -50
	banim_frame_oam 0x4000, 0x4000, 0x27, -14, -42
	banim_frame_oam 0x4000, 0x4000, 0x47, -14, -34
	banim_frame_oam 0x4000, 0x0, 0x68, -6, -26
	banim_frame_oam 0x0, 0x0, 0x6A, 10, -26
	banim_frame_oam 0x0, 0x0, 0x67, -14, -26
	banim_frame_oam 0x0, 0x0, 0xC, 26, -50
	banim_frame_oam 0x4000, 0x0, 0xE9, 10, -58
	banim_frame_oam 0x0, 0x0, 0xEB, 26, -58
	banim_frame_end
banim_fakf_sp1_2_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x0, 0x7D, 23, -50
	banim_frame_oam 0x0, 0x0, 0x5E, 31, -58
	banim_frame_oam 0x0, 0x0, 0x57, 32, -66
	banim_frame_oam 0x0, 0x4000, 0x71, 23, -50
	banim_frame_oam 0x4000, 0x0, 0x73, 23, -58
	banim_frame_oam 0x8000, 0x0, 0x5F, 39, -58
	banim_frame_oam 0x0, 0x4000, 0xC1, 4, -77
	banim_frame_oam 0x4000, 0x0, 0xC3, 12, -62
	banim_frame_oam 0x4000, 0x0, 0xE3, 20, -54
	banim_frame_oam 0x4000, 0x0, 0xC5, 28, -46
	banim_frame_oam 0x4000, 0x0, 0xE5, 36, -38
	banim_frame_oam 0x0, 0x8000, 0x9C, 7, -42
	banim_frame_oam 0x8000, 0x8000, 0x5A, -9, -76
	banim_frame_oam 0x0, 0x4000, 0xDA, -9, -44
	banim_frame_oam 0x0, 0x4000, 0x1A, 40, -74
	banim_frame_oam 0x8000, 0x0, 0x1C, 56, -74
	banim_frame_oam 0x8000, 0x0, 0xD9, -1, -28
	banim_frame_oam 0x4000, 0x0, 0x16, 46, -58
	banim_frame_oam 0x0, 0x0, 0x36, 46, -50
	banim_frame_oam 0x0, 0x0, 0x37, -17, -44
	banim_frame_oam 0x0, 0x4000, 0x18, 48, -90
	banim_frame_oam 0x8000, 0x4000, 0x59, 7, -74
	banim_frame_oam 0x0, 0x4000, 0x1D, -13, -92
	banim_frame_oam 0x8000, 0x0, 0x5C, 15, -58
	banim_frame_oam 0x0, 0x0, 0x1, -2, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 22, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 6, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 14, 8
	banim_frame_end
banim_fakf_sp1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x0, 0xEC, 26, -57
	banim_frame_oam 0x0, 0x4000, 0xC1, 3, -80
	banim_frame_oam 0x4000, 0x0, 0xC3, 11, -65
	banim_frame_oam 0x4000, 0x0, 0xE3, 19, -57
	banim_frame_oam 0x4000, 0x0, 0xC5, 27, -49
	banim_frame_oam 0x4000, 0x0, 0xE5, 35, -41
	banim_frame_oam 0x4000, 0x4000, 0x40, -13, -46
	banim_frame_oam 0x4000, 0x0, 0x44, 19, -46
	banim_frame_oam 0x4000, 0x4000, 0x60, -13, -38
	banim_frame_oam 0x4000, 0x0, 0x64, 19, -38
	banim_frame_oam 0x0, 0x0, 0x66, 35, -38
	banim_frame_oam 0x4000, 0x8000, 0x82, 3, -30
	banim_frame_oam 0x8000, 0x0, 0x86, 35, -30
	banim_frame_oam 0x8000, 0x0, 0x80, -21, -46
	banim_frame_oam 0x8000, 0x0, 0x0, 43, -36
	banim_frame_oam 0x8000, 0x0, 0x81, 51, -36
	banim_frame_oam 0x0, 0x0, 0x1, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 24, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x21, -5, -54
	banim_frame_oam 0x4000, 0x0, 0xA, 11, -54
	banim_frame_oam 0x0, 0x0, 0xC, 27, -54
	banim_frame_oam 0x4000, 0x0, 0xE9, 11, -62
	banim_frame_oam 0x0, 0x0, 0xEB, 27, -62
	banim_frame_end
banim_fakf_sp1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0xEC, 27, -59
	banim_frame_oam 0x0, 0x4000, 0xC1, 4, -82
	banim_frame_oam 0x4000, 0x0, 0xC3, 12, -67
	banim_frame_oam 0x4000, 0x0, 0xE3, 20, -59
	banim_frame_oam 0x4000, 0x0, 0xC5, 28, -51
	banim_frame_oam 0x4000, 0x0, 0xE5, 36, -43
	banim_frame_oam 0x4000, 0x4000, 0x40, -12, -48
	banim_frame_oam 0x4000, 0x0, 0x44, 20, -48
	banim_frame_oam 0x4000, 0x4000, 0x60, -12, -40
	banim_frame_oam 0x4000, 0x0, 0x64, 20, -40
	banim_frame_oam 0x0, 0x0, 0x66, 36, -40
	banim_frame_oam 0x4000, 0x8000, 0x82, 4, -32
	banim_frame_oam 0x8000, 0x0, 0x86, 36, -32
	banim_frame_oam 0x8000, 0x0, 0x80, -20, -48
	banim_frame_oam 0x8000, 0x0, 0x0, 44, -38
	banim_frame_oam 0x8000, 0x0, 0x81, 52, -38
	banim_frame_oam 0x0, 0x0, 0x1, 1, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 25, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 9, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 17, 8
	banim_frame_oam 0x4000, 0x0, 0x21, -4, -56
	banim_frame_oam 0x4000, 0x0, 0xA, 12, -56
	banim_frame_oam 0x0, 0x0, 0xC, 28, -56
	banim_frame_oam 0x4000, 0x0, 0xE9, 12, -64
	banim_frame_oam 0x0, 0x0, 0xEB, 28, -64
	banim_frame_end
	.section .data.script
banim_fakf_sp1_2_script:
banim_fakf_sp1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 1, banim_fakf_sp1_2_oam_frame_1_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_0, 2, banim_fakf_sp1_2_oam_frame_2_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_fakf_sp1_sheet_1, 3, banim_fakf_sp1_2_oam_frame_3_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 9, banim_fakf_sp1_sheet_1, 76, banim_fakf_sp1_2_oam_frame_4_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 7, banim_fakf_sp1_sheet_1, 77, banim_fakf_sp1_2_oam_frame_5_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_1, 78, banim_fakf_sp1_2_oam_frame_6_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 79, banim_fakf_sp1_2_oam_frame_7_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_1, 4, banim_fakf_sp1_2_oam_frame_8_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 5, banim_fakf_sp1_2_oam_frame_9_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 6, banim_fakf_sp1_2_oam_frame_10_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_2, 7, banim_fakf_sp1_2_oam_frame_11_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 14, banim_fakf_sp1_sheet_1, 8, banim_fakf_sp1_2_oam_frame_12_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_2, 9, banim_fakf_sp1_2_oam_frame_13_r - banim_fakf_sp1_2_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 11, banim_fakf_sp1_2_oam_frame_14_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_4, 17, banim_fakf_sp1_2_oam_frame_15_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_4, 19, banim_fakf_sp1_2_oam_frame_16_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_4, 20, banim_fakf_sp1_2_oam_frame_17_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 12, banim_fakf_sp1_sheet_4, 22, banim_fakf_sp1_2_oam_frame_18_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 7, banim_fakf_sp1_sheet_5, 23, banim_fakf_sp1_2_oam_frame_19_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_fakf_sp1_sheet_5, 24, banim_fakf_sp1_2_oam_frame_20_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_5, 25, banim_fakf_sp1_2_oam_frame_21_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_5, 26, banim_fakf_sp1_2_oam_frame_22_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 15, banim_fakf_sp1_sheet_4, 49, banim_fakf_sp1_2_oam_frame_23_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 41, banim_fakf_sp1_2_oam_frame_25_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 42, banim_fakf_sp1_2_oam_frame_26_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 43, banim_fakf_sp1_2_oam_frame_27_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 44, banim_fakf_sp1_2_oam_frame_28_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 45, banim_fakf_sp1_2_oam_frame_29_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 46, banim_fakf_sp1_2_oam_frame_30_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 47, banim_fakf_sp1_2_oam_frame_31_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 48, banim_fakf_sp1_2_oam_frame_32_r - banim_fakf_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 2, banim_fakf_sp1_2_oam_frame_2_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 1, banim_fakf_sp1_2_oam_frame_1_r - banim_fakf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 9, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 7, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_2, 15, banim_fakf_sp1_2_oam_frame_35_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 14, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_2, 10, banim_fakf_sp1_2_oam_frame_36_r - banim_fakf_sp1_2_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 12, banim_fakf_sp1_2_oam_frame_37_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_4, 18, banim_fakf_sp1_2_oam_frame_38_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_4, 18, banim_fakf_sp1_2_oam_frame_38_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_4, 21, banim_fakf_sp1_2_oam_frame_39_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 12, banim_fakf_sp1_sheet_4, 49, banim_fakf_sp1_2_oam_frame_23_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 7, banim_fakf_sp1_sheet_5, 50, banim_fakf_sp1_2_oam_frame_40_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_fakf_sp1_sheet_5, 50, banim_fakf_sp1_2_oam_frame_40_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_5, 50, banim_fakf_sp1_2_oam_frame_40_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_5, 50, banim_fakf_sp1_2_oam_frame_40_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 15, banim_fakf_sp1_sheet_4, 49, banim_fakf_sp1_2_oam_frame_23_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_fakf_sp1_sheet_6, 27, banim_fakf_sp1_2_oam_frame_41_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 28, banim_fakf_sp1_2_oam_frame_42_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 29, banim_fakf_sp1_2_oam_frame_43_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 30, banim_fakf_sp1_2_oam_frame_44_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 31, banim_fakf_sp1_2_oam_frame_45_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 32, banim_fakf_sp1_2_oam_frame_46_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 33, banim_fakf_sp1_2_oam_frame_47_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 34, banim_fakf_sp1_2_oam_frame_48_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 35, banim_fakf_sp1_2_oam_frame_49_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 36, banim_fakf_sp1_2_oam_frame_50_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 37, banim_fakf_sp1_2_oam_frame_51_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 38, banim_fakf_sp1_2_oam_frame_52_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 39, banim_fakf_sp1_2_oam_frame_53_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 40, banim_fakf_sp1_2_oam_frame_54_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 52, banim_fakf_sp1_2_oam_frame_55_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 52, banim_fakf_sp1_2_oam_frame_55_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 52, banim_fakf_sp1_2_oam_frame_55_r - banim_fakf_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 53, banim_fakf_sp1_2_oam_frame_56_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 54, banim_fakf_sp1_2_oam_frame_57_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_3, 55, banim_fakf_sp1_2_oam_frame_58_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 56, banim_fakf_sp1_2_oam_frame_59_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 57, banim_fakf_sp1_2_oam_frame_60_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 54, banim_fakf_sp1_2_oam_frame_57_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 55, banim_fakf_sp1_2_oam_frame_58_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 56, banim_fakf_sp1_2_oam_frame_59_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 57, banim_fakf_sp1_2_oam_frame_60_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 54, banim_fakf_sp1_2_oam_frame_57_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 55, banim_fakf_sp1_2_oam_frame_58_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 56, banim_fakf_sp1_2_oam_frame_59_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 57, banim_fakf_sp1_2_oam_frame_60_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 54, banim_fakf_sp1_2_oam_frame_57_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 55, banim_fakf_sp1_2_oam_frame_58_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 56, banim_fakf_sp1_2_oam_frame_59_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 57, banim_fakf_sp1_2_oam_frame_60_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 53, banim_fakf_sp1_2_oam_frame_56_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 5, banim_fakf_sp1_sheet_0, 1, banim_fakf_sp1_2_oam_frame_1_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 5, banim_fakf_sp1_sheet_0, 2, banim_fakf_sp1_2_oam_frame_2_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_fakf_sp1_sheet_1, 3, banim_fakf_sp1_2_oam_frame_3_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 11, banim_fakf_sp1_sheet_1, 76, banim_fakf_sp1_2_oam_frame_4_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 6, banim_fakf_sp1_sheet_1, 77, banim_fakf_sp1_2_oam_frame_5_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_1, 78, banim_fakf_sp1_2_oam_frame_6_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 79, banim_fakf_sp1_2_oam_frame_7_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 10, banim_fakf_sp1_sheet_1, 4, banim_fakf_sp1_2_oam_frame_8_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 5, banim_fakf_sp1_2_oam_frame_9_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_1, 6, banim_fakf_sp1_2_oam_frame_10_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_2, 7, banim_fakf_sp1_2_oam_frame_11_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 17, banim_fakf_sp1_sheet_1, 8, banim_fakf_sp1_2_oam_frame_12_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_2, 9, banim_fakf_sp1_2_oam_frame_13_r - banim_fakf_sp1_2_oam_r
	banim_code_hit_critical_5
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 11, banim_fakf_sp1_2_oam_frame_14_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_4, 17, banim_fakf_sp1_2_oam_frame_15_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_4, 19, banim_fakf_sp1_2_oam_frame_16_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_4, 20, banim_fakf_sp1_2_oam_frame_17_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 12, banim_fakf_sp1_sheet_4, 22, banim_fakf_sp1_2_oam_frame_18_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 7, banim_fakf_sp1_sheet_5, 23, banim_fakf_sp1_2_oam_frame_19_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_fakf_sp1_sheet_5, 24, banim_fakf_sp1_2_oam_frame_20_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_5, 25, banim_fakf_sp1_2_oam_frame_21_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_5, 26, banim_fakf_sp1_2_oam_frame_22_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 15, banim_fakf_sp1_sheet_4, 49, banim_fakf_sp1_2_oam_frame_23_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 41, banim_fakf_sp1_2_oam_frame_25_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 42, banim_fakf_sp1_2_oam_frame_26_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 43, banim_fakf_sp1_2_oam_frame_27_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 44, banim_fakf_sp1_2_oam_frame_28_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 45, banim_fakf_sp1_2_oam_frame_29_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 46, banim_fakf_sp1_2_oam_frame_30_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 47, banim_fakf_sp1_2_oam_frame_31_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 48, banim_fakf_sp1_2_oam_frame_32_r - banim_fakf_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 2, banim_fakf_sp1_2_oam_frame_2_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 1, banim_fakf_sp1_2_oam_frame_1_r - banim_fakf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 16, banim_fakf_sp1_2_oam_frame_61_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 5, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 5, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 11, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 6, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 10, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_2, 15, banim_fakf_sp1_2_oam_frame_35_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 17, banim_fakf_sp1_sheet_1, 14, banim_fakf_sp1_2_oam_frame_34_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_2, 10, banim_fakf_sp1_2_oam_frame_36_r - banim_fakf_sp1_2_oam_r
	banim_code_hit_critical_5
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 12, banim_fakf_sp1_2_oam_frame_37_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_4, 18, banim_fakf_sp1_2_oam_frame_38_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_4, 18, banim_fakf_sp1_2_oam_frame_38_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_4, 21, banim_fakf_sp1_2_oam_frame_39_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 12, banim_fakf_sp1_sheet_4, 49, banim_fakf_sp1_2_oam_frame_23_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 7, banim_fakf_sp1_sheet_5, 50, banim_fakf_sp1_2_oam_frame_40_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_fakf_sp1_sheet_5, 50, banim_fakf_sp1_2_oam_frame_40_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_5, 50, banim_fakf_sp1_2_oam_frame_40_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_5, 50, banim_fakf_sp1_2_oam_frame_40_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 15, banim_fakf_sp1_sheet_4, 49, banim_fakf_sp1_2_oam_frame_23_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_fakf_sp1_sheet_6, 27, banim_fakf_sp1_2_oam_frame_41_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 28, banim_fakf_sp1_2_oam_frame_42_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 29, banim_fakf_sp1_2_oam_frame_43_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 30, banim_fakf_sp1_2_oam_frame_44_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 31, banim_fakf_sp1_2_oam_frame_45_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 32, banim_fakf_sp1_2_oam_frame_46_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 33, banim_fakf_sp1_2_oam_frame_47_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 34, banim_fakf_sp1_2_oam_frame_48_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 35, banim_fakf_sp1_2_oam_frame_49_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 36, banim_fakf_sp1_2_oam_frame_50_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 37, banim_fakf_sp1_2_oam_frame_51_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 38, banim_fakf_sp1_2_oam_frame_52_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 39, banim_fakf_sp1_2_oam_frame_53_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 40, banim_fakf_sp1_2_oam_frame_54_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 51, banim_fakf_sp1_2_oam_frame_24_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 52, banim_fakf_sp1_2_oam_frame_55_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 52, banim_fakf_sp1_2_oam_frame_55_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 52, banim_fakf_sp1_2_oam_frame_55_r - banim_fakf_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 13, banim_fakf_sp1_2_oam_frame_33_r - banim_fakf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 53, banim_fakf_sp1_2_oam_frame_56_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 7, banim_fakf_sp1_sheet_3, 58, banim_fakf_sp1_2_oam_frame_62_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 59, banim_fakf_sp1_2_oam_frame_63_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 8, banim_fakf_sp1_sheet_3, 60, banim_fakf_sp1_2_oam_frame_64_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 19, banim_fakf_sp1_sheet_3, 61, banim_fakf_sp1_2_oam_frame_65_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_fakf_sp1_sheet_3, 62, banim_fakf_sp1_2_oam_frame_66_r - banim_fakf_sp1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 63, banim_fakf_sp1_2_oam_frame_67_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 53, banim_fakf_sp1_2_oam_frame_56_r - banim_fakf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 53, banim_fakf_sp1_2_oam_frame_56_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 54, banim_fakf_sp1_2_oam_frame_57_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 55, banim_fakf_sp1_2_oam_frame_58_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 56, banim_fakf_sp1_2_oam_frame_59_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 57, banim_fakf_sp1_2_oam_frame_60_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 10, banim_fakf_sp1_sheet_3, 58, banim_fakf_sp1_2_oam_frame_62_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 59, banim_fakf_sp1_2_oam_frame_63_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 8, banim_fakf_sp1_sheet_3, 60, banim_fakf_sp1_2_oam_frame_64_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 17, banim_fakf_sp1_sheet_3, 61, banim_fakf_sp1_2_oam_frame_65_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_fakf_sp1_sheet_3, 62, banim_fakf_sp1_2_oam_frame_66_r - banim_fakf_sp1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_fakf_sp1_sheet_3, 63, banim_fakf_sp1_2_oam_frame_67_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_fakf_sp1_sheet_3, 53, banim_fakf_sp1_2_oam_frame_56_r - banim_fakf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 4, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 65, banim_fakf_sp1_2_oam_frame_68_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 66, banim_fakf_sp1_2_oam_frame_69_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 65, banim_fakf_sp1_2_oam_frame_68_r - banim_fakf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 4, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 65, banim_fakf_sp1_2_oam_frame_68_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 66, banim_fakf_sp1_2_oam_frame_69_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_7, 65, banim_fakf_sp1_2_oam_frame_68_r - banim_fakf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fakf_sp1_2_mode_stand_close:
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_fakf_sp1_2_mode_stand:
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_fakf_sp1_2_mode_stand_range:
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_fakf_sp1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fakf_sp1_sheet_0, 0, banim_fakf_sp1_2_oam_frame_0_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 1, banim_fakf_sp1_2_oam_frame_1_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_0, 2, banim_fakf_sp1_2_oam_frame_2_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 5, banim_fakf_sp1_sheet_1, 3, banim_fakf_sp1_2_oam_frame_3_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 10, banim_fakf_sp1_sheet_1, 76, banim_fakf_sp1_2_oam_frame_4_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 6, banim_fakf_sp1_sheet_1, 77, banim_fakf_sp1_2_oam_frame_5_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_1, 78, banim_fakf_sp1_2_oam_frame_6_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 79, banim_fakf_sp1_2_oam_frame_7_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_1, 4, banim_fakf_sp1_2_oam_frame_8_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 5, banim_fakf_sp1_2_oam_frame_9_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_1, 6, banim_fakf_sp1_2_oam_frame_10_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_2, 7, banim_fakf_sp1_2_oam_frame_11_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 11, banim_fakf_sp1_sheet_1, 8, banim_fakf_sp1_2_oam_frame_12_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_fakf_sp1_sheet_2, 71, banim_fakf_sp1_2_oam_frame_70_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 2, banim_fakf_sp1_sheet_3, 72, banim_fakf_sp1_2_oam_frame_71_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_4, 73, banim_fakf_sp1_2_oam_frame_72_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_4, 74, banim_fakf_sp1_2_oam_frame_73_r - banim_fakf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fakf_sp1_sheet_4, 75, banim_fakf_sp1_2_oam_frame_74_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 8, banim_fakf_sp1_sheet_4, 22, banim_fakf_sp1_2_oam_frame_18_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 5, banim_fakf_sp1_sheet_5, 23, banim_fakf_sp1_2_oam_frame_19_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_fakf_sp1_sheet_5, 24, banim_fakf_sp1_2_oam_frame_20_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_5, 25, banim_fakf_sp1_2_oam_frame_21_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_5, 26, banim_fakf_sp1_2_oam_frame_22_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 15, banim_fakf_sp1_sheet_4, 49, banim_fakf_sp1_2_oam_frame_23_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 3, banim_fakf_sp1_sheet_6, 27, banim_fakf_sp1_2_oam_frame_41_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 28, banim_fakf_sp1_2_oam_frame_42_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 29, banim_fakf_sp1_2_oam_frame_43_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 30, banim_fakf_sp1_2_oam_frame_44_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 31, banim_fakf_sp1_2_oam_frame_45_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 32, banim_fakf_sp1_2_oam_frame_46_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 33, banim_fakf_sp1_2_oam_frame_47_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 34, banim_fakf_sp1_2_oam_frame_48_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 35, banim_fakf_sp1_2_oam_frame_49_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 36, banim_fakf_sp1_2_oam_frame_50_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 37, banim_fakf_sp1_2_oam_frame_51_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 38, banim_fakf_sp1_2_oam_frame_52_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 39, banim_fakf_sp1_2_oam_frame_53_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 40, banim_fakf_sp1_2_oam_frame_54_r - banim_fakf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 41, banim_fakf_sp1_2_oam_frame_25_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 42, banim_fakf_sp1_2_oam_frame_26_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 43, banim_fakf_sp1_2_oam_frame_27_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_6, 44, banim_fakf_sp1_2_oam_frame_28_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_6, 45, banim_fakf_sp1_2_oam_frame_29_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 46, banim_fakf_sp1_2_oam_frame_30_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 1, banim_fakf_sp1_sheet_7, 47, banim_fakf_sp1_2_oam_frame_31_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 2, banim_fakf_sp1_sheet_7, 48, banim_fakf_sp1_2_oam_frame_32_r - banim_fakf_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 2, banim_fakf_sp1_2_oam_frame_2_r - banim_fakf_sp1_2_oam_r
	banim_code_frame 3, banim_fakf_sp1_sheet_0, 1, banim_fakf_sp1_2_oam_frame_1_r - banim_fakf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_fakf_sp1_2_mode_attack_close - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_attack_close_back - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_attack_close_critical - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_attack_close_critical_back - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_attack_range - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_attack_range_critical - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_dodge_close - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_dodge_range - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_stand_close - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_stand - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_stand_range - banim_fakf_sp1_2_script
	.word banim_fakf_sp1_2_mode_attack_miss - banim_fakf_sp1_2_script
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

