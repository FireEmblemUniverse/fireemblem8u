	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song123_1
song123_1:	@ 0x0857D6CC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 35
	.byte	BENDR	, 1
	.byte	VOL	, v095
	.byte	BEND	, c_v+16
	.byte		N06	, Cn2, v127
	.byte	W14
	.byte		N06	
	.byte	W10
	.byte	W04
	.byte		N06	
	.byte	W14
	.byte		N06	
	.byte	W06
	.byte	W08
	.byte		N06	
	.byte	W14
	.byte		N06	
	.byte	W02
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	W02
	.byte		N06	
	.byte	W14
	.byte		N06	
	.byte	W08
	.byte	W06
	.byte		N06	
	.byte	W18
	.byte	FINE

	@********************** Track  2 **********************@

	.global song123_2
song123_2:	@ 0x0857D6F4
	.byte	KEYSH	, 0
	.byte	VOICE	, 36
	.byte	VOL	, v071
	.byte		N06	, Cn2, v127
	.byte	W14
	.byte		N06	
	.byte	W10
	.byte	W04
	.byte		N06	
	.byte	W14
	.byte		N06	
	.byte	W06
	.byte	W08
	.byte		N06	
	.byte	W14
	.byte		N06	
	.byte	W02
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	W02
	.byte		N06	
	.byte	W14
	.byte		N06	
	.byte	W08
	.byte	W06
	.byte		N06	
	.byte	W18
	.byte	FINE

	.align 2
	.global song123
song123:	@ 0x0857D718
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song123_1		@ track
	.word	song123_2		@ track
