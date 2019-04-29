@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x6
	.global banim_lomm_sp1_2_oam_frame_0_l
	.global banim_lomm_sp1_2_oam_frame_2_l
	.global banim_lomm_sp1_2_oam_frame_1_l
	.global banim_lomm_sp1_2_oam_frame_3_l
	.section .data
banim_lomm_sp1_2_oam_l:
banim_lomm_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0xF000, 0x17, -16, -16
	banim_frame_oam 0xF000, 0x5000, 0x1B, -24, -16
	banim_frame_oam 0x4000, 0xF000, 0xDC, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xBC, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x9F, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xBE, -16, -40
	banim_frame_end
banim_lomm_sp1_2_oam_frame_1_l:
	banim_frame_oam 0xF000, 0xF000, 0x32, 0, -32
	banim_frame_oam 0x0, 0x5000, 0xB2, 0, 0
	banim_frame_oam 0x0, 0xF000, 0x1C, -32, -40
	banim_frame_oam 0x4000, 0xF000, 0x9C, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xDC, -32, 8
	banim_frame_end
banim_lomm_sp1_2_oam_frame_2_l:
	banim_frame_oam 0xF000, 0xF000, 0x60, 0, -24
	banim_frame_oam 0xF000, 0x5000, 0x62, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x41, -8, -32
	banim_frame_oam 0xF000, 0xF000, 0x27, -24, -40
	banim_frame_oam 0x0, 0x5000, 0xA7, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xE7, -24, 8
	banim_frame_end
banim_lomm_sp1_2_oam_frame_3_l:
	banim_frame_oam 0xF000, 0xF000, 0x69, 0, -24
	banim_frame_oam 0xF000, 0x5000, 0x6B, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -8, -32
	banim_frame_oam 0xF000, 0xF000, 0x31, -24, -40
	banim_frame_oam 0x0, 0x5000, 0xB1, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -24, 8
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
