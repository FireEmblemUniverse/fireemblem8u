	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song134_1
song134_1:	@ 0x0857D990
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 31
	.byte	BENDR	, 3
	.byte	VOL	, v063
	.byte		N56	, Ds3, v127
	.byte	W02
	.byte	VOL	, v079
	.byte	W02
	.byte		v095
	.byte	BEND	, c_v
	.byte	W02
	.byte	VOL	, v111
	.byte	W02
	.byte		v127
	.byte	BEND	, c_v+6
	.byte	W04
	.byte		c_v+12
	.byte	W04
	.byte		c_v+19
	.byte	W04
	.byte		c_v+25
	.byte	W04
	.byte		c_v+31
	.byte	W04
	.byte		c_v+38
	.byte	W04
	.byte		c_v+44
	.byte	W04
	.byte		c_v+51
	.byte	W04
	.byte	VOL	, v120
	.byte	BEND	, c_v+57
	.byte	W02
	.byte	VOL	, v105
	.byte	W02
	.byte		v091
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v077
	.byte	W02
	.byte		v062
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v020
	.byte	W18
	.byte	FINE

	.align 2
	.global song134
song134:	@ 0x0857D9D4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song134_1		@ track
