@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xF
	.global banim_bram_sw1_4_oam_frame_0_r
	.global banim_bram_sw1_4_oam_frame_1_r
	.global banim_bram_sw1_4_oam_frame_2_r
	.section .data
banim_bram_sw1_4_oam_r:
banim_bram_sw1_4_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x1D, 1, -10
	banim_frame_oam 0x4000, 0x0, 0x5D, 1, 6
	banim_frame_oam 0xF000, 0xF000, 0x20, -8, -16
	banim_frame_oam 0xF000, 0x4000, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -24
	banim_frame_oam 0x0, 0x0, 0x3, -16, -7
	banim_frame_oam 0x0, 0x0, 0x2, -16, 8
	banim_frame_end
banim_bram_sw1_4_oam_frame_1_r:
	banim_frame_oam 0x4000, 0xF000, 0xA1, -3, -10
	banim_frame_oam 0x4000, 0x4000, 0xE1, -3, 6
	banim_frame_oam 0x0, 0x0, 0xA0, -11, -10
	banim_frame_oam 0x0, 0x0, 0xE0, -11, 6
	banim_frame_oam 0x0, 0x0, 0xA5, 29, -2
	banim_frame_oam 0x4000, 0x4000, 0x16, -11, -18
	banim_frame_oam 0x4000, 0x0, 0xE5, 12, 14
	banim_frame_oam 0x4000, 0x0, 0xC5, -4, 14
	banim_frame_oam 0x0, 0x0, 0xC0, 28, 14
	banim_frame_end
banim_bram_sw1_4_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0x13, 0, -9
	banim_frame_oam 0x4000, 0xF000, 0x33, 1, -1
	banim_frame_oam 0x4000, 0x4000, 0x73, 1, 15
	banim_frame_oam 0x4000, 0x0, 0x70, 0, -17
	banim_frame_oam 0x0, 0x0, 0x72, 16, -17
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
