    .section .data

	.global gUnknown_08591F38
gUnknown_08591F38:  @ 0x08591F38
	.incbin "baserom.gba", 0x591F38, 0x50

	.global gEvent_DisplayBattleQuote
gEvent_DisplayBattleQuote:  @ 0x08591F88
	.incbin "baserom.gba", 0x591F88, 0x14

	.global gEvent_TriggerQueuedTileChanges
gEvent_TriggerQueuedTileChanges:  @ 0x08591F9C
	.incbin "baserom.gba", 0x591F9C, 0xC

	.global gEvent_OpenChest
gEvent_OpenChest:  @ 0x08591FA8
@ Replacing .incbin "baserom.gba", 0x591FA8, 0x48
    .4byte 0x00011020
    .4byte 0xfffd2720
    .4byte 0x00070540
    .4byte 0x000000ff
    .4byte 0x00000c43
    .4byte 0x00070003
    .4byte 0xffff3720
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0xffff3721
    .4byte 0x00010820
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x3c
    .4byte 0x00002220
    .4byte 0x00003e20
    .4byte 0x00002220
    .4byte 0x00000120

	.global gEvent_MapSupportConversation
gEvent_MapSupportConversation:  @ 0x08591FF0
	.incbin "baserom.gba", 0x591FF0, 0x40

	.global gEvent_SupportViewerConversation
gEvent_SupportViewerConversation:  @ 0x08592030
	.incbin "baserom.gba", 0x592030, 0x28

	.global gEvent_SkirmishRetreat
gEvent_SkirmishRetreat:  @ 0x08592058
@ Replacing .incbin "baserom.gba", 0x592058, 0x60
    .4byte 0x41020
    .4byte 0x1a23
    .4byte 0xb0540
    .4byte -0x1
    .4byte 0x8fc1b20
    .4byte 0x1d20
    .4byte 0x70540
    .4byte 0x1
    .4byte 0xc41
    .4byte 0x7000c
    .4byte 0x7fff1324
    .4byte 0x41721
    .4byte -0xd5df
    .4byte 0x1926
    .4byte 0x10540
    .4byte 0x1
    .4byte 0xc41
    .4byte 0x1000c
    .4byte 0xd40
    .4byte sub_8037D58
    .4byte 0x820
    .4byte 0x1b22
    .4byte 0x70228
    .4byte 0x120

	.global gEvent_SuspendPrompt
gEvent_SuspendPrompt:  @ 0x085920B8
@ Replacing .incbin "baserom.gba", 0x5920B8, 0x4C
    .4byte 0x41020
    .4byte 0x1a20
    .4byte 0x8fe1b20
    .4byte 0x1d20
    .4byte 0x70540
    .4byte 0x1
    .4byte 0xc41
    .4byte 0x7000c
    .4byte 0xd40
    .4byte sub_80B5D5C
    .4byte 0x8ff1b21
    .4byte 0x1d20
    .4byte 0x7fff1324
    .4byte 0x41721
    .4byte 0x2a20
    .4byte 0x820
    .4byte 0x1b22
    .4byte 0x70228
    .4byte 0x120

	.global gEvent_GameOver
gEvent_GameOver:  @ 0x08592104
@ Replacing .incbin "baserom.gba", 0x592104, 0x10
    .4byte 0x41020
    .4byte 0xd40
    .4byte sub_8085374
    .4byte 0x120

	.global gEvent_08592114
gEvent_08592114:  @ 0x08592114
@ Replacing .incbin "baserom.gba", 0x592114, 0x98
    .4byte 0x000a0320
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte gEvent_08592114 + 0x2c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00000a40
    .4byte gEvent_08592114 + 0x5c
    .4byte 0x00010820
    .4byte 0x00000120
    .4byte 0x00080320
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00070320
    .4byte 0x00630c41
    .4byte 0x0000000c
    .4byte 0x00101721
    .4byte 0x00000820
    .4byte 0x00002220
    .4byte 0x00101720
    .4byte 0x00630820
    .4byte 0x00000120
    .4byte 0x00080320
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00101721
    .4byte 0x00000820
    .4byte 0x000b0320
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x00001921
    .4byte 0x00c20620
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0xffff2520
    .4byte 0x00010820
    .4byte 0x00000120

	.global gUnknown_085921AC
gUnknown_085921AC:  @ 0x085921AC
	.incbin "baserom.gba", 0x5921AC, 0x1C
