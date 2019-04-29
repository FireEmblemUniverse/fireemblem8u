@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x2F
	.global banim_form_sw1_2_oam_frame_0_r
	.global banim_form_sw1_2_oam_frame_2_r
	.global banim_form_sw1_2_oam_frame_1_r
	.section .data
banim_form_sw1_2_oam_r:
banim_form_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x1, -8, -32
	banim_frame_oam 0xF000, 0x4000, 0x5, 24, -32
	banim_frame_oam 0x4000, 0xF000, 0x81, -8, 0
	banim_frame_oam 0xF000, 0x0, 0x85, 24, 0
	banim_frame_end
banim_form_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0x16, -16, -32
	banim_frame_oam 0xF000, 0x4000, 0x1A, 16, -32
	banim_frame_oam 0x4000, 0xF000, 0x96, -16, 0
	banim_frame_oam 0xF000, 0x0, 0x9A, 16, 0
	banim_frame_end
banim_form_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0xF000, 0x1B, -17, -33
	banim_frame_oam 0x4000, 0xF000, 0x9B, -17, -1
	banim_frame_oam 0xF000, 0x4000, 0x3F, 15, -25
	banim_frame_oam 0x0, 0x0, 0xBF, 15, 7
	banim_frame_oam 0x0, 0x0, 0xFC, 15, -33
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
