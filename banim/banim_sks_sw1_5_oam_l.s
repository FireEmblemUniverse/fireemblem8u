@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xA8
	.global banim_sks_sw1_5_oam_frame_0_l
	.global banim_sks_sw1_5_oam_frame_1_l
	.global banim_sks_sw1_5_oam_frame_3_l
	.global banim_sks_sw1_5_oam_frame_2_l
	.section .data
banim_sks_sw1_5_oam_l:
banim_sks_sw1_5_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0x11, 0, -24
	banim_frame_oam 0xF000, 0x5000, 0x13, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x91, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xB2, -16, 8
	banim_frame_end
banim_sks_sw1_5_oam_frame_1_l:
	banim_frame_oam 0x0, 0xF000, 0x14, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xB5, -16, 8
	banim_frame_end
banim_sks_sw1_5_oam_frame_2_l:
	banim_frame_oam 0x0, 0xF000, 0x18, -16, -8
	banim_frame_end
banim_sks_sw1_5_oam_frame_3_l:
	banim_frame_oam 0x4000, 0xF000, 0x98, -8, -8
	banim_frame_oam 0xF000, 0x1000, 0x9C, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xDC, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xF9, 0, 16
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
