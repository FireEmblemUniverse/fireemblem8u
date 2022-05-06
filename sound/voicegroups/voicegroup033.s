	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup033
voicegroup033:	@ 0x08212564
	voice_directsound 60, 0, DirectSoundData_fire_e2_13k8b, 255, 0, 255, 0	@08212564
	voice_directsound 60, 0, DirectSoundData_fire4_e2_13k8b, 255, 0, 255, 0	@08212570
	voice_square_1 0, 2, 0, 0, 15, 0	@0821257C
	voice_directsound 60, 0, DirectSoundData_hammerne2_e1l_p25_10k8b, 255, 0, 255, 0	@08212588
	voice_square_1 0, 2, 0, 0, 15, 0	@08212594
	voice_square_1 0, 2, 0, 0, 15, 0	@082125A0
	voice_directsound 60, 0, DirectSoundData_kiran2_e2_13k8b, 255, 0, 255, 0	@082125AC
	voice_directsound 60, 0, DirectSoundData_lfire2_e1_10k8b, 255, 0, 255, 0	@082125B8
	voice_directsound 60, 0, DirectSoundData_live_p81_e4_13k8b, 255, 0, 255, 0	@082125C4
	voice_directsound 60, 0, DirectSoundData_silence3_p17_e1l_13k8b, 255, 0, 255, 0	@082125D0
	voice_noise 60, 0, 0, 0, 0, 1, 0, 0	@082125DC
	voice_directsound 60, 0, DirectSoundData_forbraze1_e_p45_10k8b, 255, 0, 255, 0	@082125E8
	voice_directsound 60, 0, DirectSoundData_nosferatu1a_el_10k8b, 255, 0, 255, 0	@082125F4
	voice_directsound 60, 0, DirectSoundData_nosferatu1b_e_p45_10k8b, 255, 0, 255, 0	@08212600
	voice_directsound 60, 0, DirectSoundData_nosferatu1c_e_10k8b, 255, 0, 255, 0	@0821260C
	voice_directsound 60, 0, DirectSoundData_eclipse1a_e_10k8b, 255, 0, 255, 0	@08212618
	voice_directsound 60, 0, DirectSoundData_eclipse1b_e_10k8b, 255, 0, 255, 0	@08212624
	voice_directsound 60, 0, DirectSoundData_class1_up1_e_10k8b, 255, 0, 255, 0	@08212630
	voice_directsound 60, 0, DirectSoundData_class1_down1_e_10k8b, 255, 0, 255, 0	@0821263C
	voice_directsound 60, 0, DirectSoundData_class1_light1_el_10k8b, 255, 0, 255, 0	@08212648
	voice_directsound 60, 0, DirectSoundData_op_thunder1_m1_e_13k8b, 255, 0, 255, 0	@08212654
	voice_square_1 0, 2, 0, 0, 15, 0	@08212660
	voice_square_1 0, 2, 0, 0, 15, 0	@0821266C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212678
	voice_square_1 0, 2, 0, 0, 15, 0	@08212684
	voice_square_1 0, 2, 0, 0, 15, 0	@08212690
	voice_directsound 60, 0, DirectSoundData_elec1_e2_13k8b, 255, 0, 255, 89	@0821269C
	voice_directsound 60, 0, DirectSoundData_mistyrain2_e1l_10k8b, 255, 0, 255, 0	@082126A8
	voice_square_1 0, 2, 0, 0, 15, 0	@082126B4
	voice_directsound 60, 0, DirectSoundData_reserve_e_13k8b, 255, 0, 255, 0	@082126C0
	voice_square_1 0, 2, 0, 0, 15, 0	@082126CC
	voice_directsound 60, 0, DirectSoundData_purge1_2nd_e_13k8b, 255, 0, 255, 0	@082126D8
	voice_directsound 60, 0, DirectSoundData_recover1_e_13k8b, 255, 0, 255, 0	@082126E4
	voice_square_1 0, 2, 0, 0, 15, 0	@082126F0
	voice_square_1 0, 2, 0, 0, 15, 0	@082126FC
	voice_directsound 60, 0, DirectSoundData_thunder_storm1a_e_10k8b, 255, 0, 255, 0	@08212708
	voice_square_1 0, 2, 0, 0, 15, 0	@08212714
	voice_directsound 60, 0, DirectSoundData_sleep2a_e1_13k8b, 255, 0, 255, 0	@08212720
	voice_directsound 60, 0, DirectSoundData_sleep2b_e2_13k8b, 255, 0, 255, 0	@0821272C
	voice_directsound 60, 0, DirectSoundData_mshield3_e_13k8b, 255, 0, 255, 0	@08212738
	voice_directsound 60, 0, DirectSoundData_berserk4_e2l_p25_10k8b, 255, 0, 255, 0	@08212744
	voice_directsound 60, 0, DirectSoundData_rest2_e1l_p18_10k8b, 255, 0, 255, 0	@08212750
	voice_directsound 60, 0, DirectSoundData_live4_e1l_p25_10k8b, 255, 0, 255, 0	@0821275C
	voice_directsound 60, 0, DirectSoundData_ibreath2_el_10k8b, 255, 0, 255, 0	@08212768
	voice_square_1 0, 2, 0, 0, 15, 0	@08212774
	voice_directsound 60, 0, DirectSoundData_resire6_a_e_p26_10k8b, 255, 0, 255, 0	@08212780
	voice_directsound 60, 0, DirectSoundData_resire4_a_e_p45_10k8b, 255, 0, 255, 0	@0821278C
	voice_directsound 60, 0, DirectSoundData_resire4_b_e_p26_10k8b, 255, 0, 255, 0	@08212798
	voice_directsound 60, 0, DirectSoundData_light31_bf_e_p23_10k8b, 255, 0, 255, 0	@082127A4
	voice_directsound 60, 0, DirectSoundData_light31_af_e_p26_10k8b, 255, 0, 255, 0	@082127B0
	voice_directsound 60, 0, DirectSoundData_ice5_e_p26_13k8b, 255, 0, 255, 0	@082127BC
	voice_directsound 60, 0, DirectSoundData_dv_open1_e_p44_10k8b, 255, 0, 255, 0	@082127C8
	voice_directsound 60, 0, DirectSoundData_dv_hikari_e_p25_10k8b, 255, 0, 255, 0	@082127D4
	voice_directsound 60, 0, DirectSoundData_dv_hikari_e_p25_10k8b, 255, 0, 255, 0	@082127E0
	voice_directsound 60, 0, DirectSoundData_purge_l_s_e_p26_10k8b, 255, 0, 255, 0	@082127EC
	voice_square_1 0, 2, 0, 0, 15, 0	@082127F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08212804
	voice_directsound 60, 0, DirectSoundData_breath_magic1_e1_10k8b, 255, 0, 255, 0	@08212810
	voice_square_1 0, 2, 0, 0, 15, 0	@0821281C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212828
	voice_square_1 0, 2, 0, 0, 15, 0	@08212834
	voice_directsound 60, 0, DirectSoundData_thunder2_e5_10k8b, 255, 0, 255, 0	@08212840
	voice_directsound 60, 0, DirectSoundData_furu1_e_13k8b, 255, 0, 255, 0	@0821284C
	voice_directsound 60, 0, DirectSoundData_furu2_e1_13k8b, 255, 0, 255, 0	@08212858
	voice_directsound 60, 0, DirectSoundData_nosferatu1a_el_10k8b, 255, 0, 255, 0	@08212864
