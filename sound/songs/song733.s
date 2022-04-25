	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song733_1
song733_1:	@ 0x08583234
	.byte	TEMPO	, 75
	.byte	VOL	, v070
	.byte	VOICE	, 46
	.byte	KEYSH	, 0
	.byte		N60	, Cn4, v127
	.byte	W60
	.byte	FINE

	.align 2
	.global song733
song733:	@ 0x08583244
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song733_1		@ track
