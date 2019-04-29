@ vim:ft=armv4
	.include "../include/banim_code_frame.inc"
@ battle animation 0x2C
	.global banim_snif_ar1_2_oam_frame_0_r
	.global banim_snif_ar1_2_oam_frame_2_r
	.global banim_snif_ar1_2_oam_frame_1_r
	.section .data
banim_snif_ar1_2_oam_r:
banim_snif_ar1_2_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0xEF, -8, 8
	banim_frame_oam 0x0, 0x0, 0xEC, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x8F, -10, -16
	banim_frame_oam 0x4000, 0x0, 0xCF, -10, 0
	banim_frame_oam 0x0, 0x0, 0xAB, 6, -5
	banim_frame_oam 0x0, 0x0, 0x3, -5, -24
	banim_frame_end
banim_snif_ar1_2_oam_frame_1_r:
	banim_frame_oam 0xF000, 0xF000, 0xA, -16, -13
	banim_frame_oam 0xF000, 0x4000, 0xC, 0, -13
	banim_frame_oam 0x0, 0x0, 0x6D, 8, -7
	banim_frame_oam 0x0, 0x0, 0x6E, 8, 11
	banim_frame_end
banim_snif_ar1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0xD, -14, -5
	banim_frame_oam 0xF000, 0x0, 0xF, 2, -5
	banim_frame_oam 0x4000, 0x0, 0x4D, -16, 11
	banim_frame_oam 0x0, 0x0, 0x4F, 0, 11
	banim_frame_oam 0x0, 0x0, 0x6E, 8, 11
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
