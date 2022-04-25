	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song111_1
song111_1:	@ 0x0857D2D4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 9
	.byte	VOL	, v060
	.byte	BENDR	, 8
	.byte	BEND	, c_v
	.byte		N12	, Cs4, v127
	.byte	W01
	.byte	BEND	, c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+40
	.byte	W19
	.byte	FINE

	.align 2
	.global song111
song111:	@ 0x0857D320
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song111_1		@ track
