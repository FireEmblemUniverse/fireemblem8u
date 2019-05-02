@ vim:ft=armv4
	.global banim_grkm_ax1_3_script
	.global banim_grkm_ax1_3_oam_r
	.global banim_grkm_ax1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x54
	.section .data.oam_l
banim_grkm_ax1_3_oam_l:
banim_grkm_ax1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x65, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0xE1, 8, -48
	banim_frame_oam 0x0, 0x1000, 0x5, 24, -24
	banim_frame_end
banim_grkm_ax1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0xA, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x8A, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE7, 0, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xD, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x11, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x8D, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x91, -24, 0
	banim_frame_oam 0x8000, 0x5000, 0x4C, 16, -24
	banim_frame_oam 0x4000, 0x1000, 0xE9, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xC, 16, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x13, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x17, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x97, -24, 0
	banim_frame_oam 0x8000, 0x5000, 0x52, 16, -24
	banim_frame_oam 0x8000, 0x1000, 0x12, 16, -40
	banim_frame_oam 0x4000, 0x1000, 0xFD, 0, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x99, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x9D, -24, 0
	banim_frame_oam 0x8000, 0x5000, 0x58, 16, -24
	banim_frame_oam 0x8000, 0x1000, 0x18, 16, -40
	banim_frame_oam 0x4000, 0x1000, 0x3E, 0, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xD7, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xDB, -24, 0
	banim_frame_oam 0x4000, 0x9000, 0xD1, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xD5, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0xCC, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0xD0, -16, -32
	banim_frame_oam 0x8000, 0x1000, 0x7F, 24, -24
	banim_frame_oam 0x0, 0x1000, 0x9E, -8, -40
	banim_frame_oam 0x0, 0x5000, 0xBE, 0, -48
	banim_frame_oam 0x0, 0x1000, 0x5E, 16, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, 8, -48
	banim_frame_oam 0x0, 0x1000, 0xE2, 0, -40
	banim_frame_oam 0x0, 0x1000, 0xE3, -24, 8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 8, -40
	banim_frame_oam 0x8000, 0x9000, 0xA, -8, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, 8, -8
	banim_frame_oam 0x0, 0x5000, 0x8A, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE7, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, 16, -48
	banim_frame_oam 0x0, 0x1000, 0xE4, 8, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 8, -40
	banim_frame_oam 0x8000, 0x5000, 0x10, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x8C, 8, -8
	banim_frame_oam 0x8000, 0x1000, 0x90, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xCC, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xD0, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0x11, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x51, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xB1, 40, -24
	banim_frame_oam 0x0, 0x5000, 0x12, 48, 0
	banim_frame_oam 0x8000, 0x1000, 0x14, 40, 0
	banim_frame_oam 0x4000, 0x1000, 0xED, 24, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x15, 8, -40
	banim_frame_oam 0x8000, 0x5000, 0x19, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x95, 8, -8
	banim_frame_oam 0x8000, 0x1000, 0x99, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xD5, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xD9, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0x94, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xD4, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x52, 48, 0
	banim_frame_oam 0x8000, 0x1000, 0x54, 40, 0
	banim_frame_oam 0x4000, 0x1000, 0xF6, 24, -48
	banim_frame_oam 0x0, 0x1000, 0xF8, 16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x2, 8, -40
	banim_frame_oam 0x0, 0x5000, 0x80, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x82, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0xC0, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xC2, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x83, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC3, 0, 8
	banim_frame_oam 0x0, 0x5000, 0x4, 8, -56
	banim_frame_oam 0x0, 0x5000, 0x43, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x84, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0x86, 32, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, 32, 8
	banim_frame_oam 0x0, 0x1000, 0x66, 32, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x2, 8, -40
	banim_frame_oam 0x0, 0x5000, 0x80, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x82, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0xC0, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xC2, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x83, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC3, 0, 8
	banim_frame_oam 0x0, 0x5000, 0x4, 8, -56
	banim_frame_oam 0x8000, 0x1000, 0x45, 0, -24
	banim_frame_oam 0x4000, 0x9000, 0x27, 32, 0
	banim_frame_oam 0x0, 0x1000, 0xA, 56, -8
	banim_frame_oam 0x4000, 0x1000, 0x8, 32, 16
	banim_frame_oam 0x8000, 0x1000, 0x66, 32, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0xB, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x8B, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xCB, 8, 8
	banim_frame_oam 0x8000, 0x5000, 0x4F, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xCF, 0, 8
	banim_frame_oam 0x0, 0x5000, 0x88, 48, -8
	banim_frame_oam 0x8000, 0x1000, 0x8A, 40, -8
	banim_frame_oam 0x4000, 0x1000, 0xC8, 48, 8
	banim_frame_oam 0x0, 0x1000, 0xCA, 40, 8
	banim_frame_oam 0x4000, 0x1000, 0x68, 32, 16
	banim_frame_oam 0x8000, 0x1000, 0x6A, 40, -16
	banim_frame_oam 0x0, 0x5000, 0xF, 8, -56
	banim_frame_oam 0x0, 0x1000, 0xEB, 24, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x6C, 0, -16
	banim_frame_oam 0x8000, 0x9000, 0x70, 32, -16
	banim_frame_oam 0x4000, 0x9000, 0xB, 8, -40
	banim_frame_oam 0x4000, 0x5000, 0x4B, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x4F, 0, -24
	banim_frame_oam 0x0, 0x5000, 0xF, 8, -56
	banim_frame_oam 0x0, 0x1000, 0xEB, 24, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, 24, -48
	banim_frame_oam 0x8000, 0x5000, 0x14, 16, -48
	banim_frame_oam 0x8000, 0x9000, 0x92, 24, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x55, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0xD5, 8, 0
	banim_frame_oam 0x8000, 0x5000, 0x36, 40, -16
	banim_frame_oam 0x8000, 0x1000, 0xB6, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xF6, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x15, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0xEE, 16, -56
	banim_frame_oam 0x0, 0x1000, 0xF0, 8, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_12_l:
	banim_frame_oam 0x8000, 0xD000, 0x1A, 16, -48
	banim_frame_oam 0x8000, 0x9000, 0x5E, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0xDE, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0xDF, 48, -8
	banim_frame_oam 0x0, 0x1000, 0x1E, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0xF2, 16, -56
	banim_frame_oam 0x0, 0x1000, 0xF4, 8, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x39, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0xB9, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0x18, 8, -32
	banim_frame_oam 0x0, 0x5000, 0xD7, 24, -48
	banim_frame_oam 0x8000, 0x1000, 0xD9, 16, -48
	banim_frame_oam 0x8000, 0x9000, 0x37, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xB7, 32, 8
	banim_frame_oam 0x8000, 0x1000, 0xDA, 48, -16
	banim_frame_oam 0x0, 0x1000, 0x1D, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0xFD, 16, -56
	banim_frame_oam 0x0, 0x1000, 0xFF, 8, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0x39, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0xB9, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0x18, 8, -32
	banim_frame_oam 0x0, 0x5000, 0xD7, 24, -48
	banim_frame_oam 0x8000, 0x1000, 0xD9, 16, -48
	banim_frame_oam 0x8000, 0x9000, 0x3D, 40, -24
	banim_frame_oam 0x8000, 0x5000, 0x3F, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xBD, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xBF, 32, 8
	banim_frame_oam 0x4000, 0x1000, 0xFD, 16, -56
	banim_frame_oam 0x0, 0x1000, 0xFF, 8, -56
	banim_frame_oam 0x0, 0x1000, 0x1D, 8, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x44, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x84, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x4, 16, -56
	banim_frame_oam 0x0, 0x5000, 0xA4, 40, -24
	banim_frame_oam 0x8000, 0x1000, 0x45, 40, 0
	banim_frame_oam 0x0, 0x1000, 0xE1, 8, -56
	banim_frame_oam 0x0, 0x1000, 0xE2, 8, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xAB, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xE8, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0xE6, 16, -56
	banim_frame_oam 0x8000, 0x9000, 0xA, 40, -24
	banim_frame_oam 0x4000, 0x1000, 0x8A, 40, 8
	banim_frame_oam 0x8000, 0x1000, 0xAA, 56, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_17_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x10, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x8C, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x90, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x12, 48, 8
	banim_frame_oam 0x0, 0x1000, 0x32, 24, -40
	banim_frame_oam 0x0, 0x5000, 0x1A, 48, -16
	banim_frame_oam 0x4000, 0x1000, 0x5A, 48, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0xCC, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0xD0, 8, -32
	banim_frame_oam 0x4000, 0x1000, 0xF1, 24, -40
	banim_frame_oam 0x8000, 0x9000, 0x4E, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x50, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x8000, 0x5000, 0x74, 32, -16
	banim_frame_oam 0x8000, 0x5000, 0x73, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xD2, 48, 8
	banim_frame_oam 0x0, 0x5000, 0x1C, 48, -16
	banim_frame_oam 0x4000, 0x1000, 0x5C, 48, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x9000, 0x4E, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x50, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0x15, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0x19, 8, -32
	banim_frame_oam 0x0, 0x1000, 0x59, 24, -40
	banim_frame_oam 0x8000, 0x5000, 0x58, 32, -16
	banim_frame_oam 0x8000, 0x5000, 0x57, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xB6, 48, 8
	banim_frame_oam 0x0, 0x5000, 0x1C, 48, -16
	banim_frame_oam 0x4000, 0x1000, 0x5C, 48, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0x7A, 48, -16
	banim_frame_oam 0x4000, 0x1000, 0xBA, 48, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0x7C, 48, -16
	banim_frame_oam 0x4000, 0x1000, 0xBC, 48, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0x7C, 48, -16
	banim_frame_oam 0x4000, 0x1000, 0xBC, 48, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_65_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x10, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x8C, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x90, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x14, 48, -16
	banim_frame_oam 0x0, 0x1000, 0x54, 48, 0
	banim_frame_oam 0x0, 0x1000, 0x12, 48, 8
	banim_frame_oam 0x0, 0x1000, 0x32, 24, -40
	banim_frame_oam 0x8000, 0x1000, 0x33, 56, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_66_l:
	banim_frame_oam 0x4000, 0x9000, 0xCC, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0xD0, 8, -32
	banim_frame_oam 0x4000, 0x1000, 0xF1, 24, -40
	banim_frame_oam 0x8000, 0x9000, 0x4E, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x50, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x8000, 0x5000, 0x74, 32, -16
	banim_frame_oam 0x8000, 0x9000, 0x71, 48, -16
	banim_frame_oam 0x8000, 0x5000, 0x73, 40, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_67_l:
	banim_frame_oam 0x8000, 0x9000, 0x4E, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x50, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0x15, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0x19, 8, -32
	banim_frame_oam 0x0, 0x1000, 0x59, 24, -40
	banim_frame_oam 0x8000, 0x5000, 0x58, 32, -16
	banim_frame_oam 0x8000, 0x9000, 0x55, 48, -16
	banim_frame_oam 0x8000, 0x5000, 0x57, 40, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 16, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 16, 0
	banim_frame_oam 0x0, 0x5000, 0x84, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0xC2, 48, -16
	banim_frame_oam 0x4000, 0x1000, 0xC0, 16, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 16, -32
	banim_frame_oam 0x8000, 0x9000, 0xA, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, 16, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xC6, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xC8, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xC9, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xCA, 48, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 16, -32
	banim_frame_oam 0x8000, 0x9000, 0x10, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0x12, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x8C, 16, 0
	banim_frame_oam 0x0, 0x5000, 0x90, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x92, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xCC, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xCE, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xCF, 48, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x13, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0x17, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x97, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xD2, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xD4, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xD7, -16, -24
	banim_frame_oam 0x0, 0x5000, 0xD5, 32, -24
	banim_frame_end
banim_grkm_ax1_3_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x18, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x1C, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x98, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x9C, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xDC, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x3E, 32, -24
	banim_frame_end
banim_grkm_ax1_3_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x4, 16, -24
	banim_frame_oam 0x0, 0x5000, 0x44, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xE1, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xE2, -24, -32
	banim_frame_end
banim_grkm_ax1_3_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0xA, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8A, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCA, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x84, -32, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xF, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8B, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8F, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xAB, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xAD, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xAE, -32, -8
	banim_frame_oam 0x0, 0x1000, 0xEE, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0xAF, -40, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0xB1, -40, -8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -40, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, -8, -32
	banim_frame_oam 0x0, 0x9000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x15, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x95, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xD3, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xB5, 16, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x1B, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x9B, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xB7, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xB9, -16, -40
	banim_frame_oam 0x0, 0x5000, 0xBB, -40, -8
	banim_frame_oam 0x4000, 0x1000, 0xFB, -40, 8
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 16
	banim_frame_oam 0x8000, 0x1000, 0xB6, 24, -24
	banim_frame_oam 0x0, 0x5000, 0x1D, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0x5D, 8, -32
	banim_frame_end
banim_grkm_ax1_3_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_31_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_32_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x84, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x20, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x24, -16, -40
	banim_frame_oam 0x4000, 0x5000, 0x60, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x64, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x66, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x6A, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xE6, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x5, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x46, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x4A, -16, -32
	banim_frame_oam 0x8000, 0x1000, 0x9, 24, -24
	banim_frame_oam 0x4000, 0x1000, 0x26, 16, -40
	banim_frame_oam 0x0, 0x1000, 0x28, 8, -40
	banim_frame_oam 0x0, 0x1000, 0x2A, 24, -32
	banim_frame_end
banim_grkm_ax1_3_oam_frame_39_l:
	banim_frame_oam 0x0, 0x9000, 0x6B, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x6F, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xEB, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xB, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0xE, 24, -24
	banim_frame_oam 0x0, 0x5000, 0xC, -16, -48
	banim_frame_oam 0x4000, 0x1000, 0x4C, -16, -32
	banim_frame_oam 0x8000, 0x1000, 0x2B, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xF, -24, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_40_l:
	banim_frame_oam 0x0, 0x5000, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x94, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x51, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0xCB, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xCF, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x90, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x6B, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xAB, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0xE, 24, -24
	banim_frame_oam 0x0, 0x5000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x34, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x74, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x13, -16, -48
	banim_frame_oam 0x0, 0x1000, 0x11, -16, -56
	banim_frame_oam 0x8000, 0x1000, 0x10, -24, -56
	banim_frame_oam 0x0, 0x1000, 0x50, -24, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_41_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0x95, 8, 8
	banim_frame_oam 0x8000, 0x9000, 0x19, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x99, -24, 8
	banim_frame_oam 0x0, 0x5000, 0x57, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x97, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x18, 24, -24
	banim_frame_oam 0x8000, 0x9000, 0x12, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x14, -16, -48
	banim_frame_oam 0x0, 0x1000, 0x54, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x11, -16, -56
	banim_frame_oam 0x0, 0x1000, 0x51, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0x10, -24, -56
	banim_frame_oam 0x0, 0x1000, 0x50, -24, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_42_l:
	banim_frame_oam 0x4000, 0x9000, 0xB5, -8, -8
	banim_frame_oam 0x0, 0x5000, 0xB9, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xF5, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xD1, 8, -24
	banim_frame_oam 0x0, 0x5000, 0xD3, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x18, 24, -24
	banim_frame_oam 0x8000, 0x9000, 0x12, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x14, -16, -48
	banim_frame_oam 0x0, 0x1000, 0x54, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x11, -16, -56
	banim_frame_oam 0x0, 0x1000, 0x51, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0x10, -24, -56
	banim_frame_oam 0x0, 0x1000, 0x50, -24, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_43_l:
	banim_frame_oam 0x8000, 0x9000, 0x3B, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xBB, 8, 8
	banim_frame_oam 0x8000, 0x5000, 0x3F, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xBF, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x7D, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xBD, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0xDF, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xDE, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xDD, 24, -24
	banim_frame_oam 0x8000, 0x9000, 0x12, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x14, -16, -48
	banim_frame_oam 0x0, 0x1000, 0x54, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x11, -16, -56
	banim_frame_oam 0x0, 0x1000, 0x51, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0x10, -24, -56
	banim_frame_oam 0x0, 0x1000, 0x50, -24, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x25, -24, -16
	banim_frame_oam 0x0, 0x5000, 0xC0, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xC2, -16, -40
	banim_frame_oam 0x0, 0x1000, 0xA0, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xA1, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xA2, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0xA4, -16, -48
	banim_frame_oam 0x0, 0x1000, 0xA6, -24, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_45_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0xA, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x86, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x8A, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x2B, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xB, -24, 8
	banim_frame_oam 0x0, 0x5000, 0x1D, 24, -48
	banim_frame_oam 0x8000, 0x1000, 0x1F, 16, -48
	banim_frame_oam 0x4000, 0x1000, 0x5D, 24, -32
	banim_frame_oam 0x0, 0x1000, 0x5F, 16, -32
	banim_frame_oam 0x0, 0x5000, 0xC5, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xC7, -8, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 8, -32
	banim_frame_oam 0x8000, 0x9000, 0x10, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x8C, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x90, -8, 0
	banim_frame_oam 0x4000, 0x5000, 0xC9, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xCD, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xC8, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xA9, 24, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0x12, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x16, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x92, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x96, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xD2, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xD1, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xCE, 48, 0
	banim_frame_oam 0x8000, 0x1000, 0xD0, 40, 0
	banim_frame_oam 0x4000, 0x5000, 0xF2, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xF6, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xD5, 40, -24
	banim_frame_oam 0x0, 0x1000, 0xD6, 40, -16
	banim_frame_oam 0x4000, 0x1000, 0xFD, 32, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_48_l:
	banim_frame_oam 0x0, 0x9000, 0x17, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x1B, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x97, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x9B, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xD7, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xDB, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x1C, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x5C, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x7C, 56, 0
	banim_frame_oam 0x8000, 0x1000, 0x7E, 48, 0
	banim_frame_oam 0x4000, 0x1000, 0xF8, 32, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_49_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 16, -48
	banim_frame_oam 0x8000, 0x9000, 0x80, 16, -16
	banim_frame_oam 0x8000, 0x9000, 0x2, 0, -32
	banim_frame_oam 0x0, 0x5000, 0x82, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x24, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xC2, 32, -16
	banim_frame_oam 0x8000, 0x1000, 0xC3, 32, 0
	banim_frame_oam 0x8000, 0x1000, 0xA6, 40, -8
	banim_frame_oam 0x0, 0x1000, 0xE6, 40, 8
	banim_frame_oam 0x8000, 0x1000, 0xA5, 48, -8
	banim_frame_oam 0x0, 0x1000, 0xE5, 48, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, 56, -8
	banim_frame_oam 0x8000, 0x1000, 0xC4, 8, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_50_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 16, -48
	banim_frame_oam 0x0, 0x5000, 0x82, 0, 0
	banim_frame_oam 0x4000, 0x9000, 0x6, 32, -8
	banim_frame_oam 0x4000, 0x5000, 0x46, 32, 8
	banim_frame_oam 0x4000, 0x1000, 0x68, 32, 16
	banim_frame_oam 0x8000, 0x5000, 0x5, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0x2, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x81, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x80, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xC0, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xC2, 32, -16
	banim_frame_oam 0x0, 0x1000, 0x86, 24, 8
	banim_frame_oam 0x8000, 0x1000, 0xC4, 8, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_51_l:
	banim_frame_oam 0x0, 0x5000, 0x88, 48, -8
	banim_frame_oam 0x4000, 0x1000, 0xC8, 48, 8
	banim_frame_oam 0x8000, 0x1000, 0x87, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, 32, 16
	banim_frame_oam 0x0, 0x9000, 0xA, 8, -40
	banim_frame_oam 0x8000, 0x5000, 0xE, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x8A, 8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8E, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xCA, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xC7, 40, -16
	banim_frame_oam 0x4000, 0x1000, 0xEB, 16, -48
	banim_frame_oam 0x0, 0x1000, 0xED, 8, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_52_l:
	banim_frame_oam 0x0, 0x5000, 0x88, 48, -8
	banim_frame_oam 0x4000, 0x1000, 0xC8, 48, 8
	banim_frame_oam 0x8000, 0x1000, 0x87, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xE9, 32, 16
	banim_frame_oam 0x0, 0x9000, 0xA, 8, -40
	banim_frame_oam 0x8000, 0x5000, 0xE, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x8A, 8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8E, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xCA, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xC7, 40, -16
	banim_frame_oam 0x4000, 0x1000, 0xEB, 16, -48
	banim_frame_oam 0x0, 0x1000, 0xED, 8, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_53_l:
	banim_frame_oam 0x4000, 0x5000, 0xCA, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0xF, 32, -24
	banim_frame_oam 0x0, 0x9000, 0xB, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x8B, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0xA, 32, -40
	banim_frame_oam 0x4000, 0x1000, 0xEB, 16, -48
	banim_frame_oam 0x0, 0x1000, 0xED, 8, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_54_l:
	banim_frame_oam 0x0, 0x9000, 0x11, 16, -24
	banim_frame_oam 0x8000, 0x5000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x95, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xB5, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xF5, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0xB1, 8, -40
	banim_frame_oam 0x0, 0x5000, 0xAF, 16, -56
	banim_frame_oam 0x8000, 0x1000, 0x1B, 8, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_55_l:
	banim_frame_oam 0x0, 0x9000, 0x16, 16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1A, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0x96, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x9A, 8, 8
	banim_frame_oam 0x4000, 0x9000, 0xB8, 8, -40
	banim_frame_oam 0x8000, 0x1000, 0xB7, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0xB6, 48, -16
	banim_frame_oam 0x0, 0x1000, 0xF6, 48, 0
	banim_frame_oam 0x0, 0x5000, 0x1C, 16, -56
	banim_frame_oam 0x8000, 0x1000, 0x1E, 8, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_56_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x84, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x65, 24, -48
	banim_frame_oam 0x8000, 0x1000, 0x67, 16, -48
	banim_frame_oam 0x0, 0x5000, 0x5, 48, -24
	banim_frame_oam 0x4000, 0x1000, 0x45, 48, -8
	banim_frame_oam 0x4000, 0x1000, 0xC1, 16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_57_l:
	banim_frame_oam 0x0, 0x9000, 0x8, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x88, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8C, 8, 0
	banim_frame_oam 0x0, 0x5000, 0xC8, 48, -24
	banim_frame_oam 0x0, 0x5000, 0xA5, 32, -56
	banim_frame_oam 0x8000, 0x1000, 0xA7, 24, -56
	banim_frame_oam 0x4000, 0x1000, 0xE5, 32, -40
	banim_frame_oam 0x0, 0x1000, 0xE7, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xE4, 16, -40
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_58_l:
	banim_frame_oam 0x8000, 0x5000, 0xC, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x88, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8C, 8, 0
	banim_frame_oam 0x0, 0x5000, 0xA5, 32, -56
	banim_frame_oam 0x8000, 0x1000, 0xA7, 24, -56
	banim_frame_oam 0x4000, 0x1000, 0xE5, 32, -40
	banim_frame_oam 0x0, 0x1000, 0xE7, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xE4, 16, -40
	banim_frame_oam 0x8000, 0x9000, 0x4E, 24, -32
	banim_frame_oam 0x8000, 0x5000, 0x50, 16, -32
	banim_frame_oam 0x0, 0x1000, 0x4D, 40, -32
	banim_frame_oam 0x0, 0x1000, 0xAD, 40, -8
	banim_frame_oam 0x0, 0x5000, 0xCB, 48, -24
	banim_frame_oam 0x8000, 0x1000, 0x6D, 40, -24
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_59_l:
	banim_frame_oam 0x8000, 0x5000, 0xC, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x88, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8C, 8, 0
	banim_frame_oam 0x0, 0x5000, 0xA5, 32, -56
	banim_frame_oam 0x8000, 0x1000, 0xA7, 24, -56
	banim_frame_oam 0x4000, 0x1000, 0xE5, 32, -40
	banim_frame_oam 0x0, 0x1000, 0xE7, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xE4, 16, -40
	banim_frame_oam 0x0, 0x5000, 0x12, 48, -24
	banim_frame_oam 0x8000, 0x1000, 0x14, 40, -24
	banim_frame_oam 0x8000, 0x9000, 0x4E, 24, -32
	banim_frame_oam 0x8000, 0x5000, 0x50, 16, -32
	banim_frame_oam 0x0, 0x1000, 0x4D, 40, -32
	banim_frame_oam 0x0, 0x1000, 0xAD, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_60_l:
	banim_frame_oam 0x0, 0x9000, 0x15, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x19, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x95, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x99, 8, 0
	banim_frame_oam 0x0, 0x5000, 0xB2, 48, -24
	banim_frame_oam 0x0, 0x1000, 0xD4, 48, -8
	banim_frame_oam 0x0, 0x5000, 0x72, 24, -48
	banim_frame_oam 0x8000, 0x1000, 0x74, 16, -48
	banim_frame_oam 0x4000, 0x1000, 0xF2, 16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_61_l:
	banim_frame_oam 0x0, 0x9000, 0x1A, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x9A, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xDA, 8, 8
	banim_frame_oam 0x8000, 0x9000, 0x3E, 40, -24
	banim_frame_oam 0x4000, 0x1000, 0xBE, 40, 8
	banim_frame_oam 0x8000, 0x1000, 0xDE, 56, -24
	banim_frame_oam 0x8000, 0x1000, 0xD9, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xFA, 16, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0xA0, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xA4, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x85, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0x1, 0, -48
	banim_frame_oam 0x0, 0x1000, 0x0, 24, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0xA, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8A, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCA, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x5, -24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xB, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0xF, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x8B, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x8F, -16, 0
	banim_frame_oam 0x8000, 0x5000, 0x50, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0xCB, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xCD, 8, -40
	banim_frame_oam 0x8000, 0x1000, 0x10, 24, -24
	banim_frame_oam 0x0, 0x1000, 0xEB, 24, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x15, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x95, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xB1, -16, -40
	banim_frame_oam 0x0, 0x5000, 0xB5, -32, -40
	banim_frame_oam 0x0, 0x1000, 0xF2, 24, -24
	banim_frame_oam 0x0, 0x1000, 0xF3, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x17, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x1B, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x9B, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xB7, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0xBB, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xBC, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0xDC, 24, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x80, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x84, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0xC0, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xC4, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xE4, 24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xA, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x86, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8A, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xA5, -16, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x10, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x90, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xA9, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xAD, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0xAE, 24, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x16, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x92, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x96, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xB1, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0xB2, -16, -40
	banim_frame_oam 0x0, 0x5000, 0xB6, -32, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x16, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x92, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x96, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xB1, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0x18, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x1C, -32, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x16, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x92, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x96, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xB1, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0x58, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x5C, -32, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x16, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x92, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x96, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xB1, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0x98, -16, -48
	banim_frame_oam 0x0, 0x5000, 0x9C, -32, -48
	banim_frame_oam 0x4000, 0x5000, 0xD8, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xDC, -32, -32
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x0, 0, -48
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -48
	banim_frame_oam 0x8000, 0x9000, 0x84, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x86, -24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0xB, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x87, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x8B, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC7, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xD, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x11, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x8D, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x91, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xCD, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD1, -24, 8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_62_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, 0, -48
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -48
	banim_frame_oam 0x8000, 0x9000, 0x84, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x86, -24, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_63_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0xB, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x87, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x8B, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC7, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -24, 8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_64_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x11, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x8D, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x91, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xCD, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD1, -24, 8
	banim_frame_end
	.section .data.oam_r
banim_grkm_ax1_3_oam_r:
banim_grkm_ax1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x65, 16, -16
	banim_frame_oam 0x4000, 0x0, 0xE1, -24, -48
	banim_frame_oam 0x0, 0x0, 0x5, -32, -24
	banim_frame_end
banim_grkm_ax1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0xA, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x8A, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xE7, -16, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xD, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x11, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x8D, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x91, 16, 0
	banim_frame_oam 0x8000, 0x4000, 0x4C, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xE9, -16, -40
	banim_frame_oam 0x8000, 0x0, 0xC, -24, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x13, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x17, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x97, 16, 0
	banim_frame_oam 0x8000, 0x4000, 0x52, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x12, -24, -40
	banim_frame_oam 0x4000, 0x0, 0xFD, -16, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x99, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x9D, 16, 0
	banim_frame_oam 0x8000, 0x4000, 0x58, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x18, -24, -40
	banim_frame_oam 0x4000, 0x0, 0x3E, -16, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xD7, -24, 0
	banim_frame_oam 0x0, 0x4000, 0xDB, 8, 0
	banim_frame_oam 0x4000, 0x8000, 0xD1, -24, -16
	banim_frame_oam 0x0, 0x4000, 0xD5, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0xCC, -24, -32
	banim_frame_oam 0x8000, 0x0, 0xD0, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x7F, -32, -24
	banim_frame_oam 0x0, 0x0, 0x9E, 0, -40
	banim_frame_oam 0x0, 0x4000, 0xBE, -16, -48
	banim_frame_oam 0x0, 0x0, 0x5E, -24, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 0, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -24, -48
	banim_frame_oam 0x0, 0x0, 0xE2, -8, -40
	banim_frame_oam 0x0, 0x0, 0xE3, 16, 8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0xA, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -40, -8
	banim_frame_oam 0x0, 0x4000, 0x8A, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -40, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 0
	banim_frame_oam 0x0, 0x0, 0xE7, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -32, -48
	banim_frame_oam 0x0, 0x0, 0xE4, -16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -40, -40
	banim_frame_oam 0x8000, 0x4000, 0x10, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8C, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x90, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -40, 8
	banim_frame_oam 0x0, 0x0, 0xD0, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x11, 0, -24
	banim_frame_oam 0x0, 0x0, 0x51, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xB1, -48, -24
	banim_frame_oam 0x0, 0x4000, 0x12, -64, 0
	banim_frame_oam 0x8000, 0x0, 0x14, -48, 0
	banim_frame_oam 0x4000, 0x0, 0xED, -40, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -40, -40
	banim_frame_oam 0x8000, 0x4000, 0x19, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x95, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x99, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD5, -40, 8
	banim_frame_oam 0x0, 0x0, 0xD9, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x94, 0, -24
	banim_frame_oam 0x0, 0x0, 0xD4, 0, -8
	banim_frame_oam 0x0, 0x4000, 0x52, -64, 0
	banim_frame_oam 0x8000, 0x0, 0x54, -48, 0
	banim_frame_oam 0x4000, 0x0, 0xF6, -40, -48
	banim_frame_oam 0x0, 0x0, 0xF8, -24, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x2, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x80, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x82, -16, -8
	banim_frame_oam 0x4000, 0x0, 0xC0, -32, 8
	banim_frame_oam 0x0, 0x0, 0xC2, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x83, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC3, -8, 8
	banim_frame_oam 0x0, 0x4000, 0x4, -24, -56
	banim_frame_oam 0x0, 0x4000, 0x43, -8, -24
	banim_frame_oam 0x0, 0x4000, 0x84, -56, -8
	banim_frame_oam 0x8000, 0x0, 0x86, -40, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -56, 8
	banim_frame_oam 0x0, 0x0, 0xC6, -40, 8
	banim_frame_oam 0x0, 0x0, 0x66, -40, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x2, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x80, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x82, -16, -8
	banim_frame_oam 0x4000, 0x0, 0xC0, -32, 8
	banim_frame_oam 0x0, 0x0, 0xC2, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x83, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC3, -8, 8
	banim_frame_oam 0x0, 0x4000, 0x4, -24, -56
	banim_frame_oam 0x8000, 0x0, 0x45, -8, -24
	banim_frame_oam 0x4000, 0x8000, 0x27, -64, 0
	banim_frame_oam 0x0, 0x0, 0xA, -64, -8
	banim_frame_oam 0x4000, 0x0, 0x8, -48, 16
	banim_frame_oam 0x8000, 0x0, 0x66, -40, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0x8B, -40, -8
	banim_frame_oam 0x4000, 0x4000, 0xCB, -40, 8
	banim_frame_oam 0x8000, 0x4000, 0x4F, -8, -24
	banim_frame_oam 0x0, 0x0, 0xCF, -8, 8
	banim_frame_oam 0x0, 0x4000, 0x88, -64, -8
	banim_frame_oam 0x8000, 0x0, 0x8A, -48, -8
	banim_frame_oam 0x4000, 0x0, 0xC8, -64, 8
	banim_frame_oam 0x0, 0x0, 0xCA, -48, 8
	banim_frame_oam 0x4000, 0x0, 0x68, -48, 16
	banim_frame_oam 0x8000, 0x0, 0x6A, -48, -16
	banim_frame_oam 0x0, 0x4000, 0xF, -24, -56
	banim_frame_oam 0x0, 0x0, 0xEB, -32, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x6C, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0x70, -48, -16
	banim_frame_oam 0x4000, 0x8000, 0xB, -40, -40
	banim_frame_oam 0x4000, 0x4000, 0x4B, -40, -24
	banim_frame_oam 0x0, 0x0, 0x4F, -8, -24
	banim_frame_oam 0x0, 0x4000, 0xF, -24, -56
	banim_frame_oam 0x0, 0x0, 0xEB, -32, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, -40, -48
	banim_frame_oam 0x8000, 0x4000, 0x14, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0x92, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0x55, -16, -32
	banim_frame_oam 0x8000, 0x0, 0xD5, -16, 0
	banim_frame_oam 0x8000, 0x4000, 0x36, -48, -16
	banim_frame_oam 0x8000, 0x0, 0xB6, -8, -24
	banim_frame_oam 0x0, 0x0, 0xF6, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x15, -16, -48
	banim_frame_oam 0x4000, 0x0, 0xEE, -32, -56
	banim_frame_oam 0x0, 0x0, 0xF0, -16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_12_r:
	banim_frame_oam 0x8000, 0xC000, 0x1A, -48, -48
	banim_frame_oam 0x8000, 0x8000, 0x5E, -16, -32
	banim_frame_oam 0x8000, 0x0, 0xDE, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xDF, -56, -8
	banim_frame_oam 0x0, 0x0, 0x1E, -16, -48
	banim_frame_oam 0x4000, 0x0, 0xF2, -32, -56
	banim_frame_oam 0x0, 0x0, 0xF4, -16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x39, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0xB9, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0x18, -40, -32
	banim_frame_oam 0x0, 0x4000, 0xD7, -40, -48
	banim_frame_oam 0x8000, 0x0, 0xD9, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0x37, -48, -24
	banim_frame_oam 0x4000, 0x0, 0xB7, -48, 8
	banim_frame_oam 0x8000, 0x0, 0xDA, -56, -16
	banim_frame_oam 0x0, 0x0, 0x1D, -16, -48
	banim_frame_oam 0x4000, 0x0, 0xFD, -32, -56
	banim_frame_oam 0x0, 0x0, 0xFF, -16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0x39, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0xB9, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0x18, -40, -32
	banim_frame_oam 0x0, 0x4000, 0xD7, -40, -48
	banim_frame_oam 0x8000, 0x0, 0xD9, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0x3D, -56, -24
	banim_frame_oam 0x8000, 0x4000, 0x3F, -40, -24
	banim_frame_oam 0x4000, 0x0, 0xBD, -56, 8
	banim_frame_oam 0x0, 0x0, 0xBF, -40, 8
	banim_frame_oam 0x4000, 0x0, 0xFD, -32, -56
	banim_frame_oam 0x0, 0x0, 0xFF, -16, -56
	banim_frame_oam 0x0, 0x0, 0x1D, -16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -40, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -40, 8
	banim_frame_oam 0x8000, 0x0, 0x44, -8, -24
	banim_frame_oam 0x0, 0x0, 0x84, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x4, -32, -56
	banim_frame_oam 0x0, 0x4000, 0xA4, -56, -24
	banim_frame_oam 0x8000, 0x0, 0x45, -48, 0
	banim_frame_oam 0x0, 0x0, 0xE1, -16, -56
	banim_frame_oam 0x0, 0x0, 0xE2, -16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -40, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -40, 8
	banim_frame_oam 0x8000, 0x0, 0xAB, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xE8, -24, -48
	banim_frame_oam 0x4000, 0x0, 0xE6, -32, -56
	banim_frame_oam 0x8000, 0x8000, 0xA, -56, -24
	banim_frame_oam 0x4000, 0x0, 0x8A, -56, 8
	banim_frame_oam 0x8000, 0x0, 0xAA, -64, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_17_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0x10, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x8C, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x90, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x0, 0x0, 0x12, -56, 8
	banim_frame_oam 0x0, 0x0, 0x32, -32, -40
	banim_frame_oam 0x0, 0x4000, 0x1A, -64, -16
	banim_frame_oam 0x4000, 0x0, 0x5A, -64, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0xCC, -48, -32
	banim_frame_oam 0x8000, 0x0, 0xD0, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xF1, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0x4E, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x50, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x8000, 0x4000, 0x74, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x73, -48, -16
	banim_frame_oam 0x0, 0x0, 0xD2, -56, 8
	banim_frame_oam 0x0, 0x4000, 0x1C, -64, -16
	banim_frame_oam 0x4000, 0x0, 0x5C, -64, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x8000, 0x4E, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x50, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x4000, 0x8000, 0x15, -48, -32
	banim_frame_oam 0x8000, 0x0, 0x19, -16, -32
	banim_frame_oam 0x0, 0x0, 0x59, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x58, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x57, -48, -16
	banim_frame_oam 0x0, 0x0, 0xB6, -56, 8
	banim_frame_oam 0x0, 0x4000, 0x1C, -64, -16
	banim_frame_oam 0x4000, 0x0, 0x5C, -64, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0x7A, -64, -16
	banim_frame_oam 0x4000, 0x0, 0xBA, -64, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0x7C, -64, -16
	banim_frame_oam 0x4000, 0x0, 0xBC, -64, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0x7C, -64, -16
	banim_frame_oam 0x4000, 0x0, 0xBC, -64, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_65_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0x10, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x8C, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x90, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x14, -56, -16
	banim_frame_oam 0x0, 0x0, 0x54, -56, 0
	banim_frame_oam 0x0, 0x0, 0x12, -56, 8
	banim_frame_oam 0x0, 0x0, 0x32, -32, -40
	banim_frame_oam 0x8000, 0x0, 0x33, -64, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_66_r:
	banim_frame_oam 0x4000, 0x8000, 0xCC, -48, -32
	banim_frame_oam 0x8000, 0x0, 0xD0, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xF1, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0x4E, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x50, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x8000, 0x4000, 0x74, -40, -16
	banim_frame_oam 0x8000, 0x8000, 0x71, -64, -16
	banim_frame_oam 0x8000, 0x4000, 0x73, -48, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_67_r:
	banim_frame_oam 0x8000, 0x8000, 0x4E, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x50, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x4000, 0x8000, 0x15, -48, -32
	banim_frame_oam 0x8000, 0x0, 0x19, -16, -32
	banim_frame_oam 0x0, 0x0, 0x59, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x58, -40, -16
	banim_frame_oam 0x8000, 0x8000, 0x55, -64, -16
	banim_frame_oam 0x8000, 0x4000, 0x57, -48, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -48, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -48, 0
	banim_frame_oam 0x0, 0x4000, 0x84, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xC2, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, -32, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -48, -32
	banim_frame_oam 0x8000, 0x8000, 0xA, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -48, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xC6, -40, -40
	banim_frame_oam 0x0, 0x0, 0xC8, -24, -40
	banim_frame_oam 0x0, 0x0, 0xC9, 0, -24
	banim_frame_oam 0x0, 0x0, 0xCA, -56, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -48, -32
	banim_frame_oam 0x8000, 0x8000, 0x10, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x12, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0x8C, -48, 0
	banim_frame_oam 0x0, 0x4000, 0x90, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x92, 0, 0
	banim_frame_oam 0x4000, 0x0, 0xCC, -32, -40
	banim_frame_oam 0x0, 0x0, 0xCE, -16, -40
	banim_frame_oam 0x0, 0x0, 0xCF, -56, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -32, -32
	banim_frame_oam 0x8000, 0x4000, 0x17, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x97, 0, 0
	banim_frame_oam 0x4000, 0x0, 0xD2, -24, -40
	banim_frame_oam 0x0, 0x0, 0xD4, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xD7, 8, -24
	banim_frame_oam 0x0, 0x4000, 0xD5, -48, -24
	banim_frame_end
banim_grkm_ax1_3_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x1C, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x98, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x9C, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xDC, 0, 8
	banim_frame_oam 0x0, 0x4000, 0x3E, -48, -24
	banim_frame_end
banim_grkm_ax1_3_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x4, -32, -24
	banim_frame_oam 0x0, 0x4000, 0x44, 16, 0
	banim_frame_oam 0x0, 0x0, 0xE1, 16, -40
	banim_frame_oam 0x0, 0x0, 0xE2, 16, -32
	banim_frame_end
banim_grkm_ax1_3_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0xA, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x8A, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -24, 8
	banim_frame_oam 0x0, 0x0, 0xCA, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x84, 16, 0
	banim_frame_end
banim_grkm_ax1_3_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xF, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8B, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8F, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xAB, -16, -40
	banim_frame_oam 0x8000, 0x0, 0xAD, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xAE, 24, -8
	banim_frame_oam 0x0, 0x0, 0xEE, 24, 8
	banim_frame_oam 0x8000, 0x0, 0xAF, 32, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0xB1, 24, -8
	banim_frame_oam 0x4000, 0x0, 0xF1, 24, 8
	banim_frame_oam 0x0, 0x0, 0xF5, 0, -32
	banim_frame_oam 0x0, 0x8000, 0x11, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x95, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xD3, -16, -40
	banim_frame_oam 0x8000, 0x0, 0xB5, -24, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x1B, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x9B, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xB7, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xB9, 8, -40
	banim_frame_oam 0x0, 0x4000, 0xBB, 24, -8
	banim_frame_oam 0x4000, 0x0, 0xFB, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 16
	banim_frame_oam 0x8000, 0x0, 0xB6, -32, -24
	banim_frame_oam 0x0, 0x4000, 0x1D, -24, -48
	banim_frame_oam 0x4000, 0x0, 0x5D, -24, -32
	banim_frame_end
banim_grkm_ax1_3_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_31_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_32_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x84, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0x20, -24, -40
	banim_frame_oam 0x8000, 0x0, 0x24, 8, -40
	banim_frame_oam 0x4000, 0x4000, 0x60, -24, -24
	banim_frame_oam 0x0, 0x0, 0x64, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x66, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x6A, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xE6, -24, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x5, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0x46, -24, -32
	banim_frame_oam 0x0, 0x0, 0x4A, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x9, -32, -24
	banim_frame_oam 0x4000, 0x0, 0x26, -32, -40
	banim_frame_oam 0x0, 0x0, 0x28, -16, -40
	banim_frame_oam 0x0, 0x0, 0x2A, -32, -32
	banim_frame_end
banim_grkm_ax1_3_oam_frame_39_r:
	banim_frame_oam 0x0, 0x8000, 0x6B, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x6F, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xEB, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, 8
	banim_frame_oam 0x0, 0x0, 0xB, -16, -32
	banim_frame_oam 0x8000, 0x0, 0xE, -32, -24
	banim_frame_oam 0x0, 0x4000, 0xC, 0, -48
	banim_frame_oam 0x4000, 0x0, 0x4C, 0, -32
	banim_frame_oam 0x8000, 0x0, 0x2B, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xF, 16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_40_r:
	banim_frame_oam 0x0, 0x4000, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x94, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x51, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0xCB, -24, 0
	banim_frame_oam 0x0, 0x4000, 0xCF, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x90, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x6B, -24, -24
	banim_frame_oam 0x0, 0x0, 0xAB, -24, -8
	banim_frame_oam 0x8000, 0x0, 0xE, -32, -24
	banim_frame_oam 0x0, 0x4000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x34, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x72, -8, -24
	banim_frame_oam 0x0, 0x0, 0x74, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x13, 0, -48
	banim_frame_oam 0x0, 0x0, 0x11, 8, -56
	banim_frame_oam 0x8000, 0x0, 0x10, 16, -56
	banim_frame_oam 0x0, 0x0, 0x50, 16, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_41_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -24, -24
	banim_frame_oam 0x4000, 0x0, 0x95, -24, 8
	banim_frame_oam 0x8000, 0x8000, 0x19, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x99, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x57, -8, -8
	banim_frame_oam 0x4000, 0x0, 0x97, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x18, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x12, -8, -48
	banim_frame_oam 0x4000, 0x0, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x14, 8, -48
	banim_frame_oam 0x0, 0x0, 0x54, 8, -32
	banim_frame_oam 0x0, 0x0, 0x11, 8, -56
	banim_frame_oam 0x0, 0x0, 0x51, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x10, 16, -56
	banim_frame_oam 0x0, 0x0, 0x50, 16, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_42_r:
	banim_frame_oam 0x4000, 0x8000, 0xB5, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xB9, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xF5, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xD1, -24, -24
	banim_frame_oam 0x0, 0x4000, 0xD3, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x18, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x12, -8, -48
	banim_frame_oam 0x4000, 0x0, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x14, 8, -48
	banim_frame_oam 0x0, 0x0, 0x54, 8, -32
	banim_frame_oam 0x0, 0x0, 0x11, 8, -56
	banim_frame_oam 0x0, 0x0, 0x51, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x10, 16, -56
	banim_frame_oam 0x0, 0x0, 0x50, 16, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_43_r:
	banim_frame_oam 0x8000, 0x8000, 0x3B, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xBB, -24, 8
	banim_frame_oam 0x8000, 0x4000, 0x3F, 8, -24
	banim_frame_oam 0x0, 0x0, 0xBF, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x7D, -8, -8
	banim_frame_oam 0x4000, 0x0, 0xBD, -8, 8
	banim_frame_oam 0x8000, 0x0, 0xDF, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xDE, 16, -16
	banim_frame_oam 0x8000, 0x0, 0xDD, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x12, -8, -48
	banim_frame_oam 0x4000, 0x0, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x14, 8, -48
	banim_frame_oam 0x0, 0x0, 0x54, 8, -32
	banim_frame_oam 0x0, 0x0, 0x11, 8, -56
	banim_frame_oam 0x0, 0x0, 0x51, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x10, 16, -56
	banim_frame_oam 0x0, 0x0, 0x50, 16, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -24, 8
	banim_frame_oam 0x0, 0x0, 0x84, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x25, 16, -16
	banim_frame_oam 0x0, 0x4000, 0xC0, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xC2, 8, -40
	banim_frame_oam 0x0, 0x0, 0xA0, -32, -16
	banim_frame_oam 0x0, 0x0, 0xA1, -16, -32
	banim_frame_oam 0x0, 0x0, 0xA2, 16, -40
	banim_frame_oam 0x4000, 0x0, 0xA4, 0, -48
	banim_frame_oam 0x0, 0x0, 0xA6, 16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_45_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -32, -24
	banim_frame_oam 0x8000, 0x4000, 0xA, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0x86, -32, 8
	banim_frame_oam 0x0, 0x0, 0x8A, 0, 8
	banim_frame_oam 0x8000, 0x4000, 0x2B, 8, -16
	banim_frame_oam 0x0, 0x0, 0xB, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x1D, -40, -48
	banim_frame_oam 0x8000, 0x0, 0x1F, -24, -48
	banim_frame_oam 0x4000, 0x0, 0x5D, -40, -32
	banim_frame_oam 0x0, 0x0, 0x5F, -24, -32
	banim_frame_oam 0x0, 0x4000, 0xC5, -16, -40
	banim_frame_oam 0x8000, 0x0, 0xC7, 0, -40
	banim_frame_end
banim_grkm_ax1_3_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -40, -32
	banim_frame_oam 0x8000, 0x8000, 0x10, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x8C, -40, 0
	banim_frame_oam 0x0, 0x4000, 0x90, -8, 0
	banim_frame_oam 0x4000, 0x4000, 0xC9, -40, -40
	banim_frame_oam 0x0, 0x0, 0xCD, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xC8, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xA9, -40, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -40, -32
	banim_frame_oam 0x8000, 0x4000, 0x16, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x92, -40, 0
	banim_frame_oam 0x8000, 0x0, 0x96, -8, 0
	banim_frame_oam 0x0, 0x0, 0xD2, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xD1, 0, -24
	banim_frame_oam 0x0, 0x4000, 0xCE, -64, 0
	banim_frame_oam 0x8000, 0x0, 0xD0, -48, 0
	banim_frame_oam 0x4000, 0x4000, 0xF2, -48, -40
	banim_frame_oam 0x0, 0x0, 0xF6, -16, -40
	banim_frame_oam 0x0, 0x0, 0xD5, -48, -24
	banim_frame_oam 0x0, 0x0, 0xD6, -48, -16
	banim_frame_oam 0x4000, 0x0, 0xFD, -48, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_48_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -48, -40
	banim_frame_oam 0x8000, 0x4000, 0x1B, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x97, -48, -8
	banim_frame_oam 0x8000, 0x0, 0x9B, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD7, -48, 8
	banim_frame_oam 0x0, 0x0, 0xDB, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x1C, -8, -24
	banim_frame_oam 0x0, 0x0, 0x5C, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x7C, -72, 0
	banim_frame_oam 0x8000, 0x0, 0x7E, -56, 0
	banim_frame_oam 0x4000, 0x0, 0xF8, -48, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_49_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -32, -48
	banim_frame_oam 0x8000, 0x8000, 0x80, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0x2, -16, -32
	banim_frame_oam 0x0, 0x4000, 0x82, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x24, 0, -24
	banim_frame_oam 0x8000, 0x0, 0xC2, -40, -16
	banim_frame_oam 0x8000, 0x0, 0xC3, -40, 0
	banim_frame_oam 0x8000, 0x0, 0xA6, -48, -8
	banim_frame_oam 0x0, 0x0, 0xE6, -48, 8
	banim_frame_oam 0x8000, 0x0, 0xA5, -56, -8
	banim_frame_oam 0x0, 0x0, 0xE5, -56, 8
	banim_frame_oam 0x0, 0x0, 0xA4, -64, -8
	banim_frame_oam 0x8000, 0x0, 0xC4, -16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_50_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -32, -48
	banim_frame_oam 0x0, 0x4000, 0x82, -16, 0
	banim_frame_oam 0x4000, 0x8000, 0x6, -64, -8
	banim_frame_oam 0x4000, 0x4000, 0x46, -64, 8
	banim_frame_oam 0x4000, 0x0, 0x68, -48, 16
	banim_frame_oam 0x8000, 0x4000, 0x5, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x2, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x81, -24, -16
	banim_frame_oam 0x8000, 0x0, 0x80, -32, -16
	banim_frame_oam 0x0, 0x0, 0xC0, -32, 0
	banim_frame_oam 0x0, 0x0, 0xC2, -40, -16
	banim_frame_oam 0x0, 0x0, 0x86, -32, 8
	banim_frame_oam 0x8000, 0x0, 0xC4, -16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_51_r:
	banim_frame_oam 0x0, 0x4000, 0x88, -64, -8
	banim_frame_oam 0x4000, 0x0, 0xC8, -64, 8
	banim_frame_oam 0x8000, 0x0, 0x87, -48, 8
	banim_frame_oam 0x0, 0x0, 0xE9, -40, 16
	banim_frame_oam 0x0, 0x8000, 0xA, -40, -40
	banim_frame_oam 0x8000, 0x4000, 0xE, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8A, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x8E, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -40, 8
	banim_frame_oam 0x0, 0x0, 0xCE, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC7, -48, -16
	banim_frame_oam 0x4000, 0x0, 0xEB, -32, -48
	banim_frame_oam 0x0, 0x0, 0xED, -16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_52_r:
	banim_frame_oam 0x0, 0x4000, 0x88, -64, -8
	banim_frame_oam 0x4000, 0x0, 0xC8, -64, 8
	banim_frame_oam 0x8000, 0x0, 0x87, -48, 8
	banim_frame_oam 0x0, 0x0, 0xE9, -40, 16
	banim_frame_oam 0x0, 0x8000, 0xA, -40, -40
	banim_frame_oam 0x8000, 0x4000, 0xE, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8A, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x8E, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -40, 8
	banim_frame_oam 0x0, 0x0, 0xCE, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC7, -48, -16
	banim_frame_oam 0x4000, 0x0, 0xEB, -32, -48
	banim_frame_oam 0x0, 0x0, 0xED, -16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_53_r:
	banim_frame_oam 0x4000, 0x4000, 0xCA, -40, 8
	banim_frame_oam 0x0, 0x0, 0xCE, -8, 8
	banim_frame_oam 0x8000, 0x8000, 0xF, -48, -24
	banim_frame_oam 0x0, 0x8000, 0xB, -32, -40
	banim_frame_oam 0x4000, 0x8000, 0x8B, -32, -8
	banim_frame_oam 0x8000, 0x0, 0xA, -40, -40
	banim_frame_oam 0x4000, 0x0, 0xEB, -32, -48
	banim_frame_oam 0x0, 0x0, 0xED, -16, -48
	banim_frame_end
banim_grkm_ax1_3_oam_frame_54_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -48, -24
	banim_frame_oam 0x8000, 0x4000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -48, 8
	banim_frame_oam 0x0, 0x0, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xB5, -8, -24
	banim_frame_oam 0x0, 0x0, 0xF5, -8, -8
	banim_frame_oam 0x4000, 0x8000, 0xB1, -40, -40
	banim_frame_oam 0x0, 0x4000, 0xAF, -32, -56
	banim_frame_oam 0x8000, 0x0, 0x1B, -16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_55_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -48, -24
	banim_frame_oam 0x8000, 0x4000, 0x1A, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x96, -48, 8
	banim_frame_oam 0x0, 0x0, 0x9A, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0xB8, -40, -40
	banim_frame_oam 0x8000, 0x0, 0xB7, -8, -24
	banim_frame_oam 0x8000, 0x0, 0xB6, -56, -16
	banim_frame_oam 0x0, 0x0, 0xF6, -56, 0
	banim_frame_oam 0x0, 0x4000, 0x1C, -32, -56
	banim_frame_oam 0x8000, 0x0, 0x1E, -16, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_56_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x84, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x65, -40, -48
	banim_frame_oam 0x8000, 0x0, 0x67, -24, -48
	banim_frame_oam 0x0, 0x4000, 0x5, -64, -24
	banim_frame_oam 0x4000, 0x0, 0x45, -64, -8
	banim_frame_oam 0x4000, 0x0, 0xC1, -32, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_57_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x88, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x8C, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xC8, -64, -24
	banim_frame_oam 0x0, 0x4000, 0xA5, -48, -56
	banim_frame_oam 0x8000, 0x0, 0xA7, -32, -56
	banim_frame_oam 0x4000, 0x0, 0xE5, -48, -40
	banim_frame_oam 0x0, 0x0, 0xE7, -32, -40
	banim_frame_oam 0x0, 0x0, 0xE4, -24, -40
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_58_r:
	banim_frame_oam 0x8000, 0x4000, 0xC, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x88, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x8C, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xA5, -48, -56
	banim_frame_oam 0x8000, 0x0, 0xA7, -32, -56
	banim_frame_oam 0x4000, 0x0, 0xE5, -48, -40
	banim_frame_oam 0x0, 0x0, 0xE7, -32, -40
	banim_frame_oam 0x0, 0x0, 0xE4, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x4E, -40, -32
	banim_frame_oam 0x8000, 0x4000, 0x50, -24, -32
	banim_frame_oam 0x0, 0x0, 0x4D, -48, -32
	banim_frame_oam 0x0, 0x0, 0xAD, -48, -8
	banim_frame_oam 0x0, 0x4000, 0xCB, -64, -24
	banim_frame_oam 0x8000, 0x0, 0x6D, -48, -24
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_59_r:
	banim_frame_oam 0x8000, 0x4000, 0xC, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x88, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x8C, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xA5, -48, -56
	banim_frame_oam 0x8000, 0x0, 0xA7, -32, -56
	banim_frame_oam 0x4000, 0x0, 0xE5, -48, -40
	banim_frame_oam 0x0, 0x0, 0xE7, -32, -40
	banim_frame_oam 0x0, 0x0, 0xE4, -24, -40
	banim_frame_oam 0x0, 0x4000, 0x12, -64, -24
	banim_frame_oam 0x8000, 0x0, 0x14, -48, -24
	banim_frame_oam 0x8000, 0x8000, 0x4E, -40, -32
	banim_frame_oam 0x8000, 0x4000, 0x50, -24, -32
	banim_frame_oam 0x0, 0x0, 0x4D, -48, -32
	banim_frame_oam 0x0, 0x0, 0xAD, -48, -8
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_60_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0x19, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x95, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x99, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xB2, -64, -24
	banim_frame_oam 0x0, 0x0, 0xD4, -56, -8
	banim_frame_oam 0x0, 0x4000, 0x72, -40, -48
	banim_frame_oam 0x8000, 0x0, 0x74, -24, -48
	banim_frame_oam 0x4000, 0x0, 0xF2, -32, -56
	banim_frame_end
banim_grkm_ax1_3_oam_frame_61_r:
	banim_frame_oam 0x0, 0x8000, 0x1A, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0x9A, -40, -8
	banim_frame_oam 0x4000, 0x4000, 0xDA, -40, 8
	banim_frame_oam 0x8000, 0x8000, 0x3E, -56, -24
	banim_frame_oam 0x4000, 0x0, 0xBE, -56, 8
	banim_frame_oam 0x8000, 0x0, 0xDE, -64, -24
	banim_frame_oam 0x8000, 0x0, 0xD9, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xFA, -32, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0xA0, -24, -8
	banim_frame_oam 0x8000, 0x0, 0xA4, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x85, 16, -16
	banim_frame_oam 0x4000, 0x0, 0x1, -16, -48
	banim_frame_oam 0x0, 0x0, 0x0, -32, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0xA, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x8A, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -24, 8
	banim_frame_oam 0x0, 0x0, 0xCA, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x5, 16, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xB, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0xF, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x8B, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x8F, 8, 0
	banim_frame_oam 0x8000, 0x4000, 0x50, 16, -16
	banim_frame_oam 0x4000, 0x0, 0xCB, -32, -40
	banim_frame_oam 0x0, 0x0, 0xCD, -16, -40
	banim_frame_oam 0x8000, 0x0, 0x10, -32, -24
	banim_frame_oam 0x0, 0x0, 0xEB, -32, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x11, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x95, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xB1, -16, -40
	banim_frame_oam 0x0, 0x4000, 0xB5, 16, -40
	banim_frame_oam 0x0, 0x0, 0xF2, -32, -24
	banim_frame_oam 0x0, 0x0, 0xF3, -32, -16
	banim_frame_oam 0x0, 0x0, 0xF4, 16, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x17, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x1B, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x9B, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xB7, -16, -40
	banim_frame_oam 0x8000, 0x0, 0xBB, 16, -40
	banim_frame_oam 0x0, 0x0, 0xBC, 24, -40
	banim_frame_oam 0x8000, 0x0, 0xDC, -32, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0x80, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x84, 24, -40
	banim_frame_oam 0x4000, 0x4000, 0xC0, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC4, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -40, -24
	banim_frame_oam 0x0, 0x0, 0xE4, -32, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xA, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x86, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8A, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xA5, -16, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x10, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x90, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xA9, -24, -40
	banim_frame_oam 0x8000, 0x0, 0xAD, 8, -40
	banim_frame_oam 0x8000, 0x0, 0xAE, -32, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x16, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x92, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x96, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xB1, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0xB2, -16, -40
	banim_frame_oam 0x0, 0x4000, 0xB6, 16, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x16, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x92, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x96, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xB1, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0x18, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x1C, 16, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x16, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x92, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x96, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xB1, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0x58, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x5C, 16, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x16, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x92, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x96, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xB1, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0x98, -16, -48
	banim_frame_oam 0x0, 0x4000, 0x9C, 16, -48
	banim_frame_oam 0x4000, 0x4000, 0xD8, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xDC, 16, -32
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x0, -32, -48
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -48
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -48
	banim_frame_oam 0x8000, 0x8000, 0x84, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x86, 16, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0xB, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x87, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x8B, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC7, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xCB, 8, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xD, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x11, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8D, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x91, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCD, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD1, 8, 8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_62_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -32, -48
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -48
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -48
	banim_frame_oam 0x8000, 0x8000, 0x84, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x86, 16, -16
	banim_frame_end
banim_grkm_ax1_3_oam_frame_63_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0xB, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x87, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x8B, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC7, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xCB, 8, 8
	banim_frame_end
banim_grkm_ax1_3_oam_frame_64_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x11, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8D, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x91, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCD, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD1, 8, 8
	banim_frame_end
	.section .data.script
banim_grkm_ax1_3_script:
banim_grkm_ax1_3_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_0, 1, banim_grkm_ax1_3_oam_frame_1_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_0, 5, banim_grkm_ax1_3_oam_frame_2_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_1, 6, banim_grkm_ax1_3_oam_frame_3_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_1, 7, banim_grkm_ax1_3_oam_frame_4_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_ax1_sheet_1, 8, banim_grkm_ax1_3_oam_frame_5_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_1, 9, banim_grkm_ax1_3_oam_frame_6_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_2, 10, banim_grkm_ax1_3_oam_frame_7_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_2, 11, banim_grkm_ax1_3_oam_frame_8_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_2, 12, banim_grkm_ax1_3_oam_frame_9_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_2, 13, banim_grkm_ax1_3_oam_frame_10_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_2, 14, banim_grkm_ax1_3_oam_frame_11_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_1, 15, banim_grkm_ax1_3_oam_frame_12_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_2, 16, banim_grkm_ax1_3_oam_frame_13_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_2, 17, banim_grkm_ax1_3_oam_frame_14_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 18, banim_grkm_ax1_3_oam_frame_15_r - banim_grkm_ax1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_grkm_ax1_sheet_3, 18, banim_grkm_ax1_3_oam_frame_15_r - banim_grkm_ax1_3_oam_r
	banim_code_hit_normal
	banim_code_sound_axe_swing_long
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 19, banim_grkm_ax1_3_oam_frame_16_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 20, banim_grkm_ax1_3_oam_frame_17_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 21, banim_grkm_ax1_3_oam_frame_18_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_3, 22, banim_grkm_ax1_3_oam_frame_19_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_3, 20, banim_grkm_ax1_3_oam_frame_17_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_ax1_sheet_4, 29, banim_grkm_ax1_3_oam_frame_20_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_4, 30, banim_grkm_ax1_3_oam_frame_21_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_4, 31, banim_grkm_ax1_3_oam_frame_22_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_ax1_sheet_4, 32, banim_grkm_ax1_3_oam_frame_23_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_4, 33, banim_grkm_ax1_3_oam_frame_24_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 34, banim_grkm_ax1_3_oam_frame_25_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 35, banim_grkm_ax1_3_oam_frame_26_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 36, banim_grkm_ax1_3_oam_frame_27_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 37, banim_grkm_ax1_3_oam_frame_28_r - banim_grkm_ax1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_ax1_sheet_5, 38, banim_grkm_ax1_3_oam_frame_29_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_3_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_7, 42, banim_grkm_ax1_3_oam_frame_33_r - banim_grkm_ax1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_grkm_ax1_sheet_7, 42, banim_grkm_ax1_3_oam_frame_33_r - banim_grkm_ax1_3_oam_r
	banim_code_hit_normal
	banim_code_sound_axe_swing_long
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_grkm_ax1_sheet_7, 42, banim_grkm_ax1_3_oam_frame_33_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 23, banim_grkm_ax1_3_oam_frame_34_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 24, banim_grkm_ax1_3_oam_frame_35_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_3, 25, banim_grkm_ax1_3_oam_frame_36_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_3, 23, banim_grkm_ax1_3_oam_frame_34_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_3_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_8, 43, banim_grkm_ax1_3_oam_frame_37_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_8, 44, banim_grkm_ax1_3_oam_frame_38_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_8, 45, banim_grkm_ax1_3_oam_frame_39_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 16, banim_grkm_ax1_sheet_8, 46, banim_grkm_ax1_3_oam_frame_40_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_8, 47, banim_grkm_ax1_3_oam_frame_41_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_8, 48, banim_grkm_ax1_3_oam_frame_42_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_8, 49, banim_grkm_ax1_3_oam_frame_43_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 12, banim_grkm_ax1_sheet_8, 46, banim_grkm_ax1_3_oam_frame_40_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_8, 47, banim_grkm_ax1_3_oam_frame_41_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_8, 48, banim_grkm_ax1_3_oam_frame_42_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_8, 49, banim_grkm_ax1_3_oam_frame_43_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_8, 46, banim_grkm_ax1_3_oam_frame_40_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_9, 50, banim_grkm_ax1_3_oam_frame_44_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_9, 51, banim_grkm_ax1_3_oam_frame_45_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_9, 52, banim_grkm_ax1_3_oam_frame_46_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_ax1_sheet_9, 53, banim_grkm_ax1_3_oam_frame_47_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_9, 54, banim_grkm_ax1_3_oam_frame_48_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 55, banim_grkm_ax1_3_oam_frame_49_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 56, banim_grkm_ax1_3_oam_frame_50_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 57, banim_grkm_ax1_3_oam_frame_51_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 58, banim_grkm_ax1_3_oam_frame_52_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 59, banim_grkm_ax1_3_oam_frame_53_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_6, 60, banim_grkm_ax1_3_oam_frame_54_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_6, 61, banim_grkm_ax1_3_oam_frame_55_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_7, 62, banim_grkm_ax1_3_oam_frame_56_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_7, 63, banim_grkm_ax1_3_oam_frame_57_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 6, banim_grkm_ax1_sheet_7, 64, banim_grkm_ax1_3_oam_frame_58_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 6, banim_grkm_ax1_sheet_7, 65, banim_grkm_ax1_3_oam_frame_59_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_7, 66, banim_grkm_ax1_3_oam_frame_60_r - banim_grkm_ax1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_grkm_ax1_sheet_7, 67, banim_grkm_ax1_3_oam_frame_61_r - banim_grkm_ax1_3_oam_r
	banim_code_hit_critical_3
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 20, banim_grkm_ax1_3_oam_frame_17_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 21, banim_grkm_ax1_3_oam_frame_18_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_3, 22, banim_grkm_ax1_3_oam_frame_19_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_3, 20, banim_grkm_ax1_3_oam_frame_17_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_ax1_sheet_4, 29, banim_grkm_ax1_3_oam_frame_20_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_4, 30, banim_grkm_ax1_3_oam_frame_21_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_4, 31, banim_grkm_ax1_3_oam_frame_22_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_ax1_sheet_4, 32, banim_grkm_ax1_3_oam_frame_23_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_4, 33, banim_grkm_ax1_3_oam_frame_24_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 34, banim_grkm_ax1_3_oam_frame_25_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 35, banim_grkm_ax1_3_oam_frame_26_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 36, banim_grkm_ax1_3_oam_frame_27_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 37, banim_grkm_ax1_3_oam_frame_28_r - banim_grkm_ax1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_ax1_sheet_5, 38, banim_grkm_ax1_3_oam_frame_29_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_3_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 16, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 12, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_6, 41, banim_grkm_ax1_3_oam_frame_32_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_7, 42, banim_grkm_ax1_3_oam_frame_33_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_7, 42, banim_grkm_ax1_3_oam_frame_33_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 6, banim_grkm_ax1_sheet_7, 42, banim_grkm_ax1_3_oam_frame_33_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 6, banim_grkm_ax1_sheet_7, 42, banim_grkm_ax1_3_oam_frame_33_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_7, 42, banim_grkm_ax1_3_oam_frame_33_r - banim_grkm_ax1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_grkm_ax1_sheet_7, 67, banim_grkm_ax1_3_oam_frame_61_r - banim_grkm_ax1_3_oam_r
	banim_code_hit_critical_3
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 23, banim_grkm_ax1_3_oam_frame_34_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 24, banim_grkm_ax1_3_oam_frame_35_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_3, 25, banim_grkm_ax1_3_oam_frame_36_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_3, 23, banim_grkm_ax1_3_oam_frame_34_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_ax1_sheet_5, 40, banim_grkm_ax1_3_oam_frame_31_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 39, banim_grkm_ax1_3_oam_frame_30_r - banim_grkm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_3_mode_attack_range:
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_ax1_3_mode_attack_range_critical:
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_ax1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_ax1_sheet_10, 83, banim_grkm_ax1_3_oam_frame_62_r - banim_grkm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_ax1_sheet_10, 84, banim_grkm_ax1_3_oam_frame_63_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_10, 85, banim_grkm_ax1_3_oam_frame_64_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_ax1_sheet_10, 84, banim_grkm_ax1_3_oam_frame_63_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_10, 83, banim_grkm_ax1_3_oam_frame_62_r - banim_grkm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_ax1_sheet_10, 83, banim_grkm_ax1_3_oam_frame_62_r - banim_grkm_ax1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_ax1_sheet_10, 84, banim_grkm_ax1_3_oam_frame_63_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_10, 85, banim_grkm_ax1_3_oam_frame_64_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_ax1_sheet_10, 84, banim_grkm_ax1_3_oam_frame_63_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_10, 83, banim_grkm_ax1_3_oam_frame_62_r - banim_grkm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_ax1_3_mode_stand_close:
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_ax1_3_mode_stand:
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_ax1_3_mode_stand_range:
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_ax1_3_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_0, 1, banim_grkm_ax1_3_oam_frame_1_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_0, 5, banim_grkm_ax1_3_oam_frame_2_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_1, 6, banim_grkm_ax1_3_oam_frame_3_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_1, 7, banim_grkm_ax1_3_oam_frame_4_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_ax1_sheet_1, 8, banim_grkm_ax1_3_oam_frame_5_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_1, 9, banim_grkm_ax1_3_oam_frame_6_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_2, 10, banim_grkm_ax1_3_oam_frame_7_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_2, 11, banim_grkm_ax1_3_oam_frame_8_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_2, 12, banim_grkm_ax1_3_oam_frame_9_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_2, 13, banim_grkm_ax1_3_oam_frame_10_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_2, 14, banim_grkm_ax1_3_oam_frame_11_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_1, 15, banim_grkm_ax1_3_oam_frame_12_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_2, 16, banim_grkm_ax1_3_oam_frame_13_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 5, banim_grkm_ax1_sheet_2, 17, banim_grkm_ax1_3_oam_frame_14_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 18, banim_grkm_ax1_3_oam_frame_15_r - banim_grkm_ax1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_grkm_ax1_sheet_3, 18, banim_grkm_ax1_3_oam_frame_15_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 19, banim_grkm_ax1_3_oam_frame_16_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 26, banim_grkm_ax1_3_oam_frame_65_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 2, banim_grkm_ax1_sheet_3, 27, banim_grkm_ax1_3_oam_frame_66_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_3, 28, banim_grkm_ax1_3_oam_frame_67_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_3, 26, banim_grkm_ax1_3_oam_frame_65_r - banim_grkm_ax1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_ax1_sheet_4, 29, banim_grkm_ax1_3_oam_frame_20_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_4, 30, banim_grkm_ax1_3_oam_frame_21_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_4, 31, banim_grkm_ax1_3_oam_frame_22_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_ax1_sheet_4, 32, banim_grkm_ax1_3_oam_frame_23_r - banim_grkm_ax1_3_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_ax1_sheet_4, 33, banim_grkm_ax1_3_oam_frame_24_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 34, banim_grkm_ax1_3_oam_frame_25_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 3, banim_grkm_ax1_sheet_5, 35, banim_grkm_ax1_3_oam_frame_26_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 36, banim_grkm_ax1_3_oam_frame_27_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 4, banim_grkm_ax1_sheet_5, 37, banim_grkm_ax1_3_oam_frame_28_r - banim_grkm_ax1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_ax1_sheet_5, 38, banim_grkm_ax1_3_oam_frame_29_r - banim_grkm_ax1_3_oam_r
	banim_code_frame 1, banim_grkm_ax1_sheet_0, 0, banim_grkm_ax1_3_oam_frame_0_r - banim_grkm_ax1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_grkm_ax1_3_mode_attack_close - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_attack_close_back - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_attack_close_critical - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_attack_close_critical_back - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_attack_range - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_attack_range_critical - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_dodge_close - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_dodge_range - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_stand_close - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_stand - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_stand_range - banim_grkm_ax1_3_script
	.word banim_grkm_ax1_3_mode_attack_miss - banim_grkm_ax1_3_script
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

