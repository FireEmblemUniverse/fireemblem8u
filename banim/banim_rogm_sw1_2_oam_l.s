@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x8F
	.global banim_rogm_sw1_2_oam_frame_0_l
	.global banim_rogm_sw1_2_oam_frame_2_l
	.global banim_rogm_sw1_2_oam_frame_1_l
	.section .data
banim_rogm_sw1_2_oam_l:
banim_rogm_sw1_2_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0x4, -8, -24
	banim_frame_oam 0xF000, 0x5000, 0x6, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -16, 8
	banim_frame_end
banim_rogm_sw1_2_oam_frame_1_l:
	banim_frame_oam 0xF000, 0xF000, 0x7, -8, -24
	banim_frame_oam 0xF000, 0x5000, 0x9, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x87, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xA, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x2A, 8, 0
	banim_frame_end
banim_rogm_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xF000, 0x60, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xC2, -24, -16
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
