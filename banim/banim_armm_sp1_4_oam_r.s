@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x42
	.global banim_armm_sp1_4_oam_frame_0_r
	.global banim_armm_sp1_4_oam_frame_1_r
	.global banim_armm_sp1_4_oam_frame_2_r
	.section .data
banim_armm_sp1_4_oam_r:
banim_armm_sp1_4_oam_frame_0_r:
	banim_frame_oam 0x0, 0x0, 0x6F, -18, -16
	banim_frame_oam 0x0, 0x0, 0x70, -18, -8
	banim_frame_oam 0x0, 0x0, 0x71, -18, 0
	banim_frame_oam 0x0, 0xF000, 0x53, -10, -24
	banim_frame_oam 0x4000, 0x4000, 0xD3, -10, 8
	banim_frame_end
banim_armm_sp1_4_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0x8E, -14, -28
	banim_frame_oam 0xF000, 0x0, 0xB2, 18, -20
	banim_frame_oam 0x0, 0x0, 0xF2, 18, -4
	banim_frame_oam 0x4000, 0x0, 0xCC, -14, 4
	banim_frame_oam 0x4000, 0x0, 0xEC, 2, 4
	banim_frame_oam 0x0, 0x0, 0x92, 18, 4
	banim_frame_end
banim_armm_sp1_4_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xF000, 0xF, -13, -27
	banim_frame_oam 0x4000, 0x4000, 0x4F, -13, -11
	banim_frame_oam 0x4000, 0xF000, 0x14, -13, -3
	banim_frame_oam 0x0, 0x0, 0x13, 19, -11
	banim_frame_oam 0x0, 0x0, 0x33, -21, -19
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
