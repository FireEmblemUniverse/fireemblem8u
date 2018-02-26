	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START _MarkSomethingInMenu
_MarkSomethingInMenu: @ 0x0800CE40
	push {lr}
	bl MarkSomethingInMenu
	pop {r0}
	bx r0

	THUMB_FUNC_START EventEngine_Loop
EventEngine_Loop: @ 0x0800CE4C
	push {r4, lr}
	adds r4, r0, #0
	bl DoesBMXFADEExist
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CE5C
	b _0800CF56
_0800CE5C:
	adds r0, r4, #0
	bl sub_800D3A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CE84
	ldr r0, _0800CE80  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800CE84
	adds r0, r4, #0
	bl sub_800D414
	b _0800CF56
	.align 2, 0
_0800CE80: .4byte gKeyStatusPtr
_0800CE84:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CEAC
	cmp r0, #4
	beq _0800CEAC
	ldr r2, _0800CEBC  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
_0800CEAC:
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _0800CEC0
	adds r0, r4, #0
	bl _call_via_r1
	b _0800CF56
	.align 2, 0
_0800CEBC: .4byte gLCDControlBuffer
_0800CEC0:
	ldrh r1, [r4, #0x3c]
	movs r0, #2
	orrs r0, r1
	strh r0, [r4, #0x3c]
_0800CEC8:
	ldr r1, _0800CEDC  @ gUnknown_030004B8
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #0x38]
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x7f
	bhi _0800CEE4
	ldr r1, _0800CEE0  @ gUnknown_08591B28
	b _0800CEE8
	.align 2, 0
_0800CEDC: .4byte gUnknown_030004B8
_0800CEE0: .4byte gUnknown_08591B28
_0800CEE4:
	ldr r1, _0800CF08  @ gUnknown_08591C98
	subs r0, #0x80
_0800CEE8:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bhi _0800CEC8
	lsls r0, r0, #2
	ldr r1, _0800CF0C  @ _0800CF10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800CF08: .4byte gUnknown_08591C98
_0800CF0C: .4byte _0800CF10
_0800CF10: @ jump table
	.4byte _0800CF2C @ case 0
	.4byte _0800CEC8 @ case 1
	.4byte _0800CF3E @ case 2
	.4byte _0800CF56 @ case 3
	.4byte _0800CEC8 @ case 4
	.4byte _0800CF50 @ case 5
	.4byte _0800CEC8 @ case 6
_0800CF2C:
	ldr r0, [r4, #0x38]
	ldrh r1, [r0]
	lsrs r1, r1, #4
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #0x38]
	b _0800CEC8
_0800CF3E:
	ldr r0, [r4, #0x38]
	ldrh r1, [r0]
	lsrs r1, r1, #4
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #0x38]
	b _0800CF56
_0800CF50:
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
_0800CF56:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START EventEngine_Destructor
EventEngine_Destructor: @ 0x0800CF5C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	bl LoadNewUIGraphics
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #4
	beq _0800CFC6
	cmp r0, #4
	bgt _0800CF82
	cmp r0, #2
	beq _0800CFB6
	b _0800CFC6
_0800CF82:
	cmp r0, #5
	bne _0800CFC6
	bl LoadGameCoreGfx
	bl sub_8019974
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800CFB6
	bl ClearMOVEUNITs
	bl sub_80311F0
	ldr r0, _0800D008  @ gUnknown_03000438
	movs r1, #0
	movs r2, #0x80
	bl memset
_0800CFB6:
	bl SubSkipThread2
	bl sub_804F62C
	bl sub_800BB98
	bl ClearCutsceneUnits
_0800CFC6:
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	cmp r0, #3
	beq _0800CFF2
	bl sub_8006A7C
	bl sub_808F270
	bl sub_808BB74
	ldrb r0, [r5]
	cmp r0, #1
	bne _0800CFEC
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
_0800CFEC:
	adds r0, r4, #0
	bl sub_800E640
_0800CFF2:
	ldrh r1, [r4, #0x3c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D000
	bl HandleNextEventEngineCall
_0800D000:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D008: .4byte gUnknown_03000438

	THUMB_FUNC_START EqueueEventEngineCall
EqueueEventEngineCall: @ 0x0800D00C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0800D02C  @ gUnknown_03000438
	movs r3, #0
	movs r5, #1
_0800D01A:
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0800D030
	str r4, [r2]
	strb r1, [r2, #4]
	strb r5, [r2, #5]
	b _0800D03C
	.align 2, 0
_0800D02C: .4byte gUnknown_03000438
_0800D030:
	adds r2, #8
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0800D01A
_0800D03C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START HandleNextEventEngineCall
HandleNextEventEngineCall: @ 0x0800D044
	push {r4, lr}
	ldr r4, _0800D078  @ gUnknown_03000438
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _0800D058
	ldr r0, [r4]
	ldrb r1, [r4, #4]
	bl NewMapEventEngine
_0800D058:
	movs r2, #0
_0800D05A:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	stm r4!, {r0, r1}
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xe
	bls _0800D05A
	movs r0, #0
	str r0, [r4]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D078: .4byte gUnknown_03000438

	THUMB_FUNC_START CallMapEventEngine
CallMapEventEngine: @ 0x0800D07C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _0800D09C  @ gUnknown_08591AC0
	bl Proc_Find
	negs r1, r0
	orrs r1, r0
	cmp r1, #0
	bge _0800D0A0
	adds r0, r5, #0
	adds r1, r4, #0
	bl EqueueEventEngineCall
	b _0800D0A8
	.align 2, 0
_0800D09C: .4byte gUnknown_08591AC0
_0800D0A0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl NewMapEventEngine
_0800D0A8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START NewMapEventEngine
NewMapEventEngine: @ 0x0800D0B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r1, #0
	ldr r0, _0800D134  @ gUnknown_08591AC0
	movs r1, #3
	bl Proc_Create
	adds r5, r0, #0
	movs r2, #0
	str r2, [r5, #0x2c]
	str r4, [r5, #0x30]
	str r4, [r5, #0x34]
	str r4, [r5, #0x38]
	movs r3, #0
	strh r2, [r5, #0x3c]
	strh r2, [r5, #0x3e]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x41
	strb r6, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r4, r5, #0
	adds r4, #0x43
	movs r0, #1
	negs r0, r0
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x44
	strh r2, [r0]
	str r2, [r5, #0x48]
	adds r0, #8
	strh r2, [r0]
	adds r0, #2
	strb r3, [r0]
	ldr r0, _0800D138  @ gLCDControlBuffer
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800D116
	ldrh r0, [r5, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #0x3c]
_0800D116:
	cmp r6, #0
	beq _0800D12C
	cmp r6, #0
	blt _0800D12C
	cmp r6, #2
	bgt _0800D12C
	ldr r0, _0800D13C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	strb r0, [r4]
	bl AddSkipThread2
_0800D12C:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D134: .4byte gUnknown_08591AC0
_0800D138: .4byte gLCDControlBuffer
_0800D13C: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START NewBattleEventEngine
NewBattleEventEngine: @ 0x0800D140
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800D194  @ gUnknown_08591AF8
	movs r1, #3
	bl Proc_Create
	mov ip, r0
	movs r2, #0
	str r2, [r0, #0x2c]
	str r4, [r0, #0x30]
	str r4, [r0, #0x34]
	str r4, [r0, #0x38]
	movs r3, #0
	strh r2, [r0, #0x3c]
	strh r2, [r0, #0x3e]
	mov r1, ip
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x42
	strb r3, [r0]
	adds r0, #2
	strh r2, [r0]
	mov r0, ip
	str r2, [r0, #0x48]
	adds r0, #0x4c
	strh r2, [r0]
	adds r0, #2
	strb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #0x3c]
	movs r1, #1
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D194: .4byte gUnknown_08591AF8

	THUMB_FUNC_START MapEventEngineExists
MapEventEngineExists: @ 0x0800D198
	push {lr}
	ldr r0, _0800D1AC  @ gUnknown_08591AC0
	bl Proc_Find
	cmp r0, #0
	beq _0800D1A6
	movs r0, #1
_0800D1A6:
	pop {r1}
	bx r1
	.align 2, 0
_0800D1AC: .4byte gUnknown_08591AC0

	THUMB_FUNC_START BattleEventEngineExists
BattleEventEngineExists: @ 0x0800D1B0
	push {lr}
	ldr r0, _0800D1C4  @ gUnknown_08591AF8
	bl Proc_Find
	cmp r0, #0
	beq _0800D1BE
	movs r0, #1
_0800D1BE:
	pop {r1}
	bx r1
	.align 2, 0
_0800D1C4: .4byte gUnknown_08591AF8

	THUMB_FUNC_START DeleteEventEngines
DeleteEventEngines: @ 0x0800D1C8
	push {lr}
	ldr r0, _0800D1DC  @ gUnknown_08591AC0
	bl Proc_DeleteAllWithScript
	ldr r0, _0800D1E0  @ gUnknown_08591AF8
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_0800D1DC: .4byte gUnknown_08591AC0
_0800D1E0: .4byte gUnknown_08591AF8

	THUMB_FUNC_START sub_800D1E4
sub_800D1E4: @ 0x0800D1E4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800D1F4  @ gUnknown_08591DD8
	bl Proc_CreateBlockingChild
	pop {r0}
	bx r0
	.align 2, 0
_0800D1F4: .4byte gUnknown_08591DD8

	THUMB_FUNC_START SetEventSlotC
SetEventSlotC: @ 0x0800D1F8
	ldr r1, _0800D200  @ gUnknown_030004B8
	str r0, [r1, #0x30]
	bx lr
	.align 2, 0
_0800D200: .4byte gUnknown_030004B8

	THUMB_FUNC_START sub_800D204
sub_800D204: @ 0x0800D204
	bx lr

	THUMB_FUNC_START sub_800D208
sub_800D208: @ 0x0800D208
	push {lr}
	ldr r0, _0800D230  @ gUnknown_08591AC0
	bl Proc_Find
	cmp r0, #0
	bne _0800D21E
	ldr r0, _0800D234  @ gUnknown_08591AF8
	bl Proc_Find
	cmp r0, #0
	beq _0800D258
_0800D21E:
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800D258
	lsls r0, r0, #2
	ldr r1, _0800D238  @ _0800D23C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D230: .4byte gUnknown_08591AC0
_0800D234: .4byte gUnknown_08591AF8
_0800D238: .4byte _0800D23C
_0800D23C: @ jump table
	.4byte _0800D258 @ case 0
	.4byte _0800D254 @ case 1
	.4byte _0800D254 @ case 2
	.4byte _0800D258 @ case 3
	.4byte _0800D258 @ case 4
	.4byte _0800D258 @ case 5
_0800D254:
	movs r0, #1
	b _0800D25A
_0800D258:
	movs r0, #0
_0800D25A:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_800D260
sub_800D260: @ 0x0800D260
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0800D27C  @ gUnknown_08591F88
	movs r1, #2
	bl CallMapEventEngine
	ldr r0, _0800D280  @ gUnknown_030004B8
	str r4, [r0, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D27C: .4byte gUnknown_08591F88
_0800D280: .4byte gUnknown_030004B8

	THUMB_FUNC_START CallBattleQuoteTextEvents
CallBattleQuoteTextEvents: @ 0x0800D284
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0800D29C  @ gUnknown_08591F88
	bl NewBattleEventEngine
	ldr r0, _0800D2A0  @ gUnknown_030004B8
	str r4, [r0, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D29C: .4byte gUnknown_08591F88
_0800D2A0: .4byte gUnknown_030004B8

	THUMB_FUNC_START sub_800D2A4
sub_800D2A4: @ 0x0800D2A4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0800D2C4  @ gUnknown_08591F9C
	movs r1, #2
	bl CallMapEventEngine
	ldr r1, _0800D2C8  @ gUnknown_030004B8
	movs r0, #1
	str r0, [r1, #0x34]
	ldr r0, _0800D2CC  @ gUnknown_030004F0
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D2C4: .4byte gUnknown_08591F9C
_0800D2C8: .4byte gUnknown_030004B8
_0800D2CC: .4byte gUnknown_030004F0

	THUMB_FUNC_START CallSomeOtherEvents
CallSomeOtherEvents: @ 0x0800D2D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800D2F8  @ gUnknown_08591FA8
	movs r1, #2
	bl CallMapEventEngine
	ldr r1, _0800D2FC  @ gUnknown_030004B8
	movs r0, #1
	str r0, [r1, #0x34]
	ldr r0, _0800D300  @ gUnknown_030004F0
	str r4, [r0]
	str r5, [r1, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D2F8: .4byte gUnknown_08591FA8
_0800D2FC: .4byte gUnknown_030004B8
_0800D300: .4byte gUnknown_030004F0

	THUMB_FUNC_START sub_800D304
sub_800D304: @ 0x0800D304
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800D328  @ gUnknown_08591FF0
	movs r1, #1
	bl CallMapEventEngine
	ldr r0, _0800D32C  @ gUnknown_030004B8
	str r4, [r0, #8]
	str r5, [r0, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D328: .4byte gUnknown_08591FF0
_0800D32C: .4byte gUnknown_030004B8

	THUMB_FUNC_START sub_800D330
sub_800D330: @ 0x0800D330
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0800D34C  @ gUnknown_08592030
	movs r1, #3
	bl CallMapEventEngine
	ldr r0, _0800D350  @ gUnknown_030004B8
	str r4, [r0, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D34C: .4byte gUnknown_08592030
_0800D350: .4byte gUnknown_030004B8

	THUMB_FUNC_START sub_800D354
sub_800D354: @ 0x0800D354
	push {lr}
	ldr r0, _0800D370  @ gUnknown_08592058
	movs r1, #1
	bl CallMapEventEngine
	ldr r1, _0800D374  @ gUnknown_030004B8
	ldr r0, _0800D378  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0800D370: .4byte gUnknown_08592058
_0800D374: .4byte gUnknown_030004B8
_0800D378: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_800D37C
sub_800D37C: @ 0x0800D37C
	push {lr}
	ldr r0, _0800D38C  @ gUnknown_085920B8
	movs r1, #1
	bl CallMapEventEngine
	pop {r0}
	bx r0
	.align 2, 0
_0800D38C: .4byte gUnknown_085920B8

	THUMB_FUNC_START sub_800D390
sub_800D390: @ 0x0800D390
	push {lr}
	ldr r0, _0800D3A0  @ gUnknown_08592104
	movs r1, #2
	bl NewMapEventEngine
	pop {r0}
	bx r0
	.align 2, 0
_0800D3A0: .4byte gUnknown_08592104

	THUMB_FUNC_START sub_800D3A4
sub_800D3A4: @ 0x0800D3A4
	push {lr}
	ldrh r2, [r0, #0x3c]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0800D3DC
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D3DC
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0800D3DC
	bl IsBattleDeamonActive
	cmp r0, #0
	bne _0800D3DC
	ldr r0, _0800D3D8  @ gUnknown_089A2C80
	bl Proc_Find
	cmp r0, #0
	bne _0800D3DC
	movs r0, #1
	b _0800D3DE
	.align 2, 0
_0800D3D8: .4byte gUnknown_089A2C80
_0800D3DC:
	movs r0, #0
_0800D3DE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_800D3E4
sub_800D3E4: @ 0x0800D3E4
	push {lr}
	ldr r0, _0800D40C  @ gUnknown_08591AC0
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	bne _0800D3FE
	ldr r0, _0800D410  @ gUnknown_08591AF8
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D406
_0800D3FE:
	ldrh r1, [r2, #0x3c]
	movs r0, #8
	orrs r0, r1
	strh r0, [r2, #0x3c]
_0800D406:
	pop {r0}
	bx r0
	.align 2, 0
_0800D40C: .4byte gUnknown_08591AC0
_0800D410: .4byte gUnknown_08591AF8

	THUMB_FUNC_START sub_800D414
sub_800D414: @ 0x0800D414
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	movs r1, #4
	orrs r1, r0
	strh r1, [r4, #0x3c]
	bl GetZero
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D46E
	bl sub_80BA054
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0800D43E
	adds r0, r4, #0
	bl sub_800D488
	b _0800D46E
_0800D43E:
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800D46E
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D45A
	adds r0, r4, #0
	bl sub_800D488
	b _0800D462
_0800D45A:
	movs r0, #0x40
	adds r1, r4, #0
	bl sub_8013D08
_0800D462:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
_0800D46E:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800D47C
	bl sub_80BA424
_0800D47C:
	movs r0, #5
	bl Proc_BlockEachWithMark
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_800D488
sub_800D488: @ 0x0800D488
	push {lr}
	bl sub_80141B0
	ldr r0, _0800D498  @ gUnknown_08591540
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_0800D498: .4byte gUnknown_08591540

	THUMB_FUNC_START sub_800D49C
sub_800D49C: @ 0x0800D49C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _0800D4AE
	bl UnsetEventId
	b _0800D4B2
_0800D4AE:
	bl SetEventId
_0800D4B2:
	pop {r0}
	bx r0

	THUMB_FUNC_START CheckEventId_
CheckEventId_: @ 0x0800D4B8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D4CC
	movs r0, #1
	b _0800D4CE
_0800D4CC:
	movs r0, #0
_0800D4CE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_800D4D4
sub_800D4D4: @ 0x0800D4D4
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r6, r0, #0
	mov r4, sp
	movs r5, #0
	movs r0, #4
	strh r0, [r4]
	strh r5, [r4, #2]
	str r3, [sp, #4]
	movs r0, #2
	strh r0, [r4, #8]
	strh r5, [r4, #0xa]
	str r1, [sp, #0xc]
	movs r0, #3
	strh r0, [r4, #0x10]
	strh r5, [r4, #0x12]
	str r2, [sp, #0x14]
	add r0, sp, #0x18
	movs r1, #0
	movs r2, #8
	bl memset
	ldr r0, _0800D520  @ gUnknown_030005B0
	adds r2, r0, #0
	mov r1, sp
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	adds r1, r6, #0
	bl Proc_Create
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D520: .4byte gUnknown_030005B0

	THUMB_FUNC_START sub_800D524
sub_800D524: @ 0x0800D524
	bx lr

	THUMB_FUNC_START SlotQueuePush
SlotQueuePush: @ 0x0800D528
	ldr r3, _0800D53C  @ gUnknown_030004F0
	ldr r2, _0800D540  @ gUnknown_030004B8
	ldr r1, [r2, #0x34]
	lsls r1, r1, #2
	adds r1, r1, r3
	str r0, [r1]
	ldr r0, [r2, #0x34]
	adds r0, #1
	str r0, [r2, #0x34]
	bx lr
	.align 2, 0
_0800D53C: .4byte gUnknown_030004F0
_0800D540: .4byte gUnknown_030004B8

	THUMB_FUNC_START SlotQueuePop
SlotQueuePop: @ 0x0800D544
	push {r4, r5, lr}
	ldr r3, _0800D580  @ gUnknown_030004F0
	ldr r5, [r3]
	ldr r1, _0800D584  @ gUnknown_030004B8
	ldr r0, [r1, #0x34]
	subs r0, #1
	str r0, [r1, #0x34]
	movs r2, #0
	cmp r2, r0
	bcs _0800D578
	adds r4, r1, #0
_0800D55A:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	adds r2, r2, r3
	adds r1, #1
	lsls r0, r1, #2
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r2]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bcc _0800D55A
_0800D578:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800D580: .4byte gUnknown_030004F0
_0800D584: .4byte gUnknown_030004B8

	THUMB_FUNC_START SetEventCounter
SetEventCounter: @ 0x0800D588
	ldr r1, _0800D590  @ gUnknown_03000568
	str r0, [r1]
	bx lr
	.align 2, 0
_0800D590: .4byte gUnknown_03000568

	THUMB_FUNC_START sub_800D594
sub_800D594: @ 0x0800D594
	ldr r0, _0800D59C  @ gUnknown_03000568
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0800D59C: .4byte gUnknown_03000568
