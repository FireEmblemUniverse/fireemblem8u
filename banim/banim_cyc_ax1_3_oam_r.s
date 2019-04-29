@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xAF
	.global banim_cyc_ax1_3_oam_frame_0_r
	.global banim_cyc_ax1_3_oam_frame_1_r
	.global banim_cyc_ax1_3_oam_frame_2_r
	.section .data
banim_cyc_ax1_3_oam_r:
banim_cyc_ax1_3_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0x14, -16, -44
	banim_frame_oam 0xF000, 0xF000, 0x18, 16, -44
	banim_frame_oam 0xF000, 0x4000, 0x1A, 32, -44
	banim_frame_oam 0xF000, 0xF000, 0x98, 16, -12
	banim_frame_oam 0xF000, 0x4000, 0x9A, 32, -12
	banim_frame_end
banim_cyc_ax1_3_oam_frame_1_r:
	banim_frame_oam 0xF000, 0xF000, 0x10, -8, -44
	banim_frame_oam 0xF000, 0xF000, 0x14, 24, -44
	banim_frame_oam 0xF000, 0xF000, 0x94, 24, -12
	banim_frame_oam 0xF000, 0x4000, 0x4F, -16, -28
	banim_frame_oam 0xF000, 0x0, 0xCF, -16, 4
	banim_frame_oam 0xF000, 0x0, 0xF, -24, -12
	banim_frame_end
banim_cyc_ax1_3_oam_frame_2_r:
	banim_frame_oam 0xF000, 0xF000, 0x17, -8, -44
	banim_frame_oam 0xF000, 0xF000, 0x1B, 24, -44
	banim_frame_oam 0xF000, 0xF000, 0x9B, 24, -12
	banim_frame_oam 0x0, 0x0, 0xF6, -16, 12
	banim_frame_oam 0xF000, 0x0, 0x76, -16, -20
	banim_frame_oam 0x0, 0x0, 0x56, 40, -12
	banim_frame_oam 0xF000, 0x0, 0x16, -24, -20
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
