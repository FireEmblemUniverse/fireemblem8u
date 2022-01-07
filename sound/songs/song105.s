	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song105_1
song105_1:	@ 0x0857D118
	.byte	VOL	, v055
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 4
	.byte	BENDR	, 5
	.byte	PRIO	, 10
	.byte		N06	, Ds5, v127
	.byte	W01
	.byte	BEND	, c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W04
	.byte	VOICE	, 5
	.byte	BEND	, c_v
	.byte		N10	
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
	.byte	W07
	.byte	FINE

	.align 2
	.global song105
song105:	@ 0x0857D144
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	31		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song105_1		@ track
