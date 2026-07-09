# Dump Resources to Extract

Total: 1292 .incbin "dump/..." references

These are raw binary blobs extracted from `baserom.gba` that need to be
converted into proper game resource formats (`.png`, `.gbapal`, `.4bpp`, `.4bpp.lz`, etc.)

## Summary by Type

| Type | Count |
|------|-------|
| Unknown | 708 |
| Graphics (4bpp) | 226 |
| Tilemap | 194 |
| Palette | 148 |
| AnimSprite | 16 |

## Summary by Source File

| Source File | Count |
|------------|-------|
| `data/data_9A31F8.s` | 423 |
| `data/banim-ekrdragonfx.s` | 180 |
| `data/data_A3E4D4.s` | 140 |
| `data/data_59E8E0.s` | 68 |
| `data/data-ekrdk.s` | 59 |
| `data/data_A195B0.s` | 53 |
| `data/banim-efxlvupfx.s` | 52 |
| `data/data_A01CC4.s` | 43 |
| `data/data_5AA96C.s` | 40 |
| `data/data_A21658.s` | 39 |
| `data/data-banimmisc.s` | 31 |
| `data/data_5B65C0.s` | 19 |
| `data/data_A167C8.s` | 17 |
| `data/const_data_1C0AFC.s` | 16 |
| `data/banim-efxhitobj.s` | 16 |
| `data/data_99D6DC.s` | 16 |
| `data/data_A2EEF0.s` | 15 |
| `data/data_B12A60.s` | 15 |
| `data/data-ekrgauge.s` | 12 |
| `data/banim-efxbattle.s` | 8 |
| `data/data_AA6BFA.s` | 8 |
| `data/const_data_DB034.s` | 6 |
| `data/const_data_E162A.s` | 6 |
| `data/const_data_banimekrdk.s` | 2 |
| `data/trig_rodata.s` | 1 |
| `data/const_data_DAEF0.s` | 1 |
| `data/banim-efxlvupobj.s` | 1 |
| `data/data-ekrdragon.s` | 1 |
| `data/data_fe6sio.s` | 1 |
| `data/data_B1FE7C.s` | 1 |
| `data/data_FE0000.s` | 1 |
| `data/data_FFF000.s` | 1 |

## Full List

| # | ROM Offset | Size | Type | Label | Dump File | Source |
|---|-----------|------|------|-------|-----------|--------|
| 1 | 0xD751C | 640 | Unknown | `gSinLookup` | `dump/trig_rodata_0D751C.bin` | `data/trig_rodata.s:7` |
| 2 | 0xDAF60 | 152 | Unknown | `gUnknown_080DAF60` | `dump/const_data_DAEF0_0DAF60.bin` | `data/const_data_DAEF0.s:5` |
| 3 | 0xDB034 | 1284 | Graphics (4bpp) | `Img_080DB034` | `dump/const_data_DB034_0DB034.bin` | `data/const_data_DB034.s:5` |
| 4 | 0xDB538 | 1164 | Graphics (4bpp) | `Img_080DB538` | `dump/const_data_DB034_0DB538.bin` | `data/const_data_DB034.s:9` |
| 5 | 0xDB9C4 | 1112 | Graphics (4bpp) | `Img_080DB9C4` | `dump/const_data_DB034_0DB9C4.bin` | `data/const_data_DB034.s:13` |
| 6 | 0xDBE1C | 1332 | Graphics (4bpp) | `Img_080DBE1C` | `dump/const_data_DB034_0DBE1C.bin` | `data/const_data_DB034.s:17` |
| 7 | 0xDC350 | 1292 | Graphics (4bpp) | `Img_080DC350` | `dump/const_data_DB034_0DC350.bin` | `data/const_data_DB034.s:21` |
| 8 | 0xDC85C | 4 | Palette | `Pal_080DC85C` | `dump/const_data_DB034_0DC85C.bin` | `data/const_data_DB034.s:25` |
| 9 | 0xDFA2C | 5944 | Unknown | `(none)` | `dump/const_data_banimekrdk_0DFA2C.bin` | `data/const_data_banimekrdk.s:3` |
| 10 | 0xE1164 | 560 | Palette | `Pal_080E1164` | `dump/const_data_banimekrdk_0E1164.bin` | `data/const_data_banimekrdk.s:7` |
| 11 | 0xE3554 | 276 | Tilemap | `Tsa_EkrTriPegagusRightBG1` | `dump/const_data_E162A_0E3554.bin` | `data/const_data_E162A.s:17` |
| 12 | 0xE3668 | 292 | Tilemap | `Tsa_EkrTriPegagusRightBG2` | `dump/const_data_E162A_0E3668.bin` | `data/const_data_E162A.s:21` |
| 13 | 0xE378C | 216 | Tilemap | `Tsa_EkrTriPegagusRightBG3` | `dump/const_data_E162A_0E378C.bin` | `data/const_data_E162A.s:25` |
| 14 | 0xE3864 | 284 | Tilemap | `Tsa_EkrTriPegagusLeftBG1` | `dump/const_data_E162A_0E3864.bin` | `data/const_data_E162A.s:29` |
| 15 | 0xE3980 | 292 | Tilemap | `Tsa_EkrTriPegagusLeftBG2` | `dump/const_data_E162A_0E3980.bin` | `data/const_data_E162A.s:33` |
| 16 | 0xE3AA4 | 212 | Tilemap | `Tsa_EkrTriPegagusLeftBG3` | `dump/const_data_E162A_0E3AA4.bin` | `data/const_data_E162A.s:37` |
| 17 | 0x1C0AFC | 32 | Unknown | `gPal_StoneShatterAnim` | `dump/const_data_1C0AFC_1C0AFC.bin` | `data/const_data_1C0AFC.s:5` |
| 18 | 0x1C0B1C | 3556 | Unknown | `gImg_StoneShatterAnim` | `dump/const_data_1C0AFC_1C0B1C.bin` | `data/const_data_1C0AFC.s:9` |
| 19 | 0x1C1900 | 76 | Unknown | `gTsa_StoneShatter_081C1900` | `dump/const_data_1C0AFC_1C1900.bin` | `data/const_data_1C0AFC.s:13` |
| 20 | 0x1C194C | 76 | Unknown | `gTsa_StoneShatter_081C194C` | `dump/const_data_1C0AFC_1C194C.bin` | `data/const_data_1C0AFC.s:17` |
| 21 | 0x1C1998 | 76 | Unknown | `gTsa_StoneShatter_081C1998` | `dump/const_data_1C0AFC_1C1998.bin` | `data/const_data_1C0AFC.s:21` |
| 22 | 0x1C19E4 | 76 | Unknown | `gTsa_StoneShatter_081C19E4` | `dump/const_data_1C0AFC_1C19E4.bin` | `data/const_data_1C0AFC.s:25` |
| 23 | 0x1C1A30 | 76 | Unknown | `gTsa_StoneShatter_081C1A30` | `dump/const_data_1C0AFC_1C1A30.bin` | `data/const_data_1C0AFC.s:29` |
| 24 | 0x1C1A7C | 76 | Unknown | `gTsa_StoneShatter_081C1A7C` | `dump/const_data_1C0AFC_1C1A7C.bin` | `data/const_data_1C0AFC.s:33` |
| 25 | 0x1C1AC8 | 76 | Unknown | `gTsa_StoneShatter_081C1AC8` | `dump/const_data_1C0AFC_1C1AC8.bin` | `data/const_data_1C0AFC.s:37` |
| 26 | 0x1C1B14 | 76 | Unknown | `gTsa_StoneShatter_081C1B14` | `dump/const_data_1C0AFC_1C1B14.bin` | `data/const_data_1C0AFC.s:41` |
| 27 | 0x1C1B60 | 76 | Unknown | `gTsa_StoneShatter_081C1B60` | `dump/const_data_1C0AFC_1C1B60.bin` | `data/const_data_1C0AFC.s:45` |
| 28 | 0x1C1BAC | 76 | Unknown | `gTsa_StoneShatter_081C1BAC` | `dump/const_data_1C0AFC_1C1BAC.bin` | `data/const_data_1C0AFC.s:49` |
| 29 | 0x1C1BF8 | 76 | Unknown | `gTsa_StoneShatter_081C1BF8` | `dump/const_data_1C0AFC_1C1BF8.bin` | `data/const_data_1C0AFC.s:53` |
| 30 | 0x1C1C44 | 76 | Unknown | `gTsa_StoneShatter_081C1C44` | `dump/const_data_1C0AFC_1C1C44.bin` | `data/const_data_1C0AFC.s:57` |
| 31 | 0x1C1C90 | 76 | Unknown | `gTsa_StoneShatter_081C1C90` | `dump/const_data_1C0AFC_1C1C90.bin` | `data/const_data_1C0AFC.s:61` |
| 32 | 0x1C1CDC | 484 | Unknown | `gTsa_StoneShatter_081C1CDC` | `dump/const_data_1C0AFC_1C1CDC.bin` | `data/const_data_1C0AFC.s:65` |
| 33 | 0x59E8E0 | 1168 | Unknown | `gGfx_MiscUiGraphics` | `dump/data_59E8E0_59E8E0.bin` | `data/data_59E8E0.s:5` |
| 34 | 0x59ED70 | 64 | Unknown | `gPal_MiscUiGraphics` | `dump/data_59E8E0_59ED70.bin` | `data/data_59E8E0.s:9` |
| 35 | 0x59EDB0 | 60 | Unknown | `gImg_UiCursorHandTop` | `dump/data_59E8E0_59EDB0.bin` | `data/data_59E8E0.s:13` |
| 36 | 0x59EDEC | 52 | Unknown | `gImg_UiCursorHandBottom` | `dump/data_59E8E0_59EDEC.bin` | `data/data_59E8E0.s:17` |
| 37 | 0x59EEC0 | 32 | Unknown | `gPal_LightRune` | `dump/data_59E8E0_59EEC0.bin` | `data/data_59E8E0.s:41` |
| 38 | 0x59EEE0 | 32 | Unknown | `gPal_MapSpriteSepia` | `dump/data_59E8E0_59EEE0.bin` | `data/data_59E8E0.s:45` |
| 39 | 0x59EF00 | 32 | Palette | `Pal_Text` | `dump/data_59E8E0_59EF00.bin` | `data/data_59E8E0.s:49` |
| 40 | 0x59EF20 | 32 | Unknown | `gUnknown_0859EF20` | `dump/data_59E8E0_59EF20.bin` | `data/data_59E8E0.s:53` |
| 41 | 0x59EF40 | 32 | Palette | `Pal_HelpBox` | `dump/data_59E8E0_59EF40.bin` | `data/data_59E8E0.s:57` |
| 42 | 0x59EF60 | 32 | Unknown | `gPal_HelpTextBox` | `dump/data_59E8E0_59EF60.bin` | `data/data_59E8E0.s:61` |
| 43 | 0x59EF80 | 64 | Unknown | `gPal_YellowTextBox` | `dump/data_59E8E0_59EF80.bin` | `data/data_59E8E0.s:65` |
| 44 | 0x59EFC0 | 32 | Palette | `Pal_GreenTextColors` | `dump/data_59E8E0_59EFC0.bin` | `data/data_59E8E0.s:69` |
| 45 | 0x59EFE0 | 32 | Palette | `Pal_Text_Inverted` | `dump/data_59E8E0_59EFE0.bin` | `data/data_59E8E0.s:73` |
| 46 | 0x59F000 | 32 | Palette | `Pal_TalkBubble_Inverted` | `dump/data_59E8E0_59F000.bin` | `data/data_59E8E0.s:77` |
| 47 | 0x59F020 | 984 | Graphics (4bpp) | `Img_PhaseChangeUnk` | `dump/data_59E8E0_59F020.bin` | `data/data_59E8E0.s:81` |
| 48 | 0x59F3F8 | 1588 | Graphics (4bpp) | `Img_PhaseChangePlayer` | `dump/data_59E8E0_59F3F8.bin` | `data/data_59E8E0.s:85` |
| 49 | 0x59FA2C | 32 | Palette | `Pal_PhaseChangePlayer` | `dump/data_59E8E0_59FA2C.bin` | `data/data_59E8E0.s:89` |
| 50 | 0x59FA4C | 1564 | Graphics (4bpp) | `Img_PhaseChangeEnemy` | `dump/data_59E8E0_59FA4C.bin` | `data/data_59E8E0.s:93` |
| 51 | 0x5A0068 | 32 | Palette | `Pal_PhaseChangeEnemy` | `dump/data_59E8E0_5A0068.bin` | `data/data_59E8E0.s:97` |
| 52 | 0x5A0088 | 1552 | Graphics (4bpp) | `Img_PhaseChangeOther` | `dump/data_59E8E0_5A0088.bin` | `data/data_59E8E0.s:101` |
| 53 | 0x5A0698 | 32 | Palette | `Pal_PhaseChangeOther` | `dump/data_59E8E0_5A0698.bin` | `data/data_59E8E0.s:105` |
| 54 | 0x5A06B8 | 32 | Palette | `Pal_085A06B8` | `dump/data_59E8E0_5A06B8.bin` | `data/data_59E8E0.s:109` |
| 55 | 0x5A06D8 | 352 | Graphics (4bpp) | `Img_PhaseChangeSquares` | `dump/data_59E8E0_5A06D8.bin` | `data/data_59E8E0.s:113` |
| 56 | 0x5A0838 | 184 | Unknown | `gUnknown_085A0838` | `dump/data_59E8E0_5A0838.bin` | `data/data_59E8E0.s:117` |
| 57 | 0x5A08F0 | 184 | Unknown | `gUnknown_085A08F0` | `dump/data_59E8E0_5A08F0.bin` | `data/data_59E8E0.s:121` |
| 58 | 0x5A09A8 | 324 | Unknown | `gTSA_BattleForecastStandard` | `dump/data_59E8E0_5A09A8.bin` | `data/data_59E8E0.s:125` |
| 59 | 0x5A0AEC | 404 | Unknown | `gTSA_BattleForecastExtended` | `dump/data_59E8E0_5A0AEC.bin` | `data/data_59E8E0.s:129` |
| 60 | 0x5A0C80 | 172 | Unknown | `gBattleForecast_x2x4Gfx` | `dump/data_59E8E0_5A0C80.bin` | `data/data_59E8E0.s:133` |
| 61 | 0x5A0D2C | 32 | Unknown | `gBattleForecast_x2x4Pal` | `dump/data_59E8E0_5A0D2C.bin` | `data/data_59E8E0.s:137` |
| 62 | 0x5A0D4C | 340 | Unknown | `gUnknown_085A0D4C` | `dump/data_59E8E0_5A0D4C.bin` | `data/data_59E8E0.s:141` |
| 63 | 0x5A0EA0 | 344 | Unknown | `gUnknown_085A0EA0` | `dump/data_59E8E0_5A0EA0.bin` | `data/data_59E8E0.s:145` |
| 64 | 0x5A0FF8 | 676 | Unknown | `SpriteAnim_GasTrapVertical` | `dump/data_59E8E0_5A0FF8.bin` | `data/data_59E8E0.s:149` |
| 65 | 0x5A129C | 628 | Unknown | `SpriteAnim_GasTrapHorizontal` | `dump/data_59E8E0_5A129C.bin` | `data/data_59E8E0.s:153` |
| 66 | 0x5A1510 | 1512 | Graphics (4bpp) | `Img_GasTrapVertical` | `dump/data_59E8E0_5A1510.bin` | `data/data_59E8E0.s:157` |
| 67 | 0x5A1AF8 | 1396 | Graphics (4bpp) | `Img_GasTrapHorizontal` | `dump/data_59E8E0_5A1AF8.bin` | `data/data_59E8E0.s:161` |
| 68 | 0x5A206C | 32 | Palette | `Pal_GasTrap` | `dump/data_59E8E0_5A206C.bin` | `data/data_59E8E0.s:165` |
| 69 | 0x5A208C | 32 | Palette | `Pal_ArrowTrap` | `dump/data_59E8E0_5A208C.bin` | `data/data_59E8E0.s:169` |
| 70 | 0x5A20AC | 728 | Graphics (4bpp) | `Img_ArrowTrap` | `dump/data_59E8E0_5A20AC.bin` | `data/data_59E8E0.s:173` |
| 71 | 0x5A2384 | 1468 | Unknown | `SpriteAnim_ArrowTrap` | `dump/data_59E8E0_5A2384.bin` | `data/data_59E8E0.s:177` |
| 72 | 0x5A2940 | 1180 | Graphics (4bpp) | `Img_FireTrap` | `dump/data_59E8E0_5A2940.bin` | `data/data_59E8E0.s:181` |
| 73 | 0x5A2DDC | 32 | Palette | `Pal_FireTrap` | `dump/data_59E8E0_5A2DDC.bin` | `data/data_59E8E0.s:185` |
| 74 | 0x5A2DFC | 1684 | Unknown | `SpriteAnim_FireTrap` | `dump/data_59E8E0_5A2DFC.bin` | `data/data_59E8E0.s:189` |
| 75 | 0x5A3490 | 32 | Palette | `Pal_FireTrap2` | `dump/data_59E8E0_5A3490.bin` | `data/data_59E8E0.s:193` |
| 76 | 0x5A34B0 | 640 | Graphics (4bpp) | `Img_PikeTrap` | `dump/data_59E8E0_5A34B0.bin` | `data/data_59E8E0.s:197` |
| 77 | 0x5A3730 | 532 | Unknown | `SpriteAnim_PikeTrap` | `dump/data_59E8E0_5A3730.bin` | `data/data_59E8E0.s:201` |
| 78 | 0x5A3944 | 32 | Palette | `Pal_PikeTrap` | `dump/data_59E8E0_5A3944.bin` | `data/data_59E8E0.s:205` |
| 79 | 0x5A3964 | 136 | Unknown | `gUnknown_085A3964` | `dump/data_59E8E0_5A3964.bin` | `data/data_59E8E0.s:209` |
| 80 | 0x5A39EC | 152 | Unknown | `gUnknown_085A39EC` | `dump/data_59E8E0_5A39EC.bin` | `data/data_59E8E0.s:213` |
| 81 | 0x5A3A84 | 60 | Unknown | `gUnknown_085A3A84` | `dump/data_59E8E0_5A3A84.bin` | `data/data_59E8E0.s:217` |
| 82 | 0x5A3AC0 | 64 | Unknown | `gUnknown_085A3AC0` | `dump/data_59E8E0_5A3AC0.bin` | `data/data_59E8E0.s:221` |
| 83 | 0x5A3B00 | 1308 | Unknown | `gUnknown_085A3B00` | `dump/data_59E8E0_5A3B00.bin` | `data/data_59E8E0.s:225` |
| 84 | 0x5A401C | 32 | Unknown | `gUnknown_085A401C` | `dump/data_59E8E0_5A401C.bin` | `data/data_59E8E0.s:229` |
| 85 | 0x5A403C | 5924 | Graphics (4bpp) | `Img_LightRune` | `dump/data_59E8E0_5A403C.bin` | `data/data_59E8E0.s:233` |
| 86 | 0x5A5760 | 32 | Palette | `Pal_LightRune` | `dump/data_59E8E0_5A5760.bin` | `data/data_59E8E0.s:237` |
| 87 | 0x5A5780 | 736 | Tilemap | `Tsa_LightRune` | `dump/data_59E8E0_5A5780.bin` | `data/data_59E8E0.s:241` |
| 88 | 0x5A5A60 | 1864 | Graphics (4bpp) | `Img_EventWarp` | `dump/data_59E8E0_5A5A60.bin` | `data/data_59E8E0.s:245` |
| 89 | 0x5A61A8 | 32 | Palette | `Pal_EventWarp` | `dump/data_59E8E0_5A61A8.bin` | `data/data_59E8E0.s:249` |
| 90 | 0x5A61C8 | 452 | Tilemap | `Tsa_EventWarp` | `dump/data_59E8E0_5A61C8.bin` | `data/data_59E8E0.s:253` |
| 91 | 0x5A638C | 176 | Unknown | `gUnknown_085A638C` | `dump/data_59E8E0_5A638C.bin` | `data/data_59E8E0.s:257` |
| 92 | 0x5A643C | 64 | Unknown | `gUnknown_085A643C` | `dump/data_59E8E0_5A643C.bin` | `data/data_59E8E0.s:261` |
| 93 | 0x5A647C | 2052 | Tilemap | `Tsa_PlayerRankFog` | `dump/data_59E8E0_5A647C.bin` | `data/data_59E8E0.s:265` |
| 94 | 0x5A6C80 | 3556 | Graphics (4bpp) | `Img_DanceringFx` | `dump/data_59E8E0_5A6C80.bin` | `data/data_59E8E0.s:269` |
| 95 | 0x5A7A64 | 572 | Tilemap | `Tsa_DanceringFx` | `dump/data_59E8E0_5A7A64.bin` | `data/data_59E8E0.s:273` |
| 96 | 0x5A7CA0 | 32 | Palette | `Pal_DanceringFx` | `dump/data_59E8E0_5A7CA0.bin` | `data/data_59E8E0.s:277` |
| 97 | 0x5A7CC0 | 372 | Graphics (4bpp) | `Img_MineFx` | `dump/data_59E8E0_5A7CC0.bin` | `data/data_59E8E0.s:281` |
| 98 | 0x5A7E34 | 148 | Unknown | `SpritAnim_MineFx` | `dump/data_59E8E0_5A7E34.bin` | `data/data_59E8E0.s:285` |
| 99 | 0x5A7EC8 | 32 | Palette | `Pal_MineFx` | `dump/data_59E8E0_5A7EC8.bin` | `data/data_59E8E0.s:289` |
| 100 | 0x5A7EE8 | 32 | Palette | `Pal_EventCursorShinning` | `dump/data_59E8E0_5A7EE8.bin` | `data/data_59E8E0.s:293` |
| 101 | 0x5AAE0C | 1356 | Unknown | `gUnknown_085AAE0C` | `dump/data_5AA96C_5AAE0C.bin` | `data/data_5AA96C.s:5` |
| 102 | 0x5AB358 | 2576 | Graphics (4bpp) | `Img_LinkArenaMenu` | `dump/data_5AA96C_5AB358.bin` | `data/data_5AA96C.s:9` |
| 103 | 0x5ABD68 | 2204 | Graphics (4bpp) | `Img_TacticianSelObj` | `dump/data_5AA96C_5ABD68.bin` | `data/data_5AA96C.s:13` |
| 104 | 0x5AC604 | 984 | Unknown | `gUnknown_085AC604` | `dump/data_5AA96C_5AC604.bin` | `data/data_5AA96C.s:17` |
| 105 | 0x5AC9DC | 836 | Graphics (4bpp) | `Img_LinkArenaRankIcons` | `dump/data_5AA96C_5AC9DC.bin` | `data/data_5AA96C.s:21` |
| 106 | 0x5ACD20 | 476 | Graphics (4bpp) | `Img_LinkArenaActiveBannerFx` | `dump/data_5AA96C_5ACD20.bin` | `data/data_5AA96C.s:25` |
| 107 | 0x5ACEFC | 464 | Unknown | `gUnknown_085ACEFC` | `dump/data_5AA96C_5ACEFC.bin` | `data/data_5AA96C.s:29` |
| 108 | 0x5AD0CC | 1856 | Graphics (4bpp) | `Img_LinkArenaPlacementRanks` | `dump/data_5AA96C_5AD0CC.bin` | `data/data_5AA96C.s:33` |
| 109 | 0x5AD80C | 448 | Unknown | `gUnknown_085AD80C` | `dump/data_5AA96C_5AD80C.bin` | `data/data_5AA96C.s:37` |
| 110 | 0x5AD9CC | 108 | Unknown | `gUnknown_085AD9CC` | `dump/data_5AA96C_5AD9CC.bin` | `data/data_5AA96C.s:41` |
| 111 | 0x5ADA38 | 432 | Graphics (4bpp) | `Img_LinkArenaPlayerBanners` | `dump/data_5AA96C_5ADA38.bin` | `data/data_5AA96C.s:45` |
| 112 | 0x5ADBE8 | 96 | Palette | `Pal_LinkArenaMenu` | `dump/data_5AA96C_5ADBE8.bin` | `data/data_5AA96C.s:49` |
| 113 | 0x5ADC48 | 128 | Palette | `Pal_TacticianSelObj` | `dump/data_5AA96C_5ADC48.bin` | `data/data_5AA96C.s:53` |
| 114 | 0x5ADCC8 | 224 | Palette | `Pal_LinkArenaRankIcons` | `dump/data_5AA96C_5ADCC8.bin` | `data/data_5AA96C.s:57` |
| 115 | 0x5ADDA8 | 32 | Unknown | `gUnknown_085ADDA8` | `dump/data_5AA96C_5ADDA8.bin` | `data/data_5AA96C.s:61` |
| 116 | 0x5ADDC8 | 32 | Palette | `Pal_LinkArenaPlacementRanks` | `dump/data_5AA96C_5ADDC8.bin` | `data/data_5AA96C.s:65` |
| 117 | 0x5ADDE8 | 32 | Unknown | `gUnknown_085ADDE8` | `dump/data_5AA96C_5ADDE8.bin` | `data/data_5AA96C.s:69` |
| 118 | 0x5ADE08 | 32 | Palette | `Pal_LinkArenaActiveBannerFx` | `dump/data_5AA96C_5ADE08.bin` | `data/data_5AA96C.s:73` |
| 119 | 0x5ADE28 | 32 | Unknown | `gUnknown_085ADE28` | `dump/data_5AA96C_5ADE28.bin` | `data/data_5AA96C.s:77` |
| 120 | 0x5ADE48 | 32 | Unknown | `gUnknown_085ADE48` | `dump/data_5AA96C_5ADE48.bin` | `data/data_5AA96C.s:81` |
| 121 | 0x5ADE68 | 32 | Palette | `Pal_085ADE68` | `dump/data_5AA96C_5ADE68.bin` | `data/data_5AA96C.s:85` |
| 122 | 0x5ADE88 | 184 | Unknown | `gUnknown_085ADE88` | `dump/data_5AA96C_5ADE88.bin` | `data/data_5AA96C.s:89` |
| 123 | 0x5ADF40 | 592 | Unknown | `gUnknown_085ADF40` | `dump/data_5AA96C_5ADF40.bin` | `data/data_5AA96C.s:93` |
| 124 | 0x5AE190 | 724 | Tilemap | `Tsa_085AE190` | `dump/data_5AA96C_5AE190.bin` | `data/data_5AA96C.s:97` |
| 125 | 0x5AE464 | 788 | Tilemap | `Tsa_SioResultRankings` | `dump/data_5AA96C_5AE464.bin` | `data/data_5AA96C.s:101` |
| 126 | 0x5AE778 | 116 | Unknown | `gUnknown_085AE778` | `dump/data_5AA96C_5AE778.bin` | `data/data_5AA96C.s:105` |
| 127 | 0x5AE7EC | 1512 | Unknown | `gUnknown_085AE7EC` | `dump/data_5AA96C_5AE7EC.bin` | `data/data_5AA96C.s:109` |
| 128 | 0x5AEDD4 | 188 | Unknown | `gUnknown_085AEDD4` | `dump/data_5AA96C_5AEDD4.bin` | `data/data_5AA96C.s:113` |
| 129 | 0x5AEE90 | 196 | Unknown | `gUnknown_085AEE90` | `dump/data_5AA96C_5AEE90.bin` | `data/data_5AA96C.s:117` |
| 130 | 0x5AEF54 | 216 | Unknown | `gUnknown_085AEF54` | `dump/data_5AA96C_5AEF54.bin` | `data/data_5AA96C.s:121` |
| 131 | 0x5AF02C | 196 | Unknown | `gUnknown_085AF02C` | `dump/data_5AA96C_5AF02C.bin` | `data/data_5AA96C.s:125` |
| 132 | 0x5AF0F0 | 32 | Unknown | `gUnknown_085AF0F0` | `dump/data_5AA96C_5AF0F0.bin` | `data/data_5AA96C.s:129` |
| 133 | 0x5AF110 | 32 | Unknown | `gUnknown_085AF110` | `dump/data_5AA96C_5AF110.bin` | `data/data_5AA96C.s:133` |
| 134 | 0x5AF130 | 32 | Unknown | `gUnknown_085AF130` | `dump/data_5AA96C_5AF130.bin` | `data/data_5AA96C.s:137` |
| 135 | 0x5AF150 | 32 | Unknown | `gUnknown_085AF150` | `dump/data_5AA96C_5AF150.bin` | `data/data_5AA96C.s:141` |
| 136 | 0x5AF170 | 5804 | Graphics (4bpp) | `Img_LinkArenaPostBattleBg` | `dump/data_5AA96C_5AF170.bin` | `data/data_5AA96C.s:145` |
| 137 | 0x5B081C | 128 | Palette | `Pal_LinkArenaPostBattleBg` | `dump/data_5AA96C_5B081C.bin` | `data/data_5AA96C.s:149` |
| 138 | 0x5B089C | 1356 | Tilemap | `Tsa_LinkArenaPostBattleBg` | `dump/data_5AA96C_5B089C.bin` | `data/data_5AA96C.s:153` |
| 139 | 0x5B0DE8 | 324 | Unknown | `gUnknown_085B0DE8` | `dump/data_5AA96C_5B0DE8.bin` | `data/data_5AA96C.s:157` |
| 140 | 0x5B0F2C | 21764 | Unknown | `gUnknown_085B0F2C` | `dump/data_5AA96C_5B0F2C.bin` | `data/data_5AA96C.s:161` |
| 141 | 0x5B65C0 | 1524 | Unknown | `gUiFrameImage` | `dump/data_5B65C0_5B65C0.bin` | `data/data_5B65C0.s:7` |
| 142 | 0x5B6BB4 | 32 | Unknown | `gUiFramePaletteA` | `dump/data_5B65C0_5B6BB4.bin` | `data/data_5B65C0.s:11` |
| 143 | 0x5B6BD4 | 32 | Unknown | `gUiFramePaletteB` | `dump/data_5B65C0_5B6BD4.bin` | `data/data_5B65C0.s:15` |
| 144 | 0x5B6BF4 | 32 | Unknown | `gUiFramePaletteC` | `dump/data_5B65C0_5B6BF4.bin` | `data/data_5B65C0.s:19` |
| 145 | 0x5B6C14 | 160 | Unknown | `gUiFramePaletteD` | `dump/data_5B65C0_5B6C14.bin` | `data/data_5B65C0.s:23` |
| 146 | 0x5B6CB4 | 2220 | Unknown | `gLegacyUiFrameAImage` | `dump/data_5B65C0_5B6CB4.bin` | `data/data_5B65C0.s:27` |
| 147 | 0x5B7560 | 32 | Unknown | `gLegacyUiFrameAPalette` | `dump/data_5B65C0_5B7560.bin` | `data/data_5B65C0.s:31` |
| 148 | 0x5B7580 | 32 | Unknown | `gUiBarPaletteA` | `dump/data_5B65C0_5B7580.bin` | `data/data_5B65C0.s:35` |
| 149 | 0x5B75A0 | 2228 | Unknown | `gLegacyUiFrameBImage` | `dump/data_5B65C0_5B75A0.bin` | `data/data_5B65C0.s:39` |
| 150 | 0x5B7E54 | 32 | Unknown | `gLegacyUiFrameBPalette` | `dump/data_5B65C0_5B7E54.bin` | `data/data_5B65C0.s:43` |
| 151 | 0x5B7E74 | 32 | Unknown | `gUiBarPaletteB` | `dump/data_5B65C0_5B7E74.bin` | `data/data_5B65C0.s:47` |
| 152 | 0x5B7E94 | 2176 | Unknown | `gLegacyUiFrameCImage` | `dump/data_5B65C0_5B7E94.bin` | `data/data_5B65C0.s:51` |
| 153 | 0x5B8714 | 32 | Unknown | `gLegacyUiFrameCPalette` | `dump/data_5B65C0_5B8714.bin` | `data/data_5B65C0.s:55` |
| 154 | 0x5B8734 | 32 | Unknown | `gUiBarPaletteC` | `dump/data_5B65C0_5B8734.bin` | `data/data_5B65C0.s:59` |
| 155 | 0x5B8754 | 2108 | Unknown | `gLegacyUiFrameDImage` | `dump/data_5B65C0_5B8754.bin` | `data/data_5B65C0.s:63` |
| 156 | 0x5B8F90 | 32 | Unknown | `gLegacyUiFrameDPalette` | `dump/data_5B65C0_5B8F90.bin` | `data/data_5B65C0.s:67` |
| 157 | 0x5B8FB0 | 64 | Unknown | `gUiBarPaletteD` | `dump/data_5B65C0_5B8FB0.bin` | `data/data_5B65C0.s:71` |
| 158 | 0x5B8FF0 | 596 | Unknown | `gUnkUiFrameImage` | `dump/data_5B65C0_5B8FF0.bin` | `data/data_5B65C0.s:75` |
| 159 | 0x5B9244 | 128 | Unknown | `gUnkUiFramePalettes` | `dump/data_5B65C0_5B9244.bin` | `data/data_5B65C0.s:79` |
| 160 | 0x5B93D0 | 60 | Unknown | `gUnknown_085B93D0` | `dump/data-ekrgauge_5B93D0.bin` | `data/data-ekrgauge.s:7` |
| 161 | 0x5B940C | 24 | Unknown | `gUnknown_085B940C` | `dump/data-ekrgauge_5B940C.bin` | `data/data-ekrgauge.s:11` |
| 162 | 0x5B9424 | 120 | Unknown | `gUnknown_085B9424` | `dump/data-ekrgauge_5B9424.bin` | `data/data-ekrgauge.s:15` |
| 163 | 0x5B949C | 84 | Unknown | `gUnknown_085B949C` | `dump/data-ekrgauge_5B949C.bin` | `data/data-ekrgauge.s:19` |
| 164 | 0x5B94F0 | 84 | Unknown | `gUnknown_085B94F0` | `dump/data-ekrgauge_5B94F0.bin` | `data/data-ekrgauge.s:23` |
| 165 | 0x5B9544 | 24 | Unknown | `gUnknown_085B9544` | `dump/data-ekrgauge_5B9544.bin` | `data/data-ekrgauge.s:27` |
| 166 | 0x5B955C | 24 | Unknown | `gUnknown_085B955C` | `dump/data-ekrgauge_5B955C.bin` | `data/data-ekrgauge.s:31` |
| 167 | 0x5B9574 | 24 | Unknown | `gUnknown_085B9574` | `dump/data-ekrgauge_5B9574.bin` | `data/data-ekrgauge.s:35` |
| 168 | 0x5B958C | 24 | Unknown | `gUnknown_085B958C` | `dump/data-ekrgauge_5B958C.bin` | `data/data-ekrgauge.s:39` |
| 169 | 0x5B95A4 | 24 | Unknown | `gUnknown_085B95A4` | `dump/data-ekrgauge_5B95A4.bin` | `data/data-ekrgauge.s:43` |
| 170 | 0x5B95BC | 24 | Unknown | `gUnknown_085B95BC` | `dump/data-ekrgauge_5B95BC.bin` | `data/data-ekrgauge.s:47` |
| 171 | 0x5B95D4 | 24 | Unknown | `gUnknown_085B95D4` | `dump/data-ekrgauge_5B95D4.bin` | `data/data-ekrgauge.s:51` |
| 172 | 0x5B9E58 | 152 | Unknown | `TsaConf_BanimTmA1` | `dump/banim-efxbattle_5B9E58.bin` | `data/banim-efxbattle.s:5` |
| 173 | 0x5B9EF0 | 152 | Unknown | `TsaConf_BanimTmA2` | `dump/banim-efxbattle_5B9EF0.bin` | `data/banim-efxbattle.s:9` |
| 174 | 0x5B9F88 | 152 | Unknown | `TsaConf_BanimTmA3` | `dump/banim-efxbattle_5B9F88.bin` | `data/banim-efxbattle.s:13` |
| 175 | 0x5BA020 | 152 | Unknown | `TsaConf_BanimTmA4` | `dump/banim-efxbattle_5BA020.bin` | `data/banim-efxbattle.s:17` |
| 176 | 0x5BA0B8 | 552 | Graphics (4bpp) | `Img_NODAMGEMIS` | `dump/banim-efxbattle_5BA0B8.bin` | `data/banim-efxbattle.s:21` |
| 177 | 0x5BA2E0 | 32 | Palette | `Pal_085BA2E0` | `dump/banim-efxbattle_5BA2E0.bin` | `data/banim-efxbattle.s:25` |
| 178 | 0x5BA300 | 32 | Palette | `Pal_085BA300` | `dump/banim-efxbattle_5BA300.bin` | `data/banim-efxbattle.s:29` |
| 179 | 0x5BA320 | 32 | Palette | `Pal_085BA320` | `dump/banim-efxbattle_5BA320.bin` | `data/banim-efxbattle.s:33` |
| 180 | 0x5BB2FC | 3724 | Palette | `Pal_LvupApfx` | `dump/banim-efxlvupfx_5BB2FC.bin` | `data/banim-efxlvupfx.s:12` |
| 181 | 0x5BC188 | 9836 | Graphics (4bpp) | `Img_ArenaBattleBg` | `dump/banim-efxlvupfx_5BC188.bin` | `data/banim-efxlvupfx.s:16` |
| 182 | 0x5BE7F4 | 1952 | Tilemap | `Tsa_ArenaBattleBg` | `dump/banim-efxlvupfx_5BE7F4.bin` | `data/banim-efxlvupfx.s:20` |
| 183 | 0x5BEF94 | 128 | Palette | `Pal_ArenaBattleBg_A` | `dump/banim-efxlvupfx_5BEF94.bin` | `data/banim-efxlvupfx.s:24` |
| 184 | 0x5BF014 | 128 | Palette | `Pal_ArenaBattleBg_B` | `dump/banim-efxlvupfx_5BF014.bin` | `data/banim-efxlvupfx.s:28` |
| 185 | 0x5BF094 | 128 | Palette | `Pal_ArenaBattleBg_C` | `dump/banim-efxlvupfx_5BF094.bin` | `data/banim-efxlvupfx.s:32` |
| 186 | 0x5BF114 | 1524 | Palette | `Pal_ArenaBattleBg_C` | `dump/banim-efxlvupfx_5BF114.bin` | `data/banim-efxlvupfx.s:34` |
| 187 | 0x5BF708 | 3032 | Graphics (4bpp) | `Img1_EfxLvupBG` | `dump/banim-efxlvupfx_5BF708.bin` | `data/banim-efxlvupfx.s:38` |
| 188 | 0x5C02E0 | 3632 | Graphics (4bpp) | `Img2_EfxLvupBG` | `dump/banim-efxlvupfx_5C02E0.bin` | `data/banim-efxlvupfx.s:42` |
| 189 | 0x5C1110 | 3012 | Unknown | `Img3_EfxLvupBG` | `dump/banim-efxlvupfx_5C1110.bin` | `data/banim-efxlvupfx.s:46` |
| 190 | 0x5C1CD4 | 3136 | Unknown | `Img4_EfxLvupBG` | `dump/banim-efxlvupfx_5C1CD4.bin` | `data/banim-efxlvupfx.s:50` |
| 191 | 0x5C2914 | 3460 | Unknown | `Img5_EfxLvupBG` | `dump/banim-efxlvupfx_5C2914.bin` | `data/banim-efxlvupfx.s:54` |
| 192 | 0x5C3698 | 3332 | Unknown | `Img6_EfxLvupBG` | `dump/banim-efxlvupfx_5C3698.bin` | `data/banim-efxlvupfx.s:58` |
| 193 | 0x5C439C | 1296 | Unknown | `Img7_EfxLvupBG` | `dump/banim-efxlvupfx_5C439C.bin` | `data/banim-efxlvupfx.s:62` |
| 194 | 0x5C48AC | 32 | Palette | `Pal_EfxLvupBG` | `dump/banim-efxlvupfx_5C48AC.bin` | `data/banim-efxlvupfx.s:66` |
| 195 | 0x5C48CC | 352 | Unknown | `Tsa1_EfxLvupBG` | `dump/banim-efxlvupfx_5C48CC.bin` | `data/banim-efxlvupfx.s:70` |
| 196 | 0x5C4A2C | 372 | Unknown | `Tsa2_EfxLvupBG` | `dump/banim-efxlvupfx_5C4A2C.bin` | `data/banim-efxlvupfx.s:74` |
| 197 | 0x5C4BA0 | 404 | Unknown | `Tsa3_EfxLvupBG` | `dump/banim-efxlvupfx_5C4BA0.bin` | `data/banim-efxlvupfx.s:78` |
| 198 | 0x5C4D34 | 436 | Unknown | `Tsa4_EfxLvupBG` | `dump/banim-efxlvupfx_5C4D34.bin` | `data/banim-efxlvupfx.s:82` |
| 199 | 0x5C4EE8 | 472 | Unknown | `Tsa5_EfxLvupBG` | `dump/banim-efxlvupfx_5C4EE8.bin` | `data/banim-efxlvupfx.s:86` |
| 200 | 0x5C50C0 | 504 | Unknown | `Tsa6_EfxLvupBG` | `dump/banim-efxlvupfx_5C50C0.bin` | `data/banim-efxlvupfx.s:90` |
| 201 | 0x5C52B8 | 540 | Unknown | `Tsa7_EfxLvupBG` | `dump/banim-efxlvupfx_5C52B8.bin` | `data/banim-efxlvupfx.s:94` |
| 202 | 0x5C54D4 | 532 | Unknown | `Tsa8_EfxLvupBG` | `dump/banim-efxlvupfx_5C54D4.bin` | `data/banim-efxlvupfx.s:98` |
| 203 | 0x5C56E8 | 304 | Unknown | `Tsa9_EfxLvupBG` | `dump/banim-efxlvupfx_5C56E8.bin` | `data/banim-efxlvupfx.s:102` |
| 204 | 0x5C5818 | 200 | Unknown | `Tsa10_EfxLvupBG` | `dump/banim-efxlvupfx_5C5818.bin` | `data/banim-efxlvupfx.s:106` |
| 205 | 0x5C58E0 | 180 | Unknown | `Tsa11_EfxLvupBG` | `dump/banim-efxlvupfx_5C58E0.bin` | `data/banim-efxlvupfx.s:110` |
| 206 | 0x5C5994 | 1728 | Graphics (4bpp) | `Img_EfxLvupBG2` | `dump/banim-efxlvupfx_5C5994.bin` | `data/banim-efxlvupfx.s:114` |
| 207 | 0x5C6054 | 128 | Palette | `Pal_EfxLvupBG2` | `dump/banim-efxlvupfx_5C6054.bin` | `data/banim-efxlvupfx.s:118` |
| 208 | 0x5C60D4 | 32 | Palette | `Pal_EfxLvupBGCOL` | `dump/banim-efxlvupfx_5C60D4.bin` | `data/banim-efxlvupfx.s:122` |
| 209 | 0x5C60F4 | 228 | Unknown | `Tsa1_EfxLvupBG2` | `dump/banim-efxlvupfx_5C60F4.bin` | `data/banim-efxlvupfx.s:126` |
| 210 | 0x5C61D8 | 228 | Unknown | `Tsa2_EfxLvupBG2` | `dump/banim-efxlvupfx_5C61D8.bin` | `data/banim-efxlvupfx.s:130` |
| 211 | 0x5C62BC | 288 | Unknown | `Tsa3_EfxLvupBG2` | `dump/banim-efxlvupfx_5C62BC.bin` | `data/banim-efxlvupfx.s:134` |
| 212 | 0x5C63DC | 288 | Unknown | `Tsa4_EfxLvupBG2` | `dump/banim-efxlvupfx_5C63DC.bin` | `data/banim-efxlvupfx.s:138` |
| 213 | 0x5C64FC | 284 | Unknown | `Tsa5_EfxLvupBG2` | `dump/banim-efxlvupfx_5C64FC.bin` | `data/banim-efxlvupfx.s:142` |
| 214 | 0x5C6618 | 280 | Unknown | `Tsa6_EfxLvupBG2` | `dump/banim-efxlvupfx_5C6618.bin` | `data/banim-efxlvupfx.s:146` |
| 215 | 0x5C6730 | 664 | Graphics (4bpp) | `Img_EfxLvupOBJ2` | `dump/banim-efxlvupfx_5C6730.bin` | `data/banim-efxlvupfx.s:150` |
| 216 | 0x5C69C8 | 60 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C69C8` | `dump/banim-efxlvupfx_5C69C8.bin` | `data/banim-efxlvupfx.s:154` |
| 217 | 0x5C6A04 | 84 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6A04` | `dump/banim-efxlvupfx_5C6A04.bin` | `data/banim-efxlvupfx.s:158` |
| 218 | 0x5C6A58 | 108 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6A58` | `dump/banim-efxlvupfx_5C6A58.bin` | `data/banim-efxlvupfx.s:162` |
| 219 | 0x5C6AC4 | 132 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6AC4` | `dump/banim-efxlvupfx_5C6AC4.bin` | `data/banim-efxlvupfx.s:166` |
| 220 | 0x5C6B48 | 132 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6B48` | `dump/banim-efxlvupfx_5C6B48.bin` | `data/banim-efxlvupfx.s:170` |
| 221 | 0x5C6BCC | 144 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6BCC` | `dump/banim-efxlvupfx_5C6BCC.bin` | `data/banim-efxlvupfx.s:174` |
| 222 | 0x5C6C5C | 144 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6C5C` | `dump/banim-efxlvupfx_5C6C5C.bin` | `data/banim-efxlvupfx.s:178` |
| 223 | 0x5C6CEC | 132 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6CEC` | `dump/banim-efxlvupfx_5C6CEC.bin` | `data/banim-efxlvupfx.s:182` |
| 224 | 0x5C6D70 | 132 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6D70` | `dump/banim-efxlvupfx_5C6D70.bin` | `data/banim-efxlvupfx.s:186` |
| 225 | 0x5C6DF4 | 144 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6DF4` | `dump/banim-efxlvupfx_5C6DF4.bin` | `data/banim-efxlvupfx.s:190` |
| 226 | 0x5C6E84 | 144 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6E84` | `dump/banim-efxlvupfx_5C6E84.bin` | `data/banim-efxlvupfx.s:194` |
| 227 | 0x5C6F14 | 156 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6F14` | `dump/banim-efxlvupfx_5C6F14.bin` | `data/banim-efxlvupfx.s:198` |
| 228 | 0x5C6FB0 | 156 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C6FB0` | `dump/banim-efxlvupfx_5C6FB0.bin` | `data/banim-efxlvupfx.s:202` |
| 229 | 0x5C704C | 156 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C704C` | `dump/banim-efxlvupfx_5C704C.bin` | `data/banim-efxlvupfx.s:206` |
| 230 | 0x5C70E8 | 144 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C70E8` | `dump/banim-efxlvupfx_5C70E8.bin` | `data/banim-efxlvupfx.s:210` |
| 231 | 0x5C7178 | 108 | AnimSprite | `AnimSprite_EfxLvupOBJ2_085C7178` | `dump/banim-efxlvupfx_5C7178.bin` | `data/banim-efxlvupfx.s:214` |
| 232 | 0x5C8278 | 2048 | Graphics (4bpp) | `Img_EkrLvupNumBig` | `dump/banim-efxlvupobj_5C8278.bin` | `data/banim-efxlvupobj.s:7` |
| 233 | 0x5CFB70 | 3248 | Graphics (4bpp) | `Img_EfxPierceCriticalEffectBG` | `dump/banim-efxhitobj_5CFB70.bin` | `data/banim-efxhitobj.s:7` |
| 234 | 0x5D0820 | 512 | Palette | `Pal_EfxPierceCriticalEffectBG` | `dump/banim-efxhitobj_5D0820.bin` | `data/banim-efxhitobj.s:11` |
| 235 | 0x5D0A20 | 704 | Unknown | `TsaL_EfxPierceCriticalEffectBG` | `dump/banim-efxhitobj_5D0A20.bin` | `data/banim-efxhitobj.s:15` |
| 236 | 0x5D0CE0 | 752 | Unknown | `TsaR_EfxPierceCriticalEffectBG` | `dump/banim-efxhitobj_5D0CE0.bin` | `data/banim-efxhitobj.s:19` |
| 237 | 0x5D0FD0 | 1184 | Graphics (4bpp) | `Img_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D0FD0.bin` | `data/banim-efxhitobj.s:23` |
| 238 | 0x5D1470 | 32 | Palette | `Pal_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D1470.bin` | `data/banim-efxhitobj.s:27` |
| 239 | 0x5D1490 | 204 | Unknown | `Tsa1_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D1490.bin` | `data/banim-efxhitobj.s:31` |
| 240 | 0x5D155C | 268 | Unknown | `Tsa2_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D155C.bin` | `data/banim-efxhitobj.s:35` |
| 241 | 0x5D1668 | 296 | Unknown | `Tsa3_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D1668.bin` | `data/banim-efxhitobj.s:39` |
| 242 | 0x5D1790 | 292 | Unknown | `Tsa4_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D1790.bin` | `data/banim-efxhitobj.s:43` |
| 243 | 0x5D18B4 | 296 | Unknown | `Tsa5_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D18B4.bin` | `data/banim-efxhitobj.s:47` |
| 244 | 0x5D19DC | 288 | Unknown | `Tsa6_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D19DC.bin` | `data/banim-efxhitobj.s:51` |
| 245 | 0x5D1AFC | 256 | Unknown | `Tsa7_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D1AFC.bin` | `data/banim-efxhitobj.s:55` |
| 246 | 0x5D1BFC | 224 | Unknown | `Tsa8_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D1BFC.bin` | `data/banim-efxhitobj.s:59` |
| 247 | 0x5D1CDC | 196 | Unknown | `Tsa9_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D1CDC.bin` | `data/banim-efxhitobj.s:63` |
| 248 | 0x5D1DA0 | 152 | Unknown | `TsaA_EfxPierceNormalEffectBG` | `dump/banim-efxhitobj_5D1DA0.bin` | `data/banim-efxhitobj.s:67` |
| 249 | 0x758740 | 20 | Unknown | `gUnknown_08758740` | `dump/data-ekrdragon_758740.bin` | `data/data-ekrdragon.s:21` |
| 250 | 0x78D648 | 14656 | Graphics (4bpp) | `Img_EfxDracoZombie` | `dump/banim-ekrdragonfx_78D648.bin` | `data/banim-ekrdragonfx.s:7` |
| 251 | 0x790F88 | 468 | Tilemap | `Tsa_EfxDracoZombieBaseLeft` | `dump/banim-ekrdragonfx_790F88.bin` | `data/banim-ekrdragonfx.s:11` |
| 252 | 0x79115C | 480 | Tilemap | `Tsa_EfxDracoZombieBaseRight` | `dump/banim-ekrdragonfx_79115C.bin` | `data/banim-ekrdragonfx.s:15` |
| 253 | 0x79133C | 484 | Tilemap | `Tsa_EfxDracoZombie2` | `dump/banim-ekrdragonfx_79133C.bin` | `data/banim-ekrdragonfx.s:19` |
| 254 | 0x791520 | 536 | Tilemap | `Tsa_EfxDracoZombie3` | `dump/banim-ekrdragonfx_791520.bin` | `data/banim-ekrdragonfx.s:23` |
| 255 | 0x791738 | 528 | Tilemap | `Tsa_EfxDracoZombie4` | `dump/banim-ekrdragonfx_791738.bin` | `data/banim-ekrdragonfx.s:27` |
| 256 | 0x791948 | 500 | Tilemap | `Tsa_EfxDracoZombie5` | `dump/banim-ekrdragonfx_791948.bin` | `data/banim-ekrdragonfx.s:31` |
| 257 | 0x791B3C | 544 | Tilemap | `Tsa_EfxDracoZombie1` | `dump/banim-ekrdragonfx_791B3C.bin` | `data/banim-ekrdragonfx.s:35` |
| 258 | 0x791D5C | 32 | Palette | `Pal_EfxDracoZombie` | `dump/banim-ekrdragonfx_791D5C.bin` | `data/banim-ekrdragonfx.s:39` |
| 259 | 0x791D7C | 32 | Palette | `Pal_08791D7C` | `dump/banim-ekrdragonfx_791D7C.bin` | `data/banim-ekrdragonfx.s:43` |
| 260 | 0x791D9C | 1016 | Graphics (4bpp) | `Img_08791D9C` | `dump/banim-ekrdragonfx_791D9C.bin` | `data/banim-ekrdragonfx.s:47` |
| 261 | 0x792194 | 32 | Palette | `Pal_08792194` | `dump/banim-ekrdragonfx_792194.bin` | `data/banim-ekrdragonfx.s:51` |
| 262 | 0x7929B8 | 2324 | Graphics (4bpp) | `Img_87929B8` | `dump/banim-ekrdragonfx_7929B8.bin` | `data/banim-ekrdragonfx.s:352` |
| 263 | 0x7932CC | 32 | Palette | `Pal_87932CC` | `dump/banim-ekrdragonfx_7932CC.bin` | `data/banim-ekrdragonfx.s:356` |
| 264 | 0x7932EC | 152 | Tilemap | `Tsa_87932EC` | `dump/banim-ekrdragonfx_7932EC.bin` | `data/banim-ekrdragonfx.s:360` |
| 265 | 0x793384 | 272 | Tilemap | `Tsa_8793384` | `dump/banim-ekrdragonfx_793384.bin` | `data/banim-ekrdragonfx.s:364` |
| 266 | 0x793494 | 284 | Tilemap | `Tsa_8793494` | `dump/banim-ekrdragonfx_793494.bin` | `data/banim-ekrdragonfx.s:368` |
| 267 | 0x7935B0 | 272 | Tilemap | `Tsa_87935B0` | `dump/banim-ekrdragonfx_7935B0.bin` | `data/banim-ekrdragonfx.s:372` |
| 268 | 0x7936C0 | 272 | Tilemap | `Tsa_87936C0` | `dump/banim-ekrdragonfx_7936C0.bin` | `data/banim-ekrdragonfx.s:376` |
| 269 | 0x7937D0 | 284 | Tilemap | `Tsa_87937D0` | `dump/banim-ekrdragonfx_7937D0.bin` | `data/banim-ekrdragonfx.s:380` |
| 270 | 0x7938EC | 272 | Tilemap | `Tsa_87938EC` | `dump/banim-ekrdragonfx_7938EC.bin` | `data/banim-ekrdragonfx.s:384` |
| 271 | 0x7939FC | 3116 | Graphics (4bpp) | `Img_87939FC` | `dump/banim-ekrdragonfx_7939FC.bin` | `data/banim-ekrdragonfx.s:388` |
| 272 | 0x794628 | 2992 | Graphics (4bpp) | `Img_8794628` | `dump/banim-ekrdragonfx_794628.bin` | `data/banim-ekrdragonfx.s:392` |
| 273 | 0x7951D8 | 3100 | Graphics (4bpp) | `Img_87951D8` | `dump/banim-ekrdragonfx_7951D8.bin` | `data/banim-ekrdragonfx.s:396` |
| 274 | 0x795DF4 | 3072 | Graphics (4bpp) | `Img_8795DF4` | `dump/banim-ekrdragonfx_795DF4.bin` | `data/banim-ekrdragonfx.s:400` |
| 275 | 0x7969F4 | 1768 | Graphics (4bpp) | `Img_87969F4` | `dump/banim-ekrdragonfx_7969F4.bin` | `data/banim-ekrdragonfx.s:404` |
| 276 | 0x7970DC | 2536 | Graphics (4bpp) | `Img_87970DC` | `dump/banim-ekrdragonfx_7970DC.bin` | `data/banim-ekrdragonfx.s:408` |
| 277 | 0x797AC4 | 2256 | Graphics (4bpp) | `Img_8797AC4` | `dump/banim-ekrdragonfx_797AC4.bin` | `data/banim-ekrdragonfx.s:412` |
| 278 | 0x798394 | 2008 | Graphics (4bpp) | `Img_8798394` | `dump/banim-ekrdragonfx_798394.bin` | `data/banim-ekrdragonfx.s:416` |
| 279 | 0x798B6C | 1724 | Graphics (4bpp) | `Img_8798B6C` | `dump/banim-ekrdragonfx_798B6C.bin` | `data/banim-ekrdragonfx.s:420` |
| 280 | 0x799228 | 1488 | Graphics (4bpp) | `Img_8799228` | `dump/banim-ekrdragonfx_799228.bin` | `data/banim-ekrdragonfx.s:424` |
| 281 | 0x7997F8 | 32 | Palette | `Pal_87997F8` | `dump/banim-ekrdragonfx_7997F8.bin` | `data/banim-ekrdragonfx.s:428` |
| 282 | 0x799818 | 676 | Tilemap | `Tsa_8799818` | `dump/banim-ekrdragonfx_799818.bin` | `data/banim-ekrdragonfx.s:432` |
| 283 | 0x799ABC | 680 | Tilemap | `Tsa_8799ABC` | `dump/banim-ekrdragonfx_799ABC.bin` | `data/banim-ekrdragonfx.s:436` |
| 284 | 0x799D64 | 676 | Tilemap | `Tsa_8799D64` | `dump/banim-ekrdragonfx_799D64.bin` | `data/banim-ekrdragonfx.s:440` |
| 285 | 0x79A008 | 672 | Tilemap | `Tsa_879A008` | `dump/banim-ekrdragonfx_79A008.bin` | `data/banim-ekrdragonfx.s:444` |
| 286 | 0x79A2A8 | 412 | Tilemap | `Tsa_879A2A8` | `dump/banim-ekrdragonfx_79A2A8.bin` | `data/banim-ekrdragonfx.s:448` |
| 287 | 0x79A444 | 604 | Tilemap | `Tsa_879A444` | `dump/banim-ekrdragonfx_79A444.bin` | `data/banim-ekrdragonfx.s:452` |
| 288 | 0x79A6A0 | 476 | Tilemap | `Tsa_879A6A0` | `dump/banim-ekrdragonfx_79A6A0.bin` | `data/banim-ekrdragonfx.s:456` |
| 289 | 0x79A87C | 364 | Tilemap | `Tsa_879A87C` | `dump/banim-ekrdragonfx_79A87C.bin` | `data/banim-ekrdragonfx.s:460` |
| 290 | 0x79A9E8 | 296 | Tilemap | `Tsa_879A9E8` | `dump/banim-ekrdragonfx_79A9E8.bin` | `data/banim-ekrdragonfx.s:464` |
| 291 | 0x79AB10 | 248 | Tilemap | `Tsa_879AB10` | `dump/banim-ekrdragonfx_79AB10.bin` | `data/banim-ekrdragonfx.s:468` |
| 292 | 0x79AC08 | 1376 | Graphics (4bpp) | `Img_879AC08` | `dump/banim-ekrdragonfx_79AC08.bin` | `data/banim-ekrdragonfx.s:472` |
| 293 | 0x79B168 | 1932 | Graphics (4bpp) | `Img_879B168` | `dump/banim-ekrdragonfx_79B168.bin` | `data/banim-ekrdragonfx.s:476` |
| 294 | 0x79B8F4 | 2288 | Graphics (4bpp) | `Img_879B8F4` | `dump/banim-ekrdragonfx_79B8F4.bin` | `data/banim-ekrdragonfx.s:480` |
| 295 | 0x79C1E4 | 2256 | Graphics (4bpp) | `Img_879C1E4` | `dump/banim-ekrdragonfx_79C1E4.bin` | `data/banim-ekrdragonfx.s:484` |
| 296 | 0x79CAB4 | 1860 | Graphics (4bpp) | `Img_879CAB4` | `dump/banim-ekrdragonfx_79CAB4.bin` | `data/banim-ekrdragonfx.s:488` |
| 297 | 0x79D1F8 | 2584 | Graphics (4bpp) | `Img_879D1F8` | `dump/banim-ekrdragonfx_79D1F8.bin` | `data/banim-ekrdragonfx.s:492` |
| 298 | 0x79DC10 | 2508 | Graphics (4bpp) | `Img_879DC10` | `dump/banim-ekrdragonfx_79DC10.bin` | `data/banim-ekrdragonfx.s:496` |
| 299 | 0x79E5DC | 2292 | Graphics (4bpp) | `Img_879E5DC` | `dump/banim-ekrdragonfx_79E5DC.bin` | `data/banim-ekrdragonfx.s:500` |
| 300 | 0x79EED0 | 1992 | Graphics (4bpp) | `Img_879EED0` | `dump/banim-ekrdragonfx_79EED0.bin` | `data/banim-ekrdragonfx.s:504` |
| 301 | 0x79F698 | 1700 | Graphics (4bpp) | `Img_879F698` | `dump/banim-ekrdragonfx_79F698.bin` | `data/banim-ekrdragonfx.s:508` |
| 302 | 0x79FD3C | 1532 | Graphics (4bpp) | `Img_879FD3C` | `dump/banim-ekrdragonfx_79FD3C.bin` | `data/banim-ekrdragonfx.s:512` |
| 303 | 0x7A0338 | 1492 | Graphics (4bpp) | `Img_87A0338` | `dump/banim-ekrdragonfx_7A0338.bin` | `data/banim-ekrdragonfx.s:516` |
| 304 | 0x7A090C | 1388 | Graphics (4bpp) | `Img_87A090C` | `dump/banim-ekrdragonfx_7A090C.bin` | `data/banim-ekrdragonfx.s:520` |
| 305 | 0x7A0E78 | 1352 | Graphics (4bpp) | `Img_87A0E78` | `dump/banim-ekrdragonfx_7A0E78.bin` | `data/banim-ekrdragonfx.s:524` |
| 306 | 0x7A13C0 | 1296 | Graphics (4bpp) | `Img_87A13C0` | `dump/banim-ekrdragonfx_7A13C0.bin` | `data/banim-ekrdragonfx.s:528` |
| 307 | 0x7A18D0 | 32 | Palette | `Pal_87A18D0` | `dump/banim-ekrdragonfx_7A18D0.bin` | `data/banim-ekrdragonfx.s:532` |
| 308 | 0x7A18F0 | 252 | Tilemap | `Tsa_87A18F0` | `dump/banim-ekrdragonfx_7A18F0.bin` | `data/banim-ekrdragonfx.s:536` |
| 309 | 0x7A19EC | 380 | Tilemap | `Tsa_87A19EC` | `dump/banim-ekrdragonfx_7A19EC.bin` | `data/banim-ekrdragonfx.s:540` |
| 310 | 0x7A1B68 | 524 | Tilemap | `Tsa_87A1B68` | `dump/banim-ekrdragonfx_7A1B68.bin` | `data/banim-ekrdragonfx.s:544` |
| 311 | 0x7A1D74 | 552 | Tilemap | `Tsa_87A1D74` | `dump/banim-ekrdragonfx_7A1D74.bin` | `data/banim-ekrdragonfx.s:548` |
| 312 | 0x7A1F9C | 408 | Tilemap | `Tsa_87A1F9C` | `dump/banim-ekrdragonfx_7A1F9C.bin` | `data/banim-ekrdragonfx.s:552` |
| 313 | 0x7A2134 | 592 | Tilemap | `Tsa_87A2134` | `dump/banim-ekrdragonfx_7A2134.bin` | `data/banim-ekrdragonfx.s:556` |
| 314 | 0x7A2384 | 512 | Tilemap | `Tsa_87A2384` | `dump/banim-ekrdragonfx_7A2384.bin` | `data/banim-ekrdragonfx.s:560` |
| 315 | 0x7A2584 | 452 | Tilemap | `Tsa_87A2584` | `dump/banim-ekrdragonfx_7A2584.bin` | `data/banim-ekrdragonfx.s:564` |
| 316 | 0x7A2748 | 352 | Tilemap | `Tsa_87A2748` | `dump/banim-ekrdragonfx_7A2748.bin` | `data/banim-ekrdragonfx.s:568` |
| 317 | 0x7A28A8 | 308 | Tilemap | `Tsa_87A28A8` | `dump/banim-ekrdragonfx_7A28A8.bin` | `data/banim-ekrdragonfx.s:572` |
| 318 | 0x7A29DC | 268 | Tilemap | `Tsa_87A29DC` | `dump/banim-ekrdragonfx_7A29DC.bin` | `data/banim-ekrdragonfx.s:576` |
| 319 | 0x7A2AE8 | 252 | Tilemap | `Tsa_87A2AE8` | `dump/banim-ekrdragonfx_7A2AE8.bin` | `data/banim-ekrdragonfx.s:580` |
| 320 | 0x7A2BE4 | 232 | Tilemap | `Tsa_87A2BE4` | `dump/banim-ekrdragonfx_7A2BE4.bin` | `data/banim-ekrdragonfx.s:584` |
| 321 | 0x7A2CCC | 236 | Tilemap | `Tsa_87A2CCC` | `dump/banim-ekrdragonfx_7A2CCC.bin` | `data/banim-ekrdragonfx.s:588` |
| 322 | 0x7A2DB8 | 232 | Tilemap | `Tsa_87A2DB8` | `dump/banim-ekrdragonfx_7A2DB8.bin` | `data/banim-ekrdragonfx.s:592` |
| 323 | 0x7A2EA0 | 1376 | Graphics (4bpp) | `Img_87A2EA0` | `dump/banim-ekrdragonfx_7A2EA0.bin` | `data/banim-ekrdragonfx.s:596` |
| 324 | 0x7A3400 | 1440 | Graphics (4bpp) | `Img_87A3400` | `dump/banim-ekrdragonfx_7A3400.bin` | `data/banim-ekrdragonfx.s:600` |
| 325 | 0x7A39A0 | 1432 | Graphics (4bpp) | `Img_87A39A0` | `dump/banim-ekrdragonfx_7A39A0.bin` | `data/banim-ekrdragonfx.s:604` |
| 326 | 0x7A3F38 | 1440 | Graphics (4bpp) | `Img_87A3F38` | `dump/banim-ekrdragonfx_7A3F38.bin` | `data/banim-ekrdragonfx.s:608` |
| 327 | 0x7A44D8 | 1424 | Graphics (4bpp) | `Img_87A44D8` | `dump/banim-ekrdragonfx_7A44D8.bin` | `data/banim-ekrdragonfx.s:612` |
| 328 | 0x7A4A68 | 32 | Palette | `Pal_87A4A68` | `dump/banim-ekrdragonfx_7A4A68.bin` | `data/banim-ekrdragonfx.s:616` |
| 329 | 0x7A4A88 | 224 | Tilemap | `Tsa_87A4A88` | `dump/banim-ekrdragonfx_7A4A88.bin` | `data/banim-ekrdragonfx.s:620` |
| 330 | 0x7A4B68 | 220 | Tilemap | `Tsa_87A4B68` | `dump/banim-ekrdragonfx_7A4B68.bin` | `data/banim-ekrdragonfx.s:624` |
| 331 | 0x7A4C44 | 232 | Tilemap | `Tsa_87A4C44` | `dump/banim-ekrdragonfx_7A4C44.bin` | `data/banim-ekrdragonfx.s:628` |
| 332 | 0x7A4D2C | 224 | Tilemap | `Tsa_87A4D2C` | `dump/banim-ekrdragonfx_7A4D2C.bin` | `data/banim-ekrdragonfx.s:632` |
| 333 | 0x7A4E0C | 224 | Tilemap | `Tsa_87A4E0C` | `dump/banim-ekrdragonfx_7A4E0C.bin` | `data/banim-ekrdragonfx.s:636` |
| 334 | 0x7A4EEC | 556 | Graphics (4bpp) | `Img_DemonLightSprites_EyeFlash` | `dump/banim-ekrdragonfx_7A4EEC.bin` | `data/banim-ekrdragonfx.s:640` |
| 335 | 0x7A5118 | 296 | Palette | `Pal_DemonLightSprites_EyeFlash` | `dump/banim-ekrdragonfx_7A5118.bin` | `data/banim-ekrdragonfx.s:644` |
| 336 | 0x7A5240 | 300 | Unknown | `gUnknown_087A5240` | `dump/banim-ekrdragonfx_7A5240.bin` | `data/banim-ekrdragonfx.s:648` |
| 337 | 0x7A536C | 36 | Unknown | `gUnknown_087A536C` | `dump/banim-ekrdragonfx_7A536C.bin` | `data/banim-ekrdragonfx.s:652` |
| 338 | 0x7A5390 | 956 | Graphics (4bpp) | `Img_DemonLightSprites` | `dump/banim-ekrdragonfx_7A5390.bin` | `data/banim-ekrdragonfx.s:656` |
| 339 | 0x7A574C | 32 | Palette | `Pal_DemonLightSprites` | `dump/banim-ekrdragonfx_7A574C.bin` | `data/banim-ekrdragonfx.s:660` |
| 340 | 0x7A5BA4 | 760 | Graphics (4bpp) | `Img_DemonLightSprites_087A5BA4` | `dump/banim-ekrdragonfx_7A5BA4.bin` | `data/banim-ekrdragonfx.s:874` |
| 341 | 0x7A5E9C | 848 | Graphics (4bpp) | `Img_DemonLightSprites_087A5E9C` | `dump/banim-ekrdragonfx_7A5E9C.bin` | `data/banim-ekrdragonfx.s:878` |
| 342 | 0x7A61EC | 32 | Palette | `Pal_DemonLightSprites_087A61EC` | `dump/banim-ekrdragonfx_7A61EC.bin` | `data/banim-ekrdragonfx.s:882` |
| 343 | 0x7C5190 | 1364 | Graphics (4bpp) | `Img_087C5190` | `dump/banim-ekrdragonfx_7C5190.bin` | `data/banim-ekrdragonfx.s:1748` |
| 344 | 0x7C56E4 | 2744 | Graphics (4bpp) | `Img_087C56E4` | `dump/banim-ekrdragonfx_7C56E4.bin` | `data/banim-ekrdragonfx.s:1752` |
| 345 | 0x7C619C | 2904 | Graphics (4bpp) | `Img_087C619C` | `dump/banim-ekrdragonfx_7C619C.bin` | `data/banim-ekrdragonfx.s:1756` |
| 346 | 0x7C6CF4 | 2436 | Graphics (4bpp) | `Img_087C6CF4` | `dump/banim-ekrdragonfx_7C6CF4.bin` | `data/banim-ekrdragonfx.s:1760` |
| 347 | 0x7C7678 | 2708 | Graphics (4bpp) | `Img_087C7678` | `dump/banim-ekrdragonfx_7C7678.bin` | `data/banim-ekrdragonfx.s:1764` |
| 348 | 0x7C810C | 1456 | Graphics (4bpp) | `Img_087C810C` | `dump/banim-ekrdragonfx_7C810C.bin` | `data/banim-ekrdragonfx.s:1768` |
| 349 | 0x7C86BC | 1476 | Graphics (4bpp) | `Img_087C86BC` | `dump/banim-ekrdragonfx_7C86BC.bin` | `data/banim-ekrdragonfx.s:1772` |
| 350 | 0x7C8C80 | 1552 | Graphics (4bpp) | `Img_087C8C80` | `dump/banim-ekrdragonfx_7C8C80.bin` | `data/banim-ekrdragonfx.s:1776` |
| 351 | 0x7C9290 | 32 | Palette | `Pal_087C9290` | `dump/banim-ekrdragonfx_7C9290.bin` | `data/banim-ekrdragonfx.s:1780` |
| 352 | 0x7C92B0 | 32 | Palette | `Pal_087C92B0` | `dump/banim-ekrdragonfx_7C92B0.bin` | `data/banim-ekrdragonfx.s:1784` |
| 353 | 0x7C92D0 | 32 | Palette | `Pal_087C92D0` | `dump/banim-ekrdragonfx_7C92D0.bin` | `data/banim-ekrdragonfx.s:1788` |
| 354 | 0x7C92F0 | 32 | Palette | `Pal_087C92F0` | `dump/banim-ekrdragonfx_7C92F0.bin` | `data/banim-ekrdragonfx.s:1792` |
| 355 | 0x7C9310 | 32 | Palette | `Pal_087C9310` | `dump/banim-ekrdragonfx_7C9310.bin` | `data/banim-ekrdragonfx.s:1796` |
| 356 | 0x7C9330 | 32 | Palette | `Pal_087C9330` | `dump/banim-ekrdragonfx_7C9330.bin` | `data/banim-ekrdragonfx.s:1800` |
| 357 | 0x7C9350 | 32 | Palette | `Pal_087C9350` | `dump/banim-ekrdragonfx_7C9350.bin` | `data/banim-ekrdragonfx.s:1804` |
| 358 | 0x7C9370 | 32 | Palette | `Pal_087C9370` | `dump/banim-ekrdragonfx_7C9370.bin` | `data/banim-ekrdragonfx.s:1808` |
| 359 | 0x7C9390 | 212 | Tilemap | `Tsa_087C9390` | `dump/banim-ekrdragonfx_7C9390.bin` | `data/banim-ekrdragonfx.s:1812` |
| 360 | 0x7C9464 | 412 | Tilemap | `Tsa_087C9464` | `dump/banim-ekrdragonfx_7C9464.bin` | `data/banim-ekrdragonfx.s:1816` |
| 361 | 0x7C9600 | 536 | Tilemap | `Tsa_087C9600` | `dump/banim-ekrdragonfx_7C9600.bin` | `data/banim-ekrdragonfx.s:1820` |
| 362 | 0x7C9818 | 532 | Tilemap | `Tsa_087C9818` | `dump/banim-ekrdragonfx_7C9818.bin` | `data/banim-ekrdragonfx.s:1824` |
| 363 | 0x7C9A2C | 448 | Tilemap | `Tsa_087C9A2C` | `dump/banim-ekrdragonfx_7C9A2C.bin` | `data/banim-ekrdragonfx.s:1828` |
| 364 | 0x7C9BEC | 264 | Tilemap | `Tsa_087C9BEC` | `dump/banim-ekrdragonfx_7C9BEC.bin` | `data/banim-ekrdragonfx.s:1832` |
| 365 | 0x7C9CF4 | 272 | Tilemap | `Tsa_087C9CF4` | `dump/banim-ekrdragonfx_7C9CF4.bin` | `data/banim-ekrdragonfx.s:1836` |
| 366 | 0x7C9E04 | 276 | Tilemap | `Tsa_087C9E04` | `dump/banim-ekrdragonfx_7C9E04.bin` | `data/banim-ekrdragonfx.s:1840` |
| 367 | 0x7C9F18 | 1908 | Graphics (4bpp) | `Img_087C9F18` | `dump/banim-ekrdragonfx_7C9F18.bin` | `data/banim-ekrdragonfx.s:1844` |
| 368 | 0x7CA68C | 2004 | Graphics (4bpp) | `Img_087CA68C` | `dump/banim-ekrdragonfx_7CA68C.bin` | `data/banim-ekrdragonfx.s:1848` |
| 369 | 0x7CAE60 | 2000 | Graphics (4bpp) | `Img_087CAE60` | `dump/banim-ekrdragonfx_7CAE60.bin` | `data/banim-ekrdragonfx.s:1852` |
| 370 | 0x7CB630 | 1988 | Graphics (4bpp) | `Img_087CB630` | `dump/banim-ekrdragonfx_7CB630.bin` | `data/banim-ekrdragonfx.s:1856` |
| 371 | 0x7CBDF4 | 1896 | Graphics (4bpp) | `Img_087CBDF4` | `dump/banim-ekrdragonfx_7CBDF4.bin` | `data/banim-ekrdragonfx.s:1860` |
| 372 | 0x7CC55C | 32 | Palette | `Pal_087CC55C` | `dump/banim-ekrdragonfx_7CC55C.bin` | `data/banim-ekrdragonfx.s:1864` |
| 373 | 0x7CC57C | 32 | Palette | `Pal_087CC57C` | `dump/banim-ekrdragonfx_7CC57C.bin` | `data/banim-ekrdragonfx.s:1868` |
| 374 | 0x7CC59C | 32 | Palette | `Pal_087CC59C` | `dump/banim-ekrdragonfx_7CC59C.bin` | `data/banim-ekrdragonfx.s:1872` |
| 375 | 0x7CC5BC | 32 | Palette | `Pal_087CC5BC` | `dump/banim-ekrdragonfx_7CC5BC.bin` | `data/banim-ekrdragonfx.s:1876` |
| 376 | 0x7CC5DC | 32 | Palette | `Pal_087CC5DC` | `dump/banim-ekrdragonfx_7CC5DC.bin` | `data/banim-ekrdragonfx.s:1880` |
| 377 | 0x7CC5FC | 312 | Tilemap | `Tsa_087CC5FC` | `dump/banim-ekrdragonfx_7CC5FC.bin` | `data/banim-ekrdragonfx.s:1884` |
| 378 | 0x7CC734 | 324 | Tilemap | `Tsa_087CC734` | `dump/banim-ekrdragonfx_7CC734.bin` | `data/banim-ekrdragonfx.s:1888` |
| 379 | 0x7CC878 | 320 | Tilemap | `Tsa_087CC878` | `dump/banim-ekrdragonfx_7CC878.bin` | `data/banim-ekrdragonfx.s:1892` |
| 380 | 0x7CC9B8 | 288 | Tilemap | `Tsa_087CC9B8` | `dump/banim-ekrdragonfx_7CC9B8.bin` | `data/banim-ekrdragonfx.s:1896` |
| 381 | 0x7CCAD8 | 288 | Tilemap | `Tsa_087CCAD8` | `dump/banim-ekrdragonfx_7CCAD8.bin` | `data/banim-ekrdragonfx.s:1900` |
| 382 | 0x7EA72C | 1364 | Graphics (4bpp) | `Img_087EA72C` | `dump/banim-ekrdragonfx_7EA72C.bin` | `data/banim-ekrdragonfx.s:2288` |
| 383 | 0x7EAC80 | 2692 | Graphics (4bpp) | `Img_087EAC80` | `dump/banim-ekrdragonfx_7EAC80.bin` | `data/banim-ekrdragonfx.s:2292` |
| 384 | 0x7EB704 | 2384 | Graphics (4bpp) | `Img_087EB704` | `dump/banim-ekrdragonfx_7EB704.bin` | `data/banim-ekrdragonfx.s:2296` |
| 385 | 0x7EC054 | 2288 | Graphics (4bpp) | `Img_087EC054` | `dump/banim-ekrdragonfx_7EC054.bin` | `data/banim-ekrdragonfx.s:2300` |
| 386 | 0x7EC944 | 2412 | Graphics (4bpp) | `Img_087EC944` | `dump/banim-ekrdragonfx_7EC944.bin` | `data/banim-ekrdragonfx.s:2304` |
| 387 | 0x7ED2B0 | 1400 | Graphics (4bpp) | `Img_087ED2B0` | `dump/banim-ekrdragonfx_7ED2B0.bin` | `data/banim-ekrdragonfx.s:2308` |
| 388 | 0x7ED828 | 1432 | Graphics (4bpp) | `Img_087ED828` | `dump/banim-ekrdragonfx_7ED828.bin` | `data/banim-ekrdragonfx.s:2312` |
| 389 | 0x7EDDC0 | 1504 | Graphics (4bpp) | `Img_087EDDC0` | `dump/banim-ekrdragonfx_7EDDC0.bin` | `data/banim-ekrdragonfx.s:2316` |
| 390 | 0x7EE3A0 | 32 | Palette | `Pal_087EE3A0` | `dump/banim-ekrdragonfx_7EE3A0.bin` | `data/banim-ekrdragonfx.s:2320` |
| 391 | 0x7EE3C0 | 32 | Palette | `Pal_087EE3C0` | `dump/banim-ekrdragonfx_7EE3C0.bin` | `data/banim-ekrdragonfx.s:2324` |
| 392 | 0x7EE3E0 | 32 | Palette | `Pal_087EE3E0` | `dump/banim-ekrdragonfx_7EE3E0.bin` | `data/banim-ekrdragonfx.s:2328` |
| 393 | 0x7EE400 | 32 | Palette | `Pal_087EE400` | `dump/banim-ekrdragonfx_7EE400.bin` | `data/banim-ekrdragonfx.s:2332` |
| 394 | 0x7EE420 | 32 | Palette | `Pal_087EE420` | `dump/banim-ekrdragonfx_7EE420.bin` | `data/banim-ekrdragonfx.s:2336` |
| 395 | 0x7EE440 | 32 | Palette | `Pal_087EE440` | `dump/banim-ekrdragonfx_7EE440.bin` | `data/banim-ekrdragonfx.s:2340` |
| 396 | 0x7EE460 | 32 | Palette | `Pal_087EE460` | `dump/banim-ekrdragonfx_7EE460.bin` | `data/banim-ekrdragonfx.s:2344` |
| 397 | 0x7EE480 | 32 | Palette | `Pal_087EE480` | `dump/banim-ekrdragonfx_7EE480.bin` | `data/banim-ekrdragonfx.s:2348` |
| 398 | 0x7EE4A0 | 216 | Tilemap | `Tsa_087EE4A0` | `dump/banim-ekrdragonfx_7EE4A0.bin` | `data/banim-ekrdragonfx.s:2352` |
| 399 | 0x7EE578 | 408 | Tilemap | `Tsa_087EE578` | `dump/banim-ekrdragonfx_7EE578.bin` | `data/banim-ekrdragonfx.s:2356` |
| 400 | 0x7EE710 | 488 | Tilemap | `Tsa_087EE710` | `dump/banim-ekrdragonfx_7EE710.bin` | `data/banim-ekrdragonfx.s:2360` |
| 401 | 0x7EE8F8 | 508 | Tilemap | `Tsa_087EE8F8` | `dump/banim-ekrdragonfx_7EE8F8.bin` | `data/banim-ekrdragonfx.s:2364` |
| 402 | 0x7EEAF4 | 436 | Tilemap | `Tsa_087EEAF4` | `dump/banim-ekrdragonfx_7EEAF4.bin` | `data/banim-ekrdragonfx.s:2368` |
| 403 | 0x7EECA8 | 260 | Tilemap | `Tsa_087EECA8` | `dump/banim-ekrdragonfx_7EECA8.bin` | `data/banim-ekrdragonfx.s:2372` |
| 404 | 0x7EEDAC | 260 | Tilemap | `Tsa_087EEDAC` | `dump/banim-ekrdragonfx_7EEDAC.bin` | `data/banim-ekrdragonfx.s:2376` |
| 405 | 0x7EEEB0 | 268 | Tilemap | `Tsa_087EEEB0` | `dump/banim-ekrdragonfx_7EEEB0.bin` | `data/banim-ekrdragonfx.s:2380` |
| 406 | 0x7EEFBC | 1908 | Graphics (4bpp) | `Img_087EEFBC` | `dump/banim-ekrdragonfx_7EEFBC.bin` | `data/banim-ekrdragonfx.s:2384` |
| 407 | 0x7EF730 | 2004 | Graphics (4bpp) | `Img_087EF730` | `dump/banim-ekrdragonfx_7EF730.bin` | `data/banim-ekrdragonfx.s:2388` |
| 408 | 0x7EFF04 | 2000 | Graphics (4bpp) | `Img_087EFF04` | `dump/banim-ekrdragonfx_7EFF04.bin` | `data/banim-ekrdragonfx.s:2392` |
| 409 | 0x7F06D4 | 1988 | Graphics (4bpp) | `Img_087F06D4` | `dump/banim-ekrdragonfx_7F06D4.bin` | `data/banim-ekrdragonfx.s:2396` |
| 410 | 0x7F0E98 | 1896 | Graphics (4bpp) | `Img_087F0E98` | `dump/banim-ekrdragonfx_7F0E98.bin` | `data/banim-ekrdragonfx.s:2400` |
| 411 | 0x7F1600 | 32 | Palette | `Pal_087F1600` | `dump/banim-ekrdragonfx_7F1600.bin` | `data/banim-ekrdragonfx.s:2404` |
| 412 | 0x7F1620 | 32 | Palette | `Pal_087F1620` | `dump/banim-ekrdragonfx_7F1620.bin` | `data/banim-ekrdragonfx.s:2408` |
| 413 | 0x7F1640 | 32 | Palette | `Pal_087F1640` | `dump/banim-ekrdragonfx_7F1640.bin` | `data/banim-ekrdragonfx.s:2412` |
| 414 | 0x7F1660 | 32 | Palette | `Pal_087F1660` | `dump/banim-ekrdragonfx_7F1660.bin` | `data/banim-ekrdragonfx.s:2416` |
| 415 | 0x7F1680 | 32 | Palette | `Pal_087F1680` | `dump/banim-ekrdragonfx_7F1680.bin` | `data/banim-ekrdragonfx.s:2420` |
| 416 | 0x7F16A0 | 312 | Tilemap | `Tsa_087F16A0` | `dump/banim-ekrdragonfx_7F16A0.bin` | `data/banim-ekrdragonfx.s:2424` |
| 417 | 0x7F17D8 | 324 | Tilemap | `Tsa_087F17D8` | `dump/banim-ekrdragonfx_7F17D8.bin` | `data/banim-ekrdragonfx.s:2428` |
| 418 | 0x7F191C | 312 | Tilemap | `Tsa_087F191C` | `dump/banim-ekrdragonfx_7F191C.bin` | `data/banim-ekrdragonfx.s:2432` |
| 419 | 0x7F1A54 | 288 | Tilemap | `Tsa_087F1A54` | `dump/banim-ekrdragonfx_7F1A54.bin` | `data/banim-ekrdragonfx.s:2436` |
| 420 | 0x7F1B74 | 288 | Tilemap | `Tsa_087F1B74` | `dump/banim-ekrdragonfx_7F1B74.bin` | `data/banim-ekrdragonfx.s:2440` |
| 421 | 0x7F1C94 | 2000 | Graphics (4bpp) | `Img_087F1C94` | `dump/banim-ekrdragonfx_7F1C94.bin` | `data/banim-ekrdragonfx.s:2444` |
| 422 | 0x7F2464 | 2524 | Graphics (4bpp) | `Img_087F2464` | `dump/banim-ekrdragonfx_7F2464.bin` | `data/banim-ekrdragonfx.s:2448` |
| 423 | 0x7F2E40 | 3540 | Graphics (4bpp) | `Img_087F2E40` | `dump/banim-ekrdragonfx_7F2E40.bin` | `data/banim-ekrdragonfx.s:2452` |
| 424 | 0x7F3C14 | 32 | Palette | `Pal_087F3C14` | `dump/banim-ekrdragonfx_7F3C14.bin` | `data/banim-ekrdragonfx.s:2456` |
| 425 | 0x7F3C34 | 32 | Palette | `Pal_087F3C34` | `dump/banim-ekrdragonfx_7F3C34.bin` | `data/banim-ekrdragonfx.s:2460` |
| 426 | 0x7F3C54 | 32 | Palette | `Pal_087F3C54` | `dump/banim-ekrdragonfx_7F3C54.bin` | `data/banim-ekrdragonfx.s:2464` |
| 427 | 0x7F3C74 | 236 | Tilemap | `Tsa_087F3C74` | `dump/banim-ekrdragonfx_7F3C74.bin` | `data/banim-ekrdragonfx.s:2468` |
| 428 | 0x7F3D60 | 296 | Tilemap | `Tsa_087F3D60` | `dump/banim-ekrdragonfx_7F3D60.bin` | `data/banim-ekrdragonfx.s:2472` |
| 429 | 0x7F3E88 | 440 | Tilemap | `Tsa_087F3E88` | `dump/banim-ekrdragonfx_7F3E88.bin` | `data/banim-ekrdragonfx.s:2476` |
| 430 | 0x7F45D0 | 456 | Tilemap | `Tsa_087F45D0` | `dump/data-ekrdk_7F45D0.bin` | `data/data-ekrdk.s:5` |
| 431 | 0x7F4798 | 12788 | Graphics (4bpp) | `Img_DemonKingBG` | `dump/data-ekrdk_7F4798.bin` | `data/data-ekrdk.s:9` |
| 432 | 0x7F798C | 1084 | Tilemap | `Tsa_DemonKingBG1` | `dump/data-ekrdk_7F798C.bin` | `data/data-ekrdk.s:13` |
| 433 | 0x7F7DC8 | 1032 | Tilemap | `Tsa_DemonKingBG2` | `dump/data-ekrdk_7F7DC8.bin` | `data/data-ekrdk.s:17` |
| 434 | 0x7F81D0 | 1036 | Tilemap | `Tsa_DemonKingBG3` | `dump/data-ekrdk_7F81D0.bin` | `data/data-ekrdk.s:21` |
| 435 | 0x7F85DC | 32 | Palette | `Pal_DemonKingBG` | `dump/data-ekrdk_7F85DC.bin` | `data/data-ekrdk.s:25` |
| 436 | 0x7F85FC | 676 | Graphics (4bpp) | `Img_EfxSelfThunderBG1` | `dump/data-ekrdk_7F85FC.bin` | `data/data-ekrdk.s:29` |
| 437 | 0x7F88A0 | 1000 | Graphics (4bpp) | `Img_EfxSelfThunderBG2` | `dump/data-ekrdk_7F88A0.bin` | `data/data-ekrdk.s:33` |
| 438 | 0x7F8C88 | 1220 | Graphics (4bpp) | `Img_EfxSelfThunderBG3` | `dump/data-ekrdk_7F8C88.bin` | `data/data-ekrdk.s:37` |
| 439 | 0x7F914C | 1456 | Graphics (4bpp) | `Img_EfxSelfThunderBG4` | `dump/data-ekrdk_7F914C.bin` | `data/data-ekrdk.s:41` |
| 440 | 0x7F96FC | 1524 | Graphics (4bpp) | `Img_EfxSelfThunderBG5` | `dump/data-ekrdk_7F96FC.bin` | `data/data-ekrdk.s:45` |
| 441 | 0x7F9CF0 | 1404 | Graphics (4bpp) | `Img_EfxSelfThunderBG6` | `dump/data-ekrdk_7F9CF0.bin` | `data/data-ekrdk.s:49` |
| 442 | 0x7FA26C | 1380 | Graphics (4bpp) | `Img_EfxSelfThunderBG7` | `dump/data-ekrdk_7FA26C.bin` | `data/data-ekrdk.s:53` |
| 443 | 0x7FA7D0 | 1240 | Graphics (4bpp) | `Img_EfxSelfThunderBG8` | `dump/data-ekrdk_7FA7D0.bin` | `data/data-ekrdk.s:57` |
| 444 | 0x7FACA8 | 1088 | Graphics (4bpp) | `Img_EfxSelfThunderBG9` | `dump/data-ekrdk_7FACA8.bin` | `data/data-ekrdk.s:61` |
| 445 | 0x7FB0E8 | 936 | Graphics (4bpp) | `Img_EfxSelfThunderBG10` | `dump/data-ekrdk_7FB0E8.bin` | `data/data-ekrdk.s:65` |
| 446 | 0x7FB490 | 928 | Graphics (4bpp) | `Img_EfxSelfThunderBG11` | `dump/data-ekrdk_7FB490.bin` | `data/data-ekrdk.s:69` |
| 447 | 0x7FB830 | 860 | Graphics (4bpp) | `Img_EfxSelfThunderBG12` | `dump/data-ekrdk_7FB830.bin` | `data/data-ekrdk.s:73` |
| 448 | 0x7FBB8C | 856 | Graphics (4bpp) | `Img_EfxSelfThunderBG13` | `dump/data-ekrdk_7FBB8C.bin` | `data/data-ekrdk.s:77` |
| 449 | 0x7FBEE4 | 932 | Graphics (4bpp) | `Img_EfxSelfThunderBG14` | `dump/data-ekrdk_7FBEE4.bin` | `data/data-ekrdk.s:81` |
| 450 | 0x7FC288 | 872 | Graphics (4bpp) | `Img_EfxSelfThunderBG15` | `dump/data-ekrdk_7FC288.bin` | `data/data-ekrdk.s:85` |
| 451 | 0x7FC5F0 | 848 | Graphics (4bpp) | `Img_EfxSelfThunderBG16` | `dump/data-ekrdk_7FC5F0.bin` | `data/data-ekrdk.s:89` |
| 452 | 0x7FC940 | 300 | Unknown | `TSA1_EfxSelfThunderBG1` | `dump/data-ekrdk_7FC940.bin` | `data/data-ekrdk.s:93` |
| 453 | 0x7FCA6C | 332 | Unknown | `TSA1_EfxSelfThunderBG2` | `dump/data-ekrdk_7FCA6C.bin` | `data/data-ekrdk.s:97` |
| 454 | 0x7FCBB8 | 380 | Unknown | `TSA1_EfxSelfThunderBG3` | `dump/data-ekrdk_7FCBB8.bin` | `data/data-ekrdk.s:101` |
| 455 | 0x7FCD34 | 388 | Unknown | `TSA1_EfxSelfThunderBG4` | `dump/data-ekrdk_7FCD34.bin` | `data/data-ekrdk.s:105` |
| 456 | 0x7FCEB8 | 408 | Unknown | `TSA1_EfxSelfThunderBG5` | `dump/data-ekrdk_7FCEB8.bin` | `data/data-ekrdk.s:109` |
| 457 | 0x7FD050 | 388 | Unknown | `TSA1_EfxSelfThunderBG6` | `dump/data-ekrdk_7FD050.bin` | `data/data-ekrdk.s:113` |
| 458 | 0x7FD1D4 | 388 | Unknown | `TSA1_EfxSelfThunderBG7` | `dump/data-ekrdk_7FD1D4.bin` | `data/data-ekrdk.s:117` |
| 459 | 0x7FD358 | 372 | Unknown | `TSA1_EfxSelfThunderBG8` | `dump/data-ekrdk_7FD358.bin` | `data/data-ekrdk.s:121` |
| 460 | 0x7FD4CC | 344 | Unknown | `TSA1_EfxSelfThunderBG9` | `dump/data-ekrdk_7FD4CC.bin` | `data/data-ekrdk.s:125` |
| 461 | 0x7FD624 | 324 | Unknown | `TSA1_EfxSelfThunderBG10` | `dump/data-ekrdk_7FD624.bin` | `data/data-ekrdk.s:129` |
| 462 | 0x7FD768 | 328 | Unknown | `TSA1_EfxSelfThunderBG11` | `dump/data-ekrdk_7FD768.bin` | `data/data-ekrdk.s:133` |
| 463 | 0x7FD8B0 | 316 | Unknown | `TSA1_EfxSelfThunderBG12` | `dump/data-ekrdk_7FD8B0.bin` | `data/data-ekrdk.s:137` |
| 464 | 0x7FD9EC | 312 | Unknown | `TSA1_EfxSelfThunderBG13` | `dump/data-ekrdk_7FD9EC.bin` | `data/data-ekrdk.s:141` |
| 465 | 0x7FDB24 | 340 | Unknown | `TSA1_EfxSelfThunderBG14` | `dump/data-ekrdk_7FDB24.bin` | `data/data-ekrdk.s:145` |
| 466 | 0x7FDC78 | 336 | Unknown | `TSA1_EfxSelfThunderBG15` | `dump/data-ekrdk_7FDC78.bin` | `data/data-ekrdk.s:149` |
| 467 | 0x7FDDC8 | 332 | Unknown | `TSA1_EfxSelfThunderBG16` | `dump/data-ekrdk_7FDDC8.bin` | `data/data-ekrdk.s:153` |
| 468 | 0x7FDF14 | 296 | Unknown | `TSA2_EfxSelfThunderBG1` | `dump/data-ekrdk_7FDF14.bin` | `data/data-ekrdk.s:157` |
| 469 | 0x7FE03C | 320 | Unknown | `TSA2_EfxSelfThunderBG2` | `dump/data-ekrdk_7FE03C.bin` | `data/data-ekrdk.s:161` |
| 470 | 0x7FE17C | 344 | Unknown | `TSA2_EfxSelfThunderBG3` | `dump/data-ekrdk_7FE17C.bin` | `data/data-ekrdk.s:165` |
| 471 | 0x7FE2D4 | 352 | Unknown | `TSA2_EfxSelfThunderBG4` | `dump/data-ekrdk_7FE2D4.bin` | `data/data-ekrdk.s:169` |
| 472 | 0x7FE434 | 376 | Unknown | `TSA2_EfxSelfThunderBG5` | `dump/data-ekrdk_7FE434.bin` | `data/data-ekrdk.s:173` |
| 473 | 0x7FE5AC | 368 | Unknown | `TSA2_EfxSelfThunderBG6` | `dump/data-ekrdk_7FE5AC.bin` | `data/data-ekrdk.s:177` |
| 474 | 0x7FE71C | 380 | Unknown | `TSA2_EfxSelfThunderBG7` | `dump/data-ekrdk_7FE71C.bin` | `data/data-ekrdk.s:181` |
| 475 | 0x7FE898 | 368 | Unknown | `TSA2_EfxSelfThunderBG8` | `dump/data-ekrdk_7FE898.bin` | `data/data-ekrdk.s:185` |
| 476 | 0x7FEA08 | 344 | Unknown | `TSA2_EfxSelfThunderBG9` | `dump/data-ekrdk_7FEA08.bin` | `data/data-ekrdk.s:189` |
| 477 | 0x7FEB60 | 320 | Unknown | `TSA2_EfxSelfThunderBG10` | `dump/data-ekrdk_7FEB60.bin` | `data/data-ekrdk.s:193` |
| 478 | 0x7FECA0 | 328 | Unknown | `TSA2_EfxSelfThunderBG11` | `dump/data-ekrdk_7FECA0.bin` | `data/data-ekrdk.s:197` |
| 479 | 0x7FEDE8 | 312 | Unknown | `TSA2_EfxSelfThunderBG12` | `dump/data-ekrdk_7FEDE8.bin` | `data/data-ekrdk.s:201` |
| 480 | 0x7FEF20 | 312 | Unknown | `TSA2_EfxSelfThunderBG13` | `dump/data-ekrdk_7FEF20.bin` | `data/data-ekrdk.s:205` |
| 481 | 0x7FF058 | 340 | Unknown | `TSA2_EfxSelfThunderBG14` | `dump/data-ekrdk_7FF058.bin` | `data/data-ekrdk.s:209` |
| 482 | 0x7FF1AC | 332 | Unknown | `TSA2_EfxSelfThunderBG15` | `dump/data-ekrdk_7FF1AC.bin` | `data/data-ekrdk.s:213` |
| 483 | 0x7FF2F8 | 336 | Unknown | `TSA2_EfxSelfThunderBG16` | `dump/data-ekrdk_7FF2F8.bin` | `data/data-ekrdk.s:217` |
| 484 | 0x7FF448 | 32 | Unknown | `Pal1_EfxSelfThunderBG` | `dump/data-ekrdk_7FF448.bin` | `data/data-ekrdk.s:221` |
| 485 | 0x7FF468 | 32 | Unknown | `Pal2_EfxSelfThunderBG` | `dump/data-ekrdk_7FF468.bin` | `data/data-ekrdk.s:225` |
| 486 | 0x7FF488 | 4548 | Graphics (4bpp) | `Img_DemoKingTunkFace` | `dump/data-ekrdk_7FF488.bin` | `data/data-ekrdk.s:229` |
| 487 | 0x80064C | 4500 | Graphics (4bpp) | `Img_DemoKingTunkFace2` | `dump/data-ekrdk_80064C.bin` | `data/data-ekrdk.s:233` |
| 488 | 0x8017E0 | 32 | Palette | `Pal_DemoKingTunkFace` | `dump/data-ekrdk_8017E0.bin` | `data/data-ekrdk.s:237` |
| 489 | 0x801C14 | 872 | Graphics (4bpp) | `Img_08801C14` | `dump/data-banimmisc_801C14.bin` | `data/data-banimmisc.s:5` |
| 490 | 0x801F7C | 120 | Graphics (4bpp) | `Img_EfxLeftNameBox` | `dump/data-banimmisc_801F7C.bin` | `data/data-banimmisc.s:9` |
| 491 | 0x801FF4 | 80 | Graphics (4bpp) | `Img_EfxLeftItemBox` | `dump/data-banimmisc_801FF4.bin` | `data/data-banimmisc.s:13` |
| 492 | 0x802044 | 120 | Graphics (4bpp) | `Img_EfxRightNameBox` | `dump/data-banimmisc_802044.bin` | `data/data-banimmisc.s:17` |
| 493 | 0x8020BC | 80 | Graphics (4bpp) | `Img_EfxRightItemBox` | `dump/data-banimmisc_8020BC.bin` | `data/data-banimmisc.s:21` |
| 494 | 0x80210C | 180 | Unknown | `gUnknown_0880210C` | `dump/data-banimmisc_80210C.bin` | `data/data-banimmisc.s:25` |
| 495 | 0x8021C0 | 180 | Unknown | `gUnknown_088021C0` | `dump/data-banimmisc_8021C0.bin` | `data/data-banimmisc.s:29` |
| 496 | 0x802274 | 212 | Unknown | `gUnknown_08802274` | `dump/data-banimmisc_802274.bin` | `data/data-banimmisc.s:33` |
| 497 | 0x802348 | 224 | Unknown | `gUnknown_08802348` | `dump/data-banimmisc_802348.bin` | `data/data-banimmisc.s:37` |
| 498 | 0x802428 | 224 | Unknown | `gUnknown_08802428` | `dump/data-banimmisc_802428.bin` | `data/data-banimmisc.s:41` |
| 499 | 0x802508 | 80 | Unknown | `gUnknown_08802508` | `dump/data-banimmisc_802508.bin` | `data/data-banimmisc.s:45` |
| 500 | 0x802558 | 128 | Unknown | `gUnknown_08802558` | `dump/data-banimmisc_802558.bin` | `data/data-banimmisc.s:49` |
| 501 | 0x8025D8 | 156 | Graphics (4bpp) | `Img_EfxSideHitDmgCrit` | `dump/data-banimmisc_8025D8.bin` | `data/data-banimmisc.s:53` |
| 502 | 0x802674 | 36 | Graphics (4bpp) | `Img_EfxWTAArrow1` | `dump/data-banimmisc_802674.bin` | `data/data-banimmisc.s:57` |
| 503 | 0x802698 | 76 | Graphics (4bpp) | `Img_EfxWTAArrow2` | `dump/data-banimmisc_802698.bin` | `data/data-banimmisc.s:61` |
| 504 | 0x8026E4 | 416 | Unknown | `gUnknown_088026E4` | `dump/data-banimmisc_8026E4.bin` | `data/data-banimmisc.s:65` |
| 505 | 0x802884 | 128 | Unknown | `gUnknown_08802884` | `dump/data-banimmisc_802884.bin` | `data/data-banimmisc.s:69` |
| 506 | 0x802904 | 512 | Unknown | `gUnknown_08802904` | `dump/data-banimmisc_802904.bin` | `data/data-banimmisc.s:73` |
| 507 | 0x802B04 | 128 | Unknown | `gUnknown_08802B04` | `dump/data-banimmisc_802B04.bin` | `data/data-banimmisc.s:77` |
| 508 | 0x802B84 | 64 | Unknown | `gPalEfxHpBarGreen` | `dump/data-banimmisc_802B84.bin` | `data/data-banimmisc.s:81` |
| 509 | 0x802BC4 | 192 | Unknown | `gUnknown_08802BC4` | `dump/data-banimmisc_802BC4.bin` | `data/data-banimmisc.s:85` |
| 510 | 0x802C84 | 160 | Unknown | `gPalEfxHpBarPurple` | `dump/data-banimmisc_802C84.bin` | `data/data-banimmisc.s:89` |
| 511 | 0x802D24 | 32 | Palette | `Pal_BanimUnitFlashing` | `dump/data-banimmisc_802D24.bin` | `data/data-banimmisc.s:93` |
| 512 | 0x803524 | 108 | Tilemap | `Tsa_EkrExpBar` | `dump/data-banimmisc_803524.bin` | `data/data-banimmisc.s:109` |
| 513 | 0x8035B0 | 1080 | Graphics (4bpp) | `Img_LevelUpBoxFrame` | `dump/data-banimmisc_8035B0.bin` | `data/data-banimmisc.s:117` |
| 514 | 0x8039E8 | 296 | Tilemap | `Tsa_LevelUpBoxFrame` | `dump/data-banimmisc_8039E8.bin` | `data/data-banimmisc.s:121` |
| 515 | 0x803B10 | 32 | Palette | `Pal_LevelUpBoxFrame` | `dump/data-banimmisc_803B10.bin` | `data/data-banimmisc.s:125` |
| 516 | 0x803B30 | 160 | Graphics (4bpp) | `Img_EkrPopup` | `dump/data-banimmisc_803B30.bin` | `data/data-banimmisc.s:129` |
| 517 | 0x803BD0 | 224 | Unknown | `gUnknown_08803BD0` | `dump/data-banimmisc_803BD0.bin` | `data/data-banimmisc.s:133` |
| 518 | 0x803CB0 | 32 | Palette | `Pal_EkrPopup` | `dump/data-banimmisc_803CB0.bin` | `data/data-banimmisc.s:137` |
| 519 | 0x803CD0 | 148 | Tilemap | `Tsa_EkrPopup` | `dump/data-banimmisc_803CD0.bin` | `data/data-banimmisc.s:141` |
| 520 | 0x99D6DC | 2760 | Graphics (4bpp) | `Img_0899D6DC` | `dump/data_99D6DC_99D6DC.bin` | `data/data_99D6DC.s:5` |
| 521 | 0x99E1A4 | 2976 | Graphics (4bpp) | `Img_99E1A4` | `dump/data_99D6DC_99E1A4.bin` | `data/data_99D6DC.s:9` |
| 522 | 0x99ED44 | 2704 | Graphics (4bpp) | `Img_99ED44` | `dump/data_99D6DC_99ED44.bin` | `data/data_99D6DC.s:13` |
| 523 | 0x99F7D4 | 2432 | Graphics (4bpp) | `Img_99F7D4` | `dump/data_99D6DC_99F7D4.bin` | `data/data_99D6DC.s:17` |
| 524 | 0x9A0154 | 1808 | Graphics (4bpp) | `Img_9A0154` | `dump/data_99D6DC_9A0154.bin` | `data/data_99D6DC.s:21` |
| 525 | 0x9A0864 | 1568 | Graphics (4bpp) | `Img_9A0864` | `dump/data_99D6DC_9A0864.bin` | `data/data_99D6DC.s:25` |
| 526 | 0x9A0E84 | 460 | Unknown | `TileSet_9A0E84` | `dump/data_99D6DC_9A0E84.bin` | `data/data_99D6DC.s:29` |
| 527 | 0x9A1050 | 472 | Unknown | `TileSet_9A1050` | `dump/data_99D6DC_9A1050.bin` | `data/data_99D6DC.s:33` |
| 528 | 0x9A1228 | 452 | Unknown | `TileSet_9A1228` | `dump/data_99D6DC_9A1228.bin` | `data/data_99D6DC.s:37` |
| 529 | 0x9A13EC | 456 | Unknown | `TileSet_9A13EC` | `dump/data_99D6DC_9A13EC.bin` | `data/data_99D6DC.s:41` |
| 530 | 0x9A15B4 | 408 | Unknown | `TileSet_9A15B4` | `dump/data_99D6DC_9A15B4.bin` | `data/data_99D6DC.s:45` |
| 531 | 0x9A174C | 392 | Unknown | `TileSet_9A174C` | `dump/data_99D6DC_9A174C.bin` | `data/data_99D6DC.s:49` |
| 532 | 0x9A18D4 | 32 | Palette | `Pal_EventMapAnimMaskfx` | `dump/data_99D6DC_9A18D4.bin` | `data/data_99D6DC.s:53` |
| 533 | 0x9A234C | 1128 | Unknown | `gUnknown_089A234C` | `dump/data_99D6DC_9A234C.bin` | `data/data_99D6DC.s:73` |
| 534 | 0x9A27B4 | 300 | Unknown | `gUnknown_089A27B4` | `dump/data_99D6DC_9A27B4.bin` | `data/data_99D6DC.s:77` |
| 535 | 0x9A28E0 | 64 | Unknown | `gUnknown_089A28E0` | `dump/data_99D6DC_9A28E0.bin` | `data/data_99D6DC.s:81` |
| 536 | 0x9A5314 | 1880 | Unknown | `SpriteAnim_ManimStatGain` | `dump/data_9A31F8_9A5314.bin` | `data/data_9A31F8.s:18` |
| 537 | 0x9A5A6C | 1932 | Unknown | `gUnknown_089A5A6C` | `dump/data_9A31F8_9A5A6C.bin` | `data/data_9A31F8.s:22` |
| 538 | 0x9A61F8 | 92 | Unknown | `ApConf_MapAnimTorchfx` | `dump/data_9A31F8_9A61F8.bin` | `data/data_9A31F8.s:26` |
| 539 | 0x9A6254 | 3308 | Unknown | `ApConf_089A6254` | `dump/data_9A31F8_9A6254.bin` | `data/data_9A31F8.s:30` |
| 540 | 0x9A6F40 | 152 | Unknown | `Obj_PoisonAnim` | `dump/data_9A31F8_9A6F40.bin` | `data/data_9A31F8.s:34` |
| 541 | 0x9A6FD8 | 7968 | Unknown | `Obj_WallBreakAnim` | `dump/data_9A31F8_9A6FD8.bin` | `data/data_9A31F8.s:38` |
| 542 | 0x9A8EF8 | 124 | Unknown | `ApHandle_GmapSoguSprites` | `dump/data_9A31F8_9A8EF8.bin` | `data/data_9A31F8.s:42` |
| 543 | 0x9A8F74 | 32 | Palette | `Pal_MapAnimManaketeMu` | `dump/data_9A31F8_9A8F74.bin` | `data/data_9A31F8.s:46` |
| 544 | 0x9A8F94 | 11228 | Unknown | `gGfx_ArenaBuildingFront` | `dump/data_9A31F8_9A8F94.bin` | `data/data_9A31F8.s:50` |
| 545 | 0x9ABB70 | 1204 | Unknown | `gTsa_ArenaBuildingFront` | `dump/data_9A31F8_9ABB70.bin` | `data/data_9A31F8.s:54` |
| 546 | 0x9AC024 | 128 | Unknown | `gPal_ArenaBuildingFront` | `dump/data_9A31F8_9AC024.bin` | `data/data_9A31F8.s:58` |
| 547 | 0x9AC0A4 | 240 | Graphics (4bpp) | `Img_MapAnimMISS` | `dump/data_9A31F8_9AC0A4.bin` | `data/data_9A31F8.s:62` |
| 548 | 0x9AC194 | 360 | Unknown | `Obj_MapAnimMISS` | `dump/data_9A31F8_9AC194.bin` | `data/data_9A31F8.s:66` |
| 549 | 0x9AC2FC | 324 | Graphics (4bpp) | `Img_MapAnimNODAMAGE` | `dump/data_9A31F8_9AC2FC.bin` | `data/data_9A31F8.s:70` |
| 550 | 0x9AC440 | 396 | Unknown | `obj_MapAnimNODAMAGE` | `dump/data_9A31F8_9AC440.bin` | `data/data_9A31F8.s:74` |
| 551 | 0x9AC5CC | 456 | Palette | `Pal_ManimLevelUpStatGainCycling` | `dump/data_9A31F8_9AC5CC.bin` | `data/data_9A31F8.s:78` |
| 552 | 0x9AC9A8 | 96 | Palette | `Pal_ManimLevelUp` | `dump/data_9A31F8_9AC9A8.bin` | `data/data_9A31F8.s:86` |
| 553 | 0x9AD498 | 104 | Unknown | `gUnknown_089AD498` | `dump/data_9A31F8_9AD498.bin` | `data/data_9A31F8.s:98` |
| 554 | 0x9AD500 | 328 | Graphics (4bpp) | `Img_MapBattleInfoBox` | `dump/data_9A31F8_9AD500.bin` | `data/data_9A31F8.s:102` |
| 555 | 0x9AD648 | 32 | Palette | `Pal_MapBattleInfoBlue` | `dump/data_9A31F8_9AD648.bin` | `data/data_9A31F8.s:106` |
| 556 | 0x9AD668 | 32 | Palette | `Pal_MapBattleInfoRed` | `dump/data_9A31F8_9AD668.bin` | `data/data_9A31F8.s:110` |
| 557 | 0x9AD688 | 32 | Palette | `Pal_MapBattleInfoGreen` | `dump/data_9A31F8_9AD688.bin` | `data/data_9A31F8.s:114` |
| 558 | 0x9AD6A8 | 32 | Palette | `Pal_MapBattleInfoPurple` | `dump/data_9A31F8_9AD6A8.bin` | `data/data_9A31F8.s:118` |
| 559 | 0x9AD6C8 | 76 | Tilemap | `Tsa_MapBattleBoxGfx1` | `dump/data_9A31F8_9AD6C8.bin` | `data/data_9A31F8.s:122` |
| 560 | 0x9AD714 | 56 | Tilemap | `Tsa_MapBattleBoxGfx2` | `dump/data_9A31F8_9AD714.bin` | `data/data_9A31F8.s:126` |
| 561 | 0x9AD74C | 64 | Tilemap | `Tsa_MapBattleBoxGfx3` | `dump/data_9A31F8_9AD74C.bin` | `data/data_9A31F8.s:130` |
| 562 | 0x9AD78C | 220 | Graphics (4bpp) | `Img_MapBattleInfoHpBar` | `dump/data_9A31F8_9AD78C.bin` | `data/data_9A31F8.s:134` |
| 563 | 0x9AD868 | 204 | Graphics (4bpp) | `Img_MapBattleInfoNum` | `dump/data_9A31F8_9AD868.bin` | `data/data_9A31F8.s:138` |
| 564 | 0x9AD934 | 196 | Tilemap | `Tsa_ShopWindows` | `dump/data_9A31F8_9AD934.bin` | `data/data_9A31F8.s:142` |
| 565 | 0x9AD9F8 | 136 | Graphics (4bpp) | `Img_ShopGoldBox` | `dump/data_9A31F8_9AD9F8.bin` | `data/data_9A31F8.s:146` |
| 566 | 0x9ADA80 | 652 | Graphics (4bpp) | `Img_WallBreakAnim` | `dump/data_9A31F8_9ADA80.bin` | `data/data_9A31F8.s:150` |
| 567 | 0x9ADD0C | 64 | Palette | `Pal_WallBreakAnim` | `dump/data_9A31F8_9ADD0C.bin` | `data/data_9A31F8.s:154` |
| 568 | 0x9ADD4C | 356 | Graphics (4bpp) | `Img_GmapSoguSprites` | `dump/data_9A31F8_9ADD4C.bin` | `data/data_9A31F8.s:158` |
| 569 | 0x9ADEB0 | 852 | Graphics (4bpp) | `Img_PoisonAnim` | `dump/data_9A31F8_9ADEB0.bin` | `data/data_9A31F8.s:162` |
| 570 | 0x9AE204 | 32 | Palette | `Pal_PoisonAnim` | `dump/data_9A31F8_9AE204.bin` | `data/data_9A31F8.s:166` |
| 571 | 0x9AE224 | 608 | Graphics (4bpp) | `Img_LinkArenaWarpFx` | `dump/data_9A31F8_9AE224.bin` | `data/data_9A31F8.s:170` |
| 572 | 0x9AE484 | 32 | Palette | `Pal_LinkArenaWarpFx` | `dump/data_9A31F8_9AE484.bin` | `data/data_9A31F8.s:174` |
| 573 | 0x9AE4A4 | 768 | Unknown | `gUnknown_089AE4A4` | `dump/data_9A31F8_9AE4A4.bin` | `data/data_9A31F8.s:178` |
| 574 | 0x9AE7A4 | 32 | Graphics (4bpp) | `Img_089AE7A4` | `dump/data_9A31F8_9AE7A4.bin` | `data/data_9A31F8.s:182` |
| 575 | 0x9AE7C4 | 64 | Palette | `Pal_089AE7C4` | `dump/data_9A31F8_9AE7C4.bin` | `data/data_9A31F8.s:186` |
| 576 | 0x9AE804 | 2828 | Graphics (4bpp) | `Img_MapAnimAntitoxinPureWater` | `dump/data_9A31F8_9AE804.bin` | `data/data_9A31F8.s:190` |
| 577 | 0x9AF310 | 1536 | Unknown | `gUnknown_089AF310` | `dump/data_9A31F8_9AF310.bin` | `data/data_9A31F8.s:194` |
| 578 | 0x9AF910 | 32 | Palette | `Pal_MapAnimPureWater` | `dump/data_9A31F8_9AF910.bin` | `data/data_9A31F8.s:198` |
| 579 | 0x9AF930 | 32 | Palette | `Pal_MapAnimAntitoxin` | `dump/data_9A31F8_9AF930.bin` | `data/data_9A31F8.s:202` |
| 580 | 0x9AF950 | 372 | Unknown | `gUnknown_089AF950` | `dump/data_9A31F8_9AF950.bin` | `data/data_9A31F8.s:206` |
| 581 | 0x9AFAC4 | 504 | Unknown | `gUnknown_089AFAC4` | `dump/data_9A31F8_9AFAC4.bin` | `data/data_9A31F8.s:210` |
| 582 | 0x9AFCBC | 700 | Unknown | `gUnknown_089AFCBC` | `dump/data_9A31F8_9AFCBC.bin` | `data/data_9A31F8.s:214` |
| 583 | 0x9AFF78 | 64 | Palette | `Pal_089AFF78` | `dump/data_9A31F8_9AFF78.bin` | `data/data_9A31F8.s:218` |
| 584 | 0x9AFFB8 | 64 | Palette | `Pal_089AFFB8` | `dump/data_9A31F8_9AFFB8.bin` | `data/data_9A31F8.s:222` |
| 585 | 0x9AFFF8 | 988 | Unknown | `gUnknown_089AFFF8` | `dump/data_9A31F8_9AFFF8.bin` | `data/data_9A31F8.s:226` |
| 586 | 0x9B03D4 | 696 | Graphics (4bpp) | `Img_MapAnimTorchfx` | `dump/data_9A31F8_9B03D4.bin` | `data/data_9A31F8.s:230` |
| 587 | 0x9B068C | 32 | Palette | `Pal_MapAnimTorchfx` | `dump/data_9A31F8_9B068C.bin` | `data/data_9A31F8.s:234` |
| 588 | 0x9B06AC | 84 | Graphics (4bpp) | `Img_MapAnimUnlockObjfx` | `dump/data_9A31F8_9B06AC.bin` | `data/data_9A31F8.s:238` |
| 589 | 0x9B0700 | 32 | Palette | `Pal_MapAnimUnlockObjfx` | `dump/data_9A31F8_9B0700.bin` | `data/data_9A31F8.s:242` |
| 590 | 0x9B0720 | 256 | Graphics (4bpp) | `Img_MapAnimUnlockBgfx` | `dump/data_9A31F8_9B0720.bin` | `data/data_9A31F8.s:246` |
| 591 | 0x9B0820 | 32 | Palette | `Pal_MapAnimUnlockObjfx_Unk` | `dump/data_9A31F8_9B0820.bin` | `data/data_9A31F8.s:250` |
| 592 | 0x9B0840 | 36 | Tilemap | `Tsa_MapAnimUnlockBgfx` | `dump/data_9A31F8_9B0840.bin` | `data/data_9A31F8.s:254` |
| 593 | 0x9B0864 | 620 | Tilemap | `Tsa_089B0864` | `dump/data_9A31F8_9B0864.bin` | `data/data_9A31F8.s:258` |
| 594 | 0x9B0AD0 | 3284 | Graphics (4bpp) | `Img_MapAnimRepairfx` | `dump/data_9A31F8_9B0AD0.bin` | `data/data_9A31F8.s:262` |
| 595 | 0x9B17A4 | 620 | Tilemap | `Tsa_089B17A4` | `dump/data_9A31F8_9B17A4.bin` | `data/data_9A31F8.s:266` |
| 596 | 0x9B1A10 | 1024 | Unknown | `ApConf_MapAnimSleep` | `dump/data_9A31F8_9B1A10.bin` | `data/data_9A31F8.s:270` |
| 597 | 0x9B1E10 | 728 | Graphics (4bpp) | `Img_MapAnimBerserkfx` | `dump/data_9A31F8_9B1E10.bin` | `data/data_9A31F8.s:274` |
| 598 | 0x9B20E8 | 32 | Palette | `Pal_MapAnimBerserkfx` | `dump/data_9A31F8_9B20E8.bin` | `data/data_9A31F8.s:278` |
| 599 | 0x9B2108 | 208 | Unknown | `ApConf_MapAnimBerserkfx` | `dump/data_9A31F8_9B2108.bin` | `data/data_9A31F8.s:282` |
| 600 | 0x9B21D8 | 1088 | Graphics (4bpp) | `Img_ManimSilenceObjfx` | `dump/data_9A31F8_9B21D8.bin` | `data/data_9A31F8.s:286` |
| 601 | 0x9B2618 | 272 | Graphics (4bpp) | `Img_ManimSilenceBgfx` | `dump/data_9A31F8_9B2618.bin` | `data/data_9A31F8.s:290` |
| 602 | 0x9B2728 | 32 | Palette | `Pal_ManimSilencefx` | `dump/data_9A31F8_9B2728.bin` | `data/data_9A31F8.s:294` |
| 603 | 0x9B2748 | 312 | Unknown | `ApConf_ManimSilencefx` | `dump/data_9A31F8_9B2748.bin` | `data/data_9A31F8.s:298` |
| 604 | 0x9B2880 | 3004 | Graphics (4bpp) | `Img_ManimBarrierBgfx` | `dump/data_9A31F8_9B2880.bin` | `data/data_9A31F8.s:302` |
| 605 | 0x9B343C | 404 | Tilemap | `Tsa_089B343C` | `dump/data_9A31F8_9B343C.bin` | `data/data_9A31F8.s:306` |
| 606 | 0x9B35D0 | 5676 | Graphics (4bpp) | `Img_NightMareMapAnimfx` | `dump/data_9A31F8_9B35D0.bin` | `data/data_9A31F8.s:310` |
| 607 | 0x9B4BFC | 32 | Palette | `Pal_NightMareMapAnimfx` | `dump/data_9A31F8_9B4BFC.bin` | `data/data_9A31F8.s:314` |
| 608 | 0x9B4C1C | 100 | Tilemap | `Tsa_NightMareMapAnimfx1` | `dump/data_9A31F8_9B4C1C.bin` | `data/data_9A31F8.s:318` |
| 609 | 0x9B4C80 | 104 | Tilemap | `Tsa_NightMareMapAnimfx2` | `dump/data_9A31F8_9B4C80.bin` | `data/data_9A31F8.s:322` |
| 610 | 0x9B4CE8 | 124 | Tilemap | `Tsa_NightMareMapAnimfx3` | `dump/data_9A31F8_9B4CE8.bin` | `data/data_9A31F8.s:326` |
| 611 | 0x9B4D64 | 120 | Tilemap | `Tsa_NightMareMapAnimfx4` | `dump/data_9A31F8_9B4D64.bin` | `data/data_9A31F8.s:330` |
| 612 | 0x9B4DDC | 112 | Tilemap | `Tsa_NightMareMapAnimfx5` | `dump/data_9A31F8_9B4DDC.bin` | `data/data_9A31F8.s:334` |
| 613 | 0x9B4E4C | 108 | Tilemap | `Tsa_NightMareMapAnimfx6` | `dump/data_9A31F8_9B4E4C.bin` | `data/data_9A31F8.s:338` |
| 614 | 0x9B4EB8 | 116 | Tilemap | `Tsa_NightMareMapAnimfx7` | `dump/data_9A31F8_9B4EB8.bin` | `data/data_9A31F8.s:342` |
| 615 | 0x9B4F2C | 120 | Tilemap | `Tsa_NightMareMapAnimfx8` | `dump/data_9A31F8_9B4F2C.bin` | `data/data_9A31F8.s:346` |
| 616 | 0x9B4FA4 | 120 | Tilemap | `Tsa_NightMareMapAnimfx9` | `dump/data_9A31F8_9B4FA4.bin` | `data/data_9A31F8.s:350` |
| 617 | 0x9B501C | 120 | Tilemap | `Tsa_NightMareMapAnimfx10` | `dump/data_9A31F8_9B501C.bin` | `data/data_9A31F8.s:354` |
| 618 | 0x9B5094 | 132 | Tilemap | `Tsa_NightMareMapAnimfx11` | `dump/data_9A31F8_9B5094.bin` | `data/data_9A31F8.s:358` |
| 619 | 0x9B5118 | 132 | Tilemap | `Tsa_NightMareMapAnimfx12` | `dump/data_9A31F8_9B5118.bin` | `data/data_9A31F8.s:362` |
| 620 | 0x9B519C | 132 | Tilemap | `Tsa_NightMareMapAnimfx13` | `dump/data_9A31F8_9B519C.bin` | `data/data_9A31F8.s:366` |
| 621 | 0x9B5220 | 132 | Tilemap | `Tsa_NightMareMapAnimfx14` | `dump/data_9A31F8_9B5220.bin` | `data/data_9A31F8.s:370` |
| 622 | 0x9B52A4 | 108 | Tilemap | `Tsa_NightMareMapAnimfx15` | `dump/data_9A31F8_9B52A4.bin` | `data/data_9A31F8.s:374` |
| 623 | 0x9B5310 | 136 | Tilemap | `Tsa_NightMareMapAnimfx16` | `dump/data_9A31F8_9B5310.bin` | `data/data_9A31F8.s:378` |
| 624 | 0x9B5398 | 156 | Tilemap | `Tsa_NightMareMapAnimfx17` | `dump/data_9A31F8_9B5398.bin` | `data/data_9A31F8.s:382` |
| 625 | 0x9B5434 | 188 | Tilemap | `Tsa_NightMareMapAnimfx18` | `dump/data_9A31F8_9B5434.bin` | `data/data_9A31F8.s:386` |
| 626 | 0x9B54F0 | 252 | Tilemap | `Tsa_NightMareMapAnimfx19` | `dump/data_9A31F8_9B54F0.bin` | `data/data_9A31F8.s:390` |
| 627 | 0x9B55EC | 308 | Tilemap | `Tsa_NightMareMapAnimfx20` | `dump/data_9A31F8_9B55EC.bin` | `data/data_9A31F8.s:394` |
| 628 | 0x9B5720 | 444 | Tilemap | `Tsa_NightMareMapAnimfx21` | `dump/data_9A31F8_9B5720.bin` | `data/data_9A31F8.s:398` |
| 629 | 0x9B58DC | 604 | Tilemap | `Tsa_NightMareMapAnimfx22` | `dump/data_9A31F8_9B58DC.bin` | `data/data_9A31F8.s:402` |
| 630 | 0x9B5B38 | 308 | Tilemap | `Tsa_NightMareMapAnimfx23` | `dump/data_9A31F8_9B5B38.bin` | `data/data_9A31F8.s:406` |
| 631 | 0x9B5C6C | 416 | Tilemap | `Tsa_NightMareMapAnimfx24` | `dump/data_9A31F8_9B5C6C.bin` | `data/data_9A31F8.s:410` |
| 632 | 0x9B5E0C | 580 | Tilemap | `Tsa_NightMareMapAnimfx25` | `dump/data_9A31F8_9B5E0C.bin` | `data/data_9A31F8.s:414` |
| 633 | 0x9B6050 | 292 | Tilemap | `Tsa_NightMareMapAnimfx26` | `dump/data_9A31F8_9B6050.bin` | `data/data_9A31F8.s:418` |
| 634 | 0x9B6174 | 408 | Tilemap | `Tsa_NightMareMapAnimfx27` | `dump/data_9A31F8_9B6174.bin` | `data/data_9A31F8.s:422` |
| 635 | 0x9B630C | 516 | Tilemap | `Tsa_NightMareMapAnimfx28` | `dump/data_9A31F8_9B630C.bin` | `data/data_9A31F8.s:426` |
| 636 | 0x9B6510 | 196 | Tilemap | `Tsa_NightMareMapAnimfx29` | `dump/data_9A31F8_9B6510.bin` | `data/data_9A31F8.s:430` |
| 637 | 0x9B65D4 | 232 | Tilemap | `Tsa_NightMareMapAnimfx30` | `dump/data_9A31F8_9B65D4.bin` | `data/data_9A31F8.s:434` |
| 638 | 0x9B66BC | 332 | Tilemap | `Tsa_NightMareMapAnimfx31` | `dump/data_9A31F8_9B66BC.bin` | `data/data_9A31F8.s:438` |
| 639 | 0x9B6808 | 436 | Tilemap | `Tsa_NightMareMapAnimfx32` | `dump/data_9A31F8_9B6808.bin` | `data/data_9A31F8.s:442` |
| 640 | 0x9B69BC | 228 | Tilemap | `Tsa_NightMareMapAnimfx33` | `dump/data_9A31F8_9B69BC.bin` | `data/data_9A31F8.s:446` |
| 641 | 0x9B6AA0 | 2356 | Graphics (4bpp) | `Img_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B6AA0.bin` | `data/data_9A31F8.s:450` |
| 642 | 0x9B73D4 | 32 | Palette | `Pal_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B73D4.bin` | `data/data_9A31F8.s:454` |
| 643 | 0x9B73F4 | 32 | Unknown | `Tsa1_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B73F4.bin` | `data/data_9A31F8.s:458` |
| 644 | 0x9B7414 | 40 | Unknown | `Tsa2_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B7414.bin` | `data/data_9A31F8.s:462` |
| 645 | 0x9B743C | 44 | Unknown | `Tsa3_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B743C.bin` | `data/data_9A31F8.s:466` |
| 646 | 0x9B7468 | 52 | Unknown | `Tsa4_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B7468.bin` | `data/data_9A31F8.s:470` |
| 647 | 0x9B749C | 56 | Unknown | `Tsa5_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B749C.bin` | `data/data_9A31F8.s:474` |
| 648 | 0x9B74D4 | 64 | Unknown | `Tsa6_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B74D4.bin` | `data/data_9A31F8.s:478` |
| 649 | 0x9B7514 | 64 | Unknown | `Tsa7_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B7514.bin` | `data/data_9A31F8.s:482` |
| 650 | 0x9B7554 | 72 | Unknown | `Tsa8_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B7554.bin` | `data/data_9A31F8.s:486` |
| 651 | 0x9B759C | 60 | Unknown | `Tsa9_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B759C.bin` | `data/data_9A31F8.s:490` |
| 652 | 0x9B75D8 | 56 | Unknown | `Tsa10_MonsterStoneMapAnimfx` | `dump/data_9A31F8_9B75D8.bin` | `data/data_9A31F8.s:494` |
| 653 | 0x9B7610 | 2740 | Graphics (4bpp) | `Img_GorgonHatchCloud` | `dump/data_9A31F8_9B7610.bin` | `data/data_9A31F8.s:498` |
| 654 | 0x9B80C4 | 32 | Palette | `Pal_GorgonHatchCloud` | `dump/data_9A31F8_9B80C4.bin` | `data/data_9A31F8.s:502` |
| 655 | 0x9B80E4 | 92 | Tilemap | `Tsa_GorgonHatchCloud_A` | `dump/data_9A31F8_9B80E4.bin` | `data/data_9A31F8.s:506` |
| 656 | 0x9B8140 | 100 | Tilemap | `Tsa_GorgonHatchCloud_B` | `dump/data_9A31F8_9B8140.bin` | `data/data_9A31F8.s:510` |
| 657 | 0x9B81A4 | 112 | Tilemap | `Tsa_GorgonHatchCloud_C` | `dump/data_9A31F8_9B81A4.bin` | `data/data_9A31F8.s:514` |
| 658 | 0x9B8214 | 120 | Tilemap | `Tsa_GorgonHatchCloud_D` | `dump/data_9A31F8_9B8214.bin` | `data/data_9A31F8.s:518` |
| 659 | 0x9B828C | 100 | Tilemap | `Tsa_GorgonHatchCloud_E` | `dump/data_9A31F8_9B828C.bin` | `data/data_9A31F8.s:522` |
| 660 | 0x9B82F0 | 108 | Tilemap | `Tsa_GorgonHatchCloud_F` | `dump/data_9A31F8_9B82F0.bin` | `data/data_9A31F8.s:526` |
| 661 | 0x9B835C | 100 | Tilemap | `Tsa_GorgonHatchCloud_G` | `dump/data_9A31F8_9B835C.bin` | `data/data_9A31F8.s:530` |
| 662 | 0x9B83C0 | 1540 | Unknown | `gUnknown_089B83C0` | `dump/data_9A31F8_9B83C0.bin` | `data/data_9A31F8.s:534` |
| 663 | 0x9B89C4 | 1812 | Unknown | `gUnknown_089B89C4` | `dump/data_9A31F8_9B89C4.bin` | `data/data_9A31F8.s:538` |
| 664 | 0x9B90D8 | 2052 | Unknown | `gUnknown_089B90D8` | `dump/data_9A31F8_9B90D8.bin` | `data/data_9A31F8.s:542` |
| 665 | 0x9B98DC | 2228 | Unknown | `gUnknown_089B98DC` | `dump/data_9A31F8_9B98DC.bin` | `data/data_9A31F8.s:546` |
| 666 | 0x9BA190 | 2120 | Unknown | `gUnknown_089BA190` | `dump/data_9A31F8_9BA190.bin` | `data/data_9A31F8.s:550` |
| 667 | 0x9BA9D8 | 2288 | Unknown | `gUnknown_089BA9D8` | `dump/data_9A31F8_9BA9D8.bin` | `data/data_9A31F8.s:554` |
| 668 | 0x9BB2C8 | 2720 | Unknown | `gUnknown_089BB2C8` | `dump/data_9A31F8_9BB2C8.bin` | `data/data_9A31F8.s:558` |
| 669 | 0x9BBD68 | 2844 | Unknown | `gUnknown_089BBD68` | `dump/data_9A31F8_9BBD68.bin` | `data/data_9A31F8.s:562` |
| 670 | 0x9BC884 | 2864 | Unknown | `gUnknown_089BC884` | `dump/data_9A31F8_9BC884.bin` | `data/data_9A31F8.s:566` |
| 671 | 0x9BD3B4 | 2868 | Unknown | `gUnknown_089BD3B4` | `dump/data_9A31F8_9BD3B4.bin` | `data/data_9A31F8.s:570` |
| 672 | 0x9BDEE8 | 2984 | Unknown | `gUnknown_089BDEE8` | `dump/data_9A31F8_9BDEE8.bin` | `data/data_9A31F8.s:574` |
| 673 | 0x9BEA90 | 2924 | Unknown | `gUnknown_089BEA90` | `dump/data_9A31F8_9BEA90.bin` | `data/data_9A31F8.s:578` |
| 674 | 0x9BF5FC | 2408 | Unknown | `gUnknown_089BF5FC` | `dump/data_9A31F8_9BF5FC.bin` | `data/data_9A31F8.s:582` |
| 675 | 0x9BFF64 | 2396 | Unknown | `gUnknown_089BFF64` | `dump/data_9A31F8_9BFF64.bin` | `data/data_9A31F8.s:586` |
| 676 | 0x9C08C0 | 2256 | Unknown | `gUnknown_089C08C0` | `dump/data_9A31F8_9C08C0.bin` | `data/data_9A31F8.s:590` |
| 677 | 0x9C1190 | 2584 | Unknown | `gUnknown_089C1190` | `dump/data_9A31F8_9C1190.bin` | `data/data_9A31F8.s:594` |
| 678 | 0x9C1BA8 | 2260 | Unknown | `gUnknown_089C1BA8` | `dump/data_9A31F8_9C1BA8.bin` | `data/data_9A31F8.s:598` |
| 679 | 0x9C247C | 1908 | Unknown | `gUnknown_089C247C` | `dump/data_9A31F8_9C247C.bin` | `data/data_9A31F8.s:602` |
| 680 | 0x9C2BF0 | 1716 | Unknown | `gUnknown_089C2BF0` | `dump/data_9A31F8_9C2BF0.bin` | `data/data_9A31F8.s:606` |
| 681 | 0x9C32A4 | 1796 | Unknown | `gUnknown_089C32A4` | `dump/data_9A31F8_9C32A4.bin` | `data/data_9A31F8.s:610` |
| 682 | 0x9C39A8 | 1344 | Unknown | `gUnknown_089C39A8` | `dump/data_9A31F8_9C39A8.bin` | `data/data_9A31F8.s:614` |
| 683 | 0x9C3EE8 | 1428 | Unknown | `gUnknown_089C3EE8` | `dump/data_9A31F8_9C3EE8.bin` | `data/data_9A31F8.s:618` |
| 684 | 0x9C447C | 952 | Unknown | `gUnknown_089C447C` | `dump/data_9A31F8_9C447C.bin` | `data/data_9A31F8.s:622` |
| 685 | 0x9C4834 | 172 | Unknown | `gUnknown_089C4834` | `dump/data_9A31F8_9C4834.bin` | `data/data_9A31F8.s:626` |
| 686 | 0x9C48E0 | 124 | Unknown | `gUnknown_089C48E0` | `dump/data_9A31F8_9C48E0.bin` | `data/data_9A31F8.s:630` |
| 687 | 0x9C495C | 112 | Unknown | `gUnknown_089C495C` | `dump/data_9A31F8_9C495C.bin` | `data/data_9A31F8.s:634` |
| 688 | 0x9C49CC | 1132 | Unknown | `gUnknown_089C49CC` | `dump/data_9A31F8_9C49CC.bin` | `data/data_9A31F8.s:638` |
| 689 | 0x9C4E38 | 1264 | Unknown | `gUnknown_089C4E38` | `dump/data_9A31F8_9C4E38.bin` | `data/data_9A31F8.s:642` |
| 690 | 0x9C5328 | 844 | Unknown | `gUnknown_089C5328` | `dump/data_9A31F8_9C5328.bin` | `data/data_9A31F8.s:646` |
| 691 | 0x9C5674 | 192 | Unknown | `gUnknown_089C5674` | `dump/data_9A31F8_9C5674.bin` | `data/data_9A31F8.s:650` |
| 692 | 0x9C5734 | 164 | Unknown | `gUnknown_089C5734` | `dump/data_9A31F8_9C5734.bin` | `data/data_9A31F8.s:654` |
| 693 | 0x9C57D8 | 1944 | Unknown | `gUnknown_089C57D8` | `dump/data_9A31F8_9C57D8.bin` | `data/data_9A31F8.s:658` |
| 694 | 0x9C5F70 | 1660 | Unknown | `gUnknown_089C5F70` | `dump/data_9A31F8_9C5F70.bin` | `data/data_9A31F8.s:662` |
| 695 | 0x9C65EC | 1132 | Unknown | `gUnknown_089C65EC` | `dump/data_9A31F8_9C65EC.bin` | `data/data_9A31F8.s:666` |
| 696 | 0x9C6A58 | 200 | Unknown | `gUnknown_089C6A58` | `dump/data_9A31F8_9C6A58.bin` | `data/data_9A31F8.s:670` |
| 697 | 0x9C6B20 | 1884 | Unknown | `gUnknown_089C6B20` | `dump/data_9A31F8_9C6B20.bin` | `data/data_9A31F8.s:674` |
| 698 | 0x9C727C | 1968 | Unknown | `gUnknown_089C727C` | `dump/data_9A31F8_9C727C.bin` | `data/data_9A31F8.s:678` |
| 699 | 0x9C7A2C | 2580 | Unknown | `gUnknown_089C7A2C` | `dump/data_9A31F8_9C7A2C.bin` | `data/data_9A31F8.s:682` |
| 700 | 0x9C8440 | 2436 | Unknown | `gUnknown_089C8440` | `dump/data_9A31F8_9C8440.bin` | `data/data_9A31F8.s:686` |
| 701 | 0x9C8DC4 | 3200 | Unknown | `gUnknown_089C8DC4` | `dump/data_9A31F8_9C8DC4.bin` | `data/data_9A31F8.s:690` |
| 702 | 0x9C9A44 | 2560 | Unknown | `gUnknown_089C9A44` | `dump/data_9A31F8_9C9A44.bin` | `data/data_9A31F8.s:694` |
| 703 | 0x9CA444 | 1484 | Unknown | `gUnknown_089CA444` | `dump/data_9A31F8_9CA444.bin` | `data/data_9A31F8.s:698` |
| 704 | 0x9CAA10 | 3488 | Unknown | `gUnknown_089CAA10` | `dump/data_9A31F8_9CAA10.bin` | `data/data_9A31F8.s:702` |
| 705 | 0x9CB7B0 | 4728 | Unknown | `gUnknown_089CB7B0` | `dump/data_9A31F8_9CB7B0.bin` | `data/data_9A31F8.s:706` |
| 706 | 0x9CCA28 | 1124 | Unknown | `gUnknown_089CCA28` | `dump/data_9A31F8_9CCA28.bin` | `data/data_9A31F8.s:710` |
| 707 | 0x9CCE8C | 1988 | Unknown | `gUnknown_089CCE8C` | `dump/data_9A31F8_9CCE8C.bin` | `data/data_9A31F8.s:714` |
| 708 | 0x9CD650 | 2536 | Unknown | `gUnknown_089CD650` | `dump/data_9A31F8_9CD650.bin` | `data/data_9A31F8.s:718` |
| 709 | 0x9CE038 | 2908 | Unknown | `gUnknown_089CE038` | `dump/data_9A31F8_9CE038.bin` | `data/data_9A31F8.s:722` |
| 710 | 0x9CEB94 | 3116 | Unknown | `gUnknown_089CEB94` | `dump/data_9A31F8_9CEB94.bin` | `data/data_9A31F8.s:726` |
| 711 | 0x9CF7C0 | 3020 | Unknown | `gUnknown_089CF7C0` | `dump/data_9A31F8_9CF7C0.bin` | `data/data_9A31F8.s:730` |
| 712 | 0x9D038C | 2684 | Unknown | `gUnknown_089D038C` | `dump/data_9A31F8_9D038C.bin` | `data/data_9A31F8.s:734` |
| 713 | 0x9D0E08 | 2112 | Unknown | `gUnknown_089D0E08` | `dump/data_9A31F8_9D0E08.bin` | `data/data_9A31F8.s:738` |
| 714 | 0x9D1648 | 1628 | Unknown | `gUnknown_089D1648` | `dump/data_9A31F8_9D1648.bin` | `data/data_9A31F8.s:742` |
| 715 | 0x9D1CA4 | 1084 | Unknown | `gUnknown_089D1CA4` | `dump/data_9A31F8_9D1CA4.bin` | `data/data_9A31F8.s:746` |
| 716 | 0x9D20E0 | 556 | Unknown | `gUnknown_089D20E0` | `dump/data_9A31F8_9D20E0.bin` | `data/data_9A31F8.s:750` |
| 717 | 0x9D230C | 204 | Unknown | `gUnknown_089D230C` | `dump/data_9A31F8_9D230C.bin` | `data/data_9A31F8.s:754` |
| 718 | 0x9D23D8 | 32 | Unknown | `gUnknown_089D23D8` | `dump/data_9A31F8_9D23D8.bin` | `data/data_9A31F8.s:758` |
| 719 | 0x9D23F8 | 32 | Unknown | `gUnknown_089D23F8` | `dump/data_9A31F8_9D23F8.bin` | `data/data_9A31F8.s:762` |
| 720 | 0x9D2418 | 32 | Unknown | `gUnknown_089D2418` | `dump/data_9A31F8_9D2418.bin` | `data/data_9A31F8.s:766` |
| 721 | 0x9D2438 | 32 | Unknown | `gUnknown_089D2438` | `dump/data_9A31F8_9D2438.bin` | `data/data_9A31F8.s:770` |
| 722 | 0x9D2458 | 32 | Unknown | `gUnknown_089D2458` | `dump/data_9A31F8_9D2458.bin` | `data/data_9A31F8.s:774` |
| 723 | 0x9D2478 | 32 | Unknown | `gUnknown_089D2478` | `dump/data_9A31F8_9D2478.bin` | `data/data_9A31F8.s:778` |
| 724 | 0x9D2498 | 32 | Unknown | `gUnknown_089D2498` | `dump/data_9A31F8_9D2498.bin` | `data/data_9A31F8.s:782` |
| 725 | 0x9D24B8 | 32 | Unknown | `gUnknown_089D24B8` | `dump/data_9A31F8_9D24B8.bin` | `data/data_9A31F8.s:786` |
| 726 | 0x9D24D8 | 32 | Unknown | `gUnknown_089D24D8` | `dump/data_9A31F8_9D24D8.bin` | `data/data_9A31F8.s:790` |
| 727 | 0x9D24F8 | 32 | Unknown | `gUnknown_089D24F8` | `dump/data_9A31F8_9D24F8.bin` | `data/data_9A31F8.s:794` |
| 728 | 0x9D2518 | 32 | Unknown | `gUnknown_089D2518` | `dump/data_9A31F8_9D2518.bin` | `data/data_9A31F8.s:798` |
| 729 | 0x9D2538 | 32 | Unknown | `gUnknown_089D2538` | `dump/data_9A31F8_9D2538.bin` | `data/data_9A31F8.s:802` |
| 730 | 0x9D2558 | 32 | Unknown | `gUnknown_089D2558` | `dump/data_9A31F8_9D2558.bin` | `data/data_9A31F8.s:806` |
| 731 | 0x9D2578 | 32 | Unknown | `gUnknown_089D2578` | `dump/data_9A31F8_9D2578.bin` | `data/data_9A31F8.s:810` |
| 732 | 0x9D2598 | 32 | Unknown | `gUnknown_089D2598` | `dump/data_9A31F8_9D2598.bin` | `data/data_9A31F8.s:814` |
| 733 | 0x9D25B8 | 32 | Unknown | `gUnknown_089D25B8` | `dump/data_9A31F8_9D25B8.bin` | `data/data_9A31F8.s:818` |
| 734 | 0x9D25D8 | 32 | Unknown | `gUnknown_089D25D8` | `dump/data_9A31F8_9D25D8.bin` | `data/data_9A31F8.s:822` |
| 735 | 0x9D25F8 | 32 | Unknown | `gUnknown_089D25F8` | `dump/data_9A31F8_9D25F8.bin` | `data/data_9A31F8.s:826` |
| 736 | 0x9D2618 | 32 | Unknown | `gUnknown_089D2618` | `dump/data_9A31F8_9D2618.bin` | `data/data_9A31F8.s:830` |
| 737 | 0x9D2638 | 32 | Unknown | `gUnknown_089D2638` | `dump/data_9A31F8_9D2638.bin` | `data/data_9A31F8.s:834` |
| 738 | 0x9D2658 | 32 | Unknown | `gUnknown_089D2658` | `dump/data_9A31F8_9D2658.bin` | `data/data_9A31F8.s:838` |
| 739 | 0x9D2678 | 32 | Unknown | `gUnknown_089D2678` | `dump/data_9A31F8_9D2678.bin` | `data/data_9A31F8.s:842` |
| 740 | 0x9D2698 | 32 | Unknown | `gUnknown_089D2698` | `dump/data_9A31F8_9D2698.bin` | `data/data_9A31F8.s:846` |
| 741 | 0x9D26B8 | 32 | Unknown | `gUnknown_089D26B8` | `dump/data_9A31F8_9D26B8.bin` | `data/data_9A31F8.s:850` |
| 742 | 0x9D26D8 | 32 | Unknown | `gUnknown_089D26D8` | `dump/data_9A31F8_9D26D8.bin` | `data/data_9A31F8.s:854` |
| 743 | 0x9D26F8 | 32 | Unknown | `gUnknown_089D26F8` | `dump/data_9A31F8_9D26F8.bin` | `data/data_9A31F8.s:858` |
| 744 | 0x9D2718 | 32 | Unknown | `gUnknown_089D2718` | `dump/data_9A31F8_9D2718.bin` | `data/data_9A31F8.s:862` |
| 745 | 0x9D2738 | 32 | Unknown | `gUnknown_089D2738` | `dump/data_9A31F8_9D2738.bin` | `data/data_9A31F8.s:866` |
| 746 | 0x9D2758 | 32 | Unknown | `gUnknown_089D2758` | `dump/data_9A31F8_9D2758.bin` | `data/data_9A31F8.s:870` |
| 747 | 0x9D2778 | 32 | Unknown | `gUnknown_089D2778` | `dump/data_9A31F8_9D2778.bin` | `data/data_9A31F8.s:874` |
| 748 | 0x9D2798 | 32 | Unknown | `gUnknown_089D2798` | `dump/data_9A31F8_9D2798.bin` | `data/data_9A31F8.s:878` |
| 749 | 0x9D27B8 | 32 | Unknown | `gUnknown_089D27B8` | `dump/data_9A31F8_9D27B8.bin` | `data/data_9A31F8.s:882` |
| 750 | 0x9D27D8 | 32 | Unknown | `gUnknown_089D27D8` | `dump/data_9A31F8_9D27D8.bin` | `data/data_9A31F8.s:886` |
| 751 | 0x9D27F8 | 32 | Unknown | `gUnknown_089D27F8` | `dump/data_9A31F8_9D27F8.bin` | `data/data_9A31F8.s:890` |
| 752 | 0x9D2818 | 32 | Unknown | `gUnknown_089D2818` | `dump/data_9A31F8_9D2818.bin` | `data/data_9A31F8.s:894` |
| 753 | 0x9D2838 | 32 | Unknown | `gUnknown_089D2838` | `dump/data_9A31F8_9D2838.bin` | `data/data_9A31F8.s:898` |
| 754 | 0x9D2858 | 32 | Unknown | `gUnknown_089D2858` | `dump/data_9A31F8_9D2858.bin` | `data/data_9A31F8.s:902` |
| 755 | 0x9D2878 | 32 | Unknown | `gUnknown_089D2878` | `dump/data_9A31F8_9D2878.bin` | `data/data_9A31F8.s:906` |
| 756 | 0x9D2898 | 32 | Unknown | `gUnknown_089D2898` | `dump/data_9A31F8_9D2898.bin` | `data/data_9A31F8.s:910` |
| 757 | 0x9D28B8 | 32 | Unknown | `gUnknown_089D28B8` | `dump/data_9A31F8_9D28B8.bin` | `data/data_9A31F8.s:914` |
| 758 | 0x9D28D8 | 32 | Unknown | `gUnknown_089D28D8` | `dump/data_9A31F8_9D28D8.bin` | `data/data_9A31F8.s:918` |
| 759 | 0x9D28F8 | 32 | Unknown | `gUnknown_089D28F8` | `dump/data_9A31F8_9D28F8.bin` | `data/data_9A31F8.s:922` |
| 760 | 0x9D2918 | 32 | Unknown | `gUnknown_089D2918` | `dump/data_9A31F8_9D2918.bin` | `data/data_9A31F8.s:926` |
| 761 | 0x9D2938 | 32 | Unknown | `gUnknown_089D2938` | `dump/data_9A31F8_9D2938.bin` | `data/data_9A31F8.s:930` |
| 762 | 0x9D2958 | 32 | Unknown | `gUnknown_089D2958` | `dump/data_9A31F8_9D2958.bin` | `data/data_9A31F8.s:934` |
| 763 | 0x9D2978 | 32 | Unknown | `gUnknown_089D2978` | `dump/data_9A31F8_9D2978.bin` | `data/data_9A31F8.s:938` |
| 764 | 0x9D2998 | 32 | Unknown | `gUnknown_089D2998` | `dump/data_9A31F8_9D2998.bin` | `data/data_9A31F8.s:942` |
| 765 | 0x9D29B8 | 32 | Unknown | `gUnknown_089D29B8` | `dump/data_9A31F8_9D29B8.bin` | `data/data_9A31F8.s:946` |
| 766 | 0x9D29D8 | 32 | Unknown | `gUnknown_089D29D8` | `dump/data_9A31F8_9D29D8.bin` | `data/data_9A31F8.s:950` |
| 767 | 0x9D29F8 | 32 | Unknown | `gUnknown_089D29F8` | `dump/data_9A31F8_9D29F8.bin` | `data/data_9A31F8.s:954` |
| 768 | 0x9D2A18 | 32 | Unknown | `gUnknown_089D2A18` | `dump/data_9A31F8_9D2A18.bin` | `data/data_9A31F8.s:958` |
| 769 | 0x9D2A38 | 32 | Unknown | `gUnknown_089D2A38` | `dump/data_9A31F8_9D2A38.bin` | `data/data_9A31F8.s:962` |
| 770 | 0x9D2A58 | 32 | Unknown | `gUnknown_089D2A58` | `dump/data_9A31F8_9D2A58.bin` | `data/data_9A31F8.s:966` |
| 771 | 0x9D2A78 | 32 | Unknown | `gUnknown_089D2A78` | `dump/data_9A31F8_9D2A78.bin` | `data/data_9A31F8.s:970` |
| 772 | 0x9D2A98 | 32 | Unknown | `gUnknown_089D2A98` | `dump/data_9A31F8_9D2A98.bin` | `data/data_9A31F8.s:974` |
| 773 | 0x9D2AB8 | 32 | Unknown | `gUnknown_089D2AB8` | `dump/data_9A31F8_9D2AB8.bin` | `data/data_9A31F8.s:978` |
| 774 | 0x9D2AD8 | 344 | Unknown | `gUnknown_089D2AD8` | `dump/data_9A31F8_9D2AD8.bin` | `data/data_9A31F8.s:982` |
| 775 | 0x9D2C30 | 400 | Unknown | `gUnknown_089D2C30` | `dump/data_9A31F8_9D2C30.bin` | `data/data_9A31F8.s:986` |
| 776 | 0x9D2DC0 | 440 | Unknown | `gUnknown_089D2DC0` | `dump/data_9A31F8_9D2DC0.bin` | `data/data_9A31F8.s:990` |
| 777 | 0x9D2F78 | 440 | Unknown | `gUnknown_089D2F78` | `dump/data_9A31F8_9D2F78.bin` | `data/data_9A31F8.s:994` |
| 778 | 0x9D3130 | 424 | Unknown | `gUnknown_089D3130` | `dump/data_9A31F8_9D3130.bin` | `data/data_9A31F8.s:998` |
| 779 | 0x9D32D8 | 456 | Unknown | `gUnknown_089D32D8` | `dump/data_9A31F8_9D32D8.bin` | `data/data_9A31F8.s:1002` |
| 780 | 0x9D34A0 | 528 | Unknown | `gUnknown_089D34A0` | `dump/data_9A31F8_9D34A0.bin` | `data/data_9A31F8.s:1006` |
| 781 | 0x9D36B0 | 540 | Unknown | `gUnknown_089D36B0` | `dump/data_9A31F8_9D36B0.bin` | `data/data_9A31F8.s:1010` |
| 782 | 0x9D38CC | 520 | Unknown | `gUnknown_089D38CC` | `dump/data_9A31F8_9D38CC.bin` | `data/data_9A31F8.s:1014` |
| 783 | 0x9D3AD4 | 548 | Unknown | `gUnknown_089D3AD4` | `dump/data_9A31F8_9D3AD4.bin` | `data/data_9A31F8.s:1018` |
| 784 | 0x9D3CF8 | 552 | Unknown | `gUnknown_089D3CF8` | `dump/data_9A31F8_9D3CF8.bin` | `data/data_9A31F8.s:1022` |
| 785 | 0x9D3F20 | 560 | Unknown | `gUnknown_089D3F20` | `dump/data_9A31F8_9D3F20.bin` | `data/data_9A31F8.s:1026` |
| 786 | 0x9D4150 | 476 | Unknown | `gUnknown_089D4150` | `dump/data_9A31F8_9D4150.bin` | `data/data_9A31F8.s:1030` |
| 787 | 0x9D432C | 468 | Unknown | `gUnknown_089D432C` | `dump/data_9A31F8_9D432C.bin` | `data/data_9A31F8.s:1034` |
| 788 | 0x9D4500 | 452 | Unknown | `gUnknown_089D4500` | `dump/data_9A31F8_9D4500.bin` | `data/data_9A31F8.s:1038` |
| 789 | 0x9D46C4 | 488 | Unknown | `gUnknown_089D46C4` | `dump/data_9A31F8_9D46C4.bin` | `data/data_9A31F8.s:1042` |
| 790 | 0x9D48AC | 436 | Unknown | `gUnknown_089D48AC` | `dump/data_9A31F8_9D48AC.bin` | `data/data_9A31F8.s:1046` |
| 791 | 0x9D4A60 | 412 | Unknown | `gUnknown_089D4A60` | `dump/data_9A31F8_9D4A60.bin` | `data/data_9A31F8.s:1050` |
| 792 | 0x9D4BFC | 376 | Unknown | `gUnknown_089D4BFC` | `dump/data_9A31F8_9D4BFC.bin` | `data/data_9A31F8.s:1054` |
| 793 | 0x9D4D74 | 344 | Unknown | `gUnknown_089D4D74` | `dump/data_9A31F8_9D4D74.bin` | `data/data_9A31F8.s:1058` |
| 794 | 0x9D4ECC | 272 | Unknown | `gUnknown_089D4ECC` | `dump/data_9A31F8_9D4ECC.bin` | `data/data_9A31F8.s:1062` |
| 795 | 0x9D4FDC | 292 | Unknown | `gUnknown_089D4FDC` | `dump/data_9A31F8_9D4FDC.bin` | `data/data_9A31F8.s:1066` |
| 796 | 0x9D5100 | 276 | Unknown | `gUnknown_089D5100` | `dump/data_9A31F8_9D5100.bin` | `data/data_9A31F8.s:1070` |
| 797 | 0x9D5214 | 188 | Unknown | `gUnknown_089D5214` | `dump/data_9A31F8_9D5214.bin` | `data/data_9A31F8.s:1074` |
| 798 | 0x9D52D0 | 188 | Unknown | `gUnknown_089D52D0` | `dump/data_9A31F8_9D52D0.bin` | `data/data_9A31F8.s:1078` |
| 799 | 0x9D538C | 180 | Unknown | `gUnknown_089D538C` | `dump/data_9A31F8_9D538C.bin` | `data/data_9A31F8.s:1082` |
| 800 | 0x9D5440 | 256 | Unknown | `gUnknown_089D5440` | `dump/data_9A31F8_9D5440.bin` | `data/data_9A31F8.s:1086` |
| 801 | 0x9D5540 | 280 | Unknown | `gUnknown_089D5540` | `dump/data_9A31F8_9D5540.bin` | `data/data_9A31F8.s:1090` |
| 802 | 0x9D5658 | 268 | Unknown | `gUnknown_089D5658` | `dump/data_9A31F8_9D5658.bin` | `data/data_9A31F8.s:1094` |
| 803 | 0x9D5764 | 188 | Unknown | `gUnknown_089D5764` | `dump/data_9A31F8_9D5764.bin` | `data/data_9A31F8.s:1098` |
| 804 | 0x9D5820 | 192 | Unknown | `gUnknown_089D5820` | `dump/data_9A31F8_9D5820.bin` | `data/data_9A31F8.s:1102` |
| 805 | 0x9D58E0 | 320 | Unknown | `gUnknown_089D58E0` | `dump/data_9A31F8_9D58E0.bin` | `data/data_9A31F8.s:1106` |
| 806 | 0x9D5A20 | 312 | Unknown | `gUnknown_089D5A20` | `dump/data_9A31F8_9D5A20.bin` | `data/data_9A31F8.s:1110` |
| 807 | 0x9D5B58 | 312 | Unknown | `gUnknown_089D5B58` | `dump/data_9A31F8_9D5B58.bin` | `data/data_9A31F8.s:1114` |
| 808 | 0x9D5C90 | 188 | Unknown | `gUnknown_089D5C90` | `dump/data_9A31F8_9D5C90.bin` | `data/data_9A31F8.s:1118` |
| 809 | 0x9D5D4C | 336 | Unknown | `gUnknown_089D5D4C` | `dump/data_9A31F8_9D5D4C.bin` | `data/data_9A31F8.s:1122` |
| 810 | 0x9D5E9C | 340 | Unknown | `gUnknown_089D5E9C` | `dump/data_9A31F8_9D5E9C.bin` | `data/data_9A31F8.s:1126` |
| 811 | 0x9D5FF0 | 384 | Unknown | `gUnknown_089D5FF0` | `dump/data_9A31F8_9D5FF0.bin` | `data/data_9A31F8.s:1130` |
| 812 | 0x9D6170 | 392 | Unknown | `gUnknown_089D6170` | `dump/data_9A31F8_9D6170.bin` | `data/data_9A31F8.s:1134` |
| 813 | 0x9D62F8 | 500 | Unknown | `gUnknown_089D62F8` | `dump/data_9A31F8_9D62F8.bin` | `data/data_9A31F8.s:1138` |
| 814 | 0x9D64EC | 484 | Unknown | `gUnknown_089D64EC` | `dump/data_9A31F8_9D64EC.bin` | `data/data_9A31F8.s:1142` |
| 815 | 0x9D66D0 | 292 | Unknown | `gUnknown_089D66D0` | `dump/data_9A31F8_9D66D0.bin` | `data/data_9A31F8.s:1146` |
| 816 | 0x9D67F4 | 688 | Unknown | `gUnknown_089D67F4` | `dump/data_9A31F8_9D67F4.bin` | `data/data_9A31F8.s:1150` |
| 817 | 0x9D6AA4 | 888 | Unknown | `gUnknown_089D6AA4` | `dump/data_9A31F8_9D6AA4.bin` | `data/data_9A31F8.s:1154` |
| 818 | 0x9D6E1C | 240 | Unknown | `gUnknown_089D6E1C` | `dump/data_9A31F8_9D6E1C.bin` | `data/data_9A31F8.s:1158` |
| 819 | 0x9D6F0C | 320 | Unknown | `gUnknown_089D6F0C` | `dump/data_9A31F8_9D6F0C.bin` | `data/data_9A31F8.s:1162` |
| 820 | 0x9D704C | 400 | Unknown | `gUnknown_089D704C` | `dump/data_9A31F8_9D704C.bin` | `data/data_9A31F8.s:1166` |
| 821 | 0x9D71DC | 472 | Unknown | `gUnknown_089D71DC` | `dump/data_9A31F8_9D71DC.bin` | `data/data_9A31F8.s:1170` |
| 822 | 0x9D73B4 | 520 | Unknown | `gUnknown_089D73B4` | `dump/data_9A31F8_9D73B4.bin` | `data/data_9A31F8.s:1174` |
| 823 | 0x9D75BC | 528 | Unknown | `gUnknown_089D75BC` | `dump/data_9A31F8_9D75BC.bin` | `data/data_9A31F8.s:1178` |
| 824 | 0x9D77CC | 488 | Unknown | `gUnknown_089D77CC` | `dump/data_9A31F8_9D77CC.bin` | `data/data_9A31F8.s:1182` |
| 825 | 0x9D79B4 | 452 | Unknown | `gUnknown_089D79B4` | `dump/data_9A31F8_9D79B4.bin` | `data/data_9A31F8.s:1186` |
| 826 | 0x9D7B78 | 396 | Unknown | `gUnknown_089D7B78` | `dump/data_9A31F8_9D7B78.bin` | `data/data_9A31F8.s:1190` |
| 827 | 0x9D7D04 | 324 | Unknown | `gUnknown_089D7D04` | `dump/data_9A31F8_9D7D04.bin` | `data/data_9A31F8.s:1194` |
| 828 | 0x9D7E48 | 256 | Unknown | `gUnknown_089D7E48` | `dump/data_9A31F8_9D7E48.bin` | `data/data_9A31F8.s:1198` |
| 829 | 0x9D7F48 | 200 | Unknown | `gUnknown_089D7F48` | `dump/data_9A31F8_9D7F48.bin` | `data/data_9A31F8.s:1202` |
| 830 | 0x9D8010 | 392 | Unknown | `gUnknown_089D8010` | `dump/data_9A31F8_9D8010.bin` | `data/data_9A31F8.s:1206` |
| 831 | 0x9D8198 | 784 | Unknown | `gUnknown_089D8198` | `dump/data_9A31F8_9D8198.bin` | `data/data_9A31F8.s:1210` |
| 832 | 0x9D84A8 | 1128 | Unknown | `gUnknown_089D84A8` | `dump/data_9A31F8_9D84A8.bin` | `data/data_9A31F8.s:1214` |
| 833 | 0x9D8910 | 2380 | Unknown | `gUnknown_089D8910` | `dump/data_9A31F8_9D8910.bin` | `data/data_9A31F8.s:1218` |
| 834 | 0x9D925C | 4528 | Unknown | `gUnknown_089D925C` | `dump/data_9A31F8_9D925C.bin` | `data/data_9A31F8.s:1222` |
| 835 | 0x9DA40C | 3476 | Unknown | `gUnknown_089DA40C` | `dump/data_9A31F8_9DA40C.bin` | `data/data_9A31F8.s:1226` |
| 836 | 0x9DB1A0 | 3648 | Unknown | `gUnknown_089DB1A0` | `dump/data_9A31F8_9DB1A0.bin` | `data/data_9A31F8.s:1230` |
| 837 | 0x9DBFE0 | 3432 | Unknown | `gUnknown_089DBFE0` | `dump/data_9A31F8_9DBFE0.bin` | `data/data_9A31F8.s:1234` |
| 838 | 0x9DCD48 | 32 | Unknown | `gUnknown_089DCD48` | `dump/data_9A31F8_9DCD48.bin` | `data/data_9A31F8.s:1238` |
| 839 | 0x9DCD68 | 32 | Unknown | `gUnknown_089DCD68` | `dump/data_9A31F8_9DCD68.bin` | `data/data_9A31F8.s:1242` |
| 840 | 0x9DCD88 | 32 | Unknown | `gUnknown_089DCD88` | `dump/data_9A31F8_9DCD88.bin` | `data/data_9A31F8.s:1246` |
| 841 | 0x9DCDA8 | 32 | Unknown | `gUnknown_089DCDA8` | `dump/data_9A31F8_9DCDA8.bin` | `data/data_9A31F8.s:1250` |
| 842 | 0x9DCDC8 | 32 | Unknown | `gUnknown_089DCDC8` | `dump/data_9A31F8_9DCDC8.bin` | `data/data_9A31F8.s:1254` |
| 843 | 0x9DCDE8 | 32 | Unknown | `gUnknown_089DCDE8` | `dump/data_9A31F8_9DCDE8.bin` | `data/data_9A31F8.s:1258` |
| 844 | 0x9DCE08 | 32 | Unknown | `gUnknown_089DCE08` | `dump/data_9A31F8_9DCE08.bin` | `data/data_9A31F8.s:1262` |
| 845 | 0x9DCE28 | 32 | Unknown | `gUnknown_089DCE28` | `dump/data_9A31F8_9DCE28.bin` | `data/data_9A31F8.s:1266` |
| 846 | 0x9DCE48 | 200 | Unknown | `gUnknown_089DCE48` | `dump/data_9A31F8_9DCE48.bin` | `data/data_9A31F8.s:1270` |
| 847 | 0x9DCF10 | 236 | Unknown | `gUnknown_089DCF10` | `dump/data_9A31F8_9DCF10.bin` | `data/data_9A31F8.s:1274` |
| 848 | 0x9DCFFC | 280 | Unknown | `gUnknown_089DCFFC` | `dump/data_9A31F8_9DCFFC.bin` | `data/data_9A31F8.s:1278` |
| 849 | 0x9DD114 | 368 | Unknown | `gUnknown_089DD114` | `dump/data_9A31F8_9DD114.bin` | `data/data_9A31F8.s:1282` |
| 850 | 0x9DD284 | 612 | Unknown | `gUnknown_089DD284` | `dump/data_9A31F8_9DD284.bin` | `data/data_9A31F8.s:1286` |
| 851 | 0x9DD4E8 | 680 | Unknown | `gUnknown_089DD4E8` | `dump/data_9A31F8_9DD4E8.bin` | `data/data_9A31F8.s:1290` |
| 852 | 0x9DD790 | 728 | Unknown | `gUnknown_089DD790` | `dump/data_9A31F8_9DD790.bin` | `data/data_9A31F8.s:1294` |
| 853 | 0x9DDA68 | 1060 | Unknown | `gUnknown_089DDA68` | `dump/data_9A31F8_9DDA68.bin` | `data/data_9A31F8.s:1298` |
| 854 | 0x9DDE8C | 132 | Unknown | `gUnknown_089DDE8C` | `dump/data_9A31F8_9DDE8C.bin` | `data/data_9A31F8.s:1302` |
| 855 | 0x9DDF10 | 140 | Unknown | `gUnknown_089DDF10` | `dump/data_9A31F8_9DDF10.bin` | `data/data_9A31F8.s:1306` |
| 856 | 0x9DDF9C | 148 | Unknown | `gUnknown_089DDF9C` | `dump/data_9A31F8_9DDF9C.bin` | `data/data_9A31F8.s:1310` |
| 857 | 0x9DE030 | 140 | Unknown | `gUnknown_089DE030` | `dump/data_9A31F8_9DE030.bin` | `data/data_9A31F8.s:1314` |
| 858 | 0x9DE0BC | 144 | Unknown | `gUnknown_089DE0BC` | `dump/data_9A31F8_9DE0BC.bin` | `data/data_9A31F8.s:1318` |
| 859 | 0x9DE14C | 128 | Unknown | `gUnknown_089DE14C` | `dump/data_9A31F8_9DE14C.bin` | `data/data_9A31F8.s:1322` |
| 860 | 0x9DE1CC | 2148 | Unknown | `gUnknown_089DE1CC` | `dump/data_9A31F8_9DE1CC.bin` | `data/data_9A31F8.s:1326` |
| 861 | 0x9DEA30 | 2624 | Unknown | `gUnknown_089DEA30` | `dump/data_9A31F8_9DEA30.bin` | `data/data_9A31F8.s:1330` |
| 862 | 0x9DF470 | 2848 | Unknown | `gUnknown_089DF470` | `dump/data_9A31F8_9DF470.bin` | `data/data_9A31F8.s:1334` |
| 863 | 0x9DFF90 | 2856 | Unknown | `gUnknown_089DFF90` | `dump/data_9A31F8_9DFF90.bin` | `data/data_9A31F8.s:1338` |
| 864 | 0x9E0AB8 | 2504 | Unknown | `gUnknown_089E0AB8` | `dump/data_9A31F8_9E0AB8.bin` | `data/data_9A31F8.s:1342` |
| 865 | 0x9E1480 | 3284 | Unknown | `gUnknown_089E1480` | `dump/data_9A31F8_9E1480.bin` | `data/data_9A31F8.s:1346` |
| 866 | 0x9E2154 | 2760 | Unknown | `gUnknown_089E2154` | `dump/data_9A31F8_9E2154.bin` | `data/data_9A31F8.s:1350` |
| 867 | 0x9E2C1C | 2188 | Unknown | `gUnknown_089E2C1C` | `dump/data_9A31F8_9E2C1C.bin` | `data/data_9A31F8.s:1354` |
| 868 | 0x9E34A8 | 1760 | Unknown | `gUnknown_089E34A8` | `dump/data_9A31F8_9E34A8.bin` | `data/data_9A31F8.s:1358` |
| 869 | 0x9E3B88 | 1180 | Unknown | `gUnknown_089E3B88` | `dump/data_9A31F8_9E3B88.bin` | `data/data_9A31F8.s:1362` |
| 870 | 0x9E4024 | 800 | Unknown | `gUnknown_089E4024` | `dump/data_9A31F8_9E4024.bin` | `data/data_9A31F8.s:1366` |
| 871 | 0x9E4344 | 372 | Unknown | `gUnknown_089E4344` | `dump/data_9A31F8_9E4344.bin` | `data/data_9A31F8.s:1370` |
| 872 | 0x9E44B8 | 280 | Unknown | `gUnknown_089E44B8` | `dump/data_9A31F8_9E44B8.bin` | `data/data_9A31F8.s:1374` |
| 873 | 0x9E45D0 | 280 | Unknown | `gUnknown_089E45D0` | `dump/data_9A31F8_9E45D0.bin` | `data/data_9A31F8.s:1378` |
| 874 | 0x9E46E8 | 228 | Unknown | `gUnknown_089E46E8` | `dump/data_9A31F8_9E46E8.bin` | `data/data_9A31F8.s:1382` |
| 875 | 0x9E47CC | 244 | Unknown | `gUnknown_089E47CC` | `dump/data_9A31F8_9E47CC.bin` | `data/data_9A31F8.s:1386` |
| 876 | 0x9E48C0 | 280 | Unknown | `gUnknown_089E48C0` | `dump/data_9A31F8_9E48C0.bin` | `data/data_9A31F8.s:1390` |
| 877 | 0x9E49D8 | 276 | Unknown | `gUnknown_089E49D8` | `dump/data_9A31F8_9E49D8.bin` | `data/data_9A31F8.s:1394` |
| 878 | 0x9E4AEC | 220 | Unknown | `gUnknown_089E4AEC` | `dump/data_9A31F8_9E4AEC.bin` | `data/data_9A31F8.s:1398` |
| 879 | 0x9E4BC8 | 180 | Unknown | `gUnknown_089E4BC8` | `dump/data_9A31F8_9E4BC8.bin` | `data/data_9A31F8.s:1402` |
| 880 | 0x9E4C7C | 32 | Unknown | `gUnknown_089E4C7C` | `dump/data_9A31F8_9E4C7C.bin` | `data/data_9A31F8.s:1406` |
| 881 | 0x9E4C9C | 32 | Unknown | `gUnknown_089E4C9C` | `dump/data_9A31F8_9E4C9C.bin` | `data/data_9A31F8.s:1410` |
| 882 | 0x9E4CBC | 32 | Unknown | `gUnknown_089E4CBC` | `dump/data_9A31F8_9E4CBC.bin` | `data/data_9A31F8.s:1414` |
| 883 | 0x9E4CDC | 32 | Unknown | `gUnknown_089E4CDC` | `dump/data_9A31F8_9E4CDC.bin` | `data/data_9A31F8.s:1418` |
| 884 | 0x9E4CFC | 32 | Unknown | `gUnknown_089E4CFC` | `dump/data_9A31F8_9E4CFC.bin` | `data/data_9A31F8.s:1422` |
| 885 | 0x9E4D1C | 32 | Unknown | `gUnknown_089E4D1C` | `dump/data_9A31F8_9E4D1C.bin` | `data/data_9A31F8.s:1426` |
| 886 | 0x9E4D3C | 32 | Unknown | `gUnknown_089E4D3C` | `dump/data_9A31F8_9E4D3C.bin` | `data/data_9A31F8.s:1430` |
| 887 | 0x9E4D5C | 32 | Unknown | `gUnknown_089E4D5C` | `dump/data_9A31F8_9E4D5C.bin` | `data/data_9A31F8.s:1434` |
| 888 | 0x9E4D7C | 32 | Unknown | `gUnknown_089E4D7C` | `dump/data_9A31F8_9E4D7C.bin` | `data/data_9A31F8.s:1438` |
| 889 | 0x9E4D9C | 32 | Unknown | `gUnknown_089E4D9C` | `dump/data_9A31F8_9E4D9C.bin` | `data/data_9A31F8.s:1442` |
| 890 | 0x9E4DBC | 32 | Unknown | `gUnknown_089E4DBC` | `dump/data_9A31F8_9E4DBC.bin` | `data/data_9A31F8.s:1446` |
| 891 | 0x9E4DDC | 32 | Unknown | `gUnknown_089E4DDC` | `dump/data_9A31F8_9E4DDC.bin` | `data/data_9A31F8.s:1450` |
| 892 | 0x9E4DFC | 32 | Unknown | `gUnknown_089E4DFC` | `dump/data_9A31F8_9E4DFC.bin` | `data/data_9A31F8.s:1454` |
| 893 | 0x9E4E1C | 32 | Unknown | `gUnknown_089E4E1C` | `dump/data_9A31F8_9E4E1C.bin` | `data/data_9A31F8.s:1458` |
| 894 | 0x9E4E3C | 32 | Unknown | `gUnknown_089E4E3C` | `dump/data_9A31F8_9E4E3C.bin` | `data/data_9A31F8.s:1462` |
| 895 | 0x9E4E5C | 32 | Unknown | `gUnknown_089E4E5C` | `dump/data_9A31F8_9E4E5C.bin` | `data/data_9A31F8.s:1466` |
| 896 | 0x9E4E7C | 32 | Unknown | `gUnknown_089E4E7C` | `dump/data_9A31F8_9E4E7C.bin` | `data/data_9A31F8.s:1470` |
| 897 | 0x9E4E9C | 32 | Unknown | `gUnknown_089E4E9C` | `dump/data_9A31F8_9E4E9C.bin` | `data/data_9A31F8.s:1474` |
| 898 | 0x9E4EBC | 32 | Unknown | `gUnknown_089E4EBC` | `dump/data_9A31F8_9E4EBC.bin` | `data/data_9A31F8.s:1478` |
| 899 | 0x9E4EDC | 32 | Unknown | `gUnknown_089E4EDC` | `dump/data_9A31F8_9E4EDC.bin` | `data/data_9A31F8.s:1482` |
| 900 | 0x9E4EFC | 32 | Unknown | `gUnknown_089E4EFC` | `dump/data_9A31F8_9E4EFC.bin` | `data/data_9A31F8.s:1486` |
| 901 | 0x9E4F1C | 32 | Unknown | `gUnknown_089E4F1C` | `dump/data_9A31F8_9E4F1C.bin` | `data/data_9A31F8.s:1490` |
| 902 | 0x9E4F3C | 32 | Unknown | `gUnknown_089E4F3C` | `dump/data_9A31F8_9E4F3C.bin` | `data/data_9A31F8.s:1494` |
| 903 | 0x9E4F5C | 32 | Unknown | `gUnknown_089E4F5C` | `dump/data_9A31F8_9E4F5C.bin` | `data/data_9A31F8.s:1498` |
| 904 | 0x9E4F7C | 32 | Unknown | `gUnknown_089E4F7C` | `dump/data_9A31F8_9E4F7C.bin` | `data/data_9A31F8.s:1502` |
| 905 | 0x9E4F9C | 32 | Unknown | `gUnknown_089E4F9C` | `dump/data_9A31F8_9E4F9C.bin` | `data/data_9A31F8.s:1506` |
| 906 | 0x9E4FBC | 184 | Unknown | `gUnknown_089E4FBC` | `dump/data_9A31F8_9E4FBC.bin` | `data/data_9A31F8.s:1510` |
| 907 | 0x9E5074 | 188 | Unknown | `gUnknown_089E5074` | `dump/data_9A31F8_9E5074.bin` | `data/data_9A31F8.s:1514` |
| 908 | 0x9E5130 | 188 | Unknown | `gUnknown_089E5130` | `dump/data_9A31F8_9E5130.bin` | `data/data_9A31F8.s:1518` |
| 909 | 0x9E51EC | 192 | Unknown | `gUnknown_089E51EC` | `dump/data_9A31F8_9E51EC.bin` | `data/data_9A31F8.s:1522` |
| 910 | 0x9E52AC | 184 | Unknown | `gUnknown_089E52AC` | `dump/data_9A31F8_9E52AC.bin` | `data/data_9A31F8.s:1526` |
| 911 | 0x9E5364 | 184 | Unknown | `gUnknown_089E5364` | `dump/data_9A31F8_9E5364.bin` | `data/data_9A31F8.s:1530` |
| 912 | 0x9E541C | 484 | Unknown | `gUnknown_089E541C` | `dump/data_9A31F8_9E541C.bin` | `data/data_9A31F8.s:1534` |
| 913 | 0x9E5600 | 532 | Unknown | `gUnknown_089E5600` | `dump/data_9A31F8_9E5600.bin` | `data/data_9A31F8.s:1538` |
| 914 | 0x9E5814 | 580 | Unknown | `gUnknown_089E5814` | `dump/data_9A31F8_9E5814.bin` | `data/data_9A31F8.s:1542` |
| 915 | 0x9E5A58 | 688 | Unknown | `gUnknown_089E5A58` | `dump/data_9A31F8_9E5A58.bin` | `data/data_9A31F8.s:1546` |
| 916 | 0x9E5D08 | 740 | Unknown | `gUnknown_089E5D08` | `dump/data_9A31F8_9E5D08.bin` | `data/data_9A31F8.s:1550` |
| 917 | 0x9E5FEC | 676 | Unknown | `gUnknown_089E5FEC` | `dump/data_9A31F8_9E5FEC.bin` | `data/data_9A31F8.s:1554` |
| 918 | 0x9E6290 | 576 | Unknown | `gUnknown_089E6290` | `dump/data_9A31F8_9E6290.bin` | `data/data_9A31F8.s:1558` |
| 919 | 0x9E64D0 | 464 | Unknown | `gUnknown_089E64D0` | `dump/data_9A31F8_9E64D0.bin` | `data/data_9A31F8.s:1562` |
| 920 | 0x9E66A0 | 360 | Unknown | `gUnknown_089E66A0` | `dump/data_9A31F8_9E66A0.bin` | `data/data_9A31F8.s:1566` |
| 921 | 0x9E6808 | 284 | Unknown | `gUnknown_089E6808` | `dump/data_9A31F8_9E6808.bin` | `data/data_9A31F8.s:1570` |
| 922 | 0x9E6924 | 240 | Unknown | `gUnknown_089E6924` | `dump/data_9A31F8_9E6924.bin` | `data/data_9A31F8.s:1574` |
| 923 | 0x9E6A14 | 208 | Unknown | `gUnknown_089E6A14` | `dump/data_9A31F8_9E6A14.bin` | `data/data_9A31F8.s:1578` |
| 924 | 0x9E6AE4 | 204 | Unknown | `gUnknown_089E6AE4` | `dump/data_9A31F8_9E6AE4.bin` | `data/data_9A31F8.s:1582` |
| 925 | 0x9E6BB0 | 208 | Unknown | `gUnknown_089E6BB0` | `dump/data_9A31F8_9E6BB0.bin` | `data/data_9A31F8.s:1586` |
| 926 | 0x9E6C80 | 208 | Unknown | `gUnknown_089E6C80` | `dump/data_9A31F8_9E6C80.bin` | `data/data_9A31F8.s:1590` |
| 927 | 0x9E6D50 | 204 | Unknown | `gUnknown_089E6D50` | `dump/data_9A31F8_9E6D50.bin` | `data/data_9A31F8.s:1594` |
| 928 | 0x9E6E1C | 204 | Unknown | `gUnknown_089E6E1C` | `dump/data_9A31F8_9E6E1C.bin` | `data/data_9A31F8.s:1598` |
| 929 | 0x9E6EE8 | 204 | Unknown | `gUnknown_089E6EE8` | `dump/data_9A31F8_9E6EE8.bin` | `data/data_9A31F8.s:1602` |
| 930 | 0x9E6FB4 | 204 | Unknown | `gUnknown_089E6FB4` | `dump/data_9A31F8_9E6FB4.bin` | `data/data_9A31F8.s:1606` |
| 931 | 0x9E7080 | 204 | Unknown | `gUnknown_089E7080` | `dump/data_9A31F8_9E7080.bin` | `data/data_9A31F8.s:1610` |
| 932 | 0x9E714C | 3232 | Unknown | `gUnknown_089E714C` | `dump/data_9A31F8_9E714C.bin` | `data/data_9A31F8.s:1614` |
| 933 | 0x9E7DEC | 32 | Unknown | `gUnknown_089E7DEC` | `dump/data_9A31F8_9E7DEC.bin` | `data/data_9A31F8.s:1618` |
| 934 | 0x9E7E0C | 32 | Tilemap | `Tsa_089E7E0C` | `dump/data_9A31F8_9E7E0C.bin` | `data/data_9A31F8.s:1622` |
| 935 | 0x9E7E2C | 36 | Tilemap | `Tsa_089E7E2C` | `dump/data_9A31F8_9E7E2C.bin` | `data/data_9A31F8.s:1626` |
| 936 | 0x9E7E50 | 40 | Tilemap | `Tsa_089E7E50` | `dump/data_9A31F8_9E7E50.bin` | `data/data_9A31F8.s:1630` |
| 937 | 0x9E7E78 | 40 | Tilemap | `Tsa_089E7E78` | `dump/data_9A31F8_9E7E78.bin` | `data/data_9A31F8.s:1634` |
| 938 | 0x9E7EA0 | 44 | Tilemap | `Tsa_089E7EA0` | `dump/data_9A31F8_9E7EA0.bin` | `data/data_9A31F8.s:1638` |
| 939 | 0x9E7ECC | 48 | Tilemap | `Tsa_089E7ECC` | `dump/data_9A31F8_9E7ECC.bin` | `data/data_9A31F8.s:1642` |
| 940 | 0x9E7EFC | 48 | Tilemap | `Tsa_089E7EFC` | `dump/data_9A31F8_9E7EFC.bin` | `data/data_9A31F8.s:1646` |
| 941 | 0x9E7F2C | 48 | Tilemap | `Tsa_089E7F2C` | `dump/data_9A31F8_9E7F2C.bin` | `data/data_9A31F8.s:1650` |
| 942 | 0x9E7F5C | 48 | Tilemap | `Tsa_089E7F5C` | `dump/data_9A31F8_9E7F5C.bin` | `data/data_9A31F8.s:1654` |
| 943 | 0x9E7F8C | 48 | Tilemap | `Tsa_089E7F8C` | `dump/data_9A31F8_9E7F8C.bin` | `data/data_9A31F8.s:1658` |
| 944 | 0x9E7FBC | 64 | Tilemap | `Tsa_089E7FBC` | `dump/data_9A31F8_9E7FBC.bin` | `data/data_9A31F8.s:1662` |
| 945 | 0x9E7FFC | 68 | Tilemap | `Tsa_089E7FFC` | `dump/data_9A31F8_9E7FFC.bin` | `data/data_9A31F8.s:1666` |
| 946 | 0x9E8040 | 80 | Tilemap | `Tsa_089E8040` | `dump/data_9A31F8_9E8040.bin` | `data/data_9A31F8.s:1670` |
| 947 | 0x9E8090 | 92 | Tilemap | `Tsa_089E8090` | `dump/data_9A31F8_9E8090.bin` | `data/data_9A31F8.s:1674` |
| 948 | 0x9E80EC | 92 | Tilemap | `Tsa_089E80EC` | `dump/data_9A31F8_9E80EC.bin` | `data/data_9A31F8.s:1678` |
| 949 | 0x9E8148 | 92 | Tilemap | `Tsa_089E8148` | `dump/data_9A31F8_9E8148.bin` | `data/data_9A31F8.s:1682` |
| 950 | 0x9E81A4 | 92 | Tilemap | `Tsa_089E81A4` | `dump/data_9A31F8_9E81A4.bin` | `data/data_9A31F8.s:1686` |
| 951 | 0x9E8200 | 56 | Tilemap | `Tsa_089E8200` | `dump/data_9A31F8_9E8200.bin` | `data/data_9A31F8.s:1690` |
| 952 | 0x9E8238 | 168 | Graphics (4bpp) | `Img_TalkBubble` | `dump/data_9A31F8_9E8238.bin` | `data/data_9A31F8.s:1694` |
| 953 | 0x9E82E0 | 164 | Graphics (4bpp) | `Img_TalkBubbleOpening_E` | `dump/data_9A31F8_9E82E0.bin` | `data/data_9A31F8.s:1698` |
| 954 | 0x9E8384 | 92 | Graphics (4bpp) | `Img_TalkBubbleOpening_D` | `dump/data_9A31F8_9E8384.bin` | `data/data_9A31F8.s:1702` |
| 955 | 0x9E83E0 | 84 | Graphics (4bpp) | `Img_TalkBubbleOpening_C` | `dump/data_9A31F8_9E83E0.bin` | `data/data_9A31F8.s:1706` |
| 956 | 0x9E8434 | 80 | Graphics (4bpp) | `Img_TalkBubbleOpening_B` | `dump/data_9A31F8_9E8434.bin` | `data/data_9A31F8.s:1710` |
| 957 | 0x9E8484 | 80 | Graphics (4bpp) | `Img_TalkBubbleOpening_A` | `dump/data_9A31F8_9E8484.bin` | `data/data_9A31F8.s:1714` |
| 958 | 0x9E84D4 | 32 | Palette | `Pal_TalkBubble` | `dump/data_9A31F8_9E84D4.bin` | `data/data_9A31F8.s:1718` |
| 959 | 0xA01EE4 | 32 | Unknown | `gUnknown_08A01EE4` | `dump/data_A01CC4_A01EE4.bin` | `data/data_A01CC4.s:5` |
| 960 | 0xA01F04 | 32 | Unknown | `gUnknown_08A01F04` | `dump/data_A01CC4_A01F04.bin` | `data/data_A01CC4.s:9` |
| 961 | 0xA01F24 | 460 | Unknown | `gUnknown_08A01F24` | `dump/data_A01CC4_A01F24.bin` | `data/data_A01CC4.s:13` |
| 962 | 0xA027FC | 96 | Unknown | `gUnknown_08A027FC` | `dump/data_A01CC4_A027FC.bin` | `data/data_A01CC4.s:38` |
| 963 | 0xA0285C | 40 | Unknown | `gGfx_HelpTextBox` | `dump/data_A01CC4_A0285C.bin` | `data/data_A01CC4.s:42` |
| 964 | 0xA02884 | 40 | Unknown | `gGfx_HelpTextBox2` | `dump/data_A01CC4_A02884.bin` | `data/data_A01CC4.s:46` |
| 965 | 0xA028AC | 104 | Unknown | `gGfx_HelpTextBox3` | `dump/data_A01CC4_A028AC.bin` | `data/data_A01CC4.s:50` |
| 966 | 0xA02914 | 108 | Unknown | `gGfx_HelpTextBox4` | `dump/data_A01CC4_A02914.bin` | `data/data_A01CC4.s:54` |
| 967 | 0xA02980 | 40 | Unknown | `gGfx_HelpTextBox5` | `dump/data_A01CC4_A02980.bin` | `data/data_A01CC4.s:58` |
| 968 | 0xA029A8 | 116 | Unknown | `gGfx_YellowTextBox` | `dump/data_A01CC4_A029A8.bin` | `data/data_A01CC4.s:62` |
| 969 | 0xA02A1C | 120 | Unknown | `gGfx_YellowTextBox2` | `dump/data_A01CC4_A02A1C.bin` | `data/data_A01CC4.s:66` |
| 970 | 0xA02A94 | 168 | Unknown | `gGfx_YellowTextBox3` | `dump/data_A01CC4_A02A94.bin` | `data/data_A01CC4.s:70` |
| 971 | 0xA02B3C | 112 | Unknown | `gGfx_YellowTextBox4` | `dump/data_A01CC4_A02B3C.bin` | `data/data_A01CC4.s:74` |
| 972 | 0xA02BAC | 136 | Unknown | `gGfx_YellowTextBox5` | `dump/data_A01CC4_A02BAC.bin` | `data/data_A01CC4.s:78` |
| 973 | 0xA02C34 | 640 | Graphics (4bpp) | `Img_LimitViewSquares` | `dump/data_A01CC4_A02C34.bin` | `data/data_A01CC4.s:82` |
| 974 | 0xA02EB4 | 128 | Unknown | `gUnknown_08A02EB4` | `dump/data_A01CC4_A02EB4.bin` | `data/data_A01CC4.s:86` |
| 975 | 0xA02F34 | 96 | Unknown | `gUnknown_08A02F34` | `dump/data_A01CC4_A02F34.bin` | `data/data_A01CC4.s:90` |
| 976 | 0xA02F94 | 96 | Unknown | `gUnknown_08A02F94` | `dump/data_A01CC4_A02F94.bin` | `data/data_A01CC4.s:94` |
| 977 | 0xA02FF4 | 96 | Unknown | `gUnknown_08A02FF4` | `dump/data_A01CC4_A02FF4.bin` | `data/data_A01CC4.s:98` |
| 978 | 0xA03054 | 568 | Unknown | `gUnknown_08A03054` | `dump/data_A01CC4_A03054.bin` | `data/data_A01CC4.s:102` |
| 979 | 0xA0328C | 32 | Unknown | `gUnknown_08A0328C` | `dump/data_A01CC4_A0328C.bin` | `data/data_A01CC4.s:106` |
| 980 | 0xA032AC | 136 | Unknown | `gUnknown_08A032AC` | `dump/data_A01CC4_A032AC.bin` | `data/data_A01CC4.s:110` |
| 981 | 0xA03334 | 32 | Unknown | `gUnknown_08A03334` | `dump/data_A01CC4_A03334.bin` | `data/data_A01CC4.s:114` |
| 982 | 0xA03354 | 20 | Unknown | `gUnknown_08A03354` | `dump/data_A01CC4_A03354.bin` | `data/data_A01CC4.s:118` |
| 983 | 0xA0733C | 528 | Graphics (4bpp) | `Img_ConfigUiSprites` | `dump/data_A01CC4_A0733C.bin` | `data/data_A01CC4.s:146` |
| 984 | 0xA0754C | 1128 | Graphics (4bpp) | `Img_ConfigUiIcons` | `dump/data_A01CC4_A0754C.bin` | `data/data_A01CC4.s:150` |
| 985 | 0xA079B4 | 228 | Tilemap | `Tsa_ConfigUiFrame` | `dump/data_A01CC4_A079B4.bin` | `data/data_A01CC4.s:154` |
| 986 | 0xA07A98 | 64 | Palette | `Pal_ConfigUiSprites` | `dump/data_A01CC4_A07A98.bin` | `data/data_A01CC4.s:158` |
| 987 | 0xA07AD8 | 18 | Unknown | `gPal_08A07AD8` | `dump/data_A01CC4_A07AD8.bin` | `data/data_A01CC4.s:162` |
| 988 | 0xA07AEA | 32 | Unknown | `gUnknown_08A07AEA` | `dump/data_A01CC4_A07AEA.bin` | `data/data_A01CC4.s:166` |
| 989 | 0xA07B0A | 224 | Unknown | `gUnknown_08A07B0A` | `dump/data_A01CC4_A07B0A.bin` | `data/data_A01CC4.s:170` |
| 990 | 0xA07BEA | 32 | Unknown | `gUnknown_08A07BEA` | `dump/data_A01CC4_A07BEA.bin` | `data/data_A01CC4.s:174` |
| 991 | 0xA07C0A | 78 | Unknown | `gUnknown_08A07C0A` | `dump/data_A01CC4_A07C0A.bin` | `data/data_A01CC4.s:178` |
| 992 | 0xA07C58 | 384 | Unknown | `gPal_08A07C58` | `dump/data_A01CC4_A07C58.bin` | `data/data_A01CC4.s:182` |
| 993 | 0xA07DD8 | 7300 | Graphics (4bpp) | `Img_ChapterIntroFog` | `dump/data_A01CC4_A07DD8.bin` | `data/data_A01CC4.s:186` |
| 994 | 0xA09A5C | 1008 | Palette | `Pal_PlayerRankFog` | `dump/data_A01CC4_A09A5C.bin` | `data/data_A01CC4.s:190` |
| 995 | 0xA09E4C | 1692 | Unknown | `gGfx_08A09E4C` | `dump/data_A01CC4_A09E4C.bin` | `data/data_A01CC4.s:194` |
| 996 | 0xA0A4E8 | 1296 | Unknown | `gUnknown_08A0A4E8` | `dump/data_A01CC4_A0A4E8.bin` | `data/data_A01CC4.s:198` |
| 997 | 0xA0A9F8 | 276 | Unknown | `gTsa_08A0A9F8` | `dump/data_A01CC4_A0A9F8.bin` | `data/data_A01CC4.s:202` |
| 998 | 0xA0AB0C | 824 | Graphics (4bpp) | `Img_GameOverText` | `dump/data_A01CC4_A0AB0C.bin` | `data/data_A01CC4.s:206` |
| 999 | 0xA0AE44 | 32 | Palette | `Pal_GameOverText2` | `dump/data_A01CC4_A0AE44.bin` | `data/data_A01CC4.s:210` |
| 1000 | 0xA0AE64 | 32 | Palette | `Pal_GameOverText1` | `dump/data_A01CC4_A0AE64.bin` | `data/data_A01CC4.s:214` |
| 1001 | 0xA0AE84 | 68 | Tilemap | `Tsa_GameOverFx` | `dump/data_A01CC4_A0AE84.bin` | `data/data_A01CC4.s:218` |
| 1002 | 0xA1742C | 88 | Unknown | `gTSA_TerrainBox` | `dump/data_A167C8_A1742C.bin` | `data/data_A167C8.s:37` |
| 1003 | 0xA17484 | 304 | Unknown | `gTSA_MinimugBox` | `dump/data_A167C8_A17484.bin` | `data/data_A167C8.s:41` |
| 1004 | 0xA175B4 | 20 | Unknown | `gUnknown_08A175B4` | `dump/data_A167C8_A175B4.bin` | `data/data_A167C8.s:45` |
| 1005 | 0xA175C8 | 20 | Unknown | `gUnknown_08A175C8` | `dump/data_A167C8_A175C8.bin` | `data/data_A167C8.s:49` |
| 1006 | 0xA175DC | 20 | Unknown | `gUnknown_08A175DC` | `dump/data_A167C8_A175DC.bin` | `data/data_A167C8.s:53` |
| 1007 | 0xA175F0 | 20 | Unknown | `gUnknown_08A175F0` | `dump/data_A167C8_A175F0.bin` | `data/data_A167C8.s:57` |
| 1008 | 0xA17604 | 56 | Unknown | `gUnknown_08A17604` | `dump/data_A167C8_A17604.bin` | `data/data_A167C8.s:61` |
| 1009 | 0xA1763C | 20 | Unknown | `gUnknown_08A1763C` | `dump/data_A167C8_A1763C.bin` | `data/data_A167C8.s:65` |
| 1010 | 0xA17650 | 20 | Unknown | `gUnknown_08A17650` | `dump/data_A167C8_A17650.bin` | `data/data_A167C8.s:69` |
| 1011 | 0xA17664 | 20 | Unknown | `gUnknown_08A17664` | `dump/data_A167C8_A17664.bin` | `data/data_A167C8.s:73` |
| 1012 | 0xA17678 | 20 | Unknown | `gUnknown_08A17678` | `dump/data_A167C8_A17678.bin` | `data/data_A167C8.s:77` |
| 1013 | 0xA1768C | 16 | Tilemap | `Tsa_TerrainMapUi_Labels` | `dump/data_A167C8_A1768C.bin` | `data/data_A167C8.s:81` |
| 1014 | 0xA1769C | 8 | Unknown | `gTSA_TerrainBox_Ballistae` | `dump/data_A167C8_A1769C.bin` | `data/data_A167C8.s:85` |
| 1015 | 0xA176A4 | 16 | Tilemap | `Tsa_TerrainMapUi_ObstacleLabels` | `dump/data_A167C8_A176A4.bin` | `data/data_A167C8.s:89` |
| 1016 | 0xA176B4 | 8 | Tilemap | `Tsa_TerrainMapUi_ObstacleFullHp` | `dump/data_A167C8_A176B4.bin` | `data/data_A167C8.s:93` |
| 1017 | 0xA176BC | 136 | Unknown | `gTSA_GoalBox_TwoLines` | `dump/data_A167C8_A176BC.bin` | `data/data_A167C8.s:97` |
| 1018 | 0xA17744 | 92 | Unknown | `gTSA_GoalBox_OneLine` | `dump/data_A167C8_A17744.bin` | `data/data_A167C8.s:101` |
| 1019 | 0xA199C8 | 580 | Graphics (4bpp) | `Img_PrepHelpButtonSprites` | `dump/data_A195B0_A199C8.bin` | `data/data_A195B0.s:5` |
| 1020 | 0xA19C0C | 160 | Graphics (4bpp) | `Img_MenuScrollBar` | `dump/data_A195B0_A19C0C.bin` | `data/data_A195B0.s:9` |
| 1021 | 0xA19CAC | 32 | Palette | `Pal_MenuScrollBar` | `dump/data_A195B0_A19CAC.bin` | `data/data_A195B0.s:13` |
| 1022 | 0xA19CCC | 952 | Unknown | `gUnknown_08A19CCC` | `dump/data_A195B0_A19CCC.bin` | `data/data_A195B0.s:17` |
| 1023 | 0xA1A084 | 32 | Palette | `Pal_SpinningArrow` | `dump/data_A195B0_A1A084.bin` | `data/data_A195B0.s:21` |
| 1024 | 0xA1A0A4 | 408 | Unknown | `gUnknown_08A1A0A4` | `dump/data_A195B0_A1A0A4.bin` | `data/data_A195B0.s:25` |
| 1025 | 0xA1A23C | 448 | Unknown | `gUnknown_08A1A23C` | `dump/data_A195B0_A1A23C.bin` | `data/data_A195B0.s:29` |
| 1026 | 0xA1A3FC | 32 | Unknown | `gUnknown_08A1A3FC` | `dump/data_A195B0_A1A3FC.bin` | `data/data_A195B0.s:33` |
| 1027 | 0xA1A41C | 24 | Tilemap | `Tsa_08A1A41C` | `dump/data_A195B0_A1A41C.bin` | `data/data_A195B0.s:37` |
| 1028 | 0xA1A434 | 64 | Tilemap | `Tsa_08A1A434` | `dump/data_A195B0_A1A434.bin` | `data/data_A195B0.s:41` |
| 1029 | 0xA1A474 | 84 | Tilemap | `Tsa_08A1A474` | `dump/data_A195B0_A1A474.bin` | `data/data_A195B0.s:45` |
| 1030 | 0xA1A4C8 | 1052 | Unknown | `gUnknown_08A1A4C8` | `dump/data_A195B0_A1A4C8.bin` | `data/data_A195B0.s:49` |
| 1031 | 0xA1A8E4 | 932 | Unknown | `gGfx_SupportScreenBanner` | `dump/data_A195B0_A1A8E4.bin` | `data/data_A195B0.s:53` |
| 1032 | 0xA1AC88 | 1104 | Unknown | `gUnknown_08A1AC88` | `dump/data_A195B0_A1AC88.bin` | `data/data_A195B0.s:57` |
| 1033 | 0xA1B174 | 32 | Unknown | `gPal_SupportScreenBanner` | `dump/data_A195B0_A1B174.bin` | `data/data_A195B0.s:69` |
| 1034 | 0xA1B194 | 104 | Unknown | `gUnknown_08A1B194` | `dump/data_A195B0_A1B194.bin` | `data/data_A195B0.s:73` |
| 1035 | 0xA1B1FC | 1084 | Unknown | `gUnknown_08A1B1FC` | `dump/data_A195B0_A1B1FC.bin` | `data/data_A195B0.s:77` |
| 1036 | 0xA1B638 | 32 | Unknown | `gUnknown_08A1B638` | `dump/data_A195B0_A1B638.bin` | `data/data_A195B0.s:81` |
| 1037 | 0xA1B658 | 64 | Unknown | `gUnknown_08A1B658` | `dump/data_A195B0_A1B658.bin` | `data/data_A195B0.s:85` |
| 1038 | 0xA1B698 | 152 | Unknown | `gUnknown_08A1B698` | `dump/data_A195B0_A1B698.bin` | `data/data_A195B0.s:89` |
| 1039 | 0xA1B730 | 152 | Unknown | `gUnknown_08A1B730` | `dump/data_A195B0_A1B730.bin` | `data/data_A195B0.s:93` |
| 1040 | 0xA1B7C8 | 240 | Unknown | `gUnknown_08A1B7C8` | `dump/data_A195B0_A1B7C8.bin` | `data/data_A195B0.s:97` |
| 1041 | 0xA1B8B8 | 216 | Unknown | `gUnknown_08A1B8B8` | `dump/data_A195B0_A1B8B8.bin` | `data/data_A195B0.s:101` |
| 1042 | 0xA1B990 | 92 | Unknown | `gUnknown_08A1B990` | `dump/data_A195B0_A1B990.bin` | `data/data_A195B0.s:105` |
| 1043 | 0xA1B9EC | 204 | Unknown | `gUnknown_08A1B9EC` | `dump/data_A195B0_A1B9EC.bin` | `data/data_A195B0.s:109` |
| 1044 | 0xA1BAB8 | 44 | Graphics (4bpp) | `Img_PrepItemUseScreen` | `dump/data_A195B0_A1BAB8.bin` | `data/data_A195B0.s:113` |
| 1045 | 0xA1BAE4 | 236 | Tilemap | `Tsa_PrepItemUseScreen` | `dump/data_A195B0_A1BAE4.bin` | `data/data_A195B0.s:117` |
| 1046 | 0xA1BBD0 | 240 | Unknown | `gUnknown_08A1BBD0` | `dump/data_A195B0_A1BBD0.bin` | `data/data_A195B0.s:121` |
| 1047 | 0xA1BCC0 | 64 | Unknown | `gUnknown_08A1BCC0` | `dump/data_A195B0_A1BCC0.bin` | `data/data_A195B0.s:125` |
| 1048 | 0xA1BD00 | 64 | Unknown | `gUnknown_08A1BD00` | `dump/data_A195B0_A1BD00.bin` | `data/data_A195B0.s:129` |
| 1049 | 0xA1BD40 | 32 | Unknown | `gUnknown_08A1BD40` | `dump/data_A195B0_A1BD40.bin` | `data/data_A195B0.s:133` |
| 1050 | 0xA1BD60 | 2468 | Unknown | `gUnknown_08A1BD60` | `dump/data_A195B0_A1BD60.bin` | `data/data_A195B0.s:137` |
| 1051 | 0xA1C704 | 212 | Graphics (4bpp) | `Img_SpinningArrow` | `dump/data_A195B0_A1C704.bin` | `data/data_A195B0.s:141` |
| 1052 | 0xA1C7D8 | 220 | Unknown | `gImg_UiSpinningArrow_Horizontal` | `dump/data_A195B0_A1C7D8.bin` | `data/data_A195B0.s:145` |
| 1053 | 0xA1C8B4 | 1204 | Unknown | `gUnknown_08A1C8B4` | `dump/data_A195B0_A1C8B4.bin` | `data/data_A195B0.s:149` |
| 1054 | 0xA1CD68 | 92 | Graphics (4bpp) | `Img_08A1CD68` | `dump/data_A195B0_A1CD68.bin` | `data/data_A195B0.s:153` |
| 1055 | 0xA1CDC4 | 1220 | Graphics (4bpp) | `Img_UnitListBanners` | `dump/data_A195B0_A1CDC4.bin` | `data/data_A195B0.s:157` |
| 1056 | 0xA1D288 | 448 | Graphics (4bpp) | `Img_UnitListBanner_Animation` | `dump/data_A195B0_A1D288.bin` | `data/data_A195B0.s:161` |
| 1057 | 0xA1D448 | 128 | Palette | `Pal_08A1D448` | `dump/data_A195B0_A1D448.bin` | `data/data_A195B0.s:165` |
| 1058 | 0xA1D4C8 | 32 | Unknown | `gUnknown_08A1D4C8` | `dump/data_A195B0_A1D4C8.bin` | `data/data_A195B0.s:169` |
| 1059 | 0xA1D4E8 | 40 | Graphics (4bpp) | `Img_PrepTextShadow` | `dump/data_A195B0_A1D4E8.bin` | `data/data_A195B0.s:173` |
| 1060 | 0xA1D510 | 652 | Unknown | `gUnknown_08A1D510` | `dump/data_A195B0_A1D510.bin` | `data/data_A195B0.s:177` |
| 1061 | 0xA1D79C | 64 | Palette | `Pal_MapBattleInfoNum` | `dump/data_A195B0_A1D79C.bin` | `data/data_A195B0.s:181` |
| 1062 | 0xA1D7DC | 116 | Graphics (4bpp) | `Img_PrepPopupWindow` | `dump/data_A195B0_A1D7DC.bin` | `data/data_A195B0.s:185` |
| 1063 | 0xA1D850 | 32 | Palette | `Pal_08A1D850` | `dump/data_A195B0_A1D850.bin` | `data/data_A195B0.s:189` |
| 1064 | 0xA1D870 | 32 | Palette | `Pal_08A1D870` | `dump/data_A195B0_A1D870.bin` | `data/data_A195B0.s:193` |
| 1065 | 0xA1D890 | 32 | Palette | `Pal_08A1D890` | `dump/data_A195B0_A1D890.bin` | `data/data_A195B0.s:197` |
| 1066 | 0xA1D8B0 | 32 | Palette | `Pal_08A1D8B0` | `dump/data_A195B0_A1D8B0.bin` | `data/data_A195B0.s:201` |
| 1067 | 0xA1D8D0 | 688 | Graphics (4bpp) | `Img_PrepWindow` | `dump/data_A195B0_A1D8D0.bin` | `data/data_A195B0.s:205` |
| 1068 | 0xA1DB80 | 156 | Unknown | `gUnknown_08A1DB80` | `dump/data_A195B0_A1DB80.bin` | `data/data_A195B0.s:209` |
| 1069 | 0xA1DC1C | 240 | Unknown | `gTsa_SupportSubScreen` | `dump/data_A195B0_A1DC1C.bin` | `data/data_A195B0.s:213` |
| 1070 | 0xA1DD0C | 972 | Unknown | `gGfx_SupportMenu` | `dump/data_A195B0_A1DD0C.bin` | `data/data_A195B0.s:217` |
| 1071 | 0xA1E0D8 | 32 | Unknown | `gPal_SupportMenu` | `dump/data_A195B0_A1E0D8.bin` | `data/data_A195B0.s:221` |
| 1072 | 0xA21658 | 18292 | Graphics (4bpp) | `Img_SaveMenuBG` | `dump/data_A21658_A21658.bin` | `data/data_A21658.s:5` |
| 1073 | 0xA25DCC | 256 | Palette | `Pal_SaveMenuBG` | `dump/data_A21658_A25DCC.bin` | `data/data_A21658.s:9` |
| 1074 | 0xA25ECC | 1204 | Tilemap | `Tsa_SaveMenuBG` | `dump/data_A21658_A25ECC.bin` | `data/data_A21658.s:13` |
| 1075 | 0xA26380 | 1368 | Graphics (4bpp) | `Img_MainMenuBgFog` | `dump/data_A21658_A26380.bin` | `data/data_A21658.s:17` |
| 1076 | 0xA268D8 | 32 | Palette | `Pal_MainMenuBgFog` | `dump/data_A21658_A268D8.bin` | `data/data_A21658.s:21` |
| 1077 | 0xA268F8 | 380 | Tilemap | `Tsa_MainMenuBgFog` | `dump/data_A21658_A268F8.bin` | `data/data_A21658.s:25` |
| 1078 | 0xA26A74 | 5364 | Graphics (4bpp) | `Img_SaveScreenSprits` | `dump/data_A21658_A26A74.bin` | `data/data_A21658.s:29` |
| 1079 | 0xA27F68 | 288 | Palette | `Pal_SaveScreenSprits` | `dump/data_A21658_A27F68.bin` | `data/data_A21658.s:33` |
| 1080 | 0xA28088 | 32 | Palette | `Pal_08A28088` | `dump/data_A21658_A28088.bin` | `data/data_A21658.s:37` |
| 1081 | 0xA280A8 | 132 | Unknown | `gUnknown_08A280A8` | `dump/data_A21658_A280A8.bin` | `data/data_A21658.s:41` |
| 1082 | 0xA2812C | 2272 | Graphics (4bpp) | `Img_GameMainMenuObjs` | `dump/data_A21658_A2812C.bin` | `data/data_A21658.s:45` |
| 1083 | 0xA28A0C | 2572 | Graphics (4bpp) | `Img_DifficultyMenuObjs` | `dump/data_A21658_A28A0C.bin` | `data/data_A21658.s:49` |
| 1084 | 0xA29418 | 128 | Palette | `Pal_DifficultyMenuObjs` | `dump/data_A21658_A29418.bin` | `data/data_A21658.s:53` |
| 1085 | 0xA29498 | 192 | Unknown | `gUnknown_08A29498` | `dump/data_A21658_A29498.bin` | `data/data_A21658.s:57` |
| 1086 | 0xA29558 | 92 | Unknown | `gUnknown_08A29558` | `dump/data_A21658_A29558.bin` | `data/data_A21658.s:61` |
| 1087 | 0xA295B4 | 32 | Palette | `Pal_08A295B4` | `dump/data_A21658_A295B4.bin` | `data/data_A21658.s:65` |
| 1088 | 0xA295D4 | 1204 | Tilemap | `Tsa_CommGameBgScreenInShop` | `dump/data_A21658_A295D4.bin` | `data/data_A21658.s:69` |
| 1089 | 0xA29A88 | 5980 | Unknown | `gUnknown_08A29A88` | `dump/data_A21658_A29A88.bin` | `data/data_A21658.s:73` |
| 1090 | 0xA2B1E4 | 3896 | Unknown | `gUnknown_08A2B1E4` | `dump/data_A21658_A2B1E4.bin` | `data/data_A21658.s:77` |
| 1091 | 0xA2C11C | 288 | Unknown | `gUnknown_08A2C11C` | `dump/data_A21658_A2C11C.bin` | `data/data_A21658.s:81` |
| 1092 | 0xA2C23C | 652 | Unknown | `gUnknown_08A2C23C` | `dump/data_A21658_A2C23C.bin` | `data/data_A21658.s:85` |
| 1093 | 0xA2C4C8 | 224 | Unknown | `gUnknown_08A2C4C8` | `dump/data_A21658_A2C4C8.bin` | `data/data_A21658.s:89` |
| 1094 | 0xA2C5A8 | 508 | Unknown | `gUnknown_08A2C5A8` | `dump/data_A21658_A2C5A8.bin` | `data/data_A21658.s:93` |
| 1095 | 0xA2C7A4 | 148 | Unknown | `gUnknown_08A2C7A4` | `dump/data_A21658_A2C7A4.bin` | `data/data_A21658.s:97` |
| 1096 | 0xA2C838 | 112 | Graphics (4bpp) | `Img_SoundRoomVolumeGraph` | `dump/data_A21658_A2C838.bin` | `data/data_A21658.s:101` |
| 1097 | 0xA2C8A8 | 96 | Palette | `Pal_SoundRoomVolumeGraph` | `dump/data_A21658_A2C8A8.bin` | `data/data_A21658.s:105` |
| 1098 | 0xA2C908 | 36 | Unknown | `gUnknown_08A2C908` | `dump/data_A21658_A2C908.bin` | `data/data_A21658.s:109` |
| 1099 | 0xA2C92C | 400 | Unknown | `gUnknown_08A2C92C` | `dump/data_A21658_A2C92C.bin` | `data/data_A21658.s:113` |
| 1100 | 0xA2CABC | 2064 | Graphics (4bpp) | `Img_SoundRoomUiElements` | `dump/data_A21658_A2CABC.bin` | `data/data_A21658.s:117` |
| 1101 | 0xA2D2CC | 96 | Palette | `Pal_SoundRoomUiElements` | `dump/data_A21658_A2D2CC.bin` | `data/data_A21658.s:121` |
| 1102 | 0xA2D32C | 3724 | Graphics (4bpp) | `Img_PlayStatusSprites` | `dump/data_A21658_A2D32C.bin` | `data/data_A21658.s:125` |
| 1103 | 0xA2E1B8 | 64 | Palette | `Pal_PlayStatusSprites` | `dump/data_A21658_A2E1B8.bin` | `data/data_A21658.s:129` |
| 1104 | 0xA2E1F8 | 28 | Graphics (4bpp) | `Img_ChapterStatusSelectorSprite` | `dump/data_A21658_A2E1F8.bin` | `data/data_A21658.s:133` |
| 1105 | 0xA2E214 | 656 | Graphics (4bpp) | `Img_StatusScreenLabelSprites` | `dump/data_A21658_A2E214.bin` | `data/data_A21658.s:137` |
| 1106 | 0xA2E4A4 | 32 | Palette | `Pal_StatusScreenLabelSprites` | `dump/data_A21658_A2E4A4.bin` | `data/data_A21658.s:141` |
| 1107 | 0xA2E4C4 | 296 | Tilemap | `Tsa_ChapterStatusUi` | `dump/data_A21658_A2E4C4.bin` | `data/data_A21658.s:145` |
| 1108 | 0xA2E5EC | 772 | Graphics (4bpp) | `Img_08A2E5EC` | `dump/data_A21658_A2E5EC.bin` | `data/data_A21658.s:149` |
| 1109 | 0xA2E8F0 | 96 | Palette | `Pal_08A2E8F0` | `dump/data_A21658_A2E8F0.bin` | `data/data_A21658.s:153` |
| 1110 | 0xA2E950 | 36 | Graphics (4bpp) | `Img_SysBlackBox` | `dump/data_A21658_A2E950.bin` | `data/data_A21658.s:157` |
| 1111 | 0xA301B0 | 1488 | Unknown | `gUnknown_08A301B0` | `dump/data_A2EEF0_A301B0.bin` | `data/data_A2EEF0.s:5` |
| 1112 | 0xA30780 | 128 | Unknown | `gUnknown_08A30780` | `dump/data_A2EEF0_A30780.bin` | `data/data_A2EEF0.s:9` |
| 1113 | 0xA30800 | 376 | Unknown | `gUnknown_08A30800` | `dump/data_A2EEF0_A30800.bin` | `data/data_A2EEF0.s:13` |
| 1114 | 0xA30978 | 1204 | Unknown | `gUnknown_08A30978` | `dump/data_A2EEF0_A30978.bin` | `data/data_A2EEF0.s:17` |
| 1115 | 0xA30E2C | 18012 | Unknown | `gUnknown_08A30E2C` | `dump/data_A2EEF0_A30E2C.bin` | `data/data_A2EEF0.s:21` |
| 1116 | 0xA35488 | 1204 | Unknown | `gUnknown_08A35488` | `dump/data_A2EEF0_A35488.bin` | `data/data_A2EEF0.s:25` |
| 1117 | 0xA3593C | 256 | Unknown | `gUnknown_08A3593C` | `dump/data_A2EEF0_A3593C.bin` | `data/data_A2EEF0.s:29` |
| 1118 | 0xA35A3C | 1428 | Unknown | `gUnknown_08A35A3C` | `dump/data_A2EEF0_A35A3C.bin` | `data/data_A2EEF0.s:33` |
| 1119 | 0xA35FD0 | 248 | Unknown | `gUnknown_08A35FD0` | `dump/data_A2EEF0_A35FD0.bin` | `data/data_A2EEF0.s:37` |
| 1120 | 0xA360C8 | 32 | Unknown | `gUnknown_08A360C8` | `dump/data_A2EEF0_A360C8.bin` | `data/data_A2EEF0.s:41` |
| 1121 | 0xA360E8 | 412 | Unknown | `gUnknown_08A360E8` | `dump/data_A2EEF0_A360E8.bin` | `data/data_A2EEF0.s:45` |
| 1122 | 0xA36284 | 180 | Unknown | `gUnknown_08A36284` | `dump/data_A2EEF0_A36284.bin` | `data/data_A2EEF0.s:49` |
| 1123 | 0xA36338 | 3976 | Unknown | `gUnknown_08A36338` | `dump/data_A2EEF0_A36338.bin` | `data/data_A2EEF0.s:53` |
| 1124 | 0xA372C0 | 64 | Unknown | `gUnknown_08A372C0` | `dump/data_A2EEF0_A372C0.bin` | `data/data_A2EEF0.s:57` |
| 1125 | 0xA37300 | 7792 | Unknown | `gUnknown_08A37300` | `dump/data_A2EEF0_A37300.bin` | `data/data_A2EEF0.s:61` |
| 1126 | 0xA3F21C | 1268 | Unknown | `(none)` | `dump/data_A3E4D4_A3F21C.bin` | `data/data_A3E4D4.s:3` |
| 1127 | 0xA3F710 | 64 | Palette | `Pal_CharacterEndingMenu` | `dump/data_A3E4D4_A3F710.bin` | `data/data_A3E4D4.s:7` |
| 1128 | 0xA3F750 | 2204 | Graphics (4bpp) | `Img_CharacterEndingMenu` | `dump/data_A3E4D4_A3F750.bin` | `data/data_A3E4D4.s:11` |
| 1129 | 0xA3FFEC | 124 | Tilemap | `Tsa_CharacterEnding_TopBorder` | `dump/data_A3E4D4_A3FFEC.bin` | `data/data_A3E4D4.s:15` |
| 1130 | 0xA40068 | 124 | Tilemap | `Tsa_CharacterEnding_BottomBorder` | `dump/data_A3E4D4_A40068.bin` | `data/data_A3E4D4.s:19` |
| 1131 | 0xA400E4 | 288 | Unknown | `gTsa_SoloEndingNameplate` | `dump/data_A3E4D4_A400E4.bin` | `data/data_A3E4D4.s:23` |
| 1132 | 0xA40204 | 328 | Unknown | `gTsa_SoloEndingWindow` | `dump/data_A3E4D4_A40204.bin` | `data/data_A3E4D4.s:27` |
| 1133 | 0xA4034C | 292 | Unknown | `gTsa_PairedEndingNameplates` | `dump/data_A3E4D4_A4034C.bin` | `data/data_A3E4D4.s:31` |
| 1134 | 0xA40470 | 324 | Unknown | `gTsa_PairedEndingWindow` | `dump/data_A3E4D4_A40470.bin` | `data/data_A3E4D4.s:35` |
| 1135 | 0xA405B4 | 32 | Palette | `Pal_FinScreen` | `dump/data_A3E4D4_A405B4.bin` | `data/data_A3E4D4.s:39` |
| 1136 | 0xA405D4 | 1020 | Graphics (4bpp) | `Img_FinScreen` | `dump/data_A3E4D4_A405D4.bin` | `data/data_A3E4D4.s:43` |
| 1137 | 0xA409D0 | 260 | Tilemap | `Tsa_FinScreen` | `dump/data_A3E4D4_A409D0.bin` | `data/data_A3E4D4.s:47` |
| 1138 | 0xA40AD4 | 64 | Palette | `Pal_08A40AD4` | `dump/data_A3E4D4_A40AD4.bin` | `data/data_A3E4D4.s:51` |
| 1139 | 0xA40B14 | 1204 | Tilemap | `Tsa_08A40B14` | `dump/data_A3E4D4_A40B14.bin` | `data/data_A3E4D4.s:55` |
| 1140 | 0xA40FC8 | 32 | Palette | `Pal_StaffReelEnt_08A40FC8` | `dump/data_A3E4D4_A40FC8.bin` | `data/data_A3E4D4.s:59` |
| 1141 | 0xA40FE8 | 2888 | Graphics (4bpp) | `Img_StaffReelEnt_08A40FE8` | `dump/data_A3E4D4_A40FE8.bin` | `data/data_A3E4D4.s:63` |
| 1142 | 0xA41B30 | 3096 | Graphics (4bpp) | `Img_StaffReelEnt_08A41B30` | `dump/data_A3E4D4_A41B30.bin` | `data/data_A3E4D4.s:67` |
| 1143 | 0xA42748 | 2936 | Graphics (4bpp) | `Img_StaffReelEnt_08A42748` | `dump/data_A3E4D4_A42748.bin` | `data/data_A3E4D4.s:71` |
| 1144 | 0xA432C0 | 2556 | Graphics (4bpp) | `Img_StaffReelEnt_08A432C0` | `dump/data_A3E4D4_A432C0.bin` | `data/data_A3E4D4.s:75` |
| 1145 | 0xA43CBC | 5268 | Graphics (4bpp) | `Img_StaffReelEnt_08A43CBC` | `dump/data_A3E4D4_A43CBC.bin` | `data/data_A3E4D4.s:79` |
| 1146 | 0xA45150 | 1228 | Graphics (4bpp) | `Img_StaffReelEnt_08A45150` | `dump/data_A3E4D4_A45150.bin` | `data/data_A3E4D4.s:83` |
| 1147 | 0xA4561C | 2364 | Graphics (4bpp) | `Img_StaffReelEnt_08A4561C` | `dump/data_A3E4D4_A4561C.bin` | `data/data_A3E4D4.s:87` |
| 1148 | 0xA45F58 | 2608 | Graphics (4bpp) | `Img_StaffReelEnt_08A45F58` | `dump/data_A3E4D4_A45F58.bin` | `data/data_A3E4D4.s:91` |
| 1149 | 0xA46988 | 2344 | Graphics (4bpp) | `Img_StaffReelEnt_08A46988` | `dump/data_A3E4D4_A46988.bin` | `data/data_A3E4D4.s:95` |
| 1150 | 0xA472B0 | 5268 | Graphics (4bpp) | `Img_StaffReelEnt_08A472B0` | `dump/data_A3E4D4_A472B0.bin` | `data/data_A3E4D4.s:99` |
| 1151 | 0xA48744 | 4196 | Graphics (4bpp) | `Img_StaffReelEnt_08A48744` | `dump/data_A3E4D4_A48744.bin` | `data/data_A3E4D4.s:103` |
| 1152 | 0xA497A8 | 4652 | Graphics (4bpp) | `Img_StaffReelEnt_08A497A8` | `dump/data_A3E4D4_A497A8.bin` | `data/data_A3E4D4.s:107` |
| 1153 | 0xA4A9D4 | 1076 | Graphics (4bpp) | `Img_StaffReelEnt_08A4A9D4` | `dump/data_A3E4D4_A4A9D4.bin` | `data/data_A3E4D4.s:111` |
| 1154 | 0xA4AE08 | 648 | Tilemap | `Tsa_StaffReelEnt_08A4AE08` | `dump/data_A3E4D4_A4AE08.bin` | `data/data_A3E4D4.s:115` |
| 1155 | 0xA4B090 | 612 | Tilemap | `Tsa_StaffReelEnt_08A4B090` | `dump/data_A3E4D4_A4B090.bin` | `data/data_A3E4D4.s:119` |
| 1156 | 0xA4B2F4 | 612 | Tilemap | `Tsa_StaffReelEnt_08A4B2F4` | `dump/data_A3E4D4_A4B2F4.bin` | `data/data_A3E4D4.s:123` |
| 1157 | 0xA4B558 | 560 | Tilemap | `Tsa_StaffReelEnt_08A4B558` | `dump/data_A3E4D4_A4B558.bin` | `data/data_A3E4D4.s:127` |
| 1158 | 0xA4B788 | 968 | Tilemap | `Tsa_StaffReelEnt_08A4B788` | `dump/data_A3E4D4_A4B788.bin` | `data/data_A3E4D4.s:131` |
| 1159 | 0xA4BB50 | 372 | Tilemap | `Tsa_StaffReelEnt_08A4BB50` | `dump/data_A3E4D4_A4BB50.bin` | `data/data_A3E4D4.s:135` |
| 1160 | 0xA4BCC4 | 508 | Tilemap | `Tsa_StaffReelEnt_08A4BCC4` | `dump/data_A3E4D4_A4BCC4.bin` | `data/data_A3E4D4.s:139` |
| 1161 | 0xA4BEC0 | 548 | Tilemap | `Tsa_StaffReelEnt_08A4BEC0` | `dump/data_A3E4D4_A4BEC0.bin` | `data/data_A3E4D4.s:143` |
| 1162 | 0xA4C0E4 | 548 | Tilemap | `Tsa_StaffReelEnt_08A4C0E4` | `dump/data_A3E4D4_A4C0E4.bin` | `data/data_A3E4D4.s:147` |
| 1163 | 0xA4C308 | 996 | Tilemap | `Tsa_StaffReelEnt_08A4C308` | `dump/data_A3E4D4_A4C308.bin` | `data/data_A3E4D4.s:151` |
| 1164 | 0xA4C6EC | 772 | Tilemap | `Tsa_StaffReelEnt_08A4C6EC` | `dump/data_A3E4D4_A4C6EC.bin` | `data/data_A3E4D4.s:155` |
| 1165 | 0xA4C9F0 | 848 | Tilemap | `Tsa_StaffReelEnt_08A4C9F0` | `dump/data_A3E4D4_A4C9F0.bin` | `data/data_A3E4D4.s:159` |
| 1166 | 0xA4CD40 | 492 | Tilemap | `Tsa_StaffReelEnt_08A4CD40` | `dump/data_A3E4D4_A4CD40.bin` | `data/data_A3E4D4.s:163` |
| 1167 | 0xA4CF2C | 416 | Unknown | `gGfx_BrownTextBox` | `dump/data_A3E4D4_A4CF2C.bin` | `data/data_A3E4D4.s:167` |
| 1168 | 0xA4D0CC | 284 | Unknown | `gPal_BrownTextBox` | `dump/data_A3E4D4_A4D0CC.bin` | `data/data_A3E4D4.s:171` |
| 1169 | 0xA83364 | 76800 | Unknown | `gUnknown_08A83364` | `dump/data_A3E4D4_A83364.bin` | `data/data_A3E4D4.s:775` |
| 1170 | 0xA95F64 | 128 | Unknown | `gUnknown_08A95F64` | `dump/data_A3E4D4_A95F64.bin` | `data/data_A3E4D4.s:779` |
| 1171 | 0xA95FE4 | 128 | Unknown | `gUnknown_08A95FE4` | `dump/data_A3E4D4_A95FE4.bin` | `data/data_A3E4D4.s:783` |
| 1172 | 0xA96064 | 676 | Unknown | `gUnknown_08A96064` | `dump/data_A3E4D4_A96064.bin` | `data/data_A3E4D4.s:787` |
| 1173 | 0xA96308 | 4360 | Graphics (4bpp) | `Img_GmapNodes` | `dump/data_A3E4D4_A96308.bin` | `data/data_A3E4D4.s:791` |
| 1174 | 0xA97410 | 1584 | Graphics (4bpp) | `Img_GmapCastleNodes` | `dump/data_A3E4D4_A97410.bin` | `data/data_A3E4D4.s:795` |
| 1175 | 0xA97A40 | 32 | Unknown | `gUnknown_08A97A40` | `dump/data_A3E4D4_A97A40.bin` | `data/data_A3E4D4.s:799` |
| 1176 | 0xA97A60 | 32 | Unknown | `gPal_GMapPI_ShopIcons` | `dump/data_A3E4D4_A97A60.bin` | `data/data_A3E4D4.s:803` |
| 1177 | 0xA97A80 | 76 | Unknown | `gGfx_GMapPI_ShopIcons` | `dump/data_A3E4D4_A97A80.bin` | `data/data_A3E4D4.s:807` |
| 1178 | 0xA97ACC | 32 | Unknown | `gPal_08A97ACC` | `dump/data_A3E4D4_A97ACC.bin` | `data/data_A3E4D4.s:811` |
| 1179 | 0xA97AEC | 428 | Unknown | `Sprite_08A97AEC` | `dump/data_A3E4D4_A97AEC.bin` | `data/data_A3E4D4.s:815` |
| 1180 | 0xA97C98 | 400 | Unknown | `gImg_WorldmapNodeRevealEffect` | `dump/data_A3E4D4_A97C98.bin` | `data/data_A3E4D4.s:819` |
| 1181 | 0xA97E28 | 32 | Unknown | `gPal_WorldmapNodeRevealEffect` | `dump/data_A3E4D4_A97E28.bin` | `data/data_A3E4D4.s:823` |
| 1182 | 0xA97E48 | 144 | Unknown | `gUnknown_08A97E48` | `dump/data_A3E4D4_A97E48.bin` | `data/data_A3E4D4.s:827` |
| 1183 | 0xA97ED8 | 204 | Graphics (4bpp) | `Img_GmapPath` | `dump/data_A3E4D4_A97ED8.bin` | `data/data_A3E4D4.s:831` |
| 1184 | 0xA97FA4 | 32 | Unknown | `gUnknown_08A97FA4` | `dump/data_A3E4D4_A97FA4.bin` | `data/data_A3E4D4.s:835` |
| 1185 | 0xA97FC4 | 52 | Unknown | `gUnknown_08A97FC4` | `dump/data_A3E4D4_A97FC4.bin` | `data/data_A3E4D4.s:839` |
| 1186 | 0xA97FF8 | 56 | Unknown | `gUnknown_08A97FF8` | `dump/data_A3E4D4_A97FF8.bin` | `data/data_A3E4D4.s:843` |
| 1187 | 0xA98030 | 36 | Unknown | `gUnknown_08A98030` | `dump/data_A3E4D4_A98030.bin` | `data/data_A3E4D4.s:847` |
| 1188 | 0xA98054 | 24 | Unknown | `gUnknown_08A98054` | `dump/data_A3E4D4_A98054.bin` | `data/data_A3E4D4.s:851` |
| 1189 | 0xA9806C | 36 | Unknown | `gUnknown_08A9806C` | `dump/data_A3E4D4_A9806C.bin` | `data/data_A3E4D4.s:855` |
| 1190 | 0xA98090 | 36 | Unknown | `gUnknown_08A98090` | `dump/data_A3E4D4_A98090.bin` | `data/data_A3E4D4.s:859` |
| 1191 | 0xA980B4 | 40 | Unknown | `gUnknown_08A980B4` | `dump/data_A3E4D4_A980B4.bin` | `data/data_A3E4D4.s:863` |
| 1192 | 0xA980DC | 40 | Unknown | `gUnknown_08A980DC` | `dump/data_A3E4D4_A980DC.bin` | `data/data_A3E4D4.s:867` |
| 1193 | 0xA98104 | 64 | Unknown | `gUnknown_08A98104` | `dump/data_A3E4D4_A98104.bin` | `data/data_A3E4D4.s:871` |
| 1194 | 0xA98144 | 36 | Unknown | `gUnknown_08A98144` | `dump/data_A3E4D4_A98144.bin` | `data/data_A3E4D4.s:875` |
| 1195 | 0xA98168 | 52 | Unknown | `gUnknown_08A98168` | `dump/data_A3E4D4_A98168.bin` | `data/data_A3E4D4.s:879` |
| 1196 | 0xA9819C | 32 | Unknown | `gUnknown_08A9819C` | `dump/data_A3E4D4_A9819C.bin` | `data/data_A3E4D4.s:883` |
| 1197 | 0xA981BC | 56 | Unknown | `gUnknown_08A981BC` | `dump/data_A3E4D4_A981BC.bin` | `data/data_A3E4D4.s:887` |
| 1198 | 0xA981F4 | 52 | Unknown | `gUnknown_08A981F4` | `dump/data_A3E4D4_A981F4.bin` | `data/data_A3E4D4.s:891` |
| 1199 | 0xA98228 | 84 | Unknown | `gUnknown_08A98228` | `dump/data_A3E4D4_A98228.bin` | `data/data_A3E4D4.s:895` |
| 1200 | 0xA9827C | 88 | Unknown | `gUnknown_08A9827C` | `dump/data_A3E4D4_A9827C.bin` | `data/data_A3E4D4.s:899` |
| 1201 | 0xA982D4 | 64 | Unknown | `gUnknown_08A982D4` | `dump/data_A3E4D4_A982D4.bin` | `data/data_A3E4D4.s:903` |
| 1202 | 0xA98314 | 48 | Unknown | `gUnknown_08A98314` | `dump/data_A3E4D4_A98314.bin` | `data/data_A3E4D4.s:907` |
| 1203 | 0xA98344 | 40 | Unknown | `gUnknown_08A98344` | `dump/data_A3E4D4_A98344.bin` | `data/data_A3E4D4.s:911` |
| 1204 | 0xA9836C | 80 | Unknown | `gUnknown_08A9836C` | `dump/data_A3E4D4_A9836C.bin` | `data/data_A3E4D4.s:915` |
| 1205 | 0xA983BC | 52 | Unknown | `gUnknown_08A983BC` | `dump/data_A3E4D4_A983BC.bin` | `data/data_A3E4D4.s:919` |
| 1206 | 0xA983F0 | 88 | Unknown | `gUnknown_08A983F0` | `dump/data_A3E4D4_A983F0.bin` | `data/data_A3E4D4.s:923` |
| 1207 | 0xA98448 | 52 | Unknown | `gUnknown_08A98448` | `dump/data_A3E4D4_A98448.bin` | `data/data_A3E4D4.s:927` |
| 1208 | 0xA9847C | 88 | Unknown | `gUnknown_08A9847C` | `dump/data_A3E4D4_A9847C.bin` | `data/data_A3E4D4.s:931` |
| 1209 | 0xA984D4 | 56 | Unknown | `gUnknown_08A984D4` | `dump/data_A3E4D4_A984D4.bin` | `data/data_A3E4D4.s:935` |
| 1210 | 0xA9850C | 52 | Unknown | `gUnknown_08A9850C` | `dump/data_A3E4D4_A9850C.bin` | `data/data_A3E4D4.s:939` |
| 1211 | 0xA98540 | 40 | Unknown | `gUnknown_08A98540` | `dump/data_A3E4D4_A98540.bin` | `data/data_A3E4D4.s:943` |
| 1212 | 0xA98568 | 60 | Unknown | `gUnknown_08A98568` | `dump/data_A3E4D4_A98568.bin` | `data/data_A3E4D4.s:947` |
| 1213 | 0xA985A4 | 88 | Unknown | `gUnknown_08A985A4` | `dump/data_A3E4D4_A985A4.bin` | `data/data_A3E4D4.s:951` |
| 1214 | 0xA985FC | 64 | Unknown | `gUnknown_08A985FC` | `dump/data_A3E4D4_A985FC.bin` | `data/data_A3E4D4.s:955` |
| 1215 | 0xA9863C | 88 | Unknown | `gUnknown_08A9863C` | `dump/data_A3E4D4_A9863C.bin` | `data/data_A3E4D4.s:959` |
| 1216 | 0xA98694 | 44 | Unknown | `gUnknown_08A98694` | `dump/data_A3E4D4_A98694.bin` | `data/data_A3E4D4.s:963` |
| 1217 | 0xA986C0 | 1336 | Unknown | `gUnknown_08A986C0` | `dump/data_A3E4D4_A986C0.bin` | `data/data_A3E4D4.s:967` |
| 1218 | 0xA98BF8 | 260 | Unknown | `gUnknown_08A98BF8` | `dump/data_A3E4D4_A98BF8.bin` | `data/data_A3E4D4.s:971` |
| 1219 | 0xA98CFC | 92 | Unknown | `gUnknown_08A98CFC` | `dump/data_A3E4D4_A98CFC.bin` | `data/data_A3E4D4.s:975` |
| 1220 | 0xA98D58 | 48 | Unknown | `gUnknown_08A98D58` | `dump/data_A3E4D4_A98D58.bin` | `data/data_A3E4D4.s:979` |
| 1221 | 0xA98D88 | 24 | Unknown | `gUnknown_08A98D88` | `dump/data_A3E4D4_A98D88.bin` | `data/data_A3E4D4.s:983` |
| 1222 | 0xA98DA0 | 24 | Unknown | `gUnknown_08A98DA0` | `dump/data_A3E4D4_A98DA0.bin` | `data/data_A3E4D4.s:987` |
| 1223 | 0xA98DB8 | 20 | Unknown | `gUnknown_08A98DB8` | `dump/data_A3E4D4_A98DB8.bin` | `data/data_A3E4D4.s:991` |
| 1224 | 0xA98DCC | 96 | Unknown | `gUnknown_08A98DCC` | `dump/data_A3E4D4_A98DCC.bin` | `data/data_A3E4D4.s:995` |
| 1225 | 0xA98E2C | 32 | Unknown | `gUnknown_08A98E2C` | `dump/data_A3E4D4_A98E2C.bin` | `data/data_A3E4D4.s:999` |
| 1226 | 0xA98E4C | 32 | Unknown | `gUnknown_08A98E4C` | `dump/data_A3E4D4_A98E4C.bin` | `data/data_A3E4D4.s:1003` |
| 1227 | 0xA98E6C | 32 | Unknown | `gUnknown_08A98E6C` | `dump/data_A3E4D4_A98E6C.bin` | `data/data_A3E4D4.s:1007` |
| 1228 | 0xA98E8C | 32 | Unknown | `gUnknown_08A98E8C` | `dump/data_A3E4D4_A98E8C.bin` | `data/data_A3E4D4.s:1011` |
| 1229 | 0xA98EAC | 132 | Unknown | `gUnknown_08A98EAC` | `dump/data_A3E4D4_A98EAC.bin` | `data/data_A3E4D4.s:1015` |
| 1230 | 0xA98F30 | 236 | Unknown | `gUnknown_08A98F30` | `dump/data_A3E4D4_A98F30.bin` | `data/data_A3E4D4.s:1019` |
| 1231 | 0xA9901C | 260 | Unknown | `gGfx_GMapPI_LevelNums` | `dump/data_A3E4D4_A9901C.bin` | `data/data_A3E4D4.s:1023` |
| 1232 | 0xA99120 | 32 | Unknown | `gPal_GMapPI_LevelNums` | `dump/data_A3E4D4_A99120.bin` | `data/data_A3E4D4.s:1027` |
| 1233 | 0xA99140 | 20020 | Graphics (4bpp) | `Img_EventGmap` | `dump/data_A3E4D4_A99140.bin` | `data/data_A3E4D4.s:1031` |
| 1234 | 0xA9DF74 | 1360 | Tilemap | `Tsa_EventGmap` | `dump/data_A3E4D4_A9DF74.bin` | `data/data_A3E4D4.s:1035` |
| 1235 | 0xA9E4C4 | 128 | Palette | `Pal_EventGmap` | `dump/data_A3E4D4_A9E4C4.bin` | `data/data_A3E4D4.s:1039` |
| 1236 | 0xA9E544 | 120 | Unknown | `gImg_08A9E544` | `dump/data_A3E4D4_A9E544.bin` | `data/data_A3E4D4.s:1043` |
| 1237 | 0xA9E5BC | 32 | Unknown | `gPal_08A9E5BC` | `dump/data_A3E4D4_A9E5BC.bin` | `data/data_A3E4D4.s:1047` |
| 1238 | 0xA9E5DC | 172 | Unknown | `gTsa_08A9E5DC` | `dump/data_A3E4D4_A9E5DC.bin` | `data/data_A3E4D4.s:1051` |
| 1239 | 0xA9E688 | 64 | Palette | `Pal_WmHighLightNationMap` | `dump/data_A3E4D4_A9E688.bin` | `data/data_A3E4D4.s:1055` |
| 1240 | 0xA9EC24 | 112 | Unknown | `Ap_WmHightLightMapFrecia` | `dump/data_A3E4D4_A9EC24.bin` | `data/data_A3E4D4.s:1063` |
| 1241 | 0xA9EC94 | 1732 | Graphics (4bpp) | `Img_WmHightLightMap2` | `dump/data_A3E4D4_A9EC94.bin` | `data/data_A3E4D4.s:1067` |
| 1242 | 0xA9F358 | 316 | Unknown | `Ap_WmHightLightMap2` | `dump/data_A3E4D4_A9F358.bin` | `data/data_A3E4D4.s:1071` |
| 1243 | 0xA9F494 | 1332 | Graphics (4bpp) | `Img_WmHightLightMap3` | `dump/data_A3E4D4_A9F494.bin` | `data/data_A3E4D4.s:1075` |
| 1244 | 0xA9F9C8 | 100 | Unknown | `Ap_WmHightLightMap3` | `dump/data_A3E4D4_A9F9C8.bin` | `data/data_A3E4D4.s:1079` |
| 1245 | 0xA9FA2C | 1144 | Graphics (4bpp) | `Img_WmHightLightMap4` | `dump/data_A3E4D4_A9FA2C.bin` | `data/data_A3E4D4.s:1083` |
| 1246 | 0xA9FEA4 | 92 | Unknown | `Ap_WmHightLightMap4` | `dump/data_A3E4D4_A9FEA4.bin` | `data/data_A3E4D4.s:1087` |
| 1247 | 0xA9FF00 | 780 | Graphics (4bpp) | `Img_WmHightLightMap5` | `dump/data_A3E4D4_A9FF00.bin` | `data/data_A3E4D4.s:1091` |
| 1248 | 0xAA020C | 52 | Unknown | `Ap_WmHightLightMap5` | `dump/data_A3E4D4_AA020C.bin` | `data/data_A3E4D4.s:1095` |
| 1249 | 0xAA0240 | 1312 | Graphics (4bpp) | `Img_WmHightLightMap6` | `dump/data_A3E4D4_AA0240.bin` | `data/data_A3E4D4.s:1099` |
| 1250 | 0xAA0760 | 80 | Unknown | `Ap_WmHightLightMap6` | `dump/data_A3E4D4_AA0760.bin` | `data/data_A3E4D4.s:1103` |
| 1251 | 0xAA07B0 | 992 | Graphics (4bpp) | `Img_WmHightLightMap7` | `dump/data_A3E4D4_AA07B0.bin` | `data/data_A3E4D4.s:1107` |
| 1252 | 0xAA0B90 | 56 | Unknown | `Ap_WmHightLightMap7` | `dump/data_A3E4D4_AA0B90.bin` | `data/data_A3E4D4.s:1111` |
| 1253 | 0xAA0BC8 | 1308 | Graphics (4bpp) | `Img_WmHightLightMap8` | `dump/data_A3E4D4_AA0BC8.bin` | `data/data_A3E4D4.s:1115` |
| 1254 | 0xAA10E4 | 104 | Unknown | `Ap_WmHightLightMap8` | `dump/data_A3E4D4_AA10E4.bin` | `data/data_A3E4D4.s:1119` |
| 1255 | 0xAA114C | 68 | Graphics (4bpp) | `Img_WorldMapPlaceDot` | `dump/data_A3E4D4_AA114C.bin` | `data/data_A3E4D4.s:1123` |
| 1256 | 0xAA1190 | 32 | Palette | `Pal_WmPlaceDot_Highlight` | `dump/data_A3E4D4_AA1190.bin` | `data/data_A3E4D4.s:1127` |
| 1257 | 0xAA11B0 | 32 | Palette | `Pal_WmPlaceDot_Standard` | `dump/data_A3E4D4_AA11B0.bin` | `data/data_A3E4D4.s:1131` |
| 1258 | 0xAA11D0 | 176 | Unknown | `gUnknown_08AA11D0` | `dump/data_A3E4D4_AA11D0.bin` | `data/data_A3E4D4.s:1135` |
| 1259 | 0xAA1280 | 1548 | Graphics (4bpp) | `Img_WorldmapMinimap` | `dump/data_A3E4D4_AA1280.bin` | `data/data_A3E4D4.s:1139` |
| 1260 | 0xAA188C | 32 | Palette | `Pal_WorldmapMinimap` | `dump/data_A3E4D4_AA188C.bin` | `data/data_A3E4D4.s:1143` |
| 1261 | 0xAA18AC | 132 | Unknown | `gUnknown_08AA18AC` | `dump/data_A3E4D4_AA18AC.bin` | `data/data_A3E4D4.s:1147` |
| 1262 | 0xAA1930 | 32 | Unknown | `gUnknown_08AA1930` | `dump/data_A3E4D4_AA1930.bin` | `data/data_A3E4D4.s:1151` |
| 1263 | 0xAA1950 | 32 | Unknown | `gUnknown_08AA1950` | `dump/data_A3E4D4_AA1950.bin` | `data/data_A3E4D4.s:1155` |
| 1264 | 0xAA1970 | 768 | Unknown | `gImg_WorldmapSkirmish` | `dump/data_A3E4D4_AA1970.bin` | `data/data_A3E4D4.s:1159` |
| 1265 | 0xAA1C70 | 980 | Unknown | `SpriteAnim_WorldmapSkirmish` | `dump/data_A3E4D4_AA1C70.bin` | `data/data_A3E4D4.s:1163` |
| 1266 | 0xAA709C | 32 | Unknown | `gUnknown_08AA709C` | `dump/data_AA6BFA_AA709C.bin` | `data/data_AA6BFA.s:46` |
| 1267 | 0xAA70BC | 32 | Unknown | `gUnknown_08AA70BC` | `dump/data_AA6BFA_AA70BC.bin` | `data/data_AA6BFA.s:50` |
| 1268 | 0xAA70DC | 14 | Unknown | `gUnknown_08AA70DC` | `dump/data_AA6BFA_AA70DC.bin` | `data/data_AA6BFA.s:54` |
| 1269 | 0xAA70EA | 44 | Unknown | `gUnknown_08AA70EA` | `dump/data_AA6BFA_AA70EA.bin` | `data/data_AA6BFA.s:58` |
| 1270 | 0xAA7116 | 20 | Unknown | `gUnknown_08AA7116` | `dump/data_AA6BFA_AA7116.bin` | `data/data_AA6BFA.s:62` |
| 1271 | 0xAA712A | 50 | Unknown | `gUnknown_08AA712A` | `dump/data_AA6BFA_AA712A.bin` | `data/data_AA6BFA.s:66` |
| 1272 | 0xAA715C | 56 | Unknown | `gUnknown_08AA715C` | `dump/data_AA6BFA_AA715C.bin` | `data/data_AA6BFA.s:70` |
| 1273 | 0xAA7194 | 52 | Unknown | `gUnknown_08AA7194` | `dump/data_AA6BFA_AA7194.bin` | `data/data_AA6BFA.s:74` |
| 1274 | 0xB12DB4 | 18328 | Graphics (4bpp) | `Img_CommGameBgScreen` | `dump/data_B12A60_B12DB4.bin` | `data/data_B12A60.s:5` |
| 1275 | 0xB1754C | 32 | Palette | `Pal_CommGameBgScreenInShop` | `dump/data_B12A60_B1754C.bin` | `data/data_B12A60.s:9` |
| 1276 | 0xB1756C | 352 | Palette | `Pal_08B1756C` | `dump/data_B12A60_B1756C.bin` | `data/data_B12A60.s:13` |
| 1277 | 0xB176CC | 244 | Tilemap | `Tsa_08B176CC` | `dump/data_B12A60_B176CC.bin` | `data/data_B12A60.s:17` |
| 1278 | 0xB177C0 | 164 | Graphics (4bpp) | `Img_08B177C0` | `dump/data_B12A60_B177C0.bin` | `data/data_B12A60.s:21` |
| 1279 | 0xB17864 | 736 | Graphics (4bpp) | `Img_08B17864` | `dump/data_B12A60_B17864.bin` | `data/data_B12A60.s:25` |
| 1280 | 0xB17B44 | 32 | Palette | `Pal_08B17B44` | `dump/data_B12A60_B17B44.bin` | `data/data_B12A60.s:29` |
| 1281 | 0xB17B64 | 4612 | Graphics (4bpp) | `Img_ChapterIntro_LensFlare` | `dump/data_B12A60_B17B64.bin` | `data/data_B12A60.s:33` |
| 1282 | 0xB18D68 | 364 | Tilemap | `Tsa_08B18D68` | `dump/data_B12A60_B18D68.bin` | `data/data_B12A60.s:37` |
| 1283 | 0xB18ED4 | 96 | Palette | `Pal_ChapterIntro_LensFlare` | `dump/data_B12A60_B18ED4.bin` | `data/data_B12A60.s:41` |
| 1284 | 0xB18F34 | 1956 | Graphics (4bpp) | `Img_ChapterIntro_Fog` | `dump/data_B12A60_B18F34.bin` | `data/data_B12A60.s:45` |
| 1285 | 0xB196D8 | 380 | Tilemap | `Tsa_ChapterIntro_Fog` | `dump/data_B12A60_B196D8.bin` | `data/data_B12A60.s:49` |
| 1286 | 0xB19854 | 32 | Palette | `Pal_ChapterIntro_Fog` | `dump/data_B12A60_B19854.bin` | `data/data_B12A60.s:53` |
| 1287 | 0xB19874 | 1400 | Graphics (4bpp) | `Img_ChapterIntro_Sprites` | `dump/data_B12A60_B19874.bin` | `data/data_B12A60.s:57` |
| 1288 | 0xB19DEC | 32 | Palette | `Pal_ChapterIntro_Sprites` | `dump/data_B12A60_B19DEC.bin` | `data/data_B12A60.s:61` |
| 1289 | 0xB1A368 | 21452 | Unknown | `(none)` | `dump/data_fe6sio_B1A368.bin` | `data/data_fe6sio.s:91` |
| 1290 | 0xB1FE7C | 42888 | Unknown | `gUnknown_08B1FE7C` | `dump/data_B1FE7C_B1FE7C.bin` | `data/data_B1FE7C.s:5` |
| 1291 | 0xFE0000 | 16384 | Unknown | `gUnknown_08FE0000` | `dump/data_FE0000_FE0000.bin` | `data/data_FE0000.s:5` |
| 1292 | 0xFFF000 | 3840 | Unknown | `gUnknown_08FFF000` | `dump/data_FFF000_FFF000.bin` | `data/data_FFF000.s:5` |
