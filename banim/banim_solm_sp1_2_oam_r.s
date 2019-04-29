@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x98
	.global banim_solm_sp1_2_oam_frame_0_r
	.global banim_solm_sp1_2_oam_frame_2_r
	.global banim_solm_sp1_2_oam_frame_1_r
	.section .data
banim_solm_sp1_2_oam_r:
banim_solm_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x40, -7, -8
	banim_frame_oam 0xF000, 0x0, 0x42, 9, -8
	banim_frame_oam 0x4000, 0x0, 0x80, -7, 8
	banim_frame_oam 0x0, 0x0, 0x82, 9, 8
	banim_frame_oam 0x4000, 0x0, 0x20, -5, -16
	banim_frame_oam 0x0, 0x0, 0x0, 1, -24
	banim_frame_end
banim_solm_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x3, -5, -21
	banim_frame_oam 0x0, 0x0, 0x25, 11, -13
	banim_frame_oam 0x4000, 0xF000, 0x43, -6, -5
	banim_frame_oam 0x4000, 0x4000, 0x83, -6, 11
	banim_frame_oam 0x0, 0x0, 0x1, 26, 3
	banim_frame_end
banim_solm_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x7, -4, -13
	banim_frame_oam 0xF000, 0x0, 0x9, 12, -13
	banim_frame_oam 0x4000, 0x0, 0x47, -4, 3
	banim_frame_oam 0x0, 0x0, 0x49, 12, 3
	banim_frame_oam 0x4000, 0x0, 0x5, -1, 11
	banim_frame_oam 0x0, 0x0, 0x26, 15, 11
	banim_frame_oam 0xF000, 0x0, 0x2, 20, -5
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
