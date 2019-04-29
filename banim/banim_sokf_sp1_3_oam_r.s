@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x38
	.global banim_sokf_sp1_3_oam_frame_0_r
	.global banim_sokf_sp1_3_oam_frame_1_r
	.global banim_sokf_sp1_3_oam_frame_2_r
	.section .data
banim_sokf_sp1_3_oam_r:
banim_sokf_sp1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x7, 0, -32
	banim_frame_oam 0x4000, 0x0, 0x47, 0, -16
	banim_frame_oam 0xF000, 0x0, 0x26, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_end
banim_sokf_sp1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0xC, -9, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -9, 8
	banim_frame_oam 0xF000, 0xF000, 0x30, 23, -16
	banim_frame_oam 0x4000, 0x0, 0x10, 5, -32
	banim_frame_oam 0xF000, 0x0, 0x65, -17, -24
	banim_frame_end
banim_sokf_sp1_3_oam_frame_2_r:
	banim_frame_oam 0x0, 0xF000, 0x12, -5, -32
	banim_frame_oam 0xF000, 0x4000, 0x16, 27, -32
	banim_frame_oam 0x4000, 0x0, 0x94, 11, 0
	banim_frame_oam 0x0, 0x0, 0x96, 27, 0
	banim_frame_oam 0x4000, 0x4000, 0xB2, -5, 8
	banim_frame_oam 0x0, 0x0, 0xB6, 27, 8
	banim_frame_oam 0xF000, 0x0, 0xC8, 35, -6
	banim_frame_oam 0x0, 0x0, 0x93, -13, -30
	banim_frame_oam 0x0, 0x0, 0x92, 12, -40
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
