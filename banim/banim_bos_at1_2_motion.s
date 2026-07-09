@ vim:ft=armv4
	.global banim_bos_at1_2_script
	.global banim_bos_at1_2_oam_r
	.global banim_bos_at1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC2
	.section .data.oam_l
banim_bos_at1_2_oam_l:
	banim_frame_oam 0x8000, 0xC000, 0x7, -100, 8
	banim_frame_oam 0x8000, 0x4000, 0xB, -68, 8
	banim_frame_oam 0x0, 0x0, 0x8B, -68, 40
	banim_frame_oam 0x0, 0x4000, 0xC5, -100, -8
	banim_frame_oam 0x0, 0x0, 0x6, -68, 64
	banim_frame_oam 0x0, 0x0, 0x0, -92, -16
	banim_frame_oam 0x0, 0x8000, 0x80, -84, -24
	banim_frame_oam 0x8000, 0x4000, 0x84, -52, -24
	banim_frame_oam 0x8000, 0x8000, 0x25, -44, -48
	banim_frame_oam 0x4000, 0x0, 0xA5, -44, -16
	banim_frame_oam 0x0, 0x8000, 0x1, -76, -56
	banim_frame_oam 0x8000, 0x0, 0x40, -84, -40
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x1B, -100, 8
	banim_frame_oam 0x0, 0x4000, 0xD9, -100, -8
	banim_frame_oam 0x8000, 0xC000, 0x14, -84, -56
	banim_frame_oam 0x8000, 0x4000, 0x18, -52, -56
	banim_frame_oam 0x8000, 0x4000, 0x98, -52, -24
	banim_frame_oam 0x8000, 0x8000, 0x39, -44, -48
	banim_frame_oam 0x4000, 0x0, 0xB9, -44, -16
	banim_frame_oam 0x0, 0x0, 0x1A, -68, 8
	banim_frame_oam 0x8000, 0x0, 0xD3, -92, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x86, -4, 40
	banim_frame_oam 0x8000, 0x4000, 0x88, 12, 40
	banim_frame_oam 0x8000, 0x0, 0xA9, 20, 48
	banim_frame_oam 0x0, 0x0, 0xE9, 20, 64
	banim_frame_oam 0x0, 0x0, 0x67, 28, 56
	banim_frame_oam 0x8000, 0x4000, 0x6, -12, 32
	banim_frame_oam 0x0, 0x8000, 0xA, -44, 8
	banim_frame_oam 0x8000, 0x4000, 0x9, -52, 8
	banim_frame_oam 0x8000, 0xC000, 0x0, -76, -56
	banim_frame_oam 0x8000, 0x8000, 0x4, -44, -56
	banim_frame_oam 0x8000, 0x8000, 0x84, -44, -24
	banim_frame_oam 0x0, 0x4000, 0x7, -68, 8
	banim_frame_oam 0x4000, 0x0, 0x47, -68, 24
	banim_frame_oam 0x0, 0x0, 0x68, -60, 32
	banim_frame_oam 0x0, 0x4000, 0x8B, -36, 40
	banim_frame_oam 0x8000, 0x0, 0x8D, -20, 40
	banim_frame_oam 0x0, 0x0, 0xCD, -20, 56
	banim_frame_oam 0x4000, 0x0, 0x89, -52, 40
	banim_frame_oam 0x8000, 0x0, 0xCB, -76, 8
	banim_frame_oam 0x8000, 0x0, 0xAA, -84, -40
	banim_frame_oam 0x0, 0x0, 0xEA, -84, -24
	banim_frame_end
	banim_frame_oam 0x0, 0xC000, 0xE, -76, -56
	banim_frame_oam 0x4000, 0xC000, 0x76, -12, -16
	banim_frame_oam 0x8000, 0x8000, 0x7E, 52, -16
	banim_frame_oam 0x4000, 0x4000, 0xF6, -12, 16
	banim_frame_oam 0x4000, 0x4000, 0xFA, 20, 16
	banim_frame_oam 0x4000, 0x0, 0xFE, 52, 16
	banim_frame_oam 0x4000, 0x0, 0x5E, 52, -24
	banim_frame_oam 0x8000, 0x0, 0x16, 68, -16
	banim_frame_oam 0x0, 0x0, 0x56, 68, 0
	banim_frame_oam 0x4000, 0x8000, 0x37, -52, 8
	banim_frame_oam 0x8000, 0x0, 0x3B, -20, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x0, -76, -56
	banim_frame_oam 0x8000, 0x8000, 0x4, -44, -56
	banim_frame_oam 0x4000, 0x8000, 0x80, -76, -24
	banim_frame_oam 0x0, 0x4000, 0x84, -44, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, -76, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -44, -8
	banim_frame_oam 0x8000, 0x8000, 0x46, -28, -40
	banim_frame_oam 0x4000, 0x0, 0xC6, -28, -8
	banim_frame_oam 0x0, 0x8000, 0x48, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x4C, 20, -24
	banim_frame_oam 0x4000, 0x4000, 0xC8, -12, 8
	banim_frame_oam 0x0, 0x0, 0xCC, 20, 8
	banim_frame_oam 0x8000, 0x8000, 0x4D, 28, -24
	banim_frame_oam 0x8000, 0x0, 0xE, 36, -40
	banim_frame_oam 0x4000, 0x0, 0xE5, -36, 0
	banim_frame_oam 0x0, 0x0, 0xE7, -20, 0
	banim_frame_oam 0x4000, 0x4000, 0xE0, -44, 8
	banim_frame_oam 0x8000, 0x4000, 0xF, 44, -40
	banim_frame_oam 0x0, 0x0, 0x8F, 44, -8
	banim_frame_oam 0x0, 0x4000, 0x6, 52, -48
	banim_frame_oam 0x0, 0x4000, 0x8, 52, -32
	banim_frame_oam 0x4000, 0x0, 0xA, 52, -16
	banim_frame_oam 0x0, 0x0, 0x2A, 52, -8
	banim_frame_oam 0x0, 0x0, 0x2B, 44, -48
	banim_frame_oam 0x8000, 0x0, 0xAF, 68, -40
	banim_frame_oam 0x0, 0x0, 0xEF, 68, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x12, -60, -56
	banim_frame_oam 0x8000, 0x8000, 0x10, -76, -56
	banim_frame_oam 0x0, 0x4000, 0x90, -76, -24
	banim_frame_oam 0x8000, 0x8000, 0x56, -28, -40
	banim_frame_oam 0x0, 0x4000, 0xD6, -28, -8
	banim_frame_oam 0x0, 0x8000, 0x78, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x7C, 20, -24
	banim_frame_oam 0x4000, 0x4000, 0xF8, -12, 8
	banim_frame_oam 0x0, 0x0, 0xFC, 20, 8
	banim_frame_oam 0x0, 0x4000, 0x7D, 28, -24
	banim_frame_oam 0x8000, 0x0, 0x7F, 44, -24
	banim_frame_oam 0x4000, 0x0, 0xBD, 28, -8
	banim_frame_oam 0x0, 0x0, 0xBF, 44, -8
	banim_frame_oam 0x4000, 0x0, 0xDD, 28, 0
	banim_frame_oam 0x0, 0x4000, 0xD0, 36, -40
	banim_frame_oam 0x4000, 0x0, 0x1D, 52, -16
	banim_frame_oam 0x0, 0x0, 0x1C, 44, -48
	banim_frame_oam 0x0, 0x4000, 0x19, 52, -32
	banim_frame_oam 0x8000, 0x0, 0x1B, 68, -32
	banim_frame_oam 0x0, 0x4000, 0x16, 52, -48
	banim_frame_oam 0x8000, 0x0, 0x18, 68, -48
	banim_frame_oam 0x4000, 0x4000, 0x5C, -44, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x6, -44, 8
	banim_frame_oam 0x4000, 0x8000, 0xA, -12, 8
	banim_frame_oam 0x0, 0x4000, 0xE, 20, 8
	banim_frame_oam 0x8000, 0xC000, 0x0, -76, -56
	banim_frame_oam 0x8000, 0x8000, 0x4, -44, -56
	banim_frame_oam 0x8000, 0x8000, 0x84, -44, -24
	banim_frame_oam 0x8000, 0x8000, 0x46, -28, -40
	banim_frame_oam 0x0, 0x4000, 0xC6, -28, -8
	banim_frame_oam 0x4000, 0xC000, 0x88, -12, -24
	banim_frame_oam 0x8000, 0x8000, 0x90, 52, -24
	banim_frame_oam 0x8000, 0x4000, 0x92, 68, -24
	banim_frame_oam 0x4000, 0x8000, 0x4E, 36, -40
	banim_frame_oam 0x8000, 0x0, 0x52, 68, -40
	banim_frame_oam 0x0, 0x0, 0x30, 52, -48
	banim_frame_end
banim_bos_at1_2_oam_frame_17_l:
	banim_frame_oam 0x0, 0x8000, 0x17, -45, -27
	banim_frame_oam 0x8000, 0x4000, 0x1B, -13, -27
	banim_frame_end
banim_bos_at1_2_oam_frame_0_l:
	banim_frame_oam 0x4000, 0xC000, 0x22, -36, -72
	banim_frame_oam 0x8000, 0x4000, 0x2A, 28, -72
	banim_frame_oam 0x4000, 0x4000, 0xA2, -36, -40
	banim_frame_oam 0x4000, 0x4000, 0xA6, -4, -40
	banim_frame_oam 0x0, 0x0, 0xAA, 28, -40
	banim_frame_oam 0x8000, 0x4000, 0x60, 36, -72
	banim_frame_oam 0x0, 0x0, 0xE0, 36, -40
	banim_frame_oam 0x8000, 0x0, 0xA1, 44, -56
	banim_frame_oam 0x0, 0x0, 0xE1, 44, -40
	banim_frame_oam 0x8000, 0x0, 0xC2, 52, -56
	banim_frame_oam 0x0, 0x0, 0xCA, 52, -72
	banim_frame_oam 0x8000, 0x0, 0xC3, 44, -72
	banim_frame_oam 0x0, 0x0, 0xA, 60, -56
	banim_frame_oam 0x0, 0x4000, 0x0, -52, -80
	banim_frame_oam 0x4000, 0x0, 0x40, -52, -64
	banim_frame_oam 0x8000, 0x0, 0x61, -44, -56
	banim_frame_oam 0x4000, 0x4000, 0x2, -36, -80
	banim_frame_oam 0x4000, 0x0, 0x6, -4, -80
	banim_frame_oam 0x8000, 0x0, 0xC9, -52, -96
	banim_frame_oam 0x0, 0x0, 0xEA, -44, -88
	banim_frame_oam 0x4000, 0x0, 0xF4, 44, -80
	banim_frame_oam 0x4000, 0x8000, 0xC4, -20, -32
	banim_frame_oam 0x8000, 0x0, 0xC8, 12, -32
	banim_frame_oam 0x4000, 0x4000, 0xF6, -20, -16
	banim_frame_oam 0x0, 0x0, 0xFA, 12, -16
	banim_frame_end
banim_bos_at1_2_oam_frame_7_l:
	banim_frame_oam 0x8000, 0xC000, 0xB, -20, -80
	banim_frame_oam 0x8000, 0x4000, 0xF, 12, -80
	banim_frame_oam 0x8000, 0x4000, 0x8F, 12, -48
	banim_frame_oam 0x0, 0x8000, 0x50, -52, -80
	banim_frame_oam 0x4000, 0x4000, 0xD0, -52, -48
	banim_frame_oam 0x8000, 0x0, 0x10, -52, -96
	banim_frame_oam 0x4000, 0x0, 0xF0, -4, -16
	banim_frame_oam 0x0, 0x8000, 0x34, 20, -72
	banim_frame_oam 0x8000, 0x4000, 0x38, 52, -72
	banim_frame_oam 0x4000, 0x4000, 0xB4, 20, -40
	banim_frame_oam 0x0, 0x0, 0xB8, 52, -40
	banim_frame_oam 0x0, 0x0, 0x79, 60, -56
	banim_frame_oam 0x4000, 0x0, 0x17, 44, -80
	banim_frame_end
banim_bos_at1_2_oam_frame_8_l:
	banim_frame_oam 0x8000, 0xC000, 0x0, -20, -80
	banim_frame_oam 0x8000, 0x4000, 0x4, 12, -80
	banim_frame_oam 0x8000, 0x4000, 0x84, 12, -48
	banim_frame_oam 0x0, 0x8000, 0x45, -52, -80
	banim_frame_oam 0x4000, 0x4000, 0xC5, -52, -48
	banim_frame_oam 0x0, 0x4000, 0x5, -60, -96
	banim_frame_oam 0x4000, 0x0, 0x7, -28, -88
	banim_frame_oam 0x8000, 0x8000, 0x9, 20, -72
	banim_frame_oam 0x8000, 0x4000, 0xB, 36, -72
	banim_frame_oam 0x4000, 0x0, 0x89, 20, -40
	banim_frame_oam 0x0, 0x0, 0x8B, 36, -40
	banim_frame_oam 0x8000, 0x0, 0xA9, 44, -80
	banim_frame_oam 0x0, 0x0, 0xE9, 44, -64
	banim_frame_oam 0x0, 0x0, 0xAA, 52, -80
	banim_frame_oam 0x0, 0x4000, 0xCA, 44, -56
	banim_frame_oam 0x0, 0x0, 0xAB, 52, -64
	banim_frame_oam 0x0, 0x0, 0xE8, 4, -16
	banim_frame_end
banim_bos_at1_2_oam_frame_9_l:
	banim_frame_oam 0x8000, 0xC000, 0xC, -20, -80
	banim_frame_oam 0x8000, 0x4000, 0x10, 12, -80
	banim_frame_oam 0x8000, 0x4000, 0x90, 12, -48
	banim_frame_oam 0x0, 0x8000, 0x36, 20, -72
	banim_frame_oam 0x4000, 0x4000, 0xB6, 20, -40
	banim_frame_oam 0x8000, 0x0, 0x5A, 52, -64
	banim_frame_oam 0x0, 0x0, 0x19, 44, -80
	banim_frame_oam 0x0, 0x0, 0xD1, 4, -16
	banim_frame_oam 0x8000, 0x8000, 0x13, -44, -80
	banim_frame_oam 0x8000, 0x4000, 0x15, -28, -80
	banim_frame_oam 0x4000, 0x0, 0x93, -44, -48
	banim_frame_oam 0x0, 0x0, 0x95, -28, -48
	banim_frame_oam 0x4000, 0x0, 0xB1, -28, -88
	banim_frame_oam 0x0, 0x4000, 0x11, -60, -80
	banim_frame_oam 0x4000, 0x0, 0x51, -60, -64
	banim_frame_oam 0x0, 0x0, 0x72, -52, -56
	banim_frame_oam 0x8000, 0x0, 0x71, -60, -96
	banim_frame_oam 0x0, 0x0, 0x92, -52, -88
	banim_frame_end
banim_bos_at1_2_oam_frame_10_l:
	banim_frame_oam 0x8000, 0xC000, 0x0, -20, -72
	banim_frame_oam 0x8000, 0x4000, 0x4, 12, -72
	banim_frame_oam 0x8000, 0x4000, 0x84, 12, -40
	banim_frame_oam 0x0, 0x8000, 0x45, -52, -80
	banim_frame_oam 0x4000, 0x8000, 0xC5, -52, -48
	banim_frame_oam 0x4000, 0x0, 0x7, -20, -80
	banim_frame_oam 0x0, 0x0, 0x9, -4, -80
	banim_frame_oam 0x0, 0x4000, 0x5, -52, -96
	banim_frame_oam 0x0, 0x8000, 0x49, 20, -64
	banim_frame_oam 0x8000, 0x4000, 0x4D, 52, -64
	banim_frame_oam 0x4000, 0x4000, 0xC9, 20, -32
	banim_frame_oam 0x0, 0x4000, 0xC, 44, -80
	banim_frame_oam 0x4000, 0x0, 0x28, 4, -8
	banim_frame_oam 0x8000, 0x0, 0xCD, 60, -56
	banim_frame_end
banim_bos_at1_2_oam_frame_11_l:
	banim_frame_oam 0x8000, 0xC000, 0xE, -20, -72
	banim_frame_oam 0x8000, 0x4000, 0x12, 12, -72
	banim_frame_oam 0x8000, 0x4000, 0x92, 12, -40
	banim_frame_oam 0x8000, 0xC000, 0x13, -52, -96
	banim_frame_oam 0x4000, 0x0, 0xB8, -20, -80
	banim_frame_oam 0x0, 0x0, 0xBA, -4, -80
	banim_frame_oam 0x0, 0x8000, 0x17, 20, -72
	banim_frame_oam 0x8000, 0x8000, 0x1B, 52, -72
	banim_frame_oam 0x4000, 0x4000, 0x97, 20, -40
	banim_frame_oam 0x4000, 0x0, 0x9B, 52, -40
	banim_frame_oam 0x8000, 0x0, 0xB7, 20, -32
	banim_frame_oam 0x0, 0x0, 0xF7, 20, -16
	banim_frame_oam 0x0, 0x0, 0xF8, 52, -80
	banim_frame_oam 0x0, 0x4000, 0xD9, -4, -8
	banim_frame_oam 0x0, 0x0, 0xDB, 12, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_12_l:
	banim_frame_oam 0x8000, 0xC000, 0x0, -20, -72
	banim_frame_oam 0x8000, 0x4000, 0x4, 12, -72
	banim_frame_oam 0x8000, 0x4000, 0x84, 12, -40
	banim_frame_oam 0x0, 0x8000, 0x45, -52, -80
	banim_frame_oam 0x4000, 0x8000, 0xC5, -52, -48
	banim_frame_oam 0x0, 0x4000, 0x5, -52, -96
	banim_frame_oam 0x4000, 0x0, 0x27, -20, -80
	banim_frame_oam 0x0, 0x4000, 0x29, -4, -8
	banim_frame_oam 0x8000, 0x0, 0x2B, 12, -8
	banim_frame_oam 0x0, 0x8000, 0x69, 20, -64
	banim_frame_oam 0x8000, 0x4000, 0x6D, 52, -64
	banim_frame_oam 0x4000, 0x4000, 0xE9, 20, -32
	banim_frame_oam 0x0, 0x0, 0xED, 52, -32
	banim_frame_oam 0x4000, 0x0, 0x4C, 44, -72
	banim_frame_oam 0x8000, 0x0, 0xD, 60, -56
	banim_frame_end
banim_bos_at1_2_oam_frame_13_l:
	banim_frame_oam 0x8000, 0xC000, 0xE, -20, -80
	banim_frame_oam 0x8000, 0x4000, 0x12, 12, -80
	banim_frame_oam 0x8000, 0x4000, 0x92, 12, -48
	banim_frame_oam 0x8000, 0xC000, 0x13, -52, -96
	banim_frame_oam 0x0, 0x8000, 0x17, 20, -80
	banim_frame_oam 0x8000, 0x8000, 0x1B, 52, -80
	banim_frame_oam 0x4000, 0x8000, 0x97, 20, -48
	banim_frame_oam 0x0, 0x4000, 0x9B, 52, -48
	banim_frame_oam 0x0, 0x4000, 0xD7, -4, -16
	banim_frame_end
banim_bos_at1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -4, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x1000, 0x501F, -4, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x501F, -4, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -4, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0xC000, 0x0, -20, -72
	banim_frame_oam 0x8000, 0x4000, 0x4, 12, -72
	banim_frame_oam 0x8000, 0x4000, 0x84, 12, -40
	banim_frame_oam 0x4000, 0x8000, 0x7, -20, -88
	banim_frame_oam 0x8000, 0x8000, 0x47, -44, -88
	banim_frame_oam 0x8000, 0x4000, 0x49, -28, -88
	banim_frame_oam 0x0, 0x4000, 0xC7, -44, -56
	banim_frame_oam 0x8000, 0x0, 0xC9, -28, -56
	banim_frame_oam 0x8000, 0x8000, 0x25, -60, -96
	banim_frame_oam 0x4000, 0x0, 0xA5, -60, -64
	banim_frame_oam 0x0, 0x8000, 0x4A, 20, -80
	banim_frame_oam 0x8000, 0x4000, 0x4E, 52, -80
	banim_frame_oam 0x4000, 0x8000, 0xCA, 20, -48
	banim_frame_oam 0x8000, 0x0, 0xCE, 52, -48
	banim_frame_end
banim_bos_at1_2_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x8000, 0x19, -20, -88
	banim_frame_oam 0x8000, 0xC000, 0xF, -20, -72
	banim_frame_oam 0x8000, 0x4000, 0x13, 12, -72
	banim_frame_oam 0x8000, 0x4000, 0x93, 12, -40
	banim_frame_oam 0x8000, 0xC000, 0x14, -60, -104
	banim_frame_oam 0x8000, 0x4000, 0x18, -28, -104
	banim_frame_oam 0x8000, 0x4000, 0x98, -28, -72
	banim_frame_oam 0x0, 0x8000, 0x59, 20, -80
	banim_frame_oam 0x8000, 0x4000, 0x5D, 52, -80
	banim_frame_oam 0x4000, 0x8000, 0xD9, 20, -48
	banim_frame_oam 0x8000, 0x0, 0xDD, 52, -48
	banim_frame_end
banim_bos_at1_2_oam_frame_3_l:
	banim_frame_oam 0x8000, 0xC000, 0x0, -20, -72
	banim_frame_oam 0x8000, 0x4000, 0x4, 12, -72
	banim_frame_oam 0x8000, 0x4000, 0x84, 12, -40
	banim_frame_oam 0x0, 0x8000, 0x25, -60, -96
	banim_frame_oam 0x8000, 0x4000, 0x29, -28, -96
	banim_frame_oam 0x4000, 0x8000, 0xA5, -60, -64
	banim_frame_oam 0x8000, 0x0, 0xA9, -28, -64
	banim_frame_oam 0x4000, 0x4000, 0xE5, -60, -48
	banim_frame_oam 0x0, 0x0, 0xE9, -28, -48
	banim_frame_oam 0x0, 0x4000, 0xA, -20, -88
	banim_frame_oam 0x8000, 0x0, 0xC, -4, -88
	banim_frame_oam 0x0, 0x8000, 0x4A, 20, -80
	banim_frame_oam 0x8000, 0x4000, 0x4E, 52, -80
	banim_frame_oam 0x4000, 0x8000, 0xCA, 20, -48
	banim_frame_oam 0x8000, 0x0, 0xCE, 52, -48
	banim_frame_end
banim_bos_at1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x0, 0x3B, -4, -8
	banim_frame_oam 0x8000, 0xC000, 0xF, -20, -72
	banim_frame_oam 0x8000, 0x4000, 0x13, 12, -72
	banim_frame_oam 0x8000, 0x4000, 0x93, 12, -40
	banim_frame_oam 0x0, 0x8000, 0x34, -60, -96
	banim_frame_oam 0x8000, 0x4000, 0x38, -28, -96
	banim_frame_oam 0x4000, 0x8000, 0xB4, -60, -64
	banim_frame_oam 0x8000, 0x0, 0xB8, -28, -64
	banim_frame_oam 0x4000, 0x4000, 0xF4, -60, -48
	banim_frame_oam 0x0, 0x0, 0xF8, -28, -48
	banim_frame_oam 0x0, 0x4000, 0x19, -20, -88
	banim_frame_oam 0x0, 0x8000, 0x59, 20, -80
	banim_frame_oam 0x8000, 0x4000, 0x5D, 52, -80
	banim_frame_oam 0x4000, 0x8000, 0xD9, 20, -48
	banim_frame_oam 0x8000, 0x0, 0xDD, 52, -48
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x17, -44, -24
	banim_frame_oam 0x8000, 0x4000, 0x1B, -12, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xE5, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xE5, 0, 0
	banim_frame_end
banim_bos_at1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, 0, -8
	banim_frame_end
	.section .data.oam_r
banim_bos_at1_2_oam_r:
	banim_frame_oam 0x8000, 0xD000, 0x7, 68, 8
	banim_frame_oam 0x8000, 0x5000, 0xB, 60, 8
	banim_frame_oam 0x0, 0x1000, 0x8B, 60, 40
	banim_frame_oam 0x0, 0x5000, 0xC5, 84, -8
	banim_frame_oam 0x0, 0x1000, 0x6, 60, 64
	banim_frame_oam 0x0, 0x1000, 0x0, 84, -16
	banim_frame_oam 0x0, 0x9000, 0x80, 52, -24
	banim_frame_oam 0x8000, 0x5000, 0x84, 44, -24
	banim_frame_oam 0x8000, 0x9000, 0x25, 28, -48
	banim_frame_oam 0x4000, 0x1000, 0xA5, 28, -16
	banim_frame_oam 0x0, 0x9000, 0x1, 44, -56
	banim_frame_oam 0x8000, 0x1000, 0x40, 76, -40
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x1B, 68, 8
	banim_frame_oam 0x0, 0x5000, 0xD9, 84, -8
	banim_frame_oam 0x8000, 0xD000, 0x14, 52, -56
	banim_frame_oam 0x8000, 0x5000, 0x18, 44, -56
	banim_frame_oam 0x8000, 0x5000, 0x98, 44, -24
	banim_frame_oam 0x8000, 0x9000, 0x39, 28, -48
	banim_frame_oam 0x4000, 0x1000, 0xB9, 28, -16
	banim_frame_oam 0x0, 0x1000, 0x1A, 60, 8
	banim_frame_oam 0x8000, 0x1000, 0xD3, 84, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x86, -12, 40
	banim_frame_oam 0x8000, 0x5000, 0x88, -20, 40
	banim_frame_oam 0x8000, 0x1000, 0xA9, -28, 48
	banim_frame_oam 0x0, 0x1000, 0xE9, -28, 64
	banim_frame_oam 0x0, 0x1000, 0x67, -36, 56
	banim_frame_oam 0x8000, 0x5000, 0x6, 4, 32
	banim_frame_oam 0x0, 0x9000, 0xA, 12, 8
	banim_frame_oam 0x8000, 0x5000, 0x9, 44, 8
	banim_frame_oam 0x8000, 0xD000, 0x0, 44, -56
	banim_frame_oam 0x8000, 0x9000, 0x4, 28, -56
	banim_frame_oam 0x8000, 0x9000, 0x84, 28, -24
	banim_frame_oam 0x0, 0x5000, 0x7, 52, 8
	banim_frame_oam 0x4000, 0x1000, 0x47, 52, 24
	banim_frame_oam 0x0, 0x1000, 0x68, 52, 32
	banim_frame_oam 0x0, 0x5000, 0x8B, 20, 40
	banim_frame_oam 0x8000, 0x1000, 0x8D, 12, 40
	banim_frame_oam 0x0, 0x1000, 0xCD, 12, 56
	banim_frame_oam 0x4000, 0x1000, 0x89, 36, 40
	banim_frame_oam 0x8000, 0x1000, 0xCB, 68, 8
	banim_frame_oam 0x8000, 0x1000, 0xAA, 76, -40
	banim_frame_oam 0x0, 0x1000, 0xEA, 76, -24
	banim_frame_end
	banim_frame_oam 0x0, 0xD000, 0xE, 12, -56
	banim_frame_oam 0x4000, 0xD000, 0x76, -52, -16
	banim_frame_oam 0x8000, 0x9000, 0x7E, -68, -16
	banim_frame_oam 0x4000, 0x5000, 0xF6, -20, 16
	banim_frame_oam 0x4000, 0x5000, 0xFA, -52, 16
	banim_frame_oam 0x4000, 0x1000, 0xFE, -68, 16
	banim_frame_oam 0x4000, 0x1000, 0x5E, -68, -24
	banim_frame_oam 0x8000, 0x1000, 0x16, -76, -16
	banim_frame_oam 0x0, 0x1000, 0x56, -76, 0
	banim_frame_oam 0x4000, 0x9000, 0x37, 20, 8
	banim_frame_oam 0x8000, 0x1000, 0x3B, 12, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x0, 44, -56
	banim_frame_oam 0x8000, 0x9000, 0x4, 28, -56
	banim_frame_oam 0x4000, 0x9000, 0x80, 44, -24
	banim_frame_oam 0x0, 0x5000, 0x84, 28, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, 44, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, 28, -8
	banim_frame_oam 0x8000, 0x9000, 0x46, 12, -40
	banim_frame_oam 0x4000, 0x1000, 0xC6, 12, -8
	banim_frame_oam 0x0, 0x9000, 0x48, -20, -24
	banim_frame_oam 0x8000, 0x5000, 0x4C, -28, -24
	banim_frame_oam 0x4000, 0x5000, 0xC8, -20, 8
	banim_frame_oam 0x0, 0x1000, 0xCC, -28, 8
	banim_frame_oam 0x8000, 0x9000, 0x4D, -44, -24
	banim_frame_oam 0x8000, 0x1000, 0xE, -44, -40
	banim_frame_oam 0x4000, 0x1000, 0xE5, 20, 0
	banim_frame_oam 0x0, 0x1000, 0xE7, 12, 0
	banim_frame_oam 0x4000, 0x5000, 0xE0, 12, 8
	banim_frame_oam 0x8000, 0x5000, 0xF, -52, -40
	banim_frame_oam 0x0, 0x1000, 0x8F, -52, -8
	banim_frame_oam 0x0, 0x5000, 0x6, -68, -48
	banim_frame_oam 0x0, 0x5000, 0x8, -68, -32
	banim_frame_oam 0x4000, 0x1000, 0xA, -68, -16
	banim_frame_oam 0x0, 0x1000, 0x2A, -60, -8
	banim_frame_oam 0x0, 0x1000, 0x2B, -52, -48
	banim_frame_oam 0x8000, 0x1000, 0xAF, -76, -40
	banim_frame_oam 0x0, 0x1000, 0xEF, -76, -24
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x12, 28, -56
	banim_frame_oam 0x8000, 0x9000, 0x10, 60, -56
	banim_frame_oam 0x0, 0x5000, 0x90, 60, -24
	banim_frame_oam 0x8000, 0x9000, 0x56, 12, -40
	banim_frame_oam 0x0, 0x5000, 0xD6, 12, -8
	banim_frame_oam 0x0, 0x9000, 0x78, -20, -24
	banim_frame_oam 0x8000, 0x5000, 0x7C, -28, -24
	banim_frame_oam 0x4000, 0x5000, 0xF8, -20, 8
	banim_frame_oam 0x0, 0x1000, 0xFC, -28, 8
	banim_frame_oam 0x0, 0x5000, 0x7D, -44, -24
	banim_frame_oam 0x8000, 0x1000, 0x7F, -52, -24
	banim_frame_oam 0x4000, 0x1000, 0xBD, -44, -8
	banim_frame_oam 0x0, 0x1000, 0xBF, -52, -8
	banim_frame_oam 0x4000, 0x1000, 0xDD, -44, 0
	banim_frame_oam 0x0, 0x5000, 0xD0, -52, -40
	banim_frame_oam 0x4000, 0x1000, 0x1D, -68, -16
	banim_frame_oam 0x0, 0x1000, 0x1C, -52, -48
	banim_frame_oam 0x0, 0x5000, 0x19, -68, -32
	banim_frame_oam 0x8000, 0x1000, 0x1B, -76, -32
	banim_frame_oam 0x0, 0x5000, 0x16, -68, -48
	banim_frame_oam 0x8000, 0x1000, 0x18, -76, -48
	banim_frame_oam 0x4000, 0x5000, 0x5C, 12, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x6, 12, 8
	banim_frame_oam 0x4000, 0x9000, 0xA, -20, 8
	banim_frame_oam 0x0, 0x5000, 0xE, -36, 8
	banim_frame_oam 0x8000, 0xD000, 0x0, 44, -56
	banim_frame_oam 0x8000, 0x9000, 0x4, 28, -56
	banim_frame_oam 0x8000, 0x9000, 0x84, 28, -24
	banim_frame_oam 0x8000, 0x9000, 0x46, 12, -40
	banim_frame_oam 0x0, 0x5000, 0xC6, 12, -8
	banim_frame_oam 0x4000, 0xD000, 0x88, -52, -24
	banim_frame_oam 0x8000, 0x9000, 0x90, -68, -24
	banim_frame_oam 0x8000, 0x5000, 0x92, -76, -24
	banim_frame_oam 0x4000, 0x9000, 0x4E, -68, -40
	banim_frame_oam 0x8000, 0x1000, 0x52, -76, -40
	banim_frame_oam 0x0, 0x1000, 0x30, -60, -48
	banim_frame_end
banim_bos_at1_2_oam_frame_17_r:
	banim_frame_oam 0x0, 0x9000, 0x17, 13, -27
	banim_frame_oam 0x8000, 0x5000, 0x1B, 5, -27
	banim_frame_end
banim_bos_at1_2_oam_frame_0_r:
	banim_frame_oam 0x4000, 0xD000, 0x22, -28, -72
	banim_frame_oam 0x8000, 0x5000, 0x2A, -36, -72
	banim_frame_oam 0x4000, 0x5000, 0xA2, 4, -40
	banim_frame_oam 0x4000, 0x5000, 0xA6, -28, -40
	banim_frame_oam 0x0, 0x1000, 0xAA, -36, -40
	banim_frame_oam 0x8000, 0x5000, 0x60, -44, -72
	banim_frame_oam 0x0, 0x1000, 0xE0, -44, -40
	banim_frame_oam 0x8000, 0x1000, 0xA1, -52, -56
	banim_frame_oam 0x0, 0x1000, 0xE1, -52, -40
	banim_frame_oam 0x8000, 0x1000, 0xC2, -60, -56
	banim_frame_oam 0x0, 0x1000, 0xCA, -60, -72
	banim_frame_oam 0x8000, 0x1000, 0xC3, -52, -72
	banim_frame_oam 0x0, 0x1000, 0xA, -68, -56
	banim_frame_oam 0x0, 0x5000, 0x0, 36, -80
	banim_frame_oam 0x4000, 0x1000, 0x40, 36, -64
	banim_frame_oam 0x8000, 0x1000, 0x61, 36, -56
	banim_frame_oam 0x4000, 0x5000, 0x2, 4, -80
	banim_frame_oam 0x4000, 0x1000, 0x6, -12, -80
	banim_frame_oam 0x8000, 0x1000, 0xC9, 44, -96
	banim_frame_oam 0x0, 0x1000, 0xEA, 36, -88
	banim_frame_oam 0x4000, 0x1000, 0xF4, -60, -80
	banim_frame_oam 0x4000, 0x9000, 0xC4, -12, -32
	banim_frame_oam 0x8000, 0x1000, 0xC8, -20, -32
	banim_frame_oam 0x4000, 0x5000, 0xF6, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xFA, -20, -16
	banim_frame_end
banim_bos_at1_2_oam_frame_7_r:
	banim_frame_oam 0x8000, 0xD000, 0xB, -12, -80
	banim_frame_oam 0x8000, 0x5000, 0xF, -20, -80
	banim_frame_oam 0x8000, 0x5000, 0x8F, -20, -48
	banim_frame_oam 0x0, 0x9000, 0x50, 20, -80
	banim_frame_oam 0x4000, 0x5000, 0xD0, 20, -48
	banim_frame_oam 0x8000, 0x1000, 0x10, 44, -96
	banim_frame_oam 0x4000, 0x1000, 0xF0, -12, -16
	banim_frame_oam 0x0, 0x9000, 0x34, -52, -72
	banim_frame_oam 0x8000, 0x5000, 0x38, -60, -72
	banim_frame_oam 0x4000, 0x5000, 0xB4, -52, -40
	banim_frame_oam 0x0, 0x1000, 0xB8, -60, -40
	banim_frame_oam 0x0, 0x1000, 0x79, -68, -56
	banim_frame_oam 0x4000, 0x1000, 0x17, -60, -80
	banim_frame_end
banim_bos_at1_2_oam_frame_8_r:
	banim_frame_oam 0x8000, 0xD000, 0x0, -12, -80
	banim_frame_oam 0x8000, 0x5000, 0x4, -20, -80
	banim_frame_oam 0x8000, 0x5000, 0x84, -20, -48
	banim_frame_oam 0x0, 0x9000, 0x45, 20, -80
	banim_frame_oam 0x4000, 0x5000, 0xC5, 20, -48
	banim_frame_oam 0x0, 0x5000, 0x5, 44, -96
	banim_frame_oam 0x4000, 0x1000, 0x7, 12, -88
	banim_frame_oam 0x8000, 0x9000, 0x9, -36, -72
	banim_frame_oam 0x8000, 0x5000, 0xB, -44, -72
	banim_frame_oam 0x4000, 0x1000, 0x89, -36, -40
	banim_frame_oam 0x0, 0x1000, 0x8B, -44, -40
	banim_frame_oam 0x8000, 0x1000, 0xA9, -52, -80
	banim_frame_oam 0x0, 0x1000, 0xE9, -52, -64
	banim_frame_oam 0x0, 0x1000, 0xAA, -60, -80
	banim_frame_oam 0x0, 0x5000, 0xCA, -60, -56
	banim_frame_oam 0x0, 0x1000, 0xAB, -60, -64
	banim_frame_oam 0x0, 0x1000, 0xE8, -12, -16
	banim_frame_end
banim_bos_at1_2_oam_frame_9_r:
	banim_frame_oam 0x8000, 0xD000, 0xC, -12, -80
	banim_frame_oam 0x8000, 0x5000, 0x10, -20, -80
	banim_frame_oam 0x8000, 0x5000, 0x90, -20, -48
	banim_frame_oam 0x0, 0x9000, 0x36, -52, -72
	banim_frame_oam 0x4000, 0x5000, 0xB6, -52, -40
	banim_frame_oam 0x8000, 0x1000, 0x5A, -60, -64
	banim_frame_oam 0x0, 0x1000, 0x19, -52, -80
	banim_frame_oam 0x0, 0x1000, 0xD1, -12, -16
	banim_frame_oam 0x8000, 0x9000, 0x13, 28, -80
	banim_frame_oam 0x8000, 0x5000, 0x15, 20, -80
	banim_frame_oam 0x4000, 0x1000, 0x93, 28, -48
	banim_frame_oam 0x0, 0x1000, 0x95, 20, -48
	banim_frame_oam 0x4000, 0x1000, 0xB1, 12, -88
	banim_frame_oam 0x0, 0x5000, 0x11, 44, -80
	banim_frame_oam 0x4000, 0x1000, 0x51, 44, -64
	banim_frame_oam 0x0, 0x1000, 0x72, 44, -56
	banim_frame_oam 0x8000, 0x1000, 0x71, 52, -96
	banim_frame_oam 0x0, 0x1000, 0x92, 44, -88
	banim_frame_end
banim_bos_at1_2_oam_frame_10_r:
	banim_frame_oam 0x8000, 0xD000, 0x0, -12, -72
	banim_frame_oam 0x8000, 0x5000, 0x4, -20, -72
	banim_frame_oam 0x8000, 0x5000, 0x84, -20, -40
	banim_frame_oam 0x0, 0x9000, 0x45, 20, -80
	banim_frame_oam 0x4000, 0x9000, 0xC5, 20, -48
	banim_frame_oam 0x4000, 0x1000, 0x7, 4, -80
	banim_frame_oam 0x0, 0x1000, 0x9, -4, -80
	banim_frame_oam 0x0, 0x5000, 0x5, 36, -96
	banim_frame_oam 0x0, 0x9000, 0x49, -52, -64
	banim_frame_oam 0x8000, 0x5000, 0x4D, -60, -64
	banim_frame_oam 0x4000, 0x5000, 0xC9, -52, -32
	banim_frame_oam 0x0, 0x5000, 0xC, -60, -80
	banim_frame_oam 0x4000, 0x1000, 0x28, -20, -8
	banim_frame_oam 0x8000, 0x1000, 0xCD, -68, -56
	banim_frame_end
banim_bos_at1_2_oam_frame_11_r:
	banim_frame_oam 0x8000, 0xD000, 0xE, -12, -72
	banim_frame_oam 0x8000, 0x5000, 0x12, -20, -72
	banim_frame_oam 0x8000, 0x5000, 0x92, -20, -40
	banim_frame_oam 0x8000, 0xD000, 0x13, 20, -96
	banim_frame_oam 0x4000, 0x1000, 0xB8, 4, -80
	banim_frame_oam 0x0, 0x1000, 0xBA, -4, -80
	banim_frame_oam 0x0, 0x9000, 0x17, -52, -72
	banim_frame_oam 0x8000, 0x9000, 0x1B, -68, -72
	banim_frame_oam 0x4000, 0x5000, 0x97, -52, -40
	banim_frame_oam 0x4000, 0x1000, 0x9B, -68, -40
	banim_frame_oam 0x8000, 0x1000, 0xB7, -28, -32
	banim_frame_oam 0x0, 0x1000, 0xF7, -28, -16
	banim_frame_oam 0x0, 0x1000, 0xF8, -60, -80
	banim_frame_oam 0x0, 0x5000, 0xD9, -12, -8
	banim_frame_oam 0x0, 0x1000, 0xDB, -20, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_12_r:
	banim_frame_oam 0x8000, 0xD000, 0x0, -12, -72
	banim_frame_oam 0x8000, 0x5000, 0x4, -20, -72
	banim_frame_oam 0x8000, 0x5000, 0x84, -20, -40
	banim_frame_oam 0x0, 0x9000, 0x45, 20, -80
	banim_frame_oam 0x4000, 0x9000, 0xC5, 20, -48
	banim_frame_oam 0x0, 0x5000, 0x5, 36, -96
	banim_frame_oam 0x4000, 0x1000, 0x27, 4, -80
	banim_frame_oam 0x0, 0x5000, 0x29, -12, -8
	banim_frame_oam 0x8000, 0x1000, 0x2B, -20, -8
	banim_frame_oam 0x0, 0x9000, 0x69, -52, -64
	banim_frame_oam 0x8000, 0x5000, 0x6D, -60, -64
	banim_frame_oam 0x4000, 0x5000, 0xE9, -52, -32
	banim_frame_oam 0x0, 0x1000, 0xED, -60, -32
	banim_frame_oam 0x4000, 0x1000, 0x4C, -60, -72
	banim_frame_oam 0x8000, 0x1000, 0xD, -68, -56
	banim_frame_end
banim_bos_at1_2_oam_frame_13_r:
	banim_frame_oam 0x8000, 0xD000, 0xE, -12, -80
	banim_frame_oam 0x8000, 0x5000, 0x12, -20, -80
	banim_frame_oam 0x8000, 0x5000, 0x92, -20, -48
	banim_frame_oam 0x8000, 0xD000, 0x13, 20, -96
	banim_frame_oam 0x0, 0x9000, 0x17, -52, -80
	banim_frame_oam 0x8000, 0x9000, 0x1B, -68, -80
	banim_frame_oam 0x4000, 0x9000, 0x97, -52, -48
	banim_frame_oam 0x0, 0x5000, 0x9B, -68, -48
	banim_frame_oam 0x0, 0x5000, 0xD7, -12, -16
	banim_frame_end
banim_bos_at1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0x1F, -4, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x0, 0x501F, -4, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x501F, -4, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x1F, -4, -8
	banim_frame_end
banim_bos_at1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0xD000, 0x0, -12, -72
	banim_frame_oam 0x8000, 0x5000, 0x4, -20, -72
	banim_frame_oam 0x8000, 0x5000, 0x84, -20, -40
	banim_frame_oam 0x4000, 0x9000, 0x7, -12, -88
	banim_frame_oam 0x8000, 0x9000, 0x47, 28, -88
	banim_frame_oam 0x8000, 0x5000, 0x49, 20, -88
	banim_frame_oam 0x0, 0x5000, 0xC7, 28, -56
	banim_frame_oam 0x8000, 0x1000, 0xC9, 20, -56
	banim_frame_oam 0x8000, 0x9000, 0x25, 44, -96
	banim_frame_oam 0x4000, 0x1000, 0xA5, 44, -64
	banim_frame_oam 0x0, 0x9000, 0x4A, -52, -80
	banim_frame_oam 0x8000, 0x5000, 0x4E, -60, -80
	banim_frame_oam 0x4000, 0x9000, 0xCA, -52, -48
	banim_frame_oam 0x8000, 0x1000, 0xCE, -60, -48
	banim_frame_end
banim_bos_at1_2_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x9000, 0x19, -12, -88
	banim_frame_oam 0x8000, 0xD000, 0xF, -12, -72
	banim_frame_oam 0x8000, 0x5000, 0x13, -20, -72
	banim_frame_oam 0x8000, 0x5000, 0x93, -20, -40
	banim_frame_oam 0x8000, 0xD000, 0x14, 28, -104
	banim_frame_oam 0x8000, 0x5000, 0x18, 20, -104
	banim_frame_oam 0x8000, 0x5000, 0x98, 20, -72
	banim_frame_oam 0x0, 0x9000, 0x59, -52, -80
	banim_frame_oam 0x8000, 0x5000, 0x5D, -60, -80
	banim_frame_oam 0x4000, 0x9000, 0xD9, -52, -48
	banim_frame_oam 0x8000, 0x1000, 0xDD, -60, -48
	banim_frame_end
banim_bos_at1_2_oam_frame_3_r:
	banim_frame_oam 0x8000, 0xD000, 0x0, -12, -72
	banim_frame_oam 0x8000, 0x5000, 0x4, -20, -72
	banim_frame_oam 0x8000, 0x5000, 0x84, -20, -40
	banim_frame_oam 0x0, 0x9000, 0x25, 28, -96
	banim_frame_oam 0x8000, 0x5000, 0x29, 20, -96
	banim_frame_oam 0x4000, 0x9000, 0xA5, 28, -64
	banim_frame_oam 0x8000, 0x1000, 0xA9, 20, -64
	banim_frame_oam 0x4000, 0x5000, 0xE5, 28, -48
	banim_frame_oam 0x0, 0x1000, 0xE9, 20, -48
	banim_frame_oam 0x0, 0x5000, 0xA, 4, -88
	banim_frame_oam 0x8000, 0x1000, 0xC, -4, -88
	banim_frame_oam 0x0, 0x9000, 0x4A, -52, -80
	banim_frame_oam 0x8000, 0x5000, 0x4E, -60, -80
	banim_frame_oam 0x4000, 0x9000, 0xCA, -52, -48
	banim_frame_oam 0x8000, 0x1000, 0xCE, -60, -48
	banim_frame_end
banim_bos_at1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x1000, 0x3B, -4, -8
	banim_frame_oam 0x8000, 0xD000, 0xF, -12, -72
	banim_frame_oam 0x8000, 0x5000, 0x13, -20, -72
	banim_frame_oam 0x8000, 0x5000, 0x93, -20, -40
	banim_frame_oam 0x0, 0x9000, 0x34, 28, -96
	banim_frame_oam 0x8000, 0x5000, 0x38, 20, -96
	banim_frame_oam 0x4000, 0x9000, 0xB4, 28, -64
	banim_frame_oam 0x8000, 0x1000, 0xB8, 20, -64
	banim_frame_oam 0x4000, 0x5000, 0xF4, 28, -48
	banim_frame_oam 0x0, 0x1000, 0xF8, 20, -48
	banim_frame_oam 0x0, 0x5000, 0x19, 4, -88
	banim_frame_oam 0x0, 0x9000, 0x59, -52, -80
	banim_frame_oam 0x8000, 0x5000, 0x5D, -60, -80
	banim_frame_oam 0x4000, 0x9000, 0xD9, -52, -48
	banim_frame_oam 0x8000, 0x1000, 0xDD, -60, -48
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x17, 12, -24
	banim_frame_oam 0x8000, 0x5000, 0x1B, 4, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xE5, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xE5, -8, 0
	banim_frame_end
banim_bos_at1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x1F, -8, -8
	banim_frame_end
	.section .data.script
banim_bos_at1_2_script:
banim_bos_at1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 1, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 1, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 6, banim_bos_at1_sheet_4, 9, banim_bos_at1_2_oam_frame_7_r - banim_bos_at1_2_oam_r
	banim_code_frame 6, banim_bos_at1_sheet_5, 10, banim_bos_at1_2_oam_frame_8_r - banim_bos_at1_2_oam_r
	banim_code_frame 30, banim_bos_at1_sheet_5, 11, banim_bos_at1_2_oam_frame_9_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_5, 10, banim_bos_at1_2_oam_frame_8_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 9, banim_bos_at1_2_oam_frame_7_r - banim_bos_at1_2_oam_r
	banim_code_sound_demon_king_scream
	banim_code_frame 2, banim_bos_at1_sheet_6, 12, banim_bos_at1_2_oam_frame_10_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 20, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 4, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_6, 12, banim_bos_at1_2_oam_frame_10_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_7, 15, banim_bos_at1_2_oam_frame_13_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 6, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 6, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 30, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_sound_demon_king_scream
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 20, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_frame 4, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_6, 18, banim_bos_at1_2_oam_frame_14_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_7, 19, banim_bos_at1_2_oam_frame_15_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 17, banim_bos_at1_2_oam_frame_6_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 1, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 6, banim_bos_at1_sheet_4, 9, banim_bos_at1_2_oam_frame_7_r - banim_bos_at1_2_oam_r
	banim_code_frame 6, banim_bos_at1_sheet_5, 10, banim_bos_at1_2_oam_frame_8_r - banim_bos_at1_2_oam_r
	banim_code_frame 30, banim_bos_at1_sheet_5, 11, banim_bos_at1_2_oam_frame_9_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_5, 10, banim_bos_at1_2_oam_frame_8_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_4, 9, banim_bos_at1_2_oam_frame_7_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 12, banim_bos_at1_2_oam_frame_10_r - banim_bos_at1_2_oam_r
	banim_code_sound_demon_king_scream
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 20, banim_bos_at1_sheet_7, 14, banim_bos_at1_2_oam_frame_12_r - banim_bos_at1_2_oam_r
	banim_code_frame 4, banim_bos_at1_sheet_6, 13, banim_bos_at1_2_oam_frame_11_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_6, 12, banim_bos_at1_2_oam_frame_10_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_7, 15, banim_bos_at1_2_oam_frame_13_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
banim_bos_at1_2_mode_dodge_close:
	banim_code_frame 1, banim_bos_at1_sheet_0, 120, banim_bos_at1_2_oam_frame_16_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_dodge_range:
	banim_code_frame 1, banim_bos_at1_sheet_0, 120, banim_bos_at1_2_oam_frame_16_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_stand_close:
	banim_code_frame 1, banim_bos_at1_sheet_0, 7, banim_bos_at1_2_oam_frame_17_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_stand:
	banim_code_frame 1, banim_bos_at1_sheet_0, 7, banim_bos_at1_2_oam_frame_17_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_stand_range:
	banim_code_frame 1, banim_bos_at1_sheet_0, 7, banim_bos_at1_2_oam_frame_17_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_bos_at1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_85 0x71
	banim_code_frame 1, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 248, banim_bos_at1_sheet_4, 8, banim_bos_at1_2_oam_frame_0_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_frame 2, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 1, banim_bos_at1_sheet_9, 23, banim_bos_at1_2_oam_frame_4_r - banim_bos_at1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_bos_at1_sheet_9, 22, banim_bos_at1_2_oam_frame_3_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_8, 21, banim_bos_at1_2_oam_frame_2_r - banim_bos_at1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_bos_at1_sheet_8, 20, banim_bos_at1_2_oam_frame_1_r - banim_bos_at1_2_oam_r
	banim_code_frame 3, banim_bos_at1_sheet_4, 16, banim_bos_at1_2_oam_frame_5_r - banim_bos_at1_2_oam_r
	banim_code_85 0x72
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_bos_at1_2_mode_attack_close - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_attack_close_back - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_attack_close_critical - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_attack_close_critical_back - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_attack_range - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_attack_range_critical - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_dodge_close - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_dodge_range - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_stand_close - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_stand - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_stand_range - banim_bos_at1_2_script
	.word banim_bos_at1_2_mode_attack_miss - banim_bos_at1_2_script
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

