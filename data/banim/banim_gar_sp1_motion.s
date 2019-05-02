@ vim:ft=armv4
	.global banim_gar_sp1_script
	.global banim_gar_sp1_oam_r
	.global banim_gar_sp1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xBC
	.section .data.oam_l
banim_gar_sp1_oam_l:
banim_gar_sp1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x21, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x25, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x27, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0xA1, 0, -8
	banim_frame_oam 0x0, 0x5000, 0xA5, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xA7, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xE1, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE7, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x4, -8, -48
	banim_frame_oam 0x0, 0x1000, 0x0, -40, -48
	banim_frame_oam 0x8000, 0x5000, 0x80, -32, -48
	banim_frame_oam 0x8000, 0x1000, 0x40, 32, -32
	banim_frame_oam 0x0, 0x1000, 0x7, -24, -48
	banim_frame_end
banim_gar_sp1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0xD000, 0x8, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0xC, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x8C, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x8D, -24, -16
	banim_frame_oam 0x0, 0x5000, 0x4D, -16, -64
	banim_frame_oam 0x8000, 0x1000, 0xAE, -24, -64
	banim_frame_oam 0x4000, 0x1000, 0x2D, 0, -56
	banim_frame_oam 0x0, 0x1000, 0x1, 24, -40
	banim_frame_oam 0x8000, 0x1000, 0x7F, 24, -16
	banim_frame_oam 0x0, 0x5000, 0x3E, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xED, -24, 8
	banim_frame_end
banim_gar_sp1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0xD000, 0xF, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0x13, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x93, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xD, -24, -56
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -56
	banim_frame_oam 0x8000, 0x1000, 0x14, 24, -40
	banim_frame_oam 0x8000, 0x1000, 0x94, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xDE, 24, -8
	banim_frame_oam 0x0, 0x1000, 0xBE, 32, -16
	banim_frame_oam 0x8000, 0x1000, 0x7E, 40, -16
	banim_frame_end
banim_gar_sp1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x55, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x59, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x5B, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0xD5, 0, 0
	banim_frame_oam 0x0, 0x5000, 0xD9, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xDB, -24, 0
	banim_frame_oam 0x0, 0x5000, 0x1A, -24, -48
	banim_frame_oam 0x8000, 0x1000, 0x15, 24, -48
	banim_frame_oam 0x4000, 0x1000, 0x37, 32, -8
	banim_frame_oam 0x0, 0x1000, 0x54, -16, -56
	banim_frame_end
banim_gar_sp1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -8, -56
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -56
	banim_frame_oam 0x8000, 0x5000, 0x6, -32, -56
	banim_frame_oam 0x8000, 0x9000, 0x84, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x86, -32, -24
	banim_frame_oam 0x8000, 0x1000, 0x7, -40, -56
	banim_frame_oam 0x0, 0x1000, 0x47, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x8, -24, -72
	banim_frame_oam 0x0, 0x1000, 0x67, -32, -64
	banim_frame_oam 0x8000, 0x1000, 0x87, 24, -40
	banim_frame_oam 0x0, 0x5000, 0x48, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0x88, 24, 0
	banim_frame_oam 0x4000, 0x5000, 0xE7, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -24, 8
	banim_frame_end
banim_gar_sp1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -56
	banim_frame_oam 0x8000, 0x9000, 0x10, -24, -56
	banim_frame_oam 0x8000, 0x5000, 0x12, -32, -56
	banim_frame_oam 0x4000, 0x9000, 0x8C, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x90, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x92, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xCC, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xD0, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xD2, -32, -8
	banim_frame_oam 0x0, 0x1000, 0x4B, 24, -40
	banim_frame_oam 0x0, 0x5000, 0x6A, 24, -24
	banim_frame_oam 0x4000, 0x5000, 0xEC, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF0, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x4A, 0, -72
	banim_frame_oam 0x4000, 0x9000, 0x13, -32, -72
	banim_frame_oam 0x0, 0x1000, 0x89, -40, -56
	banim_frame_end
banim_gar_sp1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0xD000, 0x17, -32, -64
	banim_frame_oam 0x4000, 0x9000, 0x97, 0, -32
	banim_frame_oam 0x4000, 0x9000, 0x9B, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0xD7, 0, -16
	banim_frame_oam 0x4000, 0x5000, 0xDB, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0x5F, -40, -56
	banim_frame_oam 0x4000, 0x9000, 0x53, -24, -80
	banim_frame_oam 0x0, 0x1000, 0xBF, -32, -72
	banim_frame_oam 0x0, 0x1000, 0xDF, 32, -16
	banim_frame_oam 0x0, 0x1000, 0x9F, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x3F, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF0, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xFF, -16, -8
	banim_frame_end
banim_gar_sp1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -64
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -64
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -64
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, -32
	banim_frame_oam 0x0, 0x5000, 0x84, -16, -32
	banim_frame_oam 0x8000, 0x1000, 0x86, -24, -32
	banim_frame_oam 0x4000, 0x5000, 0xC0, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xC4, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xC6, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x7, -24, -80
	banim_frame_oam 0x8000, 0x1000, 0xB, -32, -80
	banim_frame_oam 0x8000, 0x9000, 0x47, -40, -64
	banim_frame_oam 0x8000, 0x1000, 0xC7, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, 32, -16
	banim_frame_end
banim_gar_sp1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x6C, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x70, -24, -48
	banim_frame_oam 0x4000, 0x5000, 0xEC, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xF0, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0xE8, -16, -72
	banim_frame_oam 0x4000, 0x5000, 0xC8, -24, -80
	banim_frame_oam 0x4000, 0x9000, 0x2C, -8, -64
	banim_frame_oam 0x8000, 0x1000, 0x30, -16, -64
	banim_frame_oam 0x4000, 0x1000, 0x8A, -24, -88
	banim_frame_oam 0x0, 0x1000, 0x89, -24, -64
	banim_frame_oam 0x8000, 0x1000, 0x3F, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0xF1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x69, 24, -16
	banim_frame_oam 0x0, 0x1000, 0x6B, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x4B, 16, -24
	banim_frame_oam 0x0, 0x1000, 0x4A, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0xAA, -16, -8
	banim_frame_end
banim_gar_sp1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0xD000, 0x31, -32, -72
	banim_frame_oam 0x4000, 0x9000, 0xB1, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0xB5, -32, -40
	banim_frame_oam 0x4000, 0x1000, 0x17, -32, -80
	banim_frame_oam 0x4000, 0x1000, 0x14, -24, -88
	banim_frame_oam 0x0, 0x1000, 0x12, 16, -80
	banim_frame_oam 0x4000, 0x9000, 0x19, -24, -24
	banim_frame_oam 0x4000, 0x9000, 0x59, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x7F, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0x9E, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xF1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, -24, 8
	banim_frame_end
banim_gar_sp1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -64
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -64
	banim_frame_oam 0x8000, 0x5000, 0x6, -32, -64
	banim_frame_oam 0x0, 0x5000, 0x84, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x86, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x7, -32, -80
	banim_frame_oam 0x0, 0x1000, 0x1E, 0, -80
	banim_frame_oam 0x4000, 0x1000, 0x3E, 24, -24
	banim_frame_oam 0x8000, 0x1000, 0x5F, -40, -64
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x5E, 24, -48
	banim_frame_oam 0x4000, 0x5000, 0x80, -8, -32
	banim_frame_oam 0x0, 0x1000, 0xA3, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xA0, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xC3, -16, -16
	banim_frame_end
banim_gar_sp1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 8
	banim_frame_oam 0x8000, 0x9000, 0xF, -16, -72
	banim_frame_oam 0x8000, 0x5000, 0x11, -24, -72
	banim_frame_oam 0x8000, 0x9000, 0x8F, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x91, -24, -40
	banim_frame_oam 0x4000, 0x5000, 0xE7, -24, -80
	banim_frame_oam 0x0, 0x1000, 0x4A, 32, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, -40, -40
	banim_frame_oam 0x0, 0x5000, 0x67, -40, -64
	banim_frame_oam 0x4000, 0x1000, 0xA7, -40, -48
	banim_frame_oam 0x0, 0x1000, 0x47, -32, -72
	banim_frame_oam 0x0, 0x9000, 0xB, 0, -72
	banim_frame_oam 0x4000, 0x9000, 0x8B, 0, -40
	banim_frame_oam 0x4000, 0x5000, 0xCB, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xEC, 16, -16
	banim_frame_end
banim_gar_sp1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 8
	banim_frame_oam 0x0, 0xD000, 0x12, -32, -80
	banim_frame_oam 0x0, 0x1000, 0x9F, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x1A, -40, -72
	banim_frame_oam 0x0, 0x1000, 0xBF, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0x1B, -8, -88
	banim_frame_oam 0x0, 0x1000, 0x1D, -16, -88
	banim_frame_oam 0x0, 0x1000, 0xDF, 16, -16
	banim_frame_end
banim_gar_sp1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -48, -80
	banim_frame_oam 0x8000, 0x9000, 0x80, 8, -56
	banim_frame_oam 0x8000, 0x1000, 0x82, 24, -48
	banim_frame_oam 0x0, 0x1000, 0xC2, 24, -32
	banim_frame_oam 0x0, 0x5000, 0x83, -8, -96
	banim_frame_oam 0x4000, 0x9000, 0xC3, -40, -96
	banim_frame_oam 0x8000, 0x1000, 0x85, -56, -64
	banim_frame_oam 0x0, 0x1000, 0xE7, 0, -48
	banim_frame_oam 0x0, 0x9000, 0x8, -32, -48
	banim_frame_oam 0x0, 0x1000, 0xE2, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x86, -48, -48
	banim_frame_oam 0x4000, 0x5000, 0xC7, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE8, -40, 8
	banim_frame_oam 0x8000, 0x1000, 0x88, 16, -72
	banim_frame_end
banim_gar_sp1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0xD000, 0xC, -48, -88
	banim_frame_oam 0x4000, 0x5000, 0x8C, -16, -56
	banim_frame_oam 0x4000, 0x5000, 0x90, -48, -56
	banim_frame_oam 0x4000, 0x1000, 0xD2, -32, -96
	banim_frame_oam 0x8000, 0x1000, 0xAE, 16, -56
	banim_frame_oam 0x8000, 0x1000, 0xAD, 16, -72
	banim_frame_oam 0x0, 0x1000, 0xAC, 24, -64
	banim_frame_oam 0x4000, 0x5000, 0xAF, -40, -48
	banim_frame_oam 0x0, 0x1000, 0xB3, -48, -48
	banim_frame_oam 0x4000, 0x1000, 0xCF, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xD1, -32, -40
	banim_frame_oam 0x4000, 0x1000, 0xF0, -32, -32
	banim_frame_oam 0x8000, 0x1000, 0x89, -56, -64
	banim_frame_oam 0x4000, 0x5000, 0xEA, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xEE, -40, 8
	banim_frame_end
banim_gar_sp1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0xD000, 0x14, -40, -88
	banim_frame_oam 0x4000, 0x9000, 0x94, -8, -56
	banim_frame_oam 0x4000, 0x9000, 0x98, -40, -56
	banim_frame_oam 0x4000, 0x1000, 0xD4, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xD6, -32, -40
	banim_frame_oam 0x4000, 0x1000, 0xF5, -32, -32
	banim_frame_oam 0x0, 0x1000, 0xF4, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xF3, 24, -64
	banim_frame_oam 0x8000, 0x5000, 0x3F, -48, -80
	banim_frame_oam 0x0, 0x1000, 0xBF, -48, -48
	banim_frame_oam 0x4000, 0x1000, 0xD7, -32, -96
	banim_frame_oam 0x4000, 0x5000, 0xEA, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xEE, -40, 8
	banim_frame_end
banim_gar_sp1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -16, -72
	banim_frame_oam 0x8000, 0x5000, 0x8, -24, -72
	banim_frame_oam 0x4000, 0x9000, 0x80, 16, -40
	banim_frame_oam 0x4000, 0x9000, 0x84, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0x88, -24, -40
	banim_frame_oam 0x4000, 0x5000, 0xC0, 16, -24
	banim_frame_oam 0x4000, 0x5000, 0xC4, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xC8, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x9, 48, -24
	banim_frame_oam 0x0, 0x1000, 0x49, 48, -8
	banim_frame_oam 0x0, 0x1000, 0x69, 40, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -32, -80
	banim_frame_oam 0x0, 0x1000, 0xE2, -40, -80
	banim_frame_oam 0x0, 0x1000, 0xE3, -32, -72
	banim_frame_oam 0x4000, 0x5000, 0xE4, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xE8, -16, 8
	banim_frame_end
banim_gar_sp1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0xA, 16, -64
	banim_frame_oam 0x8000, 0x9000, 0xE, 0, -64
	banim_frame_oam 0x4000, 0x9000, 0x8A, 16, -32
	banim_frame_oam 0x4000, 0x5000, 0xCA, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x89, 48, -56
	banim_frame_oam 0x0, 0x1000, 0xC9, 40, -8
	banim_frame_oam 0x4000, 0x5000, 0x10, 0, -72
	banim_frame_oam 0x0, 0x5000, 0x30, -16, -64
	banim_frame_oam 0x8000, 0x1000, 0x1E, 48, -24
	banim_frame_oam 0x0, 0x5000, 0x70, 48, -8
	banim_frame_oam 0x4000, 0x5000, 0xEA, 24, 8
	banim_frame_oam 0x4000, 0x1000, 0xEE, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8E, 0, -32
	banim_frame_end
banim_gar_sp1_oam_frame_45_l:
	banim_frame_oam 0x4000, 0x5000, 0xEA, 24, 8
	banim_frame_oam 0x4000, 0x1000, 0xEE, 8, 8
	banim_frame_oam 0x8000, 0xD000, 0x14, 24, -72
	banim_frame_oam 0x8000, 0x5000, 0x18, 16, -72
	banim_frame_oam 0x8000, 0x5000, 0x98, 16, -40
	banim_frame_oam 0x8000, 0x1000, 0x33, 56, -64
	banim_frame_oam 0x0, 0x1000, 0x73, 56, -48
	banim_frame_oam 0x0, 0x1000, 0x32, 64, -56
	banim_frame_oam 0x4000, 0x1000, 0x92, 16, -80
	banim_frame_oam 0x4000, 0x5000, 0xF0, 16, -8
	banim_frame_oam 0x0, 0x5000, 0xB2, 48, -8
	banim_frame_oam 0x0, 0x1000, 0x72, 8, -40
	banim_frame_end
banim_gar_sp1_oam_frame_46_l:
	banim_frame_oam 0x4000, 0x5000, 0xEA, 24, 8
	banim_frame_oam 0x4000, 0x1000, 0xEE, 8, 8
	banim_frame_oam 0x8000, 0xD000, 0x19, 24, -64
	banim_frame_oam 0x8000, 0x5000, 0x1D, 16, -64
	banim_frame_oam 0x8000, 0x5000, 0x9D, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0x7E, 8, -40
	banim_frame_oam 0x0, 0x5000, 0xBE, 56, -64
	banim_frame_oam 0x4000, 0x1000, 0xFE, 56, -48
	banim_frame_oam 0x0, 0x5000, 0xB0, 16, -80
	banim_frame_oam 0x4000, 0x1000, 0xCE, 40, -72
	banim_frame_oam 0x0, 0x1000, 0xAF, 32, -72
	banim_frame_oam 0x8000, 0x1000, 0xB2, 56, -8
	banim_frame_oam 0x0, 0x1000, 0xAE, 40, 0
	banim_frame_end
banim_gar_sp1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0x70, 48, -8
	banim_frame_end
banim_gar_sp1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x9000, 0xA, 16, -64
	banim_frame_oam 0x8000, 0x9000, 0xE, 0, -64
	banim_frame_oam 0x4000, 0x9000, 0x8A, 16, -32
	banim_frame_oam 0x4000, 0x5000, 0xCA, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x89, 48, -56
	banim_frame_oam 0x0, 0x1000, 0xC9, 40, -8
	banim_frame_oam 0x4000, 0x5000, 0x10, 0, -72
	banim_frame_oam 0x0, 0x5000, 0x30, -16, -64
	banim_frame_oam 0x8000, 0x1000, 0x1E, 48, -24
	banim_frame_oam 0x4000, 0x5000, 0xEA, 24, 8
	banim_frame_oam 0x4000, 0x1000, 0xEE, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8E, 0, -32
	banim_frame_oam 0x0, 0x1000, 0x3F, 48, -8
	banim_frame_end
banim_gar_sp1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x5000, 0xEA, 24, 8
	banim_frame_oam 0x4000, 0x1000, 0xEE, 8, 8
	banim_frame_oam 0x8000, 0xD000, 0x14, 24, -72
	banim_frame_oam 0x8000, 0x5000, 0x18, 16, -72
	banim_frame_oam 0x8000, 0x5000, 0x98, 16, -40
	banim_frame_oam 0x8000, 0x1000, 0x33, 56, -64
	banim_frame_oam 0x0, 0x1000, 0x73, 56, -48
	banim_frame_oam 0x0, 0x1000, 0x32, 64, -56
	banim_frame_oam 0x4000, 0x1000, 0x92, 16, -80
	banim_frame_oam 0x4000, 0x5000, 0xF0, 16, -8
	banim_frame_oam 0x0, 0x1000, 0x72, 8, -40
	banim_frame_oam 0x0, 0x1000, 0x3F, 48, -8
	banim_frame_end
banim_gar_sp1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x5000, 0xEA, 24, 8
	banim_frame_oam 0x4000, 0x1000, 0xEE, 8, 8
	banim_frame_oam 0x8000, 0x5000, 0x1D, 16, -64
	banim_frame_oam 0x8000, 0x5000, 0x9D, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0x7E, 8, -40
	banim_frame_oam 0x0, 0x5000, 0xBE, 56, -64
	banim_frame_oam 0x4000, 0x1000, 0xFE, 56, -48
	banim_frame_oam 0x0, 0x5000, 0xB0, 16, -80
	banim_frame_oam 0x4000, 0x1000, 0xCE, 40, -72
	banim_frame_oam 0x0, 0x1000, 0xAF, 32, -72
	banim_frame_oam 0x0, 0x1000, 0xAE, 40, 0
	banim_frame_oam 0x0, 0x9000, 0x19, 24, -64
	banim_frame_oam 0x4000, 0x9000, 0x99, 24, -32
	banim_frame_oam 0x4000, 0x5000, 0xD9, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0xFA, 32, -8
	banim_frame_oam 0x0, 0x1000, 0xFC, 24, -8
	banim_frame_oam 0x0, 0x1000, 0x3F, 48, -8
	banim_frame_end
banim_gar_sp1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, 0
	banim_frame_oam 0x4000, 0x9000, 0xC0, 32, -56
	banim_frame_oam 0x0, 0x5000, 0xC4, 16, -56
	banim_frame_oam 0x4000, 0x5000, 0x4, 16, -40
	banim_frame_oam 0x0, 0x1000, 0x84, 8, -40
	banim_frame_oam 0x8000, 0x1000, 0x85, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0x24, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0x64, 24, 8
	banim_frame_end
banim_gar_sp1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x8, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0xC, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x88, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x8C, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8E, -24, 0
	banim_frame_oam 0x0, 0x5000, 0xA6, -24, -56
	banim_frame_oam 0x4000, 0x1000, 0xE6, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x66, 24, -48
	banim_frame_oam 0x0, 0x5000, 0xC8, 32, -8
	banim_frame_end
banim_gar_sp1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x13, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x8F, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x93, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xCF, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD3, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xCA, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0xCC, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0xEE, 32, -16
	banim_frame_oam 0x8000, 0x1000, 0xCD, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xF0, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x34, 16, -48
	banim_frame_oam 0x4000, 0x9000, 0x15, -16, -56
	banim_frame_oam 0x0, 0x1000, 0x14, -24, -56
	banim_frame_oam 0x8000, 0x1000, 0x3F, 24, -40
	banim_frame_end
banim_gar_sp1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x19, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x1D, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x99, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x9D, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xD9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xDD, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0x75, -16, -56
	banim_frame_oam 0x0, 0x1000, 0x58, -16, -64
	banim_frame_oam 0x0, 0x1000, 0x94, 16, -48
	banim_frame_oam 0x8000, 0x1000, 0x54, -24, -64
	banim_frame_oam 0x0, 0x1000, 0xF1, 24, -40
	banim_frame_oam 0x0, 0x5000, 0xB4, 32, -16
	banim_frame_oam 0x8000, 0x1000, 0xB6, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xF3, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xB7, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, 8
	banim_frame_end
banim_gar_sp1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_gar_sp1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_gar_sp1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_gar_sp1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_gar_sp1_oam_frame_29_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -48, -88
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, -56
	banim_frame_oam 0x4000, 0x5000, 0x84, -48, -56
	banim_frame_oam 0x4000, 0x9000, 0xA0, -40, -48
	banim_frame_oam 0x8000, 0x1000, 0xA4, -48, -48
	banim_frame_oam 0x4000, 0x5000, 0xE0, -40, -32
	banim_frame_oam 0x8000, 0x1000, 0xA5, 24, -64
	banim_frame_oam 0x8000, 0x1000, 0xA6, 16, -80
	banim_frame_oam 0x0, 0x1000, 0xE6, 16, -64
	banim_frame_oam 0x4000, 0x5000, 0xE7, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -40, 8
	banim_frame_end
banim_gar_sp1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0x5000, 0xE7, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -40, 8
	banim_frame_oam 0x4000, 0xD000, 0x8, -40, -88
	banim_frame_oam 0x4000, 0x5000, 0x88, -8, -56
	banim_frame_oam 0x4000, 0x5000, 0x8C, -40, -56
	banim_frame_oam 0x8000, 0x1000, 0xAF, -48, -72
	banim_frame_oam 0x0, 0x1000, 0xEF, -48, -56
	banim_frame_oam 0x8000, 0x1000, 0xAD, 24, -64
	banim_frame_oam 0x4000, 0x1000, 0xEC, -32, -32
	banim_frame_oam 0x0, 0x1000, 0xEE, -40, -32
	banim_frame_oam 0x4000, 0x9000, 0xA7, -32, -48
	banim_frame_oam 0x0, 0x5000, 0xAB, -48, -48
	banim_frame_end
banim_gar_sp1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x5000, 0xE7, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -40, 8
	banim_frame_oam 0x4000, 0xD000, 0x10, -48, -88
	banim_frame_oam 0x4000, 0x5000, 0x90, -16, -56
	banim_frame_oam 0x4000, 0x5000, 0x94, -48, -56
	banim_frame_oam 0x4000, 0x9000, 0xB3, -40, -48
	banim_frame_oam 0x8000, 0x1000, 0xB7, -48, -48
	banim_frame_oam 0x4000, 0x5000, 0xF3, -40, -32
	banim_frame_oam 0x0, 0x1000, 0xF7, -48, -32
	banim_frame_oam 0x0, 0x5000, 0xB0, 16, -72
	banim_frame_oam 0x4000, 0x1000, 0xF0, 16, -56
	banim_frame_end
banim_gar_sp1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x1000, 0xB2, -56, -64
	banim_frame_oam 0x0, 0x1000, 0xF2, -56, -48
	banim_frame_oam 0x8000, 0x1000, 0x98, 16, -88
	banim_frame_oam 0x0, 0x5000, 0xD8, 16, -64
	banim_frame_oam 0x0, 0x1000, 0xB9, 16, -72
	banim_frame_oam 0x0, 0x9000, 0x18, -16, -88
	banim_frame_oam 0x8000, 0x9000, 0x1C, -32, -88
	banim_frame_oam 0x8000, 0x5000, 0x1E, -40, -88
	banim_frame_oam 0x0, 0x9000, 0x9A, -32, -56
	banim_frame_oam 0x8000, 0x9000, 0x9E, -48, -56
	banim_frame_oam 0x8000, 0x1000, 0x3F, -48, -80
	banim_frame_oam 0x0, 0x1000, 0x7F, -48, -64
	banim_frame_oam 0x4000, 0x5000, 0xE7, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -40, 8
	banim_frame_end
banim_gar_sp1_oam_frame_33_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -48, -88
	banim_frame_oam 0x8000, 0x5000, 0x8, -56, -88
	banim_frame_oam 0x0, 0x9000, 0x83, -40, -56
	banim_frame_oam 0x8000, 0x5000, 0x87, -48, -56
	banim_frame_oam 0x8000, 0x1000, 0x68, -56, -64
	banim_frame_oam 0x0, 0x1000, 0xA8, -56, -48
	banim_frame_oam 0x0, 0x5000, 0xA0, 16, -72
	banim_frame_oam 0x4000, 0x1000, 0xE0, 16, -56
	banim_frame_oam 0x8000, 0x1000, 0xC2, 16, -88
	banim_frame_oam 0x4000, 0x5000, 0xE8, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, -40, 8
	banim_frame_oam 0x0, 0x1000, 0xA2, -8, -48
	banim_frame_end
banim_gar_sp1_oam_frame_34_l:
	banim_frame_oam 0x0, 0xD000, 0x17, -40, -48
	banim_frame_oam 0x8000, 0x5000, 0x36, 24, -40
	banim_frame_oam 0x8000, 0x1000, 0x7F, 32, -32
	banim_frame_oam 0x0, 0x1000, 0xBF, -48, -48
	banim_frame_end
banim_gar_sp1_oam_frame_35_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x5, -32, -48
	banim_frame_oam 0x8000, 0x1000, 0x4, -40, -48
	banim_frame_oam 0x8000, 0x1000, 0x44, -48, -56
	banim_frame_oam 0x0, 0x1000, 0x84, -40, -32
	banim_frame_oam 0x8000, 0x1000, 0xA4, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xE4, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xE5, 8, -40
	banim_frame_oam 0x8000, 0x1000, 0xA5, 16, -32
	banim_frame_oam 0x0, 0x1000, 0x85, 24, -32
	banim_frame_end
banim_gar_sp1_oam_frame_36_l:
	banim_frame_oam 0x8000, 0xD000, 0x7, -32, -48
	banim_frame_oam 0x8000, 0x5000, 0xB, -40, -56
	banim_frame_oam 0x8000, 0x1000, 0x8B, -48, -56
	banim_frame_oam 0x0, 0x1000, 0x86, -56, -56
	banim_frame_oam 0x8000, 0x1000, 0xA6, -48, -40
	banim_frame_oam 0x8000, 0x1000, 0xCB, 8, -40
	banim_frame_oam 0x8000, 0x5000, 0x6, 0, -48
	banim_frame_oam 0x0, 0x1000, 0xE6, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0x7E, -24, -56
	banim_frame_oam 0x0, 0x1000, 0x5E, -32, -56
	banim_frame_oam 0x0, 0x1000, 0x3E, 16, -40
	banim_frame_end
banim_gar_sp1_oam_frame_37_l:
	banim_frame_oam 0x8000, 0xD000, 0xC, -32, -48
	banim_frame_oam 0x4000, 0x1000, 0x90, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xB0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0x70, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0x9E, -48, -56
	banim_frame_oam 0x0, 0x1000, 0x1E, -56, -56
	banim_frame_oam 0x0, 0x5000, 0x10, -48, -48
	banim_frame_oam 0x4000, 0x1000, 0x50, -48, -32
	banim_frame_oam 0x4000, 0x1000, 0xF0, -24, -56
	banim_frame_oam 0x0, 0x1000, 0x71, -32, -56
	banim_frame_end
banim_gar_sp1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0xD000, 0x12, -24, -48
	banim_frame_oam 0x0, 0x5000, 0x16, -40, -48
	banim_frame_oam 0x0, 0x5000, 0xD6, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xB7, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x97, 24, -32
	banim_frame_oam 0x4000, 0x1000, 0xBE, 24, -40
	banim_frame_oam 0x8000, 0x1000, 0x96, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xD1, -48, -48
	banim_frame_oam 0x0, 0x1000, 0xB1, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x56, -40, -32
	banim_frame_end
banim_gar_sp1_oam_frame_39_l:
	banim_frame_oam 0x8000, 0xD000, 0x18, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x1C, -32, -48
	banim_frame_oam 0x8000, 0x1000, 0x9C, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x9D, -32, 8
	banim_frame_oam 0x0, 0x5000, 0xDE, 8, -8
	banim_frame_oam 0x0, 0x5000, 0xDC, 8, -40
	banim_frame_oam 0x8000, 0x1000, 0x5D, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0x1D, -40, -48
	banim_frame_end
banim_gar_sp1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x24, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0xA0, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xA4, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x6, -40, -48
	banim_frame_oam 0x0, 0x1000, 0xC6, -48, -48
	banim_frame_oam 0x8000, 0x1000, 0x86, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x46, 16, -32
	banim_frame_oam 0x0, 0x1000, 0xE6, -40, -24
	banim_frame_end
banim_gar_sp1_oam_frame_41_l:
	banim_frame_oam 0x8000, 0xD000, 0x8, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0xC, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x8C, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0xD, -24, -48
	banim_frame_oam 0x8000, 0x1000, 0x8D, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xED, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x7, -32, -48
	banim_frame_oam 0x0, 0x1000, 0xCD, -40, -48
	banim_frame_oam 0x8000, 0x1000, 0x3F, -32, -32
	banim_frame_oam 0x8000, 0x5000, 0x47, 24, -32
	banim_frame_oam 0x8000, 0x1000, 0xC7, 32, -24
	banim_frame_end
banim_gar_sp1_oam_frame_42_l:
	banim_frame_oam 0x8000, 0xD000, 0xF, -8, -48
	banim_frame_oam 0x8000, 0x9000, 0x13, -24, -48
	banim_frame_oam 0x8000, 0x9000, 0x93, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x4E, 24, -32
	banim_frame_oam 0x8000, 0x1000, 0xCE, 32, -24
	banim_frame_oam 0x8000, 0x5000, 0x7F, -32, -48
	banim_frame_end
banim_gar_sp1_oam_frame_43_l:
	banim_frame_oam 0x8000, 0xD000, 0x16, -8, -48
	banim_frame_oam 0x8000, 0x9000, 0x1A, -24, -48
	banim_frame_oam 0x8000, 0x9000, 0x9A, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x55, 24, -32
	banim_frame_oam 0x8000, 0x1000, 0xD5, 32, -24
	banim_frame_oam 0x8000, 0x5000, 0x1E, -32, -48
	banim_frame_oam 0x0, 0x1000, 0xFF, -40, -48
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
	banim_frame_oam 0x0, 0x1000, 0x10FF, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x10FF, -8, -8
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
	.section .data.oam_r
banim_gar_sp1_oam_r:
banim_gar_sp1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x21, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x25, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x27, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0xA1, -32, -8
	banim_frame_oam 0x0, 0x4000, 0xA5, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xA7, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE1, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xE5, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE7, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x4, -8, -48
	banim_frame_oam 0x0, 0x0, 0x0, 32, -48
	banim_frame_oam 0x8000, 0x4000, 0x80, 24, -48
	banim_frame_oam 0x8000, 0x0, 0x40, -40, -32
	banim_frame_oam 0x0, 0x0, 0x7, 16, -48
	banim_frame_end
banim_gar_sp1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0xC000, 0x8, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0xC, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x8C, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x8D, 16, -16
	banim_frame_oam 0x0, 0x4000, 0x4D, 0, -64
	banim_frame_oam 0x8000, 0x0, 0xAE, 16, -64
	banim_frame_oam 0x4000, 0x0, 0x2D, -16, -56
	banim_frame_oam 0x0, 0x0, 0x1, -32, -40
	banim_frame_oam 0x8000, 0x0, 0x7F, -32, -16
	banim_frame_oam 0x0, 0x4000, 0x3E, -48, -16
	banim_frame_oam 0x0, 0x0, 0xED, 16, 8
	banim_frame_end
banim_gar_sp1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0xC000, 0xF, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0x13, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x93, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xD, 8, -56
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -56
	banim_frame_oam 0x8000, 0x0, 0x14, -32, -40
	banim_frame_oam 0x8000, 0x0, 0x94, 16, -16
	banim_frame_oam 0x0, 0x0, 0xF4, 16, 8
	banim_frame_oam 0x0, 0x4000, 0xDE, -40, -8
	banim_frame_oam 0x0, 0x0, 0xBE, -40, -16
	banim_frame_oam 0x8000, 0x0, 0x7E, -48, -16
	banim_frame_end
banim_gar_sp1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x55, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x59, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x5B, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0xD5, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD9, 0, 0
	banim_frame_oam 0x8000, 0x0, 0xDB, 16, 0
	banim_frame_oam 0x0, 0x4000, 0x1A, 8, -48
	banim_frame_oam 0x8000, 0x0, 0x15, -32, -48
	banim_frame_oam 0x4000, 0x0, 0x37, -48, -8
	banim_frame_oam 0x0, 0x0, 0x54, 8, -56
	banim_frame_end
banim_gar_sp1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -24, -56
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -56
	banim_frame_oam 0x8000, 0x4000, 0x6, 24, -56
	banim_frame_oam 0x8000, 0x8000, 0x84, 8, -24
	banim_frame_oam 0x8000, 0x4000, 0x86, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x7, 32, -56
	banim_frame_oam 0x0, 0x0, 0x47, 32, -40
	banim_frame_oam 0x4000, 0x8000, 0x8, -8, -72
	banim_frame_oam 0x0, 0x0, 0x67, 24, -64
	banim_frame_oam 0x8000, 0x0, 0x87, -32, -40
	banim_frame_oam 0x0, 0x4000, 0x48, -40, -16
	banim_frame_oam 0x8000, 0x0, 0x88, -32, 0
	banim_frame_oam 0x4000, 0x4000, 0xE7, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 16, 8
	banim_frame_end
banim_gar_sp1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -56
	banim_frame_oam 0x8000, 0x8000, 0x10, 8, -56
	banim_frame_oam 0x8000, 0x4000, 0x12, 24, -56
	banim_frame_oam 0x4000, 0x8000, 0x8C, -24, -24
	banim_frame_oam 0x0, 0x4000, 0x90, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x92, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xCC, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xD0, 8, -8
	banim_frame_oam 0x0, 0x0, 0xD2, 24, -8
	banim_frame_oam 0x0, 0x0, 0x4B, -32, -40
	banim_frame_oam 0x0, 0x4000, 0x6A, -40, -24
	banim_frame_oam 0x4000, 0x4000, 0xEC, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF0, 16, 8
	banim_frame_oam 0x0, 0x0, 0x4A, -8, -72
	banim_frame_oam 0x4000, 0x8000, 0x13, 0, -72
	banim_frame_oam 0x0, 0x0, 0x89, 32, -56
	banim_frame_end
banim_gar_sp1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0xC000, 0x17, -32, -64
	banim_frame_oam 0x4000, 0x8000, 0x97, -32, -32
	banim_frame_oam 0x4000, 0x8000, 0x9B, 0, -32
	banim_frame_oam 0x4000, 0x4000, 0xD7, -32, -16
	banim_frame_oam 0x4000, 0x4000, 0xDB, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x5F, 32, -56
	banim_frame_oam 0x4000, 0x8000, 0x53, -8, -80
	banim_frame_oam 0x0, 0x0, 0xBF, 24, -72
	banim_frame_oam 0x0, 0x0, 0xDF, -40, -16
	banim_frame_oam 0x0, 0x0, 0x9F, 32, -40
	banim_frame_oam 0x0, 0x0, 0x3F, -24, -8
	banim_frame_oam 0x4000, 0x4000, 0xEC, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF0, 16, 8
	banim_frame_oam 0x0, 0x0, 0xFF, 8, -8
	banim_frame_end
banim_gar_sp1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -64
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -64
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -64
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, -32
	banim_frame_oam 0x0, 0x4000, 0x84, 0, -32
	banim_frame_oam 0x8000, 0x0, 0x86, 16, -32
	banim_frame_oam 0x4000, 0x4000, 0xC0, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xC4, 0, -16
	banim_frame_oam 0x0, 0x0, 0xC6, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x7, -8, -80
	banim_frame_oam 0x8000, 0x0, 0xB, 24, -80
	banim_frame_oam 0x8000, 0x8000, 0x47, 24, -64
	banim_frame_oam 0x8000, 0x0, 0xC7, 24, -32
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE5, -40, -16
	banim_frame_end
banim_gar_sp1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x6C, -16, -48
	banim_frame_oam 0x8000, 0x4000, 0x70, 16, -48
	banim_frame_oam 0x4000, 0x4000, 0xEC, -16, -16
	banim_frame_oam 0x0, 0x0, 0xF0, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xE8, -16, -72
	banim_frame_oam 0x4000, 0x4000, 0xC8, -8, -80
	banim_frame_oam 0x4000, 0x8000, 0x2C, -24, -64
	banim_frame_oam 0x8000, 0x0, 0x30, 8, -64
	banim_frame_oam 0x4000, 0x0, 0x8A, 8, -88
	banim_frame_oam 0x0, 0x0, 0x89, 16, -64
	banim_frame_oam 0x8000, 0x0, 0x3F, 24, -40
	banim_frame_oam 0x4000, 0x4000, 0xF1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF5, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x69, -40, -16
	banim_frame_oam 0x0, 0x0, 0x6B, -24, -16
	banim_frame_oam 0x0, 0x0, 0x4B, -24, -24
	banim_frame_oam 0x0, 0x0, 0x4A, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xAA, 0, -8
	banim_frame_end
banim_gar_sp1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0xC000, 0x31, -32, -72
	banim_frame_oam 0x4000, 0x8000, 0xB1, -32, -40
	banim_frame_oam 0x4000, 0x8000, 0xB5, 0, -40
	banim_frame_oam 0x4000, 0x0, 0x17, 16, -80
	banim_frame_oam 0x4000, 0x0, 0x14, 8, -88
	banim_frame_oam 0x0, 0x0, 0x12, -24, -80
	banim_frame_oam 0x4000, 0x8000, 0x19, -8, -24
	banim_frame_oam 0x4000, 0x8000, 0x59, -40, -24
	banim_frame_oam 0x0, 0x0, 0x7F, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x9E, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xF1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF5, 16, 8
	banim_frame_end
banim_gar_sp1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -64
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -64
	banim_frame_oam 0x8000, 0x4000, 0x6, 24, -64
	banim_frame_oam 0x0, 0x4000, 0x84, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x86, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x7, 0, -80
	banim_frame_oam 0x0, 0x0, 0x1E, -8, -80
	banim_frame_oam 0x4000, 0x0, 0x3E, -40, -24
	banim_frame_oam 0x8000, 0x0, 0x5F, 32, -64
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 8
	banim_frame_oam 0x0, 0x0, 0x5E, -32, -48
	banim_frame_oam 0x4000, 0x4000, 0x80, -24, -32
	banim_frame_oam 0x0, 0x0, 0xA3, 0, -24
	banim_frame_oam 0x0, 0x4000, 0xA0, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xC3, 0, -16
	banim_frame_end
banim_gar_sp1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 8
	banim_frame_oam 0x8000, 0x8000, 0xF, 0, -72
	banim_frame_oam 0x8000, 0x4000, 0x11, 16, -72
	banim_frame_oam 0x8000, 0x8000, 0x8F, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x91, 16, -40
	banim_frame_oam 0x4000, 0x4000, 0xE7, -8, -80
	banim_frame_oam 0x0, 0x0, 0x4A, -40, -24
	banim_frame_oam 0x0, 0x0, 0xC8, 32, -40
	banim_frame_oam 0x0, 0x4000, 0x67, 24, -64
	banim_frame_oam 0x4000, 0x0, 0xA7, 24, -48
	banim_frame_oam 0x0, 0x0, 0x47, 24, -72
	banim_frame_oam 0x0, 0x8000, 0xB, -32, -72
	banim_frame_oam 0x4000, 0x8000, 0x8B, -32, -40
	banim_frame_oam 0x4000, 0x4000, 0xCB, -32, -24
	banim_frame_oam 0x0, 0x0, 0xEC, -24, -16
	banim_frame_end
banim_gar_sp1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 8
	banim_frame_oam 0x0, 0xC000, 0x12, -32, -80
	banim_frame_oam 0x0, 0x0, 0x9F, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x1A, 32, -72
	banim_frame_oam 0x0, 0x0, 0xBF, -40, -24
	banim_frame_oam 0x4000, 0x0, 0x1B, -8, -88
	banim_frame_oam 0x0, 0x0, 0x1D, 8, -88
	banim_frame_oam 0x0, 0x0, 0xDF, -24, -16
	banim_frame_end
banim_gar_sp1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -16, -80
	banim_frame_oam 0x8000, 0x8000, 0x80, -24, -56
	banim_frame_oam 0x8000, 0x0, 0x82, -32, -48
	banim_frame_oam 0x0, 0x0, 0xC2, -32, -32
	banim_frame_oam 0x0, 0x4000, 0x83, -8, -96
	banim_frame_oam 0x4000, 0x8000, 0xC3, 8, -96
	banim_frame_oam 0x8000, 0x0, 0x85, 48, -64
	banim_frame_oam 0x0, 0x0, 0xE7, -8, -48
	banim_frame_oam 0x0, 0x8000, 0x8, 0, -48
	banim_frame_oam 0x0, 0x0, 0xE2, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x86, 32, -48
	banim_frame_oam 0x4000, 0x4000, 0xC7, -16, 8
	banim_frame_oam 0x0, 0x0, 0xCB, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE8, 24, 8
	banim_frame_oam 0x8000, 0x0, 0x88, -24, -72
	banim_frame_end
banim_gar_sp1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0xC000, 0xC, -16, -88
	banim_frame_oam 0x4000, 0x4000, 0x8C, -16, -56
	banim_frame_oam 0x4000, 0x4000, 0x90, 16, -56
	banim_frame_oam 0x4000, 0x0, 0xD2, 16, -96
	banim_frame_oam 0x8000, 0x0, 0xAE, -24, -56
	banim_frame_oam 0x8000, 0x0, 0xAD, -24, -72
	banim_frame_oam 0x0, 0x0, 0xAC, -32, -64
	banim_frame_oam 0x4000, 0x4000, 0xAF, 8, -48
	banim_frame_oam 0x0, 0x0, 0xB3, 40, -48
	banim_frame_oam 0x4000, 0x0, 0xCF, 8, -40
	banim_frame_oam 0x0, 0x0, 0xD1, 24, -40
	banim_frame_oam 0x4000, 0x0, 0xF0, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x89, 48, -64
	banim_frame_oam 0x4000, 0x4000, 0xEA, -8, 8
	banim_frame_oam 0x4000, 0x0, 0xEE, 24, 8
	banim_frame_end
banim_gar_sp1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0xC000, 0x14, -24, -88
	banim_frame_oam 0x4000, 0x8000, 0x94, -24, -56
	banim_frame_oam 0x4000, 0x8000, 0x98, 8, -56
	banim_frame_oam 0x4000, 0x0, 0xD4, 8, -40
	banim_frame_oam 0x0, 0x0, 0xD6, 24, -40
	banim_frame_oam 0x4000, 0x0, 0xF5, 16, -32
	banim_frame_oam 0x0, 0x0, 0xF4, -24, -40
	banim_frame_oam 0x0, 0x0, 0xF3, -32, -64
	banim_frame_oam 0x8000, 0x4000, 0x3F, 40, -80
	banim_frame_oam 0x0, 0x0, 0xBF, 40, -48
	banim_frame_oam 0x4000, 0x0, 0xD7, 16, -96
	banim_frame_oam 0x4000, 0x4000, 0xEA, -8, 8
	banim_frame_oam 0x4000, 0x0, 0xEE, 24, 8
	banim_frame_end
banim_gar_sp1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -48, -72
	banim_frame_oam 0x8000, 0x4000, 0x8, 16, -72
	banim_frame_oam 0x4000, 0x8000, 0x80, -48, -40
	banim_frame_oam 0x4000, 0x8000, 0x84, -16, -40
	banim_frame_oam 0x8000, 0x0, 0x88, 16, -40
	banim_frame_oam 0x4000, 0x4000, 0xC0, -48, -24
	banim_frame_oam 0x4000, 0x4000, 0xC4, -16, -24
	banim_frame_oam 0x0, 0x0, 0xC8, 16, -24
	banim_frame_oam 0x8000, 0x0, 0x9, -56, -24
	banim_frame_oam 0x0, 0x0, 0x49, -56, -8
	banim_frame_oam 0x0, 0x0, 0x69, -48, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, 16, -80
	banim_frame_oam 0x0, 0x0, 0xE2, 32, -80
	banim_frame_oam 0x0, 0x0, 0xE3, 24, -72
	banim_frame_oam 0x4000, 0x4000, 0xE4, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xE8, 0, 8
	banim_frame_end
banim_gar_sp1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -48, -64
	banim_frame_oam 0x8000, 0x8000, 0xE, -16, -64
	banim_frame_oam 0x4000, 0x8000, 0x8A, -48, -32
	banim_frame_oam 0x4000, 0x4000, 0xCA, -48, -16
	banim_frame_oam 0x8000, 0x0, 0x89, -56, -56
	banim_frame_oam 0x0, 0x0, 0xC9, -48, -8
	banim_frame_oam 0x4000, 0x4000, 0x10, -32, -72
	banim_frame_oam 0x0, 0x4000, 0x30, 0, -64
	banim_frame_oam 0x8000, 0x0, 0x1E, -56, -24
	banim_frame_oam 0x0, 0x4000, 0x70, -64, -8
	banim_frame_oam 0x4000, 0x4000, 0xEA, -56, 8
	banim_frame_oam 0x4000, 0x0, 0xEE, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8E, -16, -32
	banim_frame_end
banim_gar_sp1_oam_frame_45_r:
	banim_frame_oam 0x4000, 0x4000, 0xEA, -56, 8
	banim_frame_oam 0x4000, 0x0, 0xEE, -24, 8
	banim_frame_oam 0x8000, 0xC000, 0x14, -56, -72
	banim_frame_oam 0x8000, 0x4000, 0x18, -24, -72
	banim_frame_oam 0x8000, 0x4000, 0x98, -24, -40
	banim_frame_oam 0x8000, 0x0, 0x33, -64, -64
	banim_frame_oam 0x0, 0x0, 0x73, -64, -48
	banim_frame_oam 0x0, 0x0, 0x32, -72, -56
	banim_frame_oam 0x4000, 0x0, 0x92, -32, -80
	banim_frame_oam 0x4000, 0x4000, 0xF0, -48, -8
	banim_frame_oam 0x0, 0x4000, 0xB2, -64, -8
	banim_frame_oam 0x0, 0x0, 0x72, -16, -40
	banim_frame_end
banim_gar_sp1_oam_frame_46_r:
	banim_frame_oam 0x4000, 0x4000, 0xEA, -56, 8
	banim_frame_oam 0x4000, 0x0, 0xEE, -24, 8
	banim_frame_oam 0x8000, 0xC000, 0x19, -56, -64
	banim_frame_oam 0x8000, 0x4000, 0x1D, -24, -64
	banim_frame_oam 0x8000, 0x4000, 0x9D, -24, -32
	banim_frame_oam 0x8000, 0x0, 0x7E, -16, -40
	banim_frame_oam 0x0, 0x4000, 0xBE, -72, -64
	banim_frame_oam 0x4000, 0x0, 0xFE, -72, -48
	banim_frame_oam 0x0, 0x4000, 0xB0, -32, -80
	banim_frame_oam 0x4000, 0x0, 0xCE, -56, -72
	banim_frame_oam 0x0, 0x0, 0xAF, -40, -72
	banim_frame_oam 0x8000, 0x0, 0xB2, -64, -8
	banim_frame_oam 0x0, 0x0, 0xAE, -48, 0
	banim_frame_end
banim_gar_sp1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0x70, -64, -8
	banim_frame_end
banim_gar_sp1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -48, -64
	banim_frame_oam 0x8000, 0x8000, 0xE, -16, -64
	banim_frame_oam 0x4000, 0x8000, 0x8A, -48, -32
	banim_frame_oam 0x4000, 0x4000, 0xCA, -48, -16
	banim_frame_oam 0x8000, 0x0, 0x89, -56, -56
	banim_frame_oam 0x0, 0x0, 0xC9, -48, -8
	banim_frame_oam 0x4000, 0x4000, 0x10, -32, -72
	banim_frame_oam 0x0, 0x4000, 0x30, 0, -64
	banim_frame_oam 0x8000, 0x0, 0x1E, -56, -24
	banim_frame_oam 0x4000, 0x4000, 0xEA, -56, 8
	banim_frame_oam 0x4000, 0x0, 0xEE, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8E, -16, -32
	banim_frame_oam 0x0, 0x0, 0x3F, -56, -8
	banim_frame_end
banim_gar_sp1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x4000, 0xEA, -56, 8
	banim_frame_oam 0x4000, 0x0, 0xEE, -24, 8
	banim_frame_oam 0x8000, 0xC000, 0x14, -56, -72
	banim_frame_oam 0x8000, 0x4000, 0x18, -24, -72
	banim_frame_oam 0x8000, 0x4000, 0x98, -24, -40
	banim_frame_oam 0x8000, 0x0, 0x33, -64, -64
	banim_frame_oam 0x0, 0x0, 0x73, -64, -48
	banim_frame_oam 0x0, 0x0, 0x32, -72, -56
	banim_frame_oam 0x4000, 0x0, 0x92, -32, -80
	banim_frame_oam 0x4000, 0x4000, 0xF0, -48, -8
	banim_frame_oam 0x0, 0x0, 0x72, -16, -40
	banim_frame_oam 0x0, 0x0, 0x3F, -56, -8
	banim_frame_end
banim_gar_sp1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x4000, 0xEA, -56, 8
	banim_frame_oam 0x4000, 0x0, 0xEE, -24, 8
	banim_frame_oam 0x8000, 0x4000, 0x1D, -24, -64
	banim_frame_oam 0x8000, 0x4000, 0x9D, -24, -32
	banim_frame_oam 0x8000, 0x0, 0x7E, -16, -40
	banim_frame_oam 0x0, 0x4000, 0xBE, -72, -64
	banim_frame_oam 0x4000, 0x0, 0xFE, -72, -48
	banim_frame_oam 0x0, 0x4000, 0xB0, -32, -80
	banim_frame_oam 0x4000, 0x0, 0xCE, -56, -72
	banim_frame_oam 0x0, 0x0, 0xAF, -40, -72
	banim_frame_oam 0x0, 0x0, 0xAE, -48, 0
	banim_frame_oam 0x0, 0x8000, 0x19, -56, -64
	banim_frame_oam 0x4000, 0x8000, 0x99, -56, -32
	banim_frame_oam 0x4000, 0x4000, 0xD9, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xFA, -48, -8
	banim_frame_oam 0x0, 0x0, 0xFC, -32, -8
	banim_frame_oam 0x0, 0x0, 0x3F, -56, -8
	banim_frame_end
banim_gar_sp1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, 0
	banim_frame_oam 0x4000, 0x8000, 0xC0, -64, -56
	banim_frame_oam 0x0, 0x4000, 0xC4, -32, -56
	banim_frame_oam 0x4000, 0x4000, 0x4, -48, -40
	banim_frame_oam 0x0, 0x0, 0x84, -16, -40
	banim_frame_oam 0x8000, 0x0, 0x85, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0x24, -64, -24
	banim_frame_oam 0x4000, 0x0, 0x64, -40, 8
	banim_frame_end
banim_gar_sp1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0xC, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x88, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x8C, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x8E, 16, 0
	banim_frame_oam 0x0, 0x4000, 0xA6, 8, -56
	banim_frame_oam 0x4000, 0x0, 0xE6, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x66, -32, -48
	banim_frame_oam 0x0, 0x4000, 0xC8, -48, -8
	banim_frame_end
banim_gar_sp1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x13, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8F, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x93, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCF, -24, 8
	banim_frame_oam 0x0, 0x0, 0xD3, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xCA, -48, -8
	banim_frame_oam 0x8000, 0x0, 0xCC, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xEE, -48, -16
	banim_frame_oam 0x8000, 0x0, 0xCD, 16, -16
	banim_frame_oam 0x0, 0x0, 0xF0, 16, 8
	banim_frame_oam 0x0, 0x0, 0x34, -24, -48
	banim_frame_oam 0x4000, 0x8000, 0x15, -16, -56
	banim_frame_oam 0x0, 0x0, 0x14, 16, -56
	banim_frame_oam 0x8000, 0x0, 0x3F, -32, -40
	banim_frame_end
banim_gar_sp1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x1D, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x99, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x9D, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD9, -24, 8
	banim_frame_oam 0x0, 0x0, 0xDD, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0x75, -16, -56
	banim_frame_oam 0x0, 0x0, 0x58, 8, -64
	banim_frame_oam 0x0, 0x0, 0x94, -24, -48
	banim_frame_oam 0x8000, 0x0, 0x54, 16, -64
	banim_frame_oam 0x0, 0x0, 0xF1, -32, -40
	banim_frame_oam 0x0, 0x4000, 0xB4, -48, -16
	banim_frame_oam 0x8000, 0x0, 0xB6, -32, -16
	banim_frame_oam 0x0, 0x0, 0xF3, -32, 0
	banim_frame_oam 0x8000, 0x0, 0xB7, 16, -16
	banim_frame_oam 0x0, 0x0, 0xF4, 16, 8
	banim_frame_end
banim_gar_sp1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_gar_sp1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_gar_sp1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_gar_sp1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_gar_sp1_oam_frame_29_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -16, -88
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, -56
	banim_frame_oam 0x4000, 0x4000, 0x84, 16, -56
	banim_frame_oam 0x4000, 0x8000, 0xA0, 8, -48
	banim_frame_oam 0x8000, 0x0, 0xA4, 40, -48
	banim_frame_oam 0x4000, 0x4000, 0xE0, 8, -32
	banim_frame_oam 0x8000, 0x0, 0xA5, -32, -64
	banim_frame_oam 0x8000, 0x0, 0xA6, -24, -80
	banim_frame_oam 0x0, 0x0, 0xE6, -24, -64
	banim_frame_oam 0x4000, 0x4000, 0xE7, 0, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 32, 8
	banim_frame_end
banim_gar_sp1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0x4000, 0xE7, 0, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 32, 8
	banim_frame_oam 0x4000, 0xC000, 0x8, -24, -88
	banim_frame_oam 0x4000, 0x4000, 0x88, -24, -56
	banim_frame_oam 0x4000, 0x4000, 0x8C, 8, -56
	banim_frame_oam 0x8000, 0x0, 0xAF, 40, -72
	banim_frame_oam 0x0, 0x0, 0xEF, 40, -56
	banim_frame_oam 0x8000, 0x0, 0xAD, -32, -64
	banim_frame_oam 0x4000, 0x0, 0xEC, 16, -32
	banim_frame_oam 0x0, 0x0, 0xEE, 32, -32
	banim_frame_oam 0x4000, 0x8000, 0xA7, 0, -48
	banim_frame_oam 0x0, 0x4000, 0xAB, 32, -48
	banim_frame_end
banim_gar_sp1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x4000, 0xE7, 0, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 32, 8
	banim_frame_oam 0x4000, 0xC000, 0x10, -16, -88
	banim_frame_oam 0x4000, 0x4000, 0x90, -16, -56
	banim_frame_oam 0x4000, 0x4000, 0x94, 16, -56
	banim_frame_oam 0x4000, 0x8000, 0xB3, 8, -48
	banim_frame_oam 0x8000, 0x0, 0xB7, 40, -48
	banim_frame_oam 0x4000, 0x4000, 0xF3, 8, -32
	banim_frame_oam 0x0, 0x0, 0xF7, 40, -32
	banim_frame_oam 0x0, 0x4000, 0xB0, -32, -72
	banim_frame_oam 0x4000, 0x0, 0xF0, -32, -56
	banim_frame_end
banim_gar_sp1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x0, 0xB2, 48, -64
	banim_frame_oam 0x0, 0x0, 0xF2, 48, -48
	banim_frame_oam 0x8000, 0x0, 0x98, -24, -88
	banim_frame_oam 0x0, 0x4000, 0xD8, -32, -64
	banim_frame_oam 0x0, 0x0, 0xB9, -24, -72
	banim_frame_oam 0x0, 0x8000, 0x18, -16, -88
	banim_frame_oam 0x8000, 0x8000, 0x1C, 16, -88
	banim_frame_oam 0x8000, 0x4000, 0x1E, 32, -88
	banim_frame_oam 0x0, 0x8000, 0x9A, 0, -56
	banim_frame_oam 0x8000, 0x8000, 0x9E, 32, -56
	banim_frame_oam 0x8000, 0x0, 0x3F, 40, -80
	banim_frame_oam 0x0, 0x0, 0x7F, 40, -64
	banim_frame_oam 0x4000, 0x4000, 0xE7, 0, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 32, 8
	banim_frame_end
banim_gar_sp1_oam_frame_33_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -16, -88
	banim_frame_oam 0x8000, 0x4000, 0x8, 48, -88
	banim_frame_oam 0x0, 0x8000, 0x83, 8, -56
	banim_frame_oam 0x8000, 0x4000, 0x87, 40, -56
	banim_frame_oam 0x8000, 0x0, 0x68, 48, -64
	banim_frame_oam 0x0, 0x0, 0xA8, 48, -48
	banim_frame_oam 0x0, 0x4000, 0xA0, -32, -72
	banim_frame_oam 0x4000, 0x0, 0xE0, -32, -56
	banim_frame_oam 0x8000, 0x0, 0xC2, -24, -88
	banim_frame_oam 0x4000, 0x4000, 0xE8, 0, 8
	banim_frame_oam 0x0, 0x0, 0xEC, 32, 8
	banim_frame_oam 0x0, 0x0, 0xA2, 0, -48
	banim_frame_end
banim_gar_sp1_oam_frame_34_r:
	banim_frame_oam 0x0, 0xC000, 0x17, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0x36, -32, -40
	banim_frame_oam 0x8000, 0x0, 0x7F, -40, -32
	banim_frame_oam 0x0, 0x0, 0xBF, 40, -48
	banim_frame_end
banim_gar_sp1_oam_frame_35_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x5, 24, -48
	banim_frame_oam 0x8000, 0x0, 0x4, 32, -48
	banim_frame_oam 0x8000, 0x0, 0x44, 40, -56
	banim_frame_oam 0x0, 0x0, 0x84, 32, -32
	banim_frame_oam 0x8000, 0x0, 0xA4, 24, -16
	banim_frame_oam 0x0, 0x0, 0xE4, 24, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, -16, -32
	banim_frame_oam 0x0, 0x0, 0xE5, -16, -40
	banim_frame_oam 0x8000, 0x0, 0xA5, -24, -32
	banim_frame_oam 0x0, 0x0, 0x85, -32, -32
	banim_frame_end
banim_gar_sp1_oam_frame_36_r:
	banim_frame_oam 0x8000, 0xC000, 0x7, 0, -48
	banim_frame_oam 0x8000, 0x4000, 0xB, 32, -56
	banim_frame_oam 0x8000, 0x0, 0x8B, 40, -56
	banim_frame_oam 0x0, 0x0, 0x86, 48, -56
	banim_frame_oam 0x8000, 0x0, 0xA6, 40, -40
	banim_frame_oam 0x8000, 0x0, 0xCB, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x6, -8, -48
	banim_frame_oam 0x0, 0x0, 0xE6, -8, 8
	banim_frame_oam 0x4000, 0x0, 0x7E, 8, -56
	banim_frame_oam 0x0, 0x0, 0x5E, 24, -56
	banim_frame_oam 0x0, 0x0, 0x3E, -24, -40
	banim_frame_end
banim_gar_sp1_oam_frame_37_r:
	banim_frame_oam 0x8000, 0xC000, 0xC, 0, -48
	banim_frame_oam 0x4000, 0x0, 0x90, -16, -40
	banim_frame_oam 0x8000, 0x0, 0xB0, -8, -32
	banim_frame_oam 0x0, 0x0, 0x70, -8, 8
	banim_frame_oam 0x4000, 0x0, 0x9E, 32, -56
	banim_frame_oam 0x0, 0x0, 0x1E, 48, -56
	banim_frame_oam 0x0, 0x4000, 0x10, 32, -48
	banim_frame_oam 0x4000, 0x0, 0x50, 32, -32
	banim_frame_oam 0x4000, 0x0, 0xF0, 8, -56
	banim_frame_oam 0x0, 0x0, 0x71, 24, -56
	banim_frame_end
banim_gar_sp1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0xC000, 0x12, -8, -48
	banim_frame_oam 0x0, 0x4000, 0x16, 24, -48
	banim_frame_oam 0x0, 0x4000, 0xD6, -24, -40
	banim_frame_oam 0x0, 0x0, 0xB7, -16, -24
	banim_frame_oam 0x0, 0x0, 0x97, -32, -32
	banim_frame_oam 0x4000, 0x0, 0xBE, -40, -40
	banim_frame_oam 0x8000, 0x0, 0x96, 24, -16
	banim_frame_oam 0x0, 0x0, 0xD1, 40, -48
	banim_frame_oam 0x0, 0x0, 0xB1, 24, 8
	banim_frame_oam 0x0, 0x4000, 0x56, 24, -32
	banim_frame_end
banim_gar_sp1_oam_frame_39_r:
	banim_frame_oam 0x8000, 0xC000, 0x18, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x1C, 24, -48
	banim_frame_oam 0x8000, 0x0, 0x9C, 24, -16
	banim_frame_oam 0x0, 0x0, 0x9D, 24, 8
	banim_frame_oam 0x0, 0x4000, 0xDE, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xDC, -24, -40
	banim_frame_oam 0x8000, 0x0, 0x5D, -16, -24
	banim_frame_oam 0x8000, 0x0, 0x1D, 32, -48
	banim_frame_end
banim_gar_sp1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x24, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0xA0, -16, -8
	banim_frame_oam 0x0, 0x4000, 0xA4, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE4, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x6, 32, -48
	banim_frame_oam 0x0, 0x0, 0xC6, 40, -48
	banim_frame_oam 0x8000, 0x0, 0x86, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x46, -24, -32
	banim_frame_oam 0x0, 0x0, 0xE6, 32, -24
	banim_frame_end
banim_gar_sp1_oam_frame_41_r:
	banim_frame_oam 0x8000, 0xC000, 0x8, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0xC, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x8C, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0xD, 16, -48
	banim_frame_oam 0x8000, 0x0, 0x8D, 16, -16
	banim_frame_oam 0x0, 0x0, 0xED, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x7, 24, -48
	banim_frame_oam 0x0, 0x0, 0xCD, 32, -48
	banim_frame_oam 0x8000, 0x0, 0x3F, 24, -32
	banim_frame_oam 0x8000, 0x4000, 0x47, -32, -32
	banim_frame_oam 0x8000, 0x0, 0xC7, -40, -24
	banim_frame_end
banim_gar_sp1_oam_frame_42_r:
	banim_frame_oam 0x8000, 0xC000, 0xF, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0x13, 8, -48
	banim_frame_oam 0x8000, 0x8000, 0x93, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x4E, -32, -32
	banim_frame_oam 0x8000, 0x0, 0xCE, -40, -24
	banim_frame_oam 0x8000, 0x4000, 0x7F, 24, -48
	banim_frame_end
banim_gar_sp1_oam_frame_43_r:
	banim_frame_oam 0x8000, 0xC000, 0x16, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0x1A, 8, -48
	banim_frame_oam 0x8000, 0x8000, 0x9A, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x55, -32, -32
	banim_frame_oam 0x8000, 0x0, 0xD5, -40, -24
	banim_frame_oam 0x8000, 0x4000, 0x1E, 24, -48
	banim_frame_oam 0x0, 0x0, 0xFF, 32, -48
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
	banim_frame_oam 0x0, 0x0, 0x10FF, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x10FF, 0, -8
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
	.section .data.script
banim_gar_sp1_script:
banim_gar_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 1, banim_gar_sp1_oam_frame_1_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 2, banim_gar_sp1_oam_frame_2_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_0, 3, banim_gar_sp1_oam_frame_3_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_gar_sp1_sheet_1, 4, banim_gar_sp1_oam_frame_4_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_1, 5, banim_gar_sp1_oam_frame_5_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_1, 6, banim_gar_sp1_oam_frame_6_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_2, 7, banim_gar_sp1_oam_frame_7_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_2, 8, banim_gar_sp1_oam_frame_8_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_2, 9, banim_gar_sp1_oam_frame_9_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 6, banim_gar_sp1_sheet_3, 10, banim_gar_sp1_oam_frame_10_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_3, 11, banim_gar_sp1_oam_frame_11_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_3, 12, banim_gar_sp1_oam_frame_12_r - banim_gar_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_gar_sp1_sheet_4, 13, banim_gar_sp1_oam_frame_13_r - banim_gar_sp1_oam_r
	banim_code_frame 20, banim_gar_sp1_sheet_4, 14, banim_gar_sp1_oam_frame_14_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_4, 15, banim_gar_sp1_oam_frame_15_r - banim_gar_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 2, banim_gar_sp1_sheet_5, 16, banim_gar_sp1_oam_frame_16_r - banim_gar_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_gar_sp1_sheet_5, 21, banim_gar_sp1_oam_frame_17_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_gar_sp1_sheet_5, 22, banim_gar_sp1_oam_frame_18_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_5, 23, banim_gar_sp1_oam_frame_19_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_2
	banim_code_frame 2, banim_gar_sp1_sheet_6, 24, banim_gar_sp1_oam_frame_20_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 25, banim_gar_sp1_oam_frame_21_r - banim_gar_sp1_oam_r
	banim_code_frame 7, banim_gar_sp1_sheet_6, 26, banim_gar_sp1_oam_frame_22_r - banim_gar_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_gar_sp1_sheet_6, 26, banim_gar_sp1_oam_frame_22_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 27, banim_gar_sp1_oam_frame_23_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 6, banim_gar_sp1_sheet_3, 31, banim_gar_sp1_oam_frame_27_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_3, 31, banim_gar_sp1_oam_frame_27_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_3, 31, banim_gar_sp1_oam_frame_27_r - banim_gar_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 20, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_gar_sp1_sheet_5, 20, banim_gar_sp1_oam_frame_28_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_gar_sp1_sheet_5, 20, banim_gar_sp1_oam_frame_28_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_5, 20, banim_gar_sp1_oam_frame_28_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_2
	banim_code_frame 2, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 7, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 1, banim_gar_sp1_oam_frame_1_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 2, banim_gar_sp1_oam_frame_2_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_0, 3, banim_gar_sp1_oam_frame_3_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_gar_sp1_sheet_1, 4, banim_gar_sp1_oam_frame_4_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_1, 5, banim_gar_sp1_oam_frame_5_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_1, 6, banim_gar_sp1_oam_frame_6_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_2, 7, banim_gar_sp1_oam_frame_7_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_2, 8, banim_gar_sp1_oam_frame_8_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_2, 9, banim_gar_sp1_oam_frame_9_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 6, banim_gar_sp1_sheet_3, 10, banim_gar_sp1_oam_frame_10_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_3, 11, banim_gar_sp1_oam_frame_11_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_3, 12, banim_gar_sp1_oam_frame_12_r - banim_gar_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_gar_sp1_sheet_4, 13, banim_gar_sp1_oam_frame_13_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_7, 32, banim_gar_sp1_oam_frame_29_r - banim_gar_sp1_oam_r
	banim_code_frame 20, banim_gar_sp1_sheet_7, 33, banim_gar_sp1_oam_frame_30_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_scream
	banim_code_frame 3, banim_gar_sp1_sheet_7, 34, banim_gar_sp1_oam_frame_31_r - banim_gar_sp1_oam_r
	banim_code_frame 16, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 20, banim_gar_sp1_sheet_7, 33, banim_gar_sp1_oam_frame_30_r - banim_gar_sp1_oam_r
	banim_code_frame 3, banim_gar_sp1_sheet_7, 34, banim_gar_sp1_oam_frame_31_r - banim_gar_sp1_oam_r
	banim_code_frame 16, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 20, banim_gar_sp1_sheet_7, 33, banim_gar_sp1_oam_frame_30_r - banim_gar_sp1_oam_r
	banim_code_frame 3, banim_gar_sp1_sheet_7, 34, banim_gar_sp1_oam_frame_31_r - banim_gar_sp1_oam_r
	banim_code_frame 16, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 36, banim_gar_sp1_oam_frame_33_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 36, banim_gar_sp1_oam_frame_33_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 36, banim_gar_sp1_oam_frame_33_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 36, banim_gar_sp1_oam_frame_33_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 36, banim_gar_sp1_oam_frame_33_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 36, banim_gar_sp1_oam_frame_33_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 36, banim_gar_sp1_oam_frame_33_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 36, banim_gar_sp1_oam_frame_33_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 36, banim_gar_sp1_oam_frame_33_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_7, 35, banim_gar_sp1_oam_frame_32_r - banim_gar_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 2, banim_gar_sp1_sheet_5, 16, banim_gar_sp1_oam_frame_16_r - banim_gar_sp1_oam_r
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_gar_sp1_sheet_5, 21, banim_gar_sp1_oam_frame_17_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_gar_sp1_sheet_5, 22, banim_gar_sp1_oam_frame_18_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_5, 23, banim_gar_sp1_oam_frame_19_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_2
	banim_code_frame 2, banim_gar_sp1_sheet_6, 24, banim_gar_sp1_oam_frame_20_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 25, banim_gar_sp1_oam_frame_21_r - banim_gar_sp1_oam_r
	banim_code_frame 7, banim_gar_sp1_sheet_6, 26, banim_gar_sp1_oam_frame_22_r - banim_gar_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_gar_sp1_sheet_6, 26, banim_gar_sp1_oam_frame_22_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 27, banim_gar_sp1_oam_frame_23_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 6, banim_gar_sp1_sheet_3, 31, banim_gar_sp1_oam_frame_27_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_3, 31, banim_gar_sp1_oam_frame_27_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_3, 31, banim_gar_sp1_oam_frame_27_r - banim_gar_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 20, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_scream
	banim_code_frame 3, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 16, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 20, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 3, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 16, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 20, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 3, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 16, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 2, banim_gar_sp1_sheet_5, 29, banim_gar_sp1_oam_frame_25_r - banim_gar_sp1_oam_r
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_gar_sp1_sheet_5, 20, banim_gar_sp1_oam_frame_28_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_gar_sp1_sheet_5, 20, banim_gar_sp1_oam_frame_28_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_5, 20, banim_gar_sp1_oam_frame_28_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_2
	banim_code_frame 2, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 7, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 30, banim_gar_sp1_oam_frame_26_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_0, 28, banim_gar_sp1_oam_frame_24_r - banim_gar_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 1, banim_gar_sp1_oam_frame_1_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_0, 2, banim_gar_sp1_oam_frame_2_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_0, 3, banim_gar_sp1_oam_frame_3_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 37, banim_gar_sp1_oam_frame_34_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_9, 38, banim_gar_sp1_oam_frame_35_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_9, 39, banim_gar_sp1_oam_frame_36_r - banim_gar_sp1_oam_r
	banim_code_frame 30, banim_gar_sp1_sheet_9, 40, banim_gar_sp1_oam_frame_37_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_9, 41, banim_gar_sp1_oam_frame_38_r - banim_gar_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_gar_sp1_sheet_9, 42, banim_gar_sp1_oam_frame_39_r - banim_gar_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_gar_sp1_sheet_10, 43, banim_gar_sp1_oam_frame_40_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 37, banim_gar_sp1_oam_frame_34_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 2, banim_gar_sp1_oam_frame_2_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_0, 1, banim_gar_sp1_oam_frame_1_r - banim_gar_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gar_sp1_sheet_0, 1, banim_gar_sp1_oam_frame_1_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_1
	banim_code_frame 4, banim_gar_sp1_sheet_10, 44, banim_gar_sp1_oam_frame_41_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_10, 45, banim_gar_sp1_oam_frame_42_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_10, 46, banim_gar_sp1_oam_frame_43_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_1
	banim_code_frame 4, banim_gar_sp1_sheet_10, 44, banim_gar_sp1_oam_frame_41_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_10, 45, banim_gar_sp1_oam_frame_42_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_10, 46, banim_gar_sp1_oam_frame_43_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_1
	banim_code_frame 4, banim_gar_sp1_sheet_10, 44, banim_gar_sp1_oam_frame_41_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_10, 45, banim_gar_sp1_oam_frame_42_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_10, 46, banim_gar_sp1_oam_frame_43_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_1
	banim_code_frame 4, banim_gar_sp1_sheet_10, 44, banim_gar_sp1_oam_frame_41_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_10, 45, banim_gar_sp1_oam_frame_42_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_10, 46, banim_gar_sp1_oam_frame_43_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_0, 1, banim_gar_sp1_oam_frame_1_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_0, 2, banim_gar_sp1_oam_frame_2_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_gar_sp1_sheet_0, 3, banim_gar_sp1_oam_frame_3_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_8, 37, banim_gar_sp1_oam_frame_34_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_9, 38, banim_gar_sp1_oam_frame_35_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_9, 39, banim_gar_sp1_oam_frame_36_r - banim_gar_sp1_oam_r
	banim_code_frame 30, banim_gar_sp1_sheet_9, 40, banim_gar_sp1_oam_frame_37_r - banim_gar_sp1_oam_r
	banim_code_frame 2, banim_gar_sp1_sheet_9, 41, banim_gar_sp1_oam_frame_38_r - banim_gar_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_gar_sp1_sheet_9, 42, banim_gar_sp1_oam_frame_39_r - banim_gar_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_gar_sp1_sheet_10, 43, banim_gar_sp1_oam_frame_40_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_8, 37, banim_gar_sp1_oam_frame_34_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 2, banim_gar_sp1_oam_frame_2_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_0, 1, banim_gar_sp1_oam_frame_1_r - banim_gar_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gar_sp1_sheet_0, 1, banim_gar_sp1_oam_frame_1_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_sheet_1, 4, banim_gar_sp1_oam_frame_4_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_1, 5, banim_gar_sp1_oam_frame_5_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_2, 7, banim_gar_sp1_oam_frame_7_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_6, 25, banim_gar_sp1_oam_frame_21_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_6, 26, banim_gar_sp1_oam_frame_22_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_gar_sp1_sheet_1, 4, banim_gar_sp1_oam_frame_4_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_1, 5, banim_gar_sp1_oam_frame_5_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_2, 7, banim_gar_sp1_oam_frame_7_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_gar_sp1_sheet_6, 25, banim_gar_sp1_oam_frame_21_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_6, 26, banim_gar_sp1_oam_frame_22_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gar_sp1_mode_stand_close:
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gar_sp1_mode_stand:
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gar_sp1_mode_stand_range:
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gar_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 1, banim_gar_sp1_oam_frame_1_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_0, 2, banim_gar_sp1_oam_frame_2_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_0, 3, banim_gar_sp1_oam_frame_3_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_gar_sp1_sheet_1, 4, banim_gar_sp1_oam_frame_4_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_1, 5, banim_gar_sp1_oam_frame_5_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_1, 6, banim_gar_sp1_oam_frame_6_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_2, 7, banim_gar_sp1_oam_frame_7_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_2, 8, banim_gar_sp1_oam_frame_8_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_2, 9, banim_gar_sp1_oam_frame_9_r - banim_gar_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 6, banim_gar_sp1_sheet_3, 10, banim_gar_sp1_oam_frame_10_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_3, 11, banim_gar_sp1_oam_frame_11_r - banim_gar_sp1_oam_r
	banim_code_frame 10, banim_gar_sp1_sheet_3, 12, banim_gar_sp1_oam_frame_12_r - banim_gar_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_gar_sp1_sheet_4, 13, banim_gar_sp1_oam_frame_13_r - banim_gar_sp1_oam_r
	banim_code_frame 20, banim_gar_sp1_sheet_4, 14, banim_gar_sp1_oam_frame_14_r - banim_gar_sp1_oam_r
	banim_code_frame 6, banim_gar_sp1_sheet_4, 15, banim_gar_sp1_oam_frame_15_r - banim_gar_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 2, banim_gar_sp1_sheet_5, 16, banim_gar_sp1_oam_frame_16_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_5, 17, banim_gar_sp1_oam_frame_44_r - banim_gar_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_gar_sp1_sheet_5, 18, banim_gar_sp1_oam_frame_45_r - banim_gar_sp1_oam_r
	banim_code_frame 8, banim_gar_sp1_sheet_5, 19, banim_gar_sp1_oam_frame_46_r - banim_gar_sp1_oam_r
	banim_code_sound_axe_gargoyle_2
	banim_code_frame 2, banim_gar_sp1_sheet_6, 24, banim_gar_sp1_oam_frame_20_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 25, banim_gar_sp1_oam_frame_21_r - banim_gar_sp1_oam_r
	banim_code_frame 7, banim_gar_sp1_sheet_6, 26, banim_gar_sp1_oam_frame_22_r - banim_gar_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_gar_sp1_sheet_6, 26, banim_gar_sp1_oam_frame_22_r - banim_gar_sp1_oam_r
	banim_code_frame 4, banim_gar_sp1_sheet_6, 27, banim_gar_sp1_oam_frame_23_r - banim_gar_sp1_oam_r
	banim_code_frame 1, banim_gar_sp1_sheet_0, 0, banim_gar_sp1_oam_frame_0_r - banim_gar_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_gar_sp1_mode_attack_close - banim_gar_sp1_script
	.word banim_gar_sp1_mode_attack_close_back - banim_gar_sp1_script
	.word banim_gar_sp1_mode_attack_close_critical - banim_gar_sp1_script
	.word banim_gar_sp1_mode_attack_close_critical_back - banim_gar_sp1_script
	.word banim_gar_sp1_mode_attack_range - banim_gar_sp1_script
	.word banim_gar_sp1_mode_attack_range_critical - banim_gar_sp1_script
	.word banim_gar_sp1_mode_dodge_close - banim_gar_sp1_script
	.word banim_gar_sp1_mode_dodge_range - banim_gar_sp1_script
	.word banim_gar_sp1_mode_stand_close - banim_gar_sp1_script
	.word banim_gar_sp1_mode_stand - banim_gar_sp1_script
	.word banim_gar_sp1_mode_stand_range - banim_gar_sp1_script
	.word banim_gar_sp1_mode_attack_miss - banim_gar_sp1_script
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

