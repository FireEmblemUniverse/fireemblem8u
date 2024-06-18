    .section .data

	.global Img_SaveMenuBG
Img_SaveMenuBG:  @ 0x08A21658
	.incbin "baserom.gba", 0xA21658, 0x4774

	.global Pal_SaveMenuBG
Pal_SaveMenuBG:  @ 0x08A25DCC
	.incbin "baserom.gba", 0xA25DCC, 0x100

	.global Tsa_SaveMenuBG
Tsa_SaveMenuBG:  @ 0x08A25ECC
	.incbin "baserom.gba", 0xA25ECC, 0x4B4

	.global Img_MainMenuBgFog
Img_MainMenuBgFog:  @ 0x08A26380
	.incbin "baserom.gba", 0xA26380, 0x558

	.global Pal_MainMenuBgFog
Pal_MainMenuBgFog:  @ 0x08A268D8
	.incbin "baserom.gba", 0xA268D8, 0x20

	.global Tsa_MainMenuBgFog
Tsa_MainMenuBgFog:  @ 0x08A268F8
	.incbin "baserom.gba", 0xA268F8, 0x17C

	.global Img_SaveScreenSprits
Img_SaveScreenSprits:  @ 0x08A26A74
	.incbin "baserom.gba", 0xA26A74, 0x14F4

	.global Pal_SaveScreenSprits
Pal_SaveScreenSprits:  @ 0x08A27F68
	.incbin "baserom.gba", 0xA27F68, 0x120

	.global Pal_08A28088
Pal_08A28088:  @ 0x08A28088
	.incbin "baserom.gba", 0xA28088, 0x20

	.global gUnknown_08A280A8
gUnknown_08A280A8:  @ 0x08A280A8
	.incbin "baserom.gba", 0xA280A8, 0x84

	.global Img_GameMainMenuObjs
Img_GameMainMenuObjs:  @ 0x08A2812C
	.incbin "baserom.gba", 0xA2812C, 0x8E0

	.global Img_DifficultyMenuObjs
Img_DifficultyMenuObjs:  @ 0x08A28A0C
	.incbin "baserom.gba", 0xA28A0C, 0xA0C

	.global Pal_DifficultyMenuObjs
Pal_DifficultyMenuObjs:  @ 0x08A29418
	.incbin "baserom.gba", 0xA29418, 0x80

	.global gUnknown_08A29498
gUnknown_08A29498:  @ 0x08A29498
	.incbin "baserom.gba", 0xA29498, 0xC0

	.global gUnknown_08A29558
gUnknown_08A29558:  @ 0x08A29558
	.incbin "baserom.gba", 0xA29558, 0x5C

	.global Pal_08A295B4
Pal_08A295B4:  @ 0x08A295B4
	.incbin "baserom.gba", 0xA295B4, 0x20

	.global Tsa_CommGameBgScreenInShop
Tsa_CommGameBgScreenInShop:  @ 0x08A295D4
	.incbin "baserom.gba", 0xA295D4, 0x4B4

	.global gUnknown_08A29A88
gUnknown_08A29A88:  @ 0x08A29A88
	.incbin "baserom.gba", 0xA29A88, 0x175C

	.global gUnknown_08A2B1E4
gUnknown_08A2B1E4:  @ 0x08A2B1E4
	.incbin "baserom.gba", 0xA2B1E4, 0xF38

	.global gUnknown_08A2C11C
gUnknown_08A2C11C:  @ 0x08A2C11C
	.incbin "baserom.gba", 0xA2C11C, 0x120

	.global gUnknown_08A2C23C
gUnknown_08A2C23C:  @ 0x08A2C23C
	.incbin "baserom.gba", 0xA2C23C, 0x28C

	.global gUnknown_08A2C4C8
gUnknown_08A2C4C8:  @ 0x08A2C4C8
	.incbin "baserom.gba", 0xA2C4C8, 0xE0

	.global gUnknown_08A2C5A8
gUnknown_08A2C5A8:  @ 0x08A2C5A8
	.incbin "baserom.gba", 0xA2C5A8, 0x1FC

	.global gUnknown_08A2C7A4
gUnknown_08A2C7A4:  @ 0x08A2C7A4
	.incbin "baserom.gba", 0xA2C7A4, 0x94

	.global Img_SoundRoomVolumeGraph
Img_SoundRoomVolumeGraph:  @ 0x08A2C838
	.incbin "baserom.gba", 0xA2C838, 0x70

	.global Pal_SoundRoomVolumeGraph
Pal_SoundRoomVolumeGraph:  @ 0x08A2C8A8
	.incbin "baserom.gba", 0xA2C8A8, 0x60

	.global gUnknown_08A2C908
gUnknown_08A2C908:  @ 0x08A2C908
	.incbin "baserom.gba", 0xA2C908, 0x24

	.global gUnknown_08A2C92C
gUnknown_08A2C92C:  @ 0x08A2C92C
	.incbin "baserom.gba", 0xA2C92C, 0x190

	.global Img_SoundRoomUiElements
Img_SoundRoomUiElements:  @ 0x08A2CABC
	.incbin "baserom.gba", 0xA2CABC, 0x810

	.global Pal_SoundRoomUiElements
Pal_SoundRoomUiElements:  @ 0x08A2D2CC
	.incbin "baserom.gba", 0xA2D2CC, 0x60

	.global gUnknown_08A2D32C
gUnknown_08A2D32C:  @ 0x08A2D32C
	.incbin "baserom.gba", 0xA2D32C, 0xE8C

	.global gUnknown_08A2E1B8
gUnknown_08A2E1B8:  @ 0x08A2E1B8
	.incbin "baserom.gba", 0xA2E1B8, 0x40

	.global gUnknown_08A2E1F8
gUnknown_08A2E1F8:  @ 0x08A2E1F8
	.incbin "baserom.gba", 0xA2E1F8, 0x1C

	.global gUnknown_08A2E214
gUnknown_08A2E214:  @ 0x08A2E214
	.incbin "baserom.gba", 0xA2E214, 0x290

	.global gUnknown_08A2E4A4
gUnknown_08A2E4A4:  @ 0x08A2E4A4
	.incbin "baserom.gba", 0xA2E4A4, 0x20

	.global gUnknown_08A2E4C4
gUnknown_08A2E4C4:  @ 0x08A2E4C4
	.incbin "baserom.gba", 0xA2E4C4, 0x128

	.global gUnknown_08A2E5EC
gUnknown_08A2E5EC:  @ 0x08A2E5EC
	.incbin "baserom.gba", 0xA2E5EC, 0x304

	.global gUnknown_08A2E8F0
gUnknown_08A2E8F0:  @ 0x08A2E8F0
	.incbin "baserom.gba", 0xA2E8F0, 0x60

	.global Img_SysBlackBox
Img_SysBlackBox:  @ 0x08A2E950
	.incbin "baserom.gba", 0xA2E950, 0x24
