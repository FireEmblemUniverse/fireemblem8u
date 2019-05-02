@ vim:ft=armv4
	.global banim_sokf_sp1_2_script
	.global banim_sokf_sp1_2_oam_r
	.global banim_sokf_sp1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x37
	.section .data.oam_l
banim_sokf_sp1_2_oam_l:
banim_sokf_sp1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x1000, 0x48, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xC2, -16, -13
	banim_frame_oam 0x4000, 0x1000, 0xC0, 8, -9
	banim_frame_oam 0x0, 0x1000, 0xC2, 0, -9
	banim_frame_oam 0x0, 0x1000, 0xC3, -8, -9
	banim_frame_oam 0x4000, 0x1000, 0xA3, -16, -17
	banim_frame_oam 0x0, 0x1000, 0xA5, -24, -17
	banim_frame_oam 0x4000, 0x1000, 0xA1, -40, -17
	banim_frame_oam 0x0, 0x1000, 0xA0, -40, -25
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
banim_sokf_sp1_2_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0xA7, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xC4, 16, -17
	banim_frame_oam 0x0, 0x1000, 0xC6, 8, -17
	banim_frame_oam 0x0, 0x1000, 0xC6, 0, -17
	banim_frame_oam 0x0, 0x1000, 0xC6, -8, -17
	banim_frame_oam 0x0, 0x1000, 0xC6, -16, -17
	banim_frame_oam 0x0, 0x1000, 0xC6, -24, -17
	banim_frame_oam 0x4000, 0x1000, 0xC6, -40, -17
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
banim_sokf_sp1_2_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0xA7, -8, -16
	banim_frame_oam 0x4000, 0x3000, 0xC0, 17, -22
	banim_frame_oam 0x0, 0x3000, 0xC2, 9, -22
	banim_frame_oam 0x0, 0x3000, 0xC3, 1, -22
	banim_frame_oam 0x4000, 0x3000, 0xA3, -7, -14
	banim_frame_oam 0x0, 0x3000, 0xA5, -15, -14
	banim_frame_oam 0x4000, 0x3000, 0xA1, -31, -14
	banim_frame_oam 0x0, 0x3000, 0xA0, -31, -6
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
banim_sokf_sp1_2_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0xA7, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xA9, 8, -38
	banim_frame_oam 0x0, 0x1000, 0xCA, 0, -22
	banim_frame_oam 0x0, 0x1000, 0xCA, -8, -14
	banim_frame_oam 0x0, 0x1000, 0xCA, -16, -6
	banim_frame_oam 0x0, 0x1000, 0xCB, -24, 2
	banim_frame_oam 0x0, 0x1000, 0xAA, 0, -30
	banim_frame_oam 0x0, 0x1000, 0xAA, -8, -22
	banim_frame_oam 0x0, 0x1000, 0xAA, -16, -14
	banim_frame_oam 0x0, 0x1000, 0xAA, -24, -6
	banim_frame_oam 0x0, 0x1000, 0xC9, 8, -22
	banim_frame_oam 0x0, 0x1000, 0xC9, 0, -14
	banim_frame_oam 0x0, 0x1000, 0xC9, -8, -6
	banim_frame_oam 0x0, 0x1000, 0xC9, -16, 2
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
	banim_frame_oam 0x0, 0x5000, 0x67, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xA7, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x86, 0, -24
	banim_frame_end
banim_sokf_sp1_2_oam_frame_26_l:
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
	banim_frame_oam 0x0, 0x5000, 0x6D, -11, -38
	banim_frame_oam 0x8000, 0x1000, 0x6F, -19, -38
	banim_frame_oam 0x4000, 0x1000, 0xAD, -11, -22
	banim_frame_oam 0x8000, 0x1000, 0x8C, 5, -30
	banim_frame_oam 0x8000, 0x1000, 0x49, 28, -31
	banim_frame_oam 0x8000, 0x1000, 0x6A, 20, -23
	banim_frame_end
banim_sokf_sp1_2_oam_frame_27_l:
	banim_frame_oam 0x0, 0x1000, 0x8F, -19, -30
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
	banim_frame_oam 0x0, 0x5000, 0x50, -3, -30
	banim_frame_oam 0x8000, 0x1000, 0x52, -11, -30
	banim_frame_oam 0x0, 0x1000, 0x89, 13, -30
	banim_frame_oam 0x0, 0x1000, 0xAF, 13, -38
	banim_frame_oam 0x0, 0x1000, 0x4F, 13, -46
	banim_frame_oam 0x0, 0x1000, 0xE, 13, -54
	banim_frame_oam 0x0, 0x1000, 0xD, -10, -38
	banim_frame_oam 0x0, 0x1000, 0xD, -12, -37
	banim_frame_end
banim_sokf_sp1_2_oam_frame_28_l:
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
	banim_frame_oam 0x4000, 0x9000, 0x91, -25, -36
	banim_frame_oam 0x0, 0x1000, 0xCE, 24, -28
	banim_frame_oam 0x0, 0x1000, 0xCF, 16, -28
	banim_frame_oam 0x0, 0x1000, 0x90, 24, -36
	banim_frame_oam 0x0, 0x1000, 0xD0, -25, -20
	banim_frame_oam 0x0, 0x1000, 0xB0, 7, -26
	banim_frame_oam 0x4000, 0x1000, 0x53, -9, -20
	banim_frame_oam 0x0, 0x1000, 0x55, -17, -20
	banim_frame_end
banim_sokf_sp1_2_oam_frame_29_l:
	banim_frame_oam 0x4000, 0x1000, 0x17, -3, -53
	banim_frame_oam 0x0, 0x1000, 0x19, -11, -53
	banim_frame_oam 0x8000, 0x5000, 0x37, 5, -45
	banim_frame_oam 0x0, 0x5000, 0x58, -11, -37
	banim_frame_oam 0x4000, 0x1000, 0x98, -11, -21
	banim_frame_oam 0x0, 0x1000, 0x38, -27, -45
	banim_frame_oam 0x8000, 0x1000, 0x76, -19, -53
	banim_frame_oam 0x0, 0x1000, 0x39, -27, -37
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
	banim_frame_oam 0x0, 0x1000, 0x8F, -19, -30
	banim_frame_end
banim_sokf_sp1_2_oam_frame_30_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, -16, -37
	banim_frame_oam 0x8000, 0x1000, 0x1D, -24, -37
	banim_frame_oam 0x4000, 0x1000, 0x5B, -16, -21
	banim_frame_oam 0x0, 0x1000, 0x5D, -24, -21
	banim_frame_oam 0x0, 0x1000, 0xBA, -24, -45
	banim_frame_oam 0x0, 0x1000, 0xB9, -22, -13
	banim_frame_oam 0x4000, 0x1000, 0xB6, -8, -5
	banim_frame_oam 0x0, 0x1000, 0xB8, -16, -5
	banim_frame_oam 0x8000, 0x1000, 0x7B, 8, -13
	banim_frame_oam 0x8000, 0x5000, 0x1A, 16, -45
	banim_frame_oam 0x0, 0x1000, 0x9A, 16, -13
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
banim_sokf_sp1_2_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x5000, 0xF1, -24, -23
	banim_frame_oam 0x0, 0x1000, 0xF5, -32, -23
	banim_frame_oam 0x4000, 0x1000, 0xD2, -16, -31
	banim_frame_oam 0x0, 0x1000, 0xD4, -24, -31
	banim_frame_oam 0x0, 0x1000, 0xD6, -37, -15
	banim_frame_oam 0x0, 0x1000, 0xF6, -40, -7
	banim_frame_oam 0x4000, 0x5000, 0xE0, -23, 1
	banim_frame_oam 0x4000, 0x1000, 0xE4, -39, 1
	banim_frame_oam 0x4000, 0x1000, 0xE6, 1, -7
	banim_frame_oam 0x8000, 0x1000, 0xD7, -8, -47
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
banim_sokf_sp1_2_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x1000, 0xEA, -10, -22
	banim_frame_oam 0x4000, 0x1000, 0xE8, -3, -14
	banim_frame_oam 0x4000, 0x1000, 0xEC, -16, -30
	banim_frame_oam 0x0, 0x1000, 0xEE, -24, -30
	banim_frame_oam 0x4000, 0x1000, 0xEF, -16, -38
	banim_frame_oam 0x4000, 0x1000, 0x4D, -24, -45
	banim_frame_oam 0x4000, 0x1000, 0xBB, -32, -53
	banim_frame_oam 0x0, 0x1000, 0xBD, -40, -53
	banim_frame_oam 0x0, 0x1000, 0xDD, -48, -53
	banim_frame_oam 0x4000, 0x1000, 0xFD, -49, -45
	banim_frame_oam 0x8000, 0x5000, 0x3F, -49, -37
	banim_frame_oam 0x0, 0x1000, 0xBF, -49, -5
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
	banim_frame_oam 0x0, 0x1000, 0xB3, -17, -24
	banim_frame_end
banim_sokf_sp1_2_oam_frame_33_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x42, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x23, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x65, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x86, -8, -39
	banim_frame_oam 0x0, 0x1000, 0xC6, -8, -23
	banim_frame_oam 0x8000, 0x1000, 0x87, -16, -39
	banim_frame_oam 0x0, 0x1000, 0xC7, -16, -23
	banim_frame_oam 0x0, 0x1000, 0xC5, 0, -23
	banim_frame_oam 0x8000, 0x5000, 0x6, -8, -71
	banim_frame_oam 0x4000, 0x5000, 0x7, -40, -71
	banim_frame_oam 0x4000, 0x1000, 0xA1, -39, -63
	banim_frame_oam 0x0, 0x1000, 0xA3, -47, -63
	banim_frame_oam 0x0, 0x1000, 0xA5, -47, -55
	banim_frame_end
banim_sokf_sp1_2_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x1000, 0x89, -11, -35
	banim_frame_oam 0x8000, 0x1000, 0xCA, -14, -19
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
	banim_frame_oam 0x8000, 0x5000, 0x88, -2, -68
	banim_frame_oam 0x8000, 0x1000, 0xC9, -10, -52
	banim_frame_end
banim_sokf_sp1_2_oam_frame_35_l:
	banim_frame_oam 0x0, 0x1000, 0x6A, -12, -35
	banim_frame_oam 0x0, 0x1000, 0x6A, -20, -27
	banim_frame_oam 0x0, 0x1000, 0x8A, -28, -19
	banim_frame_oam 0x0, 0x1000, 0x69, -4, -35
	banim_frame_oam 0x0, 0x1000, 0x69, -12, -27
	banim_frame_oam 0x0, 0x1000, 0x69, -20, -19
	banim_frame_oam 0x0, 0x1000, 0x4A, -20, -35
	banim_frame_oam 0x0, 0x1000, 0x4A, -28, -27
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
	banim_frame_oam 0x0, 0x5000, 0x49, 4, -59
	banim_frame_oam 0x0, 0x1000, 0x6A, -4, -43
	banim_frame_oam 0x0, 0x1000, 0x69, 4, -43
	banim_frame_oam 0x0, 0x1000, 0x4A, -4, -51
	banim_frame_oam 0x0, 0x1000, 0x4A, -12, -43
	banim_frame_end
banim_sokf_sp1_2_oam_frame_36_l:
	banim_frame_oam 0x8000, 0x1000, 0xC, 17, -27
	banim_frame_oam 0x0, 0x1000, 0x4C, 17, -11
	banim_frame_oam 0x8000, 0x1000, 0xB, 17, -51
	banim_frame_oam 0x0, 0x1000, 0x4B, 17, -35
	banim_frame_oam 0x8000, 0x1000, 0xD, 9, -19
	banim_frame_oam 0x4000, 0x1000, 0x2E, -7, -11
	banim_frame_oam 0x8000, 0x1000, 0x8C, -14, -33
	banim_frame_oam 0x0, 0x1000, 0xCC, -14, -17
	banim_frame_oam 0x0, 0x1000, 0xAA, 2, -23
	banim_frame_oam 0x8000, 0x1000, 0x8B, -6, -33
	banim_frame_oam 0x0, 0x1000, 0xCB, -6, -17
	banim_frame_oam 0x0, 0x1000, 0x6B, -7, -41
	banim_frame_oam 0x0, 0x1000, 0x30, -15, -11
	banim_frame_oam 0x0, 0x1000, 0x10, -15, -19
	banim_frame_oam 0x4000, 0x1000, 0xE, -31, -19
	banim_frame_oam 0x0, 0x1000, 0x6C, -39, -19
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x40, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x42, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x23, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x65, -24, 0
	banim_frame_end
banim_sokf_sp1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x9000, 0x4D, 4, -16
	banim_frame_oam 0x0, 0x5000, 0x51, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0x53, -20, -16
	banim_frame_oam 0x4000, 0x5000, 0x8D, 4, 0
	banim_frame_oam 0x4000, 0x1000, 0x91, -12, 0
	banim_frame_oam 0x4000, 0x5000, 0xAE, -4, 8
	banim_frame_oam 0x4000, 0x1000, 0xB2, -20, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -28, 8
	banim_frame_oam 0x0, 0x1000, 0xAD, -28, -15
	banim_frame_oam 0x4000, 0x5000, 0xED, 2, -24
	banim_frame_oam 0x0, 0x1000, 0xF1, -6, -24
	banim_frame_oam 0x4000, 0x5000, 0xCE, -6, -32
	banim_frame_oam 0x4000, 0x1000, 0xD2, -22, -32
	banim_frame_oam 0x0, 0x1000, 0xF2, -30, -32
	banim_frame_oam 0x0, 0x1000, 0xF3, -30, -40
	banim_frame_oam 0x4000, 0x1000, 0x31, -12, -24
	banim_frame_oam 0x0, 0x1000, 0x33, -20, -24
	banim_frame_end
banim_sokf_sp1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x55, 13, -16
	banim_frame_oam 0x0, 0x5000, 0x17, -3, -24
	banim_frame_oam 0x0, 0x1000, 0x16, 5, -8
	banim_frame_oam 0x4000, 0x5000, 0xF4, 20, -23
	banim_frame_oam 0x4000, 0x5000, 0xD6, 4, -31
	banim_frame_oam 0x0, 0x1000, 0xF8, 12, -23
	banim_frame_oam 0x0, 0x1000, 0xCE, 36, -32
	banim_frame_oam 0x4000, 0x1000, 0xD4, -12, -35
	banim_frame_oam 0x0, 0x1000, 0xF9, -20, -35
	banim_frame_end
banim_sokf_sp1_2_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0xDA, 30, 0
	banim_frame_oam 0x8000, 0x1000, 0xDE, 22, 0
	banim_frame_oam 0x0, 0x1000, 0xFF, 14, 8
	banim_frame_oam 0x0, 0x1000, 0xDF, 54, -8
	banim_frame_oam 0x4000, 0x5000, 0xBB, 22, -8
	banim_frame_oam 0x0, 0x1000, 0xBF, 14, -8
	banim_frame_oam 0x4000, 0x5000, 0x9A, 30, -16
	banim_frame_oam 0x4000, 0x1000, 0x9E, 14, -16
	banim_frame_oam 0x4000, 0x5000, 0x7B, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0x5C, 25, -32
	banim_frame_oam 0x0, 0x1000, 0x5E, 17, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x5000, 0x3B, 63, -9
	banim_frame_oam 0x4000, 0x1000, 0x1B, 55, -17
	banim_frame_oam 0x0, 0x1000, 0xD4, 55, -16
	banim_frame_end
banim_sokf_sp1_2_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x24, -10, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, 6, 8
	banim_frame_oam 0x4000, 0x1000, 0xA4, -10, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, 6, -32
	banim_frame_oam 0x0, 0x1000, 0x1, 38, 8
	banim_frame_oam 0x8000, 0x1000, 0x60, 38, -23
	banim_frame_oam 0x0, 0x1000, 0x5, -18, -15
	banim_frame_oam 0x0, 0x1000, 0x4, -18, -23
	banim_frame_oam 0x0, 0x5000, 0x26, 30, -53
	banim_frame_oam 0x4000, 0x1000, 0x66, 30, -37
	banim_frame_oam 0x0, 0x1000, 0x7, 30, -61
	banim_frame_oam 0x4000, 0x5000, 0x8, -2, -61
	banim_frame_oam 0x0, 0x1000, 0xC, -10, -61
	banim_frame_oam 0x4000, 0x5000, 0x29, -10, -53
	banim_frame_oam 0x0, 0x1000, 0x2D, -18, -53
	banim_frame_oam 0x8000, 0x1000, 0x49, 14, -45
	banim_frame_oam 0x4000, 0x1000, 0x4B, -10, -45
	banim_frame_oam 0x0, 0x1000, 0x4D, -18, -45
	banim_frame_oam 0x0, 0x1000, 0x6A, 3, -37
	banim_frame_oam 0x8000, 0x1000, 0x48, 22, -45
	banim_frame_oam 0x8000, 0x9000, 0x21, 14, -24
	banim_frame_oam 0x8000, 0x5000, 0x23, 6, -24
	banim_frame_oam 0x8000, 0x1000, 0x20, 30, -24
	banim_frame_oam 0x0, 0x1000, 0x0, 22, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_5_l:
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
	banim_frame_oam 0x0, 0x1000, 0xC0, 33, -23
	banim_frame_oam 0x0, 0x1000, 0xC1, 25, -25
	banim_frame_oam 0x4000, 0x1000, 0xC2, 9, -26
	banim_frame_oam 0x4000, 0x1000, 0xC4, -7, -31
	banim_frame_oam 0x4000, 0x1000, 0xC6, -23, -33
	banim_frame_oam 0x0, 0x1000, 0x0, 21, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x2E, -19, -24
	banim_frame_oam 0x8000, 0x9000, 0x32, -35, -24
	banim_frame_oam 0x4000, 0x5000, 0xAE, -19, 8
	banim_frame_oam 0x4000, 0x1000, 0xB2, -35, 8
	banim_frame_oam 0x4000, 0x1000, 0x10, -18, -32
	banim_frame_oam 0x0, 0x1000, 0x13, 13, -16
	banim_frame_oam 0x0, 0x1000, 0x12, 13, -24
	banim_frame_oam 0x0, 0x1000, 0xF, 21, -16
	banim_frame_oam 0x4000, 0x3000, 0xC6, -54, -14
	banim_frame_oam 0x4000, 0x3000, 0xC4, -38, -16
	banim_frame_oam 0x4000, 0x3000, 0xC2, -22, -21
	banim_frame_oam 0x0, 0x3000, 0xC1, -6, -22
	banim_frame_oam 0x0, 0x3000, 0xC0, 2, -24
	banim_frame_oam 0x0, 0x1000, 0x0, -5, -28
	banim_frame_end
banim_sokf_sp1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x89, -29, -32
	banim_frame_oam 0x8000, 0x1000, 0x8D, -37, -32
	banim_frame_oam 0x0, 0x1000, 0xCD, -14, -40
	banim_frame_oam 0x8000, 0x1000, 0xCE, 3, -16
	banim_frame_oam 0x4000, 0x9000, 0xCF, -37, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -45, 0
	banim_frame_oam 0x0, 0x1000, 0xED, -37, -8
	banim_frame_oam 0x0, 0x1000, 0xCD, -17, -40
	banim_frame_oam 0x4000, 0x1000, 0x14, -51, -14
	banim_frame_oam 0x0, 0x1000, 0x16, -59, -14
	banim_frame_oam 0x4000, 0x3000, 0xC6, -59, -18
	banim_frame_oam 0x4000, 0x3000, 0xC4, -43, -20
	banim_frame_oam 0x4000, 0x3000, 0xC2, -27, -25
	banim_frame_oam 0x0, 0x3000, 0xC1, -11, -26
	banim_frame_oam 0x0, 0x3000, 0xC0, -3, -28
	banim_frame_end
banim_sokf_sp1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x89, -29, -32
	banim_frame_oam 0x8000, 0x1000, 0x8D, -37, -32
	banim_frame_oam 0x0, 0x1000, 0xCD, -14, -40
	banim_frame_oam 0x8000, 0x1000, 0xCE, 3, -16
	banim_frame_oam 0x4000, 0x9000, 0xCF, -37, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -45, 0
	banim_frame_oam 0x0, 0x1000, 0xED, -37, -8
	banim_frame_oam 0x0, 0x1000, 0xCD, -17, -40
	banim_frame_oam 0x4000, 0x3000, 0xC6, -59, -18
	banim_frame_oam 0x4000, 0x3000, 0xC4, -43, -20
	banim_frame_oam 0x4000, 0x3000, 0xC2, -27, -25
	banim_frame_oam 0x0, 0x3000, 0xC1, -11, -26
	banim_frame_oam 0x0, 0x3000, 0xC0, -3, -28
	banim_frame_end
banim_sokf_sp1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x54, -18, -22
	banim_frame_oam 0x8000, 0x9000, 0x58, -34, -22
	banim_frame_oam 0x4000, 0x5000, 0xD4, -18, 10
	banim_frame_oam 0x4000, 0x1000, 0xD8, -34, 10
	banim_frame_oam 0x0, 0x1000, 0x34, 14, -12
	banim_frame_oam 0x0, 0x1000, 0x17, 14, -20
	banim_frame_oam 0x4000, 0x5000, 0x35, -26, -30
	banim_frame_oam 0x0, 0x1000, 0x19, -42, -14
	banim_frame_end
banim_sokf_sp1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -13, -17
	banim_frame_oam 0x0, 0x2000, 0xE0, -37, -21
	banim_frame_oam 0x0, 0x2000, 0xE1, -29, -19
	banim_frame_oam 0x4000, 0x2000, 0xE2, -21, -18
	banim_frame_oam 0x4000, 0x2000, 0xE4, -5, -13
	banim_frame_oam 0x4000, 0x2000, 0xE6, 11, -11
	banim_frame_oam 0x4000, 0x1000, 0x25, 13, 8
	banim_frame_oam 0x0, 0x1000, 0x5, 21, 0
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x1, -24, -6
	banim_frame_end
banim_sokf_sp1_2_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0x45, 13, 8
	banim_frame_oam 0x0, 0x1000, 0x0, -13, -17
	banim_frame_oam 0x0, 0x2000, 0xE0, -37, -21
	banim_frame_oam 0x0, 0x2000, 0xE1, -29, -19
	banim_frame_oam 0x4000, 0x2000, 0xE2, -21, -18
	banim_frame_oam 0x4000, 0x2000, 0xE4, -5, -13
	banim_frame_oam 0x4000, 0x2000, 0xE6, 11, -11
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x1, -24, -6
	banim_frame_end
banim_sokf_sp1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0x1000, 0x6, 21, 8
	banim_frame_oam 0x0, 0x1000, 0x0, -13, -17
	banim_frame_oam 0x0, 0x2000, 0xE0, -37, -21
	banim_frame_oam 0x0, 0x2000, 0xE1, -29, -19
	banim_frame_oam 0x4000, 0x2000, 0xE2, -21, -18
	banim_frame_oam 0x4000, 0x2000, 0xE4, -5, -13
	banim_frame_oam 0x4000, 0x2000, 0xE6, 11, -11
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x1, -24, -6
	banim_frame_end
banim_sokf_sp1_2_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -13, -17
	banim_frame_oam 0x0, 0x2000, 0xE0, -37, -21
	banim_frame_oam 0x0, 0x2000, 0xE1, -29, -19
	banim_frame_oam 0x4000, 0x2000, 0xE2, -21, -18
	banim_frame_oam 0x4000, 0x2000, 0xE4, -5, -13
	banim_frame_oam 0x4000, 0x2000, 0xE6, 11, -11
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xA0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x2, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x1, -24, -6
	banim_frame_end
banim_sokf_sp1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -11, -18
	banim_frame_oam 0x0, 0x2000, 0xE0, -36, -21
	banim_frame_oam 0x0, 0x2000, 0xE1, -28, -19
	banim_frame_oam 0x4000, 0x2000, 0xE2, -20, -18
	banim_frame_oam 0x4000, 0x2000, 0xE4, -4, -13
	banim_frame_oam 0x4000, 0x2000, 0xE6, 12, -11
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
banim_sokf_sp1_2_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -12, -16
	banim_frame_oam 0x0, 0x2000, 0xE0, -36, -20
	banim_frame_oam 0x0, 0x2000, 0xE1, -28, -18
	banim_frame_oam 0x4000, 0x2000, 0xE2, -20, -17
	banim_frame_oam 0x4000, 0x2000, 0xE4, -4, -12
	banim_frame_oam 0x4000, 0x2000, 0xE6, 12, -10
	banim_frame_oam 0x4000, 0x9000, 0x47, -10, 0
	banim_frame_oam 0x8000, 0x1000, 0x4B, -18, 0
	banim_frame_oam 0x0, 0x5000, 0xC9, -7, -14
	banim_frame_oam 0x0, 0x5000, 0xAC, 9, -22
	banim_frame_oam 0x8000, 0x1000, 0xAE, -15, -14
	banim_frame_oam 0x4000, 0x1000, 0x60, 9, -6
	banim_frame_oam 0x0, 0x5000, 0x2, -7, -30
	banim_frame_oam 0x0, 0x1000, 0x24, -15, -22
	banim_frame_end
banim_sokf_sp1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -15, -18
	banim_frame_oam 0x0, 0x2000, 0xE0, -39, -22
	banim_frame_oam 0x0, 0x2000, 0xE1, -31, -20
	banim_frame_oam 0x4000, 0x2000, 0xE2, -23, -19
	banim_frame_oam 0x4000, 0x2000, 0xE4, -7, -14
	banim_frame_oam 0x4000, 0x2000, 0xE6, 9, -12
	banim_frame_oam 0x4000, 0x9000, 0x20, -10, -24
	banim_frame_oam 0x4000, 0x5000, 0x60, -10, -8
	banim_frame_oam 0x8000, 0x1000, 0xAE, -18, -16
	banim_frame_oam 0x0, 0x1000, 0x24, -18, -24
	banim_frame_oam 0x4000, 0x1000, 0x2, -10, -32
	banim_frame_oam 0x4000, 0x9000, 0x87, -10, 0
	banim_frame_oam 0x8000, 0x1000, 0x8B, -18, 0
	banim_frame_end
banim_sokf_sp1_2_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -17, -16
	banim_frame_oam 0x0, 0x2000, 0xE0, -41, -20
	banim_frame_oam 0x0, 0x2000, 0xE1, -33, -18
	banim_frame_oam 0x4000, 0x2000, 0xE2, -25, -17
	banim_frame_oam 0x4000, 0x2000, 0xE4, -9, -12
	banim_frame_oam 0x4000, 0x2000, 0xE6, 7, -10
	banim_frame_oam 0x4000, 0x9000, 0x47, -15, 0
	banim_frame_oam 0x8000, 0x1000, 0x4B, -23, 0
	banim_frame_oam 0x0, 0x5000, 0xC9, -12, -14
	banim_frame_oam 0x0, 0x5000, 0xAC, 4, -22
	banim_frame_oam 0x8000, 0x1000, 0xAE, -20, -14
	banim_frame_oam 0x4000, 0x1000, 0x60, 4, -6
	banim_frame_oam 0x0, 0x5000, 0x2, -12, -30
	banim_frame_oam 0x0, 0x1000, 0x24, -20, -22
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x0, -18, -18
	banim_frame_oam 0x0, 0x2000, 0xE0, -43, -22
	banim_frame_oam 0x0, 0x2000, 0xE1, -35, -20
	banim_frame_oam 0x4000, 0x2000, 0xE2, -27, -19
	banim_frame_oam 0x4000, 0x2000, 0xE4, -11, -14
	banim_frame_oam 0x4000, 0x2000, 0xE6, 5, -12
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
banim_sokf_sp1_2_oam_frame_44_l:
	banim_frame_oam 0x0, 0x1000, 0x66, -25, -16
	banim_frame_oam 0x4000, 0x1000, 0xCF, -3, -3
	banim_frame_oam 0x0, 0x1000, 0xAF, -11, -7
	banim_frame_oam 0x0, 0x1000, 0xAF, -19, -11
	banim_frame_oam 0x0, 0x1000, 0xAF, -27, -15
	banim_frame_oam 0x0, 0x1000, 0xAF, -35, -19
	banim_frame_oam 0x0, 0x1000, 0xAF, -43, -23
	banim_frame_oam 0x0, 0x1000, 0xB0, -51, -27
	banim_frame_oam 0x0, 0x9000, 0xC, -23, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -23, 8
	banim_frame_oam 0x8000, 0x9000, 0x30, -39, -16
	banim_frame_oam 0x4000, 0x1000, 0x10, -21, -32
	banim_frame_oam 0x8000, 0x1000, 0x65, 9, -24
	banim_frame_end
banim_sokf_sp1_2_oam_frame_45_l:
	banim_frame_oam 0x8000, 0x1000, 0x86, -35, -24
	banim_frame_oam 0x0, 0x1000, 0xEE, -12, 0
	banim_frame_oam 0x0, 0x1000, 0xEF, -20, -8
	banim_frame_oam 0x0, 0x1000, 0xF0, -52, -40
	banim_frame_oam 0x0, 0x1000, 0xEF, -28, -16
	banim_frame_oam 0x0, 0x1000, 0xEF, -36, -24
	banim_frame_oam 0x0, 0x1000, 0xEF, -44, -32
	banim_frame_oam 0x0, 0x1000, 0xF1, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xF1, -28, -8
	banim_frame_oam 0x0, 0x1000, 0xF1, -36, -16
	banim_frame_oam 0x0, 0x1000, 0xF1, -44, -24
	banim_frame_oam 0x0, 0x1000, 0xF1, -52, -32
	banim_frame_oam 0x0, 0x1000, 0xD1, -44, -40
	banim_frame_oam 0x0, 0x1000, 0xD1, -36, -32
	banim_frame_oam 0x0, 0x1000, 0xD1, -28, -24
	banim_frame_oam 0x0, 0x1000, 0xD1, -20, -16
	banim_frame_oam 0x0, 0x1000, 0xD1, -12, -8
	banim_frame_oam 0x0, 0x9000, 0x12, -27, -32
	banim_frame_oam 0x8000, 0x5000, 0x16, -35, -32
	banim_frame_oam 0x4000, 0x1000, 0x94, -27, 0
	banim_frame_oam 0x0, 0x1000, 0x96, -35, 0
	banim_frame_oam 0x4000, 0x5000, 0xB2, -27, 8
	banim_frame_oam 0x0, 0x1000, 0xB6, -35, 8
	banim_frame_oam 0x8000, 0x1000, 0xC8, -43, -6
	banim_frame_oam 0x0, 0x1000, 0x93, 5, -30
	banim_frame_oam 0x0, 0x1000, 0x92, -21, -40
	banim_frame_end
banim_sokf_sp1_2_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x1000, 0x9C, -23, -16
	banim_frame_oam 0x4000, 0x1000, 0xD3, 6, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, -2, -16
	banim_frame_oam 0x4000, 0x1000, 0xD5, -42, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, -10, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, -18, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, -26, -16
	banim_frame_oam 0x8000, 0x1000, 0x1C, -7, -24
	banim_frame_oam 0x8000, 0x9000, 0x17, 1, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, 1, 8
	banim_frame_oam 0x8000, 0x9000, 0x39, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x3B, -23, -16
	banim_frame_oam 0x8000, 0x1000, 0xD2, 17, -19
	banim_frame_oam 0x0, 0x1000, 0x19, 1, -23
	banim_frame_oam 0x8000, 0x1000, 0x5C, -15, -32
	banim_frame_oam 0x0, 0x1000, 0x1A, -7, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_38_l:
	banim_frame_oam 0x0, 0x1000, 0x1D, -15, -24
	banim_frame_oam 0x0, 0x1000, 0x3D, -17, -16
	banim_frame_oam 0x4000, 0x1000, 0xD3, 5, -15
	banim_frame_oam 0x0, 0x1000, 0xD5, -3, -15
	banim_frame_oam 0x4000, 0x1000, 0xD5, -43, -15
	banim_frame_oam 0x0, 0x1000, 0xD5, -11, -15
	banim_frame_oam 0x0, 0x1000, 0xD5, -19, -15
	banim_frame_oam 0x0, 0x1000, 0xD5, -27, -15
	banim_frame_oam 0x8000, 0x9000, 0x17, 1, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, 1, 8
	banim_frame_oam 0x8000, 0x9000, 0x39, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x3B, -23, -16
	banim_frame_oam 0x8000, 0x1000, 0xD2, 17, -19
	banim_frame_oam 0x8000, 0x1000, 0x1C, -7, -24
	banim_frame_oam 0x0, 0x1000, 0x1A, -7, -32
	banim_frame_oam 0x0, 0x1000, 0x19, 1, -23
	banim_frame_oam 0x0, 0x1000, 0x1B, -15, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_39_l:
	banim_frame_oam 0x8000, 0x9000, 0x17, 1, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, 1, 8
	banim_frame_oam 0x8000, 0x9000, 0x39, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x3B, -23, -16
	banim_frame_oam 0x8000, 0x1000, 0xD2, 17, -19
	banim_frame_oam 0x4000, 0x1000, 0xF6, -18, -31
	banim_frame_oam 0x4000, 0x1000, 0xF4, -13, -23
	banim_frame_oam 0x0, 0x1000, 0xF3, -20, -39
	banim_frame_oam 0x4000, 0x1000, 0xD3, 2, -38
	banim_frame_oam 0x0, 0x1000, 0xD5, -6, -38
	banim_frame_oam 0x4000, 0x1000, 0xD5, -46, -38
	banim_frame_oam 0x0, 0x1000, 0xD5, -14, -38
	banim_frame_oam 0x0, 0x1000, 0xD5, -22, -38
	banim_frame_oam 0x0, 0x1000, 0xD5, -30, -38
	banim_frame_end
banim_sokf_sp1_2_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x9000, 0x17, 1, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, 1, 8
	banim_frame_oam 0x8000, 0x9000, 0x39, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x3B, -23, -16
	banim_frame_oam 0x8000, 0x1000, 0xD2, 17, -19
	banim_frame_oam 0x4000, 0x1000, 0xD7, -13, -31
	banim_frame_oam 0x0, 0x1000, 0xD9, -21, -31
	banim_frame_oam 0x0, 0x1000, 0xB9, -21, -39
	banim_frame_oam 0x4000, 0x1000, 0xF4, -13, -23
	banim_frame_oam 0x4000, 0x1000, 0xD3, 0, -38
	banim_frame_oam 0x0, 0x1000, 0xD5, -8, -38
	banim_frame_oam 0x4000, 0x1000, 0xD5, -48, -38
	banim_frame_oam 0x0, 0x1000, 0xD5, -16, -38
	banim_frame_oam 0x0, 0x1000, 0xD5, -24, -38
	banim_frame_oam 0x0, 0x1000, 0xD5, -32, -38
	banim_frame_end
banim_sokf_sp1_2_oam_frame_41_l:
	banim_frame_oam 0x0, 0x1000, 0xB7, 18, -36
	banim_frame_oam 0x0, 0x1000, 0xB8, 10, -36
	banim_frame_oam 0x0, 0x1000, 0xB8, -6, -36
	banim_frame_oam 0x0, 0x1000, 0xB8, 2, -36
	banim_frame_oam 0x0, 0x2000, 0xB7, -14, -36
	banim_frame_oam 0x8000, 0x9000, 0x17, 1, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, 1, 8
	banim_frame_oam 0x8000, 0x9000, 0x39, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x3B, -23, -16
	banim_frame_oam 0x8000, 0x1000, 0xD2, 17, -19
	banim_frame_oam 0x4000, 0x1000, 0xBA, -4, -31
	banim_frame_oam 0x0, 0x1000, 0xBC, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0xDB, -12, -23
	banim_frame_oam 0x0, 0x1000, 0xDA, 7, -31
	banim_frame_end
banim_sokf_sp1_2_oam_frame_42_l:
	banim_frame_oam 0x8000, 0x9000, 0x17, 1, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, 1, 8
	banim_frame_oam 0x8000, 0x9000, 0x39, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x3B, -23, -16
	banim_frame_oam 0x8000, 0x1000, 0xD2, 17, -19
	banim_frame_oam 0x4000, 0x1000, 0xBA, -4, -31
	banim_frame_oam 0x0, 0x1000, 0xBC, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0xDB, -12, -23
	banim_frame_oam 0x0, 0x1000, 0xDA, 7, -31
	banim_frame_end
banim_sokf_sp1_2_oam_frame_18_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sokf_sp1_2_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sokf_sp1_2_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sokf_sp1_2_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sokf_sp1_2_oam_frame_46_l:
	banim_frame_oam 0x4000, 0x5000, 0x3B, 63, -9
	banim_frame_oam 0x4000, 0x1000, 0x1B, 55, -17
	banim_frame_oam 0x4000, 0x9000, 0xDA, 30, 0
	banim_frame_oam 0x8000, 0x1000, 0xDE, 22, 0
	banim_frame_oam 0x0, 0x1000, 0xFF, 14, 8
	banim_frame_oam 0x0, 0x1000, 0xDF, 54, -8
	banim_frame_oam 0x4000, 0x5000, 0xBB, 22, -8
	banim_frame_oam 0x0, 0x1000, 0xBF, 14, -8
	banim_frame_oam 0x4000, 0x5000, 0x9A, 30, -16
	banim_frame_oam 0x4000, 0x1000, 0x9E, 14, -16
	banim_frame_oam 0x4000, 0x5000, 0x7B, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0x5C, 25, -32
	banim_frame_oam 0x0, 0x1000, 0x5E, 17, -32
	banim_frame_oam 0x0, 0x1000, 0xD4, 59, -15
	banim_frame_end
banim_sokf_sp1_2_oam_frame_43_l:
	banim_frame_oam 0x4000, 0x1000, 0xF8, -12, -31
	banim_frame_oam 0x4000, 0x1000, 0xFA, -10, -23
	banim_frame_oam 0x0, 0x1000, 0xFC, -2, -15
	banim_frame_oam 0x8000, 0x9000, 0x17, 1, -24
	banim_frame_oam 0x4000, 0x1000, 0x97, 1, 8
	banim_frame_oam 0x8000, 0x9000, 0x39, -15, -16
	banim_frame_oam 0x8000, 0x5000, 0x3B, -23, -16
	banim_frame_oam 0x8000, 0x1000, 0xD2, 17, -19
	banim_frame_end
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
banim_sokf_sp1_2_oam_r:
banim_sokf_sp1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x0, 0x48, 8, -16
	banim_frame_oam 0x0, 0x0, 0xC2, 8, -13
	banim_frame_oam 0x4000, 0x0, 0xC0, -24, -9
	banim_frame_oam 0x0, 0x0, 0xC2, -8, -9
	banim_frame_oam 0x0, 0x0, 0xC3, 0, -9
	banim_frame_oam 0x4000, 0x0, 0xA3, 0, -17
	banim_frame_oam 0x0, 0x0, 0xA5, 16, -17
	banim_frame_oam 0x4000, 0x0, 0xA1, 24, -17
	banim_frame_oam 0x0, 0x0, 0xA0, 32, -25
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
banim_sokf_sp1_2_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0xA7, 0, -16
	banim_frame_oam 0x4000, 0x0, 0xC4, -32, -17
	banim_frame_oam 0x0, 0x0, 0xC6, -16, -17
	banim_frame_oam 0x0, 0x0, 0xC6, -8, -17
	banim_frame_oam 0x0, 0x0, 0xC6, 0, -17
	banim_frame_oam 0x0, 0x0, 0xC6, 8, -17
	banim_frame_oam 0x0, 0x0, 0xC6, 16, -17
	banim_frame_oam 0x4000, 0x0, 0xC6, 24, -17
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
banim_sokf_sp1_2_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0xA7, 0, -16
	banim_frame_oam 0x4000, 0x2000, 0xC0, -33, -22
	banim_frame_oam 0x0, 0x2000, 0xC2, -17, -22
	banim_frame_oam 0x0, 0x2000, 0xC3, -9, -22
	banim_frame_oam 0x4000, 0x2000, 0xA3, -9, -14
	banim_frame_oam 0x0, 0x2000, 0xA5, 7, -14
	banim_frame_oam 0x4000, 0x2000, 0xA1, 15, -14
	banim_frame_oam 0x0, 0x2000, 0xA0, 23, -6
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
banim_sokf_sp1_2_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0xA7, 0, -16
	banim_frame_oam 0x0, 0x4000, 0xA9, -24, -38
	banim_frame_oam 0x0, 0x0, 0xCA, -8, -22
	banim_frame_oam 0x0, 0x0, 0xCA, 0, -14
	banim_frame_oam 0x0, 0x0, 0xCA, 8, -6
	banim_frame_oam 0x0, 0x0, 0xCB, 16, 2
	banim_frame_oam 0x0, 0x0, 0xAA, -8, -30
	banim_frame_oam 0x0, 0x0, 0xAA, 0, -22
	banim_frame_oam 0x0, 0x0, 0xAA, 8, -14
	banim_frame_oam 0x0, 0x0, 0xAA, 16, -6
	banim_frame_oam 0x0, 0x0, 0xC9, -16, -22
	banim_frame_oam 0x0, 0x0, 0xC9, -8, -14
	banim_frame_oam 0x0, 0x0, 0xC9, 0, -6
	banim_frame_oam 0x0, 0x0, 0xC9, 8, 2
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
	banim_frame_oam 0x0, 0x4000, 0x67, 0, -32
	banim_frame_oam 0x4000, 0x0, 0xA7, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x86, -8, -24
	banim_frame_end
banim_sokf_sp1_2_oam_frame_26_r:
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
	banim_frame_oam 0x0, 0x4000, 0x6D, -5, -38
	banim_frame_oam 0x8000, 0x0, 0x6F, 11, -38
	banim_frame_oam 0x4000, 0x0, 0xAD, -5, -22
	banim_frame_oam 0x8000, 0x0, 0x8C, -13, -30
	banim_frame_oam 0x8000, 0x0, 0x49, -36, -31
	banim_frame_oam 0x8000, 0x0, 0x6A, -28, -23
	banim_frame_end
banim_sokf_sp1_2_oam_frame_27_r:
	banim_frame_oam 0x0, 0x0, 0x8F, 11, -30
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
	banim_frame_oam 0x0, 0x4000, 0x50, -13, -30
	banim_frame_oam 0x8000, 0x0, 0x52, 3, -30
	banim_frame_oam 0x0, 0x0, 0x89, -21, -30
	banim_frame_oam 0x0, 0x0, 0xAF, -21, -38
	banim_frame_oam 0x0, 0x0, 0x4F, -21, -46
	banim_frame_oam 0x0, 0x0, 0xE, -21, -54
	banim_frame_oam 0x0, 0x0, 0xD, 2, -38
	banim_frame_oam 0x0, 0x0, 0xD, 4, -37
	banim_frame_end
banim_sokf_sp1_2_oam_frame_28_r:
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
	banim_frame_oam 0x4000, 0x8000, 0x91, -7, -36
	banim_frame_oam 0x0, 0x0, 0xCE, -32, -28
	banim_frame_oam 0x0, 0x0, 0xCF, -24, -28
	banim_frame_oam 0x0, 0x0, 0x90, -32, -36
	banim_frame_oam 0x0, 0x0, 0xD0, 17, -20
	banim_frame_oam 0x0, 0x0, 0xB0, -15, -26
	banim_frame_oam 0x4000, 0x0, 0x53, -7, -20
	banim_frame_oam 0x0, 0x0, 0x55, 9, -20
	banim_frame_end
banim_sokf_sp1_2_oam_frame_29_r:
	banim_frame_oam 0x4000, 0x0, 0x17, -13, -53
	banim_frame_oam 0x0, 0x0, 0x19, 3, -53
	banim_frame_oam 0x8000, 0x4000, 0x37, -13, -45
	banim_frame_oam 0x0, 0x4000, 0x58, -5, -37
	banim_frame_oam 0x4000, 0x0, 0x98, -5, -21
	banim_frame_oam 0x0, 0x0, 0x38, 19, -45
	banim_frame_oam 0x8000, 0x0, 0x76, 11, -53
	banim_frame_oam 0x0, 0x0, 0x39, 19, -37
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
	banim_frame_oam 0x0, 0x0, 0x8F, 11, -30
	banim_frame_end
banim_sokf_sp1_2_oam_frame_30_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, 0, -37
	banim_frame_oam 0x8000, 0x0, 0x1D, 16, -37
	banim_frame_oam 0x4000, 0x0, 0x5B, 0, -21
	banim_frame_oam 0x0, 0x0, 0x5D, 16, -21
	banim_frame_oam 0x0, 0x0, 0xBA, 16, -45
	banim_frame_oam 0x0, 0x0, 0xB9, 14, -13
	banim_frame_oam 0x4000, 0x0, 0xB6, -8, -5
	banim_frame_oam 0x0, 0x0, 0xB8, 8, -5
	banim_frame_oam 0x8000, 0x0, 0x7B, -16, -13
	banim_frame_oam 0x8000, 0x4000, 0x1A, -24, -45
	banim_frame_oam 0x0, 0x0, 0x9A, -24, -13
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
banim_sokf_sp1_2_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x4000, 0xF1, -8, -23
	banim_frame_oam 0x0, 0x0, 0xF5, 24, -23
	banim_frame_oam 0x4000, 0x0, 0xD2, 0, -31
	banim_frame_oam 0x0, 0x0, 0xD4, 16, -31
	banim_frame_oam 0x0, 0x0, 0xD6, 29, -15
	banim_frame_oam 0x0, 0x0, 0xF6, 32, -7
	banim_frame_oam 0x4000, 0x4000, 0xE0, -9, 1
	banim_frame_oam 0x4000, 0x0, 0xE4, 23, 1
	banim_frame_oam 0x4000, 0x0, 0xE6, -17, -7
	banim_frame_oam 0x8000, 0x0, 0xD7, 0, -47
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
banim_sokf_sp1_2_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x0, 0xEA, -6, -22
	banim_frame_oam 0x4000, 0x0, 0xE8, -13, -14
	banim_frame_oam 0x4000, 0x0, 0xEC, 0, -30
	banim_frame_oam 0x0, 0x0, 0xEE, 16, -30
	banim_frame_oam 0x4000, 0x0, 0xEF, 0, -38
	banim_frame_oam 0x4000, 0x0, 0x4D, 8, -45
	banim_frame_oam 0x4000, 0x0, 0xBB, 16, -53
	banim_frame_oam 0x0, 0x0, 0xBD, 32, -53
	banim_frame_oam 0x0, 0x0, 0xDD, 40, -53
	banim_frame_oam 0x4000, 0x0, 0xFD, 33, -45
	banim_frame_oam 0x8000, 0x4000, 0x3F, 41, -37
	banim_frame_oam 0x0, 0x0, 0xBF, 41, -5
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
	banim_frame_oam 0x0, 0x0, 0xB3, 9, -24
	banim_frame_end
banim_sokf_sp1_2_oam_frame_33_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -24, -8
	banim_frame_oam 0x0, 0x0, 0x42, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x23, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x25, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x65, 16, 0
	banim_frame_oam 0x8000, 0x0, 0x86, 0, -39
	banim_frame_oam 0x0, 0x0, 0xC6, 0, -23
	banim_frame_oam 0x8000, 0x0, 0x87, 8, -39
	banim_frame_oam 0x0, 0x0, 0xC7, 8, -23
	banim_frame_oam 0x0, 0x0, 0xC5, -8, -23
	banim_frame_oam 0x8000, 0x4000, 0x6, 0, -71
	banim_frame_oam 0x4000, 0x4000, 0x7, 8, -71
	banim_frame_oam 0x4000, 0x0, 0xA1, 23, -63
	banim_frame_oam 0x0, 0x0, 0xA3, 39, -63
	banim_frame_oam 0x0, 0x0, 0xA5, 39, -55
	banim_frame_end
banim_sokf_sp1_2_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x0, 0x89, 3, -35
	banim_frame_oam 0x8000, 0x0, 0xCA, 6, -19
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
	banim_frame_oam 0x8000, 0x4000, 0x88, -6, -68
	banim_frame_oam 0x8000, 0x0, 0xC9, 2, -52
	banim_frame_end
banim_sokf_sp1_2_oam_frame_35_r:
	banim_frame_oam 0x0, 0x0, 0x6A, 4, -35
	banim_frame_oam 0x0, 0x0, 0x6A, 12, -27
	banim_frame_oam 0x0, 0x0, 0x8A, 20, -19
	banim_frame_oam 0x0, 0x0, 0x69, -4, -35
	banim_frame_oam 0x0, 0x0, 0x69, 4, -27
	banim_frame_oam 0x0, 0x0, 0x69, 12, -19
	banim_frame_oam 0x0, 0x0, 0x4A, 12, -35
	banim_frame_oam 0x0, 0x0, 0x4A, 20, -27
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
	banim_frame_oam 0x0, 0x4000, 0x49, -20, -59
	banim_frame_oam 0x0, 0x0, 0x6A, -4, -43
	banim_frame_oam 0x0, 0x0, 0x69, -12, -43
	banim_frame_oam 0x0, 0x0, 0x4A, -4, -51
	banim_frame_oam 0x0, 0x0, 0x4A, 4, -43
	banim_frame_end
banim_sokf_sp1_2_oam_frame_36_r:
	banim_frame_oam 0x8000, 0x0, 0xC, -25, -27
	banim_frame_oam 0x0, 0x0, 0x4C, -25, -11
	banim_frame_oam 0x8000, 0x0, 0xB, -25, -51
	banim_frame_oam 0x0, 0x0, 0x4B, -25, -35
	banim_frame_oam 0x8000, 0x0, 0xD, -17, -19
	banim_frame_oam 0x4000, 0x0, 0x2E, -9, -11
	banim_frame_oam 0x8000, 0x0, 0x8C, 6, -33
	banim_frame_oam 0x0, 0x0, 0xCC, 6, -17
	banim_frame_oam 0x0, 0x0, 0xAA, -10, -23
	banim_frame_oam 0x8000, 0x0, 0x8B, -2, -33
	banim_frame_oam 0x0, 0x0, 0xCB, -2, -17
	banim_frame_oam 0x0, 0x0, 0x6B, -1, -41
	banim_frame_oam 0x0, 0x0, 0x30, 7, -11
	banim_frame_oam 0x0, 0x0, 0x10, 7, -19
	banim_frame_oam 0x4000, 0x0, 0xE, 15, -19
	banim_frame_oam 0x0, 0x0, 0x6C, 31, -19
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x2, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x40, -24, -8
	banim_frame_oam 0x0, 0x0, 0x42, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x23, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x25, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0x61, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x65, 16, 0
	banim_frame_end
banim_sokf_sp1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x8000, 0x4D, -36, -16
	banim_frame_oam 0x0, 0x4000, 0x51, -4, -16
	banim_frame_oam 0x8000, 0x0, 0x53, 12, -16
	banim_frame_oam 0x4000, 0x4000, 0x8D, -36, 0
	banim_frame_oam 0x4000, 0x0, 0x91, -4, 0
	banim_frame_oam 0x4000, 0x4000, 0xAE, -28, 8
	banim_frame_oam 0x4000, 0x0, 0xB2, 4, 8
	banim_frame_oam 0x0, 0x0, 0x93, 20, 8
	banim_frame_oam 0x0, 0x0, 0xAD, 20, -15
	banim_frame_oam 0x4000, 0x4000, 0xED, -34, -24
	banim_frame_oam 0x0, 0x0, 0xF1, -2, -24
	banim_frame_oam 0x4000, 0x4000, 0xCE, -26, -32
	banim_frame_oam 0x4000, 0x0, 0xD2, 6, -32
	banim_frame_oam 0x0, 0x0, 0xF2, 22, -32
	banim_frame_oam 0x0, 0x0, 0xF3, 22, -40
	banim_frame_oam 0x4000, 0x0, 0x31, -4, -24
	banim_frame_oam 0x0, 0x0, 0x33, 12, -24
	banim_frame_end
banim_sokf_sp1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x55, -45, -16
	banim_frame_oam 0x0, 0x4000, 0x17, -13, -24
	banim_frame_oam 0x0, 0x0, 0x16, -13, -8
	banim_frame_oam 0x4000, 0x4000, 0xF4, -52, -23
	banim_frame_oam 0x4000, 0x4000, 0xD6, -36, -31
	banim_frame_oam 0x0, 0x0, 0xF8, -20, -23
	banim_frame_oam 0x0, 0x0, 0xCE, -44, -32
	banim_frame_oam 0x4000, 0x0, 0xD4, -4, -35
	banim_frame_oam 0x0, 0x0, 0xF9, 12, -35
	banim_frame_end
banim_sokf_sp1_2_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0xDA, -62, 0
	banim_frame_oam 0x8000, 0x0, 0xDE, -30, 0
	banim_frame_oam 0x0, 0x0, 0xFF, -22, 8
	banim_frame_oam 0x0, 0x0, 0xDF, -62, -8
	banim_frame_oam 0x4000, 0x4000, 0xBB, -54, -8
	banim_frame_oam 0x0, 0x0, 0xBF, -22, -8
	banim_frame_oam 0x4000, 0x4000, 0x9A, -62, -16
	banim_frame_oam 0x4000, 0x0, 0x9E, -30, -16
	banim_frame_oam 0x4000, 0x4000, 0x7B, -49, -24
	banim_frame_oam 0x4000, 0x0, 0x5C, -41, -32
	banim_frame_oam 0x0, 0x0, 0x5E, -25, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x4000, 0x3B, -95, -9
	banim_frame_oam 0x4000, 0x0, 0x1B, -71, -17
	banim_frame_oam 0x0, 0x0, 0xD4, -63, -16
	banim_frame_end
banim_sokf_sp1_2_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x24, -6, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -38, 8
	banim_frame_oam 0x4000, 0x0, 0xA4, -6, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -22, -32
	banim_frame_oam 0x0, 0x0, 0x1, -46, 8
	banim_frame_oam 0x8000, 0x0, 0x60, -46, -23
	banim_frame_oam 0x0, 0x0, 0x5, 10, -15
	banim_frame_oam 0x0, 0x0, 0x4, 10, -23
	banim_frame_oam 0x0, 0x4000, 0x26, -46, -53
	banim_frame_oam 0x4000, 0x0, 0x66, -46, -37
	banim_frame_oam 0x0, 0x0, 0x7, -38, -61
	banim_frame_oam 0x4000, 0x4000, 0x8, -30, -61
	banim_frame_oam 0x0, 0x0, 0xC, 2, -61
	banim_frame_oam 0x4000, 0x4000, 0x29, -22, -53
	banim_frame_oam 0x0, 0x0, 0x2D, 10, -53
	banim_frame_oam 0x8000, 0x0, 0x49, -22, -45
	banim_frame_oam 0x4000, 0x0, 0x4B, -6, -45
	banim_frame_oam 0x0, 0x0, 0x4D, 10, -45
	banim_frame_oam 0x0, 0x0, 0x6A, -11, -37
	banim_frame_oam 0x8000, 0x0, 0x48, -30, -45
	banim_frame_oam 0x8000, 0x8000, 0x21, -30, -24
	banim_frame_oam 0x8000, 0x4000, 0x23, -14, -24
	banim_frame_oam 0x8000, 0x0, 0x20, -38, -24
	banim_frame_oam 0x0, 0x0, 0x0, -30, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_5_r:
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
	banim_frame_oam 0x0, 0x0, 0xC0, -41, -23
	banim_frame_oam 0x0, 0x0, 0xC1, -33, -25
	banim_frame_oam 0x4000, 0x0, 0xC2, -25, -26
	banim_frame_oam 0x4000, 0x0, 0xC4, -9, -31
	banim_frame_oam 0x4000, 0x0, 0xC6, 7, -33
	banim_frame_oam 0x0, 0x0, 0x0, -29, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x2E, -13, -24
	banim_frame_oam 0x8000, 0x8000, 0x32, 19, -24
	banim_frame_oam 0x4000, 0x4000, 0xAE, -13, 8
	banim_frame_oam 0x4000, 0x0, 0xB2, 19, 8
	banim_frame_oam 0x4000, 0x0, 0x10, 2, -32
	banim_frame_oam 0x0, 0x0, 0x13, -21, -16
	banim_frame_oam 0x0, 0x0, 0x12, -21, -24
	banim_frame_oam 0x0, 0x0, 0xF, -29, -16
	banim_frame_oam 0x4000, 0x2000, 0xC6, 38, -14
	banim_frame_oam 0x4000, 0x2000, 0xC4, 22, -16
	banim_frame_oam 0x4000, 0x2000, 0xC2, 6, -21
	banim_frame_oam 0x0, 0x2000, 0xC1, -2, -22
	banim_frame_oam 0x0, 0x2000, 0xC0, -10, -24
	banim_frame_oam 0x0, 0x0, 0x0, -3, -28
	banim_frame_end
banim_sokf_sp1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x89, -3, -32
	banim_frame_oam 0x8000, 0x0, 0x8D, 29, -32
	banim_frame_oam 0x0, 0x0, 0xCD, 6, -40
	banim_frame_oam 0x8000, 0x0, 0xCE, -11, -16
	banim_frame_oam 0x4000, 0x8000, 0xCF, 5, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 37, 0
	banim_frame_oam 0x0, 0x0, 0xED, 29, -8
	banim_frame_oam 0x0, 0x0, 0xCD, 9, -40
	banim_frame_oam 0x4000, 0x0, 0x14, 35, -14
	banim_frame_oam 0x0, 0x0, 0x16, 51, -14
	banim_frame_oam 0x4000, 0x2000, 0xC6, 43, -18
	banim_frame_oam 0x4000, 0x2000, 0xC4, 27, -20
	banim_frame_oam 0x4000, 0x2000, 0xC2, 11, -25
	banim_frame_oam 0x0, 0x2000, 0xC1, 3, -26
	banim_frame_oam 0x0, 0x2000, 0xC0, -5, -28
	banim_frame_end
banim_sokf_sp1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x89, -3, -32
	banim_frame_oam 0x8000, 0x0, 0x8D, 29, -32
	banim_frame_oam 0x0, 0x0, 0xCD, 6, -40
	banim_frame_oam 0x8000, 0x0, 0xCE, -11, -16
	banim_frame_oam 0x4000, 0x8000, 0xCF, 5, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 37, 0
	banim_frame_oam 0x0, 0x0, 0xED, 29, -8
	banim_frame_oam 0x0, 0x0, 0xCD, 9, -40
	banim_frame_oam 0x4000, 0x2000, 0xC6, 43, -18
	banim_frame_oam 0x4000, 0x2000, 0xC4, 27, -20
	banim_frame_oam 0x4000, 0x2000, 0xC2, 11, -25
	banim_frame_oam 0x0, 0x2000, 0xC1, 3, -26
	banim_frame_oam 0x0, 0x2000, 0xC0, -5, -28
	banim_frame_end
banim_sokf_sp1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x54, -14, -22
	banim_frame_oam 0x8000, 0x8000, 0x58, 18, -22
	banim_frame_oam 0x4000, 0x4000, 0xD4, -14, 10
	banim_frame_oam 0x4000, 0x0, 0xD8, 18, 10
	banim_frame_oam 0x0, 0x0, 0x34, -22, -12
	banim_frame_oam 0x0, 0x0, 0x17, -22, -20
	banim_frame_oam 0x4000, 0x4000, 0x35, -6, -30
	banim_frame_oam 0x0, 0x0, 0x19, 34, -14
	banim_frame_end
banim_sokf_sp1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x0, 0x0, 5, -17
	banim_frame_oam 0x0, 0x3000, 0xE0, 29, -21
	banim_frame_oam 0x0, 0x3000, 0xE1, 21, -19
	banim_frame_oam 0x4000, 0x3000, 0xE2, 5, -18
	banim_frame_oam 0x4000, 0x3000, 0xE4, -11, -13
	banim_frame_oam 0x4000, 0x3000, 0xE6, -27, -11
	banim_frame_oam 0x4000, 0x0, 0x25, -29, 8
	banim_frame_oam 0x0, 0x0, 0x5, -29, 0
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -32
	banim_frame_oam 0x0, 0x0, 0x1, 16, -6
	banim_frame_end
banim_sokf_sp1_2_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0x45, -29, 8
	banim_frame_oam 0x0, 0x0, 0x0, 5, -17
	banim_frame_oam 0x0, 0x3000, 0xE0, 29, -21
	banim_frame_oam 0x0, 0x3000, 0xE1, 21, -19
	banim_frame_oam 0x4000, 0x3000, 0xE2, 5, -18
	banim_frame_oam 0x4000, 0x3000, 0xE4, -11, -13
	banim_frame_oam 0x4000, 0x3000, 0xE6, -27, -11
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -32
	banim_frame_oam 0x0, 0x0, 0x1, 16, -6
	banim_frame_end
banim_sokf_sp1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0x0, 0x6, -29, 8
	banim_frame_oam 0x0, 0x0, 0x0, 5, -17
	banim_frame_oam 0x0, 0x3000, 0xE0, 29, -21
	banim_frame_oam 0x0, 0x3000, 0xE1, 21, -19
	banim_frame_oam 0x4000, 0x3000, 0xE2, 5, -18
	banim_frame_oam 0x4000, 0x3000, 0xE4, -11, -13
	banim_frame_oam 0x4000, 0x3000, 0xE6, -27, -11
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -32
	banim_frame_oam 0x0, 0x0, 0x1, 16, -6
	banim_frame_end
banim_sokf_sp1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0x0, 5, -17
	banim_frame_oam 0x0, 0x3000, 0xE0, 29, -21
	banim_frame_oam 0x0, 0x3000, 0xE1, 21, -19
	banim_frame_oam 0x4000, 0x3000, 0xE2, 5, -18
	banim_frame_oam 0x4000, 0x3000, 0xE4, -11, -13
	banim_frame_oam 0x4000, 0x3000, 0xE6, -27, -11
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x2, -8, -32
	banim_frame_oam 0x0, 0x0, 0x1, 16, -6
	banim_frame_end
banim_sokf_sp1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x0, 3, -18
	banim_frame_oam 0x0, 0x3000, 0xE0, 28, -21
	banim_frame_oam 0x0, 0x3000, 0xE1, 20, -19
	banim_frame_oam 0x4000, 0x3000, 0xE2, 4, -18
	banim_frame_oam 0x4000, 0x3000, 0xE4, -12, -13
	banim_frame_oam 0x4000, 0x3000, 0xE6, -28, -11
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
banim_sokf_sp1_2_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x0, 4, -16
	banim_frame_oam 0x0, 0x3000, 0xE0, 28, -20
	banim_frame_oam 0x0, 0x3000, 0xE1, 20, -18
	banim_frame_oam 0x4000, 0x3000, 0xE2, 4, -17
	banim_frame_oam 0x4000, 0x3000, 0xE4, -12, -12
	banim_frame_oam 0x4000, 0x3000, 0xE6, -28, -10
	banim_frame_oam 0x4000, 0x8000, 0x47, -22, 0
	banim_frame_oam 0x8000, 0x0, 0x4B, 10, 0
	banim_frame_oam 0x0, 0x4000, 0xC9, -9, -14
	banim_frame_oam 0x0, 0x4000, 0xAC, -25, -22
	banim_frame_oam 0x8000, 0x0, 0xAE, 7, -14
	banim_frame_oam 0x4000, 0x0, 0x60, -25, -6
	banim_frame_oam 0x0, 0x4000, 0x2, -9, -30
	banim_frame_oam 0x0, 0x0, 0x24, 7, -22
	banim_frame_end
banim_sokf_sp1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x0, 7, -18
	banim_frame_oam 0x0, 0x3000, 0xE0, 31, -22
	banim_frame_oam 0x0, 0x3000, 0xE1, 23, -20
	banim_frame_oam 0x4000, 0x3000, 0xE2, 7, -19
	banim_frame_oam 0x4000, 0x3000, 0xE4, -9, -14
	banim_frame_oam 0x4000, 0x3000, 0xE6, -25, -12
	banim_frame_oam 0x4000, 0x8000, 0x20, -22, -24
	banim_frame_oam 0x4000, 0x4000, 0x60, -22, -8
	banim_frame_oam 0x8000, 0x0, 0xAE, 10, -16
	banim_frame_oam 0x0, 0x0, 0x24, 10, -24
	banim_frame_oam 0x4000, 0x0, 0x2, -6, -32
	banim_frame_oam 0x4000, 0x8000, 0x87, -22, 0
	banim_frame_oam 0x8000, 0x0, 0x8B, 10, 0
	banim_frame_end
banim_sokf_sp1_2_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x0, 9, -16
	banim_frame_oam 0x0, 0x3000, 0xE0, 33, -20
	banim_frame_oam 0x0, 0x3000, 0xE1, 25, -18
	banim_frame_oam 0x4000, 0x3000, 0xE2, 9, -17
	banim_frame_oam 0x4000, 0x3000, 0xE4, -7, -12
	banim_frame_oam 0x4000, 0x3000, 0xE6, -23, -10
	banim_frame_oam 0x4000, 0x8000, 0x47, -17, 0
	banim_frame_oam 0x8000, 0x0, 0x4B, 15, 0
	banim_frame_oam 0x0, 0x4000, 0xC9, -4, -14
	banim_frame_oam 0x0, 0x4000, 0xAC, -20, -22
	banim_frame_oam 0x8000, 0x0, 0xAE, 12, -14
	banim_frame_oam 0x4000, 0x0, 0x60, -20, -6
	banim_frame_oam 0x0, 0x4000, 0x2, -4, -30
	banim_frame_oam 0x0, 0x0, 0x24, 12, -22
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x0, 10, -18
	banim_frame_oam 0x0, 0x3000, 0xE0, 35, -22
	banim_frame_oam 0x0, 0x3000, 0xE1, 27, -20
	banim_frame_oam 0x4000, 0x3000, 0xE2, 11, -19
	banim_frame_oam 0x4000, 0x3000, 0xE4, -5, -14
	banim_frame_oam 0x4000, 0x3000, 0xE6, -21, -12
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
banim_sokf_sp1_2_oam_frame_44_r:
	banim_frame_oam 0x0, 0x0, 0x66, 17, -16
	banim_frame_oam 0x4000, 0x0, 0xCF, -13, -3
	banim_frame_oam 0x0, 0x0, 0xAF, 3, -7
	banim_frame_oam 0x0, 0x0, 0xAF, 11, -11
	banim_frame_oam 0x0, 0x0, 0xAF, 19, -15
	banim_frame_oam 0x0, 0x0, 0xAF, 27, -19
	banim_frame_oam 0x0, 0x0, 0xAF, 35, -23
	banim_frame_oam 0x0, 0x0, 0xB0, 43, -27
	banim_frame_oam 0x0, 0x8000, 0xC, -9, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -9, 8
	banim_frame_oam 0x8000, 0x8000, 0x30, 23, -16
	banim_frame_oam 0x4000, 0x0, 0x10, 5, -32
	banim_frame_oam 0x8000, 0x0, 0x65, -17, -24
	banim_frame_end
banim_sokf_sp1_2_oam_frame_45_r:
	banim_frame_oam 0x8000, 0x0, 0x86, 27, -24
	banim_frame_oam 0x0, 0x0, 0xEE, 4, 0
	banim_frame_oam 0x0, 0x0, 0xEF, 12, -8
	banim_frame_oam 0x0, 0x0, 0xF0, 44, -40
	banim_frame_oam 0x0, 0x0, 0xEF, 20, -16
	banim_frame_oam 0x0, 0x0, 0xEF, 28, -24
	banim_frame_oam 0x0, 0x0, 0xEF, 36, -32
	banim_frame_oam 0x0, 0x0, 0xF1, 12, 0
	banim_frame_oam 0x0, 0x0, 0xF1, 20, -8
	banim_frame_oam 0x0, 0x0, 0xF1, 28, -16
	banim_frame_oam 0x0, 0x0, 0xF1, 36, -24
	banim_frame_oam 0x0, 0x0, 0xF1, 44, -32
	banim_frame_oam 0x0, 0x0, 0xD1, 36, -40
	banim_frame_oam 0x0, 0x0, 0xD1, 28, -32
	banim_frame_oam 0x0, 0x0, 0xD1, 20, -24
	banim_frame_oam 0x0, 0x0, 0xD1, 12, -16
	banim_frame_oam 0x0, 0x0, 0xD1, 4, -8
	banim_frame_oam 0x0, 0x8000, 0x12, -5, -32
	banim_frame_oam 0x8000, 0x4000, 0x16, 27, -32
	banim_frame_oam 0x4000, 0x0, 0x94, 11, 0
	banim_frame_oam 0x0, 0x0, 0x96, 27, 0
	banim_frame_oam 0x4000, 0x4000, 0xB2, -5, 8
	banim_frame_oam 0x0, 0x0, 0xB6, 27, 8
	banim_frame_oam 0x8000, 0x0, 0xC8, 35, -6
	banim_frame_oam 0x0, 0x0, 0x93, -13, -30
	banim_frame_oam 0x0, 0x0, 0x92, 13, -40
	banim_frame_end
banim_sokf_sp1_2_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x0, 0x9C, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xD3, -22, -16
	banim_frame_oam 0x0, 0x0, 0xD5, -6, -16
	banim_frame_oam 0x4000, 0x0, 0xD5, 26, -16
	banim_frame_oam 0x0, 0x0, 0xD5, 2, -16
	banim_frame_oam 0x0, 0x0, 0xD5, 10, -16
	banim_frame_oam 0x0, 0x0, 0xD5, 18, -16
	banim_frame_oam 0x8000, 0x0, 0x1C, -1, -24
	banim_frame_oam 0x8000, 0x8000, 0x17, -17, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -17, 8
	banim_frame_oam 0x8000, 0x8000, 0x39, -1, -16
	banim_frame_oam 0x8000, 0x4000, 0x3B, 15, -16
	banim_frame_oam 0x8000, 0x0, 0xD2, -25, -19
	banim_frame_oam 0x0, 0x0, 0x19, -9, -23
	banim_frame_oam 0x8000, 0x0, 0x5C, 7, -32
	banim_frame_oam 0x0, 0x0, 0x1A, -1, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_38_r:
	banim_frame_oam 0x0, 0x0, 0x1D, 7, -24
	banim_frame_oam 0x0, 0x0, 0x3D, 9, -16
	banim_frame_oam 0x4000, 0x0, 0xD3, -21, -15
	banim_frame_oam 0x0, 0x0, 0xD5, -5, -15
	banim_frame_oam 0x4000, 0x0, 0xD5, 27, -15
	banim_frame_oam 0x0, 0x0, 0xD5, 3, -15
	banim_frame_oam 0x0, 0x0, 0xD5, 11, -15
	banim_frame_oam 0x0, 0x0, 0xD5, 19, -15
	banim_frame_oam 0x8000, 0x8000, 0x17, -17, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -17, 8
	banim_frame_oam 0x8000, 0x8000, 0x39, -1, -16
	banim_frame_oam 0x8000, 0x4000, 0x3B, 15, -16
	banim_frame_oam 0x8000, 0x0, 0xD2, -25, -19
	banim_frame_oam 0x8000, 0x0, 0x1C, -1, -24
	banim_frame_oam 0x0, 0x0, 0x1A, -1, -32
	banim_frame_oam 0x0, 0x0, 0x19, -9, -23
	banim_frame_oam 0x0, 0x0, 0x1B, 7, -32
	banim_frame_end
banim_sokf_sp1_2_oam_frame_39_r:
	banim_frame_oam 0x8000, 0x8000, 0x17, -17, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -17, 8
	banim_frame_oam 0x8000, 0x8000, 0x39, -1, -16
	banim_frame_oam 0x8000, 0x4000, 0x3B, 15, -16
	banim_frame_oam 0x8000, 0x0, 0xD2, -25, -19
	banim_frame_oam 0x4000, 0x0, 0xF6, 2, -31
	banim_frame_oam 0x4000, 0x0, 0xF4, -3, -23
	banim_frame_oam 0x0, 0x0, 0xF3, 12, -39
	banim_frame_oam 0x4000, 0x0, 0xD3, -18, -38
	banim_frame_oam 0x0, 0x0, 0xD5, -2, -38
	banim_frame_oam 0x4000, 0x0, 0xD5, 30, -38
	banim_frame_oam 0x0, 0x0, 0xD5, 6, -38
	banim_frame_oam 0x0, 0x0, 0xD5, 14, -38
	banim_frame_oam 0x0, 0x0, 0xD5, 22, -38
	banim_frame_end
banim_sokf_sp1_2_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x8000, 0x17, -17, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -17, 8
	banim_frame_oam 0x8000, 0x8000, 0x39, -1, -16
	banim_frame_oam 0x8000, 0x4000, 0x3B, 15, -16
	banim_frame_oam 0x8000, 0x0, 0xD2, -25, -19
	banim_frame_oam 0x4000, 0x0, 0xD7, -3, -31
	banim_frame_oam 0x0, 0x0, 0xD9, 13, -31
	banim_frame_oam 0x0, 0x0, 0xB9, 13, -39
	banim_frame_oam 0x4000, 0x0, 0xF4, -3, -23
	banim_frame_oam 0x4000, 0x0, 0xD3, -16, -38
	banim_frame_oam 0x0, 0x0, 0xD5, 0, -38
	banim_frame_oam 0x4000, 0x0, 0xD5, 32, -38
	banim_frame_oam 0x0, 0x0, 0xD5, 8, -38
	banim_frame_oam 0x0, 0x0, 0xD5, 16, -38
	banim_frame_oam 0x0, 0x0, 0xD5, 24, -38
	banim_frame_end
banim_sokf_sp1_2_oam_frame_41_r:
	banim_frame_oam 0x0, 0x0, 0xB7, -26, -36
	banim_frame_oam 0x0, 0x0, 0xB8, -18, -36
	banim_frame_oam 0x0, 0x0, 0xB8, -2, -36
	banim_frame_oam 0x0, 0x0, 0xB8, -10, -36
	banim_frame_oam 0x0, 0x3000, 0xB7, 6, -36
	banim_frame_oam 0x8000, 0x8000, 0x17, -17, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -17, 8
	banim_frame_oam 0x8000, 0x8000, 0x39, -1, -16
	banim_frame_oam 0x8000, 0x4000, 0x3B, 15, -16
	banim_frame_oam 0x8000, 0x0, 0xD2, -25, -19
	banim_frame_oam 0x4000, 0x0, 0xBA, -12, -31
	banim_frame_oam 0x0, 0x0, 0xBC, 4, -31
	banim_frame_oam 0x4000, 0x0, 0xDB, -4, -23
	banim_frame_oam 0x0, 0x0, 0xDA, -15, -31
	banim_frame_end
banim_sokf_sp1_2_oam_frame_42_r:
	banim_frame_oam 0x8000, 0x8000, 0x17, -17, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -17, 8
	banim_frame_oam 0x8000, 0x8000, 0x39, -1, -16
	banim_frame_oam 0x8000, 0x4000, 0x3B, 15, -16
	banim_frame_oam 0x8000, 0x0, 0xD2, -25, -19
	banim_frame_oam 0x4000, 0x0, 0xBA, -12, -31
	banim_frame_oam 0x0, 0x0, 0xBC, 4, -31
	banim_frame_oam 0x4000, 0x0, 0xDB, -4, -23
	banim_frame_oam 0x0, 0x0, 0xDA, -15, -31
	banim_frame_end
banim_sokf_sp1_2_oam_frame_18_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sokf_sp1_2_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sokf_sp1_2_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sokf_sp1_2_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sokf_sp1_2_oam_frame_46_r:
	banim_frame_oam 0x4000, 0x4000, 0x3B, -95, -9
	banim_frame_oam 0x4000, 0x0, 0x1B, -71, -17
	banim_frame_oam 0x4000, 0x8000, 0xDA, -62, 0
	banim_frame_oam 0x8000, 0x0, 0xDE, -30, 0
	banim_frame_oam 0x0, 0x0, 0xFF, -22, 8
	banim_frame_oam 0x0, 0x0, 0xDF, -62, -8
	banim_frame_oam 0x4000, 0x4000, 0xBB, -54, -8
	banim_frame_oam 0x0, 0x0, 0xBF, -22, -8
	banim_frame_oam 0x4000, 0x4000, 0x9A, -62, -16
	banim_frame_oam 0x4000, 0x0, 0x9E, -30, -16
	banim_frame_oam 0x4000, 0x4000, 0x7B, -49, -24
	banim_frame_oam 0x4000, 0x0, 0x5C, -41, -32
	banim_frame_oam 0x0, 0x0, 0x5E, -25, -32
	banim_frame_oam 0x0, 0x0, 0xD4, -67, -15
	banim_frame_end
banim_sokf_sp1_2_oam_frame_43_r:
	banim_frame_oam 0x4000, 0x0, 0xF8, -4, -31
	banim_frame_oam 0x4000, 0x0, 0xFA, -6, -23
	banim_frame_oam 0x0, 0x0, 0xFC, -6, -15
	banim_frame_oam 0x8000, 0x8000, 0x17, -17, -24
	banim_frame_oam 0x4000, 0x0, 0x97, -17, 8
	banim_frame_oam 0x8000, 0x8000, 0x39, -1, -16
	banim_frame_oam 0x8000, 0x4000, 0x3B, 15, -16
	banim_frame_oam 0x8000, 0x0, 0xD2, -25, -19
	banim_frame_end
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
banim_sokf_sp1_2_script:
banim_sokf_sp1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokf_sp1_sheet_1, 15, banim_sokf_sp1_2_oam_frame_1_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 16, banim_sokf_sp1_2_oam_frame_2_r - banim_sokf_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 16, banim_sokf_sp1_2_oam_frame_2_r - banim_sokf_sp1_2_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 17, banim_sokf_sp1_2_oam_frame_3_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 19, banim_sokf_sp1_2_oam_frame_4_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 20, banim_sokf_sp1_2_oam_frame_5_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 5, banim_sokf_sp1_sheet_2, 21, banim_sokf_sp1_2_oam_frame_6_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 22, banim_sokf_sp1_2_oam_frame_7_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 13, banim_sokf_sp1_sheet_2, 23, banim_sokf_sp1_2_oam_frame_8_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 24, banim_sokf_sp1_2_oam_frame_9_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 25, banim_sokf_sp1_2_oam_frame_10_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 26, banim_sokf_sp1_2_oam_frame_11_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 27, banim_sokf_sp1_2_oam_frame_12_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 20, banim_sokf_sp1_sheet_3, 28, banim_sokf_sp1_2_oam_frame_13_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 29, banim_sokf_sp1_2_oam_frame_14_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 30, banim_sokf_sp1_2_oam_frame_15_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 31, banim_sokf_sp1_2_oam_frame_16_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 31, banim_sokf_sp1_2_oam_frame_16_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 32, banim_sokf_sp1_2_oam_frame_17_r - banim_sokf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokf_sp1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 18, banim_sokf_sp1_2_oam_frame_20_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 5, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 13, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 20, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokf_sp1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 1, banim_sokf_sp1_2_oam_frame_23_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_0, 2, banim_sokf_sp1_2_oam_frame_24_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 10, banim_sokf_sp1_sheet_0, 3, banim_sokf_sp1_2_oam_frame_25_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 4, banim_sokf_sp1_2_oam_frame_26_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 5, banim_sokf_sp1_2_oam_frame_27_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 6, banim_sokf_sp1_2_oam_frame_28_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 7, banim_sokf_sp1_2_oam_frame_29_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 8, banim_sokf_sp1_2_oam_frame_30_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 9, banim_sokf_sp1_2_oam_frame_31_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 10, banim_sokf_sp1_2_oam_frame_32_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 11, banim_sokf_sp1_2_oam_frame_33_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 4, banim_sokf_sp1_sheet_1, 12, banim_sokf_sp1_2_oam_frame_34_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 10, banim_sokf_sp1_sheet_1, 13, banim_sokf_sp1_2_oam_frame_35_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 14, banim_sokf_sp1_2_oam_frame_36_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokf_sp1_sheet_1, 15, banim_sokf_sp1_2_oam_frame_1_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 16, banim_sokf_sp1_2_oam_frame_2_r - banim_sokf_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 16, banim_sokf_sp1_2_oam_frame_2_r - banim_sokf_sp1_2_oam_r
	banim_code_hit_critical_5
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 17, banim_sokf_sp1_2_oam_frame_3_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 19, banim_sokf_sp1_2_oam_frame_4_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 20, banim_sokf_sp1_2_oam_frame_5_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 5, banim_sokf_sp1_sheet_2, 21, banim_sokf_sp1_2_oam_frame_6_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 22, banim_sokf_sp1_2_oam_frame_7_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 13, banim_sokf_sp1_sheet_2, 23, banim_sokf_sp1_2_oam_frame_8_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 24, banim_sokf_sp1_2_oam_frame_9_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 25, banim_sokf_sp1_2_oam_frame_10_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 26, banim_sokf_sp1_2_oam_frame_11_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 27, banim_sokf_sp1_2_oam_frame_12_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 20, banim_sokf_sp1_sheet_3, 28, banim_sokf_sp1_2_oam_frame_13_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 29, banim_sokf_sp1_2_oam_frame_14_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 30, banim_sokf_sp1_2_oam_frame_15_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 31, banim_sokf_sp1_2_oam_frame_16_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 31, banim_sokf_sp1_2_oam_frame_16_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 32, banim_sokf_sp1_2_oam_frame_17_r - banim_sokf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokf_sp1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 10, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 4, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 10, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 42, banim_sokf_sp1_2_oam_frame_18_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 43, banim_sokf_sp1_2_oam_frame_19_r - banim_sokf_sp1_2_oam_r
	banim_code_hit_normal
	banim_code_sound_sword_slash_air
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 18, banim_sokf_sp1_2_oam_frame_20_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 5, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 13, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 44, banim_sokf_sp1_2_oam_frame_21_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 20, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 45, banim_sokf_sp1_2_oam_frame_22_r - banim_sokf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokf_sp1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 36, banim_sokf_sp1_2_oam_frame_37_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 8, banim_sokf_sp1_sheet_3, 37, banim_sokf_sp1_2_oam_frame_38_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 6, banim_sokf_sp1_sheet_3, 38, banim_sokf_sp1_2_oam_frame_39_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 13, banim_sokf_sp1_sheet_3, 39, banim_sokf_sp1_2_oam_frame_40_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_call_spell_anim
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 40, banim_sokf_sp1_2_oam_frame_41_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 41, banim_sokf_sp1_2_oam_frame_42_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 47, banim_sokf_sp1_2_oam_frame_43_r - banim_sokf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokf_sp1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 1, banim_sokf_sp1_2_oam_frame_23_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 2, banim_sokf_sp1_2_oam_frame_24_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_0, 3, banim_sokf_sp1_2_oam_frame_25_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_sokf_sp1_sheet_0, 4, banim_sokf_sp1_2_oam_frame_26_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_0, 5, banim_sokf_sp1_2_oam_frame_27_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_0, 6, banim_sokf_sp1_2_oam_frame_28_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_0, 7, banim_sokf_sp1_2_oam_frame_29_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 8, banim_sokf_sp1_2_oam_frame_30_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 9, banim_sokf_sp1_2_oam_frame_31_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_0, 10, banim_sokf_sp1_2_oam_frame_32_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 11, banim_sokf_sp1_2_oam_frame_33_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_1, 12, banim_sokf_sp1_2_oam_frame_34_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_1, 13, banim_sokf_sp1_2_oam_frame_35_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 6, banim_sokf_sp1_sheet_3, 38, banim_sokf_sp1_2_oam_frame_39_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 13, banim_sokf_sp1_sheet_3, 39, banim_sokf_sp1_2_oam_frame_40_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_wing_flap
	banim_code_call_spell_anim
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 40, banim_sokf_sp1_2_oam_frame_41_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 41, banim_sokf_sp1_2_oam_frame_42_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 47, banim_sokf_sp1_2_oam_frame_43_r - banim_sokf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokf_sp1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 34, banim_sokf_sp1_2_oam_frame_44_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 35, banim_sokf_sp1_2_oam_frame_45_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 34, banim_sokf_sp1_2_oam_frame_44_r - banim_sokf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokf_sp1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 34, banim_sokf_sp1_2_oam_frame_44_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 35, banim_sokf_sp1_2_oam_frame_45_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 34, banim_sokf_sp1_2_oam_frame_44_r - banim_sokf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sokf_sp1_2_mode_stand_close:
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sokf_sp1_2_mode_stand:
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sokf_sp1_2_mode_stand_range:
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sokf_sp1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sokf_sp1_sheet_0, 0, banim_sokf_sp1_2_oam_frame_0_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 20, banim_sokf_sp1_sheet_1, 15, banim_sokf_sp1_2_oam_frame_1_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_1, 16, banim_sokf_sp1_2_oam_frame_2_r - banim_sokf_sp1_2_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 16, banim_sokf_sp1_2_oam_frame_2_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 1, banim_sokf_sp1_sheet_1, 46, banim_sokf_sp1_2_oam_frame_46_r - banim_sokf_sp1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 19, banim_sokf_sp1_2_oam_frame_4_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 2, banim_sokf_sp1_sheet_2, 20, banim_sokf_sp1_2_oam_frame_5_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 5, banim_sokf_sp1_sheet_2, 21, banim_sokf_sp1_2_oam_frame_6_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 22, banim_sokf_sp1_2_oam_frame_7_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 13, banim_sokf_sp1_sheet_2, 23, banim_sokf_sp1_2_oam_frame_8_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_2, 24, banim_sokf_sp1_2_oam_frame_9_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 25, banim_sokf_sp1_2_oam_frame_10_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 26, banim_sokf_sp1_2_oam_frame_11_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 1, banim_sokf_sp1_sheet_3, 27, banim_sokf_sp1_2_oam_frame_12_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 20, banim_sokf_sp1_sheet_3, 28, banim_sokf_sp1_2_oam_frame_13_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 29, banim_sokf_sp1_2_oam_frame_14_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 30, banim_sokf_sp1_2_oam_frame_15_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 7, banim_sokf_sp1_sheet_3, 31, banim_sokf_sp1_2_oam_frame_16_r - banim_sokf_sp1_2_oam_r
	banim_code_sound_step_light_horse_pitch_up
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 31, banim_sokf_sp1_2_oam_frame_16_r - banim_sokf_sp1_2_oam_r
	banim_code_frame 3, banim_sokf_sp1_sheet_3, 32, banim_sokf_sp1_2_oam_frame_17_r - banim_sokf_sp1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_sokf_sp1_2_mode_attack_close - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_attack_close_back - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_attack_close_critical - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_attack_close_critical_back - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_attack_range - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_attack_range_critical - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_dodge_close - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_dodge_range - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_stand_close - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_stand - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_stand_range - banim_sokf_sp1_2_script
	.word banim_sokf_sp1_2_mode_attack_miss - banim_sokf_sp1_2_script
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

