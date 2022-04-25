	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song401_1
song401_1:	@ 0x085818A8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte	VOL	, v110
	.byte		N15	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song401
song401:	@ 0x085818B8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song401_1		@ track
