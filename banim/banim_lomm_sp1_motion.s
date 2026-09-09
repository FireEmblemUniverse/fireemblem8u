@ vim:ft=armv4
	.global banim_lomm_sp1_script
	.global banim_lomm_sp1_oam_r
	.global banim_lomm_sp1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x4
	.section .data.oam_l
banim_lomm_sp1_oam_l:
banim_lomm_sp1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0xA0, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xA4, -24, 0
	banim_frame_oam 0x8000, 0x5000, 0x5, -32, -40
	banim_frame_oam 0x4000, 0x1000, 0x2, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x4, -24, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0xDB, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xDF, -24, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -17, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -25, -32
	banim_frame_oam 0x8000, 0x5000, 0x5, -33, -40
	banim_frame_oam 0x4000, 0x1000, 0x2, -17, -40
	banim_frame_oam 0x0, 0x1000, 0x4, -25, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -18, -32
	banim_frame_oam 0x8000, 0x5000, 0xA, -26, -32
	banim_frame_oam 0x8000, 0x1000, 0xB, -34, -24
	banim_frame_oam 0x8000, 0x1000, 0xA5, -34, -40
	banim_frame_oam 0x4000, 0x1000, 0x0, -18, -40
	banim_frame_oam 0x4000, 0x9000, 0x9C, -24, 0
	banim_frame_oam 0x0, 0x1000, 0x7E, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x7F, 8, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0x85, -40, 8
	banim_frame_oam 0x0, 0x9000, 0x2C, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x30, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xAC, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xE, -24, -32
	banim_frame_oam 0x0, 0x1000, 0x10, -32, -32
	banim_frame_oam 0x8000, 0x1000, 0x8B, -40, -16
	banim_frame_oam 0x8000, 0x1000, 0x4B, -40, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x31, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x35, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xB5, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0x13, -24, -32
	banim_frame_oam 0x0, 0x1000, 0x15, -32, -32
	banim_frame_oam 0x8000, 0x5000, 0x56, -40, -16
	banim_frame_oam 0x8000, 0x1000, 0x16, -40, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, -32, -40
	banim_frame_oam 0x4000, 0x1000, 0x11, -48, -40
	banim_frame_oam 0x0, 0x9000, 0x17, -32, -32
	banim_frame_oam 0x8000, 0x5000, 0x1B, -40, -32
	banim_frame_oam 0x4000, 0x9000, 0x97, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0x9B, -40, 0
	banim_frame_oam 0x8000, 0x1000, 0x1C, -48, -32
	banim_frame_oam 0x0, 0x1000, 0x5C, -48, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -33, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -41, -32
	banim_frame_oam 0x4000, 0x9000, 0xA0, -33, 0
	banim_frame_oam 0x8000, 0x1000, 0xA4, -41, 0
	banim_frame_oam 0x8000, 0x5000, 0x5, -49, -40
	banim_frame_oam 0x4000, 0x1000, 0x2, -33, -40
	banim_frame_oam 0x0, 0x1000, 0x4, -41, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0xC6, -48, -40
	banim_frame_oam 0x4000, 0x9000, 0xCA, -32, -24
	banim_frame_oam 0x0, 0x5000, 0xCE, -48, -24
	banim_frame_oam 0x4000, 0x9000, 0xD0, -32, -8
	banim_frame_oam 0x8000, 0x1000, 0xD4, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xD5, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xD9, -40, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x40, -32, -24
	banim_frame_oam 0x8000, 0x5000, 0x44, -40, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -40, 8
	banim_frame_oam 0x0, 0x5000, 0x2, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0x4, -40, -40
	banim_frame_oam 0x8000, 0x1000, 0x0, -48, -40
	banim_frame_oam 0x8000, 0x1000, 0x1, -48, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xE2, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x2, -32, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -40, -40
	banim_frame_oam 0x0, 0x5000, 0x82, -32, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -40, -8
	banim_frame_oam 0x4000, 0x1000, 0xC2, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -40, 8
	banim_frame_oam 0x0, 0x5000, 0x40, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x1, -48, -24
	banim_frame_oam 0x8000, 0x1000, 0x0, -48, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0x5, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0x7, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x2, -32, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -40, -40
	banim_frame_oam 0x0, 0x5000, 0x82, -32, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -40, -8
	banim_frame_oam 0x4000, 0x1000, 0xC2, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -40, 8
	banim_frame_oam 0x8000, 0x1000, 0x1, -48, -24
	banim_frame_oam 0x8000, 0x1000, 0x0, -48, -40
	banim_frame_oam 0x0, 0x5000, 0x40, -16, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x1000, 0x45, -48, -32
	banim_frame_oam 0x8000, 0x9000, 0x69, -32, -24
	banim_frame_oam 0x8000, 0x5000, 0x6B, -40, -24
	banim_frame_oam 0x4000, 0x5000, 0xE5, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xE9, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -40, 8
	banim_frame_oam 0x4000, 0x5000, 0x47, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x4B, -40, -32
	banim_frame_oam 0x8000, 0x9000, 0x66, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x68, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0x85, 8, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x1000, 0xB, -40, -16
	banim_frame_oam 0x4000, 0x1000, 0x9, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x27, 16, -40
	banim_frame_oam 0x0, 0x1000, 0x29, 8, -40
	banim_frame_oam 0x0, 0x9000, 0x4C, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x50, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x52, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xCC, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xD0, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xD2, -32, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0xC, 24, -56
	banim_frame_oam 0x8000, 0x1000, 0xE, 16, -56
	banim_frame_oam 0x0, 0x1000, 0x2F, 8, -48
	banim_frame_oam 0x4000, 0x5000, 0xF, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x13, -16, 8
	banim_frame_oam 0x0, 0x9000, 0x53, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x57, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0xD3, 0, -8
	banim_frame_oam 0x0, 0x5000, 0xD7, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x14, -24, -32
	banim_frame_oam 0x0, 0x5000, 0x15, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x31, -40, -8
	banim_frame_oam 0x0, 0x1000, 0x30, -24, 0
	banim_frame_oam 0x0, 0x1000, 0x3F, 32, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x59, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x5D, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0xD9, 0, -8
	banim_frame_oam 0x0, 0x5000, 0xDD, -16, -8
	banim_frame_oam 0x8000, 0x5000, 0x9F, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xF, -4, 8
	banim_frame_oam 0x8000, 0x1000, 0x17, 32, -24
	banim_frame_oam 0x0, 0x5000, 0x18, 16, -56
	banim_frame_oam 0x4000, 0x1000, 0x3A, 0, -48
	banim_frame_oam 0x8000, 0x1000, 0x5F, 32, -8
	banim_frame_oam 0x4000, 0x1000, 0x1B, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x3C, -32, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x1000, 0x6, -24, -24
	banim_frame_oam 0x0, 0x9000, 0x20, 8, -40
	banim_frame_oam 0x8000, 0x9000, 0x24, -8, -40
	banim_frame_oam 0x4000, 0x9000, 0xA0, 8, -8
	banim_frame_oam 0x0, 0x5000, 0xA4, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 24, -48
	banim_frame_oam 0x8000, 0x5000, 0x46, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xC6, -16, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_58_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x27, -16, 0
	banim_frame_oam 0x0, 0x9000, 0x29, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x2D, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0xA9, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xAD, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD, 0, -40
	banim_frame_oam 0x4000, 0x1000, 0xA, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xC, 0, -32
	banim_frame_oam 0x0, 0x5000, 0x47, 32, -16
	banim_frame_oam 0x0, 0x5000, 0x87, 48, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x27, -16, 0
	banim_frame_oam 0x0, 0x9000, 0x29, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x2D, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0xA9, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xAD, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD, 0, -40
	banim_frame_oam 0x4000, 0x1000, 0xA, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xC, 0, -32
	banim_frame_oam 0x0, 0x5000, 0x47, 32, -16
	banim_frame_oam 0x8000, 0x1000, 0x8, 48, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x5000, 0x87, 48, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_59_l:
	banim_frame_oam 0x0, 0x9000, 0xE, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x8E, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x12, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x52, -8, -8
	banim_frame_oam 0x0, 0x5000, 0xC8, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xC7, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xE7, 56, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x9000, 0xE, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x8E, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x12, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x52, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xC7, 32, -16
	banim_frame_oam 0x0, 0x5000, 0xCA, 40, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x5000, 0xC8, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xE7, 56, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_60_l:
	banim_frame_oam 0x8000, 0x1000, 0x72, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xB2, -8, -8
	banim_frame_oam 0x0, 0x9000, 0x13, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x17, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x97, 0, 0
	banim_frame_oam 0x0, 0x5000, 0xC8, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xE7, 56, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x1000, 0x72, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xB2, -8, -8
	banim_frame_oam 0x0, 0x9000, 0x13, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x17, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x97, 0, 0
	banim_frame_oam 0x0, 0x5000, 0xCA, 40, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x5000, 0xC8, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xE7, 56, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_61_l:
	banim_frame_oam 0x0, 0x9000, 0x18, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x1C, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x98, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x9C, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x3D, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x7D, -8, -8
	banim_frame_oam 0x0, 0x5000, 0xC8, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xE7, 56, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x18, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x1C, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x98, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x9C, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x3D, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x7D, -8, -8
	banim_frame_oam 0x0, 0x5000, 0xCA, 40, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0xC8, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xE7, 56, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, 0, -48
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0x84, -16, -16
	banim_frame_oam 0x8000, 0x9000, 0x6, -32, -48
	banim_frame_oam 0x0, 0x1000, 0x68, -40, -24
	banim_frame_oam 0x4000, 0x1000, 0x87, 0, -56
	banim_frame_oam 0x4000, 0x1000, 0xA7, -16, -56
	banim_frame_oam 0x8000, 0x1000, 0x86, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xC6, 16, -56
	banim_frame_oam 0x8000, 0x1000, 0x8, 32, -48
	banim_frame_oam 0x0, 0x1000, 0x48, -40, -32
	banim_frame_end
banim_lomm_sp1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0xD, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x4F, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x8F, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xF, -40, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 0, -40
	banim_frame_oam 0x0, 0x1000, 0xE8, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xC9, 24, -32
	banim_frame_oam 0x8000, 0x1000, 0xCA, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0x8D, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xA9, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8A, 0, 0
	banim_frame_oam 0x0, 0x1000, 0x8C, -8, 0
	banim_frame_oam 0x8000, 0x9000, 0xA, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x9, 16, -32
	banim_frame_oam 0x0, 0x1000, 0x49, 16, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0xD, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x4F, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x8F, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xF, -40, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 0, -40
	banim_frame_oam 0x0, 0x1000, 0xE8, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xC9, 24, -32
	banim_frame_oam 0x8000, 0x1000, 0xCA, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0x8D, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xA9, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8A, 0, 0
	banim_frame_oam 0x0, 0x1000, 0x8C, -8, 0
	banim_frame_oam 0x8000, 0x9000, 0xA, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x9, 16, -32
	banim_frame_oam 0x0, 0x1000, 0x49, 16, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_25_l:
	banim_frame_oam 0x8000, 0x9000, 0x50, -16, -32
	banim_frame_oam 0x0, 0x5000, 0xD0, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x31, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x30, -8, -40
	banim_frame_oam 0x0, 0x1000, 0x52, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x92, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xAE, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xEE, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xAF, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xEF, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0xCD, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xCC, 16, -32
	banim_frame_oam 0x0, 0x1000, 0xEC, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x10, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xEB, 0, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x53, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0xD3, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x3F, -32, -40
	banim_frame_oam 0x0, 0x1000, 0x7F, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x9E, 8, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x9000, 0x12, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x16, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0x97, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0xB7, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xBB, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xF7, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xFB, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0x99, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x9B, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x5E, -32, -24
	banim_frame_oam 0x8000, 0x1000, 0x69, -32, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_36_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x2, -32, -48
	banim_frame_oam 0x8000, 0x9000, 0x80, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x82, -32, -16
	banim_frame_oam 0x8000, 0x5000, 0x43, -40, -32
	banim_frame_oam 0x8000, 0x1000, 0xC3, -40, 0
	banim_frame_oam 0x8000, 0x1000, 0xC4, -48, -24
	banim_frame_oam 0x0, 0x1000, 0x3, -24, -56
	banim_frame_oam 0x0, 0x1000, 0x23, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x7F, -8, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_37_l:
	banim_frame_oam 0x8000, 0xD000, 0x5, -40, -48
	banim_frame_oam 0x8000, 0x1000, 0x69, -48, -24
	banim_frame_oam 0x0, 0x1000, 0xA9, -48, -8
	banim_frame_oam 0x0, 0x1000, 0x64, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x44, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x4, -56, -24
	banim_frame_oam 0x4000, 0x9000, 0x9, -40, -64
	banim_frame_oam 0x8000, 0x1000, 0xD, -48, -64
	banim_frame_oam 0x8000, 0x1000, 0x84, -56, -64
	banim_frame_end
banim_lomm_sp1_oam_frame_38_l:
	banim_frame_oam 0x4000, 0x9000, 0xC9, -48, -64
	banim_frame_oam 0x8000, 0x1000, 0xCD, -56, -64
	banim_frame_oam 0x8000, 0x1000, 0x8D, -16, -64
	banim_frame_oam 0x8000, 0x5000, 0x12, -48, -48
	banim_frame_oam 0x8000, 0x5000, 0x4C, -56, -48
	banim_frame_oam 0x0, 0x1000, 0x49, -56, -16
	banim_frame_oam 0x0, 0x1000, 0x64, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x44, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x92, -48, -16
	banim_frame_oam 0x8000, 0x9000, 0x45, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x47, -32, -32
	banim_frame_oam 0x0, 0x5000, 0xC5, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xC7, -32, 0
	banim_frame_oam 0x8000, 0x5000, 0x51, -40, -32
	banim_frame_oam 0x8000, 0x1000, 0xD1, -40, 0
	banim_frame_oam 0x4000, 0x9000, 0xE, -40, -48
	banim_frame_end
banim_lomm_sp1_oam_frame_39_l:
	banim_frame_oam 0x8000, 0x9000, 0x4E, -48, -32
	banim_frame_oam 0x8000, 0x1000, 0xCE, -40, 0
	banim_frame_oam 0x8000, 0x1000, 0x50, -56, -32
	banim_frame_oam 0x0, 0x1000, 0x90, -56, -16
	banim_frame_oam 0x8000, 0x9000, 0x45, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x47, -32, -32
	banim_frame_oam 0x0, 0x5000, 0xC5, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xC7, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x64, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x44, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x4A, -24, -48
	banim_frame_oam 0x0, 0x5000, 0x8A, -40, -48
	banim_frame_oam 0x0, 0x5000, 0xD2, -56, -64
	banim_frame_oam 0x0, 0x5000, 0xCF, -40, -64
	banim_frame_oam 0x0, 0x1000, 0xB0, -48, -48
	banim_frame_oam 0x8000, 0x1000, 0x3F, -56, -48
	banim_frame_end
banim_lomm_sp1_oam_frame_40_l:
	banim_frame_oam 0x8000, 0xD000, 0x14, -40, -56
	banim_frame_oam 0x8000, 0x9000, 0x38, -56, -48
	banim_frame_oam 0x4000, 0x1000, 0xB8, -56, -16
	banim_frame_oam 0x0, 0x1000, 0xD8, -48, -8
	banim_frame_oam 0x4000, 0x1000, 0x18, -24, -64
	banim_frame_oam 0x4000, 0x5000, 0xE5, -40, 8
	banim_frame_oam 0x0, 0x1000, 0x64, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x44, -8, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x5000, 0x5C, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x9C, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x1C, -24, -24
	banim_frame_oam 0x0, 0x5000, 0x1D, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0x3B, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x7B, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x79, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x17, 0, -16
	banim_frame_oam 0x4000, 0x9000, 0xDC, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xBE, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x9F, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xBD, -32, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0xA0, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xA4, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x5, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x2, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x0, -40, -32
	banim_frame_end
banim_lomm_sp1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x9000, 0x26, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x2A, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0xA6, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xAA, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x7, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x2B, -40, -32
	banim_frame_oam 0x4000, 0x1000, 0xB, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x45, -32, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x46, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4A, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xC6, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xCA, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x26, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x45, -32, -24
	banim_frame_oam 0x0, 0x5000, 0x6B, -16, -40
	banim_frame_oam 0x0, 0x5000, 0xAB, -32, -40
	banim_frame_oam 0x0, 0x1000, 0xA5, -40, -32
	banim_frame_oam 0x0, 0x1000, 0x85, 0, -40
	banim_frame_oam 0x4000, 0x1000, 0x4B, -8, -48
	banim_frame_end
banim_lomm_sp1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x9000, 0x2D, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x31, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0xAD, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xB1, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x52, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xD, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0x11, -8, -40
	banim_frame_oam 0x0, 0x1000, 0x13, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x32, -8, -48
	banim_frame_end
banim_lomm_sp1_oam_frame_46_l:
	banim_frame_oam 0x4000, 0x9000, 0x8D, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x91, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xCD, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xD1, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x92, -16, -32
	banim_frame_oam 0x4000, 0x5000, 0xD2, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xB6, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x96, -16, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0xB8, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xBC, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0x99, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -40
	banim_frame_oam 0x0, 0x1000, 0x98, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x19, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0x59, -32, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0xC0, -16, -32
	banim_frame_oam 0x0, 0x5000, 0xC4, -32, -32
	banim_frame_oam 0x8000, 0x1000, 0xC6, -40, -32
	banim_frame_oam 0x4000, 0x5000, 0xA2, -32, -40
	banim_frame_oam 0x0, 0x1000, 0xA6, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x86, -48, -40
	banim_frame_oam 0x0, 0x1000, 0xA0, -48, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, -24, -48
	banim_frame_oam 0x0, 0x1000, 0x85, -32, -48
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, -56
	banim_frame_oam 0x0, 0x1000, 0x82, -16, -56
	banim_frame_end
banim_lomm_sp1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -16
	banim_frame_oam 0x8000, 0x9000, 0x67, 0, -56
	banim_frame_oam 0x8000, 0x5000, 0x69, -8, -56
	banim_frame_oam 0x4000, 0x1000, 0xE7, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xE9, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x8A, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x8C, -32, -48
	banim_frame_oam 0x0, 0x5000, 0xCD, -48, -32
	banim_frame_oam 0x0, 0x1000, 0xAD, -40, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x6, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0xA, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0x46, -24, -24
	banim_frame_oam 0x0, 0x1000, 0x4A, -32, -24
	banim_frame_oam 0x8000, 0x1000, 0xC0, 8, -32
	banim_frame_oam 0x4000, 0x1000, 0xB, -48, -40
	banim_frame_oam 0x4000, 0x1000, 0x4B, -48, -24
	banim_frame_oam 0x4000, 0x1000, 0x2B, -16, -56
	banim_frame_oam 0x4000, 0x1000, 0x6A, -24, -48
	banim_frame_oam 0x0, 0x1000, 0x6C, -32, -48
	banim_frame_oam 0x0, 0x1000, 0x66, 0, -56
	banim_frame_end
banim_lomm_sp1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -16
	banim_frame_oam 0x0, 0x9000, 0xD, -16, -56
	banim_frame_oam 0x4000, 0x5000, 0x8D, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0x51, -24, -40
	banim_frame_oam 0x0, 0x1000, 0x91, -24, -24
	banim_frame_oam 0x0, 0x5000, 0xAF, -40, -40
	banim_frame_oam 0x4000, 0x1000, 0xEF, -40, -24
	banim_frame_oam 0x8000, 0x1000, 0xD1, -48, -32
	banim_frame_end
banim_lomm_sp1_oam_frame_52_l:
	banim_frame_oam 0x8000, 0x9000, 0x32, 0, -32
	banim_frame_oam 0x0, 0x5000, 0xB2, 0, 0
	banim_frame_oam 0x0, 0x9000, 0x14, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x94, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xD4, -32, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_53_l:
	banim_frame_oam 0x0, 0x9000, 0x60, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x64, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 8
	banim_frame_oam 0x4000, 0x5000, 0x41, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x3, -16, -48
	banim_frame_oam 0x8000, 0x1000, 0x0, -32, -8
	banim_frame_oam 0x0, 0x1000, 0x40, -32, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_54_l:
	banim_frame_oam 0x0, 0x9000, 0x69, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x6D, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xED, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x8E, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0x4A, -24, -32
	banim_frame_oam 0x4000, 0x1000, 0x2B, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0x29, -40, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_55_l:
	banim_frame_oam 0x8000, 0x9000, 0x32, 0, -32
	banim_frame_oam 0x0, 0x5000, 0xB2, 0, 0
	banim_frame_oam 0x0, 0x9000, 0x18, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x98, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, -32, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_56_l:
	banim_frame_oam 0x8000, 0x9000, 0x60, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x62, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x41, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x25, -24, -40
	banim_frame_oam 0x0, 0x5000, 0xA5, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xE5, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x1, -32, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_57_l:
	banim_frame_oam 0x8000, 0x9000, 0x69, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x6B, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE9, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x2F, -24, -40
	banim_frame_oam 0x0, 0x5000, 0xAF, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x2E, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x6E, -32, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x5000, 0x44, -40, -24
	banim_frame_oam 0x0, 0x1000, 0xC4, -40, 8
	banim_frame_oam 0x0, 0x5000, 0x2, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0x4, -40, -40
	banim_frame_oam 0x8000, 0x1000, 0x0, -48, -40
	banim_frame_oam 0x8000, 0x1000, 0x1, -48, -24
	banim_frame_oam 0x0, 0x5000, 0x1D, -16, 0
	banim_frame_oam 0x4000, 0x9000, 0x40, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -32, -8
	banim_frame_oam 0x0, 0x5000, 0xA2, -32, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, 8, -32
	banim_frame_oam 0x0, 0x5000, 0x9C, 8, 0
	banim_frame_oam 0x8000, 0x9000, 0x3A, 24, -24
	banim_frame_oam 0x0, 0x1000, 0xBB, 24, 8
	banim_frame_oam 0x8000, 0x5000, 0x3E, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xBE, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x7F, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0xDC, 40, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0x14, 8, -32
	banim_frame_oam 0x8000, 0x9000, 0x18, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x94, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x98, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xF9, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xDA, 32, -40
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_lomm_sp1_oam_r:
banim_lomm_sp1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0xA0, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xA4, 16, 0
	banim_frame_oam 0x8000, 0x4000, 0x5, 24, -40
	banim_frame_oam 0x4000, 0x0, 0x2, 0, -40
	banim_frame_oam 0x0, 0x0, 0x4, 16, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0xDB, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xDF, 16, 0
	banim_frame_oam 0x0, 0x8000, 0x20, -15, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 17, -32
	banim_frame_oam 0x8000, 0x4000, 0x5, 25, -40
	banim_frame_oam 0x4000, 0x0, 0x2, 1, -40
	banim_frame_oam 0x0, 0x0, 0x4, 17, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -14, -32
	banim_frame_oam 0x8000, 0x4000, 0xA, 18, -32
	banim_frame_oam 0x8000, 0x0, 0xB, 26, -24
	banim_frame_oam 0x8000, 0x0, 0xA5, 26, -40
	banim_frame_oam 0x4000, 0x0, 0x0, 2, -40
	banim_frame_oam 0x4000, 0x8000, 0x9C, -8, 0
	banim_frame_oam 0x0, 0x0, 0x7E, 24, 0
	banim_frame_oam 0x0, 0x0, 0x7F, -16, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0x85, 32, 8
	banim_frame_oam 0x0, 0x8000, 0x2C, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x30, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xAC, -8, 8
	banim_frame_oam 0x0, 0x0, 0xB0, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xE, 8, -32
	banim_frame_oam 0x0, 0x0, 0x10, 24, -32
	banim_frame_oam 0x8000, 0x0, 0x8B, 32, -16
	banim_frame_oam 0x8000, 0x0, 0x4B, 32, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x31, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x35, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xB5, 24, 8
	banim_frame_oam 0x4000, 0x0, 0x13, 8, -32
	banim_frame_oam 0x0, 0x0, 0x15, 24, -32
	banim_frame_oam 0x8000, 0x4000, 0x56, 32, -16
	banim_frame_oam 0x8000, 0x0, 0x16, 32, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x0, 0xC, 16, -40
	banim_frame_oam 0x4000, 0x0, 0x11, 32, -40
	banim_frame_oam 0x0, 0x8000, 0x17, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x1B, 32, -32
	banim_frame_oam 0x4000, 0x8000, 0x97, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x9B, 32, 0
	banim_frame_oam 0x8000, 0x0, 0x1C, 40, -32
	banim_frame_oam 0x0, 0x0, 0x5C, 40, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x20, 1, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 33, -32
	banim_frame_oam 0x4000, 0x8000, 0xA0, 1, 0
	banim_frame_oam 0x8000, 0x0, 0xA4, 33, 0
	banim_frame_oam 0x8000, 0x4000, 0x5, 41, -40
	banim_frame_oam 0x4000, 0x0, 0x2, 17, -40
	banim_frame_oam 0x0, 0x0, 0x4, 33, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0xC6, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0xCA, 0, -24
	banim_frame_oam 0x0, 0x4000, 0xCE, 32, -24
	banim_frame_oam 0x4000, 0x8000, 0xD0, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xD4, 32, -8
	banim_frame_oam 0x4000, 0x4000, 0xD5, 0, 8
	banim_frame_oam 0x0, 0x0, 0xD9, 32, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x40, 0, -24
	banim_frame_oam 0x8000, 0x4000, 0x44, 32, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 32, 8
	banim_frame_oam 0x0, 0x4000, 0x2, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x4, 32, -40
	banim_frame_oam 0x8000, 0x0, 0x0, 40, -40
	banim_frame_oam 0x8000, 0x0, 0x1, 40, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, 0, 0
	banim_frame_oam 0x4000, 0x0, 0xE2, 0, 8
	banim_frame_oam 0x8000, 0x8000, 0x2, 16, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 32, -40
	banim_frame_oam 0x0, 0x4000, 0x82, 16, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 32, -8
	banim_frame_oam 0x4000, 0x0, 0xC2, 16, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 32, 8
	banim_frame_oam 0x0, 0x4000, 0x40, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x80, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x1, 40, -24
	banim_frame_oam 0x8000, 0x0, 0x0, 40, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0x5, 0, -8
	banim_frame_oam 0x4000, 0x0, 0x7, 0, 8
	banim_frame_oam 0x8000, 0x8000, 0x2, 16, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 32, -40
	banim_frame_oam 0x0, 0x4000, 0x82, 16, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 32, -8
	banim_frame_oam 0x4000, 0x0, 0xC2, 16, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 32, 8
	banim_frame_oam 0x8000, 0x0, 0x1, 40, -24
	banim_frame_oam 0x8000, 0x0, 0x0, 40, -40
	banim_frame_oam 0x0, 0x4000, 0x40, 0, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x0, 0x45, 40, -32
	banim_frame_oam 0x8000, 0x8000, 0x69, 16, -24
	banim_frame_oam 0x8000, 0x4000, 0x6B, 32, -24
	banim_frame_oam 0x4000, 0x4000, 0xE5, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE9, 16, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 32, 8
	banim_frame_oam 0x4000, 0x4000, 0x47, 0, -32
	banim_frame_oam 0x0, 0x0, 0x4B, 32, -32
	banim_frame_oam 0x8000, 0x8000, 0x66, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x68, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x85, -16, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x0, 0xB, 32, -16
	banim_frame_oam 0x4000, 0x0, 0x9, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x27, -32, -40
	banim_frame_oam 0x0, 0x0, 0x29, -16, -40
	banim_frame_oam 0x0, 0x8000, 0x4C, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x50, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x52, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xCC, -24, 0
	banim_frame_oam 0x0, 0x4000, 0xD0, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xD2, 24, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0xC, -40, -56
	banim_frame_oam 0x8000, 0x0, 0xE, -24, -56
	banim_frame_oam 0x0, 0x0, 0x2F, -16, -48
	banim_frame_oam 0x4000, 0x4000, 0xF, -24, 8
	banim_frame_oam 0x0, 0x0, 0x13, 8, 8
	banim_frame_oam 0x0, 0x8000, 0x53, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x57, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0xD3, -32, -8
	banim_frame_oam 0x0, 0x4000, 0xD7, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x14, 16, -32
	banim_frame_oam 0x0, 0x4000, 0x15, 16, -16
	banim_frame_oam 0x0, 0x0, 0x31, 32, -8
	banim_frame_oam 0x0, 0x0, 0x30, 16, 0
	banim_frame_oam 0x0, 0x0, 0x3F, -40, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x59, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x5D, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0xD9, -32, -8
	banim_frame_oam 0x0, 0x4000, 0xDD, 0, -8
	banim_frame_oam 0x8000, 0x4000, 0x9F, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xF, -28, 8
	banim_frame_oam 0x8000, 0x0, 0x17, -40, -24
	banim_frame_oam 0x0, 0x4000, 0x18, -32, -56
	banim_frame_oam 0x4000, 0x0, 0x3A, -16, -48
	banim_frame_oam 0x8000, 0x0, 0x5F, -40, -8
	banim_frame_oam 0x4000, 0x0, 0x1B, 0, 8
	banim_frame_oam 0x0, 0x0, 0x3C, 24, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x0, 0x6, 16, -24
	banim_frame_oam 0x0, 0x8000, 0x20, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0x24, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0xA0, -40, -8
	banim_frame_oam 0x0, 0x4000, 0xA4, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -40, 8
	banim_frame_oam 0x4000, 0x0, 0xE4, -8, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -40, -48
	banim_frame_oam 0x8000, 0x4000, 0x46, 8, -32
	banim_frame_oam 0x0, 0x0, 0xC6, 8, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_58_r:
	banim_frame_oam 0x0, 0x0, 0x7, 8, -16
	banim_frame_oam 0x0, 0x0, 0x27, 8, 0
	banim_frame_oam 0x0, 0x8000, 0x29, -32, -24
	banim_frame_oam 0x8000, 0x4000, 0x2D, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0xA9, -32, 8
	banim_frame_oam 0x0, 0x0, 0xAD, 0, 8
	banim_frame_oam 0x0, 0x0, 0xD, -8, -40
	banim_frame_oam 0x4000, 0x0, 0xA, -24, -32
	banim_frame_oam 0x0, 0x0, 0xC, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x47, -48, -16
	banim_frame_oam 0x0, 0x4000, 0x87, -64, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x7, 8, -16
	banim_frame_oam 0x0, 0x0, 0x27, 8, 0
	banim_frame_oam 0x0, 0x8000, 0x29, -32, -24
	banim_frame_oam 0x8000, 0x4000, 0x2D, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0xA9, -32, 8
	banim_frame_oam 0x0, 0x0, 0xAD, 0, 8
	banim_frame_oam 0x0, 0x0, 0xD, -8, -40
	banim_frame_oam 0x4000, 0x0, 0xA, -24, -32
	banim_frame_oam 0x0, 0x0, 0xC, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x47, -48, -16
	banim_frame_oam 0x8000, 0x0, 0x8, -56, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x4000, 0x87, -64, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_59_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -32, -32
	banim_frame_oam 0x4000, 0x8000, 0x8E, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x12, 0, -24
	banim_frame_oam 0x0, 0x0, 0x52, 0, -8
	banim_frame_oam 0x0, 0x4000, 0xC8, -56, -16
	banim_frame_oam 0x0, 0x0, 0xC7, -40, -16
	banim_frame_oam 0x0, 0x0, 0xE7, -64, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -32, -32
	banim_frame_oam 0x4000, 0x8000, 0x8E, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x12, 0, -24
	banim_frame_oam 0x0, 0x0, 0x52, 0, -8
	banim_frame_oam 0x0, 0x0, 0xC7, -40, -16
	banim_frame_oam 0x0, 0x4000, 0xCA, -56, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x4000, 0xC8, -56, -16
	banim_frame_oam 0x0, 0x0, 0xE7, -64, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_60_r:
	banim_frame_oam 0x8000, 0x0, 0x72, 0, -24
	banim_frame_oam 0x0, 0x0, 0xB2, 0, -8
	banim_frame_oam 0x0, 0x8000, 0x13, -40, -32
	banim_frame_oam 0x8000, 0x4000, 0x17, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -40, 0
	banim_frame_oam 0x8000, 0x0, 0x97, -8, 0
	banim_frame_oam 0x0, 0x4000, 0xC8, -56, -16
	banim_frame_oam 0x0, 0x0, 0xE7, -64, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x0, 0x72, 0, -24
	banim_frame_oam 0x0, 0x0, 0xB2, 0, -8
	banim_frame_oam 0x0, 0x8000, 0x13, -40, -32
	banim_frame_oam 0x8000, 0x4000, 0x17, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -40, 0
	banim_frame_oam 0x8000, 0x0, 0x97, -8, 0
	banim_frame_oam 0x0, 0x4000, 0xCA, -56, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x4000, 0xC8, -56, -16
	banim_frame_oam 0x0, 0x0, 0xE7, -64, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_61_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -40, -32
	banim_frame_oam 0x8000, 0x4000, 0x1C, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x98, -40, 0
	banim_frame_oam 0x8000, 0x0, 0x9C, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x3D, 0, -24
	banim_frame_oam 0x0, 0x0, 0x7D, 0, -8
	banim_frame_oam 0x0, 0x4000, 0xC8, -56, -16
	banim_frame_oam 0x0, 0x0, 0xE7, -64, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -40, -32
	banim_frame_oam 0x8000, 0x4000, 0x1C, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x98, -40, 0
	banim_frame_oam 0x8000, 0x0, 0x9C, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x3D, 0, -24
	banim_frame_oam 0x0, 0x0, 0x7D, 0, -8
	banim_frame_oam 0x0, 0x4000, 0xCA, -56, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0xC8, -56, -16
	banim_frame_oam 0x0, 0x0, 0xE7, -64, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -32, -48
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -48
	banim_frame_oam 0x8000, 0x8000, 0x84, 0, -16
	banim_frame_oam 0x8000, 0x8000, 0x6, 16, -48
	banim_frame_oam 0x0, 0x0, 0x68, 32, -24
	banim_frame_oam 0x4000, 0x0, 0x87, -16, -56
	banim_frame_oam 0x4000, 0x0, 0xA7, 0, -56
	banim_frame_oam 0x8000, 0x0, 0x86, -40, -16
	banim_frame_oam 0x0, 0x0, 0xC6, -24, -56
	banim_frame_oam 0x8000, 0x0, 0x8, -40, -48
	banim_frame_oam 0x0, 0x0, 0x48, 32, -32
	banim_frame_end
banim_lomm_sp1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0xD, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x4F, 24, -16
	banim_frame_oam 0x0, 0x0, 0x8F, 24, 0
	banim_frame_oam 0x8000, 0x0, 0xF, 32, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -16, -40
	banim_frame_oam 0x0, 0x0, 0xE8, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xC9, -32, -32
	banim_frame_oam 0x8000, 0x0, 0xCA, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x8D, 8, 0
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xA9, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8A, -16, 0
	banim_frame_oam 0x0, 0x0, 0x8C, 0, 0
	banim_frame_oam 0x8000, 0x8000, 0xA, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, 0, -32
	banim_frame_oam 0x8000, 0x0, 0x9, -24, -32
	banim_frame_oam 0x0, 0x0, 0x49, -24, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0xD, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x4F, 24, -16
	banim_frame_oam 0x0, 0x0, 0x8F, 24, 0
	banim_frame_oam 0x8000, 0x0, 0xF, 32, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -16, -40
	banim_frame_oam 0x0, 0x0, 0xE8, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xC9, -32, -32
	banim_frame_oam 0x8000, 0x0, 0xCA, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x8D, 8, 0
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xA9, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8A, -16, 0
	banim_frame_oam 0x0, 0x0, 0x8C, 0, 0
	banim_frame_oam 0x8000, 0x8000, 0xA, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, 0, -32
	banim_frame_oam 0x8000, 0x0, 0x9, -24, -32
	banim_frame_oam 0x0, 0x0, 0x49, -24, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_25_r:
	banim_frame_oam 0x8000, 0x8000, 0x50, 0, -32
	banim_frame_oam 0x0, 0x4000, 0xD0, 0, 0
	banim_frame_oam 0x0, 0x0, 0x31, 24, 0
	banim_frame_oam 0x0, 0x0, 0x30, 0, -40
	banim_frame_oam 0x0, 0x0, 0x52, 16, -32
	banim_frame_oam 0x8000, 0x4000, 0x92, 16, -16
	banim_frame_oam 0x8000, 0x0, 0xAE, -8, -32
	banim_frame_oam 0x0, 0x0, 0xEE, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xAF, -8, -8
	banim_frame_oam 0x0, 0x0, 0xEF, -8, 8
	banim_frame_oam 0x8000, 0x0, 0xCD, -16, -32
	banim_frame_oam 0x0, 0x0, 0xCC, -24, -32
	banim_frame_oam 0x0, 0x0, 0xEC, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x10, -8, -48
	banim_frame_oam 0x0, 0x0, 0xEB, -8, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x53, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0xD3, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x3F, 24, -40
	banim_frame_oam 0x0, 0x0, 0x7F, 24, -24
	banim_frame_oam 0x0, 0x0, 0x9E, -16, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x8000, 0x12, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x16, 16, 0
	banim_frame_oam 0x4000, 0x0, 0x97, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0xB7, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xBB, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xF7, -16, -8
	banim_frame_oam 0x0, 0x0, 0xFB, 16, -8
	banim_frame_oam 0x4000, 0x0, 0x99, 0, -32
	banim_frame_oam 0x0, 0x0, 0x9B, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x5E, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x69, 24, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_36_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x2, 24, -48
	banim_frame_oam 0x8000, 0x8000, 0x80, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x82, 24, -16
	banim_frame_oam 0x8000, 0x4000, 0x43, 32, -32
	banim_frame_oam 0x8000, 0x0, 0xC3, 32, 0
	banim_frame_oam 0x8000, 0x0, 0xC4, 40, -24
	banim_frame_oam 0x0, 0x0, 0x3, 16, -56
	banim_frame_oam 0x0, 0x0, 0x23, 0, -16
	banim_frame_oam 0x0, 0x0, 0x7F, 0, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_37_r:
	banim_frame_oam 0x8000, 0xC000, 0x5, 8, -48
	banim_frame_oam 0x8000, 0x0, 0x69, 40, -24
	banim_frame_oam 0x0, 0x0, 0xA9, 40, -8
	banim_frame_oam 0x0, 0x0, 0x64, 0, 8
	banim_frame_oam 0x0, 0x0, 0x44, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x4, 48, -24
	banim_frame_oam 0x4000, 0x8000, 0x9, 8, -64
	banim_frame_oam 0x8000, 0x0, 0xD, 40, -64
	banim_frame_oam 0x8000, 0x0, 0x84, 48, -64
	banim_frame_end
banim_lomm_sp1_oam_frame_38_r:
	banim_frame_oam 0x4000, 0x8000, 0xC9, 16, -64
	banim_frame_oam 0x8000, 0x0, 0xCD, 48, -64
	banim_frame_oam 0x8000, 0x0, 0x8D, 8, -64
	banim_frame_oam 0x8000, 0x4000, 0x12, 40, -48
	banim_frame_oam 0x8000, 0x4000, 0x4C, 48, -48
	banim_frame_oam 0x0, 0x0, 0x49, 48, -16
	banim_frame_oam 0x0, 0x0, 0x64, 0, 8
	banim_frame_oam 0x0, 0x0, 0x44, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x92, 40, -16
	banim_frame_oam 0x8000, 0x8000, 0x45, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x47, 24, -32
	banim_frame_oam 0x0, 0x4000, 0xC5, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xC7, 24, 0
	banim_frame_oam 0x8000, 0x4000, 0x51, 32, -32
	banim_frame_oam 0x8000, 0x0, 0xD1, 32, 0
	banim_frame_oam 0x4000, 0x8000, 0xE, 8, -48
	banim_frame_end
banim_lomm_sp1_oam_frame_39_r:
	banim_frame_oam 0x8000, 0x8000, 0x4E, 32, -32
	banim_frame_oam 0x8000, 0x0, 0xCE, 32, 0
	banim_frame_oam 0x8000, 0x0, 0x50, 48, -32
	banim_frame_oam 0x0, 0x0, 0x90, 48, -16
	banim_frame_oam 0x8000, 0x8000, 0x45, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x47, 24, -32
	banim_frame_oam 0x0, 0x4000, 0xC5, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xC7, 24, 0
	banim_frame_oam 0x0, 0x0, 0x64, 0, 8
	banim_frame_oam 0x0, 0x0, 0x44, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x4A, 8, -48
	banim_frame_oam 0x0, 0x4000, 0x8A, 24, -48
	banim_frame_oam 0x0, 0x4000, 0xD2, 40, -64
	banim_frame_oam 0x0, 0x4000, 0xCF, 24, -64
	banim_frame_oam 0x0, 0x0, 0xB0, 40, -48
	banim_frame_oam 0x8000, 0x0, 0x3F, 48, -48
	banim_frame_end
banim_lomm_sp1_oam_frame_40_r:
	banim_frame_oam 0x8000, 0xC000, 0x14, 8, -56
	banim_frame_oam 0x8000, 0x8000, 0x38, 40, -48
	banim_frame_oam 0x4000, 0x0, 0xB8, 40, -16
	banim_frame_oam 0x0, 0x0, 0xD8, 40, -8
	banim_frame_oam 0x4000, 0x0, 0x18, 8, -64
	banim_frame_oam 0x4000, 0x4000, 0xE5, 8, 8
	banim_frame_oam 0x0, 0x0, 0x64, 0, 8
	banim_frame_oam 0x0, 0x0, 0x44, 0, -16
	banim_frame_end
banim_lomm_sp1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x4000, 0x5C, 0, -16
	banim_frame_oam 0x4000, 0x0, 0x9C, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x1C, 16, -24
	banim_frame_oam 0x0, 0x4000, 0x1D, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x3B, 16, -8
	banim_frame_oam 0x0, 0x0, 0x7B, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x79, 0, 8
	banim_frame_oam 0x8000, 0x8000, 0x17, -16, -16
	banim_frame_oam 0x4000, 0x8000, 0xDC, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xBE, 0, -40
	banim_frame_oam 0x0, 0x0, 0x9F, 24, -16
	banim_frame_oam 0x0, 0x0, 0xBD, 24, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0xA0, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xA4, 16, 0
	banim_frame_oam 0x8000, 0x0, 0x5, 24, -24
	banim_frame_oam 0x4000, 0x0, 0x2, 0, -40
	banim_frame_oam 0x4000, 0x0, 0x0, 24, -32
	banim_frame_end
banim_lomm_sp1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x8000, 0x26, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x2A, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0xA6, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xAA, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x7, -8, -40
	banim_frame_oam 0x4000, 0x0, 0x2B, 24, -32
	banim_frame_oam 0x4000, 0x0, 0xB, -8, -48
	banim_frame_oam 0x8000, 0x0, 0x45, 24, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x46, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4A, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xC6, -16, 8
	banim_frame_oam 0x0, 0x0, 0xCA, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x26, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x45, 24, -24
	banim_frame_oam 0x0, 0x4000, 0x6B, 0, -40
	banim_frame_oam 0x0, 0x4000, 0xAB, 16, -40
	banim_frame_oam 0x0, 0x0, 0xA5, 32, -32
	banim_frame_oam 0x0, 0x0, 0x85, -8, -40
	banim_frame_oam 0x4000, 0x0, 0x4B, -8, -48
	banim_frame_end
banim_lomm_sp1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x8000, 0x2D, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x31, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0xAD, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xB1, 16, 0
	banim_frame_oam 0x8000, 0x0, 0x52, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xD, -40, -40
	banim_frame_oam 0x4000, 0x0, 0x11, -8, -40
	banim_frame_oam 0x0, 0x0, 0x13, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x32, -8, -48
	banim_frame_end
banim_lomm_sp1_oam_frame_46_r:
	banim_frame_oam 0x4000, 0x8000, 0x8D, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x91, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xCD, -16, 8
	banim_frame_oam 0x0, 0x0, 0xD1, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0x92, -16, -32
	banim_frame_oam 0x4000, 0x4000, 0xD2, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xB6, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x96, 0, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0xB8, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xBC, 16, 0
	banim_frame_oam 0x4000, 0x0, 0x99, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -40
	banim_frame_oam 0x0, 0x0, 0x98, 16, -8
	banim_frame_oam 0x0, 0x0, 0x19, 24, -40
	banim_frame_oam 0x8000, 0x0, 0x59, 24, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0xC0, -16, -32
	banim_frame_oam 0x0, 0x4000, 0xC4, 16, -32
	banim_frame_oam 0x8000, 0x0, 0xC6, 32, -32
	banim_frame_oam 0x4000, 0x4000, 0xA2, 0, -40
	banim_frame_oam 0x0, 0x0, 0xA6, 32, -40
	banim_frame_oam 0x0, 0x0, 0x86, 40, -40
	banim_frame_oam 0x0, 0x0, 0xA0, 40, -24
	banim_frame_oam 0x4000, 0x0, 0x83, 8, -48
	banim_frame_oam 0x0, 0x0, 0x85, 24, -48
	banim_frame_oam 0x4000, 0x0, 0x80, -8, -56
	banim_frame_oam 0x0, 0x0, 0x82, 8, -56
	banim_frame_end
banim_lomm_sp1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -16
	banim_frame_oam 0x8000, 0x8000, 0x67, -16, -56
	banim_frame_oam 0x8000, 0x4000, 0x69, 0, -56
	banim_frame_oam 0x4000, 0x0, 0xE7, -16, -24
	banim_frame_oam 0x0, 0x0, 0xE9, 0, -24
	banim_frame_oam 0x8000, 0x8000, 0x8A, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x8C, 24, -48
	banim_frame_oam 0x0, 0x4000, 0xCD, 32, -32
	banim_frame_oam 0x0, 0x0, 0xAD, 32, -40
	banim_frame_end
banim_lomm_sp1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x6, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xA, 24, -40
	banim_frame_oam 0x4000, 0x4000, 0x46, -8, -24
	banim_frame_oam 0x0, 0x0, 0x4A, 24, -24
	banim_frame_oam 0x8000, 0x0, 0xC0, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xB, 32, -40
	banim_frame_oam 0x4000, 0x0, 0x4B, 32, -24
	banim_frame_oam 0x4000, 0x0, 0x2B, 0, -56
	banim_frame_oam 0x4000, 0x0, 0x6A, 8, -48
	banim_frame_oam 0x0, 0x0, 0x6C, 24, -48
	banim_frame_oam 0x0, 0x0, 0x66, -8, -56
	banim_frame_end
banim_lomm_sp1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -16
	banim_frame_oam 0x0, 0x8000, 0xD, -16, -56
	banim_frame_oam 0x4000, 0x4000, 0x8D, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x51, 16, -40
	banim_frame_oam 0x0, 0x0, 0x91, 16, -24
	banim_frame_oam 0x0, 0x4000, 0xAF, 24, -40
	banim_frame_oam 0x4000, 0x0, 0xEF, 24, -24
	banim_frame_oam 0x8000, 0x0, 0xD1, 40, -32
	banim_frame_end
banim_lomm_sp1_oam_frame_52_r:
	banim_frame_oam 0x8000, 0x8000, 0x32, -16, -32
	banim_frame_oam 0x0, 0x4000, 0xB2, -16, 0
	banim_frame_oam 0x0, 0x8000, 0x14, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x94, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xD4, 0, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_53_r:
	banim_frame_oam 0x0, 0x8000, 0x60, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x64, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 8
	banim_frame_oam 0x4000, 0x4000, 0x41, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x3, 8, -48
	banim_frame_oam 0x8000, 0x0, 0x0, 24, -8
	banim_frame_oam 0x0, 0x0, 0x40, 24, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_54_r:
	banim_frame_oam 0x0, 0x8000, 0x69, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x6D, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x0, 0xED, 16, 8
	banim_frame_oam 0x8000, 0x4000, 0x8E, 24, -16
	banim_frame_oam 0x4000, 0x4000, 0x4A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0x2B, 0, -40
	banim_frame_oam 0x8000, 0x0, 0x29, 32, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_55_r:
	banim_frame_oam 0x8000, 0x8000, 0x32, -16, -32
	banim_frame_oam 0x0, 0x4000, 0xB2, -16, 0
	banim_frame_oam 0x0, 0x8000, 0x18, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x98, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, 0, 8
	banim_frame_end
banim_lomm_sp1_oam_frame_56_r:
	banim_frame_oam 0x8000, 0x8000, 0x60, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x62, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE2, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x41, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x25, 8, -40
	banim_frame_oam 0x0, 0x4000, 0xA5, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xE5, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x1, 24, -8
	banim_frame_end
banim_lomm_sp1_oam_frame_57_r:
	banim_frame_oam 0x8000, 0x8000, 0x69, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x6B, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE9, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x4A, -8, -32
	banim_frame_oam 0x8000, 0x8000, 0x2F, 8, -40
	banim_frame_oam 0x0, 0x4000, 0xAF, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x2E, 24, -16
	banim_frame_oam 0x0, 0x0, 0x6E, 24, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x4000, 0x44, 32, -24
	banim_frame_oam 0x0, 0x0, 0xC4, 32, 8
	banim_frame_oam 0x0, 0x4000, 0x2, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x4, 32, -40
	banim_frame_oam 0x8000, 0x0, 0x0, 40, -40
	banim_frame_oam 0x8000, 0x0, 0x1, 40, -24
	banim_frame_oam 0x0, 0x4000, 0x1D, 0, 0
	banim_frame_oam 0x4000, 0x8000, 0x40, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, 0, -8
	banim_frame_oam 0x0, 0x4000, 0xA2, 16, 0
	banim_frame_end
banim_lomm_sp1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -24, -32
	banim_frame_oam 0x0, 0x4000, 0x9C, -24, 0
	banim_frame_oam 0x8000, 0x8000, 0x3A, -40, -24
	banim_frame_oam 0x0, 0x0, 0xBB, -32, 8
	banim_frame_oam 0x8000, 0x4000, 0x3E, -8, -24
	banim_frame_oam 0x0, 0x0, 0xBE, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, 0, -24
	banim_frame_oam 0x0, 0x0, 0x7F, 0, -8
	banim_frame_oam 0x4000, 0x8000, 0xDC, -72, -24
	banim_frame_end
banim_lomm_sp1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -40, -32
	banim_frame_oam 0x8000, 0x8000, 0x18, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x94, -40, 0
	banim_frame_oam 0x0, 0x4000, 0x98, -8, 0
	banim_frame_oam 0x0, 0x0, 0xF9, 8, -16
	banim_frame_oam 0x0, 0x4000, 0xDA, -48, -40
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_lomm_sp1_script:
banim_lomm_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 1, banim_lomm_sp1_oam_frame_1_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 2, banim_lomm_sp1_oam_frame_2_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 3, banim_lomm_sp1_oam_frame_3_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 4, banim_lomm_sp1_oam_frame_4_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 5, banim_lomm_sp1_oam_frame_5_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 6, banim_lomm_sp1_oam_frame_6_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_0, 7, banim_lomm_sp1_oam_frame_7_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 60, banim_lomm_sp1_oam_frame_8_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 8, banim_lomm_sp1_oam_frame_9_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 9, banim_lomm_sp1_oam_frame_10_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 10, banim_lomm_sp1_oam_frame_11_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 60, banim_lomm_sp1_oam_frame_8_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 8, banim_lomm_sp1_oam_frame_9_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 9, banim_lomm_sp1_oam_frame_10_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 10, banim_lomm_sp1_oam_frame_11_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 11, banim_lomm_sp1_oam_frame_12_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 12, banim_lomm_sp1_oam_frame_13_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 13, banim_lomm_sp1_oam_frame_14_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 14, banim_lomm_sp1_oam_frame_15_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 15, banim_lomm_sp1_oam_frame_16_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 17, banim_lomm_sp1_oam_frame_17_r - banim_lomm_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 20, banim_lomm_sp1_oam_frame_18_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 23, banim_lomm_sp1_oam_frame_19_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 26, banim_lomm_sp1_oam_frame_20_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_3, 61, banim_lomm_sp1_oam_frame_21_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 62, banim_lomm_sp1_oam_frame_22_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 28, banim_lomm_sp1_oam_frame_23_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 29, banim_lomm_sp1_oam_frame_24_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 31, banim_lomm_sp1_oam_frame_25_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 32, banim_lomm_sp1_oam_frame_26_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 33, banim_lomm_sp1_oam_frame_27_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 36, banim_lomm_sp1_oam_frame_30_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 18, banim_lomm_sp1_oam_frame_31_r - banim_lomm_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 21, banim_lomm_sp1_oam_frame_32_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 24, banim_lomm_sp1_oam_frame_33_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 27, banim_lomm_sp1_oam_frame_34_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 1, banim_lomm_sp1_oam_frame_1_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 2, banim_lomm_sp1_oam_frame_2_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 3, banim_lomm_sp1_oam_frame_3_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 4, banim_lomm_sp1_oam_frame_4_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 5, banim_lomm_sp1_oam_frame_5_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 6, banim_lomm_sp1_oam_frame_6_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 38, banim_lomm_sp1_oam_frame_36_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 39, banim_lomm_sp1_oam_frame_37_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 40, banim_lomm_sp1_oam_frame_38_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 41, banim_lomm_sp1_oam_frame_39_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 42, banim_lomm_sp1_oam_frame_40_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 39, banim_lomm_sp1_oam_frame_37_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 40, banim_lomm_sp1_oam_frame_38_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 41, banim_lomm_sp1_oam_frame_39_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_5, 42, banim_lomm_sp1_oam_frame_40_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 11, banim_lomm_sp1_oam_frame_12_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 12, banim_lomm_sp1_oam_frame_13_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 13, banim_lomm_sp1_oam_frame_14_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 14, banim_lomm_sp1_oam_frame_15_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 15, banim_lomm_sp1_oam_frame_16_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 17, banim_lomm_sp1_oam_frame_17_r - banim_lomm_sp1_oam_r
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 20, banim_lomm_sp1_oam_frame_18_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 23, banim_lomm_sp1_oam_frame_19_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 26, banim_lomm_sp1_oam_frame_20_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_3, 61, banim_lomm_sp1_oam_frame_21_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 62, banim_lomm_sp1_oam_frame_22_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 28, banim_lomm_sp1_oam_frame_23_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 29, banim_lomm_sp1_oam_frame_24_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 31, banim_lomm_sp1_oam_frame_25_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 32, banim_lomm_sp1_oam_frame_26_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 33, banim_lomm_sp1_oam_frame_27_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 35, banim_lomm_sp1_oam_frame_29_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 36, banim_lomm_sp1_oam_frame_30_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 18, banim_lomm_sp1_oam_frame_31_r - banim_lomm_sp1_oam_r
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 21, banim_lomm_sp1_oam_frame_32_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 24, banim_lomm_sp1_oam_frame_33_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 27, banim_lomm_sp1_oam_frame_34_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 37, banim_lomm_sp1_oam_frame_35_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 34, banim_lomm_sp1_oam_frame_28_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 44, banim_lomm_sp1_oam_frame_42_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 45, banim_lomm_sp1_oam_frame_43_r - banim_lomm_sp1_oam_r
	banim_code_frame 15, banim_lomm_sp1_sheet_6, 46, banim_lomm_sp1_oam_frame_44_r - banim_lomm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_call_spell_anim
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 47, banim_lomm_sp1_oam_frame_45_r - banim_lomm_sp1_oam_r
	banim_code_frame 15, banim_lomm_sp1_sheet_6, 48, banim_lomm_sp1_oam_frame_46_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lomm_sp1_sheet_6, 49, banim_lomm_sp1_oam_frame_47_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 44, banim_lomm_sp1_oam_frame_42_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 45, banim_lomm_sp1_oam_frame_43_r - banim_lomm_sp1_oam_r
	banim_code_frame 15, banim_lomm_sp1_sheet_6, 46, banim_lomm_sp1_oam_frame_44_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 50, banim_lomm_sp1_oam_frame_48_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 51, banim_lomm_sp1_oam_frame_49_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 52, banim_lomm_sp1_oam_frame_50_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 53, banim_lomm_sp1_oam_frame_51_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 50, banim_lomm_sp1_oam_frame_48_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 51, banim_lomm_sp1_oam_frame_49_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 52, banim_lomm_sp1_oam_frame_50_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 53, banim_lomm_sp1_oam_frame_51_r - banim_lomm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_call_spell_anim
	banim_code_frame 2, banim_lomm_sp1_sheet_6, 47, banim_lomm_sp1_oam_frame_45_r - banim_lomm_sp1_oam_r
	banim_code_frame 15, banim_lomm_sp1_sheet_6, 48, banim_lomm_sp1_oam_frame_46_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lomm_sp1_sheet_6, 49, banim_lomm_sp1_oam_frame_47_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 54, banim_lomm_sp1_oam_frame_52_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 55, banim_lomm_sp1_oam_frame_53_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 56, banim_lomm_sp1_oam_frame_54_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 55, banim_lomm_sp1_oam_frame_53_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 54, banim_lomm_sp1_oam_frame_52_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 57, banim_lomm_sp1_oam_frame_55_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 58, banim_lomm_sp1_oam_frame_56_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_3, 59, banim_lomm_sp1_oam_frame_57_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 58, banim_lomm_sp1_oam_frame_56_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_7, 57, banim_lomm_sp1_oam_frame_55_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomm_sp1_mode_stand_close:
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomm_sp1_mode_stand:
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomm_sp1_mode_stand_range:
	banim_code_frame 1, banim_lomm_sp1_sheet_4, 43, banim_lomm_sp1_oam_frame_41_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomm_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 1, banim_lomm_sp1_oam_frame_1_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 2, banim_lomm_sp1_oam_frame_2_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 3, banim_lomm_sp1_oam_frame_3_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 6, banim_lomm_sp1_sheet_0, 4, banim_lomm_sp1_oam_frame_4_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_0, 5, banim_lomm_sp1_oam_frame_5_r - banim_lomm_sp1_oam_r
	banim_code_frame 17, banim_lomm_sp1_sheet_0, 6, banim_lomm_sp1_oam_frame_6_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_0, 7, banim_lomm_sp1_oam_frame_7_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 60, banim_lomm_sp1_oam_frame_8_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 8, banim_lomm_sp1_oam_frame_9_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 9, banim_lomm_sp1_oam_frame_10_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 10, banim_lomm_sp1_oam_frame_11_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 60, banim_lomm_sp1_oam_frame_8_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 8, banim_lomm_sp1_oam_frame_9_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 9, banim_lomm_sp1_oam_frame_10_r - banim_lomm_sp1_oam_r
	banim_code_frame 20, banim_lomm_sp1_sheet_1, 10, banim_lomm_sp1_oam_frame_11_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 11, banim_lomm_sp1_oam_frame_12_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_1, 12, banim_lomm_sp1_oam_frame_13_r - banim_lomm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 13, banim_lomm_sp1_oam_frame_14_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_1, 14, banim_lomm_sp1_oam_frame_15_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 15, banim_lomm_sp1_oam_frame_16_r - banim_lomm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 16, banim_lomm_sp1_oam_frame_58_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_2, 19, banim_lomm_sp1_oam_frame_59_r - banim_lomm_sp1_oam_r
	banim_code_frame 5, banim_lomm_sp1_sheet_2, 22, banim_lomm_sp1_oam_frame_60_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_2, 25, banim_lomm_sp1_oam_frame_61_r - banim_lomm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lomm_sp1_sheet_3, 61, banim_lomm_sp1_oam_frame_21_r - banim_lomm_sp1_oam_r
	banim_code_frame 2, banim_lomm_sp1_sheet_3, 62, banim_lomm_sp1_oam_frame_22_r - banim_lomm_sp1_oam_r
	banim_code_frame 3, banim_lomm_sp1_sheet_4, 28, banim_lomm_sp1_oam_frame_23_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 29, banim_lomm_sp1_oam_frame_24_r - banim_lomm_sp1_oam_r
	banim_code_frame 4, banim_lomm_sp1_sheet_4, 31, banim_lomm_sp1_oam_frame_25_r - banim_lomm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 32, banim_lomm_sp1_oam_frame_26_r - banim_lomm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_lomm_sp1_sheet_4, 33, banim_lomm_sp1_oam_frame_27_r - banim_lomm_sp1_oam_r
	banim_code_frame 1, banim_lomm_sp1_sheet_0, 0, banim_lomm_sp1_oam_frame_0_r - banim_lomm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_lomm_sp1_mode_attack_close - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_attack_close_back - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_attack_close_critical - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_attack_close_critical_back - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_attack_range - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_attack_range_critical - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_dodge_close - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_dodge_range - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_stand_close - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_stand - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_stand_range - banim_lomm_sp1_script
	.word banim_lomm_sp1_mode_attack_miss - banim_lomm_sp1_script
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0

