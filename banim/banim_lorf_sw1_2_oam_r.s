@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x3
	.global banim_lorf_sw1_2_oam_frame_0_r
	.global banim_lorf_sw1_2_oam_frame_2_r
	.global banim_lorf_sw1_2_oam_frame_1_r
	.global banim_lorf_sw1_2_oam_frame_3_r
	.section .data
banim_lorf_sw1_2_oam_r:
banim_lorf_sw1_2_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0x17, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -8, 8
	banim_frame_oam 0xF000, 0x4000, 0x39, 8, -16
	banim_frame_oam 0x0, 0x0, 0x19, -16, 8
	banim_frame_end
banim_lorf_sw1_2_oam_frame_1_r:
	banim_frame_oam 0xF000, 0xF000, 0x1A, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x9A, -8, 8
	banim_frame_oam 0xF000, 0x4000, 0x3C, 8, -16
	banim_frame_oam 0x0, 0x0, 0x1C, -16, 8
	banim_frame_end
banim_lorf_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0xB5, -8, -24
	banim_frame_oam 0xF000, 0x0, 0xB7, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xF5, -8, -8
	banim_frame_oam 0x0, 0x0, 0xF7, 8, -8
	banim_frame_oam 0x0, 0x4000, 0xB8, -8, 0
	banim_frame_oam 0xF000, 0x0, 0xBA, 8, 0
	banim_frame_oam 0x0, 0x0, 0xF8, -16, 8
	banim_frame_end
banim_lorf_sw1_2_oam_frame_3_r:
	banim_frame_oam 0xF000, 0xF000, 0x3D, -8, -24
	banim_frame_oam 0xF000, 0x4000, 0x3F, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xBD, -8, 8
	banim_frame_oam 0x0, 0x0, 0xBF, 8, 8
	banim_frame_oam 0x0, 0x0, 0xDE, -16, 8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
