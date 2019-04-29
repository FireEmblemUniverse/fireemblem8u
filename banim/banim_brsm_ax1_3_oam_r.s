@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x24
	.global banim_brsm_ax1_3_oam_frame_0_r
	.global banim_brsm_ax1_3_oam_frame_2_r
	.global banim_brsm_ax1_3_oam_frame_1_r
	.section .data
banim_brsm_ax1_3_oam_r:
banim_brsm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x87, -16, 8
	banim_frame_oam 0x0, 0xF000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x87, -16, 8
	banim_frame_end
banim_brsm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0xF000, 0xB, -13, -25
	banim_frame_oam 0x4000, 0x0, 0xA6, -14, -9
	banim_frame_oam 0x4000, 0x0, 0xE8, 2, -9
	banim_frame_oam 0x4000, 0xF000, 0xA8, -13, -1
	banim_frame_oam 0x0, 0x0, 0xEB, -10, -33
	banim_frame_oam 0x0, 0x0, 0xEB, -1, -33
	banim_frame_end
banim_brsm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x4000, 0xEC, -15, 6
	banim_frame_oam 0x4000, 0x0, 0xCE, 1, -2
	banim_frame_oam 0x4000, 0x0, 0xAE, -15, -2
	banim_frame_oam 0x4000, 0x4000, 0x8B, -15, -10
	banim_frame_oam 0x4000, 0xF000, 0x4B, -15, -26
	banim_frame_oam 0x0, 0x0, 0xEB, -9, -34
	banim_frame_oam 0x0, 0x0, 0xEB, 0, -34
	banim_frame_oam 0xF000, 0x0, 0xAD, 17, -18
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
