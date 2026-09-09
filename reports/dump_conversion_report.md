# FE8U Dump Resources Conversion Report

This document tracks `.incbin "dump/..."` statements that need to be restored to their original source formats (`.png`, `.pal`, `.4bpp`, etc.) and integrated into the build system.

## Overview
| Type | Count | Requires Conversion |
|---|---|---|
| AP Data | 49 | 0 |
| Graphics | 263 | 234 |
| OAM/Obj | 3 | 0 |
| Palette | 182 | 182 |
| Tilemap | 211 | 183 |
| Unknown | 584 | 582 |

## Issues / Requires Conversion
These items appear to be raw bin files or have mismatched extensions.

| Source | Label | Dump File | Inferred Type | Issue |
|---|---|---|---|---|
| `data_A21658.s` | `Img_SaveMenuBG` | `data_A21658_A21658.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Pal_SaveMenuBG` | `data_A21658_A25DCC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `Tsa_SaveMenuBG` | `data_A21658_A25ECC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A21658.s` | `Img_MainMenuBgFog` | `data_A21658_A26380.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Pal_MainMenuBgFog` | `data_A21658_A268D8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `Tsa_MainMenuBgFog` | `data_A21658_A268F8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A21658.s` | `Img_SaveScreenSprits` | `data_A21658_A26A74.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Pal_SaveScreenSprits` | `data_A21658_A27F68.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `Pal_08A28088` | `data_A21658_A28088.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `gUnknown_08A280A8` | `data_A21658_A280A8.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `Img_GameMainMenuObjs` | `data_A21658_A2812C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Img_DifficultyMenuObjs` | `data_A21658_A28A0C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Pal_DifficultyMenuObjs` | `data_A21658_A29418.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `gUnknown_08A29498` | `data_A21658_A29498.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `gUnknown_08A29558` | `data_A21658_A29558.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `Pal_08A295B4` | `data_A21658_A295B4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `Tsa_CommGameBgScreenInShop` | `data_A21658_A295D4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A21658.s` | `gUnknown_08A29A88` | `data_A21658_A29A88.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `gUnknown_08A2B1E4` | `data_A21658_A2B1E4.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `gUnknown_08A2C11C` | `data_A21658_A2C11C.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `gUnknown_08A2C23C` | `data_A21658_A2C23C.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `gUnknown_08A2C4C8` | `data_A21658_A2C4C8.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `gUnknown_08A2C5A8` | `data_A21658_A2C5A8.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `gUnknown_08A2C7A4` | `data_A21658_A2C7A4.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `Img_SoundRoomVolumeGraph` | `data_A21658_A2C838.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Pal_SoundRoomVolumeGraph` | `data_A21658_A2C8A8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `gUnknown_08A2C908` | `data_A21658_A2C908.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `gUnknown_08A2C92C` | `data_A21658_A2C92C.bin` | Unknown | Raw bin. Check context. |
| `data_A21658.s` | `Img_SoundRoomUiElements` | `data_A21658_A2CABC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Pal_SoundRoomUiElements` | `data_A21658_A2D2CC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `Img_PlayStatusSprites` | `data_A21658_A2D32C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Pal_PlayStatusSprites` | `data_A21658_A2E1B8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `Img_ChapterStatusSelectorSprite` | `data_A21658_A2E1F8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Img_StatusScreenLabelSprites` | `data_A21658_A2E214.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Pal_StatusScreenLabelSprites` | `data_A21658_A2E4A4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `Tsa_ChapterStatusUi` | `data_A21658_A2E4C4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A21658.s` | `Img_08A2E5EC` | `data_A21658_A2E5EC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A21658.s` | `Pal_08A2E8F0` | `data_A21658_A2E8F0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A21658.s` | `Img_SysBlackBox` | `data_A21658_A2E950.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `gGfx_MiscUiGraphics` | `data_59E8E0_59E8E0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `gPal_MiscUiGraphics` | `data_59E8E0_59ED70.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `gImg_UiCursorHandTop` | `data_59E8E0_59EDB0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `gImg_UiCursorHandBottom` | `data_59E8E0_59EDEC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `gPal_LightRune` | `data_59E8E0_59EEC0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `gPal_MapSpriteSepia` | `data_59E8E0_59EEE0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Pal_Text` | `data_59E8E0_59EF00.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `gUnknown_0859EF20` | `data_59E8E0_59EF20.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `Pal_HelpBox` | `data_59E8E0_59EF40.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `gPal_HelpTextBox` | `data_59E8E0_59EF60.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `gPal_YellowTextBox` | `data_59E8E0_59EF80.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Pal_GreenTextColors` | `data_59E8E0_59EFC0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Pal_Text_Inverted` | `data_59E8E0_59EFE0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Pal_TalkBubble_Inverted` | `data_59E8E0_59F000.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Img_PhaseChangeUnk` | `data_59E8E0_59F020.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Img_PhaseChangePlayer` | `data_59E8E0_59F3F8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_PhaseChangePlayer` | `data_59E8E0_59FA2C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Img_PhaseChangeEnemy` | `data_59E8E0_59FA4C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_PhaseChangeEnemy` | `data_59E8E0_5A0068.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Img_PhaseChangeOther` | `data_59E8E0_5A0088.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_PhaseChangeOther` | `data_59E8E0_5A0698.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Pal_085A06B8` | `data_59E8E0_5A06B8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Img_PhaseChangeSquares` | `data_59E8E0_5A06D8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `gUnknown_085A0838` | `data_59E8E0_5A0838.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gUnknown_085A08F0` | `data_59E8E0_5A08F0.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gTSA_BattleForecastStandard` | `data_59E8E0_5A09A8.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gTSA_BattleForecastExtended` | `data_59E8E0_5A0AEC.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gBattleForecast_x2x4Gfx` | `data_59E8E0_5A0C80.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `gBattleForecast_x2x4Pal` | `data_59E8E0_5A0D2C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `gUnknown_085A0D4C` | `data_59E8E0_5A0D4C.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gUnknown_085A0EA0` | `data_59E8E0_5A0EA0.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `Img_GasTrapVertical` | `data_59E8E0_5A1510.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Img_GasTrapHorizontal` | `data_59E8E0_5A1AF8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_GasTrap` | `data_59E8E0_5A206C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Pal_ArrowTrap` | `data_59E8E0_5A208C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Img_ArrowTrap` | `data_59E8E0_5A20AC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Img_FireTrap` | `data_59E8E0_5A2940.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_FireTrap` | `data_59E8E0_5A2DDC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Pal_FireTrap2` | `data_59E8E0_5A3490.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Img_PikeTrap` | `data_59E8E0_5A34B0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_PikeTrap` | `data_59E8E0_5A3944.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `gUnknown_085A3964` | `data_59E8E0_5A3964.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gUnknown_085A39EC` | `data_59E8E0_5A39EC.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gUnknown_085A3A84` | `data_59E8E0_5A3A84.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gUnknown_085A3AC0` | `data_59E8E0_5A3AC0.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gUnknown_085A3B00` | `data_59E8E0_5A3B00.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gUnknown_085A401C` | `data_59E8E0_5A401C.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `Img_LightRune` | `data_59E8E0_5A403C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_LightRune` | `data_59E8E0_5A5760.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Tsa_LightRune` | `data_59E8E0_5A5780.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_59E8E0.s` | `Img_EventWarp` | `data_59E8E0_5A5A60.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_EventWarp` | `data_59E8E0_5A61A8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Tsa_EventWarp` | `data_59E8E0_5A61C8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_59E8E0.s` | `gUnknown_085A638C` | `data_59E8E0_5A638C.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `gUnknown_085A643C` | `data_59E8E0_5A643C.bin` | Unknown | Raw bin. Check context. |
| `data_59E8E0.s` | `Tsa_PlayerRankFog` | `data_59E8E0_5A647C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_59E8E0.s` | `Img_DanceringFx` | `data_59E8E0_5A6C80.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Tsa_DanceringFx` | `data_59E8E0_5A7A64.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_DanceringFx` | `data_59E8E0_5A7CA0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Img_MineFx` | `data_59E8E0_5A7CC0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_59E8E0.s` | `Pal_MineFx` | `data_59E8E0_5A7EC8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_59E8E0.s` | `Pal_EventCursorShinning` | `data_59E8E0_5A7EE8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gUiFrameImage` | `data_5B65C0_5B65C0.bin` | Unknown | Raw bin. Check context. |
| `data_5B65C0.s` | `gUiFramePaletteA` | `data_5B65C0_5B6BB4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gUiFramePaletteB` | `data_5B65C0_5B6BD4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gUiFramePaletteC` | `data_5B65C0_5B6BF4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gUiFramePaletteD` | `data_5B65C0_5B6C14.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gLegacyUiFrameAImage` | `data_5B65C0_5B6CB4.bin` | Unknown | Raw bin. Check context. |
| `data_5B65C0.s` | `gLegacyUiFrameAPalette` | `data_5B65C0_5B7560.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gUiBarPaletteA` | `data_5B65C0_5B7580.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gLegacyUiFrameBImage` | `data_5B65C0_5B75A0.bin` | Unknown | Raw bin. Check context. |
| `data_5B65C0.s` | `gLegacyUiFrameBPalette` | `data_5B65C0_5B7E54.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gUiBarPaletteB` | `data_5B65C0_5B7E74.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gLegacyUiFrameCImage` | `data_5B65C0_5B7E94.bin` | Unknown | Raw bin. Check context. |
| `data_5B65C0.s` | `gLegacyUiFrameCPalette` | `data_5B65C0_5B8714.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gUiBarPaletteC` | `data_5B65C0_5B8734.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gLegacyUiFrameDImage` | `data_5B65C0_5B8754.bin` | Unknown | Raw bin. Check context. |
| `data_5B65C0.s` | `gLegacyUiFrameDPalette` | `data_5B65C0_5B8F90.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gUiBarPaletteD` | `data_5B65C0_5B8FB0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5B65C0.s` | `gUnkUiFrameImage` | `data_5B65C0_5B8FF0.bin` | Unknown | Raw bin. Check context. |
| `data_5B65C0.s` | `gUnkUiFramePalettes` | `data_5B65C0_5B9244.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Img_EfxDracoZombie` | `banim-ekrdragonfx_78D648.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Tsa_EfxDracoZombieBaseLeft` | `banim-ekrdragonfx_790F88.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_EfxDracoZombieBaseRight` | `banim-ekrdragonfx_79115C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_EfxDracoZombie2` | `banim-ekrdragonfx_79133C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_EfxDracoZombie3` | `banim-ekrdragonfx_791520.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_EfxDracoZombie4` | `banim-ekrdragonfx_791738.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_EfxDracoZombie5` | `banim-ekrdragonfx_791948.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_EfxDracoZombie1` | `banim-ekrdragonfx_791B3C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Pal_EfxDracoZombie` | `banim-ekrdragonfx_791D5C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_08791D7C` | `banim-ekrdragonfx_791D7C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Img_08791D9C` | `banim-ekrdragonfx_791D9C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Pal_08792194` | `banim-ekrdragonfx_792194.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Img_87929B8` | `banim-ekrdragonfx_7929B8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Pal_87932CC` | `banim-ekrdragonfx_7932CC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Tsa_87932EC` | `banim-ekrdragonfx_7932EC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_8793384` | `banim-ekrdragonfx_793384.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_8793494` | `banim-ekrdragonfx_793494.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87935B0` | `banim-ekrdragonfx_7935B0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87936C0` | `banim-ekrdragonfx_7936C0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87937D0` | `banim-ekrdragonfx_7937D0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87938EC` | `banim-ekrdragonfx_7938EC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Img_87939FC` | `banim-ekrdragonfx_7939FC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_8794628` | `banim-ekrdragonfx_794628.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87951D8` | `banim-ekrdragonfx_7951D8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_8795DF4` | `banim-ekrdragonfx_795DF4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87969F4` | `banim-ekrdragonfx_7969F4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87970DC` | `banim-ekrdragonfx_7970DC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_8797AC4` | `banim-ekrdragonfx_797AC4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_8798394` | `banim-ekrdragonfx_798394.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_8798B6C` | `banim-ekrdragonfx_798B6C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_8799228` | `banim-ekrdragonfx_799228.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Pal_87997F8` | `banim-ekrdragonfx_7997F8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Tsa_8799818` | `banim-ekrdragonfx_799818.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_8799ABC` | `banim-ekrdragonfx_799ABC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_8799D64` | `banim-ekrdragonfx_799D64.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_879A008` | `banim-ekrdragonfx_79A008.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_879A2A8` | `banim-ekrdragonfx_79A2A8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_879A444` | `banim-ekrdragonfx_79A444.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_879A6A0` | `banim-ekrdragonfx_79A6A0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_879A87C` | `banim-ekrdragonfx_79A87C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_879A9E8` | `banim-ekrdragonfx_79A9E8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_879AB10` | `banim-ekrdragonfx_79AB10.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Img_879AC08` | `banim-ekrdragonfx_79AC08.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879B168` | `banim-ekrdragonfx_79B168.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879B8F4` | `banim-ekrdragonfx_79B8F4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879C1E4` | `banim-ekrdragonfx_79C1E4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879CAB4` | `banim-ekrdragonfx_79CAB4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879D1F8` | `banim-ekrdragonfx_79D1F8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879DC10` | `banim-ekrdragonfx_79DC10.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879E5DC` | `banim-ekrdragonfx_79E5DC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879EED0` | `banim-ekrdragonfx_79EED0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879F698` | `banim-ekrdragonfx_79F698.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_879FD3C` | `banim-ekrdragonfx_79FD3C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87A0338` | `banim-ekrdragonfx_7A0338.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87A090C` | `banim-ekrdragonfx_7A090C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87A0E78` | `banim-ekrdragonfx_7A0E78.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87A13C0` | `banim-ekrdragonfx_7A13C0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Pal_87A18D0` | `banim-ekrdragonfx_7A18D0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Tsa_87A18F0` | `banim-ekrdragonfx_7A18F0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A19EC` | `banim-ekrdragonfx_7A19EC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A1B68` | `banim-ekrdragonfx_7A1B68.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A1D74` | `banim-ekrdragonfx_7A1D74.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A1F9C` | `banim-ekrdragonfx_7A1F9C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A2134` | `banim-ekrdragonfx_7A2134.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A2384` | `banim-ekrdragonfx_7A2384.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A2584` | `banim-ekrdragonfx_7A2584.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A2748` | `banim-ekrdragonfx_7A2748.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A28A8` | `banim-ekrdragonfx_7A28A8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A29DC` | `banim-ekrdragonfx_7A29DC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A2AE8` | `banim-ekrdragonfx_7A2AE8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A2BE4` | `banim-ekrdragonfx_7A2BE4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A2CCC` | `banim-ekrdragonfx_7A2CCC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A2DB8` | `banim-ekrdragonfx_7A2DB8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Img_87A2EA0` | `banim-ekrdragonfx_7A2EA0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87A3400` | `banim-ekrdragonfx_7A3400.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87A39A0` | `banim-ekrdragonfx_7A39A0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87A3F38` | `banim-ekrdragonfx_7A3F38.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_87A44D8` | `banim-ekrdragonfx_7A44D8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Pal_87A4A68` | `banim-ekrdragonfx_7A4A68.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Tsa_87A4A88` | `banim-ekrdragonfx_7A4A88.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A4B68` | `banim-ekrdragonfx_7A4B68.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A4C44` | `banim-ekrdragonfx_7A4C44.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A4D2C` | `banim-ekrdragonfx_7A4D2C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Tsa_87A4E0C` | `banim-ekrdragonfx_7A4E0C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-ekrdragonfx.s` | `Img_DemonLightSprites_EyeFlash` | `banim-ekrdragonfx_7A4EEC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Pal_DemonLightSprites_EyeFlash` | `banim-ekrdragonfx_7A5118.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `gUnknown_087A5240` | `banim-ekrdragonfx_7A5240.bin` | Unknown | Raw bin. Check context. |
| `banim-ekrdragonfx.s` | `gUnknown_087A536C` | `banim-ekrdragonfx_7A536C.bin` | Unknown | Raw bin. Check context. |
| `banim-ekrdragonfx.s` | `Img_DemonLightSprites` | `banim-ekrdragonfx_7A5390.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Pal_DemonLightSprites` | `banim-ekrdragonfx_7A574C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Img_DemonLightSprites_087A5BA4` | `banim-ekrdragonfx_7A5BA4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Img_DemonLightSprites_087A5E9C` | `banim-ekrdragonfx_7A5E9C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-ekrdragonfx.s` | `Pal_DemonLightSprites_087A61EC` | `banim-ekrdragonfx_7A61EC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087C9290` | `banim-ekrdragonfx_7C9290.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087C92B0` | `banim-ekrdragonfx_7C92B0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087C92D0` | `banim-ekrdragonfx_7C92D0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087C92F0` | `banim-ekrdragonfx_7C92F0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087C9310` | `banim-ekrdragonfx_7C9310.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087C9330` | `banim-ekrdragonfx_7C9330.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087C9350` | `banim-ekrdragonfx_7C9350.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087C9370` | `banim-ekrdragonfx_7C9370.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087CC55C` | `banim-ekrdragonfx_7CC55C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087CC57C` | `banim-ekrdragonfx_7CC57C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087CC59C` | `banim-ekrdragonfx_7CC59C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087CC5BC` | `banim-ekrdragonfx_7CC5BC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087CC5DC` | `banim-ekrdragonfx_7CC5DC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087EE3A0` | `banim-ekrdragonfx_7EE3A0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087EE3C0` | `banim-ekrdragonfx_7EE3C0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087EE3E0` | `banim-ekrdragonfx_7EE3E0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087EE400` | `banim-ekrdragonfx_7EE400.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087EE420` | `banim-ekrdragonfx_7EE420.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087EE440` | `banim-ekrdragonfx_7EE440.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087EE460` | `banim-ekrdragonfx_7EE460.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087EE480` | `banim-ekrdragonfx_7EE480.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087F1600` | `banim-ekrdragonfx_7F1600.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087F1620` | `banim-ekrdragonfx_7F1620.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087F1640` | `banim-ekrdragonfx_7F1640.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087F1660` | `banim-ekrdragonfx_7F1660.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087F1680` | `banim-ekrdragonfx_7F1680.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087F3C14` | `banim-ekrdragonfx_7F3C14.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087F3C34` | `banim-ekrdragonfx_7F3C34.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Pal_087F3C54` | `banim-ekrdragonfx_7F3C54.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-ekrdragonfx.s` | `Tsa_087F3E88` | `banim-ekrdragonfx_7F3E88.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_banimekrdk.s` | `` | `const_data_banimekrdk_0DFA2C.bin` | Unknown | Raw bin. Check context. |
| `const_data_banimekrdk.s` | `Pal_080E1164` | `const_data_banimekrdk_0E1164.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_FFF000.s` | `gUnknown_08FFF000` | `data_FFF000_FFF000.bin` | Unknown | Raw bin. Check context. |
| `const_data_DB034.s` | `Img_080DB034` | `const_data_DB034_0DB034.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `const_data_DB034.s` | `Img_080DB538` | `const_data_DB034_0DB538.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `const_data_DB034.s` | `Img_080DB9C4` | `const_data_DB034_0DB9C4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `const_data_DB034.s` | `Img_080DBE1C` | `const_data_DB034_0DBE1C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `const_data_DB034.s` | `Img_080DC350` | `const_data_DB034_0DC350.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `const_data_DB034.s` | `Pal_080DC85C` | `const_data_DB034_0DC85C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `trig_rodata.s` | `gSinLookup` | `trig_rodata_0D751C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `` | `data_A3E4D4_A3F21C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `Pal_CharacterEndingMenu` | `data_A3E4D4_A3F710.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `Img_CharacterEndingMenu` | `data_A3E4D4_A3F750.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Tsa_CharacterEnding_TopBorder` | `data_A3E4D4_A3FFEC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_CharacterEnding_BottomBorder` | `data_A3E4D4_A40068.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `gTsa_SoloEndingNameplate` | `data_A3E4D4_A400E4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `gTsa_SoloEndingWindow` | `data_A3E4D4_A40204.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `gTsa_PairedEndingNameplates` | `data_A3E4D4_A4034C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `gTsa_PairedEndingWindow` | `data_A3E4D4_A40470.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Pal_FinScreen` | `data_A3E4D4_A405B4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `Img_FinScreen` | `data_A3E4D4_A405D4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Tsa_FinScreen` | `data_A3E4D4_A409D0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Pal_08A40AD4` | `data_A3E4D4_A40AD4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `Tsa_08A40B14` | `data_A3E4D4_A40B14.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Pal_StaffReelEnt_08A40FC8` | `data_A3E4D4_A40FC8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A40FE8` | `data_A3E4D4_A40FE8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A41B30` | `data_A3E4D4_A41B30.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A42748` | `data_A3E4D4_A42748.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A432C0` | `data_A3E4D4_A432C0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A43CBC` | `data_A3E4D4_A43CBC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A45150` | `data_A3E4D4_A45150.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A4561C` | `data_A3E4D4_A4561C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A45F58` | `data_A3E4D4_A45F58.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A46988` | `data_A3E4D4_A46988.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A472B0` | `data_A3E4D4_A472B0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A48744` | `data_A3E4D4_A48744.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A497A8` | `data_A3E4D4_A497A8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_StaffReelEnt_08A4A9D4` | `data_A3E4D4_A4A9D4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4AE08` | `data_A3E4D4_A4AE08.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4B090` | `data_A3E4D4_A4B090.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4B2F4` | `data_A3E4D4_A4B2F4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4B558` | `data_A3E4D4_A4B558.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4B788` | `data_A3E4D4_A4B788.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4BB50` | `data_A3E4D4_A4BB50.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4BCC4` | `data_A3E4D4_A4BCC4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4BEC0` | `data_A3E4D4_A4BEC0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4C0E4` | `data_A3E4D4_A4C0E4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4C308` | `data_A3E4D4_A4C308.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4C6EC` | `data_A3E4D4_A4C6EC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4C9F0` | `data_A3E4D4_A4C9F0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Tsa_StaffReelEnt_08A4CD40` | `data_A3E4D4_A4CD40.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `gGfx_BrownTextBox` | `data_A3E4D4_A4CF2C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `gPal_BrownTextBox` | `data_A3E4D4_A4D0CC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `gUnknown_08A83364` | `data_A3E4D4_A83364.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A95F64` | `data_A3E4D4_A95F64.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A95FE4` | `data_A3E4D4_A95FE4.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A96064` | `data_A3E4D4_A96064.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `Img_GmapNodes` | `data_A3E4D4_A96308.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_GmapCastleNodes` | `data_A3E4D4_A97410.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `gUnknown_08A97A40` | `data_A3E4D4_A97A40.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gPal_GMapPI_ShopIcons` | `data_A3E4D4_A97A60.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `gGfx_GMapPI_ShopIcons` | `data_A3E4D4_A97A80.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `gPal_08A97ACC` | `data_A3E4D4_A97ACC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `Sprite_08A97AEC` | `data_A3E4D4_A97AEC.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gImg_WorldmapNodeRevealEffect` | `data_A3E4D4_A97C98.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `gPal_WorldmapNodeRevealEffect` | `data_A3E4D4_A97E28.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `gUnknown_08A97E48` | `data_A3E4D4_A97E48.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `Img_GmapPath` | `data_A3E4D4_A97ED8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `gUnknown_08A97FA4` | `data_A3E4D4_A97FA4.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A97FC4` | `data_A3E4D4_A97FC4.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A97FF8` | `data_A3E4D4_A97FF8.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98030` | `data_A3E4D4_A98030.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98054` | `data_A3E4D4_A98054.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A9806C` | `data_A3E4D4_A9806C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98090` | `data_A3E4D4_A98090.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A980B4` | `data_A3E4D4_A980B4.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A980DC` | `data_A3E4D4_A980DC.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98104` | `data_A3E4D4_A98104.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98144` | `data_A3E4D4_A98144.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98168` | `data_A3E4D4_A98168.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A9819C` | `data_A3E4D4_A9819C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A981BC` | `data_A3E4D4_A981BC.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A981F4` | `data_A3E4D4_A981F4.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98228` | `data_A3E4D4_A98228.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A9827C` | `data_A3E4D4_A9827C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A982D4` | `data_A3E4D4_A982D4.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98314` | `data_A3E4D4_A98314.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98344` | `data_A3E4D4_A98344.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A9836C` | `data_A3E4D4_A9836C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A983BC` | `data_A3E4D4_A983BC.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A983F0` | `data_A3E4D4_A983F0.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98448` | `data_A3E4D4_A98448.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A9847C` | `data_A3E4D4_A9847C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A984D4` | `data_A3E4D4_A984D4.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A9850C` | `data_A3E4D4_A9850C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98540` | `data_A3E4D4_A98540.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98568` | `data_A3E4D4_A98568.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A985A4` | `data_A3E4D4_A985A4.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A985FC` | `data_A3E4D4_A985FC.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A9863C` | `data_A3E4D4_A9863C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98694` | `data_A3E4D4_A98694.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A986C0` | `data_A3E4D4_A986C0.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98BF8` | `data_A3E4D4_A98BF8.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98CFC` | `data_A3E4D4_A98CFC.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98D58` | `data_A3E4D4_A98D58.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98D88` | `data_A3E4D4_A98D88.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98DA0` | `data_A3E4D4_A98DA0.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98DB8` | `data_A3E4D4_A98DB8.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98DCC` | `data_A3E4D4_A98DCC.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98E2C` | `data_A3E4D4_A98E2C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98E4C` | `data_A3E4D4_A98E4C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98E6C` | `data_A3E4D4_A98E6C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98E8C` | `data_A3E4D4_A98E8C.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98EAC` | `data_A3E4D4_A98EAC.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08A98F30` | `data_A3E4D4_A98F30.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gGfx_GMapPI_LevelNums` | `data_A3E4D4_A9901C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `gPal_GMapPI_LevelNums` | `data_A3E4D4_A99120.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `Img_EventGmap` | `data_A3E4D4_A99140.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Tsa_EventGmap` | `data_A3E4D4_A9DF74.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Pal_EventGmap` | `data_A3E4D4_A9E4C4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `gImg_08A9E544` | `data_A3E4D4_A9E544.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `gPal_08A9E5BC` | `data_A3E4D4_A9E5BC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `gTsa_08A9E5DC` | `data_A3E4D4_A9E5DC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A3E4D4.s` | `Pal_WmHighLightNationMap` | `data_A3E4D4_A9E688.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `Img_WmHightLightMap2` | `data_A3E4D4_A9EC94.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_WmHightLightMap3` | `data_A3E4D4_A9F494.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_WmHightLightMap4` | `data_A3E4D4_A9FA2C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_WmHightLightMap5` | `data_A3E4D4_A9FF00.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_WmHightLightMap6` | `data_A3E4D4_AA0240.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_WmHightLightMap7` | `data_A3E4D4_AA07B0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_WmHightLightMap8` | `data_A3E4D4_AA0BC8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Img_WorldMapPlaceDot` | `data_A3E4D4_AA114C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Pal_WmPlaceDot_Highlight` | `data_A3E4D4_AA1190.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `Pal_WmPlaceDot_Standard` | `data_A3E4D4_AA11B0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `gUnknown_08AA11D0` | `data_A3E4D4_AA11D0.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `Img_WorldmapMinimap` | `data_A3E4D4_AA1280.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A3E4D4.s` | `Pal_WorldmapMinimap` | `data_A3E4D4_AA188C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A3E4D4.s` | `gUnknown_08AA18AC` | `data_A3E4D4_AA18AC.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08AA1930` | `data_A3E4D4_AA1930.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gUnknown_08AA1950` | `data_A3E4D4_AA1950.bin` | Unknown | Raw bin. Check context. |
| `data_A3E4D4.s` | `gImg_WorldmapSkirmish` | `data_A3E4D4_AA1970.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrgauge.s` | `gUnknown_085B93D0` | `data-ekrgauge_5B93D0.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B940C` | `data-ekrgauge_5B940C.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B9424` | `data-ekrgauge_5B9424.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B949C` | `data-ekrgauge_5B949C.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B94F0` | `data-ekrgauge_5B94F0.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B9544` | `data-ekrgauge_5B9544.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B955C` | `data-ekrgauge_5B955C.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B9574` | `data-ekrgauge_5B9574.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B958C` | `data-ekrgauge_5B958C.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B95A4` | `data-ekrgauge_5B95A4.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B95BC` | `data-ekrgauge_5B95BC.bin` | Unknown | Raw bin. Check context. |
| `data-ekrgauge.s` | `gUnknown_085B95D4` | `data-ekrgauge_5B95D4.bin` | Unknown | Raw bin. Check context. |
| `data_FE0000.s` | `gUnknown_08FE0000` | `data_FE0000_FE0000.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A01EE4` | `data_A01CC4_A01EE4.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A01F04` | `data_A01CC4_A01F04.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A01F24` | `data_A01CC4_A01F24.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A027FC` | `data_A01CC4_A027FC.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gGfx_HelpTextBox` | `data_A01CC4_A0285C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gGfx_HelpTextBox2` | `data_A01CC4_A02884.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gGfx_HelpTextBox3` | `data_A01CC4_A028AC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gGfx_HelpTextBox4` | `data_A01CC4_A02914.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gGfx_HelpTextBox5` | `data_A01CC4_A02980.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gGfx_YellowTextBox` | `data_A01CC4_A029A8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gGfx_YellowTextBox2` | `data_A01CC4_A02A1C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gGfx_YellowTextBox3` | `data_A01CC4_A02A94.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gGfx_YellowTextBox4` | `data_A01CC4_A02B3C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gGfx_YellowTextBox5` | `data_A01CC4_A02BAC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `Img_LimitViewSquares` | `data_A01CC4_A02C34.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gUnknown_08A02EB4` | `data_A01CC4_A02EB4.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A02F34` | `data_A01CC4_A02F34.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A02F94` | `data_A01CC4_A02F94.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A02FF4` | `data_A01CC4_A02FF4.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A03054` | `data_A01CC4_A03054.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A0328C` | `data_A01CC4_A0328C.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A032AC` | `data_A01CC4_A032AC.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A03334` | `data_A01CC4_A03334.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A03354` | `data_A01CC4_A03354.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `Img_ConfigUiSprites` | `data_A01CC4_A0733C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `Img_ConfigUiIcons` | `data_A01CC4_A0754C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `Tsa_ConfigUiFrame` | `data_A01CC4_A079B4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A01CC4.s` | `Pal_ConfigUiSprites` | `data_A01CC4_A07A98.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A01CC4.s` | `gPal_08A07AD8` | `data_A01CC4_A07AD8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A01CC4.s` | `gUnknown_08A07AEA` | `data_A01CC4_A07AEA.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A07B0A` | `data_A01CC4_A07B0A.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A07BEA` | `data_A01CC4_A07BEA.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gUnknown_08A07C0A` | `data_A01CC4_A07C0A.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gPal_08A07C58` | `data_A01CC4_A07C58.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A01CC4.s` | `Img_ChapterIntroFog` | `data_A01CC4_A07DD8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `Pal_PlayerRankFog` | `data_A01CC4_A09A5C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A01CC4.s` | `gGfx_08A09E4C` | `data_A01CC4_A09E4C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `gUnknown_08A0A4E8` | `data_A01CC4_A0A4E8.bin` | Unknown | Raw bin. Check context. |
| `data_A01CC4.s` | `gTsa_08A0A9F8` | `data_A01CC4_A0A9F8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A01CC4.s` | `Img_GameOverText` | `data_A01CC4_A0AB0C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A01CC4.s` | `Pal_GameOverText2` | `data_A01CC4_A0AE44.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A01CC4.s` | `Pal_GameOverText1` | `data_A01CC4_A0AE64.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A01CC4.s` | `Tsa_GameOverFx` | `data_A01CC4_A0AE84.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_AA6BFA.s` | `gUnknown_08AA709C` | `data_AA6BFA_AA709C.bin` | Unknown | Raw bin. Check context. |
| `data_AA6BFA.s` | `gUnknown_08AA70BC` | `data_AA6BFA_AA70BC.bin` | Unknown | Raw bin. Check context. |
| `data_AA6BFA.s` | `gUnknown_08AA70DC` | `data_AA6BFA_AA70DC.bin` | Unknown | Raw bin. Check context. |
| `data_AA6BFA.s` | `gUnknown_08AA70EA` | `data_AA6BFA_AA70EA.bin` | Unknown | Raw bin. Check context. |
| `data_AA6BFA.s` | `gUnknown_08AA7116` | `data_AA6BFA_AA7116.bin` | Unknown | Raw bin. Check context. |
| `data_AA6BFA.s` | `gUnknown_08AA712A` | `data_AA6BFA_AA712A.bin` | Unknown | Raw bin. Check context. |
| `data_AA6BFA.s` | `gUnknown_08AA715C` | `data_AA6BFA_AA715C.bin` | Unknown | Raw bin. Check context. |
| `data_AA6BFA.s` | `gUnknown_08AA7194` | `data_AA6BFA_AA7194.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `Img_08801C14` | `data-banimmisc_801C14.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `Img_EfxLeftNameBox` | `data-banimmisc_801F7C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `Img_EfxLeftItemBox` | `data-banimmisc_801FF4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `Img_EfxRightNameBox` | `data-banimmisc_802044.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `Img_EfxRightItemBox` | `data-banimmisc_8020BC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `gUnknown_0880210C` | `data-banimmisc_80210C.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gUnknown_088021C0` | `data-banimmisc_8021C0.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gUnknown_08802274` | `data-banimmisc_802274.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gUnknown_08802348` | `data-banimmisc_802348.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gUnknown_08802428` | `data-banimmisc_802428.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gUnknown_08802508` | `data-banimmisc_802508.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gUnknown_08802558` | `data-banimmisc_802558.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `Img_EfxSideHitDmgCrit` | `data-banimmisc_8025D8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `Img_EfxWTAArrow1` | `data-banimmisc_802674.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `Img_EfxWTAArrow2` | `data-banimmisc_802698.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `gUnknown_088026E4` | `data-banimmisc_8026E4.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gUnknown_08802884` | `data-banimmisc_802884.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gUnknown_08802904` | `data-banimmisc_802904.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gUnknown_08802B04` | `data-banimmisc_802B04.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gPalEfxHpBarGreen` | `data-banimmisc_802B84.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data-banimmisc.s` | `gUnknown_08802BC4` | `data-banimmisc_802BC4.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `gPalEfxHpBarPurple` | `data-banimmisc_802C84.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data-banimmisc.s` | `Pal_BanimUnitFlashing` | `data-banimmisc_802D24.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data-banimmisc.s` | `Tsa_EkrExpBar` | `data-banimmisc_803524.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data-banimmisc.s` | `Img_LevelUpBoxFrame` | `data-banimmisc_8035B0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `Tsa_LevelUpBoxFrame` | `data-banimmisc_8039E8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data-banimmisc.s` | `Pal_LevelUpBoxFrame` | `data-banimmisc_803B10.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data-banimmisc.s` | `Img_EkrPopup` | `data-banimmisc_803B30.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-banimmisc.s` | `gUnknown_08803BD0` | `data-banimmisc_803BD0.bin` | Unknown | Raw bin. Check context. |
| `data-banimmisc.s` | `Pal_EkrPopup` | `data-banimmisc_803CB0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data-banimmisc.s` | `Tsa_EkrPopup` | `data-banimmisc_803CD0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-efxbattle.s` | `TsaConf_BanimTmA1` | `banim-efxbattle_5B9E58.bin` | Unknown | Raw bin. Check context. |
| `banim-efxbattle.s` | `TsaConf_BanimTmA2` | `banim-efxbattle_5B9EF0.bin` | Unknown | Raw bin. Check context. |
| `banim-efxbattle.s` | `TsaConf_BanimTmA3` | `banim-efxbattle_5B9F88.bin` | Unknown | Raw bin. Check context. |
| `banim-efxbattle.s` | `TsaConf_BanimTmA4` | `banim-efxbattle_5BA020.bin` | Unknown | Raw bin. Check context. |
| `banim-efxbattle.s` | `Img_NODAMGEMIS` | `banim-efxbattle_5BA0B8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxbattle.s` | `Pal_085BA2E0` | `banim-efxbattle_5BA2E0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxbattle.s` | `Pal_085BA300` | `banim-efxbattle_5BA300.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxbattle.s` | `Pal_085BA320` | `banim-efxbattle_5BA320.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A167C8.s` | `gTSA_TerrainBox` | `data_A167C8_A1742C.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gTSA_MinimugBox` | `data_A167C8_A17484.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gUnknown_08A175B4` | `data_A167C8_A175B4.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gUnknown_08A175C8` | `data_A167C8_A175C8.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gUnknown_08A175DC` | `data_A167C8_A175DC.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gUnknown_08A175F0` | `data_A167C8_A175F0.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gUnknown_08A17604` | `data_A167C8_A17604.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gUnknown_08A1763C` | `data_A167C8_A1763C.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gUnknown_08A17650` | `data_A167C8_A17650.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gUnknown_08A17664` | `data_A167C8_A17664.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gUnknown_08A17678` | `data_A167C8_A17678.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `Tsa_TerrainMapUi_Labels` | `data_A167C8_A1768C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A167C8.s` | `gTSA_TerrainBox_Ballistae` | `data_A167C8_A1769C.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `Tsa_TerrainMapUi_ObstacleLabels` | `data_A167C8_A176A4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A167C8.s` | `Tsa_TerrainMapUi_ObstacleFullHp` | `data_A167C8_A176B4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A167C8.s` | `gTSA_GoalBox_TwoLines` | `data_A167C8_A176BC.bin` | Unknown | Raw bin. Check context. |
| `data_A167C8.s` | `gTSA_GoalBox_OneLine` | `data_A167C8_A17744.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Pal_LvupApfx` | `banim-efxlvupfx_5BB2FC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxlvupfx.s` | `Img_ArenaBattleBg` | `banim-efxlvupfx_5BC188.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxlvupfx.s` | `Tsa_ArenaBattleBg` | `banim-efxlvupfx_5BE7F4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-efxlvupfx.s` | `Pal_ArenaBattleBg_A` | `banim-efxlvupfx_5BEF94.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxlvupfx.s` | `Pal_ArenaBattleBg_B` | `banim-efxlvupfx_5BF014.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxlvupfx.s` | `Pal_ArenaBattleBg_C` | `banim-efxlvupfx_5BF094.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxlvupfx.s` | `Pal_ArenaBattleBg_C` | `banim-efxlvupfx_5BF114.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxlvupfx.s` | `Img1_EfxLvupBG` | `banim-efxlvupfx_5BF708.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxlvupfx.s` | `Img2_EfxLvupBG` | `banim-efxlvupfx_5C02E0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxlvupfx.s` | `Img3_EfxLvupBG` | `banim-efxlvupfx_5C1110.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxlvupfx.s` | `Img4_EfxLvupBG` | `banim-efxlvupfx_5C1CD4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxlvupfx.s` | `Img5_EfxLvupBG` | `banim-efxlvupfx_5C2914.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxlvupfx.s` | `Img6_EfxLvupBG` | `banim-efxlvupfx_5C3698.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxlvupfx.s` | `Img7_EfxLvupBG` | `banim-efxlvupfx_5C439C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxlvupfx.s` | `Pal_EfxLvupBG` | `banim-efxlvupfx_5C48AC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxlvupfx.s` | `Tsa1_EfxLvupBG` | `banim-efxlvupfx_5C48CC.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa2_EfxLvupBG` | `banim-efxlvupfx_5C4A2C.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa3_EfxLvupBG` | `banim-efxlvupfx_5C4BA0.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa4_EfxLvupBG` | `banim-efxlvupfx_5C4D34.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa5_EfxLvupBG` | `banim-efxlvupfx_5C4EE8.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa6_EfxLvupBG` | `banim-efxlvupfx_5C50C0.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa7_EfxLvupBG` | `banim-efxlvupfx_5C52B8.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa8_EfxLvupBG` | `banim-efxlvupfx_5C54D4.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa9_EfxLvupBG` | `banim-efxlvupfx_5C56E8.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa10_EfxLvupBG` | `banim-efxlvupfx_5C5818.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa11_EfxLvupBG` | `banim-efxlvupfx_5C58E0.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Img_EfxLvupBG2` | `banim-efxlvupfx_5C5994.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxlvupfx.s` | `Pal_EfxLvupBG2` | `banim-efxlvupfx_5C6054.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxlvupfx.s` | `Pal_EfxLvupBGCOL` | `banim-efxlvupfx_5C60D4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxlvupfx.s` | `Tsa1_EfxLvupBG2` | `banim-efxlvupfx_5C60F4.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa2_EfxLvupBG2` | `banim-efxlvupfx_5C61D8.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa3_EfxLvupBG2` | `banim-efxlvupfx_5C62BC.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa4_EfxLvupBG2` | `banim-efxlvupfx_5C63DC.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa5_EfxLvupBG2` | `banim-efxlvupfx_5C64FC.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Tsa6_EfxLvupBG2` | `banim-efxlvupfx_5C6618.bin` | Unknown | Raw bin. Check context. |
| `banim-efxlvupfx.s` | `Img_EfxLvupOBJ2` | `banim-efxlvupfx_5C6730.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxhitobj.s` | `Img_EfxPierceCriticalEffectBG` | `banim-efxhitobj_5CFB70.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxhitobj.s` | `Pal_EfxPierceCriticalEffectBG` | `banim-efxhitobj_5D0820.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxhitobj.s` | `TsaL_EfxPierceCriticalEffectBG` | `banim-efxhitobj_5D0A20.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `TsaR_EfxPierceCriticalEffectBG` | `banim-efxhitobj_5D0CE0.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `Img_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D0FD0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `banim-efxhitobj.s` | `Pal_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D1470.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `banim-efxhitobj.s` | `Tsa1_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D1490.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `Tsa2_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D155C.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `Tsa3_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D1668.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `Tsa4_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D1790.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `Tsa5_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D18B4.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `Tsa6_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D19DC.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `Tsa7_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D1AFC.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `Tsa8_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D1BFC.bin` | Unknown | Raw bin. Check context. |
| `banim-efxhitobj.s` | `Tsa9_EfxPierceNormalEffectBG` | `banim-efxhitobj_5D1CDC.bin` | Unknown | Raw bin. Check context. |
| `data_B1FE7C.s` | `gUnknown_08B1FE7C` | `data_B1FE7C_B1FE7C.bin` | Unknown | Raw bin. Check context. |
| `const_data_1C0AFC.s` | `gPal_StoneShatterAnim` | `const_data_1C0AFC_1C0AFC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `const_data_1C0AFC.s` | `gImg_StoneShatterAnim` | `const_data_1C0AFC_1C0B1C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1900` | `const_data_1C0AFC_1C1900.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C194C` | `const_data_1C0AFC_1C194C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1998` | `const_data_1C0AFC_1C1998.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C19E4` | `const_data_1C0AFC_1C19E4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1A30` | `const_data_1C0AFC_1C1A30.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1A7C` | `const_data_1C0AFC_1C1A7C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1AC8` | `const_data_1C0AFC_1C1AC8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1B14` | `const_data_1C0AFC_1C1B14.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1B60` | `const_data_1C0AFC_1C1B60.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1BAC` | `const_data_1C0AFC_1C1BAC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1BF8` | `const_data_1C0AFC_1C1BF8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1C44` | `const_data_1C0AFC_1C1C44.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1C90` | `const_data_1C0AFC_1C1C90.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_1C0AFC.s` | `gTsa_StoneShatter_081C1CDC` | `const_data_1C0AFC_1C1CDC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data-ekrdk.s` | `Tsa_087F45D0` | `data-ekrdk_7F45D0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data-ekrdk.s` | `Img_DemonKingBG` | `data-ekrdk_7F4798.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Tsa_DemonKingBG1` | `data-ekrdk_7F798C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data-ekrdk.s` | `Tsa_DemonKingBG2` | `data-ekrdk_7F7DC8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data-ekrdk.s` | `Tsa_DemonKingBG3` | `data-ekrdk_7F81D0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data-ekrdk.s` | `Pal_DemonKingBG` | `data-ekrdk_7F85DC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG1` | `data-ekrdk_7F85FC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG2` | `data-ekrdk_7F88A0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG3` | `data-ekrdk_7F8C88.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG4` | `data-ekrdk_7F914C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG5` | `data-ekrdk_7F96FC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG6` | `data-ekrdk_7F9CF0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG7` | `data-ekrdk_7FA26C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG8` | `data-ekrdk_7FA7D0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG9` | `data-ekrdk_7FACA8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG10` | `data-ekrdk_7FB0E8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG11` | `data-ekrdk_7FB490.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG12` | `data-ekrdk_7FB830.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG13` | `data-ekrdk_7FBB8C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG14` | `data-ekrdk_7FBEE4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG15` | `data-ekrdk_7FC288.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_EfxSelfThunderBG16` | `data-ekrdk_7FC5F0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG1` | `data-ekrdk_7FC940.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG2` | `data-ekrdk_7FCA6C.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG3` | `data-ekrdk_7FCBB8.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG4` | `data-ekrdk_7FCD34.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG5` | `data-ekrdk_7FCEB8.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG6` | `data-ekrdk_7FD050.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG7` | `data-ekrdk_7FD1D4.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG8` | `data-ekrdk_7FD358.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG9` | `data-ekrdk_7FD4CC.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG10` | `data-ekrdk_7FD624.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG11` | `data-ekrdk_7FD768.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG12` | `data-ekrdk_7FD8B0.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG13` | `data-ekrdk_7FD9EC.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG14` | `data-ekrdk_7FDB24.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG15` | `data-ekrdk_7FDC78.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA1_EfxSelfThunderBG16` | `data-ekrdk_7FDDC8.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG1` | `data-ekrdk_7FDF14.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG2` | `data-ekrdk_7FE03C.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG3` | `data-ekrdk_7FE17C.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG4` | `data-ekrdk_7FE2D4.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG5` | `data-ekrdk_7FE434.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG6` | `data-ekrdk_7FE5AC.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG7` | `data-ekrdk_7FE71C.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG8` | `data-ekrdk_7FE898.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG9` | `data-ekrdk_7FEA08.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG10` | `data-ekrdk_7FEB60.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG11` | `data-ekrdk_7FECA0.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG12` | `data-ekrdk_7FEDE8.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG13` | `data-ekrdk_7FEF20.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG14` | `data-ekrdk_7FF058.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG15` | `data-ekrdk_7FF1AC.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `TSA2_EfxSelfThunderBG16` | `data-ekrdk_7FF2F8.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdk.s` | `Pal1_EfxSelfThunderBG` | `data-ekrdk_7FF448.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data-ekrdk.s` | `Pal2_EfxSelfThunderBG` | `data-ekrdk_7FF468.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data-ekrdk.s` | `Img_DemoKingTunkFace` | `data-ekrdk_7FF488.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Img_DemoKingTunkFace2` | `data-ekrdk_80064C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data-ekrdk.s` | `Pal_DemoKingTunkFace` | `data-ekrdk_8017E0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `gUnknown_089A5A6C` | `data_9A31F8_9A5A6C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `Pal_MapAnimManaketeMu` | `data_9A31F8_9A8F74.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `gGfx_ArenaBuildingFront` | `data_9A31F8_9A8F94.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `gTsa_ArenaBuildingFront` | `data_9A31F8_9ABB70.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `gPal_ArenaBuildingFront` | `data_9A31F8_9AC024.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Img_MapAnimMISS` | `data_9A31F8_9AC0A4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_MapAnimNODAMAGE` | `data_9A31F8_9AC2FC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_ManimLevelUpStatGainCycling` | `data_9A31F8_9AC5CC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Pal_ManimLevelUp` | `data_9A31F8_9AC9A8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `gUnknown_089AD498` | `data_9A31F8_9AD498.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `Img_MapBattleInfoBox` | `data_9A31F8_9AD500.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_MapBattleInfoBlue` | `data_9A31F8_9AD648.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Pal_MapBattleInfoRed` | `data_9A31F8_9AD668.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Pal_MapBattleInfoGreen` | `data_9A31F8_9AD688.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Pal_MapBattleInfoPurple` | `data_9A31F8_9AD6A8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Tsa_MapBattleBoxGfx1` | `data_9A31F8_9AD6C8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Tsa_MapBattleBoxGfx2` | `data_9A31F8_9AD714.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Tsa_MapBattleBoxGfx3` | `data_9A31F8_9AD74C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_MapBattleInfoHpBar` | `data_9A31F8_9AD78C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_MapBattleInfoNum` | `data_9A31F8_9AD868.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Tsa_ShopWindows` | `data_9A31F8_9AD934.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Img_ShopGoldBox` | `data_9A31F8_9AD9F8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_WallBreakAnim` | `data_9A31F8_9ADA80.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_WallBreakAnim` | `data_9A31F8_9ADD0C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Img_GmapSoguSprites` | `data_9A31F8_9ADD4C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_PoisonAnim` | `data_9A31F8_9ADEB0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_PoisonAnim` | `data_9A31F8_9AE204.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Img_LinkArenaWarpFx` | `data_9A31F8_9AE224.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_LinkArenaWarpFx` | `data_9A31F8_9AE484.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `gUnknown_089AE4A4` | `data_9A31F8_9AE4A4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `Img_089AE7A4` | `data_9A31F8_9AE7A4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_089AE7C4` | `data_9A31F8_9AE7C4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Img_MapAnimAntitoxinPureWater` | `data_9A31F8_9AE804.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `gUnknown_089AF310` | `data_9A31F8_9AF310.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `Pal_MapAnimPureWater` | `data_9A31F8_9AF910.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Pal_MapAnimAntitoxin` | `data_9A31F8_9AF930.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `gUnknown_089AF950` | `data_9A31F8_9AF950.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089AFAC4` | `data_9A31F8_9AFAC4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089AFCBC` | `data_9A31F8_9AFCBC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `Pal_089AFF78` | `data_9A31F8_9AFF78.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Pal_089AFFB8` | `data_9A31F8_9AFFB8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `gUnknown_089AFFF8` | `data_9A31F8_9AFFF8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `Img_MapAnimTorchfx` | `data_9A31F8_9B03D4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_MapAnimTorchfx` | `data_9A31F8_9B068C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Img_MapAnimUnlockObjfx` | `data_9A31F8_9B06AC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_MapAnimUnlockObjfx` | `data_9A31F8_9B0700.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Img_MapAnimUnlockBgfx` | `data_9A31F8_9B0720.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_MapAnimUnlockObjfx_Unk` | `data_9A31F8_9B0820.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Tsa_MapAnimUnlockBgfx` | `data_9A31F8_9B0840.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Tsa_089B0864` | `data_9A31F8_9B0864.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Img_MapAnimRepairfx` | `data_9A31F8_9B0AD0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Tsa_089B17A4` | `data_9A31F8_9B17A4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Img_MapAnimBerserkfx` | `data_9A31F8_9B1E10.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_MapAnimBerserkfx` | `data_9A31F8_9B20E8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Img_ManimSilenceObjfx` | `data_9A31F8_9B21D8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_ManimSilenceBgfx` | `data_9A31F8_9B2618.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_ManimSilencefx` | `data_9A31F8_9B2728.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Img_ManimBarrierBgfx` | `data_9A31F8_9B2880.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Tsa_089B343C` | `data_9A31F8_9B343C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Img_NightMareMapAnimfx` | `data_9A31F8_9B35D0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_NightMareMapAnimfx` | `data_9A31F8_9B4BFC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx1` | `data_9A31F8_9B4C1C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx2` | `data_9A31F8_9B4C80.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx3` | `data_9A31F8_9B4CE8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx4` | `data_9A31F8_9B4D64.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx5` | `data_9A31F8_9B4DDC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx6` | `data_9A31F8_9B4E4C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx7` | `data_9A31F8_9B4EB8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx8` | `data_9A31F8_9B4F2C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx9` | `data_9A31F8_9B4FA4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx10` | `data_9A31F8_9B501C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx11` | `data_9A31F8_9B5094.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx12` | `data_9A31F8_9B5118.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx13` | `data_9A31F8_9B519C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx14` | `data_9A31F8_9B5220.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx15` | `data_9A31F8_9B52A4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx16` | `data_9A31F8_9B5310.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx17` | `data_9A31F8_9B5398.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx18` | `data_9A31F8_9B5434.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx19` | `data_9A31F8_9B54F0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx20` | `data_9A31F8_9B55EC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx21` | `data_9A31F8_9B5720.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx22` | `data_9A31F8_9B58DC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx23` | `data_9A31F8_9B5B38.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx24` | `data_9A31F8_9B5C6C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx25` | `data_9A31F8_9B5E0C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx26` | `data_9A31F8_9B6050.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx27` | `data_9A31F8_9B6174.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx28` | `data_9A31F8_9B630C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx29` | `data_9A31F8_9B6510.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx30` | `data_9A31F8_9B65D4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx31` | `data_9A31F8_9B66BC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx32` | `data_9A31F8_9B6808.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_NightMareMapAnimfx33` | `data_9A31F8_9B69BC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Img_MonsterStoneMapAnimfx` | `data_9A31F8_9B6AA0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_MonsterStoneMapAnimfx` | `data_9A31F8_9B73D4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Img_GorgonHatchCloud` | `data_9A31F8_9B7610.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_GorgonHatchCloud` | `data_9A31F8_9B80C4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_9A31F8.s` | `Tsa_GorgonHatchCloud_A` | `data_9A31F8_9B80E4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_GorgonHatchCloud_B` | `data_9A31F8_9B8140.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_GorgonHatchCloud_C` | `data_9A31F8_9B81A4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_GorgonHatchCloud_D` | `data_9A31F8_9B8214.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_GorgonHatchCloud_E` | `data_9A31F8_9B828C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_GorgonHatchCloud_F` | `data_9A31F8_9B82F0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_GorgonHatchCloud_G` | `data_9A31F8_9B835C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `gUnknown_089B83C0` | `data_9A31F8_9B83C0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089B89C4` | `data_9A31F8_9B89C4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089B90D8` | `data_9A31F8_9B90D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089B98DC` | `data_9A31F8_9B98DC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BA190` | `data_9A31F8_9BA190.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BA9D8` | `data_9A31F8_9BA9D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BB2C8` | `data_9A31F8_9BB2C8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BBD68` | `data_9A31F8_9BBD68.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BC884` | `data_9A31F8_9BC884.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BD3B4` | `data_9A31F8_9BD3B4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BDEE8` | `data_9A31F8_9BDEE8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BEA90` | `data_9A31F8_9BEA90.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BF5FC` | `data_9A31F8_9BF5FC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089BFF64` | `data_9A31F8_9BFF64.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C08C0` | `data_9A31F8_9C08C0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C1190` | `data_9A31F8_9C1190.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C1BA8` | `data_9A31F8_9C1BA8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C247C` | `data_9A31F8_9C247C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C2BF0` | `data_9A31F8_9C2BF0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C32A4` | `data_9A31F8_9C32A4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C39A8` | `data_9A31F8_9C39A8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C3EE8` | `data_9A31F8_9C3EE8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C447C` | `data_9A31F8_9C447C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C4834` | `data_9A31F8_9C4834.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C48E0` | `data_9A31F8_9C48E0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C495C` | `data_9A31F8_9C495C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C49CC` | `data_9A31F8_9C49CC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C4E38` | `data_9A31F8_9C4E38.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C5328` | `data_9A31F8_9C5328.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C5674` | `data_9A31F8_9C5674.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C5734` | `data_9A31F8_9C5734.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C57D8` | `data_9A31F8_9C57D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C5F70` | `data_9A31F8_9C5F70.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C65EC` | `data_9A31F8_9C65EC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C6A58` | `data_9A31F8_9C6A58.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C6B20` | `data_9A31F8_9C6B20.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C727C` | `data_9A31F8_9C727C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C7A2C` | `data_9A31F8_9C7A2C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C8440` | `data_9A31F8_9C8440.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C8DC4` | `data_9A31F8_9C8DC4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089C9A44` | `data_9A31F8_9C9A44.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089CA444` | `data_9A31F8_9CA444.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089CAA10` | `data_9A31F8_9CAA10.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089CB7B0` | `data_9A31F8_9CB7B0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089CCA28` | `data_9A31F8_9CCA28.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089CCE8C` | `data_9A31F8_9CCE8C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089CD650` | `data_9A31F8_9CD650.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089CE038` | `data_9A31F8_9CE038.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089CEB94` | `data_9A31F8_9CEB94.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089CF7C0` | `data_9A31F8_9CF7C0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D038C` | `data_9A31F8_9D038C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D0E08` | `data_9A31F8_9D0E08.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D1648` | `data_9A31F8_9D1648.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D1CA4` | `data_9A31F8_9D1CA4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D20E0` | `data_9A31F8_9D20E0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D230C` | `data_9A31F8_9D230C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D23D8` | `data_9A31F8_9D23D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D23F8` | `data_9A31F8_9D23F8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2418` | `data_9A31F8_9D2418.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2438` | `data_9A31F8_9D2438.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2458` | `data_9A31F8_9D2458.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2478` | `data_9A31F8_9D2478.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2498` | `data_9A31F8_9D2498.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D24B8` | `data_9A31F8_9D24B8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D24D8` | `data_9A31F8_9D24D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D24F8` | `data_9A31F8_9D24F8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2518` | `data_9A31F8_9D2518.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2538` | `data_9A31F8_9D2538.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2558` | `data_9A31F8_9D2558.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2578` | `data_9A31F8_9D2578.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2598` | `data_9A31F8_9D2598.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D25B8` | `data_9A31F8_9D25B8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D25D8` | `data_9A31F8_9D25D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D25F8` | `data_9A31F8_9D25F8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2618` | `data_9A31F8_9D2618.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2638` | `data_9A31F8_9D2638.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2658` | `data_9A31F8_9D2658.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2678` | `data_9A31F8_9D2678.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2698` | `data_9A31F8_9D2698.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D26B8` | `data_9A31F8_9D26B8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D26D8` | `data_9A31F8_9D26D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D26F8` | `data_9A31F8_9D26F8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2718` | `data_9A31F8_9D2718.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2738` | `data_9A31F8_9D2738.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2758` | `data_9A31F8_9D2758.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2778` | `data_9A31F8_9D2778.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2798` | `data_9A31F8_9D2798.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D27B8` | `data_9A31F8_9D27B8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D27D8` | `data_9A31F8_9D27D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D27F8` | `data_9A31F8_9D27F8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2818` | `data_9A31F8_9D2818.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2838` | `data_9A31F8_9D2838.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2858` | `data_9A31F8_9D2858.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2878` | `data_9A31F8_9D2878.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2898` | `data_9A31F8_9D2898.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D28B8` | `data_9A31F8_9D28B8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D28D8` | `data_9A31F8_9D28D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D28F8` | `data_9A31F8_9D28F8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2918` | `data_9A31F8_9D2918.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2938` | `data_9A31F8_9D2938.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2958` | `data_9A31F8_9D2958.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2978` | `data_9A31F8_9D2978.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2998` | `data_9A31F8_9D2998.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D29B8` | `data_9A31F8_9D29B8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D29D8` | `data_9A31F8_9D29D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D29F8` | `data_9A31F8_9D29F8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2A18` | `data_9A31F8_9D2A18.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2A38` | `data_9A31F8_9D2A38.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2A58` | `data_9A31F8_9D2A58.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2A78` | `data_9A31F8_9D2A78.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2A98` | `data_9A31F8_9D2A98.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2AB8` | `data_9A31F8_9D2AB8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2AD8` | `data_9A31F8_9D2AD8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2C30` | `data_9A31F8_9D2C30.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2DC0` | `data_9A31F8_9D2DC0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D2F78` | `data_9A31F8_9D2F78.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D3130` | `data_9A31F8_9D3130.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D32D8` | `data_9A31F8_9D32D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D34A0` | `data_9A31F8_9D34A0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D36B0` | `data_9A31F8_9D36B0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D38CC` | `data_9A31F8_9D38CC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D3AD4` | `data_9A31F8_9D3AD4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D3CF8` | `data_9A31F8_9D3CF8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D3F20` | `data_9A31F8_9D3F20.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D4150` | `data_9A31F8_9D4150.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D432C` | `data_9A31F8_9D432C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D4500` | `data_9A31F8_9D4500.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D46C4` | `data_9A31F8_9D46C4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D48AC` | `data_9A31F8_9D48AC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D4A60` | `data_9A31F8_9D4A60.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D4BFC` | `data_9A31F8_9D4BFC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D4D74` | `data_9A31F8_9D4D74.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D4ECC` | `data_9A31F8_9D4ECC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D4FDC` | `data_9A31F8_9D4FDC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5100` | `data_9A31F8_9D5100.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5214` | `data_9A31F8_9D5214.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D52D0` | `data_9A31F8_9D52D0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D538C` | `data_9A31F8_9D538C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5440` | `data_9A31F8_9D5440.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5540` | `data_9A31F8_9D5540.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5658` | `data_9A31F8_9D5658.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5764` | `data_9A31F8_9D5764.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5820` | `data_9A31F8_9D5820.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D58E0` | `data_9A31F8_9D58E0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5A20` | `data_9A31F8_9D5A20.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5B58` | `data_9A31F8_9D5B58.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5C90` | `data_9A31F8_9D5C90.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5D4C` | `data_9A31F8_9D5D4C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5E9C` | `data_9A31F8_9D5E9C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D5FF0` | `data_9A31F8_9D5FF0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D6170` | `data_9A31F8_9D6170.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D62F8` | `data_9A31F8_9D62F8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D64EC` | `data_9A31F8_9D64EC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D66D0` | `data_9A31F8_9D66D0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D67F4` | `data_9A31F8_9D67F4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D6AA4` | `data_9A31F8_9D6AA4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D6E1C` | `data_9A31F8_9D6E1C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D6F0C` | `data_9A31F8_9D6F0C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D704C` | `data_9A31F8_9D704C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D71DC` | `data_9A31F8_9D71DC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D73B4` | `data_9A31F8_9D73B4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D75BC` | `data_9A31F8_9D75BC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D77CC` | `data_9A31F8_9D77CC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D79B4` | `data_9A31F8_9D79B4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D7B78` | `data_9A31F8_9D7B78.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D7D04` | `data_9A31F8_9D7D04.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D7E48` | `data_9A31F8_9D7E48.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D7F48` | `data_9A31F8_9D7F48.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D8010` | `data_9A31F8_9D8010.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D8198` | `data_9A31F8_9D8198.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D84A8` | `data_9A31F8_9D84A8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D8910` | `data_9A31F8_9D8910.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089D925C` | `data_9A31F8_9D925C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DA40C` | `data_9A31F8_9DA40C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DB1A0` | `data_9A31F8_9DB1A0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DBFE0` | `data_9A31F8_9DBFE0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCD48` | `data_9A31F8_9DCD48.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCD68` | `data_9A31F8_9DCD68.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCD88` | `data_9A31F8_9DCD88.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCDA8` | `data_9A31F8_9DCDA8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCDC8` | `data_9A31F8_9DCDC8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCDE8` | `data_9A31F8_9DCDE8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCE08` | `data_9A31F8_9DCE08.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCE28` | `data_9A31F8_9DCE28.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCE48` | `data_9A31F8_9DCE48.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCF10` | `data_9A31F8_9DCF10.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DCFFC` | `data_9A31F8_9DCFFC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DD114` | `data_9A31F8_9DD114.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DD284` | `data_9A31F8_9DD284.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DD4E8` | `data_9A31F8_9DD4E8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DD790` | `data_9A31F8_9DD790.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DDA68` | `data_9A31F8_9DDA68.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DDE8C` | `data_9A31F8_9DDE8C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DDF10` | `data_9A31F8_9DDF10.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DDF9C` | `data_9A31F8_9DDF9C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DE030` | `data_9A31F8_9DE030.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DE0BC` | `data_9A31F8_9DE0BC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DE14C` | `data_9A31F8_9DE14C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DE1CC` | `data_9A31F8_9DE1CC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DEA30` | `data_9A31F8_9DEA30.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DF470` | `data_9A31F8_9DF470.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089DFF90` | `data_9A31F8_9DFF90.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E0AB8` | `data_9A31F8_9E0AB8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E1480` | `data_9A31F8_9E1480.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E2154` | `data_9A31F8_9E2154.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E2C1C` | `data_9A31F8_9E2C1C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E34A8` | `data_9A31F8_9E34A8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E3B88` | `data_9A31F8_9E3B88.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4024` | `data_9A31F8_9E4024.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4344` | `data_9A31F8_9E4344.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E44B8` | `data_9A31F8_9E44B8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E45D0` | `data_9A31F8_9E45D0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E46E8` | `data_9A31F8_9E46E8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E47CC` | `data_9A31F8_9E47CC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E48C0` | `data_9A31F8_9E48C0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E49D8` | `data_9A31F8_9E49D8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4AEC` | `data_9A31F8_9E4AEC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4BC8` | `data_9A31F8_9E4BC8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4C7C` | `data_9A31F8_9E4C7C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4C9C` | `data_9A31F8_9E4C9C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4CBC` | `data_9A31F8_9E4CBC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4CDC` | `data_9A31F8_9E4CDC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4CFC` | `data_9A31F8_9E4CFC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4D1C` | `data_9A31F8_9E4D1C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4D3C` | `data_9A31F8_9E4D3C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4D5C` | `data_9A31F8_9E4D5C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4D7C` | `data_9A31F8_9E4D7C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4D9C` | `data_9A31F8_9E4D9C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4DBC` | `data_9A31F8_9E4DBC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4DDC` | `data_9A31F8_9E4DDC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4DFC` | `data_9A31F8_9E4DFC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4E1C` | `data_9A31F8_9E4E1C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4E3C` | `data_9A31F8_9E4E3C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4E5C` | `data_9A31F8_9E4E5C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4E7C` | `data_9A31F8_9E4E7C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4E9C` | `data_9A31F8_9E4E9C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4EBC` | `data_9A31F8_9E4EBC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4EDC` | `data_9A31F8_9E4EDC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4EFC` | `data_9A31F8_9E4EFC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4F1C` | `data_9A31F8_9E4F1C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4F3C` | `data_9A31F8_9E4F3C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4F5C` | `data_9A31F8_9E4F5C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4F7C` | `data_9A31F8_9E4F7C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4F9C` | `data_9A31F8_9E4F9C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E4FBC` | `data_9A31F8_9E4FBC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E5074` | `data_9A31F8_9E5074.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E5130` | `data_9A31F8_9E5130.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E51EC` | `data_9A31F8_9E51EC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E52AC` | `data_9A31F8_9E52AC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E5364` | `data_9A31F8_9E5364.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E541C` | `data_9A31F8_9E541C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E5600` | `data_9A31F8_9E5600.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E5814` | `data_9A31F8_9E5814.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E5A58` | `data_9A31F8_9E5A58.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E5D08` | `data_9A31F8_9E5D08.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E5FEC` | `data_9A31F8_9E5FEC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6290` | `data_9A31F8_9E6290.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E64D0` | `data_9A31F8_9E64D0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E66A0` | `data_9A31F8_9E66A0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6808` | `data_9A31F8_9E6808.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6924` | `data_9A31F8_9E6924.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6A14` | `data_9A31F8_9E6A14.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6AE4` | `data_9A31F8_9E6AE4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6BB0` | `data_9A31F8_9E6BB0.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6C80` | `data_9A31F8_9E6C80.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6D50` | `data_9A31F8_9E6D50.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6E1C` | `data_9A31F8_9E6E1C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6EE8` | `data_9A31F8_9E6EE8.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E6FB4` | `data_9A31F8_9E6FB4.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E7080` | `data_9A31F8_9E7080.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E714C` | `data_9A31F8_9E714C.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `gUnknown_089E7DEC` | `data_9A31F8_9E7DEC.bin` | Unknown | Raw bin. Check context. |
| `data_9A31F8.s` | `Tsa_089E7E0C` | `data_9A31F8_9E7E0C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7E2C` | `data_9A31F8_9E7E2C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7E50` | `data_9A31F8_9E7E50.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7E78` | `data_9A31F8_9E7E78.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7EA0` | `data_9A31F8_9E7EA0.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7ECC` | `data_9A31F8_9E7ECC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7EFC` | `data_9A31F8_9E7EFC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7F2C` | `data_9A31F8_9E7F2C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7F5C` | `data_9A31F8_9E7F5C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7F8C` | `data_9A31F8_9E7F8C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7FBC` | `data_9A31F8_9E7FBC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E7FFC` | `data_9A31F8_9E7FFC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E8040` | `data_9A31F8_9E8040.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E8090` | `data_9A31F8_9E8090.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E80EC` | `data_9A31F8_9E80EC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E8148` | `data_9A31F8_9E8148.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E81A4` | `data_9A31F8_9E81A4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Tsa_089E8200` | `data_9A31F8_9E8200.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_9A31F8.s` | `Img_TalkBubble` | `data_9A31F8_9E8238.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_TalkBubbleOpening_E` | `data_9A31F8_9E82E0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_TalkBubbleOpening_D` | `data_9A31F8_9E8384.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_TalkBubbleOpening_C` | `data_9A31F8_9E83E0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_TalkBubbleOpening_B` | `data_9A31F8_9E8434.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Img_TalkBubbleOpening_A` | `data_9A31F8_9E8484.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_9A31F8.s` | `Pal_TalkBubble` | `data_9A31F8_9E84D4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `const_data_DAEF0.s` | `gUnknown_080DAF60` | `const_data_DAEF0_0DAF60.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AAE0C` | `data_5AA96C_5AAE0C.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `Img_LinkArenaMenu` | `data_5AA96C_5AB358.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_5AA96C.s` | `Img_TacticianSelObj` | `data_5AA96C_5ABD68.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_5AA96C.s` | `gUnknown_085AC604` | `data_5AA96C_5AC604.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `Img_LinkArenaRankIcons` | `data_5AA96C_5AC9DC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_5AA96C.s` | `Img_LinkArenaActiveBannerFx` | `data_5AA96C_5ACD20.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_5AA96C.s` | `gUnknown_085ACEFC` | `data_5AA96C_5ACEFC.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `Img_LinkArenaPlacementRanks` | `data_5AA96C_5AD0CC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_5AA96C.s` | `gUnknown_085AD80C` | `data_5AA96C_5AD80C.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AD9CC` | `data_5AA96C_5AD9CC.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `Img_LinkArenaPlayerBanners` | `data_5AA96C_5ADA38.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_5AA96C.s` | `Pal_LinkArenaMenu` | `data_5AA96C_5ADBE8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5AA96C.s` | `Pal_TacticianSelObj` | `data_5AA96C_5ADC48.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5AA96C.s` | `Pal_LinkArenaRankIcons` | `data_5AA96C_5ADCC8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5AA96C.s` | `gUnknown_085ADDA8` | `data_5AA96C_5ADDA8.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `Pal_LinkArenaPlacementRanks` | `data_5AA96C_5ADDC8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5AA96C.s` | `gUnknown_085ADDE8` | `data_5AA96C_5ADDE8.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `Pal_LinkArenaActiveBannerFx` | `data_5AA96C_5ADE08.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5AA96C.s` | `gUnknown_085ADE28` | `data_5AA96C_5ADE28.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085ADE48` | `data_5AA96C_5ADE48.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `Pal_085ADE68` | `data_5AA96C_5ADE68.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5AA96C.s` | `gUnknown_085ADE88` | `data_5AA96C_5ADE88.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085ADF40` | `data_5AA96C_5ADF40.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `Tsa_085AE190` | `data_5AA96C_5AE190.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_5AA96C.s` | `Tsa_SioResultRankings` | `data_5AA96C_5AE464.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_5AA96C.s` | `gUnknown_085AE778` | `data_5AA96C_5AE778.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AE7EC` | `data_5AA96C_5AE7EC.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AEDD4` | `data_5AA96C_5AEDD4.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AEE90` | `data_5AA96C_5AEE90.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AEF54` | `data_5AA96C_5AEF54.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AF02C` | `data_5AA96C_5AF02C.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AF0F0` | `data_5AA96C_5AF0F0.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AF110` | `data_5AA96C_5AF110.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AF130` | `data_5AA96C_5AF130.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085AF150` | `data_5AA96C_5AF150.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `Img_LinkArenaPostBattleBg` | `data_5AA96C_5AF170.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_5AA96C.s` | `Pal_LinkArenaPostBattleBg` | `data_5AA96C_5B081C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_5AA96C.s` | `Tsa_LinkArenaPostBattleBg` | `data_5AA96C_5B089C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_5AA96C.s` | `gUnknown_085B0DE8` | `data_5AA96C_5B0DE8.bin` | Unknown | Raw bin. Check context. |
| `data_5AA96C.s` | `gUnknown_085B0F2C` | `data_5AA96C_5B0F2C.bin` | Unknown | Raw bin. Check context. |
| `data-ekrdragon.s` | `gUnknown_08758740` | `data-ekrdragon_758740.bin` | Unknown | Raw bin. Check context. |
| `data_99D6DC.s` | `Img_0899D6DC` | `data_99D6DC_99D6DC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_99D6DC.s` | `Img_99E1A4` | `data_99D6DC_99E1A4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_99D6DC.s` | `Img_99ED44` | `data_99D6DC_99ED44.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_99D6DC.s` | `Img_99F7D4` | `data_99D6DC_99F7D4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_99D6DC.s` | `Img_9A0154` | `data_99D6DC_9A0154.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_99D6DC.s` | `Img_9A0864` | `data_99D6DC_9A0864.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_99D6DC.s` | `TileSet_9A0E84` | `data_99D6DC_9A0E84.bin` | Unknown | Raw bin. Check context. |
| `data_99D6DC.s` | `TileSet_9A1050` | `data_99D6DC_9A1050.bin` | Unknown | Raw bin. Check context. |
| `data_99D6DC.s` | `TileSet_9A1228` | `data_99D6DC_9A1228.bin` | Unknown | Raw bin. Check context. |
| `data_99D6DC.s` | `TileSet_9A13EC` | `data_99D6DC_9A13EC.bin` | Unknown | Raw bin. Check context. |
| `data_99D6DC.s` | `TileSet_9A15B4` | `data_99D6DC_9A15B4.bin` | Unknown | Raw bin. Check context. |
| `data_99D6DC.s` | `TileSet_9A174C` | `data_99D6DC_9A174C.bin` | Unknown | Raw bin. Check context. |
| `data_99D6DC.s` | `Pal_EventMapAnimMaskfx` | `data_99D6DC_9A18D4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_99D6DC.s` | `gUnknown_089A234C` | `data_99D6DC_9A234C.bin` | Unknown | Raw bin. Check context. |
| `data_99D6DC.s` | `gUnknown_089A27B4` | `data_99D6DC_9A27B4.bin` | Unknown | Raw bin. Check context. |
| `data_99D6DC.s` | `gUnknown_089A28E0` | `data_99D6DC_9A28E0.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `Img_PrepHelpButtonSprites` | `data_A195B0_A199C8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `Img_MenuScrollBar` | `data_A195B0_A19C0C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `Pal_MenuScrollBar` | `data_A195B0_A19CAC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A195B0.s` | `gUnknown_08A19CCC` | `data_A195B0_A19CCC.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `Pal_SpinningArrow` | `data_A195B0_A1A084.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A195B0.s` | `gUnknown_08A1A0A4` | `data_A195B0_A1A0A4.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1A23C` | `data_A195B0_A1A23C.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1A3FC` | `data_A195B0_A1A3FC.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `Tsa_08A1A41C` | `data_A195B0_A1A41C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A195B0.s` | `Tsa_08A1A434` | `data_A195B0_A1A434.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A195B0.s` | `Tsa_08A1A474` | `data_A195B0_A1A474.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A195B0.s` | `gUnknown_08A1A4C8` | `data_A195B0_A1A4C8.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gGfx_SupportScreenBanner` | `data_A195B0_A1A8E4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `gUnknown_08A1AC88` | `data_A195B0_A1AC88.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gPal_SupportScreenBanner` | `data_A195B0_A1B174.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A195B0.s` | `gUnknown_08A1B194` | `data_A195B0_A1B194.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1B1FC` | `data_A195B0_A1B1FC.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1B638` | `data_A195B0_A1B638.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1B658` | `data_A195B0_A1B658.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1B698` | `data_A195B0_A1B698.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1B730` | `data_A195B0_A1B730.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1B7C8` | `data_A195B0_A1B7C8.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1B8B8` | `data_A195B0_A1B8B8.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1B990` | `data_A195B0_A1B990.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1B9EC` | `data_A195B0_A1B9EC.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `Img_PrepItemUseScreen` | `data_A195B0_A1BAB8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `Tsa_PrepItemUseScreen` | `data_A195B0_A1BAE4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A195B0.s` | `gUnknown_08A1BBD0` | `data_A195B0_A1BBD0.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1BCC0` | `data_A195B0_A1BCC0.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1BD00` | `data_A195B0_A1BD00.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1BD40` | `data_A195B0_A1BD40.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gUnknown_08A1BD60` | `data_A195B0_A1BD60.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `Img_SpinningArrow` | `data_A195B0_A1C704.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `gImg_UiSpinningArrow_Horizontal` | `data_A195B0_A1C7D8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `gUnknown_08A1C8B4` | `data_A195B0_A1C8B4.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `Img_08A1CD68` | `data_A195B0_A1CD68.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `Img_UnitListBanners` | `data_A195B0_A1CDC4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `Img_UnitListBanner_Animation` | `data_A195B0_A1D288.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `Pal_08A1D448` | `data_A195B0_A1D448.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A195B0.s` | `gUnknown_08A1D4C8` | `data_A195B0_A1D4C8.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `Img_PrepTextShadow` | `data_A195B0_A1D4E8.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `gUnknown_08A1D510` | `data_A195B0_A1D510.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `Pal_MapBattleInfoNum` | `data_A195B0_A1D79C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A195B0.s` | `Img_PrepPopupWindow` | `data_A195B0_A1D7DC.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `Pal_08A1D850` | `data_A195B0_A1D850.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A195B0.s` | `Pal_08A1D870` | `data_A195B0_A1D870.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A195B0.s` | `Pal_08A1D890` | `data_A195B0_A1D890.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A195B0.s` | `Pal_08A1D8B0` | `data_A195B0_A1D8B0.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A195B0.s` | `Img_PrepWindow` | `data_A195B0_A1D8D0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `gUnknown_08A1DB80` | `data_A195B0_A1DB80.bin` | Unknown | Raw bin. Check context. |
| `data_A195B0.s` | `gTsa_SupportSubScreen` | `data_A195B0_A1DC1C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_A195B0.s` | `gGfx_SupportMenu` | `data_A195B0_A1DD0C.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_A195B0.s` | `gPal_SupportMenu` | `data_A195B0_A1E0D8.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_B12A60.s` | `Img_CommGameBgScreen` | `data_B12A60_B12DB4.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_B12A60.s` | `Pal_CommGameBgScreenInShop` | `data_B12A60_B1754C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_B12A60.s` | `Pal_08B1756C` | `data_B12A60_B1756C.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_B12A60.s` | `Tsa_08B176CC` | `data_B12A60_B176CC.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_B12A60.s` | `Img_08B177C0` | `data_B12A60_B177C0.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_B12A60.s` | `Img_08B17864` | `data_B12A60_B17864.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_B12A60.s` | `Pal_08B17B44` | `data_B12A60_B17B44.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_B12A60.s` | `Img_ChapterIntro_LensFlare` | `data_B12A60_B17B64.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_B12A60.s` | `Tsa_08B18D68` | `data_B12A60_B18D68.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_B12A60.s` | `Pal_ChapterIntro_LensFlare` | `data_B12A60_B18ED4.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_B12A60.s` | `Img_ChapterIntro_Fog` | `data_B12A60_B18F34.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_B12A60.s` | `Tsa_ChapterIntro_Fog` | `data_B12A60_B196D8.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `data_B12A60.s` | `Pal_ChapterIntro_Fog` | `data_B12A60_B19854.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_B12A60.s` | `Img_ChapterIntro_Sprites` | `data_B12A60_B19874.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |
| `data_B12A60.s` | `Pal_ChapterIntro_Sprites` | `data_B12A60_B19DEC.bin` | Palette | Labeled as Palette, but is `bin`. Should be converted to `.pal`. |
| `data_A2EEF0.s` | `gUnknown_08A301B0` | `data_A2EEF0_A301B0.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A30780` | `data_A2EEF0_A30780.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A30800` | `data_A2EEF0_A30800.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A30978` | `data_A2EEF0_A30978.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A30E2C` | `data_A2EEF0_A30E2C.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A35488` | `data_A2EEF0_A35488.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A3593C` | `data_A2EEF0_A3593C.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A35A3C` | `data_A2EEF0_A35A3C.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A35FD0` | `data_A2EEF0_A35FD0.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A360C8` | `data_A2EEF0_A360C8.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A360E8` | `data_A2EEF0_A360E8.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A36284` | `data_A2EEF0_A36284.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A36338` | `data_A2EEF0_A36338.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A372C0` | `data_A2EEF0_A372C0.bin` | Unknown | Raw bin. Check context. |
| `data_A2EEF0.s` | `gUnknown_08A37300` | `data_A2EEF0_A37300.bin` | Unknown | Raw bin. Check context. |
| `const_data_E162A.s` | `Tsa_EkrTriPegagusRightBG1` | `const_data_E162A_0E3554.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_E162A.s` | `Tsa_EkrTriPegagusRightBG2` | `const_data_E162A_0E3668.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_E162A.s` | `Tsa_EkrTriPegagusRightBG3` | `const_data_E162A_0E378C.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_E162A.s` | `Tsa_EkrTriPegagusLeftBG1` | `const_data_E162A_0E3864.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_E162A.s` | `Tsa_EkrTriPegagusLeftBG2` | `const_data_E162A_0E3980.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `const_data_E162A.s` | `Tsa_EkrTriPegagusLeftBG3` | `const_data_E162A_0E3AA4.bin` | Tilemap | Raw TSA data. Could potentially be decompressed or converted to map format. |
| `banim-efxlvupobj.s` | `Img_EkrLvupNumBig` | `banim-efxlvupobj_5C8278.bin` | Graphics | Labeled as Graphics, but is `bin`. Should be converted to `.png`. |