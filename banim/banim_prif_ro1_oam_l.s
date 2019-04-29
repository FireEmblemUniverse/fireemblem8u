@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x7F
	.global banim_prif_ro1_oam_frame_0_l
	.global banim_prif_ro1_oam_frame_1_l
	.global banim_prif_ro1_oam_frame_8_l
	.global banim_prif_ro1_oam_frame_2_l
	.global banim_prif_ro1_oam_frame_9_l
	.global banim_prif_ro1_oam_frame_6_l
	.global banim_prif_ro1_oam_frame_4_l
	.global banim_prif_ro1_oam_frame_5_l
	.global banim_prif_ro1_oam_frame_3_l
	.global banim_prif_ro1_oam_frame_7_l
	.section .data
banim_prif_ro1_oam_l:
banim_prif_ro1_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0x0, -5, -16
	banim_frame_oam 0xF000, 0x5000, 0x2, -13, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, -7, -24
	banim_frame_end
banim_prif_ro1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x1000, 0x3, 1, -24
	banim_frame_oam 0x0, 0x1000, 0x5, -7, -24
	banim_frame_oam 0x4000, 0xF000, 0x23, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0x63, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x84, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -15, 8
	banim_frame_end
banim_prif_ro1_oam_frame_2_l:
	banim_frame_oam 0xF000, 0xF000, 0x7, -7, -24
	banim_frame_oam 0xF000, 0x5000, 0x29, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x87, -7, 8
	banim_frame_oam 0xF000, 0x5000, 0x3, 9, -27
	banim_frame_oam 0x0, 0x1000, 0x6, -23, -5
	banim_frame_end
banim_prif_ro1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0xA, -7, -16
	banim_frame_oam 0xF000, 0x1000, 0xC, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x4A, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x4C, -15, 0
	banim_frame_oam 0x0, 0x1000, 0x9, -23, -8
	banim_frame_oam 0x4000, 0x1000, 0x7, -7, -24
	banim_frame_oam 0xF000, 0x5000, 0x3, 9, -27
	banim_frame_oam 0x4000, 0x1000, 0x87, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -15, 8
	banim_frame_end
banim_prif_ro1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0xD, -7, -16
	banim_frame_oam 0xF000, 0x1000, 0xF, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x4D, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x4F, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x7, -7, -24
	banim_frame_oam 0xF000, 0x5000, 0x3, 9, -27
	banim_frame_oam 0x4000, 0x1000, 0x87, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x83, -23, 0
	banim_frame_end
banim_prif_ro1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0x6A, -7, -16
	banim_frame_oam 0xF000, 0x1000, 0x6C, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xAA, -7, 0
	banim_frame_oam 0x0, 0x1000, 0xAC, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x7, -7, -24
	banim_frame_oam 0xF000, 0x5000, 0x3, 9, -27
	banim_frame_oam 0x4000, 0x1000, 0x87, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -15, 8
	banim_frame_end
banim_prif_ro1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0x6D, -7, -16
	banim_frame_oam 0xF000, 0x1000, 0x6F, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xAD, -7, 0
	banim_frame_oam 0x0, 0x1000, 0xAF, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x4, -7, -24
	banim_frame_oam 0xF000, 0x5000, 0x3, 9, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -15, 8
	banim_frame_end
banim_prif_ro1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -6, -18
	banim_frame_oam 0xF000, 0x1000, 0xA2, -14, -18
	banim_frame_oam 0x4000, 0x1000, 0xE0, -6, -2
	banim_frame_oam 0x0, 0x1000, 0xE2, -14, -2
	banim_frame_oam 0x4000, 0x1000, 0xA6, -6, 6
	banim_frame_oam 0x0, 0x1000, 0xA8, -14, 6
	banim_frame_oam 0x4000, 0x1000, 0x4, -7, -26
	banim_frame_end
banim_prif_ro1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0xA3, -5, -19
	banim_frame_oam 0xF000, 0x1000, 0xA5, -13, -19
	banim_frame_oam 0x4000, 0x1000, 0xE3, -5, -3
	banim_frame_oam 0x0, 0x1000, 0xE5, -13, -3
	banim_frame_oam 0x4000, 0x1000, 0xC6, -5, 5
	banim_frame_oam 0x0, 0x1000, 0xC8, -13, 5
	banim_frame_oam 0x4000, 0x1000, 0x4, -8, -27
	banim_frame_end
banim_prif_ro1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
