	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song109_1
song109_1:	@ 0x0857D1DC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 26
	.byte	VOL	, v048
	.byte	PAN	, c_v
	.byte		N05	, Gn4, v127
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte		N06	, Gn5
	.byte	W04
	.byte	W02
	.byte		N05	, Gn4, v080
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte		N06	, Gn5
	.byte	W02
	.byte	W04
	.byte		N05	, Gn4, v056
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte		N06	, Gn5
	.byte	W06
	.byte		N05	, Gn4, v032
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W03
	.byte	W02
	.byte		N06	, Gn5
	.byte	W22
	.byte	FINE

	@********************** Track  2 **********************@

	.global song109_2
song109_2:	@ 0x0857D21E
	.byte	KEYSH	, 0
	.byte	VOICE	, 27
	.byte	VOL	, v032
	.byte	PAN	, c_v
	.byte	W04
	.byte		N05	, Gn4, v127
	.byte	W01
	.byte	PAN	, c_v-64
	.byte	W04
	.byte		N05	, Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte		N06	, Gn5
	.byte	W06
	.byte		N05	, Gn4, v080
	.byte	W01
	.byte	PAN	, c_v+63
	.byte	W04
	.byte		N05	, Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W03
	.byte	W02
	.byte		N06	, Gn5
	.byte	W06
	.byte		N05	, Gn4, v056
	.byte	W01
	.byte	PAN	, c_v-64
	.byte	W04
	.byte		N05	, Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W01
	.byte	W04
	.byte		N06	, Gn5
	.byte	W06
	.byte		N05	, Gn4, v032
	.byte	W01
	.byte	PAN	, c_v+63
	.byte	W04
	.byte		N05	, Dn5
	.byte	W05
	.byte			Cn5
	.byte	W04
	.byte	W01
	.byte			Dn5
	.byte	W05
	.byte		N06	, Gn5
	.byte	W18
	.byte	FINE

	@********************** Track  3 **********************@

	.global song109_3
song109_3:	@ 0x0857D26F
	.byte	KEYSH	, 0
	.byte	VOICE	, 28
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte		N05	, Gn4, v127
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte		N06	, Gn5
	.byte	W04
	.byte	W02
	.byte		N05	, Gn4, v096
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte		N06	, Gn5
	.byte	W02
	.byte	W04
	.byte		N05	, Gn4, v056
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte			Cn5
	.byte	W05
	.byte			Dn5
	.byte	W05
	.byte		N06	, Gn5
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song109
song109:	@ 0x0857D2A4
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song109_1		@ track
	.word	song109_2		@ track
	.word	song109_3		@ track
