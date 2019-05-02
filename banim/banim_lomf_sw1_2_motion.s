@ vim:ft=armv4
	.global banim_lomf_sw1_2_script
	.global banim_lomf_sw1_2_oam_r
	.global banim_lomf_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x9
	.section .data.oam_l
banim_lomf_sw1_2_oam_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x84, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xC0, -32, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x85, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x89, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xC1, -32, -16
	banim_frame_oam 0x0, 0x5000, 0xC2, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xC4, -8, -56
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0xC5, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xC6, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xE4, -8, -56
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x8A, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8E, -24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x13, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x8F, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x93, -32, 0
	banim_frame_oam 0x0, 0x5000, 0xC7, -40, -48
	banim_frame_oam 0x8000, 0x1000, 0xC9, -48, -48
	banim_frame_oam 0x4000, 0x5000, 0xCA, -32, -56
	banim_frame_oam 0x0, 0x1000, 0xEC, -24, -48
	banim_frame_oam 0x0, 0x1000, 0xED, -40, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xEB, -56, -40
	banim_frame_oam 0x0, 0x5000, 0xCE, -48, -40
	banim_frame_oam 0x0, 0x1000, 0xEA, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0xD0, 8, -16
	banim_frame_oam 0x0, 0x9000, 0x15, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x19, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x95, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x99, -32, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x1A, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x1E, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x9A, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x9E, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xD1, 8, -16
	banim_frame_oam 0x0, 0x5000, 0xD2, -48, -40
	banim_frame_oam 0x0, 0x1000, 0xD4, -56, -40
	banim_frame_oam 0x0, 0x1000, 0xF4, -40, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0x27, 32, -24
	banim_frame_oam 0x0, 0x9000, 0x1, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x5, -24, -40
	banim_frame_oam 0x4000, 0x5000, 0x81, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x85, -24, -8
	banim_frame_oam 0x8000, 0x5000, 0x20, 24, -32
	banim_frame_oam 0x0, 0x1000, 0x0, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x7, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0x87, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0xA5, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xA1, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xA, -8, -48
	banim_frame_oam 0x4000, 0x9000, 0x8A, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x48, 24, -32
	banim_frame_oam 0x0, 0x5000, 0xC8, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xCA, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xEB, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x29, 24, -40
	banim_frame_oam 0x4000, 0x1000, 0x8, 0, -56
	banim_frame_oam 0x0, 0x5000, 0xC5, 40, -24
	banim_frame_oam 0x0, 0x1000, 0xE4, 56, -16
	banim_frame_oam 0x4000, 0x9000, 0xC0, -40, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xC8, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xCA, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xEB, 0, 8
	banim_frame_oam 0x4000, 0x9000, 0x8A, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xA8, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0x8, 0, -56
	banim_frame_oam 0x0, 0x9000, 0x11, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0x10, 24, -40
	banim_frame_oam 0x0, 0x5000, 0x2E, 32, -32
	banim_frame_oam 0x4000, 0x1000, 0x6E, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xE, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0xCB, 48, -16
	banim_frame_oam 0x0, 0x1000, 0xC4, 48, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xC8, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xCA, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xEB, 0, 8
	banim_frame_oam 0x4000, 0x9000, 0x8A, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xA8, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0x8, 0, -56
	banim_frame_oam 0x0, 0x9000, 0x11, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0x10, 24, -40
	banim_frame_oam 0x0, 0x5000, 0x2E, 32, -32
	banim_frame_oam 0x4000, 0x1000, 0x6E, 32, -16
	banim_frame_oam 0x0, 0x1000, 0xE, -16, -40
	banim_frame_oam 0x0, 0x1000, 0xC4, 48, -24
	banim_frame_oam 0x0, 0x1000, 0x28, 48, -16
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xCB, 48, -16
	banim_frame_oam 0x0, 0x1000, 0xC4, 48, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0x8E, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x8F, 32, -32
	banim_frame_oam 0x0, 0x9000, 0x90, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, 0, -16
	banim_frame_oam 0x0, 0x5000, 0xCE, 40, -24
	banim_frame_oam 0x0, 0x1000, 0xED, 56, -16
	banim_frame_oam 0x0, 0x1000, 0xCD, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x95, 8, -56
	banim_frame_oam 0x0, 0x1000, 0x97, 0, -56
	banim_frame_oam 0x0, 0x9000, 0x15, 0, -48
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0x8E, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x8F, 32, -32
	banim_frame_oam 0x0, 0x9000, 0x90, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xCD, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x95, 8, -56
	banim_frame_oam 0x0, 0x1000, 0x97, 0, -56
	banim_frame_oam 0x0, 0x9000, 0x15, 0, -48
	banim_frame_oam 0x8000, 0x1000, 0xC7, 48, -24
	banim_frame_oam 0x8000, 0x1000, 0xCF, 40, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xED, 56, -16
	banim_frame_oam 0x8000, 0x1000, 0xCE, 48, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xB5, 40, -32
	banim_frame_oam 0x8000, 0x1000, 0xB7, 32, -40
	banim_frame_oam 0x0, 0x1000, 0xF7, 32, -24
	banim_frame_oam 0x0, 0x1000, 0xF5, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xF6, 40, 8
	banim_frame_oam 0x8000, 0x9000, 0x98, 24, -16
	banim_frame_oam 0x8000, 0x5000, 0x9A, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xFB, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x9B, -8, -32
	banim_frame_oam 0x0, 0x9000, 0x19, 0, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0x5, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x4, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x0, 0x9000, 0x0, 16, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, 16, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xE3, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x46, 48, -16
	banim_frame_oam 0x0, 0x9000, 0x7, 16, -32
	banim_frame_oam 0x4000, 0x9000, 0x87, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x44, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x64, 8, -32
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x87, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x65, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, -48
	banim_frame_oam 0x0, 0x1000, 0xE3, -8, -40
	banim_frame_oam 0x4000, 0x1000, 0x44, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x64, 8, -32
	banim_frame_oam 0x8000, 0x9000, 0x84, 24, -32
	banim_frame_oam 0x8000, 0x5000, 0x86, 16, -32
	banim_frame_oam 0x0, 0x5000, 0xC7, 40, -16
	banim_frame_oam 0x4000, 0x1000, 0xC9, 40, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xE9, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xEA, 40, 0
	banim_frame_oam 0x8000, 0x1000, 0xAF, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0xAD, 8, -48
	banim_frame_oam 0x4000, 0x5000, 0xCB, 0, 8
	banim_frame_oam 0x0, 0x9000, 0xB, 8, -40
	banim_frame_oam 0x8000, 0x9000, 0xF, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x11, -16, -40
	banim_frame_oam 0x4000, 0x5000, 0x8B, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0x8F, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x91, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xAB, 24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xE9, 36, -16
	banim_frame_oam 0x0, 0x1000, 0xEA, 36, 0
	banim_frame_oam 0x8000, 0x1000, 0xAF, -28, -24
	banim_frame_oam 0x4000, 0x1000, 0xAD, 4, -48
	banim_frame_oam 0x4000, 0x5000, 0xCB, -4, 8
	banim_frame_oam 0x0, 0x9000, 0xB, 4, -40
	banim_frame_oam 0x8000, 0x9000, 0xF, -12, -40
	banim_frame_oam 0x8000, 0x5000, 0x11, -20, -40
	banim_frame_oam 0x4000, 0x5000, 0x8B, 4, -8
	banim_frame_oam 0x4000, 0x1000, 0x8F, -12, -8
	banim_frame_oam 0x0, 0x1000, 0x91, -20, -8
	banim_frame_oam 0x4000, 0x1000, 0xAB, 20, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xEB, 0, -48
	banim_frame_oam 0x0, 0x1000, 0xED, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0xEE, -40, -24
	banim_frame_oam 0x0, 0x5000, 0xB1, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xB3, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF3, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF0, 0, 8
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x16, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0x57, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xD0, -32, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x18, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0xB4, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xF4, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x92, -40, -8
	banim_frame_oam 0x0, 0x1000, 0x94, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x95, 8, -40
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0xDC, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x1C, -32, -8
	banim_frame_oam 0x8000, 0x9000, 0x5D, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x5F, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x5C, 0, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x96, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x1D, -24, -32
	banim_frame_oam 0x0, 0x9000, 0x98, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x9C, -32, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0xC0, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x0, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x1, -24, -32
	banim_frame_oam 0x0, 0x5000, 0x81, -24, 0
	banim_frame_oam 0x8000, 0x5000, 0x20, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xA0, -8, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0xC1, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x3, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x4, -16, -32
	banim_frame_oam 0x0, 0x9000, 0x23, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xA3, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x7, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xB, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x87, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8B, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xC2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xE2, -32, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x10, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x90, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -8, -32
	banim_frame_oam 0x0, 0x1000, 0xE5, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xE2, -32, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xAB, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xAD, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xEB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xED, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, 8
	banim_frame_oam 0x0, 0x5000, 0xA8, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0xAA, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xE8, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xEA, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xC7, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0xAE, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xEE, -24, -16
	banim_frame_oam 0x0, 0x5000, 0xAF, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0xEF, -32, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x31, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x12, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x14, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x15, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x95, -24, 0
	banim_frame_oam 0x8000, 0x5000, 0x16, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xD1, -40, 0
	banim_frame_end
banim_lomf_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x97, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xD2, -32, -24
	banim_frame_oam 0x8000, 0x5000, 0x96, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xD3, -24, -24
	banim_frame_end
banim_lomf_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x5000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x90, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, -8, -32
	banim_frame_oam 0x0, 0x1000, 0xE5, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xE2, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0xC, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x10, -24, -24
	banim_frame_oam 0x4000, 0x9000, 0xD7, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xDB, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0x2C, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xF3, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xF5, -24, -16
	banim_frame_end
banim_lomf_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0xAB, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xAD, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xEB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xED, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, 8
	banim_frame_oam 0x0, 0x5000, 0xA8, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0xAA, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xE8, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xEA, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xC7, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x9B, -24, 0
	banim_frame_end
banim_lomf_sw1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x31, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x11, -16, -40
	banim_frame_oam 0x4000, 0x1000, 0x12, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x14, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x1C, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x9C, -24, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_lomf_sw1_2_oam_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x84, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xC0, 24, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x85, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x89, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xC1, 24, -16
	banim_frame_oam 0x0, 0x4000, 0xC2, -8, -48
	banim_frame_oam 0x0, 0x0, 0xC4, 0, -56
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0xC5, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xC6, 0, -48
	banim_frame_oam 0x0, 0x0, 0xE4, 0, -56
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x8A, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x8E, 16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x13, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x8F, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x93, 16, 0
	banim_frame_oam 0x0, 0x4000, 0xC7, 24, -48
	banim_frame_oam 0x8000, 0x0, 0xC9, 40, -48
	banim_frame_oam 0x4000, 0x4000, 0xCA, 0, -56
	banim_frame_oam 0x0, 0x0, 0xEC, 16, -48
	banim_frame_oam 0x0, 0x0, 0xED, 32, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xEB, 48, -40
	banim_frame_oam 0x0, 0x4000, 0xCE, 32, -40
	banim_frame_oam 0x0, 0x0, 0xEA, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xD0, -16, -16
	banim_frame_oam 0x0, 0x8000, 0x15, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x19, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x95, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x99, 24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x1A, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x1E, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x9A, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x9E, 24, 0
	banim_frame_oam 0x8000, 0x0, 0xD1, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xD2, 32, -40
	banim_frame_oam 0x0, 0x0, 0xD4, 48, -40
	banim_frame_oam 0x0, 0x0, 0xF4, 32, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0x27, -40, -24
	banim_frame_oam 0x0, 0x8000, 0x1, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x5, 8, -40
	banim_frame_oam 0x4000, 0x4000, 0x81, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x85, 8, -8
	banim_frame_oam 0x8000, 0x4000, 0x20, -32, -32
	banim_frame_oam 0x0, 0x0, 0x0, 32, -40
	banim_frame_oam 0x0, 0x0, 0x7, 24, -40
	banim_frame_oam 0x8000, 0x0, 0x87, 24, -8
	banim_frame_oam 0x4000, 0x0, 0xA5, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0xA1, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xA, -24, -48
	banim_frame_oam 0x4000, 0x8000, 0x8A, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x48, -40, -32
	banim_frame_oam 0x0, 0x4000, 0xC8, -40, 0
	banim_frame_oam 0x8000, 0x0, 0xCA, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xEB, -16, 8
	banim_frame_oam 0x0, 0x0, 0x29, -32, -40
	banim_frame_oam 0x4000, 0x0, 0x8, -16, -56
	banim_frame_oam 0x0, 0x4000, 0xC5, -56, -24
	banim_frame_oam 0x0, 0x0, 0xE4, -64, -16
	banim_frame_oam 0x4000, 0x8000, 0xC0, 8, -40
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xC8, -40, 0
	banim_frame_oam 0x8000, 0x0, 0xCA, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xEB, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x8A, -24, -16
	banim_frame_oam 0x4000, 0x0, 0xA8, -40, -8
	banim_frame_oam 0x4000, 0x0, 0x8, -16, -56
	banim_frame_oam 0x0, 0x8000, 0x11, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0x10, -32, -40
	banim_frame_oam 0x0, 0x4000, 0x2E, -48, -32
	banim_frame_oam 0x4000, 0x0, 0x6E, -48, -16
	banim_frame_oam 0x0, 0x0, 0xE, 8, -40
	banim_frame_oam 0x4000, 0x0, 0xCB, -64, -16
	banim_frame_oam 0x0, 0x0, 0xC4, -56, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xC8, -40, 0
	banim_frame_oam 0x8000, 0x0, 0xCA, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xEB, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x8A, -24, -16
	banim_frame_oam 0x4000, 0x0, 0xA8, -40, -8
	banim_frame_oam 0x4000, 0x0, 0x8, -16, -56
	banim_frame_oam 0x0, 0x8000, 0x11, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0x10, -32, -40
	banim_frame_oam 0x0, 0x4000, 0x2E, -48, -32
	banim_frame_oam 0x4000, 0x0, 0x6E, -48, -16
	banim_frame_oam 0x0, 0x0, 0xE, 8, -40
	banim_frame_oam 0x0, 0x0, 0xC4, -56, -24
	banim_frame_oam 0x0, 0x0, 0x28, -56, -16
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xCB, -64, -16
	banim_frame_oam 0x0, 0x0, 0xC4, -56, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0x8E, 0, -48
	banim_frame_oam 0x8000, 0x0, 0x8F, -40, -32
	banim_frame_oam 0x0, 0x8000, 0x90, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, -8, -16
	banim_frame_oam 0x0, 0x4000, 0xCE, -56, -24
	banim_frame_oam 0x0, 0x0, 0xED, -64, -16
	banim_frame_oam 0x0, 0x0, 0xCD, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x95, -24, -56
	banim_frame_oam 0x0, 0x0, 0x97, -8, -56
	banim_frame_oam 0x0, 0x8000, 0x15, -32, -48
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0x8E, 0, -48
	banim_frame_oam 0x8000, 0x0, 0x8F, -40, -32
	banim_frame_oam 0x0, 0x8000, 0x90, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, -8, -16
	banim_frame_oam 0x0, 0x0, 0xCD, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x95, -24, -56
	banim_frame_oam 0x0, 0x0, 0x97, -8, -56
	banim_frame_oam 0x0, 0x8000, 0x15, -32, -48
	banim_frame_oam 0x8000, 0x0, 0xC7, -56, -24
	banim_frame_oam 0x8000, 0x0, 0xCF, -48, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xED, -64, -16
	banim_frame_oam 0x8000, 0x0, 0xCE, -56, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xB5, -56, -32
	banim_frame_oam 0x8000, 0x0, 0xB7, -40, -40
	banim_frame_oam 0x0, 0x0, 0xF7, -40, -24
	banim_frame_oam 0x0, 0x0, 0xF5, -48, -16
	banim_frame_oam 0x0, 0x0, 0xF6, -48, 8
	banim_frame_oam 0x8000, 0x8000, 0x98, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x9A, -24, -16
	banim_frame_oam 0x0, 0x0, 0xFB, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9B, 0, -32
	banim_frame_oam 0x0, 0x8000, 0x19, -32, -48
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0x5, -8, -48
	banim_frame_oam 0x8000, 0x0, 0x4, -16, -40
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -48, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -48, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -48, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, -48
	banim_frame_oam 0x0, 0x0, 0xE3, 0, -40
	banim_frame_oam 0x8000, 0x0, 0x46, -56, -16
	banim_frame_oam 0x0, 0x8000, 0x7, -48, -32
	banim_frame_oam 0x4000, 0x8000, 0x87, -48, 0
	banim_frame_oam 0x0, 0x0, 0x65, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x44, -16, -40
	banim_frame_oam 0x0, 0x0, 0x64, -16, -32
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x87, -48, 0
	banim_frame_oam 0x0, 0x0, 0x65, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, -48
	banim_frame_oam 0x0, 0x0, 0xE3, 0, -40
	banim_frame_oam 0x4000, 0x0, 0x44, -16, -40
	banim_frame_oam 0x0, 0x0, 0x64, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x84, -40, -32
	banim_frame_oam 0x8000, 0x4000, 0x86, -24, -32
	banim_frame_oam 0x0, 0x4000, 0xC7, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xC9, -56, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xE9, -48, -16
	banim_frame_oam 0x0, 0x0, 0xEA, -48, 0
	banim_frame_oam 0x8000, 0x0, 0xAF, 16, -24
	banim_frame_oam 0x4000, 0x0, 0xAD, -24, -48
	banim_frame_oam 0x4000, 0x4000, 0xCB, -32, 8
	banim_frame_oam 0x0, 0x8000, 0xB, -40, -40
	banim_frame_oam 0x8000, 0x8000, 0xF, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x11, 8, -40
	banim_frame_oam 0x4000, 0x4000, 0x8B, -40, -8
	banim_frame_oam 0x4000, 0x0, 0x8F, -8, -8
	banim_frame_oam 0x0, 0x0, 0x91, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xAB, -40, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xE9, -44, -16
	banim_frame_oam 0x0, 0x0, 0xEA, -44, 0
	banim_frame_oam 0x8000, 0x0, 0xAF, 20, -24
	banim_frame_oam 0x4000, 0x0, 0xAD, -20, -48
	banim_frame_oam 0x4000, 0x4000, 0xCB, -28, 8
	banim_frame_oam 0x0, 0x8000, 0xB, -36, -40
	banim_frame_oam 0x8000, 0x8000, 0xF, -4, -40
	banim_frame_oam 0x8000, 0x4000, 0x11, 12, -40
	banim_frame_oam 0x4000, 0x4000, 0x8B, -36, -8
	banim_frame_oam 0x4000, 0x0, 0x8F, -4, -8
	banim_frame_oam 0x0, 0x0, 0x91, 12, -8
	banim_frame_oam 0x4000, 0x0, 0xAB, -36, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xEB, -16, -48
	banim_frame_oam 0x0, 0x0, 0xED, 0, -48
	banim_frame_oam 0x4000, 0x0, 0xEE, 24, -24
	banim_frame_oam 0x0, 0x4000, 0xB1, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xB3, 16, -8
	banim_frame_oam 0x4000, 0x0, 0xF1, 0, 8
	banim_frame_oam 0x0, 0x0, 0xF3, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF0, -8, 8
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0x16, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x57, 16, -24
	banim_frame_oam 0x0, 0x0, 0xD0, 24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x18, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0xB4, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xF4, -8, 8
	banim_frame_oam 0x4000, 0x0, 0x92, 24, -8
	banim_frame_oam 0x0, 0x0, 0x94, 24, -16
	banim_frame_oam 0x0, 0x0, 0x95, -16, -40
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0xDC, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x1C, 24, -8
	banim_frame_oam 0x8000, 0x8000, 0x5D, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x5F, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x5C, -8, -32
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x96, 0, -24
	banim_frame_oam 0x0, 0x4000, 0x1D, 8, -32
	banim_frame_oam 0x0, 0x8000, 0x98, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x9C, 24, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0xC0, 24, -16
	banim_frame_oam 0x0, 0x0, 0x0, -8, 8
	banim_frame_oam 0x8000, 0x8000, 0x1, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x81, 8, 0
	banim_frame_oam 0x8000, 0x4000, 0x20, 0, -24
	banim_frame_oam 0x0, 0x0, 0xA0, 0, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0xC1, 24, -16
	banim_frame_oam 0x0, 0x0, 0x3, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x4, 0, -32
	banim_frame_oam 0x0, 0x8000, 0x23, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0xA3, -8, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x7, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xB, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x87, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8B, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xC2, 0, -32
	banim_frame_oam 0x0, 0x0, 0xE2, 24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x10, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x0, 0x90, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, -8, -32
	banim_frame_oam 0x0, 0x0, 0xE5, 8, -32
	banim_frame_oam 0x0, 0x0, 0xE2, 24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xAB, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xAD, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xEB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xED, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xA8, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xAA, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xE8, -8, -16
	banim_frame_oam 0x0, 0x0, 0xEA, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xC7, -16, -24
	banim_frame_oam 0x0, 0x0, 0xA7, 8, -40
	banim_frame_oam 0x8000, 0x0, 0xAE, 16, -32
	banim_frame_oam 0x0, 0x0, 0xEE, 16, -16
	banim_frame_oam 0x0, 0x4000, 0xAF, 16, -8
	banim_frame_oam 0x4000, 0x0, 0xEF, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x31, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x0, 0x11, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x12, -8, -32
	banim_frame_oam 0x0, 0x0, 0x14, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x15, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x95, 16, 0
	banim_frame_oam 0x8000, 0x4000, 0x16, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xD1, 32, 0
	banim_frame_end
banim_lomf_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x97, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xD2, 24, -24
	banim_frame_oam 0x8000, 0x4000, 0x96, 16, -16
	banim_frame_oam 0x0, 0x0, 0xD3, 16, -24
	banim_frame_end
banim_lomf_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x4000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x0, 0x90, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, -8, -32
	banim_frame_oam 0x0, 0x0, 0xE5, 8, -32
	banim_frame_oam 0x0, 0x0, 0xE2, 24, -16
	banim_frame_oam 0x4000, 0x4000, 0xC, -16, -24
	banim_frame_oam 0x0, 0x0, 0x10, 16, -24
	banim_frame_oam 0x4000, 0x8000, 0xD7, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xDB, 16, -8
	banim_frame_oam 0x4000, 0x0, 0x2C, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xF3, 0, -16
	banim_frame_oam 0x0, 0x0, 0xF5, 16, -16
	banim_frame_end
banim_lomf_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0xAB, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xAD, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xEB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xED, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xA8, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xAA, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xE8, -8, -16
	banim_frame_oam 0x0, 0x0, 0xEA, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xC7, -16, -24
	banim_frame_oam 0x0, 0x0, 0xA7, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x9B, 16, 0
	banim_frame_end
banim_lomf_sw1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x31, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xB1, -16, 8
	banim_frame_oam 0x0, 0x0, 0x11, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x12, -8, -32
	banim_frame_oam 0x0, 0x0, 0x14, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0x1C, 16, -32
	banim_frame_oam 0x8000, 0x0, 0x9C, 16, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_lomf_sw1_2_script:
banim_lomf_sw1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 37, banim_lomf_sw1_2_oam_frame_3_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 37, banim_lomf_sw1_2_oam_frame_3_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 37, banim_lomf_sw1_2_oam_frame_3_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 37, banim_lomf_sw1_2_oam_frame_3_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 37, banim_lomf_sw1_2_oam_frame_3_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 37, banim_lomf_sw1_2_oam_frame_3_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 37, banim_lomf_sw1_2_oam_frame_3_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 37, banim_lomf_sw1_2_oam_frame_3_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lomf_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomf_sw1_2_mode_stand:
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomf_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lomf_sw1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 34, banim_lomf_sw1_2_oam_frame_0_r - banim_lomf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 37, banim_lomf_sw1_2_oam_frame_3_r - banim_lomf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_lomf_sw1_sheet_4, 36, banim_lomf_sw1_2_oam_frame_2_r - banim_lomf_sw1_2_oam_r
	banim_code_frame 2, banim_lomf_sw1_sheet_4, 35, banim_lomf_sw1_2_oam_frame_1_r - banim_lomf_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_lomf_sw1_2_mode_attack_close - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_attack_close_back - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_attack_close_critical - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_attack_close_critical_back - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_attack_range - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_attack_range_critical - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_dodge_close - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_dodge_range - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_stand_close - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_stand - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_stand_range - banim_lomf_sw1_2_script
	.word banim_lomf_sw1_2_mode_attack_miss - banim_lomf_sw1_2_script
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

