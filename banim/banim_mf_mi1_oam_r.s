@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC6
	.global banim_mf_mi1_oam_frame_0_r
	.global banim_mf_mi1_oam_frame_1_r
	.global banim_mf_mi1_oam_frame_2_r
	.section .data
banim_mf_mi1_oam_r:
banim_mf_mi1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0xF000, 0x0, -24, -40
	banim_frame_oam 0x4000, 0xF000, 0x80, -24, -8
	banim_frame_oam 0x4000, 0xF000, 0x84, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC5, 16, 8
	banim_frame_end
banim_mf_mi1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x4000, 0xC1, -13, 8
	banim_frame_oam 0x0, 0x0, 0xC5, 19, 8
	banim_frame_oam 0xF000, 0xF000, 0xC, -2, -48
	banim_frame_oam 0x4000, 0xF000, 0x88, 14, -40
	banim_frame_oam 0x0, 0x4000, 0x8C, 46, -40
	banim_frame_oam 0x4000, 0x4000, 0xC8, 14, -24
	banim_frame_oam 0x4000, 0x0, 0xCC, 46, -24
	banim_frame_oam 0x4000, 0xF000, 0x8, -34, -48
	banim_frame_oam 0x4000, 0x4000, 0x48, -34, -32
	banim_frame_oam 0x0, 0x0, 0x6B, -10, -24
	banim_frame_end
banim_mf_mi1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0xE2, -5, 8
	banim_frame_oam 0x0, 0xF000, 0xE, -24, -56
	banim_frame_oam 0xF000, 0xF000, 0x12, 8, -56
	banim_frame_oam 0xF000, 0x4000, 0x14, 24, -56
	banim_frame_oam 0x4000, 0xF000, 0x8E, -24, -24
	banim_frame_oam 0x0, 0x4000, 0x92, 8, -24
	banim_frame_oam 0xF000, 0x0, 0x94, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xCE, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xD2, 8, -8
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
