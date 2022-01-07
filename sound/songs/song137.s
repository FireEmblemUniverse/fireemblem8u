	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song137_1
song137_1:	@ 0x0857DA98
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 37
	.byte	BENDR	, 3
	.byte	VOL	, v064
	.byte	BEND	, c_v
	.byte		N48	, An2, v127
	.byte	W01
	.byte	VOL	, v079
	.byte	W01
	.byte		v095
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v111
	.byte	W01
	.byte		v127
	.byte	BEND	, c_v
	.byte	W02
	.byte		c_v+1
	.byte	W02
	.byte		c_v+3
	.byte	W02
	.byte		c_v+4
	.byte	W02
	.byte		c_v+7
	.byte	W02
	.byte		c_v+9
	.byte	W02
	.byte		c_v+12
	.byte	W02
	.byte		c_v+16
	.byte	W02
	.byte		c_v+19
	.byte	W02
	.byte		c_v+23
	.byte	W02
	.byte	VOL	, v126
	.byte	BEND	, c_v+28
	.byte	W02
	.byte	VOL	, v107
	.byte	BEND	, c_v+33
	.byte	W02
	.byte	VOL	, v089
	.byte	BEND	, c_v+38
	.byte	W02
	.byte	VOL	, v074
	.byte	BEND	, c_v+44
	.byte	W02
	.byte	VOL	, v060
	.byte	BEND	, c_v+50
	.byte	W02
	.byte	VOL	, v048
	.byte	BEND	, c_v+57
	.byte	W02
	.byte	VOL	, v038
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v030
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v019
	.byte	W02
	.byte		v016
	.byte	W04
	.byte	FINE

	.align 2
	.global song137
song137:	@ 0x0857DAF8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song137_1		@ track
