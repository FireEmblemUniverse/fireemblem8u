	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song058_1
song058_1:	@ 0x0856F22C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 58
	.byte	VOICE	, 57
	.byte	VOL	, v049
	.byte	PAN	, c_v-4
	.byte		N11	, Cs3, v092
	.byte		N11	, As3, v104
	.byte	W12
	.byte		N04	, Cs3, v032
	.byte		N04	, As3
	.byte	W06
	.byte		N03	, Cs3, v088
	.byte		N03	, As3, v108
	.byte	W06
	.byte		N04	, Cs3, v092
	.byte		N04	, As3, v116
	.byte	W06
	.byte			Cs3, v060
	.byte		N04	, As3, v088
	.byte	W06
	.byte			Ds3, v092
	.byte		N04	, Cn4, v112
	.byte	W06
	.byte			Ds3, v016
	.byte		N04	, Cn4, v032
	.byte	W06
	.byte			Fs3, v100
	.byte		N04	, Cs4, v104
	.byte	W06
	.byte			Fs3, v020
	.byte		N04	, Cs4, v028
	.byte	W06
	.byte		N03	, Gs3, v088
	.byte		N04	, Ds4, v100
	.byte	W06
	.byte		N03	, Gs3, v020
	.byte		N04	, Ds4, v036
	.byte	W06
	.byte		N68	, As3, v088
	.byte		N68	, Fn4, v092
	.byte	W72
	.byte		N04	, As3, v036
	.byte		N04	, Fn4
	.byte	W04
	.byte	FINE

	@********************** Track  2 **********************@

	.global song058_2
song058_2:	@ 0x0856F28B
	.byte	KEYSH	, 0
	.byte	VOICE	, 33
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte		N11	, Fs2, v096
	.byte	W12
	.byte		N05	, Fs2, v028
	.byte	W06
	.byte		N03	, Fs2, v104
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Fs2, v076
	.byte	W06
	.byte		N05	, Ds2, v104
	.byte	W06
	.byte			Ds2, v028
	.byte	W06
	.byte			Ds2, v104
	.byte	W06
	.byte			Ds2, v024
	.byte	W06
	.byte		N04	, Ds2, v108
	.byte	W06
	.byte			Ds2, v032
	.byte	W06
	.byte		N68	, As1, v120
	.byte	W72
	.byte		N05	, As1, v028
	.byte	W05
	.byte	FINE

	@********************** Track  3 **********************@

	.global song058_3
song058_3:	@ 0x0856F2C1
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	VOL	, v049
	.byte	PAN	, c_v
	.byte		N11	, As1, v100
	.byte	W12
	.byte		N04	, As1, v040
	.byte	W06
	.byte		N03	, As1, v108
	.byte	W06
	.byte		N08	, As1, v100
	.byte	W12
	.byte		N04	, As1, v124
	.byte	W06
	.byte			As1, v040
	.byte	W06
	.byte			Cn2, v100
	.byte	W06
	.byte			Cn2, v032
	.byte	W06
	.byte		N03	, Cs2, v112
	.byte	W06
	.byte			Cs2, v036
	.byte	W06
	.byte		N68	, Ds2, v092
	.byte	W72
	.byte		N04	, Ds2, v040
	.byte	W04
	.byte	FINE

	@********************** Track  4 **********************@

	.global song058_4
song058_4:	@ 0x0856F2F6
	.byte	KEYSH	, 0
	.byte	VOICE	, 48
	.byte	VOL	, v049
	.byte	PAN	, c_v+20
	.byte		N11	, Fs3, v096
	.byte	W12
	.byte		N04	, Fs3, v032
	.byte	W06
	.byte		N02	, Fs3, v104
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Fs3, v076
	.byte	W06
	.byte		N04	, Ds3, v104
	.byte	W06
	.byte			Ds3, v032
	.byte	W06
	.byte			Ds3, v104
	.byte	W06
	.byte			Ds3, v032
	.byte	W06
	.byte		N03	, Ds3, v108
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte		N68	, As2, v120
	.byte	W72
	.byte		N04	, As2, v032
	.byte	W04
	.byte	FINE

	.align 2
	.global song058
song058:	@ 0x0856F32C
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup022		@ voicegroup/tone

	.word	song058_1		@ track
	.word	song058_2		@ track
	.word	song058_3		@ track
	.word	song058_4		@ track
