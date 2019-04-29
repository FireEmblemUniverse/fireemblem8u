@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xE
	.global banim_bram_sw1_3_oam_frame_0_r
	.global banim_bram_sw1_3_oam_frame_11_r
	.global banim_bram_sw1_3_oam_frame_1_r
	.global banim_bram_sw1_3_oam_frame_3_r
	.global banim_bram_sw1_3_oam_frame_7_r
	.global banim_bram_sw1_3_oam_frame_6_r
	.global banim_bram_sw1_3_oam_frame_10_r
	.global banim_bram_sw1_3_oam_frame_5_r
	.global banim_bram_sw1_3_oam_frame_4_r
	.global banim_bram_sw1_3_oam_frame_2_r
	.global banim_bram_sw1_3_oam_frame_8_r
	.global banim_bram_sw1_3_oam_frame_9_r
	.section .data
banim_bram_sw1_3_oam_r:
banim_bram_sw1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, 1, -10
	banim_frame_oam 0x4000, 0x0, 0x5D, 1, 6
	banim_frame_oam 0x0, 0x4000, 0x1B, 1, -17
	banim_frame_oam 0x0, 0x0, 0x5C, -7, -9
	banim_frame_oam 0x0, 0x0, 0x5B, 1, -1
	banim_frame_oam 0xF000, 0xF000, 0x20, -8, -16
	banim_frame_oam 0xF000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0xF000, 0x0, -17, -24
	banim_frame_oam 0xF000, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -17, -8
	banim_frame_oam 0x0, 0x0, 0x44, 15, -8
	banim_frame_oam 0x4000, 0x4000, 0x60, -9, 0
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_end
banim_bram_sw1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xF000, 0x25, -17, -16
	banim_frame_oam 0x4000, 0xF000, 0x64, -17, 0
	banim_frame_oam 0xF000, 0x0, 0x68, 15, 0
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x4000, 0x0, 0x7, 15, -8
	banim_frame_oam 0x0, 0x0, 0x9, 23, 0
	banim_frame_end
banim_bram_sw1_3_oam_frame_6_r:
	banim_frame_oam 0x4000, 0xF000, 0x29, -17, -16
	banim_frame_oam 0x4000, 0x4000, 0x69, -17, 0
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x0, 0x0, 0xA, 15, -8
	banim_frame_oam 0x4000, 0x0, 0xB, 5, -5
	banim_frame_oam 0x0, 0x0, 0xD, 21, -5
	banim_frame_oam 0x4000, 0x0, 0x2D, 5, 3
	banim_frame_oam 0x0, 0x0, 0x2F, 21, 3
	banim_frame_end
banim_bram_sw1_3_oam_frame_7_r:
	banim_frame_oam 0x4000, 0xF000, 0x29, -17, -16
	banim_frame_oam 0x4000, 0x4000, 0x69, -17, 0
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x0, 0x0, 0xA, 15, -8
	banim_frame_oam 0x0, 0x4000, 0x4D, 1, -16
	banim_frame_oam 0x4000, 0x0, 0x8D, 1, 0
	banim_frame_end
banim_bram_sw1_3_oam_frame_8_r:
	banim_frame_oam 0x4000, 0xF000, 0x29, -17, -16
	banim_frame_oam 0x4000, 0x4000, 0x69, -17, 0
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x0, 0x0, 0xA, 15, -8
	banim_frame_oam 0x4000, 0x3000, 0xB, 12, -9
	banim_frame_oam 0x0, 0x3000, 0xD, 4, -9
	banim_frame_oam 0x4000, 0x3000, 0x2D, 12, -17
	banim_frame_oam 0x0, 0x3000, 0x2F, 4, -17
	banim_frame_end
banim_bram_sw1_3_oam_frame_9_r:
	banim_frame_oam 0x4000, 0xF000, 0x29, -17, -16
	banim_frame_oam 0x4000, 0x4000, 0x69, -17, 0
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x5, -9, -24
	banim_frame_oam 0x0, 0x0, 0xA, 15, -8
	banim_frame_oam 0x0, 0x7000, 0x4D, 14, -7
	banim_frame_oam 0x4000, 0x3000, 0x8D, 14, -15
	banim_frame_end
banim_bram_sw1_3_oam_frame_3_r:
	banim_frame_oam 0x4000, 0xF000, 0x10, -16, -16
	banim_frame_oam 0xF000, 0x0, 0x14, 16, -16
	banim_frame_oam 0x4000, 0xF000, 0x4F, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xE, -8, -24
	banim_frame_oam 0x0, 0x0, 0x8F, -16, 8
	banim_frame_end
banim_bram_sw1_3_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0x15, 10, -20
	banim_frame_oam 0x4000, 0x0, 0x17, 10, -4
	banim_frame_oam 0x0, 0x0, 0x37, 18, 4
	banim_frame_oam 0x0, 0x4000, 0x54, -8, -16
	banim_frame_oam 0xF000, 0x0, 0x56, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x94, -8, 0
	banim_frame_oam 0x0, 0x0, 0x96, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE, -9, -24
	banim_frame_oam 0x0, 0x0, 0x57, -16, -15
	banim_frame_oam 0x0, 0x0, 0x38, -24, -16
	banim_frame_end
banim_bram_sw1_3_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0x15, 9, -20
	banim_frame_oam 0x4000, 0x0, 0x17, 9, -4
	banim_frame_oam 0x0, 0x0, 0x37, 17, 4
	banim_frame_oam 0x4000, 0xF000, 0x53, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x94, -8, 0
	banim_frame_oam 0x0, 0x0, 0x96, 8, 0
	banim_frame_oam 0x4000, 0x0, 0xE, -9, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, -24, -16
	banim_frame_end
banim_bram_sw1_3_oam_frame_10_r:
	banim_frame_oam 0x4000, 0xF000, 0xA1, -3, -10
	banim_frame_oam 0x4000, 0x4000, 0xE1, -3, 6
	banim_frame_oam 0x0, 0x0, 0xA0, -11, -10
	banim_frame_oam 0x0, 0x0, 0xE0, -11, 6
	banim_frame_oam 0x0, 0x0, 0xA5, 29, -2
	banim_frame_oam 0x4000, 0x4000, 0x16, -11, -18
	banim_frame_oam 0x4000, 0x0, 0xE5, 12, 14
	banim_frame_oam 0x4000, 0x0, 0xC5, -4, 14
	banim_frame_oam 0x0, 0x0, 0xC0, 28, 14
	banim_frame_end
banim_bram_sw1_3_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x4000, 0x13, 0, -9
	banim_frame_oam 0x4000, 0xF000, 0x33, 1, -1
	banim_frame_oam 0x4000, 0x4000, 0x73, 1, 15
	banim_frame_oam 0x4000, 0x0, 0x70, 0, -17
	banim_frame_oam 0x0, 0x0, 0x72, 16, -17
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
