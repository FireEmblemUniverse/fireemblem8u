// terrain image in battle animation as ground where units stand

#include "banim_data.h"

__attribute__((section(".data.banim_terrain_ptr_table")))
BattleAnimTerrain battle_terrain_table[] = {
	{"heichi1", battle_terrain_heichi1_tileset, battle_terrain_heichi1_pal, 0}, // 0
	{"arechi1", battle_terrain_arechi1_tileset, battle_terrain_arechi1_pal, 0}, // 1
	{"jyoumon1", battle_terrain_jyoumon1_tileset, battle_terrain_jyoumon1_pal, 0}, // 2
	{"bukiya1", battle_terrain_bukiya1_tileset, battle_terrain_bukiya1_pal, 0}, // 3
	{"gake1", battle_terrain_gake1_tileset, battle_terrain_gake1_pal, 0}, // 4
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal, 0}, // 5
	{"haikyo1", battle_terrain_haikyo1_tileset, battle_terrain_haikyo1_pal, 0}, // 6
	{"hanebashi1", battle_terrain_hanebashi1_tileset, battle_terrain_hanebashi1_pal, 0}, // 7
	{"hasi1", battle_terrain_hasi1_tileset, battle_terrain_hasi1_pal, 0}, // 8
	{"sabaku1", battle_terrain_sabaku1_tileset, battle_terrain_sabaku1_pal, 0}, // 9
	{"kawa1", battle_terrain_kawa1_tileset, battle_terrain_kawa1_pal, 0}, // 10
	{"mura1", battle_terrain_mura1_tileset, battle_terrain_mura1_pal, 0}, // 11
	{"umi1", battle_terrain_umi1_tileset, battle_terrain_umi1_pal, 0}, // 12
	{"mizuiumi1", battle_terrain_mizuiumi1_tileset, battle_terrain_mizuiumi1_pal, 0}, // 13
	{"azukarijo1", battle_terrain_azukarijo1_tileset, battle_terrain_azukarijo1_pal, 0}, // 14
	{"douguya1", battle_terrain_douguya1_tileset, battle_terrain_douguya1_pal, 0}, // 15
	{"fukaimori1", battle_terrain_fukaimori1_tileset, battle_terrain_fukaimori1_pal, 0}, // 16
	{"michi1", battle_terrain_michi1_tileset, battle_terrain_michi1_pal, 0}, // 17
	{"minka1", battle_terrain_minka1_tileset, battle_terrain_minka1_pal, 0}, // 18
	{"mori1", battle_terrain_mori1_tileset, battle_terrain_mori1_pal, 0}, // 19
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal, 0}, // 20
	{"sunachi1", battle_terrain_sunachi1_tileset, battle_terrain_sunachi1_pal, 0}, // 21
	{"takaiyama1", battle_terrain_takaiyama1_tileset, battle_terrain_takaiyama1_pal, 0}, // 22
	{"toride1", battle_terrain_toride1_tileset, battle_terrain_toride1_pal, 0}, // 23
	{"tougijou1", battle_terrain_tougijou1_tileset, battle_terrain_tougijou1_pal, 0}, // 24
	{"yama1", battle_terrain_yama1_tileset, battle_terrain_yama1_pal, 0}, // 25
	{"mahouyuka1", battle_terrain_mahouyuka1_tileset, battle_terrain_mahouyuka1_pal, 0}, // 26
	{"kabe1", battle_terrain_kabe1_tileset, battle_terrain_kabe1_pal, 0}, // 27
	{"kowaretakabe", battle_terrain_kowaretakabe_tileset, battle_terrain_kowaretakabe_pal, 0}, // 28
	{"kowaretakabe", battle_terrain_kowaretakabe_tileset_2, battle_terrain_kowaretakabe_pal_2, 0}, // 29
	{"hasira1", battle_terrain_hasira1_tileset, battle_terrain_hasira1_pal, 0}, // 30
	{"takarabako1", battle_terrain_takarabako1_tileset, battle_terrain_takarabako1_pal, 0}, // 31
	{"killerarechi", battle_terrain_killerarechi_tileset, battle_terrain_killerarechi_pal, 0}, // 32
	{"mon1", battle_terrain_mon1_tileset, battle_terrain_mon1_pal, 0}, // 33
	{"tuusintougi1", battle_terrain_tuusintougi1_tileset, battle_terrain_tuusintougi1_pal, 0}, // 34
	{"mura1", battle_terrain_mura1_tileset, battle_terrain_mura1_pal_2, 0}, // 35
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_2, 0}, // 36
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_2, 0}, // 37
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_2, 0}, // 38
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_2, 0}, // 39
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_2, 0}, // 40
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_2, 0}, // 41
	{"takarabako1", battle_terrain_takarabako1_tileset, battle_terrain_takarabako1_pal_2, 0}, // 42
	{"kowaretakabe", battle_terrain_kowaretakabe_tileset_2, battle_terrain_kowaretakabe_pal_3, 0}, // 43
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_2, 0}, // 44
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_2, 0}, // 45
	{"heichi1", battle_terrain_heichi1_tileset, battle_terrain_heichi1_pal_2, 0}, // 46
	{"jyoumon1", battle_terrain_jyoumon1_tileset, battle_terrain_jyoumon1_pal_2, 0}, // 47
	{"bukiya1", battle_terrain_bukiya1_tileset, battle_terrain_bukiya1_pal_2, 0}, // 48
	{"gake1", battle_terrain_gake1_tileset, battle_terrain_gake1_pal_2, 0}, // 49
	{"haikyo1", battle_terrain_haikyo1_tileset, battle_terrain_haikyo1_pal_2, 0}, // 50
	{"hasi1", battle_terrain_hasi1_tileset, battle_terrain_hasi1_pal_2, 0}, // 51
	{"kawa1", battle_terrain_kawa1_tileset, battle_terrain_kawa1_pal_2, 0}, // 52
	{"mura1", battle_terrain_mura1_tileset, battle_terrain_mura1_pal_3, 0}, // 53
	{"mizuiumi1", battle_terrain_mizuiumi1_tileset, battle_terrain_mizuiumi1_pal_2, 0}, // 54
	{"douguya1", battle_terrain_douguya1_tileset, battle_terrain_douguya1_pal_2, 0}, // 55
	{"fukaimori1", battle_terrain_fukaimori1_tileset, battle_terrain_fukaimori1_pal_2, 0}, // 56
	{"michi1", battle_terrain_michi1_tileset, battle_terrain_michi1_pal_2, 0}, // 57
	{"minka1", battle_terrain_minka1_tileset, battle_terrain_minka1_pal_2, 0}, // 58
	{"mori1", battle_terrain_mori1_tileset, battle_terrain_mori1_pal_2, 0}, // 59
	{"takaiyama1", battle_terrain_takaiyama1_tileset, battle_terrain_takaiyama1_pal_2, 0}, // 60
	{"tougijou1", battle_terrain_tougijou1_tileset, battle_terrain_tougijou1_pal_2, 0}, // 61
	{"yama1", battle_terrain_yama1_tileset, battle_terrain_yama1_pal_2, 0}, // 62
	{"killerarechi", battle_terrain_killerarechi_tileset, battle_terrain_killerarechi_pal_2, 0}, // 63
	{"toride1", battle_terrain_toride1_tileset, battle_terrain_toride1_pal_2, 0}, // 64
	{"kawa1", battle_terrain_kawa1_tileset, battle_terrain_kawa1_pal_3, 0}, // 65
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_3, 0}, // 66
	{"takarabako1", battle_terrain_takarabako1_tileset, battle_terrain_takarabako1_pal_3, 0}, // 67
	{"kowaretakabe", battle_terrain_kowaretakabe_tileset_2, battle_terrain_kowaretakabe_pal_4, 0}, // 68
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_3, 0}, // 69
	{"hasira1", battle_terrain_hasira1_tileset, battle_terrain_hasira1_pal_2, 0}, // 70
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_2, 0}, // 71
	{"takarabako1", battle_terrain_takarabako1_tileset, battle_terrain_takarabako1_pal_2, 0}, // 72
	{"kowaretakabe", battle_terrain_kowaretakabe_tileset_2, battle_terrain_kowaretakabe_pal_3, 0}, // 73
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_2, 0}, // 74
	{"hasira1", battle_terrain_hasira1_tileset, battle_terrain_hasira1_pal_3, 0}, // 75
	{"heichi1", battle_terrain_heichi1_tileset, battle_terrain_heichi1_pal_3, 0}, // 76
	{"kawa1", battle_terrain_kawa1_tileset, battle_terrain_kawa1_pal_4, 0}, // 77
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_4, 0}, // 78
	{"takarabako1", battle_terrain_takarabako1_tileset, battle_terrain_takarabako1_pal_4, 0}, // 79
	{"kowaretakabe", battle_terrain_kowaretakabe_tileset_2, battle_terrain_kowaretakabe_pal_5, 0}, // 80
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_4, 0}, // 81
	{"hasira1", battle_terrain_hasira1_tileset, battle_terrain_hasira1_pal_4, 0}, // 82
	{"heichi1", battle_terrain_heichi1_tileset, battle_terrain_heichi1_pal_4, 0}, // 83
	{"kawa1", battle_terrain_kawa1_tileset, battle_terrain_kawa1_pal_5, 0}, // 84
	{"maruta1", battle_terrain_maruta1_tileset, battle_terrain_maruta1_pal, 0}, // 85
	{"hasi1", battle_terrain_hasi1_tileset, battle_terrain_hasi1_pal_3, 0}, // 86
	{"mura1", battle_terrain_mura1_tileset, battle_terrain_mura1_pal_4, 0}, // 87
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_5, 0}, // 88
	{"takarabako1", battle_terrain_takarabako1_tileset, battle_terrain_takarabako1_pal_5, 0}, // 89
	{"kowaretakabe", battle_terrain_kowaretakabe_tileset_2, battle_terrain_kowaretakabe_pal_6, 0}, // 90
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_5, 0}, // 91
	{"hasira1", battle_terrain_hasira1_tileset, battle_terrain_hasira1_pal_5, 0}, // 92
	{"heichi1", battle_terrain_heichi1_tileset, battle_terrain_heichi1_pal_5, 0}, // 93
	{"kawa1", battle_terrain_kawa1_tileset, battle_terrain_kawa1_pal_6, 0}, // 94
	{"gake1", battle_terrain_gake1_tileset, battle_terrain_gake1_pal_3, 0}, // 95
	{"siroyuka1", battle_terrain_siroyuka1_tileset, battle_terrain_siroyuka1_pal_6, 0}, // 96
	{"takarabako1", battle_terrain_takarabako1_tileset, battle_terrain_takarabako1_pal_6, 0}, // 97
	{"kowaretakabe", battle_terrain_kowaretakabe_tileset_2, battle_terrain_kowaretakabe_pal_7, 0}, // 98
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_6, 0}, // 99
	{"hasira1", battle_terrain_hasira1_tileset, battle_terrain_hasira1_pal_6, 0}, // 100
	{"heichi1", battle_terrain_heichi1_tileset, battle_terrain_heichi1_pal_6, 0}, // 101
	{"mori1", battle_terrain_mori1_tileset, battle_terrain_mori1_pal_3, 0}, // 102
	{"maruta1", battle_terrain_maruta1_tileset, battle_terrain_maruta1_pal_2, 0}, // 103
	{"fune1", battle_terrain_fune1_tileset, battle_terrain_fune1_pal, 0}, // 104
	{"mori1", battle_terrain_mori1_tileset, battle_terrain_mori1_pal_4, 0}, // 105
	{"umi1", battle_terrain_umi1_tileset, battle_terrain_umi1_pal_2, 0}, // 106
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_7, 0}, // 107
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_8, 0}, // 108
	{"kawa1", battle_terrain_kawa1_tileset, battle_terrain_kawa1_pal_7, 0}, // 109
	{"hasi1", battle_terrain_hasi1_tileset, battle_terrain_hasi1_pal_4, 0}, // 110
	{"gyokuza1", battle_terrain_gyokuza1_tileset, battle_terrain_gyokuza1_pal_9, 0}, // 111
	{"yama1", battle_terrain_yama1_tileset, battle_terrain_yama1_pal_3, 0}, // 112
	{"takaiyama1", battle_terrain_takaiyama1_tileset, battle_terrain_takaiyama1_pal_3, 0}, // 113
	{"mizuiumi1", battle_terrain_mizuiumi1_tileset, battle_terrain_mizuiumi1_pal_3, 0}, // 114
};

__attribute__((section(".data.banim_terrain_head")))
DataBlockHead banim_terrain_head = {
    sizeof(battle_terrain_table) / sizeof(battle_terrain_table[0]),
    // FIXME write the block size here rather than hardcoded value
    0x12F18
};
