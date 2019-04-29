@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x13
	.global banim_myrf_sw1_2_oam_frame_0_l
	.global banim_myrf_sw1_2_oam_frame_2_l
	.global banim_myrf_sw1_2_oam_frame_1_l
	.section .data
banim_myrf_sw1_2_oam_l:
banim_myrf_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -5, -21
	banim_frame_oam 0x4000, 0x1000, 0x20, -12, -13
	banim_frame_oam 0x4000, 0x1000, 0x40, -5, -5
	banim_frame_oam 0x0, 0x5000, 0x60, -5, 3
	banim_frame_oam 0x0, 0x5000, 0x3E, -21, 3
	banim_frame_oam 0x0, 0x1000, 0x7F, -13, -21
	banim_frame_oam 0x0, 0x1000, 0xFF, 4, -13
	banim_frame_oam 0x0, 0x1000, 0xDF, -13, -5
	banim_frame_end
banim_myrf_sw1_2_oam_frame_1_l:
	banim_frame_oam 0xF000, 0xF000, 0x8D, -6, -16
	banim_frame_oam 0x0, 0x5000, 0x95, -22, -16
	banim_frame_oam 0x4000, 0x1000, 0xD5, -22, 0
	banim_frame_oam 0x4000, 0x1000, 0xEF, -22, 8
	banim_frame_end
banim_myrf_sw1_2_oam_frame_2_l:
	banim_frame_oam 0xF000, 0x5000, 0x91, -6, -17
	banim_frame_oam 0xF000, 0x1000, 0x92, -14, -17
	banim_frame_oam 0x4000, 0x1000, 0xF2, -22, 7
	banim_frame_oam 0x0, 0x1000, 0xF4, -30, 7
	banim_frame_oam 0x0, 0x5000, 0x97, -30, -17
	banim_frame_oam 0x4000, 0x1000, 0xF5, -22, -1
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
