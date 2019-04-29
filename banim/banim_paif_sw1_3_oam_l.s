@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x3E
	.global banim_paif_sw1_3_oam_frame_0_l
	.global banim_paif_sw1_3_oam_frame_2_l
	.global banim_paif_sw1_3_oam_frame_1_l
	.section .data
banim_paif_sw1_3_oam_l:
banim_paif_sw1_3_oam_frame_0_l:
	banim_frame_oam 0xF000, 0x1000, 0x84, -10, -32
	banim_frame_oam 0x4000, 0xF000, 0xC0, -19, 0
	banim_frame_oam 0x4000, 0xF000, 0x80, -17, -16
	banim_frame_oam 0x0, 0x1000, 0x20, 0, -40
	banim_frame_oam 0x0, 0x5000, 0x40, 5, -32
	banim_frame_oam 0xF000, 0x1000, 0x42, -3, -32
	banim_frame_end
banim_paif_sw1_3_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, 8
	banim_frame_oam 0x0, 0xF000, 0x60, -20, -24
	banim_frame_oam 0xF000, 0x5000, 0x64, -28, -24
	banim_frame_oam 0x0, 0x5000, 0x20, -13, -40
	banim_frame_oam 0xF000, 0x1000, 0x22, -21, -40
	banim_frame_oam 0x0, 0x1000, 0x43, 3, -32
	banim_frame_oam 0x0, 0x1000, 0xE4, -36, 0
	banim_frame_end
banim_paif_sw1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0x0, -26, 8
	banim_frame_oam 0x0, 0x5000, 0x4, -15, -40
	banim_frame_oam 0xF000, 0x1000, 0x6, -23, -40
	banim_frame_oam 0x0, 0x1000, 0x23, 1, -32
	banim_frame_oam 0x0, 0xF000, 0x7, -22, -24
	banim_frame_oam 0xF000, 0x1000, 0x87, -38, -8
	banim_frame_oam 0xF000, 0x5000, 0xB, -30, -24
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
