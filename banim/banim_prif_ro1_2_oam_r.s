@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC7
	.global banim_prif_ro1_2_oam_frame_0_r
	.global banim_prif_ro1_2_oam_frame_2_r
	.global banim_prif_ro1_2_oam_frame_1_r
	.section .data
banim_prif_ro1_2_oam_r:
banim_prif_ro1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, -16
	banim_frame_oam 0x0, 0x4000, 0xCB, -9, 0
	banim_frame_oam 0xF000, 0x0, 0xCD, 7, 0
	banim_frame_oam 0x4000, 0x0, 0x4, -11, -24
	banim_frame_end
banim_prif_ro1_2_oam_frame_1_r:
	banim_frame_oam 0xF000, 0xF000, 0x10, -13, -18
	banim_frame_oam 0xF000, 0x4000, 0x12, 3, -18
	banim_frame_oam 0x4000, 0x0, 0x4, -11, -26
	banim_frame_end
banim_prif_ro1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x90, -11, -19
	banim_frame_oam 0xF000, 0x0, 0x92, 5, -19
	banim_frame_oam 0x0, 0x4000, 0xCE, -11, -3
	banim_frame_oam 0xF000, 0x0, 0xD0, 5, -3
	banim_frame_oam 0x4000, 0x0, 0x4, -10, -27
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
