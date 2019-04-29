@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x84
	.global banim_trof_ro1_oam_frame_0_r
	.global banim_trof_ro1_oam_frame_1_r
	.global banim_trof_ro1_oam_frame_2_r
	.section .data
banim_trof_ro1_oam_r:
banim_trof_ro1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -6, -31
	banim_frame_oam 0x4000, 0x0, 0xE0, -6, -15
	banim_frame_oam 0x4000, 0x0, 0xE2, -6, -7
	banim_frame_oam 0x0, 0xF000, 0x0, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_trof_ro1_oam_frame_1_r:
	banim_frame_oam 0xF000, 0xF000, 0x10, -13, -32
	banim_frame_oam 0xF000, 0x4000, 0x12, 3, -32
	banim_frame_oam 0x0, 0xF000, 0x5, -19, -24
	banim_frame_oam 0xF000, 0x4000, 0x9, 13, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -19, 8
	banim_frame_oam 0x0, 0x0, 0x89, 13, 8
	banim_frame_oam 0xF000, 0x0, 0xA4, -27, -8
	banim_frame_end
banim_trof_ro1_oam_frame_2_r:
	banim_frame_oam 0xF000, 0xF000, 0x91, -15, -34
	banim_frame_oam 0xF000, 0x4000, 0x93, 1, -34
	banim_frame_oam 0x0, 0xF000, 0xA, -24, -32
	banim_frame_oam 0xF000, 0x4000, 0xE, 8, -32
	banim_frame_oam 0x4000, 0xF000, 0x8A, -24, 0
	banim_frame_oam 0xF000, 0x0, 0x8E, 8, 0
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
