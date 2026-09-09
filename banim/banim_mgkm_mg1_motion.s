@ vim:ft=armv4
	.global banim_mgkm_mg1_script
	.global banim_mgkm_mg1_oam_r
	.global banim_mgkm_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x70
	.section .data.oam_l
banim_mgkm_mg1_oam_l:
banim_mgkm_mg1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0xA2, -9, -32
	banim_frame_oam 0x0, 0x5000, 0xA3, -5, -16
	banim_frame_oam 0x4000, 0x1000, 0xE3, -5, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, 9, -8
	banim_frame_oam 0x4000, 0x1000, 0xF0, 1, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x5000, 0x19, -7, -34
	banim_frame_oam 0x4000, 0x1000, 0x59, -7, -18
	banim_frame_oam 0x8000, 0x1000, 0x38, 9, -26
	banim_frame_oam 0x8000, 0x1000, 0xD2, -1, -10
	banim_frame_oam 0x4000, 0x1000, 0x13, 3, 8
	banim_frame_oam 0x4000, 0x9000, 0x33, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x37, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x73, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x77, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0x15, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x17, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x86, -13, 8
	banim_frame_oam 0x0, 0x1000, 0x88, -21, 8
	banim_frame_oam 0x8000, 0x1000, 0xD3, 9, -7
	banim_frame_oam 0x4000, 0x1000, 0x92, 1, -15
	banim_frame_end
banim_mgkm_mg1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x5000, 0x1C, -10, -33
	banim_frame_oam 0x4000, 0x1000, 0x5C, -10, -17
	banim_frame_oam 0x8000, 0x1000, 0x3B, 6, -25
	banim_frame_oam 0x8000, 0x1000, 0xD2, -2, -9
	banim_frame_oam 0x4000, 0x1000, 0x78, -16, -23
	banim_frame_oam 0x0, 0x1000, 0x7A, -24, -23
	banim_frame_oam 0x0, 0x9000, 0x94, -23, -15
	banim_frame_oam 0x0, 0x1000, 0x18, 9, 9
	banim_frame_oam 0x4000, 0x1000, 0x90, 0, -15
	banim_frame_oam 0x8000, 0x1000, 0xB0, 8, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x5000, 0x1C, -10, -33
	banim_frame_oam 0x4000, 0x1000, 0x5C, -10, -17
	banim_frame_oam 0x8000, 0x1000, 0x3B, 6, -25
	banim_frame_oam 0x8000, 0x1000, 0xD2, -2, -9
	banim_frame_oam 0x4000, 0x1000, 0x78, -16, -23
	banim_frame_oam 0x0, 0x1000, 0x7A, -24, -23
	banim_frame_oam 0x0, 0x9000, 0x98, -23, -15
	banim_frame_oam 0x8000, 0x1000, 0xB0, 8, -7
	banim_frame_oam 0x4000, 0x1000, 0x90, 0, -15
	banim_frame_end
banim_mgkm_mg1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0x1C, -16, -30
	banim_frame_oam 0x4000, 0x1000, 0x5C, -16, -14
	banim_frame_oam 0x8000, 0x1000, 0x3B, 0, -22
	banim_frame_oam 0x8000, 0x1000, 0xD2, -8, -6
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x8000, 0x1000, 0x1E, -1, -15
	banim_frame_end
banim_mgkm_mg1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0x5E, -16, -31
	banim_frame_oam 0x4000, 0x1000, 0x9E, -16, -15
	banim_frame_oam 0x8000, 0x1000, 0x7D, 0, -23
	banim_frame_oam 0x8000, 0x1000, 0xDD, -9, -7
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x8000, 0x1000, 0xB1, 2, -7
	banim_frame_oam 0x4000, 0x1000, 0xF0, -6, -15
	banim_frame_end
banim_mgkm_mg1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0x7, -8, -31
	banim_frame_oam 0x8000, 0x1000, 0x9, -16, -31
	banim_frame_oam 0x4000, 0x1000, 0x47, -8, -15
	banim_frame_oam 0x0, 0x1000, 0x49, -16, -15
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x5000, 0xA, -8, -31
	banim_frame_oam 0x8000, 0x1000, 0xC, -16, -31
	banim_frame_oam 0x4000, 0x1000, 0x4A, -8, -15
	banim_frame_oam 0x0, 0x1000, 0x4C, -16, -15
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x8000, 0x1000, 0xF, -12, -31
	banim_frame_oam 0x0, 0x1000, 0x4F, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x10, -20, -23
	banim_frame_oam 0x0, 0x5000, 0xD, -4, -31
	banim_frame_oam 0x4000, 0x1000, 0x4D, -4, -15
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x1000, 0x13, -20, -24
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x0, -26, -28
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x1000, 0x13, -20, -24
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x1, -26, -28
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x1000, 0x13, -20, -24
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0xE1, -22, -32
	banim_frame_oam 0x0, 0x0, 0xE1, -30, -32
	banim_frame_oam 0x0, 0x3000, 0xE1, -22, -24
	banim_frame_oam 0x0, 0x2000, 0xE1, -30, -24
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x1000, 0x13, -20, -24
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0xE0, -22, -32
	banim_frame_oam 0x0, 0x3000, 0xE0, -22, -24
	banim_frame_oam 0x0, 0x0, 0xE0, -30, -32
	banim_frame_oam 0x0, 0x2000, 0xE0, -30, -24
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x1000, 0x13, -20, -24
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -32
	banim_frame_oam 0x0, 0x1000, 0xA1, -22, -40
	banim_frame_oam 0x4000, 0x3000, 0xC0, -22, -24
	banim_frame_oam 0x0, 0x3000, 0xA1, -22, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, -38, -32
	banim_frame_oam 0x0, 0x0, 0xA1, -30, -40
	banim_frame_oam 0x4000, 0x2000, 0xC0, -38, -24
	banim_frame_oam 0x0, 0x2000, 0xA1, -30, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x1000, 0x13, -20, -24
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_45_l:
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x0, 0x1000, 0x33, -20, -23
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -32
	banim_frame_oam 0x0, 0x1000, 0xA1, -22, -40
	banim_frame_oam 0x4000, 0x3000, 0xC0, -22, -24
	banim_frame_oam 0x0, 0x3000, 0xA1, -22, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, -38, -32
	banim_frame_oam 0x0, 0x0, 0xA1, -30, -40
	banim_frame_oam 0x4000, 0x2000, 0xC0, -38, -24
	banim_frame_oam 0x0, 0x2000, 0xA1, -30, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_46_l:
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x0, 0x1000, 0x33, -20, -23
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_47_l:
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x53, -20, -25
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -32
	banim_frame_oam 0x0, 0x1000, 0xA1, -22, -40
	banim_frame_oam 0x4000, 0x3000, 0xC0, -22, -24
	banim_frame_oam 0x0, 0x3000, 0xA1, -22, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, -38, -32
	banim_frame_oam 0x0, 0x0, 0xA1, -30, -40
	banim_frame_oam 0x4000, 0x2000, 0xC0, -38, -24
	banim_frame_oam 0x0, 0x2000, 0xA1, -30, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_48_l:
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x53, -20, -25
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x1000, 0x14, -20, -25
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x4000, 0x1000, 0xC0, -22, -36
	banim_frame_oam 0x0, 0x1000, 0xA1, -22, -44
	banim_frame_oam 0x4000, 0x3000, 0xC0, -22, -28
	banim_frame_oam 0x0, 0x3000, 0xA1, -22, -20
	banim_frame_oam 0x4000, 0x0, 0xC0, -38, -36
	banim_frame_oam 0x0, 0x0, 0xA1, -30, -44
	banim_frame_oam 0x4000, 0x2000, 0xC0, -38, -28
	banim_frame_oam 0x0, 0x2000, 0xA1, -30, -20
	banim_frame_end
banim_mgkm_mg1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x0, 0x1000, 0x14, -20, -25
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x34, -20, -27
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x4000, 0x1000, 0xC0, -19, -43
	banim_frame_oam 0x0, 0x1000, 0xA1, -19, -51
	banim_frame_oam 0x4000, 0x3000, 0xC0, -19, -35
	banim_frame_oam 0x0, 0x3000, 0xA1, -19, -27
	banim_frame_oam 0x4000, 0x0, 0xC0, -35, -43
	banim_frame_oam 0x0, 0x0, 0xA1, -27, -51
	banim_frame_oam 0x4000, 0x2000, 0xC0, -35, -35
	banim_frame_oam 0x0, 0x2000, 0xA1, -27, -27
	banim_frame_end
banim_mgkm_mg1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x34, -20, -27
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_53_l:
	banim_frame_oam 0x4000, 0x1000, 0xC0, -8, -50
	banim_frame_oam 0x0, 0x1000, 0xA1, -8, -58
	banim_frame_oam 0x4000, 0x3000, 0xC0, -8, -42
	banim_frame_oam 0x0, 0x3000, 0xA1, -8, -34
	banim_frame_oam 0x4000, 0x0, 0xC0, -24, -50
	banim_frame_oam 0x0, 0x0, 0xA1, -16, -58
	banim_frame_oam 0x4000, 0x2000, 0xC0, -24, -42
	banim_frame_oam 0x0, 0x2000, 0xA1, -16, -34
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_54_l:
	banim_frame_oam 0x0, 0x5000, 0xA2, 0, -58
	banim_frame_oam 0x8000, 0x1000, 0xA4, -8, -58
	banim_frame_oam 0x4000, 0x1000, 0xE3, -24, -46
	banim_frame_oam 0x0, 0x1000, 0xE2, -16, -54
	banim_frame_oam 0x4000, 0x1000, 0xC0, -8, -50
	banim_frame_oam 0x0, 0x1000, 0xA1, -8, -58
	banim_frame_oam 0x4000, 0x3000, 0xC0, -8, -42
	banim_frame_oam 0x0, 0x3000, 0xA1, -8, -34
	banim_frame_oam 0x4000, 0x0, 0xC0, -24, -50
	banim_frame_oam 0x0, 0x0, 0xA1, -16, -58
	banim_frame_oam 0x4000, 0x2000, 0xC0, -24, -42
	banim_frame_oam 0x0, 0x2000, 0xA1, -16, -34
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_55_l:
	banim_frame_oam 0x0, 0x5000, 0xA2, 0, -58
	banim_frame_oam 0x8000, 0x1000, 0xA4, -8, -58
	banim_frame_oam 0x4000, 0x1000, 0xE3, -24, -46
	banim_frame_oam 0x0, 0x1000, 0xE2, -16, -54
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_56_l:
	banim_frame_oam 0x4000, 0x1000, 0x65, -4, -58
	banim_frame_oam 0x0, 0x1000, 0x67, -12, -58
	banim_frame_oam 0x4000, 0x1000, 0x85, -21, -50
	banim_frame_oam 0x4000, 0x1000, 0x87, -29, -42
	banim_frame_oam 0x0, 0x1000, 0x68, -29, -34
	banim_frame_oam 0x8000, 0x1000, 0xC5, -16, -58
	banim_frame_oam 0x0, 0x1000, 0xE6, -24, -50
	banim_frame_oam 0x8000, 0x0, 0xC5, -8, -58
	banim_frame_oam 0x0, 0x0, 0xE6, 0, -50
	banim_frame_oam 0x8000, 0x3000, 0xC5, -16, -42
	banim_frame_oam 0x0, 0x3000, 0xE6, -24, -42
	banim_frame_oam 0x8000, 0x2000, 0xC5, -8, -42
	banim_frame_oam 0x0, 0x2000, 0xE6, 0, -42
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_57_l:
	banim_frame_oam 0x4000, 0x1000, 0x65, -4, -58
	banim_frame_oam 0x0, 0x1000, 0x67, -12, -58
	banim_frame_oam 0x4000, 0x1000, 0x85, -21, -50
	banim_frame_oam 0x4000, 0x1000, 0x87, -29, -42
	banim_frame_oam 0x0, 0x1000, 0x68, -29, -34
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_58_l:
	banim_frame_oam 0x4000, 0x1000, 0xA5, -8, -42
	banim_frame_oam 0x0, 0x1000, 0xC6, -8, -34
	banim_frame_oam 0x4000, 0x3000, 0xA5, -8, -50
	banim_frame_oam 0x0, 0x3000, 0xC6, -8, -58
	banim_frame_oam 0x4000, 0x0, 0xA5, -24, -42
	banim_frame_oam 0x0, 0x0, 0xC6, -16, -34
	banim_frame_oam 0x4000, 0x2000, 0xA5, -24, -50
	banim_frame_oam 0x0, 0x2000, 0xC6, -16, -58
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x8000, 0x1000, 0x6A, -27, -42
	banim_frame_oam 0x0, 0x1000, 0x89, -19, -34
	banim_frame_oam 0x0, 0x1000, 0x69, -11, -34
	banim_frame_oam 0x8000, 0x1000, 0xA9, 5, -58
	banim_frame_oam 0x0, 0x1000, 0xCA, -3, -50
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_59_l:
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x8000, 0x1000, 0x6A, -27, -42
	banim_frame_oam 0x0, 0x1000, 0x89, -19, -34
	banim_frame_oam 0x0, 0x1000, 0x69, -11, -34
	banim_frame_oam 0x8000, 0x1000, 0xA9, 5, -58
	banim_frame_oam 0x0, 0x1000, 0xCA, -3, -50
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_60_l:
	banim_frame_oam 0x0, 0x4000, 0xA2, -33, -59
	banim_frame_oam 0x8000, 0x0, 0xA4, -17, -59
	banim_frame_oam 0x4000, 0x0, 0xE3, -9, -47
	banim_frame_oam 0x0, 0x0, 0xE2, -9, -55
	banim_frame_oam 0x4000, 0x1000, 0xA7, -8, -42
	banim_frame_oam 0x0, 0x1000, 0xC8, -8, -34
	banim_frame_oam 0x4000, 0x3000, 0xA7, -8, -50
	banim_frame_oam 0x0, 0x3000, 0xC8, -8, -58
	banim_frame_oam 0x4000, 0x0, 0xA7, -24, -42
	banim_frame_oam 0x0, 0x0, 0xC8, -16, -34
	banim_frame_oam 0x4000, 0x2000, 0xA7, -24, -50
	banim_frame_oam 0x0, 0x2000, 0xC8, -16, -58
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_61_l:
	banim_frame_oam 0x0, 0x4000, 0xA2, -33, -59
	banim_frame_oam 0x8000, 0x0, 0xA4, -17, -59
	banim_frame_oam 0x4000, 0x0, 0xE3, -9, -47
	banim_frame_oam 0x0, 0x0, 0xE2, -9, -55
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_62_l:
	banim_frame_oam 0x4000, 0x0, 0x65, -27, -59
	banim_frame_oam 0x0, 0x0, 0x67, -11, -59
	banim_frame_oam 0x4000, 0x0, 0x85, -10, -51
	banim_frame_oam 0x4000, 0x0, 0x87, -2, -43
	banim_frame_oam 0x0, 0x0, 0x68, 6, -35
	banim_frame_oam 0x4000, 0x1000, 0xE9, -8, -50
	banim_frame_oam 0x0, 0x1000, 0xAA, -8, -58
	banim_frame_oam 0x4000, 0x0, 0xE9, -24, -50
	banim_frame_oam 0x0, 0x0, 0xAA, -16, -58
	banim_frame_oam 0x4000, 0x3000, 0xE9, -8, -42
	banim_frame_oam 0x0, 0x3000, 0xAA, -8, -34
	banim_frame_oam 0x4000, 0x2000, 0xE9, -24, -42
	banim_frame_oam 0x0, 0x2000, 0xAA, -16, -34
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_63_l:
	banim_frame_oam 0x4000, 0x0, 0x65, -27, -59
	banim_frame_oam 0x0, 0x0, 0x67, -11, -59
	banim_frame_oam 0x4000, 0x0, 0x85, -10, -51
	banim_frame_oam 0x4000, 0x0, 0x87, -2, -43
	banim_frame_oam 0x0, 0x0, 0x68, 6, -35
	banim_frame_oam 0x0, 0x5000, 0x16, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x4000, 0x1000, 0x56, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_64_l:
	banim_frame_oam 0x4000, 0x1000, 0xA5, -8, -42
	banim_frame_oam 0x0, 0x1000, 0xC6, -8, -34
	banim_frame_oam 0x4000, 0x3000, 0xA5, -8, -50
	banim_frame_oam 0x0, 0x3000, 0xC6, -8, -58
	banim_frame_oam 0x4000, 0x0, 0xA5, -24, -42
	banim_frame_oam 0x0, 0x0, 0xC6, -16, -34
	banim_frame_oam 0x4000, 0x2000, 0xA5, -24, -50
	banim_frame_oam 0x0, 0x2000, 0xC6, -16, -58
	banim_frame_oam 0x0, 0x5000, 0x19, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x8000, 0x0, 0x6A, 4, -41
	banim_frame_oam 0x0, 0x0, 0x89, -4, -33
	banim_frame_oam 0x0, 0x0, 0x69, -12, -33
	banim_frame_oam 0x8000, 0x0, 0xA9, -28, -57
	banim_frame_oam 0x0, 0x0, 0xCA, -20, -49
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_65_l:
	banim_frame_oam 0x0, 0x5000, 0x19, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x8000, 0x0, 0x6A, 4, -41
	banim_frame_oam 0x0, 0x0, 0x89, -4, -33
	banim_frame_oam 0x0, 0x0, 0x69, -12, -33
	banim_frame_oam 0x8000, 0x0, 0xA9, -28, -57
	banim_frame_oam 0x0, 0x0, 0xCA, -20, -49
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_67_l:
	banim_frame_oam 0x8000, 0x1000, 0x1A, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -3, -39
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_66_l:
	banim_frame_oam 0x4000, 0x1000, 0xA7, -8, -42
	banim_frame_oam 0x0, 0x1000, 0xC8, -8, -34
	banim_frame_oam 0x4000, 0x3000, 0xA7, -8, -50
	banim_frame_oam 0x0, 0x3000, 0xC8, -8, -58
	banim_frame_oam 0x4000, 0x0, 0xA7, -24, -42
	banim_frame_oam 0x0, 0x0, 0xC8, -16, -34
	banim_frame_oam 0x4000, 0x2000, 0xA7, -24, -50
	banim_frame_oam 0x0, 0x2000, 0xC8, -16, -58
	banim_frame_oam 0x8000, 0x1000, 0x1A, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -3, -39
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_69_l:
	banim_frame_oam 0x4000, 0x1000, 0xC0, -8, -50
	banim_frame_oam 0x0, 0x1000, 0xA1, -8, -58
	banim_frame_oam 0x4000, 0x3000, 0xC0, -8, -42
	banim_frame_oam 0x0, 0x3000, 0xA1, -8, -34
	banim_frame_oam 0x4000, 0x0, 0xC0, -24, -50
	banim_frame_oam 0x0, 0x0, 0xA1, -16, -58
	banim_frame_oam 0x4000, 0x2000, 0xC0, -24, -42
	banim_frame_oam 0x0, 0x2000, 0xA1, -16, -34
	banim_frame_oam 0x8000, 0x1000, 0x1A, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -3, -39
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_70_l:
	banim_frame_oam 0x8000, 0x1000, 0x1A, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -3, -39
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x0, 0xE0, -16, -50
	banim_frame_oam 0x0, 0x1000, 0xE0, -8, -50
	banim_frame_oam 0x0, 0x3000, 0xE0, -8, -42
	banim_frame_oam 0x0, 0x2000, 0xE0, -16, -42
	banim_frame_end
banim_mgkm_mg1_oam_frame_71_l:
	banim_frame_oam 0x8000, 0x1000, 0x1A, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -3, -39
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0xE1, -8, -50
	banim_frame_oam 0x0, 0x0, 0xE1, -16, -50
	banim_frame_oam 0x0, 0x3000, 0xE1, -8, -42
	banim_frame_oam 0x0, 0x2000, 0xE1, -16, -42
	banim_frame_end
banim_mgkm_mg1_oam_frame_72_l:
	banim_frame_oam 0x8000, 0x1000, 0x1A, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -3, -39
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x1, -12, -47
	banim_frame_end
banim_mgkm_mg1_oam_frame_73_l:
	banim_frame_oam 0x8000, 0x1000, 0x1A, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -3, -39
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x0, -12, -47
	banim_frame_end
banim_mgkm_mg1_oam_frame_68_l:
	banim_frame_oam 0x8000, 0x1000, 0x1A, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x0, 0x1000, 0x58, -3, -39
	banim_frame_oam 0x0, 0x1000, 0x58, -13, -39
	banim_frame_oam 0x8000, 0x1000, 0x18, -20, -31
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_74_l:
	banim_frame_oam 0x0, 0x5000, 0x1C, -12, -39
	banim_frame_oam 0x8000, 0x1000, 0x1E, -20, -39
	banim_frame_oam 0x4000, 0x1000, 0x5C, -12, -23
	banim_frame_oam 0x0, 0x1000, 0x5E, -20, -23
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_75_l:
	banim_frame_oam 0x0, 0x5000, 0x6B, -12, -39
	banim_frame_oam 0x8000, 0x1000, 0x6D, -20, -39
	banim_frame_oam 0x4000, 0x1000, 0xAB, -12, -23
	banim_frame_oam 0x0, 0x1000, 0xAD, -20, -23
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x6E, 4, -31
	banim_frame_oam 0x0, 0x1000, 0x6F, -4, -39
	banim_frame_oam 0x0, 0x5000, 0x8E, -12, -31
	banim_frame_oam 0x8000, 0x1000, 0x90, -20, -33
	banim_frame_oam 0x0, 0x1000, 0x50, 4, -18
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_76_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0x51, -12, -15
	banim_frame_oam 0x0, 0x1000, 0x13, -20, -24
	banim_frame_oam 0x8000, 0x1000, 0x30, 4, -26
	banim_frame_oam 0x8000, 0x1000, 0x26, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x2, -22, -23
	banim_frame_oam 0x0, 0x1000, 0x4, -30, -23
	banim_frame_oam 0x0, 0x9000, 0x20, -22, -15
	banim_frame_oam 0x8000, 0x5000, 0x24, -30, -15
	banim_frame_oam 0x4000, 0x1000, 0x5, -6, -15
	banim_frame_oam 0x8000, 0x1000, 0x25, 2, -7
	banim_frame_oam 0x0, 0x1000, 0x3F, -17, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_77_l:
	banim_frame_oam 0x0, 0x5000, 0x1C, -10, -33
	banim_frame_oam 0x4000, 0x1000, 0x5C, -10, -17
	banim_frame_oam 0x8000, 0x1000, 0x3B, 6, -25
	banim_frame_oam 0x8000, 0x1000, 0xD2, -2, -9
	banim_frame_oam 0x0, 0x9000, 0x98, -23, -15
	banim_frame_oam 0x0, 0x1000, 0x18, 9, 9
	banim_frame_oam 0x4000, 0x1000, 0x78, -16, -23
	banim_frame_oam 0x0, 0x1000, 0x7A, -24, -23
	banim_frame_oam 0x4000, 0x1000, 0x7B, -2, -17
	banim_frame_oam 0x8000, 0x1000, 0x9C, 6, -9
	banim_frame_end
banim_mgkm_mg1_oam_frame_78_l:
	banim_frame_oam 0x0, 0x5000, 0x1C, -10, -33
	banim_frame_oam 0x4000, 0x1000, 0x5C, -10, -17
	banim_frame_oam 0x8000, 0x1000, 0x3B, 6, -25
	banim_frame_oam 0x8000, 0x1000, 0xD2, -2, -9
	banim_frame_oam 0x0, 0x9000, 0x94, -23, -15
	banim_frame_oam 0x0, 0x1000, 0x18, 9, 9
	banim_frame_oam 0x4000, 0x1000, 0x78, -16, -23
	banim_frame_oam 0x0, 0x1000, 0x7A, -24, -23
	banim_frame_oam 0x4000, 0x1000, 0x7B, -2, -17
	banim_frame_oam 0x8000, 0x1000, 0x9C, 6, -9
	banim_frame_end
banim_mgkm_mg1_oam_frame_79_l:
	banim_frame_oam 0x0, 0x5000, 0x1C, -10, -32
	banim_frame_oam 0x4000, 0x1000, 0x5C, -10, -16
	banim_frame_oam 0x8000, 0x1000, 0x3B, 6, -24
	banim_frame_oam 0x8000, 0x1000, 0xD2, -2, -8
	banim_frame_oam 0x4000, 0x1000, 0x13, 3, 9
	banim_frame_oam 0x4000, 0x9000, 0x33, -16, -15
	banim_frame_oam 0x8000, 0x1000, 0x37, -24, -15
	banim_frame_oam 0x4000, 0x5000, 0x73, -16, 1
	banim_frame_oam 0x0, 0x1000, 0x77, -24, 1
	banim_frame_oam 0x4000, 0x1000, 0x15, -16, -23
	banim_frame_oam 0x0, 0x1000, 0x17, -24, -23
	banim_frame_oam 0x4000, 0x1000, 0x86, -10, 9
	banim_frame_oam 0x0, 0x1000, 0x88, -18, 9
	banim_frame_oam 0x4000, 0x1000, 0x7B, -1, -17
	banim_frame_oam 0x8000, 0x1000, 0x9C, 7, -9
	banim_frame_end
banim_mgkm_mg1_oam_frame_80_l:
	banim_frame_oam 0x0, 0x5000, 0x19, -8, -31
	banim_frame_oam 0x4000, 0x1000, 0x59, -8, -15
	banim_frame_oam 0x8000, 0x1000, 0x38, 8, -23
	banim_frame_oam 0x8000, 0x1000, 0xD2, -2, -7
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x7B, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x9C, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_81_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0xA2, -9, -32
	banim_frame_oam 0x0, 0x5000, 0xA3, -5, -16
	banim_frame_oam 0x4000, 0x1000, 0xE3, -5, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x8000, 0x1000, 0xDC, 9, -8
	banim_frame_oam 0x4000, 0x1000, 0xBD, 1, -16
	banim_frame_end
	banim_frame_end
banim_mgkm_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x5E, -9, -32
	banim_frame_oam 0x4000, 0x1000, 0x9E, -9, -16
	banim_frame_oam 0x8000, 0x1000, 0x7D, 7, -24
	banim_frame_oam 0x8000, 0x1000, 0xDD, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x8000, 0x1000, 0xB1, 9, -8
	banim_frame_oam 0x4000, 0x1000, 0xF0, 1, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x7, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0x9, -9, -32
	banim_frame_oam 0x4000, 0x1000, 0x47, -1, -16
	banim_frame_oam 0x0, 0x1000, 0x49, -9, -16
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0xA, -1, -32
	banim_frame_oam 0x8000, 0x1000, 0xC, -9, -32
	banim_frame_oam 0x4000, 0x1000, 0x4A, -1, -16
	banim_frame_oam 0x0, 0x1000, 0x4C, -9, -16
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0x11, -5, -32
	banim_frame_oam 0x4000, 0x1000, 0x51, -5, -16
	banim_frame_oam 0x8000, 0x1000, 0x30, 11, -27
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x0, 0x1000, 0x55, -13, -24
	banim_frame_oam 0x0, 0x1000, 0x3F, -10, -29
	banim_frame_end
banim_mgkm_mg1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0x70, 11, -32
	banim_frame_oam 0x0, 0x5000, 0x71, -5, -32
	banim_frame_oam 0x8000, 0x1000, 0x73, -13, -32
	banim_frame_oam 0x0, 0x1000, 0x50, 11, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x4000, 0x1000, 0x51, -5, -16
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -5, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -13, -32
	banim_frame_oam 0x0, 0x1000, 0x50, 11, -19
	banim_frame_oam 0x4000, 0x1000, 0x51, -5, -16
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0x77, -5, -32
	banim_frame_oam 0x8000, 0x1000, 0x79, -13, -32
	banim_frame_oam 0x0, 0x1000, 0x50, 11, -19
	banim_frame_oam 0x4000, 0x1000, 0x51, -5, -16
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x5000, 0x7B, -5, -32
	banim_frame_oam 0x8000, 0x1000, 0x7D, -13, -32
	banim_frame_oam 0x0, 0x1000, 0x9A, 11, -24
	banim_frame_oam 0x4000, 0x1000, 0x51, -5, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 11, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0xCE, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0xD0, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x0, 0x1000, 0x0, -20, -39
	banim_frame_end
banim_mgkm_mg1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x0, 0x1000, 0x1, -20, -39
	banim_frame_end
banim_mgkm_mg1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x0, 0x1000, 0xE1, -16, -43
	banim_frame_oam 0x0, 0x0, 0xE1, -24, -43
	banim_frame_oam 0x0, 0x3000, 0xE1, -16, -35
	banim_frame_oam 0x0, 0x2000, 0xE1, -24, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x0, 0x1000, 0xE0, -16, -43
	banim_frame_oam 0x0, 0x0, 0xE0, -24, -43
	banim_frame_oam 0x0, 0x3000, 0xE0, -16, -35
	banim_frame_oam 0x0, 0x2000, 0xE0, -24, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x8000, 0x1000, 0xA1, -16, -51
	banim_frame_oam 0x0, 0x1000, 0xC0, -8, -43
	banim_frame_oam 0x8000, 0x3000, 0xA1, -16, -35
	banim_frame_oam 0x0, 0x3000, 0xC0, -8, -35
	banim_frame_oam 0x8000, 0x0, 0xA1, -24, -51
	banim_frame_oam 0x0, 0x0, 0xC0, -32, -43
	banim_frame_oam 0x8000, 0x2000, 0xA1, -24, -35
	banim_frame_oam 0x0, 0x2000, 0xC0, -32, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x8000, 0x1000, 0xC7, -24, -51
	banim_frame_oam 0x0, 0x1000, 0xE8, -32, -43
	banim_frame_oam 0x8000, 0x3000, 0xC7, -24, -35
	banim_frame_oam 0x0, 0x3000, 0xE8, -32, -35
	banim_frame_oam 0x8000, 0x0, 0xC7, -16, -51
	banim_frame_oam 0x0, 0x0, 0xE8, -8, -43
	banim_frame_oam 0x8000, 0x2000, 0xC7, -16, -35
	banim_frame_oam 0x0, 0x2000, 0xE8, -8, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x0, 0x5000, 0xB2, -17, -35
	banim_frame_oam 0x0, 0x1000, 0xB1, -1, -35
	banim_frame_oam 0x8000, 0x1000, 0xD1, -17, -19
	banim_frame_oam 0x0, 0x7000, 0xB2, -17, -50
	banim_frame_oam 0x0, 0x3000, 0xB1, -1, -42
	banim_frame_oam 0x8000, 0x3000, 0xD1, -17, -66
	banim_frame_oam 0x0, 0x4000, 0xB2, -32, -35
	banim_frame_oam 0x0, 0x0, 0xB1, -40, -35
	banim_frame_oam 0x8000, 0x0, 0xD1, -24, -19
	banim_frame_oam 0x0, 0x6000, 0xB2, -32, -50
	banim_frame_oam 0x0, 0x2000, 0xB1, -40, -42
	banim_frame_oam 0x8000, 0x2000, 0xD1, -24, -66
	banim_frame_end
banim_mgkm_mg1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x0, 0x1000, 0xF3, -1, -59
	banim_frame_oam 0x0, 0x5000, 0xD4, -17, -51
	banim_frame_oam 0x0, 0x3000, 0xF3, -1, -19
	banim_frame_oam 0x0, 0x7000, 0xD4, -17, -35
	banim_frame_oam 0x0, 0x0, 0xF3, -41, -59
	banim_frame_oam 0x0, 0x4000, 0xD4, -33, -51
	banim_frame_oam 0x0, 0x2000, 0xF3, -41, -19
	banim_frame_oam 0x0, 0x6000, 0xD4, -33, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x0, 0x5000, 0xD6, -17, -51
	banim_frame_oam 0x0, 0x4000, 0xD6, -33, -51
	banim_frame_oam 0x0, 0x7000, 0xD6, -17, -35
	banim_frame_oam 0x0, 0x6000, 0xD6, -33, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x4000, 0x1000, 0xB4, -17, -35
	banim_frame_oam 0x0, 0x1000, 0xB6, -17, -27
	banim_frame_oam 0x4000, 0x3000, 0xB4, -17, -43
	banim_frame_oam 0x0, 0x3000, 0xB6, -17, -51
	banim_frame_oam 0x4000, 0x0, 0xB4, -33, -35
	banim_frame_oam 0x0, 0x0, 0xB6, -25, -27
	banim_frame_oam 0x4000, 0x2000, 0xB4, -33, -43
	banim_frame_oam 0x0, 0x2000, 0xB6, -25, -51
	banim_frame_end
banim_mgkm_mg1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x5000, 0x74, -6, -32
	banim_frame_oam 0x8000, 0x1000, 0x76, -14, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -6, -16
	banim_frame_oam 0x0, 0x1000, 0x50, 10, -19
	banim_frame_oam 0x8000, 0x1000, 0x26, -2, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_oam 0x0, 0x1000, 0xB7, -17, -43
	banim_frame_oam 0x0, 0x0, 0xB7, -25, -43
	banim_frame_oam 0x0, 0x3000, 0xB7, -17, -35
	banim_frame_oam 0x0, 0x2000, 0xB7, -25, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_22_l:
	banim_frame_oam 0x4000, 0x9000, 0xD8, -2, -20
	banim_frame_oam 0x8000, 0x1000, 0xDC, -10, -20
	banim_frame_oam 0x4000, 0x5000, 0xB8, -26, -28
	banim_frame_oam 0x0, 0x1000, 0xBC, -18, -20
	banim_frame_oam 0x4000, 0x1000, 0x9E, -26, -36
	banim_frame_oam 0x0, 0x5000, 0xBD, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0xBF, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xFD, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x5000, 0xBD, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0xBF, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xFD, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x26, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_oam 0x4000, 0x1000, 0x5, 1, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 9, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_24_l:
	banim_frame_oam 0x4000, 0x1000, 0xE4, -8, -32
	banim_frame_oam 0x0, 0x1000, 0xE6, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xEA, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xEC, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xC9, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_end
banim_mgkm_mg1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x1000, 0xEF, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0xF1, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xF3, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xC9, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_end
banim_mgkm_mg1_oam_frame_26_l:
	banim_frame_oam 0x4000, 0x1000, 0xF7, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0xF9, -9, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xC9, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_end
banim_mgkm_mg1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x1000, 0xFB, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xFD, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xFE, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xF7, -10, -32
	banim_frame_oam 0x8000, 0x1000, 0xC9, -3, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x24, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0x2, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x4, -23, -24
	banim_frame_end
banim_mgkm_mg1_oam_frame_82_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 1, -35
	banim_frame_oam 0x8000, 0x1000, 0xA2, -7, -35
	banim_frame_oam 0x0, 0x5000, 0xA3, -3, -19
	banim_frame_oam 0x0, 0x1000, 0xE4, -3, -3
	banim_frame_oam 0x0, 0x9000, 0x25, -18, -15
	banim_frame_oam 0x4000, 0x1000, 0x6, -10, -23
	banim_frame_oam 0x0, 0x1000, 0x8, -18, -23
	banim_frame_oam 0x8000, 0x1000, 0x9, -26, -23
	banim_frame_oam 0x0, 0x1000, 0x49, -26, -7
	banim_frame_oam 0x4000, 0x1000, 0x92, 3, -15
	banim_frame_oam 0x8000, 0x1000, 0xD3, 11, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_83_l:
	banim_frame_oam 0x4000, 0x1000, 0x5C, -5, -20
	banim_frame_oam 0x8000, 0x1000, 0x3B, 11, -28
	banim_frame_oam 0x8000, 0x1000, 0xD2, 3, -12
	banim_frame_oam 0x4000, 0x9000, 0x2A, -10, -17
	banim_frame_oam 0x4000, 0x5000, 0x6A, -10, -1
	banim_frame_oam 0x8000, 0x1000, 0x2E, -18, -17
	banim_frame_oam 0x4000, 0x1000, 0xC, -10, -25
	banim_frame_oam 0x0, 0x1000, 0xE, -18, -25
	banim_frame_oam 0x4000, 0x5000, 0x8B, -18, 7
	banim_frame_oam 0x4000, 0x1000, 0xA9, -18, -33
	banim_frame_oam 0x0, 0x5000, 0x1C, -5, -36
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_mgkm_mg1_oam_r:
banim_mgkm_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -15, -32
	banim_frame_oam 0x8000, 0x0, 0xA2, 1, -32
	banim_frame_oam 0x0, 0x4000, 0xA3, -11, -16
	banim_frame_oam 0x4000, 0x0, 0xE3, -11, 0
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, -17, -8
	banim_frame_oam 0x4000, 0x0, 0xF0, -17, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x4000, 0x19, -9, -34
	banim_frame_oam 0x4000, 0x0, 0x59, -9, -18
	banim_frame_oam 0x8000, 0x0, 0x38, -17, -26
	banim_frame_oam 0x8000, 0x0, 0xD2, -7, -10
	banim_frame_oam 0x4000, 0x0, 0x13, -19, 8
	banim_frame_oam 0x4000, 0x8000, 0x33, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x37, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0x73, -16, 0
	banim_frame_oam 0x0, 0x0, 0x77, 16, 0
	banim_frame_oam 0x4000, 0x0, 0x15, 0, -24
	banim_frame_oam 0x0, 0x0, 0x17, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x86, -3, 8
	banim_frame_oam 0x0, 0x0, 0x88, 13, 8
	banim_frame_oam 0x8000, 0x0, 0xD3, -17, -7
	banim_frame_oam 0x4000, 0x0, 0x92, -17, -15
	banim_frame_end
banim_mgkm_mg1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x4000, 0x1C, -6, -33
	banim_frame_oam 0x4000, 0x0, 0x5C, -6, -17
	banim_frame_oam 0x8000, 0x0, 0x3B, -14, -25
	banim_frame_oam 0x8000, 0x0, 0xD2, -6, -9
	banim_frame_oam 0x4000, 0x0, 0x78, 0, -23
	banim_frame_oam 0x0, 0x0, 0x7A, 16, -23
	banim_frame_oam 0x0, 0x8000, 0x94, -9, -15
	banim_frame_oam 0x0, 0x0, 0x18, -17, 9
	banim_frame_oam 0x4000, 0x0, 0x90, -16, -15
	banim_frame_oam 0x8000, 0x0, 0xB0, -16, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x4000, 0x1C, -6, -33
	banim_frame_oam 0x4000, 0x0, 0x5C, -6, -17
	banim_frame_oam 0x8000, 0x0, 0x3B, -14, -25
	banim_frame_oam 0x8000, 0x0, 0xD2, -6, -9
	banim_frame_oam 0x4000, 0x0, 0x78, 0, -23
	banim_frame_oam 0x0, 0x0, 0x7A, 16, -23
	banim_frame_oam 0x0, 0x8000, 0x98, -9, -15
	banim_frame_oam 0x8000, 0x0, 0xB0, -16, -7
	banim_frame_oam 0x4000, 0x0, 0x90, -16, -15
	banim_frame_end
banim_mgkm_mg1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0x1C, 0, -30
	banim_frame_oam 0x4000, 0x0, 0x5C, 0, -14
	banim_frame_oam 0x8000, 0x0, 0x3B, -8, -22
	banim_frame_oam 0x8000, 0x0, 0xD2, 0, -6
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x8000, 0x0, 0x1E, -7, -15
	banim_frame_end
banim_mgkm_mg1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0x5E, 0, -31
	banim_frame_oam 0x4000, 0x0, 0x9E, 0, -15
	banim_frame_oam 0x8000, 0x0, 0x7D, -8, -23
	banim_frame_oam 0x8000, 0x0, 0xDD, 1, -7
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x8000, 0x0, 0xB1, -10, -7
	banim_frame_oam 0x4000, 0x0, 0xF0, -10, -15
	banim_frame_end
banim_mgkm_mg1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0x7, -8, -31
	banim_frame_oam 0x8000, 0x0, 0x9, 8, -31
	banim_frame_oam 0x4000, 0x0, 0x47, -8, -15
	banim_frame_oam 0x0, 0x0, 0x49, 8, -15
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x4000, 0xA, -8, -31
	banim_frame_oam 0x8000, 0x0, 0xC, 8, -31
	banim_frame_oam 0x4000, 0x0, 0x4A, -8, -15
	banim_frame_oam 0x0, 0x0, 0x4C, 8, -15
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x8000, 0x0, 0xF, 4, -31
	banim_frame_oam 0x0, 0x0, 0x4F, 4, -15
	banim_frame_oam 0x0, 0x0, 0x10, 12, -23
	banim_frame_oam 0x0, 0x4000, 0xD, -12, -31
	banim_frame_oam 0x4000, 0x0, 0x4D, -12, -15
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x0, 0x13, 12, -24
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x0, 18, -28
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x0, 0x13, 12, -24
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x1, 18, -28
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x0, 0x13, 12, -24
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0xE1, 14, -32
	banim_frame_oam 0x0, 0x1000, 0xE1, 22, -32
	banim_frame_oam 0x0, 0x2000, 0xE1, 14, -24
	banim_frame_oam 0x0, 0x3000, 0xE1, 22, -24
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x0, 0x13, 12, -24
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0xE0, 14, -32
	banim_frame_oam 0x0, 0x2000, 0xE0, 14, -24
	banim_frame_oam 0x0, 0x1000, 0xE0, 22, -32
	banim_frame_oam 0x0, 0x3000, 0xE0, 22, -24
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x0, 0x13, 12, -24
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -32
	banim_frame_oam 0x0, 0x0, 0xA1, 14, -40
	banim_frame_oam 0x4000, 0x2000, 0xC0, 6, -24
	banim_frame_oam 0x0, 0x2000, 0xA1, 14, -16
	banim_frame_oam 0x4000, 0x1000, 0xC0, 22, -32
	banim_frame_oam 0x0, 0x1000, 0xA1, 22, -40
	banim_frame_oam 0x4000, 0x3000, 0xC0, 22, -24
	banim_frame_oam 0x0, 0x3000, 0xA1, 22, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x0, 0x13, 12, -24
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_45_r:
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x0, 0x0, 0x33, 12, -23
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -32
	banim_frame_oam 0x0, 0x0, 0xA1, 14, -40
	banim_frame_oam 0x4000, 0x2000, 0xC0, 6, -24
	banim_frame_oam 0x0, 0x2000, 0xA1, 14, -16
	banim_frame_oam 0x4000, 0x1000, 0xC0, 22, -32
	banim_frame_oam 0x0, 0x1000, 0xA1, 22, -40
	banim_frame_oam 0x4000, 0x3000, 0xC0, 22, -24
	banim_frame_oam 0x0, 0x3000, 0xA1, 22, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_46_r:
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x0, 0x0, 0x33, 12, -23
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_47_r:
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x0, 0x0, 0x53, 12, -25
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -32
	banim_frame_oam 0x0, 0x0, 0xA1, 14, -40
	banim_frame_oam 0x4000, 0x2000, 0xC0, 6, -24
	banim_frame_oam 0x0, 0x2000, 0xA1, 14, -16
	banim_frame_oam 0x4000, 0x1000, 0xC0, 22, -32
	banim_frame_oam 0x0, 0x1000, 0xA1, 22, -40
	banim_frame_oam 0x4000, 0x3000, 0xC0, 22, -24
	banim_frame_oam 0x0, 0x3000, 0xA1, 22, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_48_r:
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x0, 0x0, 0x53, 12, -25
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x0, 0x14, 12, -25
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x4000, 0x0, 0xC0, 6, -36
	banim_frame_oam 0x0, 0x0, 0xA1, 14, -44
	banim_frame_oam 0x4000, 0x2000, 0xC0, 6, -28
	banim_frame_oam 0x0, 0x2000, 0xA1, 14, -20
	banim_frame_oam 0x4000, 0x1000, 0xC0, 22, -36
	banim_frame_oam 0x0, 0x1000, 0xA1, 22, -44
	banim_frame_oam 0x4000, 0x3000, 0xC0, 22, -28
	banim_frame_oam 0x0, 0x3000, 0xA1, 22, -20
	banim_frame_end
banim_mgkm_mg1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x0, 0x0, 0x14, 12, -25
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x0, 0x0, 0x34, 12, -27
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x4000, 0x0, 0xC0, 3, -43
	banim_frame_oam 0x0, 0x0, 0xA1, 11, -51
	banim_frame_oam 0x4000, 0x2000, 0xC0, 3, -35
	banim_frame_oam 0x0, 0x2000, 0xA1, 11, -27
	banim_frame_oam 0x4000, 0x1000, 0xC0, 19, -43
	banim_frame_oam 0x0, 0x1000, 0xA1, 19, -51
	banim_frame_oam 0x4000, 0x3000, 0xC0, 19, -35
	banim_frame_oam 0x0, 0x3000, 0xA1, 19, -27
	banim_frame_end
banim_mgkm_mg1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x0, 0x0, 0x34, 12, -27
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_53_r:
	banim_frame_oam 0x4000, 0x0, 0xC0, -8, -50
	banim_frame_oam 0x0, 0x0, 0xA1, 0, -58
	banim_frame_oam 0x4000, 0x2000, 0xC0, -8, -42
	banim_frame_oam 0x0, 0x2000, 0xA1, 0, -34
	banim_frame_oam 0x4000, 0x1000, 0xC0, 8, -50
	banim_frame_oam 0x0, 0x1000, 0xA1, 8, -58
	banim_frame_oam 0x4000, 0x3000, 0xC0, 8, -42
	banim_frame_oam 0x0, 0x3000, 0xA1, 8, -34
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_54_r:
	banim_frame_oam 0x0, 0x4000, 0xA2, -16, -58
	banim_frame_oam 0x8000, 0x0, 0xA4, 0, -58
	banim_frame_oam 0x4000, 0x0, 0xE3, 8, -46
	banim_frame_oam 0x0, 0x0, 0xE2, 8, -54
	banim_frame_oam 0x4000, 0x0, 0xC0, -8, -50
	banim_frame_oam 0x0, 0x0, 0xA1, 0, -58
	banim_frame_oam 0x4000, 0x2000, 0xC0, -8, -42
	banim_frame_oam 0x0, 0x2000, 0xA1, 0, -34
	banim_frame_oam 0x4000, 0x1000, 0xC0, 8, -50
	banim_frame_oam 0x0, 0x1000, 0xA1, 8, -58
	banim_frame_oam 0x4000, 0x3000, 0xC0, 8, -42
	banim_frame_oam 0x0, 0x3000, 0xA1, 8, -34
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_55_r:
	banim_frame_oam 0x0, 0x4000, 0xA2, -16, -58
	banim_frame_oam 0x8000, 0x0, 0xA4, 0, -58
	banim_frame_oam 0x4000, 0x0, 0xE3, 8, -46
	banim_frame_oam 0x0, 0x0, 0xE2, 8, -54
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_56_r:
	banim_frame_oam 0x4000, 0x0, 0x65, -12, -58
	banim_frame_oam 0x0, 0x0, 0x67, 4, -58
	banim_frame_oam 0x4000, 0x0, 0x85, 5, -50
	banim_frame_oam 0x4000, 0x0, 0x87, 13, -42
	banim_frame_oam 0x0, 0x0, 0x68, 21, -34
	banim_frame_oam 0x8000, 0x0, 0xC5, 8, -58
	banim_frame_oam 0x0, 0x0, 0xE6, 16, -50
	banim_frame_oam 0x8000, 0x1000, 0xC5, 0, -58
	banim_frame_oam 0x0, 0x1000, 0xE6, -8, -50
	banim_frame_oam 0x8000, 0x2000, 0xC5, 8, -42
	banim_frame_oam 0x0, 0x2000, 0xE6, 16, -42
	banim_frame_oam 0x8000, 0x3000, 0xC5, 0, -42
	banim_frame_oam 0x0, 0x3000, 0xE6, -8, -42
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_57_r:
	banim_frame_oam 0x4000, 0x0, 0x65, -12, -58
	banim_frame_oam 0x0, 0x0, 0x67, 4, -58
	banim_frame_oam 0x4000, 0x0, 0x85, 5, -50
	banim_frame_oam 0x4000, 0x0, 0x87, 13, -42
	banim_frame_oam 0x0, 0x0, 0x68, 21, -34
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_58_r:
	banim_frame_oam 0x4000, 0x0, 0xA5, -8, -42
	banim_frame_oam 0x0, 0x0, 0xC6, 0, -34
	banim_frame_oam 0x4000, 0x2000, 0xA5, -8, -50
	banim_frame_oam 0x0, 0x2000, 0xC6, 0, -58
	banim_frame_oam 0x4000, 0x1000, 0xA5, 8, -42
	banim_frame_oam 0x0, 0x1000, 0xC6, 8, -34
	banim_frame_oam 0x4000, 0x3000, 0xA5, 8, -50
	banim_frame_oam 0x0, 0x3000, 0xC6, 8, -58
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x8000, 0x0, 0x6A, 19, -42
	banim_frame_oam 0x0, 0x0, 0x89, 11, -34
	banim_frame_oam 0x0, 0x0, 0x69, 3, -34
	banim_frame_oam 0x8000, 0x0, 0xA9, -13, -58
	banim_frame_oam 0x0, 0x0, 0xCA, -5, -50
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_59_r:
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x8000, 0x0, 0x6A, 19, -42
	banim_frame_oam 0x0, 0x0, 0x89, 11, -34
	banim_frame_oam 0x0, 0x0, 0x69, 3, -34
	banim_frame_oam 0x8000, 0x0, 0xA9, -13, -58
	banim_frame_oam 0x0, 0x0, 0xCA, -5, -50
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_60_r:
	banim_frame_oam 0x0, 0x5000, 0xA2, 17, -59
	banim_frame_oam 0x8000, 0x1000, 0xA4, 9, -59
	banim_frame_oam 0x4000, 0x1000, 0xE3, -7, -47
	banim_frame_oam 0x0, 0x1000, 0xE2, 1, -55
	banim_frame_oam 0x4000, 0x0, 0xA7, -8, -42
	banim_frame_oam 0x0, 0x0, 0xC8, 0, -34
	banim_frame_oam 0x4000, 0x2000, 0xA7, -8, -50
	banim_frame_oam 0x0, 0x2000, 0xC8, 0, -58
	banim_frame_oam 0x4000, 0x1000, 0xA7, 8, -42
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, -34
	banim_frame_oam 0x4000, 0x3000, 0xA7, 8, -50
	banim_frame_oam 0x0, 0x3000, 0xC8, 8, -58
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_61_r:
	banim_frame_oam 0x0, 0x5000, 0xA2, 17, -59
	banim_frame_oam 0x8000, 0x1000, 0xA4, 9, -59
	banim_frame_oam 0x4000, 0x1000, 0xE3, -7, -47
	banim_frame_oam 0x0, 0x1000, 0xE2, 1, -55
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_62_r:
	banim_frame_oam 0x4000, 0x1000, 0x65, 11, -59
	banim_frame_oam 0x0, 0x1000, 0x67, 3, -59
	banim_frame_oam 0x4000, 0x1000, 0x85, -6, -51
	banim_frame_oam 0x4000, 0x1000, 0x87, -14, -43
	banim_frame_oam 0x0, 0x1000, 0x68, -14, -35
	banim_frame_oam 0x4000, 0x0, 0xE9, -8, -50
	banim_frame_oam 0x0, 0x0, 0xAA, 0, -58
	banim_frame_oam 0x4000, 0x1000, 0xE9, 8, -50
	banim_frame_oam 0x0, 0x1000, 0xAA, 8, -58
	banim_frame_oam 0x4000, 0x2000, 0xE9, -8, -42
	banim_frame_oam 0x0, 0x2000, 0xAA, 0, -34
	banim_frame_oam 0x4000, 0x3000, 0xE9, 8, -42
	banim_frame_oam 0x0, 0x3000, 0xAA, 8, -34
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_63_r:
	banim_frame_oam 0x4000, 0x1000, 0x65, 11, -59
	banim_frame_oam 0x0, 0x1000, 0x67, 3, -59
	banim_frame_oam 0x4000, 0x1000, 0x85, -6, -51
	banim_frame_oam 0x4000, 0x1000, 0x87, -14, -43
	banim_frame_oam 0x0, 0x1000, 0x68, -14, -35
	banim_frame_oam 0x0, 0x4000, 0x16, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x4000, 0x0, 0x56, -4, -15
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_64_r:
	banim_frame_oam 0x4000, 0x0, 0xA5, -8, -42
	banim_frame_oam 0x0, 0x0, 0xC6, 0, -34
	banim_frame_oam 0x4000, 0x2000, 0xA5, -8, -50
	banim_frame_oam 0x0, 0x2000, 0xC6, 0, -58
	banim_frame_oam 0x4000, 0x1000, 0xA5, 8, -42
	banim_frame_oam 0x0, 0x1000, 0xC6, 8, -34
	banim_frame_oam 0x4000, 0x3000, 0xA5, 8, -50
	banim_frame_oam 0x0, 0x3000, 0xC6, 8, -58
	banim_frame_oam 0x0, 0x4000, 0x19, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x8000, 0x1000, 0x6A, -12, -41
	banim_frame_oam 0x0, 0x1000, 0x89, -4, -33
	banim_frame_oam 0x0, 0x1000, 0x69, 4, -33
	banim_frame_oam 0x8000, 0x1000, 0xA9, 20, -57
	banim_frame_oam 0x0, 0x1000, 0xCA, 12, -49
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_65_r:
	banim_frame_oam 0x0, 0x4000, 0x19, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x8000, 0x1000, 0x6A, -12, -41
	banim_frame_oam 0x0, 0x1000, 0x89, -4, -33
	banim_frame_oam 0x0, 0x1000, 0x69, 4, -33
	banim_frame_oam 0x8000, 0x1000, 0xA9, 20, -57
	banim_frame_oam 0x0, 0x1000, 0xCA, 12, -49
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_67_r:
	banim_frame_oam 0x8000, 0x0, 0x1A, 4, -31
	banim_frame_oam 0x8000, 0x0, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, -5, -39
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_66_r:
	banim_frame_oam 0x4000, 0x0, 0xA7, -8, -42
	banim_frame_oam 0x0, 0x0, 0xC8, 0, -34
	banim_frame_oam 0x4000, 0x2000, 0xA7, -8, -50
	banim_frame_oam 0x0, 0x2000, 0xC8, 0, -58
	banim_frame_oam 0x4000, 0x1000, 0xA7, 8, -42
	banim_frame_oam 0x0, 0x1000, 0xC8, 8, -34
	banim_frame_oam 0x4000, 0x3000, 0xA7, 8, -50
	banim_frame_oam 0x0, 0x3000, 0xC8, 8, -58
	banim_frame_oam 0x8000, 0x0, 0x1A, 4, -31
	banim_frame_oam 0x8000, 0x0, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, -5, -39
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_69_r:
	banim_frame_oam 0x4000, 0x0, 0xC0, -8, -50
	banim_frame_oam 0x0, 0x0, 0xA1, 0, -58
	banim_frame_oam 0x4000, 0x2000, 0xC0, -8, -42
	banim_frame_oam 0x0, 0x2000, 0xA1, 0, -34
	banim_frame_oam 0x4000, 0x1000, 0xC0, 8, -50
	banim_frame_oam 0x0, 0x1000, 0xA1, 8, -58
	banim_frame_oam 0x4000, 0x3000, 0xC0, 8, -42
	banim_frame_oam 0x0, 0x3000, 0xA1, 8, -34
	banim_frame_oam 0x8000, 0x0, 0x1A, 4, -31
	banim_frame_oam 0x8000, 0x0, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, -5, -39
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_70_r:
	banim_frame_oam 0x8000, 0x0, 0x1A, 4, -31
	banim_frame_oam 0x8000, 0x0, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, -5, -39
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, -50
	banim_frame_oam 0x0, 0x0, 0xE0, 0, -50
	banim_frame_oam 0x0, 0x2000, 0xE0, 0, -42
	banim_frame_oam 0x0, 0x3000, 0xE0, 8, -42
	banim_frame_end
banim_mgkm_mg1_oam_frame_71_r:
	banim_frame_oam 0x8000, 0x0, 0x1A, 4, -31
	banim_frame_oam 0x8000, 0x0, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, -5, -39
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0xE1, 0, -50
	banim_frame_oam 0x0, 0x1000, 0xE1, 8, -50
	banim_frame_oam 0x0, 0x2000, 0xE1, 0, -42
	banim_frame_oam 0x0, 0x3000, 0xE1, 8, -42
	banim_frame_end
banim_mgkm_mg1_oam_frame_72_r:
	banim_frame_oam 0x8000, 0x0, 0x1A, 4, -31
	banim_frame_oam 0x8000, 0x0, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, -5, -39
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x1, 4, -47
	banim_frame_end
banim_mgkm_mg1_oam_frame_73_r:
	banim_frame_oam 0x8000, 0x0, 0x1A, 4, -31
	banim_frame_oam 0x8000, 0x0, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, -5, -39
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x0, 4, -47
	banim_frame_end
banim_mgkm_mg1_oam_frame_68_r:
	banim_frame_oam 0x8000, 0x0, 0x1A, 4, -31
	banim_frame_oam 0x8000, 0x0, 0x1B, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -4, -15
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x0, 0x0, 0x58, -5, -39
	banim_frame_oam 0x0, 0x0, 0x58, 5, -39
	banim_frame_oam 0x8000, 0x0, 0x18, 12, -31
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_74_r:
	banim_frame_oam 0x0, 0x4000, 0x1C, -4, -39
	banim_frame_oam 0x8000, 0x0, 0x1E, 12, -39
	banim_frame_oam 0x4000, 0x0, 0x5C, -4, -23
	banim_frame_oam 0x0, 0x0, 0x5E, 12, -23
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_75_r:
	banim_frame_oam 0x0, 0x4000, 0x6B, -4, -39
	banim_frame_oam 0x8000, 0x0, 0x6D, 12, -39
	banim_frame_oam 0x4000, 0x0, 0xAB, -4, -23
	banim_frame_oam 0x0, 0x0, 0xAD, 12, -23
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x6E, -12, -31
	banim_frame_oam 0x0, 0x0, 0x6F, -4, -39
	banim_frame_oam 0x0, 0x4000, 0x8E, -4, -31
	banim_frame_oam 0x8000, 0x0, 0x90, 12, -33
	banim_frame_oam 0x0, 0x0, 0x50, -12, -18
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_76_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -4, -31
	banim_frame_oam 0x4000, 0x0, 0x51, -4, -15
	banim_frame_oam 0x0, 0x0, 0x13, 12, -24
	banim_frame_oam 0x8000, 0x0, 0x30, -12, -26
	banim_frame_oam 0x8000, 0x0, 0x26, 2, -7
	banim_frame_oam 0x4000, 0x0, 0x2, 6, -23
	banim_frame_oam 0x0, 0x0, 0x4, 22, -23
	banim_frame_oam 0x0, 0x8000, 0x20, -10, -15
	banim_frame_oam 0x8000, 0x4000, 0x24, 22, -15
	banim_frame_oam 0x4000, 0x0, 0x5, -10, -15
	banim_frame_oam 0x8000, 0x0, 0x25, -10, -7
	banim_frame_oam 0x0, 0x0, 0x3F, 9, -28
	banim_frame_end
banim_mgkm_mg1_oam_frame_77_r:
	banim_frame_oam 0x0, 0x4000, 0x1C, -6, -33
	banim_frame_oam 0x4000, 0x0, 0x5C, -6, -17
	banim_frame_oam 0x8000, 0x0, 0x3B, -14, -25
	banim_frame_oam 0x8000, 0x0, 0xD2, -6, -9
	banim_frame_oam 0x0, 0x8000, 0x98, -9, -15
	banim_frame_oam 0x0, 0x0, 0x18, -17, 9
	banim_frame_oam 0x4000, 0x0, 0x78, 0, -23
	banim_frame_oam 0x0, 0x0, 0x7A, 16, -23
	banim_frame_oam 0x4000, 0x0, 0x7B, -14, -17
	banim_frame_oam 0x8000, 0x0, 0x9C, -14, -9
	banim_frame_end
banim_mgkm_mg1_oam_frame_78_r:
	banim_frame_oam 0x0, 0x4000, 0x1C, -6, -33
	banim_frame_oam 0x4000, 0x0, 0x5C, -6, -17
	banim_frame_oam 0x8000, 0x0, 0x3B, -14, -25
	banim_frame_oam 0x8000, 0x0, 0xD2, -6, -9
	banim_frame_oam 0x0, 0x8000, 0x94, -9, -15
	banim_frame_oam 0x0, 0x0, 0x18, -17, 9
	banim_frame_oam 0x4000, 0x0, 0x78, 0, -23
	banim_frame_oam 0x0, 0x0, 0x7A, 16, -23
	banim_frame_oam 0x4000, 0x0, 0x7B, -14, -17
	banim_frame_oam 0x8000, 0x0, 0x9C, -14, -9
	banim_frame_end
banim_mgkm_mg1_oam_frame_79_r:
	banim_frame_oam 0x0, 0x4000, 0x1C, -6, -32
	banim_frame_oam 0x4000, 0x0, 0x5C, -6, -16
	banim_frame_oam 0x8000, 0x0, 0x3B, -14, -24
	banim_frame_oam 0x8000, 0x0, 0xD2, -6, -8
	banim_frame_oam 0x4000, 0x0, 0x13, -19, 9
	banim_frame_oam 0x4000, 0x8000, 0x33, -16, -15
	banim_frame_oam 0x8000, 0x0, 0x37, 16, -15
	banim_frame_oam 0x4000, 0x4000, 0x73, -16, 1
	banim_frame_oam 0x0, 0x0, 0x77, 16, 1
	banim_frame_oam 0x4000, 0x0, 0x15, 0, -23
	banim_frame_oam 0x0, 0x0, 0x17, 16, -23
	banim_frame_oam 0x4000, 0x0, 0x86, -6, 9
	banim_frame_oam 0x0, 0x0, 0x88, 10, 9
	banim_frame_oam 0x4000, 0x0, 0x7B, -15, -17
	banim_frame_oam 0x8000, 0x0, 0x9C, -15, -9
	banim_frame_end
banim_mgkm_mg1_oam_frame_80_r:
	banim_frame_oam 0x0, 0x4000, 0x19, -8, -31
	banim_frame_oam 0x4000, 0x0, 0x59, -8, -15
	banim_frame_oam 0x8000, 0x0, 0x38, -16, -23
	banim_frame_oam 0x8000, 0x0, 0xD2, -6, -7
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x7B, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x9C, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_81_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -15, -32
	banim_frame_oam 0x8000, 0x0, 0xA2, 1, -32
	banim_frame_oam 0x0, 0x4000, 0xA3, -11, -16
	banim_frame_oam 0x4000, 0x0, 0xE3, -11, 0
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x8000, 0x0, 0xDC, -17, -8
	banim_frame_oam 0x4000, 0x0, 0xBD, -17, -16
	banim_frame_end
	banim_frame_end
banim_mgkm_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x5E, -7, -32
	banim_frame_oam 0x4000, 0x0, 0x9E, -7, -16
	banim_frame_oam 0x8000, 0x0, 0x7D, -15, -24
	banim_frame_oam 0x8000, 0x0, 0xDD, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x8000, 0x0, 0xB1, -17, -8
	banim_frame_oam 0x4000, 0x0, 0xF0, -17, -16
	banim_frame_end
banim_mgkm_mg1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x7, -15, -32
	banim_frame_oam 0x8000, 0x0, 0x9, 1, -32
	banim_frame_oam 0x4000, 0x0, 0x47, -15, -16
	banim_frame_oam 0x0, 0x0, 0x49, 1, -16
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x4000, 0xA, -15, -32
	banim_frame_oam 0x8000, 0x0, 0xC, 1, -32
	banim_frame_oam 0x4000, 0x0, 0x4A, -15, -16
	banim_frame_oam 0x0, 0x0, 0x4C, 1, -16
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -11, -32
	banim_frame_oam 0x4000, 0x0, 0x51, -11, -16
	banim_frame_oam 0x8000, 0x0, 0x30, -19, -27
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x0, 0x0, 0x55, 5, -24
	banim_frame_oam 0x0, 0x0, 0x3F, 2, -29
	banim_frame_end
banim_mgkm_mg1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0x70, -19, -32
	banim_frame_oam 0x0, 0x4000, 0x71, -11, -32
	banim_frame_oam 0x8000, 0x0, 0x73, 5, -32
	banim_frame_oam 0x0, 0x0, 0x50, -19, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x4000, 0x0, 0x51, -11, -16
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -11, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 5, -32
	banim_frame_oam 0x0, 0x0, 0x50, -19, -19
	banim_frame_oam 0x4000, 0x0, 0x51, -11, -16
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0x77, -11, -32
	banim_frame_oam 0x8000, 0x0, 0x79, 5, -32
	banim_frame_oam 0x0, 0x0, 0x50, -19, -19
	banim_frame_oam 0x4000, 0x0, 0x51, -11, -16
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x4000, 0x7B, -11, -32
	banim_frame_oam 0x8000, 0x0, 0x7D, 5, -32
	banim_frame_oam 0x0, 0x0, 0x9A, -19, -24
	banim_frame_oam 0x4000, 0x0, 0x51, -11, -16
	banim_frame_oam 0x0, 0x0, 0x50, -19, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0xCE, -10, -32
	banim_frame_oam 0x8000, 0x0, 0xD0, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x0, 0x0, 0x0, 12, -39
	banim_frame_end
banim_mgkm_mg1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x0, 0x0, 0x1, 12, -39
	banim_frame_end
banim_mgkm_mg1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x0, 0x0, 0xE1, 8, -43
	banim_frame_oam 0x0, 0x1000, 0xE1, 16, -43
	banim_frame_oam 0x0, 0x2000, 0xE1, 8, -35
	banim_frame_oam 0x0, 0x3000, 0xE1, 16, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x0, 0x0, 0xE0, 8, -43
	banim_frame_oam 0x0, 0x1000, 0xE0, 16, -43
	banim_frame_oam 0x0, 0x2000, 0xE0, 8, -35
	banim_frame_oam 0x0, 0x3000, 0xE0, 16, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x8000, 0x0, 0xA1, 8, -51
	banim_frame_oam 0x0, 0x0, 0xC0, 0, -43
	banim_frame_oam 0x8000, 0x2000, 0xA1, 8, -35
	banim_frame_oam 0x0, 0x2000, 0xC0, 0, -35
	banim_frame_oam 0x8000, 0x1000, 0xA1, 16, -51
	banim_frame_oam 0x0, 0x1000, 0xC0, 24, -43
	banim_frame_oam 0x8000, 0x3000, 0xA1, 16, -35
	banim_frame_oam 0x0, 0x3000, 0xC0, 24, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x8000, 0x0, 0xC7, 16, -51
	banim_frame_oam 0x0, 0x0, 0xE8, 24, -43
	banim_frame_oam 0x8000, 0x2000, 0xC7, 16, -35
	banim_frame_oam 0x0, 0x2000, 0xE8, 24, -35
	banim_frame_oam 0x8000, 0x1000, 0xC7, 8, -51
	banim_frame_oam 0x0, 0x1000, 0xE8, 0, -43
	banim_frame_oam 0x8000, 0x3000, 0xC7, 8, -35
	banim_frame_oam 0x0, 0x3000, 0xE8, 0, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x0, 0x4000, 0xB2, 1, -35
	banim_frame_oam 0x0, 0x0, 0xB1, -7, -35
	banim_frame_oam 0x8000, 0x0, 0xD1, 9, -19
	banim_frame_oam 0x0, 0x6000, 0xB2, 1, -50
	banim_frame_oam 0x0, 0x2000, 0xB1, -7, -42
	banim_frame_oam 0x8000, 0x2000, 0xD1, 9, -66
	banim_frame_oam 0x0, 0x5000, 0xB2, 16, -35
	banim_frame_oam 0x0, 0x1000, 0xB1, 32, -35
	banim_frame_oam 0x8000, 0x1000, 0xD1, 16, -19
	banim_frame_oam 0x0, 0x7000, 0xB2, 16, -50
	banim_frame_oam 0x0, 0x3000, 0xB1, 32, -42
	banim_frame_oam 0x8000, 0x3000, 0xD1, 16, -66
	banim_frame_end
banim_mgkm_mg1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x0, 0x0, 0xF3, -7, -59
	banim_frame_oam 0x0, 0x4000, 0xD4, 1, -51
	banim_frame_oam 0x0, 0x2000, 0xF3, -7, -19
	banim_frame_oam 0x0, 0x6000, 0xD4, 1, -35
	banim_frame_oam 0x0, 0x1000, 0xF3, 33, -59
	banim_frame_oam 0x0, 0x5000, 0xD4, 17, -51
	banim_frame_oam 0x0, 0x3000, 0xF3, 33, -19
	banim_frame_oam 0x0, 0x7000, 0xD4, 17, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x0, 0x4000, 0xD6, 1, -51
	banim_frame_oam 0x0, 0x5000, 0xD6, 17, -51
	banim_frame_oam 0x0, 0x6000, 0xD6, 1, -35
	banim_frame_oam 0x0, 0x7000, 0xD6, 17, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x4000, 0x0, 0xB4, 1, -35
	banim_frame_oam 0x0, 0x0, 0xB6, 9, -27
	banim_frame_oam 0x4000, 0x2000, 0xB4, 1, -43
	banim_frame_oam 0x0, 0x2000, 0xB6, 9, -51
	banim_frame_oam 0x4000, 0x1000, 0xB4, 17, -35
	banim_frame_oam 0x0, 0x1000, 0xB6, 17, -27
	banim_frame_oam 0x4000, 0x3000, 0xB4, 17, -43
	banim_frame_oam 0x0, 0x3000, 0xB6, 17, -51
	banim_frame_end
banim_mgkm_mg1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x4000, 0x74, -10, -32
	banim_frame_oam 0x8000, 0x0, 0x76, 6, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, -10, -16
	banim_frame_oam 0x0, 0x0, 0x50, -18, -19
	banim_frame_oam 0x8000, 0x0, 0x26, -6, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_oam 0x0, 0x0, 0xB7, 9, -43
	banim_frame_oam 0x0, 0x1000, 0xB7, 17, -43
	banim_frame_oam 0x0, 0x2000, 0xB7, 9, -35
	banim_frame_oam 0x0, 0x3000, 0xB7, 17, -35
	banim_frame_end
banim_mgkm_mg1_oam_frame_22_r:
	banim_frame_oam 0x4000, 0x8000, 0xD8, -30, -20
	banim_frame_oam 0x8000, 0x0, 0xDC, 2, -20
	banim_frame_oam 0x4000, 0x4000, 0xB8, -6, -28
	banim_frame_oam 0x0, 0x0, 0xBC, 10, -20
	banim_frame_oam 0x4000, 0x0, 0x9E, 10, -36
	banim_frame_oam 0x0, 0x4000, 0xBD, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xBF, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xFD, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x4000, 0xBD, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xBF, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xFD, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x26, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_oam 0x4000, 0x0, 0x5, -17, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -17, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_24_r:
	banim_frame_oam 0x4000, 0x0, 0xE4, -8, -32
	banim_frame_oam 0x0, 0x0, 0xE6, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xEA, -8, -24
	banim_frame_oam 0x0, 0x0, 0xEC, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xED, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xC9, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_end
banim_mgkm_mg1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x0, 0xEF, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xF1, -8, -24
	banim_frame_oam 0x0, 0x0, 0xF3, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xED, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xC9, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_end
banim_mgkm_mg1_oam_frame_26_r:
	banim_frame_oam 0x4000, 0x0, 0xF7, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xF9, -7, -24
	banim_frame_oam 0x4000, 0x0, 0xED, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xC9, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_end
banim_mgkm_mg1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x0, 0xFB, -8, -24
	banim_frame_oam 0x0, 0x0, 0xFD, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xFE, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xF7, -6, -32
	banim_frame_oam 0x8000, 0x0, 0xC9, -5, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x24, 15, -16
	banim_frame_oam 0x4000, 0x0, 0x2, -1, -24
	banim_frame_oam 0x0, 0x0, 0x4, 15, -24
	banim_frame_end
banim_mgkm_mg1_oam_frame_82_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -17, -35
	banim_frame_oam 0x8000, 0x0, 0xA2, -1, -35
	banim_frame_oam 0x0, 0x4000, 0xA3, -13, -19
	banim_frame_oam 0x0, 0x0, 0xE4, -5, -3
	banim_frame_oam 0x0, 0x8000, 0x25, -14, -15
	banim_frame_oam 0x4000, 0x0, 0x6, -6, -23
	banim_frame_oam 0x0, 0x0, 0x8, 10, -23
	banim_frame_oam 0x8000, 0x0, 0x9, 18, -23
	banim_frame_oam 0x0, 0x0, 0x49, 18, -7
	banim_frame_oam 0x4000, 0x0, 0x92, -19, -15
	banim_frame_oam 0x8000, 0x0, 0xD3, -19, -7
	banim_frame_end
banim_mgkm_mg1_oam_frame_83_r:
	banim_frame_oam 0x4000, 0x0, 0x5C, -11, -20
	banim_frame_oam 0x8000, 0x0, 0x3B, -19, -28
	banim_frame_oam 0x8000, 0x0, 0xD2, -11, -12
	banim_frame_oam 0x4000, 0x8000, 0x2A, -22, -17
	banim_frame_oam 0x4000, 0x4000, 0x6A, -22, -1
	banim_frame_oam 0x8000, 0x0, 0x2E, 10, -17
	banim_frame_oam 0x4000, 0x0, 0xC, -6, -25
	banim_frame_oam 0x0, 0x0, 0xE, 10, -25
	banim_frame_oam 0x4000, 0x4000, 0x8B, -14, 7
	banim_frame_oam 0x4000, 0x0, 0xA9, 2, -33
	banim_frame_oam 0x0, 0x4000, 0x1C, -11, -36
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mgkm_mg1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_mgkm_mg1_script:
banim_mgkm_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 54, banim_mgkm_mg1_oam_frame_1_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 55, banim_mgkm_mg1_oam_frame_2_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 56, banim_mgkm_mg1_oam_frame_3_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 57, banim_mgkm_mg1_oam_frame_4_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 58, banim_mgkm_mg1_oam_frame_5_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 59, banim_mgkm_mg1_oam_frame_6_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 60, banim_mgkm_mg1_oam_frame_7_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 61, banim_mgkm_mg1_oam_frame_8_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 62, banim_mgkm_mg1_oam_frame_9_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_sound_892
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 67, banim_mgkm_mg1_oam_frame_14_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 68, banim_mgkm_mg1_oam_frame_15_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 69, banim_mgkm_mg1_oam_frame_16_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 70, banim_mgkm_mg1_oam_frame_17_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 71, banim_mgkm_mg1_oam_frame_18_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 72, banim_mgkm_mg1_oam_frame_19_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 73, banim_mgkm_mg1_oam_frame_20_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 74, banim_mgkm_mg1_oam_frame_21_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 9, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 75, banim_mgkm_mg1_oam_frame_22_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 76, banim_mgkm_mg1_oam_frame_23_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 77, banim_mgkm_mg1_oam_frame_24_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_2, 78, banim_mgkm_mg1_oam_frame_25_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 79, banim_mgkm_mg1_oam_frame_26_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 80, banim_mgkm_mg1_oam_frame_27_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_sound_892
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 84, banim_mgkm_mg1_oam_frame_30_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_2, 84, banim_mgkm_mg1_oam_frame_30_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 84, banim_mgkm_mg1_oam_frame_30_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 84, banim_mgkm_mg1_oam_frame_30_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 6, banim_mgkm_mg1_sheet_0, 1, banim_mgkm_mg1_oam_frame_31_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 2, banim_mgkm_mg1_oam_frame_32_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 3, banim_mgkm_mg1_oam_frame_33_r - banim_mgkm_mg1_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_0, 4, banim_mgkm_mg1_oam_frame_34_r - banim_mgkm_mg1_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_0, 5, banim_mgkm_mg1_oam_frame_35_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 6, banim_mgkm_mg1_oam_frame_36_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 7, banim_mgkm_mg1_oam_frame_37_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 8, banim_mgkm_mg1_oam_frame_38_r - banim_mgkm_mg1_oam_r
	banim_code_sound_elec_jee
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 9, banim_mgkm_mg1_oam_frame_39_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 10, banim_mgkm_mg1_oam_frame_40_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 9, banim_mgkm_mg1_oam_frame_39_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 10, banim_mgkm_mg1_oam_frame_40_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 11, banim_mgkm_mg1_oam_frame_41_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 12, banim_mgkm_mg1_oam_frame_42_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 12, banim_mgkm_mg1_oam_frame_42_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 13, banim_mgkm_mg1_oam_frame_43_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 14, banim_mgkm_mg1_oam_frame_44_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 15, banim_mgkm_mg1_oam_frame_45_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 16, banim_mgkm_mg1_oam_frame_46_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 17, banim_mgkm_mg1_oam_frame_47_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 18, banim_mgkm_mg1_oam_frame_48_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 19, banim_mgkm_mg1_oam_frame_49_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 20, banim_mgkm_mg1_oam_frame_50_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 21, banim_mgkm_mg1_oam_frame_51_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 22, banim_mgkm_mg1_oam_frame_52_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 23, banim_mgkm_mg1_oam_frame_53_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 24, banim_mgkm_mg1_oam_frame_54_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 25, banim_mgkm_mg1_oam_frame_55_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 26, banim_mgkm_mg1_oam_frame_56_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 27, banim_mgkm_mg1_oam_frame_57_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 28, banim_mgkm_mg1_oam_frame_58_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 29, banim_mgkm_mg1_oam_frame_59_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 30, banim_mgkm_mg1_oam_frame_60_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 31, banim_mgkm_mg1_oam_frame_61_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 32, banim_mgkm_mg1_oam_frame_62_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 33, banim_mgkm_mg1_oam_frame_63_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 34, banim_mgkm_mg1_oam_frame_64_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 35, banim_mgkm_mg1_oam_frame_65_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 37, banim_mgkm_mg1_oam_frame_66_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 36, banim_mgkm_mg1_oam_frame_67_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 38, banim_mgkm_mg1_oam_frame_69_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 39, banim_mgkm_mg1_oam_frame_70_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 40, banim_mgkm_mg1_oam_frame_71_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 41, banim_mgkm_mg1_oam_frame_72_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 42, banim_mgkm_mg1_oam_frame_73_r - banim_mgkm_mg1_oam_r
	banim_code_frame 6, banim_mgkm_mg1_sheet_1, 44, banim_mgkm_mg1_oam_frame_74_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 45, banim_mgkm_mg1_oam_frame_75_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 47, banim_mgkm_mg1_oam_frame_76_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 48, banim_mgkm_mg1_oam_frame_77_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 49, banim_mgkm_mg1_oam_frame_78_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 50, banim_mgkm_mg1_oam_frame_79_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 51, banim_mgkm_mg1_oam_frame_80_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 52, banim_mgkm_mg1_oam_frame_81_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 6, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_sound_elec_jee
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 6, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 86, banim_mgkm_mg1_oam_frame_29_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 85, banim_mgkm_mg1_oam_frame_28_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 54, banim_mgkm_mg1_oam_frame_1_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 55, banim_mgkm_mg1_oam_frame_2_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 56, banim_mgkm_mg1_oam_frame_3_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 57, banim_mgkm_mg1_oam_frame_4_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 58, banim_mgkm_mg1_oam_frame_5_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 59, banim_mgkm_mg1_oam_frame_6_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 60, banim_mgkm_mg1_oam_frame_7_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 61, banim_mgkm_mg1_oam_frame_8_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 62, banim_mgkm_mg1_oam_frame_9_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_sound_892
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 67, banim_mgkm_mg1_oam_frame_14_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 68, banim_mgkm_mg1_oam_frame_15_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 69, banim_mgkm_mg1_oam_frame_16_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 70, banim_mgkm_mg1_oam_frame_17_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 71, banim_mgkm_mg1_oam_frame_18_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 72, banim_mgkm_mg1_oam_frame_19_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 73, banim_mgkm_mg1_oam_frame_20_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 74, banim_mgkm_mg1_oam_frame_21_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 9, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 75, banim_mgkm_mg1_oam_frame_22_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 76, banim_mgkm_mg1_oam_frame_23_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 77, banim_mgkm_mg1_oam_frame_24_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_2, 78, banim_mgkm_mg1_oam_frame_25_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 79, banim_mgkm_mg1_oam_frame_26_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 80, banim_mgkm_mg1_oam_frame_27_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 1, banim_mgkm_mg1_oam_frame_31_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 2, banim_mgkm_mg1_oam_frame_32_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 3, banim_mgkm_mg1_oam_frame_33_r - banim_mgkm_mg1_oam_r
	banim_code_frame 7, banim_mgkm_mg1_sheet_0, 4, banim_mgkm_mg1_oam_frame_34_r - banim_mgkm_mg1_oam_r
	banim_code_frame 10, banim_mgkm_mg1_sheet_0, 5, banim_mgkm_mg1_oam_frame_35_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 6, banim_mgkm_mg1_oam_frame_36_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 7, banim_mgkm_mg1_oam_frame_37_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 8, banim_mgkm_mg1_oam_frame_38_r - banim_mgkm_mg1_oam_r
	banim_code_sound_elec_jee
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 9, banim_mgkm_mg1_oam_frame_39_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 10, banim_mgkm_mg1_oam_frame_40_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 9, banim_mgkm_mg1_oam_frame_39_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 10, banim_mgkm_mg1_oam_frame_40_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 11, banim_mgkm_mg1_oam_frame_41_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 12, banim_mgkm_mg1_oam_frame_42_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 12, banim_mgkm_mg1_oam_frame_42_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 13, banim_mgkm_mg1_oam_frame_43_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 14, banim_mgkm_mg1_oam_frame_44_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 15, banim_mgkm_mg1_oam_frame_45_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 16, banim_mgkm_mg1_oam_frame_46_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 17, banim_mgkm_mg1_oam_frame_47_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 18, banim_mgkm_mg1_oam_frame_48_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 19, banim_mgkm_mg1_oam_frame_49_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 20, banim_mgkm_mg1_oam_frame_50_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 21, banim_mgkm_mg1_oam_frame_51_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 22, banim_mgkm_mg1_oam_frame_52_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_1, 23, banim_mgkm_mg1_oam_frame_53_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 24, banim_mgkm_mg1_oam_frame_54_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 25, banim_mgkm_mg1_oam_frame_55_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 26, banim_mgkm_mg1_oam_frame_56_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 27, banim_mgkm_mg1_oam_frame_57_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 28, banim_mgkm_mg1_oam_frame_58_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 29, banim_mgkm_mg1_oam_frame_59_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 30, banim_mgkm_mg1_oam_frame_60_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 31, banim_mgkm_mg1_oam_frame_61_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 32, banim_mgkm_mg1_oam_frame_62_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 33, banim_mgkm_mg1_oam_frame_63_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 34, banim_mgkm_mg1_oam_frame_64_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 35, banim_mgkm_mg1_oam_frame_65_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 37, banim_mgkm_mg1_oam_frame_66_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 36, banim_mgkm_mg1_oam_frame_67_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 38, banim_mgkm_mg1_oam_frame_69_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 39, banim_mgkm_mg1_oam_frame_70_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 40, banim_mgkm_mg1_oam_frame_71_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 41, banim_mgkm_mg1_oam_frame_72_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 43, banim_mgkm_mg1_oam_frame_68_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 42, banim_mgkm_mg1_oam_frame_73_r - banim_mgkm_mg1_oam_r
	banim_code_frame 6, banim_mgkm_mg1_sheet_1, 44, banim_mgkm_mg1_oam_frame_74_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 45, banim_mgkm_mg1_oam_frame_75_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_1, 47, banim_mgkm_mg1_oam_frame_76_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 48, banim_mgkm_mg1_oam_frame_77_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 49, banim_mgkm_mg1_oam_frame_78_r - banim_mgkm_mg1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 50, banim_mgkm_mg1_oam_frame_79_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 51, banim_mgkm_mg1_oam_frame_80_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 52, banim_mgkm_mg1_oam_frame_81_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 81, banim_mgkm_mg1_oam_frame_82_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 82, banim_mgkm_mg1_oam_frame_83_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 81, banim_mgkm_mg1_oam_frame_82_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 81, banim_mgkm_mg1_oam_frame_82_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 82, banim_mgkm_mg1_oam_frame_83_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mgkm_mg1_sheet_0, 81, banim_mgkm_mg1_oam_frame_82_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mgkm_mg1_mode_stand_close:
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mgkm_mg1_mode_stand:
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mgkm_mg1_mode_stand_range:
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mgkm_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mgkm_mg1_sheet_0, 0, banim_mgkm_mg1_oam_frame_0_r - banim_mgkm_mg1_oam_r
	banim_code_frame 4, banim_mgkm_mg1_sheet_0, 54, banim_mgkm_mg1_oam_frame_1_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 55, banim_mgkm_mg1_oam_frame_2_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 56, banim_mgkm_mg1_oam_frame_3_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 57, banim_mgkm_mg1_oam_frame_4_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 58, banim_mgkm_mg1_oam_frame_5_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 59, banim_mgkm_mg1_oam_frame_6_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 60, banim_mgkm_mg1_oam_frame_7_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 61, banim_mgkm_mg1_oam_frame_8_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_1, 62, banim_mgkm_mg1_oam_frame_9_r - banim_mgkm_mg1_oam_r
	banim_code_frame 15, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_sound_892
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 67, banim_mgkm_mg1_oam_frame_14_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 68, banim_mgkm_mg1_oam_frame_15_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 69, banim_mgkm_mg1_oam_frame_16_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 70, banim_mgkm_mg1_oam_frame_17_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 71, banim_mgkm_mg1_oam_frame_18_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 72, banim_mgkm_mg1_oam_frame_19_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 73, banim_mgkm_mg1_oam_frame_20_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 74, banim_mgkm_mg1_oam_frame_21_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 66, banim_mgkm_mg1_oam_frame_13_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 65, banim_mgkm_mg1_oam_frame_12_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 64, banim_mgkm_mg1_oam_frame_11_r - banim_mgkm_mg1_oam_r
	banim_code_frame 9, banim_mgkm_mg1_sheet_1, 63, banim_mgkm_mg1_oam_frame_10_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 75, banim_mgkm_mg1_oam_frame_22_r - banim_mgkm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_mgkm_mg1_sheet_1, 76, banim_mgkm_mg1_oam_frame_23_r - banim_mgkm_mg1_oam_r
	banim_code_frame 1, banim_mgkm_mg1_sheet_2, 77, banim_mgkm_mg1_oam_frame_24_r - banim_mgkm_mg1_oam_r
	banim_code_frame 2, banim_mgkm_mg1_sheet_2, 78, banim_mgkm_mg1_oam_frame_25_r - banim_mgkm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 79, banim_mgkm_mg1_oam_frame_26_r - banim_mgkm_mg1_oam_r
	banim_code_frame 3, banim_mgkm_mg1_sheet_2, 80, banim_mgkm_mg1_oam_frame_27_r - banim_mgkm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_mgkm_mg1_mode_attack_close - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_attack_close_back - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_attack_close_critical - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_attack_close_critical_back - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_attack_range - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_attack_range_critical - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_dodge_close - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_dodge_range - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_stand_close - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_stand - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_stand_range - banim_mgkm_mg1_script
	.word banim_mgkm_mg1_mode_attack_miss - banim_mgkm_mg1_script
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

