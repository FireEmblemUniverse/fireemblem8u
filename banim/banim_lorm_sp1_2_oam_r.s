@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x1
	.global banim_lorm_sp1_2_oam_frame_0_r
	.global banim_lorm_sp1_2_oam_frame_2_r
	.global banim_lorm_sp1_2_oam_frame_3_r
	.global banim_lorm_sp1_2_oam_frame_1_r
	.section .data
banim_lorm_sp1_2_oam_r:
banim_lorm_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0xF000, 0x25, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x29, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xA5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xA9, 16, 8
	banim_frame_end
banim_lorm_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0xF000, 0x2A, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x2E, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xAA, -16, 8
	banim_frame_oam 0x0, 0x0, 0xAE, 16, 8
	banim_frame_end
banim_lorm_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0xF000, 0x2F, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x33, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xAF, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB3, 16, 8
	banim_frame_end
banim_lorm_sp1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0xF000, 0x34, -16, -24
	banim_frame_oam 0xF000, 0x4000, 0x38, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xB4, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB8, 16, 8
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
