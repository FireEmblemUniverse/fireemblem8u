@ vim:ft=armv4
	.global banim_cer_at1_script
	.global banim_cer_at1_oam_r
	.global banim_cer_at1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB1
	.section .data.oam_l
banim_cer_at1_oam_l:
banim_cer_at1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0xD000, 0x1, -40, -24
	banim_frame_oam 0x4000, 0x5000, 0x81, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0x85, -40, 8
	banim_frame_oam 0x8000, 0x1000, 0x40, 24, -8
	banim_frame_end
banim_cer_at1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0xD000, 0x9, -40, -24
	banim_frame_oam 0x4000, 0x5000, 0x89, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0x8D, -40, 8
	banim_frame_oam 0x8000, 0x1000, 0x0, 24, -8
	banim_frame_end
banim_cer_at1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -8, -24
	banim_frame_oam 0x4000, 0x9000, 0xC4, -40, -24
	banim_frame_oam 0x4000, 0x9000, 0xA8, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0xAC, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xE8, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -40, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xA3, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xA1, 8, -32
	banim_frame_end
banim_cer_at1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0xA0, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xA7, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0xA5, 8, -32
	banim_frame_oam 0x4000, 0xD000, 0x11, -40, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0x95, -40, 8
	banim_frame_end
banim_cer_at1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x9000, 0xB0, 0, -24
	banim_frame_oam 0x4000, 0x9000, 0xB4, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xF0, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xF4, -32, -8
	banim_frame_oam 0x8000, 0x1000, 0xD8, -40, -16
	banim_frame_oam 0x0, 0x1000, 0xB8, -40, 8
	banim_frame_oam 0x4000, 0x9000, 0x19, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x1D, -24, 0
	banim_frame_oam 0x0, 0x1000, 0x3F, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x59, 24, 0
	banim_frame_oam 0x0, 0x5000, 0x5A, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x5C, -32, -40
	banim_frame_end
banim_cer_at1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0x84, -32, 8
	banim_frame_oam 0x4000, 0x9000, 0xA0, -40, -40
	banim_frame_oam 0x0, 0x1000, 0xE0, -40, 8
	banim_frame_oam 0x0, 0x1000, 0xE1, -40, -24
	banim_frame_end
banim_cer_at1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x1000, 0xE2, -40, 8
	banim_frame_oam 0x0, 0x9000, 0x8, 0, -24
	banim_frame_oam 0x8000, 0x9000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x88, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xA4, -24, -48
	banim_frame_oam 0x4000, 0x1000, 0xE4, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xA6, -32, -48
	banim_frame_end
banim_cer_at1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0xA8, 24, -24
	banim_frame_oam 0x0, 0x5000, 0xAC, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0xE8, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0xEC, 8, -8
	banim_frame_oam 0x0, 0x5000, 0xCE, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD0, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xB0, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xC6, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xE7, 40, 8
	banim_frame_oam 0x8000, 0x1000, 0xA7, 56, -24
	banim_frame_oam 0x0, 0x5000, 0x2F, 24, 0
	banim_frame_oam 0x0, 0x5000, 0x6F, 8, 0
	banim_frame_oam 0x4000, 0x1000, 0xAE, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xF, 48, -32
	banim_frame_end
banim_cer_at1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x11, 32, -32
	banim_frame_oam 0x8000, 0x9000, 0x15, 16, -32
	banim_frame_oam 0x8000, 0x5000, 0x17, 8, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x97, 8, 0
	banim_frame_oam 0x0, 0x5000, 0xD3, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xD1, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x91, -24, -16
	banim_frame_end
banim_cer_at1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x9000, 0xD5, -16, -8
	banim_frame_oam 0x0, 0x9000, 0x38, 32, -40
	banim_frame_oam 0x8000, 0x9000, 0x3C, 16, -40
	banim_frame_oam 0x4000, 0x5000, 0xB8, 32, -8
	banim_frame_oam 0x4000, 0x1000, 0xBC, 16, -8
	banim_frame_oam 0x4000, 0x9000, 0xD9, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xDD, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x1B, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x18, 48, -48
	banim_frame_oam 0x0, 0x1000, 0x1A, 40, -48
	banim_frame_end
banim_cer_at1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 32, -48
	banim_frame_oam 0x8000, 0x5000, 0x4, 24, -48
	banim_frame_oam 0x4000, 0x5000, 0x80, 32, -16
	banim_frame_oam 0x0, 0x1000, 0x84, 24, -16
	banim_frame_oam 0x4000, 0x9000, 0xA1, 24, -8
	banim_frame_oam 0x8000, 0x1000, 0xA5, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE1, 24, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, 16, 8
	banim_frame_oam 0x0, 0x5000, 0x65, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x5, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x45, 8, 8
	banim_frame_end
banim_cer_at1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x1000, 0xA0, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xB, 0, -8
	banim_frame_oam 0x0, 0x5000, 0xC6, -16, -8
	banim_frame_oam 0x0, 0x9000, 0x7, 32, -48
	banim_frame_oam 0x4000, 0x5000, 0x87, 32, -16
	banim_frame_oam 0x0, 0x1000, 0x4B, 24, -32
	banim_frame_oam 0x4000, 0x9000, 0xA8, 24, -8
	banim_frame_oam 0x8000, 0x1000, 0xAC, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE8, 24, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x8B, 24, -16
	banim_frame_end
banim_cer_at1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 32, -48
	banim_frame_oam 0x4000, 0x5000, 0x8C, 32, -16
	banim_frame_oam 0x0, 0x1000, 0x90, 24, -16
	banim_frame_oam 0x0, 0x1000, 0x51, 16, -32
	banim_frame_oam 0x4000, 0x9000, 0xAD, 24, -8
	banim_frame_oam 0x8000, 0x1000, 0xB1, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0xED, 24, 8
	banim_frame_oam 0x0, 0x1000, 0xF1, 16, 8
	banim_frame_oam 0x8000, 0x1000, 0x71, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0xA6, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x30, 24, -40
	banim_frame_oam 0x0, 0x1000, 0x70, 24, -24
	banim_frame_end
banim_cer_at1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0x10, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x11, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x31, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xF4, 48, -8
	banim_frame_oam 0x0, 0x5000, 0xB2, 48, -32
	banim_frame_oam 0x4000, 0x1000, 0xF2, 48, -16
	banim_frame_oam 0x0, 0x9000, 0x14, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x94, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xD4, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x12, 32, -40
	banim_frame_oam 0x4000, 0x1000, 0x92, 32, -8
	banim_frame_end
banim_cer_at1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0xD000, 0x38, -8, -32
	banim_frame_oam 0x0, 0x5000, 0xB8, 56, -32
	banim_frame_oam 0x8000, 0x1000, 0xBA, 56, -16
	banim_frame_oam 0x0, 0x1000, 0xBB, 64, -16
	banim_frame_oam 0x4000, 0x9000, 0xBC, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xDB, 24, 8
	banim_frame_end
banim_cer_at1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x22, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0xA6, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x5, -24, 8
	banim_frame_oam 0x8000, 0x9000, 0x0, 32, -40
	banim_frame_oam 0x0, 0x1000, 0x2, 24, -40
	banim_frame_oam 0x8000, 0x1000, 0x81, 48, -40
	banim_frame_oam 0x0, 0x1000, 0xA0, 48, -16
	banim_frame_oam 0x4000, 0x1000, 0xC0, 56, -32
	banim_frame_oam 0x8000, 0x1000, 0x66, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xA3, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0xA5, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xA2, 24, 0
	banim_frame_end
banim_cer_at1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x1000, 0xC2, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xE0, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xE1, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x47, -24, -8
	banim_frame_oam 0x8000, 0xD000, 0x8, -8, -48
	banim_frame_oam 0x8000, 0x5000, 0xC, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x8C, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x87, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xC7, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0x26, 24, -40
	banim_frame_end
banim_cer_at1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0xE3, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0xE4, -40, 8
	banim_frame_oam 0x8000, 0x1000, 0x12, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xD, -32, -32
	banim_frame_oam 0x0, 0x9000, 0x6D, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x71, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xED, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x51, -24, -32
	banim_frame_oam 0x4000, 0x5000, 0x2E, -16, -40
	banim_frame_end
banim_cer_at1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0xD000, 0x53, -40, -32
	banim_frame_oam 0x4000, 0x9000, 0xD3, -8, 0
	banim_frame_oam 0x4000, 0x9000, 0xD7, -40, 0
	banim_frame_oam 0x8000, 0x1000, 0x13, 24, -8
	banim_frame_end
banim_cer_at1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_cer_at1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_cer_at1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_cer_at1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_cer_at1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x60, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x64, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -24, 8
	banim_frame_oam 0x0, 0x5000, 0x1, -32, -48
	banim_frame_oam 0x8000, 0x1000, 0x3, -40, -48
	banim_frame_oam 0x4000, 0x1000, 0x41, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x43, -40, -32
	banim_frame_oam 0x0, 0x1000, 0x4, -40, -24
	banim_frame_oam 0x8000, 0x1000, 0x20, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0x24, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x45, -40, 8
	banim_frame_oam 0x8000, 0x1000, 0x5, 24, -24
	banim_frame_oam 0x0, 0x1000, 0x0, 24, 0
	banim_frame_end
banim_cer_at1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x66, 0, -24
	banim_frame_oam 0x8000, 0x9000, 0x6A, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x6C, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE6, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xEA, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x6, -40, -48
	banim_frame_oam 0x4000, 0x5000, 0x46, -40, -32
	banim_frame_oam 0x4000, 0x1000, 0xA, -40, -24
	banim_frame_oam 0x8000, 0x1000, 0x2A, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xC, -40, 8
	banim_frame_end
banim_cer_at1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x6D, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x71, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x73, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xED, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xF1, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF3, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x2E, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0x30, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0x31, -16, -40
	banim_frame_oam 0x0, 0x1000, 0xD, -40, 8
	banim_frame_oam 0x8000, 0x1000, 0x2D, -40, -16
	banim_frame_end
banim_cer_at1_oam_frame_26_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x84, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0xC4, -40, 8
	banim_frame_end
banim_cer_at1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0xD000, 0x8, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x88, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x8C, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xC8, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0xCC, -40, 8
	banim_frame_end
banim_cer_at1_oam_frame_28_l:
	banim_frame_oam 0x4000, 0xD000, 0x10, -32, -40
	banim_frame_oam 0x8000, 0x5000, 0x18, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x90, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0x94, -32, -8
	banim_frame_oam 0x8000, 0x1000, 0x98, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xD0, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0xD4, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xD8, -40, 8
	banim_frame_end
banim_cer_at1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x1000, 0xE4, -32, -40
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0xA, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x8A, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE3, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0xE8, -40, 8
	banim_frame_oam 0x0, 0x1000, 0xE7, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xE2, 24, -8
	banim_frame_end
banim_cer_at1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0xD000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x14, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, 16, 8
	banim_frame_oam 0x4000, 0x5000, 0x90, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x94, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xEC, -24, -32
	banim_frame_end
banim_cer_at1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0xD000, 0x16, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0x1A, -32, -48
	banim_frame_oam 0x8000, 0x9000, 0x9A, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xEA, 16, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_cer_at1_oam_r:
banim_cer_at1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0xC000, 0x1, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x81, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0x85, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x40, -32, -8
	banim_frame_end
banim_cer_at1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0xC000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x89, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0x8D, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x0, -32, -8
	banim_frame_end
banim_cer_at1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -24, -24
	banim_frame_oam 0x4000, 0x8000, 0xC4, 8, -24
	banim_frame_oam 0x4000, 0x8000, 0xA8, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0xAC, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xE8, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0xEC, 8, 8
	banim_frame_oam 0x0, 0x0, 0xA4, -32, 0
	banim_frame_oam 0x0, 0x0, 0xA3, -32, -16
	banim_frame_oam 0x0, 0x0, 0xA1, -16, -32
	banim_frame_end
banim_cer_at1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0xA0, -32, 0
	banim_frame_oam 0x0, 0x0, 0xA7, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xA5, -24, -32
	banim_frame_oam 0x4000, 0xC000, 0x11, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0x95, 8, 8
	banim_frame_end
banim_cer_at1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x8000, 0xB0, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0xB4, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0xF0, -32, -8
	banim_frame_oam 0x4000, 0x4000, 0xF4, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xD8, 32, -16
	banim_frame_oam 0x0, 0x0, 0xB8, 32, 8
	banim_frame_oam 0x4000, 0x8000, 0x19, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x1D, 8, 0
	banim_frame_oam 0x0, 0x0, 0x3F, 24, 8
	banim_frame_oam 0x8000, 0x0, 0x59, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x5A, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x5C, 24, -40
	banim_frame_end
banim_cer_at1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0x84, 0, 8
	banim_frame_oam 0x4000, 0x8000, 0xA0, 8, -40
	banim_frame_oam 0x0, 0x0, 0xE0, 32, 8
	banim_frame_oam 0x0, 0x0, 0xE1, 32, -24
	banim_frame_end
banim_cer_at1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x0, 0xE2, 24, 8
	banim_frame_oam 0x0, 0x8000, 0x8, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0xC, 0, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x88, -32, 8
	banim_frame_oam 0x4000, 0x0, 0x8C, 0, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_oam 0x0, 0x4000, 0xA4, 8, -48
	banim_frame_oam 0x4000, 0x0, 0xE4, 8, -32
	banim_frame_oam 0x0, 0x0, 0xA6, 24, -48
	banim_frame_end
banim_cer_at1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0xA8, -56, -24
	banim_frame_oam 0x0, 0x4000, 0xAC, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0xE8, -56, -8
	banim_frame_oam 0x4000, 0x0, 0xEC, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xCE, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xD0, 8, -16
	banim_frame_oam 0x0, 0x0, 0xB0, 8, -24
	banim_frame_oam 0x8000, 0x0, 0xC6, 16, -32
	banim_frame_oam 0x0, 0x0, 0xE7, -48, 8
	banim_frame_oam 0x8000, 0x0, 0xA7, -64, -24
	banim_frame_oam 0x0, 0x4000, 0x2F, -40, 0
	banim_frame_oam 0x0, 0x4000, 0x6F, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xAE, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xF, -64, -32
	banim_frame_end
banim_cer_at1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -64, -32
	banim_frame_oam 0x8000, 0x8000, 0x15, -32, -32
	banim_frame_oam 0x8000, 0x4000, 0x17, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x97, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xD3, -8, 0
	banim_frame_oam 0x0, 0x4000, 0xD1, -8, -16
	banim_frame_oam 0x0, 0x4000, 0x91, 8, -16
	banim_frame_end
banim_cer_at1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x8000, 0xD5, -16, -8
	banim_frame_oam 0x0, 0x8000, 0x38, -64, -40
	banim_frame_oam 0x8000, 0x8000, 0x3C, -32, -40
	banim_frame_oam 0x4000, 0x4000, 0xB8, -64, -8
	banim_frame_oam 0x4000, 0x0, 0xBC, -32, -8
	banim_frame_oam 0x4000, 0x8000, 0xD9, -56, 0
	banim_frame_oam 0x8000, 0x0, 0xDD, -24, 0
	banim_frame_oam 0x0, 0x0, 0x1B, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x18, -64, -48
	banim_frame_oam 0x0, 0x0, 0x1A, -48, -48
	banim_frame_end
banim_cer_at1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -64, -48
	banim_frame_oam 0x8000, 0x4000, 0x4, -32, -48
	banim_frame_oam 0x4000, 0x4000, 0x80, -64, -16
	banim_frame_oam 0x0, 0x0, 0x84, -32, -16
	banim_frame_oam 0x4000, 0x8000, 0xA1, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xA5, -24, -8
	banim_frame_oam 0x4000, 0x4000, 0xE1, -56, 8
	banim_frame_oam 0x0, 0x0, 0xE5, -24, 8
	banim_frame_oam 0x0, 0x4000, 0x65, 0, -8
	banim_frame_oam 0x0, 0x4000, 0x5, -16, -8
	banim_frame_oam 0x0, 0x0, 0x45, -16, 8
	banim_frame_end
banim_cer_at1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x0, 0xA0, -16, -8
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xB, -8, -8
	banim_frame_oam 0x0, 0x4000, 0xC6, 0, -8
	banim_frame_oam 0x0, 0x8000, 0x7, -64, -48
	banim_frame_oam 0x4000, 0x4000, 0x87, -64, -16
	banim_frame_oam 0x0, 0x0, 0x4B, -32, -32
	banim_frame_oam 0x4000, 0x8000, 0xA8, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xAC, -24, -8
	banim_frame_oam 0x4000, 0x4000, 0xE8, -56, 8
	banim_frame_oam 0x0, 0x0, 0xEC, -24, 8
	banim_frame_oam 0x0, 0x0, 0x8B, -32, -16
	banim_frame_end
banim_cer_at1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -64, -48
	banim_frame_oam 0x4000, 0x4000, 0x8C, -64, -16
	banim_frame_oam 0x0, 0x0, 0x90, -32, -16
	banim_frame_oam 0x0, 0x0, 0x51, -24, -32
	banim_frame_oam 0x4000, 0x8000, 0xAD, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xB1, -24, -8
	banim_frame_oam 0x4000, 0x4000, 0xED, -56, 8
	banim_frame_oam 0x0, 0x0, 0xF1, -24, 8
	banim_frame_oam 0x8000, 0x0, 0x71, -16, -8
	banim_frame_oam 0x4000, 0x0, 0xA6, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x30, -32, -40
	banim_frame_oam 0x0, 0x0, 0x70, -32, -24
	banim_frame_end
banim_cer_at1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0x10, 0, -32
	banim_frame_oam 0x0, 0x0, 0x11, 0, -8
	banim_frame_oam 0x0, 0x0, 0x31, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xF4, -64, -8
	banim_frame_oam 0x0, 0x4000, 0xB2, -64, -32
	banim_frame_oam 0x4000, 0x0, 0xF2, -64, -16
	banim_frame_oam 0x0, 0x8000, 0x14, -32, -40
	banim_frame_oam 0x4000, 0x8000, 0x94, -32, -8
	banim_frame_oam 0x4000, 0x4000, 0xD4, -32, 8
	banim_frame_oam 0x8000, 0x8000, 0x12, -48, -40
	banim_frame_oam 0x4000, 0x0, 0x92, -48, -8
	banim_frame_end
banim_cer_at1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0xC000, 0x38, -56, -32
	banim_frame_oam 0x0, 0x4000, 0xB8, -72, -32
	banim_frame_oam 0x8000, 0x0, 0xBA, -64, -16
	banim_frame_oam 0x0, 0x0, 0xBB, -72, -16
	banim_frame_oam 0x4000, 0x8000, 0xBC, -24, 0
	banim_frame_oam 0x0, 0x0, 0xDB, -32, 8
	banim_frame_end
banim_cer_at1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x22, -32, -32
	banim_frame_oam 0x8000, 0x0, 0xA6, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x5, 8, 8
	banim_frame_oam 0x8000, 0x8000, 0x0, -48, -40
	banim_frame_oam 0x0, 0x0, 0x2, -32, -40
	banim_frame_oam 0x8000, 0x0, 0x81, -56, -40
	banim_frame_oam 0x0, 0x0, 0xA0, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xC0, -72, -32
	banim_frame_oam 0x8000, 0x0, 0x66, 0, -16
	banim_frame_oam 0x0, 0x4000, 0xA3, -24, 0
	banim_frame_oam 0x8000, 0x0, 0xA5, -8, 0
	banim_frame_oam 0x0, 0x0, 0xA2, -32, 0
	banim_frame_end
banim_cer_at1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x0, 0xC2, 16, -24
	banim_frame_oam 0x0, 0x0, 0xE0, 24, -16
	banim_frame_oam 0x0, 0x0, 0xE1, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x47, 16, -8
	banim_frame_oam 0x8000, 0xC000, 0x8, -24, -48
	banim_frame_oam 0x8000, 0x4000, 0xC, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x8C, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x87, -32, -16
	banim_frame_oam 0x0, 0x0, 0xC7, -32, 0
	banim_frame_oam 0x4000, 0x0, 0x26, -40, -40
	banim_frame_end
banim_cer_at1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0xE3, -32, 0
	banim_frame_oam 0x4000, 0x0, 0xE4, 24, 8
	banim_frame_oam 0x8000, 0x0, 0x12, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xD, 24, -32
	banim_frame_oam 0x0, 0x8000, 0x6D, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x71, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xED, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xF1, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x51, 8, -32
	banim_frame_oam 0x4000, 0x4000, 0x2E, -16, -40
	banim_frame_end
banim_cer_at1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0xC000, 0x53, -24, -32
	banim_frame_oam 0x4000, 0x8000, 0xD3, -24, 0
	banim_frame_oam 0x4000, 0x8000, 0xD7, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x13, -32, -8
	banim_frame_end
banim_cer_at1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_cer_at1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_cer_at1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_cer_at1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_cer_at1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x60, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x64, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xE4, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x1, 16, -48
	banim_frame_oam 0x8000, 0x0, 0x3, 32, -48
	banim_frame_oam 0x4000, 0x0, 0x41, 16, -32
	banim_frame_oam 0x0, 0x0, 0x43, 32, -32
	banim_frame_oam 0x0, 0x0, 0x4, 32, -24
	banim_frame_oam 0x8000, 0x0, 0x20, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x24, 24, 0
	banim_frame_oam 0x0, 0x0, 0x45, 32, 8
	banim_frame_oam 0x8000, 0x0, 0x5, -32, -24
	banim_frame_oam 0x0, 0x0, 0x0, -32, 0
	banim_frame_end
banim_cer_at1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x66, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x6A, 0, -24
	banim_frame_oam 0x8000, 0x4000, 0x6C, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE6, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xEA, 0, 8
	banim_frame_oam 0x0, 0x0, 0xEC, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0x6, 8, -48
	banim_frame_oam 0x4000, 0x4000, 0x46, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xA, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x2A, 24, 0
	banim_frame_oam 0x0, 0x0, 0xC, 32, 8
	banim_frame_end
banim_cer_at1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x6D, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x71, 8, -24
	banim_frame_oam 0x8000, 0x4000, 0x73, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xED, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xF1, 8, 8
	banim_frame_oam 0x0, 0x0, 0xF3, 24, 8
	banim_frame_oam 0x0, 0x4000, 0x2E, -16, -40
	banim_frame_oam 0x8000, 0x0, 0x30, 0, -40
	banim_frame_oam 0x8000, 0x0, 0x31, 8, -40
	banim_frame_oam 0x0, 0x0, 0xD, 32, 8
	banim_frame_oam 0x8000, 0x0, 0x2D, 32, -16
	banim_frame_end
banim_cer_at1_oam_frame_26_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -24, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x84, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0xC4, 8, 8
	banim_frame_end
banim_cer_at1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0xC000, 0x8, -24, -40
	banim_frame_oam 0x4000, 0x8000, 0x88, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x8C, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC8, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0xCC, 8, 8
	banim_frame_end
banim_cer_at1_oam_frame_28_r:
	banim_frame_oam 0x4000, 0xC000, 0x10, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x18, 32, -40
	banim_frame_oam 0x4000, 0x8000, 0x90, -32, -8
	banim_frame_oam 0x4000, 0x8000, 0x94, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x98, 32, -8
	banim_frame_oam 0x4000, 0x4000, 0xD0, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0xD4, 0, 8
	banim_frame_oam 0x0, 0x0, 0xD8, 32, 8
	banim_frame_end
banim_cer_at1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x0, 0xE4, 24, -40
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0xA, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x8A, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE3, 24, -8
	banim_frame_oam 0x4000, 0x0, 0xE8, 24, 8
	banim_frame_oam 0x0, 0x0, 0xE7, -32, 0
	banim_frame_oam 0x0, 0x0, 0xE2, -32, -8
	banim_frame_end
banim_cer_at1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0xC000, 0xC, -48, -24
	banim_frame_oam 0x8000, 0x8000, 0x14, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -48, 8
	banim_frame_oam 0x4000, 0x4000, 0x90, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x94, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xEC, 8, -32
	banim_frame_end
banim_cer_at1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0xC000, 0x16, -16, -48
	banim_frame_oam 0x8000, 0x8000, 0x1A, 16, -48
	banim_frame_oam 0x8000, 0x8000, 0x9A, 16, -16
	banim_frame_oam 0x4000, 0x0, 0xEA, -32, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_cer_at1_script:
banim_cer_at1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 1, banim_cer_at1_oam_frame_1_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_cer_at1_sheet_0, 2, banim_cer_at1_oam_frame_2_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 3, banim_cer_at1_oam_frame_3_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 2, banim_cer_at1_oam_frame_2_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 3, banim_cer_at1_oam_frame_3_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 2, banim_cer_at1_oam_frame_2_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 3, banim_cer_at1_oam_frame_3_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 4, banim_cer_at1_oam_frame_4_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 5, banim_cer_at1_oam_frame_5_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 4, banim_cer_at1_oam_frame_4_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 5, banim_cer_at1_oam_frame_5_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 4, banim_cer_at1_oam_frame_4_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 5, banim_cer_at1_oam_frame_5_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_1, 6, banim_cer_at1_oam_frame_6_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_frame 2, banim_cer_at1_sheet_1, 7, banim_cer_at1_oam_frame_7_r - banim_cer_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_cer_at1_sheet_1, 8, banim_cer_at1_oam_frame_8_r - banim_cer_at1_oam_r
	banim_code_hit_normal
	banim_code_frame 2, banim_cer_at1_sheet_1, 9, banim_cer_at1_oam_frame_9_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 10, banim_cer_at1_oam_frame_10_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 20, banim_cer_at1_sheet_2, 11, banim_cer_at1_oam_frame_11_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_2, 12, banim_cer_at1_oam_frame_12_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 13, banim_cer_at1_oam_frame_13_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 14, banim_cer_at1_oam_frame_14_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_cer_at1_sheet_3, 15, banim_cer_at1_oam_frame_15_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_3, 16, banim_cer_at1_oam_frame_16_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_cer_at1_sheet_3, 17, banim_cer_at1_oam_frame_17_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_3, 18, banim_cer_at1_oam_frame_18_r - banim_cer_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cer_at1_sheet_3, 18, banim_cer_at1_oam_frame_18_r - banim_cer_at1_oam_r
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cer_at1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_hit_normal
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 20, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_frame 1, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cer_at1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 1, banim_cer_at1_oam_frame_1_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_cer_at1_sheet_0, 2, banim_cer_at1_oam_frame_2_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 3, banim_cer_at1_oam_frame_3_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 2, banim_cer_at1_oam_frame_2_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 3, banim_cer_at1_oam_frame_3_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 2, banim_cer_at1_oam_frame_2_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 3, banim_cer_at1_oam_frame_3_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 4, banim_cer_at1_oam_frame_4_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 5, banim_cer_at1_oam_frame_5_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 4, banim_cer_at1_oam_frame_4_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 5, banim_cer_at1_oam_frame_5_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 4, banim_cer_at1_oam_frame_4_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 5, banim_cer_at1_oam_frame_5_r - banim_cer_at1_oam_r
	banim_code_frame 6, banim_cer_at1_sheet_4, 23, banim_cer_at1_oam_frame_23_r - banim_cer_at1_oam_r
	banim_code_frame 8, banim_cer_at1_sheet_4, 24, banim_cer_at1_oam_frame_24_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_4, 25, banim_cer_at1_oam_frame_25_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_scream
	banim_code_frame 4, banim_cer_at1_sheet_5, 26, banim_cer_at1_oam_frame_26_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_5, 27, banim_cer_at1_oam_frame_27_r - banim_cer_at1_oam_r
	banim_code_frame 30, banim_cer_at1_sheet_5, 28, banim_cer_at1_oam_frame_28_r - banim_cer_at1_oam_r
	banim_code_frame 3, banim_cer_at1_sheet_6, 29, banim_cer_at1_oam_frame_29_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_1, 6, banim_cer_at1_oam_frame_6_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_frame 2, banim_cer_at1_sheet_1, 7, banim_cer_at1_oam_frame_7_r - banim_cer_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_cer_at1_sheet_1, 8, banim_cer_at1_oam_frame_8_r - banim_cer_at1_oam_r
	banim_code_hit_critical_3
	banim_code_frame 2, banim_cer_at1_sheet_1, 9, banim_cer_at1_oam_frame_9_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 10, banim_cer_at1_oam_frame_10_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 20, banim_cer_at1_sheet_2, 11, banim_cer_at1_oam_frame_11_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_2, 12, banim_cer_at1_oam_frame_12_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 13, banim_cer_at1_oam_frame_13_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 14, banim_cer_at1_oam_frame_14_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_cer_at1_sheet_3, 15, banim_cer_at1_oam_frame_15_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_3, 16, banim_cer_at1_oam_frame_16_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_cer_at1_sheet_3, 17, banim_cer_at1_oam_frame_17_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_3, 18, banim_cer_at1_oam_frame_18_r - banim_cer_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cer_at1_sheet_3, 18, banim_cer_at1_oam_frame_18_r - banim_cer_at1_oam_r
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cer_at1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_frame 6, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 8, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_scream
	banim_code_frame 4, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_frame 30, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_frame 3, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_hit_critical_3
	banim_code_frame 2, banim_cer_at1_sheet_1, 20, banim_cer_at1_oam_frame_20_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 20, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 21, banim_cer_at1_oam_frame_21_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cer_at1_sheet_3, 22, banim_cer_at1_oam_frame_22_r - banim_cer_at1_oam_r
	banim_code_frame 1, banim_cer_at1_sheet_0, 19, banim_cer_at1_oam_frame_19_r - banim_cer_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cer_at1_mode_attack_range:
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cer_at1_mode_attack_range_critical:
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cer_at1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_cer_at1_sheet_6, 30, banim_cer_at1_oam_frame_30_r - banim_cer_at1_oam_r
	banim_code_frame 1, banim_cer_at1_sheet_6, 31, banim_cer_at1_oam_frame_31_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cer_at1_sheet_6, 30, banim_cer_at1_oam_frame_30_r - banim_cer_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cer_at1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_cer_at1_sheet_6, 30, banim_cer_at1_oam_frame_30_r - banim_cer_at1_oam_r
	banim_code_frame 1, banim_cer_at1_sheet_6, 31, banim_cer_at1_oam_frame_31_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cer_at1_sheet_6, 30, banim_cer_at1_oam_frame_30_r - banim_cer_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cer_at1_mode_stand_close:
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cer_at1_mode_stand:
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cer_at1_mode_stand_range:
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cer_at1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 1, banim_cer_at1_oam_frame_1_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_cer_at1_sheet_0, 2, banim_cer_at1_oam_frame_2_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 3, banim_cer_at1_oam_frame_3_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 2, banim_cer_at1_oam_frame_2_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 3, banim_cer_at1_oam_frame_3_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 2, banim_cer_at1_oam_frame_2_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 3, banim_cer_at1_oam_frame_3_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 4, banim_cer_at1_oam_frame_4_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 5, banim_cer_at1_oam_frame_5_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 4, banim_cer_at1_oam_frame_4_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 5, banim_cer_at1_oam_frame_5_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_0, 4, banim_cer_at1_oam_frame_4_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 5, banim_cer_at1_oam_frame_5_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_1, 6, banim_cer_at1_oam_frame_6_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_frame 2, banim_cer_at1_sheet_1, 7, banim_cer_at1_oam_frame_7_r - banim_cer_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 4, banim_cer_at1_sheet_1, 8, banim_cer_at1_oam_frame_8_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_1, 9, banim_cer_at1_oam_frame_9_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 10, banim_cer_at1_oam_frame_10_r - banim_cer_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 20, banim_cer_at1_sheet_2, 11, banim_cer_at1_oam_frame_11_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_2, 12, banim_cer_at1_oam_frame_12_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 13, banim_cer_at1_oam_frame_13_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_2, 14, banim_cer_at1_oam_frame_14_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_cer_at1_sheet_3, 15, banim_cer_at1_oam_frame_15_r - banim_cer_at1_oam_r
	banim_code_frame 4, banim_cer_at1_sheet_3, 16, banim_cer_at1_oam_frame_16_r - banim_cer_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_cer_at1_sheet_3, 17, banim_cer_at1_oam_frame_17_r - banim_cer_at1_oam_r
	banim_code_frame 2, banim_cer_at1_sheet_3, 18, banim_cer_at1_oam_frame_18_r - banim_cer_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cer_at1_sheet_3, 18, banim_cer_at1_oam_frame_18_r - banim_cer_at1_oam_r
	banim_code_frame 1, banim_cer_at1_sheet_0, 0, banim_cer_at1_oam_frame_0_r - banim_cer_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_cer_at1_mode_attack_close - banim_cer_at1_script
	.word banim_cer_at1_mode_attack_close_back - banim_cer_at1_script
	.word banim_cer_at1_mode_attack_close_critical - banim_cer_at1_script
	.word banim_cer_at1_mode_attack_close_critical_back - banim_cer_at1_script
	.word banim_cer_at1_mode_attack_range - banim_cer_at1_script
	.word banim_cer_at1_mode_attack_range_critical - banim_cer_at1_script
	.word banim_cer_at1_mode_dodge_close - banim_cer_at1_script
	.word banim_cer_at1_mode_dodge_range - banim_cer_at1_script
	.word banim_cer_at1_mode_stand_close - banim_cer_at1_script
	.word banim_cer_at1_mode_stand - banim_cer_at1_script
	.word banim_cer_at1_mode_stand_range - banim_cer_at1_script
	.word banim_cer_at1_mode_attack_miss - banim_cer_at1_script
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

