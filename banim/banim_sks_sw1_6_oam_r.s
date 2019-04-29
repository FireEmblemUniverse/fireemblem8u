@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xAA
	.global banim_sks_sw1_6_oam_frame_0_r
	.global banim_sks_sw1_6_oam_frame_1_r
	.global banim_sks_sw1_6_oam_frame_3_r
	.global banim_sks_sw1_6_oam_frame_2_r
	.section .data
banim_sks_sw1_6_oam_r:
banim_sks_sw1_6_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0x11, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x13, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x91, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 0, 8
	banim_frame_oam 0x0, 0x0, 0xB2, 8, 8
	banim_frame_end
banim_sks_sw1_6_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0x14, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -24, 8
	banim_frame_oam 0x0, 0x0, 0xB5, 8, 8
	banim_frame_end
banim_sks_sw1_6_oam_frame_2_r:
	banim_frame_oam 0x0, 0xF000, 0x18, -16, -8
	banim_frame_end
banim_sks_sw1_6_oam_frame_3_r:
	banim_frame_oam 0x4000, 0xF000, 0x98, -24, -8
	banim_frame_oam 0xF000, 0x0, 0x9C, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -24, 8
	banim_frame_oam 0x0, 0x0, 0xDC, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xF9, -16, 16
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
	banim_frame_end
