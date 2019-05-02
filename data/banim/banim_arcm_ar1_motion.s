@ vim:ft=armv4
	.global banim_arcm_ar1_script
	.global banim_arcm_ar1_oam_r
	.global banim_arcm_ar1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x25
	.section .data.oam_l
banim_arcm_ar1_oam_l:
banim_arcm_ar1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x1000, 0x60, -3, 8
	banim_frame_oam 0x0, 0x1000, 0x62, -11, 8
	banim_frame_oam 0x4000, 0x5000, 0x40, -18, 0
	banim_frame_oam 0x4000, 0x1000, 0x20, -2, -8
	banim_frame_oam 0x0, 0x1000, 0x22, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x0, -11, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x3, -12, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x24, -2, -8
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x64, -2, 8
	banim_frame_oam 0x0, 0x1000, 0x66, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x6, -18, -4
	banim_frame_oam 0x4000, 0x1000, 0x4, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x3, -12, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x27, -3, -8
	banim_frame_oam 0x8000, 0x1000, 0x29, -11, -8
	banim_frame_oam 0x4000, 0x1000, 0x67, -3, 8
	banim_frame_oam 0x0, 0x1000, 0x69, -11, 8
	banim_frame_oam 0x0, 0x1000, 0x7, -19, -4
	banim_frame_oam 0x4000, 0x1000, 0x8, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x3, -14, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0x4A, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x4C, -14, 0
	banim_frame_oam 0x4000, 0x1000, 0x2A, -9, -8
	banim_frame_oam 0x0, 0x1000, 0x2C, -17, -8
	banim_frame_oam 0x4000, 0x1000, 0xA, -11, -16
	banim_frame_oam 0x0, 0x1000, 0xC, -19, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x23, -22, 0
	banim_frame_oam 0x0, 0x1000, 0x63, -18, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0x4E, -10, 0
	banim_frame_oam 0x8000, 0x1000, 0x4D, 6, -3
	banim_frame_oam 0x8000, 0x1000, 0x30, 14, 0
	banim_frame_oam 0x0, 0x5000, 0xD, -10, -16
	banim_frame_oam 0x8000, 0x1000, 0xF, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x10, -18, 0
	banim_frame_oam 0x0, 0x1000, 0x2, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -18, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0x54, -17, -8
	banim_frame_oam 0x0, 0x5000, 0x31, -2, -8
	banim_frame_oam 0x8000, 0x1000, 0x33, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x71, -2, 8
	banim_frame_oam 0x0, 0x1000, 0x73, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x34, -18, -8
	banim_frame_oam 0x4000, 0x1000, 0x11, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x13, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -18, -24
	banim_frame_oam 0x0, 0x1000, 0x70, 14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_6_l:
	banim_frame_affine -221, 127, 127, 221, 1
	banim_frame_oam 0x100, 0x4000, 0x54, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x31, -2, -8
	banim_frame_oam 0x8000, 0x1000, 0x33, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x71, -2, 8
	banim_frame_oam 0x0, 0x1000, 0x73, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x34, -18, -8
	banim_frame_oam 0x4000, 0x1000, 0x11, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x13, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -18, -24
	banim_frame_oam 0x0, 0x1000, 0x70, 14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_7_l:
	banim_frame_affine -87, 240, 240, 87, 1
	banim_frame_oam 0x100, 0x4000, 0x54, -14, -4
	banim_frame_oam 0x0, 0x5000, 0x31, -2, -8
	banim_frame_oam 0x8000, 0x1000, 0x33, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x71, -2, 8
	banim_frame_oam 0x0, 0x1000, 0x73, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x34, -18, -8
	banim_frame_oam 0x4000, 0x1000, 0x11, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x13, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -18, -24
	banim_frame_oam 0x0, 0x1000, 0x70, 14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x15, -9, -4
	banim_frame_oam 0x0, 0x1000, 0x35, -11, 4
	banim_frame_oam 0x0, 0x5000, 0x31, -2, -8
	banim_frame_oam 0x8000, 0x1000, 0x33, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x71, -2, 8
	banim_frame_oam 0x0, 0x1000, 0x73, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x34, -18, -8
	banim_frame_oam 0x4000, 0x1000, 0x11, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x13, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -18, -24
	banim_frame_oam 0x0, 0x1000, 0x70, 14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x1000, 0x15, -9, -3
	banim_frame_oam 0x0, 0x1000, 0x35, -11, 5
	banim_frame_oam 0x0, 0x5000, 0x31, -2, -8
	banim_frame_oam 0x8000, 0x1000, 0x33, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x71, -2, 8
	banim_frame_oam 0x0, 0x1000, 0x73, -10, 8
	banim_frame_oam 0x0, 0x1000, 0x34, -18, -8
	banim_frame_oam 0x4000, 0x1000, 0x11, -10, -16
	banim_frame_oam 0x0, 0x1000, 0x13, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -18, -24
	banim_frame_oam 0x0, 0x1000, 0x70, 14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, -3, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, -11, 8
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x70, 14, 0
	banim_frame_oam 0x0, 0x1000, 0x14, -14, -24
	banim_frame_oam 0x4000, 0x1000, 0xC0, -2, 0
	banim_frame_oam 0x0, 0x1000, 0xC2, -10, 0
	banim_frame_oam 0x4000, 0x1000, 0xA0, -3, -8
	banim_frame_oam 0x0, 0x1000, 0xA2, -11, -8
	banim_frame_end
banim_arcm_ar1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x1000, 0x2, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x86, 8, -24
	banim_frame_oam 0x0, 0x5000, 0xA3, -6, -8
	banim_frame_oam 0x8000, 0x1000, 0xA5, -14, -8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -6, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -14, 8
	banim_frame_oam 0x0, 0x1000, 0xA6, 10, -1
	banim_frame_oam 0x4000, 0x1000, 0x83, 1, -16
	banim_frame_oam 0x0, 0x1000, 0x85, -7, -16
	banim_frame_end
banim_arcm_ar1_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x9000, 0x87, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x89, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xE6, 12, -10
	banim_frame_oam 0x0, 0x1000, 0xC6, 1, -24
	banim_frame_oam 0x0, 0x1000, 0x2, -4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x5000, 0x8A, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0x8C, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xAD, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xCD, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x2, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x8D, -16, -10
	banim_frame_oam 0x0, 0x5000, 0xCA, -3, 0
	banim_frame_oam 0x8000, 0x1000, 0xCC, -11, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, -3, 0
	banim_frame_oam 0x0, 0x1000, 0x42, -11, 0
	banim_frame_oam 0x4000, 0x1000, 0x60, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x62, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x63, 20, -16
	banim_frame_oam 0x0, 0x1000, 0x43, 5, -24
	banim_frame_oam 0x0, 0x1000, 0xB, -4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x5000, 0x44, -3, 0
	banim_frame_oam 0x8000, 0x1000, 0x46, -11, 0
	banim_frame_oam 0x0, 0x5000, 0x4, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x7, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x47, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x67, 5, -24
	banim_frame_oam 0x0, 0x1000, 0xB, -4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0x8, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xA, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x2B, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x48, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0x68, -3, 8
	banim_frame_oam 0x0, 0x1000, 0x6A, -11, 8
	banim_frame_oam 0x4000, 0x1000, 0x49, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x4B, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xB, -4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xB, -6, -24
	banim_frame_oam 0x0, 0x1000, 0xE, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x2C, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x2E, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x4C, -3, 0
	banim_frame_oam 0x8000, 0x1000, 0x4E, -11, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x1000, 0xB, -6, -24
	banim_frame_oam 0x0, 0x1000, 0xE, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xC, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x2C, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x2E, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x4F, -3, 0
	banim_frame_oam 0x0, 0x1000, 0x6B, 5, 8
	banim_frame_oam 0x8000, 0x1000, 0x4E, -11, 0
	banim_frame_oam 0x0, 0x1000, 0x4C, 5, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0xB, -6, -24
	banim_frame_oam 0x0, 0x1000, 0xE, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x2C, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x2E, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x4F, -3, 0
	banim_frame_oam 0x0, 0x1000, 0x6B, 5, 8
	banim_frame_oam 0x8000, 0x1000, 0x4E, -11, 0
	banim_frame_oam 0x0, 0x1000, 0x4C, 5, 0
	banim_frame_oam 0x0, 0x1000, 0xF, -6, -16
	banim_frame_oam 0x4000, 0x1000, 0xC, -12, -16
	banim_frame_end
banim_arcm_ar1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x9000, 0x81, -10, -13
	banim_frame_oam 0x8000, 0x5000, 0x83, -18, -13
	banim_frame_oam 0x0, 0x1000, 0x84, -6, -21
	banim_frame_oam 0x0, 0x1000, 0x85, -14, -21
	banim_frame_oam 0x0, 0x1000, 0xA4, -18, -21
	banim_frame_oam 0x8000, 0x1000, 0xC4, -26, -13
	banim_frame_oam 0x8000, 0x1000, 0xC0, 6, -1
	banim_frame_oam 0x0, 0x1000, 0xA0, -26, 11
	banim_frame_oam 0x0, 0x1000, 0x80, -26, 3
	banim_frame_oam 0x0, 0x1000, 0xA5, -26, -21
	banim_frame_end
banim_arcm_ar1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x1000, 0xE7, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x86, -8, -10
	banim_frame_oam 0x8000, 0x1000, 0x87, -16, -5
	banim_frame_oam 0x0, 0x1000, 0xC7, -16, 11
	banim_frame_oam 0x8000, 0x1000, 0x88, -24, -10
	banim_frame_oam 0x0, 0x1000, 0xC8, -24, 6
	banim_frame_oam 0x0, 0x1000, 0xE8, -24, 14
	banim_frame_oam 0x8000, 0x1000, 0xC5, -30, -18
	banim_frame_end
banim_arcm_ar1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, 9, -21
	banim_frame_oam 0x0, 0x1000, 0x5, 1, -21
	banim_frame_oam 0x0, 0x1000, 0x65, 1, 3
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x69, -3, -24
	banim_frame_oam 0x0, 0x5000, 0x46, -17, -8
	banim_frame_oam 0x0, 0x1000, 0x68, -20, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -5, -8
	banim_frame_oam 0x0, 0x1000, 0x22, -13, -8
	banim_frame_oam 0x0, 0x5000, 0x40, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x42, -14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_21_l:
	banim_frame_affine -221, 127, 127, 221, 1
	banim_frame_oam 0x0, 0x5000, 0x6, 9, -22
	banim_frame_oam 0x0, 0x5000, 0x8, -7, -22
	banim_frame_oam 0x4000, 0x1000, 0x48, -7, -6
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x69, -3, -24
	banim_frame_oam 0x100, 0x4000, 0x46, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x68, -20, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -5, -8
	banim_frame_oam 0x0, 0x1000, 0x22, -13, -8
	banim_frame_oam 0x0, 0x5000, 0x40, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x42, -14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_22_l:
	banim_frame_affine -87, 240, 240, 87, 1
	banim_frame_oam 0x0, 0x5000, 0xA, -7, -6
	banim_frame_oam 0x0, 0x5000, 0x4A, 9, -6
	banim_frame_oam 0x0, 0x1000, 0xC, -7, -14
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x69, -3, -24
	banim_frame_oam 0x100, 0x4000, 0x46, -14, -4
	banim_frame_oam 0x0, 0x1000, 0x68, -20, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -5, -8
	banim_frame_oam 0x0, 0x1000, 0x22, -13, -8
	banim_frame_oam 0x0, 0x5000, 0x40, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x42, -14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0x25, -9, -4
	banim_frame_oam 0x0, 0x1000, 0x45, -11, 4
	banim_frame_oam 0x8000, 0x9000, 0x3, 8, -20
	banim_frame_oam 0x0, 0x1000, 0x5, 0, -20
	banim_frame_oam 0x0, 0x1000, 0x65, 0, 4
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x69, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x68, -20, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -5, -8
	banim_frame_oam 0x0, 0x1000, 0x22, -13, -8
	banim_frame_oam 0x0, 0x5000, 0x40, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x42, -14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x5000, 0x6, 8, -21
	banim_frame_oam 0x0, 0x5000, 0x8, -8, -21
	banim_frame_oam 0x4000, 0x1000, 0x48, -8, -5
	banim_frame_oam 0x0, 0x1000, 0x25, -9, -3
	banim_frame_oam 0x0, 0x1000, 0x45, -11, 5
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x69, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x68, -20, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -5, -8
	banim_frame_oam 0x0, 0x1000, 0x22, -13, -8
	banim_frame_oam 0x0, 0x5000, 0x40, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x42, -14, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x5000, 0x4A, 8, -3
	banim_frame_oam 0x0, 0x5000, 0xA, -8, -3
	banim_frame_oam 0x0, 0x1000, 0xC, -8, -11
	banim_frame_oam 0x0, 0x1000, 0x25, -9, -3
	banim_frame_oam 0x0, 0x1000, 0x45, -11, 5
	banim_frame_oam 0x4000, 0x1000, 0x0, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x69, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x68, -20, -24
	banim_frame_oam 0x4000, 0x1000, 0x20, -5, -8
	banim_frame_oam 0x0, 0x1000, 0x22, -13, -8
	banim_frame_oam 0x0, 0x5000, 0x40, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x42, -14, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_arcm_ar1_oam_r:
banim_arcm_ar1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0x60, -13, 8
	banim_frame_oam 0x0, 0x0, 0x62, 3, 8
	banim_frame_oam 0x4000, 0x4000, 0x40, -14, 0
	banim_frame_oam 0x4000, 0x0, 0x20, -14, -8
	banim_frame_oam 0x0, 0x0, 0x22, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x0, -5, -16
	banim_frame_oam 0x0, 0x0, 0x2, -4, -24
	banim_frame_oam 0x0, 0x0, 0x3, 4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x24, -14, -8
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x64, -14, 8
	banim_frame_oam 0x0, 0x0, 0x66, 2, 8
	banim_frame_oam 0x0, 0x0, 0x6, 10, -4
	banim_frame_oam 0x4000, 0x0, 0x4, -6, -16
	banim_frame_oam 0x0, 0x0, 0x2, -4, -24
	banim_frame_oam 0x0, 0x0, 0x3, 4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x27, -13, -8
	banim_frame_oam 0x8000, 0x0, 0x29, 3, -8
	banim_frame_oam 0x4000, 0x0, 0x67, -13, 8
	banim_frame_oam 0x0, 0x0, 0x69, 3, 8
	banim_frame_oam 0x0, 0x0, 0x7, 11, -4
	banim_frame_oam 0x4000, 0x0, 0x8, -4, -16
	banim_frame_oam 0x0, 0x0, 0x2, -4, -24
	banim_frame_oam 0x0, 0x0, 0x3, 6, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x4000, 0x4A, -10, 0
	banim_frame_oam 0x8000, 0x0, 0x4C, 6, 0
	banim_frame_oam 0x4000, 0x0, 0x2A, -7, -8
	banim_frame_oam 0x0, 0x0, 0x2C, 9, -8
	banim_frame_oam 0x4000, 0x0, 0xA, -5, -16
	banim_frame_oam 0x0, 0x0, 0xC, 11, -16
	banim_frame_oam 0x0, 0x0, 0x2, -5, -24
	banim_frame_oam 0x0, 0x0, 0x23, 14, 0
	banim_frame_oam 0x0, 0x0, 0x63, 10, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0x4E, -6, 0
	banim_frame_oam 0x8000, 0x0, 0x4D, -14, -3
	banim_frame_oam 0x8000, 0x0, 0x30, -22, 0
	banim_frame_oam 0x0, 0x4000, 0xD, -6, -16
	banim_frame_oam 0x8000, 0x0, 0xF, 10, -16
	banim_frame_oam 0x0, 0x0, 0x10, 10, 0
	banim_frame_oam 0x0, 0x0, 0x2, -5, -24
	banim_frame_oam 0x0, 0x0, 0x63, 10, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0x54, 1, -8
	banim_frame_oam 0x0, 0x4000, 0x31, -14, -8
	banim_frame_oam 0x8000, 0x0, 0x33, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x71, -14, 8
	banim_frame_oam 0x0, 0x0, 0x73, 2, 8
	banim_frame_oam 0x0, 0x0, 0x34, 10, -8
	banim_frame_oam 0x4000, 0x0, 0x11, -6, -16
	banim_frame_oam 0x0, 0x0, 0x13, 10, -16
	banim_frame_oam 0x0, 0x0, 0x2, -5, -24
	banim_frame_oam 0x0, 0x0, 0x63, 10, -24
	banim_frame_oam 0x0, 0x0, 0x70, -22, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_6_r:
	banim_frame_affine 221, 127, -127, 221, 1
	banim_frame_oam 0x100, 0x4000, 0x54, 0, -8
	banim_frame_oam 0x0, 0x4000, 0x31, -14, -8
	banim_frame_oam 0x8000, 0x0, 0x33, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x71, -14, 8
	banim_frame_oam 0x0, 0x0, 0x73, 2, 8
	banim_frame_oam 0x0, 0x0, 0x34, 10, -8
	banim_frame_oam 0x4000, 0x0, 0x11, -6, -16
	banim_frame_oam 0x0, 0x0, 0x13, 10, -16
	banim_frame_oam 0x0, 0x0, 0x2, -5, -24
	banim_frame_oam 0x0, 0x0, 0x63, 10, -24
	banim_frame_oam 0x0, 0x0, 0x70, -22, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_7_r:
	banim_frame_affine 87, 240, -240, 87, 1
	banim_frame_oam 0x100, 0x4000, 0x54, -2, -4
	banim_frame_oam 0x0, 0x4000, 0x31, -14, -8
	banim_frame_oam 0x8000, 0x0, 0x33, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x71, -14, 8
	banim_frame_oam 0x0, 0x0, 0x73, 2, 8
	banim_frame_oam 0x0, 0x0, 0x34, 10, -8
	banim_frame_oam 0x4000, 0x0, 0x11, -6, -16
	banim_frame_oam 0x0, 0x0, 0x13, 10, -16
	banim_frame_oam 0x0, 0x0, 0x2, -5, -24
	banim_frame_oam 0x0, 0x0, 0x63, 10, -24
	banim_frame_oam 0x0, 0x0, 0x70, -22, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x15, 1, -4
	banim_frame_oam 0x0, 0x0, 0x35, 3, 4
	banim_frame_oam 0x0, 0x4000, 0x31, -14, -8
	banim_frame_oam 0x8000, 0x0, 0x33, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x71, -14, 8
	banim_frame_oam 0x0, 0x0, 0x73, 2, 8
	banim_frame_oam 0x0, 0x0, 0x34, 10, -8
	banim_frame_oam 0x4000, 0x0, 0x11, -6, -16
	banim_frame_oam 0x0, 0x0, 0x13, 10, -16
	banim_frame_oam 0x0, 0x0, 0x2, -5, -24
	banim_frame_oam 0x0, 0x0, 0x63, 10, -24
	banim_frame_oam 0x0, 0x0, 0x70, -22, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x0, 0x15, 1, -3
	banim_frame_oam 0x0, 0x0, 0x35, 3, 5
	banim_frame_oam 0x0, 0x4000, 0x31, -14, -8
	banim_frame_oam 0x8000, 0x0, 0x33, 2, -8
	banim_frame_oam 0x4000, 0x0, 0x71, -14, 8
	banim_frame_oam 0x0, 0x0, 0x73, 2, 8
	banim_frame_oam 0x0, 0x0, 0x34, 10, -8
	banim_frame_oam 0x4000, 0x0, 0x11, -6, -16
	banim_frame_oam 0x0, 0x0, 0x13, 10, -16
	banim_frame_oam 0x0, 0x0, 0x2, -5, -24
	banim_frame_oam 0x0, 0x0, 0x63, 10, -24
	banim_frame_oam 0x0, 0x0, 0x70, -22, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -13, 8
	banim_frame_oam 0x0, 0x0, 0xE2, 3, 8
	banim_frame_oam 0x4000, 0x0, 0x80, -8, -16
	banim_frame_oam 0x0, 0x0, 0x82, 8, -16
	banim_frame_oam 0x0, 0x0, 0x2, -5, -24
	banim_frame_oam 0x0, 0x0, 0x70, -22, 0
	banim_frame_oam 0x0, 0x0, 0x14, 6, -24
	banim_frame_oam 0x4000, 0x0, 0xC0, -14, 0
	banim_frame_oam 0x0, 0x0, 0xC2, 2, 0
	banim_frame_oam 0x4000, 0x0, 0xA0, -13, -8
	banim_frame_oam 0x0, 0x0, 0xA2, 3, -8
	banim_frame_end
banim_arcm_ar1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x0, 0x2, -5, -24
	banim_frame_oam 0x0, 0x0, 0x86, -16, -24
	banim_frame_oam 0x0, 0x4000, 0xA3, -10, -8
	banim_frame_oam 0x8000, 0x0, 0xA5, 6, -8
	banim_frame_oam 0x4000, 0x0, 0xE3, -10, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 6, 8
	banim_frame_oam 0x0, 0x0, 0xA6, -18, -1
	banim_frame_oam 0x4000, 0x0, 0x83, -17, -16
	banim_frame_oam 0x0, 0x0, 0x85, -1, -16
	banim_frame_end
banim_arcm_ar1_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x8000, 0x87, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x89, 4, -16
	banim_frame_oam 0x0, 0x0, 0xE6, -20, -10
	banim_frame_oam 0x0, 0x0, 0xC6, -9, -24
	banim_frame_oam 0x0, 0x0, 0x2, -4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0x8A, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x8C, 0, -16
	banim_frame_oam 0x0, 0x0, 0xAD, -16, -24
	banim_frame_oam 0x0, 0x0, 0xCD, -8, -24
	banim_frame_oam 0x0, 0x0, 0x2, -4, -24
	banim_frame_oam 0x0, 0x0, 0x8D, 8, -10
	banim_frame_oam 0x0, 0x4000, 0xCA, -13, 0
	banim_frame_oam 0x8000, 0x0, 0xCC, 3, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -20, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -13, 0
	banim_frame_oam 0x0, 0x0, 0x42, 3, 0
	banim_frame_oam 0x4000, 0x0, 0x60, -12, 8
	banim_frame_oam 0x0, 0x0, 0x62, 4, 8
	banim_frame_oam 0x0, 0x0, 0x63, -28, -16
	banim_frame_oam 0x0, 0x0, 0x43, -13, -24
	banim_frame_oam 0x0, 0x0, 0xB, -4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x4000, 0x44, -13, 0
	banim_frame_oam 0x8000, 0x0, 0x46, 3, 0
	banim_frame_oam 0x0, 0x4000, 0x4, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x6, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x7, 8, -24
	banim_frame_oam 0x0, 0x0, 0x47, 8, -8
	banim_frame_oam 0x0, 0x0, 0x67, -13, -24
	banim_frame_oam 0x0, 0x0, 0xB, -4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0x8, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xA, 0, -16
	banim_frame_oam 0x0, 0x0, 0x2B, 8, -8
	banim_frame_oam 0x0, 0x0, 0x48, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x68, -13, 8
	banim_frame_oam 0x0, 0x0, 0x6A, 3, 8
	banim_frame_oam 0x4000, 0x0, 0x49, -8, 0
	banim_frame_oam 0x0, 0x0, 0x4B, 8, 0
	banim_frame_oam 0x0, 0x0, 0xB, -4, -24
	banim_frame_end
banim_arcm_ar1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x0, 0xC, -4, -16
	banim_frame_oam 0x0, 0x0, 0xB, -2, -24
	banim_frame_oam 0x0, 0x0, 0xE, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x2C, -8, -8
	banim_frame_oam 0x0, 0x0, 0x2E, 8, -8
	banim_frame_oam 0x0, 0x4000, 0x4C, -13, 0
	banim_frame_oam 0x8000, 0x0, 0x4E, 3, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x0, 0xB, -2, -24
	banim_frame_oam 0x0, 0x0, 0xE, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xC, -4, -16
	banim_frame_oam 0x4000, 0x0, 0x2C, -8, -8
	banim_frame_oam 0x0, 0x0, 0x2E, 8, -8
	banim_frame_oam 0x8000, 0x0, 0x4F, -5, 0
	banim_frame_oam 0x0, 0x0, 0x6B, -13, 8
	banim_frame_oam 0x8000, 0x0, 0x4E, 3, 0
	banim_frame_oam 0x0, 0x0, 0x4C, -13, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0xB, -2, -24
	banim_frame_oam 0x0, 0x0, 0xE, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x2C, -8, -8
	banim_frame_oam 0x0, 0x0, 0x2E, 8, -8
	banim_frame_oam 0x8000, 0x0, 0x4F, -5, 0
	banim_frame_oam 0x0, 0x0, 0x6B, -13, 8
	banim_frame_oam 0x8000, 0x0, 0x4E, 3, 0
	banim_frame_oam 0x0, 0x0, 0x4C, -13, 0
	banim_frame_oam 0x0, 0x0, 0xF, -2, -16
	banim_frame_oam 0x4000, 0x0, 0xC, -4, -16
	banim_frame_end
banim_arcm_ar1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x8000, 0x81, -6, -13
	banim_frame_oam 0x8000, 0x4000, 0x83, 10, -13
	banim_frame_oam 0x0, 0x0, 0x84, -2, -21
	banim_frame_oam 0x0, 0x0, 0x85, 6, -21
	banim_frame_oam 0x0, 0x0, 0xA4, 10, -21
	banim_frame_oam 0x8000, 0x0, 0xC4, 18, -13
	banim_frame_oam 0x8000, 0x0, 0xC0, -14, -1
	banim_frame_oam 0x0, 0x0, 0xA0, 18, 11
	banim_frame_oam 0x0, 0x0, 0x80, 18, 3
	banim_frame_oam 0x0, 0x0, 0xA5, 18, -21
	banim_frame_end
banim_arcm_ar1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x0, 0xE7, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x86, 0, -10
	banim_frame_oam 0x8000, 0x0, 0x87, 8, -5
	banim_frame_oam 0x0, 0x0, 0xC7, 8, 11
	banim_frame_oam 0x8000, 0x0, 0x88, 16, -10
	banim_frame_oam 0x0, 0x0, 0xC8, 16, 6
	banim_frame_oam 0x0, 0x0, 0xE8, 16, 14
	banim_frame_oam 0x8000, 0x0, 0xC5, 22, -18
	banim_frame_end
banim_arcm_ar1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -25, -21
	banim_frame_oam 0x0, 0x0, 0x5, -9, -21
	banim_frame_oam 0x0, 0x0, 0x65, -9, 3
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -16
	banim_frame_oam 0x0, 0x0, 0x2, 8, -16
	banim_frame_oam 0x0, 0x0, 0x69, -5, -24
	banim_frame_oam 0x0, 0x4000, 0x46, 1, -8
	banim_frame_oam 0x0, 0x0, 0x68, 12, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -11, -8
	banim_frame_oam 0x0, 0x0, 0x22, 5, -8
	banim_frame_oam 0x0, 0x4000, 0x40, -10, 0
	banim_frame_oam 0x8000, 0x0, 0x42, 6, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_21_r:
	banim_frame_affine 221, 127, -127, 221, 1
	banim_frame_oam 0x0, 0x4000, 0x6, -25, -22
	banim_frame_oam 0x0, 0x4000, 0x8, -9, -22
	banim_frame_oam 0x4000, 0x0, 0x48, -9, -6
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -16
	banim_frame_oam 0x0, 0x0, 0x2, 8, -16
	banim_frame_oam 0x0, 0x0, 0x69, -5, -24
	banim_frame_oam 0x100, 0x4000, 0x46, 0, -8
	banim_frame_oam 0x0, 0x0, 0x68, 12, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -11, -8
	banim_frame_oam 0x0, 0x0, 0x22, 5, -8
	banim_frame_oam 0x0, 0x4000, 0x40, -10, 0
	banim_frame_oam 0x8000, 0x0, 0x42, 6, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_22_r:
	banim_frame_affine 87, 240, -240, 87, 1
	banim_frame_oam 0x0, 0x4000, 0xA, -9, -6
	banim_frame_oam 0x0, 0x4000, 0x4A, -25, -6
	banim_frame_oam 0x0, 0x0, 0xC, -1, -14
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -16
	banim_frame_oam 0x0, 0x0, 0x2, 8, -16
	banim_frame_oam 0x0, 0x0, 0x69, -5, -24
	banim_frame_oam 0x100, 0x4000, 0x46, -2, -4
	banim_frame_oam 0x0, 0x0, 0x68, 12, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -11, -8
	banim_frame_oam 0x0, 0x0, 0x22, 5, -8
	banim_frame_oam 0x0, 0x4000, 0x40, -10, 0
	banim_frame_oam 0x8000, 0x0, 0x42, 6, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0x25, 1, -4
	banim_frame_oam 0x0, 0x0, 0x45, 3, 4
	banim_frame_oam 0x8000, 0x8000, 0x3, -24, -20
	banim_frame_oam 0x0, 0x0, 0x5, -8, -20
	banim_frame_oam 0x0, 0x0, 0x65, -8, 4
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -16
	banim_frame_oam 0x0, 0x0, 0x2, 8, -16
	banim_frame_oam 0x0, 0x0, 0x69, -5, -24
	banim_frame_oam 0x0, 0x0, 0x68, 12, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -11, -8
	banim_frame_oam 0x0, 0x0, 0x22, 5, -8
	banim_frame_oam 0x0, 0x4000, 0x40, -10, 0
	banim_frame_oam 0x8000, 0x0, 0x42, 6, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x4000, 0x6, -24, -21
	banim_frame_oam 0x0, 0x4000, 0x8, -8, -21
	banim_frame_oam 0x4000, 0x0, 0x48, -8, -5
	banim_frame_oam 0x0, 0x0, 0x25, 1, -3
	banim_frame_oam 0x0, 0x0, 0x45, 3, 5
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -16
	banim_frame_oam 0x0, 0x0, 0x2, 8, -16
	banim_frame_oam 0x0, 0x0, 0x69, -5, -24
	banim_frame_oam 0x0, 0x0, 0x68, 12, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -11, -8
	banim_frame_oam 0x0, 0x0, 0x22, 5, -8
	banim_frame_oam 0x0, 0x4000, 0x40, -10, 0
	banim_frame_oam 0x8000, 0x0, 0x42, 6, 0
	banim_frame_end
banim_arcm_ar1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x4000, 0x4A, -24, -3
	banim_frame_oam 0x0, 0x4000, 0xA, -8, -3
	banim_frame_oam 0x0, 0x0, 0xC, 0, -11
	banim_frame_oam 0x0, 0x0, 0x25, 1, -3
	banim_frame_oam 0x0, 0x0, 0x45, 3, 5
	banim_frame_oam 0x4000, 0x0, 0x0, -8, -16
	banim_frame_oam 0x0, 0x0, 0x2, 8, -16
	banim_frame_oam 0x0, 0x0, 0x69, -5, -24
	banim_frame_oam 0x0, 0x0, 0x68, 12, -24
	banim_frame_oam 0x4000, 0x0, 0x20, -11, -8
	banim_frame_oam 0x0, 0x0, 0x22, 5, -8
	banim_frame_oam 0x0, 0x4000, 0x40, -10, 0
	banim_frame_oam 0x8000, 0x0, 0x42, 6, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_arcm_ar1_script:
banim_arcm_ar1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 1, banim_arcm_ar1_oam_frame_1_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 2, banim_arcm_ar1_oam_frame_2_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 3, banim_arcm_ar1_oam_frame_3_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 4, banim_arcm_ar1_oam_frame_4_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 5, banim_arcm_ar1_oam_frame_5_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 6, banim_arcm_ar1_oam_frame_6_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 7, banim_arcm_ar1_oam_frame_7_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 8, banim_arcm_ar1_oam_frame_8_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 9, banim_arcm_ar1_oam_frame_9_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 10, banim_arcm_ar1_oam_frame_10_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 11, banim_arcm_ar1_oam_frame_11_r - banim_arcm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 12, banim_arcm_ar1_oam_frame_12_r - banim_arcm_ar1_oam_r
	banim_code_frame 20, banim_arcm_ar1_sheet_0, 13, banim_arcm_ar1_oam_frame_13_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_1, 14, banim_arcm_ar1_oam_frame_14_r - banim_arcm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_arcm_ar1_sheet_1, 15, banim_arcm_ar1_oam_frame_15_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 16, banim_arcm_ar1_oam_frame_16_r - banim_arcm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcm_ar1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 1, banim_arcm_ar1_oam_frame_1_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 2, banim_arcm_ar1_oam_frame_2_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 3, banim_arcm_ar1_oam_frame_3_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 4, banim_arcm_ar1_oam_frame_4_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 5, banim_arcm_ar1_oam_frame_5_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 6, banim_arcm_ar1_oam_frame_6_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 7, banim_arcm_ar1_oam_frame_7_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 8, banim_arcm_ar1_oam_frame_8_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 9, banim_arcm_ar1_oam_frame_9_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 10, banim_arcm_ar1_oam_frame_10_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 11, banim_arcm_ar1_oam_frame_11_r - banim_arcm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 12, banim_arcm_ar1_oam_frame_12_r - banim_arcm_ar1_oam_r
	banim_code_frame 20, banim_arcm_ar1_sheet_0, 13, banim_arcm_ar1_oam_frame_13_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_1, 14, banim_arcm_ar1_oam_frame_14_r - banim_arcm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_arcm_ar1_sheet_1, 15, banim_arcm_ar1_oam_frame_15_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 16, banim_arcm_ar1_oam_frame_16_r - banim_arcm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcm_ar1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 1, banim_arcm_ar1_oam_frame_1_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 2, banim_arcm_ar1_oam_frame_2_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 3, banim_arcm_ar1_oam_frame_3_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 4, banim_arcm_ar1_oam_frame_4_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 5, banim_arcm_ar1_oam_frame_5_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 6, banim_arcm_ar1_oam_frame_6_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 7, banim_arcm_ar1_oam_frame_7_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 8, banim_arcm_ar1_oam_frame_8_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 9, banim_arcm_ar1_oam_frame_9_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 10, banim_arcm_ar1_oam_frame_10_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 11, banim_arcm_ar1_oam_frame_11_r - banim_arcm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 12, banim_arcm_ar1_oam_frame_12_r - banim_arcm_ar1_oam_r
	banim_code_frame 20, banim_arcm_ar1_sheet_0, 13, banim_arcm_ar1_oam_frame_13_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_1, 14, banim_arcm_ar1_oam_frame_14_r - banim_arcm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_arcm_ar1_sheet_1, 15, banim_arcm_ar1_oam_frame_15_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 16, banim_arcm_ar1_oam_frame_16_r - banim_arcm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcm_ar1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 1, banim_arcm_ar1_oam_frame_1_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 2, banim_arcm_ar1_oam_frame_2_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 3, banim_arcm_ar1_oam_frame_3_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 4, banim_arcm_ar1_oam_frame_4_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 5, banim_arcm_ar1_oam_frame_5_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 6, banim_arcm_ar1_oam_frame_6_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 7, banim_arcm_ar1_oam_frame_7_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 8, banim_arcm_ar1_oam_frame_8_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 9, banim_arcm_ar1_oam_frame_9_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 10, banim_arcm_ar1_oam_frame_10_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 11, banim_arcm_ar1_oam_frame_11_r - banim_arcm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 12, banim_arcm_ar1_oam_frame_12_r - banim_arcm_ar1_oam_r
	banim_code_frame 20, banim_arcm_ar1_sheet_0, 13, banim_arcm_ar1_oam_frame_13_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_1, 14, banim_arcm_ar1_oam_frame_14_r - banim_arcm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_arcm_ar1_sheet_1, 15, banim_arcm_ar1_oam_frame_15_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 16, banim_arcm_ar1_oam_frame_16_r - banim_arcm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcm_ar1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x53
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 1, banim_arcm_ar1_oam_frame_1_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 2, banim_arcm_ar1_oam_frame_2_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 3, banim_arcm_ar1_oam_frame_3_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 4, banim_arcm_ar1_oam_frame_4_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 5, banim_arcm_ar1_oam_frame_5_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 6, banim_arcm_ar1_oam_frame_6_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 7, banim_arcm_ar1_oam_frame_7_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 8, banim_arcm_ar1_oam_frame_8_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 9, banim_arcm_ar1_oam_frame_9_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 10, banim_arcm_ar1_oam_frame_10_r - banim_arcm_ar1_oam_r
	banim_code_frame 3, banim_arcm_ar1_sheet_0, 11, banim_arcm_ar1_oam_frame_11_r - banim_arcm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_arcm_ar1_sheet_0, 12, banim_arcm_ar1_oam_frame_12_r - banim_arcm_ar1_oam_r
	banim_code_frame 20, banim_arcm_ar1_sheet_0, 13, banim_arcm_ar1_oam_frame_13_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_1, 14, banim_arcm_ar1_oam_frame_14_r - banim_arcm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_arcm_ar1_sheet_1, 15, banim_arcm_ar1_oam_frame_15_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 16, banim_arcm_ar1_oam_frame_16_r - banim_arcm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcm_ar1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x53
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_frame 4, banim_arcm_ar1_sheet_1, 17, banim_arcm_ar1_oam_frame_17_r - banim_arcm_ar1_oam_r
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 18, banim_arcm_ar1_oam_frame_18_r - banim_arcm_ar1_oam_r
	banim_code_frame 50, banim_arcm_ar1_sheet_1, 19, banim_arcm_ar1_oam_frame_19_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_1, 17, banim_arcm_ar1_oam_frame_17_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 1, banim_arcm_ar1_oam_frame_1_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 2, banim_arcm_ar1_oam_frame_2_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 3, banim_arcm_ar1_oam_frame_3_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 4, banim_arcm_ar1_oam_frame_4_r - banim_arcm_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_arcm_ar1_sheet_2, 22, banim_arcm_ar1_oam_frame_20_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_2, 23, banim_arcm_ar1_oam_frame_21_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_2, 24, banim_arcm_ar1_oam_frame_22_r - banim_arcm_ar1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_arcm_ar1_sheet_2, 25, banim_arcm_ar1_oam_frame_23_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_2, 26, banim_arcm_ar1_oam_frame_24_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_2, 27, banim_arcm_ar1_oam_frame_25_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 10, banim_arcm_ar1_oam_frame_10_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 11, banim_arcm_ar1_oam_frame_11_r - banim_arcm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 6, banim_arcm_ar1_sheet_0, 12, banim_arcm_ar1_oam_frame_12_r - banim_arcm_ar1_oam_r
	banim_code_frame 25, banim_arcm_ar1_sheet_0, 13, banim_arcm_ar1_oam_frame_13_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_1, 14, banim_arcm_ar1_oam_frame_14_r - banim_arcm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_arcm_ar1_sheet_1, 15, banim_arcm_ar1_oam_frame_15_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 16, banim_arcm_ar1_oam_frame_16_r - banim_arcm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcm_ar1_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 20, banim_arcm_ar1_oam_frame_26_r - banim_arcm_ar1_oam_r
	banim_code_frame 1, banim_arcm_ar1_sheet_1, 21, banim_arcm_ar1_oam_frame_27_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 20, banim_arcm_ar1_oam_frame_26_r - banim_arcm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcm_ar1_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 20, banim_arcm_ar1_oam_frame_26_r - banim_arcm_ar1_oam_r
	banim_code_frame 1, banim_arcm_ar1_sheet_1, 21, banim_arcm_ar1_oam_frame_27_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 20, banim_arcm_ar1_oam_frame_26_r - banim_arcm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_arcm_ar1_mode_stand_close:
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcm_ar1_mode_stand:
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcm_ar1_mode_stand_range:
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_arcm_ar1_mode_attack_miss:
	banim_code_85 0x53
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_arcm_ar1_sheet_0, 0, banim_arcm_ar1_oam_frame_0_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 1, banim_arcm_ar1_oam_frame_1_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 2, banim_arcm_ar1_oam_frame_2_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 3, banim_arcm_ar1_oam_frame_3_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 4, banim_arcm_ar1_oam_frame_4_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 5, banim_arcm_ar1_oam_frame_5_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 6, banim_arcm_ar1_oam_frame_6_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 7, banim_arcm_ar1_oam_frame_7_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 8, banim_arcm_ar1_oam_frame_8_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 9, banim_arcm_ar1_oam_frame_9_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_0, 10, banim_arcm_ar1_oam_frame_10_r - banim_arcm_ar1_oam_r
	banim_code_frame 3, banim_arcm_ar1_sheet_0, 11, banim_arcm_ar1_oam_frame_11_r - banim_arcm_ar1_oam_r
	banim_code_sound_pull_bow
	banim_code_frame 5, banim_arcm_ar1_sheet_0, 12, banim_arcm_ar1_oam_frame_12_r - banim_arcm_ar1_oam_r
	banim_code_frame 20, banim_arcm_ar1_sheet_0, 13, banim_arcm_ar1_oam_frame_13_r - banim_arcm_ar1_oam_r
	banim_code_frame 2, banim_arcm_ar1_sheet_1, 14, banim_arcm_ar1_oam_frame_14_r - banim_arcm_ar1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_arcm_ar1_sheet_1, 15, banim_arcm_ar1_oam_frame_15_r - banim_arcm_ar1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_arcm_ar1_sheet_1, 16, banim_arcm_ar1_oam_frame_16_r - banim_arcm_ar1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_arcm_ar1_mode_attack_close - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_attack_close_back - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_attack_close_critical - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_attack_close_critical_back - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_attack_range - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_attack_range_critical - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_dodge_close - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_dodge_range - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_stand_close - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_stand - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_stand_range - banim_arcm_ar1_script
	.word banim_arcm_ar1_mode_attack_miss - banim_arcm_ar1_script
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

