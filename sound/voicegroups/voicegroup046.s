	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup046
voicegroup046:	@ 0x08216014
	voice_directsound 60, 0, DirectSoundData_k_distgtr4_c3_13k, 255, 0, 255, 204	@08216014
	voice_directsound 60, 0, DirectSoundData_k_distgtr2_mute_c3_13k_s, 255, 0, 255, 204	@08216020
	voice_square_1 0, 2, 0, 0, 15, 0	@0821602C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216038
	voice_square_1 0, 2, 0, 0, 15, 0	@08216044
	voice_square_1 0, 2, 0, 0, 15, 0	@08216050
	voice_square_1 0, 2, 0, 0, 15, 0	@0821605C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216068
	voice_square_1 0, 2, 0, 0, 15, 0	@08216074
	voice_square_1 0, 2, 0, 0, 15, 0	@08216080
	voice_square_1 0, 2, 0, 0, 15, 0	@0821608C
	voice_directsound 60, 0, DirectSoundData_k_celesta_c5_13k_ss, 255, 252, 0, 165	@08216098
	voice_square_1 0, 2, 0, 0, 15, 0	@082160A4
	voice_square_1 0, 2, 0, 0, 15, 0	@082160B0
	voice_square_1 0, 2, 0, 0, 15, 0	@082160BC
	voice_square_1 0, 2, 0, 0, 15, 0	@082160C8
	voice_square_1 0, 2, 0, 0, 15, 0	@082160D4
	voice_square_1 0, 2, 0, 0, 15, 0	@082160E0
	voice_square_1 0, 2, 0, 0, 15, 0	@082160EC
	voice_directsound 60, 0, DirectSoundData_k_pipeorgan_c4_13k_s, 255, 0, 255, 165	@082160F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08216104
	voice_square_1 0, 2, 0, 0, 15, 0	@08216110
	voice_square_1 0, 2, 0, 0, 15, 0	@0821611C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216128
	voice_square_1 0, 2, 0, 0, 15, 0	@08216134
	voice_square_1 0, 2, 0, 0, 15, 0	@08216140
	voice_square_1 0, 2, 0, 0, 15, 0	@0821614C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216158
	voice_square_1 0, 2, 0, 0, 15, 0	@08216164
	voice_square_1 0, 2, 0, 0, 15, 0	@08216170
	voice_square_1 0, 2, 0, 0, 15, 0	@0821617C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216188
	voice_square_1 0, 2, 0, 0, 15, 0	@08216194
	voice_directsound 60, 0, DirectSoundData_k_fbass_c3_13k_s, 255, 246, 128, 165	@082161A0
	voice_directsound 60, 0, DirectSoundData_k_finbass2_c3_13k_s, 255, 0, 255, 165	@082161AC
	voice_square_1 0, 2, 0, 0, 15, 0	@082161B8
	voice_square_1 0, 2, 0, 0, 15, 0	@082161C4
	voice_square_1 0, 2, 0, 0, 15, 0	@082161D0
	voice_square_1 0, 2, 0, 0, 15, 0	@082161DC
	voice_square_1 0, 2, 0, 0, 15, 0	@082161E8
	voice_square_1 0, 2, 0, 0, 15, 0	@082161F4
	voice_square_1 0, 2, 0, 0, 15, 0	@08216200
	voice_square_1 0, 2, 0, 0, 15, 0	@0821620C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216218
	voice_square_1 0, 2, 0, 0, 15, 0	@08216224
	voice_square_1 0, 2, 0, 0, 15, 0	@08216230
	voice_square_1 0, 2, 0, 0, 15, 0	@0821623C
	voice_directsound 60, 0, DirectSoundData_k_timpani3_g3_13k_s, 255, 250, 0, 165	@08216248
	voice_directsound 60, 0, DirectSoundData_k_strings_13k_c4, 64, 0, 255, 188	@08216254
	voice_directsound 60, 0, DirectSoundData_k_strings_13k_c4, 255, 0, 255, 165	@08216260
	voice_directsound 60, 0, DirectSoundData_k_strings5_c3_13k, 255, 0, 255, 165	@0821626C
	voice_directsound 60, 0, DirectSoundData_k_strings5_c5_13k, 255, 0, 255, 165	@08216278
	voice_square_1 0, 2, 0, 0, 15, 0	@08216284
	voice_square_1 0, 2, 0, 0, 15, 0	@08216290
	voice_square_1 0, 2, 0, 0, 15, 0	@0821629C
	voice_square_1 0, 2, 0, 0, 15, 0	@082162A8
	voice_square_1 0, 2, 0, 0, 15, 0	@082162B4
	voice_directsound 60, 0, DirectSoundData_k_brasstrm2_c4_13k, 255, 0, 255, 165	@082162C0
	voice_square_1 0, 2, 0, 0, 15, 0	@082162CC
	voice_square_1 0, 2, 0, 0, 15, 0	@082162D8
	voice_square_1 0, 2, 0, 0, 15, 0	@082162E4
	voice_square_1 0, 2, 0, 0, 15, 0	@082162F0
	voice_directsound 60, 0, DirectSoundData_k_brasstrm_c4_13k, 255, 0, 255, 165	@082162FC
	voice_square_1 0, 2, 0, 0, 15, 0	@08216308
	voice_square_1 0, 2, 0, 0, 15, 0	@08216314
	voice_square_1 0, 2, 0, 0, 15, 0	@08216320
	voice_square_1 0, 2, 0, 0, 15, 0	@0821632C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216338
	voice_directsound 60, 0, DirectSoundData_k_oboe_c4_13k_s, 255, 0, 255, 89	@08216344
	voice_square_1 0, 2, 0, 0, 15, 0	@08216350
	voice_square_1 0, 2, 0, 0, 15, 0	@0821635C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216368
	voice_square_1 0, 2, 0, 0, 15, 0	@08216374
	voice_square_1 0, 2, 0, 0, 15, 0	@08216380
	voice_square_1 0, 2, 0, 0, 15, 0	@0821638C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216398
	voice_square_1 0, 2, 0, 0, 15, 0	@082163A4
	voice_square_1 0, 2, 0, 0, 15, 0	@082163B0
	voice_square_1 0, 2, 0, 0, 15, 0	@082163BC
	voice_square_1 0, 2, 0, 0, 15, 0	@082163C8
	voice_square_1 0, 2, 0, 0, 15, 0	@082163D4
	voice_square_1 0, 2, 0, 0, 15, 0	@082163E0
	voice_square_1 0, 2, 0, 0, 15, 0	@082163EC
	voice_square_1 0, 2, 0, 0, 15, 0	@082163F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08216404
	voice_square_1 0, 2, 0, 0, 15, 0	@08216410
	voice_square_1 0, 2, 0, 0, 15, 0	@0821641C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216428
	voice_square_1 0, 2, 0, 0, 15, 0	@08216434
	voice_square_1 0, 2, 0, 0, 15, 0	@08216440
	voice_square_1 0, 2, 0, 0, 15, 0	@0821644C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216458
	voice_square_1 0, 2, 0, 0, 15, 0	@08216464
	voice_square_1 0, 2, 0, 0, 15, 0	@08216470
	voice_square_1 0, 2, 0, 0, 15, 0	@0821647C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216488
	voice_square_1 0, 2, 0, 0, 15, 0	@08216494
	voice_square_1 0, 2, 0, 0, 15, 0	@082164A0
	voice_square_1 0, 2, 0, 0, 15, 0	@082164AC
	voice_square_1 0, 2, 0, 0, 15, 0	@082164B8
	voice_square_1 0, 2, 0, 0, 15, 0	@082164C4
	voice_square_1 0, 2, 0, 0, 15, 0	@082164D0
	voice_directsound 60, 0, DirectSoundData_k_strings5_c5c4_13k, 255, 0, 255, 165	@082164DC
	voice_square_1 0, 2, 0, 0, 15, 0	@082164E8
	voice_square_1 0, 2, 0, 0, 15, 0	@082164F4
	voice_square_1 0, 2, 0, 0, 15, 0	@08216500
	voice_square_1 0, 2, 0, 0, 15, 0	@0821650C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216518
	voice_square_1 0, 2, 0, 0, 15, 0	@08216524
	voice_square_1 0, 2, 0, 0, 15, 0	@08216530
	voice_square_1 0, 2, 0, 0, 15, 0	@0821653C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216548
	voice_square_1 0, 2, 0, 0, 15, 0	@08216554
	voice_square_1 0, 2, 0, 0, 15, 0	@08216560
	voice_square_1 0, 2, 0, 0, 15, 0	@0821656C
	voice_square_1 0, 2, 0, 0, 15, 0	@08216578
	voice_square_1 0, 2, 0, 0, 15, 0	@08216584
	voice_square_1 0, 2, 0, 0, 15, 0	@08216590
	voice_square_1 0, 2, 0, 0, 15, 0	@0821659C
	voice_square_1 0, 2, 0, 0, 15, 0	@082165A8
	voice_square_1 0, 2, 0, 0, 15, 0	@082165B4
	voice_square_1 0, 2, 0, 0, 15, 0	@082165C0
	voice_square_1 0, 2, 0, 0, 15, 0	@082165CC
	voice_square_1 0, 2, 0, 0, 15, 0	@082165D8
	voice_square_1 0, 2, 0, 0, 15, 0	@082165E4
	voice_square_1 0, 2, 0, 0, 15, 0	@082165F0
	voice_square_1 0, 2, 0, 0, 15, 0	@082165FC
	voice_keysplit_all voicegroup080	@08216608
