@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x56
	.global banim_grkm_sw1_4_oam_frame_0_r
	.global banim_grkm_sw1_4_oam_frame_1_r
	.global banim_grkm_sw1_4_oam_frame_2_r
	.section .data
banim_grkm_sw1_4_oam_r:
banim_grkm_sw1_4_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0xB, -8, -40
	banim_frame_oam 0xF000, 0x4000, 0xD, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x8B, -8, -8
	banim_frame_oam 0xF000, 0x0, 0x8D, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xCB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCD, 8, 8
	banim_frame_oam 0xF000, 0xF000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x0, 0x8E, -24, 8
	banim_frame_oam 0xF000, 0x0, 0xAE, 16, -16
	banim_frame_oam 0xF000, 0x0, 0xAF, 16, 0
	banim_frame_oam 0x0, 0x0, 0xEC, -32, -24
	banim_frame_end
banim_grkm_sw1_4_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0x10, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x14, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x90, -16, 8
	banim_frame_oam 0x0, 0x0, 0x94, 16, 8
	banim_frame_oam 0x4000, 0xF000, 0xB1, -8, -40
	banim_frame_oam 0xF000, 0x0, 0xB0, -24, -24
	banim_frame_oam 0x0, 0x0, 0xF0, -24, -8
	banim_frame_end
banim_grkm_sw1_4_oam_frame_2_r:
	banim_frame_oam 0x0, 0xF000, 0x15, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x19, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x0, 0x0, 0x99, 16, 8
	banim_frame_oam 0x4000, 0xF000, 0xB5, -8, -40
	banim_frame_oam 0xF000, 0x0, 0xB9, -24, -24
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
