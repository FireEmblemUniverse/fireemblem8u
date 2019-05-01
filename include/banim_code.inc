@ vim:ft=armv4

@ battle animation script code
@ by laqieer

@ end each mode, terminator
.macro banim_code_end_mode
    .word 0x80000000
.endm

@ 0x86 Command: load the tileset and oam data to combine each frame
.macro banim_code_frame duration, sheet_addr, frame_number, oam_offset
    .word 0x86000000 + (\frame_number << 16) + \duration, \sheet_addr, \oam_offset
.endm

@ XX 00 00 85 series
.macro banim_code_85 number
    .word 0x85000000 + \number
.endm

@ reference: "0x85 Command Usage.txt" in FEditor Doc

@ nop
.macro banim_code_nop
    .word 0x85000000
.endm

@ Start attack animation; should be followed by banim_oode_start_attack_2; should head "dodged attack" (melee that will miss)
.macro banim_code_start_attack_1
    .word 0x85000003
.endm

@ Start attack animation; should be preceeded by banim_code_start_attack_1
.macro banim_code_start_attack_2
    .word 0x85000007
.endm

@ Call spell associated with equipped weapon
.macro banim_code_call_spell_anim
    .word 0x85000005
.endm

@ Normal hit
.macro banim_code_hit_normal
    .word 0x8500001A
.endm

@ Critical hit 1
.macro banim_code_hit_critical_1
    .word 0x85000008
.endm

@ Critical hit 2
.macro banim_code_hit_critical_2
    .word 0x85000009
.endm

@ Critical hit 3
.macro banim_code_hit_critical_3
    .word 0x8500000A
.endm

@ Critical hit 4
.macro banim_code_hit_critical_4
    .word 0x8500000B
.endm

@ Critical hit 5
.macro banim_code_hit_critical_5
    .word 0x8500000C
.endm

@ Pauses the attacker, makes them flash white and makes the screen flash white. Essentially makes it look as though the attacker was hit, but without blue sparks
.macro banim_code_hit_fake
    .word 0x85000039
.endm

@ Show brief white flash animation
.macro banim_code_flash_white
    .word 0x85000051
.endm

@ Heavy vibration of screen
.macro banim_code_shake_screnn_heavily
    .word 0x85000014
.endm

@ Slight vibration of screen
.macro banim_code_shake_screnn_slightly
    .word 0x85000015
.endm

@ Prepare HP depletion routine; needed to animate return to standing frame after hit
.macro banim_code_prepare_hp_deplete
    .word 0x85000004
.endm

@ Wait for HP to deplete (freezes if no HP depletion is occurring/has occurred) (should be used even in missed attack) (should end standing animations)
.macro banim_code_wait_hp_deplete
    .word 0x85000001
.endm

@ Start of dodging frames (should go after standing frame and before dodging animation)
.macro banim_code_start_dodge
    .word 0x8500000E
.endm

@ Start of dodge toward background
.macro banim_code_dodge_to_back
    .word 0x85000002
.endm

@ Start of dodge toward the foreground
.macro banim_code_dodge_to_before
    .word 0x85000018
.endm

@ End of dodge animation (should have an banim_code_wait_hp_deplete before it and after a preceding banim_start_dodge) (should be used just before banim_code_end_mode and should end missed attack as well)
.macro banim_code_end_dodge
    .word 0x8500000D
.endm

@ Begin opponent's turn after hit
.macro banim_code_start_opposite_turn
    .word 0x85000006
.endm

@ ? (ranged attack - hand axe for Hector)
.macro banim_code_range_attack
    .word 0x85000013
.endm

@ Show fire (that envelopes Sealed Sword; contains all Sealed Sword fire frames) animation. Slashing frames missing in FE 7/8! 
.macro banim_code_effect_sealed_sword_fire
    .word 0x8500002C
.endm

@ ? (Assassin critical) (Lethality activator that is dependent on other commands?)
.macro banim_code_effect_instant_kill_1
    .word 0x8500002D
.endm

@ See command banim_code_effect_instant_kill_1
.macro banim_code_effect_instant_kill_2
    .word 0x85000052
.endm

@ Show sage's normal magic rune drawing animation
.macro banim_code_effect_magic_rune_normal
    .word 0x8500002E
.endm

@ Show sage's critical magic rune drawing animation
.macro banim_code_effect_magic_rune_critical
    .word 0x8500002F
.endm

@ Show Nergal's dark aura animation - FE 7 only!
.macro banim_code_effect_dark_aura
    .word 0x8500003D
.endm

@ Show dirt kicking (as from dashing forward) animation（リンロードのクリティカル時の砂煙） 
.macro banim_code_effect_dirt_kick
    .word 0x85000030
.endm

@ Show dirt wave (as from horse kicking forward from ground) animation
.macro banim_code_effect_dirt_wave
    .word 0x8500004E
.endm

@ Show small dirt wave moving forward animation (starts about mid screen)
.macro banim_code_effect_dirt_wave_small
    .word 0x85000031
.endm

@ Show medium sized dirt wave moving backward animation (starts from feet of attacker)
.macro banim_code_effect_dirt_wave_medium
    .word 0x85000032
.endm

@ ? (Nergal's critical uses this)
.macro banim_code_effect_last_boss_critical
    .word 0x85000050
.endm

@ hardcoded codes

@ Sword toss; VERY hardcoded (uses 32x32 at linear sheet index 0x1C from current sheet)
.macro banim_code_toss_sword
    .word 0x85000026
.endm

@ Shield toss; while this command is used for shield tossing, it is actually just a copy of banim_code_toss_shield
.macro banim_code_toss_shield
    .word 0x85000027
.endm

@ Show cape flowing animation; VERY hardcoded
.macro banim_code_cape_flowing
    .word 0x85000047
.endm

@ play sound (sound index is decimal and hardcoded) (some command play different sound when the unit is at the left ot right side, and sound_id_r = sound_id_l - 1 in most cases) (some commands play different sound when hit normal or hit critical, TODO: add their sound index)

@ Play bow pulling SFE
.macro banim_code_sound_209
    .word 0x85000019
.endm
.macro banim_code_sound_pull_bow
    .word 0x85000019
.endm

@ Play quick "heavy step" SFE
.macro banim_code_sound_step_heavy_quick
    .word 0x8500001B
.endm

@ Play light horse stepping SFE; pitch decreases（ナイトの足音？）
.macro banim_code_sound_step_light_horse_pitch_down
    .word 0x8500001C
.endm

@ Play light horse stepping SFE; pitch increases（ロードナイトの足音？）
.macro banim_code_sound_step_light_horse_pitch_up
    .word 0x8500001D
.endm

@ Similar to banim_code_sound_step_light_horse_pitch_up; a bit louder（ナイトの足音？）
.macro banim_code_sound_step_light_horse_pitch_up_loud
    .word 0x8500001E
.endm

@ Play hit SFE (sounds like Eliwood with sword's hit) (Will be normal hit sound during normal attack and critical hit sound during critical attack)
.macro banim_code_sound_hit_eliwood
    .word 0x8500001F
.endm

@ Play hit SFE (sounds like Knight Lord with sword's hit) (see previous note)
.macro banim_code_sound_hit_eliwood_promoted
    .word 0x85000021
.endm

@ Play hit SFE (sounds like Knight Lord with Durandal's hit) (see previous note)
.macro banim_code_sound_hit_eliwood_promoted_durandal
    .word 0x85000020
.endm

@ Play short sword swinging SFE（リンロードの剣を振る音）
.macro banim_code_sound_201
    .word 0x85000022
.endm
.macro banim_code_sound_sword_swing_short
    .word 0x85000022
.endm

@ Play shorter sword swinging SFE（剣を振る音　小さい）
.macro banim_code_sound_200
    .word 0x85000023
.endm
.macro banim_code_sound_sword_swing_shorter
    .word 0x85000023
.endm

@ Play sword slashing air SFE
.macro banim_code_sound_202
    .word 0x85000024
.endm
.macro banim_code_sound_sword_slash_air
    .word 0x85000024
.endm

@ Play wing flap SFE（ブンという音）
.macro banim_code_sound_611
    .word 0x85000025
.endm
.macro banim_code_sound_wing_flap
    .word 0x85000025
.endm

@ Play electrical charging SFE (Used by Shamans)
.macro banim_code_sound_246
    .word 0x85000028
.endm
.macro banim_code_sound_elec_charge
    .word 0x85000028
.endm

@ Play sound index 321
.macro banim_code_sound_321
    .word 0x85000029
.endm

@ Play sound index 322
.macro banim_code_sound_322
    .word 0x8500002A
.endm

@ Play armored unit "leaping" SFE（アーマー系の鎧音）
.macro banim_code_sound_615_614
    .word 0x8500002B
.endm
.macro banim_code_sound_armor_leap
    .word 0x8500002B
.endm

@ Play brigand critical screaming SFE（山賊クリティカル時の叫び声）
.macro banim_code_sound_231
    .word 0x85000033
.endm
.macro banim_code_sound_scream
    .word 0x85000033
.endm

@ Play heavy stepping SFE
.macro banim_code_sound_step_heavy
    .word 0x85000034
.endm

@ Play longer wing flapping SFE
.macro banim_code_sound_613_612
    .word 0x85000035
.endm
.macro banim_code_sound_wing_flap_long
    .word 0x85000035
.endm

@ Play sword unsheathing SFE（リンロードの剣を抜く音？）
.macro banim_code_sound_206
    .word 0x85000036
.endm
.macro banim_code_sound_sword_unsheath
    .word 0x85000036
.endm

@ Play sword clicking SFE（剣を鞘に入れる音？）
.macro banim_code_sound_207
    .word 0x85000037
.endm
.macro banim_code_sound_sword_click
    .word 0x85000037
.endm

@ Play heavy spear spinning SFE（槍を回す音）
.macro banim_code_sound_203
    .word 0x85000038
.endm
.macro banim_code_sound_sword_spear_spin_heavy
    .word 0x85000038
.endm

@ Play dancer magic release SFE（踊り子の音）
.macro banim_code_sound_723
    .word 0x8500003A
.endm
.macro banim_code_sound_dance
    .word 0x8500003A
.endm

@ Play bard song SFE（バードの笛の音）
.macro banim_code_sound_724
    .word 0x8500003B
.endm
.macro banim_code_sound_sing
    .word 0x8500003B
.endm

@ Play sword "whooshing" SFE (done by Nomads; sounds like wing flap)（剣を振る音？）
.macro banim_code_sound_611_610
    .word 0x8500003C
.endm
.macro banim_code_sound_whoosh
    .word 0x8500003C
.endm

@ Play burning SFE（炎の効果音　ロイ封印）
.macro banim_code_sound_241
    .word 0x8500003E
.endm
.macro banim_code_sound_burn
    .word 0x8500003E
.endm

@ Play alternate arrow firing SFE?（アーチ発射音）
.macro banim_code_sound_310
    .word 0x8500003F
.endm
.macro banim_code_sound_ballista
    .word 0x8500003F
.endm

@ Play electric beebee
.macro banim_code_sound_279
    .word 0x85000040
.endm
.macro banim_code_sound_elec_bee
    .word 0x85000040
.endm

@ Play short axe swinging SFE
.macro banim_code_sound_235
    .word 0x85000041
.endm
.macro banim_code_sound_axe_swing_short
    .word 0x85000041
.endm

@ Play long axe swinging SFE
.macro banim_code_sound_234
    .word 0x85000042
.endm
.macro banim_code_sound_axe_swing_long
    .word 0x85000042
.endm

@ Play weapon stance SFE (Clicking noise)（辺を鞘に入れる音　カチ）
.macro banim_code_sound_719
    .word 0x85000043
.endm
.macro banim_code_sound_weapon_stance
    .word 0x85000043
.endm

@ Play short "light emission" SFE (I seriously don't know a better way to describe this)（エリウッドクリティカル時の剣が光る音）
.macro banim_code_sound_720
    .word 0x85000044
.endm
.macro banim_code_sound_light_emit
    .word 0x85000044
.endm

@ Play horse neighing SFE（ロードナイト馬のいななき）
.macro banim_code_sound_721
    .word 0x85000045
.endm
.macro banim_code_sound_horse_neigh
    .word 0x85000045
.endm

@ Play dropped axe crashing onto ground SFE
.macro banim_code_sound_722
    .word 0x85000046
.endm
.macro banim_code_sound_axe_drop_ground
    .word 0x85000046
.endm

@ Play sound index 237. Bird sings with bard.
.macro banim_code_sound_237
    .word 0x85000048
.endm
.macro banim_code_sound_bird
    .word 0x85000048
.endm

@ Play sage's magic firing SFE（賢者　魔法効果音）
.macro banim_code_sound_309
    .word 0x85000049
.endm
.macro banim_code_sound_magic_sage
    .word 0x85000049
.endm

@ Play valkyrie's magic charging SFE (Pretty much the same as the shaman's)（ヴァルキュリア攻撃効果音）
.macro banim_code_sound_308
    .word 0x8500004A
.endm
.macro banim_code_sound_magic_valkyrie
    .word 0x8500004A
.endm

@ Play monk's magic casting SFE（修道士　効果音）
.macro banim_code_sound_733
    .word 0x8500004B
.endm
.macro banim_code_sound_magic_monk
    .word 0x8500004B
.endm

@ Play Athos' magic casting SFE（アトス　効果音）
.macro banim_code_sound_734
    .word 0x8500004C
.endm
.macro banim_code_sound_magic_archsage
    .word 0x8500004C
.endm

@ Play Athos' critical glint SFE（アトス　クリティカル効果音）
.macro banim_code_sound_735
    .word 0x8500004D
.endm
.macro banim_code_sound_glint_archsage
    .word 0x8500004D
.endm

@ Play druid critical charging SFE（ドイルド　クリティカル効果音）
.macro banim_code_sound_759
    .word 0x8500004F
.endm
.macro banim_code_sound_magic_druid_critical
    .word 0x8500004F
.endm

@ ? (Nergal's critical uses this)
.macro banim_code_sound_744
    .word 0x85000050
.endm
.macro banim_code_sound_magic_darkdruid_critical
    .word 0x85000050
.endm

@ 聖魔の場合は以降魔物の効果音とか

@ バールっぽいSFE
.macro banim_code_sound_805
    .word 0x85000056
.endm
.macro banim_code_sound_bael_1
    .word 0x85000056
.endm

@ バールっぽいSFE
.macro banim_code_sound_806
    .word 0x85000057
.endm
.macro banim_code_sound_bael_2
    .word 0x85000057
.endm

@ ｼｭｶﾞｯSFE
.macro banim_code_sound_807
    .word 0x85000058
.endm
.macro banim_code_sound_bael_3
    .word 0x85000058
.endm

@ バール移動SFE
.macro banim_code_sound_bael_move
    .word 0x85000059
.endm

@ ｺﾞｩﾝSFE
.macro banim_code_sound_810
    .word 0x8500005A
.endm
.macro banim_code_sound_mauthedoog_1
    .word 0x8500005A
.endm

@ 重め風切りSFE
.macro banim_code_sound_811
    .word 0x8500005B
.endm
.macro banim_code_sound_mauthedoog_2
    .word 0x8500005B
.endm

@ 遠吠えSFE
.macro banim_code_sound_812
    .word 0x8500005C
.endm
.macro banim_code_sound_mauthedoog_scream
    .word 0x8500005C
.endm

@ ゾンビ足音SFE
.macro banim_code_sound_mauthedoog_3
    .word 0x8500005D
.endm

@ 掘削音SFE
.macro banim_code_sound_814
    .word 0x8500005E
.endm
.macro banim_code_sound_axe_gargoyle_scream
    .word 0x8500005E
.endm

@ ｷﾞｰSFE
.macro banim_code_sound_818
    .word 0x8500005F
.endm
.macro banim_code_sound_axe_gargoyle_1
    .word 0x8500005F
.endm

@ 38と4Dの中間みたいなふりまわすSFE
.macro banim_code_sound_951
    .word 0x85000060
.endm
.macro banim_code_sound_gorgon_1
    .word 0x85000060
.endm

@ 溜めるSFE
.macro banim_code_sound_815
    .word 0x85000061
.endm
.macro banim_code_sound_gorgon_2
    .word 0x85000061
.endm

@ 何かのSFE
.macro banim_code_sound_816
    .word 0x85000062
.endm
.macro banim_code_sound_gorgon_3
    .word 0x85000062
.endm

@ 鳴き声？SFE
.macro banim_code_sound_817
    .word 0x85000063
.endm
.macro banim_code_sound_gorgon_scream
    .word 0x85000063
.endm

@ Play sound index 800
.macro banim_code_sound_800
    .word 0x85000064
.endm
.macro banim_code_sound_revenant_1
    .word 0x85000064
.endm

@ 風切り音SFE
.macro banim_code_sound_801
    .word 0x85000065
.endm
.macro banim_code_sound_revenant_2
    .word 0x85000065
.endm

@ 足音っぽいSFE
.macro banim_code_sound_revenant_move
    .word 0x85000066
.endm

@ 骨の歩く音SFE
.macro banim_code_sound_bonewalker_move
    .word 0x85000067
.endm

@ くぐもった音SFE
.macro banim_code_sound_960
    .word 0x85000068
.endm
.macro banim_code_sound_mogall_blink
    .word 0x85000068
.endm

@ サイレスっぽくﾋﾟｺｰﾝと鳴るSFE
.macro banim_code_sound_962
    .word 0x8500006A
.endm
.macro banim_code_sound_magic_mogall
    .word 0x8500006A
.endm

@ ﾌﾞｩﾝSFE
.macro banim_code_sound_963
    .word 0x8500006B
.endm
.macro banim_code_sound_mogall_blink_critical
    .word 0x8500006B
.endm

@ ﾁﾛｰﾝSFE
.macro banim_code_sound_964
    .word 0x8500006C
.endm
.macro banim_code_sound_magical_mogall_critical
    .word 0x8500006C
.endm

@ 足音SFE
@ TODO a better name for this command
.macro banim_code_sound_C6D
    .word 0x8500006D
.endm

@ 似たような足音SFE
@ TODO a better name for this command
.macro banim_code_sound_C6E
    .word 0x8500006E
.endm

@ 似たような足音（大きめ）SFE
.macro banim_code_sound_axe_gargoyle_2
    .word 0x8500006F
.endm

@ これも足音SFE
@ TODO a better name for this command
.macro banim_code_sound_C70
    .word 0x85000070
.endm

@ かき氷を削るようなSFE
.macro banim_code_sound_802
    .word 0x85000073
.endm
.macro banim_code_sound_revenant_laugh
    .word 0x85000073
.endm

@ ｺﾁｯSFE
.macro banim_code_sound_893
    .word 0x85000074
.endm
.macro banim_code_sound_bonewalker_critical
    .word 0x85000074
.endm

@ 低い鳴き声SFE
.macro banim_code_sound_809
    .word 0x85000075
.endm
.macro banim_code_sound_mauthedoog_roar
    .word 0x85000075
.endm

@ 燃えるﾌﾞｫｫSFE
.macro banim_code_sound_890
    .word 0x85000076
.endm
.macro banim_code_sound_demon_king_1
    .word 0x85000076
.endm

@ ドラゴンゾンビの登場音？SFE
.macro banim_code_sound_891
    .word 0x85000077
.endm
.macro banim_code_sound_demon_king_scream
    .word 0x85000077
.endm

@ ｼﾞｼﾞｼﾞSFE
.macro banim_code_sound_740
    .word 0x85000078
.endm
.macro banim_code_sound_magic_dark_spell
    .word 0x85000078
.endm

@ ﾋﾟｺﾘﾝSFE
.macro banim_code_sound_892
    .word 0x85000079
.endm

@ ｼﾞｯSFE
.macro banim_code_sound_895
    .word 0x8500007A
.endm
.macro banim_code_sound_elec_jee
    .word 0x8500007A
.endm

@ ミルラクリティカルSFE
.macro banim_code_sound_222
    .word 0x8500007B
.endm
.macro banim_code_sound_manakete_critical
    .word 0x8500007B
.endm

@ TODO alias for sound after dumping all battle animation scipts

