@ vim:ft=armv4
	.global banim_sokm_sp1_script
	.global banim_sokm_sp1_oam_r
	.global banim_sokm_sp1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x33
	.section .data.oam_l
banim_sokm_sp1_oam_l:
banim_sokm_sp1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0x1000, 0x5, -12, -15
	banim_frame_oam 0x4000, 0x1000, 0x3, -12, -7
	banim_frame_oam 0x0, 0x1000, 0x60, 4, -7
	banim_frame_oam 0x0, 0x5000, 0x7, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0x47, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x26, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -2, -17
	banim_frame_oam 0x0, 0x1000, 0xC8, 6, -17
	banim_frame_oam 0x0, 0x1000, 0x80, 14, -17
	banim_frame_oam 0x0, 0x5000, 0x67, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xA7, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x86, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x5000, 0x4B, 5, -35
	banim_frame_oam 0x0, 0x1000, 0x8B, -3, -19
	banim_frame_oam 0x0, 0x1000, 0x4C, -3, -27
	banim_frame_oam 0x0, 0x1000, 0x6B, 5, -19
	banim_frame_oam 0x0, 0x5000, 0x67, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xA7, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x86, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0xAB, 1, -36
	banim_frame_oam 0x0, 0x1000, 0xCC, -3, -28
	banim_frame_oam 0x0, 0x1000, 0xCD, -5, -20
	banim_frame_oam 0x0, 0x5000, 0x67, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xA7, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x86, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_26_l:
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x0, 0x1000, 0xC, 5, -28
	banim_frame_oam 0x8000, 0x1000, 0xB, 13, -30
	banim_frame_oam 0x4000, 0x1000, 0x29, 21, -22
	banim_frame_oam 0x0, 0x1000, 0x9, 29, -30
	banim_frame_oam 0x0, 0x1000, 0xD, -10, -38
	banim_frame_oam 0x4000, 0x1000, 0xAD, -11, -22
	banim_frame_oam 0x4000, 0x1000, 0x2D, -11, -30
	banim_frame_end
banim_sokm_sp1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x0, 0x5000, 0xF, -3, -30
	banim_frame_oam 0x0, 0x1000, 0xD, -10, -38
	banim_frame_oam 0x8000, 0x1000, 0x52, -11, -30
	banim_frame_end
banim_sokm_sp1_oam_frame_28_l:
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x12, 7, -26
	banim_frame_oam 0x4000, 0x9000, 0x13, -25, -36
	banim_frame_oam 0x4000, 0x5000, 0x53, -25, -20
	banim_frame_end
banim_sokm_sp1_oam_frame_29_l:
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x75, 5, -53
	banim_frame_oam 0x4000, 0x1000, 0x58, -11, -37
	banim_frame_oam 0x4000, 0x1000, 0x73, -11, -49
	banim_frame_oam 0x0, 0x5000, 0x78, -11, -29
	banim_frame_oam 0x0, 0x1000, 0x97, 5, -21
	banim_frame_end
banim_sokm_sp1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, -16, -37
	banim_frame_oam 0x4000, 0x1000, 0x5B, -16, -21
	banim_frame_oam 0x8000, 0x1000, 0x7E, -24, -29
	banim_frame_oam 0x0, 0x1000, 0xBE, -24, -13
	banim_frame_oam 0x4000, 0x1000, 0x7C, -23, -5
	banim_frame_oam 0x0, 0x1000, 0x9C, -15, 3
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xF1, -8, -23
	banim_frame_oam 0x0, 0x1000, 0xF3, -16, -23
	banim_frame_oam 0x4000, 0x1000, 0xD8, -16, -31
	banim_frame_oam 0x4000, 0x1000, 0xDA, -32, -23
	banim_frame_oam 0x0, 0x1000, 0xDC, -40, -23
	banim_frame_oam 0x4000, 0x1000, 0xFB, -40, -15
	banim_frame_oam 0x4000, 0x1000, 0xF9, -40, -7
	banim_frame_oam 0x0, 0x1000, 0xF8, -32, 1
	banim_frame_end
banim_sokm_sp1_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x5000, 0x20, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x0, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xDE, -10, -22
	banim_frame_oam 0x0, 0x1000, 0xFF, -8, -30
	banim_frame_oam 0x8000, 0x1000, 0x1E, -16, -46
	banim_frame_oam 0x0, 0x1000, 0x5E, -16, -30
	banim_frame_oam 0x0, 0x1000, 0x32, -24, -30
	banim_frame_oam 0x8000, 0x1000, 0x11, -24, -55
	banim_frame_oam 0x0, 0x1000, 0x2C, -16, -54
	banim_frame_oam 0x0, 0x1000, 0x9D, -32, -54
	banim_frame_oam 0x0, 0x1000, 0xA, -32, -46
	banim_frame_oam 0x0, 0x1000, 0xD1, -40, -46
	banim_frame_oam 0x0, 0x1000, 0xEF, -8, -38
	banim_frame_end
banim_sokm_sp1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x42, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x23, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x27, -8, -39
	banim_frame_oam 0x0, 0x1000, 0x67, -8, -23
	banim_frame_oam 0x8000, 0x1000, 0x87, -16, -39
	banim_frame_oam 0x0, 0x1000, 0xC7, -16, -23
	banim_frame_oam 0x0, 0x1000, 0xC5, 0, -23
	banim_frame_oam 0x8000, 0x1000, 0x28, -8, -61
	banim_frame_oam 0x0, 0x1000, 0x68, -8, -45
	banim_frame_oam 0x4000, 0x1000, 0x29, -24, -61
	banim_frame_end
banim_sokm_sp1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x1000, 0x54, -9, -60
	banim_frame_oam 0x0, 0x1000, 0x94, -9, -44
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x42, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x23, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -16, -39
	banim_frame_oam 0x0, 0x1000, 0xC5, 0, -23
	banim_frame_oam 0x0, 0x1000, 0x67, -8, -23
	banim_frame_oam 0x0, 0x1000, 0xC7, -16, -23
	banim_frame_end
banim_sokm_sp1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x1000, 0xA0, -3, -56
	banim_frame_oam 0x8000, 0x1000, 0x60, -6, -48
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x42, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x23, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -16, -39
	banim_frame_oam 0x0, 0x1000, 0xC5, 0, -23
	banim_frame_oam 0x0, 0x1000, 0x67, -8, -23
	banim_frame_oam 0x0, 0x1000, 0xC7, -16, -23
	banim_frame_end
banim_sokm_sp1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x1000, 0xE5, -3, -16
	banim_frame_oam 0x0, 0x1000, 0xEC, 5, -24
	banim_frame_oam 0x0, 0x1000, 0xE7, -11, -16
	banim_frame_oam 0x4000, 0x1000, 0x3, -3, -8
	banim_frame_oam 0x0, 0x1000, 0x5, -11, -8
	banim_frame_oam 0x0, 0x1000, 0xEB, -11, -24
	banim_frame_oam 0x8000, 0x1000, 0x8C, -14, -33
	banim_frame_oam 0x0, 0x1000, 0xCC, -14, -17
	banim_frame_oam 0x0, 0x1000, 0xAA, 2, -23
	banim_frame_oam 0x8000, 0x1000, 0x8B, -6, -33
	banim_frame_oam 0x0, 0x1000, 0xCB, -6, -17
	banim_frame_oam 0x0, 0x1000, 0x6B, -7, -41
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x42, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x23, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x65, -24, 0
	banim_frame_end
banim_sokm_sp1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x0, 0xE3, -13, -47
	banim_frame_oam 0x0, 0x0, 0xC2, -21, -55
	banim_frame_oam 0x0, 0x0, 0xE2, -21, -47
	banim_frame_oam 0x0, 0x0, 0xC3, -13, -55
	banim_frame_oam 0x0, 0x0, 0xC3, -5, -47
	banim_frame_oam 0x0, 0x0, 0xE2, -13, -39
	banim_frame_oam 0x0, 0x0, 0xE4, -5, -39
	banim_frame_oam 0x0, 0x5000, 0x51, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0x53, -20, -16
	banim_frame_oam 0x4000, 0x5000, 0x8D, 4, 0
	banim_frame_oam 0x4000, 0x1000, 0x91, -12, 0
	banim_frame_oam 0x4000, 0x5000, 0xAE, -4, 8
	banim_frame_oam 0x4000, 0x1000, 0xB2, -20, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -28, 8
	banim_frame_oam 0x0, 0x1000, 0xAD, -28, -15
	banim_frame_oam 0x4000, 0x1000, 0x31, -12, -24
	banim_frame_oam 0x0, 0x1000, 0x33, -20, -24
	banim_frame_oam 0x4000, 0x1000, 0x34, 3, -32
	banim_frame_oam 0x0, 0x1000, 0x36, -5, -32
	banim_frame_oam 0x0, 0x1000, 0x15, 0, -40
	banim_frame_oam 0x4000, 0x1000, 0x12, 11, -24
	banim_frame_oam 0x0, 0x1000, 0x14, 3, -24
	banim_frame_oam 0x0, 0x5000, 0x4E, 12, -16
	banim_frame_oam 0x8000, 0x1000, 0x50, 4, -16
	banim_frame_oam 0x0, 0x1000, 0x6D, 28, -8
	banim_frame_oam 0x0, 0x1000, 0x11, 28, -16
	banim_frame_end
banim_sokm_sp1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x55, 13, -16
	banim_frame_oam 0x0, 0x5000, 0x17, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x16, 5, -8
	banim_frame_oam 0x0, 0x5000, 0x39, 21, -32
	banim_frame_oam 0x0, 0x1000, 0x1A, 21, -40
	banim_frame_oam 0x8000, 0x1000, 0x54, 21, -61
	banim_frame_oam 0x0, 0x1000, 0x74, 21, -45
	banim_frame_oam 0x0, 0x1000, 0x19, 37, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0xDA, 30, 0
	banim_frame_oam 0x8000, 0x1000, 0xDE, 22, 0
	banim_frame_oam 0x0, 0x1000, 0xFF, 14, 8
	banim_frame_oam 0x4000, 0x5000, 0xBB, 22, -8
	banim_frame_oam 0x0, 0x1000, 0xBF, 14, -8
	banim_frame_oam 0x4000, 0x1000, 0xB9, 33, -16
	banim_frame_oam 0x4000, 0x1000, 0x79, 49, -16
	banim_frame_oam 0x4000, 0x1000, 0x9E, 14, -16
	banim_frame_oam 0x0, 0x1000, 0x9D, 30, -16
	banim_frame_oam 0x4000, 0x1000, 0x5C, 25, -32
	banim_frame_oam 0x0, 0x1000, 0x5E, 17, -32
	banim_frame_oam 0x0, 0x1000, 0xDF, 54, -8
	banim_frame_oam 0x4000, 0x1000, 0x7D, 17, -24
	banim_frame_oam 0x0, 0x1000, 0x1D, 33, -24
	banim_frame_oam 0x0, 0x1000, 0xCD, 41, -22
	banim_frame_end
banim_sokm_sp1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x99, 58, -13
	banim_frame_oam 0x0, 0x1000, 0xB4, 66, -13
	banim_frame_end
banim_sokm_sp1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x24, -10, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0xA4, -10, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, 6, -32
	banim_frame_oam 0x0, 0x1000, 0x1, 38, 8
	banim_frame_oam 0x8000, 0x1000, 0x60, 38, -23
	banim_frame_oam 0x0, 0x1000, 0x5, -18, -15
	banim_frame_oam 0x0, 0x1000, 0x4, -18, -23
	banim_frame_oam 0x8000, 0x9000, 0x21, 14, -24
	banim_frame_oam 0x8000, 0x5000, 0x23, 6, -24
	banim_frame_oam 0x8000, 0x1000, 0x20, 30, -24
	banim_frame_oam 0x0, 0x5000, 0x86, 5, -48
	banim_frame_oam 0x4000, 0x1000, 0x6B, 13, -56
	banim_frame_oam 0x0, 0x1000, 0x6D, 5, -56
	banim_frame_oam 0x0, 0x1000, 0x28, 14, -64
	banim_frame_oam 0x0, 0x1000, 0x4A, 6, -64
	banim_frame_end
banim_sokm_sp1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x24, -11, -24
	banim_frame_oam 0x4000, 0x1000, 0xA4, -11, 8
	banim_frame_oam 0x8000, 0x1000, 0x60, 37, -23
	banim_frame_oam 0x0, 0x1000, 0x5, -19, -15
	banim_frame_oam 0x0, 0x1000, 0x4, -19, -23
	banim_frame_oam 0x8000, 0x5000, 0x23, 5, -24
	banim_frame_oam 0x8000, 0x1000, 0x20, 29, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 5, -32
	banim_frame_oam 0x8000, 0x1000, 0x42, 13, -16
	banim_frame_oam 0x0, 0x1000, 0x82, 13, 0
	banim_frame_oam 0x8000, 0x5000, 0x21, 21, -24
	banim_frame_oam 0x8000, 0x1000, 0x88, 13, -32
	banim_frame_oam 0x4000, 0x5000, 0xE0, 13, 8
	banim_frame_oam 0x0, 0x1000, 0xA3, 5, 8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -1, -28
	banim_frame_oam 0x0, 0x1000, 0xE6, -9, -28
	banim_frame_oam 0x0, 0x1000, 0xE7, -9, -36
	banim_frame_end
banim_sokm_sp1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x2E, -19, -24
	banim_frame_oam 0x8000, 0x9000, 0x32, -35, -24
	banim_frame_oam 0x4000, 0x5000, 0xAE, -19, 8
	banim_frame_oam 0x4000, 0x1000, 0xB2, -35, 8
	banim_frame_oam 0x4000, 0x1000, 0x10, -18, -32
	banim_frame_oam 0x0, 0x1000, 0x13, 13, -16
	banim_frame_oam 0x0, 0x1000, 0x12, 13, -24
	banim_frame_oam 0x0, 0x1000, 0xF, 21, -16
	banim_frame_end
banim_sokm_sp1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x89, -29, -32
	banim_frame_oam 0x8000, 0x1000, 0x8D, -37, -32
	banim_frame_oam 0x0, 0x1000, 0xCD, -13, -40
	banim_frame_oam 0x8000, 0x1000, 0xCE, 3, -16
	banim_frame_oam 0x4000, 0x9000, 0xCF, -37, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -45, 0
	banim_frame_oam 0x0, 0x1000, 0xED, -37, -8
	banim_frame_oam 0x4000, 0x1000, 0xD, -40, -15
	banim_frame_oam 0x0, 0x1000, 0x6, -40, -23
	banim_frame_oam 0x4000, 0x3000, 0xE4, -32, -23
	banim_frame_oam 0x0, 0x3000, 0xE6, -40, -23
	banim_frame_oam 0x0, 0x3000, 0xE7, -40, -15
	banim_frame_end
banim_sokm_sp1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x89, -29, -32
	banim_frame_oam 0x8000, 0x1000, 0x8D, -37, -32
	banim_frame_oam 0x0, 0x1000, 0xCD, -13, -40
	banim_frame_oam 0x8000, 0x1000, 0xCE, 3, -16
	banim_frame_oam 0x4000, 0x9000, 0xCF, -37, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -45, 0
	banim_frame_oam 0x0, 0x1000, 0xED, -37, -8
	banim_frame_oam 0x4000, 0x3000, 0xE4, -32, -23
	banim_frame_oam 0x0, 0x3000, 0xE6, -40, -23
	banim_frame_oam 0x0, 0x3000, 0xE7, -40, -15
	banim_frame_end
banim_sokm_sp1_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x5000, 0x1A, -18, -30
	banim_frame_oam 0x0, 0x1000, 0x9A, -18, 2
	banim_frame_oam 0x8000, 0x5000, 0x3B, -26, -22
	banim_frame_oam 0x8000, 0x5000, 0x36, -10, -30
	banim_frame_oam 0x8000, 0x1000, 0xB6, -10, 2
	banim_frame_oam 0x8000, 0x5000, 0x35, -2, -30
	banim_frame_oam 0x8000, 0x1000, 0xB5, -2, 2
	banim_frame_oam 0x8000, 0x5000, 0x54, 6, -22
	banim_frame_oam 0x0, 0x1000, 0xD4, 6, 10
	banim_frame_oam 0x0, 0x1000, 0x34, 14, -12
	banim_frame_oam 0x0, 0x1000, 0x17, 14, -20
	banim_frame_oam 0x4000, 0x1000, 0xD7, -26, 10
	banim_frame_oam 0x0, 0x1000, 0xD9, -34, 10
	banim_frame_oam 0x8000, 0x5000, 0x59, -34, -22
	banim_frame_oam 0x0, 0x1000, 0x19, -42, -14
	banim_frame_end
banim_sokm_sp1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x1000, 0xC2, 0, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, -15
	banim_frame_oam 0x4000, 0x1000, 0xC0, 0, -7
	banim_frame_oam 0x4000, 0x1000, 0x25, 13, 8
	banim_frame_oam 0x0, 0x1000, 0x5, 21, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x1, -24, -6
	banim_frame_end
banim_sokm_sp1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0x45, 13, 8
	banim_frame_oam 0x4000, 0x1000, 0xC2, 0, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, -15
	banim_frame_oam 0x4000, 0x1000, 0xC0, 0, -7
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x1, -24, -6
	banim_frame_end
banim_sokm_sp1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x1000, 0x6, 21, 8
	banim_frame_oam 0x4000, 0x1000, 0xC2, 0, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, -15
	banim_frame_oam 0x4000, 0x1000, 0xC0, 0, -7
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x1, -24, -6
	banim_frame_end
banim_sokm_sp1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x1000, 0xC2, 0, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, -15
	banim_frame_oam 0x4000, 0x1000, 0xC0, 0, -7
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x1, -24, -6
	banim_frame_end
banim_sokm_sp1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x1000, 0xC2, 2, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, -6, -15
	banim_frame_oam 0x4000, 0x1000, 0xC0, 2, -7
	banim_frame_oam 0x4000, 0x9000, 0x7, -9, 0
	banim_frame_oam 0x8000, 0x1000, 0xB, -17, 0
	banim_frame_oam 0x0, 0x5000, 0xC9, -6, -16
	banim_frame_oam 0x8000, 0x1000, 0xCB, -14, -16
	banim_frame_oam 0x0, 0x5000, 0xAC, 10, -24
	banim_frame_oam 0x4000, 0x1000, 0xEC, 10, -8
	banim_frame_oam 0x0, 0x0, 0x93, -22, -5
	banim_frame_oam 0x0, 0x5000, 0x2, -6, -32
	banim_frame_oam 0x0, 0x1000, 0x24, -14, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x1000, 0xC2, 1, -13
	banim_frame_oam 0x0, 0x1000, 0xC4, -7, -13
	banim_frame_oam 0x4000, 0x1000, 0xC0, 1, -5
	banim_frame_oam 0x4000, 0x9000, 0x47, -10, 0
	banim_frame_oam 0x8000, 0x1000, 0x4B, -18, 0
	banim_frame_oam 0x0, 0x5000, 0xC9, -7, -14
	banim_frame_oam 0x0, 0x5000, 0xAC, 9, -22
	banim_frame_oam 0x8000, 0x1000, 0xAE, -15, -14
	banim_frame_oam 0x4000, 0x1000, 0x60, 9, -6
	banim_frame_oam 0x0, 0x5000, 0x2, -7, -30
	banim_frame_oam 0x0, 0x1000, 0x24, -15, -22
	banim_frame_end
banim_sokm_sp1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x1000, 0xC2, -2, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, -10, -15
	banim_frame_oam 0x4000, 0x1000, 0xC0, -2, -7
	banim_frame_oam 0x4000, 0x9000, 0x20, -10, -24
	banim_frame_oam 0x4000, 0x5000, 0x60, -10, -8
	banim_frame_oam 0x8000, 0x1000, 0xAE, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x24, -18, -24
	banim_frame_oam 0x4000, 0x1000, 0x2, -10, -32
	banim_frame_oam 0x4000, 0x9000, 0x87, -10, 0
	banim_frame_oam 0x8000, 0x1000, 0x8B, -18, 0
	banim_frame_end
banim_sokm_sp1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x1000, 0xC2, -4, -13
	banim_frame_oam 0x0, 0x1000, 0xC4, -12, -13
	banim_frame_oam 0x4000, 0x1000, 0xC0, -4, -5
	banim_frame_oam 0x4000, 0x9000, 0x47, -15, 0
	banim_frame_oam 0x8000, 0x1000, 0x4B, -23, 0
	banim_frame_oam 0x0, 0x5000, 0xC9, -12, -14
	banim_frame_oam 0x0, 0x5000, 0xAC, 4, -22
	banim_frame_oam 0x8000, 0x1000, 0xAE, -20, -14
	banim_frame_oam 0x4000, 0x1000, 0x60, 4, -6
	banim_frame_oam 0x0, 0x5000, 0x2, -12, -30
	banim_frame_oam 0x0, 0x1000, 0x24, -20, -22
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xC2, -5, -15
	banim_frame_oam 0x0, 0x1000, 0xC4, -13, -15
	banim_frame_oam 0x4000, 0x1000, 0xC0, -5, -7
	banim_frame_oam 0x4000, 0x9000, 0x7, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xB, -24, 0
	banim_frame_oam 0x0, 0x5000, 0xC9, -13, -16
	banim_frame_oam 0x8000, 0x1000, 0xCB, -21, -16
	banim_frame_oam 0x0, 0x5000, 0xAC, 3, -24
	banim_frame_oam 0x4000, 0x1000, 0xEC, 3, -8
	banim_frame_oam 0x0, 0x0, 0x93, -29, -5
	banim_frame_oam 0x0, 0x5000, 0x2, -13, -32
	banim_frame_oam 0x0, 0x1000, 0x24, -21, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_38_l:
	banim_frame_oam 0x4000, 0x1000, 0xC2, -13, -13
	banim_frame_oam 0x0, 0x1000, 0xC4, -21, -13
	banim_frame_oam 0x4000, 0x1000, 0xC0, -13, -5
	banim_frame_oam 0x0, 0x9000, 0xC, -23, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -23, 8
	banim_frame_oam 0x8000, 0x9000, 0x30, -39, -16
	banim_frame_oam 0x4000, 0x1000, 0x10, -21, -32
	banim_frame_oam 0x8000, 0x1000, 0x65, 9, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_39_l:
	banim_frame_oam 0x8000, 0x1000, 0xA5, -29, -12
	banim_frame_oam 0x0, 0x1000, 0xC6, -31, -20
	banim_frame_oam 0x0, 0x9000, 0x12, -27, -32
	banim_frame_oam 0x8000, 0x5000, 0x16, -35, -32
	banim_frame_oam 0x4000, 0x1000, 0x94, -27, 0
	banim_frame_oam 0x0, 0x1000, 0x96, -35, 0
	banim_frame_oam 0x4000, 0x5000, 0xB2, -27, 8
	banim_frame_oam 0x0, 0x1000, 0xB6, -35, 8
	banim_frame_oam 0x8000, 0x1000, 0xC8, -43, -6
	banim_frame_oam 0x0, 0x1000, 0x93, 5, -30
	banim_frame_oam 0x0, 0x1000, 0x92, -20, -40
	banim_frame_end
banim_sokm_sp1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sokm_sp1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sokm_sp1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sokm_sp1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sokm_sp1_oam_frame_40_l:
	banim_frame_oam 0x4000, 0x9000, 0xDA, 30, 0
	banim_frame_oam 0x8000, 0x1000, 0xDE, 22, 0
	banim_frame_oam 0x0, 0x1000, 0xFF, 14, 8
	banim_frame_oam 0x4000, 0x5000, 0xBB, 22, -8
	banim_frame_oam 0x0, 0x1000, 0xBF, 14, -8
	banim_frame_oam 0x4000, 0x1000, 0xB9, 33, -16
	banim_frame_oam 0x4000, 0x1000, 0x79, 49, -16
	banim_frame_oam 0x4000, 0x1000, 0x9E, 14, -16
	banim_frame_oam 0x0, 0x1000, 0x9D, 30, -16
	banim_frame_oam 0x4000, 0x1000, 0x5C, 25, -32
	banim_frame_oam 0x0, 0x1000, 0x5E, 17, -32
	banim_frame_oam 0x4000, 0x5000, 0x7B, 17, -24
	banim_frame_oam 0x0, 0x1000, 0xDF, 54, -8
	banim_frame_oam 0x0, 0x1000, 0x99, 58, -13
	banim_frame_oam 0x0, 0x1000, 0xB4, 66, -13
	banim_frame_end
banim_sokm_sp1_oam_frame_37_l:
	banim_frame_oam 0x8000, 0x1000, 0x3F, -6, -49
	banim_frame_oam 0x0, 0x1000, 0x7F, -3, -57
	banim_frame_oam 0x0, 0x1000, 0x1E, 2, -49
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x42, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x23, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, -16, -39
	banim_frame_oam 0x0, 0x1000, 0xC5, 0, -23
	banim_frame_oam 0x0, 0x1000, 0x67, -8, -23
	banim_frame_oam 0x0, 0x1000, 0xC7, -16, -23
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_sokm_sp1_oam_r:
banim_sokm_sp1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0x0, 0x5, -4, -15
	banim_frame_oam 0x4000, 0x0, 0x3, -4, -7
	banim_frame_oam 0x0, 0x0, 0x60, -12, -7
	banim_frame_oam 0x0, 0x4000, 0x7, 0, -32
	banim_frame_oam 0x4000, 0x0, 0x47, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x26, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0x66, -6, -17
	banim_frame_oam 0x0, 0x0, 0xC8, -14, -17
	banim_frame_oam 0x0, 0x0, 0x80, -22, -17
	banim_frame_oam 0x0, 0x4000, 0x67, 0, -32
	banim_frame_oam 0x4000, 0x0, 0xA7, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x86, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x4000, 0x4B, -21, -35
	banim_frame_oam 0x0, 0x0, 0x8B, -5, -19
	banim_frame_oam 0x0, 0x0, 0x4C, -5, -27
	banim_frame_oam 0x0, 0x0, 0x6B, -13, -19
	banim_frame_oam 0x0, 0x4000, 0x67, 0, -32
	banim_frame_oam 0x4000, 0x0, 0xA7, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x86, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0xAB, -9, -36
	banim_frame_oam 0x0, 0x0, 0xCC, -5, -28
	banim_frame_oam 0x0, 0x0, 0xCD, -3, -20
	banim_frame_oam 0x0, 0x4000, 0x67, 0, -32
	banim_frame_oam 0x4000, 0x0, 0xA7, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x86, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_26_r:
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_oam 0x0, 0x0, 0xC, -13, -28
	banim_frame_oam 0x8000, 0x0, 0xB, -21, -30
	banim_frame_oam 0x4000, 0x0, 0x29, -37, -22
	banim_frame_oam 0x0, 0x0, 0x9, -37, -30
	banim_frame_oam 0x0, 0x0, 0xD, 2, -38
	banim_frame_oam 0x4000, 0x0, 0xAD, -5, -22
	banim_frame_oam 0x4000, 0x0, 0x2D, -5, -30
	banim_frame_end
banim_sokm_sp1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_oam 0x0, 0x4000, 0xF, -13, -30
	banim_frame_oam 0x0, 0x0, 0xD, 2, -38
	banim_frame_oam 0x8000, 0x0, 0x52, 3, -30
	banim_frame_end
banim_sokm_sp1_oam_frame_28_r:
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_oam 0x0, 0x0, 0x12, -15, -26
	banim_frame_oam 0x4000, 0x8000, 0x13, -7, -36
	banim_frame_oam 0x4000, 0x4000, 0x53, -7, -20
	banim_frame_end
banim_sokm_sp1_oam_frame_29_r:
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x75, -13, -53
	banim_frame_oam 0x4000, 0x0, 0x58, -5, -37
	banim_frame_oam 0x4000, 0x0, 0x73, -5, -49
	banim_frame_oam 0x0, 0x4000, 0x78, -5, -29
	banim_frame_oam 0x0, 0x0, 0x97, -13, -21
	banim_frame_end
banim_sokm_sp1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, 0, -37
	banim_frame_oam 0x4000, 0x0, 0x5B, 0, -21
	banim_frame_oam 0x8000, 0x0, 0x7E, 16, -29
	banim_frame_oam 0x0, 0x0, 0xBE, 16, -13
	banim_frame_oam 0x4000, 0x0, 0x7C, 7, -5
	banim_frame_oam 0x0, 0x0, 0x9C, 7, 3
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xF1, -8, -23
	banim_frame_oam 0x0, 0x0, 0xF3, 8, -23
	banim_frame_oam 0x4000, 0x0, 0xD8, 0, -31
	banim_frame_oam 0x4000, 0x0, 0xDA, 16, -23
	banim_frame_oam 0x0, 0x0, 0xDC, 32, -23
	banim_frame_oam 0x4000, 0x0, 0xFB, 24, -15
	banim_frame_oam 0x4000, 0x0, 0xF9, 24, -7
	banim_frame_oam 0x0, 0x0, 0xF8, 24, 1
	banim_frame_end
banim_sokm_sp1_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x4000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x24, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x61, -16, 0
	banim_frame_oam 0x0, 0x0, 0x65, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x0, -24, -24
	banim_frame_oam 0x0, 0x0, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xDE, -6, -22
	banim_frame_oam 0x0, 0x0, 0xFF, 0, -30
	banim_frame_oam 0x8000, 0x0, 0x1E, 8, -46
	banim_frame_oam 0x0, 0x0, 0x5E, 8, -30
	banim_frame_oam 0x0, 0x0, 0x32, 16, -30
	banim_frame_oam 0x8000, 0x0, 0x11, 16, -55
	banim_frame_oam 0x0, 0x0, 0x2C, 8, -54
	banim_frame_oam 0x0, 0x0, 0x9D, 24, -54
	banim_frame_oam 0x0, 0x0, 0xA, 24, -46
	banim_frame_oam 0x0, 0x0, 0xD1, 32, -46
	banim_frame_oam 0x0, 0x0, 0xEF, 0, -38
	banim_frame_end
banim_sokm_sp1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -24, -8
	banim_frame_oam 0x0, 0x0, 0x42, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x23, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x25, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x65, 16, 0
	banim_frame_oam 0x8000, 0x0, 0x27, 0, -39
	banim_frame_oam 0x0, 0x0, 0x67, 0, -23
	banim_frame_oam 0x8000, 0x0, 0x87, 8, -39
	banim_frame_oam 0x0, 0x0, 0xC7, 8, -23
	banim_frame_oam 0x0, 0x0, 0xC5, -8, -23
	banim_frame_oam 0x8000, 0x0, 0x28, 0, -61
	banim_frame_oam 0x0, 0x0, 0x68, 0, -45
	banim_frame_oam 0x4000, 0x0, 0x29, 8, -61
	banim_frame_end
banim_sokm_sp1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x0, 0x54, 1, -60
	banim_frame_oam 0x0, 0x0, 0x94, 1, -44
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -24, -8
	banim_frame_oam 0x0, 0x0, 0x42, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x23, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x25, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x65, 16, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, 0, -39
	banim_frame_oam 0x0, 0x0, 0xC5, -8, -23
	banim_frame_oam 0x0, 0x0, 0x67, 0, -23
	banim_frame_oam 0x0, 0x0, 0xC7, 8, -23
	banim_frame_end
banim_sokm_sp1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x0, 0xA0, -5, -56
	banim_frame_oam 0x8000, 0x0, 0x60, -2, -48
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -24, -8
	banim_frame_oam 0x0, 0x0, 0x42, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x23, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x25, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x65, 16, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, 0, -39
	banim_frame_oam 0x0, 0x0, 0xC5, -8, -23
	banim_frame_oam 0x0, 0x0, 0x67, 0, -23
	banim_frame_oam 0x0, 0x0, 0xC7, 8, -23
	banim_frame_end
banim_sokm_sp1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x0, 0xE5, -13, -16
	banim_frame_oam 0x0, 0x0, 0xEC, -13, -24
	banim_frame_oam 0x0, 0x0, 0xE7, 3, -16
	banim_frame_oam 0x4000, 0x0, 0x3, -13, -8
	banim_frame_oam 0x0, 0x0, 0x5, 3, -8
	banim_frame_oam 0x0, 0x0, 0xEB, 3, -24
	banim_frame_oam 0x8000, 0x0, 0x8C, 6, -33
	banim_frame_oam 0x0, 0x0, 0xCC, 6, -17
	banim_frame_oam 0x0, 0x0, 0xAA, -10, -23
	banim_frame_oam 0x8000, 0x0, 0x8B, -2, -33
	banim_frame_oam 0x0, 0x0, 0xCB, -2, -17
	banim_frame_oam 0x0, 0x0, 0x6B, -1, -41
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -24, -8
	banim_frame_oam 0x0, 0x0, 0x42, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x23, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x25, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x65, 16, 0
	banim_frame_end
banim_sokm_sp1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x1000, 0xE3, 5, -47
	banim_frame_oam 0x0, 0x1000, 0xC2, 13, -55
	banim_frame_oam 0x0, 0x1000, 0xE2, 13, -47
	banim_frame_oam 0x0, 0x1000, 0xC3, 5, -55
	banim_frame_oam 0x0, 0x1000, 0xC3, -3, -47
	banim_frame_oam 0x0, 0x1000, 0xE2, 5, -39
	banim_frame_oam 0x0, 0x1000, 0xE4, -3, -39
	banim_frame_oam 0x0, 0x4000, 0x51, -4, -16
	banim_frame_oam 0x8000, 0x0, 0x53, 12, -16
	banim_frame_oam 0x4000, 0x4000, 0x8D, -36, 0
	banim_frame_oam 0x4000, 0x0, 0x91, -4, 0
	banim_frame_oam 0x4000, 0x4000, 0xAE, -28, 8
	banim_frame_oam 0x4000, 0x0, 0xB2, 4, 8
	banim_frame_oam 0x0, 0x0, 0x93, 20, 8
	banim_frame_oam 0x0, 0x0, 0xAD, 20, -15
	banim_frame_oam 0x4000, 0x0, 0x31, -4, -24
	banim_frame_oam 0x0, 0x0, 0x33, 12, -24
	banim_frame_oam 0x4000, 0x0, 0x34, -19, -32
	banim_frame_oam 0x0, 0x0, 0x36, -3, -32
	banim_frame_oam 0x0, 0x0, 0x15, -8, -40
	banim_frame_oam 0x4000, 0x0, 0x12, -27, -24
	banim_frame_oam 0x0, 0x0, 0x14, -11, -24
	banim_frame_oam 0x0, 0x4000, 0x4E, -28, -16
	banim_frame_oam 0x8000, 0x0, 0x50, -12, -16
	banim_frame_oam 0x0, 0x0, 0x6D, -36, -8
	banim_frame_oam 0x0, 0x0, 0x11, -36, -16
	banim_frame_end
banim_sokm_sp1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x55, -45, -16
	banim_frame_oam 0x0, 0x4000, 0x17, -13, -24
	banim_frame_oam 0x0, 0x0, 0x16, -13, -8
	banim_frame_oam 0x0, 0x4000, 0x39, -37, -32
	banim_frame_oam 0x0, 0x0, 0x1A, -29, -40
	banim_frame_oam 0x8000, 0x0, 0x54, -29, -61
	banim_frame_oam 0x0, 0x0, 0x74, -29, -45
	banim_frame_oam 0x0, 0x0, 0x19, -45, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0xDA, -62, 0
	banim_frame_oam 0x8000, 0x0, 0xDE, -30, 0
	banim_frame_oam 0x0, 0x0, 0xFF, -22, 8
	banim_frame_oam 0x4000, 0x4000, 0xBB, -54, -8
	banim_frame_oam 0x0, 0x0, 0xBF, -22, -8
	banim_frame_oam 0x4000, 0x0, 0xB9, -49, -16
	banim_frame_oam 0x4000, 0x0, 0x79, -65, -16
	banim_frame_oam 0x4000, 0x0, 0x9E, -30, -16
	banim_frame_oam 0x0, 0x0, 0x9D, -38, -16
	banim_frame_oam 0x4000, 0x0, 0x5C, -41, -32
	banim_frame_oam 0x0, 0x0, 0x5E, -25, -32
	banim_frame_oam 0x0, 0x0, 0xDF, -62, -8
	banim_frame_oam 0x4000, 0x0, 0x7D, -33, -24
	banim_frame_oam 0x0, 0x0, 0x1D, -41, -24
	banim_frame_oam 0x0, 0x0, 0xCD, -49, -22
	banim_frame_end
banim_sokm_sp1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x99, -66, -13
	banim_frame_oam 0x0, 0x0, 0xB4, -74, -13
	banim_frame_end
banim_sokm_sp1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x24, -6, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -38, 8
	banim_frame_oam 0x4000, 0x0, 0xA4, -6, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -22, -32
	banim_frame_oam 0x0, 0x0, 0x1, -46, 8
	banim_frame_oam 0x8000, 0x0, 0x60, -46, -23
	banim_frame_oam 0x0, 0x0, 0x5, 10, -15
	banim_frame_oam 0x0, 0x0, 0x4, 10, -23
	banim_frame_oam 0x8000, 0x8000, 0x21, -30, -24
	banim_frame_oam 0x8000, 0x4000, 0x23, -14, -24
	banim_frame_oam 0x8000, 0x0, 0x20, -38, -24
	banim_frame_oam 0x0, 0x4000, 0x86, -21, -48
	banim_frame_oam 0x4000, 0x0, 0x6B, -29, -56
	banim_frame_oam 0x0, 0x0, 0x6D, -13, -56
	banim_frame_oam 0x0, 0x0, 0x28, -22, -64
	banim_frame_oam 0x0, 0x0, 0x4A, -14, -64
	banim_frame_end
banim_sokm_sp1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x24, -5, -24
	banim_frame_oam 0x4000, 0x0, 0xA4, -5, 8
	banim_frame_oam 0x8000, 0x0, 0x60, -45, -23
	banim_frame_oam 0x0, 0x0, 0x5, 11, -15
	banim_frame_oam 0x0, 0x0, 0x4, 11, -23
	banim_frame_oam 0x8000, 0x4000, 0x23, -13, -24
	banim_frame_oam 0x8000, 0x0, 0x20, -37, -24
	banim_frame_oam 0x0, 0x0, 0x3, -13, -32
	banim_frame_oam 0x8000, 0x0, 0x42, -21, -16
	banim_frame_oam 0x0, 0x0, 0x82, -21, 0
	banim_frame_oam 0x8000, 0x4000, 0x21, -29, -24
	banim_frame_oam 0x8000, 0x0, 0x88, -21, -32
	banim_frame_oam 0x4000, 0x4000, 0xE0, -45, 8
	banim_frame_oam 0x0, 0x0, 0xA3, -13, 8
	banim_frame_oam 0x4000, 0x0, 0xE4, -15, -28
	banim_frame_oam 0x0, 0x0, 0xE6, 1, -28
	banim_frame_oam 0x0, 0x0, 0xE7, 1, -36
	banim_frame_end
banim_sokm_sp1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x2E, -13, -24
	banim_frame_oam 0x8000, 0x8000, 0x32, 19, -24
	banim_frame_oam 0x4000, 0x4000, 0xAE, -13, 8
	banim_frame_oam 0x4000, 0x0, 0xB2, 19, 8
	banim_frame_oam 0x4000, 0x0, 0x10, 2, -32
	banim_frame_oam 0x0, 0x0, 0x13, -21, -16
	banim_frame_oam 0x0, 0x0, 0x12, -21, -24
	banim_frame_oam 0x0, 0x0, 0xF, -29, -16
	banim_frame_end
banim_sokm_sp1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x89, -3, -32
	banim_frame_oam 0x8000, 0x0, 0x8D, 29, -32
	banim_frame_oam 0x0, 0x0, 0xCD, 5, -40
	banim_frame_oam 0x8000, 0x0, 0xCE, -11, -16
	banim_frame_oam 0x4000, 0x8000, 0xCF, 5, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 37, 0
	banim_frame_oam 0x0, 0x0, 0xED, 29, -8
	banim_frame_oam 0x4000, 0x0, 0xD, 24, -15
	banim_frame_oam 0x0, 0x0, 0x6, 32, -23
	banim_frame_oam 0x4000, 0x2000, 0xE4, 16, -23
	banim_frame_oam 0x0, 0x2000, 0xE6, 32, -23
	banim_frame_oam 0x0, 0x2000, 0xE7, 32, -15
	banim_frame_end
banim_sokm_sp1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x89, -3, -32
	banim_frame_oam 0x8000, 0x0, 0x8D, 29, -32
	banim_frame_oam 0x0, 0x0, 0xCD, 5, -40
	banim_frame_oam 0x8000, 0x0, 0xCE, -11, -16
	banim_frame_oam 0x4000, 0x8000, 0xCF, 5, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 37, 0
	banim_frame_oam 0x0, 0x0, 0xED, 29, -8
	banim_frame_oam 0x4000, 0x2000, 0xE4, 16, -23
	banim_frame_oam 0x0, 0x2000, 0xE6, 32, -23
	banim_frame_oam 0x0, 0x2000, 0xE7, 32, -15
	banim_frame_end
banim_sokm_sp1_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x4000, 0x1A, 10, -30
	banim_frame_oam 0x0, 0x0, 0x9A, 10, 2
	banim_frame_oam 0x8000, 0x4000, 0x3B, 18, -22
	banim_frame_oam 0x8000, 0x4000, 0x36, 2, -30
	banim_frame_oam 0x8000, 0x0, 0xB6, 2, 2
	banim_frame_oam 0x8000, 0x4000, 0x35, -6, -30
	banim_frame_oam 0x8000, 0x0, 0xB5, -6, 2
	banim_frame_oam 0x8000, 0x4000, 0x54, -14, -22
	banim_frame_oam 0x0, 0x0, 0xD4, -14, 10
	banim_frame_oam 0x0, 0x0, 0x34, -22, -12
	banim_frame_oam 0x0, 0x0, 0x17, -22, -20
	banim_frame_oam 0x4000, 0x0, 0xD7, 10, 10
	banim_frame_oam 0x0, 0x0, 0xD9, 26, 10
	banim_frame_oam 0x8000, 0x4000, 0x59, 26, -22
	banim_frame_oam 0x0, 0x0, 0x19, 34, -14
	banim_frame_end
banim_sokm_sp1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x0, 0xC2, -16, -15
	banim_frame_oam 0x0, 0x0, 0xC4, 0, -15
	banim_frame_oam 0x4000, 0x0, 0xC0, -16, -7
	banim_frame_oam 0x4000, 0x0, 0x25, -29, 8
	banim_frame_oam 0x0, 0x0, 0x5, -29, 0
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -32
	banim_frame_oam 0x0, 0x0, 0x1, 16, -6
	banim_frame_end
banim_sokm_sp1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0x45, -29, 8
	banim_frame_oam 0x4000, 0x0, 0xC2, -16, -15
	banim_frame_oam 0x0, 0x0, 0xC4, 0, -15
	banim_frame_oam 0x4000, 0x0, 0xC0, -16, -7
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -32
	banim_frame_oam 0x0, 0x0, 0x1, 16, -6
	banim_frame_end
banim_sokm_sp1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x0, 0x6, -29, 8
	banim_frame_oam 0x4000, 0x0, 0xC2, -16, -15
	banim_frame_oam 0x0, 0x0, 0xC4, 0, -15
	banim_frame_oam 0x4000, 0x0, 0xC0, -16, -7
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -32
	banim_frame_oam 0x0, 0x0, 0x1, 16, -6
	banim_frame_end
banim_sokm_sp1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x0, 0xC2, -16, -15
	banim_frame_oam 0x0, 0x0, 0xC4, 0, -15
	banim_frame_oam 0x4000, 0x0, 0xC0, -16, -7
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -32
	banim_frame_oam 0x0, 0x0, 0x1, 16, -6
	banim_frame_end
banim_sokm_sp1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x0, 0xC2, -18, -15
	banim_frame_oam 0x0, 0x0, 0xC4, -2, -15
	banim_frame_oam 0x4000, 0x0, 0xC0, -18, -7
	banim_frame_oam 0x4000, 0x8000, 0x7, -23, 0
	banim_frame_oam 0x8000, 0x0, 0xB, 9, 0
	banim_frame_oam 0x0, 0x4000, 0xC9, -10, -16
	banim_frame_oam 0x8000, 0x0, 0xCB, 6, -16
	banim_frame_oam 0x0, 0x4000, 0xAC, -26, -24
	banim_frame_oam 0x4000, 0x0, 0xEC, -26, -8
	banim_frame_oam 0x0, 0x1000, 0x93, 14, -5
	banim_frame_oam 0x0, 0x4000, 0x2, -10, -32
	banim_frame_oam 0x0, 0x0, 0x24, 6, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x0, 0xC2, -17, -13
	banim_frame_oam 0x0, 0x0, 0xC4, -1, -13
	banim_frame_oam 0x4000, 0x0, 0xC0, -17, -5
	banim_frame_oam 0x4000, 0x8000, 0x47, -22, 0
	banim_frame_oam 0x8000, 0x0, 0x4B, 10, 0
	banim_frame_oam 0x0, 0x4000, 0xC9, -9, -14
	banim_frame_oam 0x0, 0x4000, 0xAC, -25, -22
	banim_frame_oam 0x8000, 0x0, 0xAE, 7, -14
	banim_frame_oam 0x4000, 0x0, 0x60, -25, -6
	banim_frame_oam 0x0, 0x4000, 0x2, -9, -30
	banim_frame_oam 0x0, 0x0, 0x24, 7, -22
	banim_frame_end
banim_sokm_sp1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x0, 0xC2, -14, -15
	banim_frame_oam 0x0, 0x0, 0xC4, 2, -15
	banim_frame_oam 0x4000, 0x0, 0xC0, -14, -7
	banim_frame_oam 0x4000, 0x8000, 0x20, -22, -24
	banim_frame_oam 0x4000, 0x4000, 0x60, -22, -8
	banim_frame_oam 0x8000, 0x0, 0xAE, 10, -16
	banim_frame_oam 0x0, 0x0, 0x24, 10, -24
	banim_frame_oam 0x4000, 0x0, 0x2, -6, -32
	banim_frame_oam 0x4000, 0x8000, 0x87, -22, 0
	banim_frame_oam 0x8000, 0x0, 0x8B, 10, 0
	banim_frame_end
banim_sokm_sp1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x0, 0xC2, -12, -13
	banim_frame_oam 0x0, 0x0, 0xC4, 4, -13
	banim_frame_oam 0x4000, 0x0, 0xC0, -12, -5
	banim_frame_oam 0x4000, 0x8000, 0x47, -17, 0
	banim_frame_oam 0x8000, 0x0, 0x4B, 15, 0
	banim_frame_oam 0x0, 0x4000, 0xC9, -4, -14
	banim_frame_oam 0x0, 0x4000, 0xAC, -20, -22
	banim_frame_oam 0x8000, 0x0, 0xAE, 12, -14
	banim_frame_oam 0x4000, 0x0, 0x60, -20, -6
	banim_frame_oam 0x0, 0x4000, 0x2, -4, -30
	banim_frame_oam 0x0, 0x0, 0x24, 12, -22
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xC2, -11, -15
	banim_frame_oam 0x0, 0x0, 0xC4, 5, -15
	banim_frame_oam 0x4000, 0x0, 0xC0, -11, -7
	banim_frame_oam 0x4000, 0x8000, 0x7, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xB, 16, 0
	banim_frame_oam 0x0, 0x4000, 0xC9, -3, -16
	banim_frame_oam 0x8000, 0x0, 0xCB, 13, -16
	banim_frame_oam 0x0, 0x4000, 0xAC, -19, -24
	banim_frame_oam 0x4000, 0x0, 0xEC, -19, -8
	banim_frame_oam 0x0, 0x1000, 0x93, 21, -5
	banim_frame_oam 0x0, 0x4000, 0x2, -3, -32
	banim_frame_oam 0x0, 0x0, 0x24, 13, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_38_r:
	banim_frame_oam 0x4000, 0x0, 0xC2, -3, -13
	banim_frame_oam 0x0, 0x0, 0xC4, 13, -13
	banim_frame_oam 0x4000, 0x0, 0xC0, -3, -5
	banim_frame_oam 0x0, 0x8000, 0xC, -9, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -9, 8
	banim_frame_oam 0x8000, 0x8000, 0x30, 23, -16
	banim_frame_oam 0x4000, 0x0, 0x10, 5, -32
	banim_frame_oam 0x8000, 0x0, 0x65, -17, -24
	banim_frame_end
banim_sokm_sp1_oam_frame_39_r:
	banim_frame_oam 0x8000, 0x0, 0xA5, 21, -12
	banim_frame_oam 0x0, 0x0, 0xC6, 23, -20
	banim_frame_oam 0x0, 0x8000, 0x12, -5, -32
	banim_frame_oam 0x8000, 0x4000, 0x16, 27, -32
	banim_frame_oam 0x4000, 0x0, 0x94, 11, 0
	banim_frame_oam 0x0, 0x0, 0x96, 27, 0
	banim_frame_oam 0x4000, 0x4000, 0xB2, -5, 8
	banim_frame_oam 0x0, 0x0, 0xB6, 27, 8
	banim_frame_oam 0x8000, 0x0, 0xC8, 35, -6
	banim_frame_oam 0x0, 0x0, 0x93, -13, -30
	banim_frame_oam 0x0, 0x0, 0x92, 12, -40
	banim_frame_end
banim_sokm_sp1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sokm_sp1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sokm_sp1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sokm_sp1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sokm_sp1_oam_frame_40_r:
	banim_frame_oam 0x4000, 0x8000, 0xDA, -62, 0
	banim_frame_oam 0x8000, 0x0, 0xDE, -30, 0
	banim_frame_oam 0x0, 0x0, 0xFF, -22, 8
	banim_frame_oam 0x4000, 0x4000, 0xBB, -54, -8
	banim_frame_oam 0x0, 0x0, 0xBF, -22, -8
	banim_frame_oam 0x4000, 0x0, 0xB9, -49, -16
	banim_frame_oam 0x4000, 0x0, 0x79, -65, -16
	banim_frame_oam 0x4000, 0x0, 0x9E, -30, -16
	banim_frame_oam 0x0, 0x0, 0x9D, -38, -16
	banim_frame_oam 0x4000, 0x0, 0x5C, -41, -32
	banim_frame_oam 0x0, 0x0, 0x5E, -25, -32
	banim_frame_oam 0x4000, 0x4000, 0x7B, -49, -24
	banim_frame_oam 0x0, 0x0, 0xDF, -62, -8
	banim_frame_oam 0x0, 0x0, 0x99, -66, -13
	banim_frame_oam 0x0, 0x0, 0xB4, -74, -13
	banim_frame_end
banim_sokm_sp1_oam_frame_37_r:
	banim_frame_oam 0x8000, 0x0, 0x3F, -2, -49
	banim_frame_oam 0x0, 0x0, 0x7F, -5, -57
	banim_frame_oam 0x0, 0x0, 0x1E, -10, -49
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -24, -8
	banim_frame_oam 0x0, 0x0, 0x42, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x23, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x25, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x65, 16, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, 0, -39
	banim_frame_oam 0x0, 0x0, 0xC5, -8, -23
	banim_frame_oam 0x0, 0x0, 0x67, 0, -23
	banim_frame_oam 0x0, 0x0, 0xC7, 8, -23
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_sokm_sp1_script:
banim_sokm_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokm_sp1_sheet_1, 15, banim_sokm_sp1_oam_frame_1_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 16, banim_sokm_sp1_oam_frame_2_r - banim_sokm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 16, banim_sokm_sp1_oam_frame_2_r - banim_sokm_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 17, banim_sokm_sp1_oam_frame_3_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 19, banim_sokm_sp1_oam_frame_4_r - banim_sokm_sp1_oam_r
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 20, banim_sokm_sp1_oam_frame_5_r - banim_sokm_sp1_oam_r
	banim_code_frame 5, banim_sokm_sp1_sheet_2, 21, banim_sokm_sp1_oam_frame_6_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 22, banim_sokm_sp1_oam_frame_7_r - banim_sokm_sp1_oam_r
	banim_code_frame 13, banim_sokm_sp1_sheet_2, 23, banim_sokm_sp1_oam_frame_8_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 24, banim_sokm_sp1_oam_frame_9_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 25, banim_sokm_sp1_oam_frame_10_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 26, banim_sokm_sp1_oam_frame_11_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 27, banim_sokm_sp1_oam_frame_12_r - banim_sokm_sp1_oam_r
	banim_code_frame 20, banim_sokm_sp1_sheet_3, 28, banim_sokm_sp1_oam_frame_13_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 29, banim_sokm_sp1_oam_frame_14_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 30, banim_sokm_sp1_oam_frame_15_r - banim_sokm_sp1_oam_r
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 31, banim_sokm_sp1_oam_frame_16_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 31, banim_sokm_sp1_oam_frame_16_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 32, banim_sokm_sp1_oam_frame_17_r - banim_sokm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 18, banim_sokm_sp1_oam_frame_20_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 5, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 13, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 20, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 1, banim_sokm_sp1_oam_frame_23_r - banim_sokm_sp1_oam_r
	banim_code_frame 2, banim_sokm_sp1_sheet_0, 2, banim_sokm_sp1_oam_frame_24_r - banim_sokm_sp1_oam_r
	banim_code_frame 10, banim_sokm_sp1_sheet_0, 3, banim_sokm_sp1_oam_frame_25_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 4, banim_sokm_sp1_oam_frame_26_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 5, banim_sokm_sp1_oam_frame_27_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 6, banim_sokm_sp1_oam_frame_28_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 7, banim_sokm_sp1_oam_frame_29_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 8, banim_sokm_sp1_oam_frame_30_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 9, banim_sokm_sp1_oam_frame_31_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 10, banim_sokm_sp1_oam_frame_32_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 11, banim_sokm_sp1_oam_frame_33_r - banim_sokm_sp1_oam_r
	banim_code_frame 4, banim_sokm_sp1_sheet_1, 12, banim_sokm_sp1_oam_frame_34_r - banim_sokm_sp1_oam_r
	banim_code_frame 10, banim_sokm_sp1_sheet_1, 13, banim_sokm_sp1_oam_frame_35_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 14, banim_sokm_sp1_oam_frame_36_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokm_sp1_sheet_1, 15, banim_sokm_sp1_oam_frame_1_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 16, banim_sokm_sp1_oam_frame_2_r - banim_sokm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 16, banim_sokm_sp1_oam_frame_2_r - banim_sokm_sp1_oam_r
	banim_code_hit_critical_1
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 17, banim_sokm_sp1_oam_frame_3_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 19, banim_sokm_sp1_oam_frame_4_r - banim_sokm_sp1_oam_r
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 20, banim_sokm_sp1_oam_frame_5_r - banim_sokm_sp1_oam_r
	banim_code_frame 5, banim_sokm_sp1_sheet_2, 21, banim_sokm_sp1_oam_frame_6_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 22, banim_sokm_sp1_oam_frame_7_r - banim_sokm_sp1_oam_r
	banim_code_frame 13, banim_sokm_sp1_sheet_2, 23, banim_sokm_sp1_oam_frame_8_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 24, banim_sokm_sp1_oam_frame_9_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 25, banim_sokm_sp1_oam_frame_10_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 26, banim_sokm_sp1_oam_frame_11_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 27, banim_sokm_sp1_oam_frame_12_r - banim_sokm_sp1_oam_r
	banim_code_frame 20, banim_sokm_sp1_sheet_3, 28, banim_sokm_sp1_oam_frame_13_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 29, banim_sokm_sp1_oam_frame_14_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 30, banim_sokm_sp1_oam_frame_15_r - banim_sokm_sp1_oam_r
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 31, banim_sokm_sp1_oam_frame_16_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 31, banim_sokm_sp1_oam_frame_16_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 32, banim_sokm_sp1_oam_frame_17_r - banim_sokm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_frame 2, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_frame 10, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_frame 4, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_frame 10, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokm_sp1_sheet_0, 36, banim_sokm_sp1_oam_frame_18_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 37, banim_sokm_sp1_oam_frame_19_r - banim_sokm_sp1_oam_r
	banim_code_hit_critical_1
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 18, banim_sokm_sp1_oam_frame_20_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 5, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 13, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 38, banim_sokm_sp1_oam_frame_21_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 20, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 39, banim_sokm_sp1_oam_frame_22_r - banim_sokm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_frame 4, banim_sokm_sp1_sheet_0, 1, banim_sokm_sp1_oam_frame_23_r - banim_sokm_sp1_oam_r
	banim_code_frame 4, banim_sokm_sp1_sheet_0, 2, banim_sokm_sp1_oam_frame_24_r - banim_sokm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_sword_swing_short
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 13, banim_sokm_sp1_oam_frame_35_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 2, banim_sokm_sp1_oam_frame_24_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 1, banim_sokm_sp1_oam_frame_23_r - banim_sokm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_frame 4, banim_sokm_sp1_sheet_0, 1, banim_sokm_sp1_oam_frame_23_r - banim_sokm_sp1_oam_r
	banim_code_frame 4, banim_sokm_sp1_sheet_0, 2, banim_sokm_sp1_oam_frame_24_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokm_sp1_sheet_1, 13, banim_sokm_sp1_oam_frame_35_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 41, banim_sokm_sp1_oam_frame_37_r - banim_sokm_sp1_oam_r
	banim_code_frame 2, banim_sokm_sp1_sheet_1, 13, banim_sokm_sp1_oam_frame_35_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 41, banim_sokm_sp1_oam_frame_37_r - banim_sokm_sp1_oam_r
	banim_code_frame 2, banim_sokm_sp1_sheet_1, 13, banim_sokm_sp1_oam_frame_35_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 41, banim_sokm_sp1_oam_frame_37_r - banim_sokm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 13, banim_sokm_sp1_oam_frame_35_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 2, banim_sokm_sp1_oam_frame_24_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_0, 1, banim_sokm_sp1_oam_frame_23_r - banim_sokm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 34, banim_sokm_sp1_oam_frame_38_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 35, banim_sokm_sp1_oam_frame_39_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 34, banim_sokm_sp1_oam_frame_38_r - banim_sokm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 34, banim_sokm_sp1_oam_frame_38_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 35, banim_sokm_sp1_oam_frame_39_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 34, banim_sokm_sp1_oam_frame_38_r - banim_sokm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokm_sp1_mode_stand_close:
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sokm_sp1_mode_stand:
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sokm_sp1_mode_stand_range:
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sokm_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokm_sp1_sheet_0, 0, banim_sokm_sp1_oam_frame_0_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokm_sp1_sheet_1, 15, banim_sokm_sp1_oam_frame_1_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_1, 16, banim_sokm_sp1_oam_frame_2_r - banim_sokm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 16, banim_sokm_sp1_oam_frame_2_r - banim_sokm_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 1, banim_sokm_sp1_sheet_1, 40, banim_sokm_sp1_oam_frame_40_r - banim_sokm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 19, banim_sokm_sp1_oam_frame_4_r - banim_sokm_sp1_oam_r
	banim_code_frame 2, banim_sokm_sp1_sheet_2, 20, banim_sokm_sp1_oam_frame_5_r - banim_sokm_sp1_oam_r
	banim_code_frame 5, banim_sokm_sp1_sheet_2, 21, banim_sokm_sp1_oam_frame_6_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 22, banim_sokm_sp1_oam_frame_7_r - banim_sokm_sp1_oam_r
	banim_code_frame 13, banim_sokm_sp1_sheet_2, 23, banim_sokm_sp1_oam_frame_8_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_2, 24, banim_sokm_sp1_oam_frame_9_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 25, banim_sokm_sp1_oam_frame_10_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 26, banim_sokm_sp1_oam_frame_11_r - banim_sokm_sp1_oam_r
	banim_code_frame 1, banim_sokm_sp1_sheet_3, 27, banim_sokm_sp1_oam_frame_12_r - banim_sokm_sp1_oam_r
	banim_code_frame 20, banim_sokm_sp1_sheet_3, 28, banim_sokm_sp1_oam_frame_13_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 29, banim_sokm_sp1_oam_frame_14_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 30, banim_sokm_sp1_oam_frame_15_r - banim_sokm_sp1_oam_r
	banim_code_frame 7, banim_sokm_sp1_sheet_3, 31, banim_sokm_sp1_oam_frame_16_r - banim_sokm_sp1_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 31, banim_sokm_sp1_oam_frame_16_r - banim_sokm_sp1_oam_r
	banim_code_frame 3, banim_sokm_sp1_sheet_3, 32, banim_sokm_sp1_oam_frame_17_r - banim_sokm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_sokm_sp1_mode_attack_close - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_attack_close_back - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_attack_close_critical - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_attack_close_critical_back - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_attack_range - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_attack_range_critical - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_dodge_close - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_dodge_range - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_stand_close - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_stand - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_stand_range - banim_sokm_sp1_script
	.word banim_sokm_sp1_mode_attack_miss - banim_sokm_sp1_script
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

