	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song205_1
song205_1:	@ 0x0857E874
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 6
	.byte	VOL	, v127
	.byte		N12	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song205
song205:	@ 0x0857E884
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song205_1		@ track
