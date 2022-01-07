	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song763_1
song763_1:	@ 0x08583E0C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 72
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte		N48	, Cn3, v092
	.byte	W48
	.byte		N48	
	.byte	W48
	.byte	FINE

	@********************** Track  2 **********************@

	.global song763_2
song763_2:	@ 0x08583E1D
	.byte	KEYSH	, 0
	.byte	VOICE	, 69
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte		N96	, Fs3, v100
	.byte	W96
	.byte	FINE

	.align 2
	.global song763
song763:	@ 0x08583E2C
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song763_1		@ track
	.word	song763_2		@ track
