@ vim:ft=armv4
	.global banim_fifd_mg1_script
	.global banim_fifd_mg1_oam_r
	.global banim_fifd_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC3
	.section .data.oam_l
banim_fifd_mg1_oam_l:
banim_fifd_mg1_oam_frame_0_l:
	banim_frame_oam 0x0, 0xD000, 0x1, -37, -56
	banim_frame_oam 0x8000, 0x5000, 0x9, -45, -56
	banim_frame_oam 0x8000, 0x5000, 0x89, -45, -24
	banim_frame_oam 0x8000, 0x9000, 0x8A, -61, -48
	banim_frame_oam 0x0, 0x1000, 0xE0, -53, -56
	banim_frame_oam 0x8000, 0x9000, 0xA, -77, -48
	banim_frame_oam 0x8000, 0x1000, 0x80, -53, -16
	banim_frame_oam 0x0, 0x1000, 0xC0, -53, 0
	banim_frame_oam 0x8000, 0x5000, 0x0, 27, -48
	banim_frame_oam 0x4000, 0x9000, 0xC, -5, 8
	banim_frame_oam 0x4000, 0x9000, 0x4C, -37, 8
	banim_frame_oam 0x0, 0x5000, 0x8C, -53, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0xD000, 0x12, -37, -56
	banim_frame_oam 0x8000, 0x9000, 0x1A, -53, -56
	banim_frame_oam 0x8000, 0x9000, 0x9A, -53, -24
	banim_frame_oam 0x8000, 0x9000, 0x8F, -69, -48
	banim_frame_oam 0x8000, 0x5000, 0x91, -77, -48
	banim_frame_oam 0x8000, 0x9000, 0x10, 27, -48
	banim_frame_oam 0x0, 0x5000, 0xCC, -53, 8
	banim_frame_oam 0x8000, 0x1000, 0xCE, -61, 8
	banim_frame_oam 0x0, 0x1000, 0xBD, -61, 0
	banim_frame_oam 0x4000, 0x9000, 0xDC, -37, 8
	banim_frame_oam 0x4000, 0x5000, 0x9C, -5, 8
	banim_frame_oam 0x4000, 0x1000, 0xBE, -5, 16
	banim_frame_oam 0x0, 0x1000, 0xBC, 27, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_2_l:
	banim_frame_oam 0x0, 0xD000, 0x2, -37, -56
	banim_frame_oam 0x8000, 0x9000, 0xA, -53, -56
	banim_frame_oam 0x8000, 0x5000, 0xC, -61, -56
	banim_frame_oam 0x8000, 0x9000, 0x8A, -53, -24
	banim_frame_oam 0x8000, 0x5000, 0x8C, -61, -24
	banim_frame_oam 0x4000, 0x9000, 0x4D, -29, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 27, -40
	banim_frame_oam 0x4000, 0x1000, 0x40, 27, -24
	banim_frame_oam 0x8000, 0x5000, 0x60, -69, -48
	banim_frame_oam 0x0, 0x1000, 0xE0, -69, -16
	banim_frame_oam 0x8000, 0x1000, 0xA1, -77, -32
	banim_frame_oam 0x8000, 0x1000, 0x61, -37, 8
	banim_frame_oam 0x4000, 0x1000, 0x2D, -61, 8
	banim_frame_oam 0x0, 0x1000, 0xE1, -53, 16
	banim_frame_oam 0x4000, 0x5000, 0xD, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x30, 3, 16
	banim_frame_end
banim_fifd_mg1_oam_frame_3_l:
	banim_frame_oam 0x0, 0xD000, 0x17, -37, -48
	banim_frame_oam 0x4000, 0x9000, 0x11, -53, -72
	banim_frame_oam 0x0, 0x5000, 0x15, -69, -72
	banim_frame_oam 0x4000, 0x5000, 0x51, -53, -56
	banim_frame_oam 0x4000, 0x1000, 0x55, -69, -56
	banim_frame_oam 0x4000, 0x9000, 0x71, 11, -72
	banim_frame_oam 0x0, 0x5000, 0x75, -5, -72
	banim_frame_oam 0x4000, 0x5000, 0xB1, 11, -56
	banim_frame_oam 0x4000, 0x1000, 0xB5, -5, -56
	banim_frame_oam 0x0, 0x5000, 0xD4, -53, -48
	banim_frame_oam 0x8000, 0x1000, 0xD6, -61, -48
	banim_frame_oam 0x8000, 0x1000, 0xD3, -77, -56
	banim_frame_oam 0x4000, 0x5000, 0xED, -21, 16
	banim_frame_oam 0x4000, 0x1000, 0xF1, -37, 16
	banim_frame_oam 0x0, 0x1000, 0xD1, 27, 8
	banim_frame_oam 0x0, 0x1000, 0xD2, -45, 8
	banim_frame_oam 0x0, 0x5000, 0xAD, -53, -24
	banim_frame_oam 0x0, 0x1000, 0x8D, -45, -32
	banim_frame_oam 0x8000, 0x1000, 0xAF, -61, -16
	banim_frame_oam 0x0, 0x1000, 0xD0, -61, 0
	banim_frame_oam 0x8000, 0x1000, 0x3F, -13, -64
	banim_frame_oam 0x8000, 0x1000, 0x7F, 27, -40
	banim_frame_oam 0x4000, 0x1000, 0x8F, -45, -80
	banim_frame_oam 0x0, 0x1000, 0x8E, 11, -80
	banim_frame_oam 0x0, 0x1000, 0xBF, -21, -64
	banim_frame_oam 0x0, 0x1000, 0xDF, 35, -48
	banim_frame_end
banim_fifd_mg1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x9000, 0x48, 11, -64
	banim_frame_oam 0x4000, 0x9000, 0x4C, -21, -64
	banim_frame_oam 0x4000, 0x9000, 0x50, -53, -64
	banim_frame_oam 0x0, 0x5000, 0x54, -69, -64
	banim_frame_oam 0x4000, 0x5000, 0x88, -21, 16
	banim_frame_oam 0x4000, 0x1000, 0x8C, -37, 16
	banim_frame_oam 0x4000, 0x5000, 0x29, 3, -72
	banim_frame_oam 0x0, 0x1000, 0x2D, -5, -72
	banim_frame_oam 0x4000, 0x5000, 0x30, -53, -72
	banim_frame_oam 0x4000, 0x1000, 0x34, -69, -72
	banim_frame_oam 0x0, 0x1000, 0x9, 11, -80
	banim_frame_oam 0x4000, 0x1000, 0xA, -45, -80
	banim_frame_oam 0x4000, 0x5000, 0x12, -69, -48
	banim_frame_oam 0x8000, 0x1000, 0xF, 27, -40
	banim_frame_oam 0x0, 0x1000, 0x10, -45, -40
	banim_frame_oam 0x0, 0x1000, 0x11, -69, -40
	banim_frame_oam 0x0, 0x1000, 0xC, 35, -48
	banim_frame_oam 0x0, 0x5000, 0x5E, -53, -24
	banim_frame_oam 0x8000, 0x1000, 0x1E, -61, -16
	banim_frame_oam 0x0, 0x1000, 0x3F, -45, -32
	banim_frame_oam 0x8000, 0x1000, 0x40, -77, -64
	banim_frame_oam 0x0, 0x1000, 0x80, -45, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, 27, 8
	banim_frame_oam 0x8000, 0xD000, 0x2, -21, -48
	banim_frame_oam 0x8000, 0x9000, 0x6, -37, -48
	banim_frame_oam 0x8000, 0x9000, 0x86, -37, -16
	banim_frame_oam 0x0, 0x5000, 0xC0, 11, 0
	banim_frame_oam 0x0, 0x5000, 0x0, 11, -48
	banim_frame_oam 0x8000, 0x5000, 0x41, 11, -32
	banim_frame_end
banim_fifd_mg1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x5000, 0x90, -21, 16
	banim_frame_oam 0x4000, 0x1000, 0x94, -37, 16
	banim_frame_oam 0x4000, 0x9000, 0xC8, 11, -64
	banim_frame_oam 0x4000, 0x9000, 0xCC, -21, -64
	banim_frame_oam 0x4000, 0x9000, 0xD0, -53, -64
	banim_frame_oam 0x0, 0x5000, 0xD4, -69, -64
	banim_frame_oam 0x4000, 0x5000, 0xA8, 3, -72
	banim_frame_oam 0x4000, 0x5000, 0xB1, -53, -72
	banim_frame_oam 0x0, 0x1000, 0xB5, -61, -72
	banim_frame_oam 0x4000, 0x5000, 0xAC, -69, -48
	banim_frame_oam 0x0, 0x5000, 0x9E, -53, -8
	banim_frame_oam 0x8000, 0x1000, 0xDE, -45, -24
	banim_frame_oam 0x8000, 0x1000, 0xDF, -61, -8
	banim_frame_oam 0x8000, 0x1000, 0xE, -77, -64
	banim_frame_oam 0x8000, 0xD000, 0x17, -13, -48
	banim_frame_oam 0x8000, 0x9000, 0x1B, -29, -48
	banim_frame_oam 0x8000, 0x5000, 0x1D, -37, -48
	banim_frame_oam 0x8000, 0x9000, 0x9B, -29, -16
	banim_frame_oam 0x8000, 0x5000, 0x9D, -37, -16
	banim_frame_oam 0x8000, 0x1000, 0xD6, 19, 0
	banim_frame_oam 0x8000, 0x1000, 0x16, 19, -48
	banim_frame_oam 0x8000, 0x1000, 0x56, 27, -48
	banim_frame_oam 0x0, 0x1000, 0x96, 27, -32
	banim_frame_oam 0x0, 0x1000, 0xB6, -45, -40
	banim_frame_oam 0x0, 0x1000, 0xB0, 43, -56
	banim_frame_oam 0x0, 0x1000, 0x8F, -69, 0
	banim_frame_oam 0x0, 0x1000, 0x8E, -45, 8
	banim_frame_oam 0x0, 0x1000, 0xD, 27, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_6_l:
	banim_frame_oam 0x0, 0xD000, 0x1, -45, -40
	banim_frame_oam 0x0, 0x5000, 0xC9, -61, 8
	banim_frame_oam 0x8000, 0x9000, 0x29, -61, -32
	banim_frame_oam 0x0, 0x1000, 0x9, -53, -40
	banim_frame_oam 0x8000, 0x1000, 0x0, 19, -40
	banim_frame_oam 0x8000, 0x5000, 0x60, 19, -16
	banim_frame_oam 0x0, 0x1000, 0xE0, 19, 16
	banim_frame_oam 0x0, 0x1000, 0x40, 27, 8
	banim_frame_oam 0x0, 0x1000, 0xA, 27, -8
	banim_frame_oam 0x4000, 0x9000, 0xB, 11, -56
	banim_frame_oam 0x0, 0x5000, 0xF, -5, -56
	banim_frame_oam 0x0, 0x1000, 0x31, -13, -48
	banim_frame_oam 0x4000, 0x1000, 0xA9, -29, -48
	banim_frame_oam 0x0, 0x1000, 0x11, -21, -56
	banim_frame_oam 0x8000, 0x5000, 0x4B, -69, -32
	banim_frame_oam 0x0, 0x5000, 0x8C, -85, -16
	banim_frame_oam 0x0, 0x1000, 0x6C, -77, -24
	banim_frame_oam 0x8000, 0x1000, 0x4D, 27, -40
	banim_frame_oam 0x4000, 0x1000, 0xCB, 11, -64
	banim_frame_oam 0x0, 0x1000, 0xCD, 3, -64
	banim_frame_oam 0x8000, 0x1000, 0x4E, 43, -64
	banim_frame_end
banim_fifd_mg1_oam_frame_7_l:
	banim_frame_oam 0x0, 0xD000, 0x12, -37, -40
	banim_frame_oam 0x8000, 0x9000, 0x1A, -53, -40
	banim_frame_oam 0x8000, 0x9000, 0x9A, -53, -8
	banim_frame_oam 0x8000, 0x9000, 0x1C, -69, -32
	banim_frame_oam 0x0, 0x5000, 0x5E, -85, -16
	banim_frame_oam 0x4000, 0x9000, 0x8E, -5, -56
	banim_frame_oam 0x0, 0x5000, 0x4F, 27, -48
	banim_frame_oam 0x0, 0x1000, 0x51, 27, -32
	banim_frame_oam 0x0, 0x1000, 0x71, 27, -56
	banim_frame_oam 0x0, 0x1000, 0xD1, 43, -48
	banim_frame_oam 0x8000, 0x1000, 0xD0, -21, -56
	banim_frame_oam 0x0, 0x1000, 0xF1, -29, -48
	banim_frame_oam 0x8000, 0x1000, 0xCF, 27, -8
	banim_frame_oam 0x0, 0x1000, 0xCE, 27, 8
	banim_frame_oam 0x0, 0x1000, 0xEE, -61, 16
	banim_frame_end
banim_fifd_mg1_oam_frame_8_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -37, -48
	banim_frame_oam 0x8000, 0x9000, 0x8, -53, -48
	banim_frame_oam 0x8000, 0x9000, 0x88, -53, -16
	banim_frame_oam 0x4000, 0x5000, 0xEA, -13, 16
	banim_frame_oam 0x4000, 0x5000, 0xEE, -45, 16
	banim_frame_oam 0x8000, 0x1000, 0xB, 27, -48
	banim_frame_oam 0x0, 0x1000, 0x4B, 27, -32
	banim_frame_oam 0x0, 0x1000, 0x2A, 35, -40
	banim_frame_oam 0x0, 0x1000, 0xA, -61, -48
	banim_frame_oam 0x0, 0x5000, 0x6A, -69, -40
	banim_frame_oam 0x4000, 0x1000, 0xAA, -69, -24
	banim_frame_oam 0x0, 0x1000, 0xCA, -61, -16
	banim_frame_oam 0x8000, 0x1000, 0x8C, -77, -32
	banim_frame_oam 0x0, 0x1000, 0xCC, -77, -16
	banim_frame_oam 0x0, 0x1000, 0xCB, -61, -8
	banim_frame_oam 0x0, 0x1000, 0x6C, -21, -56
	banim_frame_oam 0x0, 0x1000, 0x4C, 27, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_9_l:
	banim_frame_oam 0x0, 0xD000, 0x12, -45, -48
	banim_frame_oam 0x8000, 0x5000, 0x1A, -53, -48
	banim_frame_oam 0x8000, 0x5000, 0x9A, -53, -16
	banim_frame_oam 0x8000, 0x9000, 0x6D, -69, -48
	banim_frame_oam 0x8000, 0x5000, 0x6F, -77, -48
	banim_frame_oam 0x4000, 0x5000, 0xC, -13, -56
	banim_frame_oam 0x8000, 0x9000, 0x10, 19, -48
	banim_frame_oam 0x8000, 0x1000, 0x2F, 35, -40
	banim_frame_oam 0x0, 0x1000, 0xD1, -21, -56
	banim_frame_oam 0x4000, 0x1000, 0x2C, -53, -56
	banim_frame_oam 0x8000, 0x1000, 0x91, 19, 0
	banim_frame_oam 0x8000, 0x1000, 0x90, 19, -16
	banim_frame_oam 0x4000, 0x5000, 0xFB, -13, 16
	banim_frame_oam 0x0, 0x1000, 0xFF, -21, 16
	banim_frame_oam 0x4000, 0x5000, 0xDC, -53, 16
	banim_frame_end
banim_fifd_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fifd_mg1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fifd_mg1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fifd_mg1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_fifd_mg1_oam_frame_14_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -37, -48
	banim_frame_oam 0x8000, 0x9000, 0x88, -53, -16
	banim_frame_oam 0x0, 0x5000, 0x8, -53, -48
	banim_frame_oam 0x0, 0x1000, 0x68, -45, -24
	banim_frame_oam 0x0, 0x1000, 0x48, -53, 16
	banim_frame_oam 0x4000, 0x9000, 0xA, 3, -72
	banim_frame_oam 0x4000, 0x9000, 0xE, -29, -72
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, -56
	banim_frame_oam 0x4000, 0x5000, 0x4E, -29, -56
	banim_frame_oam 0x4000, 0x9000, 0x6A, -61, -72
	banim_frame_oam 0x4000, 0x5000, 0xAA, -61, -56
	banim_frame_oam 0x0, 0x5000, 0xCC, 35, -64
	banim_frame_oam 0x0, 0x5000, 0xCA, -77, -64
	banim_frame_oam 0x4000, 0x5000, 0xEE, -21, 16
	banim_frame_oam 0x4000, 0x1000, 0xF2, -37, 16
	banim_frame_oam 0x8000, 0x1000, 0x6E, 27, -48
	banim_frame_oam 0x0, 0x1000, 0xAE, 27, -32
	banim_frame_oam 0x4000, 0x1000, 0x6F, -69, -48
	banim_frame_oam 0x8000, 0x5000, 0x71, -61, -16
	banim_frame_oam 0x0, 0x1000, 0x49, 27, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_15_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -37, -48
	banim_frame_oam 0x8000, 0x9000, 0x8, -53, -48
	banim_frame_oam 0x8000, 0x9000, 0x88, -53, -16
	banim_frame_oam 0x4000, 0x9000, 0xA, 11, -72
	banim_frame_oam 0x4000, 0x9000, 0xE, -21, -72
	banim_frame_oam 0x4000, 0x9000, 0x12, -53, -72
	banim_frame_oam 0x0, 0x5000, 0x16, -69, -72
	banim_frame_oam 0x4000, 0x5000, 0x4A, 11, -56
	banim_frame_oam 0x4000, 0x5000, 0x4E, -21, -56
	banim_frame_oam 0x4000, 0x5000, 0x52, -53, -56
	banim_frame_oam 0x4000, 0x1000, 0x56, -69, -56
	banim_frame_oam 0x4000, 0x5000, 0xEA, -21, 16
	banim_frame_oam 0x4000, 0x1000, 0xEE, -37, 16
	banim_frame_oam 0x8000, 0x1000, 0x6A, 27, -48
	banim_frame_oam 0x8000, 0x5000, 0x6B, -61, -16
	banim_frame_oam 0x4000, 0x1000, 0x6C, -69, -48
	banim_frame_oam 0x8000, 0x1000, 0xAA, -77, -64
	banim_frame_oam 0x0, 0x1000, 0x6E, -37, -80
	banim_frame_oam 0x0, 0x1000, 0x6F, 43, -56
	banim_frame_oam 0x0, 0x1000, 0x70, 27, 8
	banim_frame_oam 0x0, 0x1000, 0x71, -53, 16
	banim_frame_end
banim_fifd_mg1_oam_frame_16_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -37, -40
	banim_frame_oam 0x8000, 0x9000, 0x8, -53, -40
	banim_frame_oam 0x8000, 0x9000, 0x88, -53, -8
	banim_frame_oam 0x0, 0x1000, 0xA, -61, -40
	banim_frame_oam 0x0, 0x9000, 0xB, 11, -80
	banim_frame_oam 0x8000, 0x9000, 0xF, -5, -80
	banim_frame_oam 0x8000, 0x5000, 0x11, -13, -80
	banim_frame_oam 0x4000, 0x5000, 0x8B, 11, -48
	banim_frame_oam 0x4000, 0x1000, 0x8F, -5, -48
	banim_frame_oam 0x0, 0x1000, 0x91, -13, -48
	banim_frame_oam 0x4000, 0xD000, 0x12, -77, -80
	banim_frame_oam 0x4000, 0x5000, 0x92, -45, -48
	banim_frame_oam 0x4000, 0x5000, 0x96, -77, -48
	banim_frame_oam 0x8000, 0x1000, 0x2A, 27, -40
	banim_frame_oam 0x8000, 0x1000, 0xAA, -61, 0
	banim_frame_oam 0x0, 0x1000, 0x6A, 27, 8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x7, 0, -8
	banim_frame_end
	.section .data.oam_r
banim_fifd_mg1_oam_r:
banim_fifd_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0xC000, 0x1, -27, -56
	banim_frame_oam 0x8000, 0x4000, 0x9, 37, -56
	banim_frame_oam 0x8000, 0x4000, 0x89, 37, -24
	banim_frame_oam 0x8000, 0x8000, 0x8A, 45, -48
	banim_frame_oam 0x0, 0x0, 0xE0, 45, -56
	banim_frame_oam 0x8000, 0x8000, 0xA, 61, -48
	banim_frame_oam 0x8000, 0x0, 0x80, 45, -16
	banim_frame_oam 0x0, 0x0, 0xC0, 45, 0
	banim_frame_oam 0x8000, 0x4000, 0x0, -35, -48
	banim_frame_oam 0x4000, 0x8000, 0xC, -27, 8
	banim_frame_oam 0x4000, 0x8000, 0x4C, 5, 8
	banim_frame_oam 0x0, 0x4000, 0x8C, 37, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0xC000, 0x12, -27, -56
	banim_frame_oam 0x8000, 0x8000, 0x1A, 37, -56
	banim_frame_oam 0x8000, 0x8000, 0x9A, 37, -24
	banim_frame_oam 0x8000, 0x8000, 0x8F, 53, -48
	banim_frame_oam 0x8000, 0x4000, 0x91, 69, -48
	banim_frame_oam 0x8000, 0x8000, 0x10, -43, -48
	banim_frame_oam 0x0, 0x4000, 0xCC, 37, 8
	banim_frame_oam 0x8000, 0x0, 0xCE, 53, 8
	banim_frame_oam 0x0, 0x0, 0xBD, 53, 0
	banim_frame_oam 0x4000, 0x8000, 0xDC, 5, 8
	banim_frame_oam 0x4000, 0x4000, 0x9C, -27, 8
	banim_frame_oam 0x4000, 0x0, 0xBE, -11, 16
	banim_frame_oam 0x0, 0x0, 0xBC, -35, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_2_r:
	banim_frame_oam 0x0, 0xC000, 0x2, -27, -56
	banim_frame_oam 0x8000, 0x8000, 0xA, 37, -56
	banim_frame_oam 0x8000, 0x4000, 0xC, 53, -56
	banim_frame_oam 0x8000, 0x8000, 0x8A, 37, -24
	banim_frame_oam 0x8000, 0x4000, 0x8C, 53, -24
	banim_frame_oam 0x4000, 0x8000, 0x4D, -3, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -43, -40
	banim_frame_oam 0x4000, 0x0, 0x40, -43, -24
	banim_frame_oam 0x8000, 0x4000, 0x60, 61, -48
	banim_frame_oam 0x0, 0x0, 0xE0, 61, -16
	banim_frame_oam 0x8000, 0x0, 0xA1, 69, -32
	banim_frame_oam 0x8000, 0x0, 0x61, 29, 8
	banim_frame_oam 0x4000, 0x0, 0x2D, 45, 8
	banim_frame_oam 0x0, 0x0, 0xE1, 45, 16
	banim_frame_oam 0x4000, 0x4000, 0xD, -35, 8
	banim_frame_oam 0x0, 0x0, 0x30, -11, 16
	banim_frame_end
banim_fifd_mg1_oam_frame_3_r:
	banim_frame_oam 0x0, 0xC000, 0x17, -27, -48
	banim_frame_oam 0x4000, 0x8000, 0x11, 21, -72
	banim_frame_oam 0x0, 0x4000, 0x15, 53, -72
	banim_frame_oam 0x4000, 0x4000, 0x51, 21, -56
	banim_frame_oam 0x4000, 0x0, 0x55, 53, -56
	banim_frame_oam 0x4000, 0x8000, 0x71, -43, -72
	banim_frame_oam 0x0, 0x4000, 0x75, -11, -72
	banim_frame_oam 0x4000, 0x4000, 0xB1, -43, -56
	banim_frame_oam 0x4000, 0x0, 0xB5, -11, -56
	banim_frame_oam 0x0, 0x4000, 0xD4, 37, -48
	banim_frame_oam 0x8000, 0x0, 0xD6, 53, -48
	banim_frame_oam 0x8000, 0x0, 0xD3, 69, -56
	banim_frame_oam 0x4000, 0x4000, 0xED, -11, 16
	banim_frame_oam 0x4000, 0x0, 0xF1, 21, 16
	banim_frame_oam 0x0, 0x0, 0xD1, -35, 8
	banim_frame_oam 0x0, 0x0, 0xD2, 37, 8
	banim_frame_oam 0x0, 0x4000, 0xAD, 37, -24
	banim_frame_oam 0x0, 0x0, 0x8D, 37, -32
	banim_frame_oam 0x8000, 0x0, 0xAF, 53, -16
	banim_frame_oam 0x0, 0x0, 0xD0, 53, 0
	banim_frame_oam 0x8000, 0x0, 0x3F, 5, -64
	banim_frame_oam 0x8000, 0x0, 0x7F, -35, -40
	banim_frame_oam 0x4000, 0x0, 0x8F, 29, -80
	banim_frame_oam 0x0, 0x0, 0x8E, -19, -80
	banim_frame_oam 0x0, 0x0, 0xBF, 13, -64
	banim_frame_oam 0x0, 0x0, 0xDF, -43, -48
	banim_frame_end
banim_fifd_mg1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x8000, 0x48, -43, -64
	banim_frame_oam 0x4000, 0x8000, 0x4C, -11, -64
	banim_frame_oam 0x4000, 0x8000, 0x50, 21, -64
	banim_frame_oam 0x0, 0x4000, 0x54, 53, -64
	banim_frame_oam 0x4000, 0x4000, 0x88, -11, 16
	banim_frame_oam 0x4000, 0x0, 0x8C, 21, 16
	banim_frame_oam 0x4000, 0x4000, 0x29, -35, -72
	banim_frame_oam 0x0, 0x0, 0x2D, -3, -72
	banim_frame_oam 0x4000, 0x4000, 0x30, 21, -72
	banim_frame_oam 0x4000, 0x0, 0x34, 53, -72
	banim_frame_oam 0x0, 0x0, 0x9, -19, -80
	banim_frame_oam 0x4000, 0x0, 0xA, 29, -80
	banim_frame_oam 0x4000, 0x4000, 0x12, 37, -48
	banim_frame_oam 0x8000, 0x0, 0xF, -35, -40
	banim_frame_oam 0x0, 0x0, 0x10, 37, -40
	banim_frame_oam 0x0, 0x0, 0x11, 61, -40
	banim_frame_oam 0x0, 0x0, 0xC, -43, -48
	banim_frame_oam 0x0, 0x4000, 0x5E, 37, -24
	banim_frame_oam 0x8000, 0x0, 0x1E, 53, -16
	banim_frame_oam 0x0, 0x0, 0x3F, 37, -32
	banim_frame_oam 0x8000, 0x0, 0x40, 69, -64
	banim_frame_oam 0x0, 0x0, 0x80, 37, 8
	banim_frame_oam 0x0, 0x0, 0xA0, -35, 8
	banim_frame_oam 0x8000, 0xC000, 0x2, -11, -48
	banim_frame_oam 0x8000, 0x8000, 0x6, 21, -48
	banim_frame_oam 0x8000, 0x8000, 0x86, 21, -16
	banim_frame_oam 0x0, 0x4000, 0xC0, -27, 0
	banim_frame_oam 0x0, 0x4000, 0x0, -27, -48
	banim_frame_oam 0x8000, 0x4000, 0x41, -19, -32
	banim_frame_end
banim_fifd_mg1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x4000, 0x90, -11, 16
	banim_frame_oam 0x4000, 0x0, 0x94, 21, 16
	banim_frame_oam 0x4000, 0x8000, 0xC8, -43, -64
	banim_frame_oam 0x4000, 0x8000, 0xCC, -11, -64
	banim_frame_oam 0x4000, 0x8000, 0xD0, 21, -64
	banim_frame_oam 0x0, 0x4000, 0xD4, 53, -64
	banim_frame_oam 0x4000, 0x4000, 0xA8, -35, -72
	banim_frame_oam 0x4000, 0x4000, 0xB1, 21, -72
	banim_frame_oam 0x0, 0x0, 0xB5, 53, -72
	banim_frame_oam 0x4000, 0x4000, 0xAC, 37, -48
	banim_frame_oam 0x0, 0x4000, 0x9E, 37, -8
	banim_frame_oam 0x8000, 0x0, 0xDE, 37, -24
	banim_frame_oam 0x8000, 0x0, 0xDF, 53, -8
	banim_frame_oam 0x8000, 0x0, 0xE, 69, -64
	banim_frame_oam 0x8000, 0xC000, 0x17, -19, -48
	banim_frame_oam 0x8000, 0x8000, 0x1B, 13, -48
	banim_frame_oam 0x8000, 0x4000, 0x1D, 29, -48
	banim_frame_oam 0x8000, 0x8000, 0x9B, 13, -16
	banim_frame_oam 0x8000, 0x4000, 0x9D, 29, -16
	banim_frame_oam 0x8000, 0x0, 0xD6, -27, 0
	banim_frame_oam 0x8000, 0x0, 0x16, -27, -48
	banim_frame_oam 0x8000, 0x0, 0x56, -35, -48
	banim_frame_oam 0x0, 0x0, 0x96, -35, -32
	banim_frame_oam 0x0, 0x0, 0xB6, 37, -40
	banim_frame_oam 0x0, 0x0, 0xB0, -51, -56
	banim_frame_oam 0x0, 0x0, 0x8F, 61, 0
	banim_frame_oam 0x0, 0x0, 0x8E, 37, 8
	banim_frame_oam 0x0, 0x0, 0xD, -35, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_6_r:
	banim_frame_oam 0x0, 0xC000, 0x1, -19, -40
	banim_frame_oam 0x0, 0x4000, 0xC9, 45, 8
	banim_frame_oam 0x8000, 0x8000, 0x29, 45, -32
	banim_frame_oam 0x0, 0x0, 0x9, 45, -40
	banim_frame_oam 0x8000, 0x0, 0x0, -27, -40
	banim_frame_oam 0x8000, 0x4000, 0x60, -27, -16
	banim_frame_oam 0x0, 0x0, 0xE0, -27, 16
	banim_frame_oam 0x0, 0x0, 0x40, -35, 8
	banim_frame_oam 0x0, 0x0, 0xA, -35, -8
	banim_frame_oam 0x4000, 0x8000, 0xB, -43, -56
	banim_frame_oam 0x0, 0x4000, 0xF, -11, -56
	banim_frame_oam 0x0, 0x0, 0x31, 5, -48
	banim_frame_oam 0x4000, 0x0, 0xA9, 13, -48
	banim_frame_oam 0x0, 0x0, 0x11, 13, -56
	banim_frame_oam 0x8000, 0x4000, 0x4B, 61, -32
	banim_frame_oam 0x0, 0x4000, 0x8C, 69, -16
	banim_frame_oam 0x0, 0x0, 0x6C, 69, -24
	banim_frame_oam 0x8000, 0x0, 0x4D, -35, -40
	banim_frame_oam 0x4000, 0x0, 0xCB, -27, -64
	banim_frame_oam 0x0, 0x0, 0xCD, -11, -64
	banim_frame_oam 0x8000, 0x0, 0x4E, -51, -64
	banim_frame_end
banim_fifd_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0xC000, 0x12, -27, -40
	banim_frame_oam 0x8000, 0x8000, 0x1A, 37, -40
	banim_frame_oam 0x8000, 0x8000, 0x9A, 37, -8
	banim_frame_oam 0x8000, 0x8000, 0x1C, 53, -32
	banim_frame_oam 0x0, 0x4000, 0x5E, 69, -16
	banim_frame_oam 0x4000, 0x8000, 0x8E, -27, -56
	banim_frame_oam 0x0, 0x4000, 0x4F, -43, -48
	banim_frame_oam 0x0, 0x0, 0x51, -35, -32
	banim_frame_oam 0x0, 0x0, 0x71, -35, -56
	banim_frame_oam 0x0, 0x0, 0xD1, -51, -48
	banim_frame_oam 0x8000, 0x0, 0xD0, 13, -56
	banim_frame_oam 0x0, 0x0, 0xF1, 21, -48
	banim_frame_oam 0x8000, 0x0, 0xCF, -35, -8
	banim_frame_oam 0x0, 0x0, 0xCE, -35, 8
	banim_frame_oam 0x0, 0x0, 0xEE, 53, 16
	banim_frame_end
banim_fifd_mg1_oam_frame_8_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -27, -48
	banim_frame_oam 0x8000, 0x8000, 0x8, 37, -48
	banim_frame_oam 0x8000, 0x8000, 0x88, 37, -16
	banim_frame_oam 0x4000, 0x4000, 0xEA, -19, 16
	banim_frame_oam 0x4000, 0x4000, 0xEE, 13, 16
	banim_frame_oam 0x8000, 0x0, 0xB, -35, -48
	banim_frame_oam 0x0, 0x0, 0x4B, -35, -32
	banim_frame_oam 0x0, 0x0, 0x2A, -43, -40
	banim_frame_oam 0x0, 0x0, 0xA, 53, -48
	banim_frame_oam 0x0, 0x4000, 0x6A, 53, -40
	banim_frame_oam 0x4000, 0x0, 0xAA, 53, -24
	banim_frame_oam 0x0, 0x0, 0xCA, 53, -16
	banim_frame_oam 0x8000, 0x0, 0x8C, 69, -32
	banim_frame_oam 0x0, 0x0, 0xCC, 69, -16
	banim_frame_oam 0x0, 0x0, 0xCB, 53, -8
	banim_frame_oam 0x0, 0x0, 0x6C, 13, -56
	banim_frame_oam 0x0, 0x0, 0x4C, -35, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_9_r:
	banim_frame_oam 0x0, 0xC000, 0x12, -19, -48
	banim_frame_oam 0x8000, 0x4000, 0x1A, 45, -48
	banim_frame_oam 0x8000, 0x4000, 0x9A, 45, -16
	banim_frame_oam 0x8000, 0x8000, 0x6D, 53, -48
	banim_frame_oam 0x8000, 0x4000, 0x6F, 69, -48
	banim_frame_oam 0x4000, 0x4000, 0xC, -19, -56
	banim_frame_oam 0x8000, 0x8000, 0x10, -35, -48
	banim_frame_oam 0x8000, 0x0, 0x2F, -43, -40
	banim_frame_oam 0x0, 0x0, 0xD1, 13, -56
	banim_frame_oam 0x4000, 0x0, 0x2C, 37, -56
	banim_frame_oam 0x8000, 0x0, 0x91, -27, 0
	banim_frame_oam 0x8000, 0x0, 0x90, -27, -16
	banim_frame_oam 0x4000, 0x4000, 0xFB, -19, 16
	banim_frame_oam 0x0, 0x0, 0xFF, 13, 16
	banim_frame_oam 0x4000, 0x4000, 0xDC, 21, 16
	banim_frame_end
banim_fifd_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fifd_mg1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fifd_mg1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fifd_mg1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_fifd_mg1_oam_frame_14_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -27, -48
	banim_frame_oam 0x8000, 0x8000, 0x88, 37, -16
	banim_frame_oam 0x0, 0x4000, 0x8, 37, -48
	banim_frame_oam 0x0, 0x0, 0x68, 37, -24
	banim_frame_oam 0x0, 0x0, 0x48, 45, 16
	banim_frame_oam 0x4000, 0x8000, 0xA, -35, -72
	banim_frame_oam 0x4000, 0x8000, 0xE, -3, -72
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, -56
	banim_frame_oam 0x4000, 0x4000, 0x4E, -3, -56
	banim_frame_oam 0x4000, 0x8000, 0x6A, 29, -72
	banim_frame_oam 0x4000, 0x4000, 0xAA, 29, -56
	banim_frame_oam 0x0, 0x4000, 0xCC, -51, -64
	banim_frame_oam 0x0, 0x4000, 0xCA, 61, -64
	banim_frame_oam 0x4000, 0x4000, 0xEE, -11, 16
	banim_frame_oam 0x4000, 0x0, 0xF2, 21, 16
	banim_frame_oam 0x8000, 0x0, 0x6E, -35, -48
	banim_frame_oam 0x0, 0x0, 0xAE, -35, -32
	banim_frame_oam 0x4000, 0x0, 0x6F, 53, -48
	banim_frame_oam 0x8000, 0x4000, 0x71, 53, -16
	banim_frame_oam 0x0, 0x0, 0x49, -35, 8
	banim_frame_end
banim_fifd_mg1_oam_frame_15_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -27, -48
	banim_frame_oam 0x8000, 0x8000, 0x8, 37, -48
	banim_frame_oam 0x8000, 0x8000, 0x88, 37, -16
	banim_frame_oam 0x4000, 0x8000, 0xA, -43, -72
	banim_frame_oam 0x4000, 0x8000, 0xE, -11, -72
	banim_frame_oam 0x4000, 0x8000, 0x12, 21, -72
	banim_frame_oam 0x0, 0x4000, 0x16, 53, -72
	banim_frame_oam 0x4000, 0x4000, 0x4A, -43, -56
	banim_frame_oam 0x4000, 0x4000, 0x4E, -11, -56
	banim_frame_oam 0x4000, 0x4000, 0x52, 21, -56
	banim_frame_oam 0x4000, 0x0, 0x56, 53, -56
	banim_frame_oam 0x4000, 0x4000, 0xEA, -11, 16
	banim_frame_oam 0x4000, 0x0, 0xEE, 21, 16
	banim_frame_oam 0x8000, 0x0, 0x6A, -35, -48
	banim_frame_oam 0x8000, 0x4000, 0x6B, 53, -16
	banim_frame_oam 0x4000, 0x0, 0x6C, 53, -48
	banim_frame_oam 0x8000, 0x0, 0xAA, 69, -64
	banim_frame_oam 0x0, 0x0, 0x6E, 29, -80
	banim_frame_oam 0x0, 0x0, 0x6F, -51, -56
	banim_frame_oam 0x0, 0x0, 0x70, -35, 8
	banim_frame_oam 0x0, 0x0, 0x71, 45, 16
	banim_frame_end
banim_fifd_mg1_oam_frame_16_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -27, -40
	banim_frame_oam 0x8000, 0x8000, 0x8, 37, -40
	banim_frame_oam 0x8000, 0x8000, 0x88, 37, -8
	banim_frame_oam 0x0, 0x0, 0xA, 53, -40
	banim_frame_oam 0x0, 0x8000, 0xB, -43, -80
	banim_frame_oam 0x8000, 0x8000, 0xF, -11, -80
	banim_frame_oam 0x8000, 0x4000, 0x11, 5, -80
	banim_frame_oam 0x4000, 0x4000, 0x8B, -43, -48
	banim_frame_oam 0x4000, 0x0, 0x8F, -11, -48
	banim_frame_oam 0x0, 0x0, 0x91, 5, -48
	banim_frame_oam 0x4000, 0xC000, 0x12, 13, -80
	banim_frame_oam 0x4000, 0x4000, 0x92, 13, -48
	banim_frame_oam 0x4000, 0x4000, 0x96, 45, -48
	banim_frame_oam 0x8000, 0x0, 0x2A, -35, -40
	banim_frame_oam 0x8000, 0x0, 0xAA, 53, 0
	banim_frame_oam 0x0, 0x0, 0x6A, -35, 8
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x7, -8, -8
	banim_frame_end
	.section .data.script
banim_fifd_mg1_script:
banim_fifd_mg1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_frame 8, banim_fifd_mg1_sheet_0, 1, banim_fifd_mg1_oam_frame_1_r - banim_fifd_mg1_oam_r
	banim_code_frame 6, banim_fifd_mg1_sheet_1, 2, banim_fifd_mg1_oam_frame_2_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_1, 3, banim_fifd_mg1_oam_frame_3_r - banim_fifd_mg1_oam_r
	banim_code_frame 20, banim_fifd_mg1_sheet_2, 4, banim_fifd_mg1_oam_frame_4_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_2, 5, banim_fifd_mg1_oam_frame_5_r - banim_fifd_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_fifd_mg1_sheet_3, 6, banim_fifd_mg1_oam_frame_6_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_3, 7, banim_fifd_mg1_oam_frame_7_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_fifd_mg1_sheet_4, 8, banim_fifd_mg1_oam_frame_8_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fifd_mg1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_frame 8, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_frame 6, banim_fifd_mg1_sheet_1, 11, banim_fifd_mg1_oam_frame_11_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_1, 11, banim_fifd_mg1_oam_frame_11_r - banim_fifd_mg1_oam_r
	banim_code_frame 20, banim_fifd_mg1_sheet_2, 12, banim_fifd_mg1_oam_frame_12_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_2, 12, banim_fifd_mg1_oam_frame_12_r - banim_fifd_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_fifd_mg1_sheet_3, 13, banim_fifd_mg1_oam_frame_13_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_3, 13, banim_fifd_mg1_oam_frame_13_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fifd_mg1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_frame 8, banim_fifd_mg1_sheet_0, 1, banim_fifd_mg1_oam_frame_1_r - banim_fifd_mg1_oam_r
	banim_code_frame 6, banim_fifd_mg1_sheet_1, 2, banim_fifd_mg1_oam_frame_2_r - banim_fifd_mg1_oam_r
	banim_code_sound_manakete_critical
	banim_code_frame 2, banim_fifd_mg1_sheet_5, 14, banim_fifd_mg1_oam_frame_14_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_6, 15, banim_fifd_mg1_oam_frame_15_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_5, 14, banim_fifd_mg1_oam_frame_14_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_6, 15, banim_fifd_mg1_oam_frame_15_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_5, 14, banim_fifd_mg1_oam_frame_14_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_6, 15, banim_fifd_mg1_oam_frame_15_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_5, 14, banim_fifd_mg1_oam_frame_14_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_6, 15, banim_fifd_mg1_oam_frame_15_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_1, 3, banim_fifd_mg1_oam_frame_3_r - banim_fifd_mg1_oam_r
	banim_code_frame 20, banim_fifd_mg1_sheet_2, 4, banim_fifd_mg1_oam_frame_4_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_2, 5, banim_fifd_mg1_oam_frame_5_r - banim_fifd_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_fifd_mg1_sheet_3, 6, banim_fifd_mg1_oam_frame_6_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_3, 7, banim_fifd_mg1_oam_frame_7_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_fifd_mg1_sheet_4, 8, banim_fifd_mg1_oam_frame_8_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fifd_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_frame 8, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_frame 6, banim_fifd_mg1_sheet_1, 11, banim_fifd_mg1_oam_frame_11_r - banim_fifd_mg1_oam_r
	banim_code_sound_manakete_critical
	banim_code_frame 2, banim_fifd_mg1_sheet_1, 11, banim_fifd_mg1_oam_frame_11_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_3, 13, banim_fifd_mg1_oam_frame_13_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_1, 11, banim_fifd_mg1_oam_frame_11_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_3, 13, banim_fifd_mg1_oam_frame_13_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_1, 11, banim_fifd_mg1_oam_frame_11_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_3, 13, banim_fifd_mg1_oam_frame_13_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_1, 11, banim_fifd_mg1_oam_frame_11_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_3, 13, banim_fifd_mg1_oam_frame_13_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_1, 11, banim_fifd_mg1_oam_frame_11_r - banim_fifd_mg1_oam_r
	banim_code_frame 20, banim_fifd_mg1_sheet_2, 12, banim_fifd_mg1_oam_frame_12_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_2, 12, banim_fifd_mg1_oam_frame_12_r - banim_fifd_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_fifd_mg1_sheet_3, 13, banim_fifd_mg1_oam_frame_13_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_3, 13, banim_fifd_mg1_oam_frame_13_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 10, banim_fifd_mg1_oam_frame_10_r - banim_fifd_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fifd_mg1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_frame 8, banim_fifd_mg1_sheet_0, 1, banim_fifd_mg1_oam_frame_1_r - banim_fifd_mg1_oam_r
	banim_code_frame 6, banim_fifd_mg1_sheet_1, 2, banim_fifd_mg1_oam_frame_2_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_1, 3, banim_fifd_mg1_oam_frame_3_r - banim_fifd_mg1_oam_r
	banim_code_frame 20, banim_fifd_mg1_sheet_2, 4, banim_fifd_mg1_oam_frame_4_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_2, 5, banim_fifd_mg1_oam_frame_5_r - banim_fifd_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_fifd_mg1_sheet_3, 6, banim_fifd_mg1_oam_frame_6_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_3, 7, banim_fifd_mg1_oam_frame_7_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_fifd_mg1_sheet_4, 8, banim_fifd_mg1_oam_frame_8_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fifd_mg1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_frame 8, banim_fifd_mg1_sheet_0, 1, banim_fifd_mg1_oam_frame_1_r - banim_fifd_mg1_oam_r
	banim_code_frame 6, banim_fifd_mg1_sheet_1, 2, banim_fifd_mg1_oam_frame_2_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_5, 14, banim_fifd_mg1_oam_frame_14_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_6, 15, banim_fifd_mg1_oam_frame_15_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_5, 14, banim_fifd_mg1_oam_frame_14_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_6, 15, banim_fifd_mg1_oam_frame_15_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_5, 14, banim_fifd_mg1_oam_frame_14_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_6, 15, banim_fifd_mg1_oam_frame_15_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_5, 14, banim_fifd_mg1_oam_frame_14_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_6, 15, banim_fifd_mg1_oam_frame_15_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_1, 3, banim_fifd_mg1_oam_frame_3_r - banim_fifd_mg1_oam_r
	banim_code_frame 20, banim_fifd_mg1_sheet_2, 4, banim_fifd_mg1_oam_frame_4_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_2, 5, banim_fifd_mg1_oam_frame_5_r - banim_fifd_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_fifd_mg1_sheet_3, 6, banim_fifd_mg1_oam_frame_6_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_3, 7, banim_fifd_mg1_oam_frame_7_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_fifd_mg1_sheet_4, 8, banim_fifd_mg1_oam_frame_8_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fifd_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_fifd_mg1_sheet_0, 1, banim_fifd_mg1_oam_frame_1_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_1, 2, banim_fifd_mg1_oam_frame_2_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_7, 16, banim_fifd_mg1_oam_frame_16_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fifd_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_fifd_mg1_sheet_0, 1, banim_fifd_mg1_oam_frame_1_r - banim_fifd_mg1_oam_r
	banim_code_frame 2, banim_fifd_mg1_sheet_1, 2, banim_fifd_mg1_oam_frame_2_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_7, 16, banim_fifd_mg1_oam_frame_16_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_fifd_mg1_mode_stand_close:
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_fifd_mg1_mode_stand:
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_fifd_mg1_mode_stand_range:
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_fifd_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_frame 8, banim_fifd_mg1_sheet_0, 1, banim_fifd_mg1_oam_frame_1_r - banim_fifd_mg1_oam_r
	banim_code_frame 6, banim_fifd_mg1_sheet_1, 2, banim_fifd_mg1_oam_frame_2_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_1, 3, banim_fifd_mg1_oam_frame_3_r - banim_fifd_mg1_oam_r
	banim_code_frame 20, banim_fifd_mg1_sheet_2, 4, banim_fifd_mg1_oam_frame_4_r - banim_fifd_mg1_oam_r
	banim_code_frame 3, banim_fifd_mg1_sheet_2, 5, banim_fifd_mg1_oam_frame_5_r - banim_fifd_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_fifd_mg1_sheet_3, 6, banim_fifd_mg1_oam_frame_6_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_3, 7, banim_fifd_mg1_oam_frame_7_r - banim_fifd_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_fifd_mg1_sheet_4, 8, banim_fifd_mg1_oam_frame_8_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_fifd_mg1_sheet_4, 9, banim_fifd_mg1_oam_frame_9_r - banim_fifd_mg1_oam_r
	banim_code_frame 1, banim_fifd_mg1_sheet_0, 0, banim_fifd_mg1_oam_frame_0_r - banim_fifd_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_fifd_mg1_mode_attack_close - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_attack_close_back - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_attack_close_critical - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_attack_close_critical_back - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_attack_range - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_attack_range_critical - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_dodge_close - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_dodge_range - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_stand_close - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_stand - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_stand_range - banim_fifd_mg1_script
	.word banim_fifd_mg1_mode_attack_miss - banim_fifd_mg1_script
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

