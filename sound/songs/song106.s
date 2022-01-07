	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song106_1
song106_1:	@ 0x0857D150
	.byte	VOL	, v060
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 4
	.byte	BENDR	, 5
	.byte	PRIO	, 10
	.byte		N02	, Bn5, v127
	.byte	W02
	.byte	BEND	, c_v-64
	.byte		N08	
	.byte	W01
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOICE	, 5
	.byte	BEND	, c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte	PRIO	, 0
	.byte	W14
	.byte	FINE

	.align 2
	.global song106
song106:	@ 0x0857D17C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	32		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song106_1		@ track
