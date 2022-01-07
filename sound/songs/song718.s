	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song718_1
song718_1:	@ 0x08582B58
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 28
	.byte	VOL	, v080
	.byte	PAN	, c_v
	.byte		N05	, Cn3, v127
	.byte	W06
	.byte		N03	, Cn3, v020
	.byte	W03
	.byte			Cn3, v016
	.byte	W03
	.byte	FINE

	@********************** Track  2 **********************@

	.global song718_2
song718_2:	@ 0x08582B6E
	.byte	KEYSH	, 0
	.byte	VOICE	, 29
	.byte	VOL	, v080
	.byte	PAN	, c_v
	.byte		N06	, Bn6, v100
	.byte	W06
	.byte	FINE

	.align 2
	.global song718
song718:	@ 0x08582B7C
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song718_1		@ track
	.word	song718_2		@ track
