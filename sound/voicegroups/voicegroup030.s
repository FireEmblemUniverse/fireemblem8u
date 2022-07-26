	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup030
voicegroup030:	@ 0x082117F0
	voice_square_1 0, 2, 0, 1, 0, 0	@082117F0
	voice_square_1 0, 1, 0, 1, 0, 0	@082117FC
	voice_square_1 0, 3, 0, 1, 0, 0	@08211808
	voice_square_1 0, 0, 0, 1, 11, 0	@08211814
	voice_square_1 0, 2, 0, 2, 0, 0	@08211820
	voice_square_1 0, 2, 0, 2, 0, 0	@0821182C
	voice_square_1 0, 2, 0, 0, 11, 0	@08211838
	voice_square_1 0, 2, 0, 2, 0, 0	@08211844
	voice_square_2 2, 0, 1, 0, 0	@08211850
	voice_square_1 0, 2, 0, 1, 6, 2	@0821185C
	voice_directsound 60, 0, DirectSoundData_pr_hyuun1_e4_13k8b, 255, 0, 255, 0	@08211868
	voice_square_1 0, 2, 0, 1, 0, 0	@08211874
	voice_square_2 3, 0, 1, 0, 0	@08211880
	voice_square_1 0, 3, 0, 2, 0, 1	@0821188C
	voice_square_2 3, 0, 2, 0, 1	@08211898
	voice_square_2 0, 0, 1, 0, 0	@082118A4
	voice_square_2 2, 0, 2, 0, 0	@082118B0
	voice_square_1 0, 2, 0, 2, 0, 0	@082118BC
	voice_square_2 1, 0, 1, 0, 0	@082118C8
	voice_square_2 2, 0, 1, 0, 0	@082118D4
	voice_square_2 3, 0, 1, 0, 0	@082118E0
	voice_directsound 60, 0, DirectSoundData_hp_count1_e2_13k8b, 255, 0, 255, 0	@082118EC
	voice_square_1 0, 1, 0, 2, 0, 0	@082118F8
	voice_square_1 0, 2, 0, 1, 0, 0	@08211904
	voice_square_2 0, 0, 1, 0, 0	@08211910
	voice_programmable_wave wave008_se_triangle_1, 0, 0, 15, 0	@0821191C
	voice_square_1 0, 2, 0, 2, 0, 0	@08211928
	voice_square_2 2, 0, 2, 0, 0	@08211934
	voice_programmable_wave wave008_se_triangle_1, 0, 0, 15, 0	@08211940
	voice_square_1 0, 2, 0, 0, 15, 0	@0821194C
	voice_square_1 0, 1, 0, 1, 0, 0	@08211958
	voice_square_2 1, 0, 1, 0, 0	@08211964
	voice_programmable_wave wave008_se_triangle_1, 0, 0, 15, 0	@08211970
	voice_square_1 0, 2, 0, 1, 0, 0	@0821197C
	voice_programmable_wave wave009_se_triangle_2, 0, 0, 15, 0	@08211988
	voice_square_1 0, 0, 0, 3, 0, 0	@08211994
	voice_square_2 0, 0, 0, 15, 1	@082119A0
	voice_square_2 0, 0, 0, 15, 0	@082119AC
	voice_programmable_wave wave010_square25_e1, 0, 0, 15, 0	@082119B8
	voice_noise 60, 0, 0, 0, 0, 0, 15, 0	@082119C4
	voice_square_1 0, 2, 0, 5, 0, 0	@082119D0
	voice_square_1 0, 1, 0, 2, 0, 0	@082119DC
	voice_square_2 2, 0, 1, 0, 0	@082119E8
	voice_directsound 60, 0, DirectSoundData_point_count1b_e1_13k8b, 255, 0, 255, 0	@082119F4
	voice_directsound 60, 0, DirectSoundData_warp1a_e2_13k8b, 255, 0, 255, 0	@08211A00
	voice_directsound 60, 0, DirectSoundData_kansei1_e5l_13k8b, 255, 0, 255, 0	@08211A0C
	voice_square_1 0, 2, 0, 0, 15, 0	@08211A18
	voice_directsound 60, 0, DirectSoundData_dr_solo2_c2_e3l_10k, 255, 0, 255, 0	@08211A24
	voice_programmable_wave wave008_se_triangle_1, 0, 0, 15, 0	@08211A30
	voice_square_2 2, 0, 2, 0, 0	@08211A3C
	voice_square_2 2, 0, 1, 0, 0	@08211A48
	voice_square_2 2, 0, 2, 0, 0	@08211A54
	voice_square_1 0, 2, 0, 0, 15, 0	@08211A60
	voice_directsound 60, 0, DirectSoundData_op_thunder1_m1_e_13k8b, 255, 0, 255, 0	@08211A6C
	voice_square_1 0, 2, 0, 0, 15, 0	@08211A78
	voice_square_1 0, 2, 0, 0, 15, 0	@08211A84
	voice_square_1 0, 2, 0, 0, 15, 0	@08211A90
	voice_square_1 0, 2, 0, 0, 15, 0	@08211A9C
	voice_square_1 0, 2, 0, 0, 15, 0	@08211AA8
	voice_square_1 0, 2, 0, 0, 15, 0	@08211AB4
	voice_square_1 0, 2, 0, 0, 15, 0	@08211AC0
	voice_square_1 0, 2, 0, 0, 15, 0	@08211ACC
	voice_square_1 0, 2, 0, 0, 15, 0	@08211AD8
	voice_square_1 0, 2, 0, 0, 15, 0	@08211AE4
	voice_square_1 0, 2, 0, 0, 15, 0	@08211AF0
	voice_square_1 0, 2, 0, 0, 15, 0	@08211AFC
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B08
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B14
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B20
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B2C
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B38
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B44
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B50
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B5C
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B68
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B74
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B80
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B8C
	voice_square_1 0, 2, 0, 0, 15, 0	@08211B98
	voice_square_1 0, 2, 0, 0, 15, 0	@08211BA4
	voice_directsound 60, 0, DirectSoundData_brass4_c3_e1l_10k8b, 255, 0, 255, 89	@08211BB0
	voice_directsound 60, 0, DirectSoundData_brass4_c4_e3l_10k8b, 255, 0, 255, 89	@08211BBC
	voice_square_1 0, 2, 0, 0, 15, 0	@08211BC8
	voice_square_1 0, 2, 0, 0, 15, 0	@08211BD4
	voice_directsound 60, 0, DirectSoundData_e_piano2_c3_10k8b, 255, 249, 0, 127	@08211BE0
