	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song976_1
song976_1:	@ 0x085869A8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 100
	.byte	VOL	, v046
	.byte	BENDR	, 32
	.byte		N02	, En2, v127
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
	.byte	W01
	.byte	FINE

	@********************** Track  2 **********************@

	.global song976_2
song976_2:	@ 0x08586A3A
	.byte	KEYSH	, 0
	.byte	VOICE	, 107
	.byte	VOL	, v099
	.byte	BENDR	, 32
	.byte		N68	, Cn3, v127
	.byte	W03
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+2
	.byte	W02
	.byte	W21
	.byte	FINE

	.align 2
	.global song976
song976:	@ 0x08586AA4
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song976_1		@ track
	.word	song976_2		@ track
