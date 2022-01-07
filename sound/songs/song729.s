	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song729_1
song729_1:	@ 0x085831E4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 42
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N32	, Cn3, v127
	.byte	W32
	.byte	W03
	.byte	FINE

	@********************** Track  2 **********************@

	.global song729_2
song729_2:	@ 0x085831F4
	.byte	KEYSH	, 0
	.byte	VOICE	, 49
	.byte	VOL	, v040
	.byte	PAN	, c_v
	.byte		N08	, Fn3, v064
	.byte	W09
	.byte		N14	, Dn3, v044
	.byte	W14
	.byte	FINE

	.align 2
	.global song729
song729:	@ 0x08583208
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song729_1		@ track
	.word	song729_2		@ track
