	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song115_1
song115_1:	@ 0x0857D3C8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 10
	.byte	VOL	, v127
	.byte	W04
	.byte	PAN	, c_v-50
	.byte		N72	, Cn3, v127
	.byte	W02
	.byte	PAN	, c_v-42
	.byte	W02
	.byte		c_v-34
	.byte	W02
	.byte		c_v-26
	.byte	W02
	.byte		c_v-17
	.byte	W02
	.byte		c_v-9
	.byte	W02
	.byte		c_v
	.byte	W08
	.byte	W24
	.byte	W10
	.byte		c_v
	.byte	W02
	.byte		c_v+8
	.byte	W02
	.byte		c_v+16
	.byte	W02
	.byte		c_v+24
	.byte	W02
	.byte		c_v+33
	.byte	W02
	.byte		c_v+41
	.byte	W02
	.byte		c_v+50
	.byte	W02
	.byte	W24
	.byte	FINE

	@********************** Track  2 **********************@

	.global song115_2
song115_2:	@ 0x0857D3F6
	.byte	KEYSH	, 0
	.byte	VOICE	, 10
	.byte	VOL	, v127
	.byte	PAN	, c_v-60
	.byte		N88	, Gn2, v080
	.byte	W02
	.byte	PAN	, c_v-55
	.byte	W02
	.byte		c_v-50
	.byte	W02
	.byte		c_v-45
	.byte	W02
	.byte		c_v-40
	.byte	W02
	.byte		c_v-35
	.byte	W02
	.byte		c_v-30
	.byte	W02
	.byte		c_v-25
	.byte	W02
	.byte		c_v-20
	.byte	W02
	.byte		c_v-15
	.byte	W02
	.byte		c_v-10
	.byte	W02
	.byte		c_v-5
	.byte	W02
	.byte		c_v
	.byte	W24
	.byte	W14
	.byte		c_v
	.byte	W02
	.byte		c_v+5
	.byte	W02
	.byte		c_v+10
	.byte	W02
	.byte		c_v+15
	.byte	W02
	.byte		c_v+20
	.byte	W02
	.byte		c_v+25
	.byte	W02
	.byte		c_v+30
	.byte	W02
	.byte		c_v+35
	.byte	W02
	.byte		c_v+40
	.byte	W02
	.byte		c_v+45
	.byte	W02
	.byte		c_v+50
	.byte	W02
	.byte		c_v+55
	.byte	W02
	.byte		c_v+60
	.byte	W10
	.byte	FINE

	.align 2
	.global song115
song115:	@ 0x0857D438
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	60		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song115_1		@ track
	.word	song115_2		@ track
