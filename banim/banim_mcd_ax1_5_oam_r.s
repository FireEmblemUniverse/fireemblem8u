@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB6
	.global banim_mcd_ax1_5_oam_frame_0_r
	.global banim_mcd_ax1_5_oam_frame_5_r
	.global banim_mcd_ax1_5_oam_frame_3_r
	.global banim_mcd_ax1_5_oam_frame_14_r
	.global banim_mcd_ax1_5_oam_frame_1_r
	.global banim_mcd_ax1_5_oam_frame_7_r
	.global banim_mcd_ax1_5_oam_frame_9_r
	.global banim_mcd_ax1_5_oam_frame_2_r
	.global banim_mcd_ax1_5_oam_frame_4_r
	.global banim_mcd_ax1_5_oam_frame_16_r
	.global banim_mcd_ax1_5_oam_frame_10_r
	.global banim_mcd_ax1_5_oam_frame_11_r
	.global banim_mcd_ax1_5_oam_frame_8_r
	.global banim_mcd_ax1_5_oam_frame_12_r
	.global banim_mcd_ax1_5_oam_frame_6_r
	.global banim_mcd_ax1_5_oam_frame_13_r
	.global banim_mcd_ax1_5_oam_frame_15_r
	.section .data
banim_mcd_ax1_5_oam_r:
banim_mcd_ax1_5_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x0, -24, -32
	banim_frame_oam 0xF000, 0xF000, 0x4, 8, -32
	banim_frame_oam 0x4000, 0xF000, 0x80, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC0, 0, -40
	banim_frame_end
banim_mcd_ax1_5_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0x6, -24, -32
	banim_frame_oam 0xF000, 0xF000, 0xA, 8, -32
	banim_frame_oam 0x4000, 0xF000, 0x86, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC6, 24, 0
	banim_frame_end
banim_mcd_ax1_5_oam_frame_2_r:
	banim_frame_oam 0x0, 0xF000, 0xC, -16, -40
	banim_frame_oam 0x4000, 0xF000, 0x8C, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -16, 8
	banim_frame_oam 0xF000, 0xF000, 0x10, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x90, 16, 8
	banim_frame_oam 0x0, 0x0, 0xB0, -24, 8
	banim_frame_end
banim_mcd_ax1_5_oam_frame_3_r:
	banim_frame_oam 0x0, 0xF000, 0x12, -16, -40
	banim_frame_oam 0x4000, 0xF000, 0x92, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD2, -16, 8
	banim_frame_oam 0x0, 0x0, 0xD1, -24, 8
	banim_frame_oam 0xF000, 0xF000, 0x16, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x96, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xF1, -8, -48
	banim_frame_oam 0x0, 0x0, 0xF3, 8, -48
	banim_frame_end
banim_mcd_ax1_5_oam_frame_4_r:
	banim_frame_oam 0x0, 0xF000, 0x18, -24, -32
	banim_frame_oam 0xF000, 0xF000, 0x1C, 8, -32
	banim_frame_oam 0x4000, 0xF000, 0x98, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x9C, 8, 0
	banim_frame_oam 0x0, 0x4000, 0xD8, -40, -24
	banim_frame_oam 0x0, 0x0, 0xDA, 8, -40
	banim_frame_oam 0xF000, 0x0, 0xDB, 24, -16
	banim_frame_end
banim_mcd_ax1_5_oam_frame_5_r:
	banim_frame_oam 0x0, 0xF000, 0x0, -24, -32
	banim_frame_oam 0x4000, 0xF000, 0x80, -24, 0
	banim_frame_oam 0xF000, 0xF000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x0, 0x0, 0xC0, 24, -16
	banim_frame_oam 0x4000, 0x0, 0x4, -40, -24
	banim_frame_end
banim_mcd_ax1_5_oam_frame_6_r:
	banim_frame_oam 0x0, 0xF000, 0x6, -24, -32
	banim_frame_oam 0xF000, 0xF000, 0xA, 8, -32
	banim_frame_oam 0x4000, 0xF000, 0x86, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 8, 0
	banim_frame_oam 0x4000, 0x0, 0xC6, -40, -16
	banim_frame_end
banim_mcd_ax1_5_oam_frame_7_r:
	banim_frame_oam 0x0, 0xF000, 0xC, -24, -32
	banim_frame_oam 0xF000, 0xF000, 0x10, 8, -32
	banim_frame_oam 0x4000, 0xF000, 0x8C, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x90, 8, 0
	banim_frame_oam 0x0, 0x0, 0xF1, 0, -40
	banim_frame_end
banim_mcd_ax1_5_oam_frame_10_r:
	banim_frame_oam 0x0, 0xF000, 0x12, -16, -40
	banim_frame_oam 0xF000, 0xF000, 0x16, 16, -40
	banim_frame_oam 0x4000, 0xF000, 0x92, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x96, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD2, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xD6, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF2, -24, 8
	banim_frame_end
banim_mcd_ax1_5_oam_frame_11_r:
	banim_frame_oam 0x0, 0xF000, 0x18, -16, -40
	banim_frame_oam 0xF000, 0xF000, 0x1C, 16, -40
	banim_frame_oam 0x4000, 0xF000, 0x98, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x9C, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xDC, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF8, -24, 8
	banim_frame_end
banim_mcd_ax1_5_oam_frame_12_r:
	banim_frame_oam 0x0, 0xF000, 0x0, -16, -32
	banim_frame_oam 0xF000, 0xF000, 0x4, 16, -32
	banim_frame_oam 0x4000, 0xF000, 0x80, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 16, 0
	banim_frame_oam 0x0, 0x0, 0xC0, -24, 8
	banim_frame_end
banim_mcd_ax1_5_oam_frame_13_r:
	banim_frame_oam 0x0, 0xF000, 0x6, -16, -32
	banim_frame_oam 0xF000, 0xF000, 0xA, 16, -32
	banim_frame_oam 0x4000, 0xF000, 0x86, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 16, 0
	banim_frame_oam 0x0, 0x0, 0xC6, -24, 8
	banim_frame_end
banim_mcd_ax1_5_oam_frame_15_r:
	banim_frame_oam 0x0, 0xF000, 0xC, -24, -40
	banim_frame_oam 0xF000, 0xF000, 0x10, 8, -40
	banim_frame_oam 0xF000, 0x4000, 0x12, 24, -40
	banim_frame_oam 0x4000, 0xF000, 0x8C, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x90, 8, -8
	banim_frame_oam 0xF000, 0x0, 0x92, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD0, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD2, 24, 8
	banim_frame_end
banim_mcd_ax1_5_oam_frame_16_r:
	banim_frame_oam 0x0, 0xF000, 0x13, -24, -40
	banim_frame_oam 0xF000, 0xF000, 0x17, 8, -40
	banim_frame_oam 0xF000, 0x4000, 0x19, 24, -40
	banim_frame_oam 0x4000, 0xF000, 0x93, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x97, 8, -8
	banim_frame_oam 0xF000, 0x0, 0x99, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xD3, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD7, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD9, 24, 8
	banim_frame_end
banim_mcd_ax1_5_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mcd_ax1_5_oam_frame_9_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mcd_ax1_5_oam_frame_14_r:
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
