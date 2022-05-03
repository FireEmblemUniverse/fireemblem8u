	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song962_mon_bgl_attack3_1
song962_mon_bgl_attack3_1:	@ 0x085864A0
	.byte	TEMPO	, 75
	.byte	VOL	, v049
	.byte	VOICE	, 103
	.byte	KEYSH	, 0
	.byte		N04	, En4, v127
	.byte	W04
	.byte	VOL	, v041
	.byte		N04	, En4, v127
	.byte	W04
	.byte	VOL	, v033
	.byte		N04	, En4, v127
	.byte	W04
	.byte	VOL	, v024
	.byte		N04	, En4, v127
	.byte	W04
	.byte	FINE

	@********************** Track  2 **********************@

	.align 2
	.global song962_mon_bgl_attack3_2
song962_mon_bgl_attack3_2:	@ 0x085864C0
	.byte	VOL	, v105
	.byte	VOICE	, 116
	.byte	KEYSH	, 0
	.byte	W12
	.byte		N96	, Gn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song962_mon_bgl_attack3
song962_mon_bgl_attack3:	@ 0x085864CC
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song962_mon_bgl_attack3_1		@ track
	.word	song962_mon_bgl_attack3_2		@ track
