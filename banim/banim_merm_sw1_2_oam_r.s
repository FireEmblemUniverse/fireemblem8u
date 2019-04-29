@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB
	.global banim_merm_sw1_2_oam_frame_0_r
	.global banim_merm_sw1_2_oam_frame_1_r
	.global banim_merm_sw1_2_oam_frame_2_r
	.section .data
banim_merm_sw1_2_oam_r:
banim_merm_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xB9, -13, -8
	banim_frame_oam 0xF000, 0x0, 0xBB, 3, -8
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_oam 0x4000, 0x0, 0x9A, -13, -16
	banim_frame_oam 0x0, 0x0, 0x9C, 3, -16
	banim_frame_oam 0x4000, 0x0, 0x7A, -5, -24
	banim_frame_end
banim_merm_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x19, -9, -24
	banim_frame_oam 0x4000, 0x0, 0x59, -9, -8
	banim_frame_oam 0x0, 0x0, 0x3B, 7, -8
	banim_frame_oam 0x4000, 0x0, 0x1B, -9, 0
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_end
banim_merm_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x0, 0xF9, -14, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 2, 8
	banim_frame_oam 0x0, 0x0, 0x5B, -14, 0
	banim_frame_oam 0x0, 0x0, 0x7C, -6, 0
	banim_frame_oam 0x4000, 0x0, 0x1D, -14, -24
	banim_frame_oam 0x0, 0x4000, 0x3C, -14, -16
	banim_frame_oam 0xF000, 0x0, 0x94, 2, -16
	banim_frame_oam 0x0, 0x0, 0xD4, 2, 0
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
