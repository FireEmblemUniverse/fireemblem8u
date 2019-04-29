@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x9A
	.global banim_pirm_ax1_2_oam_frame_0_r
	.global banim_pirm_ax1_2_oam_frame_1_r
	.global banim_pirm_ax1_2_oam_frame_6_r
	.global banim_pirm_ax1_2_oam_frame_5_r
	.global banim_pirm_ax1_2_oam_frame_9_r
	.global banim_pirm_ax1_2_oam_frame_3_r
	.global banim_pirm_ax1_2_oam_frame_7_r
	.global banim_pirm_ax1_2_oam_frame_8_r
	.global banim_pirm_ax1_2_oam_frame_4_r
	.global banim_pirm_ax1_2_oam_frame_2_r
	.global banim_pirm_ax1_2_oam_frame_10_r
	.section .data
banim_pirm_ax1_2_oam_r:
banim_pirm_ax1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x2C, -8, -24
	banim_frame_oam 0xF000, 0x0, 0x2E, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x6C, -8, -8
	banim_frame_oam 0x0, 0x0, 0x6E, 8, -8
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x4000, 0x0, 0xC, -4, -32
	banim_frame_end
banim_pirm_ax1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0xF000, 0x80, -42, -17
	banim_frame_oam 0xF000, 0x0, 0x84, -10, -17
	banim_frame_oam 0x4000, 0x0, 0xA5, -2, -9
	banim_frame_oam 0x0, 0x4000, 0x4F, 14, -17
	banim_frame_oam 0x0, 0x0, 0x85, -50, -11
	banim_frame_oam 0x0, 0x0, 0xE6, -19, 8
	banim_frame_oam 0x0, 0x0, 0x86, -6, -24
	banim_frame_oam 0xF000, 0xF000, 0x88, -3, -16
	banim_frame_oam 0xF000, 0x4000, 0x8A, 13, -16
	banim_frame_oam 0xF000, 0x0, 0xA7, -11, -8
	banim_frame_oam 0x0, 0x0, 0xE7, -11, 8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x0, 0xE6, -19, 8
	banim_frame_oam 0x0, 0x0, 0x86, -6, -24
	banim_frame_oam 0xF000, 0xF000, 0x88, -3, -16
	banim_frame_oam 0xF000, 0x4000, 0x8A, 13, -16
	banim_frame_oam 0xF000, 0x0, 0xA7, -11, -8
	banim_frame_oam 0x0, 0x0, 0xE7, -11, 8
	banim_frame_oam 0x0, 0x0, 0x87, -11, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, -27, -13
	banim_frame_oam 0x0, 0x0, 0xE0, -27, -5
	banim_frame_end
banim_pirm_ax1_2_oam_frame_3_r:
	banim_frame_oam 0xF000, 0xF000, 0x8B, -12, -24
	banim_frame_oam 0xF000, 0x4000, 0x8D, 4, -24
	banim_frame_oam 0xF000, 0x0, 0xC2, -20, -19
	banim_frame_oam 0x4000, 0x0, 0xC4, -12, 8
	banim_frame_oam 0x4000, 0x0, 0xE4, 4, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 12, 0
	banim_frame_oam 0xF000, 0x0, 0xC3, 12, -16
	banim_frame_end
banim_pirm_ax1_2_oam_frame_9_r:
	banim_frame_oam 0xF000, 0x0, 0x90, 13, -28
	banim_frame_oam 0xF000, 0x1000, 0x90, 6, -28
	banim_frame_oam 0x0, 0x0, 0xEF, 21, -24
	banim_frame_oam 0x0, 0x1000, 0xEF, -2, -24
	banim_frame_oam 0x0, 0x4000, 0x13, -6, -26
	banim_frame_oam 0xF000, 0x0, 0x15, 10, -26
	banim_frame_oam 0x4000, 0x0, 0x53, -6, -10
	banim_frame_oam 0x0, 0x0, 0x55, 10, -10
	banim_frame_oam 0x0, 0x4000, 0x73, -14, -2
	banim_frame_oam 0xF000, 0x0, 0x75, 2, -2
	banim_frame_oam 0xF000, 0x0, 0x92, 10, -2
	banim_frame_oam 0x0, 0x0, 0x91, 18, -20
	banim_frame_oam 0x0, 0x0, 0xF0, 10, -16
	banim_frame_end
banim_pirm_ax1_2_oam_frame_10_r:
	banim_frame_oam 0xF000, 0x0, 0x90, 15, -23
	banim_frame_oam 0xF000, 0x1000, 0x90, 8, -23
	banim_frame_oam 0x0, 0x0, 0xEF, 23, -19
	banim_frame_oam 0x0, 0x1000, 0xEF, 0, -19
	banim_frame_oam 0x4000, 0xF000, 0x45, -14, -2
	banim_frame_oam 0x4000, 0x0, 0x8, -6, -10
	banim_frame_oam 0x0, 0x0, 0x49, 10, -10
	banim_frame_oam 0x0, 0x0, 0x69, 18, -10
	banim_frame_oam 0x0, 0x4000, 0xA, -1, -26
	banim_frame_oam 0x0, 0x0, 0x28, 15, -26
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_5_r:
	banim_frame_oam 0xF000, 0x2000, 0xB5, 4, -16
	banim_frame_oam 0x0, 0x2000, 0xF5, 4, -24
	banim_frame_oam 0x0, 0x6000, 0xD6, 12, -24
	banim_frame_oam 0x0, 0x4000, 0xD1, -8, -16
	banim_frame_oam 0xF000, 0x0, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -7, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 16, -15
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x0, 0x0, 0x76, 5, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x5000, 0x16, 16, -25
	banim_frame_oam 0xF000, 0x1000, 0x18, 8, -25
	banim_frame_oam 0x4000, 0x1000, 0xB6, 16, -9
	banim_frame_oam 0x0, 0x4000, 0xD1, -8, -16
	banim_frame_oam 0xF000, 0x0, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -7, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 16, -15
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x0, 0x0, 0x76, 5, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_7_r:
	banim_frame_oam 0xF000, 0x1000, 0xB5, 24, -21
	banim_frame_oam 0x0, 0x1000, 0xF5, 24, -5
	banim_frame_oam 0x0, 0x5000, 0xD6, 8, -13
	banim_frame_oam 0x0, 0x4000, 0xD1, -8, -16
	banim_frame_oam 0xF000, 0x0, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -7, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 16, -15
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x0, 0x0, 0x76, 5, -8
	banim_frame_end
banim_pirm_ax1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x6000, 0x16, 4, -13
	banim_frame_oam 0xF000, 0x2000, 0x18, 20, -13
	banim_frame_oam 0x4000, 0x2000, 0xB6, 4, -21
	banim_frame_oam 0x0, 0x4000, 0xD1, -8, -16
	banim_frame_oam 0xF000, 0x0, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xB3, -7, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 16, -15
	banim_frame_oam 0x0, 0x4000, 0x4A, -14, 0
	banim_frame_oam 0x0, 0x4000, 0xF, 2, 0
	banim_frame_oam 0x0, 0x0, 0x76, 5, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
