	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song542_1
song542_1:	@ 0x085821F4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 47
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song542
song542:	@ 0x08582204
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song542_1		@ track
