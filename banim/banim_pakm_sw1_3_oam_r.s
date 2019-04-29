@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x3B
	.global banim_pakm_sw1_3_oam_frame_0_r
	.global banim_pakm_sw1_3_oam_frame_2_r
	.global banim_pakm_sw1_3_oam_frame_1_r
	.section .data
banim_pakm_sw1_3_oam_r:
banim_pakm_sw1_3_oam_frame_0_r:
	banim_frame_oam 0xF000, 0x0, 0x84, 2, -32
	banim_frame_oam 0x4000, 0xF000, 0xC0, -13, 0
	banim_frame_oam 0x4000, 0xF000, 0x80, -15, -16
	banim_frame_oam 0x0, 0x0, 0x20, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x40, -21, -32
	banim_frame_oam 0xF000, 0x0, 0x42, -5, -32
	banim_frame_end
banim_pakm_sw1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, 8
	banim_frame_oam 0x0, 0xF000, 0x60, -12, -24
	banim_frame_oam 0xF000, 0x4000, 0x64, 20, -24
	banim_frame_oam 0x0, 0x4000, 0x20, -3, -40
	banim_frame_oam 0xF000, 0x0, 0x22, 13, -40
	banim_frame_oam 0x0, 0x0, 0x43, -11, -32
	banim_frame_oam 0x0, 0x0, 0xE4, 28, 0
	banim_frame_oam 0x0, 0x0, 0x2C, 15, -20
	banim_frame_end
banim_pakm_sw1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0x0, -6, 8
	banim_frame_oam 0x0, 0x4000, 0x4, -1, -40
	banim_frame_oam 0xF000, 0x0, 0x6, 15, -40
	banim_frame_oam 0x0, 0x0, 0x23, -9, -32
	banim_frame_oam 0x0, 0xF000, 0x7, -10, -24
	banim_frame_oam 0xF000, 0x0, 0x87, 30, -8
	banim_frame_oam 0x0, 0x0, 0x2C, 20, -20
	banim_frame_oam 0xF000, 0x4000, 0xB, 22, -24
	banim_frame_oam 0x0, 0x0, 0x7A, 12, -20
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
