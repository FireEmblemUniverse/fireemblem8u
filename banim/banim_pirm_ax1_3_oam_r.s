@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x9B
	.global banim_pirm_ax1_3_oam_frame_0_r
	.global banim_pirm_ax1_3_oam_frame_1_r
	.global banim_pirm_ax1_3_oam_frame_2_r
	.section .data
banim_pirm_ax1_3_oam_r:
banim_pirm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0xF000, 0xF000, 0x1, -7, -16
	banim_frame_oam 0x0, 0x0, 0x60, -15, 8
	banim_frame_oam 0xF000, 0x0, 0x9D, -15, -16
	banim_frame_oam 0x0, 0x0, 0xDD, -15, 0
	banim_frame_oam 0xF000, 0x4000, 0x5E, 9, -16
	banim_frame_oam 0x0, 0x0, 0x25, -7, -24
	banim_frame_oam 0x0, 0x0, 0xBC, 17, -8
	banim_frame_end
banim_pirm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x4000, 0xF000, 0x20, -14, -10
	banim_frame_oam 0x4000, 0x0, 0x0, -6, -18
	banim_frame_oam 0x0, 0x0, 0x2, 10, -18
	banim_frame_oam 0x4000, 0x4000, 0x61, -14, 6
	banim_frame_oam 0x0, 0x0, 0x60, 3, -26
	banim_frame_end
banim_pirm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xF000, 0x45, -14, -2
	banim_frame_oam 0x4000, 0x0, 0x8, -6, -10
	banim_frame_oam 0x0, 0x0, 0x49, 10, -10
	banim_frame_oam 0x0, 0x0, 0x69, 18, -10
	banim_frame_oam 0x0, 0x4000, 0xA, -1, -26
	banim_frame_oam 0x0, 0x0, 0x28, 15, -26
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
