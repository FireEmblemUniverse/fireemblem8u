@ vim:ft=armv4
	.global banim_genm_al1_5_script
	.global banim_genm_al1_5_oam_r
	.global banim_genm_al1_5_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x49
	.section .data.oam_l
banim_genm_al1_5_oam_l:
banim_genm_al1_5_oam_frame_0_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x84, -32, -4
	banim_frame_oam 0x4000, 0x9000, 0x46, 7, -2
	banim_frame_oam 0x8000, 0x1000, 0xA, 1, -12
	banim_frame_oam 0x0, 0x5000, 0x6, -37, -29
	banim_frame_end
banim_genm_al1_5_oam_frame_1_l:
	banim_frame_oam 0x8000, 0xD000, 0xC, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x10, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x90, -32, -4
	banim_frame_oam 0x0, 0x1000, 0x93, -24, -13
	banim_frame_oam 0x8000, 0x1000, 0x92, 0, -12
	banim_frame_oam 0x4000, 0x9000, 0x52, 6, -6
	banim_frame_oam 0x0, 0x1000, 0xB3, 8, 10
	banim_frame_oam 0x4000, 0x1000, 0xD2, 16, 10
	banim_frame_oam 0x4000, 0x1000, 0x12, -39, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_2_l:
	banim_frame_oam 0x8000, 0xD000, 0x16, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x1A, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x9A, -32, -4
	banim_frame_oam 0x4000, 0x5000, 0x1C, -56, -13
	banim_frame_oam 0x4000, 0x1000, 0x3C, -31, -10
	banim_frame_oam 0x4000, 0x1000, 0xB4, -32, 7
	banim_frame_oam 0x4000, 0x1000, 0x94, 13, 7
	banim_frame_oam 0x4000, 0x9000, 0x5C, -2, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_3_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -23, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -39, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -39, -5
	banim_frame_oam 0x4000, 0x5000, 0x26, -61, -10
	banim_frame_oam 0x4000, 0x1000, 0xC8, -5, 4
	banim_frame_oam 0x4000, 0x9000, 0x32, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0xE8, -36, -17
	banim_frame_oam 0x4000, 0x1000, 0x6, -77, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_4_l:
	banim_frame_oam 0x8000, 0xD000, 0xC, -28, -37
	banim_frame_oam 0x8000, 0x9000, 0x10, -44, -37
	banim_frame_oam 0x8000, 0x9000, 0x90, -44, -5
	banim_frame_oam 0x4000, 0x5000, 0x26, -68, -12
	banim_frame_oam 0x4000, 0x9000, 0x32, -20, -17
	banim_frame_oam 0x0, 0x1000, 0x14, -33, -15
	banim_frame_oam 0x4000, 0x1000, 0x12, -12, 9
	banim_frame_oam 0x4000, 0x1000, 0x6, -84, -15
	banim_frame_oam 0x4000, 0x1000, 0xE8, -48, -19
	banim_frame_end
banim_genm_al1_5_oam_frame_5_l:
	banim_frame_oam 0x8000, 0xD000, 0x16, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x1A, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x9A, -45, -5
	banim_frame_oam 0x4000, 0x5000, 0x26, -71, -10
	banim_frame_oam 0x4000, 0x9000, 0x32, -23, -15
	banim_frame_oam 0x0, 0x1000, 0x14, -36, -13
	banim_frame_oam 0x4000, 0x1000, 0xD2, -13, 7
	banim_frame_oam 0x4000, 0x1000, 0x6, -87, -13
	banim_frame_oam 0x4000, 0x1000, 0xE8, -51, -17
	banim_frame_end
banim_genm_al1_5_oam_frame_6_l:
	banim_frame_oam 0x8000, 0xD000, 0x1C, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0xA, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x8A, -45, -5
	banim_frame_oam 0x4000, 0x5000, 0x26, -71, -10
	banim_frame_oam 0x4000, 0x9000, 0x32, -23, -15
	banim_frame_oam 0x0, 0x1000, 0x14, -36, -13
	banim_frame_oam 0x4000, 0x1000, 0xD2, -13, 7
	banim_frame_oam 0x4000, 0x1000, 0x6, -87, -13
	banim_frame_oam 0x4000, 0x1000, 0xE8, -51, -17
	banim_frame_end
banim_genm_al1_5_oam_frame_7_l:
	banim_frame_oam 0x8000, 0xD000, 0x6, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0xA, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x8A, -45, -5
	banim_frame_oam 0x4000, 0x9000, 0x32, -23, -15
	banim_frame_oam 0x4000, 0x5000, 0xF2, -71, -10
	banim_frame_oam 0x0, 0x1000, 0x14, -36, -13
	banim_frame_oam 0x4000, 0x1000, 0x12, -15, 9
	banim_frame_oam 0x4000, 0x1000, 0xB4, -51, -17
	banim_frame_oam 0x4000, 0x1000, 0xD2, -87, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x1000, 0xB4, -36, -17
	banim_frame_oam 0x8000, 0xD000, 0xC, -28, -37
	banim_frame_oam 0x8000, 0x9000, 0x10, -44, -37
	banim_frame_oam 0x8000, 0x9000, 0x90, -44, -5
	banim_frame_oam 0x4000, 0x9000, 0x32, -13, -16
	banim_frame_oam 0x4000, 0x5000, 0xF2, -62, -10
	banim_frame_oam 0x4000, 0x1000, 0x12, -5, 9
	banim_frame_oam 0x4000, 0x1000, 0xD2, -78, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x1C, -4, -24
	banim_frame_oam 0x0, 0x5000, 0x9E, 28, -16
	banim_frame_oam 0x0, 0x1000, 0x9D, 44, -12
	banim_frame_oam 0x0, 0x5000, 0xBC, 4, -40
	banim_frame_oam 0x4000, 0x1000, 0xDE, 12, 8
	banim_frame_oam 0x8000, 0xD000, 0x0, -24, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -40, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -40, -5
	banim_frame_oam 0x4000, 0x1000, 0xFC, -41, -12
	banim_frame_oam 0x0, 0x1000, 0xFE, -49, -12
	banim_frame_end
banim_genm_al1_5_oam_frame_10_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0xDC, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0x66, 30, -10
	banim_frame_oam 0x4000, 0x5000, 0x86, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xA6, 5, -7
	banim_frame_oam 0x4000, 0x1000, 0xC6, -11, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_11_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x9000, 0x46, 8, -26
	banim_frame_oam 0x4000, 0x1000, 0x8, -7, -10
	banim_frame_oam 0x0, 0x1000, 0x28, 32, -10
	banim_frame_end
banim_genm_al1_5_oam_frame_12_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0xA6, 26, -5
	banim_frame_oam 0x4000, 0x5000, 0x86, 10, -13
	banim_frame_oam 0x4000, 0x1000, 0xE6, -6, -12
	banim_frame_end
banim_genm_al1_5_oam_frame_13_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x8000, 0x9000, 0xA, 25, -8
	banim_frame_oam 0x0, 0x5000, 0xC, 9, -8
	banim_frame_oam 0x0, 0x1000, 0x4C, 17, 8
	banim_frame_oam 0x4000, 0x1000, 0x6C, -7, -8
	banim_frame_end
banim_genm_al1_5_oam_frame_14_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0xCA, 7, 3
	banim_frame_oam 0x4000, 0x1000, 0xE8, 23, 11
	banim_frame_oam 0x4000, 0x5000, 0xA9, -1, -5
	banim_frame_oam 0x0, 0x1000, 0xA8, 31, -9
	banim_frame_oam 0x0, 0x1000, 0xC9, -9, -5
	banim_frame_end
banim_genm_al1_5_oam_frame_15_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0xCD, 21, 1
	banim_frame_oam 0x0, 0x1000, 0xAD, 29, -7
	banim_frame_oam 0x4000, 0x1000, 0xEF, 5, 9
	banim_frame_oam 0x8000, 0x1000, 0xD1, -3, 1
	banim_frame_oam 0x8000, 0x1000, 0xB2, -11, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_16_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0xE, 24, 1
	banim_frame_oam 0x4000, 0x5000, 0x30, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x11, -8, 1
	banim_frame_oam 0x0, 0x1000, 0x12, -12, -7
	banim_frame_oam 0x0, 0x1000, 0x10, 32, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_17_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0x6E, 21, 2
	banim_frame_oam 0x0, 0x1000, 0x4E, 29, -6
	banim_frame_oam 0x4000, 0x1000, 0x90, 5, 10
	banim_frame_oam 0x8000, 0x1000, 0x72, -3, 2
	banim_frame_oam 0x8000, 0x1000, 0x51, -11, -6
	banim_frame_end
banim_genm_al1_5_oam_frame_18_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x9000, 0x34, 2, 0
	banim_frame_oam 0x4000, 0x1000, 0x14, 26, -8
	banim_frame_oam 0x8000, 0x1000, 0x18, -6, -8
	banim_frame_oam 0x4000, 0x1000, 0x16, -14, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_19_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0x75, -3, -13
	banim_frame_oam 0x4000, 0x1000, 0x93, 13, -3
	banim_frame_oam 0x0, 0x1000, 0x73, 29, -7
	banim_frame_oam 0x0, 0x1000, 0x97, -11, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_20_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x1000, 0xB5, 5, -14
	banim_frame_oam 0x4000, 0x1000, 0xB3, 21, -12
	banim_frame_oam 0x4000, 0x1000, 0xB7, -11, -11
	banim_frame_end
banim_genm_al1_5_oam_frame_21_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x5000, 0xD3, 7, -7
	banim_frame_oam 0x4000, 0x1000, 0xD7, -9, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_22_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x5000, 0xF2, 4, -7
	banim_frame_oam 0x4000, 0x1000, 0xF6, -12, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0x9E, -13, -27
	banim_frame_oam 0x4000, 0x1000, 0xCF, -21, -11
	banim_frame_oam 0x0, 0x5000, 0xDE, -13, -3
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x4000, 0x9000, 0x9A, 3, -16
	banim_frame_oam 0x4000, 0x5000, 0xAE, -53, -12
	banim_frame_oam 0x0, 0x1000, 0x7C, -3, -14
	banim_frame_oam 0x4000, 0x1000, 0xDA, -10, -10
	banim_frame_end
banim_genm_al1_5_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -30, -29
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -29
	banim_frame_oam 0x4000, 0x9000, 0x80, -30, 3
	banim_frame_oam 0x0, 0x5000, 0x84, -46, 3
	banim_frame_oam 0x4000, 0x9000, 0x26, 2, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -6, -12
	banim_frame_oam 0x4000, 0x5000, 0x66, -54, -12
	banim_frame_oam 0x4000, 0x5000, 0x2A, -8, 5
	banim_frame_oam 0x4000, 0x1000, 0x6, -18, -11
	banim_frame_end
banim_genm_al1_5_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x2E, -30, -29
	banim_frame_oam 0x8000, 0x9000, 0x32, -46, -29
	banim_frame_oam 0x4000, 0x9000, 0xAE, -30, 3
	banim_frame_oam 0x0, 0x5000, 0xB2, -46, 3
	banim_frame_oam 0x4000, 0x1000, 0x6, -20, -11
	banim_frame_oam 0x4000, 0x9000, 0x26, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -8, -12
	banim_frame_oam 0x4000, 0x5000, 0x66, -55, -12
	banim_frame_oam 0x4000, 0x5000, 0x2A, -9, 5
	banim_frame_end
banim_genm_al1_5_oam_frame_26_l:
	banim_frame_oam 0x8000, 0xD000, 0x14, -22, -37
	banim_frame_oam 0x8000, 0x9000, 0x18, -38, -37
	banim_frame_oam 0x8000, 0x9000, 0x98, -38, -5
	banim_frame_oam 0x4000, 0x5000, 0x2A, -7, 5
	banim_frame_oam 0x4000, 0x1000, 0x6, -17, -12
	banim_frame_oam 0x4000, 0x9000, 0x26, 3, -17
	banim_frame_oam 0x0, 0x1000, 0x8, -5, -13
	banim_frame_oam 0x4000, 0x5000, 0x66, -52, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_27_l:
	banim_frame_oam 0x8000, 0xD000, 0x1A, -16, -37
	banim_frame_oam 0x8000, 0x9000, 0x1E, -32, -37
	banim_frame_oam 0x8000, 0x9000, 0x9E, -32, -5
	banim_frame_oam 0x4000, 0x9000, 0x8A, 3, -10
	banim_frame_oam 0x0, 0x1000, 0xED, -2, -13
	banim_frame_oam 0x4000, 0x5000, 0x2A, 0, 6
	banim_frame_oam 0x0, 0x5000, 0xCA, -38, -24
	banim_frame_oam 0x0, 0x1000, 0xCC, -46, -24
	banim_frame_end
banim_genm_al1_5_oam_frame_28_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x84, -32, -4
	banim_frame_oam 0x4000, 0x9000, 0x6, 8, -2
	banim_frame_oam 0x0, 0x5000, 0x46, -3, -14
	banim_frame_oam 0x0, 0x5000, 0x48, -37, -28
	banim_frame_end
banim_genm_al1_5_oam_frame_29_l:
	banim_frame_oam 0x8000, 0xD000, 0xA, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0xE, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x8E, -32, -4
	banim_frame_oam 0x4000, 0x9000, 0x6, 8, -2
	banim_frame_oam 0x0, 0x5000, 0x46, -3, -14
	banim_frame_oam 0x0, 0x5000, 0x48, -37, -28
	banim_frame_end
banim_genm_al1_5_oam_frame_60_l:
	banim_frame_oam 0x4000, 0x9000, 0x1C, 11, -9
	banim_frame_oam 0x0, 0x1000, 0x5C, 0, -12
	banim_frame_oam 0x0, 0x1000, 0x5D, -29, -20
	banim_frame_oam 0x0, 0x9000, 0x50, -12, -33
	banim_frame_oam 0x8000, 0x9000, 0x54, -28, -33
	banim_frame_oam 0x4000, 0x9000, 0xD0, -12, -1
	banim_frame_oam 0x0, 0x5000, 0xD4, -28, -1
	banim_frame_end
banim_genm_al1_5_oam_frame_61_l:
	banim_frame_oam 0x4000, 0x9000, 0x7C, 12, -13
	banim_frame_oam 0x0, 0x1000, 0x5E, 1, -13
	banim_frame_oam 0x0, 0x9000, 0x56, -12, -33
	banim_frame_oam 0x8000, 0x9000, 0x5A, -28, -33
	banim_frame_oam 0x4000, 0x9000, 0xD6, -12, -1
	banim_frame_oam 0x0, 0x5000, 0xDA, -28, -1
	banim_frame_oam 0x4000, 0x1000, 0xBC, -28, -18
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_genm_al1_5_oam_frame_62_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0xDC, -16, -16
	banim_frame_oam 0x4000, 0x9000, 0x26, 54, -16
	banim_frame_oam 0x4000, 0x5000, 0x66, 30, -10
	banim_frame_oam 0x4000, 0x5000, 0x86, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xA6, 5, -7
	banim_frame_oam 0x4000, 0x1000, 0xC6, -11, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_63_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x9000, 0x46, 8, -26
	banim_frame_oam 0x4000, 0x1000, 0x8, -7, -10
	banim_frame_oam 0x0, 0x1000, 0x28, 32, -10
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_64_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0xA6, 26, -5
	banim_frame_oam 0x4000, 0x5000, 0x86, 10, -13
	banim_frame_oam 0x4000, 0x1000, 0xE6, -6, -12
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x8000, 0x9000, 0xA, 25, -8
	banim_frame_oam 0x0, 0x5000, 0xC, 9, -8
	banim_frame_oam 0x0, 0x1000, 0x4C, 17, 8
	banim_frame_oam 0x4000, 0x1000, 0x6C, -7, -8
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0xCA, 7, 3
	banim_frame_oam 0x4000, 0x1000, 0xE8, 23, 11
	banim_frame_oam 0x4000, 0x5000, 0xA9, -1, -5
	banim_frame_oam 0x0, 0x1000, 0xA8, 31, -9
	banim_frame_oam 0x0, 0x1000, 0xC9, -9, -5
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0xCD, 21, 1
	banim_frame_oam 0x0, 0x1000, 0xAD, 29, -7
	banim_frame_oam 0x4000, 0x1000, 0xEF, 5, 9
	banim_frame_oam 0x8000, 0x1000, 0xD1, -3, 1
	banim_frame_oam 0x8000, 0x1000, 0xB2, -11, -7
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0xE, 24, 1
	banim_frame_oam 0x4000, 0x5000, 0x30, -8, 9
	banim_frame_oam 0x0, 0x1000, 0x11, -8, 1
	banim_frame_oam 0x0, 0x1000, 0x12, -12, -7
	banim_frame_oam 0x0, 0x1000, 0x10, 32, -7
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0x6E, 21, 2
	banim_frame_oam 0x0, 0x1000, 0x4E, 29, -6
	banim_frame_oam 0x4000, 0x1000, 0x90, 5, 10
	banim_frame_oam 0x8000, 0x1000, 0x72, -3, 2
	banim_frame_oam 0x8000, 0x1000, 0x51, -11, -6
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x9000, 0x34, 2, 0
	banim_frame_oam 0x4000, 0x1000, 0x14, 26, -8
	banim_frame_oam 0x8000, 0x1000, 0x18, -6, -8
	banim_frame_oam 0x4000, 0x1000, 0x16, -14, -16
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x0, 0x5000, 0x75, -3, -13
	banim_frame_oam 0x4000, 0x1000, 0x93, 13, -3
	banim_frame_oam 0x0, 0x1000, 0x73, 29, -7
	banim_frame_oam 0x0, 0x1000, 0x97, -11, -7
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_66_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x1000, 0xB5, 5, -14
	banim_frame_oam 0x4000, 0x1000, 0xB3, 21, -12
	banim_frame_oam 0x4000, 0x1000, 0xB7, -11, -11
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_65_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x5000, 0xD3, 7, -7
	banim_frame_oam 0x4000, 0x1000, 0xD7, -9, -7
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_67_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -2, -14
	banim_frame_oam 0x4000, 0x5000, 0xDA, 30, -10
	banim_frame_oam 0x4000, 0x5000, 0xF2, 4, -7
	banim_frame_oam 0x4000, 0x1000, 0xF6, -12, -7
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x9000, 0x9A, 54, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x9000, 0x26, 54, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_30_l:
	banim_frame_end
banim_genm_al1_5_oam_frame_33_l:
	banim_frame_oam 0x0, 0x5000, 0x32, 22, -19
	banim_frame_oam 0x4000, 0x1000, 0x72, 22, -3
	banim_frame_oam 0x0, 0x5000, 0x9E, 14, -35
	banim_frame_oam 0x0, 0x5000, 0x9C, -2, -43
	banim_frame_oam 0x4000, 0x1000, 0xF1, -18, -43
	banim_frame_oam 0x4000, 0x1000, 0xE9, 22, 5
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_oam 0x4000, 0x9000, 0xDC, -52, -27
	banim_frame_end
banim_genm_al1_5_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x93, -35, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -35, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -19, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -43, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -43, -3
	banim_frame_oam 0x4000, 0x1000, 0x3E, -44, -14
	banim_frame_oam 0x0, 0xA000, 0x4F, -90, -7
	banim_frame_oam 0x4000, 0xA000, 0xF, -74, 25
	banim_frame_oam 0x4000, 0x2000, 0xD1, -58, -7
	banim_frame_oam 0x4000, 0x2000, 0x33, -58, 17
	banim_frame_oam 0x8000, 0x2000, 0xCF, -90, -23
	banim_frame_oam 0x0, 0x2000, 0xF0, -90, -31
	banim_frame_oam 0x0, 0x2000, 0xD0, -74, -15
	banim_frame_oam 0x0, 0x6000, 0x53, -18, -25
	banim_frame_oam 0x0, 0x2000, 0xF1, -26, -17
	banim_frame_oam 0x0, 0x2000, 0xF2, -12, -33
	banim_frame_oam 0x8000, 0x1000, 0xCB, -3, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0x93, -35, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -35, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -19, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -43, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -43, -3
	banim_frame_oam 0x4000, 0x1000, 0x3E, -44, -14
	banim_frame_oam 0x0, 0xA000, 0x97, -89, -42
	banim_frame_oam 0x0, 0x6000, 0x5A, -75, -58
	banim_frame_oam 0x4000, 0x2000, 0x7C, -59, -58
	banim_frame_oam 0x8000, 0x6000, 0x17, -89, -10
	banim_frame_oam 0x8000, 0x2000, 0x58, -81, 14
	banim_frame_oam 0x8000, 0x2000, 0x18, -73, 22
	banim_frame_oam 0x0, 0x2000, 0x19, -65, 30
	banim_frame_oam 0x8000, 0x2000, 0x39, -76, -2
	banim_frame_oam 0x0, 0x2000, 0x79, -76, -10
	banim_frame_oam 0x0, 0x6000, 0x9B, -57, -26
	banim_frame_oam 0x8000, 0x2000, 0xDB, -57, -42
	banim_frame_oam 0x0, 0x2000, 0x3D, -9, 6
	banim_frame_oam 0x8000, 0x1000, 0xCB, -3, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x93, -35, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -35, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -19, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -43, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -43, -3
	banim_frame_oam 0x4000, 0x1000, 0x3E, -44, -14
	banim_frame_oam 0x0, 0x9000, 0x48, -56, -57
	banim_frame_oam 0x0, 0x5000, 0x46, -24, -57
	banim_frame_oam 0x8000, 0x1000, 0xC8, -8, -49
	banim_frame_oam 0x8000, 0x9000, 0x4C, -72, -57
	banim_frame_oam 0x0, 0x5000, 0x6, -88, -47
	banim_frame_oam 0x0, 0x5000, 0x8, -96, -31
	banim_frame_oam 0x8000, 0x1000, 0xC, -96, -15
	banim_frame_oam 0x0, 0x1000, 0x87, -24, -41
	banim_frame_oam 0x0, 0x1000, 0xA7, -72, -25
	banim_frame_oam 0x8000, 0x1000, 0xD, -48, -1
	banim_frame_oam 0x0, 0x5000, 0xC6, -56, 15
	banim_frame_oam 0x8000, 0x1000, 0xC9, -40, -25
	banim_frame_oam 0x8000, 0x1000, 0xCB, -3, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_43_l:
	banim_frame_oam 0x0, 0x9000, 0x4F, -26, -43
	banim_frame_oam 0x4000, 0x9000, 0xF, -42, -59
	banim_frame_oam 0x4000, 0x5000, 0x13, -74, -59
	banim_frame_oam 0x4000, 0x1000, 0xD1, -42, -19
	banim_frame_oam 0x4000, 0x1000, 0x33, -42, -43
	banim_frame_oam 0x0, 0x1000, 0x35, -50, -43
	banim_frame_oam 0x8000, 0x1000, 0xCF, -2, -11
	banim_frame_oam 0x0, 0x1000, 0xF0, -2, 5
	banim_frame_oam 0x0, 0x1000, 0xD0, -18, -11
	banim_frame_oam 0x0, 0x5000, 0x53, -82, -9
	banim_frame_oam 0x0, 0x1000, 0xF1, -66, -9
	banim_frame_oam 0x0, 0x1000, 0xF2, -80, 7
	banim_frame_oam 0x0, 0x9000, 0x4F, -26, -43
	banim_frame_oam 0x8000, 0x1000, 0xCF, -2, -11
	banim_frame_oam 0x0, 0x1000, 0xF0, -2, 5
	banim_frame_oam 0x0, 0x9000, 0x93, -35, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -35, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -19, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -43, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -43, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -14
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -14
	banim_frame_oam 0x8000, 0x1000, 0xCB, -3, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x97, -28, -8
	banim_frame_oam 0x0, 0x5000, 0x5A, -26, 24
	banim_frame_oam 0x4000, 0x1000, 0x7C, -42, 32
	banim_frame_oam 0x8000, 0x5000, 0x17, -4, -40
	banim_frame_oam 0x8000, 0x1000, 0x58, -12, -48
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -56
	banim_frame_oam 0x0, 0x1000, 0x19, -28, -56
	banim_frame_oam 0x8000, 0x1000, 0x39, -17, -32
	banim_frame_oam 0x0, 0x1000, 0x79, -17, -16
	banim_frame_oam 0x0, 0x5000, 0x9B, -44, -8
	banim_frame_oam 0x8000, 0x1000, 0xDB, -36, 8
	banim_frame_oam 0x0, 0x5000, 0x1B, -76, -40
	banim_frame_oam 0x8000, 0x1000, 0x1A, -60, -32
	banim_frame_oam 0x0, 0x1000, 0x3D, -84, -32
	banim_frame_oam 0x0, 0x9000, 0x97, -28, -8
	banim_frame_oam 0x8000, 0x5000, 0x17, -4, -40
	banim_frame_oam 0x0, 0x9000, 0x93, -35, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -35, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -19, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -43, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -43, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -14
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -14
	banim_frame_oam 0x8000, 0x1000, 0xCB, -3, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_45_l:
	banim_frame_oam 0x0, 0xA000, 0x48, -60, 7
	banim_frame_oam 0x0, 0x6000, 0x46, -76, 23
	banim_frame_oam 0x8000, 0x2000, 0xC8, -84, 15
	banim_frame_oam 0x8000, 0xA000, 0x4C, -28, 7
	banim_frame_oam 0x0, 0x6000, 0x6, -12, 13
	banim_frame_oam 0x0, 0x6000, 0x8, -4, -3
	banim_frame_oam 0x8000, 0x2000, 0xC, 4, -19
	banim_frame_oam 0x0, 0x2000, 0x87, -68, 15
	banim_frame_oam 0x0, 0x2000, 0xA7, -20, -1
	banim_frame_oam 0x8000, 0x2000, 0xD, -44, -33
	banim_frame_oam 0x0, 0x6000, 0xC6, -44, -49
	banim_frame_oam 0x8000, 0x2000, 0xC9, -52, -9
	banim_frame_oam 0x0, 0x2000, 0xCA, -52, -49
	banim_frame_oam 0x0, 0x6000, 0x6, -12, 12
	banim_frame_oam 0x0, 0x6000, 0x8, -4, -4
	banim_frame_oam 0x8000, 0x2000, 0xC, 4, -20
	banim_frame_oam 0x0, 0x9000, 0x93, -35, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -35, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -19, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -43, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -43, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -14
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -14
	banim_frame_oam 0x8000, 0x1000, 0xCB, -3, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_46_l:
	banim_frame_oam 0x0, 0xA000, 0x4F, -93, -10
	banim_frame_oam 0x4000, 0xA000, 0xF, -77, 22
	banim_frame_oam 0x4000, 0x6000, 0x13, -45, 30
	banim_frame_oam 0x4000, 0x2000, 0xD1, -61, -10
	banim_frame_oam 0x4000, 0x2000, 0x33, -61, 14
	banim_frame_oam 0x0, 0x2000, 0x35, -45, 14
	banim_frame_oam 0x8000, 0x2000, 0xCF, -93, -26
	banim_frame_oam 0x0, 0x2000, 0xF0, -93, -34
	banim_frame_oam 0x0, 0x2000, 0xD0, -77, -18
	banim_frame_oam 0x0, 0x6000, 0x53, -21, -28
	banim_frame_oam 0x0, 0x2000, 0xF1, -29, -20
	banim_frame_oam 0x0, 0x2000, 0xF2, -15, -36
	banim_frame_oam 0x0, 0x9000, 0x93, -35, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -35, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -19, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -43, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -43, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -14
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -14
	banim_frame_oam 0x8000, 0x1000, 0xCB, -3, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_47_l:
	banim_frame_oam 0x0, 0xA000, 0x97, -92, -44
	banim_frame_oam 0x0, 0x6000, 0x5A, -78, -60
	banim_frame_oam 0x4000, 0x2000, 0x7C, -62, -60
	banim_frame_oam 0x8000, 0x6000, 0x17, -92, -12
	banim_frame_oam 0x8000, 0x2000, 0x58, -84, 12
	banim_frame_oam 0x8000, 0x2000, 0x18, -76, 20
	banim_frame_oam 0x0, 0x2000, 0x19, -68, 28
	banim_frame_oam 0x8000, 0x2000, 0x39, -79, -4
	banim_frame_oam 0x0, 0x2000, 0x79, -79, -12
	banim_frame_oam 0x0, 0x6000, 0x9B, -60, -28
	banim_frame_oam 0x8000, 0x2000, 0xDB, -60, -44
	banim_frame_oam 0x0, 0x6000, 0x1B, -28, 4
	banim_frame_oam 0x8000, 0x2000, 0x1A, -36, -4
	banim_frame_oam 0x0, 0x2000, 0x3D, -12, 4
	banim_frame_oam 0x0, 0x9000, 0x93, -35, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -35, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -19, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -43, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -43, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -14
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -14
	banim_frame_oam 0x8000, 0x1000, 0xCB, -3, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_48_l:
	banim_frame_oam 0x0, 0x9000, 0x48, -60, -58
	banim_frame_oam 0x0, 0x5000, 0x46, -28, -58
	banim_frame_oam 0x8000, 0x1000, 0xC8, -12, -50
	banim_frame_oam 0x8000, 0x9000, 0x4C, -76, -58
	banim_frame_oam 0x0, 0x5000, 0x6, -92, -48
	banim_frame_oam 0x0, 0x5000, 0x8, -100, -32
	banim_frame_oam 0x8000, 0x1000, 0xC, -100, -16
	banim_frame_oam 0x0, 0x1000, 0x87, -28, -42
	banim_frame_oam 0x0, 0x1000, 0xA7, -76, -26
	banim_frame_oam 0x8000, 0x1000, 0xD, -52, -2
	banim_frame_oam 0x0, 0x5000, 0xC6, -60, 14
	banim_frame_oam 0x8000, 0x1000, 0xC9, -44, -26
	banim_frame_oam 0x0, 0x1000, 0xCA, -44, 22
	banim_frame_oam 0x0, 0x9000, 0x93, -35, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -35, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -19, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -43, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -43, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -14
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -14
	banim_frame_oam 0x8000, 0x1000, 0xCB, -3, -13
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_genm_al1_5_oam_frame_49_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -24, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -40, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -40, -5
	banim_frame_oam 0x4000, 0x0, 0xFC, -5, -12
	banim_frame_oam 0x0, 0x0, 0xFE, 11, -12
	banim_frame_oam 0x4000, 0x1000, 0xFC, -43, -13
	banim_frame_oam 0x0, 0x1000, 0xFE, -51, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_50_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0xDE, -17, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_51_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -29, -29
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -29
	banim_frame_oam 0x4000, 0x9000, 0x80, -29, 3
	banim_frame_oam 0x0, 0x5000, 0x84, -45, 3
	banim_frame_oam 0x0, 0x5000, 0x4C, -23, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_52_l:
	banim_frame_oam 0x8000, 0xD000, 0xE, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x12, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x92, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x4C, -20, -17
	banim_frame_end
banim_genm_al1_5_oam_frame_53_l:
	banim_frame_oam 0x8000, 0xD000, 0x14, -21, -37
	banim_frame_oam 0x8000, 0x9000, 0x18, -37, -37
	banim_frame_oam 0x8000, 0x9000, 0x98, -37, -5
	banim_frame_oam 0x0, 0x5000, 0x4C, -16, -17
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_genm_al1_5_oam_frame_54_l:
	banim_frame_oam 0x0, 0x7000, 0xC, 35, -29
	banim_frame_oam 0x0, 0x7000, 0xE, 35, -13
	banim_frame_oam 0x0, 0x3000, 0x10, 27, -3
	banim_frame_oam 0x4000, 0x3000, 0x12, 19, -27
	banim_frame_oam 0x0, 0x7000, 0x14, -14, -40
	banim_frame_oam 0x0, 0x3000, 0x16, 2, -32
	banim_frame_oam 0x8000, 0xD000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -33, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -33, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 15, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_55_l:
	banim_frame_oam 0x0, 0x7000, 0x18, 25, -57
	banim_frame_oam 0x8000, 0x7000, 0x1C, 41, -49
	banim_frame_oam 0x4000, 0x3000, 0x1A, 25, -41
	banim_frame_oam 0x0, 0x3000, 0x3B, 17, -37
	banim_frame_oam 0x4000, 0x3000, 0x5E, -8, -15
	banim_frame_oam 0x4000, 0x3000, 0x7E, 0, -23
	banim_frame_oam 0x8000, 0xD000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -33, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -33, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 15, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_56_l:
	banim_frame_oam 0x4000, 0x8000, 0x6, -2, -62
	banim_frame_oam 0x0, 0x0, 0x87, 30, -58
	banim_frame_oam 0x8000, 0x0, 0x8C, 6, -46
	banim_frame_oam 0x0, 0x4000, 0x46, 12, -16
	banim_frame_oam 0x0, 0x0, 0xA7, 12, -24
	banim_frame_oam 0x8000, 0xD000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -33, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -33, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 15, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_57_l:
	banim_frame_oam 0x0, 0x4000, 0xC, -21, -40
	banim_frame_oam 0x0, 0x4000, 0xE, -21, -56
	banim_frame_oam 0x0, 0x0, 0x10, -5, -58
	banim_frame_oam 0x4000, 0x0, 0x12, -5, -34
	banim_frame_oam 0x0, 0x4000, 0x14, 28, -29
	banim_frame_oam 0x0, 0x0, 0x16, 20, -29
	banim_frame_oam 0x8000, 0xD000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -33, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -33, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 15, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_58_l:
	banim_frame_oam 0x0, 0x4000, 0x18, -11, -12
	banim_frame_oam 0x8000, 0x4000, 0x1C, -19, -36
	banim_frame_oam 0x4000, 0x0, 0x1A, -11, -20
	banim_frame_oam 0x0, 0x0, 0x3B, 5, -24
	banim_frame_oam 0x4000, 0x0, 0x5E, 22, -46
	banim_frame_oam 0x4000, 0x0, 0x7E, 14, -38
	banim_frame_oam 0x8000, 0xD000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -33, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -33, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 15, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_59_l:
	banim_frame_oam 0x4000, 0xB000, 0x6, 0, -6
	banim_frame_oam 0x0, 0x3000, 0x87, -8, -2
	banim_frame_oam 0x8000, 0x3000, 0x8C, 16, -22
	banim_frame_oam 0x0, 0x7000, 0x46, 2, -52
	banim_frame_oam 0x0, 0x3000, 0xA7, 10, -36
	banim_frame_oam 0x8000, 0xD000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -33, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -33, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 15, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_36_l:
	banim_frame_oam 0x0, 0x9000, 0x48, 2, -78
	banim_frame_oam 0x0, 0x5000, 0x46, 34, -78
	banim_frame_oam 0x8000, 0x1000, 0xC8, 50, -70
	banim_frame_oam 0x8000, 0x9000, 0x4C, -14, -78
	banim_frame_oam 0x0, 0x5000, 0x6, -30, -68
	banim_frame_oam 0x0, 0x5000, 0x8, -38, -52
	banim_frame_oam 0x8000, 0x1000, 0xC, -38, -36
	banim_frame_oam 0x0, 0x1000, 0x87, 34, -62
	banim_frame_oam 0x0, 0x1000, 0xA7, -14, -46
	banim_frame_oam 0x8000, 0x1000, 0xD, 10, -22
	banim_frame_oam 0x0, 0x5000, 0xC6, 2, -6
	banim_frame_oam 0x8000, 0x1000, 0xC9, 18, -46
	banim_frame_oam 0x0, 0x1000, 0xCA, 18, 2
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x4F, 38, -61
	banim_frame_oam 0x4000, 0x9000, 0xF, 22, -77
	banim_frame_oam 0x4000, 0x5000, 0x13, -10, -77
	banim_frame_oam 0x4000, 0x1000, 0xD1, 22, -37
	banim_frame_oam 0x4000, 0x1000, 0x33, 22, -61
	banim_frame_oam 0x0, 0x1000, 0x35, 14, -61
	banim_frame_oam 0x8000, 0x1000, 0xCF, 62, -29
	banim_frame_oam 0x0, 0x1000, 0xF0, 62, -13
	banim_frame_oam 0x0, 0x1000, 0xD0, 46, -29
	banim_frame_oam 0x0, 0x5000, 0x53, -18, -27
	banim_frame_oam 0x0, 0x1000, 0xF1, -2, -27
	banim_frame_oam 0x0, 0x1000, 0xF2, -16, -11
	banim_frame_oam 0x0, 0x9000, 0x4F, 38, -61
	banim_frame_oam 0x8000, 0x1000, 0xCF, 62, -29
	banim_frame_oam 0x0, 0x1000, 0xF0, 62, -13
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x97, 36, -22
	banim_frame_oam 0x0, 0x5000, 0x5A, 38, 10
	banim_frame_oam 0x4000, 0x1000, 0x7C, 22, 18
	banim_frame_oam 0x8000, 0x5000, 0x17, 60, -54
	banim_frame_oam 0x8000, 0x1000, 0x58, 52, -62
	banim_frame_oam 0x8000, 0x1000, 0x18, 44, -70
	banim_frame_oam 0x0, 0x1000, 0x19, 36, -70
	banim_frame_oam 0x8000, 0x1000, 0x39, 47, -46
	banim_frame_oam 0x0, 0x1000, 0x79, 47, -30
	banim_frame_oam 0x0, 0x5000, 0x9B, 20, -22
	banim_frame_oam 0x8000, 0x1000, 0xDB, 28, -6
	banim_frame_oam 0x0, 0x5000, 0x1B, -12, -54
	banim_frame_oam 0x8000, 0x1000, 0x1A, 4, -46
	banim_frame_oam 0x0, 0x1000, 0x3D, -20, -46
	banim_frame_oam 0x0, 0x9000, 0x97, 36, -22
	banim_frame_oam 0x8000, 0x5000, 0x17, 60, -54
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_39_l:
	banim_frame_oam 0x0, 0xA000, 0x48, 2, -6
	banim_frame_oam 0x0, 0x6000, 0x46, -14, 10
	banim_frame_oam 0x8000, 0x2000, 0xC8, -22, 2
	banim_frame_oam 0x8000, 0xA000, 0x4C, 34, -6
	banim_frame_oam 0x0, 0x2000, 0x87, -6, 2
	banim_frame_oam 0x0, 0x2000, 0xA7, 42, -14
	banim_frame_oam 0x8000, 0x2000, 0xD, 18, -46
	banim_frame_oam 0x0, 0x6000, 0xC6, 18, -62
	banim_frame_oam 0x8000, 0x2000, 0xC9, 10, -22
	banim_frame_oam 0x0, 0x2000, 0xCA, 10, -62
	banim_frame_oam 0x0, 0x6000, 0x6, 50, 0
	banim_frame_oam 0x0, 0x6000, 0x8, 58, -16
	banim_frame_oam 0x8000, 0x2000, 0xC, 66, -32
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_34_l:
	banim_frame_oam 0x0, 0xA000, 0x4F, -36, -24
	banim_frame_oam 0x4000, 0xA000, 0xF, -20, 8
	banim_frame_oam 0x4000, 0x6000, 0x13, 12, 16
	banim_frame_oam 0x4000, 0x2000, 0xD1, -4, -24
	banim_frame_oam 0x4000, 0x2000, 0x33, -4, 0
	banim_frame_oam 0x0, 0x2000, 0x35, 12, 0
	banim_frame_oam 0x8000, 0x2000, 0xCF, -36, -40
	banim_frame_oam 0x0, 0x2000, 0xF0, -36, -48
	banim_frame_oam 0x0, 0x2000, 0xD0, -20, -32
	banim_frame_oam 0x0, 0x6000, 0x53, 36, -42
	banim_frame_oam 0x0, 0x2000, 0xF1, 28, -34
	banim_frame_oam 0x0, 0x2000, 0xF2, 42, -50
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_35_l:
	banim_frame_oam 0x0, 0xA000, 0x97, -34, -63
	banim_frame_oam 0x0, 0x6000, 0x5A, -20, -79
	banim_frame_oam 0x4000, 0x2000, 0x7C, -4, -79
	banim_frame_oam 0x8000, 0x6000, 0x17, -34, -31
	banim_frame_oam 0x8000, 0x2000, 0x58, -26, -7
	banim_frame_oam 0x8000, 0x2000, 0x18, -18, 1
	banim_frame_oam 0x0, 0x2000, 0x19, -10, 9
	banim_frame_oam 0x8000, 0x2000, 0x39, -21, -23
	banim_frame_oam 0x0, 0x2000, 0x79, -21, -31
	banim_frame_oam 0x0, 0x6000, 0x9B, -2, -47
	banim_frame_oam 0x8000, 0x2000, 0xDB, -2, -63
	banim_frame_oam 0x0, 0x6000, 0x1B, 30, -15
	banim_frame_oam 0x8000, 0x2000, 0x1A, 22, -23
	banim_frame_oam 0x0, 0x2000, 0x3D, 46, -15
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_genm_al1_5_oam_r:
banim_genm_al1_5_oam_frame_0_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x84, 16, -4
	banim_frame_oam 0x4000, 0x8000, 0x46, -39, -2
	banim_frame_oam 0x8000, 0x0, 0xA, -9, -12
	banim_frame_oam 0x0, 0x4000, 0x6, 21, -29
	banim_frame_end
banim_genm_al1_5_oam_frame_1_r:
	banim_frame_oam 0x8000, 0xC000, 0xC, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x10, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x90, 16, -4
	banim_frame_oam 0x0, 0x0, 0x93, 16, -13
	banim_frame_oam 0x8000, 0x0, 0x92, -8, -12
	banim_frame_oam 0x4000, 0x8000, 0x52, -38, -6
	banim_frame_oam 0x0, 0x0, 0xB3, -16, 10
	banim_frame_oam 0x4000, 0x0, 0xD2, -32, 10
	banim_frame_oam 0x4000, 0x0, 0x12, 23, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_2_r:
	banim_frame_oam 0x8000, 0xC000, 0x16, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x1A, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x9A, 16, -4
	banim_frame_oam 0x4000, 0x4000, 0x1C, 24, -13
	banim_frame_oam 0x4000, 0x0, 0x3C, 15, -10
	banim_frame_oam 0x4000, 0x0, 0xB4, 16, 7
	banim_frame_oam 0x4000, 0x0, 0x94, -29, 7
	banim_frame_oam 0x4000, 0x8000, 0x5C, -30, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_3_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -9, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 23, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 23, -5
	banim_frame_oam 0x4000, 0x4000, 0x26, 29, -10
	banim_frame_oam 0x4000, 0x0, 0xC8, -11, 4
	banim_frame_oam 0x4000, 0x8000, 0x32, -15, -16
	banim_frame_oam 0x4000, 0x0, 0xE8, 20, -17
	banim_frame_oam 0x4000, 0x0, 0x6, 61, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_4_r:
	banim_frame_oam 0x8000, 0xC000, 0xC, -4, -37
	banim_frame_oam 0x8000, 0x8000, 0x10, 28, -37
	banim_frame_oam 0x8000, 0x8000, 0x90, 28, -5
	banim_frame_oam 0x4000, 0x4000, 0x26, 36, -12
	banim_frame_oam 0x4000, 0x8000, 0x32, -12, -17
	banim_frame_oam 0x0, 0x0, 0x14, 25, -15
	banim_frame_oam 0x4000, 0x0, 0x12, -4, 9
	banim_frame_oam 0x4000, 0x0, 0x6, 68, -15
	banim_frame_oam 0x4000, 0x0, 0xE8, 32, -19
	banim_frame_end
banim_genm_al1_5_oam_frame_5_r:
	banim_frame_oam 0x8000, 0xC000, 0x16, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x1A, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x9A, 29, -5
	banim_frame_oam 0x4000, 0x4000, 0x26, 39, -10
	banim_frame_oam 0x4000, 0x8000, 0x32, -9, -15
	banim_frame_oam 0x0, 0x0, 0x14, 28, -13
	banim_frame_oam 0x4000, 0x0, 0xD2, -3, 7
	banim_frame_oam 0x4000, 0x0, 0x6, 71, -13
	banim_frame_oam 0x4000, 0x0, 0xE8, 35, -17
	banim_frame_end
banim_genm_al1_5_oam_frame_6_r:
	banim_frame_oam 0x8000, 0xC000, 0x1C, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0xA, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x8A, 29, -5
	banim_frame_oam 0x4000, 0x4000, 0x26, 39, -10
	banim_frame_oam 0x4000, 0x8000, 0x32, -9, -15
	banim_frame_oam 0x0, 0x0, 0x14, 28, -13
	banim_frame_oam 0x4000, 0x0, 0xD2, -3, 7
	banim_frame_oam 0x4000, 0x0, 0x6, 71, -13
	banim_frame_oam 0x4000, 0x0, 0xE8, 35, -17
	banim_frame_end
banim_genm_al1_5_oam_frame_7_r:
	banim_frame_oam 0x8000, 0xC000, 0x6, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0xA, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x8A, 29, -5
	banim_frame_oam 0x4000, 0x8000, 0x32, -9, -15
	banim_frame_oam 0x4000, 0x4000, 0xF2, 39, -10
	banim_frame_oam 0x0, 0x0, 0x14, 28, -13
	banim_frame_oam 0x4000, 0x0, 0x12, -1, 9
	banim_frame_oam 0x4000, 0x0, 0xB4, 35, -17
	banim_frame_oam 0x4000, 0x0, 0xD2, 71, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x0, 0xB4, 20, -17
	banim_frame_oam 0x8000, 0xC000, 0xC, -4, -37
	banim_frame_oam 0x8000, 0x8000, 0x10, 28, -37
	banim_frame_oam 0x8000, 0x8000, 0x90, 28, -5
	banim_frame_oam 0x4000, 0x8000, 0x32, -19, -16
	banim_frame_oam 0x4000, 0x4000, 0xF2, 30, -10
	banim_frame_oam 0x4000, 0x0, 0x12, -11, 9
	banim_frame_oam 0x4000, 0x0, 0xD2, 62, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x1C, -28, -24
	banim_frame_oam 0x0, 0x4000, 0x9E, -44, -16
	banim_frame_oam 0x0, 0x0, 0x9D, -52, -12
	banim_frame_oam 0x0, 0x4000, 0xBC, -20, -40
	banim_frame_oam 0x4000, 0x0, 0xDE, -28, 8
	banim_frame_oam 0x8000, 0xC000, 0x0, -8, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 24, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 24, -5
	banim_frame_oam 0x4000, 0x0, 0xFC, 25, -12
	banim_frame_oam 0x0, 0x0, 0xFE, 41, -12
	banim_frame_end
banim_genm_al1_5_oam_frame_10_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0xDC, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0x66, -62, -10
	banim_frame_oam 0x4000, 0x4000, 0x86, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xA6, -37, -7
	banim_frame_oam 0x4000, 0x0, 0xC6, -5, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_11_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x8000, 0x46, -40, -26
	banim_frame_oam 0x4000, 0x0, 0x8, -9, -10
	banim_frame_oam 0x0, 0x0, 0x28, -40, -10
	banim_frame_end
banim_genm_al1_5_oam_frame_12_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0xA6, -42, -5
	banim_frame_oam 0x4000, 0x4000, 0x86, -42, -13
	banim_frame_oam 0x4000, 0x0, 0xE6, -10, -12
	banim_frame_end
banim_genm_al1_5_oam_frame_13_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x8000, 0x8000, 0xA, -41, -8
	banim_frame_oam 0x0, 0x4000, 0xC, -25, -8
	banim_frame_oam 0x0, 0x0, 0x4C, -25, 8
	banim_frame_oam 0x4000, 0x0, 0x6C, -9, -8
	banim_frame_end
banim_genm_al1_5_oam_frame_14_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0xCA, -23, 3
	banim_frame_oam 0x4000, 0x0, 0xE8, -39, 11
	banim_frame_oam 0x4000, 0x4000, 0xA9, -31, -5
	banim_frame_oam 0x0, 0x0, 0xA8, -39, -9
	banim_frame_oam 0x0, 0x0, 0xC9, 1, -5
	banim_frame_end
banim_genm_al1_5_oam_frame_15_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0xCD, -37, 1
	banim_frame_oam 0x0, 0x0, 0xAD, -37, -7
	banim_frame_oam 0x4000, 0x0, 0xEF, -21, 9
	banim_frame_oam 0x8000, 0x0, 0xD1, -5, 1
	banim_frame_oam 0x8000, 0x0, 0xB2, 3, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_16_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0xE, -40, 1
	banim_frame_oam 0x4000, 0x4000, 0x30, -24, 9
	banim_frame_oam 0x0, 0x0, 0x11, 0, 1
	banim_frame_oam 0x0, 0x0, 0x12, 4, -7
	banim_frame_oam 0x0, 0x0, 0x10, -40, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_17_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0x6E, -37, 2
	banim_frame_oam 0x0, 0x0, 0x4E, -37, -6
	banim_frame_oam 0x4000, 0x0, 0x90, -21, 10
	banim_frame_oam 0x8000, 0x0, 0x72, -5, 2
	banim_frame_oam 0x8000, 0x0, 0x51, 3, -6
	banim_frame_end
banim_genm_al1_5_oam_frame_18_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x8000, 0x34, -34, 0
	banim_frame_oam 0x4000, 0x0, 0x14, -42, -8
	banim_frame_oam 0x8000, 0x0, 0x18, -2, -8
	banim_frame_oam 0x4000, 0x0, 0x16, -2, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_19_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0x75, -13, -13
	banim_frame_oam 0x4000, 0x0, 0x93, -29, -3
	banim_frame_oam 0x0, 0x0, 0x73, -37, -7
	banim_frame_oam 0x0, 0x0, 0x97, 3, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_20_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x0, 0xB5, -21, -14
	banim_frame_oam 0x4000, 0x0, 0xB3, -37, -12
	banim_frame_oam 0x4000, 0x0, 0xB7, -5, -11
	banim_frame_end
banim_genm_al1_5_oam_frame_21_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x4000, 0xD3, -39, -7
	banim_frame_oam 0x4000, 0x0, 0xD7, -7, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_22_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x4000, 0xF2, -36, -7
	banim_frame_oam 0x4000, 0x0, 0xF6, -4, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0x9E, -3, -27
	banim_frame_oam 0x4000, 0x0, 0xCF, 5, -11
	banim_frame_oam 0x0, 0x4000, 0xDE, -3, -3
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x4000, 0x8000, 0x9A, -35, -16
	banim_frame_oam 0x4000, 0x4000, 0xAE, 21, -12
	banim_frame_oam 0x0, 0x0, 0x7C, -5, -14
	banim_frame_oam 0x4000, 0x0, 0xDA, -6, -10
	banim_frame_end
banim_genm_al1_5_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -2, -29
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -29
	banim_frame_oam 0x4000, 0x8000, 0x80, -2, 3
	banim_frame_oam 0x0, 0x4000, 0x84, 30, 3
	banim_frame_oam 0x4000, 0x8000, 0x26, -34, -16
	banim_frame_oam 0x0, 0x0, 0x8, -2, -12
	banim_frame_oam 0x4000, 0x4000, 0x66, 22, -12
	banim_frame_oam 0x4000, 0x4000, 0x2A, -24, 5
	banim_frame_oam 0x4000, 0x0, 0x6, 2, -11
	banim_frame_end
banim_genm_al1_5_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x2E, -2, -29
	banim_frame_oam 0x8000, 0x8000, 0x32, 30, -29
	banim_frame_oam 0x4000, 0x8000, 0xAE, -2, 3
	banim_frame_oam 0x0, 0x4000, 0xB2, 30, 3
	banim_frame_oam 0x4000, 0x0, 0x6, 4, -11
	banim_frame_oam 0x4000, 0x8000, 0x26, -32, -16
	banim_frame_oam 0x0, 0x0, 0x8, 0, -12
	banim_frame_oam 0x4000, 0x4000, 0x66, 23, -12
	banim_frame_oam 0x4000, 0x4000, 0x2A, -23, 5
	banim_frame_end
banim_genm_al1_5_oam_frame_26_r:
	banim_frame_oam 0x8000, 0xC000, 0x14, -10, -37
	banim_frame_oam 0x8000, 0x8000, 0x18, 22, -37
	banim_frame_oam 0x8000, 0x8000, 0x98, 22, -5
	banim_frame_oam 0x4000, 0x4000, 0x2A, -25, 5
	banim_frame_oam 0x4000, 0x0, 0x6, 1, -12
	banim_frame_oam 0x4000, 0x8000, 0x26, -35, -17
	banim_frame_oam 0x0, 0x0, 0x8, -3, -13
	banim_frame_oam 0x4000, 0x4000, 0x66, 20, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_27_r:
	banim_frame_oam 0x8000, 0xC000, 0x1A, -16, -37
	banim_frame_oam 0x8000, 0x8000, 0x1E, 16, -37
	banim_frame_oam 0x8000, 0x8000, 0x9E, 16, -5
	banim_frame_oam 0x4000, 0x8000, 0x8A, -35, -10
	banim_frame_oam 0x0, 0x0, 0xED, -6, -13
	banim_frame_oam 0x4000, 0x4000, 0x2A, -32, 6
	banim_frame_oam 0x0, 0x4000, 0xCA, 22, -24
	banim_frame_oam 0x0, 0x0, 0xCC, 38, -24
	banim_frame_end
banim_genm_al1_5_oam_frame_28_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x84, 16, -4
	banim_frame_oam 0x4000, 0x8000, 0x6, -40, -2
	banim_frame_oam 0x0, 0x4000, 0x46, -13, -14
	banim_frame_oam 0x0, 0x4000, 0x48, 21, -28
	banim_frame_end
banim_genm_al1_5_oam_frame_29_r:
	banim_frame_oam 0x8000, 0xC000, 0xA, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0xE, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x8E, 16, -4
	banim_frame_oam 0x4000, 0x8000, 0x6, -40, -2
	banim_frame_oam 0x0, 0x4000, 0x46, -13, -14
	banim_frame_oam 0x0, 0x4000, 0x48, 21, -28
	banim_frame_end
banim_genm_al1_5_oam_frame_60_r:
	banim_frame_oam 0x4000, 0x8000, 0x1C, -43, -9
	banim_frame_oam 0x0, 0x0, 0x5C, -8, -12
	banim_frame_oam 0x0, 0x0, 0x5D, 21, -20
	banim_frame_oam 0x0, 0x8000, 0x50, -20, -33
	banim_frame_oam 0x8000, 0x8000, 0x54, 12, -33
	banim_frame_oam 0x4000, 0x8000, 0xD0, -20, -1
	banim_frame_oam 0x0, 0x4000, 0xD4, 12, -1
	banim_frame_end
banim_genm_al1_5_oam_frame_61_r:
	banim_frame_oam 0x4000, 0x8000, 0x7C, -44, -13
	banim_frame_oam 0x0, 0x0, 0x5E, -9, -13
	banim_frame_oam 0x0, 0x8000, 0x56, -20, -33
	banim_frame_oam 0x8000, 0x8000, 0x5A, 12, -33
	banim_frame_oam 0x4000, 0x8000, 0xD6, -20, -1
	banim_frame_oam 0x0, 0x4000, 0xDA, 12, -1
	banim_frame_oam 0x4000, 0x0, 0xBC, 12, -18
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_genm_al1_5_oam_frame_62_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0xDC, 0, -16
	banim_frame_oam 0x4000, 0x8000, 0x26, -86, -16
	banim_frame_oam 0x4000, 0x4000, 0x66, -62, -10
	banim_frame_oam 0x4000, 0x4000, 0x86, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xA6, -37, -7
	banim_frame_oam 0x4000, 0x0, 0xC6, -5, -7
	banim_frame_end
banim_genm_al1_5_oam_frame_63_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x8000, 0x46, -40, -26
	banim_frame_oam 0x4000, 0x0, 0x8, -9, -10
	banim_frame_oam 0x0, 0x0, 0x28, -40, -10
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_64_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0xA6, -42, -5
	banim_frame_oam 0x4000, 0x4000, 0x86, -42, -13
	banim_frame_oam 0x4000, 0x0, 0xE6, -10, -12
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x8000, 0x8000, 0xA, -41, -8
	banim_frame_oam 0x0, 0x4000, 0xC, -25, -8
	banim_frame_oam 0x0, 0x0, 0x4C, -25, 8
	banim_frame_oam 0x4000, 0x0, 0x6C, -9, -8
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0xCA, -23, 3
	banim_frame_oam 0x4000, 0x0, 0xE8, -39, 11
	banim_frame_oam 0x4000, 0x4000, 0xA9, -31, -5
	banim_frame_oam 0x0, 0x0, 0xA8, -39, -9
	banim_frame_oam 0x0, 0x0, 0xC9, 1, -5
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0xCD, -37, 1
	banim_frame_oam 0x0, 0x0, 0xAD, -37, -7
	banim_frame_oam 0x4000, 0x0, 0xEF, -21, 9
	banim_frame_oam 0x8000, 0x0, 0xD1, -5, 1
	banim_frame_oam 0x8000, 0x0, 0xB2, 3, -7
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0xE, -40, 1
	banim_frame_oam 0x4000, 0x4000, 0x30, -24, 9
	banim_frame_oam 0x0, 0x0, 0x11, 0, 1
	banim_frame_oam 0x0, 0x0, 0x12, 4, -7
	banim_frame_oam 0x0, 0x0, 0x10, -40, -7
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0x6E, -37, 2
	banim_frame_oam 0x0, 0x0, 0x4E, -37, -6
	banim_frame_oam 0x4000, 0x0, 0x90, -21, 10
	banim_frame_oam 0x8000, 0x0, 0x72, -5, 2
	banim_frame_oam 0x8000, 0x0, 0x51, 3, -6
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x8000, 0x34, -34, 0
	banim_frame_oam 0x4000, 0x0, 0x14, -42, -8
	banim_frame_oam 0x8000, 0x0, 0x18, -2, -8
	banim_frame_oam 0x4000, 0x0, 0x16, -2, -16
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x0, 0x4000, 0x75, -13, -13
	banim_frame_oam 0x4000, 0x0, 0x93, -29, -3
	banim_frame_oam 0x0, 0x0, 0x73, -37, -7
	banim_frame_oam 0x0, 0x0, 0x97, 3, -7
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_66_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x0, 0xB5, -21, -14
	banim_frame_oam 0x4000, 0x0, 0xB3, -37, -12
	banim_frame_oam 0x4000, 0x0, 0xB7, -5, -11
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_65_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x4000, 0xD3, -39, -7
	banim_frame_oam 0x4000, 0x0, 0xD7, -7, -7
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_67_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0xFA, -30, -14
	banim_frame_oam 0x4000, 0x4000, 0xDA, -62, -10
	banim_frame_oam 0x4000, 0x4000, 0xF2, -36, -7
	banim_frame_oam 0x4000, 0x0, 0xF6, -4, -7
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x8000, 0x9A, -86, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x8000, 0x26, -86, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_30_r:
	banim_frame_end
banim_genm_al1_5_oam_frame_33_r:
	banim_frame_oam 0x0, 0x4000, 0x32, -38, -19
	banim_frame_oam 0x4000, 0x0, 0x72, -38, -3
	banim_frame_oam 0x0, 0x4000, 0x9E, -30, -35
	banim_frame_oam 0x0, 0x4000, 0x9C, -14, -43
	banim_frame_oam 0x4000, 0x0, 0xF1, 2, -43
	banim_frame_oam 0x4000, 0x0, 0xE9, -38, 5
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_oam 0x4000, 0x8000, 0xDC, 20, -27
	banim_frame_end
banim_genm_al1_5_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x93, 3, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 19, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 3, -29
	banim_frame_oam 0x0, 0x0, 0x36, 35, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 35, -3
	banim_frame_oam 0x4000, 0x0, 0x3E, 28, -14
	banim_frame_oam 0x0, 0xB000, 0x4F, 58, -7
	banim_frame_oam 0x4000, 0xB000, 0xF, 42, 25
	banim_frame_oam 0x4000, 0x3000, 0xD1, 42, -7
	banim_frame_oam 0x4000, 0x3000, 0x33, 42, 17
	banim_frame_oam 0x8000, 0x3000, 0xCF, 82, -23
	banim_frame_oam 0x0, 0x3000, 0xF0, 82, -31
	banim_frame_oam 0x0, 0x3000, 0xD0, 66, -15
	banim_frame_oam 0x0, 0x7000, 0x53, 2, -25
	banim_frame_oam 0x0, 0x3000, 0xF1, 18, -17
	banim_frame_oam 0x0, 0x3000, 0xF2, 4, -33
	banim_frame_oam 0x8000, 0x0, 0xCB, -5, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0x93, 3, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 19, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 3, -29
	banim_frame_oam 0x0, 0x0, 0x36, 35, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 35, -3
	banim_frame_oam 0x4000, 0x0, 0x3E, 28, -14
	banim_frame_oam 0x0, 0xB000, 0x97, 57, -42
	banim_frame_oam 0x0, 0x7000, 0x5A, 59, -58
	banim_frame_oam 0x4000, 0x3000, 0x7C, 43, -58
	banim_frame_oam 0x8000, 0x7000, 0x17, 81, -10
	banim_frame_oam 0x8000, 0x3000, 0x58, 73, 14
	banim_frame_oam 0x8000, 0x3000, 0x18, 65, 22
	banim_frame_oam 0x0, 0x3000, 0x19, 57, 30
	banim_frame_oam 0x8000, 0x3000, 0x39, 68, -2
	banim_frame_oam 0x0, 0x3000, 0x79, 68, -10
	banim_frame_oam 0x0, 0x7000, 0x9B, 41, -26
	banim_frame_oam 0x8000, 0x3000, 0xDB, 49, -42
	banim_frame_oam 0x0, 0x3000, 0x3D, 1, 6
	banim_frame_oam 0x8000, 0x0, 0xCB, -5, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x93, 3, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 19, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 3, -29
	banim_frame_oam 0x0, 0x0, 0x36, 35, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 35, -3
	banim_frame_oam 0x4000, 0x0, 0x3E, 28, -14
	banim_frame_oam 0x0, 0x8000, 0x48, 24, -57
	banim_frame_oam 0x0, 0x4000, 0x46, 8, -57
	banim_frame_oam 0x8000, 0x0, 0xC8, 0, -49
	banim_frame_oam 0x8000, 0x8000, 0x4C, 56, -57
	banim_frame_oam 0x0, 0x4000, 0x6, 72, -47
	banim_frame_oam 0x0, 0x4000, 0x8, 80, -31
	banim_frame_oam 0x8000, 0x0, 0xC, 88, -15
	banim_frame_oam 0x0, 0x0, 0x87, 16, -41
	banim_frame_oam 0x0, 0x0, 0xA7, 64, -25
	banim_frame_oam 0x8000, 0x0, 0xD, 40, -1
	banim_frame_oam 0x0, 0x4000, 0xC6, 40, 15
	banim_frame_oam 0x8000, 0x0, 0xC9, 32, -25
	banim_frame_oam 0x8000, 0x0, 0xCB, -5, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_43_r:
	banim_frame_oam 0x0, 0x8000, 0x4F, -6, -43
	banim_frame_oam 0x4000, 0x8000, 0xF, 10, -59
	banim_frame_oam 0x4000, 0x4000, 0x13, 42, -59
	banim_frame_oam 0x4000, 0x0, 0xD1, 26, -19
	banim_frame_oam 0x4000, 0x0, 0x33, 26, -43
	banim_frame_oam 0x0, 0x0, 0x35, 42, -43
	banim_frame_oam 0x8000, 0x0, 0xCF, -6, -11
	banim_frame_oam 0x0, 0x0, 0xF0, -6, 5
	banim_frame_oam 0x0, 0x0, 0xD0, 10, -11
	banim_frame_oam 0x0, 0x4000, 0x53, 66, -9
	banim_frame_oam 0x0, 0x0, 0xF1, 58, -9
	banim_frame_oam 0x0, 0x0, 0xF2, 72, 7
	banim_frame_oam 0x0, 0x8000, 0x4F, -6, -43
	banim_frame_oam 0x8000, 0x0, 0xCF, -6, -11
	banim_frame_oam 0x0, 0x0, 0xF0, -6, 5
	banim_frame_oam 0x0, 0x8000, 0x93, 3, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 19, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 3, -29
	banim_frame_oam 0x0, 0x0, 0x36, 35, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 35, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -14
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -14
	banim_frame_oam 0x8000, 0x0, 0xCB, -5, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x97, -4, -8
	banim_frame_oam 0x0, 0x4000, 0x5A, 10, 24
	banim_frame_oam 0x4000, 0x0, 0x7C, 26, 32
	banim_frame_oam 0x8000, 0x4000, 0x17, -4, -40
	banim_frame_oam 0x8000, 0x0, 0x58, 4, -48
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -56
	banim_frame_oam 0x0, 0x0, 0x19, 20, -56
	banim_frame_oam 0x8000, 0x0, 0x39, 9, -32
	banim_frame_oam 0x0, 0x0, 0x79, 9, -16
	banim_frame_oam 0x0, 0x4000, 0x9B, 28, -8
	banim_frame_oam 0x8000, 0x0, 0xDB, 28, 8
	banim_frame_oam 0x0, 0x4000, 0x1B, 60, -40
	banim_frame_oam 0x8000, 0x0, 0x1A, 52, -32
	banim_frame_oam 0x0, 0x0, 0x3D, 76, -32
	banim_frame_oam 0x0, 0x8000, 0x97, -4, -8
	banim_frame_oam 0x8000, 0x4000, 0x17, -4, -40
	banim_frame_oam 0x0, 0x8000, 0x93, 3, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 19, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 3, -29
	banim_frame_oam 0x0, 0x0, 0x36, 35, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 35, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -14
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -14
	banim_frame_oam 0x8000, 0x0, 0xCB, -5, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_45_r:
	banim_frame_oam 0x0, 0xB000, 0x48, 28, 7
	banim_frame_oam 0x0, 0x7000, 0x46, 60, 23
	banim_frame_oam 0x8000, 0x3000, 0xC8, 76, 15
	banim_frame_oam 0x8000, 0xB000, 0x4C, 12, 7
	banim_frame_oam 0x0, 0x7000, 0x6, -4, 13
	banim_frame_oam 0x0, 0x7000, 0x8, -12, -3
	banim_frame_oam 0x8000, 0x3000, 0xC, -12, -19
	banim_frame_oam 0x0, 0x3000, 0x87, 60, 15
	banim_frame_oam 0x0, 0x3000, 0xA7, 12, -1
	banim_frame_oam 0x8000, 0x3000, 0xD, 36, -33
	banim_frame_oam 0x0, 0x7000, 0xC6, 28, -49
	banim_frame_oam 0x8000, 0x3000, 0xC9, 44, -9
	banim_frame_oam 0x0, 0x3000, 0xCA, 44, -49
	banim_frame_oam 0x0, 0x7000, 0x6, -4, 12
	banim_frame_oam 0x0, 0x7000, 0x8, -12, -4
	banim_frame_oam 0x8000, 0x3000, 0xC, -12, -20
	banim_frame_oam 0x0, 0x8000, 0x93, 3, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 19, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 3, -29
	banim_frame_oam 0x0, 0x0, 0x36, 35, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 35, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -14
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -14
	banim_frame_oam 0x8000, 0x0, 0xCB, -5, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_46_r:
	banim_frame_oam 0x0, 0xB000, 0x4F, 61, -10
	banim_frame_oam 0x4000, 0xB000, 0xF, 45, 22
	banim_frame_oam 0x4000, 0x7000, 0x13, 13, 30
	banim_frame_oam 0x4000, 0x3000, 0xD1, 45, -10
	banim_frame_oam 0x4000, 0x3000, 0x33, 45, 14
	banim_frame_oam 0x0, 0x3000, 0x35, 37, 14
	banim_frame_oam 0x8000, 0x3000, 0xCF, 85, -26
	banim_frame_oam 0x0, 0x3000, 0xF0, 85, -34
	banim_frame_oam 0x0, 0x3000, 0xD0, 69, -18
	banim_frame_oam 0x0, 0x7000, 0x53, 5, -28
	banim_frame_oam 0x0, 0x3000, 0xF1, 21, -20
	banim_frame_oam 0x0, 0x3000, 0xF2, 7, -36
	banim_frame_oam 0x0, 0x8000, 0x93, 3, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 19, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 3, -29
	banim_frame_oam 0x0, 0x0, 0x36, 35, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 35, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -14
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -14
	banim_frame_oam 0x8000, 0x0, 0xCB, -5, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_47_r:
	banim_frame_oam 0x0, 0xB000, 0x97, 60, -44
	banim_frame_oam 0x0, 0x7000, 0x5A, 62, -60
	banim_frame_oam 0x4000, 0x3000, 0x7C, 46, -60
	banim_frame_oam 0x8000, 0x7000, 0x17, 84, -12
	banim_frame_oam 0x8000, 0x3000, 0x58, 76, 12
	banim_frame_oam 0x8000, 0x3000, 0x18, 68, 20
	banim_frame_oam 0x0, 0x3000, 0x19, 60, 28
	banim_frame_oam 0x8000, 0x3000, 0x39, 71, -4
	banim_frame_oam 0x0, 0x3000, 0x79, 71, -12
	banim_frame_oam 0x0, 0x7000, 0x9B, 44, -28
	banim_frame_oam 0x8000, 0x3000, 0xDB, 52, -44
	banim_frame_oam 0x0, 0x7000, 0x1B, 12, 4
	banim_frame_oam 0x8000, 0x3000, 0x1A, 28, -4
	banim_frame_oam 0x0, 0x3000, 0x3D, 4, 4
	banim_frame_oam 0x0, 0x8000, 0x93, 3, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 19, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 3, -29
	banim_frame_oam 0x0, 0x0, 0x36, 35, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 35, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -14
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -14
	banim_frame_oam 0x8000, 0x0, 0xCB, -5, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_48_r:
	banim_frame_oam 0x0, 0x8000, 0x48, 28, -58
	banim_frame_oam 0x0, 0x4000, 0x46, 12, -58
	banim_frame_oam 0x8000, 0x0, 0xC8, 4, -50
	banim_frame_oam 0x8000, 0x8000, 0x4C, 60, -58
	banim_frame_oam 0x0, 0x4000, 0x6, 76, -48
	banim_frame_oam 0x0, 0x4000, 0x8, 84, -32
	banim_frame_oam 0x8000, 0x0, 0xC, 92, -16
	banim_frame_oam 0x0, 0x0, 0x87, 20, -42
	banim_frame_oam 0x0, 0x0, 0xA7, 68, -26
	banim_frame_oam 0x8000, 0x0, 0xD, 44, -2
	banim_frame_oam 0x0, 0x4000, 0xC6, 44, 14
	banim_frame_oam 0x8000, 0x0, 0xC9, 36, -26
	banim_frame_oam 0x0, 0x0, 0xCA, 36, 22
	banim_frame_oam 0x0, 0x8000, 0x93, 3, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 19, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 3, -29
	banim_frame_oam 0x0, 0x0, 0x36, 35, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 35, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -14
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -14
	banim_frame_oam 0x8000, 0x0, 0xCB, -5, -13
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_genm_al1_5_oam_frame_49_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -8, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 24, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 24, -5
	banim_frame_oam 0x4000, 0x1000, 0xFC, -11, -12
	banim_frame_oam 0x0, 0x1000, 0xFE, -19, -12
	banim_frame_oam 0x4000, 0x0, 0xFC, 27, -13
	banim_frame_oam 0x0, 0x0, 0xFE, 43, -13
	banim_frame_end
banim_genm_al1_5_oam_frame_50_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0xDE, 1, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_51_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -3, -29
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -29
	banim_frame_oam 0x4000, 0x8000, 0x80, -3, 3
	banim_frame_oam 0x0, 0x4000, 0x84, 29, 3
	banim_frame_oam 0x0, 0x4000, 0x4C, 7, -16
	banim_frame_end
banim_genm_al1_5_oam_frame_52_r:
	banim_frame_oam 0x8000, 0xC000, 0xE, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x12, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x92, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x4C, 4, -17
	banim_frame_end
banim_genm_al1_5_oam_frame_53_r:
	banim_frame_oam 0x8000, 0xC000, 0x14, -11, -37
	banim_frame_oam 0x8000, 0x8000, 0x18, 21, -37
	banim_frame_oam 0x8000, 0x8000, 0x98, 21, -5
	banim_frame_oam 0x0, 0x4000, 0x4C, 0, -17
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_genm_al1_5_oam_frame_54_r:
	banim_frame_oam 0x0, 0x6000, 0xC, -51, -29
	banim_frame_oam 0x0, 0x6000, 0xE, -51, -13
	banim_frame_oam 0x0, 0x2000, 0x10, -35, -3
	banim_frame_oam 0x4000, 0x2000, 0x12, -35, -27
	banim_frame_oam 0x0, 0x6000, 0x14, -2, -40
	banim_frame_oam 0x0, 0x2000, 0x16, -10, -32
	banim_frame_oam 0x8000, 0xC000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 17, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 17, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -23, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_55_r:
	banim_frame_oam 0x0, 0x6000, 0x18, -41, -57
	banim_frame_oam 0x8000, 0x6000, 0x1C, -49, -49
	banim_frame_oam 0x4000, 0x2000, 0x1A, -41, -41
	banim_frame_oam 0x0, 0x2000, 0x3B, -25, -37
	banim_frame_oam 0x4000, 0x2000, 0x5E, -8, -15
	banim_frame_oam 0x4000, 0x2000, 0x7E, -16, -23
	banim_frame_oam 0x8000, 0xC000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 17, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 17, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -23, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_56_r:
	banim_frame_oam 0x4000, 0x9000, 0x6, -30, -62
	banim_frame_oam 0x0, 0x1000, 0x87, -38, -58
	banim_frame_oam 0x8000, 0x1000, 0x8C, -14, -46
	banim_frame_oam 0x0, 0x5000, 0x46, -28, -16
	banim_frame_oam 0x0, 0x1000, 0xA7, -20, -24
	banim_frame_oam 0x8000, 0xC000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 17, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 17, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -23, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_57_r:
	banim_frame_oam 0x0, 0x5000, 0xC, 5, -40
	banim_frame_oam 0x0, 0x5000, 0xE, 5, -56
	banim_frame_oam 0x0, 0x1000, 0x10, -3, -58
	banim_frame_oam 0x4000, 0x1000, 0x12, -11, -34
	banim_frame_oam 0x0, 0x5000, 0x14, -44, -29
	banim_frame_oam 0x0, 0x1000, 0x16, -28, -29
	banim_frame_oam 0x8000, 0xC000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 17, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 17, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -23, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_58_r:
	banim_frame_oam 0x0, 0x5000, 0x18, -5, -12
	banim_frame_oam 0x8000, 0x5000, 0x1C, 11, -36
	banim_frame_oam 0x4000, 0x1000, 0x1A, -5, -20
	banim_frame_oam 0x0, 0x1000, 0x3B, -13, -24
	banim_frame_oam 0x4000, 0x1000, 0x5E, -38, -46
	banim_frame_oam 0x4000, 0x1000, 0x7E, -30, -38
	banim_frame_oam 0x8000, 0xC000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 17, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 17, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -23, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_59_r:
	banim_frame_oam 0x4000, 0xA000, 0x6, -32, -6
	banim_frame_oam 0x0, 0x2000, 0x87, 0, -2
	banim_frame_oam 0x8000, 0x2000, 0x8C, -24, -22
	banim_frame_oam 0x0, 0x6000, 0x46, -18, -52
	banim_frame_oam 0x0, 0x2000, 0xA7, -18, -36
	banim_frame_oam 0x8000, 0xC000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 17, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 17, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -23, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_36_r:
	banim_frame_oam 0x0, 0x8000, 0x48, -34, -78
	banim_frame_oam 0x0, 0x4000, 0x46, -50, -78
	banim_frame_oam 0x8000, 0x0, 0xC8, -58, -70
	banim_frame_oam 0x8000, 0x8000, 0x4C, -2, -78
	banim_frame_oam 0x0, 0x4000, 0x6, 14, -68
	banim_frame_oam 0x0, 0x4000, 0x8, 22, -52
	banim_frame_oam 0x8000, 0x0, 0xC, 30, -36
	banim_frame_oam 0x0, 0x0, 0x87, -42, -62
	banim_frame_oam 0x0, 0x0, 0xA7, 6, -46
	banim_frame_oam 0x8000, 0x0, 0xD, -18, -22
	banim_frame_oam 0x0, 0x4000, 0xC6, -18, -6
	banim_frame_oam 0x8000, 0x0, 0xC9, -26, -46
	banim_frame_oam 0x0, 0x0, 0xCA, -26, 2
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x4F, -70, -61
	banim_frame_oam 0x4000, 0x8000, 0xF, -54, -77
	banim_frame_oam 0x4000, 0x4000, 0x13, -22, -77
	banim_frame_oam 0x4000, 0x0, 0xD1, -38, -37
	banim_frame_oam 0x4000, 0x0, 0x33, -38, -61
	banim_frame_oam 0x0, 0x0, 0x35, -22, -61
	banim_frame_oam 0x8000, 0x0, 0xCF, -70, -29
	banim_frame_oam 0x0, 0x0, 0xF0, -70, -13
	banim_frame_oam 0x0, 0x0, 0xD0, -54, -29
	banim_frame_oam 0x0, 0x4000, 0x53, 2, -27
	banim_frame_oam 0x0, 0x0, 0xF1, -6, -27
	banim_frame_oam 0x0, 0x0, 0xF2, 8, -11
	banim_frame_oam 0x0, 0x8000, 0x4F, -70, -61
	banim_frame_oam 0x8000, 0x0, 0xCF, -70, -29
	banim_frame_oam 0x0, 0x0, 0xF0, -70, -13
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x97, -68, -22
	banim_frame_oam 0x0, 0x4000, 0x5A, -54, 10
	banim_frame_oam 0x4000, 0x0, 0x7C, -38, 18
	banim_frame_oam 0x8000, 0x4000, 0x17, -68, -54
	banim_frame_oam 0x8000, 0x0, 0x58, -60, -62
	banim_frame_oam 0x8000, 0x0, 0x18, -52, -70
	banim_frame_oam 0x0, 0x0, 0x19, -44, -70
	banim_frame_oam 0x8000, 0x0, 0x39, -55, -46
	banim_frame_oam 0x0, 0x0, 0x79, -55, -30
	banim_frame_oam 0x0, 0x4000, 0x9B, -36, -22
	banim_frame_oam 0x8000, 0x0, 0xDB, -36, -6
	banim_frame_oam 0x0, 0x4000, 0x1B, -4, -54
	banim_frame_oam 0x8000, 0x0, 0x1A, -12, -46
	banim_frame_oam 0x0, 0x0, 0x3D, 12, -46
	banim_frame_oam 0x0, 0x8000, 0x97, -68, -22
	banim_frame_oam 0x8000, 0x4000, 0x17, -68, -54
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_39_r:
	banim_frame_oam 0x0, 0xB000, 0x48, -34, -6
	banim_frame_oam 0x0, 0x7000, 0x46, -2, 10
	banim_frame_oam 0x8000, 0x3000, 0xC8, 14, 2
	banim_frame_oam 0x8000, 0xB000, 0x4C, -50, -6
	banim_frame_oam 0x0, 0x3000, 0x87, -2, 2
	banim_frame_oam 0x0, 0x3000, 0xA7, -50, -14
	banim_frame_oam 0x8000, 0x3000, 0xD, -26, -46
	banim_frame_oam 0x0, 0x7000, 0xC6, -34, -62
	banim_frame_oam 0x8000, 0x3000, 0xC9, -18, -22
	banim_frame_oam 0x0, 0x3000, 0xCA, -18, -62
	banim_frame_oam 0x0, 0x7000, 0x6, -66, 0
	banim_frame_oam 0x0, 0x7000, 0x8, -74, -16
	banim_frame_oam 0x8000, 0x3000, 0xC, -74, -32
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_34_r:
	banim_frame_oam 0x0, 0xB000, 0x4F, 4, -24
	banim_frame_oam 0x4000, 0xB000, 0xF, -12, 8
	banim_frame_oam 0x4000, 0x7000, 0x13, -44, 16
	banim_frame_oam 0x4000, 0x3000, 0xD1, -12, -24
	banim_frame_oam 0x4000, 0x3000, 0x33, -12, 0
	banim_frame_oam 0x0, 0x3000, 0x35, -20, 0
	banim_frame_oam 0x8000, 0x3000, 0xCF, 28, -40
	banim_frame_oam 0x0, 0x3000, 0xF0, 28, -48
	banim_frame_oam 0x0, 0x3000, 0xD0, 12, -32
	banim_frame_oam 0x0, 0x7000, 0x53, -52, -42
	banim_frame_oam 0x0, 0x3000, 0xF1, -36, -34
	banim_frame_oam 0x0, 0x3000, 0xF2, -50, -50
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_5_oam_frame_35_r:
	banim_frame_oam 0x0, 0xB000, 0x97, 2, -63
	banim_frame_oam 0x0, 0x7000, 0x5A, 4, -79
	banim_frame_oam 0x4000, 0x3000, 0x7C, -12, -79
	banim_frame_oam 0x8000, 0x7000, 0x17, 26, -31
	banim_frame_oam 0x8000, 0x3000, 0x58, 18, -7
	banim_frame_oam 0x8000, 0x3000, 0x18, 10, 1
	banim_frame_oam 0x0, 0x3000, 0x19, 2, 9
	banim_frame_oam 0x8000, 0x3000, 0x39, 13, -23
	banim_frame_oam 0x0, 0x3000, 0x79, 13, -31
	banim_frame_oam 0x0, 0x7000, 0x9B, -14, -47
	banim_frame_oam 0x8000, 0x3000, 0xDB, -6, -63
	banim_frame_oam 0x0, 0x7000, 0x1B, -46, -15
	banim_frame_oam 0x8000, 0x3000, 0x1A, -30, -23
	banim_frame_oam 0x0, 0x3000, 0x3D, -54, -15
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_genm_al1_5_script:
banim_genm_al1_5_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 1, banim_genm_al1_5_oam_frame_1_r - banim_genm_al1_5_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 2, banim_genm_al1_5_oam_frame_2_r - banim_genm_al1_5_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_1, 3, banim_genm_al1_5_oam_frame_3_r - banim_genm_al1_5_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_1, 4, banim_genm_al1_5_oam_frame_4_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_1, 5, banim_genm_al1_5_oam_frame_5_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_1, 6, banim_genm_al1_5_oam_frame_6_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 30, banim_genm_al1_sheet_2, 7, banim_genm_al1_5_oam_frame_7_r - banim_genm_al1_5_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_5_oam_frame_8_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_5_oam_frame_9_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_3, 10, banim_genm_al1_5_oam_frame_10_r - banim_genm_al1_5_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_5_oam_frame_11_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_5_oam_frame_12_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_5_oam_frame_13_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_5_oam_frame_14_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_5_oam_frame_15_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_5_oam_frame_16_r - banim_genm_al1_5_oam_r
	banim_code_frame 20, banim_genm_al1_sheet_4, 17, banim_genm_al1_5_oam_frame_17_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_5_oam_frame_18_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_5_oam_frame_19_r - banim_genm_al1_5_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_5_oam_frame_20_r - banim_genm_al1_5_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_5_oam_frame_21_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_5_oam_frame_20_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_5_oam_frame_21_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_5_oam_frame_20_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_5_oam_frame_21_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_5_oam_frame_20_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_5_oam_frame_21_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_5_oam_frame_22_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_5_oam_frame_23_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_5, 24, banim_genm_al1_5_oam_frame_24_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_5_oam_frame_25_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_5_oam_frame_26_r - banim_genm_al1_5_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_5_oam_frame_27_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_5_oam_frame_28_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_5_oam_frame_29_r - banim_genm_al1_5_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_5_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 30, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_3, 48, banim_genm_al1_5_oam_frame_31_r - banim_genm_al1_5_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 20, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_5_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 1, banim_genm_al1_5_oam_frame_1_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_0, 2, banim_genm_al1_5_oam_frame_2_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_genm_al1_sheet_7, 50, banim_genm_al1_5_oam_frame_33_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_8, 82, banim_genm_al1_5_oam_frame_34_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 83, banim_genm_al1_5_oam_frame_35_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 78, banim_genm_al1_5_oam_frame_36_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 79, banim_genm_al1_5_oam_frame_37_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 80, banim_genm_al1_5_oam_frame_38_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 81, banim_genm_al1_5_oam_frame_39_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 82, banim_genm_al1_5_oam_frame_34_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 83, banim_genm_al1_5_oam_frame_35_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_8, 78, banim_genm_al1_5_oam_frame_36_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 79, banim_genm_al1_5_oam_frame_37_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 80, banim_genm_al1_5_oam_frame_38_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 81, banim_genm_al1_5_oam_frame_39_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 82, banim_genm_al1_5_oam_frame_34_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 83, banim_genm_al1_5_oam_frame_35_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 78, banim_genm_al1_5_oam_frame_36_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_8, 79, banim_genm_al1_5_oam_frame_37_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 80, banim_genm_al1_5_oam_frame_38_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 81, banim_genm_al1_5_oam_frame_39_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 82, banim_genm_al1_5_oam_frame_34_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 83, banim_genm_al1_5_oam_frame_35_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 78, banim_genm_al1_5_oam_frame_36_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 79, banim_genm_al1_5_oam_frame_37_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 80, banim_genm_al1_5_oam_frame_38_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 81, banim_genm_al1_5_oam_frame_39_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 82, banim_genm_al1_5_oam_frame_34_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 83, banim_genm_al1_5_oam_frame_35_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_al1_sheet_8, 51, banim_genm_al1_5_oam_frame_40_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 52, banim_genm_al1_5_oam_frame_41_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 53, banim_genm_al1_5_oam_frame_42_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 54, banim_genm_al1_5_oam_frame_43_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 55, banim_genm_al1_5_oam_frame_44_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 56, banim_genm_al1_5_oam_frame_45_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 57, banim_genm_al1_5_oam_frame_46_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 58, banim_genm_al1_5_oam_frame_47_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 59, banim_genm_al1_5_oam_frame_48_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 54, banim_genm_al1_5_oam_frame_43_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 55, banim_genm_al1_5_oam_frame_44_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_8, 56, banim_genm_al1_5_oam_frame_45_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 57, banim_genm_al1_5_oam_frame_46_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 58, banim_genm_al1_5_oam_frame_47_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 59, banim_genm_al1_5_oam_frame_48_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 54, banim_genm_al1_5_oam_frame_43_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 55, banim_genm_al1_5_oam_frame_44_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 56, banim_genm_al1_5_oam_frame_45_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_8, 57, banim_genm_al1_5_oam_frame_46_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 58, banim_genm_al1_5_oam_frame_47_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 59, banim_genm_al1_5_oam_frame_48_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 54, banim_genm_al1_5_oam_frame_43_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 55, banim_genm_al1_5_oam_frame_44_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 56, banim_genm_al1_5_oam_frame_45_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 57, banim_genm_al1_5_oam_frame_46_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 58, banim_genm_al1_5_oam_frame_47_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_8, 59, banim_genm_al1_5_oam_frame_48_r - banim_genm_al1_5_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_5_oam_frame_8_r - banim_genm_al1_5_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_5_oam_frame_9_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_3, 10, banim_genm_al1_5_oam_frame_10_r - banim_genm_al1_5_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_5_oam_frame_11_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_5_oam_frame_12_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_5_oam_frame_13_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_5_oam_frame_14_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_5_oam_frame_15_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_5_oam_frame_16_r - banim_genm_al1_5_oam_r
	banim_code_frame 30, banim_genm_al1_sheet_4, 17, banim_genm_al1_5_oam_frame_17_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_5_oam_frame_18_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_5_oam_frame_19_r - banim_genm_al1_5_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_5_oam_frame_20_r - banim_genm_al1_5_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_5_oam_frame_21_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_5_oam_frame_20_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_5_oam_frame_21_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_5_oam_frame_20_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_5_oam_frame_21_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_5_oam_frame_20_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_5_oam_frame_21_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_5_oam_frame_22_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_5_oam_frame_23_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_5, 24, banim_genm_al1_5_oam_frame_24_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_5_oam_frame_25_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_5_oam_frame_26_r - banim_genm_al1_5_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_5_oam_frame_27_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_5_oam_frame_28_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_5_oam_frame_29_r - banim_genm_al1_5_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_5_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_3, 48, banim_genm_al1_5_oam_frame_31_r - banim_genm_al1_5_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 30, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 47, banim_genm_al1_5_oam_frame_32_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_0, 49, banim_genm_al1_5_oam_frame_30_r - banim_genm_al1_5_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_5_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_5_oam_frame_1_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 2, banim_genm_al1_5_oam_frame_2_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 64, banim_genm_al1_5_oam_frame_49_r - banim_genm_al1_5_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 64, banim_genm_al1_5_oam_frame_49_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 65, banim_genm_al1_5_oam_frame_50_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 66, banim_genm_al1_5_oam_frame_51_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 67, banim_genm_al1_5_oam_frame_52_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 68, banim_genm_al1_5_oam_frame_53_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_5_oam_frame_27_r - banim_genm_al1_5_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_5_oam_frame_28_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_5_oam_frame_29_r - banim_genm_al1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_5_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_5_oam_frame_1_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_5_oam_frame_2_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_7, 72, banim_genm_al1_5_oam_frame_54_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_7, 73, banim_genm_al1_5_oam_frame_55_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 74, banim_genm_al1_5_oam_frame_56_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 75, banim_genm_al1_5_oam_frame_57_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 76, banim_genm_al1_5_oam_frame_58_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 77, banim_genm_al1_5_oam_frame_59_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 72, banim_genm_al1_5_oam_frame_54_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_genm_al1_sheet_7, 73, banim_genm_al1_5_oam_frame_55_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 74, banim_genm_al1_5_oam_frame_56_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 75, banim_genm_al1_5_oam_frame_57_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 76, banim_genm_al1_5_oam_frame_58_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 77, banim_genm_al1_5_oam_frame_59_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_genm_al1_sheet_7, 72, banim_genm_al1_5_oam_frame_54_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 73, banim_genm_al1_5_oam_frame_55_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 74, banim_genm_al1_5_oam_frame_56_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 75, banim_genm_al1_5_oam_frame_57_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 76, banim_genm_al1_5_oam_frame_58_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_7, 77, banim_genm_al1_5_oam_frame_59_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_0, 2, banim_genm_al1_5_oam_frame_2_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 64, banim_genm_al1_5_oam_frame_49_r - banim_genm_al1_5_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 64, banim_genm_al1_5_oam_frame_49_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 65, banim_genm_al1_5_oam_frame_50_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 66, banim_genm_al1_5_oam_frame_51_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 67, banim_genm_al1_5_oam_frame_52_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 68, banim_genm_al1_5_oam_frame_53_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_5_oam_frame_27_r - banim_genm_al1_5_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_5_oam_frame_28_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_5_oam_frame_29_r - banim_genm_al1_5_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_5_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_5_oam_frame_60_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 31, banim_genm_al1_5_oam_frame_61_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_5_oam_frame_60_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_5_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_5_oam_frame_60_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 31, banim_genm_al1_5_oam_frame_61_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_5_oam_frame_60_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_5_mode_stand_close:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_5_mode_stand:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_5_mode_stand_range:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_5_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_5_oam_frame_0_r - banim_genm_al1_5_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 1, banim_genm_al1_5_oam_frame_1_r - banim_genm_al1_5_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 2, banim_genm_al1_5_oam_frame_2_r - banim_genm_al1_5_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_1, 3, banim_genm_al1_5_oam_frame_3_r - banim_genm_al1_5_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_1, 4, banim_genm_al1_5_oam_frame_4_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_1, 5, banim_genm_al1_5_oam_frame_5_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_1, 6, banim_genm_al1_5_oam_frame_6_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_2, 7, banim_genm_al1_5_oam_frame_7_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_2, 8, banim_genm_al1_5_oam_frame_8_r - banim_genm_al1_5_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_5_oam_frame_9_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_3, 34, banim_genm_al1_5_oam_frame_62_r - banim_genm_al1_5_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_4, 35, banim_genm_al1_5_oam_frame_63_r - banim_genm_al1_5_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_4, 36, banim_genm_al1_5_oam_frame_64_r - banim_genm_al1_5_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 45, banim_genm_al1_5_oam_frame_65_r - banim_genm_al1_5_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 44, banim_genm_al1_5_oam_frame_66_r - banim_genm_al1_5_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 46, banim_genm_al1_5_oam_frame_67_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_5_oam_frame_23_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_5, 24, banim_genm_al1_5_oam_frame_24_r - banim_genm_al1_5_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_5_oam_frame_26_r - banim_genm_al1_5_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_5_oam_frame_27_r - banim_genm_al1_5_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_5_oam_frame_28_r - banim_genm_al1_5_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_5_oam_frame_29_r - banim_genm_al1_5_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_genm_al1_5_mode_attack_close - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_attack_close_back - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_attack_close_critical - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_attack_close_critical_back - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_attack_range - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_attack_range_critical - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_dodge_close - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_dodge_range - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_stand_close - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_stand - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_stand_range - banim_genm_al1_5_script
	.word banim_genm_al1_5_mode_attack_miss - banim_genm_al1_5_script
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

