@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x15
	.global banim_swmm_sw1_2_oam_frame_0_l
	.global banim_swmm_sw1_2_oam_frame_1_l
	.section .data
banim_swmm_sw1_2_oam_l:
banim_swmm_sw1_2_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0x9C, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xDA, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x19, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x1A, -16, 8
	banim_frame_end
banim_swmm_sw1_2_oam_frame_1_l:
	banim_frame_oam 0xF000, 0xF000, 0x9E, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xFA, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xD9, -16, 8
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
