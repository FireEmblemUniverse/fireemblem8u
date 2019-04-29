@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x56
	.global banim_grkm_sw1_4_oam_frame_0_l
	.global banim_grkm_sw1_4_oam_frame_1_l
	.global banim_grkm_sw1_4_oam_frame_2_l
	.section .data
banim_grkm_sw1_4_oam_l:
banim_grkm_sw1_4_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0xB, -8, -40
	banim_frame_oam 0xF000, 0x5000, 0xD, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x8B, -8, -8
	banim_frame_oam 0xF000, 0x1000, 0x8D, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCD, -16, 8
	banim_frame_oam 0xF000, 0xF000, 0xE, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0x8E, 8, 8
	banim_frame_oam 0xF000, 0x1000, 0xAE, -24, -16
	banim_frame_oam 0xF000, 0x1000, 0xAF, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xEC, 24, -24
	banim_frame_end
banim_grkm_sw1_4_oam_frame_1_l:
	banim_frame_oam 0x0, 0xF000, 0x10, -16, -24
	banim_frame_oam 0xF000, 0x5000, 0x14, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x90, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x94, -24, 8
	banim_frame_oam 0x4000, 0xF000, 0xB1, -24, -40
	banim_frame_oam 0xF000, 0x1000, 0xB0, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xF0, 16, -8
	banim_frame_end
banim_grkm_sw1_4_oam_frame_2_l:
	banim_frame_oam 0x0, 0xF000, 0x15, -16, -24
	banim_frame_oam 0xF000, 0x5000, 0x19, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x99, -24, 8
	banim_frame_oam 0x4000, 0xF000, 0xB5, -24, -40
	banim_frame_oam 0xF000, 0x1000, 0xB9, 16, -24
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
