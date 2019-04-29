@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB4
	.global banim_mcd_ax1_3_oam_frame_0_l
	.global banim_mcd_ax1_3_oam_frame_2_l
	.global banim_mcd_ax1_3_oam_frame_1_l
	.section .data
banim_mcd_ax1_3_oam_l:
banim_mcd_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0xF000, 0x0, 0, -32
	banim_frame_oam 0xF000, 0xF000, 0x4, -16, -32
	banim_frame_oam 0xF000, 0x5000, 0x6, -24, -32
	banim_frame_oam 0x4000, 0xF000, 0x80, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -16, 0
	banim_frame_oam 0xF000, 0x1000, 0x86, -24, 0
	banim_frame_end
banim_mcd_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0xF000, 0x27, 0, -32
	banim_frame_oam 0xF000, 0xF000, 0x2B, -16, -32
	banim_frame_oam 0xF000, 0x5000, 0x2D, -24, -32
	banim_frame_oam 0x4000, 0xF000, 0xA7, 0, 0
	banim_frame_oam 0x0, 0x5000, 0xAB, -16, 0
	banim_frame_oam 0xF000, 0x1000, 0xAD, -24, 0
	banim_frame_end
banim_mcd_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x0, 0xF000, 0xE, -8, -40
	banim_frame_oam 0xF000, 0xF000, 0x12, -24, -40
	banim_frame_oam 0xF000, 0x5000, 0x14, -32, -40
	banim_frame_oam 0x4000, 0xF000, 0x8E, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x92, -24, -8
	banim_frame_oam 0xF000, 0x1000, 0x94, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCE, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD2, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD4, -32, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
