	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song800_1
song800_1:	@ 0x085844F0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 0
	.byte	VOL	, v127
	.byte	BEND	, c_v
	.byte		N96	, Cn3, v092
	.byte	W96
	.byte	FINE

	.align 2
	.global song800
song800:	@ 0x08584500
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup039		@ voicegroup/tone

	.word	song800_1		@ track
