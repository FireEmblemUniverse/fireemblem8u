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

	.global gUnknown_0859D318
gUnknown_0859D318:  @ 0x0859D318
@ replacing .incbin "baserom.gba", 0x0059d318, 0x20
.4byte StealTargetSelection_OnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte sub_802423C
.4byte 0
.4byte sub_8024260
.4byte GenericSelection_BackToUM
.4byte 0

	.global gUnknown_0859D338
gUnknown_0859D338:  @ 0x0859D338
@ replacing .incbin "baserom.gba", 0x0059d338, 0x20
.4byte sub_8024868
.4byte ClearBg0Bg1
.4byte 0
.4byte nullsub_27
.4byte 0
.4byte sub_80244D8
.4byte GenericSelection_BackToUM
.4byte 0

	.global gUnknown_0859D358
gUnknown_0859D358:  @ 0x0859D358
@ replacing .incbin "baserom.gba", 0x0059d358, 0x20
.4byte sub_80248A8
.4byte ClearBg0Bg1
.4byte 0
.4byte 0
.4byte 0
.4byte sub_8023ED8
.4byte GenericSelection_BackToUM
.4byte 0

	.global gUnknown_0859D378
gUnknown_0859D378:  @ 0x0859D378
@ replacing .incbin "baserom.gba", 0x0059d378, 0x20
.4byte sub_80247B0
.4byte ClearBg0Bg1
.4byte 0
.4byte sub_80247D0
.4byte 0
.4byte sub_8023DA0
.4byte GenericSelection_BackToUM
.4byte 0

	.global gUnknown_0859D398
gUnknown_0859D398:  @ 0x0859D398
@ replacing .incbin "baserom.gba", 0x0059d398, 0x20
.4byte sub_80247B0
.4byte ClearBg0Bg1
.4byte 0
.4byte sub_80247D0
.4byte 0
.4byte sub_8023D00
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

	.global gUnknown_0859D3D8
gUnknown_0859D3D8:  @ 0x0859D3D8
@ replacing .incbin "baserom.gba", 0x0059d3d8, 0x20
.4byte TradeTargetSelection_OnInit
.4byte ClearBg0Bg1
.4byte 0
.4byte sub_8024788
.4byte 0
.4byte sub_8022FAC
.4byte GenericSelection_BackToUM
.4byte 0

	.global gUnknown_0859D3F8
gUnknown_0859D3F8:  @ 0x0859D3F8
@ replacing .incbin "baserom.gba", 0x0059d3f8, 0x20
.4byte NewBattleForecast
.4byte sub_8022F10
.4byte 0
.4byte sub_8022E8C
.4byte 0
.4byte sub_8022DF0
.4byte sub_8022E64
.4byte StartBattleForecastHelpBox

	.global gUnknown_0859D418
gUnknown_0859D418:  @ 0x0859D418
@ replacing .incbin "baserom.gba", 0x0059d418, 0x20
.4byte sub_80246E0
.4byte 0
.4byte 0
.4byte sub_8024700
.4byte 0
.4byte GiveSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gUnknown_0859D438
gUnknown_0859D438:  @ 0x0859D438
@ replacing .incbin "baserom.gba", 0x0059d438, 0x20
.4byte sub_8024724
.4byte 0
.4byte 0
.4byte sub_8024744
.4byte 0
.4byte TakeSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gUnknown_0859D458
gUnknown_0859D458:  @ 0x0859D458
@ replacing .incbin "baserom.gba", 0x0059d458, 0x20
.4byte DropSelection_OnConstruction
.4byte ClearBg0Bg1
.4byte 0
.4byte 0
.4byte 0
.4byte DropSelection_OnSelect
.4byte GenericSelection_BackToUM
.4byte 0

	.global gUnknown_0859D478
gUnknown_0859D478:  @ 0x0859D478
	.incbin "baserom.gba", 0x59D478, 0x440


