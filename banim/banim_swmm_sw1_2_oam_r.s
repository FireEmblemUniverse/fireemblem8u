@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x15
	.global banim_swmm_sw1_2_oam_frame_0_r
	.global banim_swmm_sw1_2_oam_frame_1_r
	.section .data
banim_swmm_sw1_2_oam_r:
banim_swmm_sw1_2_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0x9C, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xDA, -8, -24
	banim_frame_oam 0x0, 0x0, 0x19, 8, 0
	banim_frame_oam 0x0, 0x0, 0x1A, 8, 8
	banim_frame_end
banim_swmm_sw1_2_oam_frame_1_r:
	banim_frame_oam 0xF000, 0xF000, 0x9E, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xFA, -8, -24
	banim_frame_oam 0x0, 0x0, 0xD9, 8, 8
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
