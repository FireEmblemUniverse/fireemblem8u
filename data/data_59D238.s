	.section .data

    .global gSelectInfo_OffensiveStaff
gSelectInfo_OffensiveStaff:  @ 0x0859D238
@ replacing .incbin "baserom.gba", 0x0059d238, 0x20
.4byte sub_8029CDC
.4byte ClearBg0Bg1
.4byte 0
.4byte sub_8029CE8
.4byte 0
.4byte StaffSelectOnSelect
.4byte GenericSelection_BackToUM_CamWait
.4byte 0

    .global gSelectInfo_Barrier
gSelectInfo_Barrier:  @ 0x0859D258
@ replacing .incbin "baserom.gba", 0x0059d258, 0x20
.4byte AttackStaffSelectOnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte AttackStaffSelectOnChange
.4byte 0
.4byte StaffSelectOnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Restore
gSelectInfo_Restore:  @ 0x0859D278
@ replacing .incbin "baserom.gba", 0x0059d278, 0x20
.4byte BarrierSelectOnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte BarrierSelectOnChange
.4byte 0
.4byte StaffSelectOnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Heal
gSelectInfo_Heal:  @ 0x0859D298
@ replacing .incbin "baserom.gba", 0x0059d298, 0x20
.4byte sub_802464C
.4byte ClearBg0Bg1
.4byte 0
.4byte sub_8024658
.4byte 0
.4byte StaffSelectOnSelect
.4byte GenericSelection_BackToUM_CamWait
.4byte 0

	.global gSelectInfo_Dance
gSelectInfo_Dance:  @ 0x0859D2B8
@ replacing .incbin "baserom.gba", 0x0059d2b8, 0x20
.4byte sub_80247F4
.4byte ClearBg0Bg1
.4byte 0
.4byte sub_8024814
.4byte 0
.4byte sub_80232A4
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_PutTrap
gSelectInfo_PutTrap:  @ 0x0859D2D8
@ replacing .incbin "baserom.gba", 0x0059d2d8, 0x20
.4byte 0
.4byte sub_8029D28
.4byte 0
.4byte 0
.4byte 0
.4byte 0
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_0859D2F8
gSelectInfo_0859D2F8:  @ 0x0859D2F8
@ replacing .incbin "baserom.gba", 0x0059d2f8, 0x20
.4byte sub_8024838
.4byte sub_8029D28
.4byte 0
.4byte sub_8024844
.4byte 0
.4byte 0
.4byte GenericSelection_BackToUM_CamWait
.4byte 0

	.global gSelectInfo_Steal
gSelectInfo_Steal:  @ 0x0859D318
@ replacing .incbin "baserom.gba", 0x0059d318, 0x20
.4byte StealTargetSelection_OnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte sub_802423C
.4byte 0
.4byte sub_8024260
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Summon
gSelectInfo_Summon:  @ 0x0859D338
@ replacing .incbin "baserom.gba", 0x0059d338, 0x20
.4byte SummonSelection_OnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte SummonSelection_OnChange
.4byte 0
.4byte SummonSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Pick
gSelectInfo_Pick:  @ 0x0859D358
@ replacing .incbin "baserom.gba", 0x0059d358, 0x20
.4byte PickSelection_OnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte 0
.4byte 0
.4byte PickSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Support
gSelectInfo_Support:  @ 0x0859D378
@ replacing .incbin "baserom.gba", 0x0059d378, 0x20
.4byte TalkSupportSelection_OnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte TalkSupportSelection_OnChange
.4byte 0
.4byte SupportSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Talk
gSelectInfo_Talk:  @ 0x0859D398
@ replacing .incbin "baserom.gba", 0x0059d398, 0x20
.4byte TalkSupportSelection_OnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte TalkSupportSelection_OnChange
.4byte 0
.4byte TalkSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Repair
gSelectInfo_Repair:  @ 0x0859D3B8
@ replacing .incbin "baserom.gba", 0x0059d3b8, 0x20
.4byte RepairSelectOnInit
.4byte 0
.4byte 0
.4byte RepairSelectOnChange
.4byte 0
.4byte RepairSelectOnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Trade
gSelectInfo_Trade:  @ 0x0859D3D8
@ replacing .incbin "baserom.gba", 0x0059d3d8, 0x20
.4byte TradeTargetSelection_OnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte TradeSelection_OnChange
.4byte 0
.4byte TradeSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_0859D3F8
gSelectInfo_0859D3F8:  @ 0x0859D3F8
@ replacing .incbin "baserom.gba", 0x0059d3f8, 0x20
.4byte NewBattleForecast
.4byte sub_8022F10
.4byte 0
.4byte sub_8022E8C
.4byte 0
.4byte sub_8022DF0
.4byte sub_8022E64
.4byte StartBattleForecastHelpBox

	.global gSelectInfo_Give
gSelectInfo_Give:  @ 0x0859D418
@ replacing .incbin "baserom.gba", 0x0059d418, 0x20
.4byte GiveSelection_OnInit
.4byte 0
.4byte 0
.4byte GiveSelection_OnChange
.4byte 0
.4byte GiveSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Take
gSelectInfo_Take:  @ 0x0859D438
@ replacing .incbin "baserom.gba", 0x0059d438, 0x20
.4byte TakeSelection_OnInit
.4byte 0
.4byte 0
.4byte TakeSelection_OnChange
.4byte 0
.4byte TakeSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Drop
gSelectInfo_Drop:  @ 0x0859D458
@ replacing .incbin "baserom.gba", 0x0059d458, 0x20
.4byte DropSelection_OnConstruction
.4byte ClearBg0Bg1
.4byte 0
.4byte 0
.4byte 0
.4byte DropSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gSelectInfo_Rescue
gSelectInfo_Rescue:  @ 0x0859D478
@ Replacing .incbin "baserom.gba", 0x59D478, 0x440
    .4byte RescueSelection_OnConstruction
    .4byte 0x0
    .4byte 0x0
    .4byte RescueSelection_OnChange
    .4byte 0x0
    .4byte RescueSelection_OnSelect
    .4byte GenericSelection_BackToUM
    .4byte RescueSelection_OnHelp
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x7
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x1007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x2007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x3007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x4007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x5007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x6007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x7007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x8007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x9007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0xa007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0xb007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0xc007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0xd007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0xe007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0xf007
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x10007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x11007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x12007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x13007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x14007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x15007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x16007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x17007
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x18007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x19007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x1a007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x1b007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x1c007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x1d007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x1e007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x1f007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x20007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x21007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x22007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x23007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x24007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x25007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x26007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x27007
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x28007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x29007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x2a007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x2b007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x2c007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x2d007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x2e007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x2f007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x30007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x31007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x32007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x33007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x34007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x35007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x36007
    .4byte 0x1000001c
    .4byte gUnknown_0895F5A5 + 0x37007
    .4byte 0x0
    .4byte 0x0
    .4byte RomHeaderNintendoLogo + 0x6
    .4byte gUnknown_0895F5A5 + 0x38007
    .4byte RomHeaderNintendoLogo + 0x4
    .4byte gUnknown_0895F5A5 + 0x38407
    .4byte RomHeaderNintendoLogo + 0x6
    .4byte gUnknown_0895F5A5 + 0x38807
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x38c07
    .4byte RomHeaderNintendoLogo + 0x4
    .4byte gUnknown_0895F5A5 + 0x39007
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x39407
    .4byte 0x0
    .4byte 0x0
    .4byte 0x500000b
    .4byte gUnknown_0895F5A5 + 0x39807
    .4byte 0x500000b
    .4byte gUnknown_0895F5A5 + 0x39d07
    .4byte 0x500000b
    .4byte gUnknown_0895F5A5 + 0x3a207
    .4byte 0x500000b
    .4byte gUnknown_0895F5A5 + 0x3a707
    .4byte 0x500000b
    .4byte gUnknown_0895F5A5 + 0x3ac07
    .4byte 0x500000b
    .4byte gUnknown_0895F5A5 + 0x3b107
    .4byte 0x500000b
    .4byte gUnknown_0895F5A5 + 0x3b607
    .4byte 0x500000b
    .4byte gUnknown_0895F5A5 + 0x3bb07
    .4byte 0x0
    .4byte 0x0
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x3c007
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x3c407
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x3c807
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x3cc07
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x3d007
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x3d407
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x3d807
    .4byte RomHeaderNintendoLogo + 0x7
    .4byte gUnknown_0895F5A5 + 0x3dc07
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_0895F5A5 + 0x3e007
    .4byte 0x3c043d
    .4byte gUnknown_0895F5A5 + 0x3e007
    .4byte 0x3c043d
    .4byte gUnknown_0895F5A5 + 0x3e00f
    .4byte 0x3c0403
    .4byte gUnknown_0895F5A5 + 0x3e017
    .4byte 0x3c0404
    .4byte gUnknown_0895F5A5 + 0x3e01f
    .4byte 0x3c0405
    .4byte gUnknown_0895F5A5 + 0x3e027
    .4byte 0x3c0404
    .4byte gUnknown_0895F5A5 + 0x3e02f
    .4byte 0x3c0403
    .4byte gUnknown_0895F5A5 + 0x3e037
    .4byte 0x3c0402
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_0895F5A5 + 0x3e041
    .4byte 0x310305
    .4byte gUnknown_0895F5A5 + 0x3e047
    .4byte 0x310306
    .4byte gUnknown_0895F5A5 + 0x3e04d
    .4byte 0x310306
    .4byte gUnknown_0895F5A5 + 0x3e053
    .4byte 0x310308
    .4byte gUnknown_0895F5A5 + 0x3e059
    .4byte 0x310306
    .4byte gUnknown_0895F5A5 + 0x3e061
    .4byte 0x310306
    .4byte gUnknown_0895F5A5 + 0x3e067
    .4byte 0x310307
    .4byte gUnknown_0895F5A5 + 0x3e06d
    .4byte 0x310309
    .4byte gUnknown_0895F5A5 + 0x3e073
    .4byte 0x310307
    .4byte gUnknown_0895F5A5 + 0x3e079
    .4byte 0x310308
    .4byte gUnknown_0895F5A5 + 0x3e081
    .4byte 0x310308
    .4byte gUnknown_0895F5A5 + 0x3e087
    .4byte 0x310308
    .4byte gUnknown_0895F5A5 + 0x3e041
    .4byte 0x310304
    .4byte gUnknown_0895F5A5 + 0x3e047
    .4byte 0x310307
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_0895F5A5 + 0x3e0bf
    .4byte 0x3c0413
    .4byte gUnknown_0895F5A5 + 0x3e0c7
    .4byte 0x3c0412
    .4byte gUnknown_0895F5A5 + 0x3e0cf
    .4byte 0x3c0411
    .4byte gUnknown_0895F5A5 + 0x3e0d7
    .4byte 0x3c0410
    .4byte gUnknown_0895F5A5 + 0x3e0df
    .4byte 0x3c0410
    .4byte gUnknown_0895F5A5 + 0x3e0e7
    .4byte 0x3c0410
    .4byte gUnknown_0895F5A5 + 0x3e0ef
    .4byte 0x3c0411
    .4byte gUnknown_0895F5A5 + 0x3e0f7
    .4byte 0x3c0412
    .4byte gUnknown_0895F5A5 + 0x3e0ff
    .4byte 0x3c0413
    .4byte gUnknown_0895F5A5 + 0x3e107
    .4byte 0x3c0412
    .4byte gUnknown_0895F5A5 + 0x3e10f
    .4byte 0x3c0411
    .4byte gUnknown_0895F5A5 + 0x3e117
    .4byte 0x3c0410
    .4byte gUnknown_0895F5A5 + 0x3e11f
    .4byte 0x3c0410
    .4byte gUnknown_0895F5A5 + 0x3e127
    .4byte 0x3c0411
    .4byte gUnknown_0895F5A5 + 0x3e12f
    .4byte 0x3c0412
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_0895F5A5 + 0x3e08f
    .4byte 0x410414
    .4byte gUnknown_0895F5A5 + 0x3e097
    .4byte 0x41040a
    .4byte gUnknown_0895F5A5 + 0x3e09f
    .4byte 0x41040c
    .4byte gUnknown_0895F5A5 + 0x3e0a7
    .4byte 0x410414
    .4byte gUnknown_0895F5A5 + 0x3e0af
    .4byte 0x41040a
    .4byte gUnknown_0895F5A5 + 0x3e0b7
    .4byte 0x41040c
    .4byte 0x0
    .4byte 0x0


