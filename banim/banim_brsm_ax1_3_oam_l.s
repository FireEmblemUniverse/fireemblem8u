@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x24
	.global banim_brsm_ax1_3_oam_frame_0_l
	.global banim_brsm_ax1_3_oam_frame_2_l
	.global banim_brsm_ax1_3_oam_frame_1_l
	.section .data
banim_brsm_ax1_3_oam_l:
banim_brsm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0xF000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x87, -16, 8
	banim_frame_oam 0x0, 0xF000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x87, -16, 8
	banim_frame_end
banim_brsm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x4000, 0xF000, 0xB, -19, -25
	banim_frame_oam 0x4000, 0x1000, 0xA6, -2, -9
	banim_frame_oam 0x4000, 0x1000, 0xE8, -18, -9
	banim_frame_oam 0x4000, 0xF000, 0xA8, -19, -1
	banim_frame_oam 0x0, 0x1000, 0xEB, 2, -33
	banim_frame_oam 0x0, 0x1000, 0xEB, -7, -33
	banim_frame_end
banim_brsm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x5000, 0xEC, -17, 6
	banim_frame_oam 0x4000, 0x1000, 0xCE, -17, -2
	banim_frame_oam 0x4000, 0x1000, 0xAE, -1, -2
	banim_frame_oam 0x4000, 0x5000, 0x8B, -17, -10
	banim_frame_oam 0x4000, 0xF000, 0x4B, -17, -26
	banim_frame_oam 0x0, 0x1000, 0xEB, 1, -34
	banim_frame_oam 0x0, 0x1000, 0xEB, -8, -34
	banim_frame_oam 0xF000, 0x1000, 0xAD, -25, -18
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
