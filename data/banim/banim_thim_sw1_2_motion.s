@ vim:ft=armv4
	.global banim_thim_sw1_2_script
	.global banim_thim_sw1_2_oam_r
	.global banim_thim_sw1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x89
	.section .data.oam_l
banim_thim_sw1_2_oam_l:
banim_thim_sw1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x62, -16, 0
	banim_frame_end
banim_thim_sw1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, -9, -16
	banim_frame_oam 0x8000, 0x9000, 0x9A, -25, -8
	banim_frame_oam 0x8000, 0x5000, 0x9C, -33, -8
	banim_frame_oam 0x8000, 0x1000, 0x9D, -41, 0
	banim_frame_oam 0x0, 0x1000, 0xDD, -41, 16
	banim_frame_oam 0x0, 0x1000, 0xD9, -49, 7
	banim_frame_oam 0x0, 0x1000, 0xD8, -17, -16
	banim_frame_oam 0x0, 0x1000, 0xF8, -1, -24
	banim_frame_end
banim_thim_sw1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x80, -25, -7
	banim_frame_oam 0x8000, 0x5000, 0x82, -33, -7
	banim_frame_oam 0x8000, 0x1000, 0x63, -41, 1
	banim_frame_oam 0x0, 0x1000, 0xA3, -41, 17
	banim_frame_oam 0x0, 0x1000, 0x62, -49, 4
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_thim_sw1_2_oam_r:
banim_thim_sw1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x62, 8, 0
	banim_frame_end
banim_thim_sw1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -7, -16
	banim_frame_oam 0x8000, 0x8000, 0x9A, 9, -8
	banim_frame_oam 0x8000, 0x4000, 0x9C, 25, -8
	banim_frame_oam 0x8000, 0x0, 0x9D, 33, 0
	banim_frame_oam 0x0, 0x0, 0xDD, 33, 16
	banim_frame_oam 0x0, 0x0, 0xD9, 41, 7
	banim_frame_oam 0x0, 0x0, 0xD8, 9, -16
	banim_frame_oam 0x0, 0x0, 0xF8, -7, -24
	banim_frame_end
banim_thim_sw1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x80, 9, -7
	banim_frame_oam 0x8000, 0x4000, 0x82, 25, -7
	banim_frame_oam 0x8000, 0x0, 0x63, 33, 1
	banim_frame_oam 0x0, 0x0, 0xA3, 33, 17
	banim_frame_oam 0x0, 0x0, 0x62, 41, 4
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_thim_sw1_2_script:
banim_thim_sw1_2_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 2, banim_thim_sw1_2_oam_frame_2_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_2_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 2, banim_thim_sw1_2_oam_frame_2_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_2_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 2, banim_thim_sw1_2_oam_frame_2_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_2_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 2, banim_thim_sw1_2_oam_frame_2_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_2_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 2, banim_thim_sw1_2_oam_frame_2_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_2_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 2, banim_thim_sw1_2_oam_frame_2_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 2, banim_thim_sw1_2_oam_frame_2_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 2, banim_thim_sw1_2_oam_frame_2_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_thim_sw1_2_mode_stand_close:
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_thim_sw1_2_mode_stand:
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_thim_sw1_2_mode_stand_range:
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_thim_sw1_2_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_thim_sw1_sheet_0, 0, banim_thim_sw1_2_oam_frame_0_r - banim_thim_sw1_2_oam_r
	banim_code_start_dodge
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_frame 1, banim_thim_sw1_sheet_2, 2, banim_thim_sw1_2_oam_frame_2_r - banim_thim_sw1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_sound_wing_flap
	banim_code_frame 3, banim_thim_sw1_sheet_1, 1, banim_thim_sw1_2_oam_frame_1_r - banim_thim_sw1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_thim_sw1_2_mode_attack_close - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_attack_close_back - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_attack_close_critical - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_attack_close_critical_back - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_attack_range - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_attack_range_critical - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_dodge_close - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_dodge_range - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_stand_close - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_stand - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_stand_range - banim_thim_sw1_2_script
	.word banim_thim_sw1_2_mode_attack_miss - banim_thim_sw1_2_script
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

