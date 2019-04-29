@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x99
	.global banim_pirm_ax1_oam_frame_0_l
	.global banim_pirm_ax1_oam_frame_4_l
	.global banim_pirm_ax1_oam_frame_2_l
	.global banim_pirm_ax1_oam_frame_5_l
	.global banim_pirm_ax1_oam_frame_6_l
	.global banim_pirm_ax1_oam_frame_7_l
	.global banim_pirm_ax1_oam_frame_10_l
	.global banim_pirm_ax1_oam_frame_1_l
	.global banim_pirm_ax1_oam_frame_11_l
	.global banim_pirm_ax1_oam_frame_12_l
	.global banim_pirm_ax1_oam_frame_8_l
	.global banim_pirm_ax1_oam_frame_14_l
	.global banim_pirm_ax1_oam_frame_15_l
	.global banim_pirm_ax1_oam_frame_3_l
	.global banim_pirm_ax1_oam_frame_9_l
	.global banim_pirm_ax1_oam_frame_13_l
	.global banim_pirm_ax1_oam_frame_16_l
	.section .data
banim_pirm_ax1_oam_l:
banim_pirm_ax1_oam_frame_0_l:
	banim_frame_oam 0x0, 0xF000, 0x0, -16, -16
	banim_frame_oam 0xF000, 0x5000, 0x4, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x25, 0, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0xF000, 0x65, -19, -1
	banim_frame_oam 0xF000, 0x1000, 0x69, -27, -1
	banim_frame_oam 0x4000, 0xF000, 0x26, -27, -17
	banim_frame_oam 0x4000, 0x1000, 0x7, -19, -25
	banim_frame_oam 0x0, 0x1000, 0x9, -27, -25
	banim_frame_oam 0x4000, 0x1000, 0x5, -19, -33
	banim_frame_end
banim_pirm_ax1_oam_frame_2_l:
	banim_frame_oam 0x0, 0xF000, 0xA, 13, -16
	banim_frame_oam 0xF000, 0x1000, 0xE, 5, -16
	banim_frame_oam 0x0, 0x1000, 0x4E, 5, -24
	banim_frame_oam 0x0, 0x5000, 0xF, 53, -15
	banim_frame_oam 0xF000, 0x1000, 0x11, 45, -15
	banim_frame_oam 0x0, 0x1000, 0x6E, 69, -7
	banim_frame_end
banim_pirm_ax1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0xF000, 0x12, 22, -24
	banim_frame_oam 0xF000, 0x1000, 0x16, 14, -24
	banim_frame_oam 0x4000, 0x5000, 0x52, 22, -8
	banim_frame_oam 0x4000, 0xF000, 0x72, 22, 0
	banim_frame_oam 0xF000, 0x1000, 0x76, 14, 0
	banim_frame_oam 0x0, 0x1000, 0x51, 54, 8
	banim_frame_oam 0xF000, 0x1000, 0x50, 54, -8
	banim_frame_oam 0x0, 0x1000, 0x4F, 62, -5
	banim_frame_oam 0x0, 0x1000, 0x6F, 54, -24
	banim_frame_oam 0x0, 0x1000, 0x71, 6, -5
	banim_frame_oam 0x4000, 0x1000, 0x17, 19, -32
	banim_frame_oam 0x0, 0x1000, 0x19, 11, -32
	banim_frame_end
banim_pirm_ax1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x1000, 0x1A, 53, -17
	banim_frame_oam 0x0, 0x1000, 0x1C, 45, -17
	banim_frame_oam 0x4000, 0x1000, 0x3D, 53, -9
	banim_frame_oam 0x0, 0x1000, 0x5D, 45, -9
	banim_frame_end
banim_pirm_ax1_oam_frame_4_l:
	banim_frame_oam 0xF000, 0xF000, 0x38, 28, -16
	banim_frame_oam 0xF000, 0x5000, 0x3A, 20, -16
	banim_frame_oam 0xF000, 0x1000, 0x7B, 12, 0
	banim_frame_oam 0x4000, 0x1000, 0x3B, 4, -16
	banim_frame_oam 0x0, 0x1000, 0x97, 20, -24
	banim_frame_oam 0x0, 0x1000, 0x37, 44, -5
	banim_frame_oam 0xF000, 0x1000, 0x57, 52, -8
	banim_frame_oam 0xF000, 0x1000, 0x7C, 60, -8
	banim_frame_oam 0x0, 0x1000, 0x25, 33, -24
	banim_frame_oam 0x4000, 0x1000, 0x5B, 4, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x1000, 0x8A, 48, -8
	banim_frame_end
banim_pirm_ax1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0xF000, 0xB1, 6, -16
	banim_frame_oam 0x4000, 0x5000, 0xF1, 6, 0
	banim_frame_oam 0x4000, 0x5000, 0xB5, 6, 8
	banim_frame_oam 0x0, 0x1000, 0xD5, 22, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_6_l:
	banim_frame_oam 0x0, 0xF000, 0x80, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x84, 6, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0xF000, 0xA4, -15, -24
	banim_frame_oam 0x4000, 0x1000, 0xE5, -7, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, -15, -8
	banim_frame_oam 0xF000, 0x1000, 0xA8, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0xA9, 1, -32
	banim_frame_oam 0x4000, 0x1000, 0xC9, -7, 0
	banim_frame_oam 0x0, 0x1000, 0xCB, -15, 0
	banim_frame_oam 0x4000, 0x5000, 0xE8, -15, 8
	banim_frame_end
banim_pirm_ax1_oam_frame_11_l:
	banim_frame_oam 0x0, 0xF000, 0x8C, -16, -16
	banim_frame_oam 0xF000, 0x5000, 0x90, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x25, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xF5, -5, 3
	banim_frame_oam 0x0, 0x1000, 0xF5, 0, 3
	banim_frame_oam 0x0, 0x5000, 0xB9, 4, -2
	banim_frame_oam 0x0, 0x5000, 0xD6, -23, 0
	banim_frame_oam 0xF000, 0x1000, 0xD8, -31, 0
	banim_frame_oam 0x4000, 0x1000, 0xFA, -23, -8
	banim_frame_oam 0x0, 0x1000, 0xFC, -31, -8
	banim_frame_oam 0x0, 0x1000, 0xBB, -39, -2
	banim_frame_end
banim_pirm_ax1_oam_frame_12_l:
	banim_frame_oam 0x0, 0xF000, 0x0, -16, -16
	banim_frame_oam 0xF000, 0x5000, 0x4, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x25, 0, -24
	banim_frame_oam 0x0, 0x5000, 0xD6, -31, -1
	banim_frame_oam 0xF000, 0x1000, 0xD8, -39, -1
	banim_frame_oam 0x0, 0x1000, 0xF5, -5, 3
	banim_frame_oam 0x0, 0x1000, 0xF5, 3, 3
	banim_frame_oam 0x0, 0x5000, 0xB9, 11, -2
	banim_frame_oam 0x0, 0x1000, 0xF5, -16, 3
	banim_frame_oam 0x0, 0x1000, 0xF9, -12, -6
	banim_frame_oam 0x0, 0x0, 0xF9, 1, -3
	banim_frame_oam 0x4000, 0x1000, 0xFA, -31, -9
	banim_frame_oam 0x0, 0x1000, 0xFC, -39, -9
	banim_frame_oam 0x0, 0x1000, 0xBB, -47, -4
	banim_frame_end
banim_pirm_ax1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x5000, 0x24, -9, -4
	banim_frame_oam 0x0, 0x1000, 0x44, -17, -4
	banim_frame_oam 0x4000, 0x5000, 0x3, -17, -12
	banim_frame_oam 0x0, 0x1000, 0x7, 23, -4
	banim_frame_oam 0xF000, 0x1000, 0x8F, -18, -18
	banim_frame_oam 0x0, 0x1000, 0xCF, -18, -2
	banim_frame_oam 0x4000, 0xF000, 0x20, -18, -10
	banim_frame_oam 0x4000, 0x1000, 0x0, -10, -18
	banim_frame_oam 0x0, 0x1000, 0x2, -18, -18
	banim_frame_oam 0x4000, 0x5000, 0x61, -18, 6
	banim_frame_oam 0x0, 0x1000, 0x60, -11, -26
	banim_frame_end
banim_pirm_ax1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -30, -24
	banim_frame_oam 0x0, 0x1000, 0xD0, -22, -8
	banim_frame_oam 0x4000, 0xF000, 0x45, -18, -2
	banim_frame_oam 0x4000, 0x1000, 0x8, -10, -10
	banim_frame_oam 0x0, 0x1000, 0x49, -18, -10
	banim_frame_oam 0x0, 0x1000, 0x69, -26, -10
	banim_frame_oam 0x0, 0x5000, 0xA, -15, -26
	banim_frame_oam 0x0, 0x1000, 0x28, -23, -26
	banim_frame_oam 0x4000, 0x1000, 0x71, -36, -16
	banim_frame_oam 0x4000, 0x1000, 0x51, -36, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0xF000, 0x12, 22, -24
	banim_frame_oam 0xF000, 0x1000, 0x16, 14, -24
	banim_frame_oam 0x4000, 0x5000, 0x52, 22, -8
	banim_frame_oam 0x4000, 0xF000, 0x72, 22, 0
	banim_frame_oam 0xF000, 0x1000, 0x76, 14, 0
	banim_frame_oam 0x0, 0x1000, 0x51, 54, 8
	banim_frame_oam 0xF000, 0x1000, 0x50, 54, -8
	banim_frame_oam 0x0, 0x1000, 0x4F, 62, -5
	banim_frame_oam 0x0, 0x1000, 0x6F, 54, -24
	banim_frame_oam 0x0, 0x1000, 0x71, 6, -5
	banim_frame_oam 0x4000, 0x1000, 0x17, 19, -32
	banim_frame_oam 0x0, 0x1000, 0x19, 11, -32
	banim_frame_oam 0x4000, 0x1000, 0x1A, 53, -17
	banim_frame_oam 0x0, 0x1000, 0x1C, 45, -17
	banim_frame_oam 0x4000, 0x1000, 0x3D, 53, -9
	banim_frame_oam 0x0, 0x1000, 0x5D, 45, -9
	banim_frame_end
banim_pirm_ax1_oam_frame_16_l:
	banim_frame_oam 0xF000, 0xF000, 0x38, 28, -16
	banim_frame_oam 0xF000, 0x5000, 0x3A, 20, -16
	banim_frame_oam 0xF000, 0x1000, 0x7B, 12, 0
	banim_frame_oam 0x4000, 0x1000, 0x3B, 4, -16
	banim_frame_oam 0x0, 0x1000, 0x97, 20, -24
	banim_frame_oam 0x0, 0x1000, 0x37, 44, -5
	banim_frame_oam 0xF000, 0x1000, 0x57, 52, -8
	banim_frame_oam 0xF000, 0x1000, 0x7C, 60, -8
	banim_frame_oam 0x0, 0x1000, 0x25, 33, -24
	banim_frame_oam 0x4000, 0x1000, 0x8A, 48, -8
	banim_frame_oam 0x4000, 0x1000, 0x5B, 4, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
