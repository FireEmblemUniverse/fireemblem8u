	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup086
voicegroup086:	@ 0x08223D60
	voice_square_1 0, 2, 0, 0, 15, 0	@08223D60
	voice_square_1 0, 2, 0, 0, 15, 0	@08223D6C
	voice_square_1 0, 2, 0, 0, 15, 0	@08223D78
	voice_square_1 0, 2, 0, 0, 15, 0	@08223D84
	voice_square_1 0, 2, 0, 0, 15, 0	@08223D90
	voice_square_1 0, 2, 0, 0, 15, 0	@08223D9C
	voice_square_1 0, 2, 0, 0, 15, 0	@08223DA8
	voice_square_1 0, 2, 0, 0, 15, 0	@08223DB4
	voice_square_1 0, 2, 0, 0, 15, 0	@08223DC0
	voice_square_1 0, 2, 0, 0, 15, 0	@08223DCC
	voice_square_1 0, 2, 0, 0, 15, 0	@08223DD8
	voice_square_1 0, 2, 0, 0, 15, 0	@08223DE4
	voice_square_1 0, 2, 0, 0, 15, 0	@08223DF0
	voice_square_1 0, 2, 0, 0, 15, 0	@08223DFC
	voice_square_1 0, 2, 0, 0, 15, 0	@08223E08
	voice_square_1 0, 2, 0, 0, 15, 0	@08223E14
	voice_square_1 0, 2, 0, 0, 15, 0	@08223E20
	voice_keysplit_all voicegroup086	@08223E2C
