	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ The Stat Screen

	THUMB_FUNC_START DrawUnitWeaponRank
DrawUnitWeaponRank: @ 0x08087788
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r9, r0
	adds r6, r1, #0
	mov sl, r2
	adds r1, r3, #0
	ldr r0, _0808783C  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r4, r2, #5
	adds r0, r4, r6
	lsls r0, r0, #1
	ldr r2, _08087840  @ gUnknown_02003D2C
	mov r8, r2
	add r0, r8
	adds r1, #0x70
	movs r2, #0xa0
	lsls r2, r2, #7
	bl DrawIcon
	movs r7, #2
	cmp r5, #0xfa
	ble _080877C4
	movs r7, #4
_080877C4:
	adds r4, #4
	adds r4, r4, r6
	lsls r4, r4, #1
	add r4, r8
	adds r0, r5, #0
	bl GetDisplayRankStringFromExp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_8004B0C
	add r2, sp, #0x10
	adds r0, r5, #0
	add r1, sp, #0xc
	bl GetWeaponExpProgressState
	mov r0, r9
	lsls r5, r0, #1
	add r5, r9
	lsls r5, r5, #1
	ldr r2, _08087844  @ 0x00000401
	adds r5, r5, r2
	mov r4, sl
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #2
	adds r4, r4, r6
	lsls r4, r4, #1
	ldr r0, _08087848  @ gUnknown_0200472C
	adds r4, r4, r0
	movs r6, #0xc0
	lsls r6, r6, #7
	movs r0, #0x22
	str r0, [sp]
	ldr r1, [sp, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, [sp, #0x10]
	subs r1, #1
	bl __divsi3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #5
	adds r2, r4, #0
	adds r3, r6, #0
	bl sub_8086B2C
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808783C: .4byte gUnknown_02003BFC
_08087840: .4byte gUnknown_02003D2C
_08087844: .4byte 0x00000401
_08087848: .4byte gUnknown_0200472C

	THUMB_FUNC_START DrawUnitWeaponScreen
DrawUnitWeaponScreen: @ 0x0808784C
	push {lr}
	ldr r0, _08087890  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08087894
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #5
	bl DrawUnitWeaponRank
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #6
	bl DrawUnitWeaponRank
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #7
	bl DrawUnitWeaponRank
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #4
	bl DrawUnitWeaponRank
	b _080878C4
	.align 2, 0
_08087890: .4byte gUnknown_02003BFC
_08087894:
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl DrawUnitWeaponRank
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #1
	bl DrawUnitWeaponRank
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #2
	bl DrawUnitWeaponRank
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #3
	bl DrawUnitWeaponRank
_080878C4:
	bl DrawUnitScreenSupportList
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80878CC
sub_80878CC: @ 0x080878CC
	push {r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _0808790C  @ gUnknown_08205B24
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r5, #0
	str r5, [sp, #0x10]
	add r0, sp, #0x10
	ldr r1, _08087910  @ gUnknown_02003D2C
	ldr r2, _08087914  @ 0x01000140
	bl CpuFastSet
	str r5, [sp, #0x14]
	add r0, sp, #0x14
	ldr r1, _08087918  @ gUnknown_0200472C
	ldr r2, _0808791C  @ 0x01000120
	bl CpuFastSet
	lsls r4, r4, #2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	bl _call_via_r0
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808790C: .4byte gUnknown_08205B24
_08087910: .4byte gUnknown_02003D2C
_08087914: .4byte 0x01000140
_08087918: .4byte gUnknown_0200472C
_0808791C: .4byte 0x01000120

	THUMB_FUNC_START sub_8087920
sub_8087920: @ 0x08087920
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r6, #0xc0
	ands r6, r0
	adds r4, r0, #0
_08087930:
	adds r4, r4, r7
	movs r0, #0x3f
	ands r4, r0
	adds r0, r6, r4
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq _08087930
	ldr r5, [r3]
	cmp r5, #0
	beq _08087930
	ldr r0, _080879D8  @ gUnknown_0203E764
	ldrh r2, [r0, #2]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0808795E
	ldr r0, [r3, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08087930
_0808795E:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08087970
	ldr r0, [r3, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08087930
_08087970:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08087984
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08087930
_08087984:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08087996
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08087930
_08087996:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080879AA
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _08087930
_080879AA:
	movs r0, #0x20
	ands r0, r2
	ldr r2, [r3, #4]
	cmp r0, #0
	beq _080879C4
	ldr r0, [r5, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08087930
_080879C4:
	ldrb r0, [r2, #4]
	cmp r0, #0x62
	beq _08087930
	cmp r0, #0x34
	beq _08087930
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080879D8: .4byte gUnknown_0203E764

	THUMB_FUNC_START sub_80879DC
sub_80879DC: @ 0x080879DC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08087A50  @ gUnknown_02022D40
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _08087A54  @ gUnknown_02023D40
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl TileMap_FillRect
	ldr r7, _08087A58  @ gUnknown_08A0081C
	adds r4, r6, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0x7f
	bne _08087A28
	adds r0, r6, #0
	adds r0, #0x4a
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl sub_80878CC
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	movs r5, #0
	ldrsb r5, [r0, r5]
_08087A28:
	adds r0, r6, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08087A38
	negs r5, r5
_08087A38:
	adds r2, r5, #0
	cmp r5, #0
	bge _08087A40
	negs r2, r5
_08087A40:
	movs r0, #0x12
	subs r7, r0, r2
	cmp r5, #0
	bge _08087A5C
	movs r4, #0
	negs r0, r5
	b _08087A60
	.align 2, 0
_08087A50: .4byte gUnknown_02022D40
_08087A54: .4byte gUnknown_02023D40
_08087A58: .4byte gUnknown_08A0081C
_08087A5C:
	adds r4, r5, #0
	movs r0, #0
_08087A60:
	lsls r5, r0, #1
	ldr r0, _08087AB8  @ gUnknown_02003D2C
	adds r0, r5, r0
	lsls r4, r4, #1
	ldr r1, _08087ABC  @ gUnknown_02022D40
	adds r1, r4, r1
	adds r2, r7, #0
	movs r3, #0x12
	bl TileMap_CopyRect
	ldr r0, _08087AC0  @ gUnknown_0200472C
	adds r5, r5, r0
	ldr r0, _08087AC4  @ gUnknown_02023D40
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #0x12
	bl TileMap_CopyRect
	movs r0, #7
	bl BG_EnableSyncByMask
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r2, _08087AC8  @ gUnknown_08A0081C
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r0, r0, r2
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r0, #0x80
	negs r0, r0
	cmp r5, r0
	bne _08087AB2
	adds r0, r6, #0
	bl Proc_ClearNativeCallback
_08087AB2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087AB8: .4byte gUnknown_02003D2C
_08087ABC: .4byte gUnknown_02022D40
_08087AC0: .4byte gUnknown_0200472C
_08087AC4: .4byte gUnknown_02023D40
_08087AC8: .4byte gUnknown_08A0081C

	THUMB_FUNC_START sub_8087ACC
sub_8087ACC: @ 0x08087ACC
	ldr r1, _08087AD4  @ gUnknown_02003BFC
	movs r0, #0
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_08087AD4: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8087AD8
sub_8087AD8: @ 0x08087AD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r7, _08087B34  @ gUnknown_08A0082C
	adds r0, r7, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _08087B28
	ldr r0, _08087B38  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08087B06
	movs r0, #0x6f
	bl m4aSongNumStart
_08087B06:
	adds r0, r7, #0
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
	adds r1, r0, #0
	adds r0, #0x4c
	strh r4, [r0]
	subs r0, #2
	mov r2, r8
	strh r2, [r0]
	adds r0, #8
	strh r5, [r0]
	ldr r0, _08087B3C  @ gUnknown_02003BFC
	strh r5, [r0, #2]
	str r4, [r0, #0x14]
	movs r1, #1
	strb r1, [r0, #8]
_08087B28:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087B34: .4byte gUnknown_08A0082C
_08087B38: .4byte gUnknown_0202BCF0
_08087B3C: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8087B40
sub_8087B40: @ 0x08087B40
	push {r4, lr}
	sub sp, #4
	ldr r3, _08087B9C  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r2, #1
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r2, #4
	orrs r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	adds r1, r0, #0
	adds r1, #0x4c
	movs r4, #0
	strh r4, [r1]
	adds r0, #0x4e
	strh r4, [r0]
	ldrb r1, [r1]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087B9C: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_8087BA0
sub_8087BA0: @ 0x08087BA0
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _08087BC6
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _08087BD8
	ldrh r0, [r2]
	adds r0, #1
	b _08087BD6
_08087BC6:
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08087BD8
	movs r0, #0
_08087BD6:
	strh r0, [r2]
_08087BD8:
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8087BF0
sub_8087BF0: @ 0x08087BF0
	push {lr}
	ldr r0, _08087C00  @ gUnknown_08A00844
	movs r1, #3
	bl Proc_Create
	pop {r0}
	bx r0
	.align 2, 0
_08087C00: .4byte gUnknown_08A00844

	THUMB_FUNC_START sub_8087C04
sub_8087C04: @ 0x08087C04
	push {lr}
	ldr r0, _08087C2C  @ gUnknown_08A00844
	bl Proc_DeleteAllWithScript
	ldr r2, _08087C30  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_08087C2C: .4byte gUnknown_08A00844
_08087C30: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_8087C34
sub_8087C34: @ 0x08087C34
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08087CA8  @ gUnknown_02003BFC
	movs r7, #0
	movs r4, #1
	movs r5, #1
	strb r5, [r0, #8]
	adds r1, r6, #0
	adds r1, #0x4c
	movs r0, #4
	strh r0, [r1]
	ldr r2, _08087CAC  @ gLCDControlBuffer
	ldrb r1, [r2, #0xc]
	movs r3, #4
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x14]
	adds r0, r3, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r3, r0
	strb r3, [r2, #0x18]
	str r7, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001ED0
	str r5, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl sub_8001F0C
	movs r0, #0
	bl sub_8001F64
	ldr r0, [r6, #0x38]
	cmp r0, #0
	ble _08087CB0
	str r7, [r6, #0x3c]
	movs r0, #0x3c
	negs r0, r0
	b _08087CB4
	.align 2, 0
_08087CA8: .4byte gUnknown_02003BFC
_08087CAC: .4byte gLCDControlBuffer
_08087CB0:
	str r7, [r6, #0x3c]
	movs r0, #0x3c
_08087CB4:
	str r0, [r6, #0x40]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8087CC0
sub_8087CC0: @ 0x08087CC0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	ldrb r0, [r5]
	adds r1, r0, #0
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r4, _08087D20  @ gUnknown_02003BFC
	ldr r0, [r4, #0x10]
	movs r1, #6
	ldrsh r2, [r4, r1]
	adds r2, #0x8a
	movs r1, #0x50
	bl MU_SetDisplayPosition
	ldr r1, [r6, #0x3c]
	ldr r2, [r6, #0x40]
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	bl sub_8012DCC
	strh r0, [r4, #6]
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08087D16
	adds r0, r6, #0
	bl Proc_ClearNativeCallback
_08087D16:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087D20: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8087D24
sub_8087D24: @ 0x08087D24
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x4c
	movs r6, #0
	movs r4, #1
	strh r4, [r0]
	ldr r2, _08087D84  @ gLCDControlBuffer
	ldrb r1, [r2, #0xc]
	movs r3, #4
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x14]
	adds r0, r3, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r3, r0
	strb r3, [r2, #0x18]
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001ED0
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl sub_8001F0C
	ldr r0, [r5, #0x38]
	cmp r0, #0
	ble _08087D88
	movs r0, #0x3c
	b _08087D8C
	.align 2, 0
_08087D84: .4byte gLCDControlBuffer
_08087D88:
	movs r0, #0x3c
	negs r0, r0
_08087D8C:
	str r0, [r5, #0x3c]
	str r6, [r5, #0x40]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8087D98
sub_8087D98: @ 0x08087D98
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	ldrb r2, [r5]
	movs r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r4, _08087DF4  @ gUnknown_02003BFC
	ldr r0, [r4, #0x10]
	movs r1, #6
	ldrsh r2, [r4, r1]
	adds r2, #0x8a
	movs r1, #0x50
	bl MU_SetDisplayPosition
	ldr r1, [r6, #0x3c]
	ldr r2, [r6, #0x40]
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	bl sub_8012DCC
	strh r0, [r4, #6]
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08087DEC
	adds r0, r6, #0
	bl Proc_ClearNativeCallback
_08087DEC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087DF4: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8087DF8
sub_8087DF8: @ 0x08087DF8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	ldr r1, _08087E20  @ gUnknown_02003BFC
	str r0, [r1, #0xc]
	ldr r0, _08087E24  @ gUnknown_08A009D8
	bl Proc_Find
	bl sub_8088670
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E20: .4byte gUnknown_02003BFC
_08087E24: .4byte gUnknown_08A009D8

	THUMB_FUNC_START sub_8087E28
sub_8087E28: @ 0x08087E28
	push {r4, lr}
	ldr r4, _08087E74  @ gUnknown_02003BFC
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _08087E3A
	movs r1, #0x50
	movs r2, #0x8a
	bl MU_SetDisplayPosition
_08087E3A:
	ldr r3, _08087E78  @ gLCDControlBuffer
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl SetDefaultColorEffects
	movs r0, #0
	strb r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E74: .4byte gUnknown_02003BFC
_08087E78: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_8087E7C
sub_8087E7C: @ 0x08087E7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _08087EB0  @ gUnknown_08A00864
	bl Proc_CreateBlockingChild
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	adds r2, r0, #0
	adds r2, #0x4a
	strh r1, [r2]
	str r5, [r0, #0x38]
	ldr r0, _08087EB4  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08087EA8
	movs r0, #0xc8
	bl m4aSongNumStart
_08087EA8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087EB0: .4byte gUnknown_08A00864
_08087EB4: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8087EB8
sub_8087EB8: @ 0x08087EB8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08087F2C  @ gUnknown_02003BFC
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x6f
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #1
	ldr r3, _08087F30  @ gUnknown_08A008FE
	ldr r0, _08087F34  @ 0x00004E93
	str r0, [sp]
	movs r0, #4
	bl RegisterObjectAttributes_SafeMaybe
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x72
	movs r0, #6
	ldrsh r2, [r4, r0]
	ldr r3, _08087F38  @ gUnknown_08A00924
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, _08087F3C  @ gUnknown_08A00930
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r4, #0xf9
	lsls r4, r4, #6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl RegisterObjectAttributes_SafeMaybe
	bl GetGameClock
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r5, r5, #5
	lsls r0, r0, #1
	ldr r1, _08087F40  @ gUnknown_08A027FC
	adds r0, r0, r1
	adds r5, r5, r0
	ldr r1, _08087F44  @ gUnknown_02022B24
	adds r0, r5, #0
	movs r2, #1
	bl CpuSet
	bl EnablePaletteSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087F2C: .4byte gUnknown_02003BFC
_08087F30: .4byte gUnknown_08A008FE
_08087F34: .4byte 0x00004E93
_08087F38: .4byte gUnknown_08A00924
_08087F3C: .4byte gUnknown_08A00930
_08087F40: .4byte gUnknown_08A027FC
_08087F44: .4byte gUnknown_02022B24

	THUMB_FUNC_START sub_8087F48
sub_8087F48: @ 0x08087F48
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov r9, r0
	ldr r4, _08087FD8  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	ldr r0, _08087FDC  @ gUnknown_02003BFC
	ldrb r0, [r0]
	movs r1, #0x36
	add r9, r1
	mov r2, r9
	strb r0, [r2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087FD8: .4byte gSinLookup
_08087FDC: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8087FE0
sub_8087FE0: @ 0x08087FE0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	bl sub_8087EB8
	ldr r1, _08088004  @ gUnknown_02003BFC
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _08088008
	movs r0, #5
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
	b _0808800C
	.align 2, 0
_08088004: .4byte gUnknown_02003BFC
_08088008:
	ldrb r0, [r1]
	strb r0, [r5]
_0808800C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8088014
sub_8088014: @ 0x08088014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _080880D8  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r9, r2
	mov r1, r9
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	negs r4, r4
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, r9
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl WriteOAMRotScaleData
	adds r0, r7, #0
	adds r0, #0x36
	ldrb r0, [r0]
	bl sub_8087EB8
	ldrh r0, [r7, #0x38]
	subs r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080880C6
	movs r0, #1
	strh r0, [r7, #0x38]
	adds r0, r7, #0
	bl Proc_ClearNativeCallback
_080880C6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080880D8: .4byte gSinLookup

	THUMB_FUNC_START sub_80880DC
sub_80880DC: @ 0x080880DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _080881A4  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r9, r2
	mov r1, r9
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	negs r4, r4
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, r9
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl WriteOAMRotScaleData
	ldr r4, _080881A8  @ gUnknown_02003BFC
	ldrb r0, [r4]
	bl sub_8087EB8
	ldrh r0, [r7, #0x38]
	adds r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08088192
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	adds r0, r7, #0
	bl Proc_ClearNativeCallback
_08088192:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080881A4: .4byte gSinLookup
_080881A8: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_80881AC
sub_80881AC: @ 0x080881AC
	movs r2, #0
	movs r1, #0x67
	strh r1, [r0, #0x2a]
	movs r1, #0xd9
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x2e]
	movs r1, #4
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x32]
	bx lr

	THUMB_FUNC_START sub_80881C4
sub_80881C4: @ 0x080881C4
	push {lr}
	adds r2, r0, #0
	ldr r3, _080881F8  @ gUnknown_02003BFC
	ldrh r1, [r3, #2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080881DC
	movs r0, #0x1f
	strh r0, [r2, #0x32]
	movs r0, #0x61
	strh r0, [r2, #0x2a]
_080881DC:
	ldrh r1, [r3, #2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080881EE
	movs r0, #0x1f
	strh r0, [r2, #0x34]
	movs r0, #0xdf
	strh r0, [r2, #0x2c]
_080881EE:
	movs r0, #0
	strh r0, [r3, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080881F8: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_80881FC
sub_80881FC: @ 0x080881FC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _080882D4  @ 0x00004640
	mov r9, r0
	ldrh r1, [r7, #0x32]
	ldrh r2, [r7, #0x2e]
	adds r0, r1, r2
	strh r0, [r7, #0x2e]
	ldrh r0, [r7, #0x34]
	ldrh r2, [r7, #0x30]
	adds r0, r0, r2
	strh r0, [r7, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08088228
	subs r0, r1, #1
	strh r0, [r7, #0x32]
_08088228:
	ldrh r1, [r7, #0x34]
	movs r2, #0x34
	ldrsh r0, [r7, r2]
	cmp r0, #4
	ble _08088236
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_08088236:
	bl GetGameClock
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808825E
	ldrh r1, [r7, #0x2a]
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	cmp r0, #0x66
	bgt _08088250
	adds r0, r1, #1
	strh r0, [r7, #0x2a]
_08088250:
	ldrh r1, [r7, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	cmp r0, #0xd9
	ble _0808825E
	subs r0, r1, #1
	strh r0, [r7, #0x2c]
_0808825E:
	ldr r6, _080882D8  @ gUnknown_02003BFC
	movs r0, #4
	ldrsh r5, [r6, r0]
	movs r1, #0x2a
	ldrsh r0, [r7, r1]
	adds r5, r5, r0
	movs r2, #6
	ldrsh r4, [r6, r2]
	adds r4, #3
	ldr r0, _080882DC  @ gUnknown_08590F64
	mov r8, r0
	ldrh r0, [r7, #0x2e]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x5a
	add r0, r9
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl RegisterObjectAttributes_SafeMaybe
	movs r1, #4
	ldrsh r5, [r6, r1]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	adds r5, r5, r0
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r4, #3
	ldr r6, _080882E0  @ gUnknown_08590FB4
	ldrh r0, [r7, #0x30]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x5a
	add r0, r9
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080882D4: .4byte 0x00004640
_080882D8: .4byte gUnknown_02003BFC
_080882DC: .4byte gUnknown_08590F64
_080882E0: .4byte gUnknown_08590FB4

	THUMB_FUNC_START sub_80882E4
sub_80882E4: @ 0x080882E4
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08088344  @ gUnknown_02003BFC
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xe4
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0x11
	ldr r5, _08088348  @ gUnknown_08590F44
	ldrb r0, [r4, #1]
	ldr r3, _0808834C  @ 0x00004E89
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl RegisterObjectAttributes_SafeMaybe
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xde
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0x11
	ldr r0, _0808834C  @ 0x00004E89
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl RegisterObjectAttributes_SafeMaybe
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xd7
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0x11
	ldrb r0, [r4]
	ldr r3, _08088350  @ 0x00004E8A
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088344: .4byte gUnknown_02003BFC
_08088348: .4byte gUnknown_08590F44
_0808834C: .4byte 0x00004E89
_08088350: .4byte 0x00004E8A

	THUMB_FUNC_START sub_8088354
sub_8088354: @ 0x08088354
	push {lr}
	sub sp, #4
	ldr r0, _08088378  @ gUnknown_02003BFC
	movs r2, #4
	ldrsh r1, [r0, r2]
	adds r1, #0x40
	movs r3, #6
	ldrsh r2, [r0, r3]
	adds r2, #0x83
	ldr r3, _0808837C  @ gUnknown_08590F8C
	ldr r0, _08088380  @ 0x00004E8F
	str r0, [sp]
	movs r0, #0xb
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08088378: .4byte gUnknown_02003BFC
_0808837C: .4byte gUnknown_08590F8C
_08088380: .4byte 0x00004E8F

	THUMB_FUNC_START sub_8088384
sub_8088384: @ 0x08088384
	push {r4, r5, lr}
	sub sp, #0xc
	bl GetGameClock
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08088398
	movs r2, #1
_08088398:
	adds r5, r2, #0
	ldr r1, _0808843C  @ gUnknown_08205B34
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	ldr r4, _08088440  @ gUnknown_02003BFC
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08088434
	ldrb r0, [r4]
	cmp r0, #0
	bne _080883FE
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080883FE
	movs r0, #0x78
	movs r1, #0x28
	movs r2, #1
	bl sub_8015BD4
	movs r0, #0x78
	movs r1, #0x38
	movs r2, #1
	bl sub_8015BD4
	cmp r5, #0
	beq _080883FE
	ldr r3, _08088444  @ gUnknown_08590F44
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	add r0, sp
	adds r0, #4
	ldrh r1, [r0]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _08088448  @ 0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x4e
	bl RegisterObjectAttributes_SafeMaybe
_080883FE:
	ldr r0, _08088440  @ gUnknown_02003BFC
	ldr r2, [r0, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08088434
	cmp r5, #0
	beq _08088434
	ldr r3, _08088444  @ gUnknown_08590F44
	ldrb r0, [r2, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	add r0, sp
	adds r0, #4
	ldrh r1, [r0]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _08088448  @ 0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa
	movs r2, #0x56
	bl RegisterObjectAttributes_SafeMaybe
_08088434:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808843C: .4byte gUnknown_08205B34
_08088440: .4byte gUnknown_02003BFC
_08088444: .4byte gUnknown_08590F44
_08088448: .4byte 0x00000803

	THUMB_FUNC_START sub_808844C
sub_808844C: @ 0x0808844C
	push {r4, lr}
	sub sp, #4
	ldr r2, _080884A8  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	ldr r0, _080884AC  @ gPaletteBuffer
	strh r4, [r0]
	bl EnablePaletteSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080884A8: .4byte gLCDControlBuffer
_080884AC: .4byte gPaletteBuffer

	THUMB_FUNC_START sub_80884B0
sub_80884B0: @ 0x080884B0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	mov r9, r0
	ldr r1, _08088614  @ gUnknown_08205B3A
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl SetupBackgrounds
	movs r0, #3
	bl UnpackUiFramePalette
	movs r0, #0x80
	lsls r0, r0, #3
	bl RegisterBlankTile
	ldr r0, _08088618  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl sub_80156D4
	bl SetupMapSpritesPalettes
	ldr r0, _0808861C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r5, #0x20
	orrs r0, r5
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	mov r8, r0
	movs r0, #0x60
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0x62
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	ldrb r1, [r6]
	subs r0, #0xa2
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r1, [r7]
	movs r2, #1
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r2, #4
	orrs r1, r2
	orrs r1, r4
	orrs r1, r3
	orrs r0, r5
	strb r0, [r6]
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	orrs r0, r5
	strb r0, [r2]
	orrs r1, r5
	strb r1, [r7]
	ldr r0, _08088620  @ gUnknown_08A064E0
	ldr r1, _08088624  @ 0x06004400
	bl CopyDataWithPossibleUncomp
	ldr r0, _08088628  @ gUnknown_08A0731C
	movs r1, #0x20
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0808862C  @ gUnknown_08A071FC
	ldr r4, _08088630  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08088634  @ gUnknown_020234C0
	movs r2, #0x91
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _08088638  @ gUnknown_08A03368
	ldr r1, _0808863C  @ 0x0600B000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08088640  @ gUnknown_08A06460
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _08088644  @ gUnknown_08A05F10
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08088648  @ gBG3TilemapBuffer
	ldr r2, _0808864C  @ 0x0000C180
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _08088650  @ gUnknown_08A02274
	ldr r1, _08088654  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	movs r0, #4
	bl LoadIconPalettes
	movs r0, #6
	bl UnpackUiBarPalette
	movs r0, #1
	movs r1, #0x13
	bl LoadIconPalette
	ldr r0, _08088658  @ gUnknown_08A01F24
	ldr r1, _0808865C  @ 0x06008800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08088660  @ gUnknown_08A021E4
	movs r1, #0xe0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x14
	bl LoadIconPalette
	ldr r0, _08088664  @ gUnknown_08A020F0
	ldr r1, _08088668  @ 0x06000C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808866C  @ gUnknown_02003BFC
	mov r1, r8
	str r1, [r0, #0x10]
	mov r0, r9
	bl sub_8087E28
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088614: .4byte gUnknown_08205B3A
_08088618: .4byte gBG2TilemapBuffer
_0808861C: .4byte gLCDControlBuffer
_08088620: .4byte gUnknown_08A064E0
_08088624: .4byte 0x06004400
_08088628: .4byte gUnknown_08A0731C
_0808862C: .4byte gUnknown_08A071FC
_08088630: .4byte gUnknown_02020188
_08088634: .4byte gUnknown_020234C0
_08088638: .4byte gUnknown_08A03368
_0808863C: .4byte 0x0600B000
_08088640: .4byte gUnknown_08A06460
_08088644: .4byte gUnknown_08A05F10
_08088648: .4byte gBG3TilemapBuffer
_0808864C: .4byte 0x0000C180
_08088650: .4byte gUnknown_08A02274
_08088654: .4byte 0x06014800
_08088658: .4byte gUnknown_08A01F24
_0808865C: .4byte 0x06008800
_08088660: .4byte gUnknown_08A021E4
_08088664: .4byte gUnknown_08A020F0
_08088668: .4byte 0x06000C00
_0808866C: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8088670
sub_8088670: @ 0x08088670
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _080886CC  @ gUnknown_02003BFC
	ldr r0, [r5, #0xc]
	bl GetUnitPortraitId
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08088690
	adds r4, #1
_08088690:
	movs r0, #3
	strb r0, [r5, #1]
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl sub_8086DF0
	ldr r1, _080886D0  @ gUnknown_02023CEA
	movs r3, #0x9c
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r4, #0
	bl sub_8005E98
	adds r0, r4, #0
	bl GetPortraitStructPointer
	ldr r0, [r0]
	cmp r0, #0
	beq _080886D8
	ldr r0, _080886D4  @ gUnknown_08A01EE4
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _080886E2
	.align 2, 0
_080886CC: .4byte gUnknown_02003BFC
_080886D0: .4byte gUnknown_02023CEA
_080886D4: .4byte gUnknown_08A01EE4
_080886D8:
	ldr r0, _08088724  @ gUnknown_08A01F04
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
_080886E2:
	bl MU_EndAll
	ldr r4, _08088728  @ gUnknown_02003BFC
	ldr r0, [r4, #0xc]
	movs r1, #0x50
	movs r2, #0x8a
	bl MU_CreateForUI
	str r0, [r4, #0x10]
	bl sub_8086E44
	ldrb r0, [r4]
	bl sub_80878CC
	ldr r0, _0808872C  @ gUnknown_02003D2C
	ldr r1, _08088730  @ gUnknown_02022D40
	movs r2, #0x12
	movs r3, #0x12
	bl TileMap_CopyRect
	ldr r0, _08088734  @ gUnknown_0200472C
	ldr r1, _08088738  @ gUnknown_02023D40
	movs r2, #0x12
	movs r3, #0x12
	bl TileMap_CopyRect
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088724: .4byte gUnknown_08A01F04
_08088728: .4byte gUnknown_02003BFC
_0808872C: .4byte gUnknown_02003D2C
_08088730: .4byte gUnknown_02022D40
_08088734: .4byte gUnknown_0200472C
_08088738: .4byte gUnknown_02023D40

	THUMB_FUNC_START sub_808873C
sub_808873C: @ 0x0808873C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _080887B4  @ gKeyStatusPtr
	ldr r3, [r2]
	ldrh r1, [r3, #8]
	movs r0, #2
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _080887C4
	ldr r2, _080887B8  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	bl sub_8001F48
	ldr r0, _080887BC  @ gPaletteBuffer
	strh r4, [r0]
	bl EnablePaletteSync
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
	ldr r0, _080887C0  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080887AC
	b _080888A8
_080887AC:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080888A8
	.align 2, 0
_080887B4: .4byte gKeyStatusPtr
_080887B8: .4byte gLCDControlBuffer
_080887BC: .4byte gPaletteBuffer
_080887C0: .4byte gUnknown_0202BCF0
_080887C4:
	ldrh r2, [r3, #6]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080887E8
	ldr r4, _080887E4  @ gUnknown_02003BFC
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	adds r0, r0, r1
	subs r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x20
	b _08088806
	.align 2, 0
_080887E4: .4byte gUnknown_02003BFC
_080887E8:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _08088814
	ldr r4, _08088810  @ gUnknown_02003BFC
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	adds r0, r0, r1
	adds r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x10
_08088806:
	adds r2, r5, #0
	bl sub_8087AD8
	b _080888A8
	.align 2, 0
_08088810: .4byte gUnknown_02003BFC
_08088814:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08088834
	ldr r0, _08088830  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	movs r4, #1
	negs r4, r4
	adds r1, r4, #0
	bl sub_8087920
	adds r2, r0, #0
	adds r1, r4, #0
	b _0808887A
	.align 2, 0
_08088830: .4byte gUnknown_02003BFC
_08088834:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08088850
	ldr r0, _0808884C  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	movs r1, #1
	bl sub_8087920
	adds r2, r0, #0
	movs r1, #1
	b _0808887A
	.align 2, 0
_0808884C: .4byte gUnknown_02003BFC
_08088850:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08088888
	ldr r4, _08088884  @ gUnknown_02003BFC
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _08088888
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ands r0, r6
	movs r1, #1
	negs r1, r1
	cmp r0, #0
	beq _08088878
	movs r1, #1
_08088878:
	adds r0, r2, #0
_0808887A:
	adds r2, r5, #0
	bl sub_8087E7C
	b _080888A8
	.align 2, 0
_08088884: .4byte gUnknown_02003BFC
_08088888:
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080888A8
	adds r0, r5, #0
	movs r1, #0
	bl Proc_GotoLabel
	ldr r0, _080888B0  @ gUnknown_02003BFC
	ldrb r0, [r0]
	adds r1, r5, #0
	bl MakeStatScreenRText6C
_080888A8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080888B0: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_80888B4
sub_80888B4: @ 0x080888B4
	push {r4, lr}
	ldr r4, _080888FC  @ gUnknown_0202BCF0
	ldrb r0, [r4, #0x14]
	movs r1, #0xfc
	ands r1, r0
	ldr r3, _08088900  @ gUnknown_02003BFC
	ldrb r2, [r3]
	movs r0, #3
	ands r0, r2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldr r1, _08088904  @ gUnknown_0203E764
	ldr r0, [r3, #0xc]
	ldrb r0, [r0, #0xb]
	strb r0, [r1, #1]
	movs r0, #0
	bl SetInterrupt_LCDVCountMatch
	ldr r2, _08088908  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080888FC: .4byte gUnknown_0202BCF0
_08088900: .4byte gUnknown_02003BFC
_08088904: .4byte gUnknown_0203E764
_08088908: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_808890C
sub_808890C: @ 0x0808890C
	push {lr}
	bl sub_80895A8
	ldr r1, _0808891C  @ gUnknown_02003BFC
	str r0, [r1, #0x14]
	pop {r0}
	bx r0
	.align 2, 0
_0808891C: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8088920
sub_8088920: @ 0x08088920
	push {r4, lr}
	ldr r0, _08088948  @ gUnknown_02003BFC
	movs r1, #6
	ldrsh r4, [r0, r1]
	negs r4, r4
	movs r0, #0xff
	ands r4, r0
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088948: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_808894C
sub_808894C: @ 0x0808894C
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r2, _08088994  @ gUnknown_02003BFC
	movs r6, #0
	movs r3, #0
	strh r3, [r2, #4]
	strh r3, [r2, #6]
	ldr r5, _08088998  @ gUnknown_0202BCF0
	ldrb r4, [r5, #0x14]
	movs r1, #3
	ands r1, r4
	strb r1, [r2]
	str r0, [r2, #0xc]
	str r3, [r2, #0x14]
	strh r3, [r2, #2]
	strb r6, [r2, #8]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl BWL_IncrementStatScreenViews
	adds r5, #0x41
	ldrb r0, [r5]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088984
	movs r0, #0x6a
	bl m4aSongNumStart
_08088984:
	ldr r0, _0808899C  @ gUnknown_08A009D8
	adds r1, r7, #0
	bl Proc_CreateBlockingChild
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088994: .4byte gUnknown_02003BFC
_08088998: .4byte gUnknown_0202BCF0
_0808899C: .4byte gUnknown_08A009D8

	THUMB_FUNC_START MakeStatScreenRText6C
MakeStatScreenRText6C: @ 0x080889A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	ldr r1, _080889C8  @ gUnknown_02003BFC
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _080889E8
	cmp r4, #1
	beq _080889DC
	cmp r4, #1
	bgt _080889CC
	cmp r4, #0
	beq _080889D2
	b _080889E8
	.align 2, 0
_080889C8: .4byte gUnknown_02003BFC
_080889CC:
	cmp r4, #2
	beq _080889E4
	b _080889E8
_080889D2:
	ldr r0, _080889D8  @ gUnknown_08A00BC4
	b _080889E6
	.align 2, 0
_080889D8: .4byte gUnknown_08A00BC4
_080889DC:
	ldr r0, _080889E0  @ gUnknown_08A00DA0
	b _080889E6
	.align 2, 0
_080889E0: .4byte gUnknown_08A00DA0
_080889E4:
	ldr r0, _080889F8  @ gUnknown_08A00F44
_080889E6:
	str r0, [r1, #0x14]
_080889E8:
	ldr r0, _080889FC  @ gUnknown_02003BFC
	ldr r0, [r0, #0x14]
	adds r1, r5, #0
	bl Create6CRText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080889F8: .4byte gUnknown_08A00F44
_080889FC: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8088A00
sub_8088A00: @ 0x08088A00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08088A28  @ gUnknown_02003BFC
	ldr r1, [r0, #0xc]
	ldr r0, [r4, #0x2c]
	ldrh r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	bl GetItemDescId
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088A28: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8088A2C
sub_8088A2C: @ 0x08088A2C
	push {lr}
	adds r2, r0, #0
	ldr r0, _08088A4C  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xd
	bhi _08088B00
	lsls r0, r0, #2
	ldr r1, _08088A50  @ _08088A54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088A4C: .4byte gUnknown_02003BFC
_08088A50: .4byte _08088A54
_08088A54: @ jump table
	.4byte _08088A8C @ case 0
	.4byte _08088A98 @ case 1
	.4byte _08088AA4 @ case 2
	.4byte _08088AB0 @ case 3
	.4byte _08088ABC @ case 4
	.4byte _08088AC8 @ case 5
	.4byte _08088AD2 @ case 6
	.4byte _08088AE0 @ case 7
	.4byte _08088AEC @ case 8
	.4byte _08088B00 @ case 9
	.4byte _08088B00 @ case 10
	.4byte _08088AF8 @ case 11
	.4byte _08088B00 @ case 12
	.4byte _08088AF8 @ case 13
_08088A8C:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08088A94  @ 0x00000552
	b _08088AFE
	.align 2, 0
_08088A94: .4byte 0x00000552
_08088A98:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08088AA0  @ 0x00000553
	b _08088AFE
	.align 2, 0
_08088AA0: .4byte 0x00000553
_08088AA4:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08088AAC  @ 0x00000554
	b _08088AFE
	.align 2, 0
_08088AAC: .4byte 0x00000554
_08088AB0:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08088AB8  @ 0x00000556
	b _08088AFE
	.align 2, 0
_08088AB8: .4byte 0x00000556
_08088ABC:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08088AC4  @ 0x00000555
	b _08088AFE
	.align 2, 0
_08088AC4: .4byte 0x00000555
_08088AC8:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xab
	lsls r0, r0, #3
	b _08088AFE
_08088AD2:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08088ADC  @ 0x00000559
	b _08088AFE
	.align 2, 0
_08088ADC: .4byte 0x00000559
_08088AE0:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08088AE8  @ 0x0000055A
	b _08088AFE
	.align 2, 0
_08088AE8: .4byte 0x0000055A
_08088AEC:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08088AF4  @ 0x0000055B
	b _08088AFE
	.align 2, 0
_08088AF4: .4byte 0x0000055B
_08088AF8:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08088B04  @ 0x00000557
_08088AFE:
	strh r0, [r1]
_08088B00:
	pop {r0}
	bx r0
	.align 2, 0
_08088B04: .4byte 0x00000557

	THUMB_FUNC_START sub_8088B08
sub_8088B08: @ 0x08088B08
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08088B24  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08088B2C
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _08088B28  @ 0x00000547
	b _08088B32
	.align 2, 0
_08088B24: .4byte gUnknown_02003BFC
_08088B28: .4byte 0x00000547
_08088B2C:
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _08088B3C  @ 0x00000546
_08088B32:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088B3C: .4byte 0x00000546

	THUMB_FUNC_START sub_8088B40
sub_8088B40: @ 0x08088B40
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08088B80  @ gUnknown_02003BFC
	ldr r0, [r5, #0xc]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _08088B54
	adds r0, r4, #0
	bl sub_80893B4
_08088B54:
	ldr r1, [r5, #0xc]
	ldr r0, [r4, #0x2c]
	ldrh r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _08088B8E
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _08088B78
	cmp r0, #0x10
	beq _08088B78
	cmp r0, #0x40
	bne _08088B84
_08088B78:
	adds r0, r4, #0
	bl sub_8089354
	b _08088B8E
	.align 2, 0
_08088B80: .4byte gUnknown_02003BFC
_08088B84:
	cmp r0, #0x80
	bne _08088B8E
	adds r0, r4, #0
	bl sub_8089384
_08088B8E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8088B94
sub_8088B94: @ 0x08088B94
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _08088BCC  @ gUnknown_08205B52
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldr r0, [r5, #0x2c]
	ldrh r4, [r0, #0x12]
	ldr r0, _08088BD0  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08088BB8
	adds r4, #4
_08088BB8:
	lsls r0, r4, #1
	add r0, sp
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088BCC: .4byte gUnknown_08205B52
_08088BD0: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8088BD4
sub_8088BD4: @ 0x08088BD4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08088BEC  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldrh r2, [r0, #2]
	cmp r2, #0
	beq _08088BF0
	adds r0, r1, #0
	adds r0, #0x4c
	strh r2, [r0]
	b _08088BF6
	.align 2, 0
_08088BEC: .4byte gUnknown_02003BFC
_08088BF0:
	adds r1, #0x4c
	ldr r0, _08088BFC  @ 0x000006BE
	strh r0, [r1]
_08088BF6:
	pop {r0}
	bx r0
	.align 2, 0
_08088BFC: .4byte 0x000006BE

	THUMB_FUNC_START sub_8088C00
sub_8088C00: @ 0x08088C00
	ldr r1, _08088C10  @ gUnknown_02003BFC
	ldr r1, [r1, #0xc]
	ldr r1, [r1, #4]
	ldrh r1, [r1, #2]
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08088C10: .4byte gUnknown_02003BFC

	THUMB_FUNC_START sub_8088C14
sub_8088C14: @ 0x08088C14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08088C38  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	bl GetUnitTotalSupportLevel
	cmp r0, #0
	bne _08088C42
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0x80
	bne _08088C3C
	adds r0, r4, #0
	bl sub_8089384
	b _08088C42
	.align 2, 0
_08088C38: .4byte gUnknown_02003BFC
_08088C3C:
	adds r0, r4, #0
	bl sub_8089354
_08088C42:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8088C48
sub_8088C48: @ 0x08088C48
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0x38
	ldrsh r1, [r6, r0]
	movs r3, #0x3c
	ldrsh r2, [r6, r3]
	adds r4, r6, #0
	adds r4, #0x48
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	adds r7, r6, #0
	adds r7, #0x4a
	movs r3, #0
	ldrsh r0, [r7, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl sub_8012DCC
	strh r0, [r6, #0x30]
	movs r0, #0x3a
	ldrsh r1, [r6, r0]
	movs r3, #0x3e
	ldrsh r2, [r6, r3]
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r3, #0
	ldrsh r0, [r7, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl sub_8012DCC
	strh r0, [r6, #0x32]
	adds r0, r6, #0
	adds r0, #0x40
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r3, #0
	ldrsh r0, [r7, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl sub_8012DCC
	strh r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x42
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r4, #0
	ldrsh r0, [r7, r4]
	str r0, [sp]
	adds r0, r5, #0
	bl sub_8012DCC
	strh r0, [r6, #0x36]
	movs r1, #0x30
	ldrsh r0, [r6, r1]
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0x34
	ldrsh r2, [r6, r3]
	movs r4, #0x36
	ldrsh r3, [r6, r4]
	adds r4, r6, #0
	adds r4, #0x52
	ldrb r4, [r4]
	str r4, [sp]
	bl sub_8089980
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8088CFC
sub_8088CFC: @ 0x08088CFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08088D34  @ gUnknown_08A00B20
	bl Proc_Find
	cmp r0, #0
	beq _08088D12
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #1
	strb r0, [r1]
_08088D12:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _08088D2E
	ldr r0, _08088D38  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088D2E
	movs r0, #0x70
	bl m4aSongNumStart
_08088D2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088D34: .4byte gUnknown_08A00B20
_08088D38: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8088D3C
sub_8088D3C: @ 0x08088D3C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl sub_8088C48
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _08088D5E
	adds r0, r3, #1
	strh r0, [r2]
_08088D5E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8088D64
sub_8088D64: @ 0x08088D64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08088DB0  @ gUnknown_08A00B20
	bl Proc_Find
	cmp r0, #0
	beq _08088D7A
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #0
	strb r0, [r1]
_08088D7A:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _08088DA8
	ldr r0, _08088DB4  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088D96
	movs r0, #0x71
	bl m4aSongNumStart
_08088D96:
	adds r0, r4, #0
	bl sub_80892C0
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl sub_808929C
_08088DA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088DB0: .4byte gUnknown_08A00B20
_08088DB4: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8088DB8
sub_8088DB8: @ 0x08088DB8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_8088C48
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #3
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08088DD8
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
_08088DD8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8088DE0
sub_8088DE0: @ 0x08088DE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08088E0C  @ gUnknown_0203E768
	movs r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	ldr r1, _08088E10  @ gUnknown_0203E788
	strh r3, [r1]
	strh r3, [r1, #2]
	movs r1, #0
	bl sub_8088E9C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088E0C: .4byte gUnknown_0203E768
_08088E10: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_8088E14
sub_8088E14: @ 0x08088E14
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	bge _08088E30
	cmp r3, #0
	bge _08088E30
	bl GetUiHandPrevDisplayX
	adds r4, r0, #0
	bl GetUiHandPrevDisplayY
	adds r3, r0, #0
_08088E30:
	ldr r0, _08088E58  @ gUnknown_0203E768
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r3, [r0, #0x11]
	strh r5, [r0, #0x12]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	ldr r2, _08088E5C  @ gUnknown_0203E788
	strh r1, [r2]
	strh r1, [r2, #2]
	movs r1, #1
	bl sub_8088E9C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088E58: .4byte gUnknown_0203E768
_08088E5C: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_8088E60
sub_8088E60: @ 0x08088E60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08088E90  @ gUnknown_0203E768
	movs r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	ldr r1, _08088E94  @ sub_8089320
	str r1, [r0, #0x18]
	ldr r1, _08088E98  @ gUnknown_0203E788
	strh r3, [r1]
	strh r3, [r1, #2]
	movs r1, #0
	bl sub_8088E9C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088E90: .4byte gUnknown_0203E768
_08088E94: .4byte sub_8089320
_08088E98: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_8088E9C
sub_8088E9C: @ 0x08088E9C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r6, _08088ED4  @ gUnknown_08A00A98
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _08088ED8
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Create
	adds r4, r0, #0
	adds r0, #0x52
	strb r7, [r0]
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x11]
	adds r0, r4, #0
	bl sub_808929C
	adds r0, r4, #0
	bl sub_80892C0
	b _08088EF0
	.align 2, 0
_08088ED4: .4byte gUnknown_08A00A98
_08088ED8:
	ldrh r0, [r4, #0x30]
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x32]
	strh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	ldrh r0, [r4, #0x36]
	adds r1, r4, #0
	adds r1, #0x42
	strh r0, [r1]
_08088EF0:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x4a
	movs r0, #0xc
	strh r0, [r2]
	adds r7, r4, #0
	adds r7, #0x4e
	strh r1, [r7]
	ldrh r0, [r5, #0x12]
	adds r6, r4, #0
	adds r6, #0x4c
	strh r0, [r6]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _08088F1E
	adds r0, r4, #0
	bl _call_via_r1
_08088F1E:
	movs r0, #1
	bl SetFontGlyphSet
	ldrh r0, [r6]
	bl GetStringFromIndex
	add r2, sp, #4
	mov r1, sp
	bl sub_8003FAC
	movs r0, #0
	bl SetFontGlyphSet
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl sub_80891AC
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x11]
	adds r0, r4, #0
	bl sub_8089210
	bl sub_808A118
	ldrh r0, [r7]
	ldrh r1, [r6]
	bl sub_808A0FC
	ldr r0, _08088F64  @ gUnknown_0203E784
	str r5, [r0]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088F64: .4byte gUnknown_0203E784

	THUMB_FUNC_START sub_8088F68
sub_8088F68: @ 0x08088F68
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	mov r9, r2
	ldr r0, _08089014  @ gUnknown_08A00A98
	movs r1, #3
	bl Proc_Create
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	cmp r7, #0
	bge _08088F9E
	cmp r6, #0
	bge _08088F9E
	bl GetUiHandPrevDisplayX
	adds r7, r0, #0
	bl GetUiHandPrevDisplayY
	adds r6, r0, #0
_08088F9E:
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r2, r5, #0
	adds r2, #0x4a
	movs r0, #0xc
	strh r0, [r2]
	movs r0, #0x4e
	adds r0, r0, r5
	mov r8, r0
	strh r1, [r0]
	adds r4, r5, #0
	adds r4, #0x4c
	mov r1, r9
	strh r1, [r4]
	movs r0, #1
	bl SetFontGlyphSet
	ldrh r0, [r4]
	bl GetStringFromIndex
	add r2, sp, #4
	mov r1, sp
	bl sub_8003FAC
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r5, #0
	bl sub_80892C0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl sub_80891AC
	adds r1, r7, #0
	adds r1, #8
	strh r1, [r5, #0x38]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r5, #0x3a]
	strh r1, [r5, #0x3c]
	strh r0, [r5, #0x3e]
	bl sub_808A118
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r4]
	bl sub_808A0FC
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089014: .4byte gUnknown_08A00A98

	THUMB_FUNC_START sub_8089018
sub_8089018: @ 0x08089018
	push {r4, lr}
	ldr r0, _08089038  @ gUnknown_08A00A98
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08089032
	bl sub_808A118
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_GotoLabel
_08089032:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089038: .4byte gUnknown_08A00A98

	THUMB_FUNC_START sub_808903C
sub_808903C: @ 0x0808903C
	push {r4, lr}
	ldr r0, _0808905C  @ gUnknown_08A00A98
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08089054
	bl sub_808A118
	adds r0, r4, #0
	bl Proc_Delete
_08089054:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808905C: .4byte gUnknown_08A00A98

	THUMB_FUNC_START sub_8089060
sub_8089060: @ 0x08089060
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08089078
	adds r0, r4, #0
	bl _call_via_r1
_08089078:
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl sub_8088E9C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8089088
sub_8089088: @ 0x08089088
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r1, _08089120  @ gUnknown_0203E788
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r5, #0x2c]
	lsls r0, r0, #3
	ldrb r3, [r2, #0x10]
	adds r0, r0, r3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	ldrb r2, [r2, #0x11]
	adds r1, r1, r2
	bl DisplayUiHand
	ldr r6, _08089124  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080890C2
	adds r0, r5, #0
	bl sub_8089354
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080890C2:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080890DA
	adds r0, r5, #0
	bl sub_8089384
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080890DA:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080890F2
	adds r0, r5, #0
	bl sub_80893B4
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080890F2:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808910A
	adds r0, r5, #0
	bl sub_80893E4
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0808910A:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08089128
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
	b _08089146
	.align 2, 0
_08089120: .4byte gUnknown_0203E788
_08089124: .4byte gKeyStatusPtr
_08089128:
	cmp r4, #0
	beq _08089146
	ldr r0, _0808914C  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808913E
	movs r0, #0x67
	bl m4aSongNumStart
_0808913E:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_GotoLabel
_08089146:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808914C: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8089150
sub_8089150: @ 0x08089150
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8089018
	adds r0, r4, #0
	bl Proc_Delete
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START Create6CRText
Create6CRText: @ 0x08089164
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08089180  @ gUnknown_08A00AD0
	bl Proc_CreateBlockingChild
	ldr r2, _08089184  @ gUnknown_0203E788
	movs r1, #0
	strh r1, [r2]
	strh r1, [r2, #2]
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089180: .4byte gUnknown_08A00AD0
_08089184: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_8089188
sub_8089188: @ 0x08089188
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _080891A4  @ gUnknown_08A00AD0
	bl Proc_CreateBlockingChild
	ldr r1, _080891A8  @ gUnknown_0203E788
	strh r4, [r1]
	strh r5, [r1, #2]
	str r6, [r0, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080891A4: .4byte gUnknown_08A00AD0
_080891A8: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_80891AC
sub_80891AC: @ 0x080891AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0xf
	movs r0, #0xf0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl sub_80892D0
	cmp r0, #2
	beq _080891F4
	cmp r0, #2
	bgt _080891D2
	cmp r0, #1
	beq _080891D8
	b _08089200
_080891D2:
	cmp r0, #3
	beq _080891FC
	b _08089200
_080891D8:
	cmp r4, #0x8f
	bgt _080891DE
	movs r4, #0x90
_080891DE:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	bl GetStringFromIndex
	bl GetStringTextWidth
	cmp r0, #8
	ble _080891FE
	adds r5, #0x20
	b _08089200
_080891F4:
	cmp r4, #0x5f
	bgt _080891FE
	movs r4, #0x60
	b _080891FE
_080891FC:
	movs r4, #0x80
_080891FE:
	adds r5, #0x10
_08089200:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8089210
sub_8089210: @ 0x08089210
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x10
	mov r8, r0
	ldr r1, _08089298  @ gUnknown_0203E788
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	adds r7, r7, r0
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _0808925C
	movs r0, #0
	strh r0, [r5, #0x3c]
_0808925C:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble _0808926C
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
_0808926C:
	adds r0, r7, #0
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r2, #0x3e
	ldrsh r0, [r5, r2]
	add r0, r8
	cmp r0, #0xa0
	ble _08089282
	mov r1, r8
	subs r0, r7, r1
	strh r0, [r5, #0x3e]
_08089282:
	ldrh r0, [r5, #0x3c]
	adds r0, #8
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x3e]
	adds r0, #8
	strh r0, [r5, #0x3e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089298: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_808929C
sub_808929C: @ 0x0808929C
	push {r4, r5, lr}
	ldr r4, _080892BC  @ gUnknown_0203E788
	movs r5, #0
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r1, r1, r3
	movs r5, #2
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r2, r2, r3
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080892BC: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_80892C0
sub_80892C0: @ 0x080892C0
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	THUMB_FUNC_START sub_80892D0
sub_80892D0: @ 0x080892D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080892E0  @ 0x0000FFFE
	cmp r4, r0
	bne _080892E4
	movs r0, #3
	b _0808931A
	.align 2, 0
_080892E0: .4byte 0x0000FFFE
_080892E4:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08089314
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08089306
	movs r0, #1
	b _0808931A
_08089306:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08089318
_08089314:
	movs r0, #0
	b _0808931A
_08089318:
	movs r0, #2
_0808931A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8089320
sub_8089320: @ 0x08089320
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldrh r5, [r0, #0x12]
	adds r0, r4, #0
	adds r0, #0x4e
	strh r5, [r0]
	ldrh r0, [r0]
	bl sub_80892D0
	cmp r0, #3
	bne _08089340
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	b _0808934A
_08089340:
	adds r0, r5, #0
	bl GetItemDescId
	adds r1, r4, #0
	adds r1, #0x4c
_0808934A:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8089354
sub_8089354: @ 0x08089354
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	cmp r0, #0
	bne _08089364
	movs r0, #0
	b _0808937E
_08089364:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x40
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0808937C
	adds r0, r2, #0
	bl _call_via_r1
_0808937C:
	movs r0, #1
_0808937E:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8089384
sub_8089384: @ 0x08089384
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _08089394
	movs r0, #0
	b _080893AE
_08089394:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x80
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _080893AC
	adds r0, r2, #0
	bl _call_via_r1
_080893AC:
	movs r0, #1
_080893AE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_80893B4
sub_80893B4: @ 0x080893B4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _080893C4
	movs r0, #0
	b _080893DE
_080893C4:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _080893DC
	adds r0, r2, #0
	bl _call_via_r1
_080893DC:
	movs r0, #1
_080893DE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_80893E4
sub_80893E4: @ 0x080893E4
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x2c]
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08089400
	ldr r0, _08089404  @ gUnknown_08A00D14
	cmp r1, r0
	bne _0808940C
	ldr r0, _08089408  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _0808940C
_08089400:
	movs r0, #0
	b _0808942A
	.align 2, 0
_08089404: .4byte gUnknown_08A00D14
_08089408: .4byte gUnknown_02003BFC
_0808940C:
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #0xc]
	str r0, [r2, #0x2c]
	adds r1, r2, #0
	adds r1, #0x50
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08089428
	adds r0, r2, #0
	bl _call_via_r1
_08089428:
	movs r0, #1
_0808942A:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8089430
sub_8089430: @ 0x08089430
	push {lr}
	adds r2, r0, #0
	ldr r0, _08089450  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808944A
	adds r0, r2, #0
	bl Proc_ClearNativeCallback
_0808944A:
	pop {r0}
	bx r0
	.align 2, 0
_08089450: .4byte gKeyStatusPtr

	THUMB_FUNC_START sub_8089454
sub_8089454: @ 0x08089454
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	bl GetUiHandPrevDisplayX
	adds r4, r0, #0
	bl GetUiHandPrevDisplayY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_8088DE0
	ldr r0, _08089488  @ gUnknown_08A00B00
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08089488: .4byte gUnknown_08A00B00

	THUMB_FUNC_START Loop6C_8A00B20_UpdateOAMData
Loop6C_8A00B20_UpdateOAMData: @ 0x0808948C
	push {lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, _080894A8  @ gUnknown_08A00B10
	ldr r0, [r0, #0x34]
	str r0, [sp]
	movs r0, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080894A8: .4byte gUnknown_08A00B10

	THUMB_FUNC_START sub_80894AC
sub_80894AC: @ 0x080894AC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _080894DC  @ gUnknown_08A00B20
	adds r0, r5, #0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	bne _080894CC
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Create
	adds r1, r0, #0
_080894CC:
	str r6, [r1, #0x2c]
	str r7, [r1, #0x30]
	movs r0, #0
	str r0, [r1, #0x34]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080894DC: .4byte gUnknown_08A00B20

	THUMB_FUNC_START sub_80894E0
sub_80894E0: @ 0x080894E0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, _08089534  @ gUnknown_08A00B20
	adds r0, r7, #0
	bl Proc_Find
	adds r4, r0, #0
	ldr r0, _08089538  @ gUnknown_08A1D79C
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	cmp r4, #0
	bne _08089516
	adds r0, r7, #0
	adds r1, r6, #0
	bl Proc_Create
	adds r4, r0, #0
_08089516:
	mov r0, r8
	str r0, [r4, #0x2c]
	mov r0, r9
	str r0, [r4, #0x30]
	movs r0, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	str r0, [r4, #0x34]
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089534: .4byte gUnknown_08A00B20
_08089538: .4byte gUnknown_08A1D79C

	THUMB_FUNC_START sub_808953C
sub_808953C: @ 0x0808953C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _0808956C  @ gUnknown_08A00B20
	adds r0, r5, #0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	bne _0808955C
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_CreateBlockingChild
	adds r1, r0, #0
_0808955C:
	str r6, [r1, #0x2c]
	str r7, [r1, #0x30]
	movs r0, #0
	str r0, [r1, #0x34]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808956C: .4byte gUnknown_08A00B20

	THUMB_FUNC_START sub_8089570
sub_8089570: @ 0x08089570
	push {lr}
	ldr r0, _08089584  @ gUnknown_08A00B20
	bl Proc_Find
	cmp r0, #0
	beq _08089580
	bl Proc_Delete
_08089580:
	pop {r0}
	bx r0
	.align 2, 0
_08089584: .4byte gUnknown_08A00B20

	THUMB_FUNC_START sub_8089588
sub_8089588: @ 0x08089588
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080895A4  @ gUnknown_08A00B20
	bl Proc_Find
	cmp r0, #0
	beq _0808959C
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
_0808959C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080895A4: .4byte gUnknown_08A00B20

	THUMB_FUNC_START sub_80895A8
sub_80895A8: @ 0x080895A8
	ldr r0, _080895B0  @ gUnknown_0203E784
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080895B0: .4byte gUnknown_0203E784

.align 2, 0
