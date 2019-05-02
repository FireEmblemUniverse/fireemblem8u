@ vim:ft=armv4
	.global banim_fifd_he1_script
	.global banim_fifd_he1_oam_r
	.global banim_fifd_he1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC4
	.section .data.oam_l
banim_fifd_he1_oam_l:
banim_fifd_he1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x84, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC5, -24, 8
	banim_frame_end
banim_fifd_he1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x5000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC5, -24, 8
	banim_frame_oam 0x4000, 0xD000, 0xF, -32, -50
	banim_frame_oam 0x8000, 0x9000, 0x17, -48, -50
	banim_frame_oam 0x4000, 0x9000, 0x8F, 0, -18
	banim_frame_oam 0x4000, 0x9000, 0x93, -32, -18
	banim_frame_oam 0x0, 0x5000, 0x97, -48, -18
	banim_frame_oam 0x4000, 0x5000, 0xCF, 0, -2
	banim_frame_oam 0x4000, 0x5000, 0xD3, -32, -2
	banim_frame_oam 0x4000, 0x1000, 0xD7, -48, -2
	banim_frame_end
banim_fifd_he1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x8, -10, -40
	banim_frame_oam 0x8000, 0x9000, 0xC, -26, -40
	banim_frame_oam 0x4000, 0x5000, 0x88, -10, -8
	banim_frame_oam 0x4000, 0x1000, 0x8C, -26, -8
	banim_frame_oam 0x4000, 0x5000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC5, -24, 8
	banim_frame_end
banim_fifd_he1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0xA8, -18, -31
	banim_frame_oam 0x4000, 0x5000, 0xE8, -18, -15
	banim_frame_oam 0x0, 0x5000, 0xAC, -2, -7
	banim_frame_oam 0x8000, 0x1000, 0xAE, -10, -7
	banim_frame_oam 0x0, 0x1000, 0xE2, -18, -7
	banim_frame_oam 0x4000, 0x1000, 0xE0, -10, -39
	banim_frame_oam 0x4000, 0x5000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC5, -24, 8
	banim_frame_end
banim_fifd_he1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x5000, 0x10E1, -17, 8
	banim_frame_oam 0x0, 0x1000, 0x10E5, -25, 8
	banim_frame_oam 0x0, 0x9000, 0x1000, -7, -45
	banim_frame_oam 0x8000, 0x9000, 0x1004, -23, -45
	banim_frame_oam 0x4000, 0x9000, 0x1080, -7, -13
	banim_frame_oam 0x0, 0x5000, 0x1084, -23, -13
	banim_frame_oam 0x4000, 0x5000, 0x10C0, -7, 3
	banim_frame_oam 0x4000, 0x1000, 0x10C4, -23, 3
	banim_frame_end
banim_fifd_he1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0xD000, 0x1006, -10, -48
	banim_frame_oam 0x8000, 0x9000, 0x100A, -26, -48
	banim_frame_oam 0x8000, 0x5000, 0x100C, -34, -48
	banim_frame_oam 0x8000, 0x9000, 0x108A, -26, -16
	banim_frame_oam 0x8000, 0x5000, 0x108C, -34, -16
	banim_frame_oam 0x4000, 0x5000, 0x103B, -18, 16
	banim_frame_oam 0x0, 0x1000, 0x103F, -26, 16
	banim_frame_end
banim_fifd_he1_oam_frame_6_l:
	banim_frame_oam 0x0, 0xD000, 0x100D, -37, -48
	banim_frame_oam 0x4000, 0x5000, 0x105B, -21, 16
	banim_frame_oam 0x0, 0x1000, 0x105F, -29, 16
	banim_frame_oam 0x0, 0x1000, 0x101E, 11, 16
	banim_frame_end
banim_fifd_he1_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x1028, 22, -50
	banim_frame_oam 0x8000, 0x5000, 0x102A, 14, -50
	banim_frame_oam 0x0, 0x5000, 0x10A8, 22, -18
	banim_frame_oam 0x8000, 0x1000, 0x10AA, 14, -18
	banim_frame_oam 0x4000, 0x5000, 0x1008, -10, -58
	banim_frame_oam 0x0, 0xD000, 0x1000, -50, -50
	banim_frame_oam 0x0, 0x1000, 0x10E8, 14, -2
	banim_frame_oam 0x0, 0x1000, 0x10E9, 14, 6
	banim_frame_oam 0x0, 0x1000, 0x10EA, -18, -58
	banim_frame_oam 0x8000, 0x9000, 0x102B, -66, -50
	banim_frame_oam 0x0, 0x5000, 0x10AB, -66, -18
	banim_frame_oam 0x4000, 0x1000, 0x10EB, -66, -2
	banim_frame_oam 0x8000, 0x5000, 0x108D, -74, -42
	banim_frame_oam 0x4000, 0x1000, 0x100C, -50, -58
	banim_frame_oam 0x4000, 0x9000, 0x100E, -18, 14
	banim_frame_oam 0x4000, 0x9000, 0x1012, -50, 14
	banim_frame_oam 0x0, 0x1000, 0x104D, -58, 6
	banim_frame_end
banim_fifd_he1_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x9000, 0x101E, 11, -48
	banim_frame_oam 0x8000, 0x9000, 0x109E, 11, -16
	banim_frame_oam 0x0, 0xD000, 0x1016, -53, -48
	banim_frame_oam 0x8000, 0x5000, 0x104E, 27, -48
	banim_frame_oam 0x8000, 0x1000, 0x10CE, 27, -16
	banim_frame_oam 0x8000, 0x9000, 0x104F, -69, -48
	banim_frame_oam 0x8000, 0x5000, 0x1051, -77, -48
	banim_frame_oam 0x0, 0x5000, 0x10CF, -77, -16
	banim_frame_oam 0x4000, 0x1000, 0x1052, -45, -56
	banim_frame_oam 0x0, 0x1000, 0x1054, -53, -56
	banim_frame_oam 0x4000, 0x5000, 0x1072, -13, -56
	banim_frame_oam 0x0, 0x1000, 0x1055, -21, -56
	banim_frame_oam 0x4000, 0x5000, 0x1092, -21, 16
	banim_frame_oam 0x4000, 0x5000, 0x10B2, -53, 16
	banim_frame_oam 0x0, 0x1000, 0x10D1, 19, -56
	banim_frame_oam 0x4000, 0x1000, 0x10F1, -6, -64
	banim_frame_oam 0x4000, 0x1000, 0x10D2, -69, -56
	banim_frame_end
banim_fifd_he1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x100F, -18, -34
	banim_frame_oam 0x4000, 0x5000, 0x108F, -18, -2
	banim_frame_oam 0x0, 0x5000, 0x10AF, 14, -18
	banim_frame_oam 0x4000, 0x1000, 0x10EF, 14, -2
	banim_frame_oam 0x4000, 0xD000, 0x1000, -29, -38
	banim_frame_oam 0x8000, 0x5000, 0x1008, -37, -38
	banim_frame_oam 0x4000, 0x5000, 0x1080, 3, -6
	banim_frame_oam 0x4000, 0x5000, 0x1084, -29, -6
	banim_frame_oam 0x0, 0x1000, 0x1088, -37, -6
	banim_frame_oam 0x4000, 0x9000, 0x10A0, 3, 0
	banim_frame_oam 0x4000, 0x9000, 0x10A4, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0x10A8, -37, 0
	banim_frame_oam 0x4000, 0x5000, 0x10E0, 3, 16
	banim_frame_oam 0x4000, 0x5000, 0x10E4, -29, 16
	banim_frame_oam 0x0, 0x1000, 0x10E8, -37, 16
	banim_frame_oam 0x4000, 0x9000, 0x1009, -69, -38
	banim_frame_oam 0x8000, 0x1000, 0x100D, -77, -38
	banim_frame_oam 0x4000, 0x5000, 0x1049, -69, -22
	banim_frame_oam 0x0, 0x1000, 0x104D, -77, -22
	banim_frame_oam 0x8000, 0x9000, 0x1069, -53, -15
	banim_frame_oam 0x4000, 0x1000, 0x10E9, -53, 17
	banim_frame_oam 0x4000, 0x5000, 0x10AB, -61, -46
	banim_frame_oam 0x4000, 0x1000, 0x108C, -45, -54
	banim_frame_oam 0x0, 0x1000, 0x108E, -53, -54
	banim_frame_oam 0x0, 0x1000, 0x108B, -69, -46
	banim_frame_oam 0x4000, 0x5000, 0x10CB, -29, -46
	banim_frame_oam 0x4000, 0x5000, 0x10EB, 3, -46
	banim_frame_oam 0x4000, 0x5000, 0x106B, -13, -54
	banim_frame_oam 0x0, 0x1000, 0x104E, -21, -54
	banim_frame_end
banim_fifd_he1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x100F, -18, -33
	banim_frame_oam 0x4000, 0x5000, 0x108F, -18, -1
	banim_frame_oam 0x0, 0x5000, 0x10AF, 14, -17
	banim_frame_oam 0x4000, 0x1000, 0x10EF, 14, -1
	banim_frame_oam 0x0, 0xD000, 0x1000, -29, -40
	banim_frame_oam 0x8000, 0x9000, 0x1008, -45, -40
	banim_frame_oam 0x8000, 0x5000, 0x100A, -53, -40
	banim_frame_oam 0x8000, 0x9000, 0x1088, -45, -8
	banim_frame_oam 0x8000, 0x5000, 0x108A, -53, -8
	banim_frame_oam 0x4000, 0x5000, 0x10EB, 3, -48
	banim_frame_oam 0x4000, 0x5000, 0x10CB, -29, -48
	banim_frame_oam 0x4000, 0x5000, 0x10AB, -61, -48
	banim_frame_oam 0x0, 0x1000, 0x108B, -69, -48
	banim_frame_oam 0x4000, 0x1000, 0x108C, -45, -56
	banim_frame_oam 0x0, 0x1000, 0x108E, -53, -56
	banim_frame_oam 0x4000, 0x5000, 0x106B, -13, -56
	banim_frame_oam 0x0, 0x1000, 0x104E, -21, -56
	banim_frame_oam 0x0, 0x5000, 0x100B, -69, -40
	banim_frame_oam 0x8000, 0x1000, 0x100D, -77, -40
	banim_frame_oam 0x4000, 0x1000, 0x104B, -69, -24
	banim_frame_oam 0x0, 0x1000, 0x104D, -77, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_fifd_he1_oam_r:
banim_fifd_he1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -24, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x84, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC5, 16, 8
	banim_frame_end
banim_fifd_he1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x4000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC5, 16, 8
	banim_frame_oam 0x4000, 0xC000, 0xF, -32, -50
	banim_frame_oam 0x8000, 0x8000, 0x17, 32, -50
	banim_frame_oam 0x4000, 0x8000, 0x8F, -32, -18
	banim_frame_oam 0x4000, 0x8000, 0x93, 0, -18
	banim_frame_oam 0x0, 0x4000, 0x97, 32, -18
	banim_frame_oam 0x4000, 0x4000, 0xCF, -32, -2
	banim_frame_oam 0x4000, 0x4000, 0xD3, 0, -2
	banim_frame_oam 0x4000, 0x0, 0xD7, 32, -2
	banim_frame_end
banim_fifd_he1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -22, -40
	banim_frame_oam 0x8000, 0x8000, 0xC, 10, -40
	banim_frame_oam 0x4000, 0x4000, 0x88, -22, -8
	banim_frame_oam 0x4000, 0x0, 0x8C, 10, -8
	banim_frame_oam 0x4000, 0x4000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC5, 16, 8
	banim_frame_end
banim_fifd_he1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0xA8, -14, -31
	banim_frame_oam 0x4000, 0x4000, 0xE8, -14, -15
	banim_frame_oam 0x0, 0x4000, 0xAC, -14, -7
	banim_frame_oam 0x8000, 0x0, 0xAE, 2, -7
	banim_frame_oam 0x0, 0x0, 0xE2, 10, -7
	banim_frame_oam 0x4000, 0x0, 0xE0, -6, -39
	banim_frame_oam 0x4000, 0x4000, 0xC1, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC5, 16, 8
	banim_frame_end
banim_fifd_he1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x4000, 0x10E1, -15, 8
	banim_frame_oam 0x0, 0x0, 0x10E5, 17, 8
	banim_frame_oam 0x0, 0x8000, 0x1000, -25, -45
	banim_frame_oam 0x8000, 0x8000, 0x1004, 7, -45
	banim_frame_oam 0x4000, 0x8000, 0x1080, -25, -13
	banim_frame_oam 0x0, 0x4000, 0x1084, 7, -13
	banim_frame_oam 0x4000, 0x4000, 0x10C0, -25, 3
	banim_frame_oam 0x4000, 0x0, 0x10C4, 7, 3
	banim_frame_end
banim_fifd_he1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0xC000, 0x1006, -22, -48
	banim_frame_oam 0x8000, 0x8000, 0x100A, 10, -48
	banim_frame_oam 0x8000, 0x4000, 0x100C, 26, -48
	banim_frame_oam 0x8000, 0x8000, 0x108A, 10, -16
	banim_frame_oam 0x8000, 0x4000, 0x108C, 26, -16
	banim_frame_oam 0x4000, 0x4000, 0x103B, -14, 16
	banim_frame_oam 0x0, 0x0, 0x103F, 18, 16
	banim_frame_end
banim_fifd_he1_oam_frame_6_r:
	banim_frame_oam 0x0, 0xC000, 0x100D, -27, -48
	banim_frame_oam 0x4000, 0x4000, 0x105B, -11, 16
	banim_frame_oam 0x0, 0x0, 0x105F, 21, 16
	banim_frame_oam 0x0, 0x0, 0x101E, -19, 16
	banim_frame_end
banim_fifd_he1_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x1028, -38, -50
	banim_frame_oam 0x8000, 0x4000, 0x102A, -22, -50
	banim_frame_oam 0x0, 0x4000, 0x10A8, -38, -18
	banim_frame_oam 0x8000, 0x0, 0x10AA, -22, -18
	banim_frame_oam 0x4000, 0x4000, 0x1008, -22, -58
	banim_frame_oam 0x0, 0xC000, 0x1000, -14, -50
	banim_frame_oam 0x0, 0x0, 0x10E8, -22, -2
	banim_frame_oam 0x0, 0x0, 0x10E9, -22, 6
	banim_frame_oam 0x0, 0x0, 0x10EA, 10, -58
	banim_frame_oam 0x8000, 0x8000, 0x102B, 50, -50
	banim_frame_oam 0x0, 0x4000, 0x10AB, 50, -18
	banim_frame_oam 0x4000, 0x0, 0x10EB, 50, -2
	banim_frame_oam 0x8000, 0x4000, 0x108D, 66, -42
	banim_frame_oam 0x4000, 0x0, 0x100C, 34, -58
	banim_frame_oam 0x4000, 0x8000, 0x100E, -14, 14
	banim_frame_oam 0x4000, 0x8000, 0x1012, 18, 14
	banim_frame_oam 0x0, 0x0, 0x104D, 50, 6
	banim_frame_end
banim_fifd_he1_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x8000, 0x101E, -27, -48
	banim_frame_oam 0x8000, 0x8000, 0x109E, -27, -16
	banim_frame_oam 0x0, 0xC000, 0x1016, -11, -48
	banim_frame_oam 0x8000, 0x4000, 0x104E, -35, -48
	banim_frame_oam 0x8000, 0x0, 0x10CE, -35, -16
	banim_frame_oam 0x8000, 0x8000, 0x104F, 53, -48
	banim_frame_oam 0x8000, 0x4000, 0x1051, 69, -48
	banim_frame_oam 0x0, 0x4000, 0x10CF, 61, -16
	banim_frame_oam 0x4000, 0x0, 0x1052, 29, -56
	banim_frame_oam 0x0, 0x0, 0x1054, 45, -56
	banim_frame_oam 0x4000, 0x4000, 0x1072, -19, -56
	banim_frame_oam 0x0, 0x0, 0x1055, 13, -56
	banim_frame_oam 0x4000, 0x4000, 0x1092, -11, 16
	banim_frame_oam 0x4000, 0x4000, 0x10B2, 21, 16
	banim_frame_oam 0x0, 0x0, 0x10D1, -27, -56
	banim_frame_oam 0x4000, 0x0, 0x10F1, -10, -64
	banim_frame_oam 0x4000, 0x0, 0x10D2, 53, -56
	banim_frame_end
banim_fifd_he1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x100F, -14, -34
	banim_frame_oam 0x4000, 0x4000, 0x108F, -14, -2
	banim_frame_oam 0x0, 0x4000, 0x10AF, -30, -18
	banim_frame_oam 0x4000, 0x0, 0x10EF, -30, -2
	banim_frame_oam 0x4000, 0xC000, 0x1000, -35, -38
	banim_frame_oam 0x8000, 0x4000, 0x1008, 29, -38
	banim_frame_oam 0x4000, 0x4000, 0x1080, -35, -6
	banim_frame_oam 0x4000, 0x4000, 0x1084, -3, -6
	banim_frame_oam 0x0, 0x0, 0x1088, 29, -6
	banim_frame_oam 0x4000, 0x8000, 0x10A0, -35, 0
	banim_frame_oam 0x4000, 0x8000, 0x10A4, -3, 0
	banim_frame_oam 0x8000, 0x0, 0x10A8, 29, 0
	banim_frame_oam 0x4000, 0x4000, 0x10E0, -35, 16
	banim_frame_oam 0x4000, 0x4000, 0x10E4, -3, 16
	banim_frame_oam 0x0, 0x0, 0x10E8, 29, 16
	banim_frame_oam 0x4000, 0x8000, 0x1009, 37, -38
	banim_frame_oam 0x8000, 0x0, 0x100D, 69, -38
	banim_frame_oam 0x4000, 0x4000, 0x1049, 37, -22
	banim_frame_oam 0x0, 0x0, 0x104D, 69, -22
	banim_frame_oam 0x8000, 0x8000, 0x1069, 37, -15
	banim_frame_oam 0x4000, 0x0, 0x10E9, 37, 17
	banim_frame_oam 0x4000, 0x4000, 0x10AB, 29, -46
	banim_frame_oam 0x4000, 0x0, 0x108C, 29, -54
	banim_frame_oam 0x0, 0x0, 0x108E, 45, -54
	banim_frame_oam 0x0, 0x0, 0x108B, 61, -46
	banim_frame_oam 0x4000, 0x4000, 0x10CB, -3, -46
	banim_frame_oam 0x4000, 0x4000, 0x10EB, -35, -46
	banim_frame_oam 0x4000, 0x4000, 0x106B, -19, -54
	banim_frame_oam 0x0, 0x0, 0x104E, 13, -54
	banim_frame_end
banim_fifd_he1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x100F, -14, -33
	banim_frame_oam 0x4000, 0x4000, 0x108F, -14, -1
	banim_frame_oam 0x0, 0x4000, 0x10AF, -30, -17
	banim_frame_oam 0x4000, 0x0, 0x10EF, -30, -1
	banim_frame_oam 0x0, 0xC000, 0x1000, -35, -40
	banim_frame_oam 0x8000, 0x8000, 0x1008, 29, -40
	banim_frame_oam 0x8000, 0x4000, 0x100A, 45, -40
	banim_frame_oam 0x8000, 0x8000, 0x1088, 29, -8
	banim_frame_oam 0x8000, 0x4000, 0x108A, 45, -8
	banim_frame_oam 0x4000, 0x4000, 0x10EB, -35, -48
	banim_frame_oam 0x4000, 0x4000, 0x10CB, -3, -48
	banim_frame_oam 0x4000, 0x4000, 0x10AB, 29, -48
	banim_frame_oam 0x0, 0x0, 0x108B, 61, -48
	banim_frame_oam 0x4000, 0x0, 0x108C, 29, -56
	banim_frame_oam 0x0, 0x0, 0x108E, 45, -56
	banim_frame_oam 0x4000, 0x4000, 0x106B, -19, -56
	banim_frame_oam 0x0, 0x0, 0x104E, 13, -56
	banim_frame_oam 0x0, 0x4000, 0x100B, 53, -40
	banim_frame_oam 0x8000, 0x0, 0x100D, 69, -40
	banim_frame_oam 0x4000, 0x0, 0x104B, 53, -24
	banim_frame_oam 0x0, 0x0, 0x104D, 69, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_fifd_he1_script:
banim_fifd_he1_mode_attack_close:
	banim_code_frame 1, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_frame 6, banim_fifd_he1_sheet_0, 1, banim_fifd_he1_oam_frame_1_r - banim_fifd_he1_oam_r
	banim_code_frame 6, banim_fifd_he1_sheet_0, 2, banim_fifd_he1_oam_frame_2_r - banim_fifd_he1_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_fifd_he1_sheet_0, 3, banim_fifd_he1_oam_frame_3_r - banim_fifd_he1_oam_r
	banim_code_frame 4, banim_fifd_he1_sheet_1, 4, banim_fifd_he1_oam_frame_4_r - banim_fifd_he1_oam_r
	banim_code_frame 4, banim_fifd_he1_sheet_1, 5, banim_fifd_he1_oam_frame_5_r - banim_fifd_he1_oam_r
	banim_code_frame 2, banim_fifd_he1_sheet_1, 6, banim_fifd_he1_oam_frame_6_r - banim_fifd_he1_oam_r
	banim_code_frame 3, banim_fifd_he1_sheet_2, 7, banim_fifd_he1_oam_frame_7_r - banim_fifd_he1_oam_r
	banim_code_frame 3, banim_fifd_he1_sheet_2, 8, banim_fifd_he1_oam_frame_8_r - banim_fifd_he1_oam_r
	banim_code_frame 2, banim_fifd_he1_sheet_3, 9, banim_fifd_he1_oam_frame_9_r - banim_fifd_he1_oam_r
	banim_code_frame 1, banim_fifd_he1_sheet_3, 10, banim_fifd_he1_oam_frame_10_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_close_back:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_close_critical:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_close_critical_back:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_range:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_range_critical:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_dodge_close:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_dodge_range:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_stand_close:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_stand:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_stand_range:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
banim_fifd_he1_mode_attack_miss:
	banim_code_frame 4, banim_fifd_he1_sheet_0, 0, banim_fifd_he1_oam_frame_0_r - banim_fifd_he1_oam_r
	banim_code_end_mode
	.section .data.modes
	.word banim_fifd_he1_mode_attack_close - banim_fifd_he1_script
	.word banim_fifd_he1_mode_attack_close_back - banim_fifd_he1_script
	.word banim_fifd_he1_mode_attack_close_critical - banim_fifd_he1_script
	.word banim_fifd_he1_mode_attack_close_critical_back - banim_fifd_he1_script
	.word banim_fifd_he1_mode_attack_range - banim_fifd_he1_script
	.word banim_fifd_he1_mode_attack_range_critical - banim_fifd_he1_script
	.word banim_fifd_he1_mode_dodge_close - banim_fifd_he1_script
	.word banim_fifd_he1_mode_dodge_range - banim_fifd_he1_script
	.word banim_fifd_he1_mode_stand_close - banim_fifd_he1_script
	.word banim_fifd_he1_mode_stand - banim_fifd_he1_script
	.word banim_fifd_he1_mode_stand_range - banim_fifd_he1_script
	.word banim_fifd_he1_mode_attack_miss - banim_fifd_he1_script
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

