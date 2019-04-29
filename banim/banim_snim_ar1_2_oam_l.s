@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x2A
	.global banim_snim_ar1_2_oam_frame_0_l
	.global banim_snim_ar1_2_oam_frame_2_l
	.global banim_snim_ar1_2_oam_frame_1_l
	.section .data
banim_snim_ar1_2_oam_l:
banim_snim_ar1_2_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x1000, 0xEF, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, 8, 8
	banim_frame_oam 0x0, 0x5000, 0x8F, -6, -16
	banim_frame_oam 0x4000, 0x1000, 0xCF, -6, 0
	banim_frame_oam 0x0, 0x1000, 0xAB, -14, -5
	banim_frame_oam 0x0, 0x1000, 0x3, -3, -24
	banim_frame_end
banim_snim_ar1_2_oam_frame_1_l:
	banim_frame_oam 0xF000, 0xF000, 0xA, 0, -13
	banim_frame_oam 0xF000, 0x5000, 0xC, -8, -13
	banim_frame_oam 0x0, 0x1000, 0x6D, -16, -7
	banim_frame_oam 0x0, 0x1000, 0x6E, -16, 11
	banim_frame_end
banim_snim_ar1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0xD, -2, -5
	banim_frame_oam 0xF000, 0x1000, 0xF, -10, -5
	banim_frame_oam 0x4000, 0x1000, 0x4D, 0, 11
	banim_frame_oam 0x0, 0x1000, 0x4F, -8, 11
	banim_frame_oam 0x0, 0x1000, 0x6E, -16, 11
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
