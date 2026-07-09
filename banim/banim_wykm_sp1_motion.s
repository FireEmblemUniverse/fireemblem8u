@ vim:ft=armv4
	.global banim_wykm_sp1_script
	.global banim_wykm_sp1_oam_r
	.global banim_wykm_sp1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x61
	.section .data.oam_l
banim_wykm_sp1_oam_l:
banim_wykm_sp1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0xD000, 0x80, -32, -16
	banim_frame_oam 0x8000, 0x9000, 0x6, -32, -48
	banim_frame_oam 0x0, 0x5000, 0x40, -48, -48
	banim_frame_oam 0x0, 0x1000, 0x62, -48, -32
	banim_frame_oam 0x4000, 0x9000, 0xC8, -64, 0
	banim_frame_oam 0x8000, 0x1000, 0xCC, -72, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, -64, -16
	banim_frame_oam 0x8000, 0x1000, 0x8C, -72, -16
	banim_frame_oam 0x4000, 0x1000, 0xA8, -72, -24
	banim_frame_oam 0x4000, 0x9000, 0x48, -48, -64
	banim_frame_oam 0x4000, 0x1000, 0x88, -56, -72
	banim_frame_oam 0x0, 0x5000, 0x8, -8, -64
	banim_frame_oam 0x8000, 0x1000, 0xA, -16, -72
	banim_frame_oam 0x0, 0x1000, 0xB, -16, -56
	banim_frame_oam 0x4000, 0x1000, 0x3, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x5, -16, -48
	banim_frame_oam 0x0, 0x5000, 0x43, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0x45, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0x23, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x0, 16, -48
	banim_frame_oam 0x8000, 0x1000, 0x2, 8, -48
	banim_frame_oam 0x0, 0x1000, 0x42, 8, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_1_l:
	banim_frame_oam 0x0, 0xD000, 0x10, -50, -48
	banim_frame_oam 0x8000, 0x5000, 0x18, -58, -48
	banim_frame_oam 0x8000, 0x5000, 0x98, -58, -16
	banim_frame_oam 0x8000, 0x1000, 0xAD, -66, -48
	banim_frame_oam 0x8000, 0x9000, 0x4E, -74, -32
	banim_frame_oam 0x0, 0x5000, 0xCE, -74, 0
	banim_frame_oam 0x8000, 0x1000, 0x4D, -82, -32
	banim_frame_oam 0x0, 0x1000, 0x8D, -82, -16
	banim_frame_oam 0x0, 0x1000, 0x3F, 14, -48
	banim_frame_oam 0x4000, 0x9000, 0x19, -34, -64
	banim_frame_oam 0x4000, 0x9000, 0x59, -66, -64
	banim_frame_oam 0x4000, 0x1000, 0x3D, -74, -72
	banim_frame_oam 0x4000, 0x1000, 0x1D, -34, -72
	banim_frame_end
banim_wykm_sp1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -68, -56
	banim_frame_oam 0x8000, 0x5000, 0x8, -76, -56
	banim_frame_oam 0x0, 0x9000, 0x84, -68, -24
	banim_frame_oam 0x8000, 0x1000, 0x88, -76, -24
	banim_frame_oam 0x8000, 0x1000, 0x83, -36, -24
	banim_frame_oam 0x8000, 0x1000, 0xC3, -84, -48
	banim_frame_oam 0x8000, 0x9000, 0x80, -20, -88
	banim_frame_oam 0x8000, 0x5000, 0x82, -28, -88
	banim_frame_oam 0x4000, 0x9000, 0x89, -60, -80
	banim_frame_oam 0x4000, 0x5000, 0xC9, -60, -64
	banim_frame_oam 0x0, 0x1000, 0x8D, -76, -64
	banim_frame_oam 0x8000, 0x1000, 0xAD, -68, -72
	banim_frame_oam 0x4000, 0x5000, 0xE8, -44, 8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -76, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -68, -56
	banim_frame_oam 0x8000, 0x5000, 0x8, -76, -56
	banim_frame_oam 0x0, 0x9000, 0x84, -68, -24
	banim_frame_oam 0x8000, 0x1000, 0x88, -76, -24
	banim_frame_oam 0x8000, 0x1000, 0x83, -36, -24
	banim_frame_oam 0x8000, 0x1000, 0xC3, -84, -48
	banim_frame_oam 0x4000, 0x9000, 0x89, -60, -80
	banim_frame_oam 0x4000, 0x5000, 0xC9, -60, -64
	banim_frame_oam 0x0, 0x1000, 0x8D, -76, -64
	banim_frame_oam 0x8000, 0x1000, 0xAD, -68, -72
	banim_frame_oam 0x4000, 0x5000, 0xE8, -44, 8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -76, 8
	banim_frame_oam 0x0, 0x1000, 0xF0, -84, 8
	banim_frame_oam 0x8000, 0x9000, 0x9, -28, -88
	banim_frame_end
banim_wykm_sp1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0xD000, 0xB, -76, -64
	banim_frame_oam 0x8000, 0x1000, 0x90, -12, -56
	banim_frame_oam 0x0, 0x1000, 0xD0, -12, -40
	banim_frame_oam 0x4000, 0x1000, 0xCE, -52, 8
	banim_frame_oam 0x4000, 0x5000, 0xE7, -36, 8
	banim_frame_oam 0x8000, 0x1000, 0x8F, -84, -48
	banim_frame_oam 0x8000, 0x1000, 0x8E, -20, -88
	banim_frame_oam 0x0, 0x9000, 0x91, -60, -32
	banim_frame_oam 0x8000, 0x9000, 0x95, -76, -32
	banim_frame_oam 0x4000, 0x9000, 0x53, -52, -80
	banim_frame_oam 0x0, 0x1000, 0x33, -28, -88
	banim_frame_oam 0x0, 0x1000, 0x34, -60, -72
	banim_frame_oam 0x4000, 0x5000, 0x13, -60, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_5_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -32, -64
	banim_frame_oam 0x4000, 0x5000, 0x8, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0xC, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x28, 32, -8
	banim_frame_oam 0x4000, 0x1000, 0x49, 16, 0
	banim_frame_oam 0x4000, 0x9000, 0x68, -16, -80
	banim_frame_oam 0x0, 0x5000, 0x6C, -32, -80
	banim_frame_oam 0x0, 0x5000, 0x2B, -40, -88
	banim_frame_oam 0x4000, 0x1000, 0x2D, -48, -40
	banim_frame_oam 0x0, 0x1000, 0x2F, -40, 8
	banim_frame_oam 0x4000, 0x1000, 0x29, 32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA8, -64, -24
	banim_frame_oam 0x0, 0x5000, 0xAC, -80, -24
	banim_frame_oam 0x0, 0x5000, 0xAE, -72, -8
	banim_frame_oam 0x4000, 0x1000, 0xE8, -72, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_51_l:
	banim_frame_oam 0x0, 0xD000, 0x10, -18, -48
	banim_frame_oam 0x4000, 0x9000, 0x18, -2, -64
	banim_frame_oam 0x4000, 0x5000, 0x58, -10, -72
	banim_frame_oam 0x0, 0x1000, 0x5C, -18, -72
	banim_frame_oam 0x4000, 0x5000, 0x3C, -34, -80
	banim_frame_oam 0x0, 0x5000, 0x78, 46, -24
	banim_frame_oam 0x4000, 0x1000, 0xF8, -34, 8
	banim_frame_oam 0x0, 0x5000, 0x7A, -34, -16
	banim_frame_oam 0x0, 0x5000, 0x7C, -50, -24
	banim_frame_oam 0x4000, 0x1000, 0xB8, -66, -24
	banim_frame_oam 0x0, 0x1000, 0xBA, -74, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_52_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, 6, -56
	banim_frame_oam 0x8000, 0x9000, 0x4, 14, -88
	banim_frame_oam 0x0, 0x5000, 0x84, -10, -56
	banim_frame_oam 0x0, 0x5000, 0xC4, -26, -64
	banim_frame_oam 0x4000, 0x1000, 0xE6, -10, -40
	banim_frame_oam 0x4000, 0x9000, 0xC8, -58, -24
	banim_frame_oam 0x8000, 0x9000, 0x66, 38, -40
	banim_frame_oam 0x0, 0x5000, 0x6, 62, -24
	banim_frame_oam 0x8000, 0x1000, 0x8, 54, -24
	banim_frame_oam 0x4000, 0x1000, 0x46, 62, -8
	banim_frame_oam 0x0, 0x1000, 0x48, 54, -8
	banim_frame_oam 0x4000, 0x9000, 0x49, -26, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, 30, -64
	banim_frame_oam 0x0, 0x1000, 0xAA, 38, -8
	banim_frame_oam 0x4000, 0x1000, 0xA8, -26, -16
	banim_frame_oam 0x4000, 0x5000, 0x9, 38, 8
	banim_frame_oam 0x4000, 0x5000, 0xD, 6, 8
	banim_frame_oam 0x4000, 0x5000, 0x11, -26, 8
	banim_frame_oam 0x4000, 0x1000, 0x29, -42, 0
	banim_frame_end
	banim_frame_oam 0x0, 0xD000, 0x17, -46, -48
	banim_frame_oam 0x0, 0x9000, 0x33, -38, -80
	banim_frame_oam 0x0, 0x1000, 0x16, -6, -56
	banim_frame_oam 0x0, 0x1000, 0x15, -54, -48
	banim_frame_oam 0x4000, 0x5000, 0xB3, -70, -56
	banim_frame_end
banim_wykm_sp1_oam_frame_9_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, 14, -48
	banim_frame_oam 0x8000, 0x9000, 0x44, -2, -32
	banim_frame_oam 0x4000, 0x9000, 0xC4, -18, 0
	banim_frame_oam 0x0, 0x1000, 0xA6, 6, -40
	banim_frame_oam 0x0, 0x1000, 0xA7, -10, -24
	banim_frame_oam 0x8000, 0x9000, 0x26, -34, -16
	banim_frame_oam 0x4000, 0x1000, 0x6, -18, -8
	banim_frame_oam 0x4000, 0x1000, 0xC8, -42, -24
	banim_frame_oam 0x0, 0x1000, 0xE9, -42, -16
	banim_frame_oam 0x0, 0x1000, 0xE8, -42, 0
	banim_frame_oam 0x8000, 0xD000, 0xA, 46, -72
	banim_frame_oam 0x4000, 0x5000, 0xE, 14, -56
	banim_frame_oam 0x0, 0x1000, 0x8, 46, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_6_l:
	banim_frame_oam 0x0, 0xD000, 0x10, -18, -48
	banim_frame_oam 0x4000, 0x9000, 0x18, -2, -64
	banim_frame_oam 0x4000, 0x5000, 0x58, -10, -72
	banim_frame_oam 0x0, 0x1000, 0x5C, -18, -72
	banim_frame_oam 0x4000, 0x5000, 0x3C, -34, -80
	banim_frame_oam 0x4000, 0x1000, 0xF8, -34, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -42, 8
	banim_frame_oam 0x0, 0x5000, 0x7A, -34, -16
	banim_frame_oam 0x0, 0x5000, 0x7C, -50, -24
	banim_frame_oam 0x4000, 0x1000, 0xB8, -66, -24
	banim_frame_oam 0x0, 0x1000, 0xBA, -74, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x5000, 0x78, 46, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_7_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, 6, -56
	banim_frame_oam 0x8000, 0x9000, 0x4, 14, -88
	banim_frame_oam 0x0, 0x5000, 0x84, -10, -56
	banim_frame_oam 0x0, 0x5000, 0xC4, -26, -64
	banim_frame_oam 0x4000, 0x1000, 0xE6, -10, -40
	banim_frame_oam 0x4000, 0x9000, 0xC8, -58, -24
	banim_frame_oam 0x8000, 0x9000, 0x66, 38, -40
	banim_frame_oam 0x4000, 0x9000, 0x49, -26, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, 30, -64
	banim_frame_oam 0x0, 0x1000, 0xAA, 38, -8
	banim_frame_oam 0x4000, 0x1000, 0xA8, -26, -16
	banim_frame_oam 0x4000, 0x5000, 0x9, 30, 8
	banim_frame_oam 0x4000, 0x5000, 0xD, -2, 8
	banim_frame_oam 0x4000, 0x5000, 0x11, -34, 8
	banim_frame_oam 0x4000, 0x1000, 0x29, -42, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x5000, 0x6, 62, -24
	banim_frame_oam 0x8000, 0x1000, 0x8, 54, -24
	banim_frame_oam 0x4000, 0x1000, 0x46, 62, -8
	banim_frame_oam 0x0, 0x1000, 0x48, 54, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_49_l:
	banim_frame_oam 0x0, 0xD000, 0xF, -56, -48
	banim_frame_oam 0x8000, 0x9000, 0x17, -72, -48
	banim_frame_oam 0x8000, 0x9000, 0x97, -72, -16
	banim_frame_oam 0x8000, 0x1000, 0xC, -72, -64
	banim_frame_oam 0x4000, 0x9000, 0xD9, -40, -64
	banim_frame_oam 0x0, 0x5000, 0xDD, -56, -64
	banim_frame_oam 0x8000, 0x1000, 0xDF, -64, -64
	banim_frame_oam 0x4000, 0x5000, 0xBC, -64, -72
	banim_frame_oam 0x4000, 0x5000, 0x9C, -64, -80
	banim_frame_oam 0x8000, 0x5000, 0x8E, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0x8D, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xCD, -80, -32
	banim_frame_oam 0x0, 0x1000, 0xED, 8, -40
	banim_frame_end
banim_wykm_sp1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -72, -80
	banim_frame_oam 0x4000, 0x9000, 0xA0, -72, -48
	banim_frame_oam 0x4000, 0x5000, 0xE0, -72, -32
	banim_frame_oam 0x4000, 0x1000, 0x0, -56, -88
	banim_frame_oam 0x4000, 0x1000, 0x2, -56, -24
	banim_frame_oam 0x0, 0x5000, 0x88, -40, -40
	banim_frame_oam 0x0, 0x1000, 0xC9, -40, -24
	banim_frame_oam 0x4000, 0x1000, 0xC7, -40, -16
	banim_frame_oam 0x4000, 0x1000, 0xC5, -40, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -32, 0
	banim_frame_oam 0x4000, 0x5000, 0xE4, -24, 8
	banim_frame_oam 0x4000, 0x5000, 0xE8, -56, 8
	banim_frame_oam 0x4000, 0x1000, 0xEC, -72, 8
	banim_frame_oam 0x4000, 0x9000, 0x84, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x6B, 8, -48
	banim_frame_oam 0x8000, 0x5000, 0x6A, 16, -40
	banim_frame_oam 0x8000, 0x1000, 0xAC, -80, -40
	banim_frame_oam 0x0, 0x5000, 0xA, -40, -72
	banim_frame_oam 0x4000, 0x9000, 0xC, -32, -56
	banim_frame_oam 0x8000, 0x1000, 0x49, -40, -56
	banim_frame_oam 0x4000, 0x5000, 0x64, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x24, 0, -56
	banim_frame_oam 0x4000, 0x1000, 0x5, -16, -64
	banim_frame_oam 0x0, 0x1000, 0x8C, -24, -64
	banim_frame_end
banim_wykm_sp1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x11, 38, -48
	banim_frame_oam 0x4000, 0xD000, 0x15, 6, -80
	banim_frame_oam 0x0, 0x9000, 0x91, 6, -48
	banim_frame_oam 0x0, 0x9000, 0x95, 6, -16
	banim_frame_oam 0x0, 0x9000, 0x99, -26, -16
	banim_frame_oam 0x0, 0x1000, 0x9D, 54, -16
	banim_frame_oam 0x0, 0x1000, 0xBD, -34, -8
	banim_frame_oam 0x8000, 0x9000, 0x1D, 38, -16
	banim_frame_end
banim_wykm_sp1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, 14, -48
	banim_frame_oam 0x4000, 0x9000, 0xC4, -18, 0
	banim_frame_oam 0x0, 0x5000, 0x24, -34, -8
	banim_frame_oam 0x4000, 0x1000, 0x4, -34, 8
	banim_frame_oam 0x8000, 0x1000, 0x46, -42, 0
	banim_frame_oam 0x0, 0x1000, 0x6, 46, 8
	banim_frame_oam 0x8000, 0x1000, 0x27, 46, -32
	banim_frame_oam 0x0, 0x1000, 0x67, 46, -16
	banim_frame_oam 0x0, 0x9000, 0x8, -2, -80
	banim_frame_oam 0x0, 0x5000, 0x88, 30, -80
	banim_frame_oam 0x8000, 0x1000, 0xC8, 30, -64
	banim_frame_oam 0x0, 0x5000, 0x8A, -50, -16
	banim_frame_oam 0x8000, 0x9000, 0xC, -2, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_12_l:
	banim_frame_oam 0x8000, 0xD000, 0xE, 14, -72
	banim_frame_oam 0x8000, 0x9000, 0x12, 46, -56
	banim_frame_oam 0x8000, 0x9000, 0x92, 46, -24
	banim_frame_oam 0x0, 0x9000, 0x14, -18, -48
	banim_frame_oam 0x4000, 0x9000, 0x94, -18, -16
	banim_frame_oam 0x4000, 0x5000, 0xD4, 14, 0
	banim_frame_oam 0x8000, 0x5000, 0x8D, -26, -16
	banim_frame_oam 0x8000, 0x1000, 0x8C, 6, -72
	banim_frame_oam 0x0, 0x1000, 0xCC, 6, -56
	banim_frame_oam 0x8000, 0x9000, 0x18, 62, -48
	banim_frame_oam 0x0, 0x5000, 0x98, 70, -16
	banim_frame_oam 0x4000, 0x5000, 0xF4, 38, 8
	banim_frame_oam 0x4000, 0x5000, 0xF8, 6, 8
	banim_frame_oam 0x0, 0x5000, 0xBA, -10, 0
	banim_frame_oam 0x0, 0x1000, 0x9A, 78, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 6, -96
	banim_frame_oam 0x4000, 0x9000, 0x80, 6, -64
	banim_frame_oam 0x0, 0x5000, 0xC0, 22, -48
	banim_frame_oam 0x4000, 0x1000, 0xC2, 6, -48
	banim_frame_oam 0x0, 0x9000, 0x4, -26, -64
	banim_frame_oam 0x0, 0x9000, 0x84, 38, -72
	banim_frame_oam 0x0, 0x5000, 0x8, 38, -8
	banim_frame_oam 0x4000, 0x5000, 0xA, -10, 8
	banim_frame_oam 0x0, 0x5000, 0x48, 22, 0
	banim_frame_oam 0x8000, 0x9000, 0x88, -42, -48
	banim_frame_oam 0x8000, 0x9000, 0x2A, 54, -40
	banim_frame_oam 0x0, 0x5000, 0x2C, 38, -40
	banim_frame_oam 0x0, 0x5000, 0xAA, 70, -56
	banim_frame_oam 0x8000, 0x5000, 0x8C, -2, -96
	banim_frame_oam 0x4000, 0x5000, 0xE, 38, 8
	banim_frame_oam 0x0, 0x5000, 0x2E, -18, -32
	banim_frame_oam 0x0, 0x1000, 0x6D, -26, -32
	banim_frame_oam 0x0, 0x1000, 0x6E, -50, -24
	banim_frame_oam 0x0, 0x1000, 0x8E, -18, 8
	banim_frame_oam 0x0, 0x1000, 0x8D, 54, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -10, -88
	banim_frame_oam 0x0, 0x9000, 0x8, -42, -88
	banim_frame_oam 0x4000, 0x5000, 0x80, 14, 8
	banim_frame_oam 0x4000, 0x5000, 0x84, -18, 8
	banim_frame_oam 0x0, 0x1000, 0x88, -26, 8
	banim_frame_oam 0x4000, 0x9000, 0xA0, 22, -56
	banim_frame_oam 0x0, 0x5000, 0xA4, 46, -40
	banim_frame_oam 0x0, 0x5000, 0xA6, -50, -56
	banim_frame_oam 0x4000, 0x1000, 0xC8, -34, -56
	banim_frame_oam 0x0, 0x1000, 0xA8, -50, -64
	banim_frame_end
banim_wykm_sp1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x5000, 0x93, -16, -88
	banim_frame_oam 0x0, 0x5000, 0xD3, 0, -72
	banim_frame_oam 0x0, 0x1000, 0x56, -8, -72
	banim_frame_oam 0x0, 0x1000, 0x55, 0, -80
	banim_frame_oam 0x4000, 0x5000, 0xF5, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x17, 16, -64
	banim_frame_oam 0x8000, 0x1000, 0x16, 24, -64
	banim_frame_oam 0x0, 0x1000, 0x35, 32, -56
	banim_frame_end
banim_wykm_sp1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x5000, 0xD5, -40, 8
	banim_frame_oam 0x4000, 0x1000, 0xB5, -8, -72
	banim_frame_oam 0x8000, 0x1000, 0x76, -8, -88
	banim_frame_oam 0x0, 0x1000, 0x77, -16, -88
	banim_frame_end
banim_wykm_sp1_oam_frame_17_l:
	banim_frame_end
banim_wykm_sp1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x5000, 0x68, -92, -88
	banim_frame_end
banim_wykm_sp1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x1000, 0x89, -76, -72
	banim_frame_oam 0x0, 0x1000, 0x87, -76, -64
	banim_frame_oam 0x8000, 0x1000, 0x68, -60, -80
	banim_frame_oam 0x8000, 0x9000, 0x80, -92, -72
	banim_frame_oam 0x0, 0x5000, 0x40, -92, -88
	banim_frame_oam 0x0, 0x5000, 0x49, -76, -88
	banim_frame_end
banim_wykm_sp1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -84, -88
	banim_frame_oam 0x8000, 0x1000, 0xA6, -92, -72
	banim_frame_oam 0x0, 0x1000, 0xE6, -92, -56
	banim_frame_oam 0x8000, 0x9000, 0x9, -52, -88
	banim_frame_oam 0x4000, 0x1000, 0x89, -52, -56
	banim_frame_oam 0x0, 0x1000, 0x87, -52, -48
	banim_frame_oam 0x8000, 0x1000, 0x68, -36, -64
	banim_frame_oam 0x8000, 0x1000, 0x84, -92, -88
	banim_frame_oam 0x0, 0x1000, 0x28, -36, -88
	banim_frame_oam 0x8000, 0x1000, 0xC4, -92, -48
	banim_frame_end
banim_wykm_sp1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -68, -72
	banim_frame_oam 0x0, 0x5000, 0xC4, -84, -32
	banim_frame_oam 0x8000, 0x9000, 0x44, -84, -88
	banim_frame_oam 0x8000, 0x1000, 0xA6, -76, -56
	banim_frame_oam 0x0, 0x1000, 0xE6, -76, -40
	banim_frame_oam 0x8000, 0x1000, 0x66, -92, -88
	banim_frame_oam 0x0, 0x5000, 0x6, -52, -88
	banim_frame_oam 0x0, 0x1000, 0x47, -60, -88
	banim_frame_oam 0x0, 0x1000, 0x67, -68, -80
	banim_frame_oam 0x8000, 0x9000, 0x9, -36, -72
	banim_frame_oam 0x4000, 0x1000, 0x89, -36, -40
	banim_frame_oam 0x8000, 0x1000, 0x8, -20, -80
	banim_frame_oam 0x0, 0x1000, 0x87, -36, -32
	banim_frame_oam 0x8000, 0x1000, 0x68, -20, -48
	banim_frame_oam 0x8000, 0x5000, 0xB, -92, -56
	banim_frame_oam 0x0, 0x1000, 0xC7, -92, -64
	banim_frame_oam 0x0, 0x1000, 0xA7, -84, -40
	banim_frame_oam 0x0, 0x1000, 0xEC, -36, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, -28, 8
	banim_frame_oam 0x0, 0x1000, 0xE7, -52, 8
	banim_frame_oam 0x0, 0x1000, 0x12, -44, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_22_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -54, -64
	banim_frame_oam 0x0, 0x5000, 0xC4, -70, -24
	banim_frame_oam 0x8000, 0x9000, 0x44, -70, -80
	banim_frame_oam 0x8000, 0x1000, 0xA6, -62, -48
	banim_frame_oam 0x0, 0x1000, 0xE6, -62, -32
	banim_frame_oam 0x8000, 0x1000, 0x66, -78, -80
	banim_frame_oam 0x4000, 0x1000, 0x4, -86, -88
	banim_frame_oam 0x0, 0x1000, 0x46, -70, -88
	banim_frame_oam 0x0, 0x5000, 0x6, -38, -80
	banim_frame_oam 0x4000, 0x1000, 0x24, -46, -88
	banim_frame_oam 0x0, 0x1000, 0x47, -46, -80
	banim_frame_oam 0x0, 0x1000, 0x67, -54, -72
	banim_frame_oam 0x8000, 0x9000, 0x9, -22, -64
	banim_frame_oam 0x4000, 0x1000, 0x89, -22, -32
	banim_frame_oam 0x8000, 0x1000, 0x8, -6, -72
	banim_frame_oam 0x0, 0x1000, 0x87, -22, -24
	banim_frame_oam 0x8000, 0x1000, 0x68, -6, -40
	banim_frame_oam 0x8000, 0x5000, 0xB, -78, -48
	banim_frame_oam 0x8000, 0x5000, 0xC, -86, -72
	banim_frame_oam 0x0, 0x1000, 0xC7, -78, -56
	banim_frame_oam 0x0, 0x1000, 0xA7, -70, -32
	banim_frame_oam 0x0, 0x1000, 0xEC, -14, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, -6, 8
	banim_frame_oam 0x4000, 0x1000, 0xC8, -30, 8
	banim_frame_oam 0x4000, 0x1000, 0xC8, -34, 8
	banim_frame_oam 0x0, 0x1000, 0xE7, -50, 8
	banim_frame_oam 0x0, 0x1000, 0x12, -42, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_23_l:
	banim_frame_oam 0x4000, 0xD000, 0x8D, -56, -16
	banim_frame_oam 0x4000, 0x9000, 0x4D, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x51, -48, -32
	banim_frame_oam 0x8000, 0x1000, 0x55, -56, -32
	banim_frame_oam 0x0, 0x1000, 0x10, 16, -32
	banim_frame_oam 0x0, 0x1000, 0x30, 0, -40
	banim_frame_oam 0x0, 0x5000, 0xD, 16, -48
	banim_frame_oam 0x8000, 0x1000, 0xF, 8, -48
	banim_frame_oam 0x4000, 0x5000, 0x31, -32, -40
	banim_frame_oam 0x0, 0x1000, 0x35, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x11, -64, -24
	banim_frame_oam 0x8000, 0x5000, 0x95, -64, -16
	banim_frame_oam 0x8000, 0x1000, 0x3F, -72, -16
	banim_frame_oam 0x0, 0x5000, 0x17, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0x57, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x36, 24, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x59, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x5D, -32, -32
	banim_frame_oam 0x8000, 0x5000, 0x5F, -40, -32
	banim_frame_oam 0x4000, 0x9000, 0xD9, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xDD, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xDF, -40, 0
	banim_frame_oam 0x0, 0x5000, 0x97, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x78, 16, -8
	banim_frame_oam 0x0, 0x5000, 0x1A, -56, 0
	banim_frame_oam 0x8000, 0x1000, 0x1C, -64, 0
	banim_frame_oam 0x0, 0x5000, 0x1D, -64, -16
	banim_frame_oam 0x0, 0x5000, 0x18, 8, -48
	banim_frame_oam 0x0, 0x1000, 0x58, 16, -32
	banim_frame_oam 0x0, 0x1000, 0x3F, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0x75, 24, -48
	banim_frame_oam 0x8000, 0x1000, 0x37, -48, -16
	banim_frame_oam 0x0, 0x1000, 0x72, -61, -24
	banim_frame_oam 0x0, 0x1000, 0x15, -72, -12
	banim_frame_end
banim_wykm_sp1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x9000, 0x4D, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x10, 16, -32
	banim_frame_oam 0x0, 0x1000, 0x30, 0, -40
	banim_frame_oam 0x0, 0x5000, 0xD, 16, -48
	banim_frame_oam 0x8000, 0x1000, 0xF, 8, -48
	banim_frame_oam 0x4000, 0x5000, 0x31, -32, -40
	banim_frame_oam 0x0, 0x1000, 0x35, -40, -40
	banim_frame_oam 0x0, 0x5000, 0x17, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0x57, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x36, 24, 0
	banim_frame_oam 0x0, 0x9000, 0x76, -64, -24
	banim_frame_oam 0x8000, 0x5000, 0x7A, -72, -24
	banim_frame_oam 0x4000, 0x5000, 0xF6, -64, 8
	banim_frame_oam 0x0, 0x1000, 0xFA, -72, 8
	banim_frame_oam 0x0, 0x9000, 0x8D, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x91, -32, -16
	banim_frame_oam 0x0, 0x5000, 0x51, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0x53, -48, -32
	banim_frame_oam 0x0, 0x1000, 0x55, -56, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -16, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -16, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -16, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -16, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x1000, 0x0, -20, -40
	banim_frame_oam 0x0, 0x1000, 0x40, -20, -24
	banim_frame_oam 0x0, 0x1000, 0x60, -20, -72
	banim_frame_oam 0x0, 0x5000, 0x80, -12, -32
	banim_frame_oam 0x0, 0x1000, 0x61, -12, -40
	banim_frame_oam 0x0, 0x9000, 0x2, -60, -48
	banim_frame_oam 0x8000, 0x5000, 0x6, -68, -48
	banim_frame_oam 0x4000, 0x9000, 0x82, -60, -16
	banim_frame_oam 0x8000, 0x1000, 0x86, -68, -16
	banim_frame_oam 0x4000, 0x9000, 0xC2, -60, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, -28, 8
	banim_frame_oam 0x8000, 0x1000, 0x1, -28, -48
	banim_frame_oam 0x0, 0x1000, 0x41, -28, -32
	banim_frame_oam 0x8000, 0x1000, 0x67, -76, -24
	banim_frame_oam 0x4000, 0x9000, 0x7, -44, -64
	banim_frame_oam 0x4000, 0x9000, 0xB, -76, -64
	banim_frame_oam 0x8000, 0x1000, 0xF, -84, -64
	banim_frame_oam 0x0, 0x1000, 0xC6, -12, -64
	banim_frame_oam 0x0, 0x5000, 0xA7, -12, -80
	banim_frame_end
banim_wykm_sp1_oam_frame_33_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -44, 8
	banim_frame_oam 0x4000, 0xD000, 0x49, -76, -48
	banim_frame_oam 0x4000, 0x9000, 0xC9, -60, -16
	banim_frame_oam 0x4000, 0x1000, 0xCD, -76, -16
	banim_frame_oam 0x4000, 0x1000, 0xED, -52, 0
	banim_frame_oam 0x0, 0x1000, 0xEF, -60, 0
	banim_frame_oam 0x8000, 0x1000, 0x48, -12, -32
	banim_frame_oam 0x0, 0x1000, 0x88, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0x10, -4, -24
	banim_frame_oam 0x4000, 0x9000, 0x16, -60, -64
	banim_frame_oam 0x8000, 0x1000, 0x1A, -68, -64
	banim_frame_oam 0x0, 0x5000, 0x13, -20, -72
	banim_frame_oam 0x4000, 0x1000, 0x11, -20, -56
	banim_frame_oam 0x4000, 0x1000, 0x31, -4, -64
	banim_frame_oam 0x0, 0x1000, 0x35, -28, -64
	banim_frame_end
banim_wykm_sp1_oam_frame_34_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -44, 8
	banim_frame_oam 0x4000, 0xD000, 0x49, -76, -48
	banim_frame_oam 0x4000, 0x9000, 0xC9, -60, -16
	banim_frame_oam 0x4000, 0x1000, 0xCD, -76, -16
	banim_frame_oam 0x4000, 0x1000, 0xED, -52, 0
	banim_frame_oam 0x0, 0x1000, 0xEF, -60, 0
	banim_frame_oam 0x8000, 0x1000, 0x48, -12, -32
	banim_frame_oam 0x0, 0x1000, 0x88, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0x10, -4, -24
	banim_frame_oam 0x4000, 0x9000, 0x51, -28, -72
	banim_frame_oam 0x8000, 0x1000, 0x59, -68, -72
	banim_frame_oam 0x4000, 0x5000, 0x91, -28, -56
	banim_frame_oam 0x4000, 0x5000, 0x95, -60, -56
	banim_frame_oam 0x0, 0x1000, 0x99, -68, -56
	banim_frame_oam 0x4000, 0x5000, 0x75, -60, -64
	banim_frame_oam 0x0, 0x1000, 0x55, -36, -72
	banim_frame_end
banim_wykm_sp1_oam_frame_35_l:
	banim_frame_oam 0x4000, 0x5000, 0xF0, -36, -72
	banim_frame_oam 0x4000, 0x5000, 0xF4, -68, -72
	banim_frame_oam 0x0, 0x1000, 0xF8, -76, -72
	banim_frame_oam 0x4000, 0x9000, 0xB2, -44, -64
	banim_frame_oam 0x0, 0x5000, 0xB6, -60, -64
	banim_frame_oam 0x8000, 0x1000, 0xB8, -68, -64
	banim_frame_oam 0x4000, 0x5000, 0xE0, -44, 8
	banim_frame_oam 0x4000, 0xD000, 0x49, -76, -48
	banim_frame_oam 0x4000, 0x9000, 0xC9, -60, -16
	banim_frame_oam 0x4000, 0x1000, 0xCD, -76, -16
	banim_frame_oam 0x4000, 0x1000, 0xED, -52, 0
	banim_frame_oam 0x0, 0x1000, 0xEF, -60, 0
	banim_frame_oam 0x8000, 0x1000, 0x48, -12, -32
	banim_frame_oam 0x0, 0x1000, 0x88, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0x10, -4, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x9000, 0x1B, -44, -72
	banim_frame_oam 0x4000, 0x5000, 0x5B, -44, -56
	banim_frame_oam 0x8000, 0x1000, 0x3F, -52, -64
	banim_frame_oam 0x8000, 0x1000, 0xB9, -60, -72
	banim_frame_oam 0x0, 0x1000, 0xF9, -60, -56
	banim_frame_oam 0x4000, 0x1000, 0x56, -76, -72
	banim_frame_oam 0x0, 0x1000, 0x58, -84, -72
	banim_frame_oam 0x8000, 0x1000, 0xB1, -68, -64
	banim_frame_oam 0x4000, 0x1000, 0xCF, -84, -64
	banim_frame_oam 0x4000, 0x1000, 0xE7, -84, -56
	banim_frame_oam 0x0, 0x1000, 0x15, -52, -72
	banim_frame_oam 0x4000, 0x5000, 0xE0, -44, 8
	banim_frame_oam 0x4000, 0xD000, 0x49, -76, -48
	banim_frame_oam 0x4000, 0x9000, 0xC9, -60, -16
	banim_frame_oam 0x4000, 0x1000, 0xCD, -76, -16
	banim_frame_oam 0x4000, 0x1000, 0xED, -52, 0
	banim_frame_oam 0x0, 0x1000, 0xEF, -60, 0
	banim_frame_oam 0x8000, 0x1000, 0x48, -12, -32
	banim_frame_oam 0x0, 0x1000, 0x88, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0x10, -4, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -44, 8
	banim_frame_oam 0x4000, 0xD000, 0x49, -76, -48
	banim_frame_oam 0x4000, 0x9000, 0xC9, -60, -16
	banim_frame_oam 0x4000, 0x1000, 0xCD, -76, -16
	banim_frame_oam 0x4000, 0x1000, 0xED, -52, 0
	banim_frame_oam 0x0, 0x1000, 0xEF, -60, 0
	banim_frame_oam 0x8000, 0x1000, 0x48, -12, -32
	banim_frame_oam 0x0, 0x1000, 0x88, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0x10, -4, -24
	banim_frame_oam 0x4000, 0x9000, 0xBA, -68, -64
	banim_frame_oam 0x0, 0x1000, 0xDE, -76, -56
	banim_frame_oam 0x4000, 0x9000, 0x7A, -36, -64
	banim_frame_oam 0x4000, 0x5000, 0xFA, -52, -72
	banim_frame_oam 0x0, 0x1000, 0xFE, -60, -72
	banim_frame_end
banim_wykm_sp1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x22, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x26, -32, -40
	banim_frame_oam 0x8000, 0x5000, 0x28, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0xA2, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xA6, -32, -8
	banim_frame_oam 0x8000, 0x1000, 0xA8, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xE2, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xE6, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, -40, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 16, -48
	banim_frame_oam 0x0, 0x1000, 0x2, 8, -48
	banim_frame_oam 0x0, 0x1000, 0x41, 16, -32
	banim_frame_oam 0x0, 0x5000, 0xA0, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0xE0, 16, 8
	banim_frame_oam 0x0, 0x5000, 0xC9, -56, 0
	banim_frame_oam 0x4000, 0x1000, 0x29, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0x8, -64, -8
	banim_frame_oam 0x0, 0x1000, 0xA, -72, -8
	banim_frame_oam 0x4000, 0x1000, 0x5, -64, -16
	banim_frame_oam 0x0, 0x1000, 0x7, -72, -16
	banim_frame_oam 0x4000, 0x1000, 0x3, -72, -24
	banim_frame_oam 0x0, 0x5000, 0x49, -56, -32
	banim_frame_oam 0x0, 0x1000, 0x8A, -72, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_39_l:
	banim_frame_oam 0x4000, 0xD000, 0x6C, -48, -24
	banim_frame_oam 0x8000, 0x9000, 0x74, -64, -24
	banim_frame_oam 0x4000, 0x5000, 0xEC, -16, 8
	banim_frame_oam 0x4000, 0x5000, 0xF0, -48, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -56, 8
	banim_frame_oam 0x8000, 0x1000, 0x89, -72, -16
	banim_frame_oam 0x0, 0x1000, 0xAA, -72, 0
	banim_frame_oam 0x8000, 0x1000, 0x6B, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xAB, 16, -8
	banim_frame_oam 0x0, 0x1000, 0xEB, 16, 8
	banim_frame_oam 0x4000, 0x9000, 0x2B, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x2F, -24, -40
	banim_frame_oam 0x0, 0x5000, 0x33, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x55, -48, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x5000, 0xB9, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 0
	banim_frame_oam 0x4000, 0x9000, 0xCB, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x6B, 24, 0
	banim_frame_oam 0x4000, 0x9000, 0x71, -56, -24
	banim_frame_oam 0x8000, 0x1000, 0x75, -64, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -56, -8
	banim_frame_oam 0x0, 0x1000, 0xB5, -64, -8
	banim_frame_oam 0x4000, 0x5000, 0xAB, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x6F, -24, -24
	banim_frame_oam 0x0, 0x5000, 0xD6, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0xD8, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x14, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0x36, -48, -32
	banim_frame_oam 0x4000, 0x5000, 0xD, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x11, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x13, -48, -40
	banim_frame_oam 0x8000, 0x1000, 0x98, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0x96, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xB6, 8, -48
	banim_frame_oam 0x8000, 0x1000, 0x89, -72, -16
	banim_frame_oam 0x0, 0x1000, 0xAA, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0xD4, -64, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -48, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, -56, 8
	banim_frame_oam 0x0, 0x5000, 0xD1, -40, 0
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x5000, 0xB9, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 0
	banim_frame_oam 0x4000, 0x9000, 0xCB, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x6B, 24, 0
	banim_frame_oam 0x4000, 0x9000, 0x71, -56, -24
	banim_frame_oam 0x8000, 0x1000, 0x75, -64, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -56, -8
	banim_frame_oam 0x0, 0x1000, 0xB5, -64, -8
	banim_frame_oam 0x4000, 0x5000, 0xAB, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x6F, -24, -24
	banim_frame_oam 0x0, 0x5000, 0xD6, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0xD8, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x14, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0x36, -48, -32
	banim_frame_oam 0x8000, 0x1000, 0x89, -72, -16
	banim_frame_oam 0x0, 0x1000, 0xAA, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0xD4, -64, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -48, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, -56, 8
	banim_frame_oam 0x0, 0x5000, 0x56, 16, -48
	banim_frame_oam 0x8000, 0x1000, 0x58, 8, -48
	banim_frame_oam 0x0, 0x1000, 0x35, 8, -32
	banim_frame_oam 0x4000, 0x5000, 0x18, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x1C, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x1E, -48, -40
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xD1, -40, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x5000, 0xB9, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 0
	banim_frame_oam 0x0, 0x1000, 0x80, -16, -24
	banim_frame_oam 0x4000, 0x9000, 0xCB, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x6B, 24, 0
	banim_frame_oam 0x4000, 0x9000, 0x71, -56, -24
	banim_frame_oam 0x8000, 0x1000, 0x75, -64, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -56, -8
	banim_frame_oam 0x0, 0x1000, 0xB5, -64, -8
	banim_frame_oam 0x4000, 0x5000, 0xAB, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x6F, -24, -24
	banim_frame_oam 0x0, 0x5000, 0xD6, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0xD8, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x36, -48, -32
	banim_frame_oam 0x8000, 0x1000, 0x89, -72, -16
	banim_frame_oam 0x0, 0x1000, 0xAA, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0xD4, -64, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -48, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, -56, 8
	banim_frame_oam 0x0, 0x1000, 0x35, 6, -32
	banim_frame_oam 0x4000, 0x5000, 0x39, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x3D, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x3F, -48, -40
	banim_frame_oam 0x4000, 0x1000, 0x60, -24, -32
	banim_frame_oam 0x0, 0x1000, 0x14, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x17, -32, -32
	banim_frame_oam 0x0, 0x5000, 0x56, 14, -48
	banim_frame_oam 0x8000, 0x1000, 0x58, 6, -48
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xD1, -40, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x5000, 0xB9, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 0
	banim_frame_oam 0x4000, 0x9000, 0xCB, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x6B, 24, 0
	banim_frame_oam 0x4000, 0x9000, 0x71, -56, -24
	banim_frame_oam 0x8000, 0x1000, 0x75, -64, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -56, -8
	banim_frame_oam 0x0, 0x1000, 0xB5, -64, -8
	banim_frame_oam 0x4000, 0x5000, 0xAB, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x6F, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x89, -72, -16
	banim_frame_oam 0x0, 0x1000, 0xAA, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0xD4, -64, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -48, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, -56, 8
	banim_frame_oam 0x4000, 0x9000, 0x7B, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0x16, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0x36, -48, -32
	banim_frame_oam 0x0, 0x1000, 0xF8, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xF6, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x38, 0, -16
	banim_frame_oam 0x4000, 0x5000, 0x59, 0, -40
	banim_frame_oam 0x4000, 0x1000, 0x5D, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x5F, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xD1, -40, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x5000, 0xB9, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 0
	banim_frame_oam 0x4000, 0x9000, 0xCB, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x6B, 24, 0
	banim_frame_oam 0x4000, 0x9000, 0x71, -56, -24
	banim_frame_oam 0x8000, 0x1000, 0x75, -64, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -56, -8
	banim_frame_oam 0x0, 0x1000, 0xB5, -64, -8
	banim_frame_oam 0x4000, 0x5000, 0xAB, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x6F, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x89, -72, -16
	banim_frame_oam 0x0, 0x1000, 0xAA, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0xD4, -64, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -48, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, -56, 8
	banim_frame_oam 0x4000, 0x9000, 0x7B, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0x16, -32, -32
	banim_frame_oam 0x4000, 0x1000, 0x36, -48, -32
	banim_frame_oam 0x0, 0x1000, 0xF8, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xF6, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x38, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0x79, -8, -40
	banim_frame_oam 0x0, 0x5000, 0xD1, -40, 0
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_45_l:
	banim_frame_oam 0x8000, 0x5000, 0x8, -40, -48
	banim_frame_oam 0x8000, 0x5000, 0x88, -40, -16
	banim_frame_oam 0x8000, 0x9000, 0x89, -56, -16
	banim_frame_oam 0x8000, 0x5000, 0x8B, -64, -16
	banim_frame_oam 0x8000, 0x1000, 0x60, -72, -16
	banim_frame_oam 0x0, 0x1000, 0x61, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0x6A, -64, -24
	banim_frame_oam 0x8000, 0xD000, 0x2, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0x6, -32, -48
	banim_frame_oam 0x8000, 0x9000, 0x86, -32, -16
	banim_frame_oam 0x0, 0x5000, 0x0, 16, -48
	banim_frame_oam 0x4000, 0x1000, 0x40, 16, -32
	banim_frame_oam 0x0, 0x5000, 0xA0, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0xE0, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x29, -48, -40
	banim_frame_oam 0x0, 0x1000, 0x49, -48, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_46_l:
	banim_frame_oam 0x8000, 0x5000, 0x88, -40, -16
	banim_frame_oam 0x8000, 0x9000, 0x89, -56, -16
	banim_frame_oam 0x8000, 0x5000, 0x8B, -64, -16
	banim_frame_oam 0x8000, 0x1000, 0x60, -72, -16
	banim_frame_oam 0x0, 0x1000, 0x61, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0x6A, -64, -24
	banim_frame_oam 0x8000, 0x9000, 0x86, -32, -16
	banim_frame_oam 0x0, 0x5000, 0xA0, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0xE0, 16, 8
	banim_frame_oam 0x4000, 0x9000, 0xA, -16, -48
	banim_frame_oam 0x4000, 0x9000, 0xE, -48, -48
	banim_frame_oam 0x4000, 0x5000, 0x4A, -16, -32
	banim_frame_oam 0x4000, 0x5000, 0x4E, -48, -32
	banim_frame_oam 0x4000, 0x1000, 0x66, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x68, -40, -24
	banim_frame_oam 0x0, 0x9000, 0x62, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xE2, -16, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_47_l:
	banim_frame_oam 0x8000, 0x5000, 0x88, -40, -16
	banim_frame_oam 0x8000, 0x9000, 0x89, -56, -16
	banim_frame_oam 0x8000, 0x5000, 0x8B, -64, -16
	banim_frame_oam 0x8000, 0x1000, 0x60, -72, -16
	banim_frame_oam 0x0, 0x1000, 0x61, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0x6A, -64, -24
	banim_frame_oam 0x8000, 0x9000, 0x86, -32, -16
	banim_frame_oam 0x0, 0x5000, 0xA0, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0xE0, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0x66, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x68, -40, -24
	banim_frame_oam 0x0, 0x9000, 0x62, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xE2, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0x6C, -16, -48
	banim_frame_oam 0x4000, 0x9000, 0x70, -48, -48
	banim_frame_oam 0x8000, 0x1000, 0x74, -56, -48
	banim_frame_oam 0x4000, 0x5000, 0xAC, -16, -32
	banim_frame_oam 0x4000, 0x5000, 0xB0, -48, -32
	banim_frame_oam 0x0, 0x1000, 0xB4, -56, -32
	banim_frame_oam 0x0, 0x1000, 0x95, -64, -40
	banim_frame_end
banim_wykm_sp1_oam_frame_48_l:
	banim_frame_oam 0x8000, 0x5000, 0x88, -40, -16
	banim_frame_oam 0x8000, 0x9000, 0x89, -56, -16
	banim_frame_oam 0x8000, 0x5000, 0x8B, -64, -16
	banim_frame_oam 0x8000, 0x1000, 0x60, -72, -16
	banim_frame_oam 0x0, 0x1000, 0x61, -72, 0
	banim_frame_oam 0x4000, 0x1000, 0x6A, -64, -24
	banim_frame_oam 0x8000, 0x9000, 0x86, -32, -16
	banim_frame_oam 0x0, 0x5000, 0xA0, 16, -8
	banim_frame_oam 0x4000, 0x1000, 0xE0, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0x66, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x68, -40, -24
	banim_frame_oam 0x0, 0x9000, 0x62, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xE2, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0x12, -8, -48
	banim_frame_oam 0x4000, 0x9000, 0x16, -40, -48
	banim_frame_oam 0x4000, 0x5000, 0x52, -8, -32
	banim_frame_oam 0x4000, 0x5000, 0x56, -40, -32
	banim_frame_oam 0x0, 0x1000, 0x5A, -48, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_8_l:
	banim_frame_oam 0x0, 0xD000, 0xC, 16, -56
	banim_frame_oam 0x8000, 0xD000, 0x14, -16, -56
	banim_frame_oam 0x0, 0x5000, 0x98, -32, -24
	banim_frame_oam 0x8000, 0x1000, 0x9A, -40, -24
	banim_frame_oam 0x4000, 0x1000, 0xF8, -32, 0
	banim_frame_oam 0x4000, 0x5000, 0x39, 48, 8
	banim_frame_oam 0x4000, 0x5000, 0x58, 16, 8
	banim_frame_oam 0x4000, 0x5000, 0x5C, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0x9C, 8, -80
	banim_frame_oam 0x4000, 0x5000, 0xDC, 8, -64
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_wykm_sp1_oam_r:
banim_wykm_sp1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0xC000, 0x80, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0x6, 16, -48
	banim_frame_oam 0x0, 0x4000, 0x40, 32, -48
	banim_frame_oam 0x0, 0x0, 0x62, 40, -32
	banim_frame_oam 0x4000, 0x8000, 0xC8, 32, 0
	banim_frame_oam 0x8000, 0x0, 0xCC, 64, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 48, -16
	banim_frame_oam 0x8000, 0x0, 0x8C, 64, -16
	banim_frame_oam 0x4000, 0x0, 0xA8, 56, -24
	banim_frame_oam 0x4000, 0x8000, 0x48, 16, -64
	banim_frame_oam 0x4000, 0x0, 0x88, 40, -72
	banim_frame_oam 0x0, 0x4000, 0x8, -8, -64
	banim_frame_oam 0x8000, 0x0, 0xA, 8, -72
	banim_frame_oam 0x0, 0x0, 0xB, 8, -56
	banim_frame_oam 0x4000, 0x0, 0x3, -8, -48
	banim_frame_oam 0x8000, 0x0, 0x5, 8, -48
	banim_frame_oam 0x0, 0x4000, 0x43, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x45, 8, -32
	banim_frame_oam 0x4000, 0x0, 0x23, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x0, -32, -48
	banim_frame_oam 0x8000, 0x0, 0x2, -16, -48
	banim_frame_oam 0x0, 0x0, 0x42, -16, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_1_r:
	banim_frame_oam 0x0, 0xC000, 0x10, -14, -48
	banim_frame_oam 0x8000, 0x4000, 0x18, 50, -48
	banim_frame_oam 0x8000, 0x4000, 0x98, 50, -16
	banim_frame_oam 0x8000, 0x0, 0xAD, 58, -48
	banim_frame_oam 0x8000, 0x8000, 0x4E, 58, -32
	banim_frame_oam 0x0, 0x4000, 0xCE, 58, 0
	banim_frame_oam 0x8000, 0x0, 0x4D, 74, -32
	banim_frame_oam 0x0, 0x0, 0x8D, 74, -16
	banim_frame_oam 0x0, 0x0, 0x3F, -22, -48
	banim_frame_oam 0x4000, 0x8000, 0x19, 2, -64
	banim_frame_oam 0x4000, 0x8000, 0x59, 34, -64
	banim_frame_oam 0x4000, 0x0, 0x3D, 58, -72
	banim_frame_oam 0x4000, 0x0, 0x1D, 18, -72
	banim_frame_end
banim_wykm_sp1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, 4, -56
	banim_frame_oam 0x8000, 0x4000, 0x8, 68, -56
	banim_frame_oam 0x0, 0x8000, 0x84, 36, -24
	banim_frame_oam 0x8000, 0x0, 0x88, 68, -24
	banim_frame_oam 0x8000, 0x0, 0x83, 28, -24
	banim_frame_oam 0x8000, 0x0, 0xC3, 76, -48
	banim_frame_oam 0x8000, 0x8000, 0x80, 4, -88
	banim_frame_oam 0x8000, 0x4000, 0x82, 20, -88
	banim_frame_oam 0x4000, 0x8000, 0x89, 28, -80
	banim_frame_oam 0x4000, 0x4000, 0xC9, 28, -64
	banim_frame_oam 0x0, 0x0, 0x8D, 68, -64
	banim_frame_oam 0x8000, 0x0, 0xAD, 60, -72
	banim_frame_oam 0x4000, 0x4000, 0xE8, 12, 8
	banim_frame_oam 0x4000, 0x4000, 0xEC, 44, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, 4, -56
	banim_frame_oam 0x8000, 0x4000, 0x8, 68, -56
	banim_frame_oam 0x0, 0x8000, 0x84, 36, -24
	banim_frame_oam 0x8000, 0x0, 0x88, 68, -24
	banim_frame_oam 0x8000, 0x0, 0x83, 28, -24
	banim_frame_oam 0x8000, 0x0, 0xC3, 76, -48
	banim_frame_oam 0x4000, 0x8000, 0x89, 28, -80
	banim_frame_oam 0x4000, 0x4000, 0xC9, 28, -64
	banim_frame_oam 0x0, 0x0, 0x8D, 68, -64
	banim_frame_oam 0x8000, 0x0, 0xAD, 60, -72
	banim_frame_oam 0x4000, 0x4000, 0xE8, 12, 8
	banim_frame_oam 0x4000, 0x4000, 0xEC, 44, 8
	banim_frame_oam 0x0, 0x0, 0xF0, 76, 8
	banim_frame_oam 0x8000, 0x8000, 0x9, 12, -88
	banim_frame_end
banim_wykm_sp1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0xC000, 0xB, 12, -64
	banim_frame_oam 0x8000, 0x0, 0x90, 4, -56
	banim_frame_oam 0x0, 0x0, 0xD0, 4, -40
	banim_frame_oam 0x4000, 0x0, 0xCE, 36, 8
	banim_frame_oam 0x4000, 0x4000, 0xE7, 4, 8
	banim_frame_oam 0x8000, 0x0, 0x8F, 76, -48
	banim_frame_oam 0x8000, 0x0, 0x8E, 12, -88
	banim_frame_oam 0x0, 0x8000, 0x91, 28, -32
	banim_frame_oam 0x8000, 0x8000, 0x95, 60, -32
	banim_frame_oam 0x4000, 0x8000, 0x53, 20, -80
	banim_frame_oam 0x0, 0x0, 0x33, 20, -88
	banim_frame_oam 0x0, 0x0, 0x34, 52, -72
	banim_frame_oam 0x4000, 0x4000, 0x13, 28, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_5_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -32, -64
	banim_frame_oam 0x4000, 0x4000, 0x8, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0xC, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x28, -40, -8
	banim_frame_oam 0x4000, 0x0, 0x49, -32, 0
	banim_frame_oam 0x4000, 0x8000, 0x68, -16, -80
	banim_frame_oam 0x0, 0x4000, 0x6C, 16, -80
	banim_frame_oam 0x0, 0x4000, 0x2B, 24, -88
	banim_frame_oam 0x4000, 0x0, 0x2D, 32, -40
	banim_frame_oam 0x0, 0x0, 0x2F, 32, 8
	banim_frame_oam 0x4000, 0x0, 0x29, -48, -32
	banim_frame_oam 0x4000, 0x8000, 0xA8, 32, -24
	banim_frame_oam 0x0, 0x4000, 0xAC, 64, -24
	banim_frame_oam 0x0, 0x4000, 0xAE, 56, -8
	banim_frame_oam 0x4000, 0x0, 0xE8, 56, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_51_r:
	banim_frame_oam 0x0, 0xC000, 0x10, -46, -48
	banim_frame_oam 0x4000, 0x8000, 0x18, -30, -64
	banim_frame_oam 0x4000, 0x4000, 0x58, -22, -72
	banim_frame_oam 0x0, 0x0, 0x5C, 10, -72
	banim_frame_oam 0x4000, 0x4000, 0x3C, 2, -80
	banim_frame_oam 0x0, 0x4000, 0x78, -62, -24
	banim_frame_oam 0x4000, 0x0, 0xF8, 18, 8
	banim_frame_oam 0x0, 0x4000, 0x7A, 18, -16
	banim_frame_oam 0x0, 0x4000, 0x7C, 34, -24
	banim_frame_oam 0x4000, 0x0, 0xB8, 50, -24
	banim_frame_oam 0x0, 0x0, 0xBA, 66, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_52_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -38, -56
	banim_frame_oam 0x8000, 0x8000, 0x4, -30, -88
	banim_frame_oam 0x0, 0x4000, 0x84, -6, -56
	banim_frame_oam 0x0, 0x4000, 0xC4, 10, -64
	banim_frame_oam 0x4000, 0x0, 0xE6, -6, -40
	banim_frame_oam 0x4000, 0x8000, 0xC8, 26, -24
	banim_frame_oam 0x8000, 0x8000, 0x66, -54, -40
	banim_frame_oam 0x0, 0x4000, 0x6, -78, -24
	banim_frame_oam 0x8000, 0x0, 0x8, -62, -24
	banim_frame_oam 0x4000, 0x0, 0x46, -78, -8
	banim_frame_oam 0x0, 0x0, 0x48, -62, -8
	banim_frame_oam 0x4000, 0x8000, 0x49, -6, -8
	banim_frame_oam 0x0, 0x0, 0x8A, -38, -64
	banim_frame_oam 0x0, 0x0, 0xAA, -46, -8
	banim_frame_oam 0x4000, 0x0, 0xA8, 10, -16
	banim_frame_oam 0x4000, 0x4000, 0x9, -70, 8
	banim_frame_oam 0x4000, 0x4000, 0xD, -38, 8
	banim_frame_oam 0x4000, 0x4000, 0x11, -6, 8
	banim_frame_oam 0x4000, 0x0, 0x29, 26, 0
	banim_frame_end
	banim_frame_oam 0x0, 0xC000, 0x17, -18, -48
	banim_frame_oam 0x0, 0x8000, 0x33, 6, -80
	banim_frame_oam 0x0, 0x0, 0x16, -2, -56
	banim_frame_oam 0x0, 0x0, 0x15, 46, -48
	banim_frame_oam 0x4000, 0x4000, 0xB3, 38, -56
	banim_frame_end
banim_wykm_sp1_oam_frame_9_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -46, -48
	banim_frame_oam 0x8000, 0x8000, 0x44, -14, -32
	banim_frame_oam 0x4000, 0x8000, 0xC4, -14, 0
	banim_frame_oam 0x0, 0x0, 0xA6, -14, -40
	banim_frame_oam 0x0, 0x0, 0xA7, 2, -24
	banim_frame_oam 0x8000, 0x8000, 0x26, 18, -16
	banim_frame_oam 0x4000, 0x0, 0x6, 2, -8
	banim_frame_oam 0x4000, 0x0, 0xC8, 26, -24
	banim_frame_oam 0x0, 0x0, 0xE9, 34, -16
	banim_frame_oam 0x0, 0x0, 0xE8, 34, 0
	banim_frame_oam 0x8000, 0xC000, 0xA, -78, -72
	banim_frame_oam 0x4000, 0x4000, 0xE, -46, -56
	banim_frame_oam 0x0, 0x0, 0x8, -54, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_6_r:
	banim_frame_oam 0x0, 0xC000, 0x10, -46, -48
	banim_frame_oam 0x4000, 0x8000, 0x18, -30, -64
	banim_frame_oam 0x4000, 0x4000, 0x58, -22, -72
	banim_frame_oam 0x0, 0x0, 0x5C, 10, -72
	banim_frame_oam 0x4000, 0x4000, 0x3C, 2, -80
	banim_frame_oam 0x4000, 0x0, 0xF8, 18, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 34, 8
	banim_frame_oam 0x0, 0x4000, 0x7A, 18, -16
	banim_frame_oam 0x0, 0x4000, 0x7C, 34, -24
	banim_frame_oam 0x4000, 0x0, 0xB8, 50, -24
	banim_frame_oam 0x0, 0x0, 0xBA, 66, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x4000, 0x78, -62, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_7_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -38, -56
	banim_frame_oam 0x8000, 0x8000, 0x4, -30, -88
	banim_frame_oam 0x0, 0x4000, 0x84, -6, -56
	banim_frame_oam 0x0, 0x4000, 0xC4, 10, -64
	banim_frame_oam 0x4000, 0x0, 0xE6, -6, -40
	banim_frame_oam 0x4000, 0x8000, 0xC8, 26, -24
	banim_frame_oam 0x8000, 0x8000, 0x66, -54, -40
	banim_frame_oam 0x4000, 0x8000, 0x49, -6, -8
	banim_frame_oam 0x0, 0x0, 0x8A, -38, -64
	banim_frame_oam 0x0, 0x0, 0xAA, -46, -8
	banim_frame_oam 0x4000, 0x0, 0xA8, 10, -16
	banim_frame_oam 0x4000, 0x4000, 0x9, -62, 8
	banim_frame_oam 0x4000, 0x4000, 0xD, -30, 8
	banim_frame_oam 0x4000, 0x4000, 0x11, 2, 8
	banim_frame_oam 0x4000, 0x0, 0x29, 26, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x4000, 0x6, -78, -24
	banim_frame_oam 0x8000, 0x0, 0x8, -62, -24
	banim_frame_oam 0x4000, 0x0, 0x46, -78, -8
	banim_frame_oam 0x0, 0x0, 0x48, -62, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_49_r:
	banim_frame_oam 0x0, 0xC000, 0xF, -8, -48
	banim_frame_oam 0x8000, 0x8000, 0x17, 56, -48
	banim_frame_oam 0x8000, 0x8000, 0x97, 56, -16
	banim_frame_oam 0x8000, 0x0, 0xC, 64, -64
	banim_frame_oam 0x4000, 0x8000, 0xD9, 8, -64
	banim_frame_oam 0x0, 0x4000, 0xDD, 40, -64
	banim_frame_oam 0x8000, 0x0, 0xDF, 56, -64
	banim_frame_oam 0x4000, 0x4000, 0xBC, 32, -72
	banim_frame_oam 0x4000, 0x4000, 0x9C, 32, -80
	banim_frame_oam 0x8000, 0x4000, 0x8E, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x8D, -24, -16
	banim_frame_oam 0x0, 0x0, 0xCD, 72, -32
	banim_frame_oam 0x0, 0x0, 0xED, -16, -40
	banim_frame_end
banim_wykm_sp1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x20, 40, -80
	banim_frame_oam 0x4000, 0x8000, 0xA0, 40, -48
	banim_frame_oam 0x4000, 0x4000, 0xE0, 40, -32
	banim_frame_oam 0x4000, 0x0, 0x0, 40, -88
	banim_frame_oam 0x4000, 0x0, 0x2, 40, -24
	banim_frame_oam 0x0, 0x4000, 0x88, 24, -40
	banim_frame_oam 0x0, 0x0, 0xC9, 32, -24
	banim_frame_oam 0x4000, 0x0, 0xC7, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xC5, 24, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 24, 0
	banim_frame_oam 0x4000, 0x4000, 0xE4, -8, 8
	banim_frame_oam 0x4000, 0x4000, 0xE8, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xEC, 56, 8
	banim_frame_oam 0x4000, 0x8000, 0x84, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x6B, -16, -48
	banim_frame_oam 0x8000, 0x4000, 0x6A, -24, -40
	banim_frame_oam 0x8000, 0x0, 0xAC, 72, -40
	banim_frame_oam 0x0, 0x4000, 0xA, 24, -72
	banim_frame_oam 0x4000, 0x8000, 0xC, 0, -56
	banim_frame_oam 0x8000, 0x0, 0x49, 32, -56
	banim_frame_oam 0x4000, 0x4000, 0x64, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x24, -8, -56
	banim_frame_oam 0x4000, 0x0, 0x5, 0, -64
	banim_frame_oam 0x0, 0x0, 0x8C, 16, -64
	banim_frame_end
banim_wykm_sp1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -70, -48
	banim_frame_oam 0x4000, 0xC000, 0x15, -70, -80
	banim_frame_oam 0x0, 0x8000, 0x91, -38, -48
	banim_frame_oam 0x0, 0x8000, 0x95, -38, -16
	banim_frame_oam 0x0, 0x8000, 0x99, -6, -16
	banim_frame_oam 0x0, 0x0, 0x9D, -62, -16
	banim_frame_oam 0x0, 0x0, 0xBD, 26, -8
	banim_frame_oam 0x8000, 0x8000, 0x1D, -54, -16
	banim_frame_end
banim_wykm_sp1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -46, -48
	banim_frame_oam 0x4000, 0x8000, 0xC4, -14, 0
	banim_frame_oam 0x0, 0x4000, 0x24, 18, -8
	banim_frame_oam 0x4000, 0x0, 0x4, 18, 8
	banim_frame_oam 0x8000, 0x0, 0x46, 34, 0
	banim_frame_oam 0x0, 0x0, 0x6, -54, 8
	banim_frame_oam 0x8000, 0x0, 0x27, -54, -32
	banim_frame_oam 0x0, 0x0, 0x67, -54, -16
	banim_frame_oam 0x0, 0x8000, 0x8, -30, -80
	banim_frame_oam 0x0, 0x4000, 0x88, -46, -80
	banim_frame_oam 0x8000, 0x0, 0xC8, -38, -64
	banim_frame_oam 0x0, 0x4000, 0x8A, 34, -16
	banim_frame_oam 0x8000, 0x8000, 0xC, -14, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_12_r:
	banim_frame_oam 0x8000, 0xC000, 0xE, -46, -72
	banim_frame_oam 0x8000, 0x8000, 0x12, -62, -56
	banim_frame_oam 0x8000, 0x8000, 0x92, -62, -24
	banim_frame_oam 0x0, 0x8000, 0x14, -14, -48
	banim_frame_oam 0x4000, 0x8000, 0x94, -14, -16
	banim_frame_oam 0x4000, 0x4000, 0xD4, -46, 0
	banim_frame_oam 0x8000, 0x4000, 0x8D, 18, -16
	banim_frame_oam 0x8000, 0x0, 0x8C, -14, -72
	banim_frame_oam 0x0, 0x0, 0xCC, -14, -56
	banim_frame_oam 0x8000, 0x8000, 0x18, -78, -48
	banim_frame_oam 0x0, 0x4000, 0x98, -86, -16
	banim_frame_oam 0x4000, 0x4000, 0xF4, -70, 8
	banim_frame_oam 0x4000, 0x4000, 0xF8, -38, 8
	banim_frame_oam 0x0, 0x4000, 0xBA, -6, 0
	banim_frame_oam 0x0, 0x0, 0x9A, -86, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -38, -96
	banim_frame_oam 0x4000, 0x8000, 0x80, -38, -64
	banim_frame_oam 0x0, 0x4000, 0xC0, -38, -48
	banim_frame_oam 0x4000, 0x0, 0xC2, -22, -48
	banim_frame_oam 0x0, 0x8000, 0x4, -6, -64
	banim_frame_oam 0x0, 0x8000, 0x84, -70, -72
	banim_frame_oam 0x0, 0x4000, 0x8, -54, -8
	banim_frame_oam 0x4000, 0x4000, 0xA, -22, 8
	banim_frame_oam 0x0, 0x4000, 0x48, -38, 0
	banim_frame_oam 0x8000, 0x8000, 0x88, 26, -48
	banim_frame_oam 0x8000, 0x8000, 0x2A, -70, -40
	banim_frame_oam 0x0, 0x4000, 0x2C, -54, -40
	banim_frame_oam 0x0, 0x4000, 0xAA, -86, -56
	banim_frame_oam 0x8000, 0x4000, 0x8C, -6, -96
	banim_frame_oam 0x4000, 0x4000, 0xE, -70, 8
	banim_frame_oam 0x0, 0x4000, 0x2E, 2, -32
	banim_frame_oam 0x0, 0x0, 0x6D, 18, -32
	banim_frame_oam 0x0, 0x0, 0x6E, 42, -24
	banim_frame_oam 0x0, 0x0, 0x8E, 10, 8
	banim_frame_oam 0x0, 0x0, 0x8D, -62, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -54, -88
	banim_frame_oam 0x0, 0x8000, 0x8, 10, -88
	banim_frame_oam 0x4000, 0x4000, 0x80, -46, 8
	banim_frame_oam 0x4000, 0x4000, 0x84, -14, 8
	banim_frame_oam 0x0, 0x0, 0x88, 18, 8
	banim_frame_oam 0x4000, 0x8000, 0xA0, -54, -56
	banim_frame_oam 0x0, 0x4000, 0xA4, -62, -40
	banim_frame_oam 0x0, 0x4000, 0xA6, 34, -56
	banim_frame_oam 0x4000, 0x0, 0xC8, 18, -56
	banim_frame_oam 0x0, 0x0, 0xA8, 42, -64
	banim_frame_end
banim_wykm_sp1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x4000, 0x93, 0, -88
	banim_frame_oam 0x0, 0x4000, 0xD3, -16, -72
	banim_frame_oam 0x0, 0x0, 0x56, 0, -72
	banim_frame_oam 0x0, 0x0, 0x55, -8, -80
	banim_frame_oam 0x4000, 0x4000, 0xF5, -8, 8
	banim_frame_oam 0x0, 0x0, 0x17, -24, -64
	banim_frame_oam 0x8000, 0x0, 0x16, -32, -64
	banim_frame_oam 0x0, 0x0, 0x35, -40, -56
	banim_frame_end
banim_wykm_sp1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x4000, 0xD5, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xB5, -8, -72
	banim_frame_oam 0x8000, 0x0, 0x76, 0, -88
	banim_frame_oam 0x0, 0x0, 0x77, 8, -88
	banim_frame_end
banim_wykm_sp1_oam_frame_17_r:
	banim_frame_end
banim_wykm_sp1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x4000, 0x68, 76, -88
	banim_frame_end
banim_wykm_sp1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x0, 0x89, 60, -72
	banim_frame_oam 0x0, 0x0, 0x87, 68, -64
	banim_frame_oam 0x8000, 0x0, 0x68, 52, -80
	banim_frame_oam 0x8000, 0x8000, 0x80, 76, -72
	banim_frame_oam 0x0, 0x4000, 0x40, 76, -88
	banim_frame_oam 0x0, 0x4000, 0x49, 60, -88
	banim_frame_end
banim_wykm_sp1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, 52, -88
	banim_frame_oam 0x8000, 0x0, 0xA6, 84, -72
	banim_frame_oam 0x0, 0x0, 0xE6, 84, -56
	banim_frame_oam 0x8000, 0x8000, 0x9, 36, -88
	banim_frame_oam 0x4000, 0x0, 0x89, 36, -56
	banim_frame_oam 0x0, 0x0, 0x87, 44, -48
	banim_frame_oam 0x8000, 0x0, 0x68, 28, -64
	banim_frame_oam 0x8000, 0x0, 0x84, 84, -88
	banim_frame_oam 0x0, 0x0, 0x28, 28, -88
	banim_frame_oam 0x8000, 0x0, 0xC4, 84, -48
	banim_frame_end
banim_wykm_sp1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, 36, -72
	banim_frame_oam 0x0, 0x4000, 0xC4, 68, -32
	banim_frame_oam 0x8000, 0x8000, 0x44, 68, -88
	banim_frame_oam 0x8000, 0x0, 0xA6, 68, -56
	banim_frame_oam 0x0, 0x0, 0xE6, 68, -40
	banim_frame_oam 0x8000, 0x0, 0x66, 84, -88
	banim_frame_oam 0x0, 0x4000, 0x6, 36, -88
	banim_frame_oam 0x0, 0x0, 0x47, 52, -88
	banim_frame_oam 0x0, 0x0, 0x67, 60, -80
	banim_frame_oam 0x8000, 0x8000, 0x9, 20, -72
	banim_frame_oam 0x4000, 0x0, 0x89, 20, -40
	banim_frame_oam 0x8000, 0x0, 0x8, 12, -80
	banim_frame_oam 0x0, 0x0, 0x87, 28, -32
	banim_frame_oam 0x8000, 0x0, 0x68, 12, -48
	banim_frame_oam 0x8000, 0x4000, 0xB, 84, -56
	banim_frame_oam 0x0, 0x0, 0xC7, 84, -64
	banim_frame_oam 0x0, 0x0, 0xA7, 76, -40
	banim_frame_oam 0x0, 0x0, 0xEC, 28, 8
	banim_frame_oam 0x0, 0x0, 0xE8, 20, 8
	banim_frame_oam 0x0, 0x0, 0xE7, 44, 8
	banim_frame_oam 0x0, 0x0, 0x12, 36, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_22_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, 22, -64
	banim_frame_oam 0x0, 0x4000, 0xC4, 54, -24
	banim_frame_oam 0x8000, 0x8000, 0x44, 54, -80
	banim_frame_oam 0x8000, 0x0, 0xA6, 54, -48
	banim_frame_oam 0x0, 0x0, 0xE6, 54, -32
	banim_frame_oam 0x8000, 0x0, 0x66, 70, -80
	banim_frame_oam 0x4000, 0x0, 0x4, 70, -88
	banim_frame_oam 0x0, 0x0, 0x46, 62, -88
	banim_frame_oam 0x0, 0x4000, 0x6, 22, -80
	banim_frame_oam 0x4000, 0x0, 0x24, 30, -88
	banim_frame_oam 0x0, 0x0, 0x47, 38, -80
	banim_frame_oam 0x0, 0x0, 0x67, 46, -72
	banim_frame_oam 0x8000, 0x8000, 0x9, 6, -64
	banim_frame_oam 0x4000, 0x0, 0x89, 6, -32
	banim_frame_oam 0x8000, 0x0, 0x8, -2, -72
	banim_frame_oam 0x0, 0x0, 0x87, 14, -24
	banim_frame_oam 0x8000, 0x0, 0x68, -2, -40
	banim_frame_oam 0x8000, 0x4000, 0xB, 70, -48
	banim_frame_oam 0x8000, 0x4000, 0xC, 78, -72
	banim_frame_oam 0x0, 0x0, 0xC7, 70, -56
	banim_frame_oam 0x0, 0x0, 0xA7, 62, -32
	banim_frame_oam 0x0, 0x0, 0xEC, 6, 8
	banim_frame_oam 0x0, 0x0, 0xE8, -2, 8
	banim_frame_oam 0x4000, 0x0, 0xC8, 14, 8
	banim_frame_oam 0x4000, 0x0, 0xC8, 18, 8
	banim_frame_oam 0x0, 0x0, 0xE7, 42, 8
	banim_frame_oam 0x0, 0x0, 0x12, 34, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_23_r:
	banim_frame_oam 0x4000, 0xC000, 0x8D, -8, -16
	banim_frame_oam 0x4000, 0x8000, 0x4D, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x51, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x55, 48, -32
	banim_frame_oam 0x0, 0x0, 0x10, -24, -32
	banim_frame_oam 0x0, 0x0, 0x30, -8, -40
	banim_frame_oam 0x0, 0x4000, 0xD, -32, -48
	banim_frame_oam 0x8000, 0x0, 0xF, -16, -48
	banim_frame_oam 0x4000, 0x4000, 0x31, 0, -40
	banim_frame_oam 0x0, 0x0, 0x35, 32, -40
	banim_frame_oam 0x0, 0x0, 0x11, 56, -24
	banim_frame_oam 0x8000, 0x4000, 0x95, 56, -16
	banim_frame_oam 0x8000, 0x0, 0x3F, 64, -16
	banim_frame_oam 0x0, 0x4000, 0x17, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x57, -24, 8
	banim_frame_oam 0x8000, 0x0, 0x36, -32, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x59, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x5D, 16, -32
	banim_frame_oam 0x8000, 0x4000, 0x5F, 32, -32
	banim_frame_oam 0x4000, 0x8000, 0xD9, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xDD, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xDF, 32, 0
	banim_frame_oam 0x0, 0x4000, 0x97, -32, 0
	banim_frame_oam 0x0, 0x0, 0x78, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x1A, 40, 0
	banim_frame_oam 0x8000, 0x0, 0x1C, 56, 0
	banim_frame_oam 0x0, 0x4000, 0x1D, 48, -16
	banim_frame_oam 0x0, 0x4000, 0x18, -24, -48
	banim_frame_oam 0x0, 0x0, 0x58, -24, -32
	banim_frame_oam 0x0, 0x0, 0x3F, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x75, -32, -48
	banim_frame_oam 0x8000, 0x0, 0x37, 40, -16
	banim_frame_oam 0x0, 0x0, 0x72, 53, -24
	banim_frame_oam 0x0, 0x0, 0x15, 64, -12
	banim_frame_end
banim_wykm_sp1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x8000, 0x4D, -16, -32
	banim_frame_oam 0x0, 0x0, 0x10, -24, -32
	banim_frame_oam 0x0, 0x0, 0x30, -8, -40
	banim_frame_oam 0x0, 0x4000, 0xD, -32, -48
	banim_frame_oam 0x8000, 0x0, 0xF, -16, -48
	banim_frame_oam 0x4000, 0x4000, 0x31, 0, -40
	banim_frame_oam 0x0, 0x0, 0x35, 32, -40
	banim_frame_oam 0x0, 0x4000, 0x17, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x57, -24, 8
	banim_frame_oam 0x8000, 0x0, 0x36, -32, 0
	banim_frame_oam 0x0, 0x8000, 0x76, 32, -24
	banim_frame_oam 0x8000, 0x4000, 0x7A, 64, -24
	banim_frame_oam 0x4000, 0x4000, 0xF6, 32, 8
	banim_frame_oam 0x0, 0x0, 0xFA, 64, 8
	banim_frame_oam 0x0, 0x8000, 0x8D, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x91, 24, -16
	banim_frame_oam 0x0, 0x4000, 0x51, 16, -32
	banim_frame_oam 0x4000, 0x0, 0x53, 32, -32
	banim_frame_oam 0x0, 0x0, 0x55, 48, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 8, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 8, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 8, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 8, -8
	banim_frame_end
banim_wykm_sp1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x0, 0x0, 12, -40
	banim_frame_oam 0x0, 0x0, 0x40, 12, -24
	banim_frame_oam 0x0, 0x0, 0x60, 12, -72
	banim_frame_oam 0x0, 0x4000, 0x80, -4, -32
	banim_frame_oam 0x0, 0x0, 0x61, 4, -40
	banim_frame_oam 0x0, 0x8000, 0x2, 28, -48
	banim_frame_oam 0x8000, 0x4000, 0x6, 60, -48
	banim_frame_oam 0x4000, 0x8000, 0x82, 28, -16
	banim_frame_oam 0x8000, 0x0, 0x86, 60, -16
	banim_frame_oam 0x4000, 0x8000, 0xC2, 28, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, 12, 8
	banim_frame_oam 0x8000, 0x0, 0x1, 20, -48
	banim_frame_oam 0x0, 0x0, 0x41, 20, -32
	banim_frame_oam 0x8000, 0x0, 0x67, 68, -24
	banim_frame_oam 0x4000, 0x8000, 0x7, 12, -64
	banim_frame_oam 0x4000, 0x8000, 0xB, 44, -64
	banim_frame_oam 0x8000, 0x0, 0xF, 76, -64
	banim_frame_oam 0x0, 0x0, 0xC6, 4, -64
	banim_frame_oam 0x0, 0x4000, 0xA7, -4, -80
	banim_frame_end
banim_wykm_sp1_oam_frame_33_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, 12, 8
	banim_frame_oam 0x4000, 0xC000, 0x49, 12, -48
	banim_frame_oam 0x4000, 0x8000, 0xC9, 28, -16
	banim_frame_oam 0x4000, 0x0, 0xCD, 60, -16
	banim_frame_oam 0x4000, 0x0, 0xED, 36, 0
	banim_frame_oam 0x0, 0x0, 0xEF, 52, 0
	banim_frame_oam 0x8000, 0x0, 0x48, 4, -32
	banim_frame_oam 0x0, 0x0, 0x88, 4, -16
	banim_frame_oam 0x8000, 0x0, 0x10, -4, -24
	banim_frame_oam 0x4000, 0x8000, 0x16, 28, -64
	banim_frame_oam 0x8000, 0x0, 0x1A, 60, -64
	banim_frame_oam 0x0, 0x4000, 0x13, 4, -72
	banim_frame_oam 0x4000, 0x0, 0x11, 4, -56
	banim_frame_oam 0x4000, 0x0, 0x31, -12, -64
	banim_frame_oam 0x0, 0x0, 0x35, 20, -64
	banim_frame_end
banim_wykm_sp1_oam_frame_34_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, 12, 8
	banim_frame_oam 0x4000, 0xC000, 0x49, 12, -48
	banim_frame_oam 0x4000, 0x8000, 0xC9, 28, -16
	banim_frame_oam 0x4000, 0x0, 0xCD, 60, -16
	banim_frame_oam 0x4000, 0x0, 0xED, 36, 0
	banim_frame_oam 0x0, 0x0, 0xEF, 52, 0
	banim_frame_oam 0x8000, 0x0, 0x48, 4, -32
	banim_frame_oam 0x0, 0x0, 0x88, 4, -16
	banim_frame_oam 0x8000, 0x0, 0x10, -4, -24
	banim_frame_oam 0x4000, 0x8000, 0x51, -4, -72
	banim_frame_oam 0x8000, 0x0, 0x59, 60, -72
	banim_frame_oam 0x4000, 0x4000, 0x91, -4, -56
	banim_frame_oam 0x4000, 0x4000, 0x95, 28, -56
	banim_frame_oam 0x0, 0x0, 0x99, 60, -56
	banim_frame_oam 0x4000, 0x4000, 0x75, 28, -64
	banim_frame_oam 0x0, 0x0, 0x55, 28, -72
	banim_frame_end
banim_wykm_sp1_oam_frame_35_r:
	banim_frame_oam 0x4000, 0x4000, 0xF0, 4, -72
	banim_frame_oam 0x4000, 0x4000, 0xF4, 36, -72
	banim_frame_oam 0x0, 0x0, 0xF8, 68, -72
	banim_frame_oam 0x4000, 0x8000, 0xB2, 12, -64
	banim_frame_oam 0x0, 0x4000, 0xB6, 44, -64
	banim_frame_oam 0x8000, 0x0, 0xB8, 60, -64
	banim_frame_oam 0x4000, 0x4000, 0xE0, 12, 8
	banim_frame_oam 0x4000, 0xC000, 0x49, 12, -48
	banim_frame_oam 0x4000, 0x8000, 0xC9, 28, -16
	banim_frame_oam 0x4000, 0x0, 0xCD, 60, -16
	banim_frame_oam 0x4000, 0x0, 0xED, 36, 0
	banim_frame_oam 0x0, 0x0, 0xEF, 52, 0
	banim_frame_oam 0x8000, 0x0, 0x48, 4, -32
	banim_frame_oam 0x0, 0x0, 0x88, 4, -16
	banim_frame_oam 0x8000, 0x0, 0x10, -4, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x8000, 0x1B, 12, -72
	banim_frame_oam 0x4000, 0x4000, 0x5B, 12, -56
	banim_frame_oam 0x8000, 0x0, 0x3F, 44, -64
	banim_frame_oam 0x8000, 0x0, 0xB9, 52, -72
	banim_frame_oam 0x0, 0x0, 0xF9, 52, -56
	banim_frame_oam 0x4000, 0x0, 0x56, 60, -72
	banim_frame_oam 0x0, 0x0, 0x58, 76, -72
	banim_frame_oam 0x8000, 0x0, 0xB1, 60, -64
	banim_frame_oam 0x4000, 0x0, 0xCF, 68, -64
	banim_frame_oam 0x4000, 0x0, 0xE7, 68, -56
	banim_frame_oam 0x0, 0x0, 0x15, 44, -72
	banim_frame_oam 0x4000, 0x4000, 0xE0, 12, 8
	banim_frame_oam 0x4000, 0xC000, 0x49, 12, -48
	banim_frame_oam 0x4000, 0x8000, 0xC9, 28, -16
	banim_frame_oam 0x4000, 0x0, 0xCD, 60, -16
	banim_frame_oam 0x4000, 0x0, 0xED, 36, 0
	banim_frame_oam 0x0, 0x0, 0xEF, 52, 0
	banim_frame_oam 0x8000, 0x0, 0x48, 4, -32
	banim_frame_oam 0x0, 0x0, 0x88, 4, -16
	banim_frame_oam 0x8000, 0x0, 0x10, -4, -24
	banim_frame_end
banim_wykm_sp1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, 12, 8
	banim_frame_oam 0x4000, 0xC000, 0x49, 12, -48
	banim_frame_oam 0x4000, 0x8000, 0xC9, 28, -16
	banim_frame_oam 0x4000, 0x0, 0xCD, 60, -16
	banim_frame_oam 0x4000, 0x0, 0xED, 36, 0
	banim_frame_oam 0x0, 0x0, 0xEF, 52, 0
	banim_frame_oam 0x8000, 0x0, 0x48, 4, -32
	banim_frame_oam 0x0, 0x0, 0x88, 4, -16
	banim_frame_oam 0x8000, 0x0, 0x10, -4, -24
	banim_frame_oam 0x4000, 0x8000, 0xBA, 36, -64
	banim_frame_oam 0x0, 0x0, 0xDE, 68, -56
	banim_frame_oam 0x4000, 0x8000, 0x7A, 4, -64
	banim_frame_oam 0x4000, 0x4000, 0xFA, 20, -72
	banim_frame_oam 0x0, 0x0, 0xFE, 52, -72
	banim_frame_end
banim_wykm_sp1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x22, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x26, 16, -40
	banim_frame_oam 0x8000, 0x4000, 0x28, 32, -40
	banim_frame_oam 0x4000, 0x8000, 0xA2, -16, -8
	banim_frame_oam 0x0, 0x4000, 0xA6, 16, -8
	banim_frame_oam 0x8000, 0x0, 0xA8, 32, -8
	banim_frame_oam 0x4000, 0x4000, 0xE2, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE6, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE8, 32, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -32, -48
	banim_frame_oam 0x0, 0x0, 0x2, -16, -48
	banim_frame_oam 0x0, 0x0, 0x41, -24, -32
	banim_frame_oam 0x0, 0x4000, 0xA0, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xE0, -32, 8
	banim_frame_oam 0x0, 0x4000, 0xC9, 40, 0
	banim_frame_oam 0x4000, 0x0, 0x29, 56, 0
	banim_frame_oam 0x4000, 0x0, 0x8, 48, -8
	banim_frame_oam 0x0, 0x0, 0xA, 64, -8
	banim_frame_oam 0x4000, 0x0, 0x5, 48, -16
	banim_frame_oam 0x0, 0x0, 0x7, 64, -16
	banim_frame_oam 0x4000, 0x0, 0x3, 56, -24
	banim_frame_oam 0x0, 0x4000, 0x49, 40, -32
	banim_frame_oam 0x0, 0x0, 0x8A, 64, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_39_r:
	banim_frame_oam 0x4000, 0xC000, 0x6C, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x74, 48, -24
	banim_frame_oam 0x4000, 0x4000, 0xEC, -16, 8
	banim_frame_oam 0x4000, 0x4000, 0xF0, 16, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 48, 8
	banim_frame_oam 0x8000, 0x0, 0x89, 64, -16
	banim_frame_oam 0x0, 0x0, 0xAA, 64, 0
	banim_frame_oam 0x8000, 0x0, 0x6B, -32, 0
	banim_frame_oam 0x8000, 0x0, 0xAB, -24, -8
	banim_frame_oam 0x0, 0x0, 0xEB, -24, 8
	banim_frame_oam 0x4000, 0x8000, 0x2B, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0x2F, -8, -40
	banim_frame_oam 0x0, 0x4000, 0x33, 24, -40
	banim_frame_oam 0x0, 0x0, 0x55, 40, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x4000, 0xB9, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 0
	banim_frame_oam 0x4000, 0x8000, 0xCB, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x6B, -32, 0
	banim_frame_oam 0x4000, 0x8000, 0x71, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x75, 56, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, 24, -8
	banim_frame_oam 0x0, 0x0, 0xB5, 56, -8
	banim_frame_oam 0x4000, 0x4000, 0xAB, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x6F, 8, -24
	banim_frame_oam 0x0, 0x4000, 0xD6, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xD8, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0x14, 0, -32
	banim_frame_oam 0x4000, 0x0, 0x36, 32, -32
	banim_frame_oam 0x4000, 0x4000, 0xD, -8, -40
	banim_frame_oam 0x4000, 0x0, 0x11, 24, -40
	banim_frame_oam 0x0, 0x0, 0x13, 40, -40
	banim_frame_oam 0x8000, 0x0, 0x98, -16, -40
	banim_frame_oam 0x4000, 0x0, 0x96, -32, -40
	banim_frame_oam 0x0, 0x0, 0xB6, -16, -48
	banim_frame_oam 0x8000, 0x0, 0x89, 64, -16
	banim_frame_oam 0x0, 0x0, 0xAA, 64, 0
	banim_frame_oam 0x4000, 0x0, 0xD4, 48, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 40, 0
	banim_frame_oam 0x0, 0x0, 0xEA, 48, 8
	banim_frame_oam 0x0, 0x4000, 0xD1, 24, 0
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x4000, 0xB9, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 0
	banim_frame_oam 0x4000, 0x8000, 0xCB, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x6B, -32, 0
	banim_frame_oam 0x4000, 0x8000, 0x71, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x75, 56, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, 24, -8
	banim_frame_oam 0x0, 0x0, 0xB5, 56, -8
	banim_frame_oam 0x4000, 0x4000, 0xAB, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x6F, 8, -24
	banim_frame_oam 0x0, 0x4000, 0xD6, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xD8, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0x14, 0, -32
	banim_frame_oam 0x4000, 0x0, 0x36, 32, -32
	banim_frame_oam 0x8000, 0x0, 0x89, 64, -16
	banim_frame_oam 0x0, 0x0, 0xAA, 64, 0
	banim_frame_oam 0x4000, 0x0, 0xD4, 48, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 40, 0
	banim_frame_oam 0x0, 0x0, 0xEA, 48, 8
	banim_frame_oam 0x0, 0x4000, 0x56, -32, -48
	banim_frame_oam 0x8000, 0x0, 0x58, -16, -48
	banim_frame_oam 0x0, 0x0, 0x35, -16, -32
	banim_frame_oam 0x4000, 0x4000, 0x18, -8, -40
	banim_frame_oam 0x4000, 0x0, 0x1C, 24, -40
	banim_frame_oam 0x0, 0x0, 0x1E, 40, -40
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xD1, 24, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x4000, 0xB9, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 0
	banim_frame_oam 0x0, 0x0, 0x80, 8, -24
	banim_frame_oam 0x4000, 0x8000, 0xCB, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x6B, -32, 0
	banim_frame_oam 0x4000, 0x8000, 0x71, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x75, 56, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, 24, -8
	banim_frame_oam 0x0, 0x0, 0xB5, 56, -8
	banim_frame_oam 0x4000, 0x4000, 0xAB, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x6F, 8, -24
	banim_frame_oam 0x0, 0x4000, 0xD6, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xD8, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x36, 32, -32
	banim_frame_oam 0x8000, 0x0, 0x89, 64, -16
	banim_frame_oam 0x0, 0x0, 0xAA, 64, 0
	banim_frame_oam 0x4000, 0x0, 0xD4, 48, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 40, 0
	banim_frame_oam 0x0, 0x0, 0xEA, 48, 8
	banim_frame_oam 0x0, 0x0, 0x35, -14, -32
	banim_frame_oam 0x4000, 0x4000, 0x39, -8, -40
	banim_frame_oam 0x4000, 0x0, 0x3D, 24, -40
	banim_frame_oam 0x0, 0x0, 0x3F, 40, -40
	banim_frame_oam 0x4000, 0x0, 0x60, 8, -32
	banim_frame_oam 0x0, 0x0, 0x14, 0, -32
	banim_frame_oam 0x0, 0x0, 0x17, 24, -32
	banim_frame_oam 0x0, 0x4000, 0x56, -30, -48
	banim_frame_oam 0x8000, 0x0, 0x58, -14, -48
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xD1, 24, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x4000, 0xB9, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 0
	banim_frame_oam 0x4000, 0x8000, 0xCB, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x6B, -32, 0
	banim_frame_oam 0x4000, 0x8000, 0x71, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x75, 56, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, 24, -8
	banim_frame_oam 0x0, 0x0, 0xB5, 56, -8
	banim_frame_oam 0x4000, 0x4000, 0xAB, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x6F, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x89, 64, -16
	banim_frame_oam 0x0, 0x0, 0xAA, 64, 0
	banim_frame_oam 0x4000, 0x0, 0xD4, 48, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 40, 0
	banim_frame_oam 0x0, 0x0, 0xEA, 48, 8
	banim_frame_oam 0x4000, 0x8000, 0x7B, -16, -32
	banim_frame_oam 0x4000, 0x0, 0x16, 16, -32
	banim_frame_oam 0x4000, 0x0, 0x36, 32, -32
	banim_frame_oam 0x0, 0x0, 0xF8, 0, -16
	banim_frame_oam 0x0, 0x0, 0xF6, -16, -16
	banim_frame_oam 0x0, 0x0, 0x38, -8, -16
	banim_frame_oam 0x4000, 0x4000, 0x59, -32, -40
	banim_frame_oam 0x4000, 0x0, 0x5D, 0, -40
	banim_frame_oam 0x0, 0x0, 0x5F, 16, -40
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xD1, 24, 0
	banim_frame_end
banim_wykm_sp1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x4000, 0xB9, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 0
	banim_frame_oam 0x4000, 0x8000, 0xCB, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x6B, -32, 0
	banim_frame_oam 0x4000, 0x8000, 0x71, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x75, 56, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, 24, -8
	banim_frame_oam 0x0, 0x0, 0xB5, 56, -8
	banim_frame_oam 0x4000, 0x4000, 0xAB, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x6F, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x89, 64, -16
	banim_frame_oam 0x0, 0x0, 0xAA, 64, 0
	banim_frame_oam 0x4000, 0x0, 0xD4, 48, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 40, 0
	banim_frame_oam 0x0, 0x0, 0xEA, 48, 8
	banim_frame_oam 0x4000, 0x8000, 0x7B, -16, -32
	banim_frame_oam 0x4000, 0x0, 0x16, 16, -32
	banim_frame_oam 0x4000, 0x0, 0x36, 32, -32
	banim_frame_oam 0x0, 0x0, 0xF8, 0, -16
	banim_frame_oam 0x0, 0x0, 0xF6, -16, -16
	banim_frame_oam 0x0, 0x0, 0x38, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x79, -8, -40
	banim_frame_oam 0x0, 0x4000, 0xD1, 24, 0
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_45_r:
	banim_frame_oam 0x8000, 0x4000, 0x8, 32, -48
	banim_frame_oam 0x8000, 0x4000, 0x88, 32, -16
	banim_frame_oam 0x8000, 0x8000, 0x89, 40, -16
	banim_frame_oam 0x8000, 0x4000, 0x8B, 56, -16
	banim_frame_oam 0x8000, 0x0, 0x60, 64, -16
	banim_frame_oam 0x0, 0x0, 0x61, 64, 0
	banim_frame_oam 0x4000, 0x0, 0x6A, 48, -24
	banim_frame_oam 0x8000, 0xC000, 0x2, -16, -48
	banim_frame_oam 0x8000, 0x8000, 0x6, 16, -48
	banim_frame_oam 0x8000, 0x8000, 0x86, 16, -16
	banim_frame_oam 0x0, 0x4000, 0x0, -32, -48
	banim_frame_oam 0x4000, 0x0, 0x40, -32, -32
	banim_frame_oam 0x0, 0x4000, 0xA0, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xE0, -32, 8
	banim_frame_oam 0x0, 0x0, 0x29, 40, -40
	banim_frame_oam 0x0, 0x0, 0x49, 40, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_46_r:
	banim_frame_oam 0x8000, 0x4000, 0x88, 32, -16
	banim_frame_oam 0x8000, 0x8000, 0x89, 40, -16
	banim_frame_oam 0x8000, 0x4000, 0x8B, 56, -16
	banim_frame_oam 0x8000, 0x0, 0x60, 64, -16
	banim_frame_oam 0x0, 0x0, 0x61, 64, 0
	banim_frame_oam 0x4000, 0x0, 0x6A, 48, -24
	banim_frame_oam 0x8000, 0x8000, 0x86, 16, -16
	banim_frame_oam 0x0, 0x4000, 0xA0, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xE0, -32, 8
	banim_frame_oam 0x4000, 0x8000, 0xA, -16, -48
	banim_frame_oam 0x4000, 0x8000, 0xE, 16, -48
	banim_frame_oam 0x4000, 0x4000, 0x4A, -16, -32
	banim_frame_oam 0x4000, 0x4000, 0x4E, 16, -32
	banim_frame_oam 0x4000, 0x0, 0x66, 16, -24
	banim_frame_oam 0x0, 0x0, 0x68, 32, -24
	banim_frame_oam 0x0, 0x8000, 0x62, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE2, -16, 8
	banim_frame_end
banim_wykm_sp1_oam_frame_47_r:
	banim_frame_oam 0x8000, 0x4000, 0x88, 32, -16
	banim_frame_oam 0x8000, 0x8000, 0x89, 40, -16
	banim_frame_oam 0x8000, 0x4000, 0x8B, 56, -16
	banim_frame_oam 0x8000, 0x0, 0x60, 64, -16
	banim_frame_oam 0x0, 0x0, 0x61, 64, 0
	banim_frame_oam 0x4000, 0x0, 0x6A, 48, -24
	banim_frame_oam 0x8000, 0x8000, 0x86, 16, -16
	banim_frame_oam 0x0, 0x4000, 0xA0, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xE0, -32, 8
	banim_frame_oam 0x4000, 0x0, 0x66, 16, -24
	banim_frame_oam 0x0, 0x0, 0x68, 32, -24
	banim_frame_oam 0x0, 0x8000, 0x62, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE2, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x6C, -16, -48
	banim_frame_oam 0x4000, 0x8000, 0x70, 16, -48
	banim_frame_oam 0x8000, 0x0, 0x74, 48, -48
	banim_frame_oam 0x4000, 0x4000, 0xAC, -16, -32
	banim_frame_oam 0x4000, 0x4000, 0xB0, 16, -32
	banim_frame_oam 0x0, 0x0, 0xB4, 48, -32
	banim_frame_oam 0x0, 0x0, 0x95, 56, -40
	banim_frame_end
banim_wykm_sp1_oam_frame_48_r:
	banim_frame_oam 0x8000, 0x4000, 0x88, 32, -16
	banim_frame_oam 0x8000, 0x8000, 0x89, 40, -16
	banim_frame_oam 0x8000, 0x4000, 0x8B, 56, -16
	banim_frame_oam 0x8000, 0x0, 0x60, 64, -16
	banim_frame_oam 0x0, 0x0, 0x61, 64, 0
	banim_frame_oam 0x4000, 0x0, 0x6A, 48, -24
	banim_frame_oam 0x8000, 0x8000, 0x86, 16, -16
	banim_frame_oam 0x0, 0x4000, 0xA0, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xE0, -32, 8
	banim_frame_oam 0x4000, 0x0, 0x66, 16, -24
	banim_frame_oam 0x0, 0x0, 0x68, 32, -24
	banim_frame_oam 0x0, 0x8000, 0x62, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE2, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x12, -24, -48
	banim_frame_oam 0x4000, 0x8000, 0x16, 8, -48
	banim_frame_oam 0x4000, 0x4000, 0x52, -24, -32
	banim_frame_oam 0x4000, 0x4000, 0x56, 8, -32
	banim_frame_oam 0x0, 0x0, 0x5A, 40, -32
	banim_frame_end
banim_wykm_sp1_oam_frame_8_r:
	banim_frame_oam 0x0, 0xC000, 0xC, -80, -56
	banim_frame_oam 0x8000, 0xC000, 0x14, -16, -56
	banim_frame_oam 0x0, 0x4000, 0x98, 16, -24
	banim_frame_oam 0x8000, 0x0, 0x9A, 32, -24
	banim_frame_oam 0x4000, 0x0, 0xF8, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x39, -80, 8
	banim_frame_oam 0x4000, 0x4000, 0x58, -48, 8
	banim_frame_oam 0x4000, 0x4000, 0x5C, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x9C, -40, -80
	banim_frame_oam 0x4000, 0x4000, 0xDC, -40, -64
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_wykm_sp1_script:
banim_wykm_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_oam_frame_1_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 2, banim_wykm_sp1_oam_frame_2_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_oam_frame_3_r - banim_wykm_sp1_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_2, 4, banim_wykm_sp1_oam_frame_4_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_oam_frame_3_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 5, banim_wykm_sp1_oam_frame_5_r - banim_wykm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 10, banim_wykm_sp1_oam_frame_6_r - banim_wykm_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 12, banim_wykm_sp1_oam_frame_7_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_5, 53, banim_wykm_sp1_oam_frame_8_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 9, banim_wykm_sp1_oam_frame_9_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 16, banim_wykm_sp1_oam_frame_10_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_7, 17, banim_wykm_sp1_oam_frame_11_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_7, 18, banim_wykm_sp1_oam_frame_12_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 19, banim_wykm_sp1_oam_frame_13_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_5, 20, banim_wykm_sp1_oam_frame_14_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 21, banim_wykm_sp1_oam_frame_15_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 22, banim_wykm_sp1_oam_frame_16_r - banim_wykm_sp1_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_oam_frame_17_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 24, banim_wykm_sp1_oam_frame_18_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 25, banim_wykm_sp1_oam_frame_19_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 26, banim_wykm_sp1_oam_frame_20_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 27, banim_wykm_sp1_oam_frame_21_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 28, banim_wykm_sp1_oam_frame_22_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_oam_frame_1_r - banim_wykm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 29, banim_wykm_sp1_oam_frame_23_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_8, 30, banim_wykm_sp1_oam_frame_24_r - banim_wykm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 31, banim_wykm_sp1_oam_frame_25_r - banim_wykm_sp1_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 11, banim_wykm_sp1_oam_frame_30_r - banim_wykm_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 13, banim_wykm_sp1_oam_frame_31_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_oam_frame_17_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_oam_frame_1_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 2, banim_wykm_sp1_oam_frame_2_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_oam_frame_3_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 36, banim_wykm_sp1_oam_frame_32_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 37, banim_wykm_sp1_oam_frame_33_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 38, banim_wykm_sp1_oam_frame_34_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 39, banim_wykm_sp1_oam_frame_35_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 40, banim_wykm_sp1_oam_frame_36_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 41, banim_wykm_sp1_oam_frame_37_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 38, banim_wykm_sp1_oam_frame_34_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 39, banim_wykm_sp1_oam_frame_35_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 40, banim_wykm_sp1_oam_frame_36_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 41, banim_wykm_sp1_oam_frame_37_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_10, 36, banim_wykm_sp1_oam_frame_32_r - banim_wykm_sp1_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_2, 4, banim_wykm_sp1_oam_frame_4_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_oam_frame_3_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 5, banim_wykm_sp1_oam_frame_5_r - banim_wykm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 10, banim_wykm_sp1_oam_frame_6_r - banim_wykm_sp1_oam_r
	banim_code_hit_critical_5
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 12, banim_wykm_sp1_oam_frame_7_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_5, 53, banim_wykm_sp1_oam_frame_8_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 9, banim_wykm_sp1_oam_frame_9_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 16, banim_wykm_sp1_oam_frame_10_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_7, 17, banim_wykm_sp1_oam_frame_11_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_7, 18, banim_wykm_sp1_oam_frame_12_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 19, banim_wykm_sp1_oam_frame_13_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_5, 20, banim_wykm_sp1_oam_frame_14_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 21, banim_wykm_sp1_oam_frame_15_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 22, banim_wykm_sp1_oam_frame_16_r - banim_wykm_sp1_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_oam_frame_17_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 24, banim_wykm_sp1_oam_frame_18_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 25, banim_wykm_sp1_oam_frame_19_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 26, banim_wykm_sp1_oam_frame_20_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 27, banim_wykm_sp1_oam_frame_21_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 28, banim_wykm_sp1_oam_frame_22_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_oam_frame_1_r - banim_wykm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 29, banim_wykm_sp1_oam_frame_23_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_8, 30, banim_wykm_sp1_oam_frame_24_r - banim_wykm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 31, banim_wykm_sp1_oam_frame_25_r - banim_wykm_sp1_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 11, banim_wykm_sp1_oam_frame_30_r - banim_wykm_sp1_oam_r
	banim_code_hit_critical_5
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 13, banim_wykm_sp1_oam_frame_31_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 34, banim_wykm_sp1_oam_frame_28_r - banim_wykm_sp1_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_oam_frame_17_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 33, banim_wykm_sp1_oam_frame_27_r - banim_wykm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 35, banim_wykm_sp1_oam_frame_29_r - banim_wykm_sp1_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 32, banim_wykm_sp1_oam_frame_26_r - banim_wykm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_85 0x54
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 42, banim_wykm_sp1_oam_frame_38_r - banim_wykm_sp1_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 43, banim_wykm_sp1_oam_frame_39_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 44, banim_wykm_sp1_oam_frame_40_r - banim_wykm_sp1_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_11, 45, banim_wykm_sp1_oam_frame_41_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 44, banim_wykm_sp1_oam_frame_40_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 46, banim_wykm_sp1_oam_frame_42_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_wykm_sp1_sheet_11, 47, banim_wykm_sp1_oam_frame_43_r - banim_wykm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_wykm_sp1_sheet_11, 48, banim_wykm_sp1_oam_frame_44_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 43, banim_wykm_sp1_oam_frame_39_r - banim_wykm_sp1_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 42, banim_wykm_sp1_oam_frame_38_r - banim_wykm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x55
	banim_code_85 0x54
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 42, banim_wykm_sp1_oam_frame_38_r - banim_wykm_sp1_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 43, banim_wykm_sp1_oam_frame_39_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 44, banim_wykm_sp1_oam_frame_40_r - banim_wykm_sp1_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_11, 45, banim_wykm_sp1_oam_frame_41_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_12, 49, banim_wykm_sp1_oam_frame_45_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_12, 50, banim_wykm_sp1_oam_frame_46_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_12, 51, banim_wykm_sp1_oam_frame_47_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_12, 52, banim_wykm_sp1_oam_frame_48_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 44, banim_wykm_sp1_oam_frame_40_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_11, 46, banim_wykm_sp1_oam_frame_42_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_wykm_sp1_sheet_11, 47, banim_wykm_sp1_oam_frame_43_r - banim_wykm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_wykm_sp1_sheet_11, 48, banim_wykm_sp1_oam_frame_44_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 43, banim_wykm_sp1_oam_frame_39_r - banim_wykm_sp1_oam_r
	banim_code_frame 5, banim_wykm_sp1_sheet_11, 42, banim_wykm_sp1_oam_frame_38_r - banim_wykm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 14, banim_wykm_sp1_oam_frame_49_r - banim_wykm_sp1_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 15, banim_wykm_sp1_oam_frame_50_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 14, banim_wykm_sp1_oam_frame_49_r - banim_wykm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 14, banim_wykm_sp1_oam_frame_49_r - banim_wykm_sp1_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_1, 15, banim_wykm_sp1_oam_frame_50_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_wykm_sp1_sheet_0, 14, banim_wykm_sp1_oam_frame_49_r - banim_wykm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_wykm_sp1_mode_stand_close:
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_wykm_sp1_mode_stand:
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_wykm_sp1_mode_stand_range:
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_wykm_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_frame 4, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_oam_frame_1_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 2, banim_wykm_sp1_oam_frame_2_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_oam_frame_3_r - banim_wykm_sp1_oam_r
	banim_code_frame 20, banim_wykm_sp1_sheet_2, 4, banim_wykm_sp1_oam_frame_4_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_2, 3, banim_wykm_sp1_oam_frame_3_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 5, banim_wykm_sp1_oam_frame_5_r - banim_wykm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_3, 6, banim_wykm_sp1_oam_frame_51_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_wykm_sp1_sheet_4, 7, banim_wykm_sp1_oam_frame_52_r - banim_wykm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_wykm_sp1_sheet_5, 53, banim_wykm_sp1_oam_frame_8_r - banim_wykm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 9, banim_wykm_sp1_oam_frame_9_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_6, 16, banim_wykm_sp1_oam_frame_10_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_7, 17, banim_wykm_sp1_oam_frame_11_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_wykm_sp1_sheet_7, 18, banim_wykm_sp1_oam_frame_12_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 19, banim_wykm_sp1_oam_frame_13_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_5, 20, banim_wykm_sp1_oam_frame_14_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 21, banim_wykm_sp1_oam_frame_15_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_8, 22, banim_wykm_sp1_oam_frame_16_r - banim_wykm_sp1_oam_r
	banim_code_frame 16, banim_wykm_sp1_sheet_0, 23, banim_wykm_sp1_oam_frame_17_r - banim_wykm_sp1_oam_r
	banim_code_sound_wing_flap_long
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 24, banim_wykm_sp1_oam_frame_18_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 25, banim_wykm_sp1_oam_frame_19_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 26, banim_wykm_sp1_oam_frame_20_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 27, banim_wykm_sp1_oam_frame_21_r - banim_wykm_sp1_oam_r
	banim_code_frame 2, banim_wykm_sp1_sheet_9, 28, banim_wykm_sp1_oam_frame_22_r - banim_wykm_sp1_oam_r
	banim_code_frame 3, banim_wykm_sp1_sheet_1, 1, banim_wykm_sp1_oam_frame_1_r - banim_wykm_sp1_oam_r
	banim_code_sound_step_heavy
	banim_code_shake_screnn_slightly
	banim_code_frame 3, banim_wykm_sp1_sheet_9, 29, banim_wykm_sp1_oam_frame_23_r - banim_wykm_sp1_oam_r
	banim_code_frame 8, banim_wykm_sp1_sheet_8, 30, banim_wykm_sp1_oam_frame_24_r - banim_wykm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_wykm_sp1_sheet_9, 31, banim_wykm_sp1_oam_frame_25_r - banim_wykm_sp1_oam_r
	banim_code_frame 1, banim_wykm_sp1_sheet_0, 0, banim_wykm_sp1_oam_frame_0_r - banim_wykm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_wykm_sp1_mode_attack_close - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_attack_close_back - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_attack_close_critical - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_attack_close_critical_back - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_attack_range - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_attack_range_critical - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_dodge_close - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_dodge_range - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_stand_close - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_stand - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_stand_range - banim_wykm_sp1_script
	.word banim_wykm_sp1_mode_attack_miss - banim_wykm_sp1_script
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

