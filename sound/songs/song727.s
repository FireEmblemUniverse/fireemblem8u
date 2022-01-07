	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song727_1
song727_1:	@ 0x08583190
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 40
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte		N72	, Cn3, v127
	.byte	W72
	.byte	FINE

	@********************** Track  2 **********************@

	.global song727_2
song727_2:	@ 0x0858319F
	.byte	KEYSH	, 0
	.byte	VOICE	, 33
	.byte	VOL	, v039
	.byte	PAN	, c_v
	.byte		N03	, Cs3, v104
	.byte	W03
	.byte			Bn2, v092
	.byte	W03
	.byte			As2, v076
	.byte	W03
	.byte			Gn2, v064
	.byte	W03
	.byte			Fn2, v052
	.byte	W03
	.byte	FINE

	.align 2
	.global song727
song727:	@ 0x085831B8
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song727_1		@ track
	.word	song727_2		@ track
