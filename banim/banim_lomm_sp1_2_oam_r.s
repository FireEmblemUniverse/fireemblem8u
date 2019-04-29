@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x6
	.global banim_lomm_sp1_2_oam_frame_0_r
	.global banim_lomm_sp1_2_oam_frame_2_r
	.global banim_lomm_sp1_2_oam_frame_1_r
	.global banim_lomm_sp1_2_oam_frame_3_r
	.section .data
banim_lomm_sp1_2_oam_r:
banim_lomm_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x17, -16, -16
	banim_frame_oam 0xF000, 0x4000, 0x1B, 16, -16
	banim_frame_oam 0x4000, 0xF000, 0xDC, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xBC, 16, -24
	banim_frame_oam 0x0, 0x0, 0x9F, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xBE, 0, -40
	banim_frame_end
banim_lomm_sp1_2_oam_frame_1_r:
	banim_frame_oam 0xF000, 0xF000, 0x32, -16, -32
	banim_frame_oam 0x0, 0x4000, 0xB2, -16, 0
	banim_frame_oam 0x0, 0xF000, 0x1C, 0, -40
	banim_frame_oam 0x4000, 0xF000, 0x9C, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xDC, 0, 8
	banim_frame_end
banim_lomm_sp1_2_oam_frame_2_r:
	banim_frame_oam 0xF000, 0xF000, 0x60, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x62, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE2, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x41, -8, -32
	banim_frame_oam 0xF000, 0xF000, 0x27, 8, -40
	banim_frame_oam 0x0, 0x4000, 0xA7, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xE7, 8, 8
	banim_frame_end
banim_lomm_sp1_2_oam_frame_3_r:
	banim_frame_oam 0xF000, 0xF000, 0x69, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x6B, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x4A, -8, -32
	banim_frame_oam 0xF000, 0xF000, 0x31, 8, -40
	banim_frame_oam 0x0, 0x4000, 0xB1, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xF1, 8, 8
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
