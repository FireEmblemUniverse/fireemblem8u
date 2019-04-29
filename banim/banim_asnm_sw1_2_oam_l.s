@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x8B
	.global banim_asnm_sw1_2_oam_frame_0_l
	.global banim_asnm_sw1_2_oam_frame_2_l
	.global banim_asnm_sw1_2_oam_frame_1_l
	.section .data
banim_asnm_sw1_2_oam_l:
banim_asnm_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0x20, -8, -16
	banim_frame_oam 0xF000, 0x1000, 0x22, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x81, -16, 8
	banim_frame_oam 0xF000, 0x1000, 0x60, 0, 0
	banim_frame_oam 0x0, 0x1000, 0x0, -7, -24
	banim_frame_oam 0x4000, 0x1000, 0xDC, -16, 0
	banim_frame_end
banim_asnm_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0xF000, 0xAA, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x8D, -7, -24
	banim_frame_oam 0x4000, 0x5000, 0x8E, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xAF, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, -24, 0
	banim_frame_end
banim_asnm_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xF000, 0xB3, -21, -8
	banim_frame_oam 0x4000, 0x5000, 0xF3, -21, 8
	banim_frame_oam 0x4000, 0x1000, 0x94, -11, -16
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
