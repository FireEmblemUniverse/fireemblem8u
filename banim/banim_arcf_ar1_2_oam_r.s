@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x28
	.global banim_arcf_ar1_2_oam_frame_0_r
	.global banim_arcf_ar1_2_oam_frame_1_r
	.global banim_arcf_ar1_2_oam_frame_2_r
	.section .data
banim_arcf_ar1_2_oam_r:
banim_arcf_ar1_2_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0x8E, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xAE, -6, -8
	banim_frame_oam 0x0, 0x4000, 0xCE, -8, 0
	banim_frame_oam 0xF000, 0x0, 0xD0, 8, 0
	banim_frame_oam 0x0, 0x0, 0x2, -4, -24
	banim_frame_end
banim_arcf_ar1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x0, 0x89, -3, -14
	banim_frame_oam 0x0, 0x0, 0x8B, 1, -22
	banim_frame_oam 0x4000, 0x0, 0xA9, -1, -6
	banim_frame_oam 0x4000, 0x0, 0xC9, 0, 2
	banim_frame_oam 0x4000, 0x0, 0xE9, -1, 10
	banim_frame_oam 0x0, 0x0, 0xEB, 15, 10
	banim_frame_oam 0x0, 0x0, 0xCB, -8, 7
	banim_frame_oam 0x0, 0x0, 0xAB, 15, -3
	banim_frame_end
banim_arcf_ar1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x8C, 3, -5
	banim_frame_oam 0x4000, 0x0, 0xCC, 3, 11
	banim_frame_oam 0x0, 0x0, 0xEC, -5, 7
	banim_frame_oam 0x0, 0x0, 0xED, 19, 11
	banim_frame_oam 0x0, 0x0, 0x8E, 19, -3
	banim_frame_oam 0x0, 0x0, 0x2F, 4, -13
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
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
