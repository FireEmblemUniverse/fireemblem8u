@ vim:ft=armv4
	.global banim_snif_ar1_script
	.global banim_snif_ar1_oam_r
	.global banim_snif_ar1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x2B
	.section .data.oam_l
banim_snif_ar1_oam_l:
banim_snif_ar1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x3, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x23, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x43, 5, -32
	banim_frame_oam 0x0, 0x1000, 0x63, 7, -24
	banim_frame_end
banim_snif_ar1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x6, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x7, -16, -10
	banim_frame_oam 0x0, 0x1000, 0x3, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x43, 6, -32
	banim_frame_oam 0x0, 0x1000, 0x63, 8, -24
	banim_frame_end
banim_snif_ar1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0xA, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x27, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x3, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x67, 6, -40
	banim_frame_oam 0x0, 0x1000, 0xB, 6, -32
	banim_frame_oam 0x0, 0x1000, 0x2B, 8, -24
	banim_frame_end
banim_snif_ar1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xF, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x2F, -14, -24
	banim_frame_oam 0x8000, 0x1000, 0x4F, 7, -32
	banim_frame_oam 0x0, 0x1000, 0x4B, 5, -40
	banim_frame_oam 0x0, 0x1000, 0x6B, -1, -32
	banim_frame_oam 0x0, 0x1000, 0x3, -3, -24
	banim_frame_end
banim_snif_ar1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x10, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x13, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x53, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x73, 4, -24
	banim_frame_oam 0x0, 0x1000, 0x3, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x63, 4, -32
	banim_frame_oam 0x0, 0x1000, 0x43, 2, -40
	banim_frame_oam 0x4000, 0x1000, 0x74, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x36, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x15, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x54, -26, -24
	banim_frame_oam 0x0, 0x1000, 0x55, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x16, -24, -32
	banim_frame_oam 0x0, 0x1000, 0x35, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x14, -24, -40
	banim_frame_oam 0x0, 0x1000, 0x34, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x34, -32, -21
	banim_frame_end
banim_snif_ar1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0x4, -8, -41
	banim_frame_oam 0x0, 0x1000, 0x24, -7, -33
	banim_frame_oam 0x0, 0x1000, 0x44, -6, -25
	banim_frame_oam 0x0, 0x5000, 0x41, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x60, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x20, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x22, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x40, -16, -6
	banim_frame_oam 0x4000, 0x1000, 0x1, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -9, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -1, -24
	banim_frame_oam 0x0, 0x1000, 0x43, -2, -32
	banim_frame_oam 0x0, 0x1000, 0x23, -4, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -9, -48
	banim_frame_end
banim_snif_ar1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x0, 0x4, 2, -41
	banim_frame_oam 0x0, 0x0, 0x24, 1, -33
	banim_frame_oam 0x0, 0x0, 0x44, 0, -25
	banim_frame_oam 0x0, 0x5000, 0x7, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x9, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x47, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x49, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -16, -7
	banim_frame_oam 0x4000, 0x1000, 0x1, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -9, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -1, -24
	banim_frame_oam 0x0, 0x1000, 0x43, -2, -32
	banim_frame_oam 0x0, 0x1000, 0x23, -4, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -9, -48
	banim_frame_end
banim_snif_ar1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x6000, 0x25, -1, -36
	banim_frame_oam 0x4000, 0x1000, 0x1, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -9, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -1, -24
	banim_frame_oam 0x0, 0x1000, 0x43, -2, -32
	banim_frame_oam 0x0, 0x1000, 0x23, -4, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -9, -48
	banim_frame_oam 0x4000, 0x1000, 0xA, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x2A, 8, -6
	banim_frame_oam 0x0, 0x1000, 0x4A, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x2B, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x47, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x49, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x28, 0, 0
	banim_frame_end
banim_snif_ar1_oam_frame_8_l:
	banim_frame_affine -247, -67, -67, 247, 1
	banim_frame_oam 0x100, 0x4000, 0x25, 1, -35
	banim_frame_oam 0x4000, 0x1000, 0x1, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -9, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -1, -24
	banim_frame_oam 0x0, 0x1000, 0x43, -2, -32
	banim_frame_oam 0x0, 0x1000, 0x23, -4, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -9, -48
	banim_frame_oam 0x4000, 0x1000, 0xA, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x2A, 8, -6
	banim_frame_oam 0x0, 0x1000, 0x4A, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x2B, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x47, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x49, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x28, 0, 0
	banim_frame_end
banim_snif_ar1_oam_frame_9_l:
	banim_frame_affine -221, -128, -128, 221, 1
	banim_frame_oam 0x100, 0x4000, 0x25, 1, -32
	banim_frame_oam 0x4000, 0x1000, 0x1, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -9, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -1, -24
	banim_frame_oam 0x0, 0x1000, 0x43, -2, -32
	banim_frame_oam 0x0, 0x1000, 0x23, -4, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -9, -48
	banim_frame_oam 0x4000, 0x1000, 0xA, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x2A, 8, -6
	banim_frame_oam 0x0, 0x1000, 0x4A, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x2B, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x47, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x49, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x28, 0, 0
	banim_frame_end
banim_snif_ar1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x1000, 0x64, 9, -26
	banim_frame_oam 0x0, 0x1000, 0x66, 1, -26
	banim_frame_oam 0x4000, 0x1000, 0x1, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -9, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -1, -24
	banim_frame_oam 0x0, 0x1000, 0x43, -2, -32
	banim_frame_oam 0x0, 0x1000, 0x23, -4, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -9, -48
	banim_frame_oam 0x4000, 0x1000, 0xA, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x2A, 8, -6
	banim_frame_oam 0x0, 0x1000, 0x4A, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x2B, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x47, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x49, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x28, 0, 0
	banim_frame_end
banim_snif_ar1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x1000, 0x64, 5, -15
	banim_frame_oam 0x0, 0x1000, 0x66, -3, -15
	banim_frame_oam 0x8000, 0x9000, 0xC, -5, -16
	banim_frame_oam 0x8000, 0x1000, 0xE, -13, -15
	banim_frame_oam 0x0, 0x1000, 0x6E, -13, 8
	banim_frame_oam 0x8000, 0x1000, 0x4B, 11, -16
	banim_frame_oam 0x0, 0x1000, 0x6A, 11, 0
	banim_frame_oam 0x4000, 0x1000, 0x67, 4, -24
	banim_frame_oam 0x0, 0x1000, 0x69, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x5, 6, -32
	banim_frame_end
banim_snif_ar1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x1000, 0x64, 4, -15
	banim_frame_oam 0x0, 0x1000, 0x66, -4, -15
	banim_frame_oam 0x8000, 0x9000, 0xC, -5, -16
	banim_frame_oam 0x8000, 0x1000, 0xE, -13, -15
	banim_frame_oam 0x0, 0x1000, 0x6E, -13, 8
	banim_frame_oam 0x8000, 0x1000, 0x4B, 11, -16
	banim_frame_oam 0x0, 0x1000, 0x6A, 11, 0
	banim_frame_oam 0x4000, 0x1000, 0x67, 4, -24
	banim_frame_oam 0x0, 0x1000, 0x69, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x5, 6, -32
	banim_frame_end
banim_snif_ar1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x4E, -24, -15
	banim_frame_oam 0x8000, 0x9000, 0x88, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x8A, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x8B, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xCD, -3, -24
	banim_frame_oam 0x8000, 0x1000, 0x8D, 3, -40
	banim_frame_oam 0x0, 0x1000, 0xAC, 11, -32
	banim_frame_oam 0x0, 0x1000, 0xCC, 10, -24
	banim_frame_oam 0x8000, 0x1000, 0xCB, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xEC, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x8C, 24, -16
	banim_frame_end
banim_snif_ar1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, -16
	banim_frame_oam 0x4000, 0x5000, 0xC0, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xE1, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE3, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, -16, -11
	banim_frame_oam 0x0, 0x1000, 0xC4, 10, -24
	banim_frame_oam 0x8000, 0x1000, 0x84, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xCD, -3, -24
	banim_frame_end
banim_snif_ar1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0x64, 9, -25
	banim_frame_oam 0x0, 0x1000, 0x66, 1, -25
	banim_frame_oam 0x4000, 0x1000, 0x1, -7, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -9, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -1, -24
	banim_frame_oam 0x0, 0x1000, 0x43, -2, -32
	banim_frame_oam 0x0, 0x1000, 0x23, -4, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -9, -48
	banim_frame_oam 0x4000, 0x1000, 0xA, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x2A, 8, -6
	banim_frame_oam 0x0, 0x1000, 0x4A, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x2B, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x47, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x49, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x28, 0, 0
	banim_frame_end
banim_snif_ar1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0x85, 2, -16
	banim_frame_oam 0x8000, 0x1000, 0x87, -6, -16
	banim_frame_oam 0x4000, 0x1000, 0xC5, 2, 0
	banim_frame_oam 0x0, 0x1000, 0xC7, -6, 0
	banim_frame_oam 0x4000, 0x1000, 0xE5, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE7, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -14, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, 7, -39
	banim_frame_oam 0x0, 0x1000, 0xC4, 9, -23
	banim_frame_oam 0x0, 0x1000, 0xED, -4, -24
	banim_frame_end
banim_snif_ar1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x5000, 0x86, -5, -38
	banim_frame_oam 0x8000, 0x1000, 0x88, -13, -38
	banim_frame_oam 0x0, 0x1000, 0x89, -21, -38
	banim_frame_oam 0x0, 0x5000, 0xC6, -5, -22
	banim_frame_oam 0x8000, 0x9000, 0x81, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x80, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xA0, 8, -7
	banim_frame_oam 0x0, 0x1000, 0xC0, -16, -7
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xC3, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0x83, -3, -48
	banim_frame_oam 0x0, 0x1000, 0xE4, -9, -24
	banim_frame_end
banim_snif_ar1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x1000, 0xA9, -13, -4
	banim_frame_oam 0x4000, 0x9000, 0xC8, -21, -20
	banim_frame_oam 0x0, 0x1000, 0xCC, -29, -20
	banim_frame_oam 0x0, 0x1000, 0xA4, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, -16, -6
	banim_frame_oam 0x8000, 0x1000, 0x85, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x83, -3, -48
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, 8, -7
	banim_frame_oam 0x4000, 0x1000, 0x80, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xC3, -1, -32
	banim_frame_oam 0x0, 0x1000, 0xE4, -9, -24
	banim_frame_end
banim_snif_ar1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0x8C, -15, -37
	banim_frame_oam 0x8000, 0x1000, 0x8E, -23, -37
	banim_frame_oam 0x0, 0x1000, 0x8B, 1, -37
	banim_frame_oam 0x0, 0x5000, 0xCD, -23, -21
	banim_frame_oam 0x0, 0x1000, 0xA4, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, -16, -6
	banim_frame_oam 0x8000, 0x1000, 0x85, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x83, -3, -48
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, 8, -7
	banim_frame_oam 0x4000, 0x1000, 0x80, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xC3, -1, -32
	banim_frame_oam 0x0, 0x1000, 0xE4, -9, -24
	banim_frame_end
banim_snif_ar1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x5000, 0x86, -5, -38
	banim_frame_oam 0x8000, 0x1000, 0x88, -13, -38
	banim_frame_oam 0x0, 0x1000, 0x89, -21, -38
	banim_frame_oam 0x0, 0x5000, 0xC6, -5, -22
	banim_frame_oam 0x0, 0x1000, 0xA4, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, -16, -6
	banim_frame_oam 0x8000, 0x1000, 0x85, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x83, -3, -48
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, 8, -7
	banim_frame_oam 0x4000, 0x1000, 0x80, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xC3, -1, -32
	banim_frame_oam 0x0, 0x1000, 0xE4, -9, -24
	banim_frame_end
banim_snif_ar1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0x86, -3, -38
	banim_frame_oam 0x8000, 0x1000, 0x88, -11, -38
	banim_frame_oam 0x0, 0x1000, 0x89, -19, -38
	banim_frame_oam 0x0, 0x5000, 0xC6, -3, -22
	banim_frame_oam 0x0, 0x1000, 0xA4, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, -16, -6
	banim_frame_oam 0x8000, 0x1000, 0x85, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x83, -3, -48
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, 8, -7
	banim_frame_oam 0x4000, 0x1000, 0x80, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xC3, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0xC5, -8, -24
	banim_frame_end
banim_snif_ar1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x1000, 0xA9, -11, -4
	banim_frame_oam 0x4000, 0x9000, 0xC8, -19, -20
	banim_frame_oam 0x0, 0x1000, 0xCC, -27, -20
	banim_frame_oam 0x0, 0x1000, 0xA4, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, -16, -6
	banim_frame_oam 0x8000, 0x1000, 0x85, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x83, -3, -48
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, 8, -7
	banim_frame_oam 0x4000, 0x1000, 0x80, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xC3, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0xC5, -8, -24
	banim_frame_end
banim_snif_ar1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x5000, 0x8C, -13, -37
	banim_frame_oam 0x8000, 0x1000, 0x8E, -21, -37
	banim_frame_oam 0x0, 0x1000, 0x8B, 3, -37
	banim_frame_oam 0x0, 0x5000, 0xCD, -21, -21
	banim_frame_oam 0x0, 0x1000, 0xA4, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, -16, -6
	banim_frame_oam 0x8000, 0x1000, 0x85, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x83, -3, -48
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, 8, -7
	banim_frame_oam 0x4000, 0x1000, 0x80, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xC3, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0xC5, -8, -24
	banim_frame_end
banim_snif_ar1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -13
	banim_frame_oam 0x8000, 0x1000, 0x4, -24, -13
	banim_frame_oam 0x0, 0x1000, 0x5, -32, -13
	banim_frame_oam 0x8000, 0x1000, 0x44, 8, -29
	banim_frame_oam 0x0, 0x1000, 0x45, 0, -30
	banim_frame_oam 0x0, 0x1000, 0x25, 0, -21
	banim_frame_oam 0x0, 0x1000, 0x65, -8, -21
	banim_frame_end
banim_snif_ar1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x9000, 0x26, -15, -5
	banim_frame_oam 0x4000, 0x5000, 0x66, -15, 11
	banim_frame_oam 0x4000, 0x1000, 0x8, -26, -13
	banim_frame_oam 0x0, 0x1000, 0x7, -23, -5
	banim_frame_oam 0x0, 0x1000, 0x6, -23, 3
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_snif_ar1_oam_r:
banim_snif_ar1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, 0, -16
	banim_frame_oam 0x0, 0x0, 0x3, -5, -24
	banim_frame_oam 0x0, 0x0, 0x23, 8, -8
	banim_frame_oam 0x0, 0x0, 0x43, -13, -32
	banim_frame_oam 0x0, 0x0, 0x63, -15, -24
	banim_frame_end
banim_snif_ar1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x0, 0x0, 0x7, 8, -10
	banim_frame_oam 0x0, 0x0, 0x3, -5, -24
	banim_frame_oam 0x0, 0x0, 0x43, -14, -32
	banim_frame_oam 0x0, 0x0, 0x63, -16, -24
	banim_frame_end
banim_snif_ar1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0xA, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x27, 8, -16
	banim_frame_oam 0x0, 0x0, 0x3, -5, -24
	banim_frame_oam 0x0, 0x0, 0x67, -14, -40
	banim_frame_oam 0x0, 0x0, 0xB, -14, -32
	banim_frame_oam 0x0, 0x0, 0x2B, -16, -24
	banim_frame_end
banim_snif_ar1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, 0, -16
	banim_frame_oam 0x0, 0x0, 0xF, 8, -16
	banim_frame_oam 0x0, 0x0, 0x2F, 6, -24
	banim_frame_oam 0x8000, 0x0, 0x4F, -15, -32
	banim_frame_oam 0x0, 0x0, 0x4B, -13, -40
	banim_frame_oam 0x0, 0x0, 0x6B, -7, -32
	banim_frame_oam 0x0, 0x0, 0x3, -5, -24
	banim_frame_end
banim_snif_ar1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x10, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x12, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x13, 8, -16
	banim_frame_oam 0x0, 0x0, 0x53, 8, 0
	banim_frame_oam 0x0, 0x0, 0x73, -12, -24
	banim_frame_oam 0x0, 0x0, 0x3, -5, -24
	banim_frame_oam 0x0, 0x0, 0x63, -12, -32
	banim_frame_oam 0x0, 0x0, 0x43, -10, -40
	banim_frame_oam 0x4000, 0x0, 0x74, 0, -24
	banim_frame_oam 0x0, 0x0, 0x36, 16, -16
	banim_frame_oam 0x0, 0x0, 0x15, 16, -8
	banim_frame_oam 0x0, 0x0, 0x54, 18, -24
	banim_frame_oam 0x0, 0x0, 0x55, 8, -32
	banim_frame_oam 0x0, 0x0, 0x16, 16, -32
	banim_frame_oam 0x0, 0x0, 0x35, 8, -40
	banim_frame_oam 0x0, 0x0, 0x14, 16, -40
	banim_frame_oam 0x0, 0x0, 0x34, 24, -32
	banim_frame_oam 0x0, 0x0, 0x34, 24, -21
	banim_frame_end
banim_snif_ar1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0x4, 0, -41
	banim_frame_oam 0x0, 0x0, 0x24, -1, -33
	banim_frame_oam 0x0, 0x0, 0x44, -2, -25
	banim_frame_oam 0x0, 0x4000, 0x41, -8, 0
	banim_frame_oam 0x0, 0x0, 0x60, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x20, -16, -8
	banim_frame_oam 0x0, 0x0, 0x22, 0, -8
	banim_frame_oam 0x0, 0x0, 0x40, 8, -6
	banim_frame_oam 0x4000, 0x0, 0x1, -9, -16
	banim_frame_oam 0x0, 0x0, 0x0, 1, -24
	banim_frame_oam 0x0, 0x0, 0x63, -7, -24
	banim_frame_oam 0x0, 0x0, 0x43, -6, -32
	banim_frame_oam 0x0, 0x0, 0x23, -4, -40
	banim_frame_oam 0x0, 0x0, 0x3, 1, -48
	banim_frame_end
banim_snif_ar1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x1000, 0x4, -10, -41
	banim_frame_oam 0x0, 0x1000, 0x24, -9, -33
	banim_frame_oam 0x0, 0x1000, 0x44, -8, -25
	banim_frame_oam 0x0, 0x4000, 0x7, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x9, 0, -8
	banim_frame_oam 0x4000, 0x0, 0x47, -16, 8
	banim_frame_oam 0x0, 0x0, 0x49, 0, 8
	banim_frame_oam 0x0, 0x0, 0x6, 8, -7
	banim_frame_oam 0x4000, 0x0, 0x1, -9, -16
	banim_frame_oam 0x0, 0x0, 0x0, 1, -24
	banim_frame_oam 0x0, 0x0, 0x63, -7, -24
	banim_frame_oam 0x0, 0x0, 0x43, -6, -32
	banim_frame_oam 0x0, 0x0, 0x23, -4, -40
	banim_frame_oam 0x0, 0x0, 0x3, 1, -48
	banim_frame_end
banim_snif_ar1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x7000, 0x25, -15, -36
	banim_frame_oam 0x4000, 0x0, 0x1, -9, -16
	banim_frame_oam 0x0, 0x0, 0x0, 1, -24
	banim_frame_oam 0x0, 0x0, 0x63, -7, -24
	banim_frame_oam 0x0, 0x0, 0x43, -6, -32
	banim_frame_oam 0x0, 0x0, 0x23, -4, -40
	banim_frame_oam 0x0, 0x0, 0x3, 1, -48
	banim_frame_oam 0x4000, 0x0, 0xA, -8, -8
	banim_frame_oam 0x0, 0x0, 0x2A, -16, -6
	banim_frame_oam 0x0, 0x0, 0x4A, 8, -8
	banim_frame_oam 0x0, 0x0, 0x2B, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x47, -16, 8
	banim_frame_oam 0x0, 0x0, 0x49, 0, 8
	banim_frame_oam 0x0, 0x0, 0x28, -8, 0
	banim_frame_end
banim_snif_ar1_oam_frame_8_r:
	banim_frame_affine 247, -67, 67, 247, 1
	banim_frame_oam 0x100, 0x4000, 0x25, -17, -35
	banim_frame_oam 0x4000, 0x0, 0x1, -9, -16
	banim_frame_oam 0x0, 0x0, 0x0, 1, -24
	banim_frame_oam 0x0, 0x0, 0x63, -7, -24
	banim_frame_oam 0x0, 0x0, 0x43, -6, -32
	banim_frame_oam 0x0, 0x0, 0x23, -4, -40
	banim_frame_oam 0x0, 0x0, 0x3, 1, -48
	banim_frame_oam 0x4000, 0x0, 0xA, -8, -8
	banim_frame_oam 0x0, 0x0, 0x2A, -16, -6
	banim_frame_oam 0x0, 0x0, 0x4A, 8, -8
	banim_frame_oam 0x0, 0x0, 0x2B, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x47, -16, 8
	banim_frame_oam 0x0, 0x0, 0x49, 0, 8
	banim_frame_oam 0x0, 0x0, 0x28, -8, 0
	banim_frame_end
banim_snif_ar1_oam_frame_9_r:
	banim_frame_affine 221, -128, 128, 221, 1
	banim_frame_oam 0x100, 0x4000, 0x25, -17, -32
	banim_frame_oam 0x4000, 0x0, 0x1, -9, -16
	banim_frame_oam 0x0, 0x0, 0x0, 1, -24
	banim_frame_oam 0x0, 0x0, 0x63, -7, -24
	banim_frame_oam 0x0, 0x0, 0x43, -6, -32
	banim_frame_oam 0x0, 0x0, 0x23, -4, -40
	banim_frame_oam 0x0, 0x0, 0x3, 1, -48
	banim_frame_oam 0x4000, 0x0, 0xA, -8, -8
	banim_frame_oam 0x0, 0x0, 0x2A, -16, -6
	banim_frame_oam 0x0, 0x0, 0x4A, 8, -8
	banim_frame_oam 0x0, 0x0, 0x2B, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x47, -16, 8
	banim_frame_oam 0x0, 0x0, 0x49, 0, 8
	banim_frame_oam 0x0, 0x0, 0x28, -8, 0
	banim_frame_end
banim_snif_ar1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x0, 0x64, -25, -26
	banim_frame_oam 0x0, 0x0, 0x66, -9, -26
	banim_frame_oam 0x4000, 0x0, 0x1, -9, -16
	banim_frame_oam 0x0, 0x0, 0x0, 1, -24
	banim_frame_oam 0x0, 0x0, 0x63, -7, -24
	banim_frame_oam 0x0, 0x0, 0x43, -6, -32
	banim_frame_oam 0x0, 0x0, 0x23, -4, -40
	banim_frame_oam 0x0, 0x0, 0x3, 1, -48
	banim_frame_oam 0x4000, 0x0, 0xA, -8, -8
	banim_frame_oam 0x0, 0x0, 0x2A, -16, -6
	banim_frame_oam 0x0, 0x0, 0x4A, 8, -8
	banim_frame_oam 0x0, 0x0, 0x2B, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x47, -16, 8
	banim_frame_oam 0x0, 0x0, 0x49, 0, 8
	banim_frame_oam 0x0, 0x0, 0x28, -8, 0
	banim_frame_end
banim_snif_ar1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x0, 0x64, -21, -15
	banim_frame_oam 0x0, 0x0, 0x66, -5, -15
	banim_frame_oam 0x8000, 0x8000, 0xC, -11, -16
	banim_frame_oam 0x8000, 0x0, 0xE, 5, -15
	banim_frame_oam 0x0, 0x0, 0x6E, 5, 8
	banim_frame_oam 0x8000, 0x0, 0x4B, -19, -16
	banim_frame_oam 0x0, 0x0, 0x6A, -19, 0
	banim_frame_oam 0x4000, 0x0, 0x67, -20, -24
	banim_frame_oam 0x0, 0x0, 0x69, -4, -24
	banim_frame_oam 0x0, 0x0, 0x5, -14, -32
	banim_frame_end
banim_snif_ar1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x0, 0x64, -20, -15
	banim_frame_oam 0x0, 0x0, 0x66, -4, -15
	banim_frame_oam 0x8000, 0x8000, 0xC, -11, -16
	banim_frame_oam 0x8000, 0x0, 0xE, 5, -15
	banim_frame_oam 0x0, 0x0, 0x6E, 5, 8
	banim_frame_oam 0x8000, 0x0, 0x4B, -19, -16
	banim_frame_oam 0x0, 0x0, 0x6A, -19, 0
	banim_frame_oam 0x4000, 0x0, 0x67, -20, -24
	banim_frame_oam 0x0, 0x0, 0x69, -4, -24
	banim_frame_oam 0x0, 0x0, 0x5, -14, -32
	banim_frame_end
banim_snif_ar1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x4E, 16, -15
	banim_frame_oam 0x8000, 0x8000, 0x88, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x8A, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x8B, 8, -16
	banim_frame_oam 0x0, 0x0, 0xCD, -5, -24
	banim_frame_oam 0x8000, 0x0, 0x8D, -11, -40
	banim_frame_oam 0x0, 0x0, 0xAC, -19, -32
	banim_frame_oam 0x0, 0x0, 0xCC, -18, -24
	banim_frame_oam 0x8000, 0x0, 0xCB, -24, -16
	banim_frame_oam 0x0, 0x0, 0xEC, -24, 0
	banim_frame_oam 0x0, 0x0, 0x8C, -32, -16
	banim_frame_end
banim_snif_ar1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, -16
	banim_frame_oam 0x4000, 0x4000, 0xC0, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xE1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE3, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE0, 8, -11
	banim_frame_oam 0x0, 0x0, 0xC4, -18, -24
	banim_frame_oam 0x8000, 0x0, 0x84, -16, -40
	banim_frame_oam 0x0, 0x0, 0xCD, -5, -24
	banim_frame_end
banim_snif_ar1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0x64, -25, -25
	banim_frame_oam 0x0, 0x0, 0x66, -9, -25
	banim_frame_oam 0x4000, 0x0, 0x1, -9, -16
	banim_frame_oam 0x0, 0x0, 0x0, 1, -24
	banim_frame_oam 0x0, 0x0, 0x63, -7, -24
	banim_frame_oam 0x0, 0x0, 0x43, -6, -32
	banim_frame_oam 0x0, 0x0, 0x23, -4, -40
	banim_frame_oam 0x0, 0x0, 0x3, 1, -48
	banim_frame_oam 0x4000, 0x0, 0xA, -8, -8
	banim_frame_oam 0x0, 0x0, 0x2A, -16, -6
	banim_frame_oam 0x0, 0x0, 0x4A, 8, -8
	banim_frame_oam 0x0, 0x0, 0x2B, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x47, -16, 8
	banim_frame_oam 0x0, 0x0, 0x49, 0, 8
	banim_frame_oam 0x0, 0x0, 0x28, -8, 0
	banim_frame_end
banim_snif_ar1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0x85, -18, -16
	banim_frame_oam 0x8000, 0x0, 0x87, -2, -16
	banim_frame_oam 0x4000, 0x0, 0xC5, -18, 0
	banim_frame_oam 0x0, 0x0, 0xC7, -2, 0
	banim_frame_oam 0x4000, 0x0, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE7, 0, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 6, -8
	banim_frame_oam 0x8000, 0x0, 0x84, -15, -39
	banim_frame_oam 0x0, 0x0, 0xC4, -17, -23
	banim_frame_oam 0x0, 0x0, 0xED, -4, -24
	banim_frame_end
banim_snif_ar1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x4000, 0x86, -11, -38
	banim_frame_oam 0x8000, 0x0, 0x88, 5, -38
	banim_frame_oam 0x0, 0x0, 0x89, 13, -38
	banim_frame_oam 0x0, 0x4000, 0xC6, -11, -22
	banim_frame_oam 0x8000, 0x8000, 0x81, -8, -16
	banim_frame_oam 0x0, 0x0, 0x80, -16, -16
	banim_frame_oam 0x0, 0x0, 0xA0, -16, -7
	banim_frame_oam 0x0, 0x0, 0xC0, 8, -7
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xC3, -7, -32
	banim_frame_oam 0x8000, 0x0, 0x83, -5, -48
	banim_frame_oam 0x0, 0x0, 0xE4, 1, -24
	banim_frame_end
banim_snif_ar1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x0, 0xA9, -3, -4
	banim_frame_oam 0x4000, 0x8000, 0xC8, -11, -20
	banim_frame_oam 0x0, 0x0, 0xCC, 21, -20
	banim_frame_oam 0x0, 0x0, 0xA4, 0, -8
	banim_frame_oam 0x0, 0x0, 0x8A, 8, -6
	banim_frame_oam 0x8000, 0x0, 0x85, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x83, -5, -48
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x0, 0x84, -16, -7
	banim_frame_oam 0x4000, 0x0, 0x80, -16, -16
	banim_frame_oam 0x0, 0x0, 0x82, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xC3, -7, -32
	banim_frame_oam 0x0, 0x0, 0xE4, 1, -24
	banim_frame_end
banim_snif_ar1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0x8C, -1, -37
	banim_frame_oam 0x8000, 0x0, 0x8E, 15, -37
	banim_frame_oam 0x0, 0x0, 0x8B, -9, -37
	banim_frame_oam 0x0, 0x4000, 0xCD, 7, -21
	banim_frame_oam 0x0, 0x0, 0xA4, 0, -8
	banim_frame_oam 0x0, 0x0, 0x8A, 8, -6
	banim_frame_oam 0x8000, 0x0, 0x85, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x83, -5, -48
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x0, 0x84, -16, -7
	banim_frame_oam 0x4000, 0x0, 0x80, -16, -16
	banim_frame_oam 0x0, 0x0, 0x82, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xC3, -7, -32
	banim_frame_oam 0x0, 0x0, 0xE4, 1, -24
	banim_frame_end
banim_snif_ar1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x4000, 0x86, -11, -38
	banim_frame_oam 0x8000, 0x0, 0x88, 5, -38
	banim_frame_oam 0x0, 0x0, 0x89, 13, -38
	banim_frame_oam 0x0, 0x4000, 0xC6, -11, -22
	banim_frame_oam 0x0, 0x0, 0xA4, 0, -8
	banim_frame_oam 0x0, 0x0, 0x8A, 8, -6
	banim_frame_oam 0x8000, 0x0, 0x85, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x83, -5, -48
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x0, 0x84, -16, -7
	banim_frame_oam 0x4000, 0x0, 0x80, -16, -16
	banim_frame_oam 0x0, 0x0, 0x82, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xC3, -7, -32
	banim_frame_oam 0x0, 0x0, 0xE4, 1, -24
	banim_frame_end
banim_snif_ar1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0x86, -13, -38
	banim_frame_oam 0x8000, 0x0, 0x88, 3, -38
	banim_frame_oam 0x0, 0x0, 0x89, 11, -38
	banim_frame_oam 0x0, 0x4000, 0xC6, -13, -22
	banim_frame_oam 0x0, 0x0, 0xA4, 0, -8
	banim_frame_oam 0x0, 0x0, 0x8A, 8, -6
	banim_frame_oam 0x8000, 0x0, 0x85, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x83, -5, -48
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x0, 0x84, -16, -7
	banim_frame_oam 0x4000, 0x0, 0x80, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xC3, -7, -32
	banim_frame_oam 0x8000, 0x0, 0xC5, 0, -24
	banim_frame_end
banim_snif_ar1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x0, 0xA9, -5, -4
	banim_frame_oam 0x4000, 0x8000, 0xC8, -13, -20
	banim_frame_oam 0x0, 0x0, 0xCC, 19, -20
	banim_frame_oam 0x0, 0x0, 0xA4, 0, -8
	banim_frame_oam 0x0, 0x0, 0x8A, 8, -6
	banim_frame_oam 0x8000, 0x0, 0x85, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x83, -5, -48
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x0, 0x84, -16, -7
	banim_frame_oam 0x4000, 0x0, 0x80, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xC3, -7, -32
	banim_frame_oam 0x8000, 0x0, 0xC5, 0, -24
	banim_frame_end
banim_snif_ar1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x4000, 0x8C, -3, -37
	banim_frame_oam 0x8000, 0x0, 0x8E, 13, -37
	banim_frame_oam 0x0, 0x0, 0x8B, -11, -37
	banim_frame_oam 0x0, 0x4000, 0xCD, 5, -21
	banim_frame_oam 0x0, 0x0, 0xA4, 0, -8
	banim_frame_oam 0x0, 0x0, 0x8A, 8, -6
	banim_frame_oam 0x8000, 0x0, 0x85, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC4, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x83, -5, -48
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x0, 0x84, -16, -7
	banim_frame_oam 0x4000, 0x0, 0x80, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xC3, -7, -32
	banim_frame_oam 0x8000, 0x0, 0xC5, 0, -24
	banim_frame_end
banim_snif_ar1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -13
	banim_frame_oam 0x8000, 0x0, 0x4, 16, -13
	banim_frame_oam 0x0, 0x0, 0x5, 24, -13
	banim_frame_oam 0x8000, 0x0, 0x44, -16, -29
	banim_frame_oam 0x0, 0x0, 0x45, -8, -30
	banim_frame_oam 0x0, 0x0, 0x25, -8, -21
	banim_frame_oam 0x0, 0x0, 0x65, 0, -21
	banim_frame_end
banim_snif_ar1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x8000, 0x26, -17, -5
	banim_frame_oam 0x4000, 0x4000, 0x66, -17, 11
	banim_frame_oam 0x4000, 0x0, 0x8, 10, -13
	banim_frame_oam 0x0, 0x0, 0x7, 15, -5
	banim_frame_oam 0x0, 0x0, 0x6, 15, 3
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_snif_ar1_script:
banim_snif_ar1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x53
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 1, banim_snif_ar1_oam_frame_1_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 2, banim_snif_ar1_oam_frame_2_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 3, banim_snif_ar1_oam_frame_3_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 4, banim_snif_ar1_oam_frame_4_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 5, banim_snif_ar1_oam_frame_5_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 6, banim_snif_ar1_oam_frame_6_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 7, banim_snif_ar1_oam_frame_7_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 8, banim_snif_ar1_oam_frame_8_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 9, banim_snif_ar1_oam_frame_9_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 10, banim_snif_ar1_oam_frame_10_r - banim_snif_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_snif_ar1_sheet_1, 15, banim_snif_ar1_oam_frame_11_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 11, banim_snif_ar1_oam_frame_12_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 12, banim_snif_ar1_oam_frame_13_r - banim_snif_ar1_oam_r
	banim_code_frame 3, banim_snif_ar1_sheet_1, 13, banim_snif_ar1_oam_frame_14_r - banim_snif_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_snif_ar1_sheet_1, 16, banim_snif_ar1_oam_frame_16_r - banim_snif_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snif_ar1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x53
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 1, banim_snif_ar1_oam_frame_1_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 2, banim_snif_ar1_oam_frame_2_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 3, banim_snif_ar1_oam_frame_3_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 4, banim_snif_ar1_oam_frame_4_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 5, banim_snif_ar1_oam_frame_5_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 6, banim_snif_ar1_oam_frame_6_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 7, banim_snif_ar1_oam_frame_7_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 8, banim_snif_ar1_oam_frame_8_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 9, banim_snif_ar1_oam_frame_9_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 10, banim_snif_ar1_oam_frame_10_r - banim_snif_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_snif_ar1_sheet_1, 15, banim_snif_ar1_oam_frame_11_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 11, banim_snif_ar1_oam_frame_12_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 12, banim_snif_ar1_oam_frame_13_r - banim_snif_ar1_oam_r
	banim_code_frame 3, banim_snif_ar1_sheet_1, 13, banim_snif_ar1_oam_frame_14_r - banim_snif_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_snif_ar1_sheet_1, 16, banim_snif_ar1_oam_frame_16_r - banim_snif_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snif_ar1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x53
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 1, banim_snif_ar1_oam_frame_1_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 2, banim_snif_ar1_oam_frame_2_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 3, banim_snif_ar1_oam_frame_3_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 4, banim_snif_ar1_oam_frame_4_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 5, banim_snif_ar1_oam_frame_5_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 6, banim_snif_ar1_oam_frame_6_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 7, banim_snif_ar1_oam_frame_7_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 8, banim_snif_ar1_oam_frame_8_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 9, banim_snif_ar1_oam_frame_9_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 10, banim_snif_ar1_oam_frame_10_r - banim_snif_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_snif_ar1_sheet_1, 15, banim_snif_ar1_oam_frame_11_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 11, banim_snif_ar1_oam_frame_12_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 12, banim_snif_ar1_oam_frame_13_r - banim_snif_ar1_oam_r
	banim_code_frame 3, banim_snif_ar1_sheet_1, 13, banim_snif_ar1_oam_frame_14_r - banim_snif_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_snif_ar1_sheet_1, 16, banim_snif_ar1_oam_frame_16_r - banim_snif_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snif_ar1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x53
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 1, banim_snif_ar1_oam_frame_1_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 2, banim_snif_ar1_oam_frame_2_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 3, banim_snif_ar1_oam_frame_3_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 4, banim_snif_ar1_oam_frame_4_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 5, banim_snif_ar1_oam_frame_5_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 6, banim_snif_ar1_oam_frame_6_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 7, banim_snif_ar1_oam_frame_7_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 8, banim_snif_ar1_oam_frame_8_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 9, banim_snif_ar1_oam_frame_9_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 10, banim_snif_ar1_oam_frame_10_r - banim_snif_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_snif_ar1_sheet_1, 15, banim_snif_ar1_oam_frame_11_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 11, banim_snif_ar1_oam_frame_12_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 12, banim_snif_ar1_oam_frame_13_r - banim_snif_ar1_oam_r
	banim_code_frame 3, banim_snif_ar1_sheet_1, 13, banim_snif_ar1_oam_frame_14_r - banim_snif_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_snif_ar1_sheet_1, 16, banim_snif_ar1_oam_frame_16_r - banim_snif_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snif_ar1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x53
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 1, banim_snif_ar1_oam_frame_1_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 2, banim_snif_ar1_oam_frame_2_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 3, banim_snif_ar1_oam_frame_3_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 4, banim_snif_ar1_oam_frame_4_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 5, banim_snif_ar1_oam_frame_5_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 6, banim_snif_ar1_oam_frame_6_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 7, banim_snif_ar1_oam_frame_7_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 8, banim_snif_ar1_oam_frame_8_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 9, banim_snif_ar1_oam_frame_9_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 10, banim_snif_ar1_oam_frame_10_r - banim_snif_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 3, banim_snif_ar1_sheet_1, 15, banim_snif_ar1_oam_frame_11_r - banim_snif_ar1_oam_r
	banim_code_frame 7, banim_snif_ar1_sheet_1, 11, banim_snif_ar1_oam_frame_12_r - banim_snif_ar1_oam_r
	banim_code_frame 10, banim_snif_ar1_sheet_1, 12, banim_snif_ar1_oam_frame_13_r - banim_snif_ar1_oam_r
	banim_code_frame 3, banim_snif_ar1_sheet_1, 13, banim_snif_ar1_oam_frame_14_r - banim_snif_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_snif_ar1_sheet_1, 16, banim_snif_ar1_oam_frame_16_r - banim_snif_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snif_ar1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x53
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 1, banim_snif_ar1_oam_frame_1_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 2, banim_snif_ar1_oam_frame_2_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 3, banim_snif_ar1_oam_frame_3_r - banim_snif_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_snif_ar1_sheet_0, 4, banim_snif_ar1_oam_frame_4_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 17, banim_snif_ar1_oam_frame_17_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 18, banim_snif_ar1_oam_frame_18_r - banim_snif_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_snif_ar1_sheet_0, 19, banim_snif_ar1_oam_frame_19_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 20, banim_snif_ar1_oam_frame_20_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 18, banim_snif_ar1_oam_frame_18_r - banim_snif_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_snif_ar1_sheet_0, 19, banim_snif_ar1_oam_frame_19_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 20, banim_snif_ar1_oam_frame_20_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 22, banim_snif_ar1_oam_frame_21_r - banim_snif_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_snif_ar1_sheet_0, 23, banim_snif_ar1_oam_frame_22_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 21, banim_snif_ar1_oam_frame_23_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 22, banim_snif_ar1_oam_frame_21_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 23, banim_snif_ar1_oam_frame_22_r - banim_snif_ar1_oam_r
	banim_code_frame 3, banim_snif_ar1_sheet_1, 7, banim_snif_ar1_oam_frame_7_r - banim_snif_ar1_oam_r
	banim_code_frame 3, banim_snif_ar1_sheet_1, 8, banim_snif_ar1_oam_frame_8_r - banim_snif_ar1_oam_r
	banim_code_frame 4, banim_snif_ar1_sheet_1, 9, banim_snif_ar1_oam_frame_9_r - banim_snif_ar1_oam_r
	banim_code_frame 4, banim_snif_ar1_sheet_1, 10, banim_snif_ar1_oam_frame_10_r - banim_snif_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_snif_ar1_sheet_1, 15, banim_snif_ar1_oam_frame_11_r - banim_snif_ar1_oam_r
	banim_code_frame 7, banim_snif_ar1_sheet_1, 11, banim_snif_ar1_oam_frame_12_r - banim_snif_ar1_oam_r
	banim_code_frame 15, banim_snif_ar1_sheet_1, 12, banim_snif_ar1_oam_frame_13_r - banim_snif_ar1_oam_r
	banim_code_frame 3, banim_snif_ar1_sheet_1, 13, banim_snif_ar1_oam_frame_14_r - banim_snif_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_snif_ar1_sheet_1, 16, banim_snif_ar1_oam_frame_16_r - banim_snif_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snif_ar1_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_snif_ar1_sheet_2, 24, banim_snif_ar1_oam_frame_24_r - banim_snif_ar1_oam_r
	banim_code_frame 1, banim_snif_ar1_sheet_2, 25, banim_snif_ar1_oam_frame_25_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_snif_ar1_sheet_2, 24, banim_snif_ar1_oam_frame_24_r - banim_snif_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snif_ar1_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_snif_ar1_sheet_2, 24, banim_snif_ar1_oam_frame_24_r - banim_snif_ar1_oam_r
	banim_code_frame 1, banim_snif_ar1_sheet_2, 25, banim_snif_ar1_oam_frame_25_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_snif_ar1_sheet_2, 24, banim_snif_ar1_oam_frame_24_r - banim_snif_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_snif_ar1_mode_stand_close:
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snif_ar1_mode_stand:
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snif_ar1_mode_stand_range:
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_snif_ar1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_snif_ar1_sheet_0, 0, banim_snif_ar1_oam_frame_0_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 1, banim_snif_ar1_oam_frame_1_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 2, banim_snif_ar1_oam_frame_2_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 3, banim_snif_ar1_oam_frame_3_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_0, 4, banim_snif_ar1_oam_frame_4_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 5, banim_snif_ar1_oam_frame_5_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 6, banim_snif_ar1_oam_frame_6_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 7, banim_snif_ar1_oam_frame_7_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 8, banim_snif_ar1_oam_frame_8_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 9, banim_snif_ar1_oam_frame_9_r - banim_snif_ar1_oam_r
	banim_code_frame 2, banim_snif_ar1_sheet_1, 10, banim_snif_ar1_oam_frame_10_r - banim_snif_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 3, banim_snif_ar1_sheet_1, 15, banim_snif_ar1_oam_frame_11_r - banim_snif_ar1_oam_r
	banim_code_frame 7, banim_snif_ar1_sheet_1, 11, banim_snif_ar1_oam_frame_12_r - banim_snif_ar1_oam_r
	banim_code_frame 10, banim_snif_ar1_sheet_1, 12, banim_snif_ar1_oam_frame_13_r - banim_snif_ar1_oam_r
	banim_code_frame 3, banim_snif_ar1_sheet_1, 13, banim_snif_ar1_oam_frame_14_r - banim_snif_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_snif_ar1_sheet_1, 14, banim_snif_ar1_oam_frame_15_r - banim_snif_ar1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_snif_ar1_sheet_1, 16, banim_snif_ar1_oam_frame_16_r - banim_snif_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_snif_ar1_mode_attack_close - banim_snif_ar1_script
	.word banim_snif_ar1_mode_attack_close_back - banim_snif_ar1_script
	.word banim_snif_ar1_mode_attack_close_critical - banim_snif_ar1_script
	.word banim_snif_ar1_mode_attack_close_critical_back - banim_snif_ar1_script
	.word banim_snif_ar1_mode_attack_range - banim_snif_ar1_script
	.word banim_snif_ar1_mode_attack_range_critical - banim_snif_ar1_script
	.word banim_snif_ar1_mode_dodge_close - banim_snif_ar1_script
	.word banim_snif_ar1_mode_dodge_range - banim_snif_ar1_script
	.word banim_snif_ar1_mode_stand_close - banim_snif_ar1_script
	.word banim_snif_ar1_mode_stand - banim_snif_ar1_script
	.word banim_snif_ar1_mode_stand_range - banim_snif_ar1_script
	.word banim_snif_ar1_mode_attack_miss - banim_snif_ar1_script
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

