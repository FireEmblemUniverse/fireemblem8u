	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song702_1
song702_1:	@ 0x08582A24
	.byte	TEMPO	, 75
	.byte	VOL	, v104
	.byte	VOICE	, 12
	.byte	KEYSH	, 0
	.byte		TIE	, Cn3, v127
	.byte	W96
	.byte	W84
	.byte		EOT	, Cn3
	.byte	FINE

	.align 2
	.global song702
song702:	@ 0x08582A34
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song702_1		@ track
