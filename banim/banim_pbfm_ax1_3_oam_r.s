@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x93
	.global banim_pbfm_ax1_3_oam_frame_0_r
	.global banim_pbfm_ax1_3_oam_frame_2_r
	.global banim_pbfm_ax1_3_oam_frame_3_r
	.global banim_pbfm_ax1_3_oam_frame_1_r
	.section .data
banim_pbfm_ax1_3_oam_r:
banim_pbfm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0x0, -8, -24
	banim_frame_oam 0xF000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0x3, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x83, -8, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0xF000, 0xF000, 0x7, -8, -24
	banim_frame_oam 0xF000, 0x4000, 0x9, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x87, -8, 8
	banim_frame_oam 0x0, 0x0, 0x89, 8, 8
	banim_frame_oam 0x0, 0x0, 0xA0, -16, 8
	banim_frame_end
banim_pbfm_ax1_3_oam_frame_3_r:
	banim_frame_oam 0xF000, 0xF000, 0xA, -8, -24
	banim_frame_oam 0xF000, 0x4000, 0xC, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x8A, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8C, 8, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
