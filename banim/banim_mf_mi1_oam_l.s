@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC6
	.global banim_mf_mi1_oam_frame_0_l
	.global banim_mf_mi1_oam_frame_1_l
	.global banim_mf_mi1_oam_frame_2_l
	.section .data
banim_mf_mi1_oam_l:
banim_mf_mi1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0xF000, 0x0, -40, -40
	banim_frame_oam 0x4000, 0xF000, 0x80, -8, -8
	banim_frame_oam 0x4000, 0xF000, 0x84, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC5, -24, 8
	banim_frame_end
banim_mf_mi1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x5000, 0xC1, -19, 8
	banim_frame_oam 0x0, 0x1000, 0xC5, -27, 8
	banim_frame_oam 0xF000, 0xF000, 0xC, -14, -48
	banim_frame_oam 0x4000, 0xF000, 0x88, -46, -40
	banim_frame_oam 0x0, 0x5000, 0x8C, -62, -40
	banim_frame_oam 0x4000, 0x5000, 0xC8, -46, -24
	banim_frame_oam 0x4000, 0x1000, 0xCC, -62, -24
	banim_frame_oam 0x4000, 0xF000, 0x8, 2, -48
	banim_frame_oam 0x4000, 0x5000, 0x48, 2, -32
	banim_frame_oam 0x0, 0x1000, 0x6B, 2, -24
	banim_frame_end
banim_mf_mi1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0xE2, -27, 8
	banim_frame_oam 0x0, 0xF000, 0xE, -8, -56
	banim_frame_oam 0xF000, 0xF000, 0x12, -24, -56
	banim_frame_oam 0xF000, 0x5000, 0x14, -32, -56
	banim_frame_oam 0x4000, 0xF000, 0x8E, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x92, -24, -24
	banim_frame_oam 0xF000, 0x1000, 0x94, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xCE, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xD2, -24, -8
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
