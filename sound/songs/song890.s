	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song890_1
song890_1:	@ 0x085849EC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 88
	.byte	PAN	, c_v-64
	.byte	VOL	, v105
	.byte	PAN	, c_v-63
	.byte		N72	, Cn3, v127
	.byte	W01
	.byte	PAN	, c_v-61
	.byte	W01
	.byte		c_v-59
	.byte	W01
	.byte		c_v-57
	.byte	W01
	.byte		c_v-55
	.byte	W01
	.byte		c_v-53
	.byte	W01
	.byte		c_v-51
	.byte	W01
	.byte		c_v-49
	.byte	W01
	.byte		c_v-47
	.byte	W01
	.byte		c_v-44
	.byte	W01
	.byte		c_v-42
	.byte	W01
	.byte		c_v-40
	.byte	W01
	.byte		c_v-38
	.byte	W01
	.byte		c_v-36
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-29
	.byte	W01
	.byte		c_v-27
	.byte	W01
	.byte		c_v-24
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-18
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-14
	.byte	W01
	.byte		c_v-12
	.byte	W01
	.byte		c_v-10
	.byte	W01
	.byte		c_v-8
	.byte	W01
	.byte		c_v-5
	.byte	W01
	.byte		c_v-3
	.byte	W01
	.byte		c_v-1
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v+17
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+21
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+25
	.byte	W01
	.byte		c_v+27
	.byte	W01
	.byte		c_v+29
	.byte	W01
	.byte		c_v+31
	.byte	W01
	.byte		c_v+34
	.byte	W01
	.byte		c_v+36
	.byte	W01
	.byte		c_v+37
	.byte	W01
	.byte		c_v+39
	.byte	W01
	.byte		c_v+41
	.byte	W01
	.byte		c_v+43
	.byte	W01
	.byte		c_v+45
	.byte	W01
	.byte		c_v+47
	.byte	W01
	.byte		c_v+49
	.byte	W01
	.byte		c_v+51
	.byte	W01
	.byte		c_v+54
	.byte	W01
	.byte		c_v+56
	.byte	W01
	.byte		c_v+58
	.byte	W01
	.byte		c_v+60
	.byte	W01
	.byte		c_v+62
	.byte	W01
	.byte		c_v+63
	.byte	W10
	.byte	FINE

	@********************** Track  2 **********************@

	.global song890_2
song890_2:	@ 0x08584A7A
	.byte	KEYSH	, 0
	.byte	VOICE	, 100
	.byte	VOL	, v079
	.byte		N06	, Fs2, v127
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Gs2, v092
	.byte	W06
	.byte			Gs2, v052
	.byte	W06
	.byte			Gs2, v032
	.byte	W06
	.byte			Gs2, v016
	.byte	W06
	.byte	FINE

	.align 2
	.global song890
song890:	@ 0x08584A98
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song890_1		@ track
	.word	song890_2		@ track
