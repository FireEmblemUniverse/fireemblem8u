@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x93
	.global banim_pbfm_ax1_3_oam_frame_0_l
	.global banim_pbfm_ax1_3_oam_frame_2_l
	.global banim_pbfm_ax1_3_oam_frame_3_l
	.global banim_pbfm_ax1_3_oam_frame_1_l
	.section .data
banim_pbfm_ax1_3_oam_l:
banim_pbfm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0x0, -8, -24
	banim_frame_oam 0xF000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0xF000, 0x3, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x83, -24, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0xF000, 0xF000, 0x7, -8, -24
	banim_frame_oam 0xF000, 0x5000, 0x9, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x87, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, 8, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_3_l:
	banim_frame_oam 0xF000, 0xF000, 0xA, -8, -24
	banim_frame_oam 0xF000, 0x5000, 0xC, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x8A, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -16, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
