	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song104_1
song104_1:	@ 0x0857D0EC
	.byte	VOL	, v055
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 5
	.byte	BENDR	, 5
	.byte	PRIO	, 10
	.byte	BEND	, c_v
	.byte		N10	, Ds5, v127
	.byte	W02
	.byte	BEND	, c_v+63
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte		c_v
	.byte	W02
	.byte	PRIO	, 0
	.byte	W02
	.byte	FINE

	.align 2
	.global song104
song104:	@ 0x0857D10C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	31		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song104_1		@ track
