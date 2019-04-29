@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB8
	.global banim_mcd_ax1_6_oam_frame_0_r
	.global banim_mcd_ax1_6_oam_frame_2_r
	.global banim_mcd_ax1_6_oam_frame_1_r
	.section .data
banim_mcd_ax1_6_oam_r:
banim_mcd_ax1_6_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x0, -32, -32
	banim_frame_oam 0xF000, 0xF000, 0x4, 0, -32
	banim_frame_oam 0xF000, 0x4000, 0x6, 16, -32
	banim_frame_oam 0x4000, 0xF000, 0x80, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 0, 0
	banim_frame_oam 0xF000, 0x0, 0x86, 16, 0
	banim_frame_end
banim_mcd_ax1_6_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0x27, -32, -32
	banim_frame_oam 0xF000, 0xF000, 0x2B, 0, -32
	banim_frame_oam 0xF000, 0x4000, 0x2D, 16, -32
	banim_frame_oam 0x4000, 0xF000, 0xA7, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xAB, 0, 0
	banim_frame_oam 0xF000, 0x0, 0xAD, 16, 0
	banim_frame_end
banim_mcd_ax1_6_oam_frame_2_r:
	banim_frame_oam 0x0, 0xF000, 0xE, -24, -40
	banim_frame_oam 0xF000, 0xF000, 0x12, 8, -40
	banim_frame_oam 0xF000, 0x4000, 0x14, 24, -40
	banim_frame_oam 0x4000, 0xF000, 0x8E, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x92, 8, -8
	banim_frame_oam 0xF000, 0x0, 0x94, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xCE, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD2, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD4, 24, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
