@ vim:ft=armv4
	.global banim_genm_al1_2_script
	.global banim_genm_al1_2_oam_r
	.global banim_genm_al1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x45
	.section .data.oam_l
banim_genm_al1_2_oam_l:
banim_genm_al1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x84, -32, -4
	banim_frame_oam 0x0, 0x5000, 0x4A, -2, -16
	banim_frame_oam 0x0, 0x9000, 0x86, 4, -30
	banim_frame_oam 0x0, 0x1000, 0x2B, 8, 10
	banim_frame_end
banim_genm_al1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0xD000, 0xC, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x10, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x90, -32, -4
	banim_frame_oam 0x8000, 0x1000, 0x4A, 1, -15
	banim_frame_oam 0x0, 0x9000, 0x86, -1, -29
	banim_frame_end
banim_genm_al1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0xD000, 0x16, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x1A, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x9A, -32, -4
	banim_frame_oam 0x0, 0x9000, 0x9C, -14, -28
	banim_frame_end
banim_genm_al1_2_oam_frame_3_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -22, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -38, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -38, -5
	banim_frame_oam 0x0, 0x9000, 0x46, -31, -25
	banim_frame_oam 0x0, 0x1000, 0xC6, -39, -9
	banim_frame_end
banim_genm_al1_2_oam_frame_4_l:
	banim_frame_oam 0x8000, 0xD000, 0xC, -26, -37
	banim_frame_oam 0x8000, 0x9000, 0x10, -42, -37
	banim_frame_oam 0x8000, 0x9000, 0x90, -42, -5
	banim_frame_oam 0x0, 0x9000, 0x46, -40, -27
	banim_frame_oam 0x0, 0x1000, 0xC6, -48, -11
	banim_frame_end
banim_genm_al1_2_oam_frame_5_l:
	banim_frame_oam 0x8000, 0xD000, 0x16, -27, -37
	banim_frame_oam 0x8000, 0x9000, 0x1A, -43, -37
	banim_frame_oam 0x8000, 0x9000, 0x9A, -43, -5
	banim_frame_oam 0x0, 0x9000, 0x46, -46, -24
	banim_frame_oam 0x0, 0x1000, 0xC6, -54, -8
	banim_frame_end
banim_genm_al1_2_oam_frame_6_l:
	banim_frame_oam 0x8000, 0xD000, 0x1C, -27, -37
	banim_frame_oam 0x8000, 0x9000, 0xA, -43, -37
	banim_frame_oam 0x8000, 0x9000, 0x8A, -43, -5
	banim_frame_oam 0x0, 0x9000, 0x46, -46, -24
	banim_frame_oam 0x0, 0x1000, 0xC6, -54, -8
	banim_frame_end
banim_genm_al1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x26, -27, -29
	banim_frame_oam 0x8000, 0x9000, 0x2A, -43, -29
	banim_frame_oam 0x4000, 0x9000, 0xA6, -27, 3
	banim_frame_oam 0x0, 0x5000, 0xAA, -43, 3
	banim_frame_oam 0x4000, 0x5000, 0xE6, -27, 19
	banim_frame_oam 0x4000, 0x1000, 0xEA, -43, 19
	banim_frame_oam 0x0, 0x9000, 0x96, -46, -24
	banim_frame_oam 0x0, 0x1000, 0x9C, -54, -8
	banim_frame_end
banim_genm_al1_2_oam_frame_8_l:
	banim_frame_oam 0x8000, 0xD000, 0xC, -27, -37
	banim_frame_oam 0x8000, 0x9000, 0x10, -43, -37
	banim_frame_oam 0x8000, 0x9000, 0x90, -43, -5
	banim_frame_oam 0x0, 0x9000, 0x16, -36, -31
	banim_frame_end
banim_genm_al1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x1C, -2, -24
	banim_frame_oam 0x0, 0x5000, 0x9E, 30, -16
	banim_frame_oam 0x0, 0x1000, 0x9D, 46, -12
	banim_frame_oam 0x0, 0x5000, 0xBC, 6, -40
	banim_frame_oam 0x4000, 0x1000, 0xDE, 14, 8
	banim_frame_oam 0x8000, 0xD000, 0x0, -23, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -39, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -39, -5
	banim_frame_oam 0x4000, 0x1000, 0xFC, -40, -12
	banim_frame_oam 0x0, 0x1000, 0xFE, -48, -12
	banim_frame_end
banim_genm_al1_2_oam_frame_10_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0xDE, -15, -16
	banim_frame_oam 0x8000, 0x9000, 0xE, 40, -22
	banim_frame_oam 0x0, 0x5000, 0xC, 56, -22
	banim_frame_oam 0x4000, 0x1000, 0xC6, -5, -8
	banim_frame_oam 0x4000, 0x5000, 0xA6, 11, -8
	banim_frame_end
banim_genm_al1_2_oam_frame_11_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x4000, 0x9000, 0x46, 15, -27
	banim_frame_oam 0x4000, 0x1000, 0x8, 0, -11
	banim_frame_oam 0x0, 0x1000, 0x28, 39, -11
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_12_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xA6, 33, -6
	banim_frame_oam 0x4000, 0x5000, 0x86, 17, -14
	banim_frame_oam 0x4000, 0x1000, 0xE6, 1, -13
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_13_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x8000, 0x9000, 0xA, 32, -9
	banim_frame_oam 0x0, 0x5000, 0xC, 16, -9
	banim_frame_oam 0x0, 0x1000, 0x4C, 24, 7
	banim_frame_oam 0x4000, 0x1000, 0x6C, 0, -9
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_14_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xCA, 14, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 30, 10
	banim_frame_oam 0x4000, 0x5000, 0xA9, 6, -6
	banim_frame_oam 0x0, 0x1000, 0xA8, 38, -10
	banim_frame_oam 0x0, 0x1000, 0xC9, -2, -6
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_15_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xCD, 28, 0
	banim_frame_oam 0x0, 0x1000, 0xAD, 36, -8
	banim_frame_oam 0x4000, 0x1000, 0xEF, 12, 8
	banim_frame_oam 0x8000, 0x1000, 0xD1, 4, 0
	banim_frame_oam 0x8000, 0x1000, 0xB2, -4, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_16_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xE, 31, 0
	banim_frame_oam 0x4000, 0x5000, 0x30, -1, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -1, 0
	banim_frame_oam 0x0, 0x1000, 0x12, -5, -8
	banim_frame_oam 0x0, 0x1000, 0x10, 39, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_17_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0x6E, 28, 1
	banim_frame_oam 0x0, 0x1000, 0x4E, 36, -7
	banim_frame_oam 0x4000, 0x1000, 0x90, 12, 9
	banim_frame_oam 0x8000, 0x1000, 0x72, 4, 1
	banim_frame_oam 0x8000, 0x1000, 0x51, -4, -7
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_18_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x9000, 0x34, 9, -1
	banim_frame_oam 0x4000, 0x1000, 0x14, 33, -9
	banim_frame_oam 0x8000, 0x1000, 0x18, 1, -9
	banim_frame_oam 0x4000, 0x1000, 0x16, -7, -17
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_19_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0x75, 4, -14
	banim_frame_oam 0x4000, 0x1000, 0x93, 20, -4
	banim_frame_oam 0x0, 0x1000, 0x73, 36, -8
	banim_frame_oam 0x0, 0x1000, 0x97, -4, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_20_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xB5, 12, -15
	banim_frame_oam 0x4000, 0x1000, 0xB3, 28, -13
	banim_frame_oam 0x4000, 0x1000, 0xB7, -4, -12
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_21_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0xD3, 14, -8
	banim_frame_oam 0x4000, 0x1000, 0xD7, -2, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_22_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0xF2, 11, -8
	banim_frame_oam 0x4000, 0x1000, 0xF6, -5, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0x9E, -12, -27
	banim_frame_oam 0x4000, 0x1000, 0xCF, -20, -11
	banim_frame_oam 0x0, 0x5000, 0xDE, -12, -3
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x8000, 0x9000, 0x1E, -19, -24
	banim_frame_oam 0x0, 0x5000, 0x1C, -3, -24
	banim_frame_oam 0x8000, 0x1000, 0x5D, -3, -8
	banim_frame_oam 0x8000, 0x9000, 0x1A, -5, -24
	banim_frame_end
banim_genm_al1_2_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -29, -29
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -29
	banim_frame_oam 0x4000, 0x9000, 0x80, -29, 3
	banim_frame_oam 0x0, 0x5000, 0x84, -45, 3
	banim_frame_oam 0x0, 0x5000, 0x4A, -22, -18
	banim_frame_oam 0x0, 0x9000, 0x86, -16, -32
	banim_frame_end
banim_genm_al1_2_oam_frame_25_l:
	banim_frame_oam 0x8000, 0xD000, 0xE, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x12, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x92, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x4A, -20, -17
	banim_frame_oam 0x0, 0x9000, 0x86, -14, -31
	banim_frame_end
banim_genm_al1_2_oam_frame_26_l:
	banim_frame_oam 0x8000, 0xD000, 0x14, -21, -37
	banim_frame_oam 0x8000, 0x9000, 0x18, -37, -37
	banim_frame_oam 0x8000, 0x9000, 0x98, -37, -5
	banim_frame_oam 0x0, 0x5000, 0x4A, -18, -17
	banim_frame_oam 0x0, 0x9000, 0x86, -12, -31
	banim_frame_end
banim_genm_al1_2_oam_frame_27_l:
	banim_frame_oam 0x8000, 0xD000, 0x1A, -16, -37
	banim_frame_oam 0x8000, 0x9000, 0x1E, -32, -37
	banim_frame_oam 0x8000, 0x9000, 0x9E, -32, -5
	banim_frame_oam 0x0, 0x5000, 0x4A, -6, -19
	banim_frame_oam 0x0, 0x9000, 0x86, 0, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_28_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x84, -32, -4
	banim_frame_oam 0x0, 0x5000, 0x92, -2, -18
	banim_frame_oam 0x0, 0x9000, 0x10, 4, -32
	banim_frame_end
banim_genm_al1_2_oam_frame_29_l:
	banim_frame_oam 0x0, 0x5000, 0x92, -1, -18
	banim_frame_oam 0x0, 0x9000, 0x10, 5, -32
	banim_frame_oam 0x8000, 0xD000, 0xA, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0xE, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x8E, -32, -4
	banim_frame_end
banim_genm_al1_2_oam_frame_49_l:
	banim_frame_oam 0x8000, 0x9000, 0x8E, 3, -25
	banim_frame_oam 0x0, 0x1000, 0x6C, 19, -10
	banim_frame_oam 0x0, 0x9000, 0x50, -12, -33
	banim_frame_oam 0x8000, 0x9000, 0x54, -28, -33
	banim_frame_oam 0x4000, 0x9000, 0xD0, -12, -1
	banim_frame_oam 0x0, 0x5000, 0xD4, -28, -1
	banim_frame_end
banim_genm_al1_2_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x8A, -11, -16
	banim_frame_oam 0x0, 0x9000, 0x56, -12, -33
	banim_frame_oam 0x8000, 0x9000, 0x5A, -28, -33
	banim_frame_oam 0x4000, 0x9000, 0xD6, -12, -1
	banim_frame_oam 0x0, 0x5000, 0xDA, -28, -1
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_genm_al1_2_oam_frame_51_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0xDE, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xC6, -5, -8
	banim_frame_oam 0x4000, 0x5000, 0xA6, 11, -8
	banim_frame_oam 0x8000, 0x9000, 0xA, 55, -22
	banim_frame_oam 0x8000, 0x9000, 0xE, 40, -22
	banim_frame_oam 0x0, 0x5000, 0xC, 56, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x4000, 0x9000, 0x46, 15, -27
	banim_frame_oam 0x4000, 0x1000, 0x8, 0, -11
	banim_frame_oam 0x0, 0x1000, 0x28, 39, -11
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xA6, 33, -6
	banim_frame_oam 0x4000, 0x5000, 0x86, 17, -14
	banim_frame_oam 0x4000, 0x1000, 0xE6, 1, -13
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x8000, 0x9000, 0xA, 32, -9
	banim_frame_oam 0x0, 0x5000, 0xC, 16, -9
	banim_frame_oam 0x0, 0x1000, 0x4C, 24, 7
	banim_frame_oam 0x4000, 0x1000, 0x6C, 0, -9
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xCA, 14, 2
	banim_frame_oam 0x4000, 0x1000, 0xE8, 30, 10
	banim_frame_oam 0x4000, 0x5000, 0xA9, 6, -6
	banim_frame_oam 0x0, 0x1000, 0xA8, 38, -10
	banim_frame_oam 0x0, 0x1000, 0xC9, -2, -6
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xCD, 28, 0
	banim_frame_oam 0x0, 0x1000, 0xAD, 36, -8
	banim_frame_oam 0x4000, 0x1000, 0xEF, 12, 8
	banim_frame_oam 0x8000, 0x1000, 0xD1, 4, 0
	banim_frame_oam 0x8000, 0x1000, 0xB2, -4, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0xE, 31, 0
	banim_frame_oam 0x4000, 0x5000, 0x30, -1, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -1, 0
	banim_frame_oam 0x0, 0x1000, 0x12, -5, -8
	banim_frame_oam 0x0, 0x1000, 0x10, 39, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0x6E, 28, 1
	banim_frame_oam 0x0, 0x1000, 0x4E, 36, -7
	banim_frame_oam 0x4000, 0x1000, 0x90, 12, 9
	banim_frame_oam 0x8000, 0x1000, 0x72, 4, 1
	banim_frame_oam 0x8000, 0x1000, 0x51, -4, -7
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x9000, 0x34, 9, -1
	banim_frame_oam 0x4000, 0x1000, 0x14, 33, -9
	banim_frame_oam 0x8000, 0x1000, 0x18, 1, -9
	banim_frame_oam 0x4000, 0x1000, 0x16, -7, -17
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x0, 0x5000, 0x75, 4, -14
	banim_frame_oam 0x4000, 0x1000, 0x93, 20, -4
	banim_frame_oam 0x0, 0x1000, 0x73, 36, -8
	banim_frame_oam 0x0, 0x1000, 0x97, -4, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xB5, 12, -15
	banim_frame_oam 0x4000, 0x1000, 0xB3, 28, -13
	banim_frame_oam 0x4000, 0x1000, 0xB7, -4, -12
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0xD3, 14, -8
	banim_frame_oam 0x4000, 0x1000, 0xD7, -2, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0xF2, 11, -8
	banim_frame_oam 0x4000, 0x1000, 0xF6, -5, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 40, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 56, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_52_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0xF2, 11, -8
	banim_frame_oam 0x4000, 0x1000, 0xF6, -5, -8
	banim_frame_oam 0x4000, 0x5000, 0xF2, 43, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 72, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 88, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 87, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_53_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x58, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0xF2, -3, -8
	banim_frame_oam 0x8000, 0x9000, 0x1E, 24, -22
	banim_frame_oam 0x0, 0x5000, 0x1C, 40, -22
	banim_frame_oam 0x8000, 0x9000, 0x1A, 39, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x9000, 0x1A, 55, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x9000, 0xA, 55, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_30_l:
	banim_frame_end
banim_genm_al1_2_oam_frame_33_l:
	banim_frame_oam 0x4000, 0x9000, 0xDC, 8, -31
	banim_frame_oam 0x4000, 0x1000, 0x5E, 24, -15
	banim_frame_oam 0x4000, 0x1000, 0x7E, 8, -15
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_36_l:
	banim_frame_oam 0x0, 0x9000, 0x48, 5, -55
	banim_frame_oam 0x4000, 0x1000, 0xC9, 9, -23
	banim_frame_oam 0x0, 0x5000, 0x4C, -11, -53
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x4E, 16, -48
	banim_frame_oam 0x8000, 0x1000, 0x92, 8, -30
	banim_frame_oam 0x4000, 0x1000, 0x30, 14, -56
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x57, 13, -29
	banim_frame_oam 0x0, 0x1000, 0x5B, 5, -29
	banim_frame_oam 0x0, 0x1000, 0x3A, 9, -37
	banim_frame_oam 0x8000, 0x1000, 0x17, 37, -45
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_39_l:
	banim_frame_oam 0x0, 0xA000, 0x48, -3, -28
	banim_frame_oam 0x4000, 0x2000, 0xC9, 9, -36
	banim_frame_oam 0x0, 0x6000, 0x4C, 29, -14
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_34_l:
	banim_frame_oam 0x0, 0xA000, 0x4E, -15, -35
	banim_frame_oam 0x8000, 0x2000, 0x92, 17, -37
	banim_frame_oam 0x4000, 0x2000, 0x30, 3, -3
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_35_l:
	banim_frame_oam 0x0, 0xA000, 0x57, -12, -53
	banim_frame_oam 0x0, 0x2000, 0x5B, 20, -29
	banim_frame_oam 0x0, 0x2000, 0x3A, 16, -21
	banim_frame_oam 0x8000, 0x2000, 0x17, -12, -21
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x93, -34, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -34, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -18, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -42, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -42, -3
	banim_frame_oam 0x4000, 0x1000, 0x3E, -43, -14
	banim_frame_oam 0x0, 0xA000, 0x4E, -70, -17
	banim_frame_oam 0x8000, 0x2000, 0x92, -38, -19
	banim_frame_oam 0x4000, 0x2000, 0x30, -52, 15
	banim_frame_oam 0x8000, 0x1000, 0xCB, -2, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0x93, -34, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -34, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -18, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -42, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -42, -3
	banim_frame_oam 0x4000, 0x1000, 0x3E, -43, -14
	banim_frame_oam 0x0, 0xA000, 0x57, -66, -36
	banim_frame_oam 0x0, 0x2000, 0x5B, -34, -12
	banim_frame_oam 0x0, 0x2000, 0x3A, -38, -4
	banim_frame_oam 0x8000, 0x2000, 0x17, -66, -4
	banim_frame_oam 0x8000, 0x1000, 0xCB, -2, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x48, -50, -38
	banim_frame_oam 0x4000, 0x1000, 0xC9, -46, -6
	banim_frame_oam 0x0, 0x5000, 0x4C, -66, -36
	banim_frame_oam 0x0, 0x9000, 0x93, -34, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -34, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -18, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -42, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -42, -3
	banim_frame_oam 0x4000, 0x1000, 0x3E, -43, -14
	banim_frame_oam 0x8000, 0x1000, 0xCB, -2, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_43_l:
	banim_frame_oam 0x0, 0x9000, 0x4E, -43, -31
	banim_frame_oam 0x8000, 0x1000, 0x92, -51, -13
	banim_frame_oam 0x4000, 0x1000, 0x30, -45, -39
	banim_frame_oam 0x0, 0x9000, 0x93, -34, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -34, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -18, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -42, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -42, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -13
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -13
	banim_frame_oam 0x8000, 0x1000, 0xCB, -2, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x57, -49, -16
	banim_frame_oam 0x0, 0x1000, 0x5B, -57, -16
	banim_frame_oam 0x0, 0x1000, 0x3A, -53, -24
	banim_frame_oam 0x8000, 0x1000, 0x17, -25, -32
	banim_frame_oam 0x0, 0x9000, 0x93, -34, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -34, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -18, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -42, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -42, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -13
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -13
	banim_frame_oam 0x8000, 0x1000, 0xCB, -2, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_45_l:
	banim_frame_oam 0x0, 0xA000, 0x48, -63, -12
	banim_frame_oam 0x4000, 0x2000, 0xC9, -51, -20
	banim_frame_oam 0x0, 0x6000, 0x4C, -31, 2
	banim_frame_oam 0x0, 0x9000, 0x93, -34, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -34, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -18, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -42, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -42, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -13
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -13
	banim_frame_oam 0x8000, 0x1000, 0xCB, -2, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_46_l:
	banim_frame_oam 0x0, 0xA000, 0x4E, -73, -19
	banim_frame_oam 0x8000, 0x2000, 0x92, -41, -21
	banim_frame_oam 0x4000, 0x2000, 0x30, -55, 13
	banim_frame_oam 0x0, 0x9000, 0x93, -34, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -34, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -18, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -42, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -42, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -13
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -13
	banim_frame_oam 0x8000, 0x1000, 0xCB, -2, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_47_l:
	banim_frame_oam 0x0, 0xA000, 0x57, -71, -36
	banim_frame_oam 0x0, 0x2000, 0x5B, -39, -12
	banim_frame_oam 0x0, 0x2000, 0x3A, -43, -4
	banim_frame_oam 0x8000, 0x2000, 0x17, -71, -4
	banim_frame_oam 0x0, 0x9000, 0x93, -34, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -34, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -18, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -42, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -42, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -13
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -13
	banim_frame_oam 0x8000, 0x1000, 0xCB, -2, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_48_l:
	banim_frame_oam 0x0, 0x9000, 0x48, -55, -38
	banim_frame_oam 0x4000, 0x1000, 0xC9, -51, -6
	banim_frame_oam 0x0, 0x5000, 0x4C, -71, -36
	banim_frame_oam 0x0, 0x9000, 0x93, -34, -13
	banim_frame_oam 0x0, 0x5000, 0x55, -34, -29
	banim_frame_oam 0x0, 0x5000, 0xCC, -18, -29
	banim_frame_oam 0x0, 0x1000, 0x36, -42, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -42, -3
	banim_frame_oam 0x4000, 0x1000, 0x1D, -41, -13
	banim_frame_oam 0x0, 0x1000, 0x1F, -49, -13
	banim_frame_oam 0x8000, 0x1000, 0xCB, -2, -13
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_genm_al1_2_oam_r:
banim_genm_al1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x84, 16, -4
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, -16
	banim_frame_oam 0x0, 0x8000, 0x86, -36, -30
	banim_frame_oam 0x0, 0x0, 0x2B, -16, 10
	banim_frame_end
banim_genm_al1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0xC000, 0xC, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x10, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x90, 16, -4
	banim_frame_oam 0x8000, 0x0, 0x4A, -9, -15
	banim_frame_oam 0x0, 0x8000, 0x86, -31, -29
	banim_frame_end
banim_genm_al1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0xC000, 0x16, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x1A, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x9A, 16, -4
	banim_frame_oam 0x0, 0x8000, 0x9C, -18, -28
	banim_frame_end
banim_genm_al1_2_oam_frame_3_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -10, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 22, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 22, -5
	banim_frame_oam 0x0, 0x8000, 0x46, -1, -25
	banim_frame_oam 0x0, 0x0, 0xC6, 31, -9
	banim_frame_end
banim_genm_al1_2_oam_frame_4_r:
	banim_frame_oam 0x8000, 0xC000, 0xC, -6, -37
	banim_frame_oam 0x8000, 0x8000, 0x10, 26, -37
	banim_frame_oam 0x8000, 0x8000, 0x90, 26, -5
	banim_frame_oam 0x0, 0x8000, 0x46, 8, -27
	banim_frame_oam 0x0, 0x0, 0xC6, 40, -11
	banim_frame_end
banim_genm_al1_2_oam_frame_5_r:
	banim_frame_oam 0x8000, 0xC000, 0x16, -5, -37
	banim_frame_oam 0x8000, 0x8000, 0x1A, 27, -37
	banim_frame_oam 0x8000, 0x8000, 0x9A, 27, -5
	banim_frame_oam 0x0, 0x8000, 0x46, 14, -24
	banim_frame_oam 0x0, 0x0, 0xC6, 46, -8
	banim_frame_end
banim_genm_al1_2_oam_frame_6_r:
	banim_frame_oam 0x8000, 0xC000, 0x1C, -5, -37
	banim_frame_oam 0x8000, 0x8000, 0xA, 27, -37
	banim_frame_oam 0x8000, 0x8000, 0x8A, 27, -5
	banim_frame_oam 0x0, 0x8000, 0x46, 14, -24
	banim_frame_oam 0x0, 0x0, 0xC6, 46, -8
	banim_frame_end
banim_genm_al1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x26, -5, -29
	banim_frame_oam 0x8000, 0x8000, 0x2A, 27, -29
	banim_frame_oam 0x4000, 0x8000, 0xA6, -5, 3
	banim_frame_oam 0x0, 0x4000, 0xAA, 27, 3
	banim_frame_oam 0x4000, 0x4000, 0xE6, -5, 19
	banim_frame_oam 0x4000, 0x0, 0xEA, 27, 19
	banim_frame_oam 0x0, 0x8000, 0x96, 14, -24
	banim_frame_oam 0x0, 0x0, 0x9C, 46, -8
	banim_frame_end
banim_genm_al1_2_oam_frame_8_r:
	banim_frame_oam 0x8000, 0xC000, 0xC, -5, -37
	banim_frame_oam 0x8000, 0x8000, 0x10, 27, -37
	banim_frame_oam 0x8000, 0x8000, 0x90, 27, -5
	banim_frame_oam 0x0, 0x8000, 0x16, 4, -31
	banim_frame_end
banim_genm_al1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x1C, -30, -24
	banim_frame_oam 0x0, 0x4000, 0x9E, -46, -16
	banim_frame_oam 0x0, 0x0, 0x9D, -54, -12
	banim_frame_oam 0x0, 0x4000, 0xBC, -22, -40
	banim_frame_oam 0x4000, 0x0, 0xDE, -30, 8
	banim_frame_oam 0x8000, 0xC000, 0x0, -9, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 23, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 23, -5
	banim_frame_oam 0x4000, 0x0, 0xFC, 24, -12
	banim_frame_oam 0x0, 0x0, 0xFE, 40, -12
	banim_frame_end
banim_genm_al1_2_oam_frame_10_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0xDE, -1, -16
	banim_frame_oam 0x8000, 0x8000, 0xE, -56, -22
	banim_frame_oam 0x0, 0x4000, 0xC, -72, -22
	banim_frame_oam 0x4000, 0x0, 0xC6, -11, -8
	banim_frame_oam 0x4000, 0x4000, 0xA6, -43, -8
	banim_frame_end
banim_genm_al1_2_oam_frame_11_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x4000, 0x8000, 0x46, -47, -27
	banim_frame_oam 0x4000, 0x0, 0x8, -16, -11
	banim_frame_oam 0x0, 0x0, 0x28, -47, -11
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_12_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0xA6, -49, -6
	banim_frame_oam 0x4000, 0x4000, 0x86, -49, -14
	banim_frame_oam 0x4000, 0x0, 0xE6, -17, -13
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_13_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x8000, 0x8000, 0xA, -48, -9
	banim_frame_oam 0x0, 0x4000, 0xC, -32, -9
	banim_frame_oam 0x0, 0x0, 0x4C, -32, 7
	banim_frame_oam 0x4000, 0x0, 0x6C, -16, -9
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_14_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0xCA, -30, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -46, 10
	banim_frame_oam 0x4000, 0x4000, 0xA9, -38, -6
	banim_frame_oam 0x0, 0x0, 0xA8, -46, -10
	banim_frame_oam 0x0, 0x0, 0xC9, -6, -6
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_15_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0xCD, -44, 0
	banim_frame_oam 0x0, 0x0, 0xAD, -44, -8
	banim_frame_oam 0x4000, 0x0, 0xEF, -28, 8
	banim_frame_oam 0x8000, 0x0, 0xD1, -12, 0
	banim_frame_oam 0x8000, 0x0, 0xB2, -4, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_16_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0xE, -47, 0
	banim_frame_oam 0x4000, 0x4000, 0x30, -31, 8
	banim_frame_oam 0x0, 0x0, 0x11, -7, 0
	banim_frame_oam 0x0, 0x0, 0x12, -3, -8
	banim_frame_oam 0x0, 0x0, 0x10, -47, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_17_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0x6E, -44, 1
	banim_frame_oam 0x0, 0x0, 0x4E, -44, -7
	banim_frame_oam 0x4000, 0x0, 0x90, -28, 9
	banim_frame_oam 0x8000, 0x0, 0x72, -12, 1
	banim_frame_oam 0x8000, 0x0, 0x51, -4, -7
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_18_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x8000, 0x34, -41, -1
	banim_frame_oam 0x4000, 0x0, 0x14, -49, -9
	banim_frame_oam 0x8000, 0x0, 0x18, -9, -9
	banim_frame_oam 0x4000, 0x0, 0x16, -9, -17
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_19_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0x75, -20, -14
	banim_frame_oam 0x4000, 0x0, 0x93, -36, -4
	banim_frame_oam 0x0, 0x0, 0x73, -44, -8
	banim_frame_oam 0x0, 0x0, 0x97, -4, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_20_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x0, 0xB5, -28, -15
	banim_frame_oam 0x4000, 0x0, 0xB3, -44, -13
	banim_frame_oam 0x4000, 0x0, 0xB7, -12, -12
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_21_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x4000, 0xD3, -46, -8
	banim_frame_oam 0x4000, 0x0, 0xD7, -14, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_22_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x4000, 0xF2, -43, -8
	banim_frame_oam 0x4000, 0x0, 0xF6, -11, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0x9E, -4, -27
	banim_frame_oam 0x4000, 0x0, 0xCF, 4, -11
	banim_frame_oam 0x0, 0x4000, 0xDE, -4, -3
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x8000, 0x8000, 0x1E, 3, -24
	banim_frame_oam 0x0, 0x4000, 0x1C, -13, -24
	banim_frame_oam 0x8000, 0x0, 0x5D, -5, -8
	banim_frame_oam 0x8000, 0x8000, 0x1A, -11, -24
	banim_frame_end
banim_genm_al1_2_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -3, -29
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -29
	banim_frame_oam 0x4000, 0x8000, 0x80, -3, 3
	banim_frame_oam 0x0, 0x4000, 0x84, 29, 3
	banim_frame_oam 0x0, 0x4000, 0x4A, 6, -18
	banim_frame_oam 0x0, 0x8000, 0x86, -16, -32
	banim_frame_end
banim_genm_al1_2_oam_frame_25_r:
	banim_frame_oam 0x8000, 0xC000, 0xE, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x12, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x92, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x4A, 4, -17
	banim_frame_oam 0x0, 0x8000, 0x86, -18, -31
	banim_frame_end
banim_genm_al1_2_oam_frame_26_r:
	banim_frame_oam 0x8000, 0xC000, 0x14, -11, -37
	banim_frame_oam 0x8000, 0x8000, 0x18, 21, -37
	banim_frame_oam 0x8000, 0x8000, 0x98, 21, -5
	banim_frame_oam 0x0, 0x4000, 0x4A, 2, -17
	banim_frame_oam 0x0, 0x8000, 0x86, -20, -31
	banim_frame_end
banim_genm_al1_2_oam_frame_27_r:
	banim_frame_oam 0x8000, 0xC000, 0x1A, -16, -37
	banim_frame_oam 0x8000, 0x8000, 0x1E, 16, -37
	banim_frame_oam 0x8000, 0x8000, 0x9E, 16, -5
	banim_frame_oam 0x0, 0x4000, 0x4A, -10, -19
	banim_frame_oam 0x0, 0x8000, 0x86, -32, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_28_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x84, 16, -4
	banim_frame_oam 0x0, 0x4000, 0x92, -14, -18
	banim_frame_oam 0x0, 0x8000, 0x10, -36, -32
	banim_frame_end
banim_genm_al1_2_oam_frame_29_r:
	banim_frame_oam 0x0, 0x4000, 0x92, -15, -18
	banim_frame_oam 0x0, 0x8000, 0x10, -37, -32
	banim_frame_oam 0x8000, 0xC000, 0xA, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0xE, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x8E, 16, -4
	banim_frame_end
banim_genm_al1_2_oam_frame_49_r:
	banim_frame_oam 0x8000, 0x8000, 0x8E, -19, -25
	banim_frame_oam 0x0, 0x0, 0x6C, -27, -10
	banim_frame_oam 0x0, 0x8000, 0x50, -20, -33
	banim_frame_oam 0x8000, 0x8000, 0x54, 12, -33
	banim_frame_oam 0x4000, 0x8000, 0xD0, -20, -1
	banim_frame_oam 0x0, 0x4000, 0xD4, 12, -1
	banim_frame_end
banim_genm_al1_2_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x8A, -21, -16
	banim_frame_oam 0x0, 0x8000, 0x56, -20, -33
	banim_frame_oam 0x8000, 0x8000, 0x5A, 12, -33
	banim_frame_oam 0x4000, 0x8000, 0xD6, -20, -1
	banim_frame_oam 0x0, 0x4000, 0xDA, 12, -1
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_genm_al1_2_oam_frame_51_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0xDE, -1, -16
	banim_frame_oam 0x4000, 0x0, 0xC6, -11, -8
	banim_frame_oam 0x4000, 0x4000, 0xA6, -43, -8
	banim_frame_oam 0x8000, 0x8000, 0xA, -71, -22
	banim_frame_oam 0x8000, 0x8000, 0xE, -56, -22
	banim_frame_oam 0x0, 0x4000, 0xC, -72, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x4000, 0x8000, 0x46, -47, -27
	banim_frame_oam 0x4000, 0x0, 0x8, -16, -11
	banim_frame_oam 0x0, 0x0, 0x28, -47, -11
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0xA6, -49, -6
	banim_frame_oam 0x4000, 0x4000, 0x86, -49, -14
	banim_frame_oam 0x4000, 0x0, 0xE6, -17, -13
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x8000, 0x8000, 0xA, -48, -9
	banim_frame_oam 0x0, 0x4000, 0xC, -32, -9
	banim_frame_oam 0x0, 0x0, 0x4C, -32, 7
	banim_frame_oam 0x4000, 0x0, 0x6C, -16, -9
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0xCA, -30, 2
	banim_frame_oam 0x4000, 0x0, 0xE8, -46, 10
	banim_frame_oam 0x4000, 0x4000, 0xA9, -38, -6
	banim_frame_oam 0x0, 0x0, 0xA8, -46, -10
	banim_frame_oam 0x0, 0x0, 0xC9, -6, -6
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0xCD, -44, 0
	banim_frame_oam 0x0, 0x0, 0xAD, -44, -8
	banim_frame_oam 0x4000, 0x0, 0xEF, -28, 8
	banim_frame_oam 0x8000, 0x0, 0xD1, -12, 0
	banim_frame_oam 0x8000, 0x0, 0xB2, -4, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0xE, -47, 0
	banim_frame_oam 0x4000, 0x4000, 0x30, -31, 8
	banim_frame_oam 0x0, 0x0, 0x11, -7, 0
	banim_frame_oam 0x0, 0x0, 0x12, -3, -8
	banim_frame_oam 0x0, 0x0, 0x10, -47, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0x6E, -44, 1
	banim_frame_oam 0x0, 0x0, 0x4E, -44, -7
	banim_frame_oam 0x4000, 0x0, 0x90, -28, 9
	banim_frame_oam 0x8000, 0x0, 0x72, -12, 1
	banim_frame_oam 0x8000, 0x0, 0x51, -4, -7
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x8000, 0x34, -41, -1
	banim_frame_oam 0x4000, 0x0, 0x14, -49, -9
	banim_frame_oam 0x8000, 0x0, 0x18, -9, -9
	banim_frame_oam 0x4000, 0x0, 0x16, -9, -17
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x0, 0x4000, 0x75, -20, -14
	banim_frame_oam 0x4000, 0x0, 0x93, -36, -4
	banim_frame_oam 0x0, 0x0, 0x73, -44, -8
	banim_frame_oam 0x0, 0x0, 0x97, -4, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x0, 0xB5, -28, -15
	banim_frame_oam 0x4000, 0x0, 0xB3, -44, -13
	banim_frame_oam 0x4000, 0x0, 0xB7, -12, -12
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x4000, 0xD3, -46, -8
	banim_frame_oam 0x4000, 0x0, 0xD7, -14, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x4000, 0xF2, -43, -8
	banim_frame_oam 0x4000, 0x0, 0xF6, -11, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -56, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -72, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_52_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x4000, 0xF2, -43, -8
	banim_frame_oam 0x4000, 0x0, 0xF6, -11, -8
	banim_frame_oam 0x4000, 0x4000, 0xF2, -75, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -88, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -104, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -103, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_53_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x58, -1, -16
	banim_frame_oam 0x4000, 0x4000, 0xF2, -29, -8
	banim_frame_oam 0x8000, 0x8000, 0x1E, -40, -22
	banim_frame_oam 0x0, 0x4000, 0x1C, -56, -22
	banim_frame_oam 0x8000, 0x8000, 0x1A, -55, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x8000, 0x1A, -71, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x8000, 0xA, -71, -22
	banim_frame_end
banim_genm_al1_2_oam_frame_30_r:
	banim_frame_end
banim_genm_al1_2_oam_frame_33_r:
	banim_frame_oam 0x4000, 0x8000, 0xDC, -40, -31
	banim_frame_oam 0x4000, 0x0, 0x5E, -40, -15
	banim_frame_oam 0x4000, 0x0, 0x7E, -24, -15
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_36_r:
	banim_frame_oam 0x0, 0x8000, 0x48, -37, -55
	banim_frame_oam 0x4000, 0x0, 0xC9, -25, -23
	banim_frame_oam 0x0, 0x4000, 0x4C, -5, -53
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x4E, -48, -48
	banim_frame_oam 0x8000, 0x0, 0x92, -16, -30
	banim_frame_oam 0x4000, 0x0, 0x30, -30, -56
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x57, -45, -29
	banim_frame_oam 0x0, 0x0, 0x5B, -13, -29
	banim_frame_oam 0x0, 0x0, 0x3A, -17, -37
	banim_frame_oam 0x8000, 0x0, 0x17, -45, -45
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_39_r:
	banim_frame_oam 0x0, 0xB000, 0x48, -29, -28
	banim_frame_oam 0x4000, 0x3000, 0xC9, -25, -36
	banim_frame_oam 0x0, 0x7000, 0x4C, -45, -14
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_34_r:
	banim_frame_oam 0x0, 0xB000, 0x4E, -17, -35
	banim_frame_oam 0x8000, 0x3000, 0x92, -25, -37
	banim_frame_oam 0x4000, 0x3000, 0x30, -19, -3
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_35_r:
	banim_frame_oam 0x0, 0xB000, 0x57, -20, -53
	banim_frame_oam 0x0, 0x3000, 0x5B, -28, -29
	banim_frame_oam 0x0, 0x3000, 0x3A, -24, -21
	banim_frame_oam 0x8000, 0x3000, 0x17, 4, -21
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_2_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x93, 2, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 18, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 2, -29
	banim_frame_oam 0x0, 0x0, 0x36, 34, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 34, -3
	banim_frame_oam 0x4000, 0x0, 0x3E, 27, -14
	banim_frame_oam 0x0, 0xB000, 0x4E, 38, -17
	banim_frame_oam 0x8000, 0x3000, 0x92, 30, -19
	banim_frame_oam 0x4000, 0x3000, 0x30, 36, 15
	banim_frame_oam 0x8000, 0x0, 0xCB, -6, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0x93, 2, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 18, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 2, -29
	banim_frame_oam 0x0, 0x0, 0x36, 34, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 34, -3
	banim_frame_oam 0x4000, 0x0, 0x3E, 27, -14
	banim_frame_oam 0x0, 0xB000, 0x57, 34, -36
	banim_frame_oam 0x0, 0x3000, 0x5B, 26, -12
	banim_frame_oam 0x0, 0x3000, 0x3A, 30, -4
	banim_frame_oam 0x8000, 0x3000, 0x17, 58, -4
	banim_frame_oam 0x8000, 0x0, 0xCB, -6, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x48, 18, -38
	banim_frame_oam 0x4000, 0x0, 0xC9, 30, -6
	banim_frame_oam 0x0, 0x4000, 0x4C, 50, -36
	banim_frame_oam 0x0, 0x8000, 0x93, 2, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 18, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 2, -29
	banim_frame_oam 0x0, 0x0, 0x36, 34, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 34, -3
	banim_frame_oam 0x4000, 0x0, 0x3E, 27, -14
	banim_frame_oam 0x8000, 0x0, 0xCB, -6, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_43_r:
	banim_frame_oam 0x0, 0x8000, 0x4E, 11, -31
	banim_frame_oam 0x8000, 0x0, 0x92, 43, -13
	banim_frame_oam 0x4000, 0x0, 0x30, 29, -39
	banim_frame_oam 0x0, 0x8000, 0x93, 2, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 18, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 2, -29
	banim_frame_oam 0x0, 0x0, 0x36, 34, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 34, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -13
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -13
	banim_frame_oam 0x8000, 0x0, 0xCB, -6, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x57, 17, -16
	banim_frame_oam 0x0, 0x0, 0x5B, 49, -16
	banim_frame_oam 0x0, 0x0, 0x3A, 45, -24
	banim_frame_oam 0x8000, 0x0, 0x17, 17, -32
	banim_frame_oam 0x0, 0x8000, 0x93, 2, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 18, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 2, -29
	banim_frame_oam 0x0, 0x0, 0x36, 34, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 34, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -13
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -13
	banim_frame_oam 0x8000, 0x0, 0xCB, -6, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_45_r:
	banim_frame_oam 0x0, 0xB000, 0x48, 31, -12
	banim_frame_oam 0x4000, 0x3000, 0xC9, 35, -20
	banim_frame_oam 0x0, 0x7000, 0x4C, 15, 2
	banim_frame_oam 0x0, 0x8000, 0x93, 2, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 18, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 2, -29
	banim_frame_oam 0x0, 0x0, 0x36, 34, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 34, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -13
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -13
	banim_frame_oam 0x8000, 0x0, 0xCB, -6, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_46_r:
	banim_frame_oam 0x0, 0xB000, 0x4E, 41, -19
	banim_frame_oam 0x8000, 0x3000, 0x92, 33, -21
	banim_frame_oam 0x4000, 0x3000, 0x30, 39, 13
	banim_frame_oam 0x0, 0x8000, 0x93, 2, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 18, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 2, -29
	banim_frame_oam 0x0, 0x0, 0x36, 34, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 34, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -13
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -13
	banim_frame_oam 0x8000, 0x0, 0xCB, -6, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_47_r:
	banim_frame_oam 0x0, 0xB000, 0x57, 39, -36
	banim_frame_oam 0x0, 0x3000, 0x5B, 31, -12
	banim_frame_oam 0x0, 0x3000, 0x3A, 35, -4
	banim_frame_oam 0x8000, 0x3000, 0x17, 63, -4
	banim_frame_oam 0x0, 0x8000, 0x93, 2, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 18, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 2, -29
	banim_frame_oam 0x0, 0x0, 0x36, 34, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 34, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -13
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -13
	banim_frame_oam 0x8000, 0x0, 0xCB, -6, -13
	banim_frame_end
banim_genm_al1_2_oam_frame_48_r:
	banim_frame_oam 0x0, 0x8000, 0x48, 23, -38
	banim_frame_oam 0x4000, 0x0, 0xC9, 35, -6
	banim_frame_oam 0x0, 0x4000, 0x4C, 55, -36
	banim_frame_oam 0x0, 0x8000, 0x93, 2, -13
	banim_frame_oam 0x0, 0x4000, 0x55, 18, -29
	banim_frame_oam 0x0, 0x4000, 0xCC, 2, -29
	banim_frame_oam 0x0, 0x0, 0x36, 34, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 34, -3
	banim_frame_oam 0x4000, 0x0, 0x1D, 25, -13
	banim_frame_oam 0x0, 0x0, 0x1F, 41, -13
	banim_frame_oam 0x8000, 0x0, 0xCB, -6, -13
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_genm_al1_2_script:
banim_genm_al1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_1, 3, banim_genm_al1_2_oam_frame_3_r - banim_genm_al1_2_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_1, 4, banim_genm_al1_2_oam_frame_4_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_1, 5, banim_genm_al1_2_oam_frame_5_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_heavily
	banim_code_frame 4, banim_genm_al1_sheet_1, 6, banim_genm_al1_2_oam_frame_6_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 30, banim_genm_al1_sheet_2, 7, banim_genm_al1_2_oam_frame_7_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 10, banim_genm_al1_2_oam_frame_10_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_2_oam_frame_11_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_2_oam_frame_12_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_2_oam_frame_13_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_2_oam_frame_14_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_2_oam_frame_15_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_2_oam_frame_16_r - banim_genm_al1_2_oam_r
	banim_code_frame 20, banim_genm_al1_sheet_4, 17, banim_genm_al1_2_oam_frame_17_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_2_oam_frame_18_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_2_oam_frame_19_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_2_oam_frame_22_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_heavily
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 30, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 50, banim_genm_al1_2_oam_frame_31_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 20, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_genm_al1_sheet_8, 52, banim_genm_al1_2_oam_frame_33_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_al1_sheet_7, 59, banim_genm_al1_2_oam_frame_40_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 60, banim_genm_al1_2_oam_frame_41_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 61, banim_genm_al1_2_oam_frame_42_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 10, banim_genm_al1_2_oam_frame_10_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_2_oam_frame_11_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_2_oam_frame_12_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_2_oam_frame_13_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_2_oam_frame_14_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_2_oam_frame_15_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_2_oam_frame_16_r - banim_genm_al1_2_oam_r
	banim_code_frame 53, banim_genm_al1_sheet_4, 17, banim_genm_al1_2_oam_frame_17_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_2_oam_frame_18_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_2_oam_frame_19_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_2_oam_frame_22_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 50, banim_genm_al1_2_oam_frame_31_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 53, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 49, banim_genm_al1_2_oam_frame_32_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_0, 51, banim_genm_al1_2_oam_frame_30_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_1, 3, banim_genm_al1_2_oam_frame_3_r - banim_genm_al1_2_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_1, 4, banim_genm_al1_2_oam_frame_4_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_1, 5, banim_genm_al1_2_oam_frame_5_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_heavily
	banim_code_frame 4, banim_genm_al1_sheet_1, 6, banim_genm_al1_2_oam_frame_6_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 30, banim_genm_al1_sheet_2, 7, banim_genm_al1_2_oam_frame_7_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 10, banim_genm_al1_2_oam_frame_10_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_2_oam_frame_11_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_2_oam_frame_12_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_2_oam_frame_13_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_2_oam_frame_14_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_2_oam_frame_15_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_2_oam_frame_16_r - banim_genm_al1_2_oam_r
	banim_code_frame 20, banim_genm_al1_sheet_4, 17, banim_genm_al1_2_oam_frame_17_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_2_oam_frame_18_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_2_oam_frame_19_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_2_oam_frame_22_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 16, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_genm_al1_sheet_8, 52, banim_genm_al1_2_oam_frame_33_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 53, banim_genm_al1_2_oam_frame_36_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 54, banim_genm_al1_2_oam_frame_37_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 55, banim_genm_al1_2_oam_frame_38_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 56, banim_genm_al1_2_oam_frame_39_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 57, banim_genm_al1_2_oam_frame_34_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 58, banim_genm_al1_2_oam_frame_35_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_genm_al1_sheet_7, 59, banim_genm_al1_2_oam_frame_40_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 60, banim_genm_al1_2_oam_frame_41_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 61, banim_genm_al1_2_oam_frame_42_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 62, banim_genm_al1_2_oam_frame_43_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 63, banim_genm_al1_2_oam_frame_44_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 64, banim_genm_al1_2_oam_frame_45_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 65, banim_genm_al1_2_oam_frame_46_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 66, banim_genm_al1_2_oam_frame_47_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 67, banim_genm_al1_2_oam_frame_48_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 10, banim_genm_al1_2_oam_frame_10_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_hit_normal
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_genm_al1_sheet_4, 11, banim_genm_al1_2_oam_frame_11_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_4, 12, banim_genm_al1_2_oam_frame_12_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 13, banim_genm_al1_2_oam_frame_13_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 14, banim_genm_al1_2_oam_frame_14_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 6, banim_genm_al1_sheet_4, 15, banim_genm_al1_2_oam_frame_15_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 16, banim_genm_al1_2_oam_frame_16_r - banim_genm_al1_2_oam_r
	banim_code_frame 53, banim_genm_al1_sheet_4, 17, banim_genm_al1_2_oam_frame_17_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 6, banim_genm_al1_sheet_4, 18, banim_genm_al1_2_oam_frame_18_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 19, banim_genm_al1_2_oam_frame_19_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 20, banim_genm_al1_2_oam_frame_20_r - banim_genm_al1_2_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_4, 21, banim_genm_al1_2_oam_frame_21_r - banim_genm_al1_2_oam_r
	banim_code_frame 6, banim_genm_al1_sheet_4, 22, banim_genm_al1_2_oam_frame_22_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_2_oam_frame_49_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 31, banim_genm_al1_2_oam_frame_50_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_2_oam_frame_49_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_2_oam_frame_49_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 31, banim_genm_al1_2_oam_frame_50_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 30, banim_genm_al1_2_oam_frame_49_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_2_mode_stand_close:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_2_mode_stand:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_2_mode_stand_range:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_2_oam_frame_0_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 1, banim_genm_al1_2_oam_frame_1_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_0, 2, banim_genm_al1_2_oam_frame_2_r - banim_genm_al1_2_oam_r
	banim_code_frame 5, banim_genm_al1_sheet_1, 3, banim_genm_al1_2_oam_frame_3_r - banim_genm_al1_2_oam_r
	banim_code_frame 7, banim_genm_al1_sheet_1, 4, banim_genm_al1_2_oam_frame_4_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_1, 5, banim_genm_al1_2_oam_frame_5_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_heavily
	banim_code_frame 4, banim_genm_al1_sheet_1, 6, banim_genm_al1_2_oam_frame_6_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_genm_al1_sheet_2, 7, banim_genm_al1_2_oam_frame_7_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_2, 8, banim_genm_al1_2_oam_frame_8_r - banim_genm_al1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_2, 9, banim_genm_al1_2_oam_frame_9_r - banim_genm_al1_2_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_3, 34, banim_genm_al1_2_oam_frame_51_r - banim_genm_al1_2_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_4, 47, banim_genm_al1_2_oam_frame_52_r - banim_genm_al1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_4, 48, banim_genm_al1_2_oam_frame_53_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_4, 23, banim_genm_al1_2_oam_frame_23_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 36, banim_genm_al1_sheet_5, 24, banim_genm_al1_2_oam_frame_24_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 25, banim_genm_al1_2_oam_frame_25_r - banim_genm_al1_2_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 26, banim_genm_al1_2_oam_frame_26_r - banim_genm_al1_2_oam_r
	banim_code_shake_screnn_heavily
	banim_code_frame 10, banim_genm_al1_sheet_5, 27, banim_genm_al1_2_oam_frame_27_r - banim_genm_al1_2_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 8, banim_genm_al1_sheet_6, 28, banim_genm_al1_2_oam_frame_28_r - banim_genm_al1_2_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_6, 29, banim_genm_al1_2_oam_frame_29_r - banim_genm_al1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_genm_al1_2_mode_attack_close - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_attack_close_back - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_attack_close_critical - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_attack_close_critical_back - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_attack_range - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_attack_range_critical - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_dodge_close - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_dodge_range - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_stand_close - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_stand - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_stand_range - banim_genm_al1_2_script
	.word banim_genm_al1_2_mode_attack_miss - banim_genm_al1_2_script
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

