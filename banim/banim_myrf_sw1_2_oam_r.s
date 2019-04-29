@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x13
	.global banim_myrf_sw1_2_oam_frame_0_r
	.global banim_myrf_sw1_2_oam_frame_2_r
	.global banim_myrf_sw1_2_oam_frame_1_r
	.section .data
banim_myrf_sw1_2_oam_r:
banim_myrf_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x0, 0x0, -3, -21
	banim_frame_oam 0x4000, 0x0, 0x20, -4, -13
	banim_frame_oam 0x4000, 0x0, 0x40, -11, -5
	banim_frame_oam 0x0, 0x4000, 0x60, -11, 3
	banim_frame_oam 0x0, 0x4000, 0x3E, 5, 3
	banim_frame_oam 0x0, 0x0, 0x7F, 5, -21
	banim_frame_oam 0x0, 0x0, 0xFF, -12, -13
	banim_frame_oam 0x0, 0x0, 0xDF, 5, -5
	banim_frame_end
banim_myrf_sw1_2_oam_frame_1_r:
	banim_frame_oam 0xF000, 0xF000, 0x8D, -10, -16
	banim_frame_oam 0x0, 0x4000, 0x95, 6, -16
	banim_frame_oam 0x4000, 0x0, 0xD5, 6, 0
	banim_frame_oam 0x4000, 0x0, 0xEF, 6, 8
	banim_frame_end
banim_myrf_sw1_2_oam_frame_2_r:
	banim_frame_oam 0xF000, 0x4000, 0x91, -2, -17
	banim_frame_oam 0xF000, 0x0, 0x92, 6, -17
	banim_frame_oam 0x4000, 0x0, 0xF2, 6, 7
	banim_frame_oam 0x0, 0x0, 0xF4, 22, 7
	banim_frame_oam 0x0, 0x4000, 0x97, 14, -17
	banim_frame_oam 0x4000, 0x0, 0xF5, 6, -1
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
