@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x80
	.global banim_bism_mg1_oam_frame_0_l
	.global banim_bism_mg1_oam_frame_2_l
	.global banim_bism_mg1_oam_frame_1_l
	.section .data
banim_bism_mg1_oam_l:
banim_bism_mg1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x1000, 0x81, -8, 8
	banim_frame_oam 0xF000, 0x1000, 0x9E, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xDE, 8, 8
	banim_frame_oam 0xF000, 0x1000, 0x2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x42, -8, -8
	banim_frame_oam 0xF000, 0x1000, 0x5E, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x1, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xFF, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xBF, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x62, -8, 0
	banim_frame_end
banim_bism_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x1000, 0xB1, -3, -5
	banim_frame_oam 0x0, 0x5000, 0xB2, -9, -25
	banim_frame_oam 0x4000, 0x1000, 0xF2, -9, -9
	banim_frame_oam 0xF000, 0x1000, 0xD1, 7, -17
	banim_frame_oam 0x0, 0x5000, 0xD4, -1, -1
	banim_frame_oam 0xF000, 0x1000, 0xD6, -9, -1
	banim_frame_end
banim_bism_mg1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -8, -11
	banim_frame_oam 0xF000, 0xF000, 0x20, 0, -18
	banim_frame_oam 0xF000, 0x5000, 0x22, -8, -18
	banim_frame_oam 0x4000, 0x1000, 0x1, -8, -26
	banim_frame_oam 0xF000, 0x1000, 0x23, -16, -19
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
