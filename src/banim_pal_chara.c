// some characters have their own palette set for battle animation
// each set has 5 palettes: 
// player, enemy, npc, p4, independent

#include "banim_data.h"

__attribute__((section(".data.banim_pal_ptr_table")))
BattleAnimCharaPal character_battle_animation_palette_table[] = {
	{"mer", banim_pal_mer}, // 0
	{"ame", banim_pal_ame}, // 1
	{"gil", banim_pal_gil}, // 2
	{"bre", banim_pal_bre}, // 3
	{"saa", banim_pal_saa}, // 4
	{"mar", banim_pal_mar}, // 5
	{"com", banim_pal_com}, // 6
	{"jho", banim_pal_jho}, // 7
	{"bon", banim_pal_bon}, // 8
	{"baz", banim_pal_baz}, // 9
	{"ass", banim_pal_ass}, // 10
	{"nat", banim_pal_nat}, // 11
	{"mul", banim_pal_mul}, // 12
	{"irv", banim_pal_irv}, // 13
	{"ewa", banim_pal_ewa}, // 14
	{"gar", banim_pal_gar}, // 15
	{"ros", banim_pal_ros}, // 16
	{"xys", banim_pal_xys}, // 17
	{"doz", banim_pal_doz}, // 18
	{"ros", banim_pal_ros_2}, // 19
	{"tet", banim_pal_tet}, // 20
	{"cug", banim_pal_cug}, // 21
	{"cug", banim_pal_cug_2}, // 22
	{"gle", banim_pal_gle}, // 23
	{"kno", banim_pal_kno}, // 24
	{"ewa", banim_pal_ewa_2}, // 25
	{"tur", banim_pal_tur}, // 26
	{"van", banim_pal_van}, // 27
	{"syr", banim_pal_syr}, // 28
	{"gar", banim_pal_gar_2}, // 29
	{"ros", banim_pal_ros_3}, // 30
	{"one", banim_pal_one}, // 31
	{"xys", banim_pal_xys_2}, // 32
	{"mer", banim_pal_mer_2}, // 33
	{"ber", banim_pal_ber}, // 34
	{"ame", banim_pal_ame_2}, // 35
	{"gil", banim_pal_gil_2}, // 36
	{"vig", banim_pal_vig}, // 37
	{"tir", banim_pal_tir}, // 38
	{"for", banim_pal_for}, // 39
	{"fra", banim_pal_fra}, // 40
	{"gil", banim_pal_gil_3}, // 41
	{"kyl", banim_pal_kyl}, // 42
	{"ame", banim_pal_ame_3}, // 43
	{"dus", banim_pal_dus}, // 44
	{"aia", banim_pal_aia}, // 45
	{"lut", banim_pal_lut}, // 46
	{"ewa", banim_pal_ewa_3}, // 47
	{"xys", banim_pal_xys_3}, // 48
	{"zon", banim_pal_zon}, // 49
	{"ewa", banim_pal_ewa_4}, // 50
	{"lar", banim_pal_lar}, // 51
	{"lut", banim_pal_lut_2}, // 52
	{"cel", banim_pal_cel}, // 53
	{"ass", banim_pal_ass_2}, // 54
	{"jho", banim_pal_jho_2}, // 55
	{"mar", banim_pal_mar_2}, // 56
	{"ame", banim_pal_ame_4}, // 57
	{"for", banim_pal_for_2}, // 58
	{"set", banim_pal_set}, // 59
	{"fra", banim_pal_fra_2}, // 60
	{"kyl", banim_pal_kyl_2}, // 61
	{"ols", banim_pal_ols}, // 62
	{"van", banim_pal_van_2}, // 63
	{"tur", banim_pal_tur_2}, // 64
	{"ros", banim_pal_ros_4}, // 65
	{"nat", banim_pal_nat_2}, // 66
	{"com", banim_pal_com_2}, // 67
	{"mul", banim_pal_mul_2}, // 68
	{"ren", banim_pal_ren}, // 69
	{"lut", banim_pal_lut_3}, // 70
	{"ass", banim_pal_ass_3}, // 71
	{"ewa", banim_pal_ewa_5}, // 72
	{"kno", banim_pal_kno_2}, // 73
	{"mul", banim_pal_mul_3}, // 74
	{"sal", banim_pal_sal}, // 75
	{"ewa", banim_pal_ewa_6}, // 76
	{"kno", banim_pal_kno_3}, // 77
	{"nov", banim_pal_nov}, // 78
	{"ewa", banim_pal_ewa_7}, // 79
	{"kno", banim_pal_kno_4}, // 80
	{"hea", banim_pal_hea}, // 81
	{"mer", banim_pal_mer_3}, // 82
	{"ame", banim_pal_ame_5}, // 83
	{"fra", banim_pal_fra_3}, // 84
	{"kyl", banim_pal_kyl_3}, // 85
	{"for", banim_pal_for_3}, // 86
	{"mur", banim_pal_mur}, // 87
	{"ish", banim_pal_ish}, // 88
	{"hey", banim_pal_hey}, // 89
	{"fad", banim_pal_fad}, // 90
	{"jho", banim_pal_jho_3}, // 91
	{"mar", banim_pal_mar_3}, // 92
	{"com", banim_pal_com_3}, // 93
	{"car", banim_pal_car}, // 94
	{"lar", banim_pal_lar_2}, // 95
	{"nat", banim_pal_nat_3}, // 96
	{"lar", banim_pal_lar_3}, // 97
	{"gar", banim_pal_gar_3}, // 98
	{"ros", banim_pal_ros_5}, // 99
	{"bin", banim_pal_bin}, // 100
	{"tur", banim_pal_tur_3}, // 101
	{"van", banim_pal_van_3}, // 102
	{"cug", banim_pal_cug_3}, // 103
	{"wal", banim_pal_wal}, // 104
	{"geb", banim_pal_geb}, // 105
	{"pab", banim_pal_pab}, // 106
	{"cet", banim_pal_cet}, // 107
};

__attribute__((section(".data.banim_pal_head")))
DataBlockHead banim_pal_head = {
    sizeof(character_battle_animation_palette_table) / sizeof(character_battle_animation_palette_table)[0],
//    _banim_pal_end - _banim_pal_start
//    + 0x8000000
//    (int)_banim_pal_size
//    initializer element for `banim_pal_head.size' is not computable at load time
//    (int)_banim_pal_size & 0xFFFFFF
//    (int)(unsigned short)_banim_pal_size
//    FIXME update block size automatically, not hardcoded
    0x32E0
};
