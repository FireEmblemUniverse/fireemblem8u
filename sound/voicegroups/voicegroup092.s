	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup092
voicegroup092:	@ 0x08223ED4
	voice_directsound 60, 0, DirectSoundData_h_river1_13k, 255, 0, 255, 0	@08223ED4
	voice_square_1 0, 2, 0, 0, 15, 0	@08223EE0
	voice_square_1 0, 2, 0, 0, 15, 0	@08223EEC
	voice_square_1 0, 2, 0, 0, 15, 0	@08223EF8
	voice_noise 60, 0, 0, 0, 0, 0, 15, 2	@08223F04
	voice_directsound_no_resample 60, 64, DirectSoundData_h_dr_bd_13k8b_ss, 255, 0, 255, 204	@08223F10
	voice_directsound_no_resample 60, 84, DirectSoundData_h_sidestick_13k8b_ss, 255, 0, 255, 204	@08223F1C
	voice_directsound_no_resample 60, 74, DirectSoundData_35, 255, 0, 255, 204	@08223F28
	voice_directsound_no_resample 60, 44, DirectSoundData_1, 255, 0, 255, 204	@08223F34
	voice_square_1 0, 2, 0, 0, 15, 0	@08223F40
	voice_directsound_no_resample 60, 34, DirectSoundData_29, 255, 0, 255, 226	@08223F4C
	voice_directsound_no_resample 60, 89, DirectSoundData_30, 255, 0, 255, 204	@08223F58
	voice_square_1 0, 2, 0, 0, 15, 0	@08223F64
	voice_square_1 0, 2, 0, 0, 15, 0	@08223F70
	voice_directsound_no_resample 60, 59, DirectSoundData_h_dr_midtom_13k8b_ss, 255, 0, 255, 204	@08223F7C
	voice_directsound_no_resample 60, 89, DirectSoundData_31, 255, 0, 255, 204	@08223F88
	voice_square_1 0, 2, 0, 0, 15, 0	@08223F94
	voice_directsound_no_resample 60, 79, DirectSoundData_32, 255, 0, 255, 165	@08223FA0
	voice_directsound_no_resample 60, 84, DirectSoundData_33, 255, 149, 167, 204	@08223FAC
	voice_square_1 0, 2, 0, 0, 15, 0	@08223FB8
	voice_directsound_no_resample 60, 44, DirectSoundData_44, 255, 0, 255, 204	@08223FC4
	voice_directsound 60, 44, DirectSoundData_8, 255, 0, 255, 165	@08223FD0
	voice_directsound 60, 84, DirectSoundData_9, 255, 0, 255, 165	@08223FDC
	voice_directsound_no_resample 60, 79, DirectSoundData_10, 255, 0, 255, 204	@08223FE8
	voice_directsound_no_resample 60, 54, DirectSoundData_11, 255, 0, 255, 204	@08223FF4
	voice_directsound_no_resample 60, 79, DirectSoundData_12, 255, 0, 255, 204	@08224000
	voice_square_1 0, 2, 0, 0, 15, 0	@0822400C
	voice_directsound_no_resample 60, 34, DirectSoundData_13, 255, 0, 255, 204	@08224018
	voice_square_1 0, 2, 0, 0, 15, 0	@08224024
	voice_directsound_no_resample 60, 94, DirectSoundData_h_dr_bongo_h_13k8b_ss, 255, 0, 255, 204	@08224030
	voice_directsound_no_resample 60, 94, DirectSoundData_h_dr_bongo_l_13k8b_ss, 255, 0, 255, 204	@0822403C
	voice_directsound_no_resample 60, 39, DirectSoundData_14, 255, 0, 255, 204	@08224048
	voice_directsound_no_resample 60, 39, DirectSoundData_15, 255, 0, 255, 204	@08224054
	voice_directsound_no_resample 60, 34, DirectSoundData_16, 255, 0, 255, 204	@08224060
	voice_square_1 0, 2, 0, 0, 15, 0	@0822406C
	voice_square_1 0, 2, 0, 0, 15, 0	@08224078
	voice_directsound_no_resample 60, 36, DirectSoundData_h_agogo_h_13k8b_ss, 255, 0, 255, 204	@08224084
	voice_directsound_no_resample 60, 36, DirectSoundData_17, 255, 0, 255, 204	@08224090
	voice_square_1 0, 2, 0, 0, 15, 0	@0822409C
	voice_square_1 0, 2, 0, 0, 15, 0	@082240A8
	voice_square_1 0, 2, 0, 0, 15, 0	@082240B4
	voice_square_1 0, 2, 0, 0, 15, 0	@082240C0
	voice_directsound_no_resample 60, 84, DirectSoundData_18, 255, 0, 255, 204	@082240CC
	voice_directsound_no_resample 60, 84, DirectSoundData_19, 255, 0, 255, 204	@082240D8
	voice_directsound_no_resample 60, 89, DirectSoundData_20, 255, 0, 255, 204	@082240E4
	voice_directsound_no_resample 60, 87, DirectSoundData_21, 255, 0, 255, 204	@082240F0
	voice_directsound_no_resample 60, 92, DirectSoundData_h_wblock_l_13k8b_ss, 255, 0, 255, 204	@082240FC
	voice_square_1 0, 2, 0, 0, 15, 0	@08224108
	voice_square_1 0, 2, 0, 0, 15, 0	@08224114
	voice_directsound_no_resample 60, 34, DirectSoundData_22, 255, 0, 255, 204	@08224120
	voice_directsound_no_resample 60, 34, DirectSoundData_23, 255, 242, 0, 204	@0822412C
	voice_directsound_no_resample 60, 34, DirectSoundData_24, 255, 0, 255, 204	@08224138
	voice_directsound_no_resample 60, 99, DirectSoundData_25, 255, 0, 255, 204	@08224144
