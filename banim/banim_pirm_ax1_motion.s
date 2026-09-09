@ vim:ft=armv4
	.global banim_pirm_ax1_script
	.global banim_pirm_ax1_oam_r
	.global banim_pirm_ax1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x99
	.section .data.oam_l
banim_pirm_ax1_oam_l:
banim_pirm_ax1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x25, 0, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x65, -19, -1
	banim_frame_oam 0x8000, 0x1000, 0x69, -27, -1
	banim_frame_oam 0x4000, 0x9000, 0x26, -27, -17
	banim_frame_oam 0x4000, 0x1000, 0x7, -19, -25
	banim_frame_oam 0x0, 0x1000, 0x9, -27, -25
	banim_frame_oam 0x4000, 0x1000, 0x5, -19, -33
	banim_frame_end
banim_pirm_ax1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xA, 13, -16
	banim_frame_oam 0x8000, 0x1000, 0xE, 5, -16
	banim_frame_oam 0x0, 0x1000, 0x4E, 5, -24
	banim_frame_oam 0x0, 0x5000, 0xF, 53, -15
	banim_frame_oam 0x8000, 0x1000, 0x11, 45, -15
	banim_frame_oam 0x0, 0x1000, 0x6E, 69, -7
	banim_frame_end
banim_pirm_ax1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0x12, 22, -24
	banim_frame_oam 0x8000, 0x1000, 0x16, 14, -24
	banim_frame_oam 0x4000, 0x5000, 0x52, 22, -8
	banim_frame_oam 0x4000, 0x9000, 0x72, 22, 0
	banim_frame_oam 0x8000, 0x1000, 0x76, 14, 0
	banim_frame_oam 0x0, 0x1000, 0x51, 54, 8
	banim_frame_oam 0x8000, 0x1000, 0x50, 54, -8
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
	banim_frame_oam 0x8000, 0x9000, 0x38, 28, -16
	banim_frame_oam 0x8000, 0x5000, 0x3A, 20, -16
	banim_frame_oam 0x8000, 0x1000, 0x7B, 12, 0
	banim_frame_oam 0x4000, 0x1000, 0x3B, 4, -16
	banim_frame_oam 0x0, 0x1000, 0x97, 20, -24
	banim_frame_oam 0x0, 0x1000, 0x37, 44, -5
	banim_frame_oam 0x8000, 0x1000, 0x57, 52, -8
	banim_frame_oam 0x8000, 0x1000, 0x7C, 60, -8
	banim_frame_oam 0x0, 0x1000, 0x25, 33, -24
	banim_frame_oam 0x4000, 0x1000, 0x5B, 4, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x1000, 0x8A, 48, -8
	banim_frame_end
banim_pirm_ax1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x9000, 0xB1, 6, -16
	banim_frame_oam 0x4000, 0x5000, 0xF1, 6, 0
	banim_frame_oam 0x4000, 0x5000, 0xB5, 6, 8
	banim_frame_oam 0x0, 0x1000, 0xD5, 22, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x84, 6, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x9000, 0xA4, -15, -24
	banim_frame_oam 0x4000, 0x1000, 0xE5, -7, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, -15, -8
	banim_frame_oam 0x8000, 0x1000, 0xA8, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0xA9, 1, -32
	banim_frame_oam 0x4000, 0x1000, 0xC9, -7, 0
	banim_frame_oam 0x0, 0x1000, 0xCB, -15, 0
	banim_frame_oam 0x4000, 0x5000, 0xE8, -15, 8
	banim_frame_end
banim_pirm_ax1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x8C, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x90, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x25, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xF5, -5, 3
	banim_frame_oam 0x0, 0x1000, 0xF5, 0, 3
	banim_frame_oam 0x0, 0x5000, 0xB9, 4, -2
	banim_frame_oam 0x0, 0x5000, 0xD6, -23, 0
	banim_frame_oam 0x8000, 0x1000, 0xD8, -31, 0
	banim_frame_oam 0x4000, 0x1000, 0xFA, -23, -8
	banim_frame_oam 0x0, 0x1000, 0xFC, -31, -8
	banim_frame_oam 0x0, 0x1000, 0xBB, -39, -2
	banim_frame_end
banim_pirm_ax1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x25, 0, -24
	banim_frame_oam 0x0, 0x5000, 0xD6, -31, -1
	banim_frame_oam 0x8000, 0x1000, 0xD8, -39, -1
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
	banim_frame_oam 0x8000, 0x1000, 0x8F, -18, -18
	banim_frame_oam 0x0, 0x1000, 0xCF, -18, -2
	banim_frame_oam 0x4000, 0x9000, 0x20, -18, -10
	banim_frame_oam 0x4000, 0x1000, 0x0, -10, -18
	banim_frame_oam 0x0, 0x1000, 0x2, -18, -18
	banim_frame_oam 0x4000, 0x5000, 0x61, -18, 6
	banim_frame_oam 0x0, 0x1000, 0x60, -11, -26
	banim_frame_end
banim_pirm_ax1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -30, -24
	banim_frame_oam 0x0, 0x1000, 0xD0, -22, -8
	banim_frame_oam 0x4000, 0x9000, 0x45, -18, -2
	banim_frame_oam 0x4000, 0x1000, 0x8, -10, -10
	banim_frame_oam 0x0, 0x1000, 0x49, -18, -10
	banim_frame_oam 0x0, 0x1000, 0x69, -26, -10
	banim_frame_oam 0x0, 0x5000, 0xA, -15, -26
	banim_frame_oam 0x0, 0x1000, 0x28, -23, -26
	banim_frame_oam 0x4000, 0x1000, 0x71, -36, -16
	banim_frame_oam 0x4000, 0x1000, 0x51, -36, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x9000, 0x12, 22, -24
	banim_frame_oam 0x8000, 0x1000, 0x16, 14, -24
	banim_frame_oam 0x4000, 0x5000, 0x52, 22, -8
	banim_frame_oam 0x4000, 0x9000, 0x72, 22, 0
	banim_frame_oam 0x8000, 0x1000, 0x76, 14, 0
	banim_frame_oam 0x0, 0x1000, 0x51, 54, 8
	banim_frame_oam 0x8000, 0x1000, 0x50, 54, -8
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
	banim_frame_oam 0x8000, 0x9000, 0x38, 28, -16
	banim_frame_oam 0x8000, 0x5000, 0x3A, 20, -16
	banim_frame_oam 0x8000, 0x1000, 0x7B, 12, 0
	banim_frame_oam 0x4000, 0x1000, 0x3B, 4, -16
	banim_frame_oam 0x0, 0x1000, 0x97, 20, -24
	banim_frame_oam 0x0, 0x1000, 0x37, 44, -5
	banim_frame_oam 0x8000, 0x1000, 0x57, 52, -8
	banim_frame_oam 0x8000, 0x1000, 0x7C, 60, -8
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
	.section .data.oam_r
banim_pirm_ax1_oam_r:
banim_pirm_ax1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -16
	banim_frame_oam 0x0, 0x0, 0x25, -8, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x65, -13, -1
	banim_frame_oam 0x8000, 0x0, 0x69, 19, -1
	banim_frame_oam 0x4000, 0x8000, 0x26, -5, -17
	banim_frame_oam 0x4000, 0x0, 0x7, 3, -25
	banim_frame_oam 0x0, 0x0, 0x9, 19, -25
	banim_frame_oam 0x4000, 0x0, 0x5, 3, -33
	banim_frame_end
banim_pirm_ax1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -45, -16
	banim_frame_oam 0x8000, 0x0, 0xE, -13, -16
	banim_frame_oam 0x0, 0x0, 0x4E, -13, -24
	banim_frame_oam 0x0, 0x4000, 0xF, -69, -15
	banim_frame_oam 0x8000, 0x0, 0x11, -53, -15
	banim_frame_oam 0x0, 0x0, 0x6E, -77, -7
	banim_frame_end
banim_pirm_ax1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0x12, -54, -24
	banim_frame_oam 0x8000, 0x0, 0x16, -22, -24
	banim_frame_oam 0x4000, 0x4000, 0x52, -54, -8
	banim_frame_oam 0x4000, 0x8000, 0x72, -54, 0
	banim_frame_oam 0x8000, 0x0, 0x76, -22, 0
	banim_frame_oam 0x0, 0x0, 0x51, -62, 8
	banim_frame_oam 0x8000, 0x0, 0x50, -62, -8
	banim_frame_oam 0x0, 0x0, 0x4F, -70, -5
	banim_frame_oam 0x0, 0x0, 0x6F, -62, -24
	banim_frame_oam 0x0, 0x0, 0x71, -14, -5
	banim_frame_oam 0x4000, 0x0, 0x17, -35, -32
	banim_frame_oam 0x0, 0x0, 0x19, -19, -32
	banim_frame_end
banim_pirm_ax1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x0, 0x1A, -69, -17
	banim_frame_oam 0x0, 0x0, 0x1C, -53, -17
	banim_frame_oam 0x4000, 0x0, 0x3D, -69, -9
	banim_frame_oam 0x0, 0x0, 0x5D, -53, -9
	banim_frame_end
banim_pirm_ax1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x38, -44, -16
	banim_frame_oam 0x8000, 0x4000, 0x3A, -28, -16
	banim_frame_oam 0x8000, 0x0, 0x7B, -20, 0
	banim_frame_oam 0x4000, 0x0, 0x3B, -20, -16
	banim_frame_oam 0x0, 0x0, 0x97, -28, -24
	banim_frame_oam 0x0, 0x0, 0x37, -52, -5
	banim_frame_oam 0x8000, 0x0, 0x57, -60, -8
	banim_frame_oam 0x8000, 0x0, 0x7C, -68, -8
	banim_frame_oam 0x0, 0x0, 0x25, -41, -24
	banim_frame_oam 0x4000, 0x0, 0x5B, -20, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x0, 0x8A, -64, -8
	banim_frame_end
banim_pirm_ax1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x8000, 0xB1, -38, -16
	banim_frame_oam 0x4000, 0x4000, 0xF1, -38, 0
	banim_frame_oam 0x4000, 0x4000, 0xB5, -38, 8
	banim_frame_oam 0x0, 0x0, 0xD5, -30, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -22, -16
	banim_frame_oam 0x0, 0x0, 0x84, -14, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x8000, 0xA4, -17, -24
	banim_frame_oam 0x4000, 0x0, 0xE5, -9, -8
	banim_frame_oam 0x0, 0x0, 0xE7, 7, -8
	banim_frame_oam 0x8000, 0x0, 0xA8, -25, -24
	banim_frame_oam 0x4000, 0x0, 0xA9, -17, -32
	banim_frame_oam 0x4000, 0x0, 0xC9, -9, 0
	banim_frame_oam 0x0, 0x0, 0xCB, 7, 0
	banim_frame_oam 0x4000, 0x4000, 0xE8, -17, 8
	banim_frame_end
banim_pirm_ax1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x8C, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x90, 16, -16
	banim_frame_oam 0x0, 0x0, 0x25, -8, -24
	banim_frame_oam 0x0, 0x0, 0xF5, -3, 3
	banim_frame_oam 0x0, 0x0, 0xF5, -8, 3
	banim_frame_oam 0x0, 0x4000, 0xB9, -20, -2
	banim_frame_oam 0x0, 0x4000, 0xD6, 7, 0
	banim_frame_oam 0x8000, 0x0, 0xD8, 23, 0
	banim_frame_oam 0x4000, 0x0, 0xFA, 7, -8
	banim_frame_oam 0x0, 0x0, 0xFC, 23, -8
	banim_frame_oam 0x0, 0x0, 0xBB, 31, -2
	banim_frame_end
banim_pirm_ax1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -16
	banim_frame_oam 0x0, 0x0, 0x25, -8, -24
	banim_frame_oam 0x0, 0x4000, 0xD6, 15, -1
	banim_frame_oam 0x8000, 0x0, 0xD8, 31, -1
	banim_frame_oam 0x0, 0x0, 0xF5, -3, 3
	banim_frame_oam 0x0, 0x0, 0xF5, -11, 3
	banim_frame_oam 0x0, 0x4000, 0xB9, -27, -2
	banim_frame_oam 0x0, 0x0, 0xF5, 8, 3
	banim_frame_oam 0x0, 0x0, 0xF9, 4, -6
	banim_frame_oam 0x0, 0x1000, 0xF9, -9, -3
	banim_frame_oam 0x4000, 0x0, 0xFA, 15, -9
	banim_frame_oam 0x0, 0x0, 0xFC, 31, -9
	banim_frame_oam 0x0, 0x0, 0xBB, 39, -4
	banim_frame_end
banim_pirm_ax1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x4000, 0x24, -23, -4
	banim_frame_oam 0x0, 0x0, 0x44, 9, -4
	banim_frame_oam 0x4000, 0x4000, 0x3, -15, -12
	banim_frame_oam 0x0, 0x0, 0x7, -31, -4
	banim_frame_oam 0x8000, 0x0, 0x8F, 10, -18
	banim_frame_oam 0x0, 0x0, 0xCF, 10, -2
	banim_frame_oam 0x4000, 0x8000, 0x20, -14, -10
	banim_frame_oam 0x4000, 0x0, 0x0, -6, -18
	banim_frame_oam 0x0, 0x0, 0x2, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x61, -14, 6
	banim_frame_oam 0x0, 0x0, 0x60, 3, -26
	banim_frame_end
banim_pirm_ax1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0x11, 14, -24
	banim_frame_oam 0x0, 0x0, 0xD0, 14, -8
	banim_frame_oam 0x4000, 0x8000, 0x45, -14, -2
	banim_frame_oam 0x4000, 0x0, 0x8, -6, -10
	banim_frame_oam 0x0, 0x0, 0x49, 10, -10
	banim_frame_oam 0x0, 0x0, 0x69, 18, -10
	banim_frame_oam 0x0, 0x4000, 0xA, -1, -26
	banim_frame_oam 0x0, 0x0, 0x28, 15, -26
	banim_frame_oam 0x4000, 0x0, 0x71, 20, -16
	banim_frame_oam 0x4000, 0x0, 0x51, 20, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x8000, 0x12, -54, -24
	banim_frame_oam 0x8000, 0x0, 0x16, -22, -24
	banim_frame_oam 0x4000, 0x4000, 0x52, -54, -8
	banim_frame_oam 0x4000, 0x8000, 0x72, -54, 0
	banim_frame_oam 0x8000, 0x0, 0x76, -22, 0
	banim_frame_oam 0x0, 0x0, 0x51, -62, 8
	banim_frame_oam 0x8000, 0x0, 0x50, -62, -8
	banim_frame_oam 0x0, 0x0, 0x4F, -70, -5
	banim_frame_oam 0x0, 0x0, 0x6F, -62, -24
	banim_frame_oam 0x0, 0x0, 0x71, -14, -5
	banim_frame_oam 0x4000, 0x0, 0x17, -35, -32
	banim_frame_oam 0x0, 0x0, 0x19, -19, -32
	banim_frame_oam 0x4000, 0x0, 0x1A, -69, -17
	banim_frame_oam 0x0, 0x0, 0x1C, -53, -17
	banim_frame_oam 0x4000, 0x0, 0x3D, -69, -9
	banim_frame_oam 0x0, 0x0, 0x5D, -53, -9
	banim_frame_end
banim_pirm_ax1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x8000, 0x38, -44, -16
	banim_frame_oam 0x8000, 0x4000, 0x3A, -28, -16
	banim_frame_oam 0x8000, 0x0, 0x7B, -20, 0
	banim_frame_oam 0x4000, 0x0, 0x3B, -20, -16
	banim_frame_oam 0x0, 0x0, 0x97, -28, -24
	banim_frame_oam 0x0, 0x0, 0x37, -52, -5
	banim_frame_oam 0x8000, 0x0, 0x57, -60, -8
	banim_frame_oam 0x8000, 0x0, 0x7C, -68, -8
	banim_frame_oam 0x0, 0x0, 0x25, -41, -24
	banim_frame_oam 0x4000, 0x0, 0x8A, -64, -8
	banim_frame_oam 0x4000, 0x0, 0x5B, -20, -24
	banim_frame_end
banim_pirm_ax1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
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
banim_pirm_ax1_script:
banim_pirm_ax1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 1, banim_pirm_ax1_oam_frame_1_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 2, banim_pirm_ax1_oam_frame_2_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 3, banim_pirm_ax1_oam_frame_3_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 5, banim_pirm_ax1_oam_frame_4_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 7, banim_pirm_ax1_oam_frame_5_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 8, banim_pirm_ax1_oam_frame_6_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 4, banim_pirm_ax1_oam_frame_8_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 6, banim_pirm_ax1_oam_frame_9_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 15, banim_pirm_ax1_sheet_0, 9, banim_pirm_ax1_oam_frame_10_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_pirm_ax1_sheet_0, 10, banim_pirm_ax1_oam_frame_11_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 11, banim_pirm_ax1_oam_frame_12_r - banim_pirm_ax1_oam_r
	banim_code_frame 30, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 1, banim_pirm_ax1_oam_frame_1_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 2, banim_pirm_ax1_oam_frame_2_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 3, banim_pirm_ax1_oam_frame_3_r - banim_pirm_ax1_oam_r
	banim_code_hit_critical_4
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 5, banim_pirm_ax1_oam_frame_4_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 7, banim_pirm_ax1_oam_frame_5_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 8, banim_pirm_ax1_oam_frame_6_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 15, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_frame 30, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 4, banim_pirm_ax1_oam_frame_8_r - banim_pirm_ax1_oam_r
	banim_code_hit_critical_4
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 6, banim_pirm_ax1_oam_frame_9_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 16, banim_pirm_ax1_oam_frame_7_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_attack_range:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_end_mode
banim_pirm_ax1_mode_attack_range_critical:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_end_mode
banim_pirm_ax1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 12, banim_pirm_ax1_oam_frame_13_r - banim_pirm_ax1_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 13, banim_pirm_ax1_oam_frame_14_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 12, banim_pirm_ax1_oam_frame_13_r - banim_pirm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 12, banim_pirm_ax1_oam_frame_13_r - banim_pirm_ax1_oam_r
	banim_code_frame 1, banim_pirm_ax1_sheet_1, 13, banim_pirm_ax1_oam_frame_14_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_1, 12, banim_pirm_ax1_oam_frame_13_r - banim_pirm_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pirm_ax1_mode_stand_close:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_mode_stand:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_mode_stand_range:
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pirm_ax1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 0, banim_pirm_ax1_oam_frame_0_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 20, banim_pirm_ax1_sheet_0, 1, banim_pirm_ax1_oam_frame_1_r - banim_pirm_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_effect_dirt_kick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 2, banim_pirm_ax1_oam_frame_2_r - banim_pirm_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 14, banim_pirm_ax1_oam_frame_15_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 1, banim_pirm_ax1_sheet_0, 15, banim_pirm_ax1_oam_frame_16_r - banim_pirm_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 7, banim_pirm_ax1_oam_frame_5_r - banim_pirm_ax1_oam_r
	banim_code_frame 3, banim_pirm_ax1_sheet_0, 8, banim_pirm_ax1_oam_frame_6_r - banim_pirm_ax1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pirm_ax1_mode_attack_close - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_attack_close_back - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_attack_close_critical - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_attack_close_critical_back - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_attack_range - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_attack_range_critical - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_dodge_close - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_dodge_range - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_stand_close - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_stand - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_stand_range - banim_pirm_ax1_script
	.word banim_pirm_ax1_mode_attack_miss - banim_pirm_ax1_script
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

