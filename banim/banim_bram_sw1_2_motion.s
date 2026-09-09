@ vim:ft=armv4
	.global banim_bram_sw1_2_script
	.global banim_bram_sw1_2_oam_r
	.global banim_bram_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xD
	.section .data.oam_l
banim_bram_sw1_2_oam_l:
banim_bram_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -17, -10
	banim_frame_oam 0x4000, 0x1000, 0x5D, -17, 6
	banim_frame_oam 0x0, 0x5000, 0x1B, -17, -17
	banim_frame_oam 0x0, 0x1000, 0x5C, -1, -9
	banim_frame_oam 0x0, 0x1000, 0x5B, -9, -1
	banim_frame_oam 0x8000, 0x9000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -15, -10
	banim_frame_oam 0x4000, 0x1000, 0x5D, -15, 6
	banim_frame_oam 0x0, 0x5000, 0x1B, -15, -17
	banim_frame_oam 0x0, 0x1000, 0x5C, 1, -9
	banim_frame_oam 0x0, 0x1000, 0x5B, -7, -1
	banim_frame_oam 0x8000, 0x9000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -12, -11
	banim_frame_oam 0x4000, 0x1000, 0x5D, -12, 5
	banim_frame_oam 0x0, 0x5000, 0x1B, -12, -18
	banim_frame_oam 0x0, 0x1000, 0x5C, 4, -10
	banim_frame_oam 0x0, 0x1000, 0x5B, -4, -2
	banim_frame_oam 0x8000, 0x9000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -6, -14
	banim_frame_oam 0x4000, 0x1000, 0x5D, -6, 2
	banim_frame_oam 0x0, 0x5000, 0x1B, -6, -21
	banim_frame_oam 0x0, 0x1000, 0x5C, 10, -13
	banim_frame_oam 0x0, 0x1000, 0x5B, 2, -5
	banim_frame_oam 0x0, 0x5000, 0x23, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x63, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_end
banim_bram_sw1_2_oam_frame_4_l:
	banim_frame_affine -237, 95, 95, 237, 1
	banim_frame_oam 0x8100, 0x8000, 0x9A, -1, -22
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x5000, 0x23, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x63, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_end
banim_bram_sw1_2_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x1000, 0xE3, -39, -19
	banim_frame_oam 0x4000, 0x1000, 0xE5, -39, -27
	banim_frame_oam 0x4000, 0x1000, 0xE7, -39, -35
	banim_frame_oam 0x4000, 0x1000, 0x7B, 2, -18
	banim_frame_oam 0x4000, 0x1000, 0x7D, 10, -10
	banim_frame_oam 0x0, 0x1000, 0x7F, 2, -10
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x9000, 0xA1, -19, -24
	banim_frame_oam 0x8000, 0x1000, 0xA5, -27, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x4000, 0x1000, 0x83, -19, -32
	banim_frame_oam 0x0, 0x1000, 0x85, -27, -32
	banim_frame_end
banim_bram_sw1_2_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x1000, 0x7B, 2, -17
	banim_frame_oam 0x4000, 0x1000, 0x7D, 10, -9
	banim_frame_oam 0x0, 0x1000, 0x7F, 2, -9
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -19, -16
	banim_frame_oam 0x4000, 0x1000, 0xA6, -11, -24
	banim_frame_oam 0x0, 0x5000, 0x19, -34, -33
	banim_frame_oam 0x4000, 0x1000, 0x59, -34, -17
	banim_frame_oam 0x0, 0x1000, 0x58, -18, -17
	banim_frame_end
banim_bram_sw1_2_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x1000, 0x7B, 2, -17
	banim_frame_oam 0x4000, 0x1000, 0x7D, 10, -9
	banim_frame_oam 0x0, 0x1000, 0x7F, 2, -9
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x5, -19, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x17, -33, -35
	banim_frame_oam 0x0, 0x1000, 0x57, -17, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x1000, 0x7B, 2, -17
	banim_frame_oam 0x4000, 0x1000, 0x7D, 10, -9
	banim_frame_oam 0x0, 0x1000, 0x7F, 2, -9
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x5, -19, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x19, -35, -38
	banim_frame_oam 0x4000, 0x1000, 0x59, -35, -22
	banim_frame_oam 0x0, 0x1000, 0x58, -19, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_9_l:
	banim_frame_affine -247, 66, 66, 247, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 0, -23
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x5, -19, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x17, -33, -35
	banim_frame_oam 0x0, 0x1000, 0x57, -17, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x9C, 0, -22
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x5, -19, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x17, -33, -35
	banim_frame_oam 0x0, 0x1000, 0x57, -17, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_11_l:
	banim_frame_affine -245, -71, -71, 245, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 0, -22
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x5, -19, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x17, -33, -35
	banim_frame_oam 0x0, 0x1000, 0x57, -17, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_12_l:
	banim_frame_affine -221, -128, -128, 221, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 0, -21
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x5, -19, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x17, -33, -35
	banim_frame_oam 0x0, 0x1000, 0x57, -17, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_13_l:
	banim_frame_affine -252, 44, 44, 252, 1
	banim_frame_oam 0x8100, 0x8000, 0x9A, 6, -19
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x5, -19, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x17, -33, -35
	banim_frame_oam 0x0, 0x1000, 0x57, -17, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_14_l:
	banim_frame_affine -255, 17, 17, 255, 1
	banim_frame_oam 0x8100, 0x8000, 0x9A, 5, -18
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x5, -19, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x17, -33, -35
	banim_frame_oam 0x0, 0x1000, 0x57, -17, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_15_l:
	banim_frame_affine -249, -58, -58, 249, 1
	banim_frame_oam 0x8100, 0x8000, 0x9A, 4, -18
	banim_frame_oam 0x0, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x80, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, -8
	banim_frame_oam 0x0, 0x5000, 0x5, -19, -24
	banim_frame_oam 0x4000, 0x1000, 0xC6, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x17, -33, -35
	banim_frame_oam 0x0, 0x1000, 0x57, -17, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0x45, -29, -40
	banim_frame_oam 0x4000, 0x9000, 0x7, 35, -16
	banim_frame_oam 0x4000, 0x9000, 0xB, 3, -16
	banim_frame_oam 0x4000, 0x9000, 0xF, -29, -16
	banim_frame_oam 0x4000, 0x5000, 0x47, 35, 0
	banim_frame_oam 0x4000, 0x5000, 0x4B, 3, 0
	banim_frame_oam 0x4000, 0x5000, 0x4F, -29, 0
	banim_frame_oam 0x4000, 0x5000, 0x67, 35, 8
	banim_frame_oam 0x4000, 0x5000, 0x6B, 3, 8
	banim_frame_oam 0x4000, 0x1000, 0x6F, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x71, -21, 8
	banim_frame_oam 0x4000, 0x5000, 0x86, 3, -24
	banim_frame_oam 0x4000, 0x1000, 0x8B, -29, -24
	banim_frame_oam 0x0, 0x1000, 0x8A, -13, -24
	banim_frame_end
banim_bram_sw1_2_oam_frame_17_l:
	banim_frame_oam 0x0, 0x5000, 0x13, 19, 0
	banim_frame_oam 0x8000, 0x1000, 0x15, 11, 0
	banim_frame_oam 0x0, 0x5000, 0x53, -13, -8
	banim_frame_oam 0x8000, 0x1000, 0x55, -21, -8
	banim_frame_oam 0x4000, 0x1000, 0x90, -13, 8
	banim_frame_oam 0x8000, 0x1000, 0x16, 3, -8
	banim_frame_oam 0x0, 0x1000, 0x56, 3, 8
	banim_frame_oam 0x4000, 0x1000, 0x8D, 50, -18
	banim_frame_oam 0x0, 0x1000, 0x8F, 42, -18
	banim_frame_oam 0x0, 0x5000, 0xAF, 50, -10
	banim_frame_oam 0x8000, 0x1000, 0xB1, 42, -10
	banim_frame_oam 0x0, 0x5000, 0xAC, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0xAE, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0xEC, 34, 0
	banim_frame_oam 0x0, 0x1000, 0xEE, 26, 0
	banim_frame_oam 0x4000, 0x1000, 0xE9, 34, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 26, 8
	banim_frame_oam 0x0, 0x5000, 0x92, 51, -6
	banim_frame_oam 0x8000, 0x1000, 0x94, 43, -6
	banim_frame_oam 0x4000, 0x1000, 0x95, 43, 10
	banim_frame_oam 0x0, 0x1000, 0xD4, 59, 10
	banim_frame_oam 0x0, 0x1000, 0x97, 35, -6
	banim_frame_oam 0x4000, 0x1000, 0xF4, 18, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, 10, -11
	banim_frame_oam 0x4000, 0x1000, 0xB5, 16, -19
	banim_frame_oam 0x4000, 0x1000, 0xD5, 10, -3
	banim_frame_end
banim_bram_sw1_2_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x1000, 0x8D, 50, -18
	banim_frame_oam 0x0, 0x1000, 0x8F, 42, -18
	banim_frame_oam 0x0, 0x5000, 0xAF, 50, -10
	banim_frame_oam 0x8000, 0x1000, 0xB1, 42, -10
	banim_frame_oam 0x0, 0x5000, 0xAC, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0xAE, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0xEC, 34, 0
	banim_frame_oam 0x0, 0x1000, 0xEE, 26, 0
	banim_frame_oam 0x4000, 0x1000, 0xE9, 34, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 26, 8
	banim_frame_oam 0x4000, 0x1000, 0xF4, 18, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, 10, -11
	banim_frame_oam 0x4000, 0x1000, 0xB5, 16, -19
	banim_frame_oam 0x4000, 0x1000, 0xD5, 10, -3
	banim_frame_end
banim_bram_sw1_2_oam_frame_19_l:
	banim_frame_affine -177, -184, -184, 177, 1
	banim_frame_oam 0x0, 0x5000, 0x41, 34, 0
	banim_frame_oam 0x8000, 0x1000, 0x43, 26, 0
	banim_frame_oam 0x0, 0x5000, 0x4, 50, -16
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x4000, 0x1000, 0x44, 50, 0
	banim_frame_oam 0x0, 0x5000, 0x2, 26, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x0, 0x1000, 0x82, 53, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, 6, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_20_l:
	banim_frame_affine -206, -151, -151, 206, 1
	banim_frame_oam 0x0, 0x5000, 0x41, 34, 0
	banim_frame_oam 0x8000, 0x1000, 0x43, 26, 0
	banim_frame_oam 0x0, 0x5000, 0x4, 50, -16
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x4000, 0x1000, 0x44, 50, 0
	banim_frame_oam 0x0, 0x5000, 0x2, 26, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x0, 0x1000, 0x82, 53, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, 7, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_21_l:
	banim_frame_affine -227, -116, -116, 227, 1
	banim_frame_oam 0x0, 0x5000, 0x41, 34, 0
	banim_frame_oam 0x8000, 0x1000, 0x43, 26, 0
	banim_frame_oam 0x0, 0x5000, 0x4, 50, -16
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x4000, 0x1000, 0x44, 50, 0
	banim_frame_oam 0x0, 0x5000, 0x2, 26, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x0, 0x1000, 0x82, 53, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, 8, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_22_l:
	banim_frame_affine -248, -62, -62, 248, 1
	banim_frame_oam 0x0, 0x5000, 0x41, 34, 0
	banim_frame_oam 0x8000, 0x1000, 0x43, 26, 0
	banim_frame_oam 0x0, 0x5000, 0x4, 50, -16
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x4000, 0x1000, 0x44, 50, 0
	banim_frame_oam 0x0, 0x5000, 0x2, 26, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x0, 0x1000, 0x82, 53, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, 9, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0x41, 34, 0
	banim_frame_oam 0x8000, 0x1000, 0x43, 26, 0
	banim_frame_oam 0x0, 0x5000, 0x4, 50, -16
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x4000, 0x1000, 0x44, 50, 0
	banim_frame_oam 0x0, 0x5000, 0x2, 26, -16
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x0, 0x1000, 0x82, 53, -24
	banim_frame_oam 0x0, 0x9000, 0x9C, 9, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_24_l:
	banim_frame_affine -232, 108, 108, 232, 1
	banim_frame_oam 0x0, 0x5000, 0x4, 50, -16
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x4000, 0x1000, 0x44, 50, 0
	banim_frame_oam 0x8000, 0x9000, 0x9, 26, -16
	banim_frame_oam 0x0, 0x5000, 0x47, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x82, 53, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, 21, -18
	banim_frame_end
banim_bram_sw1_2_oam_frame_25_l:
	banim_frame_affine -190, 171, 171, 190, 1
	banim_frame_oam 0x0, 0x5000, 0x4, 50, -16
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x4000, 0x1000, 0x44, 50, 0
	banim_frame_oam 0x8000, 0x9000, 0x9, 26, -16
	banim_frame_oam 0x0, 0x5000, 0x47, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x82, 53, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, 22, -17
	banim_frame_end
banim_bram_sw1_2_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x8D, 25, -12
	banim_frame_oam 0x4000, 0x1000, 0x6C, 41, -20
	banim_frame_oam 0x0, 0x1000, 0x6E, 33, -20
	banim_frame_oam 0x8000, 0x1000, 0x8C, 57, -4
	banim_frame_oam 0x0, 0x1000, 0xCC, 57, 12
	banim_frame_oam 0x0, 0x1000, 0xAB, 17, 3
	banim_frame_oam 0x4000, 0x1000, 0x50, 41, -28
	banim_frame_oam 0x0, 0x1000, 0x52, 33, -28
	banim_frame_oam 0x0, 0x5000, 0x10, 41, -44
	banim_frame_oam 0x8000, 0x1000, 0x12, 33, -44
	banim_frame_oam 0x4000, 0x1000, 0xD1, 40, -52
	banim_frame_oam 0x0, 0x1000, 0xD3, 32, -52
	banim_frame_end
banim_bram_sw1_2_oam_frame_27_l:
	banim_frame_affine -184, 177, 177, 184, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 33, -69
	banim_frame_oam 0x8000, 0x1000, 0x70, 25, -69
	banim_frame_oam 0x4000, 0x1000, 0xAF, 25, -53
	banim_frame_oam 0x0, 0x5000, 0x6C, 28, -39
	banim_frame_oam 0x0, 0x1000, 0x6B, 44, -39
	banim_frame_oam 0x0, 0x1000, 0x8B, 20, -39
	banim_frame_oam 0x4000, 0x1000, 0xCF, 28, -47
	banim_frame_oam 0x0, 0x5000, 0xAC, 36, -23
	banim_frame_oam 0x8000, 0x1000, 0xAE, 28, -23
	banim_frame_oam 0x0, 0x1000, 0x83, 44, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 36, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 28, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, 18, -38
	banim_frame_end
banim_bram_sw1_2_oam_frame_28_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 31, -74
	banim_frame_oam 0x8000, 0x1000, 0x70, 23, -74
	banim_frame_oam 0x4000, 0x1000, 0xAF, 23, -58
	banim_frame_oam 0x0, 0x5000, 0x6C, 26, -44
	banim_frame_oam 0x0, 0x1000, 0x6B, 42, -44
	banim_frame_oam 0x0, 0x1000, 0x8B, 18, -44
	banim_frame_oam 0x4000, 0x1000, 0xCF, 26, -52
	banim_frame_oam 0x0, 0x5000, 0xAC, 34, -28
	banim_frame_oam 0x8000, 0x1000, 0xAE, 26, -28
	banim_frame_oam 0x0, 0x1000, 0x83, 42, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 34, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 26, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, 17, -50
	banim_frame_end
banim_bram_sw1_2_oam_frame_29_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 28, -78
	banim_frame_oam 0x8000, 0x1000, 0x70, 20, -78
	banim_frame_oam 0x4000, 0x1000, 0xAF, 20, -62
	banim_frame_oam 0x0, 0x5000, 0x6C, 23, -48
	banim_frame_oam 0x0, 0x1000, 0x6B, 39, -48
	banim_frame_oam 0x0, 0x1000, 0x8B, 15, -48
	banim_frame_oam 0x4000, 0x1000, 0xCF, 23, -56
	banim_frame_oam 0x0, 0x5000, 0xAC, 31, -32
	banim_frame_oam 0x8000, 0x1000, 0xAE, 23, -32
	banim_frame_oam 0x0, 0x1000, 0x83, 39, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 31, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 23, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, 14, -54
	banim_frame_end
banim_bram_sw1_2_oam_frame_30_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 24, -84
	banim_frame_oam 0x8000, 0x1000, 0x70, 16, -84
	banim_frame_oam 0x4000, 0x1000, 0xAF, 16, -68
	banim_frame_oam 0x0, 0x5000, 0x6C, 19, -54
	banim_frame_oam 0x0, 0x1000, 0x6B, 35, -54
	banim_frame_oam 0x0, 0x1000, 0x8B, 11, -54
	banim_frame_oam 0x4000, 0x1000, 0xCF, 19, -62
	banim_frame_oam 0x0, 0x5000, 0xAC, 27, -38
	banim_frame_oam 0x8000, 0x1000, 0xAE, 19, -38
	banim_frame_oam 0x0, 0x1000, 0x83, 35, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 27, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 19, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, 10, -60
	banim_frame_end
banim_bram_sw1_2_oam_frame_31_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 20, -90
	banim_frame_oam 0x8000, 0x1000, 0x70, 12, -90
	banim_frame_oam 0x4000, 0x1000, 0xAF, 12, -74
	banim_frame_oam 0x0, 0x5000, 0x6C, 15, -60
	banim_frame_oam 0x0, 0x1000, 0x6B, 31, -60
	banim_frame_oam 0x0, 0x1000, 0x8B, 7, -60
	banim_frame_oam 0x4000, 0x1000, 0xCF, 15, -68
	banim_frame_oam 0x0, 0x5000, 0xAC, 23, -44
	banim_frame_oam 0x8000, 0x1000, 0xAE, 15, -44
	banim_frame_oam 0x0, 0x1000, 0x83, 31, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 23, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 15, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, 6, -66
	banim_frame_end
banim_bram_sw1_2_oam_frame_32_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 18, -97
	banim_frame_oam 0x8000, 0x1000, 0x70, 10, -97
	banim_frame_oam 0x4000, 0x1000, 0xAF, 10, -81
	banim_frame_oam 0x0, 0x5000, 0x6C, 13, -67
	banim_frame_oam 0x0, 0x1000, 0x6B, 29, -67
	banim_frame_oam 0x0, 0x1000, 0x8B, 5, -67
	banim_frame_oam 0x4000, 0x1000, 0xCF, 13, -75
	banim_frame_oam 0x0, 0x5000, 0xAC, 21, -51
	banim_frame_oam 0x8000, 0x1000, 0xAE, 13, -51
	banim_frame_oam 0x0, 0x1000, 0x83, 29, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 21, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 13, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, 4, -73
	banim_frame_end
banim_bram_sw1_2_oam_frame_33_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 16, -99
	banim_frame_oam 0x8000, 0x1000, 0x70, 8, -99
	banim_frame_oam 0x4000, 0x1000, 0xAF, 8, -83
	banim_frame_oam 0x0, 0x5000, 0x6C, 11, -69
	banim_frame_oam 0x0, 0x1000, 0x6B, 27, -69
	banim_frame_oam 0x0, 0x1000, 0x8B, 3, -69
	banim_frame_oam 0x4000, 0x1000, 0xCF, 11, -77
	banim_frame_oam 0x0, 0x5000, 0xAC, 19, -53
	banim_frame_oam 0x8000, 0x1000, 0xAE, 11, -53
	banim_frame_oam 0x0, 0x1000, 0x83, 27, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 19, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 11, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, 2, -75
	banim_frame_end
banim_bram_sw1_2_oam_frame_34_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 14, -100
	banim_frame_oam 0x8000, 0x1000, 0x70, 6, -100
	banim_frame_oam 0x4000, 0x1000, 0xAF, 6, -84
	banim_frame_oam 0x0, 0x5000, 0x6C, 9, -70
	banim_frame_oam 0x0, 0x1000, 0x6B, 25, -70
	banim_frame_oam 0x0, 0x1000, 0x8B, 1, -70
	banim_frame_oam 0x4000, 0x1000, 0xCF, 9, -78
	banim_frame_oam 0x0, 0x5000, 0xAC, 17, -54
	banim_frame_oam 0x8000, 0x1000, 0xAE, 9, -54
	banim_frame_oam 0x0, 0x1000, 0x83, 25, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 17, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 9, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, 0, -76
	banim_frame_end
banim_bram_sw1_2_oam_frame_35_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 12, -102
	banim_frame_oam 0x8000, 0x1000, 0x70, 4, -102
	banim_frame_oam 0x4000, 0x1000, 0xAF, 4, -86
	banim_frame_oam 0x0, 0x5000, 0x6C, 7, -72
	banim_frame_oam 0x0, 0x1000, 0x6B, 23, -72
	banim_frame_oam 0x0, 0x1000, 0x8B, -1, -72
	banim_frame_oam 0x4000, 0x1000, 0xCF, 7, -80
	banim_frame_oam 0x0, 0x5000, 0xAC, 15, -56
	banim_frame_oam 0x8000, 0x1000, 0xAE, 7, -56
	banim_frame_oam 0x0, 0x1000, 0x83, 23, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 15, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 7, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -2, -78
	banim_frame_end
banim_bram_sw1_2_oam_frame_36_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 10, -103
	banim_frame_oam 0x8000, 0x1000, 0x70, 2, -103
	banim_frame_oam 0x4000, 0x1000, 0xAF, 2, -87
	banim_frame_oam 0x0, 0x5000, 0x6C, 5, -73
	banim_frame_oam 0x0, 0x1000, 0x6B, 21, -73
	banim_frame_oam 0x0, 0x1000, 0x8B, -3, -73
	banim_frame_oam 0x4000, 0x1000, 0xCF, 5, -81
	banim_frame_oam 0x0, 0x5000, 0xAC, 13, -57
	banim_frame_oam 0x8000, 0x1000, 0xAE, 5, -57
	banim_frame_oam 0x0, 0x1000, 0x83, 21, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 13, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 5, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -4, -79
	banim_frame_end
banim_bram_sw1_2_oam_frame_37_l:
	banim_frame_affine 17, 255, 255, -17, 1
	banim_frame_oam 0x0, 0x5000, 0x6E, 9, -103
	banim_frame_oam 0x8000, 0x1000, 0x70, 1, -103
	banim_frame_oam 0x4000, 0x1000, 0xAF, 1, -87
	banim_frame_oam 0x0, 0x5000, 0x6C, 4, -73
	banim_frame_oam 0x0, 0x1000, 0x6B, 20, -73
	banim_frame_oam 0x0, 0x1000, 0x8B, -4, -73
	banim_frame_oam 0x4000, 0x1000, 0xCF, 4, -81
	banim_frame_oam 0x0, 0x5000, 0xAC, 12, -57
	banim_frame_oam 0x8000, 0x1000, 0xAE, 4, -57
	banim_frame_oam 0x0, 0x1000, 0x83, 20, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 12, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 4, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -4, -76
	banim_frame_end
banim_bram_sw1_2_oam_frame_38_l:
	banim_frame_affine -116, 228, 228, 116, 1
	banim_frame_oam 0x8000, 0x9000, 0x11, 5, -89
	banim_frame_oam 0x8000, 0x5000, 0x13, -3, -89
	banim_frame_oam 0x0, 0x5000, 0x91, 5, -57
	banim_frame_oam 0x0, 0x1000, 0x93, -3, -57
	banim_frame_oam 0x0, 0x5000, 0x14, -19, -81
	banim_frame_oam 0x0, 0x1000, 0x54, 13, -97
	banim_frame_oam 0x0, 0x1000, 0x83, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 0, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -8, -74
	banim_frame_end
banim_bram_sw1_2_oam_frame_39_l:
	banim_frame_affine -116, 228, 228, 116, 1
	banim_frame_oam 0x0, 0x5000, 0xD5, -4, -72
	banim_frame_oam 0x4000, 0x1000, 0xF2, 4, -56
	banim_frame_oam 0x0, 0x1000, 0xF4, -4, -56
	banim_frame_oam 0x0, 0x1000, 0xD1, -12, -64
	banim_frame_oam 0x0, 0x1000, 0xF1, -12, -72
	banim_frame_oam 0x0, 0x1000, 0xEE, 12, -72
	banim_frame_oam 0x0, 0x1000, 0xD2, 12, -64
	banim_frame_oam 0x4000, 0x1000, 0xEC, -4, -80
	banim_frame_oam 0x4000, 0x1000, 0xB3, 4, -48
	banim_frame_oam 0x0, 0x1000, 0x83, 15, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 7, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -1, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -9, -73
	banim_frame_end
banim_bram_sw1_2_oam_frame_40_l:
	banim_frame_affine -116, 228, 228, 116, 1
	banim_frame_oam 0x8000, 0x1000, 0xD7, -5, -71
	banim_frame_oam 0x0, 0x1000, 0x55, 3, -63
	banim_frame_oam 0x0, 0x1000, 0xD5, 3, -71
	banim_frame_oam 0x8000, 0x1000, 0xD2, 11, -63
	banim_frame_oam 0x0, 0x1000, 0xEE, 11, -71
	banim_frame_oam 0x4000, 0x1000, 0xF3, -5, -55
	banim_frame_oam 0x4000, 0x1000, 0xEC, -5, -79
	banim_frame_oam 0x4000, 0x1000, 0xB3, 3, -47
	banim_frame_oam 0x0, 0x1000, 0x83, 14, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 6, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -2, 8
	banim_frame_oam 0x0, 0x5000, 0x95, -6, -67
	banim_frame_oam 0x100, 0x8000, 0x9C, -10, -72
	banim_frame_end
banim_bram_sw1_2_oam_frame_41_l:
	banim_frame_affine -116, 228, 228, 116, 1
	banim_frame_oam 0x8000, 0x1000, 0xD7, -6, -70
	banim_frame_oam 0x0, 0x1000, 0x55, 2, -62
	banim_frame_oam 0x0, 0x1000, 0xD5, 2, -70
	banim_frame_oam 0x8000, 0x1000, 0xD2, 10, -62
	banim_frame_oam 0x0, 0x1000, 0xEE, 10, -70
	banim_frame_oam 0x4000, 0x1000, 0xF3, -6, -54
	banim_frame_oam 0x4000, 0x1000, 0xEC, -6, -78
	banim_frame_oam 0x4000, 0x1000, 0xB3, 2, -46
	banim_frame_oam 0x0, 0x1000, 0x83, 13, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 5, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -3, 8
	banim_frame_oam 0x0, 0x5000, 0x95, -7, -66
	banim_frame_oam 0x100, 0x8000, 0x9C, -11, -71
	banim_frame_end
banim_bram_sw1_2_oam_frame_42_l:
	banim_frame_affine -116, 228, 228, 116, 1
	banim_frame_oam 0x8000, 0x1000, 0xD7, -7, -69
	banim_frame_oam 0x0, 0x1000, 0x55, 1, -61
	banim_frame_oam 0x0, 0x1000, 0xD5, 1, -69
	banim_frame_oam 0x8000, 0x1000, 0xD2, 9, -61
	banim_frame_oam 0x0, 0x1000, 0xEE, 9, -69
	banim_frame_oam 0x4000, 0x1000, 0xF3, -7, -53
	banim_frame_oam 0x4000, 0x1000, 0xEC, -7, -77
	banim_frame_oam 0x4000, 0x1000, 0xB3, 1, -45
	banim_frame_oam 0x0, 0x1000, 0x83, 12, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 4, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -4, 8
	banim_frame_oam 0x0, 0x5000, 0x95, -8, -65
	banim_frame_oam 0x100, 0x8000, 0x9C, -12, -70
	banim_frame_end
banim_bram_sw1_2_oam_frame_43_l:
	banim_frame_affine -116, 228, 228, 116, 1
	banim_frame_oam 0x8000, 0x1000, 0xD7, -8, -67
	banim_frame_oam 0x0, 0x1000, 0x55, 0, -59
	banim_frame_oam 0x0, 0x1000, 0xD5, 0, -67
	banim_frame_oam 0x8000, 0x1000, 0xD2, 8, -59
	banim_frame_oam 0x0, 0x1000, 0xEE, 8, -67
	banim_frame_oam 0x4000, 0x1000, 0xF3, -8, -51
	banim_frame_oam 0x4000, 0x1000, 0xEC, -8, -75
	banim_frame_oam 0x4000, 0x1000, 0xB3, 0, -43
	banim_frame_oam 0x0, 0x1000, 0x83, 11, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -5, 8
	banim_frame_oam 0x0, 0x5000, 0x95, -9, -63
	banim_frame_oam 0x100, 0x8000, 0x9C, -13, -68
	banim_frame_end
banim_bram_sw1_2_oam_frame_44_l:
	banim_frame_oam 0x0, 0x5000, 0xC, 4, -69
	banim_frame_oam 0x8000, 0x1000, 0xE, -4, -69
	banim_frame_oam 0x4000, 0x1000, 0x4C, 4, -53
	banim_frame_oam 0x0, 0x1000, 0x4E, -4, -53
	banim_frame_oam 0x8000, 0x1000, 0xF, -12, -68
	banim_frame_oam 0x4000, 0x1000, 0xEB, 3, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, -5, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_45_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 4, -67
	banim_frame_oam 0x8000, 0x1000, 0x2, -4, -67
	banim_frame_oam 0x4000, 0x1000, 0x40, 4, -51
	banim_frame_oam 0x0, 0x1000, 0x42, -4, -51
	banim_frame_oam 0x0, 0x1000, 0x3, 1, -75
	banim_frame_oam 0x4000, 0x1000, 0x4, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -5, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_46_l:
	banim_frame_oam 0x0, 0x5000, 0x60, 6, -67
	banim_frame_oam 0x8000, 0x1000, 0x62, -2, -67
	banim_frame_oam 0x4000, 0x1000, 0xA0, 6, -51
	banim_frame_oam 0x0, 0x1000, 0xA2, -2, -51
	banim_frame_oam 0x4000, 0x1000, 0x4, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -5, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_47_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, 6, -67
	banim_frame_oam 0x8000, 0x1000, 0xC2, -2, -67
	banim_frame_oam 0x4000, 0x1000, 0xE3, 6, -51
	banim_frame_oam 0x0, 0x1000, 0xE5, -2, -51
	banim_frame_oam 0x4000, 0x1000, 0x4, 2, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -6, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_48_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, 6, -66
	banim_frame_oam 0x8000, 0x1000, 0xC2, -2, -66
	banim_frame_oam 0x4000, 0x1000, 0xE3, 6, -50
	banim_frame_oam 0x0, 0x1000, 0xE5, -2, -50
	banim_frame_oam 0x4000, 0x1000, 0x4, 2, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -6, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_49_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 4, -65
	banim_frame_oam 0x8000, 0x1000, 0x2, -4, -65
	banim_frame_oam 0x4000, 0x1000, 0x40, 4, -49
	banim_frame_oam 0x0, 0x1000, 0x42, -4, -49
	banim_frame_oam 0x0, 0x1000, 0x3, 1, -73
	banim_frame_oam 0x4000, 0x1000, 0x4, 1, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -7, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_50_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 4, -64
	banim_frame_oam 0x8000, 0x1000, 0x2, -4, -64
	banim_frame_oam 0x4000, 0x1000, 0x40, 4, -48
	banim_frame_oam 0x0, 0x1000, 0x42, -4, -48
	banim_frame_oam 0x0, 0x1000, 0x3, 1, -72
	banim_frame_oam 0x4000, 0x1000, 0x4, 1, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -7, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_51_l:
	banim_frame_oam 0x0, 0x5000, 0x60, 4, -61
	banim_frame_oam 0x8000, 0x1000, 0x62, -4, -61
	banim_frame_oam 0x4000, 0x1000, 0xA0, 4, -45
	banim_frame_oam 0x0, 0x1000, 0xA2, -4, -45
	banim_frame_oam 0x4000, 0x1000, 0x4, 1, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -7, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_52_l:
	banim_frame_oam 0x0, 0x5000, 0x60, 4, -60
	banim_frame_oam 0x8000, 0x1000, 0x62, -4, -60
	banim_frame_oam 0x4000, 0x1000, 0xA0, 4, -44
	banim_frame_oam 0x0, 0x1000, 0xA2, -4, -44
	banim_frame_oam 0x4000, 0x1000, 0x4, 1, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -7, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_53_l:
	banim_frame_oam 0x4000, 0x9000, 0x23, -11, -58
	banim_frame_oam 0x4000, 0x5000, 0x63, -11, -42
	banim_frame_oam 0x4000, 0x1000, 0x4, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_54_l:
	banim_frame_oam 0x4000, 0x9000, 0x23, -12, -57
	banim_frame_oam 0x4000, 0x5000, 0x63, -12, -41
	banim_frame_oam 0x4000, 0x1000, 0x4, -1, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -9, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_55_l:
	banim_frame_affine -235, -100, -100, 235, 1
	banim_frame_oam 0x0, 0x5000, 0x97, -8, -53
	banim_frame_oam 0x0, 0x1000, 0x78, 8, -53
	banim_frame_oam 0x4000, 0x1000, 0x75, 0, -61
	banim_frame_oam 0x0, 0x1000, 0x77, -8, -61
	banim_frame_oam 0x0, 0x5000, 0xD8, -8, -37
	banim_frame_oam 0x0, 0x1000, 0xDA, -16, -37
	banim_frame_oam 0x0, 0x1000, 0xFA, 8, -37
	banim_frame_oam 0x0, 0x1000, 0x83, 4, 8
	banim_frame_oam 0x0, 0x1000, 0x66, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -12, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -4, -45
	banim_frame_end
banim_bram_sw1_2_oam_frame_56_l:
	banim_frame_affine 61, 248, 248, -61, 1
	banim_frame_oam 0x4000, 0x1000, 0x1A, -2, -44
	banim_frame_oam 0x0, 0x5000, 0x3A, 0, -36
	banim_frame_oam 0x0, 0x1000, 0x59, -10, -60
	banim_frame_oam 0x0, 0x1000, 0x83, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x66, -5, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -13, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -1, -58
	banim_frame_oam 0x8000, 0x1000, 0x36, -8, -36
	banim_frame_oam 0x0, 0x1000, 0x39, -16, -28
	banim_frame_oam 0x4000, 0x1000, 0x57, -16, -52
	banim_frame_oam 0x0, 0x1000, 0x37, -10, -44
	banim_frame_end
banim_bram_sw1_2_oam_frame_57_l:
	banim_frame_affine 183, 178, 178, -183, 1
	banim_frame_oam 0x4000, 0x1000, 0x1A, -3, -43
	banim_frame_oam 0x0, 0x5000, 0x3A, -1, -35
	banim_frame_oam 0x0, 0x1000, 0x59, -11, -59
	banim_frame_oam 0x8000, 0x1000, 0x36, -9, -35
	banim_frame_oam 0x0, 0x1000, 0x39, -17, -27
	banim_frame_oam 0x4000, 0x1000, 0x57, -17, -51
	banim_frame_oam 0x0, 0x1000, 0x37, -11, -43
	banim_frame_oam 0x0, 0x1000, 0x83, 2, 8
	banim_frame_oam 0x0, 0x1000, 0x66, -6, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -14, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -4, -59
	banim_frame_end
banim_bram_sw1_2_oam_frame_58_l:
	banim_frame_affine 235, 100, 100, -235, 1
	banim_frame_oam 0x0, 0x1000, 0xA6, 0, -38
	banim_frame_oam 0x0, 0x1000, 0x9B, -14, -22
	banim_frame_oam 0x0, 0x1000, 0xBB, -22, -22
	banim_frame_oam 0x0, 0x1000, 0x83, -1, 8
	banim_frame_oam 0x0, 0x1000, 0x66, -9, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -17, 8
	banim_frame_oam 0x4000, 0x1000, 0x99, -6, -22
	banim_frame_oam 0x4000, 0x1000, 0xB9, -8, -14
	banim_frame_oam 0x100, 0x8000, 0x9C, -9, -55
	banim_frame_oam 0x8000, 0x1000, 0xAB, -30, -30
	banim_frame_oam 0x0, 0x1000, 0x38, -22, -30
	banim_frame_oam 0x4000, 0x1000, 0x79, -6, -30
	banim_frame_oam 0x0, 0x1000, 0x7B, -14, -30
	banim_frame_end
banim_bram_sw1_2_oam_frame_59_l:
	banim_frame_affine 249, -57, -57, -249, 1
	banim_frame_oam 0x0, 0x5000, 0xA3, -7, -24
	banim_frame_oam 0x8000, 0x1000, 0xA5, -15, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, -7, -32
	banim_frame_oam 0x0, 0x1000, 0x85, -7, -8
	banim_frame_oam 0x0, 0x1000, 0xC6, -23, -16
	banim_frame_oam 0x0, 0x1000, 0x86, -18, -8
	banim_frame_oam 0x0, 0x1000, 0xA6, -31, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, -11, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -19, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -17, -52
	banim_frame_end
banim_bram_sw1_2_oam_frame_60_l:
	banim_frame_affine 235, -99, -99, -235, 1
	banim_frame_oam 0x0, 0x5000, 0xA3, -8, -20
	banim_frame_oam 0x8000, 0x1000, 0xA5, -16, -20
	banim_frame_oam 0x4000, 0x1000, 0x83, -8, -28
	banim_frame_oam 0x0, 0x1000, 0x85, -8, -4
	banim_frame_oam 0x0, 0x1000, 0xC6, -24, -12
	banim_frame_oam 0x0, 0x1000, 0x86, -19, -4
	banim_frame_oam 0x0, 0x1000, 0xA6, -32, -12
	banim_frame_oam 0x4000, 0x1000, 0x4, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -20, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -19, -47
	banim_frame_end
banim_bram_sw1_2_oam_frame_61_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x29, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x69, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, -2
	banim_frame_oam 0x0, 0x1000, 0x9, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x1A, -16, -30
	banim_frame_oam 0x4000, 0x1000, 0x5A, -16, -14
	banim_frame_oam 0x0, 0x1000, 0x7B, 0, -18
	banim_frame_end
banim_bram_sw1_2_oam_frame_62_l:
	banim_frame_affine -120, 225, 225, 120, 2
	banim_frame_affine 235, -99, -99, -235, 2
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, -2
	banim_frame_oam 0x0, 0x5000, 0xA, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x4A, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0x67, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x69, -16, 8
	banim_frame_oam 0x100, 0x4000, 0x87, -3, -5
	banim_frame_oam 0x100, 0x8200, 0x9C, -13, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_63_l:
	banim_frame_affine -120, 225, 225, 120, 2
	banim_frame_affine 235, -99, -99, -235, 2
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, -2
	banim_frame_oam 0x0, 0x5000, 0xA, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x4A, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0x67, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x69, -16, 8
	banim_frame_oam 0x100, 0x4000, 0x87, -1, -3
	banim_frame_oam 0x100, 0x8200, 0x9C, -11, -14
	banim_frame_end
banim_bram_sw1_2_oam_frame_64_l:
	banim_frame_affine -225, -120, -120, 225, 2
	banim_frame_affine 255, 0, 0, -255, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -11, -9
	banim_frame_oam 0x100, 0x4200, 0x87, 0, -6
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, -2
	banim_frame_oam 0x0, 0x5000, 0xA, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x4A, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0x67, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x69, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_65_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -7, -10
	banim_frame_oam 0x4000, 0x1000, 0x5D, -7, 6
	banim_frame_oam 0x0, 0x5000, 0x1B, -7, -17
	banim_frame_oam 0x0, 0x1000, 0x5C, 9, -9
	banim_frame_oam 0x0, 0x1000, 0x5B, 1, -1
	banim_frame_oam 0x8000, 0x9000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_66_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -11, -10
	banim_frame_oam 0x4000, 0x1000, 0x5D, -11, 6
	banim_frame_oam 0x0, 0x5000, 0x1B, -11, -17
	banim_frame_oam 0x0, 0x1000, 0x5C, 5, -9
	banim_frame_oam 0x0, 0x1000, 0x5B, -3, -1
	banim_frame_oam 0x8000, 0x9000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_67_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -15, -10
	banim_frame_oam 0x4000, 0x1000, 0x5D, -15, 6
	banim_frame_oam 0x0, 0x5000, 0x1B, -15, -17
	banim_frame_oam 0x0, 0x1000, 0x5C, 1, -9
	banim_frame_oam 0x0, 0x1000, 0x5B, -7, -1
	banim_frame_oam 0x8000, 0x9000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_74_l:
	banim_frame_oam 0x0, 0x9000, 0x1C, -29, -15
	banim_frame_oam 0x0, 0x5000, 0xDA, -21, -15
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_75_l:
	banim_frame_affine -231, -108, -108, 231, 2
	banim_frame_affine -216, -136, -136, 216, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -32, -17
	banim_frame_oam 0x100, 0x4200, 0xDA, -21, -17
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_76_l:
	banim_frame_affine -209, -147, -147, 209, 2
	banim_frame_affine -195, -165, -165, 195, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -33, -18
	banim_frame_oam 0x100, 0x4200, 0xDA, -20, -17
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_77_l:
	banim_frame_affine -195, -165, -165, 195, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -34, -19
	banim_frame_oam 0x100, 0x4000, 0xDA, -21, -18
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_78_l:
	banim_frame_affine -153, -204, -204, 153, 2
	banim_frame_affine -174, -187, -187, 174, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -36, -22
	banim_frame_oam 0x100, 0x4200, 0xDA, -23, -19
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_79_l:
	banim_frame_affine -123, -224, -224, 123, 2
	banim_frame_affine -115, -228, -228, 115, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -38, -23
	banim_frame_oam 0x100, 0x4200, 0xDA, -23, -19
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_80_l:
	banim_frame_affine -48, -251, -251, 48, 2
	banim_frame_affine -35, -253, -253, 35, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -41, -26
	banim_frame_oam 0x100, 0x4200, 0xDA, -25, -20
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_81_l:
	banim_frame_affine -167, -193, -193, 167, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -35, -19
	banim_frame_oam 0x100, 0x4000, 0xDA, -21, -17
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_82_l:
	banim_frame_affine -209, -147, -147, 209, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -32, -16
	banim_frame_oam 0x100, 0x4000, 0xDA, -19, -15
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_83_l:
	banim_frame_affine -231, -108, -108, 231, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -29, -14
	banim_frame_oam 0x100, 0x4000, 0xDA, -18, -14
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_84_l:
	banim_frame_affine -251, -49, -49, 251, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -23, -13
	banim_frame_oam 0x100, 0x4000, 0xDA, -14, -13
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_85_l:
	banim_frame_affine -242, 83, 83, 242, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -16, -14
	banim_frame_oam 0x100, 0x4000, 0xDA, -11, -13
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x89, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_86_l:
	banim_frame_affine -199, 161, 161, 199, 2
	banim_frame_affine -157, 201, 201, 157, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -2, -34
	banim_frame_oam 0x100, 0x4200, 0xDA, 2, -30
	banim_frame_oam 0x0, 0x5000, 0xCC, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0xCE, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xE7, -7, -24
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_87_l:
	banim_frame_affine -108, 231, 231, 108, 2
	banim_frame_affine -157, 201, 201, 157, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, 0, -37
	banim_frame_oam 0x100, 0x4200, 0xDA, 1, -32
	banim_frame_oam 0x0, 0x5000, 0xCC, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0xCE, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xE7, -7, -24
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_88_l:
	banim_frame_affine -26, 254, 254, 26, 2
	banim_frame_affine -40, 252, 252, 40, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, 1, -42
	banim_frame_oam 0x100, 0x4200, 0xDA, 2, -34
	banim_frame_oam 0x0, 0x5000, 0xCC, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0xCE, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xE7, -7, -24
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_89_l:
	banim_frame_affine 99, 235, 235, -99, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -1, -49
	banim_frame_oam 0x100, 0x4000, 0xDA, 1, -37
	banim_frame_oam 0x0, 0x5000, 0xCC, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0xCE, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xE7, -7, -24
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_90_l:
	banim_frame_affine 223, 124, 124, -223, 2
	banim_frame_affine 221, 128, 128, -221, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -5, -53
	banim_frame_oam 0x100, 0x4200, 0xDA, 0, -37
	banim_frame_oam 0x0, 0x5000, 0xCC, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0xCE, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xE7, -7, -24
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_91_l:
	banim_frame_oam 0x0, 0x5000, 0xCC, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0xCE, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xE7, -7, -24
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_92_l:
	banim_frame_oam 0x0, 0x5000, 0xE, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x4E, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0xD, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x4C, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_93_l:
	banim_frame_oam 0x4000, 0x5000, 0xAC, -12, 10
	banim_frame_oam 0x0, 0x1000, 0x6E, 12, 2
	banim_frame_oam 0x0, 0x5000, 0xE, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x4E, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0xD, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x4C, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_oam 0x4000, 0x5000, 0xEF, -25, 2
	banim_frame_oam 0x0, 0x1000, 0xCF, -25, 10
	banim_frame_end
banim_bram_sw1_2_oam_frame_94_l:
	banim_frame_oam 0x0, 0x5000, 0x70, -25, 2
	banim_frame_oam 0x0, 0x1000, 0x8F, -9, 10
	banim_frame_oam 0x0, 0x1000, 0xB0, -1, 10
	banim_frame_oam 0x0, 0x5000, 0xE, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x4E, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0xD, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x4C, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, 8
	banim_frame_oam 0x0, 0x5000, 0x10, 3, -7
	banim_frame_oam 0x4000, 0x1000, 0x50, 3, 9
	banim_frame_oam 0x0, 0x1000, 0x6F, 19, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_95_l:
	banim_frame_oam 0x4000, 0x1000, 0x40, -3, -54
	banim_frame_oam 0x8000, 0x9000, 0x60, -2, -46
	banim_frame_oam 0x8000, 0x5000, 0x62, -10, -46
	banim_frame_oam 0x4000, 0x1000, 0xE0, -10, -14
	banim_frame_oam 0x4000, 0x9000, 0x2, -2, -6
	banim_frame_oam 0x4000, 0x9000, 0x6, -34, -6
	banim_frame_oam 0x4000, 0x5000, 0x42, -10, 10
	banim_frame_oam 0x4000, 0x1000, 0x46, -26, 10
	banim_frame_oam 0x0, 0x1000, 0x1, -42, -6
	banim_frame_oam 0x0, 0x1000, 0xE2, 14, -14
	banim_frame_oam 0x4000, 0x1000, 0x20, -3, -62
	banim_frame_oam 0x0, 0x1000, 0x0, 5, -70
	banim_frame_end
banim_bram_sw1_2_oam_frame_96_l:
	banim_frame_oam 0x0, 0x5000, 0xB1, -4, -57
	banim_frame_oam 0x0, 0x5000, 0x12, 2, -73
	banim_frame_oam 0x0, 0x1000, 0x34, -6, -65
	banim_frame_oam 0x4000, 0x1000, 0x52, -6, -41
	banim_frame_oam 0x0, 0x1000, 0xD0, 10, -81
	banim_frame_oam 0x0, 0x4000, 0x70, 5, 2
	banim_frame_oam 0x0, 0x0, 0x8F, -3, 10
	banim_frame_oam 0x0, 0x0, 0xB0, -11, 10
	banim_frame_oam 0x0, 0x4000, 0x10, -21, -7
	banim_frame_oam 0x4000, 0x0, 0x50, -21, 9
	banim_frame_oam 0x0, 0x0, 0x6F, -29, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_97_l:
	banim_frame_oam 0x0, 0x5000, 0xB1, -1, -73
	banim_frame_oam 0x0, 0x5000, 0x12, 5, -89
	banim_frame_oam 0x0, 0x1000, 0x34, -3, -81
	banim_frame_oam 0x4000, 0x1000, 0x52, -3, -57
	banim_frame_oam 0x0, 0x1000, 0xD0, 13, -97
	banim_frame_oam 0x0, 0x4000, 0x70, 5, 2
	banim_frame_oam 0x0, 0x0, 0x8F, -3, 10
	banim_frame_oam 0x0, 0x0, 0xB0, -11, 10
	banim_frame_oam 0x0, 0x4000, 0x10, -21, -7
	banim_frame_oam 0x4000, 0x0, 0x50, -21, 9
	banim_frame_oam 0x0, 0x0, 0x6F, -29, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_98_l:
	banim_frame_oam 0x0, 0x5000, 0xB1, 2, -89
	banim_frame_oam 0x0, 0x5000, 0x12, 8, -105
	banim_frame_oam 0x0, 0x1000, 0x34, 0, -97
	banim_frame_oam 0x4000, 0x1000, 0x52, 0, -73
	banim_frame_oam 0x0, 0x1000, 0xD0, 16, -113
	banim_frame_oam 0x4000, 0x5000, 0xAC, -12, 9
	banim_frame_oam 0x0, 0x1000, 0x6E, 12, 1
	banim_frame_oam 0x4000, 0x5000, 0xEF, -23, 2
	banim_frame_oam 0x0, 0x1000, 0xCF, -23, 10
	banim_frame_end
banim_bram_sw1_2_oam_frame_99_l:
	banim_frame_oam 0x0, 0x5000, 0xB1, 5, -103
	banim_frame_oam 0x0, 0x5000, 0x12, 11, -119
	banim_frame_oam 0x0, 0x1000, 0x34, 3, -111
	banim_frame_oam 0x4000, 0x1000, 0x52, 3, -87
	banim_frame_oam 0x0, 0x1000, 0xD0, 19, -127
	banim_frame_oam 0x4000, 0x5000, 0xAC, -12, 9
	banim_frame_oam 0x0, 0x1000, 0x6E, 12, 1
	banim_frame_oam 0x4000, 0x5000, 0xEF, -23, 2
	banim_frame_oam 0x0, 0x1000, 0xCF, -23, 10
	banim_frame_end
banim_bram_sw1_2_oam_frame_100_l:
	banim_frame_oam 0x8000, 0x1000, 0x4B, 55, -92
	banim_frame_oam 0x0, 0x1000, 0x8B, 55, -76
	banim_frame_oam 0x0, 0x1000, 0x2B, 63, -76
	banim_frame_oam 0x0, 0x1000, 0x2A, 63, -92
	banim_frame_oam 0x4000, 0x1000, 0xA, 31, -116
	banim_frame_oam 0x0, 0x5000, 0x49, 31, -108
	banim_frame_oam 0x8000, 0x9000, 0x88, 39, -92
	banim_frame_oam 0x8000, 0x5000, 0x8A, 31, -92
	banim_frame_oam 0x0, 0x1000, 0x48, 32, -124
	banim_frame_oam 0x0, 0x9000, 0x84, 24, -52
	banim_frame_oam 0x4000, 0x1000, 0x64, 40, -60
	banim_frame_oam 0x0, 0x1000, 0x66, 32, -60
	banim_frame_oam 0x8000, 0x1000, 0x63, 56, -44
	banim_frame_oam 0x0, 0x1000, 0xA3, 56, -28
	banim_frame_oam 0x4000, 0x1000, 0xEB, 36, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, 28, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_101_l:
	banim_frame_oam 0x0, 0x5000, 0x15, 44, -26
	banim_frame_oam 0x8000, 0x1000, 0x17, 36, -26
	banim_frame_oam 0x4000, 0x1000, 0x55, 44, -10
	banim_frame_oam 0x0, 0x1000, 0x57, 36, -10
	banim_frame_oam 0x8000, 0x1000, 0x18, 28, -22
	banim_frame_oam 0x0, 0x1000, 0x14, 35, -2
	banim_frame_oam 0x4000, 0x1000, 0x4, 38, 8
	banim_frame_oam 0x0, 0x1000, 0x6, 30, 8
	banim_frame_oam 0x8000, 0x1000, 0x79, 54, -20
	banim_frame_oam 0x0, 0x1000, 0xB9, 54, -4
	banim_frame_oam 0x0, 0x1000, 0x58, 46, -10
	banim_frame_end
banim_bram_sw1_2_oam_frame_102_l:
	banim_frame_oam 0x8000, 0x9000, 0x73, 36, -26
	banim_frame_oam 0x4000, 0x1000, 0xF3, 36, 6
	banim_frame_oam 0x0, 0x1000, 0x92, 52, -18
	banim_frame_oam 0x0, 0x1000, 0x72, 52, -10
	banim_frame_oam 0x4000, 0x1000, 0x4, 38, 8
	banim_frame_oam 0x0, 0x1000, 0x6, 30, 8
	banim_frame_oam 0x8000, 0x1000, 0x79, 54, -20
	banim_frame_oam 0x0, 0x1000, 0xB9, 54, -4
	banim_frame_oam 0x0, 0x1000, 0x58, 46, -10
	banim_frame_end
banim_bram_sw1_2_oam_frame_103_l:
	banim_frame_oam 0x8000, 0x9000, 0x76, 36, -24
	banim_frame_oam 0x4000, 0x1000, 0xF5, 42, 8
	banim_frame_oam 0x0, 0x1000, 0xF7, 34, 8
	banim_frame_oam 0x8000, 0x1000, 0x75, 52, -16
	banim_frame_oam 0x0, 0x1000, 0xB5, 44, -32
	banim_frame_oam 0x8000, 0x1000, 0x79, 54, -20
	banim_frame_oam 0x0, 0x1000, 0xB9, 54, -4
	banim_frame_oam 0x0, 0x1000, 0x58, 46, -10
	banim_frame_oam 0x0, 0x1000, 0xD5, 28, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_104_l:
	banim_frame_affine 230, -111, -111, -230, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 31, -53
	banim_frame_oam 0x8000, 0x9000, 0x76, 36, -24
	banim_frame_oam 0x4000, 0x1000, 0xF5, 42, 8
	banim_frame_oam 0x0, 0x1000, 0xF7, 34, 8
	banim_frame_oam 0x8000, 0x1000, 0x75, 52, -16
	banim_frame_oam 0x0, 0x1000, 0xB5, 44, -32
	banim_frame_oam 0x8000, 0x1000, 0x79, 54, -20
	banim_frame_oam 0x0, 0x1000, 0xB9, 54, -4
	banim_frame_oam 0x0, 0x1000, 0x58, 46, -10
	banim_frame_oam 0x0, 0x1000, 0xD5, 28, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_105_l:
	banim_frame_affine 255, -4, -4, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 32, -49
	banim_frame_oam 0x8000, 0x9000, 0x76, 36, -24
	banim_frame_oam 0x4000, 0x1000, 0xF5, 42, 8
	banim_frame_oam 0x0, 0x1000, 0xF7, 34, 8
	banim_frame_oam 0x8000, 0x1000, 0x75, 52, -16
	banim_frame_oam 0x0, 0x1000, 0xB5, 44, -32
	banim_frame_oam 0x8000, 0x1000, 0x79, 54, -20
	banim_frame_oam 0x0, 0x1000, 0xB9, 54, -4
	banim_frame_oam 0x0, 0x1000, 0x58, 46, -10
	banim_frame_oam 0x0, 0x1000, 0xD5, 28, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_106_l:
	banim_frame_affine 206, 150, 150, -206, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 36, -46
	banim_frame_oam 0x8000, 0x9000, 0x76, 36, -24
	banim_frame_oam 0x4000, 0x1000, 0xF5, 42, 8
	banim_frame_oam 0x0, 0x1000, 0xF7, 34, 8
	banim_frame_oam 0x8000, 0x1000, 0x75, 52, -16
	banim_frame_oam 0x0, 0x1000, 0xB5, 44, -32
	banim_frame_oam 0x8000, 0x1000, 0x79, 54, -20
	banim_frame_oam 0x0, 0x1000, 0xB9, 54, -4
	banim_frame_oam 0x0, 0x1000, 0x58, 46, -10
	banim_frame_oam 0x0, 0x1000, 0xD5, 28, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_107_l:
	banim_frame_affine 35, 253, 253, -35, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 16, -28
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_108_l:
	banim_frame_affine -139, 214, 214, 139, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 16, -24
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_109_l:
	banim_frame_affine -219, 131, 131, 219, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 14, -23
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_110_l:
	banim_frame_affine -251, -49, -49, 251, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 8, -23
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_111_l:
	banim_frame_affine -99, -235, -235, 99, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_112_l:
	banim_frame_affine -8, -255, -255, 8, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_113_l:
	banim_frame_affine 96, -237, -237, -96, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 4, -28
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_114_l:
	banim_frame_affine 187, -174, -174, -187, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 5, -32
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_115_l:
	banim_frame_affine 255, -17, -17, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 7, -33
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_116_l:
	banim_frame_affine 240, 87, 87, -240, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 9, -35
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_117_l:
	banim_frame_affine 177, 184, 184, -177, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 12, -34
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_118_l:
	banim_frame_affine -31, 254, 254, 31, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 16, -29
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_119_l:
	banim_frame_affine -214, 139, 139, 214, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 15, -23
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_120_l:
	banim_frame_affine -251, -49, -49, 251, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 11, -21
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_121_l:
	banim_frame_affine -174, -187, -187, 174, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 6, -23
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_122_l:
	banim_frame_affine -99, -235, -235, 99, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 4, -25
	banim_frame_end
banim_bram_sw1_2_oam_frame_123_l:
	banim_frame_affine 100, -235, -235, -100, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 3, -30
	banim_frame_end
banim_bram_sw1_2_oam_frame_124_l:
	banim_frame_affine 228, -115, -115, -228, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 6, -32
	banim_frame_end
banim_bram_sw1_2_oam_frame_125_l:
	banim_frame_affine 235, 100, 100, -235, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 12, -32
	banim_frame_end
banim_bram_sw1_2_oam_frame_126_l:
	banim_frame_affine 48, 251, 251, -48, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 15, -29
	banim_frame_end
banim_bram_sw1_2_oam_frame_127_l:
	banim_frame_affine -100, 235, 235, 100, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 16, -25
	banim_frame_end
banim_bram_sw1_2_oam_frame_128_l:
	banim_frame_affine -235, 99, 99, 235, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 12, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_129_l:
	banim_frame_affine -243, -79, -79, 243, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 8, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_130_l:
	banim_frame_affine -183, -178, -178, 183, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 6, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_131_l:
	banim_frame_affine -107, -232, -232, 107, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 5, -25
	banim_frame_end
banim_bram_sw1_2_oam_frame_132_l:
	banim_frame_affine -177, -184, -184, 177, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 6, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_133_l:
	banim_frame_affine -206, -151, -151, 206, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 7, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_134_l:
	banim_frame_affine -227, -116, -116, 227, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 8, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_135_l:
	banim_frame_affine -248, -62, -62, 248, 1
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 9, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_136_l:
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0x41, 42, 0
	banim_frame_oam 0x0, 0x1000, 0x40, 18, -15
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x0, 0x9000, 0x9C, 9, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_137_l:
	banim_frame_affine -232, 108, 108, 232, 1
	banim_frame_oam 0x8000, 0x9000, 0x9, 26, -16
	banim_frame_oam 0x0, 0x5000, 0x47, 42, 0
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 21, -18
	banim_frame_end
banim_bram_sw1_2_oam_frame_138_l:
	banim_frame_affine -184, 177, 177, 184, 1
	banim_frame_oam 0x8000, 0x9000, 0x9, 26, -16
	banim_frame_oam 0x0, 0x5000, 0x47, 42, 0
	banim_frame_oam 0x8000, 0x1000, 0x6, 42, -16
	banim_frame_oam 0x8000, 0x1000, 0x88, 50, -15
	banim_frame_oam 0x0, 0x1000, 0xC8, 50, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, 22, -18
	banim_frame_end
banim_bram_sw1_2_oam_frame_68_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bram_sw1_2_oam_frame_72_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bram_sw1_2_oam_frame_73_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bram_sw1_2_oam_frame_71_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_bram_sw1_2_oam_frame_141_l:
	banim_frame_oam 0x4000, 0x9000, 0xA1, -29, -10
	banim_frame_oam 0x4000, 0x5000, 0xE1, -29, 6
	banim_frame_oam 0x0, 0x1000, 0xA0, 3, -10
	banim_frame_oam 0x0, 0x1000, 0xE0, 3, 6
	banim_frame_oam 0x0, 0x1000, 0xA5, -37, -2
	banim_frame_oam 0x4000, 0x5000, 0x16, -21, -18
	banim_frame_oam 0x4000, 0x1000, 0xE5, -28, 14
	banim_frame_oam 0x4000, 0x1000, 0xC5, -12, 14
	banim_frame_oam 0x0, 0x1000, 0xC0, -36, 14
	banim_frame_end
banim_bram_sw1_2_oam_frame_142_l:
	banim_frame_oam 0x4000, 0x5000, 0x13, -32, -9
	banim_frame_oam 0x4000, 0x9000, 0x33, -33, -1
	banim_frame_oam 0x4000, 0x5000, 0x73, -33, 15
	banim_frame_oam 0x4000, 0x1000, 0x70, -16, -17
	banim_frame_oam 0x0, 0x1000, 0x72, -24, -17
	banim_frame_end
banim_bram_sw1_2_oam_frame_69_l:
	banim_frame_oam 0x0, 0x1000, 0xEF, 61, -18
	banim_frame_oam 0x0, 0x1000, 0xF0, 61, -10
	banim_frame_end
banim_bram_sw1_2_oam_frame_70_l:
	banim_frame_oam 0x0, 0x1000, 0x80, 61, -18
	banim_frame_oam 0x0, 0x1000, 0x81, 61, -10
	banim_frame_end
banim_bram_sw1_2_oam_frame_139_l:
	banim_frame_oam 0x8000, 0x1000, 0x78, 62, -20
	banim_frame_oam 0x0, 0x1000, 0xB8, 62, -4
	banim_frame_end
banim_bram_sw1_2_oam_frame_140_l:
	banim_frame_oam 0x8000, 0x1000, 0x87, 58, -15
	banim_frame_oam 0x0, 0x1000, 0xC7, 58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_143_l:
	banim_frame_oam 0x0, 0x5000, 0x13, 19, 0
	banim_frame_oam 0x8000, 0x1000, 0x15, 11, 0
	banim_frame_oam 0x0, 0x5000, 0x53, -13, -8
	banim_frame_oam 0x8000, 0x1000, 0x55, -21, -8
	banim_frame_oam 0x4000, 0x1000, 0x90, -13, 8
	banim_frame_oam 0x8000, 0x1000, 0x16, 3, -8
	banim_frame_oam 0x0, 0x1000, 0x56, 3, 8
	banim_frame_oam 0x4000, 0x1000, 0x8D, 50, -18
	banim_frame_oam 0x0, 0x1000, 0x8F, 42, -18
	banim_frame_oam 0x0, 0x5000, 0xAF, 50, -10
	banim_frame_oam 0x8000, 0x1000, 0xB1, 42, -10
	banim_frame_oam 0x0, 0x5000, 0xAC, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0xAE, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0xEC, 34, 0
	banim_frame_oam 0x0, 0x1000, 0xEE, 26, 0
	banim_frame_oam 0x4000, 0x1000, 0xE9, 34, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 26, 8
	banim_frame_oam 0x0, 0x1000, 0xEF, 61, -18
	banim_frame_oam 0x0, 0x1000, 0xF0, 61, -10
	banim_frame_oam 0x0, 0x5000, 0x92, 51, -6
	banim_frame_oam 0x8000, 0x1000, 0x94, 43, -6
	banim_frame_oam 0x4000, 0x1000, 0x95, 43, 10
	banim_frame_oam 0x0, 0x1000, 0xD4, 59, 10
	banim_frame_oam 0x0, 0x1000, 0x97, 35, -6
	banim_frame_oam 0x4000, 0x1000, 0xF4, 18, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, 10, -11
	banim_frame_oam 0x4000, 0x1000, 0xB5, 16, -19
	banim_frame_oam 0x4000, 0x1000, 0xD5, 10, -3
	banim_frame_end
banim_bram_sw1_2_oam_frame_144_l:
	banim_frame_oam 0x4000, 0x1000, 0x8D, 50, -18
	banim_frame_oam 0x0, 0x1000, 0x8F, 42, -18
	banim_frame_oam 0x0, 0x5000, 0xAF, 50, -10
	banim_frame_oam 0x8000, 0x1000, 0xB1, 42, -10
	banim_frame_oam 0x0, 0x5000, 0xAC, 26, -16
	banim_frame_oam 0x8000, 0x1000, 0xAE, 18, -16
	banim_frame_oam 0x4000, 0x1000, 0xEC, 34, 0
	banim_frame_oam 0x0, 0x1000, 0xEE, 26, 0
	banim_frame_oam 0x4000, 0x1000, 0xE9, 34, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 26, 8
	banim_frame_oam 0x4000, 0x1000, 0xF4, 18, -11
	banim_frame_oam 0x0, 0x1000, 0xF6, 10, -11
	banim_frame_oam 0x4000, 0x1000, 0xB5, 16, -19
	banim_frame_oam 0x4000, 0x1000, 0xD5, 10, -3
	banim_frame_oam 0x0, 0x1000, 0xEF, 61, -18
	banim_frame_oam 0x0, 0x1000, 0xF0, 61, -10
	banim_frame_end
	.section .data.oam_r
banim_bram_sw1_2_oam_r:
banim_bram_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, 1, -10
	banim_frame_oam 0x4000, 0x0, 0x5D, 1, 6
	banim_frame_oam 0x0, 0x4000, 0x1B, 1, -17
	banim_frame_oam 0x0, 0x0, 0x5C, -7, -9
	banim_frame_oam 0x0, 0x0, 0x5B, 1, -1
	banim_frame_oam 0x8000, 0x8000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, -1, -10
	banim_frame_oam 0x4000, 0x0, 0x5D, -1, 6
	banim_frame_oam 0x0, 0x4000, 0x1B, -1, -17
	banim_frame_oam 0x0, 0x0, 0x5C, -9, -9
	banim_frame_oam 0x0, 0x0, 0x5B, -1, -1
	banim_frame_oam 0x8000, 0x8000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, -4, -11
	banim_frame_oam 0x4000, 0x0, 0x5D, -4, 5
	banim_frame_oam 0x0, 0x4000, 0x1B, -4, -18
	banim_frame_oam 0x0, 0x0, 0x5C, -12, -10
	banim_frame_oam 0x0, 0x0, 0x5B, -4, -2
	banim_frame_oam 0x8000, 0x8000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, -10, -14
	banim_frame_oam 0x4000, 0x0, 0x5D, -10, 2
	banim_frame_oam 0x0, 0x4000, 0x1B, -10, -21
	banim_frame_oam 0x0, 0x0, 0x5C, -18, -13
	banim_frame_oam 0x0, 0x0, 0x5B, -10, -5
	banim_frame_oam 0x0, 0x4000, 0x23, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x63, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_end
banim_bram_sw1_2_oam_frame_4_r:
	banim_frame_affine 237, 95, -95, 237, 1
	banim_frame_oam 0x8100, 0x8000, 0x9A, -15, -22
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x23, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x63, -8, -8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_end
banim_bram_sw1_2_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x0, 0xE3, 23, -19
	banim_frame_oam 0x4000, 0x0, 0xE5, 23, -27
	banim_frame_oam 0x4000, 0x0, 0xE7, 23, -35
	banim_frame_oam 0x4000, 0x0, 0x7B, -18, -18
	banim_frame_oam 0x4000, 0x0, 0x7D, -26, -10
	banim_frame_oam 0x0, 0x0, 0x7F, -10, -10
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x8000, 0xA1, -13, -24
	banim_frame_oam 0x8000, 0x0, 0xA5, 19, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x4000, 0x0, 0x83, 3, -32
	banim_frame_oam 0x0, 0x0, 0x85, 19, -32
	banim_frame_end
banim_bram_sw1_2_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x0, 0x7B, -18, -17
	banim_frame_oam 0x4000, 0x0, 0x7D, -26, -9
	banim_frame_oam 0x0, 0x0, 0x7F, -10, -9
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -13, -16
	banim_frame_oam 0x4000, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x19, 18, -33
	banim_frame_oam 0x4000, 0x0, 0x59, 18, -17
	banim_frame_oam 0x0, 0x0, 0x58, 10, -17
	banim_frame_end
banim_bram_sw1_2_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x0, 0x7B, -18, -17
	banim_frame_oam 0x4000, 0x0, 0x7D, -26, -9
	banim_frame_oam 0x0, 0x0, 0x7F, -10, -9
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x0, 0x4000, 0x5, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -13, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x17, 17, -35
	banim_frame_oam 0x0, 0x0, 0x57, 9, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x0, 0x7B, -18, -17
	banim_frame_oam 0x4000, 0x0, 0x7D, -26, -9
	banim_frame_oam 0x0, 0x0, 0x7F, -10, -9
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x0, 0x4000, 0x5, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -13, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x19, 19, -38
	banim_frame_oam 0x4000, 0x0, 0x59, 19, -22
	banim_frame_oam 0x0, 0x0, 0x58, 11, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_9_r:
	banim_frame_affine 247, 66, -66, 247, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -32, -23
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x0, 0x4000, 0x5, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -13, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x17, 17, -35
	banim_frame_oam 0x0, 0x0, 0x57, 9, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x9C, -32, -22
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x0, 0x4000, 0x5, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -13, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x17, 17, -35
	banim_frame_oam 0x0, 0x0, 0x57, 9, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_11_r:
	banim_frame_affine 245, -71, 71, 245, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -32, -22
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x0, 0x4000, 0x5, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -13, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x17, 17, -35
	banim_frame_oam 0x0, 0x0, 0x57, 9, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_12_r:
	banim_frame_affine 221, -128, 128, 221, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -32, -21
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x0, 0x4000, 0x5, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -13, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x17, 17, -35
	banim_frame_oam 0x0, 0x0, 0x57, 9, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_13_r:
	banim_frame_affine 252, 44, -44, 252, 1
	banim_frame_oam 0x8100, 0x8000, 0x9A, -22, -19
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x0, 0x4000, 0x5, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -13, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x17, 17, -35
	banim_frame_oam 0x0, 0x0, 0x57, 9, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_14_r:
	banim_frame_affine 255, 17, -17, 255, 1
	banim_frame_oam 0x8100, 0x8000, 0x9A, -21, -18
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x0, 0x4000, 0x5, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -13, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x17, 17, -35
	banim_frame_oam 0x0, 0x0, 0x57, 9, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_15_r:
	banim_frame_affine 249, -58, 58, 249, 1
	banim_frame_oam 0x8100, 0x8000, 0x9A, -20, -18
	banim_frame_oam 0x0, 0x4000, 0x61, 0, 0
	banim_frame_oam 0x0, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, -8
	banim_frame_oam 0x0, 0x4000, 0x5, 3, -24
	banim_frame_oam 0x4000, 0x0, 0xC6, -13, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x17, 17, -35
	banim_frame_oam 0x0, 0x0, 0x57, 9, -19
	banim_frame_end
banim_bram_sw1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0x45, 13, -40
	banim_frame_oam 0x4000, 0x8000, 0x7, -67, -16
	banim_frame_oam 0x4000, 0x8000, 0xB, -35, -16
	banim_frame_oam 0x4000, 0x8000, 0xF, -3, -16
	banim_frame_oam 0x4000, 0x4000, 0x47, -67, 0
	banim_frame_oam 0x4000, 0x4000, 0x4B, -35, 0
	banim_frame_oam 0x4000, 0x4000, 0x4F, -3, 0
	banim_frame_oam 0x4000, 0x4000, 0x67, -67, 8
	banim_frame_oam 0x4000, 0x4000, 0x6B, -35, 8
	banim_frame_oam 0x4000, 0x0, 0x6F, -3, 8
	banim_frame_oam 0x0, 0x0, 0x71, 13, 8
	banim_frame_oam 0x4000, 0x4000, 0x86, -35, -24
	banim_frame_oam 0x4000, 0x0, 0x8B, 13, -24
	banim_frame_oam 0x0, 0x0, 0x8A, 5, -24
	banim_frame_end
banim_bram_sw1_2_oam_frame_17_r:
	banim_frame_oam 0x0, 0x4000, 0x13, -35, 0
	banim_frame_oam 0x8000, 0x0, 0x15, -19, 0
	banim_frame_oam 0x0, 0x4000, 0x53, -3, -8
	banim_frame_oam 0x8000, 0x0, 0x55, 13, -8
	banim_frame_oam 0x4000, 0x0, 0x90, -3, 8
	banim_frame_oam 0x8000, 0x0, 0x16, -11, -8
	banim_frame_oam 0x0, 0x0, 0x56, -11, 8
	banim_frame_oam 0x4000, 0x0, 0x8D, -66, -18
	banim_frame_oam 0x0, 0x0, 0x8F, -50, -18
	banim_frame_oam 0x0, 0x4000, 0xAF, -66, -10
	banim_frame_oam 0x8000, 0x0, 0xB1, -50, -10
	banim_frame_oam 0x0, 0x4000, 0xAC, -42, -16
	banim_frame_oam 0x8000, 0x0, 0xAE, -26, -16
	banim_frame_oam 0x4000, 0x0, 0xEC, -50, 0
	banim_frame_oam 0x0, 0x0, 0xEE, -34, 0
	banim_frame_oam 0x4000, 0x0, 0xE9, -50, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -34, 8
	banim_frame_oam 0x0, 0x4000, 0x92, -67, -6
	banim_frame_oam 0x8000, 0x0, 0x94, -51, -6
	banim_frame_oam 0x4000, 0x0, 0x95, -59, 10
	banim_frame_oam 0x0, 0x0, 0xD4, -67, 10
	banim_frame_oam 0x0, 0x0, 0x97, -43, -6
	banim_frame_oam 0x4000, 0x0, 0xF4, -34, -11
	banim_frame_oam 0x0, 0x0, 0xF6, -18, -11
	banim_frame_oam 0x4000, 0x0, 0xB5, -32, -19
	banim_frame_oam 0x4000, 0x0, 0xD5, -26, -3
	banim_frame_end
banim_bram_sw1_2_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x0, 0x8D, -66, -18
	banim_frame_oam 0x0, 0x0, 0x8F, -50, -18
	banim_frame_oam 0x0, 0x4000, 0xAF, -66, -10
	banim_frame_oam 0x8000, 0x0, 0xB1, -50, -10
	banim_frame_oam 0x0, 0x4000, 0xAC, -42, -16
	banim_frame_oam 0x8000, 0x0, 0xAE, -26, -16
	banim_frame_oam 0x4000, 0x0, 0xEC, -50, 0
	banim_frame_oam 0x0, 0x0, 0xEE, -34, 0
	banim_frame_oam 0x4000, 0x0, 0xE9, -50, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -34, 8
	banim_frame_oam 0x4000, 0x0, 0xF4, -34, -11
	banim_frame_oam 0x0, 0x0, 0xF6, -18, -11
	banim_frame_oam 0x4000, 0x0, 0xB5, -32, -19
	banim_frame_oam 0x4000, 0x0, 0xD5, -26, -3
	banim_frame_end
banim_bram_sw1_2_oam_frame_19_r:
	banim_frame_affine 177, -184, 184, 177, 1
	banim_frame_oam 0x0, 0x4000, 0x41, -50, 0
	banim_frame_oam 0x8000, 0x0, 0x43, -34, 0
	banim_frame_oam 0x0, 0x4000, 0x4, -66, -16
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x4000, 0x0, 0x44, -66, 0
	banim_frame_oam 0x0, 0x4000, 0x2, -42, -16
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x0, 0x0, 0x82, -61, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, -38, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_20_r:
	banim_frame_affine 206, -151, 151, 206, 1
	banim_frame_oam 0x0, 0x4000, 0x41, -50, 0
	banim_frame_oam 0x8000, 0x0, 0x43, -34, 0
	banim_frame_oam 0x0, 0x4000, 0x4, -66, -16
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x4000, 0x0, 0x44, -66, 0
	banim_frame_oam 0x0, 0x4000, 0x2, -42, -16
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x0, 0x0, 0x82, -61, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, -39, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_21_r:
	banim_frame_affine 227, -116, 116, 227, 1
	banim_frame_oam 0x0, 0x4000, 0x41, -50, 0
	banim_frame_oam 0x8000, 0x0, 0x43, -34, 0
	banim_frame_oam 0x0, 0x4000, 0x4, -66, -16
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x4000, 0x0, 0x44, -66, 0
	banim_frame_oam 0x0, 0x4000, 0x2, -42, -16
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x0, 0x0, 0x82, -61, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, -40, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_22_r:
	banim_frame_affine 248, -62, 62, 248, 1
	banim_frame_oam 0x0, 0x4000, 0x41, -50, 0
	banim_frame_oam 0x8000, 0x0, 0x43, -34, 0
	banim_frame_oam 0x0, 0x4000, 0x4, -66, -16
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x4000, 0x0, 0x44, -66, 0
	banim_frame_oam 0x0, 0x4000, 0x2, -42, -16
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x0, 0x0, 0x82, -61, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, -41, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0x41, -50, 0
	banim_frame_oam 0x8000, 0x0, 0x43, -34, 0
	banim_frame_oam 0x0, 0x4000, 0x4, -66, -16
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x4000, 0x0, 0x44, -66, 0
	banim_frame_oam 0x0, 0x4000, 0x2, -42, -16
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x0, 0x0, 0x82, -61, -24
	banim_frame_oam 0x0, 0x8000, 0x9C, -41, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_24_r:
	banim_frame_affine 232, 108, -108, 232, 1
	banim_frame_oam 0x0, 0x4000, 0x4, -66, -16
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x4000, 0x0, 0x44, -66, 0
	banim_frame_oam 0x8000, 0x8000, 0x9, -42, -16
	banim_frame_oam 0x0, 0x4000, 0x47, -58, 0
	banim_frame_oam 0x0, 0x0, 0x82, -61, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, -53, -18
	banim_frame_end
banim_bram_sw1_2_oam_frame_25_r:
	banim_frame_affine 190, 171, -171, 190, 1
	banim_frame_oam 0x0, 0x4000, 0x4, -66, -16
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x4000, 0x0, 0x44, -66, 0
	banim_frame_oam 0x8000, 0x8000, 0x9, -42, -16
	banim_frame_oam 0x0, 0x4000, 0x47, -58, 0
	banim_frame_oam 0x0, 0x0, 0x82, -61, -24
	banim_frame_oam 0x100, 0x8000, 0x9C, -54, -17
	banim_frame_end
banim_bram_sw1_2_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x8D, -57, -12
	banim_frame_oam 0x4000, 0x0, 0x6C, -57, -20
	banim_frame_oam 0x0, 0x0, 0x6E, -41, -20
	banim_frame_oam 0x8000, 0x0, 0x8C, -65, -4
	banim_frame_oam 0x0, 0x0, 0xCC, -65, 12
	banim_frame_oam 0x0, 0x0, 0xAB, -25, 3
	banim_frame_oam 0x4000, 0x0, 0x50, -57, -28
	banim_frame_oam 0x0, 0x0, 0x52, -41, -28
	banim_frame_oam 0x0, 0x4000, 0x10, -57, -44
	banim_frame_oam 0x8000, 0x0, 0x12, -41, -44
	banim_frame_oam 0x4000, 0x0, 0xD1, -56, -52
	banim_frame_oam 0x0, 0x0, 0xD3, -40, -52
	banim_frame_end
banim_bram_sw1_2_oam_frame_27_r:
	banim_frame_affine 184, 177, -177, 184, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -49, -69
	banim_frame_oam 0x8000, 0x0, 0x70, -33, -69
	banim_frame_oam 0x4000, 0x0, 0xAF, -41, -53
	banim_frame_oam 0x0, 0x4000, 0x6C, -44, -39
	banim_frame_oam 0x0, 0x0, 0x6B, -52, -39
	banim_frame_oam 0x0, 0x0, 0x8B, -28, -39
	banim_frame_oam 0x4000, 0x0, 0xCF, -44, -47
	banim_frame_oam 0x0, 0x4000, 0xAC, -52, -23
	banim_frame_oam 0x8000, 0x0, 0xAE, -36, -23
	banim_frame_oam 0x0, 0x0, 0x83, -52, 8
	banim_frame_oam 0x0, 0x0, 0x66, -44, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -36, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -50, -38
	banim_frame_end
banim_bram_sw1_2_oam_frame_28_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -47, -74
	banim_frame_oam 0x8000, 0x0, 0x70, -31, -74
	banim_frame_oam 0x4000, 0x0, 0xAF, -39, -58
	banim_frame_oam 0x0, 0x4000, 0x6C, -42, -44
	banim_frame_oam 0x0, 0x0, 0x6B, -50, -44
	banim_frame_oam 0x0, 0x0, 0x8B, -26, -44
	banim_frame_oam 0x4000, 0x0, 0xCF, -42, -52
	banim_frame_oam 0x0, 0x4000, 0xAC, -50, -28
	banim_frame_oam 0x8000, 0x0, 0xAE, -34, -28
	banim_frame_oam 0x0, 0x0, 0x83, -50, 8
	banim_frame_oam 0x0, 0x0, 0x66, -42, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -34, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -49, -50
	banim_frame_end
banim_bram_sw1_2_oam_frame_29_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -44, -78
	banim_frame_oam 0x8000, 0x0, 0x70, -28, -78
	banim_frame_oam 0x4000, 0x0, 0xAF, -36, -62
	banim_frame_oam 0x0, 0x4000, 0x6C, -39, -48
	banim_frame_oam 0x0, 0x0, 0x6B, -47, -48
	banim_frame_oam 0x0, 0x0, 0x8B, -23, -48
	banim_frame_oam 0x4000, 0x0, 0xCF, -39, -56
	banim_frame_oam 0x0, 0x4000, 0xAC, -47, -32
	banim_frame_oam 0x8000, 0x0, 0xAE, -31, -32
	banim_frame_oam 0x0, 0x0, 0x83, -47, 8
	banim_frame_oam 0x0, 0x0, 0x66, -39, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -31, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -46, -54
	banim_frame_end
banim_bram_sw1_2_oam_frame_30_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -40, -84
	banim_frame_oam 0x8000, 0x0, 0x70, -24, -84
	banim_frame_oam 0x4000, 0x0, 0xAF, -32, -68
	banim_frame_oam 0x0, 0x4000, 0x6C, -35, -54
	banim_frame_oam 0x0, 0x0, 0x6B, -43, -54
	banim_frame_oam 0x0, 0x0, 0x8B, -19, -54
	banim_frame_oam 0x4000, 0x0, 0xCF, -35, -62
	banim_frame_oam 0x0, 0x4000, 0xAC, -43, -38
	banim_frame_oam 0x8000, 0x0, 0xAE, -27, -38
	banim_frame_oam 0x0, 0x0, 0x83, -43, 8
	banim_frame_oam 0x0, 0x0, 0x66, -35, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -27, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -42, -60
	banim_frame_end
banim_bram_sw1_2_oam_frame_31_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -36, -90
	banim_frame_oam 0x8000, 0x0, 0x70, -20, -90
	banim_frame_oam 0x4000, 0x0, 0xAF, -28, -74
	banim_frame_oam 0x0, 0x4000, 0x6C, -31, -60
	banim_frame_oam 0x0, 0x0, 0x6B, -39, -60
	banim_frame_oam 0x0, 0x0, 0x8B, -15, -60
	banim_frame_oam 0x4000, 0x0, 0xCF, -31, -68
	banim_frame_oam 0x0, 0x4000, 0xAC, -39, -44
	banim_frame_oam 0x8000, 0x0, 0xAE, -23, -44
	banim_frame_oam 0x0, 0x0, 0x83, -39, 8
	banim_frame_oam 0x0, 0x0, 0x66, -31, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -23, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -38, -66
	banim_frame_end
banim_bram_sw1_2_oam_frame_32_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -34, -97
	banim_frame_oam 0x8000, 0x0, 0x70, -18, -97
	banim_frame_oam 0x4000, 0x0, 0xAF, -26, -81
	banim_frame_oam 0x0, 0x4000, 0x6C, -29, -67
	banim_frame_oam 0x0, 0x0, 0x6B, -37, -67
	banim_frame_oam 0x0, 0x0, 0x8B, -13, -67
	banim_frame_oam 0x4000, 0x0, 0xCF, -29, -75
	banim_frame_oam 0x0, 0x4000, 0xAC, -37, -51
	banim_frame_oam 0x8000, 0x0, 0xAE, -21, -51
	banim_frame_oam 0x0, 0x0, 0x83, -37, 8
	banim_frame_oam 0x0, 0x0, 0x66, -29, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -21, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -36, -73
	banim_frame_end
banim_bram_sw1_2_oam_frame_33_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -32, -99
	banim_frame_oam 0x8000, 0x0, 0x70, -16, -99
	banim_frame_oam 0x4000, 0x0, 0xAF, -24, -83
	banim_frame_oam 0x0, 0x4000, 0x6C, -27, -69
	banim_frame_oam 0x0, 0x0, 0x6B, -35, -69
	banim_frame_oam 0x0, 0x0, 0x8B, -11, -69
	banim_frame_oam 0x4000, 0x0, 0xCF, -27, -77
	banim_frame_oam 0x0, 0x4000, 0xAC, -35, -53
	banim_frame_oam 0x8000, 0x0, 0xAE, -19, -53
	banim_frame_oam 0x0, 0x0, 0x83, -35, 8
	banim_frame_oam 0x0, 0x0, 0x66, -27, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -19, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -34, -75
	banim_frame_end
banim_bram_sw1_2_oam_frame_34_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -30, -100
	banim_frame_oam 0x8000, 0x0, 0x70, -14, -100
	banim_frame_oam 0x4000, 0x0, 0xAF, -22, -84
	banim_frame_oam 0x0, 0x4000, 0x6C, -25, -70
	banim_frame_oam 0x0, 0x0, 0x6B, -33, -70
	banim_frame_oam 0x0, 0x0, 0x8B, -9, -70
	banim_frame_oam 0x4000, 0x0, 0xCF, -25, -78
	banim_frame_oam 0x0, 0x4000, 0xAC, -33, -54
	banim_frame_oam 0x8000, 0x0, 0xAE, -17, -54
	banim_frame_oam 0x0, 0x0, 0x83, -33, 8
	banim_frame_oam 0x0, 0x0, 0x66, -25, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -17, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -32, -76
	banim_frame_end
banim_bram_sw1_2_oam_frame_35_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -28, -102
	banim_frame_oam 0x8000, 0x0, 0x70, -12, -102
	banim_frame_oam 0x4000, 0x0, 0xAF, -20, -86
	banim_frame_oam 0x0, 0x4000, 0x6C, -23, -72
	banim_frame_oam 0x0, 0x0, 0x6B, -31, -72
	banim_frame_oam 0x0, 0x0, 0x8B, -7, -72
	banim_frame_oam 0x4000, 0x0, 0xCF, -23, -80
	banim_frame_oam 0x0, 0x4000, 0xAC, -31, -56
	banim_frame_oam 0x8000, 0x0, 0xAE, -15, -56
	banim_frame_oam 0x0, 0x0, 0x83, -31, 8
	banim_frame_oam 0x0, 0x0, 0x66, -23, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -15, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -30, -78
	banim_frame_end
banim_bram_sw1_2_oam_frame_36_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -26, -103
	banim_frame_oam 0x8000, 0x0, 0x70, -10, -103
	banim_frame_oam 0x4000, 0x0, 0xAF, -18, -87
	banim_frame_oam 0x0, 0x4000, 0x6C, -21, -73
	banim_frame_oam 0x0, 0x0, 0x6B, -29, -73
	banim_frame_oam 0x0, 0x0, 0x8B, -5, -73
	banim_frame_oam 0x4000, 0x0, 0xCF, -21, -81
	banim_frame_oam 0x0, 0x4000, 0xAC, -29, -57
	banim_frame_oam 0x8000, 0x0, 0xAE, -13, -57
	banim_frame_oam 0x0, 0x0, 0x83, -29, 8
	banim_frame_oam 0x0, 0x0, 0x66, -21, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -13, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -28, -79
	banim_frame_end
banim_bram_sw1_2_oam_frame_37_r:
	banim_frame_affine -17, 255, -255, -17, 1
	banim_frame_oam 0x0, 0x4000, 0x6E, -25, -103
	banim_frame_oam 0x8000, 0x0, 0x70, -9, -103
	banim_frame_oam 0x4000, 0x0, 0xAF, -17, -87
	banim_frame_oam 0x0, 0x4000, 0x6C, -20, -73
	banim_frame_oam 0x0, 0x0, 0x6B, -28, -73
	banim_frame_oam 0x0, 0x0, 0x8B, -4, -73
	banim_frame_oam 0x4000, 0x0, 0xCF, -20, -81
	banim_frame_oam 0x0, 0x4000, 0xAC, -28, -57
	banim_frame_oam 0x8000, 0x0, 0xAE, -12, -57
	banim_frame_oam 0x0, 0x0, 0x83, -28, 8
	banim_frame_oam 0x0, 0x0, 0x66, -20, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -12, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -28, -76
	banim_frame_end
banim_bram_sw1_2_oam_frame_38_r:
	banim_frame_affine 116, 228, -228, 116, 1
	banim_frame_oam 0x8000, 0x8000, 0x11, -21, -89
	banim_frame_oam 0x8000, 0x4000, 0x13, -5, -89
	banim_frame_oam 0x0, 0x4000, 0x91, -21, -57
	banim_frame_oam 0x0, 0x0, 0x93, -5, -57
	banim_frame_oam 0x0, 0x4000, 0x14, 3, -81
	banim_frame_oam 0x0, 0x0, 0x54, -21, -97
	banim_frame_oam 0x0, 0x0, 0x83, -24, 8
	banim_frame_oam 0x0, 0x0, 0x66, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -8, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -24, -74
	banim_frame_end
banim_bram_sw1_2_oam_frame_39_r:
	banim_frame_affine 116, 228, -228, 116, 1
	banim_frame_oam 0x0, 0x4000, 0xD5, -12, -72
	banim_frame_oam 0x4000, 0x0, 0xF2, -20, -56
	banim_frame_oam 0x0, 0x0, 0xF4, -4, -56
	banim_frame_oam 0x0, 0x0, 0xD1, 4, -64
	banim_frame_oam 0x0, 0x0, 0xF1, 4, -72
	banim_frame_oam 0x0, 0x0, 0xEE, -20, -72
	banim_frame_oam 0x0, 0x0, 0xD2, -20, -64
	banim_frame_oam 0x4000, 0x0, 0xEC, -12, -80
	banim_frame_oam 0x4000, 0x0, 0xB3, -20, -48
	banim_frame_oam 0x0, 0x0, 0x83, -23, 8
	banim_frame_oam 0x0, 0x0, 0x66, -15, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -7, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -23, -73
	banim_frame_end
banim_bram_sw1_2_oam_frame_40_r:
	banim_frame_affine 116, 228, -228, 116, 1
	banim_frame_oam 0x8000, 0x0, 0xD7, -3, -71
	banim_frame_oam 0x0, 0x0, 0x55, -11, -63
	banim_frame_oam 0x0, 0x0, 0xD5, -11, -71
	banim_frame_oam 0x8000, 0x0, 0xD2, -19, -63
	banim_frame_oam 0x0, 0x0, 0xEE, -19, -71
	banim_frame_oam 0x4000, 0x0, 0xF3, -11, -55
	banim_frame_oam 0x4000, 0x0, 0xEC, -11, -79
	banim_frame_oam 0x4000, 0x0, 0xB3, -19, -47
	banim_frame_oam 0x0, 0x0, 0x83, -22, 8
	banim_frame_oam 0x0, 0x0, 0x66, -14, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -6, 8
	banim_frame_oam 0x0, 0x4000, 0x95, -10, -67
	banim_frame_oam 0x100, 0x8000, 0x9C, -22, -72
	banim_frame_end
banim_bram_sw1_2_oam_frame_41_r:
	banim_frame_affine 116, 228, -228, 116, 1
	banim_frame_oam 0x8000, 0x0, 0xD7, -2, -70
	banim_frame_oam 0x0, 0x0, 0x55, -10, -62
	banim_frame_oam 0x0, 0x0, 0xD5, -10, -70
	banim_frame_oam 0x8000, 0x0, 0xD2, -18, -62
	banim_frame_oam 0x0, 0x0, 0xEE, -18, -70
	banim_frame_oam 0x4000, 0x0, 0xF3, -10, -54
	banim_frame_oam 0x4000, 0x0, 0xEC, -10, -78
	banim_frame_oam 0x4000, 0x0, 0xB3, -18, -46
	banim_frame_oam 0x0, 0x0, 0x83, -21, 8
	banim_frame_oam 0x0, 0x0, 0x66, -13, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -5, 8
	banim_frame_oam 0x0, 0x4000, 0x95, -9, -66
	banim_frame_oam 0x100, 0x8000, 0x9C, -21, -71
	banim_frame_end
banim_bram_sw1_2_oam_frame_42_r:
	banim_frame_affine 116, 228, -228, 116, 1
	banim_frame_oam 0x8000, 0x0, 0xD7, -1, -69
	banim_frame_oam 0x0, 0x0, 0x55, -9, -61
	banim_frame_oam 0x0, 0x0, 0xD5, -9, -69
	banim_frame_oam 0x8000, 0x0, 0xD2, -17, -61
	banim_frame_oam 0x0, 0x0, 0xEE, -17, -69
	banim_frame_oam 0x4000, 0x0, 0xF3, -9, -53
	banim_frame_oam 0x4000, 0x0, 0xEC, -9, -77
	banim_frame_oam 0x4000, 0x0, 0xB3, -17, -45
	banim_frame_oam 0x0, 0x0, 0x83, -20, 8
	banim_frame_oam 0x0, 0x0, 0x66, -12, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -4, 8
	banim_frame_oam 0x0, 0x4000, 0x95, -8, -65
	banim_frame_oam 0x100, 0x8000, 0x9C, -20, -70
	banim_frame_end
banim_bram_sw1_2_oam_frame_43_r:
	banim_frame_affine 116, 228, -228, 116, 1
	banim_frame_oam 0x8000, 0x0, 0xD7, 0, -67
	banim_frame_oam 0x0, 0x0, 0x55, -8, -59
	banim_frame_oam 0x0, 0x0, 0xD5, -8, -67
	banim_frame_oam 0x8000, 0x0, 0xD2, -16, -59
	banim_frame_oam 0x0, 0x0, 0xEE, -16, -67
	banim_frame_oam 0x4000, 0x0, 0xF3, -8, -51
	banim_frame_oam 0x4000, 0x0, 0xEC, -8, -75
	banim_frame_oam 0x4000, 0x0, 0xB3, -16, -43
	banim_frame_oam 0x0, 0x0, 0x83, -19, 8
	banim_frame_oam 0x0, 0x0, 0x66, -11, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -3, 8
	banim_frame_oam 0x0, 0x4000, 0x95, -7, -63
	banim_frame_oam 0x100, 0x8000, 0x9C, -19, -68
	banim_frame_end
banim_bram_sw1_2_oam_frame_44_r:
	banim_frame_oam 0x0, 0x4000, 0xC, -20, -69
	banim_frame_oam 0x8000, 0x0, 0xE, -4, -69
	banim_frame_oam 0x4000, 0x0, 0x4C, -20, -53
	banim_frame_oam 0x0, 0x0, 0x4E, -4, -53
	banim_frame_oam 0x8000, 0x0, 0xF, 4, -68
	banim_frame_oam 0x4000, 0x0, 0xEB, -19, 8
	banim_frame_oam 0x0, 0x0, 0xCB, -3, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_45_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -20, -67
	banim_frame_oam 0x8000, 0x0, 0x2, -4, -67
	banim_frame_oam 0x4000, 0x0, 0x40, -20, -51
	banim_frame_oam 0x0, 0x0, 0x42, -4, -51
	banim_frame_oam 0x0, 0x0, 0x3, -9, -75
	banim_frame_oam 0x4000, 0x0, 0x4, -19, 8
	banim_frame_oam 0x0, 0x0, 0x6, -3, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_46_r:
	banim_frame_oam 0x0, 0x4000, 0x60, -22, -67
	banim_frame_oam 0x8000, 0x0, 0x62, -6, -67
	banim_frame_oam 0x4000, 0x0, 0xA0, -22, -51
	banim_frame_oam 0x0, 0x0, 0xA2, -6, -51
	banim_frame_oam 0x4000, 0x0, 0x4, -19, 8
	banim_frame_oam 0x0, 0x0, 0x6, -3, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_47_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -22, -67
	banim_frame_oam 0x8000, 0x0, 0xC2, -6, -67
	banim_frame_oam 0x4000, 0x0, 0xE3, -22, -51
	banim_frame_oam 0x0, 0x0, 0xE5, -6, -51
	banim_frame_oam 0x4000, 0x0, 0x4, -18, 8
	banim_frame_oam 0x0, 0x0, 0x6, -2, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_48_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -22, -66
	banim_frame_oam 0x8000, 0x0, 0xC2, -6, -66
	banim_frame_oam 0x4000, 0x0, 0xE3, -22, -50
	banim_frame_oam 0x0, 0x0, 0xE5, -6, -50
	banim_frame_oam 0x4000, 0x0, 0x4, -18, 8
	banim_frame_oam 0x0, 0x0, 0x6, -2, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_49_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -20, -65
	banim_frame_oam 0x8000, 0x0, 0x2, -4, -65
	banim_frame_oam 0x4000, 0x0, 0x40, -20, -49
	banim_frame_oam 0x0, 0x0, 0x42, -4, -49
	banim_frame_oam 0x0, 0x0, 0x3, -9, -73
	banim_frame_oam 0x4000, 0x0, 0x4, -17, 8
	banim_frame_oam 0x0, 0x0, 0x6, -1, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_50_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -20, -64
	banim_frame_oam 0x8000, 0x0, 0x2, -4, -64
	banim_frame_oam 0x4000, 0x0, 0x40, -20, -48
	banim_frame_oam 0x0, 0x0, 0x42, -4, -48
	banim_frame_oam 0x0, 0x0, 0x3, -9, -72
	banim_frame_oam 0x4000, 0x0, 0x4, -17, 8
	banim_frame_oam 0x0, 0x0, 0x6, -1, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_51_r:
	banim_frame_oam 0x0, 0x4000, 0x60, -20, -61
	banim_frame_oam 0x8000, 0x0, 0x62, -4, -61
	banim_frame_oam 0x4000, 0x0, 0xA0, -20, -45
	banim_frame_oam 0x0, 0x0, 0xA2, -4, -45
	banim_frame_oam 0x4000, 0x0, 0x4, -17, 8
	banim_frame_oam 0x0, 0x0, 0x6, -1, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_52_r:
	banim_frame_oam 0x0, 0x4000, 0x60, -20, -60
	banim_frame_oam 0x8000, 0x0, 0x62, -4, -60
	banim_frame_oam 0x4000, 0x0, 0xA0, -20, -44
	banim_frame_oam 0x0, 0x0, 0xA2, -4, -44
	banim_frame_oam 0x4000, 0x0, 0x4, -17, 8
	banim_frame_oam 0x0, 0x0, 0x6, -1, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_53_r:
	banim_frame_oam 0x4000, 0x8000, 0x23, -21, -58
	banim_frame_oam 0x4000, 0x4000, 0x63, -21, -42
	banim_frame_oam 0x4000, 0x0, 0x4, -16, 8
	banim_frame_oam 0x0, 0x0, 0x6, 0, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_54_r:
	banim_frame_oam 0x4000, 0x8000, 0x23, -20, -57
	banim_frame_oam 0x4000, 0x4000, 0x63, -20, -41
	banim_frame_oam 0x4000, 0x0, 0x4, -15, 8
	banim_frame_oam 0x0, 0x0, 0x6, 1, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_55_r:
	banim_frame_affine 235, -100, 100, 235, 1
	banim_frame_oam 0x0, 0x4000, 0x97, -8, -53
	banim_frame_oam 0x0, 0x0, 0x78, -16, -53
	banim_frame_oam 0x4000, 0x0, 0x75, -16, -61
	banim_frame_oam 0x0, 0x0, 0x77, 0, -61
	banim_frame_oam 0x0, 0x4000, 0xD8, -8, -37
	banim_frame_oam 0x0, 0x0, 0xDA, 8, -37
	banim_frame_oam 0x0, 0x0, 0xFA, -16, -37
	banim_frame_oam 0x0, 0x0, 0x83, -12, 8
	banim_frame_oam 0x0, 0x0, 0x66, -4, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 4, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -28, -45
	banim_frame_end
banim_bram_sw1_2_oam_frame_56_r:
	banim_frame_affine -61, 248, -248, -61, 1
	banim_frame_oam 0x4000, 0x0, 0x1A, -14, -44
	banim_frame_oam 0x0, 0x4000, 0x3A, -16, -36
	banim_frame_oam 0x0, 0x0, 0x59, 2, -60
	banim_frame_oam 0x0, 0x0, 0x83, -11, 8
	banim_frame_oam 0x0, 0x0, 0x66, -3, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 5, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -31, -58
	banim_frame_oam 0x8000, 0x0, 0x36, 0, -36
	banim_frame_oam 0x0, 0x0, 0x39, 8, -28
	banim_frame_oam 0x4000, 0x0, 0x57, 0, -52
	banim_frame_oam 0x0, 0x0, 0x37, 2, -44
	banim_frame_end
banim_bram_sw1_2_oam_frame_57_r:
	banim_frame_affine -183, 178, -178, -183, 1
	banim_frame_oam 0x4000, 0x0, 0x1A, -13, -43
	banim_frame_oam 0x0, 0x4000, 0x3A, -15, -35
	banim_frame_oam 0x0, 0x0, 0x59, 3, -59
	banim_frame_oam 0x8000, 0x0, 0x36, 1, -35
	banim_frame_oam 0x0, 0x0, 0x39, 9, -27
	banim_frame_oam 0x4000, 0x0, 0x57, 1, -51
	banim_frame_oam 0x0, 0x0, 0x37, 3, -43
	banim_frame_oam 0x0, 0x0, 0x83, -10, 8
	banim_frame_oam 0x0, 0x0, 0x66, -2, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 6, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -28, -59
	banim_frame_end
banim_bram_sw1_2_oam_frame_58_r:
	banim_frame_affine -235, 100, -100, -235, 1
	banim_frame_oam 0x0, 0x0, 0xA6, -8, -38
	banim_frame_oam 0x0, 0x0, 0x9B, 6, -22
	banim_frame_oam 0x0, 0x0, 0xBB, 14, -22
	banim_frame_oam 0x0, 0x0, 0x83, -7, 8
	banim_frame_oam 0x0, 0x0, 0x66, 1, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 9, 8
	banim_frame_oam 0x4000, 0x0, 0x99, -10, -22
	banim_frame_oam 0x4000, 0x0, 0xB9, -8, -14
	banim_frame_oam 0x100, 0x8000, 0x9C, -23, -55
	banim_frame_oam 0x8000, 0x0, 0xAB, 22, -30
	banim_frame_oam 0x0, 0x0, 0x38, 14, -30
	banim_frame_oam 0x4000, 0x0, 0x79, -10, -30
	banim_frame_oam 0x0, 0x0, 0x7B, 6, -30
	banim_frame_end
banim_bram_sw1_2_oam_frame_59_r:
	banim_frame_affine -249, -57, 57, -249, 1
	banim_frame_oam 0x0, 0x4000, 0xA3, -9, -24
	banim_frame_oam 0x8000, 0x0, 0xA5, 7, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -9, -32
	banim_frame_oam 0x0, 0x0, 0x85, -1, -8
	banim_frame_oam 0x0, 0x0, 0xC6, 15, -16
	banim_frame_oam 0x0, 0x0, 0x86, 10, -8
	banim_frame_oam 0x0, 0x0, 0xA6, 23, -16
	banim_frame_oam 0x4000, 0x0, 0x4, -5, 8
	banim_frame_oam 0x0, 0x0, 0x6, 11, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -15, -52
	banim_frame_end
banim_bram_sw1_2_oam_frame_60_r:
	banim_frame_affine -235, -99, 99, -235, 1
	banim_frame_oam 0x0, 0x4000, 0xA3, -8, -20
	banim_frame_oam 0x8000, 0x0, 0xA5, 8, -20
	banim_frame_oam 0x4000, 0x0, 0x83, -8, -28
	banim_frame_oam 0x0, 0x0, 0x85, 0, -4
	banim_frame_oam 0x0, 0x0, 0xC6, 16, -12
	banim_frame_oam 0x0, 0x0, 0x86, 11, -4
	banim_frame_oam 0x0, 0x0, 0xA6, 24, -12
	banim_frame_oam 0x4000, 0x0, 0x4, -4, 8
	banim_frame_oam 0x0, 0x0, 0x6, 12, 8
	banim_frame_oam 0x100, 0x8000, 0x9C, -13, -47
	banim_frame_end
banim_bram_sw1_2_oam_frame_61_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x29, 8, -8
	banim_frame_oam 0x0, 0x0, 0x69, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE6, -16, -2
	banim_frame_oam 0x0, 0x0, 0x9, 0, -24
	banim_frame_oam 0x0, 0x4000, 0x1A, 0, -30
	banim_frame_oam 0x4000, 0x0, 0x5A, 0, -14
	banim_frame_oam 0x0, 0x0, 0x7B, -8, -18
	banim_frame_end
banim_bram_sw1_2_oam_frame_62_r:
	banim_frame_affine 120, 225, -225, 120, 2
	banim_frame_affine -235, -99, 99, -235, 2
	banim_frame_oam 0x0, 0x0, 0xE6, -16, -2
	banim_frame_oam 0x0, 0x4000, 0xA, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x4A, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xC, 8, -8
	banim_frame_oam 0x4000, 0x0, 0x67, -8, 8
	banim_frame_oam 0x0, 0x0, 0x69, 8, 8
	banim_frame_oam 0x100, 0x4000, 0x87, -13, -5
	banim_frame_oam 0x100, 0x8200, 0x9C, -19, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_63_r:
	banim_frame_affine 120, 225, -225, 120, 2
	banim_frame_affine -235, -99, 99, -235, 2
	banim_frame_oam 0x0, 0x0, 0xE6, -16, -2
	banim_frame_oam 0x0, 0x4000, 0xA, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x4A, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xC, 8, -8
	banim_frame_oam 0x4000, 0x0, 0x67, -8, 8
	banim_frame_oam 0x0, 0x0, 0x69, 8, 8
	banim_frame_oam 0x100, 0x4000, 0x87, -15, -3
	banim_frame_oam 0x100, 0x8200, 0x9C, -21, -14
	banim_frame_end
banim_bram_sw1_2_oam_frame_64_r:
	banim_frame_affine 225, -120, 120, 225, 2
	banim_frame_affine -255, 0, 0, -255, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -21, -9
	banim_frame_oam 0x100, 0x4200, 0x87, -16, -6
	banim_frame_oam 0x0, 0x0, 0xE6, -16, -2
	banim_frame_oam 0x0, 0x4000, 0xA, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x4A, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xC, 8, -8
	banim_frame_oam 0x4000, 0x0, 0x67, -8, 8
	banim_frame_oam 0x0, 0x0, 0x69, 8, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_65_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, -9, -10
	banim_frame_oam 0x4000, 0x0, 0x5D, -9, 6
	banim_frame_oam 0x0, 0x4000, 0x1B, -9, -17
	banim_frame_oam 0x0, 0x0, 0x5C, -17, -9
	banim_frame_oam 0x0, 0x0, 0x5B, -9, -1
	banim_frame_oam 0x8000, 0x8000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_66_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, -5, -10
	banim_frame_oam 0x4000, 0x0, 0x5D, -5, 6
	banim_frame_oam 0x0, 0x4000, 0x1B, -5, -17
	banim_frame_oam 0x0, 0x0, 0x5C, -13, -9
	banim_frame_oam 0x0, 0x0, 0x5B, -5, -1
	banim_frame_oam 0x8000, 0x8000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_67_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, -1, -10
	banim_frame_oam 0x4000, 0x0, 0x5D, -1, 6
	banim_frame_oam 0x0, 0x4000, 0x1B, -1, -17
	banim_frame_oam 0x0, 0x0, 0x5C, -9, -9
	banim_frame_oam 0x0, 0x0, 0x5B, -1, -1
	banim_frame_oam 0x8000, 0x8000, 0x20, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_74_r:
	banim_frame_oam 0x0, 0x8000, 0x1C, -3, -15
	banim_frame_oam 0x0, 0x4000, 0xDA, 5, -15
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_75_r:
	banim_frame_affine 231, -108, 108, 231, 2
	banim_frame_affine 216, -136, 136, 216, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, 0, -17
	banim_frame_oam 0x100, 0x4200, 0xDA, 5, -17
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_76_r:
	banim_frame_affine 209, -147, 147, 209, 2
	banim_frame_affine 195, -165, 165, 195, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, 1, -18
	banim_frame_oam 0x100, 0x4200, 0xDA, 4, -17
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_77_r:
	banim_frame_affine 195, -165, 165, 195, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 2, -19
	banim_frame_oam 0x100, 0x4000, 0xDA, 5, -18
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_78_r:
	banim_frame_affine 153, -204, 204, 153, 2
	banim_frame_affine 174, -187, 187, 174, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, 4, -22
	banim_frame_oam 0x100, 0x4200, 0xDA, 7, -19
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_79_r:
	banim_frame_affine 123, -224, 224, 123, 2
	banim_frame_affine 115, -228, 228, 115, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, 6, -23
	banim_frame_oam 0x100, 0x4200, 0xDA, 7, -19
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_80_r:
	banim_frame_affine 48, -251, 251, 48, 2
	banim_frame_affine 35, -253, 253, 35, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, 9, -26
	banim_frame_oam 0x100, 0x4200, 0xDA, 9, -20
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_81_r:
	banim_frame_affine 167, -193, 193, 167, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 3, -19
	banim_frame_oam 0x100, 0x4000, 0xDA, 5, -17
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_82_r:
	banim_frame_affine 209, -147, 147, 209, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, 0, -16
	banim_frame_oam 0x100, 0x4000, 0xDA, 3, -15
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_83_r:
	banim_frame_affine 231, -108, 108, 231, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -3, -14
	banim_frame_oam 0x100, 0x4000, 0xDA, 2, -14
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_84_r:
	banim_frame_affine 251, -49, 49, 251, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -9, -13
	banim_frame_oam 0x100, 0x4000, 0xDA, -2, -13
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_85_r:
	banim_frame_affine 242, 83, -83, 242, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -16, -14
	banim_frame_oam 0x100, 0x4000, 0xDA, -5, -13
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x89, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x6A, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_86_r:
	banim_frame_affine 199, 161, -161, 199, 2
	banim_frame_affine 157, 201, -201, 157, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -30, -34
	banim_frame_oam 0x100, 0x4200, 0xDA, -18, -30
	banim_frame_oam 0x0, 0x4000, 0xCC, -9, -16
	banim_frame_oam 0x8000, 0x0, 0xCE, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xE7, -9, -24
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_87_r:
	banim_frame_affine 108, 231, -231, 108, 2
	banim_frame_affine 157, 201, -201, 157, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -32, -37
	banim_frame_oam 0x100, 0x4200, 0xDA, -17, -32
	banim_frame_oam 0x0, 0x4000, 0xCC, -9, -16
	banim_frame_oam 0x8000, 0x0, 0xCE, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xE7, -9, -24
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_88_r:
	banim_frame_affine 26, 254, -254, 26, 2
	banim_frame_affine 40, 252, -252, 40, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -33, -42
	banim_frame_oam 0x100, 0x4200, 0xDA, -18, -34
	banim_frame_oam 0x0, 0x4000, 0xCC, -9, -16
	banim_frame_oam 0x8000, 0x0, 0xCE, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xE7, -9, -24
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_89_r:
	banim_frame_affine -99, 235, -235, -99, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -31, -49
	banim_frame_oam 0x100, 0x4000, 0xDA, -17, -37
	banim_frame_oam 0x0, 0x4000, 0xCC, -9, -16
	banim_frame_oam 0x8000, 0x0, 0xCE, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xE7, -9, -24
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_90_r:
	banim_frame_affine -223, 124, -124, -223, 2
	banim_frame_affine -221, 128, -128, -221, 2
	banim_frame_oam 0x100, 0x8000, 0x1C, -27, -53
	banim_frame_oam 0x100, 0x4200, 0xDA, -16, -37
	banim_frame_oam 0x0, 0x4000, 0xCC, -9, -16
	banim_frame_oam 0x8000, 0x0, 0xCE, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xE7, -9, -24
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_91_r:
	banim_frame_oam 0x0, 0x4000, 0xCC, -9, -16
	banim_frame_oam 0x8000, 0x0, 0xCE, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xE7, -9, -24
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_92_r:
	banim_frame_oam 0x0, 0x4000, 0xE, 0, -16
	banim_frame_oam 0x4000, 0x0, 0x4E, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0xD, -8, -24
	banim_frame_oam 0x8000, 0x0, 0x4C, -16, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_93_r:
	banim_frame_oam 0x4000, 0x4000, 0xAC, -20, 10
	banim_frame_oam 0x0, 0x0, 0x6E, -20, 2
	banim_frame_oam 0x0, 0x4000, 0xE, 0, -16
	banim_frame_oam 0x4000, 0x0, 0x4E, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0xD, -8, -24
	banim_frame_oam 0x8000, 0x0, 0x4C, -16, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_oam 0x4000, 0x4000, 0xEF, -7, 2
	banim_frame_oam 0x0, 0x0, 0xCF, 17, 10
	banim_frame_end
banim_bram_sw1_2_oam_frame_94_r:
	banim_frame_oam 0x0, 0x4000, 0x70, 9, 2
	banim_frame_oam 0x0, 0x0, 0x8F, 1, 10
	banim_frame_oam 0x0, 0x0, 0xB0, -7, 10
	banim_frame_oam 0x0, 0x4000, 0xE, 0, -16
	banim_frame_oam 0x4000, 0x0, 0x4E, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0xD, -8, -24
	banim_frame_oam 0x8000, 0x0, 0x4C, -16, -24
	banim_frame_oam 0x0, 0x0, 0xC8, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x10, -19, -7
	banim_frame_oam 0x4000, 0x0, 0x50, -19, 9
	banim_frame_oam 0x0, 0x0, 0x6F, -27, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_95_r:
	banim_frame_oam 0x4000, 0x0, 0x40, -13, -54
	banim_frame_oam 0x8000, 0x8000, 0x60, -14, -46
	banim_frame_oam 0x8000, 0x4000, 0x62, 2, -46
	banim_frame_oam 0x4000, 0x0, 0xE0, -6, -14
	banim_frame_oam 0x4000, 0x8000, 0x2, -30, -6
	banim_frame_oam 0x4000, 0x8000, 0x6, 2, -6
	banim_frame_oam 0x4000, 0x4000, 0x42, -22, 10
	banim_frame_oam 0x4000, 0x0, 0x46, 10, 10
	banim_frame_oam 0x0, 0x0, 0x1, 34, -6
	banim_frame_oam 0x0, 0x0, 0xE2, -22, -14
	banim_frame_oam 0x4000, 0x0, 0x20, -13, -62
	banim_frame_oam 0x0, 0x0, 0x0, -13, -70
	banim_frame_end
banim_bram_sw1_2_oam_frame_96_r:
	banim_frame_oam 0x0, 0x4000, 0xB1, -12, -57
	banim_frame_oam 0x0, 0x4000, 0x12, -18, -73
	banim_frame_oam 0x0, 0x0, 0x34, -2, -65
	banim_frame_oam 0x4000, 0x0, 0x52, -10, -41
	banim_frame_oam 0x0, 0x0, 0xD0, -18, -81
	banim_frame_oam 0x0, 0x5000, 0x70, -21, 2
	banim_frame_oam 0x0, 0x1000, 0x8F, -5, 10
	banim_frame_oam 0x0, 0x1000, 0xB0, 3, 10
	banim_frame_oam 0x0, 0x5000, 0x10, 5, -7
	banim_frame_oam 0x4000, 0x1000, 0x50, 5, 9
	banim_frame_oam 0x0, 0x1000, 0x6F, 21, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_97_r:
	banim_frame_oam 0x0, 0x4000, 0xB1, -15, -73
	banim_frame_oam 0x0, 0x4000, 0x12, -21, -89
	banim_frame_oam 0x0, 0x0, 0x34, -5, -81
	banim_frame_oam 0x4000, 0x0, 0x52, -13, -57
	banim_frame_oam 0x0, 0x0, 0xD0, -21, -97
	banim_frame_oam 0x0, 0x5000, 0x70, -21, 2
	banim_frame_oam 0x0, 0x1000, 0x8F, -5, 10
	banim_frame_oam 0x0, 0x1000, 0xB0, 3, 10
	banim_frame_oam 0x0, 0x5000, 0x10, 5, -7
	banim_frame_oam 0x4000, 0x1000, 0x50, 5, 9
	banim_frame_oam 0x0, 0x1000, 0x6F, 21, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_98_r:
	banim_frame_oam 0x0, 0x4000, 0xB1, -18, -89
	banim_frame_oam 0x0, 0x4000, 0x12, -24, -105
	banim_frame_oam 0x0, 0x0, 0x34, -8, -97
	banim_frame_oam 0x4000, 0x0, 0x52, -16, -73
	banim_frame_oam 0x0, 0x0, 0xD0, -24, -113
	banim_frame_oam 0x4000, 0x4000, 0xAC, -20, 9
	banim_frame_oam 0x0, 0x0, 0x6E, -20, 1
	banim_frame_oam 0x4000, 0x4000, 0xEF, -9, 2
	banim_frame_oam 0x0, 0x0, 0xCF, 15, 10
	banim_frame_end
banim_bram_sw1_2_oam_frame_99_r:
	banim_frame_oam 0x0, 0x4000, 0xB1, -21, -103
	banim_frame_oam 0x0, 0x4000, 0x12, -27, -119
	banim_frame_oam 0x0, 0x0, 0x34, -11, -111
	banim_frame_oam 0x4000, 0x0, 0x52, -19, -87
	banim_frame_oam 0x0, 0x0, 0xD0, -27, -127
	banim_frame_oam 0x4000, 0x4000, 0xAC, -20, 9
	banim_frame_oam 0x0, 0x0, 0x6E, -20, 1
	banim_frame_oam 0x4000, 0x4000, 0xEF, -9, 2
	banim_frame_oam 0x0, 0x0, 0xCF, 15, 10
	banim_frame_end
banim_bram_sw1_2_oam_frame_100_r:
	banim_frame_oam 0x8000, 0x0, 0x4B, -63, -92
	banim_frame_oam 0x0, 0x0, 0x8B, -63, -76
	banim_frame_oam 0x0, 0x0, 0x2B, -71, -76
	banim_frame_oam 0x0, 0x0, 0x2A, -71, -92
	banim_frame_oam 0x4000, 0x0, 0xA, -47, -116
	banim_frame_oam 0x0, 0x4000, 0x49, -47, -108
	banim_frame_oam 0x8000, 0x8000, 0x88, -55, -92
	banim_frame_oam 0x8000, 0x4000, 0x8A, -39, -92
	banim_frame_oam 0x0, 0x0, 0x48, -40, -124
	banim_frame_oam 0x0, 0x8000, 0x84, -56, -52
	banim_frame_oam 0x4000, 0x0, 0x64, -56, -60
	banim_frame_oam 0x0, 0x0, 0x66, -40, -60
	banim_frame_oam 0x8000, 0x0, 0x63, -64, -44
	banim_frame_oam 0x0, 0x0, 0xA3, -64, -28
	banim_frame_oam 0x4000, 0x0, 0xEB, -52, 8
	banim_frame_oam 0x0, 0x0, 0xCB, -36, 8
	banim_frame_end
banim_bram_sw1_2_oam_frame_101_r:
	banim_frame_oam 0x0, 0x4000, 0x15, -60, -26
	banim_frame_oam 0x8000, 0x0, 0x17, -44, -26
	banim_frame_oam 0x4000, 0x0, 0x55, -60, -10
	banim_frame_oam 0x0, 0x0, 0x57, -44, -10
	banim_frame_oam 0x8000, 0x0, 0x18, -36, -22
	banim_frame_oam 0x0, 0x0, 0x14, -43, -2
	banim_frame_oam 0x4000, 0x0, 0x4, -54, 8
	banim_frame_oam 0x0, 0x0, 0x6, -38, 8
	banim_frame_oam 0x8000, 0x0, 0x79, -62, -20
	banim_frame_oam 0x0, 0x0, 0xB9, -62, -4
	banim_frame_oam 0x0, 0x0, 0x58, -54, -10
	banim_frame_end
banim_bram_sw1_2_oam_frame_102_r:
	banim_frame_oam 0x8000, 0x8000, 0x73, -52, -26
	banim_frame_oam 0x4000, 0x0, 0xF3, -52, 6
	banim_frame_oam 0x0, 0x0, 0x92, -60, -18
	banim_frame_oam 0x0, 0x0, 0x72, -60, -10
	banim_frame_oam 0x4000, 0x0, 0x4, -54, 8
	banim_frame_oam 0x0, 0x0, 0x6, -38, 8
	banim_frame_oam 0x8000, 0x0, 0x79, -62, -20
	banim_frame_oam 0x0, 0x0, 0xB9, -62, -4
	banim_frame_oam 0x0, 0x0, 0x58, -54, -10
	banim_frame_end
banim_bram_sw1_2_oam_frame_103_r:
	banim_frame_oam 0x8000, 0x8000, 0x76, -52, -24
	banim_frame_oam 0x4000, 0x0, 0xF5, -58, 8
	banim_frame_oam 0x0, 0x0, 0xF7, -42, 8
	banim_frame_oam 0x8000, 0x0, 0x75, -60, -16
	banim_frame_oam 0x0, 0x0, 0xB5, -52, -32
	banim_frame_oam 0x8000, 0x0, 0x79, -62, -20
	banim_frame_oam 0x0, 0x0, 0xB9, -62, -4
	banim_frame_oam 0x0, 0x0, 0x58, -54, -10
	banim_frame_oam 0x0, 0x0, 0xD5, -36, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_104_r:
	banim_frame_affine -230, -111, 111, -230, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -63, -53
	banim_frame_oam 0x8000, 0x8000, 0x76, -52, -24
	banim_frame_oam 0x4000, 0x0, 0xF5, -58, 8
	banim_frame_oam 0x0, 0x0, 0xF7, -42, 8
	banim_frame_oam 0x8000, 0x0, 0x75, -60, -16
	banim_frame_oam 0x0, 0x0, 0xB5, -52, -32
	banim_frame_oam 0x8000, 0x0, 0x79, -62, -20
	banim_frame_oam 0x0, 0x0, 0xB9, -62, -4
	banim_frame_oam 0x0, 0x0, 0x58, -54, -10
	banim_frame_oam 0x0, 0x0, 0xD5, -36, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_105_r:
	banim_frame_affine -255, -4, 4, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -64, -49
	banim_frame_oam 0x8000, 0x8000, 0x76, -52, -24
	banim_frame_oam 0x4000, 0x0, 0xF5, -58, 8
	banim_frame_oam 0x0, 0x0, 0xF7, -42, 8
	banim_frame_oam 0x8000, 0x0, 0x75, -60, -16
	banim_frame_oam 0x0, 0x0, 0xB5, -52, -32
	banim_frame_oam 0x8000, 0x0, 0x79, -62, -20
	banim_frame_oam 0x0, 0x0, 0xB9, -62, -4
	banim_frame_oam 0x0, 0x0, 0x58, -54, -10
	banim_frame_oam 0x0, 0x0, 0xD5, -36, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_106_r:
	banim_frame_affine -206, 150, -150, -206, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -68, -46
	banim_frame_oam 0x8000, 0x8000, 0x76, -52, -24
	banim_frame_oam 0x4000, 0x0, 0xF5, -58, 8
	banim_frame_oam 0x0, 0x0, 0xF7, -42, 8
	banim_frame_oam 0x8000, 0x0, 0x75, -60, -16
	banim_frame_oam 0x0, 0x0, 0xB5, -52, -32
	banim_frame_oam 0x8000, 0x0, 0x79, -62, -20
	banim_frame_oam 0x0, 0x0, 0xB9, -62, -4
	banim_frame_oam 0x0, 0x0, 0x58, -54, -10
	banim_frame_oam 0x0, 0x0, 0xD5, -36, -16
	banim_frame_end
banim_bram_sw1_2_oam_frame_107_r:
	banim_frame_affine -35, 253, -253, -35, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -48, -28
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_108_r:
	banim_frame_affine 139, 214, -214, 139, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -48, -24
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_109_r:
	banim_frame_affine 219, 131, -131, 219, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -46, -23
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_110_r:
	banim_frame_affine 251, -49, 49, 251, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -40, -23
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_111_r:
	banim_frame_affine 99, -235, 235, 99, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -36, -24
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_112_r:
	banim_frame_affine 8, -255, 255, 8, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -36, -26
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_113_r:
	banim_frame_affine -96, -237, 237, -96, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -36, -28
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_114_r:
	banim_frame_affine -187, -174, 174, -187, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -37, -32
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_115_r:
	banim_frame_affine -255, -17, 17, -255, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -39, -33
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_116_r:
	banim_frame_affine -240, 87, -87, -240, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -41, -35
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_117_r:
	banim_frame_affine -177, 184, -184, -177, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -44, -34
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_118_r:
	banim_frame_affine 31, 254, -254, 31, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -48, -29
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_119_r:
	banim_frame_affine 214, 139, -139, 214, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -47, -23
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_120_r:
	banim_frame_affine 251, -49, 49, 251, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -43, -21
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_121_r:
	banim_frame_affine 174, -187, 187, 174, 1
	banim_frame_oam 0x100, 0x8000, 0x1C, -38, -23
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_122_r:
	banim_frame_affine 99, -235, 235, 99, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -36, -25
	banim_frame_end
banim_bram_sw1_2_oam_frame_123_r:
	banim_frame_affine -100, -235, 235, -100, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -35, -30
	banim_frame_end
banim_bram_sw1_2_oam_frame_124_r:
	banim_frame_affine -228, -115, 115, -228, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -38, -32
	banim_frame_end
banim_bram_sw1_2_oam_frame_125_r:
	banim_frame_affine -235, 100, -100, -235, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -44, -32
	banim_frame_end
banim_bram_sw1_2_oam_frame_126_r:
	banim_frame_affine -48, 251, -251, -48, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -47, -29
	banim_frame_end
banim_bram_sw1_2_oam_frame_127_r:
	banim_frame_affine 100, 235, -235, 100, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -48, -25
	banim_frame_end
banim_bram_sw1_2_oam_frame_128_r:
	banim_frame_affine 235, 99, -99, 235, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -44, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_129_r:
	banim_frame_affine 243, -79, 79, 243, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -40, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_130_r:
	banim_frame_affine 183, -178, 178, 183, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -38, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_131_r:
	banim_frame_affine 107, -232, 232, 107, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -37, -25
	banim_frame_end
banim_bram_sw1_2_oam_frame_132_r:
	banim_frame_affine 177, -184, 184, 177, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -38, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_133_r:
	banim_frame_affine 206, -151, 151, 206, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -39, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_134_r:
	banim_frame_affine 227, -116, 116, 227, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -40, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_135_r:
	banim_frame_affine 248, -62, 62, 248, 1
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -41, -23
	banim_frame_end
banim_bram_sw1_2_oam_frame_136_r:
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -42, -16
	banim_frame_oam 0x8000, 0x0, 0x41, -50, 0
	banim_frame_oam 0x0, 0x0, 0x40, -26, -15
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x0, 0x8000, 0x9C, -41, -22
	banim_frame_end
banim_bram_sw1_2_oam_frame_137_r:
	banim_frame_affine 232, 108, -108, 232, 1
	banim_frame_oam 0x8000, 0x8000, 0x9, -42, -16
	banim_frame_oam 0x0, 0x4000, 0x47, -58, 0
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -53, -18
	banim_frame_end
banim_bram_sw1_2_oam_frame_138_r:
	banim_frame_affine 184, 177, -177, 184, 1
	banim_frame_oam 0x8000, 0x8000, 0x9, -42, -16
	banim_frame_oam 0x0, 0x4000, 0x47, -58, 0
	banim_frame_oam 0x8000, 0x0, 0x6, -50, -16
	banim_frame_oam 0x8000, 0x0, 0x88, -58, -15
	banim_frame_oam 0x0, 0x0, 0xC8, -58, 1
	banim_frame_oam 0x100, 0x8000, 0x9C, -54, -18
	banim_frame_end
banim_bram_sw1_2_oam_frame_68_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bram_sw1_2_oam_frame_72_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bram_sw1_2_oam_frame_73_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bram_sw1_2_oam_frame_71_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_bram_sw1_2_oam_frame_141_r:
	banim_frame_oam 0x4000, 0x8000, 0xA1, -3, -10
	banim_frame_oam 0x4000, 0x4000, 0xE1, -3, 6
	banim_frame_oam 0x0, 0x0, 0xA0, -11, -10
	banim_frame_oam 0x0, 0x0, 0xE0, -11, 6
	banim_frame_oam 0x0, 0x0, 0xA5, 29, -2
	banim_frame_oam 0x4000, 0x4000, 0x16, -11, -18
	banim_frame_oam 0x4000, 0x0, 0xE5, 12, 14
	banim_frame_oam 0x4000, 0x0, 0xC5, -4, 14
	banim_frame_oam 0x0, 0x0, 0xC0, 28, 14
	banim_frame_end
banim_bram_sw1_2_oam_frame_142_r:
	banim_frame_oam 0x4000, 0x4000, 0x13, 0, -9
	banim_frame_oam 0x4000, 0x8000, 0x33, 1, -1
	banim_frame_oam 0x4000, 0x4000, 0x73, 1, 15
	banim_frame_oam 0x4000, 0x0, 0x70, 0, -17
	banim_frame_oam 0x0, 0x0, 0x72, 16, -17
	banim_frame_end
banim_bram_sw1_2_oam_frame_69_r:
	banim_frame_oam 0x0, 0x0, 0xEF, -69, -18
	banim_frame_oam 0x0, 0x0, 0xF0, -69, -10
	banim_frame_end
banim_bram_sw1_2_oam_frame_70_r:
	banim_frame_oam 0x0, 0x0, 0x80, -69, -18
	banim_frame_oam 0x0, 0x0, 0x81, -69, -10
	banim_frame_end
banim_bram_sw1_2_oam_frame_139_r:
	banim_frame_oam 0x8000, 0x0, 0x78, -70, -20
	banim_frame_oam 0x0, 0x0, 0xB8, -70, -4
	banim_frame_end
banim_bram_sw1_2_oam_frame_140_r:
	banim_frame_oam 0x8000, 0x0, 0x87, -66, -15
	banim_frame_oam 0x0, 0x0, 0xC7, -66, 1
	banim_frame_end
banim_bram_sw1_2_oam_frame_143_r:
	banim_frame_oam 0x0, 0x4000, 0x13, -35, 0
	banim_frame_oam 0x8000, 0x0, 0x15, -19, 0
	banim_frame_oam 0x0, 0x4000, 0x53, -3, -8
	banim_frame_oam 0x8000, 0x0, 0x55, 13, -8
	banim_frame_oam 0x4000, 0x0, 0x90, -3, 8
	banim_frame_oam 0x8000, 0x0, 0x16, -11, -8
	banim_frame_oam 0x0, 0x0, 0x56, -11, 8
	banim_frame_oam 0x4000, 0x0, 0x8D, -66, -18
	banim_frame_oam 0x0, 0x0, 0x8F, -50, -18
	banim_frame_oam 0x0, 0x4000, 0xAF, -66, -10
	banim_frame_oam 0x8000, 0x0, 0xB1, -50, -10
	banim_frame_oam 0x0, 0x4000, 0xAC, -42, -16
	banim_frame_oam 0x8000, 0x0, 0xAE, -26, -16
	banim_frame_oam 0x4000, 0x0, 0xEC, -50, 0
	banim_frame_oam 0x0, 0x0, 0xEE, -34, 0
	banim_frame_oam 0x4000, 0x0, 0xE9, -50, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -34, 8
	banim_frame_oam 0x0, 0x0, 0xEF, -69, -18
	banim_frame_oam 0x0, 0x0, 0xF0, -69, -10
	banim_frame_oam 0x0, 0x4000, 0x92, -67, -6
	banim_frame_oam 0x8000, 0x0, 0x94, -51, -6
	banim_frame_oam 0x4000, 0x0, 0x95, -59, 10
	banim_frame_oam 0x0, 0x0, 0xD4, -67, 10
	banim_frame_oam 0x0, 0x0, 0x97, -43, -6
	banim_frame_oam 0x4000, 0x0, 0xF4, -34, -11
	banim_frame_oam 0x0, 0x0, 0xF6, -18, -11
	banim_frame_oam 0x4000, 0x0, 0xB5, -32, -19
	banim_frame_oam 0x4000, 0x0, 0xD5, -26, -3
	banim_frame_end
banim_bram_sw1_2_oam_frame_144_r:
	banim_frame_oam 0x4000, 0x0, 0x8D, -66, -18
	banim_frame_oam 0x0, 0x0, 0x8F, -50, -18
	banim_frame_oam 0x0, 0x4000, 0xAF, -66, -10
	banim_frame_oam 0x8000, 0x0, 0xB1, -50, -10
	banim_frame_oam 0x0, 0x4000, 0xAC, -42, -16
	banim_frame_oam 0x8000, 0x0, 0xAE, -26, -16
	banim_frame_oam 0x4000, 0x0, 0xEC, -50, 0
	banim_frame_oam 0x0, 0x0, 0xEE, -34, 0
	banim_frame_oam 0x4000, 0x0, 0xE9, -50, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -34, 8
	banim_frame_oam 0x4000, 0x0, 0xF4, -34, -11
	banim_frame_oam 0x0, 0x0, 0xF6, -18, -11
	banim_frame_oam 0x4000, 0x0, 0xB5, -32, -19
	banim_frame_oam 0x4000, 0x0, 0xD5, -26, -3
	banim_frame_oam 0x0, 0x0, 0xEF, -69, -18
	banim_frame_oam 0x0, 0x0, 0xF0, -69, -10
	banim_frame_end
	.section .data.script
banim_bram_sw1_2_script:
banim_bram_sw1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 1, banim_bram_sw1_2_oam_frame_1_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 2, banim_bram_sw1_2_oam_frame_2_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 3, banim_bram_sw1_2_oam_frame_3_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 4, banim_bram_sw1_2_oam_frame_4_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_bram_sw1_sheet_0, 5, banim_bram_sw1_2_oam_frame_5_r - banim_bram_sw1_2_oam_r
	banim_code_frame 5, banim_bram_sw1_sheet_0, 6, banim_bram_sw1_2_oam_frame_6_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 7, banim_bram_sw1_2_oam_frame_7_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_0, 8, banim_bram_sw1_2_oam_frame_8_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 9, banim_bram_sw1_2_oam_frame_9_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 10, banim_bram_sw1_2_oam_frame_10_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 11, banim_bram_sw1_2_oam_frame_11_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 12, banim_bram_sw1_2_oam_frame_12_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 13, banim_bram_sw1_2_oam_frame_13_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 14, banim_bram_sw1_2_oam_frame_14_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 15, banim_bram_sw1_2_oam_frame_15_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_sheet_0, 16, banim_bram_sw1_2_oam_frame_16_r - banim_bram_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 3, banim_bram_sw1_sheet_0, 17, banim_bram_sw1_2_oam_frame_17_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 18, banim_bram_sw1_2_oam_frame_18_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bram_sw1_sheet_1, 19, banim_bram_sw1_2_oam_frame_19_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 20, banim_bram_sw1_2_oam_frame_20_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 21, banim_bram_sw1_2_oam_frame_21_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 22, banim_bram_sw1_2_oam_frame_22_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 23, banim_bram_sw1_2_oam_frame_23_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 24, banim_bram_sw1_2_oam_frame_24_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_1, 25, banim_bram_sw1_2_oam_frame_25_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 26, banim_bram_sw1_2_oam_frame_26_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 27, banim_bram_sw1_2_oam_frame_27_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 28, banim_bram_sw1_2_oam_frame_28_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 29, banim_bram_sw1_2_oam_frame_29_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 30, banim_bram_sw1_2_oam_frame_30_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 31, banim_bram_sw1_2_oam_frame_31_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 32, banim_bram_sw1_2_oam_frame_32_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 33, banim_bram_sw1_2_oam_frame_33_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 34, banim_bram_sw1_2_oam_frame_34_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 35, banim_bram_sw1_2_oam_frame_35_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 36, banim_bram_sw1_2_oam_frame_36_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 37, banim_bram_sw1_2_oam_frame_37_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 38, banim_bram_sw1_2_oam_frame_38_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 39, banim_bram_sw1_2_oam_frame_39_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 40, banim_bram_sw1_2_oam_frame_40_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 41, banim_bram_sw1_2_oam_frame_41_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 42, banim_bram_sw1_2_oam_frame_42_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 43, banim_bram_sw1_2_oam_frame_43_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 44, banim_bram_sw1_2_oam_frame_44_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 45, banim_bram_sw1_2_oam_frame_45_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 46, banim_bram_sw1_2_oam_frame_46_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 47, banim_bram_sw1_2_oam_frame_47_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 48, banim_bram_sw1_2_oam_frame_48_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 49, banim_bram_sw1_2_oam_frame_49_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 50, banim_bram_sw1_2_oam_frame_50_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 51, banim_bram_sw1_2_oam_frame_51_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 52, banim_bram_sw1_2_oam_frame_52_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 53, banim_bram_sw1_2_oam_frame_53_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 54, banim_bram_sw1_2_oam_frame_54_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 55, banim_bram_sw1_2_oam_frame_55_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 56, banim_bram_sw1_2_oam_frame_56_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 57, banim_bram_sw1_2_oam_frame_57_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 58, banim_bram_sw1_2_oam_frame_58_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 59, banim_bram_sw1_2_oam_frame_59_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 60, banim_bram_sw1_2_oam_frame_60_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 61, banim_bram_sw1_2_oam_frame_61_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 62, banim_bram_sw1_2_oam_frame_62_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 63, banim_bram_sw1_2_oam_frame_63_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 64, banim_bram_sw1_2_oam_frame_64_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 66, banim_bram_sw1_2_oam_frame_66_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 67, banim_bram_sw1_2_oam_frame_67_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 5, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 3, banim_bram_sw1_sheet_0, 139, banim_bram_sw1_2_oam_frame_69_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 139, banim_bram_sw1_2_oam_frame_69_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_1, 140, banim_bram_sw1_2_oam_frame_70_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 68, banim_bram_sw1_2_oam_frame_74_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 69, banim_bram_sw1_2_oam_frame_75_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 70, banim_bram_sw1_2_oam_frame_76_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 71, banim_bram_sw1_2_oam_frame_77_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 72, banim_bram_sw1_2_oam_frame_78_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 73, banim_bram_sw1_2_oam_frame_79_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 74, banim_bram_sw1_2_oam_frame_80_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 75, banim_bram_sw1_2_oam_frame_81_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 76, banim_bram_sw1_2_oam_frame_82_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 77, banim_bram_sw1_2_oam_frame_83_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 78, banim_bram_sw1_2_oam_frame_84_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 79, banim_bram_sw1_2_oam_frame_85_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 80, banim_bram_sw1_2_oam_frame_86_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 81, banim_bram_sw1_2_oam_frame_87_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 82, banim_bram_sw1_2_oam_frame_88_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 83, banim_bram_sw1_2_oam_frame_89_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 84, banim_bram_sw1_2_oam_frame_90_r - banim_bram_sw1_2_oam_r
	banim_code_toss_shield
	banim_code_frame 14, banim_bram_sw1_sheet_3, 85, banim_bram_sw1_2_oam_frame_91_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 86, banim_bram_sw1_2_oam_frame_92_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 87, banim_bram_sw1_2_oam_frame_93_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 88, banim_bram_sw1_2_oam_frame_94_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_bram_sw1_sheet_2, 89, banim_bram_sw1_2_oam_frame_95_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 90, banim_bram_sw1_2_oam_frame_96_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 91, banim_bram_sw1_2_oam_frame_97_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 92, banim_bram_sw1_2_oam_frame_98_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 93, banim_bram_sw1_2_oam_frame_99_r - banim_bram_sw1_2_oam_r
	banim_code_frame 35, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 94, banim_bram_sw1_2_oam_frame_100_r - banim_bram_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood
	banim_code_hit_critical_3
	banim_code_sound_axe_swing_long
	banim_code_frame 5, banim_bram_sw1_sheet_3, 95, banim_bram_sw1_2_oam_frame_101_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_sheet_3, 96, banim_bram_sw1_2_oam_frame_102_r - banim_bram_sw1_2_oam_r
	banim_code_frame 16, banim_bram_sw1_sheet_3, 97, banim_bram_sw1_2_oam_frame_103_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 98, banim_bram_sw1_2_oam_frame_104_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 99, banim_bram_sw1_2_oam_frame_105_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 100, banim_bram_sw1_2_oam_frame_106_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 101, banim_bram_sw1_2_oam_frame_107_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 102, banim_bram_sw1_2_oam_frame_108_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 103, banim_bram_sw1_2_oam_frame_109_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 104, banim_bram_sw1_2_oam_frame_110_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 105, banim_bram_sw1_2_oam_frame_111_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 106, banim_bram_sw1_2_oam_frame_112_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 107, banim_bram_sw1_2_oam_frame_113_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 108, banim_bram_sw1_2_oam_frame_114_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 109, banim_bram_sw1_2_oam_frame_115_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 110, banim_bram_sw1_2_oam_frame_116_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 111, banim_bram_sw1_2_oam_frame_117_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 112, banim_bram_sw1_2_oam_frame_118_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 113, banim_bram_sw1_2_oam_frame_119_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 114, banim_bram_sw1_2_oam_frame_120_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 115, banim_bram_sw1_2_oam_frame_121_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 116, banim_bram_sw1_2_oam_frame_122_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 117, banim_bram_sw1_2_oam_frame_123_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 118, banim_bram_sw1_2_oam_frame_124_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 119, banim_bram_sw1_2_oam_frame_125_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 120, banim_bram_sw1_2_oam_frame_126_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 121, banim_bram_sw1_2_oam_frame_127_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 122, banim_bram_sw1_2_oam_frame_128_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 123, banim_bram_sw1_2_oam_frame_129_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 124, banim_bram_sw1_2_oam_frame_130_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 125, banim_bram_sw1_2_oam_frame_131_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 126, banim_bram_sw1_2_oam_frame_132_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 127, banim_bram_sw1_2_oam_frame_133_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 128, banim_bram_sw1_2_oam_frame_134_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 129, banim_bram_sw1_2_oam_frame_135_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 130, banim_bram_sw1_2_oam_frame_136_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 131, banim_bram_sw1_2_oam_frame_137_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_1, 132, banim_bram_sw1_2_oam_frame_138_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 26, banim_bram_sw1_2_oam_frame_26_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 27, banim_bram_sw1_2_oam_frame_27_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 28, banim_bram_sw1_2_oam_frame_28_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 29, banim_bram_sw1_2_oam_frame_29_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 30, banim_bram_sw1_2_oam_frame_30_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 31, banim_bram_sw1_2_oam_frame_31_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 32, banim_bram_sw1_2_oam_frame_32_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 33, banim_bram_sw1_2_oam_frame_33_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 34, banim_bram_sw1_2_oam_frame_34_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 35, banim_bram_sw1_2_oam_frame_35_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 36, banim_bram_sw1_2_oam_frame_36_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 37, banim_bram_sw1_2_oam_frame_37_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 38, banim_bram_sw1_2_oam_frame_38_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 39, banim_bram_sw1_2_oam_frame_39_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 40, banim_bram_sw1_2_oam_frame_40_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 41, banim_bram_sw1_2_oam_frame_41_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 42, banim_bram_sw1_2_oam_frame_42_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 43, banim_bram_sw1_2_oam_frame_43_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 44, banim_bram_sw1_2_oam_frame_44_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 45, banim_bram_sw1_2_oam_frame_45_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 46, banim_bram_sw1_2_oam_frame_46_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 47, banim_bram_sw1_2_oam_frame_47_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 48, banim_bram_sw1_2_oam_frame_48_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 49, banim_bram_sw1_2_oam_frame_49_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 50, banim_bram_sw1_2_oam_frame_50_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 51, banim_bram_sw1_2_oam_frame_51_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 52, banim_bram_sw1_2_oam_frame_52_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 53, banim_bram_sw1_2_oam_frame_53_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 54, banim_bram_sw1_2_oam_frame_54_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 55, banim_bram_sw1_2_oam_frame_55_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 56, banim_bram_sw1_2_oam_frame_56_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 57, banim_bram_sw1_2_oam_frame_57_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 58, banim_bram_sw1_2_oam_frame_58_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 59, banim_bram_sw1_2_oam_frame_59_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 60, banim_bram_sw1_2_oam_frame_60_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 61, banim_bram_sw1_2_oam_frame_61_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 62, banim_bram_sw1_2_oam_frame_62_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 63, banim_bram_sw1_2_oam_frame_63_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 64, banim_bram_sw1_2_oam_frame_64_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 66, banim_bram_sw1_2_oam_frame_66_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 67, banim_bram_sw1_2_oam_frame_67_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_toss_shield
	banim_code_frame 14, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 2, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 35, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood
	banim_code_hit_critical_3
	banim_code_sound_axe_swing_long
	banim_code_frame 5, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 16, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 141, banim_bram_sw1_2_oam_frame_139_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_1, 142, banim_bram_sw1_2_oam_frame_140_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_2, 136, banim_bram_sw1_2_oam_frame_71_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 44, banim_bram_sw1_2_oam_frame_44_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 134, banim_bram_sw1_2_oam_frame_72_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 135, banim_bram_sw1_2_oam_frame_73_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 133, banim_bram_sw1_2_oam_frame_68_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_range:
	banim_code_frame 4, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_range_critical:
	banim_code_frame 4, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_end_mode
banim_bram_sw1_2_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 137, banim_bram_sw1_2_oam_frame_141_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 138, banim_bram_sw1_2_oam_frame_142_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 137, banim_bram_sw1_2_oam_frame_141_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_bram_sw1_sheet_1, 137, banim_bram_sw1_2_oam_frame_141_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 138, banim_bram_sw1_2_oam_frame_142_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_1, 137, banim_bram_sw1_2_oam_frame_141_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_bram_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_2_mode_stand:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bram_sw1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_bram_sw1_sheet_0, 0, banim_bram_sw1_2_oam_frame_0_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 1, banim_bram_sw1_2_oam_frame_1_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 2, banim_bram_sw1_2_oam_frame_2_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 3, banim_bram_sw1_2_oam_frame_3_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 4, banim_bram_sw1_2_oam_frame_4_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_unsheath
	banim_code_frame 2, banim_bram_sw1_sheet_0, 5, banim_bram_sw1_2_oam_frame_5_r - banim_bram_sw1_2_oam_r
	banim_code_frame 5, banim_bram_sw1_sheet_0, 6, banim_bram_sw1_2_oam_frame_6_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 7, banim_bram_sw1_2_oam_frame_7_r - banim_bram_sw1_2_oam_r
	banim_code_frame 4, banim_bram_sw1_sheet_0, 8, banim_bram_sw1_2_oam_frame_8_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 9, banim_bram_sw1_2_oam_frame_9_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 10, banim_bram_sw1_2_oam_frame_10_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 11, banim_bram_sw1_2_oam_frame_11_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 12, banim_bram_sw1_2_oam_frame_12_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 13, banim_bram_sw1_2_oam_frame_13_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 14, banim_bram_sw1_2_oam_frame_14_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 15, banim_bram_sw1_2_oam_frame_15_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_bram_sw1_sheet_0, 16, banim_bram_sw1_2_oam_frame_16_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 143, banim_bram_sw1_2_oam_frame_143_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 144, banim_bram_sw1_2_oam_frame_144_r - banim_bram_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_bram_sw1_sheet_2, 26, banim_bram_sw1_2_oam_frame_26_r - banim_bram_sw1_2_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_bram_sw1_sheet_1, 27, banim_bram_sw1_2_oam_frame_27_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 28, banim_bram_sw1_2_oam_frame_28_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 29, banim_bram_sw1_2_oam_frame_29_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 30, banim_bram_sw1_2_oam_frame_30_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 31, banim_bram_sw1_2_oam_frame_31_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 32, banim_bram_sw1_2_oam_frame_32_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 33, banim_bram_sw1_2_oam_frame_33_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 34, banim_bram_sw1_2_oam_frame_34_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 35, banim_bram_sw1_2_oam_frame_35_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 36, banim_bram_sw1_2_oam_frame_36_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 37, banim_bram_sw1_2_oam_frame_37_r - banim_bram_sw1_2_oam_r
	banim_code_sound_sword_click
	banim_code_frame 4, banim_bram_sw1_sheet_1, 38, banim_bram_sw1_2_oam_frame_38_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 39, banim_bram_sw1_2_oam_frame_39_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 40, banim_bram_sw1_2_oam_frame_40_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 41, banim_bram_sw1_2_oam_frame_41_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 42, banim_bram_sw1_2_oam_frame_42_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 43, banim_bram_sw1_2_oam_frame_43_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_2, 44, banim_bram_sw1_2_oam_frame_44_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 45, banim_bram_sw1_2_oam_frame_45_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 46, banim_bram_sw1_2_oam_frame_46_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 47, banim_bram_sw1_2_oam_frame_47_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 48, banim_bram_sw1_2_oam_frame_48_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 49, banim_bram_sw1_2_oam_frame_49_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 50, banim_bram_sw1_2_oam_frame_50_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 51, banim_bram_sw1_2_oam_frame_51_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 52, banim_bram_sw1_2_oam_frame_52_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 53, banim_bram_sw1_2_oam_frame_53_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 54, banim_bram_sw1_2_oam_frame_54_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 55, banim_bram_sw1_2_oam_frame_55_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_1, 56, banim_bram_sw1_2_oam_frame_56_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 57, banim_bram_sw1_2_oam_frame_57_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_1, 58, banim_bram_sw1_2_oam_frame_58_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 59, banim_bram_sw1_2_oam_frame_59_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_3, 60, banim_bram_sw1_2_oam_frame_60_r - banim_bram_sw1_2_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 5, banim_bram_sw1_sheet_3, 61, banim_bram_sw1_2_oam_frame_61_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_3, 62, banim_bram_sw1_2_oam_frame_62_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 63, banim_bram_sw1_2_oam_frame_63_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_3, 64, banim_bram_sw1_2_oam_frame_64_r - banim_bram_sw1_2_oam_r
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_bram_sw1_sheet_0, 65, banim_bram_sw1_2_oam_frame_65_r - banim_bram_sw1_2_oam_r
	banim_code_frame 2, banim_bram_sw1_sheet_0, 66, banim_bram_sw1_2_oam_frame_66_r - banim_bram_sw1_2_oam_r
	banim_code_frame 3, banim_bram_sw1_sheet_0, 67, banim_bram_sw1_2_oam_frame_67_r - banim_bram_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bram_sw1_2_mode_attack_close - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_attack_close_back - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_attack_close_critical - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_attack_close_critical_back - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_attack_range - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_attack_range_critical - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_dodge_close - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_dodge_range - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_stand_close - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_stand - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_stand_range - banim_bram_sw1_2_script
	.word banim_bram_sw1_2_mode_attack_miss - banim_bram_sw1_2_script
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

