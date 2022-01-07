	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song125_1
song125_1:	@ 0x0857D748
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 41
	.byte	VOL	, v040
	.byte		N04	, Cs4, v127
	.byte	W04
	.byte			Fs4
	.byte	W20
	.byte	FINE

	@********************** Track  2 **********************@

	.global song125_2
song125_2:	@ 0x0857D757
	.byte	KEYSH	, 0
	.byte	VOICE	, 42
	.byte	BENDR	, 2
	.byte	VOL	, v040
	.byte	BEND	, c_v-6
	.byte		N04	, Cs4, v127
	.byte	W04
	.byte			Fs4
	.byte	W20
	.byte	FINE

	.align 2
	.global song125
song125:	@ 0x0857D768
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song125_1		@ track
	.word	song125_2		@ track
