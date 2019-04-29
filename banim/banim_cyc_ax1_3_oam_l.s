@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xAF
	.global banim_cyc_ax1_3_oam_frame_0_l
	.global banim_cyc_ax1_3_oam_frame_1_l
	.global banim_cyc_ax1_3_oam_frame_2_l
	.section .data
banim_cyc_ax1_3_oam_l:
banim_cyc_ax1_3_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0x14, -16, -44
	banim_frame_oam 0xF000, 0xF000, 0x18, -32, -44
	banim_frame_oam 0xF000, 0x5000, 0x1A, -40, -44
	banim_frame_oam 0xF000, 0xF000, 0x98, -32, -12
	banim_frame_oam 0xF000, 0x5000, 0x9A, -40, -12
	banim_frame_end
banim_cyc_ax1_3_oam_frame_1_l:
	banim_frame_oam 0xF000, 0xF000, 0x10, -24, -44
	banim_frame_oam 0xF000, 0xF000, 0x14, -40, -44
	banim_frame_oam 0xF000, 0xF000, 0x94, -40, -12
	banim_frame_oam 0xF000, 0x5000, 0x4F, 8, -28
	banim_frame_oam 0xF000, 0x1000, 0xCF, 8, 4
	banim_frame_oam 0xF000, 0x1000, 0xF, 16, -12
	banim_frame_end
banim_cyc_ax1_3_oam_frame_2_l:
	banim_frame_oam 0xF000, 0xF000, 0x17, -24, -44
	banim_frame_oam 0xF000, 0xF000, 0x1B, -40, -44
	banim_frame_oam 0xF000, 0xF000, 0x9B, -40, -12
	banim_frame_oam 0x0, 0x1000, 0xF6, 8, 12
	banim_frame_oam 0xF000, 0x1000, 0x76, 8, -20
	banim_frame_oam 0x0, 0x1000, 0x56, -48, -12
	banim_frame_oam 0xF000, 0x1000, 0x16, 16, -20
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
