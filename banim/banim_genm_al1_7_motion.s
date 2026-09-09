@ vim:ft=armv4
	.global banim_genm_al1_7_script
	.global banim_genm_al1_7_oam_r
	.global banim_genm_al1_7_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x4B
	.section .data.oam_l
banim_genm_al1_7_oam_l:
banim_genm_al1_7_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xCA, 2, -18
	banim_frame_oam 0x8000, 0x1000, 0x8A, 18, -20
	banim_frame_oam 0x0, 0x1000, 0xAB, 2, -26
	banim_frame_oam 0x0, 0x1000, 0x8B, 10, -26
	banim_frame_oam 0x8000, 0xD000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x84, -32, -4
	banim_frame_oam 0x0, 0x5000, 0x4A, -2, -16
	banim_frame_oam 0x0, 0x1000, 0x2B, 8, 10
	banim_frame_end
banim_genm_al1_7_oam_frame_1_l:
	banim_frame_oam 0x8000, 0xD000, 0xC, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x10, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x90, -32, -4
	banim_frame_oam 0x8000, 0x1000, 0x4A, 2, -15
	banim_frame_oam 0x0, 0x5000, 0xCA, -2, -16
	banim_frame_oam 0x8000, 0x1000, 0x8A, 14, -18
	banim_frame_oam 0x0, 0x1000, 0xAB, -2, -24
	banim_frame_oam 0x0, 0x1000, 0x8B, 6, -24
	banim_frame_end
banim_genm_al1_7_oam_frame_2_l:
	banim_frame_oam 0x8000, 0xD000, 0x16, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x1A, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x9A, -32, -4
	banim_frame_oam 0x0, 0x5000, 0xCA, -13, -15
	banim_frame_oam 0x8000, 0x1000, 0x8A, 3, -17
	banim_frame_oam 0x0, 0x1000, 0xAB, -13, -23
	banim_frame_oam 0x0, 0x1000, 0x8B, -5, -23
	banim_frame_end
banim_genm_al1_7_oam_frame_3_l:
	banim_frame_oam 0x8000, 0xD000, 0x16, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x1A, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x9A, -32, -4
	banim_frame_oam 0x4000, 0x1000, 0xB4, -32, 7
	banim_frame_oam 0x4000, 0x1000, 0x94, 1, 7
	banim_frame_oam 0x8000, 0x0, 0xA, -22, -14
	banim_frame_oam 0x0, 0x5000, 0xCA, -26, -15
	banim_frame_oam 0x8000, 0x1000, 0x8A, -10, -17
	banim_frame_oam 0x0, 0x1000, 0xAB, -26, -23
	banim_frame_oam 0x0, 0x1000, 0x8B, -18, -23
	banim_frame_end
banim_genm_al1_7_oam_frame_4_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -24, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -40, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -40, -5
	banim_frame_oam 0x4000, 0x0, 0xFC, -4, -12
	banim_frame_oam 0x0, 0x0, 0xFE, 12, -12
	banim_frame_oam 0x4000, 0x1000, 0xFC, -43, -13
	banim_frame_oam 0x0, 0x1000, 0xFE, -51, -13
	banim_frame_end
banim_genm_al1_7_oam_frame_5_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -30, -37
	banim_frame_oam 0x8000, 0x9000, 0x4, -46, -37
	banim_frame_oam 0x8000, 0x9000, 0x84, -46, -5
	banim_frame_oam 0x0, 0x5000, 0xDE, -17, -16
	banim_frame_end
banim_genm_al1_7_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0xC1, -16, -17
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -19
	banim_frame_oam 0x4000, 0x1000, 0xC3, -16, -25
	banim_frame_oam 0x0, 0x9000, 0x0, -29, -29
	banim_frame_oam 0x8000, 0x9000, 0x4, -45, -29
	banim_frame_oam 0x4000, 0x9000, 0x80, -29, 3
	banim_frame_oam 0x0, 0x5000, 0x84, -45, 3
	banim_frame_oam 0x0, 0x5000, 0x4C, -20, -15
	banim_frame_end
banim_genm_al1_7_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0xC1, -14, -18
	banim_frame_oam 0x8000, 0x1000, 0xC0, 2, -20
	banim_frame_oam 0x4000, 0x1000, 0xC3, -14, -26
	banim_frame_oam 0x8000, 0xD000, 0xE, -29, -37
	banim_frame_oam 0x8000, 0x9000, 0x12, -45, -37
	banim_frame_oam 0x8000, 0x9000, 0x92, -45, -5
	banim_frame_oam 0x0, 0x5000, 0x4C, -18, -16
	banim_frame_end
banim_genm_al1_7_oam_frame_8_l:
	banim_frame_oam 0x0, 0x5000, 0xC1, -10, -18
	banim_frame_oam 0x8000, 0x1000, 0xC0, 6, -20
	banim_frame_oam 0x4000, 0x1000, 0xC3, -10, -26
	banim_frame_oam 0x8000, 0xD000, 0x14, -21, -37
	banim_frame_oam 0x8000, 0x9000, 0x18, -37, -37
	banim_frame_oam 0x8000, 0x9000, 0x98, -37, -5
	banim_frame_oam 0x0, 0x5000, 0x4C, -14, -16
	banim_frame_end
banim_genm_al1_7_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0xC1, -3, -19
	banim_frame_oam 0x8000, 0x1000, 0xC0, 13, -21
	banim_frame_oam 0x4000, 0x1000, 0xC3, -3, -27
	banim_frame_oam 0x8000, 0xD000, 0x1A, -16, -37
	banim_frame_oam 0x8000, 0x9000, 0x1E, -32, -37
	banim_frame_oam 0x8000, 0x9000, 0x9E, -32, -5
	banim_frame_oam 0x0, 0x5000, 0x4C, -7, -17
	banim_frame_end
banim_genm_al1_7_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0x14, 5, -20
	banim_frame_oam 0x8000, 0x1000, 0x54, 21, -22
	banim_frame_oam 0x4000, 0x1000, 0x16, 5, -28
	banim_frame_oam 0x8000, 0xD000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x84, -32, -4
	banim_frame_oam 0x0, 0x5000, 0x92, 1, -18
	banim_frame_end
banim_genm_al1_7_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0x14, 1, -17
	banim_frame_oam 0x8000, 0x1000, 0x54, 17, -19
	banim_frame_oam 0x4000, 0x1000, 0x16, 1, -25
	banim_frame_oam 0x8000, 0xD000, 0xA, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0xE, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x8E, -32, -4
	banim_frame_oam 0x0, 0x5000, 0x92, -3, -15
	banim_frame_end
banim_genm_al1_7_oam_frame_12_l:
	banim_frame_oam 0x0, 0x7000, 0xD7, 17, -37
	banim_frame_oam 0x4000, 0x3000, 0xD9, 17, -21
	banim_frame_oam 0x0, 0x3000, 0xF9, 9, -31
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_13_l:
	banim_frame_oam 0x0, 0x7000, 0xCF, 11, -43
	banim_frame_oam 0x8000, 0x3000, 0xCE, 27, -39
	banim_frame_oam 0x0, 0x3000, 0xD1, 11, -27
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_14_l:
	banim_frame_oam 0x0, 0x4000, 0xC6, 5, -42
	banim_frame_oam 0x0, 0x0, 0xC8, 21, -42
	banim_frame_oam 0x0, 0x0, 0xE8, 15, -26
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_15_l:
	banim_frame_oam 0x0, 0x4000, 0xD7, 1, -34
	banim_frame_oam 0x4000, 0x0, 0xD9, 1, -42
	banim_frame_oam 0x0, 0x0, 0xF9, 17, -32
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_16_l:
	banim_frame_oam 0x0, 0x4000, 0xCF, 6, -28
	banim_frame_oam 0x8000, 0x0, 0xCE, -2, -32
	banim_frame_oam 0x0, 0x0, 0xD1, 14, -36
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_17_l:
	banim_frame_oam 0x0, 0x7000, 0xC6, 12, -28
	banim_frame_oam 0x0, 0x3000, 0xC8, 4, -20
	banim_frame_oam 0x0, 0x3000, 0xE8, 10, -36
	banim_frame_oam 0x8000, 0xD000, 0x0, -15, -41
	banim_frame_oam 0x8000, 0x9000, 0x4, -31, -41
	banim_frame_oam 0x8000, 0x9000, 0x84, -31, -9
	banim_frame_oam 0x8000, 0x1000, 0x86, 17, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_18_l:
	banim_frame_oam 0x0, 0x5000, 0x15, 4, -14
	banim_frame_oam 0x4000, 0x1000, 0x17, 4, -22
	banim_frame_oam 0x0, 0x9000, 0x50, -12, -33
	banim_frame_oam 0x8000, 0x9000, 0x54, -28, -33
	banim_frame_oam 0x4000, 0x9000, 0xD0, -12, -1
	banim_frame_oam 0x0, 0x5000, 0xD4, -28, -1
	banim_frame_end
banim_genm_al1_7_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0x10, 1, -13
	banim_frame_oam 0x8000, 0x1000, 0x12, -7, -13
	banim_frame_oam 0x0, 0x9000, 0x56, -12, -33
	banim_frame_oam 0x8000, 0x9000, 0x5A, -28, -33
	banim_frame_oam 0x4000, 0x9000, 0xD6, -12, -1
	banim_frame_oam 0x0, 0x5000, 0xDA, -28, -1
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_genm_al1_7_oam_r:
banim_genm_al1_7_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xCA, -18, -18
	banim_frame_oam 0x8000, 0x0, 0x8A, -26, -20
	banim_frame_oam 0x0, 0x0, 0xAB, -10, -26
	banim_frame_oam 0x0, 0x0, 0x8B, -18, -26
	banim_frame_oam 0x8000, 0xC000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x84, 16, -4
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, -16
	banim_frame_oam 0x0, 0x0, 0x2B, -16, 10
	banim_frame_end
banim_genm_al1_7_oam_frame_1_r:
	banim_frame_oam 0x8000, 0xC000, 0xC, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x10, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x90, 16, -4
	banim_frame_oam 0x8000, 0x0, 0x4A, -10, -15
	banim_frame_oam 0x0, 0x4000, 0xCA, -14, -16
	banim_frame_oam 0x8000, 0x0, 0x8A, -22, -18
	banim_frame_oam 0x0, 0x0, 0xAB, -6, -24
	banim_frame_oam 0x0, 0x0, 0x8B, -14, -24
	banim_frame_end
banim_genm_al1_7_oam_frame_2_r:
	banim_frame_oam 0x8000, 0xC000, 0x16, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x1A, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x9A, 16, -4
	banim_frame_oam 0x0, 0x4000, 0xCA, -3, -15
	banim_frame_oam 0x8000, 0x0, 0x8A, -11, -17
	banim_frame_oam 0x0, 0x0, 0xAB, 5, -23
	banim_frame_oam 0x0, 0x0, 0x8B, -3, -23
	banim_frame_end
banim_genm_al1_7_oam_frame_3_r:
	banim_frame_oam 0x8000, 0xC000, 0x16, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x1A, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x9A, 16, -4
	banim_frame_oam 0x4000, 0x0, 0xB4, 16, 7
	banim_frame_oam 0x4000, 0x0, 0x94, -17, 7
	banim_frame_oam 0x8000, 0x1000, 0xA, 14, -14
	banim_frame_oam 0x0, 0x4000, 0xCA, 10, -15
	banim_frame_oam 0x8000, 0x0, 0x8A, 2, -17
	banim_frame_oam 0x0, 0x0, 0xAB, 18, -23
	banim_frame_oam 0x0, 0x0, 0x8B, 10, -23
	banim_frame_end
banim_genm_al1_7_oam_frame_4_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -8, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 24, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 24, -5
	banim_frame_oam 0x4000, 0x1000, 0xFC, -12, -12
	banim_frame_oam 0x0, 0x1000, 0xFE, -20, -12
	banim_frame_oam 0x4000, 0x0, 0xFC, 27, -13
	banim_frame_oam 0x0, 0x0, 0xFE, 43, -13
	banim_frame_end
banim_genm_al1_7_oam_frame_5_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -2, -37
	banim_frame_oam 0x8000, 0x8000, 0x4, 30, -37
	banim_frame_oam 0x8000, 0x8000, 0x84, 30, -5
	banim_frame_oam 0x0, 0x4000, 0xDE, 1, -16
	banim_frame_end
banim_genm_al1_7_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0xC1, 0, -17
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -19
	banim_frame_oam 0x4000, 0x0, 0xC3, 0, -25
	banim_frame_oam 0x0, 0x8000, 0x0, -3, -29
	banim_frame_oam 0x8000, 0x8000, 0x4, 29, -29
	banim_frame_oam 0x4000, 0x8000, 0x80, -3, 3
	banim_frame_oam 0x0, 0x4000, 0x84, 29, 3
	banim_frame_oam 0x0, 0x4000, 0x4C, 4, -15
	banim_frame_end
banim_genm_al1_7_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0xC1, -2, -18
	banim_frame_oam 0x8000, 0x0, 0xC0, -10, -20
	banim_frame_oam 0x4000, 0x0, 0xC3, -2, -26
	banim_frame_oam 0x8000, 0xC000, 0xE, -3, -37
	banim_frame_oam 0x8000, 0x8000, 0x12, 29, -37
	banim_frame_oam 0x8000, 0x8000, 0x92, 29, -5
	banim_frame_oam 0x0, 0x4000, 0x4C, 2, -16
	banim_frame_end
banim_genm_al1_7_oam_frame_8_r:
	banim_frame_oam 0x0, 0x4000, 0xC1, -6, -18
	banim_frame_oam 0x8000, 0x0, 0xC0, -14, -20
	banim_frame_oam 0x4000, 0x0, 0xC3, -6, -26
	banim_frame_oam 0x8000, 0xC000, 0x14, -11, -37
	banim_frame_oam 0x8000, 0x8000, 0x18, 21, -37
	banim_frame_oam 0x8000, 0x8000, 0x98, 21, -5
	banim_frame_oam 0x0, 0x4000, 0x4C, -2, -16
	banim_frame_end
banim_genm_al1_7_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0xC1, -13, -19
	banim_frame_oam 0x8000, 0x0, 0xC0, -21, -21
	banim_frame_oam 0x4000, 0x0, 0xC3, -13, -27
	banim_frame_oam 0x8000, 0xC000, 0x1A, -16, -37
	banim_frame_oam 0x8000, 0x8000, 0x1E, 16, -37
	banim_frame_oam 0x8000, 0x8000, 0x9E, 16, -5
	banim_frame_oam 0x0, 0x4000, 0x4C, -9, -17
	banim_frame_end
banim_genm_al1_7_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0x14, -21, -20
	banim_frame_oam 0x8000, 0x0, 0x54, -29, -22
	banim_frame_oam 0x4000, 0x0, 0x16, -21, -28
	banim_frame_oam 0x8000, 0xC000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x84, 16, -4
	banim_frame_oam 0x0, 0x4000, 0x92, -17, -18
	banim_frame_end
banim_genm_al1_7_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0x14, -17, -17
	banim_frame_oam 0x8000, 0x0, 0x54, -25, -19
	banim_frame_oam 0x4000, 0x0, 0x16, -17, -25
	banim_frame_oam 0x8000, 0xC000, 0xA, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0xE, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x8E, 16, -4
	banim_frame_oam 0x0, 0x4000, 0x92, -13, -15
	banim_frame_end
banim_genm_al1_7_oam_frame_12_r:
	banim_frame_oam 0x0, 0x6000, 0xD7, -33, -37
	banim_frame_oam 0x4000, 0x2000, 0xD9, -33, -21
	banim_frame_oam 0x0, 0x2000, 0xF9, -17, -31
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_13_r:
	banim_frame_oam 0x0, 0x6000, 0xCF, -27, -43
	banim_frame_oam 0x8000, 0x2000, 0xCE, -35, -39
	banim_frame_oam 0x0, 0x2000, 0xD1, -19, -27
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_14_r:
	banim_frame_oam 0x0, 0x5000, 0xC6, -21, -42
	banim_frame_oam 0x0, 0x1000, 0xC8, -29, -42
	banim_frame_oam 0x0, 0x1000, 0xE8, -23, -26
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_15_r:
	banim_frame_oam 0x0, 0x5000, 0xD7, -17, -34
	banim_frame_oam 0x4000, 0x1000, 0xD9, -17, -42
	banim_frame_oam 0x0, 0x1000, 0xF9, -25, -32
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_16_r:
	banim_frame_oam 0x0, 0x5000, 0xCF, -22, -28
	banim_frame_oam 0x8000, 0x1000, 0xCE, -6, -32
	banim_frame_oam 0x0, 0x1000, 0xD1, -22, -36
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_17_r:
	banim_frame_oam 0x0, 0x6000, 0xC6, -28, -28
	banim_frame_oam 0x0, 0x2000, 0xC8, -12, -20
	banim_frame_oam 0x0, 0x2000, 0xE8, -18, -36
	banim_frame_oam 0x8000, 0xC000, 0x0, -17, -41
	banim_frame_oam 0x8000, 0x8000, 0x4, 15, -41
	banim_frame_oam 0x8000, 0x8000, 0x84, 15, -9
	banim_frame_oam 0x8000, 0x0, 0x86, -25, -33
	banim_frame_end
banim_genm_al1_7_oam_frame_18_r:
	banim_frame_oam 0x0, 0x4000, 0x15, -20, -14
	banim_frame_oam 0x4000, 0x0, 0x17, -20, -22
	banim_frame_oam 0x0, 0x8000, 0x50, -20, -33
	banim_frame_oam 0x8000, 0x8000, 0x54, 12, -33
	banim_frame_oam 0x4000, 0x8000, 0xD0, -20, -1
	banim_frame_oam 0x0, 0x4000, 0xD4, 12, -1
	banim_frame_end
banim_genm_al1_7_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0x10, -17, -13
	banim_frame_oam 0x8000, 0x0, 0x12, -1, -13
	banim_frame_oam 0x0, 0x8000, 0x56, -20, -33
	banim_frame_oam 0x8000, 0x8000, 0x5A, 12, -33
	banim_frame_oam 0x4000, 0x8000, 0xD6, -20, -1
	banim_frame_oam 0x0, 0x4000, 0xDA, 12, -1
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_genm_al1_7_script:
banim_genm_al1_7_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_genm_al1_sheet_7, 12, banim_genm_al1_7_oam_frame_12_r - banim_genm_al1_7_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_7, 13, banim_genm_al1_7_oam_frame_13_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 14, banim_genm_al1_7_oam_frame_14_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 15, banim_genm_al1_7_oam_frame_15_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 16, banim_genm_al1_7_oam_frame_16_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 17, banim_genm_al1_7_oam_frame_17_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 12, banim_genm_al1_7_oam_frame_12_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_genm_al1_sheet_7, 13, banim_genm_al1_7_oam_frame_13_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 14, banim_genm_al1_7_oam_frame_14_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 15, banim_genm_al1_7_oam_frame_15_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 16, banim_genm_al1_7_oam_frame_16_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 17, banim_genm_al1_7_oam_frame_17_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_genm_al1_sheet_7, 12, banim_genm_al1_7_oam_frame_12_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 13, banim_genm_al1_7_oam_frame_13_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 14, banim_genm_al1_7_oam_frame_14_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 15, banim_genm_al1_7_oam_frame_15_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 16, banim_genm_al1_7_oam_frame_16_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_7, 17, banim_genm_al1_7_oam_frame_17_r - banim_genm_al1_7_oam_r
	banim_code_frame 2, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_frame 16, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 18, banim_genm_al1_7_oam_frame_18_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 19, banim_genm_al1_7_oam_frame_19_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 18, banim_genm_al1_7_oam_frame_18_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_genm_al1_sheet_3, 18, banim_genm_al1_7_oam_frame_18_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 19, banim_genm_al1_7_oam_frame_19_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 18, banim_genm_al1_7_oam_frame_18_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_7_mode_stand_close:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_7_mode_stand:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_7_mode_stand_range:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_7_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_7_oam_frame_0_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 1, banim_genm_al1_7_oam_frame_1_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_0, 2, banim_genm_al1_7_oam_frame_2_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 12, banim_genm_al1_sheet_0, 3, banim_genm_al1_7_oam_frame_3_r - banim_genm_al1_7_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_genm_al1_sheet_2, 4, banim_genm_al1_7_oam_frame_4_r - banim_genm_al1_7_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 5, banim_genm_al1_7_oam_frame_5_r - banim_genm_al1_7_oam_r
	banim_code_range_attack
	banim_code_frame 4, banim_genm_al1_sheet_5, 6, banim_genm_al1_7_oam_frame_6_r - banim_genm_al1_7_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_genm_al1_sheet_5, 7, banim_genm_al1_7_oam_frame_7_r - banim_genm_al1_7_oam_r
	banim_code_frame 4, banim_genm_al1_sheet_5, 8, banim_genm_al1_7_oam_frame_8_r - banim_genm_al1_7_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_genm_al1_sheet_5, 9, banim_genm_al1_7_oam_frame_9_r - banim_genm_al1_7_oam_r
	banim_code_frame 8, banim_genm_al1_sheet_6, 10, banim_genm_al1_7_oam_frame_10_r - banim_genm_al1_7_oam_r
	banim_code_sound_armor_leap
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_genm_al1_sheet_6, 11, banim_genm_al1_7_oam_frame_11_r - banim_genm_al1_7_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_genm_al1_7_mode_attack_close - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_attack_close_back - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_attack_close_critical - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_attack_close_critical_back - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_attack_range - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_attack_range_critical - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_dodge_close - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_dodge_range - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_stand_close - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_stand - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_stand_range - banim_genm_al1_7_script
	.word banim_genm_al1_7_mode_attack_miss - banim_genm_al1_7_script
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

