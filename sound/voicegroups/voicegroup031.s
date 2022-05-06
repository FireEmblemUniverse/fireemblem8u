	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup031
voicegroup031:	@ 0x08211BEC
	voice_directsound 60, 0, DirectSoundData_human1_e5_13k8b, 255, 0, 255, 0	@08211BEC
	voice_directsound 60, 0, DirectSoundData_human4b_m1_e1_13k8b, 255, 0, 255, 0	@08211BF8
	voice_square_1 0, 2, 0, 0, 15, 0	@08211C04
	voice_square_1 0, 2, 0, 0, 15, 0	@08211C10
	voice_directsound 60, 0, DirectSoundData_horse2_e3_p1_13k8b, 255, 0, 255, 0	@08211C1C
	voice_directsound 60, 0, DirectSoundData_horse2_e3_p2_13k8b, 255, 0, 255, 0	@08211C28
	voice_directsound 60, 0, DirectSoundData_horse2_e3_p3_13k8b, 255, 0, 255, 0	@08211C34
	voice_square_1 0, 2, 0, 0, 15, 0	@08211C40
	voice_directsound 60, 0, DirectSoundData_bird3_e5_13k8b, 255, 0, 255, 0	@08211C4C
	voice_directsound 60, 0, DirectSoundData_bird5b_e3_13k8b, 255, 0, 255, 0	@08211C58
	voice_square_1 0, 2, 0, 0, 15, 0	@08211C64
	voice_square_1 0, 2, 0, 0, 15, 0	@08211C70
	voice_square_1 0, 2, 0, 0, 15, 0	@08211C7C
	voice_square_1 0, 2, 0, 0, 15, 0	@08211C88
	voice_square_1 0, 2, 0, 0, 15, 0	@08211C94
	voice_square_1 0, 2, 0, 0, 15, 0	@08211CA0
	voice_square_1 0, 2, 0, 0, 15, 0	@08211CAC
	voice_square_1 0, 2, 0, 0, 15, 0	@08211CB8
	voice_square_1 0, 2, 0, 0, 15, 0	@08211CC4
	voice_square_1 0, 2, 0, 0, 15, 0	@08211CD0
	voice_square_1 0, 3, 0, 1, 0, 0	@08211CDC
	voice_square_2 3, 0, 1, 0, 0	@08211CE8
	voice_directsound 60, 0, DirectSoundData_have2_e3_10k8b, 255, 0, 255, 0	@08211CF4
	voice_directsound 60, 0, DirectSoundData_freeze1_e3_13k8b, 255, 0, 255, 0	@08211D00
	voice_noise 60, 0, 0, 0, 0, 0, 15, 2	@08211D0C
	voice_directsound 60, 0, DirectSoundData_fall_light1_e3_13k8b, 255, 0, 255, 0	@08211D18
	voice_noise 60, 0, 0, 0, 0, 0, 15, 0	@08211D24
	voice_directsound 60, 0, DirectSoundData_senko3_e4_10k8b, 255, 0, 255, 0	@08211D30
	voice_directsound 60, 0, DirectSoundData_dragon_foot1_e1_8k8b, 255, 0, 255, 0	@08211D3C
	voice_directsound 60, 0, DirectSoundData_kiran2b_e6_13k8b, 255, 0, 255, 0	@08211D48
	voice_directsound 60, 0, DirectSoundData_rest2_e1l_p18_10k8b, 255, 0, 255, 0	@08211D54
	voice_directsound 60, 0, DirectSoundData_hammerne2_e1l_p25_10k8b, 255, 0, 255, 0	@08211D60
	voice_directsound 60, 0, DirectSoundData_mshield3_e_13k8b, 255, 0, 255, 0	@08211D6C
	voice_directsound 60, 0, DirectSoundData_sleep2b_e2_13k8b, 255, 0, 255, 0	@08211D78
	voice_directsound 60, 0, DirectSoundData_berserk4_e2l_p25_10k8b, 255, 0, 255, 0	@08211D84
	voice_directsound 60, 0, DirectSoundData_silence3_p17_e1l_13k8b, 255, 0, 255, 0	@08211D90
	voice_noise 60, 0, 0, 0, 0, 1, 0, 0	@08211D9C
	voice_directsound 60, 0, DirectSoundData_live4_e1l_p25_10k8b, 255, 0, 255, 0	@08211DA8
	voice_square_1 0, 2, 0, 0, 15, 0	@08211DB4
	voice_square_1 0, 2, 0, 0, 15, 0	@08211DC0
	voice_directsound 60, 0, DirectSoundData_class1_light1_el_10k8b, 255, 0, 255, 0	@08211DCC
	voice_directsound 60, 0, DirectSoundData_aureole2_el_13k8b, 255, 0, 255, 0	@08211DD8
	voice_square_1 0, 2, 0, 0, 15, 0	@08211DE4
	voice_square_1 0, 2, 0, 0, 15, 0	@08211DF0
	voice_square_1 0, 2, 0, 0, 15, 0	@08211DFC
	voice_directsound 60, 0, DirectSoundData_class1_light1_el_10k8b, 255, 0, 255, 0	@08211E08
	voice_directsound 60, 0, DirectSoundData_village_bomb1_e2_10k8b, 255, 0, 255, 0	@08211E14
	voice_directsound 60, 0, DirectSoundData_human_fall1_e5_13k8b, 255, 0, 255, 0	@08211E20
	voice_directsound 60, 0, DirectSoundData_aureole1_el_13k8b, 255, 0, 255, 0	@08211E2C
	voice_directsound 60, 0, DirectSoundData_hurtmut1_el_p45_10k8b, 255, 0, 255, 188	@08211E38
	voice_square_1 0, 2, 0, 0, 15, 0	@08211E44
	voice_square_1 0, 2, 0, 0, 15, 0	@08211E50
	voice_square_1 0, 2, 0, 0, 15, 0	@08211E5C
	voice_square_1 0, 2, 0, 0, 15, 0	@08211E68
	voice_square_1 0, 2, 0, 0, 15, 0	@08211E74
	voice_square_1 0, 2, 0, 0, 15, 0	@08211E80
	voice_square_1 0, 2, 0, 0, 15, 0	@08211E8C
	voice_square_1 0, 2, 0, 0, 15, 0	@08211E98
	voice_square_1 0, 2, 0, 0, 15, 0	@08211EA4
	voice_square_1 0, 2, 0, 0, 15, 0	@08211EB0
	voice_square_1 0, 2, 0, 0, 15, 0	@08211EBC
	voice_square_1 0, 2, 0, 0, 15, 0	@08211EC8
	voice_square_1 0, 2, 0, 0, 15, 0	@08211ED4
	voice_square_1 0, 2, 0, 0, 15, 0	@08211EE0
	voice_square_1 0, 2, 0, 0, 15, 0	@08211EEC
	voice_square_1 0, 2, 0, 0, 15, 0	@08211EF8
	voice_square_1 0, 2, 0, 0, 15, 0	@08211F04
	voice_square_1 0, 2, 0, 0, 15, 0	@08211F10
	voice_directsound 60, 0, DirectSoundData_wall_bomb2_m1_e4_13k8b, 255, 0, 255, 0	@08211F1C
	voice_directsound 60, 0, DirectSoundData_wall_bomb2_m1_e4_13k8b, 255, 226, 64, 0	@08211F28
	voice_directsound 60, 0, DirectSoundData_key_open1_e2_13k8b, 255, 0, 255, 0	@08211F34
	voice_square_1 0, 2, 0, 0, 15, 0	@08211F40
	voice_noise 60, 0, 0, 1, 0, 2, 0, 0	@08211F4C
	voice_noise 60, 0, 0, 0, 0, 0, 15, 1	@08211F58
	voice_square_1 0, 3, 0, 0, 15, 1	@08211F64
	voice_directsound 60, 0, DirectSoundData_antidote1_e_13k8b, 255, 0, 255, 0	@08211F70
	voice_directsound 60, 0, DirectSoundData_count_bell1b_e2_13k8b, 255, 0, 255, 0	@08211F7C
	voice_directsound 60, 0, DirectSoundData_poison1_e_13k8b, 255, 0, 255, 0	@08211F88
	voice_directsound 60, 0, DirectSoundData_warp1a_e2_13k8b, 255, 0, 255, 0	@08211F94
	voice_directsound 60, 0, DirectSoundData_warp1b_e2_13k8b, 255, 0, 255, 0	@08211FA0
	voice_directsound 60, 0, DirectSoundData_sand_wind1_e5l_8k8b, 255, 0, 255, 0	@08211FAC
	voice_noise 60, 0, 0, 0, 0, 0, 15, 2	@08211FB8
	voice_square_2 0, 0, 1, 0, 0	@08211FC4
	voice_noise 60, 0, 0, 0, 0, 0, 15, 1	@08211FD0
	voice_directsound 60, 0, DirectSoundData_ken_osameru2_e2_13k8b, 255, 0, 255, 0	@08211FDC
	voice_directsound 60, 0, DirectSoundData_ken_osameru4_e2_13k8b, 255, 0, 255, 0	@08211FE8
	voice_directsound 60, 0, DirectSoundData_blizzard1_e2l_13k8b, 255, 0, 255, 0	@08211FF4
	voice_directsound 60, 0, DirectSoundData_kansei1_e5l_13k8b, 255, 0, 255, 0	@08212000
