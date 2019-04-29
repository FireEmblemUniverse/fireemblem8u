@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x40
	.global banim_armm_sp1_2_oam_frame_0_l
	.global banim_armm_sp1_2_oam_frame_1_l
	.global banim_armm_sp1_2_oam_frame_2_l
	.section .data
banim_armm_sp1_2_oam_l:
banim_armm_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x1000, 0x6F, 10, -16
	banim_frame_oam 0x0, 0x1000, 0x70, 10, -8
	banim_frame_oam 0x0, 0x1000, 0x71, 10, 0
	banim_frame_oam 0x0, 0xF000, 0x53, -22, -24
	banim_frame_oam 0x4000, 0x5000, 0xD3, -22, 8
	banim_frame_end
banim_armm_sp1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0xF000, 0x8E, -18, -28
	banim_frame_oam 0xF000, 0x1000, 0xB2, -26, -20
	banim_frame_oam 0x0, 0x1000, 0xF2, -26, -4
	banim_frame_oam 0x4000, 0x1000, 0xCC, -2, 4
	banim_frame_oam 0x4000, 0x1000, 0xEC, -18, 4
	banim_frame_oam 0x0, 0x1000, 0x92, -26, 4
	banim_frame_end
banim_armm_sp1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xF000, 0xF, -19, -27
	banim_frame_oam 0x4000, 0x5000, 0x4F, -19, -11
	banim_frame_oam 0x4000, 0xF000, 0x14, -19, -3
	banim_frame_oam 0x0, 0x1000, 0x13, -27, -11
	banim_frame_oam 0x0, 0x1000, 0x33, 13, -19
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
