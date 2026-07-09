@ vim:ft=armv4
	.global banim_swmf_sw1_2_script
	.global banim_swmf_sw1_2_oam_r
	.global banim_swmf_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x17
	.section .data.oam_l
banim_swmf_sw1_2_oam_l:
banim_swmf_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x9C, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xDA, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x19, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x1A, -16, 8
	banim_frame_end
banim_swmf_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x9E, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xFA, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xD9, -16, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_swmf_sw1_2_oam_r:
banim_swmf_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x9C, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xDA, -8, -24
	banim_frame_oam 0x0, 0x0, 0x19, 8, 0
	banim_frame_oam 0x0, 0x0, 0x1A, 8, 8
	banim_frame_end
banim_swmf_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x9E, -8, -16
	banim_frame_oam 0x4000, 0x0, 0xFA, -8, -24
	banim_frame_oam 0x0, 0x0, 0xD9, 8, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_swmf_sw1_2_script:
banim_swmf_sw1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_swmf_sw1_sheet_0, 1, banim_swmf_sw1_2_oam_frame_1_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmf_sw1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_swmf_sw1_sheet_0, 1, banim_swmf_sw1_2_oam_frame_1_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmf_sw1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_swmf_sw1_sheet_0, 1, banim_swmf_sw1_2_oam_frame_1_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmf_sw1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_swmf_sw1_sheet_0, 1, banim_swmf_sw1_2_oam_frame_1_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmf_sw1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_swmf_sw1_sheet_0, 1, banim_swmf_sw1_2_oam_frame_1_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmf_sw1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_swmf_sw1_sheet_0, 1, banim_swmf_sw1_2_oam_frame_1_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmf_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_swmf_sw1_sheet_0, 1, banim_swmf_sw1_2_oam_frame_1_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmf_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_swmf_sw1_sheet_0, 1, banim_swmf_sw1_2_oam_frame_1_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_swmf_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_swmf_sw1_2_mode_stand:
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_swmf_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_swmf_sw1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_swmf_sw1_sheet_0, 0, banim_swmf_sw1_2_oam_frame_0_r - banim_swmf_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 4, banim_swmf_sw1_sheet_0, 1, banim_swmf_sw1_2_oam_frame_1_r - banim_swmf_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_swmf_sw1_2_mode_attack_close - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_attack_close_back - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_attack_close_critical - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_attack_close_critical_back - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_attack_range - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_attack_range_critical - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_dodge_close - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_dodge_range - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_stand_close - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_stand - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_stand_range - banim_swmf_sw1_2_script
	.word banim_swmf_sw1_2_mode_attack_miss - banim_swmf_sw1_2_script
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

