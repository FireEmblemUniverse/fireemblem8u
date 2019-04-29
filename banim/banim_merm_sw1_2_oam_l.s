@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB
	.global banim_merm_sw1_2_oam_frame_0_l
	.global banim_merm_sw1_2_oam_frame_1_l
	.global banim_merm_sw1_2_oam_frame_2_l
	.section .data
banim_merm_sw1_2_oam_l:
banim_merm_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xB9, -3, -8
	banim_frame_oam 0xF000, 0x1000, 0xBB, -11, -8
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_oam 0x4000, 0x1000, 0x9A, -3, -16
	banim_frame_oam 0x0, 0x1000, 0x9C, -11, -16
	banim_frame_oam 0x4000, 0x1000, 0x7A, -11, -24
	banim_frame_end
banim_merm_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x19, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0x59, -7, -8
	banim_frame_oam 0x0, 0x1000, 0x3B, -15, -8
	banim_frame_oam 0x4000, 0x1000, 0x1B, -7, 0
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_end
banim_merm_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x1000, 0xF9, -2, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x5B, 6, 0
	banim_frame_oam 0x0, 0x1000, 0x7C, -2, 0
	banim_frame_oam 0x4000, 0x1000, 0x1D, -2, -24
	banim_frame_oam 0x0, 0x5000, 0x3C, -2, -16
	banim_frame_oam 0xF000, 0x1000, 0x94, -10, -16
	banim_frame_oam 0x0, 0x1000, 0xD4, -10, 0
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
