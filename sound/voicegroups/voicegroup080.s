	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup080
voicegroup080:	@ 0x082228F0
	voice_directsound_no_resample 60, 79, DirectSoundData_08507D60, 255, 0, 255, 165	@082228F0
	voice_directsound_no_resample 60, 84, DirectSoundData_08508870, 255, 149, 167, 204	@082228FC
	voice_directsound_no_resample 60, 44, DirectSoundData_084E20A0, 255, 0, 255, 204	@08222908
	voice_directsound_no_resample 60, 44, DirectSoundData_0850A7D0, 255, 0, 255, 204	@08222914
	voice_directsound 60, 44, DirectSoundData_084E7244, 255, 0, 255, 165	@08222920
	voice_directsound 60, 84, DirectSoundData_084F27CC, 255, 0, 255, 165	@0822292C
	voice_directsound_no_resample 60, 79, DirectSoundData_084F7390, 255, 0, 255, 204	@08222938
	voice_directsound_no_resample 60, 54, DirectSoundData_084F7C7C, 255, 0, 255, 204	@08222944
	voice_directsound_no_resample 60, 79, DirectSoundData_084F9EE8, 255, 0, 255, 204	@08222950
	voice_directsound_no_resample 60, 36, DirectSoundData_h_orc_symbal_13k8b_ss, 255, 149, 167, 204	@0822295C
	voice_directsound_no_resample 60, 34, DirectSoundData_084FA19C, 255, 0, 255, 204	@08222968
	voice_square_1 0, 2, 0, 0, 15, 0	@08222974
	voice_directsound_no_resample 60, 94, DirectSoundData_h_dr_bongo_h_13k8b_ss, 255, 0, 255, 204	@08222980
	voice_directsound_no_resample 60, 94, DirectSoundData_h_dr_bongo_l_13k8b_ss, 255, 0, 255, 204	@0822298C
	voice_directsound_no_resample 60, 39, DirectSoundData_084FC718, 255, 0, 255, 204	@08222998
	voice_directsound_no_resample 60, 39, DirectSoundData_084FCAA8, 255, 0, 255, 204	@082229A4
	voice_directsound_no_resample 60, 34, DirectSoundData_084FCFB4, 255, 0, 255, 204	@082229B0
	voice_square_1 0, 2, 0, 0, 15, 0	@082229BC
	voice_square_1 0, 2, 0, 0, 15, 0	@082229C8
	voice_directsound_no_resample 60, 36, DirectSoundData_h_agogo_h_13k8b_ss, 255, 0, 255, 204	@082229D4
	voice_directsound_no_resample 60, 36, DirectSoundData_084FDB48, 255, 0, 255, 204	@082229E0
	voice_square_1 0, 2, 0, 0, 15, 0	@082229EC
	voice_square_1 0, 2, 0, 0, 15, 0	@082229F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08222A04
	voice_square_1 0, 2, 0, 0, 15, 0	@08222A10
	voice_directsound_no_resample 60, 84, DirectSoundData_084FE008, 255, 0, 255, 204	@08222A1C
	voice_directsound_no_resample 60, 84, DirectSoundData_084FE1F0, 255, 0, 255, 204	@08222A28
	voice_directsound_no_resample 60, 89, DirectSoundData_084FEC3C, 255, 0, 255, 204	@08222A34
	voice_directsound_no_resample 60, 87, DirectSoundData_084FEE4C, 255, 0, 255, 204	@08222A40
	voice_directsound_no_resample 60, 92, DirectSoundData_h_wblock_l_13k8b_ss, 255, 0, 255, 204	@08222A4C
	voice_square_1 0, 2, 0, 0, 15, 0	@08222A58
	voice_square_1 0, 2, 0, 0, 15, 0	@08222A64
	voice_directsound_no_resample 60, 34, DirectSoundData_084FF26C, 255, 0, 255, 204	@08222A70
	voice_directsound_no_resample 60, 34, DirectSoundData_084FF5C4, 255, 242, 0, 204	@08222A7C
	voice_directsound_no_resample 60, 34, DirectSoundData_085006D0, 255, 0, 255, 204	@08222A88
	voice_directsound_no_resample 60, 99, DirectSoundData_085016D8, 255, 0, 255, 204	@08222A94
	voice_directsound_no_resample 60, 64, DirectSoundData_h_dr_bd_13k8b_ss, 255, 0, 255, 204	@08222AA0
	voice_directsound_no_resample 60, 64, DirectSoundData_h_sidestick_13k8b_ss, 255, 0, 255, 204	@08222AAC
	voice_directsound_no_resample 60, 64, DirectSoundData_0850E8E8, 255, 0, 255, 204	@08222AB8
	voice_directsound_no_resample 60, 44, DirectSoundData_084DAF40, 255, 0, 255, 204	@08222AC4
	voice_square_1 0, 2, 0, 0, 15, 0	@08222AD0
	voice_directsound_no_resample 60, 34, DirectSoundData_08504F40, 255, 0, 255, 226	@08222ADC
	voice_directsound_no_resample 60, 89, DirectSoundData_08505B2C, 255, 0, 255, 204	@08222AE8
	voice_square_1 0, 2, 0, 0, 15, 0	@08222AF4
	voice_square_1 0, 2, 0, 0, 15, 0	@08222B00
	voice_directsound_no_resample 60, 59, DirectSoundData_h_dr_midtom_13k8b_ss, 255, 0, 255, 204	@08222B0C
	voice_directsound_no_resample 60, 89, DirectSoundData_08506B50, 255, 0, 255, 204	@08222B18
	voice_square_1 0, 2, 0, 0, 15, 0	@08222B24
