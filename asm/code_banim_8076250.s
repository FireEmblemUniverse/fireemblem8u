	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

    @ ekr popup & spell anim effect, etc

	THUMB_FUNC_START sub_8076250
sub_8076250: @ 0x08076250
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08076268
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _08076288
_08076268:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08076282
	adds r0, r4, #0
	movs r1, #2
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_08076282:
	adds r0, r4, #0
	bl Proc_Break
_08076288:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076250

	THUMB_FUNC_START sub_8076290
sub_8076290: @ 0x08076290
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _080762A2
	adds r0, r4, #0
	bl Proc_Break
	b _080762C8
_080762A2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080762C8
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_080762C8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076290

	THUMB_FUNC_START sub_80762D0
sub_80762D0: @ 0x080762D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _080762E8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08076308
_080762E8:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08076302
	adds r0, r4, #0
	movs r1, #2
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_08076302:
	adds r0, r4, #0
	bl Proc_Break
_08076308:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80762D0

	THUMB_FUNC_START sub_8076310
sub_8076310: @ 0x08076310
	push {lr}
	ldr r0, _08076324  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08076328
	movs r0, #0
	b _0807632A
	.align 2, 0
_08076324: .4byte gBattleStats
_08076328:
	movs r0, #1
_0807632A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8076310

	THUMB_FUNC_START BeginAnimsOnBattle_Hensei
BeginAnimsOnBattle_Hensei: @ 0x08076330
	push {lr}
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl sub_8052184
	ldr r1, _08076350  @ gUnknown_02017744
	str r0, [r1]
	bl NewEkrHenseiInitPROC
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08076350: .4byte gUnknown_02017744

	THUMB_FUNC_END BeginAnimsOnBattle_Hensei

	THUMB_FUNC_START sub_8076354
sub_8076354: @ 0x08076354
	push {lr}
	bl AnimClearAll
	bl sub_8076470
	ldr r0, _08076368  @ MainUpdate_8055C68
	bl SetMainUpdateRoutine
	pop {r0}
	bx r0
	.align 2, 0
_08076368: .4byte MainUpdate_8055C68

	THUMB_FUNC_END sub_8076354

	THUMB_FUNC_START NewEkrHenseiInitPROC
NewEkrHenseiInitPROC: @ 0x0807636C
	push {lr}
	ldr r0, _0807637C  @ ProcScr_ekrHenseiInit
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807637C: .4byte ProcScr_ekrHenseiInit

	THUMB_FUNC_END NewEkrHenseiInitPROC

	THUMB_FUNC_START sub_8076380
sub_8076380: @ 0x08076380
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl SetupOAMBufferSplice
	bl sub_8051CC4
	bl sub_80599E8
	bl NewEkrGauge
	bl NewEkrDispUP
	bl NewEkrBattle
	ldr r0, _080763D4  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl sub_8075AD8
	ldr r4, _080763D8  @ gPaletteBuffer
	ldr r1, _080763DC  @ gUnknown_020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl sub_80712B0
	bl EnablePaletteSync
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080763D4: .4byte gUnknown_0203E0FE
_080763D8: .4byte gPaletteBuffer
_080763DC: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8076380

	THUMB_FUNC_START sub_80763E0
sub_80763E0: @ 0x080763E0
	push {r4, lr}
	adds r4, r0, #0
	bl EkrGauge_80511A0
	bl sub_8051B28
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80763E0

	THUMB_FUNC_START sub_8076400
sub_8076400: @ 0x08076400
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0807645C  @ gUnknown_020165C8
	ldr r4, _08076460  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl sub_80712B0
	bl EnablePaletteSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _08076454
	adds r0, r6, #0
	bl Proc_Break
_08076454:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807645C: .4byte gUnknown_020165C8
_08076460: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8076400

	THUMB_FUNC_START sub_8076464
sub_8076464: @ 0x08076464
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076464

	THUMB_FUNC_START sub_8076470
sub_8076470: @ 0x08076470
	push {lr}
	ldr r0, _08076480  @ ProcScr_ekrHenseiEnd
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08076480: .4byte ProcScr_ekrHenseiEnd

	THUMB_FUNC_END sub_8076470

	THUMB_FUNC_START sub_8076484
sub_8076484: @ 0x08076484
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080764A8  @ gPaletteBuffer
	ldr r1, _080764AC  @ gUnknown_020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080764A8: .4byte gPaletteBuffer
_080764AC: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8076484

	THUMB_FUNC_START sub_80764B0
sub_80764B0: @ 0x080764B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0807650C  @ gUnknown_020165C8
	ldr r4, _08076510  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl sub_80712B0
	bl EnablePaletteSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _08076504
	adds r0, r6, #0
	bl Proc_Break
_08076504:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807650C: .4byte gUnknown_020165C8
_08076510: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80764B0

	THUMB_FUNC_START sub_8076514
sub_8076514: @ 0x08076514
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl EndEkrGauge
	ldr r0, _08076538  @ OnGameLoopMain
	bl SetMainUpdateRoutine
	ldr r0, _0807653C  @ OnVBlank
	bl SetInterrupt_LCDVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076538: .4byte OnGameLoopMain
_0807653C: .4byte OnVBlank

	THUMB_FUNC_END sub_8076514

	THUMB_FUNC_START sub_8076540
sub_8076540: @ 0x08076540
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_806FA28
	adds r6, r0, #0
	ldr r0, _0807658C  @ gUnknown_087F4324
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r4, [r6, #4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_806FA54
	str r5, [r6, #0xc]
	str r5, [r4, #0x5c]
	movs r1, #0
	strh r1, [r4, #0x2c]
	ldr r0, _08076590  @ gUnknown_03004FA8
	str r1, [r0]
	ldr r0, _08076594  @ gUnknown_03004FB0
	str r1, [r0]
	movs r0, #0
	bl sub_8077DB4
	movs r0, #0xe0
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807658C: .4byte gUnknown_087F4324
_08076590: .4byte gUnknown_03004FA8
_08076594: .4byte gUnknown_03004FB0

	THUMB_FUNC_END sub_8076540

	THUMB_FUNC_START sub_8076598
sub_8076598: @ 0x08076598
	bx lr

	THUMB_FUNC_END sub_8076598

	THUMB_FUNC_START sub_807659C
sub_807659C: @ 0x0807659C
	push {lr}
	bl GetAISSubjectId
	cmp r0, #0
	bne _080765B0
	ldr r0, _080765AC  @ gpEkrBattleUnitLeft
	b _080765B2
	.align 2, 0
_080765AC: .4byte gpEkrBattleUnitLeft
_080765B0:
	ldr r0, _080765C0  @ gpEkrBattleUnitRight
_080765B2:
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	cmp r0, #0xa8
	beq _080765C4
	movs r0, #0
	b _080765C6
	.align 2, 0
_080765C0: .4byte gpEkrBattleUnitRight
_080765C4:
	movs r0, #1
_080765C6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_807659C

	THUMB_FUNC_START sub_80765CC
sub_80765CC: @ 0x080765CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_8076910
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80765CC

	THUMB_FUNC_START sub_80765E4
sub_80765E4: @ 0x080765E4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	bl sub_807168C
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08076618
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08076618:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80765E4

	THUMB_FUNC_START sub_8076620
sub_8076620: @ 0x08076620
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0807663C  @ gUnknown_02019790
	lsrs r1, r0, #0x10
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
_0807662E:
	stm r2!, {r1}
	subs r0, #1
	cmp r0, #0
	bne _0807662E
	pop {r0}
	bx r0
	.align 2, 0
_0807663C: .4byte gUnknown_02019790

	THUMB_FUNC_END sub_8076620

	THUMB_FUNC_START sub_8076640
sub_8076640: @ 0x08076640
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0x20
	negs r1, r1
	movs r0, #0x2e
	ldrsh r3, [r6, r0]
	movs r4, #0x78
	str r4, [sp]
	movs r0, #5
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	movs r1, #0x50
	negs r1, r1
	movs r2, #0x2e
	ldrsh r3, [r6, r2]
	str r4, [sp]
	movs r0, #5
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	ldr r0, _0807668C  @ gUnknown_0201FB0C
	ldr r0, [r0]
	adds r0, r0, r5
	bl sub_806FB2C
	ldrh r1, [r6, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	cmp r0, #0x78
	bne _08076690
	adds r0, r6, #0
	bl Proc_Break
	b _08076694
	.align 2, 0
_0807668C: .4byte gUnknown_0201FB0C
_08076690:
	adds r0, r1, #1
	strh r0, [r6, #0x2e]
_08076694:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076640

	THUMB_FUNC_START sub_807669C
sub_807669C: @ 0x0807669C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_807659C
	cmp r0, #0
	beq _080766B4
	ldr r0, [r4, #0x5c]
	movs r1, #0xc2
	bl sub_80589E0
	b _080766BC
_080766B4:
	ldr r0, [r4, #0x5c]
	movs r1, #0xc1
	bl sub_80589E0
_080766BC:
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	bl sub_805A394
	ldr r1, _080766E0  @ gUnknown_0203E118
	movs r0, #0x40
	strh r0, [r1]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_806FA54
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080766E0: .4byte gUnknown_0203E118

	THUMB_FUNC_END sub_807669C

	THUMB_FUNC_START sub_80766E4
sub_80766E4: @ 0x080766E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl sub_8076620
	ldr r0, _08076774  @ 0x60016001
	bl sub_80559D0
	ldr r0, _08076778  @ gBG3TilemapBuffer
	movs r1, #1
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	ldr r0, _0807677C  @ gUnknown_087F4798
	ldr r1, _08076780  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08076784  @ gUnknown_087F798C
	ldr r1, _08076788  @ gUnknown_02019790
	bl CopyDataWithPossibleUncomp
	bl sub_806FBB8
	ldr r0, _0807678C  @ gUnknown_0201FB0C
	ldr r0, [r0]
	subs r0, #0x20
	movs r1, #0x50
	negs r1, r1
	bl sub_806FB2C
	ldr r3, _08076790  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x14]
	movs r0, #6
	bl sub_8013A84
	ldr r0, _08076794  @ gUnknown_087F85DC
	movs r1, #6
	movs r2, #0x78
	adds r3, r4, #0
	bl sub_8013928
	movs r0, #1
	bl sub_806FAA4
	movs r0, #0
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076774: .4byte 0x60016001
_08076778: .4byte gBG3TilemapBuffer
_0807677C: .4byte gUnknown_087F4798
_08076780: .4byte 0x06008000
_08076784: .4byte gUnknown_087F798C
_08076788: .4byte gUnknown_02019790
_0807678C: .4byte gUnknown_0201FB0C
_08076790: .4byte gLCDControlBuffer
_08076794: .4byte gUnknown_087F85DC

	THUMB_FUNC_END sub_80766E4

	THUMB_FUNC_START sub_8076798
sub_8076798: @ 0x08076798
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_806FA48
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	bl sub_806FA48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _080767EC
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _080767EC
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x50]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl sub_8070214
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080767DE
	ldr r0, [r4, #0x5c]
	bl sub_80772C0
	b _080767E4
_080767DE:
	ldr r0, [r4, #0x5c]
	bl sub_8077790
_080767E4:
	str r0, [r4, #0x50]
	adds r0, r4, #0
	bl Proc_Break
_080767EC:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076798

	THUMB_FUNC_START sub_80767F4
sub_80767F4: @ 0x080767F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x50]
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08076810
	adds r0, r1, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08076810:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80767F4

	THUMB_FUNC_START sub_8076818
sub_8076818: @ 0x08076818
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_806FAA4
	ldr r3, _08076890  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	bl sub_805A358
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08076894  @ gUnknown_0203E104
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	bl sub_80769A8
	ldr r0, _08076898  @ gBG3TilemapBuffer
	ldr r1, _0807689C  @ 0x0000601F
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	movs r0, #0x10
	bl sub_807168C
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076890: .4byte gLCDControlBuffer
_08076894: .4byte gUnknown_0203E104
_08076898: .4byte gBG3TilemapBuffer
_0807689C: .4byte 0x0000601F

	THUMB_FUNC_END sub_8076818

	THUMB_FUNC_START sub_80768A0
sub_80768A0: @ 0x080768A0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080768BE
	ldr r0, _080768F4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl UnpackChapterMapGraphics
	bl RenderBmMap
_080768BE:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl sub_807168C
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080768EC
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080768EC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080768F4: .4byte gPlaySt

	THUMB_FUNC_END sub_80768A0

	THUMB_FUNC_START sub_80768F8
sub_80768F8: @ 0x080768F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #8
	bl sub_806FA54
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80768F8

	THUMB_FUNC_START sub_8076910
sub_8076910: @ 0x08076910
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08076930  @ gUnknown_087F4394
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08076930: .4byte gUnknown_087F4394

	THUMB_FUNC_END sub_8076910

	THUMB_FUNC_START sub_8076934
sub_8076934: @ 0x08076934
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08076994  @ gUnknown_02020148
	ldr r4, _08076998  @ pPalette4Buffer
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl sub_80712B0
	bl EnablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0807698C
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0807698C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076994: .4byte gUnknown_02020148
_08076998: .4byte pPalette4Buffer

	THUMB_FUNC_END sub_8076934

	THUMB_FUNC_START sub_807699C
sub_807699C: @ 0x0807699C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807699C

	THUMB_FUNC_START sub_80769A8
sub_80769A8: @ 0x080769A8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080769FC  @ gUnknown_087F43B4
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r5, #0x2c]
	ldr r0, _08076A00  @ gBG2TilemapBuffer
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x20
	movs r3, #0
	bl FillBGRect
	ldr r0, _08076A04  @ gUnknown_0201FADC
	bl sub_805AA68
	ldr r4, _08076A08  @ pPalette4Buffer
	ldr r1, _08076A0C  @ gUnknown_02020148
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	movs r3, #0x10
	bl sub_80712B0
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080769FC: .4byte gUnknown_087F43B4
_08076A00: .4byte gBG2TilemapBuffer
_08076A04: .4byte gUnknown_0201FADC
_08076A08: .4byte pPalette4Buffer
_08076A0C: .4byte gUnknown_02020148

	THUMB_FUNC_END sub_80769A8

	THUMB_FUNC_START sub_8076A10
sub_8076A10: @ 0x08076A10
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08076A70  @ gUnknown_02020148
	ldr r4, _08076A74  @ pPalette4Buffer
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl sub_80712B0
	bl EnablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08076A68
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08076A68:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076A70: .4byte gUnknown_02020148
_08076A74: .4byte pPalette4Buffer

	THUMB_FUNC_END sub_8076A10

	THUMB_FUNC_START sub_8076A78
sub_8076A78: @ 0x08076A78
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076A78

	THUMB_FUNC_START sub_8076A84
sub_8076A84: @ 0x08076A84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_8076AA4
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_806FA54
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076A84

	THUMB_FUNC_START sub_8076AA4
sub_8076AA4: @ 0x08076AA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08076ACC  @ gUnknown_087F43D4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	ldr r1, _08076AD0  @ gUnknown_087F43EC
	str r1, [r0, #0x4c]
	movs r1, #1
	negs r1, r1
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08076ACC: .4byte gUnknown_087F43D4
_08076AD0: .4byte gUnknown_087F43EC

	THUMB_FUNC_END sub_8076AA4

	THUMB_FUNC_START sub_8076AD4
sub_8076AD4: @ 0x08076AD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	bl sub_806FAB0
	cmp r0, #0
	beq _08076B38
	ldr r0, _08076B20  @ gUnknown_02000028
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _08076B24  @ gUnknown_02017760
	movs r3, #0
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	ldr r6, _08076B28  @ gUnknown_0201FB0C
	ldr r0, [r6]
	subs r1, r1, r0
	ldr r5, _08076B2C  @ gUnknown_03004FA0
	ldr r0, [r5]
	subs r1, r1, r0
	mov r9, r1
	ldr r4, _08076B30  @ gUnknown_0200002C
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	ldr r3, _08076B34  @ gUnknown_03004FA4
	ldr r0, [r3]
	subs r7, r1, r0
	mov r0, r8
	mov r8, r6
	b _08076B64
	.align 2, 0
_08076B20: .4byte gUnknown_02000028
_08076B24: .4byte gUnknown_02017760
_08076B28: .4byte gUnknown_0201FB0C
_08076B2C: .4byte gUnknown_03004FA0
_08076B30: .4byte gUnknown_0200002C
_08076B34: .4byte gUnknown_03004FA4
_08076B38:
	ldr r5, _08076BB0  @ gUnknown_02000028
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r2, _08076BB4  @ gUnknown_02017760
	movs r6, #0
	ldrsh r0, [r2, r6]
	adds r1, r1, r0
	ldr r4, _08076BB8  @ gUnknown_0201FB0C
	ldr r0, [r4]
	subs r1, r1, r0
	mov r9, r1
	ldr r3, _08076BBC  @ gUnknown_0200002C
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r6, #2
	ldrsh r0, [r2, r6]
	subs r7, r1, r0
	adds r0, r5, #0
	mov r8, r4
	ldr r5, _08076BC0  @ gUnknown_03004FA0
	adds r4, r3, #0
	ldr r3, _08076BC4  @ gUnknown_03004FA4
_08076B64:
	movs r1, #2
	ldrsh r0, [r0, r1]
	movs r6, #0
	ldrsh r1, [r2, r6]
	adds r0, r0, r1
	mov r6, r8
	ldr r1, [r6]
	subs r0, r0, r1
	ldr r1, [r5]
	subs r5, r0, r1
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r4, #2
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	ldr r1, [r3]
	subs r4, r0, r1
	ldr r0, _08076BC8  @ gUnknown_0203E120
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, #0
	bne _08076BCC
	mov r0, r9
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
	b _08076C00
	.align 2, 0
_08076BB0: .4byte gUnknown_02000028
_08076BB4: .4byte gUnknown_02017760
_08076BB8: .4byte gUnknown_0201FB0C
_08076BBC: .4byte gUnknown_0200002C
_08076BC0: .4byte gUnknown_03004FA0
_08076BC4: .4byte gUnknown_03004FA4
_08076BC8: .4byte gUnknown_0203E120
_08076BCC:
	cmp r0, #0
	blt _08076C00
	cmp r0, #2
	bgt _08076C00
	mov r1, sl
	ldr r0, [r1, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08076BF2
	mov r2, r9
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	b _08076C00
_08076BF2:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
_08076C00:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076AD4

	THUMB_FUNC_START sub_8076C10
sub_8076C10: @ 0x08076C10
	movs r2, #0
	str r2, [r0, #0x54]
	ldr r1, _08076C2C  @ gUnknown_02000028
	movs r3, #0
	ldrsh r1, [r1, r3]
	str r1, [r0, #0x58]
	ldr r1, _08076C30  @ gUnknown_0200002C
	movs r3, #0
	ldrsh r1, [r1, r3]
	str r1, [r0, #0x5c]
	adds r0, #0x64
	strh r2, [r0]
	bx lr
	.align 2, 0
_08076C2C: .4byte gUnknown_02000028
_08076C30: .4byte gUnknown_0200002C

	THUMB_FUNC_END sub_8076C10

	THUMB_FUNC_START sub_8076C34
sub_8076C34: @ 0x08076C34
	push {lr}
	ldr r2, _08076C4C  @ gUnknown_02000028
	ldr r1, [r0, #0x58]
	strh r1, [r2]
	ldr r2, _08076C50  @ gUnknown_0200002C
	ldr r1, [r0, #0x5c]
	strh r1, [r2]
	ldr r0, [r0, #0x4c]
	bl sub_8076AD4
	pop {r0}
	bx r0
	.align 2, 0
_08076C4C: .4byte gUnknown_02000028
_08076C50: .4byte gUnknown_0200002C

	THUMB_FUNC_END sub_8076C34

	THUMB_FUNC_START sub_8076C54
sub_8076C54: @ 0x08076C54
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x4c]
	ldr r0, [r0, #0x5c]
	bl GetCoreAIStruct
	movs r1, #0
	add r0, sp, #4
	strh r1, [r0]
	mov r5, sp
	adds r5, #6
	strh r1, [r5]
	ldr r0, [r6, #0x54]
	subs r0, #0x12
	cmp r0, #0x27
	bhi _08076CAA
	adds r4, r6, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r2, [r4, r0]
	add r0, sp, #4
	adds r1, r5, #0
	movs r3, #1
	bl sub_8077D80
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl sub_8077DB4
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl sub_8077C54
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_08076CAA:
	add r3, sp, #4
	adds r2, r3, #0
	ldr r0, _08076CDC  @ gUnknown_0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r3]
	adds r0, r2, #0
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl sub_806FB2C
	ldr r3, [r6, #0x54]
	cmp r3, #0x1e
	ble _08076CE8
	ldr r1, _08076CE0  @ gUnknown_03004FA8
	movs r0, #0x38
	negs r0, r0
	str r0, [r1]
	ldr r1, _08076CE4  @ gUnknown_03004FB0
	movs r0, #0x10
	b _08076D0C
	.align 2, 0
_08076CDC: .4byte gUnknown_0201FB0C
_08076CE0: .4byte gUnknown_03004FA8
_08076CE4: .4byte gUnknown_03004FB0
_08076CE8:
	movs r2, #0x38
	negs r2, r2
	movs r4, #0x1e
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	bl Interpolate
	ldr r1, _08076D44  @ gUnknown_03004FA8
	str r0, [r1]
	ldr r3, [r6, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r1, _08076D48  @ gUnknown_03004FB0
_08076D0C:
	str r0, [r1]
	ldr r2, _08076D4C  @ gUnknown_02000028
	ldr r0, [r6, #0x58]
	ldr r1, _08076D44  @ gUnknown_03004FA8
	ldr r1, [r1]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r2, _08076D50  @ gUnknown_0200002C
	ldr r0, [r6, #0x5c]
	ldr r1, _08076D48  @ gUnknown_03004FB0
	ldr r1, [r1]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r0, [r6, #0x4c]
	bl sub_8076AD4
	ldr r0, [r6, #0x54]
	cmp r0, #0x31
	ble _08076D54
	movs r0, #0
	str r0, [r6, #0x54]
	movs r1, #0
	bl sub_8077DB4
	adds r0, r6, #0
	bl Proc_Break
	b _08076D58
	.align 2, 0
_08076D44: .4byte gUnknown_03004FA8
_08076D48: .4byte gUnknown_03004FB0
_08076D4C: .4byte gUnknown_02000028
_08076D50: .4byte gUnknown_0200002C
_08076D54:
	adds r0, #1
	str r0, [r6, #0x54]
_08076D58:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076C54

	THUMB_FUNC_START sub_8076D60
sub_8076D60: @ 0x08076D60
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0x38
	negs r1, r1
	ldr r3, [r6, #0x54]
	movs r4, #0xa
	str r4, [sp]
	movs r0, #0
	movs r2, #8
	bl Interpolate
	ldr r5, _08076DC8  @ gUnknown_03004FA8
	str r0, [r5]
	movs r2, #8
	negs r2, r2
	ldr r3, [r6, #0x54]
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	bl Interpolate
	ldr r4, _08076DCC  @ gUnknown_03004FB0
	str r0, [r4]
	ldr r0, _08076DD0  @ gUnknown_0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_806FB2C
	ldr r2, _08076DD4  @ gUnknown_02000028
	ldr r0, [r6, #0x58]
	ldr r1, [r5]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r2, _08076DD8  @ gUnknown_0200002C
	ldr r0, [r6, #0x5c]
	ldr r1, [r4]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r0, [r6, #0x4c]
	bl sub_8076AD4
	ldr r0, [r6, #0x54]
	cmp r0, #9
	ble _08076DDC
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl Proc_Break
	b _08076DE0
	.align 2, 0
_08076DC8: .4byte gUnknown_03004FA8
_08076DCC: .4byte gUnknown_03004FB0
_08076DD0: .4byte gUnknown_0201FB0C
_08076DD4: .4byte gUnknown_02000028
_08076DD8: .4byte gUnknown_0200002C
_08076DDC:
	adds r0, #1
	str r0, [r6, #0x54]
_08076DE0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076D60

	THUMB_FUNC_START sub_8076DE8
sub_8076DE8: @ 0x08076DE8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80522CC
	cmp r0, #1
	bne _08076DFA
	adds r0, r4, #0
	bl Proc_Break
_08076DFA:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076DE8

	THUMB_FUNC_START sub_8076E00
sub_8076E00: @ 0x08076E00
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r3, [r6, #0x54]
	movs r4, #0x14
	str r4, [sp]
	movs r0, #5
	movs r1, #8
	movs r2, #0
	bl Interpolate
	ldr r5, _08076E64  @ gUnknown_03004FA8
	str r0, [r5]
	movs r1, #8
	negs r1, r1
	ldr r3, [r6, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r2, #0
	bl Interpolate
	ldr r4, _08076E68  @ gUnknown_03004FB0
	str r0, [r4]
	ldr r0, _08076E6C  @ gUnknown_0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_806FB2C
	ldr r2, _08076E70  @ gUnknown_02000028
	ldr r0, [r6, #0x58]
	ldr r1, [r5]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r2, _08076E74  @ gUnknown_0200002C
	ldr r0, [r6, #0x5c]
	ldr r1, [r4]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r0, [r6, #0x4c]
	bl sub_8076AD4
	ldr r0, [r6, #0x54]
	cmp r0, #0x13
	ble _08076E78
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl Proc_Break
	b _08076E7C
	.align 2, 0
_08076E64: .4byte gUnknown_03004FA8
_08076E68: .4byte gUnknown_03004FB0
_08076E6C: .4byte gUnknown_0201FB0C
_08076E70: .4byte gUnknown_02000028
_08076E74: .4byte gUnknown_0200002C
_08076E78:
	adds r0, #1
	str r0, [r6, #0x54]
_08076E7C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076E00

	THUMB_FUNC_START sub_8076E84
sub_8076E84: @ 0x08076E84
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r3, [r6, #0x54]
	movs r4, #0x32
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0
	bl Interpolate
	ldr r5, _08076EE8  @ gUnknown_03004FA8
	str r0, [r5]
	ldr r3, [r6, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0
	bl Interpolate
	ldr r4, _08076EEC  @ gUnknown_03004FB0
	str r0, [r4]
	ldr r0, _08076EF0  @ gUnknown_0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_806FB2C
	ldr r2, _08076EF4  @ gUnknown_02000028
	ldr r0, [r6, #0x58]
	ldr r1, [r5]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r2, _08076EF8  @ gUnknown_0200002C
	ldr r0, [r6, #0x5c]
	ldr r1, [r4]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r0, [r6, #0x4c]
	bl sub_8076AD4
	ldr r0, [r6, #0x54]
	cmp r0, #0x31
	ble _08076EFC
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl Proc_Break
	b _08076F00
	.align 2, 0
_08076EE8: .4byte gUnknown_03004FA8
_08076EEC: .4byte gUnknown_03004FB0
_08076EF0: .4byte gUnknown_0201FB0C
_08076EF4: .4byte gUnknown_02000028
_08076EF8: .4byte gUnknown_0200002C
_08076EFC:
	adds r0, #1
	str r0, [r6, #0x54]
_08076F00:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076E84

	THUMB_FUNC_START sub_8076F08
sub_8076F08: @ 0x08076F08
	movs r1, #0
	str r1, [r0, #0x54]
	ldr r1, _08076F20  @ gUnknown_02000028
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x58]
	ldr r1, _08076F24  @ gUnknown_0200002C
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x5c]
	bx lr
	.align 2, 0
_08076F20: .4byte gUnknown_02000028
_08076F24: .4byte gUnknown_0200002C

	THUMB_FUNC_END sub_8076F08

	THUMB_FUNC_START sub_8076F28
sub_8076F28: @ 0x08076F28
	push {lr}
	ldr r2, _08076F40  @ gUnknown_02000028
	ldr r1, [r0, #0x58]
	strh r1, [r2]
	ldr r2, _08076F44  @ gUnknown_0200002C
	ldr r1, [r0, #0x5c]
	strh r1, [r2]
	ldr r0, [r0, #0x4c]
	bl sub_8076AD4
	pop {r0}
	bx r0
	.align 2, 0
_08076F40: .4byte gUnknown_02000028
_08076F44: .4byte gUnknown_0200002C

	THUMB_FUNC_END sub_8076F28

	THUMB_FUNC_START sub_8076F48
sub_8076F48: @ 0x08076F48
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r2, #0x14
	negs r2, r2
	ldr r3, [r6, #0x54]
	movs r4, #5
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	bl Interpolate
	ldr r5, _08076FB0  @ gUnknown_03004FA8
	str r0, [r5]
	movs r2, #0xa
	negs r2, r2
	ldr r3, [r6, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	bl Interpolate
	ldr r4, _08076FB4  @ gUnknown_03004FB0
	str r0, [r4]
	ldr r0, _08076FB8  @ gUnknown_0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_806FB2C
	ldr r2, _08076FBC  @ gUnknown_02000028
	ldr r0, [r6, #0x58]
	ldr r1, [r5]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r2, _08076FC0  @ gUnknown_0200002C
	ldr r0, [r6, #0x5c]
	ldr r1, [r4]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r0, [r6, #0x4c]
	bl sub_8076AD4
	ldr r0, [r6, #0x54]
	cmp r0, #4
	ble _08076FC4
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl Proc_Break
	b _08076FC8
	.align 2, 0
_08076FB0: .4byte gUnknown_03004FA8
_08076FB4: .4byte gUnknown_03004FB0
_08076FB8: .4byte gUnknown_0201FB0C
_08076FBC: .4byte gUnknown_02000028
_08076FC0: .4byte gUnknown_0200002C
_08076FC4:
	adds r0, #1
	str r0, [r6, #0x54]
_08076FC8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076F48

	THUMB_FUNC_START sub_8076FD0
sub_8076FD0: @ 0x08076FD0
	bx lr

	THUMB_FUNC_END sub_8076FD0

	THUMB_FUNC_START sub_8076FD4
sub_8076FD4: @ 0x08076FD4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0x14
	negs r1, r1
	ldr r3, [r6, #0x54]
	movs r4, #4
	str r4, [sp]
	movs r0, #5
	movs r2, #0
	bl Interpolate
	ldr r5, _0807703C  @ gUnknown_03004FA8
	str r0, [r5]
	movs r1, #0xa
	negs r1, r1
	ldr r3, [r6, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r2, #0
	bl Interpolate
	ldr r4, _08077040  @ gUnknown_03004FB0
	str r0, [r4]
	ldr r0, _08077044  @ gUnknown_0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_806FB2C
	ldr r2, _08077048  @ gUnknown_02000028
	ldr r0, [r6, #0x58]
	ldr r1, [r5]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r2, _0807704C  @ gUnknown_0200002C
	ldr r0, [r6, #0x5c]
	ldr r1, [r4]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r0, [r6, #0x4c]
	bl sub_8076AD4
	ldr r0, [r6, #0x54]
	cmp r0, #3
	ble _08077050
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl Proc_Break
	b _08077054
	.align 2, 0
_0807703C: .4byte gUnknown_03004FA8
_08077040: .4byte gUnknown_03004FB0
_08077044: .4byte gUnknown_0201FB0C
_08077048: .4byte gUnknown_02000028
_0807704C: .4byte gUnknown_0200002C
_08077050:
	adds r0, #1
	str r0, [r6, #0x54]
_08077054:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076FD4

	THUMB_FUNC_START sub_807705C
sub_807705C: @ 0x0807705C
	push {lr}
	bl sub_806FA6C
	cmp r0, #2
	bne _08077072
	ldr r0, _08077078  @ gUnknown_087F43D4
	bl Proc_Find
	movs r1, #1
	negs r1, r1
	str r1, [r0, #0x54]
_08077072:
	pop {r0}
	bx r0
	.align 2, 0
_08077078: .4byte gUnknown_087F43D4

	THUMB_FUNC_END sub_807705C

	THUMB_FUNC_START sub_807707C
sub_807707C: @ 0x0807707C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r0, r1
	beq _080770F0
	adds r2, r1, #0
	str r2, [r4, #0x54]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	str r0, [r4, #0x44]
	cmp r2, #9
	bhi _080770F0
	lsls r0, r2, #2
	ldr r1, _080770A4  @ _080770A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080770A4: .4byte _080770A8
_080770A8: @ jump table
	.4byte _080770D0 @ case 0
	.4byte _080770D0 @ case 1
	.4byte _080770D0 @ case 2
	.4byte _080770D0 @ case 3
	.4byte _080770E4 @ case 4
	.4byte _080770E4 @ case 5
	.4byte _080770EC @ case 6
	.4byte _080770EC @ case 7
	.4byte _080770EC @ case 8
	.4byte _080770D0 @ case 9
_080770D0:
	ldr r0, _080770E0  @ gUnknown_080E8318
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x5c]
	adds r1, r2, #0
	bl sub_80771C8
	b _080770F0
	.align 2, 0
_080770E0: .4byte gUnknown_080E8318
_080770E4:
	ldr r0, _080770E8  @ gUnknown_080E838E
	b _080770EE
	.align 2, 0
_080770E8: .4byte gUnknown_080E838E
_080770EC:
	ldr r0, _08077124  @ gUnknown_080E8318
_080770EE:
	str r0, [r4, #0x48]
_080770F0:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08077130
	ldr r1, [r4, #0x4c]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08077128  @ gUnknown_02019790
	bl LZ77UnCompWram
	bl sub_806FBB8
	ldr r0, _0807712C  @ gUnknown_0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_806FB2C
	b _080771C2
	.align 2, 0
_08077124: .4byte gUnknown_080E8318
_08077128: .4byte gUnknown_02019790
_0807712C: .4byte gUnknown_0201FB0C
_08077130:
	movs r0, #5
	negs r0, r0
	cmp r2, r0
	beq _0807717C
	cmp r2, r0
	bgt _08077144
	subs r0, #1
	cmp r2, r0
	beq _0807714E
	b _080771C2
_08077144:
	movs r0, #4
	negs r0, r0
	cmp r2, r0
	beq _080771A0
	b _080771C2
_0807714E:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08077168
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	ldrh r1, [r0, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080771C2
	b _080771A8
_08077168:
	bl sub_80522CC
	cmp r0, #1
	bne _080771C2
	ldr r0, _08077178  @ gUnknown_087F44B0
	bl Proc_BreakEach
	b _080771B6
	.align 2, 0
_08077178: .4byte gUnknown_087F44B0
_0807717C:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080771A8
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080771C2
	ldr r0, _0807719C  @ gUnknown_087F44B0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x4c]
	b _080771B6
	.align 2, 0
_0807719C: .4byte gUnknown_087F44B0
_080771A0:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080771AE
_080771A8:
	movs r0, #1
	strh r0, [r4, #0x2e]
	b _080771C2
_080771AE:
	bl sub_80522CC
	cmp r0, #1
	bne _080771C2
_080771B6:
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080771C2:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807707C

	THUMB_FUNC_START sub_80771C8
sub_80771C8: @ 0x080771C8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080771E0  @ gUnknown_087F44E0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x44]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080771E0: .4byte gUnknown_087F44E0

	THUMB_FUNC_END sub_80771C8

	THUMB_FUNC_START sub_80771E4
sub_80771E4: @ 0x080771E4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080771FC
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080772B0
_080771FC:
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08077224  @ gUnknown_087F43D4
	bl Proc_Find
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	str r0, [r4, #0x44]
	ldr r0, [r5, #0x44]
	cmp r0, #9
	bhi _080772B0
	lsls r0, r0, #2
	ldr r1, _08077228  @ _0807722C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077224: .4byte gUnknown_087F43D4
_08077228: .4byte _0807722C
_0807722C: @ jump table
	.4byte _08077254 @ case 0
	.4byte _08077280 @ case 1
	.4byte _08077254 @ case 2
	.4byte _08077280 @ case 3
	.4byte _080772B0 @ case 4
	.4byte _080772B0 @ case 5
	.4byte _080772B0 @ case 6
	.4byte _080772B0 @ case 7
	.4byte _080772B0 @ case 8
	.4byte _08077254 @ case 9
_08077254:
	ldr r0, [r5, #0x5c]
	bl sub_807659C
	cmp r0, #0
	beq _08077268
	ldr r0, _08077264  @ gUnknown_080E831E
	str r0, [r4, #0x48]
	b _080772B0
	.align 2, 0
_08077264: .4byte gUnknown_080E831E
_08077268:
	ldr r0, _08077278  @ gUnknown_080E834E
	str r0, [r4, #0x48]
	ldr r0, _0807727C  @ gUnknown_087F4458
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x4c]
	b _080772B0
	.align 2, 0
_08077278: .4byte gUnknown_080E834E
_0807727C: .4byte gUnknown_087F4458
_08077280:
	ldr r0, [r5, #0x5c]
	bl sub_807659C
	cmp r0, #0
	beq _0807729C
	ldr r0, _08077298  @ gUnknown_080E8334
	str r0, [r4, #0x48]
	ldr r0, [r5, #0x5c]
	bl sub_8078044
	b _080772B0
	.align 2, 0
_08077298: .4byte gUnknown_080E8334
_0807729C:
	ldr r0, _080772B8  @ gUnknown_080E836C
	str r0, [r4, #0x48]
	ldr r0, _080772BC  @ gUnknown_087F43F8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x4c]
	ldr r0, [r5, #0x5c]
	bl sub_8078044
_080772B0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080772B8: .4byte gUnknown_080E836C
_080772BC: .4byte gUnknown_087F43F8

	THUMB_FUNC_END sub_80771E4

	THUMB_FUNC_START sub_80772C0
sub_80772C0: @ 0x080772C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080772E0  @ gUnknown_087F44F8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x29
	strb r2, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080772E0: .4byte gUnknown_087F44F8

	THUMB_FUNC_END sub_80772C0

	THUMB_FUNC_START sub_80772E4
sub_80772E4: @ 0x080772E4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08077308  @ gUnknown_080E1164
	ldr r4, _0807730C  @ pPalette4Buffer
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl sub_80712B0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077308: .4byte gUnknown_080E1164
_0807730C: .4byte pPalette4Buffer

	THUMB_FUNC_END sub_80772E4

	THUMB_FUNC_START sub_8077310
sub_8077310: @ 0x08077310
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08077388  @ gUnknown_087F85DC
	ldr r4, _0807738C  @ pPalette6Buffer
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08077390  @ gUnknown_02000054
	ldr r0, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r2, #8
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r5, #0
	bl sub_80712B0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r5, #0
	bl sub_80712B0
	bl EnablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08077380
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08077380:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077388: .4byte gUnknown_087F85DC
_0807738C: .4byte pPalette6Buffer
_08077390: .4byte gUnknown_02000054

	THUMB_FUNC_END sub_8077310

	THUMB_FUNC_START sub_8077394
sub_8077394: @ 0x08077394
	bx lr

	THUMB_FUNC_END sub_8077394

	THUMB_FUNC_START sub_8077398
sub_8077398: @ 0x08077398
	push {lr}
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_8077AAC
	ldr r0, _080773B8  @ 0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
	pop {r0}
	bx r0
	.align 2, 0
_080773B8: .4byte 0x00000147

	THUMB_FUNC_END sub_8077398

	THUMB_FUNC_START sub_80773BC
sub_80773BC: @ 0x080773BC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r2, #0x2c]
	ldr r0, _080773DC  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080773D6
	ldr r0, _080773E0  @ 0x0000FFE0
_080773D6:
	strh r0, [r2, #0x32]
	pop {r0}
	bx r0
	.align 2, 0
_080773DC: .4byte gUnknown_0203E120
_080773E0: .4byte 0x0000FFE0

	THUMB_FUNC_END sub_80773BC

	THUMB_FUNC_START sub_80773E4
sub_80773E4: @ 0x080773E4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	mov r4, sp
	adds r4, #2
	movs r0, #0x2c
	ldrsh r2, [r5, r0]
	mov r0, sp
	adds r1, r4, #0
	movs r3, #0
	bl sub_8077D80
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl sub_8077DB4
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r0, #0xf0
	lsls r0, r0, #1
	cmp r1, r0
	bne _08077436
	ldr r4, _08077458  @ gUnknown_0859A120
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0xf0
	adds r3, r5, #0
	bl sub_8013928
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xf0
	adds r3, r5, #0
	bl sub_8013928
_08077436:
	ldr r0, _0807745C  @ gUnknown_08801810
	bl Proc_Find
	cmp r0, #0
	bne _0807744E
	movs r0, #0
	movs r1, #0
	bl sub_8077DB4
	adds r0, r5, #0
	bl Proc_Break
_0807744E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077458: .4byte gUnknown_0859A120
_0807745C: .4byte gUnknown_08801810

	THUMB_FUNC_END sub_80773E4

	THUMB_FUNC_START sub_8077460
sub_8077460: @ 0x08077460
	push {lr}
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077460

	THUMB_FUNC_START sub_8077474
sub_8077474: @ 0x08077474
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	asrs r5, r5, #3
	asrs r4, r4, #3
	ldr r0, _08077500  @ gUnknown_087F798C
	ldr r6, _08077504  @ gUnknown_02019790
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r6, r1
	lsls r5, r5, #1
	lsls r2, r4, #5
	adds r2, r2, r4
	lsls r2, r2, #2
	ldr r7, _08077508  @ gUnknown_0201D428
	adds r2, r2, r7
	adds r2, r5, r2
	movs r1, #0x20
	mov sl, r1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #6
	mov r9, r1
	str r1, [sp, #8]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #0xc]
	subs r1, #1
	movs r3, #0x42
	bl sub_8070FA4
	adds r4, #2
	lsls r0, r4, #5
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r5, r5, r0
	mov r0, sl
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	mov r1, r9
	str r1, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #1
	negs r1, r1
	adds r2, r5, #0
	movs r3, #0x42
	bl sub_8070FA4
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077500: .4byte gUnknown_087F798C
_08077504: .4byte gUnknown_02019790
_08077508: .4byte gUnknown_0201D428

	THUMB_FUNC_END sub_8077474

	THUMB_FUNC_START sub_807750C
sub_807750C: @ 0x0807750C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r3, r0, #0
	adds r2, r1, #0
	asrs r4, r3, #3
	movs r1, #7
	asrs r5, r2, #3
	ands r2, r1
	movs r0, #3
	ands r1, r3
	bl BG_SetPosition
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08077558  @ gUnknown_0201D428
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r2, _0807755C  @ gBG3TilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_8070EF4
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077558: .4byte gUnknown_0201D428
_0807755C: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_807750C

	THUMB_FUNC_START sub_8077560
sub_8077560: @ 0x08077560
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08077580  @ gUnknown_087F4518
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #1
	bl Sound_FadeOutBGM
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08077580: .4byte gUnknown_087F4518

	THUMB_FUNC_END sub_8077560

	THUMB_FUNC_START sub_8077584
sub_8077584: @ 0x08077584
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08077598  @ gUnknown_087F4548
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08077598: .4byte gUnknown_087F4548

	THUMB_FUNC_END sub_8077584

	THUMB_FUNC_START sub_807759C
sub_807759C: @ 0x0807759C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _080775DC  @ gUnknown_087F4184
	ldr r0, _080775E0  @ gUnknown_088017E0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _080775E4  @ gUnknown_087FF488
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim
	ldr r0, [r5, #0x5c]
	str r4, [sp]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_80555B0
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	movs r2, #0
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	strh r2, [r5, #0x2c]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080775DC: .4byte gUnknown_087F4184
_080775E0: .4byte gUnknown_088017E0
_080775E4: .4byte gUnknown_087FF488

	THUMB_FUNC_END sub_807759C

	THUMB_FUNC_START sub_80775E8
sub_80775E8: @ 0x080775E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldrh r0, [r4, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0807761A
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	adds r0, r4, #0
	bl sub_8077620
_0807761A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80775E8

	THUMB_FUNC_START sub_8077620
sub_8077620: @ 0x08077620
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08077660  @ gUnknown_087F4314
	ldr r0, _08077664  @ gUnknown_088017E0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _08077668  @ gUnknown_0880064C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim
	ldr r0, [r5, #0x5c]
	str r4, [sp]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_80555B0
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	movs r2, #0
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	strh r2, [r5, #0x2c]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077660: .4byte gUnknown_087F4314
_08077664: .4byte gUnknown_088017E0
_08077668: .4byte gUnknown_0880064C

	THUMB_FUNC_END sub_8077620

	THUMB_FUNC_START sub_807766C
sub_807766C: @ 0x0807766C
	ldr r2, [r0, #0x60]
	ldrh r1, [r0, #0x32]
	strh r1, [r2, #2]
	ldrh r0, [r0, #0x3a]
	strh r0, [r2, #4]
	bx lr

	THUMB_FUNC_END sub_807766C

	THUMB_FUNC_START sub_8077678
sub_8077678: @ 0x08077678
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077678

	THUMB_FUNC_START sub_8077684
sub_8077684: @ 0x08077684
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldrh r0, [r2, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _080776AA
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_080776AA:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077684

	THUMB_FUNC_START sub_80776B0
sub_80776B0: @ 0x080776B0
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldrh r0, [r2, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _080776D4
	adds r0, r2, #0
	bl Proc_Break
_080776D4:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80776B0

	THUMB_FUNC_START sub_80776D8
sub_80776D8: @ 0x080776D8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	asrs r4, r4, #3
	asrs r5, r5, #3
	movs r0, #0
	bl sub_80559D0
	ldr r0, _08077734  @ gUnknown_02019790
	mov r8, r0
	adds r0, r6, #0
	mov r1, r8
	bl LZ77UnCompWram
	movs r1, #1
	negs r1, r1
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r2, _08077738  @ gUnknown_0201D428
	adds r0, r0, r2
	adds r4, r4, r0
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	mov r0, r8
	adds r2, r4, #0
	movs r3, #0x42
	bl sub_8070FA4
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077734: .4byte gUnknown_02019790
_08077738: .4byte gUnknown_0201D428

	THUMB_FUNC_END sub_80776D8

	THUMB_FUNC_START sub_807773C
sub_807773C: @ 0x0807773C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r3, r0, #0
	adds r2, r1, #0
	asrs r4, r3, #3
	movs r1, #7
	asrs r5, r2, #3
	ands r2, r1
	movs r0, #3
	ands r1, r3
	bl BG_SetPosition
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08077788  @ gUnknown_0201D428
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r2, _0807778C  @ gBG3TilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_8070EF4
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077788: .4byte gUnknown_0201D428
_0807778C: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_807773C

	THUMB_FUNC_START sub_8077790
sub_8077790: @ 0x08077790
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080777BC  @ gUnknown_087F4578
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r5, #0x2c]
	ldr r0, _080777C0  @ gUnknown_0203E120
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _080777C8
	ldr r0, _080777C4  @ 0x0000FFF8
	b _080777CA
	.align 2, 0
_080777BC: .4byte gUnknown_087F4578
_080777C0: .4byte gUnknown_0203E120
_080777C4: .4byte 0x0000FFF8
_080777C8:
	ldr r0, _080777DC  @ 0x0000FFE0
_080777CA:
	strh r0, [r5, #0x32]
	movs r0, #1
	bl Sound_FadeOutBGM
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080777DC: .4byte 0x0000FFE0

	THUMB_FUNC_END sub_8077790

	THUMB_FUNC_START sub_80777E0
sub_80777E0: @ 0x080777E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0807780C
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_8077AAC
	ldr r0, _08077894  @ 0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
_0807780C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x23
	bne _0807782C
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_8077AAC
	ldr r0, _08077894  @ 0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
_0807782C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x32
	bne _0807784C
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_8077AAC
	ldr r0, _08077894  @ 0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
_0807784C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x36
	bne _08077874
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	bl sub_805A358
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #8
	negs r1, r1
	ldr r2, _08077898  @ gUnknown_087F798C
	bl sub_80776D8
	movs r0, #0
	movs r1, #0
	bl sub_807773C
_08077874:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x64
	bne _0807788C
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x5c]
	bl sub_8077560
_0807788C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077894: .4byte 0x00000147
_08077898: .4byte gUnknown_087F798C

	THUMB_FUNC_END sub_80777E0

	THUMB_FUNC_START sub_807789C
sub_807789C: @ 0x0807789C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r7, #0
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r0, #0xc5
	lsls r0, r0, #1
	cmp r1, r0
	bgt _080778BC
	ldr r1, _08077A8C  @ gUnknown_02017760
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_807773C
_080778BC:
	ldr r5, _08077A8C  @ gUnknown_02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r6, _08077A90  @ gUnknown_02000038
	ldrh r1, [r6]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r6, #2]
	ldrh r0, [r5, #2]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl sub_8077EAC
	ldrh r0, [r6]
	ldrh r1, [r5]
	adds r0, r0, r1
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r6]
	ldrh r1, [r5]
	adds r0, r0, r1
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08077950
	movs r0, #0xc
	movs r1, #0
	bl sub_8053678
	str r0, [r4, #0x54]
	movs r0, #0xa1
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
_08077950:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	bne _08077968
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xd
	movs r1, #0
	bl sub_8053678
	str r0, [r4, #0x54]
_08077968:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xb4
	bne _08077980
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xe
	movs r1, #0
	bl sub_8053678
	str r0, [r4, #0x54]
_08077980:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0xe6
	bne _080779A6
	strh r7, [r4, #0x3a]
	strh r7, [r4, #0x3c]
	ldr r0, [r4, #0x5c]
	bl sub_8077584
	str r0, [r4, #0x64]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #0x32]
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r1, [r4, #0x3a]
	subs r0, r0, r1
	strh r0, [r2, #0x3a]
_080779A6:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xe7
	bne _080779C4
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #8
	negs r1, r1
	ldr r2, _08077A94  @ gUnknown_087F7DC8
	bl sub_80776D8
	movs r0, #0
	movs r1, #0
	bl sub_807773C
_080779C4:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xe5
	ble _080779F0
	ldr r1, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldr r1, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	strh r0, [r1, #0x3a]
	ldr r2, [r4, #0x64]
	ldrh r0, [r2, #0x32]
	ldrh r1, [r5]
	subs r0, r0, r1
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldrh r0, [r2, #0x3a]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #0x3a]
_080779F0:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0xf0
	bne _08077A02
	movs r0, #0x7d
	movs r1, #0x1e
	movs r2, #0x78
	bl sub_8077AAC
_08077A02:
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	ldr r0, _08077A98  @ 0x0000018B
	cmp r1, r0
	bne _08077A6E
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x54]
	bl Proc_End
	strh r7, [r5]
	strh r7, [r5, #2]
	ldr r0, _08077A9C  @ gBG3TilemapBuffer
	ldr r1, _08077AA0  @ 0x0000601F
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl BG_SetPosition
	movs r0, #0
	movs r1, #0
	bl sub_8077EAC
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
_08077A6E:
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	ldr r0, _08077AA4  @ 0x00000203
	cmp r1, r0
	bne _08077A86
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08077A86:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077A8C: .4byte gUnknown_02017760
_08077A90: .4byte gUnknown_02000038
_08077A94: .4byte gUnknown_087F7DC8
_08077A98: .4byte 0x0000018B
_08077A9C: .4byte gBG3TilemapBuffer
_08077AA0: .4byte 0x0000601F
_08077AA4: .4byte 0x00000203

	THUMB_FUNC_END sub_807789C

	THUMB_FUNC_START sub_8077AA8
sub_8077AA8: @ 0x08077AA8
	bx lr

	THUMB_FUNC_END sub_8077AA8

	THUMB_FUNC_START sub_8077AAC
sub_8077AAC: @ 0x08077AAC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08077AE4  @ gUnknown_087F45A0
	movs r1, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	ldr r2, _08077AE8  @ gLCDControlBuffer
	adds r4, r2, #0
	adds r4, #0x3c
	ldrb r3, [r4]
	subs r1, #0x21
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r4]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077AE4: .4byte gUnknown_087F45A0
_08077AE8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8077AAC

	THUMB_FUNC_START sub_8077AEC
sub_8077AEC: @ 0x08077AEC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08077B54  @ gPaletteBuffer
	ldr r4, _08077B58  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	cmp r0, r1
	ble _08077B4C
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08077B4C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077B54: .4byte gPaletteBuffer
_08077B58: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8077AEC

	THUMB_FUNC_START sub_8077B5C
sub_8077B5C: @ 0x08077B5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08077BAC  @ gPaletteBuffer
	ldr r4, _08077BB0  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _08077BA6
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_08077BA6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077BAC: .4byte gPaletteBuffer
_08077BB0: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8077B5C

	THUMB_FUNC_START sub_8077BB4
sub_8077BB4: @ 0x08077BB4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08077C1C  @ gPaletteBuffer
	ldr r4, _08077C20  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x4c]
	cmp r0, r1
	ble _08077C14
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08077C14:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077C1C: .4byte gPaletteBuffer
_08077C20: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8077BB4

	THUMB_FUNC_START sub_8077C24
sub_8077C24: @ 0x08077C24
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08077C50  @ gLCDControlBuffer
	adds r2, r1, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077C50: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8077C24

	THUMB_FUNC_START sub_8077C54
sub_8077C54: @ 0x08077C54
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r5, r5, #0x10
	lsrs r0, r5, #0x10
	mov r9, r0
	lsls r6, r6, #0x10
	lsrs r7, r6, #0x10
	mov r8, r7
	movs r0, #2
	mov r1, r9
	mov r2, r8
	bl BG_SetPosition
	ldr r4, _08077D20  @ gUnknown_02000038
	ldrh r1, [r4]
	asrs r5, r5, #0x10
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	asrs r6, r6, #0x10
	adds r2, r6, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	adds r0, r5, r0
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	adds r1, r6, r1
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r4]
	adds r0, r5, r0
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	adds r1, r6, r1
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	movs r0, #3
	mov r1, r9
	mov r2, r8
	bl BG_SetPosition
	ldr r0, _08077D24  @ gUnknown_02000028
	mov r8, r0
	ldrh r1, [r0]
	subs r1, r1, r5
	ldr r0, _08077D28  @ gUnknown_0201FB0C
	ldr r3, [r0]
	subs r1, r1, r3
	ldr r4, _08077D2C  @ gUnknown_0200002C
	ldrh r2, [r4]
	subs r2, r2, r6
	mov r7, r8
	ldrh r0, [r7, #2]
	adds r5, r5, r0
	subs r5, r5, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrh r4, [r4, #2]
	subs r4, r4, r6
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_80559F0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077D20: .4byte gUnknown_02000038
_08077D24: .4byte gUnknown_02000028
_08077D28: .4byte gUnknown_0201FB0C
_08077D2C: .4byte gUnknown_0200002C

	THUMB_FUNC_END sub_8077C54

	THUMB_FUNC_START sub_8077D30
sub_8077D30: @ 0x08077D30
	movs r1, #0
	str r1, [r0, #0x58]
	bx lr

	THUMB_FUNC_END sub_8077D30

	THUMB_FUNC_START sub_8077D38
sub_8077D38: @ 0x08077D38
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _08077D74  @ gUnknown_03004FA0
	ldr r1, [r6]
	ldr r5, _08077D78  @ gUnknown_0201FB0C
	ldr r0, [r5]
	subs r0, r0, r1
	ldr r4, _08077D7C  @ gUnknown_03004FA4
	ldr r1, [r4]
	negs r1, r1
	bl sub_8077EAC
	ldr r1, [r6]
	ldr r0, [r5]
	subs r0, r0, r1
	ldr r1, [r4]
	negs r1, r1
	bl sub_806FB2C
	mov r1, r8
	ldr r0, [r1, #0x58]
	adds r0, #1
	str r0, [r1, #0x58]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077D74: .4byte gUnknown_03004FA0
_08077D78: .4byte gUnknown_0201FB0C
_08077D7C: .4byte gUnknown_03004FA4

	THUMB_FUNC_END sub_8077D38

	THUMB_FUNC_START sub_8077D80
sub_8077D80: @ 0x08077D80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	ldr r1, _08077DB0  @ gUnknown_08801AAC
	lsls r3, r3, #2
	adds r3, r3, r1
	ldr r4, [r3]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl __modsi3
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	strh r1, [r5]
	ldrh r0, [r0, #2]
	strh r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077DB0: .4byte gUnknown_08801AAC

	THUMB_FUNC_END sub_8077D80

	THUMB_FUNC_START sub_8077DB4
sub_8077DB4: @ 0x08077DB4
	ldr r2, _08077DC0  @ gUnknown_03004FA0
	str r0, [r2]
	ldr r0, _08077DC4  @ gUnknown_03004FA4
	str r1, [r0]
	bx lr
	.align 2, 0
_08077DC0: .4byte gUnknown_03004FA0
_08077DC4: .4byte gUnknown_03004FA4

	THUMB_FUNC_END sub_8077DB4

	THUMB_FUNC_START sub_8077DC8
sub_8077DC8: @ 0x08077DC8
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _08077E4C  @ gUnknown_087F45D0
	ldr r4, _08077E50  @ gUnknown_02019790
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _08077E54  @ gBG1TilemapBuffer
	movs r5, #1
	str r5, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl sub_8070E94
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, _08077E58  @ gUnknown_0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_8077EAC
	movs r0, #1
	bl sub_8013A84
	bl EnablePaletteSync
	add r1, sp, #8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08077E5C  @ 0x06002000
	ldr r2, _08077E60  @ 0x01000800
	add r0, sp, #8
	bl CpuSet
	movs r0, #2
	bl BG_EnableSyncByMask
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077E4C: .4byte gUnknown_087F45D0
_08077E50: .4byte gUnknown_02019790
_08077E54: .4byte gBG1TilemapBuffer
_08077E58: .4byte gUnknown_0201FB0C
_08077E5C: .4byte 0x06002000
_08077E60: .4byte 0x01000800

	THUMB_FUNC_END sub_8077DC8

	THUMB_FUNC_START sub_8077E64
sub_8077E64: @ 0x08077E64
	movs r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	bx lr

	THUMB_FUNC_END sub_8077E64

	THUMB_FUNC_START sub_8077E6C
sub_8077E6C: @ 0x08077E6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #0x18
	bne _08077E96
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8077EEC
	movs r0, #0
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	cmp r0, #0xf
	ble _08077E96
	adds r0, r4, #0
	bl Proc_Break
_08077E96:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077E6C

	THUMB_FUNC_START sub_8077E9C
sub_8077E9C: @ 0x08077E9C
	push {lr}
	bl ClearBG1
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077E9C

	THUMB_FUNC_START sub_8077EAC
sub_8077EAC: @ 0x08077EAC
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _08077EC8  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _08077ED6
	cmp r0, #1
	bgt _08077ECC
	cmp r0, #0
	beq _08077ED2
	b _08077ED8
	.align 2, 0
_08077EC8: .4byte gUnknown_0203E120
_08077ECC:
	cmp r0, #2
	beq _08077ED6
	b _08077ED8
_08077ED2:
	adds r3, #8
	b _08077ED8
_08077ED6:
	adds r3, #0x20
_08077ED8:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl BG_SetPosition
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077EAC

	THUMB_FUNC_START sub_8077EEC
sub_8077EEC: @ 0x08077EEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08077F00  @ gUnknown_08801840
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077F00: .4byte gUnknown_08801840

	THUMB_FUNC_END sub_8077EEC

	THUMB_FUNC_START sub_8077F04
sub_8077F04: @ 0x08077F04
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0
	strh r1, [r2]
	str r1, [r0, #0x58]
	bx lr

	THUMB_FUNC_END sub_8077F04

	THUMB_FUNC_START sub_8077F10
sub_8077F10: @ 0x08077F10
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r7, r5, #0
	adds r7, #0x64
	ldr r6, _08077F84  @ gUnknown_08801AB4
_08077F1C:
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r4, #4
	adds r0, r0, r1
	ldr r1, _08077F88  @ 0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _08077F8C  @ 0x06002000
	adds r0, r0, r1
	ldm r6!, {r1}
	ldr r2, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_8077F9C
	adds r4, #1
	cmp r4, #5
	ble _08077F1C
	ldr r0, [r5, #0x58]
	cmp r0, #0x3e
	bgt _08077F7C
	adds r0, #1
	str r0, [r5, #0x58]
	movs r4, #0
	ldr r6, _08077F84  @ gUnknown_08801AB4
_08077F52:
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r1, r4, #4
	adds r0, r0, r1
	ldr r1, _08077F88  @ 0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _08077F8C  @ 0x06002000
	adds r0, r0, r1
	ldm r6!, {r1}
	ldr r2, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_8077F9C
	adds r4, #1
	cmp r4, #5
	ble _08077F52
	ldr r0, [r5, #0x58]
	cmp r0, #0x3e
	ble _08077F90
_08077F7C:
	adds r0, r5, #0
	bl Proc_Break
	b _08077F94
	.align 2, 0
_08077F84: .4byte gUnknown_08801AB4
_08077F88: .4byte 0x000003FF
_08077F8C: .4byte 0x06002000
_08077F90:
	adds r0, #1
	str r0, [r5, #0x58]
_08077F94:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077F10

	THUMB_FUNC_START sub_8077F9C
sub_8077F9C: @ 0x08077F9C
	asrs r2, r1, #2
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r3, _08077FC0  @ gUnknown_08801858
	movs r2, #3
	ands r2, r1
	lsls r2, r2, #1
	adds r3, r2, r3
	ldrh r3, [r3]
	ldrh r1, [r0]
	bics r1, r3
	strh r1, [r0]
	ldr r3, _08077FC4  @ gUnknown_08801860
	adds r2, r2, r3
	ldrh r2, [r2]
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08077FC0: .4byte gUnknown_08801858
_08077FC4: .4byte gUnknown_08801860

	THUMB_FUNC_END sub_8077F9C

	THUMB_FUNC_START sub_8077FC8
sub_8077FC8: @ 0x08077FC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r2, #0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r2, #0xf8
	lsls r2, r2, #7
	mov ip, r2
	adds r4, r1, #0
	adds r5, r0, #0
	movs r7, #0xf
_08077FE2:
	ldrh r3, [r5]
	adds r0, r3, #0
	cmp r0, #0
	beq _0807802C
	movs r2, #0x1f
	ands r2, r3
	mov r0, r8
	ands r0, r3
	lsrs r1, r0, #5
	mov r0, ip
	ands r0, r3
	lsrs r0, r0, #0xa
	adds r2, r2, r6
	adds r1, r1, r6
	adds r0, r0, r6
	cmp r2, #0
	bge _08078006
	movs r2, #0
_08078006:
	cmp r1, #0
	bge _0807800C
	movs r1, #0
_0807800C:
	cmp r0, #0
	bge _08078012
	movs r0, #0
_08078012:
	cmp r2, #0x1f
	ble _08078018
	movs r2, #0x1f
_08078018:
	cmp r1, #0x1f
	ble _0807801E
	movs r1, #0x1f
_0807801E:
	cmp r0, #0x1f
	ble _08078024
	movs r0, #0x1f
_08078024:
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r0, r0, r2
_0807802C:
	strh r0, [r4]
	adds r4, #2
	adds r5, #2
	subs r7, #1
	cmp r7, #0
	bge _08077FE2
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077FC8

	THUMB_FUNC_START sub_8078044
sub_8078044: @ 0x08078044
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078070  @ 0x0000037E
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
	bl ClearBG1Setup
	ldr r0, _08078074  @ gUnknown_08801868
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078070: .4byte 0x0000037E
_08078074: .4byte gUnknown_08801868

	THUMB_FUNC_END sub_8078044

	THUMB_FUNC_START sub_8078078
sub_8078078: @ 0x08078078
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08078092
	ldr r0, [r1, #0x5c]
	bl sub_8078124
	b _080780A0
_08078092:
	cmp r0, #0x15
	beq _080780A0
	cmp r0, #0x46
	bne _080780A0
	adds r0, r1, #0
	bl Proc_Break
_080780A0:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8078078

	THUMB_FUNC_START sub_80780A4
sub_80780A4: @ 0x080780A4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _080780C0  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080780C8
	ldr r1, _080780C4  @ gUnknown_02019790
	adds r0, r3, #0
	bl LZ77UnCompWram
	b _080780D0
	.align 2, 0
_080780C0: .4byte gUnknown_0203E120
_080780C4: .4byte gUnknown_02019790
_080780C8:
	ldr r1, _080780F4  @ gUnknown_02019790
	adds r0, r2, #0
	bl LZ77UnCompWram
_080780D0:
	ldr r5, _080780F4  @ gUnknown_02019790
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _080780FC
	ldr r1, _080780F8  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8070E94
	b _08078110
	.align 2, 0
_080780F4: .4byte gUnknown_02019790
_080780F8: .4byte gBG1TilemapBuffer
_080780FC:
	ldr r1, _08078120  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8070EC4
_08078110:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078120: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80780A4

	THUMB_FUNC_START sub_8078124
sub_8078124: @ 0x08078124
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807813C  @ gUnknown_08801880
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	bl sub_80551B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807813C: .4byte gUnknown_08801880

	THUMB_FUNC_END sub_8078124

	THUMB_FUNC_START sub_8078140
sub_8078140: @ 0x08078140
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x14]
	movs r1, #0xc0
	lsls r1, r1, #4
	bl SomeImageStoringRoutine_SpellAnim2
	adds r0, r4, #0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, [r5, #0x5c]
	adds r1, r6, #0
	mov r2, r8
	bl sub_80780A4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8078140

	THUMB_FUNC_START sub_8078174
sub_8078174: @ 0x08078174
	push {r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [r0, #0x44]
	ldr r4, _08078198  @ gUnknown_088018A0
	ldr r1, [r4]
	strh r1, [r0, #0x2c]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	ldr r4, [r4, #0x10]
	str r4, [sp]
	bl sub_8078140
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078198: .4byte gUnknown_088018A0

	THUMB_FUNC_END sub_8078174

	THUMB_FUNC_START sub_807819C
sub_807819C: @ 0x0807819C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08078206
	ldr r1, [r4, #0x44]
	adds r1, #1
	str r1, [r4, #0x44]
	ldr r6, _080781DC  @ gUnknown_088018A0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r5, r0, #2
	adds r0, r5, r6
	ldr r0, [r0]
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _080781E0
	bl ClearBG1
	bl sub_805526C
	adds r0, r4, #0
	bl Proc_Break
	b _0807820C
	.align 2, 0
_080781DC: .4byte gUnknown_088018A0
_080781E0:
	adds r0, r6, #4
	adds r0, r5, r0
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r5, r0
	ldr r3, [r0]
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_8078140
_08078206:
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	strh r0, [r4, #0x2c]
_0807820C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807819C

	THUMB_FUNC_START GetSpellAssocStructPtr
GetSpellAssocStructPtr: @ 0x08078214
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08078240  @ gUnknown_088AFBD8
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4]
	ldr r2, _08078244  @ 0x0000FFFF
	cmp r1, r2
	beq _08078238
_0807822C:
	cmp r1, r0
	beq _08078238
	adds r4, #0x10
	ldrh r1, [r4]
	cmp r1, r2
	bne _0807822C
_08078238:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08078240: .4byte gUnknown_088AFBD8
_08078244: .4byte 0x0000FFFF

	THUMB_FUNC_END GetSpellAssocStructPtr

	THUMB_FUNC_START GetSpellAssocCharCount
GetSpellAssocCharCount: @ 0x08078248
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #2]
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSpellAssocCharCount

	THUMB_FUNC_START sub_8078258
sub_8078258: @ 0x08078258
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrh r0, [r0, #4]
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8078258

	THUMB_FUNC_START GetSpellAssocAlt6CPointer
GetSpellAssocAlt6CPointer: @ 0x08078268
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldr r0, [r0, #8]
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSpellAssocAlt6CPointer

	THUMB_FUNC_START GetSpellAssocReturnBool
GetSpellAssocReturnBool: @ 0x08078278
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #0xc]
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSpellAssocReturnBool

	THUMB_FUNC_START GetSpellAssocFacing
GetSpellAssocFacing: @ 0x08078288
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #0xd]
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSpellAssocFacing

	THUMB_FUNC_START GetSpellAssocFlashColor
GetSpellAssocFlashColor: @ 0x08078298
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #0xe]
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSpellAssocFlashColor

.align 2, 0
