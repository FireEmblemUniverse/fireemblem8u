	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song126_1
song126_1:	@ 0x0857D778
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 41
	.byte	VOL	, v040
	.byte		N04	, Bn4, v127
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W18
	.byte	FINE

	@********************** Track  2 **********************@

	.global song126_2
song126_2:	@ 0x0857D797
	.byte	KEYSH	, 0
	.byte	VOICE	, 42
	.byte	BENDR	, 2
	.byte	VOL	, v040
	.byte	BEND	, c_v-4
	.byte		N04	, Bn4, v112
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W18
	.byte	FINE

	.align 2
	.global song126
song126:	@ 0x0857D7B8
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song126_1		@ track
	.word	song126_2		@ track
