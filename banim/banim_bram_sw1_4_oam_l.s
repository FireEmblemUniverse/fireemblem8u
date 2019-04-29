@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xF
	.global banim_bram_sw1_4_oam_frame_0_l
	.global banim_bram_sw1_4_oam_frame_1_l
	.global banim_bram_sw1_4_oam_frame_2_l
	.section .data
banim_bram_sw1_4_oam_l:
banim_bram_sw1_4_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x1D, -17, -10
	banim_frame_oam 0x4000, 0x1000, 0x5D, -17, 6
	banim_frame_oam 0xF000, 0xF000, 0x20, -8, -16
	banim_frame_oam 0xF000, 0x5000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -7
	banim_frame_oam 0x0, 0x1000, 0x2, 8, 8
	banim_frame_end
banim_bram_sw1_4_oam_frame_1_l:
	banim_frame_oam 0x4000, 0xF000, 0xA1, -29, -10
	banim_frame_oam 0x4000, 0x5000, 0xE1, -29, 6
	banim_frame_oam 0x0, 0x1000, 0xA0, 3, -10
	banim_frame_oam 0x0, 0x1000, 0xE0, 3, 6
	banim_frame_oam 0x0, 0x1000, 0xA5, -37, -2
	banim_frame_oam 0x4000, 0x5000, 0x16, -21, -18
	banim_frame_oam 0x4000, 0x1000, 0xE5, -28, 14
	banim_frame_oam 0x4000, 0x1000, 0xC5, -12, 14
	banim_frame_oam 0x0, 0x1000, 0xC0, -36, 14
	banim_frame_end
banim_bram_sw1_4_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0x13, -32, -9
	banim_frame_oam 0x4000, 0xF000, 0x33, -33, -1
	banim_frame_oam 0x4000, 0x5000, 0x73, -33, 15
	banim_frame_oam 0x4000, 0x1000, 0x70, -16, -17
	banim_frame_oam 0x0, 0x1000, 0x72, -24, -17
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
