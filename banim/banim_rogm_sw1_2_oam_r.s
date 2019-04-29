@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x8F
	.global banim_rogm_sw1_2_oam_frame_0_r
	.global banim_rogm_sw1_2_oam_frame_2_r
	.global banim_rogm_sw1_2_oam_frame_1_r
	.section .data
banim_rogm_sw1_2_oam_r:
banim_rogm_sw1_2_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0x4, -8, -24
	banim_frame_oam 0xF000, 0x4000, 0x6, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x84, -8, 8
	banim_frame_oam 0x0, 0x0, 0x86, 8, 8
	banim_frame_end
banim_rogm_sw1_2_oam_frame_1_r:
	banim_frame_oam 0xF000, 0xF000, 0x7, -8, -24
	banim_frame_oam 0xF000, 0x4000, 0x9, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x87, -8, 8
	banim_frame_oam 0x0, 0x0, 0x89, 8, 8
	banim_frame_oam 0x0, 0x0, 0xA, 16, -8
	banim_frame_oam 0x0, 0x0, 0x2A, -16, 0
	banim_frame_end
banim_rogm_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xF000, 0x60, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -8, 8
	banim_frame_oam 0x4000, 0x0, 0xC2, 8, -16
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
