@ vim:ft=armv4
	.global banim_grkm_sp1_2_script
	.global banim_grkm_sp1_2_oam_r
	.global banim_grkm_sp1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x53
	.section .data.oam_l
banim_grkm_sp1_2_oam_l:
banim_grkm_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x65, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x5, 24, -24
	banim_frame_oam 0x8000, 0x1000, 0x25, 24, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x26, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0xA6, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x6, 16, -40
	banim_frame_oam 0x0, 0x1000, 0x8, 8, -40
	banim_frame_oam 0x8000, 0x1000, 0xB, 24, -32
	banim_frame_oam 0x8000, 0x9000, 0x6A, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x2A, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x9, -8, -40
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_grkm_sp1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x10, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x8C, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x90, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xCC, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD0, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x71, -24, -16
	banim_frame_oam 0x0, 0x5000, 0x11, 24, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE3, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xC0, 32, -32
	banim_frame_oam 0x0, 0x1000, 0xE2, 0, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 8, -40
	banim_frame_oam 0x8000, 0x9000, 0xA, -8, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, 8, -8
	banim_frame_oam 0x0, 0x5000, 0x8A, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE7, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xC4, 40, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0x10, -8, -40
	banim_frame_oam 0x4000, 0x9000, 0x8C, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x90, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xCC, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xD0, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x11, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x51, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x12, 40, 0
	banim_frame_oam 0x8000, 0x1000, 0x14, 32, 0
	banim_frame_oam 0x8000, 0x1000, 0x91, 32, -32
	banim_frame_oam 0x0, 0x1000, 0xD1, 32, -16
	banim_frame_oam 0x4000, 0x1000, 0xED, 40, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x15, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0x19, -8, -40
	banim_frame_oam 0x4000, 0x9000, 0x95, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x99, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xD5, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xD9, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x94, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xD4, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x52, 40, 0
	banim_frame_oam 0x8000, 0x1000, 0x54, 32, 0
	banim_frame_oam 0x0, 0x5000, 0x92, 32, -24
	banim_frame_oam 0x0, 0x1000, 0xD2, -16, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0x84, 40, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, 32, 8
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x4, -8, -40
	banim_frame_oam 0x4000, 0x1000, 0xE0, 40, -24
	banim_frame_oam 0x0, 0x1000, 0xE2, 32, -24
	banim_frame_oam 0x0, 0x1000, 0xA6, 32, 0
	banim_frame_oam 0x4000, 0x1000, 0xE3, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xE5, 32, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0x27, 32, 0
	banim_frame_oam 0x0, 0x1000, 0xA, 56, -8
	banim_frame_oam 0x4000, 0x1000, 0x8, 32, 16
	banim_frame_oam 0x8000, 0x1000, 0x66, 32, -16
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xE0, 40, -24
	banim_frame_oam 0x0, 0x1000, 0xE2, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xE3, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xE5, 32, -16
	banim_frame_oam 0x8000, 0x1000, 0x5, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x45, 0, -24
	banim_frame_oam 0x8000, 0x9000, 0x0, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x2, 8, -40
	banim_frame_oam 0x8000, 0x1000, 0x3, 0, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0xB, 8, -40
	banim_frame_oam 0x8000, 0x5000, 0xF, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x8B, 8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8F, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xCB, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xCF, 0, 8
	banim_frame_oam 0x0, 0x5000, 0x69, 40, -24
	banim_frame_oam 0x8000, 0x1000, 0x88, 56, -8
	banim_frame_oam 0x0, 0x1000, 0xC8, 56, 8
	banim_frame_oam 0x0, 0x5000, 0xA9, 40, 0
	banim_frame_oam 0x4000, 0x1000, 0x67, 32, 16
	banim_frame_oam 0x0, 0x1000, 0xEB, 56, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x6C, 0, -16
	banim_frame_oam 0x8000, 0x9000, 0x70, 32, -16
	banim_frame_oam 0x4000, 0x9000, 0xB, 8, -40
	banim_frame_oam 0x4000, 0x5000, 0x4B, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x4F, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x10, 40, -24
	banim_frame_oam 0x4000, 0x1000, 0x30, 48, -16
	banim_frame_oam 0x0, 0x1000, 0xF, 0, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x5000, 0x36, 40, -16
	banim_frame_oam 0x8000, 0x1000, 0xB6, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xF6, 0, -8
	banim_frame_oam 0x0, 0x9000, 0x32, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0xB2, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xF2, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x12, 40, -24
	banim_frame_oam 0x4000, 0x1000, 0x14, 48, -16
	banim_frame_oam 0x0, 0x1000, 0xF0, 0, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x1000, 0xDF, 48, -8
	banim_frame_oam 0x4000, 0x9000, 0xBA, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0xFA, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x1D, 0, -48
	banim_frame_oam 0x0, 0x1000, 0x1E, 0, -40
	banim_frame_oam 0x0, 0x9000, 0x3B, 8, -40
	banim_frame_oam 0x8000, 0x5000, 0x5F, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0xBE, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xFE, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x5A, 40, -32
	banim_frame_oam 0x0, 0x1000, 0x9A, 40, -16
	banim_frame_oam 0x8000, 0x1000, 0x1A, 48, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x1000, 0xDA, 48, -16
	banim_frame_oam 0x0, 0x9000, 0x17, 16, -32
	banim_frame_oam 0x8000, 0x9000, 0x1B, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x97, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x9B, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x9C, 0, -48
	banim_frame_oam 0x0, 0x1000, 0xDB, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xDC, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0xF7, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xF9, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xD9, 48, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0x1B, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x9B, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x9C, 0, -48
	banim_frame_oam 0x0, 0x1000, 0xDB, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xDC, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0xF7, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xF9, 16, -40
	banim_frame_oam 0x8000, 0x9000, 0x3D, 40, -24
	banim_frame_oam 0x8000, 0x5000, 0x3F, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xBD, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xBF, 32, 8
	banim_frame_oam 0x8000, 0x9000, 0x19, 16, -32
	banim_frame_oam 0x0, 0x5000, 0x99, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0x17, 32, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x44, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x84, 0, -8
	banim_frame_oam 0x0, 0x5000, 0xA4, 40, -24
	banim_frame_oam 0x8000, 0x1000, 0x45, 40, 0
	banim_frame_oam 0x0, 0x1000, 0x85, 40, -32
	banim_frame_oam 0x8000, 0x1000, 0x4, 0, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x7, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x87, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xC7, 8, 8
	banim_frame_oam 0x8000, 0x5000, 0xB, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x8B, 0, -8
	banim_frame_oam 0x8000, 0x5000, 0x46, 40, -24
	banim_frame_oam 0x0, 0x1000, 0xC6, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, 0, -48
	banim_frame_oam 0x8000, 0x1000, 0xBF, 48, -24
	banim_frame_oam 0x0, 0x1000, 0xFF, 48, -8
	banim_frame_oam 0x0, 0x5000, 0xBD, 56, -24
	banim_frame_oam 0x4000, 0x1000, 0xFD, 56, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x5000, 0x10, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x8C, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x90, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x12, 48, 8
	banim_frame_oam 0x4000, 0x1000, 0xF6, 24, -40
	banim_frame_oam 0x8000, 0x9000, 0xE, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0xD, 32, -32
	banim_frame_oam 0x0, 0x1000, 0x6C, 40, -8
	banim_frame_oam 0x0, 0x5000, 0x7A, 48, -24
	banim_frame_oam 0x8000, 0x1000, 0x7C, 40, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0xCC, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0xD0, 8, -32
	banim_frame_oam 0x4000, 0x1000, 0xF1, 24, -40
	banim_frame_oam 0x8000, 0x9000, 0x4E, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x50, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x8000, 0x5000, 0x74, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xD2, 48, 8
	banim_frame_oam 0x8000, 0x1000, 0x93, 40, -8
	banim_frame_oam 0x0, 0x1000, 0xD3, 40, 8
	banim_frame_oam 0x0, 0x1000, 0x7F, 40, -16
	banim_frame_oam 0x0, 0x1000, 0x5E, 48, -24
	banim_frame_oam 0x4000, 0x1000, 0x7D, 48, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x9000, 0x4E, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x50, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0x15, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0x19, 8, -32
	banim_frame_oam 0x0, 0x1000, 0x59, 24, -40
	banim_frame_oam 0x8000, 0x5000, 0x58, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xD2, 48, 8
	banim_frame_oam 0x8000, 0x1000, 0x93, 40, -8
	banim_frame_oam 0x0, 0x1000, 0xD3, 40, 8
	banim_frame_oam 0x0, 0x1000, 0x7F, 40, -16
	banim_frame_oam 0x0, 0x1000, 0x5E, 48, -24
	banim_frame_oam 0x4000, 0x1000, 0x7D, 48, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0x1A, 56, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_35_l:
	banim_frame_oam 0x8000, 0x1000, 0xD9, 64, -16
	banim_frame_oam 0x0, 0x5000, 0x1D, 48, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_36_l:
	banim_frame_oam 0x8000, 0x1000, 0xD9, 64, -16
	banim_frame_oam 0x0, 0x5000, 0x1D, 48, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_78_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x10, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x8C, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x90, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x11, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x12, 48, 8
	banim_frame_oam 0x8000, 0x1000, 0xDC, 48, -16
	banim_frame_oam 0x4000, 0x1000, 0xF6, 24, -40
	banim_frame_oam 0x0, 0x5000, 0xDA, 56, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_79_l:
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
	banim_frame_oam 0x8000, 0x1000, 0xD9, 64, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_80_l:
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
	banim_frame_oam 0x8000, 0x1000, 0xD9, 64, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 16, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 16, 0
	banim_frame_oam 0x0, 0x5000, 0x84, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xC0, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xC2, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xE1, 8, -48
	banim_frame_oam 0x8000, 0x1000, 0xC3, 48, -16
	banim_frame_oam 0x0, 0x1000, 0xE2, 48, 0
	banim_frame_end
banim_grkm_sp1_2_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 16, -32
	banim_frame_oam 0x8000, 0x9000, 0xA, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, 16, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xC6, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xC8, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xC9, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xCA, 48, -8
	banim_frame_oam 0x4000, 0x1000, 0xE7, 16, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 16, -32
	banim_frame_oam 0x8000, 0x9000, 0x10, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0x12, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x8C, 16, 0
	banim_frame_oam 0x0, 0x5000, 0x90, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x92, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xCC, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xCE, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xCF, 48, -8
	banim_frame_oam 0x8000, 0x1000, 0xD0, 32, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x13, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0x17, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x97, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xD7, -16, -24
	banim_frame_oam 0x0, 0x5000, 0xD5, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xF1, 24, -40
	banim_frame_oam 0x4000, 0x1000, 0xD2, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xD4, 0, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x18, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x1C, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x98, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x9C, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xDC, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x3E, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x7E, -32, -8
	banim_frame_oam 0x8000, 0x5000, 0x9E, 32, -40
	banim_frame_oam 0x0, 0x1000, 0xFF, 40, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x4, 16, -24
	banim_frame_oam 0x0, 0x5000, 0x44, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xE1, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xE2, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xE3, 16, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0xA, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8A, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCA, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x84, -32, 0
	banim_frame_oam 0x0, 0x5000, 0xC4, 24, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xF, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8B, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8F, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xAE, -32, -8
	banim_frame_oam 0x0, 0x1000, 0xEE, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0xAF, -40, -8
	banim_frame_oam 0x0, 0x5000, 0xAB, -8, -40
	banim_frame_oam 0x4000, 0x1000, 0xE8, 24, -32
	banim_frame_oam 0x0, 0x1000, 0xEA, 16, -32
	banim_frame_oam 0x0, 0x1000, 0xEC, 24, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0xB1, -40, -8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -40, 8
	banim_frame_oam 0x0, 0x9000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x15, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x95, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xB4, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x7D, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xF5, 24, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x1B, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x9B, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xBB, -40, -8
	banim_frame_oam 0x4000, 0x1000, 0xFB, -40, 8
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 16
	banim_frame_oam 0x8000, 0x1000, 0xB6, 24, -24
	banim_frame_oam 0x0, 0x5000, 0xB7, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xB9, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x1D, 16, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_31_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_32_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x84, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x20, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x24, -16, -40
	banim_frame_oam 0x4000, 0x5000, 0x60, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x64, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x0, 24, -40
	banim_frame_oam 0x0, 0x1000, 0x1, 24, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x66, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x6A, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xE6, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0x46, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x4A, -16, -32
	banim_frame_oam 0x8000, 0x1000, 0x9, 24, -24
	banim_frame_oam 0x4000, 0x1000, 0x26, 16, -40
	banim_frame_oam 0x0, 0x1000, 0x28, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0x7, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0x1E, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x5E, -24, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_39_l:
	banim_frame_oam 0x0, 0x9000, 0x6B, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0xEB, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x2F, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0x2B, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xF, -32, -32
	banim_frame_oam 0x8000, 0x5000, 0x6F, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0x90, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xD0, -24, 0
	banim_frame_oam 0x0, 0x1000, 0x70, 24, -48
	banim_frame_oam 0x4000, 0x1000, 0xB, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0xD, 8, -40
	banim_frame_oam 0x0, 0x1000, 0x17, 8, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_40_l:
	banim_frame_oam 0x0, 0x5000, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x94, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x51, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0xCB, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xCF, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x90, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x6B, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xAB, 16, -8
	banim_frame_oam 0x0, 0x5000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x34, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x74, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0x2F, 24, -24
	banim_frame_oam 0x4000, 0x1000, 0x10, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x50, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x30, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0x12, 16, -48
	banim_frame_oam 0x0, 0x1000, 0x14, 8, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_41_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0x95, 8, 8
	banim_frame_oam 0x8000, 0x9000, 0x19, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x99, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x97, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x18, 24, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 8, -32
	banim_frame_oam 0x0, 0x5000, 0x92, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x34, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x10, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x50, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x30, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0x12, 16, -48
	banim_frame_oam 0x0, 0x1000, 0x14, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0x77, -8, 0
	banim_frame_end
banim_grkm_sp1_2_oam_frame_42_l:
	banim_frame_oam 0x0, 0x5000, 0xB9, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xF5, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xD1, 8, -24
	banim_frame_oam 0x0, 0x5000, 0xD3, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x18, 24, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 8, -32
	banim_frame_oam 0x0, 0x5000, 0x92, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x34, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x10, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x50, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x30, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0x12, 16, -48
	banim_frame_oam 0x0, 0x1000, 0x14, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0xD7, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xB5, 8, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_43_l:
	banim_frame_oam 0x8000, 0x9000, 0x3B, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xBB, 8, 8
	banim_frame_oam 0x8000, 0x5000, 0x3F, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xBF, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xBD, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0xDF, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xDE, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xDD, 24, -24
	banim_frame_oam 0x0, 0x1000, 0x51, 8, -32
	banim_frame_oam 0x0, 0x5000, 0x92, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x34, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x10, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x50, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x30, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0x12, 16, -48
	banim_frame_oam 0x0, 0x1000, 0x14, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0x9D, -8, 0
	banim_frame_end
banim_grkm_sp1_2_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x25, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xA0, 24, -16
	banim_frame_oam 0x0, 0x5000, 0xC0, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xC2, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0xA1, 16, -48
	banim_frame_oam 0x0, 0x1000, 0xA3, 8, -48
	banim_frame_oam 0x4000, 0x1000, 0xA4, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0xC3, -32, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_45_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0xA, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x86, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x8A, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x2B, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xB, -24, 8
	banim_frame_oam 0x0, 0x5000, 0x3D, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0x3F, -8, -40
	banim_frame_oam 0x0, 0x1000, 0x1D, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xBC, 32, -48
	banim_frame_oam 0x0, 0x1000, 0xBE, 24, -48
	banim_frame_oam 0x4000, 0x1000, 0xDC, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xDE, 16, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 8, -32
	banim_frame_oam 0x8000, 0x9000, 0x10, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x8C, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x90, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC8, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xA8, 0, -40
	banim_frame_oam 0x0, 0x5000, 0xC6, 32, -48
	banim_frame_oam 0x0, 0x1000, 0xA6, -16, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0x12, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0x16, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x92, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x96, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xD2, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xD1, -16, -24
	banim_frame_oam 0x0, 0x5000, 0xCE, 40, 0
	banim_frame_oam 0x8000, 0x1000, 0xD0, 32, 0
	banim_frame_oam 0x0, 0x1000, 0xD5, 32, -24
	banim_frame_oam 0x0, 0x1000, 0xD6, 32, -16
	banim_frame_oam 0x4000, 0x1000, 0xFD, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xFF, 0, -40
	banim_frame_oam 0x4000, 0x1000, 0xF9, 40, -32
	banim_frame_oam 0x0, 0x1000, 0xFB, 32, -32
	banim_frame_oam 0x0, 0x1000, 0x7F, 40, -40
	banim_frame_oam 0x0, 0x1000, 0x9F, 32, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, 40, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_48_l:
	banim_frame_oam 0x0, 0x9000, 0x17, 8, -40
	banim_frame_oam 0x8000, 0x5000, 0x1B, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x97, 8, -8
	banim_frame_oam 0x8000, 0x1000, 0x9B, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xD7, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xDB, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0x1C, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x5C, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x7C, 48, 0
	banim_frame_oam 0x8000, 0x1000, 0x7E, 40, 0
	banim_frame_oam 0x0, 0x1000, 0x1E, 40, -16
	banim_frame_oam 0x4000, 0x1000, 0xCB, 40, -24
	banim_frame_oam 0x4000, 0x1000, 0xEB, 48, -16
	banim_frame_end
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
	banim_frame_oam 0x4000, 0x5000, 0xCA, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0xF, 32, -24
	banim_frame_oam 0x0, 0x9000, 0xB, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x8B, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0xA, 32, -40
	banim_frame_oam 0x4000, 0x1000, 0xEB, 16, -48
	banim_frame_oam 0x0, 0x1000, 0xED, 8, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_49_l:
	banim_frame_oam 0x4000, 0xD000, 0x10, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x90, 32, -8
	banim_frame_oam 0x4000, 0x9000, 0x94, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xD0, 32, 8
	banim_frame_oam 0x4000, 0x5000, 0xD4, 0, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x18, 32, -40
	banim_frame_oam 0x8000, 0x9000, 0x1C, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x1E, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x98, 32, -8
	banim_frame_oam 0x0, 0x5000, 0x9C, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x9E, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, 32, 8
	banim_frame_oam 0x4000, 0x1000, 0xDC, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xDE, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x5F, 0, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_51_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x84, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x5, 48, -24
	banim_frame_oam 0x4000, 0x1000, 0x45, 48, -8
	banim_frame_oam 0x8000, 0x1000, 0xC2, 16, -56
	banim_frame_oam 0x0, 0x1000, 0xC1, 8, -56
	banim_frame_oam 0x8000, 0x1000, 0xC3, 24, -48
	banim_frame_oam 0x4000, 0x1000, 0x65, 32, -40
	banim_frame_oam 0x0, 0x1000, 0xE1, 16, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_52_l:
	banim_frame_oam 0x0, 0x9000, 0x8, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x88, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8C, 8, 0
	banim_frame_oam 0x0, 0x5000, 0xC8, 48, -24
	banim_frame_oam 0x4000, 0x9000, 0xC4, 16, -48
	banim_frame_oam 0x4000, 0x1000, 0xA6, 8, -56
	banim_frame_oam 0x0, 0x1000, 0xA5, 48, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_53_l:
	banim_frame_oam 0x0, 0x9000, 0x8, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x88, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8C, 8, 0
	banim_frame_oam 0x4000, 0x9000, 0xC4, 16, -48
	banim_frame_oam 0x4000, 0x1000, 0xA6, 8, -56
	banim_frame_oam 0x0, 0x1000, 0xA5, 48, -32
	banim_frame_oam 0x0, 0x5000, 0xCB, 48, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_54_l:
	banim_frame_oam 0x8000, 0xD000, 0xD, 16, -48
	banim_frame_oam 0x8000, 0x5000, 0x11, 8, -48
	banim_frame_oam 0x8000, 0x5000, 0x91, 8, -16
	banim_frame_oam 0x0, 0x5000, 0x12, 48, -24
	banim_frame_oam 0x4000, 0x1000, 0xF2, 8, -56
	banim_frame_oam 0x0, 0x1000, 0xA5, 48, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_55_l:
	banim_frame_oam 0x0, 0x9000, 0x15, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x19, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x95, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x99, 8, 0
	banim_frame_oam 0x0, 0x5000, 0xB2, 48, -24
	banim_frame_oam 0x0, 0x1000, 0xD4, 48, -8
	banim_frame_oam 0x4000, 0x5000, 0xF4, 16, -40
	banim_frame_oam 0x4000, 0x1000, 0xD5, 8, -56
	banim_frame_oam 0x4000, 0x1000, 0xD7, 16, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_56_l:
	banim_frame_oam 0x0, 0x9000, 0x1A, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x9A, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xDA, 8, 8
	banim_frame_oam 0x0, 0x5000, 0x3E, 16, -56
	banim_frame_oam 0x8000, 0x9000, 0x7E, 40, -24
	banim_frame_oam 0x4000, 0x1000, 0xFE, 40, 8
	banim_frame_oam 0x8000, 0x1000, 0xD9, 40, -40
	banim_frame_oam 0x8000, 0x1000, 0xC0, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xFA, 56, -8
	banim_frame_oam 0x0, 0x1000, 0xFC, 56, -16
	banim_frame_oam 0x0, 0x1000, 0xFD, 56, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_71_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x84, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x86, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -24, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_72_l:
	banim_frame_oam 0x4000, 0xD000, 0x7, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x87, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0x8B, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xC7, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0xCB, -32, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_73_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x13, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x15, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x8F, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x93, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x95, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCF, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD3, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD5, -32, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_74_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x84, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x86, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, -24, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_75_l:
	banim_frame_oam 0x0, 0x9000, 0x7, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0xB, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0xD, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x87, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x8B, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x8D, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC7, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xCD, -24, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_76_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x12, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x14, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x8E, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x92, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x94, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCE, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD2, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD4, -32, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_77_l:
	banim_frame_oam 0x0, 0x9000, 0x15, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x95, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x99, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x9B, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xD5, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xD9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xDB, -24, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_57_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x5, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x85, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xC5, 24, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_58_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0xA, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8A, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCA, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x4B, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xB, 24, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_59_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x10, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x12, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x8C, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x90, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x92, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xCC, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xD0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xD2, -24, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_60_l:
	banim_frame_oam 0x0, 0x9000, 0x13, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x17, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x93, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x97, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xD3, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD7, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x78, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x38, 24, -24
	banim_frame_oam 0x0, 0x1000, 0x18, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xF4, -32, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_61_l:
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0x1D, -32, -40
	banim_frame_oam 0x0, 0x1000, 0x3D, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x53, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xD3, 16, 8
	banim_frame_oam 0x8000, 0x1000, 0x38, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0xB4, -16, 0
	banim_frame_oam 0x8000, 0x5000, 0x78, -24, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_62_l:
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, -8
	banim_frame_oam 0x8000, 0x5000, 0x53, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xD3, 16, 8
	banim_frame_oam 0x8000, 0x1000, 0x38, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0xB4, -16, 0
	banim_frame_oam 0x8000, 0x5000, 0x78, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0xB9, -16, -40
	banim_frame_oam 0x0, 0x5000, 0xBD, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0xBF, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x59, -16, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_63_l:
	banim_frame_oam 0x0, 0x9000, 0x40, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x44, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x85, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x0, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x4, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0x6, -40, -40
	banim_frame_oam 0x8000, 0x1000, 0x45, 24, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_64_l:
	banim_frame_oam 0x0, 0x9000, 0x46, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x4A, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xC6, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x7, 0, -40
	banim_frame_oam 0x0, 0x5000, 0xB, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0xD, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x45, 24, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_65_l:
	banim_frame_oam 0x0, 0x9000, 0x4C, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x50, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0xE, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x12, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xCD, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xCC, 24, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_66_l:
	banim_frame_oam 0x0, 0x9000, 0x52, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x56, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0xD2, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xD6, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x13, 24, -40
	banim_frame_oam 0x0, 0x1000, 0x14, 16, -40
	banim_frame_oam 0x4000, 0x1000, 0x34, -8, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_67_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xA0, -8, -48
	banim_frame_oam 0x0, 0x5000, 0xA4, -24, -48
	banim_frame_oam 0x8000, 0x1000, 0xA6, -32, -48
	banim_frame_oam 0x4000, 0x5000, 0xE0, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xE6, -32, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_68_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -16, -56
	banim_frame_oam 0x8000, 0x5000, 0xB, -24, -56
	banim_frame_oam 0x4000, 0x5000, 0x87, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x8B, -24, -24
	banim_frame_oam 0x0, 0x9000, 0x20, 0, -16
	banim_frame_oam 0x8000, 0x9000, 0x24, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x26, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, 16, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_69_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, 8, -48
	banim_frame_oam 0x8000, 0x5000, 0xE, 0, -48
	banim_frame_oam 0x0, 0x9000, 0xF, -32, -56
	banim_frame_oam 0x4000, 0x5000, 0x8F, -32, -24
	banim_frame_oam 0x0, 0x9000, 0x20, 0, -16
	banim_frame_oam 0x8000, 0x9000, 0x24, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x26, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x0, 24, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_70_l:
	banim_frame_oam 0x0, 0x9000, 0x13, -16, -56
	banim_frame_oam 0x8000, 0x9000, 0x17, -32, -56
	banim_frame_oam 0x4000, 0x5000, 0x93, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, -32, -24
	banim_frame_oam 0x0, 0x9000, 0x20, 0, -16
	banim_frame_oam 0x8000, 0x9000, 0x24, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x26, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, 16, -24
	banim_frame_end
	.section .data.oam_r
banim_grkm_sp1_2_oam_r:
banim_grkm_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x65, 16, -16
	banim_frame_oam 0x0, 0x0, 0x5, -32, -24
	banim_frame_oam 0x8000, 0x0, 0x25, -32, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x26, -24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA6, -24, 0
	banim_frame_oam 0x4000, 0x0, 0x6, -32, -40
	banim_frame_oam 0x0, 0x0, 0x8, -16, -40
	banim_frame_oam 0x8000, 0x0, 0xB, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x6A, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x2A, 8, -32
	banim_frame_oam 0x0, 0x0, 0x9, 0, -40
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_grkm_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x10, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8C, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x90, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -24, 8
	banim_frame_oam 0x0, 0x0, 0xD0, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x71, 16, -16
	banim_frame_oam 0x0, 0x4000, 0x11, -40, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 0, 0
	banim_frame_oam 0x0, 0x0, 0xE3, 16, 8
	banim_frame_oam 0x0, 0x4000, 0xC0, -48, -32
	banim_frame_oam 0x0, 0x0, 0xE2, -8, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0xA, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -40, -8
	banim_frame_oam 0x0, 0x4000, 0x8A, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -40, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE8, 8, 0
	banim_frame_oam 0x0, 0x0, 0xE7, 8, -8
	banim_frame_oam 0x0, 0x4000, 0xC4, -56, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x10, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x8C, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x90, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -32, 8
	banim_frame_oam 0x0, 0x0, 0xD0, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x11, 8, -24
	banim_frame_oam 0x0, 0x0, 0x51, 8, -8
	banim_frame_oam 0x0, 0x4000, 0x12, -56, 0
	banim_frame_oam 0x8000, 0x0, 0x14, -40, 0
	banim_frame_oam 0x8000, 0x0, 0x91, -40, -32
	banim_frame_oam 0x0, 0x0, 0xD1, -40, -16
	banim_frame_oam 0x4000, 0x0, 0xED, -56, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x19, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x95, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x99, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xD5, -32, 8
	banim_frame_oam 0x0, 0x0, 0xD9, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x94, 8, -24
	banim_frame_oam 0x0, 0x0, 0xD4, 8, -8
	banim_frame_oam 0x0, 0x4000, 0x52, -56, 0
	banim_frame_oam 0x8000, 0x0, 0x54, -40, 0
	banim_frame_oam 0x0, 0x4000, 0x92, -48, -24
	banim_frame_oam 0x0, 0x0, 0xD2, 8, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0x84, -56, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -56, 8
	banim_frame_oam 0x0, 0x0, 0xC6, -40, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -32, 8
	banim_frame_oam 0x8000, 0x4000, 0x4, 0, -40
	banim_frame_oam 0x4000, 0x0, 0xE0, -56, -24
	banim_frame_oam 0x0, 0x0, 0xE2, -40, -24
	banim_frame_oam 0x0, 0x0, 0xA6, -40, 0
	banim_frame_oam 0x4000, 0x0, 0xE3, -56, -16
	banim_frame_oam 0x0, 0x0, 0xE5, -40, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0x27, -64, 0
	banim_frame_oam 0x0, 0x0, 0xA, -64, -8
	banim_frame_oam 0x4000, 0x0, 0x8, -48, 16
	banim_frame_oam 0x8000, 0x0, 0x66, -40, -16
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xE0, -56, -24
	banim_frame_oam 0x0, 0x0, 0xE2, -40, -24
	banim_frame_oam 0x4000, 0x0, 0xE3, -56, -16
	banim_frame_oam 0x0, 0x0, 0xE5, -40, -16
	banim_frame_oam 0x8000, 0x0, 0x5, 0, -40
	banim_frame_oam 0x8000, 0x0, 0x45, -8, -24
	banim_frame_oam 0x8000, 0x8000, 0x0, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x2, -16, -40
	banim_frame_oam 0x8000, 0x0, 0x3, -8, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -40, -40
	banim_frame_oam 0x8000, 0x4000, 0xF, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8B, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x8F, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCB, -40, 8
	banim_frame_oam 0x0, 0x0, 0xCF, -8, 8
	banim_frame_oam 0x0, 0x4000, 0x69, -56, -24
	banim_frame_oam 0x8000, 0x0, 0x88, -64, -8
	banim_frame_oam 0x0, 0x0, 0xC8, -64, 8
	banim_frame_oam 0x0, 0x4000, 0xA9, -56, 0
	banim_frame_oam 0x4000, 0x0, 0x67, -48, 16
	banim_frame_oam 0x0, 0x0, 0xEB, -64, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x6C, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0x70, -48, -16
	banim_frame_oam 0x4000, 0x8000, 0xB, -40, -40
	banim_frame_oam 0x4000, 0x4000, 0x4B, -40, -24
	banim_frame_oam 0x0, 0x0, 0x4F, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x10, -56, -24
	banim_frame_oam 0x4000, 0x0, 0x30, -64, -16
	banim_frame_oam 0x0, 0x0, 0xF, -8, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x4000, 0x36, -48, -16
	banim_frame_oam 0x8000, 0x0, 0xB6, -8, -24
	banim_frame_oam 0x0, 0x0, 0xF6, -8, -8
	banim_frame_oam 0x0, 0x8000, 0x32, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0xB2, -40, -8
	banim_frame_oam 0x4000, 0x4000, 0xF2, -40, 8
	banim_frame_oam 0x4000, 0x0, 0x12, -56, -24
	banim_frame_oam 0x4000, 0x0, 0x14, -64, -16
	banim_frame_oam 0x0, 0x0, 0xF0, -8, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x0, 0xDF, -56, -8
	banim_frame_oam 0x4000, 0x8000, 0xBA, -48, -8
	banim_frame_oam 0x4000, 0x4000, 0xFA, -48, 8
	banim_frame_oam 0x0, 0x0, 0x1D, -8, -48
	banim_frame_oam 0x0, 0x0, 0x1E, -8, -40
	banim_frame_oam 0x0, 0x8000, 0x3B, -40, -40
	banim_frame_oam 0x8000, 0x4000, 0x5F, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xBE, -16, -8
	banim_frame_oam 0x0, 0x0, 0xFE, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x5A, -48, -32
	banim_frame_oam 0x0, 0x0, 0x9A, -48, -16
	banim_frame_oam 0x8000, 0x0, 0x1A, -56, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x0, 0xDA, -56, -16
	banim_frame_oam 0x0, 0x8000, 0x17, -48, -32
	banim_frame_oam 0x8000, 0x8000, 0x1B, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x97, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x9B, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x9C, -8, -48
	banim_frame_oam 0x0, 0x0, 0xDB, -16, -40
	banim_frame_oam 0x0, 0x0, 0xDC, 0, -48
	banim_frame_oam 0x4000, 0x0, 0xF7, -40, -40
	banim_frame_oam 0x0, 0x0, 0xF9, -24, -40
	banim_frame_oam 0x0, 0x0, 0xD9, -56, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0x1B, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x9B, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x9C, -8, -48
	banim_frame_oam 0x0, 0x0, 0xDB, -16, -40
	banim_frame_oam 0x0, 0x0, 0xDC, 0, -48
	banim_frame_oam 0x4000, 0x0, 0xF7, -40, -40
	banim_frame_oam 0x0, 0x0, 0xF9, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x3D, -56, -24
	banim_frame_oam 0x8000, 0x4000, 0x3F, -40, -24
	banim_frame_oam 0x4000, 0x0, 0xBD, -56, 8
	banim_frame_oam 0x0, 0x0, 0xBF, -40, 8
	banim_frame_oam 0x8000, 0x8000, 0x19, -32, -32
	banim_frame_oam 0x0, 0x4000, 0x99, -32, 0
	banim_frame_oam 0x4000, 0x0, 0x17, -48, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -40, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -40, 8
	banim_frame_oam 0x8000, 0x0, 0x44, -8, -24
	banim_frame_oam 0x0, 0x0, 0x84, -8, -8
	banim_frame_oam 0x0, 0x4000, 0xA4, -56, -24
	banim_frame_oam 0x8000, 0x0, 0x45, -48, 0
	banim_frame_oam 0x0, 0x0, 0x85, -48, -32
	banim_frame_oam 0x8000, 0x0, 0x4, -8, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0x87, -40, -8
	banim_frame_oam 0x4000, 0x4000, 0xC7, -40, 8
	banim_frame_oam 0x8000, 0x4000, 0xB, -8, -40
	banim_frame_oam 0x0, 0x0, 0x8B, -8, -8
	banim_frame_oam 0x8000, 0x4000, 0x46, -48, -24
	banim_frame_oam 0x0, 0x0, 0xC6, -48, 8
	banim_frame_oam 0x0, 0x0, 0xEA, -8, -48
	banim_frame_oam 0x8000, 0x0, 0xBF, -56, -24
	banim_frame_oam 0x0, 0x0, 0xFF, -56, -8
	banim_frame_oam 0x0, 0x4000, 0xBD, -72, -24
	banim_frame_oam 0x4000, 0x0, 0xFD, -72, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x4000, 0x10, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x8C, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x90, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x0, 0x0, 0x12, -56, 8
	banim_frame_oam 0x4000, 0x0, 0xF6, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0xE, -32, -32
	banim_frame_oam 0x8000, 0x4000, 0xD, -40, -32
	banim_frame_oam 0x0, 0x0, 0x6C, -48, -8
	banim_frame_oam 0x0, 0x4000, 0x7A, -64, -24
	banim_frame_oam 0x8000, 0x0, 0x7C, -48, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0xCC, -48, -32
	banim_frame_oam 0x8000, 0x0, 0xD0, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xF1, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0x4E, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x50, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x8000, 0x4000, 0x74, -40, -16
	banim_frame_oam 0x0, 0x0, 0xD2, -56, 8
	banim_frame_oam 0x8000, 0x0, 0x93, -48, -8
	banim_frame_oam 0x0, 0x0, 0xD3, -48, 8
	banim_frame_oam 0x0, 0x0, 0x7F, -48, -16
	banim_frame_oam 0x0, 0x0, 0x5E, -56, -24
	banim_frame_oam 0x4000, 0x0, 0x7D, -64, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x8000, 0x4E, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x50, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x4000, 0x8000, 0x15, -48, -32
	banim_frame_oam 0x8000, 0x0, 0x19, -16, -32
	banim_frame_oam 0x0, 0x0, 0x59, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x58, -40, -16
	banim_frame_oam 0x0, 0x0, 0xD2, -56, 8
	banim_frame_oam 0x8000, 0x0, 0x93, -48, -8
	banim_frame_oam 0x0, 0x0, 0xD3, -48, 8
	banim_frame_oam 0x0, 0x0, 0x7F, -48, -16
	banim_frame_oam 0x0, 0x0, 0x5E, -56, -24
	banim_frame_oam 0x4000, 0x0, 0x7D, -64, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0x1A, -72, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_35_r:
	banim_frame_oam 0x8000, 0x0, 0xD9, -72, -16
	banim_frame_oam 0x0, 0x4000, 0x1D, -64, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_36_r:
	banim_frame_oam 0x8000, 0x0, 0xD9, -72, -16
	banim_frame_oam 0x0, 0x4000, 0x1D, -64, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_78_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0x10, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x8C, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x90, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x11, -8, -24
	banim_frame_oam 0x0, 0x0, 0x51, -8, -8
	banim_frame_oam 0x0, 0x0, 0x12, -56, 8
	banim_frame_oam 0x8000, 0x0, 0xDC, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xF6, -40, -40
	banim_frame_oam 0x0, 0x4000, 0xDA, -72, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_79_r:
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
	banim_frame_oam 0x8000, 0x0, 0xD9, -72, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_80_r:
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
	banim_frame_oam 0x8000, 0x0, 0xD9, -72, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -48, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -48, 0
	banim_frame_oam 0x0, 0x4000, 0x84, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xC0, -32, -40
	banim_frame_oam 0x0, 0x0, 0xC2, -16, -40
	banim_frame_oam 0x0, 0x0, 0xE1, -16, -48
	banim_frame_oam 0x8000, 0x0, 0xC3, -56, -16
	banim_frame_oam 0x0, 0x0, 0xE2, -56, 0
	banim_frame_end
banim_grkm_sp1_2_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -48, -32
	banim_frame_oam 0x8000, 0x8000, 0xA, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -48, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xC6, -40, -40
	banim_frame_oam 0x0, 0x0, 0xC8, -24, -40
	banim_frame_oam 0x0, 0x0, 0xC9, 0, -24
	banim_frame_oam 0x0, 0x0, 0xCA, -56, -8
	banim_frame_oam 0x4000, 0x0, 0xE7, -32, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -48, -32
	banim_frame_oam 0x8000, 0x8000, 0x10, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x12, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0x8C, -48, 0
	banim_frame_oam 0x0, 0x4000, 0x90, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x92, 0, 0
	banim_frame_oam 0x4000, 0x0, 0xCC, -32, -40
	banim_frame_oam 0x0, 0x0, 0xCE, -16, -40
	banim_frame_oam 0x0, 0x0, 0xCF, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD0, -40, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -32, -32
	banim_frame_oam 0x8000, 0x4000, 0x17, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x97, 0, 0
	banim_frame_oam 0x8000, 0x0, 0xD7, 8, -24
	banim_frame_oam 0x0, 0x4000, 0xD5, -48, -24
	banim_frame_oam 0x4000, 0x0, 0xF1, -40, -40
	banim_frame_oam 0x4000, 0x0, 0xD2, -24, -40
	banim_frame_oam 0x0, 0x0, 0xD4, -8, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x1C, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x98, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x9C, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xDC, 0, 8
	banim_frame_oam 0x0, 0x4000, 0x3E, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x7E, 16, -8
	banim_frame_oam 0x8000, 0x4000, 0x9E, -40, -40
	banim_frame_oam 0x0, 0x0, 0xFF, -48, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x4, -32, -24
	banim_frame_oam 0x0, 0x4000, 0x44, 16, 0
	banim_frame_oam 0x0, 0x0, 0xE1, 16, -24
	banim_frame_oam 0x0, 0x0, 0xE2, 16, -16
	banim_frame_oam 0x0, 0x0, 0xE3, -24, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0xA, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x8A, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -24, 8
	banim_frame_oam 0x0, 0x0, 0xCA, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x84, 16, 0
	banim_frame_oam 0x0, 0x4000, 0xC4, -40, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xF, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8B, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8F, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xAE, 24, -8
	banim_frame_oam 0x0, 0x0, 0xEE, 24, 8
	banim_frame_oam 0x8000, 0x0, 0xAF, 32, -8
	banim_frame_oam 0x0, 0x4000, 0xAB, -8, -40
	banim_frame_oam 0x4000, 0x0, 0xE8, -40, -32
	banim_frame_oam 0x0, 0x0, 0xEA, -24, -32
	banim_frame_oam 0x0, 0x0, 0xEC, -32, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0xB1, 24, -8
	banim_frame_oam 0x4000, 0x0, 0xF1, 24, 8
	banim_frame_oam 0x0, 0x8000, 0x11, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x95, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xB4, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x7D, -32, -40
	banim_frame_oam 0x0, 0x0, 0xF5, -32, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x1B, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x9B, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xBB, 24, -8
	banim_frame_oam 0x4000, 0x0, 0xFB, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 16
	banim_frame_oam 0x8000, 0x0, 0xB6, -32, -24
	banim_frame_oam 0x0, 0x4000, 0xB7, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xB9, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x1D, -32, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_31_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_32_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x84, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0x20, -24, -40
	banim_frame_oam 0x8000, 0x0, 0x24, 8, -40
	banim_frame_oam 0x4000, 0x4000, 0x60, -24, -24
	banim_frame_oam 0x0, 0x0, 0x64, 8, -24
	banim_frame_oam 0x0, 0x0, 0x0, -32, -40
	banim_frame_oam 0x0, 0x0, 0x1, -32, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x66, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x6A, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xE6, -24, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 8, 8
	banim_frame_oam 0x4000, 0x4000, 0x46, -24, -32
	banim_frame_oam 0x0, 0x0, 0x4A, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x9, -32, -24
	banim_frame_oam 0x4000, 0x0, 0x26, -32, -40
	banim_frame_oam 0x0, 0x0, 0x28, -16, -40
	banim_frame_oam 0x4000, 0x0, 0x7, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x1E, 16, -8
	banim_frame_oam 0x0, 0x0, 0x5E, 16, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_39_r:
	banim_frame_oam 0x0, 0x8000, 0x6B, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0xEB, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x2F, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0x2B, -8, -40
	banim_frame_oam 0x0, 0x0, 0xF, 24, -32
	banim_frame_oam 0x8000, 0x4000, 0x6F, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x90, 16, -16
	banim_frame_oam 0x0, 0x0, 0xD0, 16, 0
	banim_frame_oam 0x0, 0x0, 0x70, -32, -48
	banim_frame_oam 0x4000, 0x0, 0xB, -24, -48
	banim_frame_oam 0x4000, 0x0, 0xD, -24, -40
	banim_frame_oam 0x0, 0x0, 0x17, -16, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_40_r:
	banim_frame_oam 0x0, 0x4000, 0x92, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x94, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x51, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0xCB, -24, 0
	banim_frame_oam 0x0, 0x4000, 0xCF, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x90, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x6B, -24, -24
	banim_frame_oam 0x0, 0x0, 0xAB, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x34, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x72, -8, -24
	banim_frame_oam 0x0, 0x0, 0x74, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x2F, -32, -24
	banim_frame_oam 0x4000, 0x0, 0x10, 16, -32
	banim_frame_oam 0x0, 0x0, 0x50, 16, -40
	banim_frame_oam 0x4000, 0x0, 0x30, -24, -40
	banim_frame_oam 0x4000, 0x0, 0x12, -32, -48
	banim_frame_oam 0x0, 0x0, 0x14, -16, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_41_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -24, -24
	banim_frame_oam 0x4000, 0x0, 0x95, -24, 8
	banim_frame_oam 0x8000, 0x8000, 0x19, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x99, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x97, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x18, -32, -24
	banim_frame_oam 0x0, 0x0, 0x51, -16, -32
	banim_frame_oam 0x0, 0x4000, 0x92, -8, -16
	banim_frame_oam 0x0, 0x4000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x34, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x72, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x10, 16, -32
	banim_frame_oam 0x0, 0x0, 0x50, 16, -40
	banim_frame_oam 0x4000, 0x0, 0x30, -24, -40
	banim_frame_oam 0x4000, 0x0, 0x12, -32, -48
	banim_frame_oam 0x0, 0x0, 0x14, -16, -48
	banim_frame_oam 0x4000, 0x0, 0x77, -8, 0
	banim_frame_end
banim_grkm_sp1_2_oam_frame_42_r:
	banim_frame_oam 0x0, 0x4000, 0xB9, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xF5, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xD1, -24, -24
	banim_frame_oam 0x0, 0x4000, 0xD3, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x18, -32, -24
	banim_frame_oam 0x0, 0x0, 0x51, -16, -32
	banim_frame_oam 0x0, 0x4000, 0x92, -8, -16
	banim_frame_oam 0x0, 0x4000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x34, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x72, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x10, 16, -32
	banim_frame_oam 0x0, 0x0, 0x50, 16, -40
	banim_frame_oam 0x4000, 0x0, 0x30, -24, -40
	banim_frame_oam 0x4000, 0x0, 0x12, -32, -48
	banim_frame_oam 0x0, 0x0, 0x14, -16, -48
	banim_frame_oam 0x4000, 0x0, 0xD7, -8, 0
	banim_frame_oam 0x0, 0x4000, 0xB5, -24, -8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_43_r:
	banim_frame_oam 0x8000, 0x8000, 0x3B, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xBB, -24, 8
	banim_frame_oam 0x8000, 0x4000, 0x3F, 8, -24
	banim_frame_oam 0x0, 0x0, 0xBF, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xBD, -8, 8
	banim_frame_oam 0x8000, 0x0, 0xDF, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xDE, 16, -16
	banim_frame_oam 0x8000, 0x0, 0xDD, -32, -24
	banim_frame_oam 0x0, 0x0, 0x51, -16, -32
	banim_frame_oam 0x0, 0x4000, 0x92, -8, -16
	banim_frame_oam 0x0, 0x4000, 0x32, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x34, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x72, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x10, 16, -32
	banim_frame_oam 0x0, 0x0, 0x50, 16, -40
	banim_frame_oam 0x4000, 0x0, 0x30, -24, -40
	banim_frame_oam 0x4000, 0x0, 0x12, -32, -48
	banim_frame_oam 0x0, 0x0, 0x14, -16, -48
	banim_frame_oam 0x4000, 0x0, 0x9D, -8, 0
	banim_frame_end
banim_grkm_sp1_2_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -24, 8
	banim_frame_oam 0x0, 0x0, 0x84, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x25, 16, -16
	banim_frame_oam 0x0, 0x0, 0xA0, -32, -16
	banim_frame_oam 0x0, 0x4000, 0xC0, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xC2, 8, -40
	banim_frame_oam 0x4000, 0x0, 0xA1, -32, -48
	banim_frame_oam 0x0, 0x0, 0xA3, -16, -48
	banim_frame_oam 0x4000, 0x0, 0xA4, -24, -40
	banim_frame_oam 0x4000, 0x0, 0xC3, 16, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_45_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -32, -24
	banim_frame_oam 0x8000, 0x4000, 0xA, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0x86, -32, 8
	banim_frame_oam 0x0, 0x0, 0x8A, 0, 8
	banim_frame_oam 0x8000, 0x4000, 0x2B, 8, -16
	banim_frame_oam 0x0, 0x0, 0xB, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x3D, -16, -40
	banim_frame_oam 0x8000, 0x0, 0x3F, 0, -40
	banim_frame_oam 0x0, 0x0, 0x1D, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xBC, -48, -48
	banim_frame_oam 0x0, 0x0, 0xBE, -32, -48
	banim_frame_oam 0x4000, 0x0, 0xDC, -40, -40
	banim_frame_oam 0x0, 0x0, 0xDE, -24, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -40, -32
	banim_frame_oam 0x8000, 0x8000, 0x10, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x8C, -40, 0
	banim_frame_oam 0x0, 0x4000, 0x90, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xC8, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA8, -32, -40
	banim_frame_oam 0x0, 0x4000, 0xC6, -48, -48
	banim_frame_oam 0x0, 0x0, 0xA6, 8, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -32, -32
	banim_frame_oam 0x8000, 0x4000, 0x16, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0x92, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x96, 0, 0
	banim_frame_oam 0x0, 0x0, 0xD2, 8, -8
	banim_frame_oam 0x8000, 0x0, 0xD1, 8, -24
	banim_frame_oam 0x0, 0x4000, 0xCE, -56, 0
	banim_frame_oam 0x8000, 0x0, 0xD0, -40, 0
	banim_frame_oam 0x0, 0x0, 0xD5, -40, -24
	banim_frame_oam 0x0, 0x0, 0xD6, -40, -16
	banim_frame_oam 0x4000, 0x0, 0xFD, -24, -40
	banim_frame_oam 0x0, 0x0, 0xFF, -8, -40
	banim_frame_oam 0x4000, 0x0, 0xF9, -56, -32
	banim_frame_oam 0x0, 0x0, 0xFB, -40, -32
	banim_frame_oam 0x0, 0x0, 0x7F, -48, -40
	banim_frame_oam 0x0, 0x0, 0x9F, -40, -40
	banim_frame_oam 0x0, 0x0, 0xBF, -48, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_48_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -40, -40
	banim_frame_oam 0x8000, 0x4000, 0x1B, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x97, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x9B, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD7, -40, 8
	banim_frame_oam 0x0, 0x0, 0xDB, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x1C, 0, -24
	banim_frame_oam 0x0, 0x0, 0x5C, 0, -8
	banim_frame_oam 0x0, 0x4000, 0x7C, -64, 0
	banim_frame_oam 0x8000, 0x0, 0x7E, -48, 0
	banim_frame_oam 0x0, 0x0, 0x1E, -48, -16
	banim_frame_oam 0x4000, 0x0, 0xCB, -56, -24
	banim_frame_oam 0x4000, 0x0, 0xEB, -64, -16
	banim_frame_end
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
	banim_frame_oam 0x4000, 0x4000, 0xCA, -40, 8
	banim_frame_oam 0x0, 0x0, 0xCE, -8, 8
	banim_frame_oam 0x8000, 0x8000, 0xF, -48, -24
	banim_frame_oam 0x0, 0x8000, 0xB, -32, -40
	banim_frame_oam 0x4000, 0x8000, 0x8B, -32, -8
	banim_frame_oam 0x8000, 0x0, 0xA, -40, -40
	banim_frame_oam 0x4000, 0x0, 0xEB, -32, -48
	banim_frame_oam 0x0, 0x0, 0xED, -16, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_49_r:
	banim_frame_oam 0x4000, 0xC000, 0x10, -64, -40
	banim_frame_oam 0x4000, 0x8000, 0x90, -64, -8
	banim_frame_oam 0x4000, 0x8000, 0x94, -32, -8
	banim_frame_oam 0x4000, 0x4000, 0xD0, -64, 8
	banim_frame_oam 0x4000, 0x4000, 0xD4, -32, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -64, -40
	banim_frame_oam 0x8000, 0x8000, 0x1C, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x1E, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x98, -64, -8
	banim_frame_oam 0x0, 0x4000, 0x9C, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x9E, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -64, 8
	banim_frame_oam 0x4000, 0x0, 0xDC, -32, 8
	banim_frame_oam 0x0, 0x0, 0xDE, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x5F, -8, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_51_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x84, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x5, -64, -24
	banim_frame_oam 0x4000, 0x0, 0x45, -64, -8
	banim_frame_oam 0x8000, 0x0, 0xC2, -24, -56
	banim_frame_oam 0x0, 0x0, 0xC1, -16, -56
	banim_frame_oam 0x8000, 0x0, 0xC3, -32, -48
	banim_frame_oam 0x4000, 0x0, 0x65, -48, -40
	banim_frame_oam 0x0, 0x0, 0xE1, -24, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_52_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x88, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x8C, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xC8, -64, -24
	banim_frame_oam 0x4000, 0x8000, 0xC4, -48, -48
	banim_frame_oam 0x4000, 0x0, 0xA6, -24, -56
	banim_frame_oam 0x0, 0x0, 0xA5, -56, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_53_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x88, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x8C, -16, 0
	banim_frame_oam 0x4000, 0x8000, 0xC4, -48, -48
	banim_frame_oam 0x4000, 0x0, 0xA6, -24, -56
	banim_frame_oam 0x0, 0x0, 0xA5, -56, -32
	banim_frame_oam 0x0, 0x4000, 0xCB, -64, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_54_r:
	banim_frame_oam 0x8000, 0xC000, 0xD, -48, -48
	banim_frame_oam 0x8000, 0x4000, 0x11, -16, -48
	banim_frame_oam 0x8000, 0x4000, 0x91, -16, -16
	banim_frame_oam 0x0, 0x4000, 0x12, -64, -24
	banim_frame_oam 0x4000, 0x0, 0xF2, -24, -56
	banim_frame_oam 0x0, 0x0, 0xA5, -56, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_55_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -48, -32
	banim_frame_oam 0x8000, 0x4000, 0x19, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x95, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x99, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xB2, -64, -24
	banim_frame_oam 0x0, 0x0, 0xD4, -56, -8
	banim_frame_oam 0x4000, 0x4000, 0xF4, -48, -40
	banim_frame_oam 0x4000, 0x0, 0xD5, -24, -56
	banim_frame_oam 0x4000, 0x0, 0xD7, -32, -48
	banim_frame_end
banim_grkm_sp1_2_oam_frame_56_r:
	banim_frame_oam 0x0, 0x8000, 0x1A, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0x9A, -40, -8
	banim_frame_oam 0x4000, 0x4000, 0xDA, -40, 8
	banim_frame_oam 0x0, 0x4000, 0x3E, -32, -56
	banim_frame_oam 0x8000, 0x8000, 0x7E, -56, -24
	banim_frame_oam 0x4000, 0x0, 0xFE, -56, 8
	banim_frame_oam 0x8000, 0x0, 0xD9, -48, -40
	banim_frame_oam 0x8000, 0x0, 0xC0, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xFA, -72, -8
	banim_frame_oam 0x0, 0x0, 0xFC, -64, -16
	banim_frame_oam 0x0, 0x0, 0xFD, -64, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_71_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x84, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x86, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xC4, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 16, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_72_r:
	banim_frame_oam 0x4000, 0xC000, 0x7, -32, -40
	banim_frame_oam 0x4000, 0x8000, 0x87, -32, -8
	banim_frame_oam 0x4000, 0x8000, 0x8B, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xC7, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0xCB, 0, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_73_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x13, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x15, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x8F, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x93, 8, -8
	banim_frame_oam 0x8000, 0x0, 0x95, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xCF, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD3, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD5, 24, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_74_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x84, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x86, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xC4, 0, 8
	banim_frame_oam 0x0, 0x0, 0xC6, 16, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_75_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0xB, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0xD, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x87, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x8B, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x8D, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC7, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xCB, 0, 8
	banim_frame_oam 0x0, 0x0, 0xCD, 16, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_76_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x12, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x14, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x8E, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x92, 8, -8
	banim_frame_oam 0x8000, 0x0, 0x94, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xCE, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD2, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD4, 24, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_77_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x19, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x95, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x99, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x9B, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD5, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xD9, 0, 8
	banim_frame_oam 0x0, 0x0, 0xDB, 16, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_57_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x5, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x85, -32, -40
	banim_frame_oam 0x0, 0x0, 0xC5, -32, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_58_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0xA, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x8A, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -24, 8
	banim_frame_oam 0x0, 0x0, 0xCA, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x4B, 16, -16
	banim_frame_oam 0x8000, 0x0, 0xB, -32, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_59_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x10, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x12, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x8C, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x90, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x92, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xD0, 0, 8
	banim_frame_oam 0x0, 0x0, 0xD2, 16, 8
	banim_frame_end
banim_grkm_sp1_2_oam_frame_60_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x17, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x93, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x97, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD3, -24, 8
	banim_frame_oam 0x0, 0x0, 0xD7, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x78, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x38, -32, -24
	banim_frame_oam 0x0, 0x0, 0x18, 16, -40
	banim_frame_oam 0x0, 0x0, 0xF4, 24, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_61_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -40
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, -8
	banim_frame_oam 0x4000, 0x0, 0x1D, 16, -40
	banim_frame_oam 0x0, 0x0, 0x3D, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x53, -24, -24
	banim_frame_oam 0x0, 0x0, 0xD3, -24, 8
	banim_frame_oam 0x8000, 0x0, 0x38, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0xB4, -16, 0
	banim_frame_oam 0x8000, 0x4000, 0x78, 16, -16
	banim_frame_end
banim_grkm_sp1_2_oam_frame_62_r:
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, -8
	banim_frame_oam 0x8000, 0x4000, 0x53, -24, -24
	banim_frame_oam 0x0, 0x0, 0xD3, -24, 8
	banim_frame_oam 0x8000, 0x0, 0x38, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0xB4, -16, 0
	banim_frame_oam 0x8000, 0x4000, 0x78, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0xB9, -16, -40
	banim_frame_oam 0x0, 0x4000, 0xBD, 16, -40
	banim_frame_oam 0x8000, 0x0, 0xBF, 32, -40
	banim_frame_oam 0x4000, 0x8000, 0x59, -16, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_63_r:
	banim_frame_oam 0x0, 0x8000, 0x40, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x44, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x85, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x0, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x4, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x6, 32, -40
	banim_frame_oam 0x8000, 0x0, 0x45, -32, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_64_r:
	banim_frame_oam 0x0, 0x8000, 0x46, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x4A, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xC6, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0x7, -32, -40
	banim_frame_oam 0x0, 0x4000, 0xB, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xD, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x45, -32, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_65_r:
	banim_frame_oam 0x0, 0x8000, 0x4C, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x50, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0xE, -24, -32
	banim_frame_oam 0x8000, 0x0, 0x12, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xCD, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xCC, -32, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_66_r:
	banim_frame_oam 0x0, 0x8000, 0x52, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x56, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0xD2, -24, 0
	banim_frame_oam 0x0, 0x4000, 0xD6, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x13, -32, -40
	banim_frame_oam 0x0, 0x0, 0x14, -24, -40
	banim_frame_oam 0x4000, 0x0, 0x34, -8, -40
	banim_frame_end
banim_grkm_sp1_2_oam_frame_67_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -24
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -32, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 0, 8
	banim_frame_oam 0x0, 0x0, 0x86, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0xA0, -24, -48
	banim_frame_oam 0x0, 0x4000, 0xA4, 8, -48
	banim_frame_oam 0x8000, 0x0, 0xA6, 24, -48
	banim_frame_oam 0x4000, 0x4000, 0xE0, -24, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, 8, -32
	banim_frame_oam 0x0, 0x0, 0xE6, 24, -32
	banim_frame_end
banim_grkm_sp1_2_oam_frame_68_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -16, -56
	banim_frame_oam 0x8000, 0x4000, 0xB, 16, -56
	banim_frame_oam 0x4000, 0x4000, 0x87, -16, -24
	banim_frame_oam 0x0, 0x0, 0x8B, 16, -24
	banim_frame_oam 0x0, 0x8000, 0x20, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0x24, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x26, 16, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -32, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_69_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0xE, -8, -48
	banim_frame_oam 0x0, 0x8000, 0xF, 0, -56
	banim_frame_oam 0x4000, 0x4000, 0x8F, 0, -24
	banim_frame_oam 0x0, 0x8000, 0x20, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0x24, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x26, 16, -16
	banim_frame_oam 0x0, 0x0, 0x0, -32, -24
	banim_frame_end
banim_grkm_sp1_2_oam_frame_70_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -16, -56
	banim_frame_oam 0x8000, 0x8000, 0x17, 16, -56
	banim_frame_oam 0x4000, 0x4000, 0x93, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x97, 16, -24
	banim_frame_oam 0x0, 0x8000, 0x20, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0x24, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x26, 16, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -32, -24
	banim_frame_end
	.section .data.script
banim_grkm_sp1_2_script:
banim_grkm_sp1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 0, banim_grkm_sp1_2_oam_frame_0_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_0, 1, banim_grkm_sp1_2_oam_frame_1_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_0, 5, banim_grkm_sp1_2_oam_frame_2_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_1, 6, banim_grkm_sp1_2_oam_frame_3_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_1, 7, banim_grkm_sp1_2_oam_frame_4_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_sp1_sheet_1, 8, banim_grkm_sp1_2_oam_frame_5_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_1, 9, banim_grkm_sp1_2_oam_frame_6_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 10, banim_grkm_sp1_2_oam_frame_7_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 11, banim_grkm_sp1_2_oam_frame_8_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 12, banim_grkm_sp1_2_oam_frame_9_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 13, banim_grkm_sp1_2_oam_frame_10_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_2, 14, banim_grkm_sp1_2_oam_frame_11_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_1, 15, banim_grkm_sp1_2_oam_frame_12_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_2, 16, banim_grkm_sp1_2_oam_frame_13_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_2, 17, banim_grkm_sp1_2_oam_frame_14_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 18, banim_grkm_sp1_2_oam_frame_15_r - banim_grkm_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_grkm_sp1_sheet_3, 18, banim_grkm_sp1_2_oam_frame_15_r - banim_grkm_sp1_2_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 19, banim_grkm_sp1_2_oam_frame_16_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 20, banim_grkm_sp1_2_oam_frame_17_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 21, banim_grkm_sp1_2_oam_frame_18_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_3, 22, banim_grkm_sp1_2_oam_frame_19_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_3, 20, banim_grkm_sp1_2_oam_frame_17_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_sp1_sheet_4, 29, banim_grkm_sp1_2_oam_frame_20_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_4, 30, banim_grkm_sp1_2_oam_frame_21_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_4, 31, banim_grkm_sp1_2_oam_frame_22_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_sp1_sheet_4, 32, banim_grkm_sp1_2_oam_frame_23_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_4, 33, banim_grkm_sp1_2_oam_frame_24_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 34, banim_grkm_sp1_2_oam_frame_25_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 35, banim_grkm_sp1_2_oam_frame_26_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 36, banim_grkm_sp1_2_oam_frame_27_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 37, banim_grkm_sp1_2_oam_frame_28_r - banim_grkm_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_sp1_sheet_5, 38, banim_grkm_sp1_2_oam_frame_29_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 0, banim_grkm_sp1_2_oam_frame_0_r - banim_grkm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sp1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_7, 42, banim_grkm_sp1_2_oam_frame_33_r - banim_grkm_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_grkm_sp1_sheet_7, 42, banim_grkm_sp1_2_oam_frame_33_r - banim_grkm_sp1_2_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 2, banim_grkm_sp1_sheet_7, 42, banim_grkm_sp1_2_oam_frame_33_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 23, banim_grkm_sp1_2_oam_frame_34_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 24, banim_grkm_sp1_2_oam_frame_35_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_3, 25, banim_grkm_sp1_2_oam_frame_36_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_3, 23, banim_grkm_sp1_2_oam_frame_34_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sp1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 0, banim_grkm_sp1_2_oam_frame_0_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_8, 43, banim_grkm_sp1_2_oam_frame_37_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_8, 44, banim_grkm_sp1_2_oam_frame_38_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_8, 45, banim_grkm_sp1_2_oam_frame_39_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 16, banim_grkm_sp1_sheet_8, 46, banim_grkm_sp1_2_oam_frame_40_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_8, 47, banim_grkm_sp1_2_oam_frame_41_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_8, 48, banim_grkm_sp1_2_oam_frame_42_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_8, 49, banim_grkm_sp1_2_oam_frame_43_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 12, banim_grkm_sp1_sheet_8, 46, banim_grkm_sp1_2_oam_frame_40_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_8, 47, banim_grkm_sp1_2_oam_frame_41_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_8, 48, banim_grkm_sp1_2_oam_frame_42_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_8, 49, banim_grkm_sp1_2_oam_frame_43_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_8, 46, banim_grkm_sp1_2_oam_frame_40_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_9, 50, banim_grkm_sp1_2_oam_frame_44_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_9, 51, banim_grkm_sp1_2_oam_frame_45_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_9, 52, banim_grkm_sp1_2_oam_frame_46_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_sp1_sheet_9, 53, banim_grkm_sp1_2_oam_frame_47_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_9, 54, banim_grkm_sp1_2_oam_frame_48_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 10, banim_grkm_sp1_2_oam_frame_7_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 11, banim_grkm_sp1_2_oam_frame_8_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 12, banim_grkm_sp1_2_oam_frame_9_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 13, banim_grkm_sp1_2_oam_frame_10_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_6, 60, banim_grkm_sp1_2_oam_frame_49_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_6, 61, banim_grkm_sp1_2_oam_frame_50_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_7, 62, banim_grkm_sp1_2_oam_frame_51_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_7, 63, banim_grkm_sp1_2_oam_frame_52_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 6, banim_grkm_sp1_sheet_7, 64, banim_grkm_sp1_2_oam_frame_53_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 6, banim_grkm_sp1_sheet_7, 65, banim_grkm_sp1_2_oam_frame_54_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_7, 66, banim_grkm_sp1_2_oam_frame_55_r - banim_grkm_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_grkm_sp1_sheet_7, 67, banim_grkm_sp1_2_oam_frame_56_r - banim_grkm_sp1_2_oam_r
	banim_code_hit_critical_5
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 20, banim_grkm_sp1_2_oam_frame_17_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 21, banim_grkm_sp1_2_oam_frame_18_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_3, 22, banim_grkm_sp1_2_oam_frame_19_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_3, 20, banim_grkm_sp1_2_oam_frame_17_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_sp1_sheet_4, 29, banim_grkm_sp1_2_oam_frame_20_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_4, 30, banim_grkm_sp1_2_oam_frame_21_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_4, 31, banim_grkm_sp1_2_oam_frame_22_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_sp1_sheet_4, 32, banim_grkm_sp1_2_oam_frame_23_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_4, 33, banim_grkm_sp1_2_oam_frame_24_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 34, banim_grkm_sp1_2_oam_frame_25_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 35, banim_grkm_sp1_2_oam_frame_26_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 36, banim_grkm_sp1_2_oam_frame_27_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 37, banim_grkm_sp1_2_oam_frame_28_r - banim_grkm_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_sp1_sheet_5, 38, banim_grkm_sp1_2_oam_frame_29_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 0, banim_grkm_sp1_2_oam_frame_0_r - banim_grkm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sp1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 16, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 12, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_6, 41, banim_grkm_sp1_2_oam_frame_32_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_7, 42, banim_grkm_sp1_2_oam_frame_33_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_7, 42, banim_grkm_sp1_2_oam_frame_33_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 6, banim_grkm_sp1_sheet_7, 42, banim_grkm_sp1_2_oam_frame_33_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 6, banim_grkm_sp1_sheet_7, 42, banim_grkm_sp1_2_oam_frame_33_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_7, 42, banim_grkm_sp1_2_oam_frame_33_r - banim_grkm_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_grkm_sp1_sheet_7, 42, banim_grkm_sp1_2_oam_frame_33_r - banim_grkm_sp1_2_oam_r
	banim_code_hit_critical_5
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 23, banim_grkm_sp1_2_oam_frame_34_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 23, banim_grkm_sp1_2_oam_frame_34_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_3, 23, banim_grkm_sp1_2_oam_frame_34_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_3, 23, banim_grkm_sp1_2_oam_frame_34_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_sp1_sheet_5, 40, banim_grkm_sp1_2_oam_frame_31_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 39, banim_grkm_sp1_2_oam_frame_30_r - banim_grkm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sp1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_sp1_sheet_10, 75, banim_grkm_sp1_2_oam_frame_57_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_grkm_sp1_sheet_10, 76, banim_grkm_sp1_2_oam_frame_58_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_10, 77, banim_grkm_sp1_2_oam_frame_59_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_10, 78, banim_grkm_sp1_2_oam_frame_60_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 12, banim_grkm_sp1_sheet_10, 79, banim_grkm_sp1_2_oam_frame_61_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_10, 80, banim_grkm_sp1_2_oam_frame_62_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 8, banim_grkm_sp1_sheet_11, 81, banim_grkm_sp1_2_oam_frame_63_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_grkm_sp1_sheet_11, 82, banim_grkm_sp1_2_oam_frame_64_r - banim_grkm_sp1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_grkm_sp1_sheet_11, 83, banim_grkm_sp1_2_oam_frame_65_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_sp1_sheet_11, 84, banim_grkm_sp1_2_oam_frame_66_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_10, 75, banim_grkm_sp1_2_oam_frame_57_r - banim_grkm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sp1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_sp1_sheet_10, 75, banim_grkm_sp1_2_oam_frame_57_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_grkm_sp1_sheet_10, 76, banim_grkm_sp1_2_oam_frame_58_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_10, 77, banim_grkm_sp1_2_oam_frame_59_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_10, 79, banim_grkm_sp1_2_oam_frame_61_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_grkm_sp1_sheet_12, 85, banim_grkm_sp1_2_oam_frame_67_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_12, 86, banim_grkm_sp1_2_oam_frame_68_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_12, 87, banim_grkm_sp1_2_oam_frame_69_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_12, 88, banim_grkm_sp1_2_oam_frame_70_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 16, banim_grkm_sp1_sheet_10, 79, banim_grkm_sp1_2_oam_frame_61_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_10, 80, banim_grkm_sp1_2_oam_frame_62_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 8, banim_grkm_sp1_sheet_11, 81, banim_grkm_sp1_2_oam_frame_63_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_grkm_sp1_sheet_11, 82, banim_grkm_sp1_2_oam_frame_64_r - banim_grkm_sp1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_grkm_sp1_sheet_11, 83, banim_grkm_sp1_2_oam_frame_65_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_sp1_sheet_11, 84, banim_grkm_sp1_2_oam_frame_66_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_10, 75, banim_grkm_sp1_2_oam_frame_57_r - banim_grkm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sp1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sp1_sheet_13, 68, banim_grkm_sp1_2_oam_frame_71_r - banim_grkm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sp1_sheet_13, 69, banim_grkm_sp1_2_oam_frame_72_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_13, 70, banim_grkm_sp1_2_oam_frame_73_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sp1_sheet_13, 69, banim_grkm_sp1_2_oam_frame_72_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_13, 68, banim_grkm_sp1_2_oam_frame_71_r - banim_grkm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sp1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_grkm_sp1_sheet_14, 71, banim_grkm_sp1_2_oam_frame_74_r - banim_grkm_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_grkm_sp1_sheet_14, 72, banim_grkm_sp1_2_oam_frame_75_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_14, 73, banim_grkm_sp1_2_oam_frame_76_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_grkm_sp1_sheet_14, 74, banim_grkm_sp1_2_oam_frame_77_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_14, 71, banim_grkm_sp1_2_oam_frame_74_r - banim_grkm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_grkm_sp1_2_mode_stand_close:
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 0, banim_grkm_sp1_2_oam_frame_0_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_sp1_2_mode_stand:
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 0, banim_grkm_sp1_2_oam_frame_0_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_sp1_2_mode_stand_range:
	banim_code_frame 1, banim_grkm_sp1_sheet_14, 71, banim_grkm_sp1_2_oam_frame_74_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_grkm_sp1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 0, banim_grkm_sp1_2_oam_frame_0_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_0, 1, banim_grkm_sp1_2_oam_frame_1_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_0, 5, banim_grkm_sp1_2_oam_frame_2_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_1, 6, banim_grkm_sp1_2_oam_frame_3_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_1, 7, banim_grkm_sp1_2_oam_frame_4_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 2, banim_grkm_sp1_sheet_1, 8, banim_grkm_sp1_2_oam_frame_5_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_1, 9, banim_grkm_sp1_2_oam_frame_6_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 10, banim_grkm_sp1_2_oam_frame_7_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 11, banim_grkm_sp1_2_oam_frame_8_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 12, banim_grkm_sp1_2_oam_frame_9_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_2, 13, banim_grkm_sp1_2_oam_frame_10_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_2, 14, banim_grkm_sp1_2_oam_frame_11_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_1, 15, banim_grkm_sp1_2_oam_frame_12_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_2, 16, banim_grkm_sp1_2_oam_frame_13_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 5, banim_grkm_sp1_sheet_2, 17, banim_grkm_sp1_2_oam_frame_14_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 18, banim_grkm_sp1_2_oam_frame_15_r - banim_grkm_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_grkm_sp1_sheet_3, 18, banim_grkm_sp1_2_oam_frame_15_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 19, banim_grkm_sp1_2_oam_frame_16_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 26, banim_grkm_sp1_2_oam_frame_78_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 2, banim_grkm_sp1_sheet_3, 27, banim_grkm_sp1_2_oam_frame_79_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_3, 28, banim_grkm_sp1_2_oam_frame_80_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_3, 26, banim_grkm_sp1_2_oam_frame_78_r - banim_grkm_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_grkm_sp1_sheet_4, 29, banim_grkm_sp1_2_oam_frame_20_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_4, 30, banim_grkm_sp1_2_oam_frame_21_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_4, 31, banim_grkm_sp1_2_oam_frame_22_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 5, banim_grkm_sp1_sheet_4, 32, banim_grkm_sp1_2_oam_frame_23_r - banim_grkm_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 2, banim_grkm_sp1_sheet_4, 33, banim_grkm_sp1_2_oam_frame_24_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 34, banim_grkm_sp1_2_oam_frame_25_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 3, banim_grkm_sp1_sheet_5, 35, banim_grkm_sp1_2_oam_frame_26_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 36, banim_grkm_sp1_2_oam_frame_27_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 4, banim_grkm_sp1_sheet_5, 37, banim_grkm_sp1_2_oam_frame_28_r - banim_grkm_sp1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_grkm_sp1_sheet_5, 38, banim_grkm_sp1_2_oam_frame_29_r - banim_grkm_sp1_2_oam_r
	banim_code_frame 1, banim_grkm_sp1_sheet_0, 0, banim_grkm_sp1_2_oam_frame_0_r - banim_grkm_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_grkm_sp1_2_mode_attack_close - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_attack_close_back - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_attack_close_critical - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_attack_close_critical_back - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_attack_range - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_attack_range_critical - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_dodge_close - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_dodge_range - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_stand_close - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_stand - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_stand_range - banim_grkm_sp1_2_script
	.word banim_grkm_sp1_2_mode_attack_miss - banim_grkm_sp1_2_script
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

