@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x80
	.global banim_bism_mg1_oam_frame_0_r
	.global banim_bism_mg1_oam_frame_2_r
	.global banim_bism_mg1_oam_frame_1_r
	.section .data
banim_bism_mg1_oam_r:
banim_bism_mg1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0x81, -8, 8
	banim_frame_oam 0xF000, 0x0, 0x9E, -16, -8
	banim_frame_oam 0x0, 0x0, 0xDE, -16, 8
	banim_frame_oam 0xF000, 0x0, 0x2, 0, -24
	banim_frame_oam 0x0, 0x0, 0x42, 0, -8
	banim_frame_oam 0xF000, 0x0, 0x5E, -8, -16
	banim_frame_oam 0x0, 0x0, 0x1, -8, -24
	banim_frame_oam 0x0, 0x0, 0xFF, -8, 0
	banim_frame_oam 0x0, 0x0, 0xBF, -16, -16
	banim_frame_oam 0x0, 0x0, 0x62, 0, 0
	banim_frame_end
banim_bism_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x0, 0xB1, -5, -5
	banim_frame_oam 0x0, 0x4000, 0xB2, -7, -25
	banim_frame_oam 0x4000, 0x0, 0xF2, -7, -9
	banim_frame_oam 0xF000, 0x0, 0xD1, -15, -17
	banim_frame_oam 0x0, 0x4000, 0xD4, -15, -1
	banim_frame_oam 0xF000, 0x0, 0xD6, 1, -1
	banim_frame_end
banim_bism_mg1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x0, 0x0, 0, -11
	banim_frame_oam 0xF000, 0xF000, 0x20, -16, -18
	banim_frame_oam 0xF000, 0x4000, 0x22, 0, -18
	banim_frame_oam 0x4000, 0x0, 0x1, -8, -26
	banim_frame_oam 0xF000, 0x0, 0x23, 8, -19
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
