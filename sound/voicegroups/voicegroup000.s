	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 4
	@********************** Voicegroup **********************@

	.global voicegroup000
voicegroup000:	@ 0x08207470
	voice_square_1 0, 2, 0, 0, 15, 0	@08207470
	voice_square_1 0, 2, 0, 0, 15, 0	@0820747C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207488
	voice_square_1 0, 2, 0, 0, 15, 0	@08207494
	voice_square_1 0, 2, 0, 0, 15, 0	@082074A0
	voice_square_1 0, 2, 0, 0, 15, 0	@082074AC
	voice_square_1 0, 2, 0, 0, 15, 0	@082074B8
	voice_square_1 0, 2, 0, 0, 15, 0	@082074C4
	voice_square_1 0, 2, 0, 0, 15, 0	@082074D0
	voice_square_1 0, 2, 0, 0, 15, 0	@082074DC
	voice_square_1 0, 2, 0, 0, 15, 0	@082074E8
	voice_square_1 0, 2, 0, 0, 15, 0	@082074F4
	voice_square_1 0, 2, 0, 0, 15, 0	@08207500
	voice_square_1 0, 2, 0, 0, 15, 0	@0820750C
	voice_directsound 60, 0, DirectSoundData_k_tubular_c4_13k_s, 255, 246, 0, 165	@08207518
	voice_square_1 0, 2, 0, 0, 15, 0	@08207524
	voice_square_1 0, 2, 0, 0, 15, 0	@08207530
	voice_square_1 0, 2, 0, 0, 15, 0	@0820753C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207548
	voice_square_1 0, 2, 0, 0, 15, 0	@08207554
	voice_square_1 0, 2, 0, 0, 15, 0	@08207560
	voice_square_1 0, 2, 0, 0, 15, 0	@0820756C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207578
	voice_square_1 0, 2, 0, 0, 15, 0	@08207584
	voice_square_1 0, 2, 0, 0, 15, 0	@08207590
	voice_square_1 0, 2, 0, 0, 15, 0	@0820759C
	voice_square_1 0, 2, 0, 0, 15, 0	@082075A8
	voice_square_1 0, 2, 0, 0, 15, 0	@082075B4
	voice_square_1 0, 2, 0, 0, 15, 0	@082075C0
	voice_square_1 0, 2, 0, 0, 15, 0	@082075CC
	voice_square_1 0, 2, 0, 0, 15, 0	@082075D8
	voice_square_1 0, 2, 0, 0, 15, 0	@082075E4
	voice_square_1 0, 2, 0, 0, 15, 0	@082075F0
	voice_directsound 60, 0, DirectSoundData_k_finbass2_c3_13k_s, 255, 0, 255, 165	@082075FC
	voice_square_1 0, 2, 0, 0, 15, 0	@08207608
	voice_square_1 0, 2, 0, 0, 15, 0	@08207614
	voice_square_1 0, 2, 0, 0, 15, 0	@08207620
	voice_square_1 0, 2, 0, 0, 15, 0	@0820762C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207638
	voice_square_1 0, 2, 0, 0, 15, 0	@08207644
	voice_square_1 0, 2, 0, 0, 15, 0	@08207650
	voice_square_1 0, 2, 0, 0, 15, 0	@0820765C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207668
	voice_square_1 0, 2, 0, 0, 15, 0	@08207674
	voice_square_1 0, 2, 0, 0, 15, 0	@08207680
	voice_square_1 0, 2, 0, 0, 15, 0	@0820768C
	voice_directsound 60, 0, DirectSoundData_k_harp_c4_13k_s, 128, 226, 0, 178	@08207698
	voice_directsound 60, 0, DirectSoundData_k_timpani3_g3_13k_s, 255, 0, 255, 204	@082076A4
	voice_directsound 60, 0, DirectSoundData_k_strings_13k_c4, 255, 0, 255, 165	@082076B0
	voice_directsound 60, 0, DirectSoundData_k_strings_13k_c5, 255, 0, 255, 149	@082076BC
	voice_directsound 60, 0, DirectSoundData_k_strings5_c3_13k, 255, 0, 255, 188	@082076C8
	voice_directsound 60, 0, DirectSoundData_k_strings5_c5c4_13k, 255, 0, 255, 165	@082076D4
	voice_directsound 60, 0, DirectSoundData_k_strings5_c4_13k, 255, 0, 255, 188	@082076E0
	voice_directsound 60, 0, DirectSoundData_k_strings5_c5_13k, 255, 0, 255, 188	@082076EC
	voice_directsound 60, 0, DirectSoundData_k_strings5_c2_13k, 255, 0, 255, 188	@082076F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08207704
	voice_directsound 60, 0, DirectSoundData_k_brasstrp_c4_13k, 255, 0, 255, 165	@08207710
	voice_directsound 60, 0, DirectSoundData_k_brass3_c3_13k, 255, 0, 255, 165	@0820771C
	voice_directsound 60, 0, DirectSoundData_k_brass_c3_13k, 255, 0, 255, 165	@08207728
	voice_directsound 60, 0, DirectSoundData_k_brass3_c4_13k, 255, 0, 255, 165	@08207734
	voice_directsound 60, 0, DirectSoundData_k_brass_c4_13k, 255, 0, 255, 165	@08207740
	voice_directsound 60, 0, DirectSoundData_k_brassorc_c4_13k, 255, 0, 255, 165	@0820774C
	voice_directsound 60, 0, DirectSoundData_k_brasstrm_c4_13k, 255, 0, 255, 165	@08207758
	voice_square_1 0, 2, 0, 0, 15, 0	@08207764
	voice_square_1 0, 2, 0, 0, 15, 0	@08207770
	voice_square_1 0, 2, 0, 0, 15, 0	@0820777C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207788
	voice_square_1 0, 2, 0, 0, 15, 0	@08207794
	voice_directsound 60, 0, DirectSoundData_k_oboe_c5_13k_s, 128, 0, 255, 165	@082077A0
	voice_square_1 0, 2, 0, 0, 15, 0	@082077AC
	voice_square_1 0, 2, 0, 0, 15, 0	@082077B8
	voice_directsound 60, 0, DirectSoundData_k_clarinet_c5_13k_ss, 255, 0, 255, 165	@082077C4
	voice_square_1 0, 2, 0, 0, 15, 0	@082077D0
	voice_directsound 60, 0, DirectSoundData_k_flute_c6_13k_s, 255, 0, 255, 188	@082077DC
	voice_square_1 0, 2, 0, 0, 15, 0	@082077E8
	voice_square_1 0, 2, 0, 0, 15, 0	@082077F4
	voice_square_1 0, 2, 0, 0, 15, 0	@08207800
	voice_square_1 0, 2, 0, 0, 15, 0	@0820780C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207818
	voice_square_1 0, 2, 0, 0, 15, 0	@08207824
	voice_square_1 0, 2, 0, 0, 15, 0	@08207830
	voice_square_1 0, 2, 0, 0, 15, 0	@0820783C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207848
	voice_square_1 0, 2, 0, 0, 15, 0	@08207854
	voice_square_1 0, 2, 0, 0, 15, 0	@08207860
	voice_square_1 0, 2, 0, 0, 15, 0	@0820786C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207878
	voice_square_1 0, 2, 0, 0, 15, 0	@08207884
	voice_square_1 0, 2, 0, 0, 15, 0	@08207890
	voice_square_1 0, 2, 0, 0, 15, 0	@0820789C
	voice_square_1 0, 2, 0, 0, 15, 0	@082078A8
	voice_square_1 0, 2, 0, 0, 15, 0	@082078B4
	voice_square_1 0, 2, 0, 0, 15, 0	@082078C0
	voice_square_1 0, 2, 0, 0, 15, 0	@082078CC
	voice_square_1 0, 2, 0, 0, 15, 0	@082078D8
	voice_square_1 0, 2, 0, 0, 15, 0	@082078E4
	voice_square_1 0, 2, 0, 0, 15, 0	@082078F0
	voice_square_1 0, 2, 0, 0, 15, 0	@082078FC
	voice_square_1 0, 2, 0, 0, 15, 0	@08207908
	voice_square_1 0, 2, 0, 0, 15, 0	@08207914
	voice_square_1 0, 2, 0, 0, 15, 0	@08207920
	voice_square_1 0, 2, 0, 0, 15, 0	@0820792C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207938
	voice_square_1 0, 2, 0, 0, 15, 0	@08207944
	voice_square_1 0, 2, 0, 0, 15, 0	@08207950
	voice_square_1 0, 2, 0, 0, 15, 0	@0820795C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207968
	voice_square_1 0, 2, 0, 0, 15, 0	@08207974
	voice_square_1 0, 2, 0, 0, 15, 0	@08207980
	voice_square_1 0, 2, 0, 0, 15, 0	@0820798C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207998
	voice_square_1 0, 2, 0, 0, 15, 0	@082079A4
	voice_square_1 0, 2, 0, 0, 15, 0	@082079B0
	voice_square_1 0, 2, 0, 0, 15, 0	@082079BC
	voice_square_1 0, 2, 0, 0, 15, 0	@082079C8
	voice_square_1 0, 2, 0, 0, 15, 0	@082079D4
	voice_square_1 0, 2, 0, 0, 15, 0	@082079E0
	voice_square_1 0, 2, 0, 0, 15, 0	@082079EC
	voice_square_1 0, 2, 0, 0, 15, 0	@082079F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08207A04
	voice_square_1 0, 2, 0, 0, 15, 0	@08207A10
	voice_square_1 0, 2, 0, 0, 15, 0	@08207A1C
	voice_square_1 0, 2, 0, 0, 15, 0	@08207A28
	voice_square_1 0, 2, 0, 0, 15, 0	@08207A34
	voice_square_1 0, 2, 0, 0, 15, 0	@08207A40
	voice_square_1 0, 2, 0, 0, 15, 0	@08207A4C
	voice_keysplit_all voicegroup083	@08207A58
	voice_keysplit_all voicegroup084	@08207A64
