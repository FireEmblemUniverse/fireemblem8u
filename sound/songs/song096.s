	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song096_1
song096_1:	@ 0x0857D004
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 48
	.byte	VOL	, v127
	.byte		N04	, Bn4, v127
	.byte	W04
	.byte			Gs5
	.byte	W04
	.byte		N06	, Fs5
	.byte	W06
	.byte		N04	, Bn5
	.byte	W04
	.byte			Fs5
	.byte	W04
	.byte		N10	, Cs6
	.byte	W02
	.byte	W24
	.byte	FINE

	@********************** Track  2 **********************@

	.global song096_2
song096_2:	@ 0x0857D01F
	.byte	KEYSH	, 0
	.byte	VOICE	, 49
	.byte	VOL	, v048
	.byte		N04	, Bn4, v127
	.byte	W04
	.byte			Gs5
	.byte	W04
	.byte		N06	, Fs5
	.byte	W06
	.byte		N04	, Bn5
	.byte	W04
	.byte			Fs5
	.byte	W04
	.byte		N10	, Cs6
	.byte	W02
	.byte	W24
	.byte	FINE

	.align 2
	.global song096
song096:	@ 0x0857D038
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song096_1		@ track
	.word	song096_2		@ track
