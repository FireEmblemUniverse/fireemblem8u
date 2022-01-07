	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song216_1
song216_1:	@ 0x0857E9C8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 4
	.byte	VOL	, v120
	.byte	BENDR	, 32
	.byte		N03	, En2, v127
	.byte	W03
	.byte	BEND	, c_v
	.byte		N04	
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v120
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v108
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v100
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v088
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v080
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v068
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v060
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v048
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v040
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte		N04	, En2, v028
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W02
	.byte	FINE

	.align 2
	.global song216
song216:	@ 0x0857EA5C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song216_1		@ track
