	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song271_1
song271_1:	@ 0x0857F3AC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 42
	.byte	BENDR	, 3
	.byte	VOL	, v032
	.byte	BEND	, c_v
	.byte		N48	, An2, v127
	.byte	W01
	.byte	VOL	, v063
	.byte	W01
	.byte		v095
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v127
	.byte	W01
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
	.byte	VOL	, v127
	.byte	BEND	, c_v+28
	.byte	W01
	.byte	VOL	, v117
	.byte	W01
	.byte		v107
	.byte	BEND	, c_v+33
	.byte	W01
	.byte	VOL	, v098
	.byte	W01
	.byte		v089
	.byte	BEND	, c_v+38
	.byte	W01
	.byte	VOL	, v081
	.byte	W01
	.byte		v073
	.byte	BEND	, c_v+44
	.byte	W01
	.byte	VOL	, v065
	.byte	W01
	.byte		v058
	.byte	BEND	, c_v+50
	.byte	W01
	.byte	VOL	, v052
	.byte	W01
	.byte		v046
	.byte	BEND	, c_v+57
	.byte	W01
	.byte	VOL	, v040
	.byte	W01
	.byte		v034
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v029
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W02
	.byte	FINE

	.align 2
	.global song271
song271:	@ 0x0857F420
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song271_1		@ track
