	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup027
voicegroup027:	@ 0x08210B6C
	voice_square_1 0, 2, 0, 0, 15, 0	@08210B6C
	voice_square_1 0, 2, 0, 0, 15, 0	@08210B78
	voice_square_1 0, 2, 0, 0, 15, 0	@08210B84
	voice_square_1 0, 2, 0, 0, 15, 0	@08210B90
	voice_square_1 0, 2, 0, 0, 15, 0	@08210B9C
	voice_square_1 0, 2, 0, 0, 15, 0	@08210BA8
	voice_square_1 0, 2, 0, 0, 15, 0	@08210BB4
	voice_square_1 0, 2, 0, 0, 15, 0	@08210BC0
	voice_square_1 0, 2, 0, 0, 15, 0	@08210BCC
	voice_square_1 0, 2, 0, 0, 15, 0	@08210BD8
	voice_directsound 60, 0, DirectSoundData_k_mbox_c5_13k_s, 255, 226, 255, 226	@08210BE4
