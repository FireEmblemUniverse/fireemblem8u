@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x7D
	.global banim_prim_ro1_oam_frame_0_l
	.global banim_prim_ro1_oam_frame_2_l
	.global banim_prim_ro1_oam_frame_1_l
	.section .data
banim_prim_ro1_oam_l:
banim_prim_ro1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xCB, -7, 0
	banim_frame_oam 0xF000, 0x1000, 0xCD, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x4, -5, -24
	banim_frame_end
banim_prim_ro1_oam_frame_1_l:
	banim_frame_oam 0xF000, 0xF000, 0x10, -3, -18
	banim_frame_oam 0xF000, 0x5000, 0x12, -11, -18
	banim_frame_oam 0x4000, 0x1000, 0x4, -5, -26
	banim_frame_end
banim_prim_ro1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x90, -5, -19
	banim_frame_oam 0xF000, 0x1000, 0x92, -13, -19
	banim_frame_oam 0x0, 0x5000, 0xCE, -5, -3
	banim_frame_oam 0xF000, 0x1000, 0xD0, -13, -3
	banim_frame_oam 0x4000, 0x1000, 0x4, -6, -27
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
