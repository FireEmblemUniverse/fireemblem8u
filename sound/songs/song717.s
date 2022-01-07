	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song717_1
song717_1:	@ 0x08582B3C
	.byte	TEMPO	, 75
	.byte	VOL	, v050
	.byte	VOICE	, 27
	.byte	KEYSH	, 0
	.byte		N42	, Cn4, v127
	.byte	W42
	.byte	FINE

	.align 2
	.global song717
song717:	@ 0x08582B4C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song717_1		@ track
