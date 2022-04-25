	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song191_1
song191_1:	@ 0x0857E5B4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 49
	.byte	VOL	, v120
	.byte	BENDR	, 6
	.byte	BEND	, c_v
	.byte		N24	, Cn3, v127
	.byte	W01
	.byte	BEND	, c_v+7
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+31
	.byte	W01
	.byte		c_v+39
	.byte	W01
	.byte		c_v+47
	.byte	W01
	.byte		c_v+55
	.byte	W01
	.byte		c_v+63
	.byte	W16
	.byte	FINE

	.align 2
	.global song191
song191:	@ 0x0857E5D8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song191_1		@ track
