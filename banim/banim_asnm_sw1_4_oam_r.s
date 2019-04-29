@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x8D
	.global banim_asnm_sw1_4_oam_frame_0_r
	.global banim_asnm_sw1_4_oam_frame_2_r
	.global banim_asnm_sw1_4_oam_frame_1_r
	.section .data
banim_asnm_sw1_4_oam_r:
banim_asnm_sw1_4_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0x20, -8, -16
	banim_frame_oam 0xF000, 0x0, 0x22, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x81, 0, 8
	banim_frame_oam 0xF000, 0x0, 0x60, -8, 0
	banim_frame_oam 0x0, 0x0, 0x0, -1, -24
	banim_frame_oam 0x4000, 0x0, 0xDC, 0, 0
	banim_frame_end
banim_asnm_sw1_4_oam_frame_1_r:
	banim_frame_oam 0x4000, 0xF000, 0xAA, -16, -16
	banim_frame_oam 0x0, 0x0, 0x8D, -1, -24
	banim_frame_oam 0x4000, 0x4000, 0x8E, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xAF, -8, 8
	banim_frame_oam 0x0, 0x0, 0xB1, 8, 8
	banim_frame_oam 0x0, 0x0, 0xAE, 16, 0
	banim_frame_end
banim_asnm_sw1_4_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xF000, 0xB3, -11, -8
	banim_frame_oam 0x4000, 0x4000, 0xF3, -11, 8
	banim_frame_oam 0x4000, 0x0, 0x94, -5, -16
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
	banim_frame_end
