@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x84
	.global banim_trof_ro1_oam_frame_0_l
	.global banim_trof_ro1_oam_frame_1_l
	.global banim_trof_ro1_oam_frame_2_l
	.section .data
banim_trof_ro1_oam_l:
banim_trof_ro1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -10, -31
	banim_frame_oam 0x4000, 0x1000, 0xE0, -10, -15
	banim_frame_oam 0x4000, 0x1000, 0xE2, -10, -7
	banim_frame_oam 0x0, 0xF000, 0x0, -16, -24
	banim_frame_oam 0xF000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_trof_ro1_oam_frame_1_l:
	banim_frame_oam 0xF000, 0xF000, 0x10, -3, -32
	banim_frame_oam 0xF000, 0x5000, 0x12, -11, -32
	banim_frame_oam 0x0, 0xF000, 0x5, -13, -24
	banim_frame_oam 0xF000, 0x5000, 0x9, -21, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -21, 8
	banim_frame_oam 0xF000, 0x1000, 0xA4, 19, -8
	banim_frame_end
banim_trof_ro1_oam_frame_2_l:
	banim_frame_oam 0xF000, 0xF000, 0x91, -1, -34
	banim_frame_oam 0xF000, 0x5000, 0x93, -9, -34
	banim_frame_oam 0x0, 0xF000, 0xA, -8, -32
	banim_frame_oam 0xF000, 0x5000, 0xE, -16, -32
	banim_frame_oam 0x4000, 0xF000, 0x8A, -8, 0
	banim_frame_oam 0xF000, 0x1000, 0x8E, -16, 0
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
