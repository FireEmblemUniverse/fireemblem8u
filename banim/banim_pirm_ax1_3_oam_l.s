@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x9B
	.global banim_pirm_ax1_3_oam_frame_0_l
	.global banim_pirm_ax1_3_oam_frame_1_l
	.global banim_pirm_ax1_3_oam_frame_2_l
	.section .data
banim_pirm_ax1_3_oam_l:
banim_pirm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0xF000, 0xF000, 0x1, -9, -16
	banim_frame_oam 0x0, 0x1000, 0x60, 7, 8
	banim_frame_oam 0xF000, 0x1000, 0x9D, 7, -16
	banim_frame_oam 0x0, 0x1000, 0xDD, 7, 0
	banim_frame_oam 0xF000, 0x5000, 0x5E, -17, -16
	banim_frame_oam 0x0, 0x1000, 0x25, -1, -24
	banim_frame_oam 0x0, 0x1000, 0xBC, -25, -8
	banim_frame_end
banim_pirm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x4000, 0xF000, 0x20, -18, -10
	banim_frame_oam 0x4000, 0x1000, 0x0, -10, -18
	banim_frame_oam 0x0, 0x1000, 0x2, -18, -18
	banim_frame_oam 0x4000, 0x5000, 0x61, -18, 6
	banim_frame_oam 0x0, 0x1000, 0x60, -11, -26
	banim_frame_end
banim_pirm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xF000, 0x45, -18, -2
	banim_frame_oam 0x4000, 0x1000, 0x8, -10, -10
	banim_frame_oam 0x0, 0x1000, 0x49, -18, -10
	banim_frame_oam 0x0, 0x1000, 0x69, -26, -10
	banim_frame_oam 0x0, 0x5000, 0xA, -15, -26
	banim_frame_oam 0x0, 0x1000, 0x28, -23, -26
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
