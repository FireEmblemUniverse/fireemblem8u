	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song551_1
song551_1:	@ 0x08582280
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 50
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song551
song551:	@ 0x08582290
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song551_1		@ track
