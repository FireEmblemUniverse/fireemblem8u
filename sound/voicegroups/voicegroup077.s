	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup077
voicegroup077:	@ 0x08221FF0
	voice_square_1 0, 2, 0, 0, 15, 0	@08221FF0
	voice_square_1 0, 2, 0, 0, 15, 0	@08221FFC
	voice_square_1 0, 2, 0, 0, 15, 0	@08222008
	voice_square_1 0, 2, 0, 0, 15, 0	@08222014
	voice_directsound 60, 0, DirectSoundData_k_timpani3_g3_13k_s, 255, 0, 255, 165	@08222020
	voice_square_1 0, 2, 0, 0, 15, 0	@0822202C
	voice_square_1 0, 2, 0, 0, 15, 0	@08222038
	voice_square_1 0, 2, 0, 0, 15, 0	@08222044
	voice_square_1 0, 2, 0, 0, 15, 0	@08222050
	voice_directsound 60, 0, DirectSoundData_k_tubular_c4_13k_s, 255, 0, 255, 165	@0822205C
	voice_square_1 0, 2, 0, 0, 15, 0	@08222068
	voice_square_1 0, 2, 0, 0, 15, 0	@08222074
	voice_square_1 0, 2, 0, 0, 15, 0	@08222080
	voice_square_1 0, 2, 0, 0, 15, 0	@0822208C
	voice_square_1 0, 2, 0, 0, 15, 0	@08222098
	voice_square_1 0, 2, 0, 0, 15, 0	@082220A4
	voice_square_1 0, 2, 0, 0, 15, 0	@082220B0
	voice_square_1 0, 2, 0, 0, 15, 0	@082220BC
	voice_square_2_alt 2, 0, 0, 15, 0	@082220C8
	voice_square_1 0, 2, 0, 0, 15, 0	@082220D4
	voice_square_1 0, 2, 0, 0, 15, 0	@082220E0
	voice_square_1 0, 2, 0, 0, 15, 0	@082220EC
	voice_square_1 0, 2, 0, 0, 15, 0	@082220F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08222104
	voice_square_1 0, 2, 0, 0, 15, 0	@08222110
	voice_square_1 0, 2, 0, 0, 15, 0	@0822211C
	voice_square_1 0, 2, 0, 0, 15, 0	@08222128
	voice_square_1 0, 2, 0, 0, 15, 0	@08222134
	voice_square_1 0, 2, 0, 0, 15, 0	@08222140
	voice_square_1 0, 2, 0, 0, 15, 0	@0822214C
	voice_square_1 0, 2, 0, 0, 15, 0	@08222158
	voice_square_1 0, 2, 0, 0, 15, 0	@08222164
	voice_square_1 0, 2, 0, 0, 15, 0	@08222170
	voice_square_1 0, 2, 0, 0, 15, 0	@0822217C
	voice_keysplit_all voicegroup077	@08222188
	voice_keysplit_all voicegroup078	@08222194
	voice_directsound_no_resample 60, 64, DirectSoundData_084DA07C, 255, 0, 255, 204	@082221A0
	voice_directsound_no_resample 60, 64, DirectSoundData_h_sidestick_13k8b_ss, 255, 0, 255, 204	@082221AC
	voice_directsound_no_resample 60, 64, DirectSoundData_k_roomsd_c4_13k_ss, 255, 0, 255, 204	@082221B8
	voice_directsound_no_resample 60, 44, DirectSoundData_084DAF40, 255, 0, 255, 204	@082221C4
	voice_square_1 0, 2, 0, 0, 15, 0	@082221D0
	voice_directsound_no_resample 60, 34, DirectSoundData_084DB690, 255, 0, 255, 226	@082221DC
	voice_directsound_no_resample 60, 89, DirectSoundData_084DC330, 255, 0, 255, 204	@082221E8
	voice_square_1 0, 2, 0, 0, 15, 0	@082221F4
	voice_square_1 0, 2, 0, 0, 15, 0	@08222200
	voice_directsound_no_resample 60, 59, DirectSoundData_084DCA24, 255, 0, 255, 204	@0822220C
	voice_directsound_no_resample 60, 89, DirectSoundData_084DD66C, 255, 0, 255, 204	@08222218
	voice_square_1 0, 2, 0, 0, 15, 0	@08222224
