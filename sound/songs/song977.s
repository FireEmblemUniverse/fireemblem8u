	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song977_1
song977_1:	@ 0x08586AB4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 96
	.byte	VOL	, v099
	.byte	BENDR	, 12
	.byte	BEND	, c_v
	.byte		N23	, Cn3, v127
	.byte	W23
	.byte	FINE

	@********************** Track  2 **********************@

	.global song977_2
song977_2:	@ 0x08586AC5
	.byte	KEYSH	, 0
	.byte	VOICE	, 126
	.byte	MOD	, 0
	.byte	VOL	, v099
	.byte	BENDR	, 12
	.byte	BEND	, c_v-60
	.byte		N08	, Fs3, v127
	.byte	W01
	.byte	BEND	, c_v-55
	.byte	W01
	.byte		c_v-50
	.byte	W01
	.byte		c_v-40
	.byte	W01
	.byte		c_v-35
	.byte	W01
	.byte		c_v-30
	.byte	W01
	.byte		c_v-21
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-11
	.byte	W01
	.byte		c_v-1
	.byte		N15	
	.byte	W01
	.byte	BEND	, c_v+4
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+18
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+28
	.byte	W01
	.byte		c_v+38
	.byte	W01
	.byte		c_v+43
	.byte	W01
	.byte		c_v+47
	.byte	W01
	.byte		c_v+57
	.byte	W01
	.byte		c_v+63
	.byte	W05
	.byte	FINE

	.align 2
	.global song977
song977:	@ 0x08586B00
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song977_1		@ track
	.word	song977_2		@ track
