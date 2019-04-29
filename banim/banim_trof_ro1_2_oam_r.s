@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x85
	.global banim_trof_ro1_2_oam_frame_0_r
	.global banim_trof_ro1_2_oam_frame_6_r
	.global banim_trof_ro1_2_oam_frame_14_r
	.global banim_trof_ro1_2_oam_frame_5_r
	.global banim_trof_ro1_2_oam_frame_12_r
	.global banim_trof_ro1_2_oam_frame_2_r
	.global banim_trof_ro1_2_oam_frame_13_r
	.global banim_trof_ro1_2_oam_frame_4_r
	.global banim_trof_ro1_2_oam_frame_7_r
	.global banim_trof_ro1_2_oam_frame_11_r
	.global banim_trof_ro1_2_oam_frame_1_r
	.global banim_trof_ro1_2_oam_frame_9_r
	.global banim_trof_ro1_2_oam_frame_10_r
	.global banim_trof_ro1_2_oam_frame_8_r
	.global banim_trof_ro1_2_oam_frame_3_r
	.section .data
banim_trof_ro1_2_oam_r:
banim_trof_ro1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x0, -17, -40
	banim_frame_oam 0xF000, 0x4000, 0x4, 15, -40
	banim_frame_oam 0x4000, 0xF000, 0x80, -17, -8
	banim_frame_oam 0xF000, 0x0, 0x84, 15, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -17, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 15, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0x5, -15, -40
	banim_frame_oam 0xF000, 0x4000, 0x9, 17, -40
	banim_frame_oam 0x4000, 0xF000, 0x85, -15, -8
	banim_frame_oam 0xF000, 0x0, 0x89, 17, -8
	banim_frame_oam 0x4000, 0x4000, 0xC5, -15, 8
	banim_frame_oam 0x0, 0x0, 0xC9, 17, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0xF000, 0xA, -21, -40
	banim_frame_oam 0xF000, 0xF000, 0xE, 11, -40
	banim_frame_oam 0x4000, 0xF000, 0x8A, -21, -8
	banim_frame_oam 0x0, 0x4000, 0x8E, 11, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -21, 8
	banim_frame_oam 0x4000, 0x0, 0xCE, 11, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0xF000, 0x10, -15, -40
	banim_frame_oam 0xF000, 0xF000, 0x14, 17, -40
	banim_frame_oam 0x4000, 0xF000, 0x90, -15, -8
	banim_frame_oam 0x0, 0x4000, 0x94, 17, -8
	banim_frame_oam 0x4000, 0x4000, 0xD0, -15, 8
	banim_frame_oam 0x4000, 0x0, 0xD4, 17, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0xF000, 0x16, -11, -40
	banim_frame_oam 0xF000, 0x4000, 0x1A, 21, -40
	banim_frame_oam 0x4000, 0xF000, 0x96, -11, -8
	banim_frame_oam 0xF000, 0x0, 0x9A, 21, -8
	banim_frame_oam 0x4000, 0x4000, 0xD6, -11, 8
	banim_frame_oam 0x0, 0x0, 0xDA, 21, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0xC6, -5, -31
	banim_frame_oam 0xF000, 0x0, 0xC8, 11, -31
	banim_frame_oam 0x0, 0x0, 0xE9, -5, -39
	banim_frame_oam 0x0, 0x4000, 0x88, -5, -15
	banim_frame_oam 0x0, 0xF000, 0x0, -12, -24
	banim_frame_oam 0xF000, 0x4000, 0x4, 20, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -12, 8
	banim_frame_oam 0x0, 0x0, 0x84, 20, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -7, -39
	banim_frame_oam 0xF000, 0x0, 0xA2, 9, -39
	banim_frame_oam 0x4000, 0x0, 0xE0, -7, -23
	banim_frame_oam 0x0, 0x0, 0xE2, 9, -23
	banim_frame_oam 0x0, 0x4000, 0xC3, -7, -15
	banim_frame_oam 0x0, 0xF000, 0x0, -12, -24
	banim_frame_oam 0xF000, 0x4000, 0x4, 20, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -12, 8
	banim_frame_oam 0x0, 0x0, 0x84, 20, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_7_r:
	banim_frame_oam 0xF000, 0xF000, 0x5, -7, -47
	banim_frame_oam 0xF000, 0x4000, 0x7, 9, -47
	banim_frame_oam 0x0, 0x4000, 0x85, -7, -15
	banim_frame_oam 0xF000, 0x0, 0x87, 9, -15
	banim_frame_oam 0x0, 0xF000, 0x0, -12, -24
	banim_frame_oam 0xF000, 0x4000, 0x4, 20, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -12, 8
	banim_frame_oam 0x0, 0x0, 0x84, 20, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0xF000, 0xA, -14, -40
	banim_frame_oam 0xF000, 0x4000, 0xE, 18, -40
	banim_frame_oam 0x4000, 0xF000, 0x8A, -14, -8
	banim_frame_oam 0xF000, 0x0, 0x8E, 18, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -14, 8
	banim_frame_oam 0x0, 0x0, 0xCE, 18, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0xF000, 0xF, -16, -42
	banim_frame_oam 0x4000, 0xF000, 0x8F, -16, -10
	banim_frame_oam 0x4000, 0x4000, 0xCF, -16, 6
	banim_frame_end
banim_trof_ro1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0xF000, 0x13, -16, -40
	banim_frame_oam 0x4000, 0xF000, 0x93, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD3, -16, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_11_r:
	banim_frame_oam 0x0, 0xF000, 0x17, -13, -40
	banim_frame_oam 0x4000, 0xF000, 0x97, -13, -8
	banim_frame_oam 0x4000, 0x4000, 0xD7, -13, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0xF000, 0x1B, -16, -40
	banim_frame_oam 0xF000, 0x4000, 0x1F, 16, -40
	banim_frame_oam 0x4000, 0xF000, 0x9B, -16, -8
	banim_frame_oam 0xF000, 0x0, 0x9F, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xDB, -16, 8
	banim_frame_oam 0x0, 0x0, 0xDF, 16, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0xA5, -12, -40
	banim_frame_oam 0xF000, 0x0, 0xA7, 4, -40
	banim_frame_oam 0x4000, 0x0, 0xE5, -12, -24
	banim_frame_oam 0x0, 0x0, 0xE7, 4, -24
	banim_frame_oam 0x0, 0x4000, 0xC8, -12, -16
	banim_frame_oam 0x0, 0xF000, 0x5, -19, -24
	banim_frame_oam 0xF000, 0x4000, 0x9, 13, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, 13, 8
	banim_frame_end
banim_trof_ro1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0xCB, -14, -42
	banim_frame_oam 0xF000, 0x0, 0xCD, 2, -42
	banim_frame_oam 0x0, 0x4000, 0xCE, -14, -26
	banim_frame_oam 0xF000, 0x0, 0xD0, 2, -26
	banim_frame_oam 0x0, 0x0, 0x8F, -6, -10
	banim_frame_oam 0x0, 0xF000, 0xA, -24, -32
	banim_frame_oam 0xF000, 0x4000, 0xE, 8, -32
	banim_frame_oam 0x4000, 0xF000, 0x8A, -24, 0
	banim_frame_oam 0xF000, 0x0, 0x8E, 8, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -6, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, -6, -3
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
