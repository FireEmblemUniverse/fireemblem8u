	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START InitChapterMap
InitChapterMap: @ 0x080194BC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08019578  @ gUnknown_02001000
	adds r1, r4, #0
	bl LoadChapterMap
	adds r0, r4, #0
	bl LoadChapterMapGfx
	ldr r0, _0801957C  @ gUnknown_0202E4F4
	ldr r6, _08019580  @ gUnknown_0202E4D8
	ldr r4, _08019584  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r6, #0
	bl SetupMapRowPointers
	ldr r0, _08019588  @ gUnknown_0202ECAC
	ldr r5, _0801958C  @ gUnknown_0202E4DC
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r5, #0
	bl SetupMapRowPointers
	ldr r0, _08019590  @ gUnknown_03000810
	ldr r1, _08019594  @ gUnknown_0202E4E0
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl SetupMapRowPointers
	ldr r0, _08019598  @ gUnknown_03000FC8
	ldr r1, _0801959C  @ gUnknown_0202E4E4
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl SetupMapRowPointers
	ldr r0, _080195A0  @ gUnknown_0202F464
	ldr r1, _080195A4  @ gUnknown_0202E4E8
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl SetupMapRowPointers
	ldr r0, _080195A8  @ gUnknown_0202FC1C
	ldr r1, _080195AC  @ gUnknown_0202E4EC
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl SetupMapRowPointers
	ldr r0, _080195B0  @ gUnknown_020303D4
	ldr r1, _080195B4  @ gUnknown_0202E4F0
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl SetupMapRowPointers
	ldr r0, [r6]
	movs r1, #0
	bl ClearMapWith
	ldr r0, [r5]
	movs r1, #0
	bl ClearMapWith
	bl FlushTilesFromBuffer
	bl ApplyTrapMapChanges
	bl FlushTerrainData
	ldr r0, _080195B8  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x75
	bne _08019570
	bl sub_8019624
_08019570:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019578: .4byte gUnknown_02001000
_0801957C: .4byte gUnknown_0202E4F4
_08019580: .4byte gUnknown_0202E4D8
_08019584: .4byte gUnknown_0202E4D4
_08019588: .4byte gUnknown_0202ECAC
_0801958C: .4byte gUnknown_0202E4DC
_08019590: .4byte gUnknown_03000810
_08019594: .4byte gUnknown_0202E4E0
_08019598: .4byte gUnknown_03000FC8
_0801959C: .4byte gUnknown_0202E4E4
_080195A0: .4byte gUnknown_0202F464
_080195A4: .4byte gUnknown_0202E4E8
_080195A8: .4byte gUnknown_0202FC1C
_080195AC: .4byte gUnknown_0202E4EC
_080195B0: .4byte gUnknown_020303D4
_080195B4: .4byte gUnknown_0202E4F0
_080195B8: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_80195BC
sub_80195BC: @ 0x080195BC
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r0, _0801960C  @ gUnknown_02001000
	bl LoadChapterMap
	ldr r0, _08019610  @ gUnknown_0202E4F4
	ldr r6, _08019614  @ gUnknown_0202E4D8
	ldr r4, _08019618  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r6, #0
	bl SetupMapRowPointers
	ldr r0, _0801961C  @ gUnknown_0202ECAC
	ldr r5, _08019620  @ gUnknown_0202E4DC
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r5, #0
	bl SetupMapRowPointers
	ldr r0, [r6]
	movs r1, #0
	bl ClearMapWith
	ldr r0, [r5]
	movs r1, #0
	bl ClearMapWith
	bl FlushTilesFromBuffer
	bl FlushTerrainData
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801960C: .4byte gUnknown_02001000
_08019610: .4byte gUnknown_0202E4F4
_08019614: .4byte gUnknown_0202E4D8
_08019618: .4byte gUnknown_0202E4D4
_0801961C: .4byte gUnknown_0202ECAC
_08019620: .4byte gUnknown_0202E4DC

	THUMB_FUNC_START sub_8019624
sub_8019624: @ 0x08019624
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	ldr r1, _080196FC  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	mov r9, r1
	cmp r6, r0
	blt _0801963E
	b _0801976A
_0801963E:
	ldr r0, _08019700  @ gUnknown_0859A9D4
	mov sl, r0
_08019642:
	movs r4, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r1, r6, #1
	mov r8, r1
	cmp r4, r0
	blt _08019652
	b _0801975C
_08019652:
	ldr r2, _08019704  @ gUnknown_0202E4DC
	mov ip, r2
	lsls r3, r6, #2
	mov r7, sl
	movs r5, #0
_0801965C:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0x3c
	bne _0801974C
	movs r2, #0
	cmp r4, #0
	ble _0801968E
	subs r0, r1, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0801967C
	movs r2, #1
_0801967C:
	cmp r0, #0x2d
	bne _08019682
	movs r2, #1
_08019682:
	cmp r0, #0x20
	bne _08019688
	movs r2, #1
_08019688:
	cmp r0, #0x21
	bne _0801968E
	movs r2, #1
_0801968E:
	cmp r6, #0
	ble _080196B8
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _080196A6
	adds r2, #2
_080196A6:
	cmp r0, #0x2d
	bne _080196AC
	adds r2, #2
_080196AC:
	cmp r0, #0x20
	bne _080196B2
	adds r2, #2
_080196B2:
	cmp r0, #0x21
	bne _080196B8
	adds r2, #2
_080196B8:
	cmp r4, #0
	ble _080196EC
	cmp r6, #0
	ble _080196EC
	mov r1, ip
	ldr r0, [r1]
	adds r1, r3, r0
	ldr r0, [r1]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _080196EC
	ldr r0, [r1, #4]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _080196EC
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _080196EC
	movs r2, #4
_080196EC:
	cmp r2, #2
	beq _08019720
	cmp r2, #2
	bgt _08019708
	cmp r2, #1
	beq _08019712
	b _0801974C
	.align 2, 0
_080196FC: .4byte gUnknown_0202E4D4
_08019700: .4byte gUnknown_0859A9D4
_08019704: .4byte gUnknown_0202E4DC
_08019708:
	cmp r2, #3
	beq _0801972E
	cmp r2, #4
	beq _0801973C
	b _0801974C
_08019712:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb7
	lsls r2, r2, #2
	b _08019748
_08019720:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb6
	lsls r2, r2, #2
	b _08019748
_0801972E:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd6
	lsls r2, r2, #2
	b _08019748
_0801973C:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd7
	lsls r2, r2, #2
_08019748:
	adds r1, r2, #0
	strh r1, [r0]
_0801974C:
	adds r5, #2
	adds r4, #1
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _0801975C
	b _0801965C
_0801975C:
	mov r6, r8
	mov r1, r9
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bge _0801976A
	b _08019642
_0801976A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8019778
sub_8019778: @ 0x08019778
	push {lr}
	ldr r0, _0801979C  @ gUnknown_02001000
	ldr r1, _080197A0  @ gUnknown_0202BCF0
	ldrb r1, [r1, #0xe]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl LoadChapterMap
	bl FlushTilesFromBuffer
	bl ApplyTrapMapChanges
	bl FlushTerrainData
	bl sub_8019624
	pop {r0}
	bx r0
	.align 2, 0
_0801979C: .4byte gUnknown_02001000
_080197A0: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START SetupMapRowPointers
SetupMapRowPointers: @ 0x080197A4
	push {r4, r5, r6, r7, lr}
	mov ip, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r2, _080197E0  @ gUnknown_03000808
	str r0, [r2]
	adds r6, #2
	adds r5, #4
	lsls r1, r5, #2
	adds r4, r0, r1
	movs r3, #0
	adds r7, r2, #0
	cmp r3, r5
	bge _080197D0
_080197C0:
	ldr r1, [r2]
	lsls r0, r3, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r4, r4, r6
	adds r3, #1
	cmp r3, r5
	blt _080197C0
_080197D0:
	ldr r0, [r7]
	adds r0, #8
	mov r1, ip
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080197E0: .4byte gUnknown_03000808

	THUMB_FUNC_START ClearMapWith
ClearMapWith: @ 0x080197E4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r3, r1, #0
	ldr r0, _0801983C  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r1, #4
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #2
	adds r4, r1, #0
	muls r4, r0, r4
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08019808
	subs r4, #1
_08019808:
	movs r0, #0xff
	ands r3, r0
	lsls r0, r3, #8
	adds r3, r3, r0
	mov r0, sp
	strh r3, [r0]
	adds r0, r5, #0
	subs r0, #8
	ldr r1, [r0]
	lsrs r2, r4, #0x1f
	adds r2, r4, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuSet
	adds r0, r5, #0
	bl SetSubjectMap
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801983C: .4byte gUnknown_0202E4D4

	THUMB_FUNC_START sub_8019840
sub_8019840: @ 0x08019840
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080198A8  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r4, r1
	bge _08019874
	adds r5, r7, #0
	adds r2, r6, #0
_0801985A:
	ldr r0, [r2]
	strb r3, [r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldm r2!, {r1}
	adds r0, r0, r1
	subs r0, #1
	strb r3, [r0]
	adds r4, #1
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r4, r0
	blt _0801985A
_08019874:
	movs r1, #0
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r1, r0
	bge _080198A0
	adds r2, r7, #0
_08019880:
	ldr r0, [r6]
	adds r0, r0, r1
	strb r3, [r0]
	movs r4, #2
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r6
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r1
	strb r3, [r0]
	adds r1, #1
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r1, r0
	blt _08019880
_080198A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080198A8: .4byte gUnknown_0202E4D4

	THUMB_FUNC_START LoadChapterMap
LoadChapterMap: @ 0x080198AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetChapterMapPointer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r5, _080198FC  @ gUnknown_0202E4D4
	ldrb r0, [r4]
	strh r0, [r5]
	ldrb r0, [r4, #1]
	strh r0, [r5, #2]
	ldr r4, _08019900  @ gChapterDataAssetTable
	adds r0, r6, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #7]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08019904  @ gUnknown_02030B8C
	bl CopyDataWithPossibleUncomp
	ldr r1, _08019908  @ gUnknown_0202BCB0
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xf0
	strh r0, [r1, #0x28]
	movs r2, #2
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xa0
	strh r0, [r1, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080198FC: .4byte gUnknown_0202E4D4
_08019900: .4byte gChapterDataAssetTable
_08019904: .4byte gUnknown_02030B8C
_08019908: .4byte gUnknown_0202BCB0

	THUMB_FUNC_START LoadChapterMapGfx
LoadChapterMapGfx: @ 0x0801990C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08019968  @ gChapterDataAssetTable
	bl GetROMChapterStruct
	ldrb r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _0801996C  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	adds r0, r4, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _0801994A
	adds r0, r4, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08019970  @ 0x0600C000
	bl CopyDataWithPossibleUncomp
_0801994A:
	adds r0, r4, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl CopyToPaletteBuffer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019968: .4byte gChapterDataAssetTable
_0801996C: .4byte 0x06008000
_08019970: .4byte 0x0600C000

	THUMB_FUNC_START sub_8019974
sub_8019974: @ 0x08019974
	push {r4, lr}
	ldr r4, _0801999C  @ gChapterDataAssetTable
	ldr r0, _080199A0  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801999C: .4byte gChapterDataAssetTable
_080199A0: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START FlushTilesFromBuffer
FlushTilesFromBuffer: @ 0x080199A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08019A58  @ gUnknown_0859A9D4
	ldr r0, [r3]
	mov r9, r0
	ldr r5, _08019A5C  @ gUnknown_02001000
	ldr r1, _08019A60  @ gUnknown_0202E4D4
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	adds r5, #2
	movs r4, #2
	ldrsh r2, [r1, r4]
	lsls r0, r2, #2
	add r0, r9
	mov ip, r0
	movs r4, #0
	mov sl, r1
	cmp r4, r2
	bge _08019A1A
	mov r7, sl
_080199D4:
	lsls r3, r4, #2
	mov r1, r9
	adds r0, r3, r1
	mov r1, ip
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #1
	add ip, r0
	movs r2, #0
	adds r6, r4, #1
	cmp r2, r1
	bge _08019A10
	ldr r1, _08019A58  @ gUnknown_0859A9D4
	mov r8, r1
	adds r4, r3, #0
_080199F4:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r5]
	strh r1, [r0]
	adds r5, #2
	adds r2, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r2, r0
	blt _080199F4
_08019A10:
	adds r4, r6, #0
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r4, r0
	blt _080199D4
_08019A1A:
	ldr r1, _08019A58  @ gUnknown_0859A9D4
	ldr r0, [r1]
	lsls r1, r4, #2
	adds r1, r1, r0
	subs r1, #4
	ldr r5, [r1]
	movs r2, #0
	mov r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r2, r0
	bge _08019A42
	movs r1, #0
_08019A34:
	strh r1, [r5]
	adds r5, #2
	adds r2, #1
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r2, r0
	blt _08019A34
_08019A42:
	mov r1, sl
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r1, #2]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019A58: .4byte gUnknown_0859A9D4
_08019A5C: .4byte gUnknown_02001000
_08019A60: .4byte gUnknown_0202E4D4

	THUMB_FUNC_START FlushTerrainData
FlushTerrainData: @ 0x08019A64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r0, _08019AE4  @ gUnknown_0202E4D4
	mov r9, r0
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _08019AD2
	mov r8, r9
	ldr r3, _08019AE8  @ gUnknown_0859A9D4
	mov sl, r3
_08019A82:
	movs r3, #0
	mov r4, r8
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r6, r1, #1
	cmp r3, r0
	bge _08019AC6
	ldr r4, _08019AEC  @ gUnknown_0202E4DC
	mov ip, r4
	lsls r4, r1, #2
	ldr r5, _08019AF0  @ gUnknown_0859A9D0
	mov r7, sl
_08019A9A:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, [r0]
	adds r2, r2, r3
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r3, r0
	blt _08019A9A
_08019AC6:
	adds r1, r6, #0
	mov r2, r9
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r1, r0
	blt _08019A82
_08019AD2:
	bl UpdateAllLightRunes
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019AE4: .4byte gUnknown_0202E4D4
_08019AE8: .4byte gUnknown_0859A9D4
_08019AEC: .4byte gUnknown_0202E4DC
_08019AF0: .4byte gUnknown_0859A9D0

	THUMB_FUNC_START GetSomeTerrainToChangeAtSomePosition
GetSomeTerrainToChangeAtSomePosition: @ 0x08019AF4
	ldr r2, _08019B10  @ gUnknown_0859A9D4
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, _08019B14  @ gUnknown_0859A9D0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08019B10: .4byte gUnknown_0859A9D4
_08019B14: .4byte gUnknown_0859A9D0

	THUMB_FUNC_START UpdateGameTileGfx
UpdateGameTileGfx: @ 0x08019B18
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	lsls r2, r2, #7
	adds r0, r0, r2
	lsls r1, r1, #2
	adds r5, r0, r1
	ldr r0, _08019B7C  @ gUnknown_0859A9D4
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #1
	ldr r1, _08019B80  @ gUnknown_02030B8C
	adds r2, r0, r1
	ldr r0, _08019B84  @ gUnknown_0202E4E8
	ldr r0, [r0]
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r3, #0xb0
	lsls r3, r3, #8
	cmp r0, #0
	beq _08019B52
	movs r3, #0xc0
	lsls r3, r3, #7
_08019B52:
	ldrh r0, [r2]
	adds r0, r3, r0
	strh r0, [r5]
	adds r2, #2
	ldrh r0, [r2]
	adds r0, r3, r0
	strh r0, [r5, #2]
	adds r2, #2
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r0, [r2]
	adds r0, r3, r0
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #2]
	adds r0, r3, r0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019B7C: .4byte gUnknown_0859A9D4
_08019B80: .4byte gUnknown_02030B8C
_08019B84: .4byte gUnknown_0202E4E8

	THUMB_FUNC_START nullsub_8
nullsub_8: @ 0x08019B88
	bx lr

	THUMB_FUNC_START sub_8019B8C
sub_8019B8C: @ 0x08019B8C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x10]
	lsls r0, r0, #5
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r4, r4, r0
	cmp r4, #0
	bne _08019BA6
	bl nullsub_8
_08019BA6:
	ldr r0, _08019BC8  @ gUnknown_0202E4E0
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08019BD0
	movs r1, #0x85
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _08019BCC  @ 0x00004281
	b _08019C0A
	.align 2, 0
_08019BC8: .4byte gUnknown_0202E4E0
_08019BCC: .4byte 0x00004281
_08019BD0:
	ldr r0, _08019BF4  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _08019C28
	ldrh r0, [r4]
	cmp r0, #0
	beq _08019C00
	ldr r1, _08019BF8  @ 0x00005284
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _08019BFC  @ 0x00005285
	b _08019C0A
	.align 2, 0
_08019BF4: .4byte gUnknown_0202E4E4
_08019BF8: .4byte 0x00005284
_08019BFC: .4byte 0x00005285
_08019C00:
	movs r1, #0xa5
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _08019C24  @ 0x00005281
_08019C0A:
	adds r0, r2, #0
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	b _08019C36
	.align 2, 0
_08019C24: .4byte 0x00005281
_08019C28:
	strh r1, [r4]
	strh r1, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
_08019C36:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START UpdateGameTilesGraphics
UpdateGameTilesGraphics: @ 0x08019C3C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _08019CB0  @ gUnknown_0202BCB0
	ldrh r1, [r0, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x24]
	ldrh r1, [r0, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x26]
	movs r5, #9
	adds r7, r0, #0
_08019C56:
	movs r4, #0xe
	subs r6, r5, #1
_08019C5A:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _08019CB4  @ gBG3TilemapBuffer
	adds r1, r4, #0
	adds r2, r5, #0
	bl UpdateGameTileGfx
	subs r4, #1
	cmp r4, #0
	bge _08019C5A
	adds r5, r6, #0
	cmp r5, #0
	bge _08019C56
	movs r0, #8
	bl BG_EnableSyncByMask
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _08019CB8  @ gLCDControlBuffer
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
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019CB0: .4byte gUnknown_0202BCB0
_08019CB4: .4byte gBG3TilemapBuffer
_08019CB8: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_8019CBC
sub_8019CBC: @ 0x08019CBC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	ldr r1, _08019D20  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x24]
	ldrh r0, [r1, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x26]
	movs r5, #9
	adds r7, r1, #0
_08019CE0:
	movs r4, #0xe
	subs r6, r5, #1
_08019CE4:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _08019D24  @ gBG2TilemapBuffer
	adds r1, r4, #0
	adds r2, r5, #0
	bl UpdateGameTileGfx
	subs r4, #1
	cmp r4, #0
	bge _08019CE4
	adds r5, r6, #0
	cmp r5, #0
	bge _08019CE0
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019D20: .4byte gUnknown_0202BCB0
_08019D24: .4byte gBG2TilemapBuffer

	THUMB_FUNC_START sub_8019D28
sub_8019D28: @ 0x08019D28
	push {r4, r5, lr}
	ldr r2, _08019D58  @ gUnknown_0202BCB0
	ldrh r4, [r2, #0xc]
	movs r0, #0xc
	ldrsh r3, [r2, r0]
	ldrh r0, [r2, #0x10]
	movs r5, #0x10
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019D6C
	cmp r3, r1
	ble _08019D5C
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019D6C
	movs r0, #0xf
	bl sub_8019E08
	b _08019D6C
	.align 2, 0
_08019D58: .4byte gUnknown_0202BCB0
_08019D5C:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019D6C
	movs r0, #0
	bl sub_8019E08
_08019D6C:
	ldr r2, _08019D9C  @ gUnknown_0202BCB0
	ldrh r4, [r2, #0xe]
	movs r5, #0xe
	ldrsh r3, [r2, r5]
	ldrh r0, [r2, #0x12]
	movs r5, #0x12
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019DB0
	cmp r3, r1
	ble _08019DA0
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019DB0
	movs r0, #0xa
	bl sub_8019ED4
	b _08019DB0
	.align 2, 0
_08019D9C: .4byte gUnknown_0202BCB0
_08019DA0:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019DB0
	movs r0, #0
	bl sub_8019ED4
_08019DB0:
	ldr r4, _08019E04  @ gUnknown_0202BCB0
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x10]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #4
	ldrh r1, [r4, #0xc]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #4
	ldrh r2, [r4, #0xe]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl BG_SetPosition
	ldrb r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08019DFC
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #4
	ldrh r1, [r4, #0xc]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #4
	ldrh r2, [r4, #0xe]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
_08019DFC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019E04: .4byte gUnknown_0202BCB0

	THUMB_FUNC_START sub_8019E08
sub_8019E08: @ 0x08019E08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019E7C  @ gUnknown_0202BCB0
	ldrh r2, [r4, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r3, r1, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	ldrh r3, [r4, #0x24]
	subs r2, r2, r3
	adds r7, r0, r2
	movs r0, #0xf
	ands r7, r0
	ldrh r0, [r4, #0x26]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	ldrb r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08019E84
	movs r6, #0xa
	movs r4, #0xf
_08019E56:
	mov r0, r9
	adds r2, r0, r6
	ands r2, r4
	mov r1, sl
	adds r0, r1, r6
	str r0, [sp]
	ldr r0, _08019E80  @ gBG3TilemapBuffer
	adds r1, r7, #0
	mov r3, r8
	bl UpdateGameTileGfx
	subs r6, #1
	cmp r6, #0
	bge _08019E56
	movs r0, #8
	bl BG_EnableSyncByMask
	b _08019EBA
	.align 2, 0
_08019E7C: .4byte gUnknown_0202BCB0
_08019E80: .4byte gBG3TilemapBuffer
_08019E84:
	movs r6, #0xa
_08019E86:
	mov r0, r9
	adds r4, r0, r6
	movs r0, #0xf
	ands r4, r0
	mov r1, sl
	adds r5, r1, r6
	str r5, [sp]
	ldr r0, _08019ECC  @ gBG3TilemapBuffer
	adds r1, r7, #0
	adds r2, r4, #0
	mov r3, r8
	bl UpdateGameTileGfx
	str r4, [sp]
	ldr r0, _08019ED0  @ gBG2TilemapBuffer
	mov r1, r8
	adds r2, r5, #0
	adds r3, r7, #0
	bl sub_8019B8C
	subs r6, #1
	cmp r6, #0
	bge _08019E86
	movs r0, #0xc
	bl BG_EnableSyncByMask
_08019EBA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019ECC: .4byte gBG3TilemapBuffer
_08019ED0: .4byte gBG2TilemapBuffer

	THUMB_FUNC_START sub_8019ED4
sub_8019ED4: @ 0x08019ED4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019F48  @ gUnknown_0202BCB0
	ldrh r2, [r4, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	lsls r1, r2, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r3, [r4, #0xe]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	adds r1, r0, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r1, [r4, #0x24]
	subs r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r9, r2
	ldrh r1, [r4, #0x26]
	subs r3, r3, r1
	adds r7, r0, r3
	movs r0, #0xf
	ands r7, r0
	ldrb r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08019F50
	movs r6, #0xf
	movs r4, #0xf
_08019F22:
	mov r0, r9
	adds r1, r0, r6
	ands r1, r4
	mov r0, sl
	adds r3, r0, r6
	mov r0, r8
	str r0, [sp]
	ldr r0, _08019F4C  @ gBG3TilemapBuffer
	adds r2, r7, #0
	bl UpdateGameTileGfx
	subs r6, #1
	cmp r6, #0
	bge _08019F22
	movs r0, #8
	bl BG_EnableSyncByMask
	b _08019F88
	.align 2, 0
_08019F48: .4byte gUnknown_0202BCB0
_08019F4C: .4byte gBG3TilemapBuffer
_08019F50:
	movs r6, #0xf
_08019F52:
	mov r0, r9
	adds r4, r0, r6
	movs r0, #0xf
	ands r4, r0
	mov r0, sl
	adds r5, r0, r6
	mov r0, r8
	str r0, [sp]
	ldr r0, _08019F98  @ gBG3TilemapBuffer
	adds r1, r4, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl UpdateGameTileGfx
	str r7, [sp]
	ldr r0, _08019F9C  @ gBG2TilemapBuffer
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl sub_8019B8C
	subs r6, #1
	cmp r6, #0
	bge _08019F52
	movs r0, #0xc
	bl BG_EnableSyncByMask
_08019F88:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019F98: .4byte gBG3TilemapBuffer
_08019F9C: .4byte gBG2TilemapBuffer

	THUMB_FUNC_START UpdateUnitMapAndVision
UpdateUnitMapAndVision: @ 0x08019FA0
	push {r4, r5, r6, r7, lr}
	movs r7, #1
_08019FA4:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019FF8
	ldr r0, [r6]
	cmp r0, #0
	beq _08019FF8
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019FF8
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0801A088  @ gUnknown_0202E4D8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
	ldr r0, _0801A08C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08019FF8
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	adds r0, r6, #0
	bl GetUnitFogViewRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
_08019FF8:
	adds r7, #1
	cmp r7, #0x7f
	ble _08019FA4
	ldr r0, _0801A08C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	beq _0801A0D0
	movs r7, #0x81
_0801A008:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0801A0BE
	ldr r2, [r6]
	cmp r2, #0
	beq _0801A0BE
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801A0BE
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801A048
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801A048:
	ldr r0, _0801A08C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _0801A098
	ldr r0, _0801A090  @ gUnknown_0202E4E8
	ldr r0, [r0]
	lsls r1, r2, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A098
	ldr r0, _0801A094  @ gUnknown_0202E4EC
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r2, [r0]
	adds r2, r2, r3
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r6, #0xc]
	b _0801A0BE
	.align 2, 0
_0801A088: .4byte gUnknown_0202E4D8
_0801A08C: .4byte gUnknown_0202BCF0
_0801A090: .4byte gUnknown_0202E4E8
_0801A094: .4byte gUnknown_0202E4EC
_0801A098:
	ldr r0, _0801A0C8  @ gUnknown_0202E4D8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
	ldr r1, [r6, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A0BE
	ldr r0, _0801A0CC  @ 0xFFFFFDFF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r1, r0
	str r1, [r6, #0xc]
_0801A0BE:
	adds r7, #1
	cmp r7, #0xc5
	ble _0801A008
	b _0801A164
	.align 2, 0
_0801A0C8: .4byte gUnknown_0202E4D8
_0801A0CC: .4byte 0xFFFFFDFF
_0801A0D0:
	movs r7, #0x81
_0801A0D2:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0801A15E
	ldr r2, [r6]
	cmp r2, #0
	beq _0801A15E
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801A15E
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801A112
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801A112:
	ldr r0, _0801A140  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _0801A150
	ldr r0, _0801A144  @ gUnknown_0202E4E8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A148
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	b _0801A14E
	.align 2, 0
_0801A140: .4byte gUnknown_0202BCF0
_0801A144: .4byte gUnknown_0202E4E8
_0801A148:
	ldr r0, [r6, #0xc]
	ldr r1, _0801A16C  @ 0xFFFFFDFF
	ands r0, r1
_0801A14E:
	str r0, [r6, #0xc]
_0801A150:
	ldr r0, _0801A170  @ gUnknown_0202E4D8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
_0801A15E:
	adds r7, #1
	cmp r7, #0xc5
	ble _0801A0D2
_0801A164:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A16C: .4byte 0xFFFFFDFF
_0801A170: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START UpdateTrapFogVision
UpdateTrapFogVision: @ 0x0801A174
	push {r4, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	b _0801A194
_0801A180:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	bne _0801A192
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #3]
	movs r3, #1
	bl MapAddInRange
_0801A192:
	adds r4, #8
_0801A194:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0801A180
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START UpdateTrapHiddenStates
UpdateTrapHiddenStates: @ 0x0801A1A0
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetTrap
	adds r3, r0, #0
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _0801A1E6
	ldr r6, _0801A1EC  @ gUnknown_0202E4D8
	ldr r5, _0801A1F0  @ gUnknown_0202E4EC
_0801A1B4:
	ldrb r0, [r3, #2]
	cmp r0, #0xb
	bne _0801A1DE
	ldrb r1, [r3, #1]
	ldr r0, [r6]
	lsls r1, r1, #2
	adds r0, r1, r0
	ldrb r4, [r3]
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A1DE
	ldr r0, [r5]
	adds r0, r1, r0
	ldr r2, [r0]
	adds r2, r2, r4
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
_0801A1DE:
	adds r3, #8
	ldrb r0, [r3, #2]
	cmp r0, #0
	bne _0801A1B4
_0801A1E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801A1EC: .4byte gUnknown_0202E4D8
_0801A1F0: .4byte gUnknown_0202E4EC

	THUMB_FUNC_START RefreshFogAndUnitMaps
RefreshFogAndUnitMaps: @ 0x0801A1F4
	push {lr}
	ldr r0, _0801A230  @ gUnknown_0202E4D8
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	ldr r0, _0801A234  @ gUnknown_0202E4EC
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	ldr r0, _0801A238  @ gUnknown_0202E4E8
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _0801A23C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0801A21A
	movs r1, #1
_0801A21A:
	adds r0, r2, #0
	bl ClearMapWith
	bl UpdateTrapFogVision
	bl UpdateUnitMapAndVision
	bl UpdateTrapHiddenStates
	pop {r0}
	bx r0
	.align 2, 0
_0801A230: .4byte gUnknown_0202E4D8
_0801A234: .4byte gUnknown_0202E4EC
_0801A238: .4byte gUnknown_0202E4E8
_0801A23C: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START GetTerrainNameString
GetTerrainNameString: @ 0x0801A240
	push {lr}
	ldr r1, _0801A254  @ gUnknown_0880D374
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetStringFromIndex
	pop {r1}
	bx r1
	.align 2, 0
_0801A254: .4byte gUnknown_0880D374

	THUMB_FUNC_START GetTerrainHealAmount
GetTerrainHealAmount: @ 0x0801A258
	ldr r1, _0801A264  @ gUnknown_0880C744
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0801A264: .4byte gUnknown_0880C744

	THUMB_FUNC_START GetTerrainSomething
GetTerrainSomething: @ 0x0801A268
	ldr r1, _0801A274  @ gUnknown_0880C785
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0801A274: .4byte gUnknown_0880C785

	THUMB_FUNC_START sub_801A278
sub_801A278: @ 0x0801A278
	push {r4, r5, r6, lr}
	ldr r6, _0801A2DC  @ gUnknown_02030B8C
	bl sub_800D208
	cmp r0, #0
	beq _0801A290
	ldr r0, _0801A2E0  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801A2CC
_0801A290:
	ldrh r1, [r6]
	ldr r4, _0801A2E4  @ 0x000003FF
	adds r0, r4, #0
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #3
	adds r0, r0, r5
	adds r6, #2
	bl RegisterBlankTile
	ldrh r1, [r6]
	adds r0, r4, #0
	ands r0, r1
	adds r0, r0, r5
	adds r6, #2
	bl RegisterBlankTile
	ldrh r1, [r6]
	adds r0, r4, #0
	ands r0, r1
	adds r0, r0, r5
	adds r6, #2
	bl RegisterBlankTile
	ldrh r0, [r6]
	ands r4, r0
	adds r4, r4, r5
	adds r0, r4, #0
	bl RegisterBlankTile
_0801A2CC:
	ldr r1, _0801A2E8  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801A2DC: .4byte gUnknown_02030B8C
_0801A2E0: .4byte gUnknown_0202BCB0
_0801A2E4: .4byte 0x000003FF
_0801A2E8: .4byte gPaletteBuffer

	THUMB_FUNC_START RevertMapChangesById
RevertMapChangesById: @ 0x0801A2EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0801A37C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterMapPointer
	ldr r6, _0801A380  @ gUnknown_02001000
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	adds r0, r4, #0
	bl GetMapChangesPointerById
	adds r4, r0, #0
	ldrb r5, [r4, #2]
	ldrb r0, [r4, #4]
	adds r0, r5, r0
	cmp r5, r0
	bge _0801A372
	ldr r0, _0801A384  @ gUnknown_0202E4D4
	mov r8, r0
	adds r6, #2
	mov ip, r6
	ldr r7, _0801A388  @ gUnknown_0859A9D4
_0801A324:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	muls r0, r5, r0
	ldrb r2, [r4, #1]
	adds r0, r0, r2
	lsls r0, r0, #1
	mov r1, ip
	adds r6, r0, r1
	ldr r1, [r7]
	lsls r0, r5, #2
	adds r0, r0, r1
	lsls r1, r2, #1
	ldr r0, [r0]
	adds r3, r0, r1
	ldrb r0, [r4, #3]
	adds r0, r2, r0
	adds r5, #1
	cmp r2, r0
	bge _0801A364
_0801A34C:
	ldrh r0, [r6]
	strh r0, [r3]
	adds r6, #2
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #3]
	adds r0, r0, r1
	cmp r2, r0
	blt _0801A34C
_0801A364:
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #4]
	adds r0, r0, r1
	cmp r5, r0
	blt _0801A324
_0801A372:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A37C: .4byte gUnknown_0202BCF0
_0801A380: .4byte gUnknown_02001000
_0801A384: .4byte gUnknown_0202E4D4
_0801A388: .4byte gUnknown_0859A9D4

	THUMB_FUNC_START FillMovementMapForUnit
FillMovementMapForUnit: @ 0x0801A38C
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl StoreMovCostTable
	ldr r0, _0801A3C4  @ gUnknown_0202E4E0
	ldr r1, [r0]
	ldr r0, _0801A3C8  @ gUnknown_030049A0
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	ldr r3, [r4, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A3C4: .4byte gUnknown_0202E4E0
_0801A3C8: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillMovementMapForUnitAndMovement
FillMovementMapForUnitAndMovement: @ 0x0801A3CC
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitMovementCost
	bl StoreMovCostTable
	ldr r0, _0801A400  @ gUnknown_0202E4E0
	ldr r1, [r0]
	ldr r0, _0801A404  @ gUnknown_030049A0
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl FillMovementMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A400: .4byte gUnknown_0202E4E0
_0801A404: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillMovementMapForUnitPosition
FillMovementMapForUnitPosition: @ 0x0801A408
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl StoreMovCostTable
	ldr r0, _0801A434  @ gUnknown_0202E4E0
	ldr r1, [r0]
	ldr r0, _0801A438  @ gUnknown_030049A0
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A434: .4byte gUnknown_0202E4E0
_0801A438: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillMovementRangeMapSomehow
FillMovementRangeMapSomehow: @ 0x0801A43C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl StoreMovCostTable
	ldr r0, _0801A464  @ gUnknown_0202E4E4
	ldr r1, [r0]
	ldr r0, _0801A468  @ gUnknown_030049A0
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl FillMovementMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A464: .4byte gUnknown_0202E4E4
_0801A468: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillMovementMapSomehow
FillMovementMapSomehow: @ 0x0801A46C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl StoreMovCostTable
	ldr r0, _0801A494  @ gUnknown_0202E4E0
	ldr r1, [r0]
	ldr r0, _0801A498  @ gUnknown_030049A0
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl FillMovementMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A494: .4byte gUnknown_0202E4E0
_0801A498: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillMovementMapForUnitAt
FillMovementMapForUnitAt: @ 0x0801A49C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl GetUnitMovementCost
	bl StoreMovCostTable
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	bl FillMovementMap
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START StoreMovCostTable
StoreMovCostTable: @ 0x0801A4CC
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r4, _0801A4E8  @ gUnknown_03004BB0
_0801A4D4:
	adds r0, r2, r4
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x40
	ble _0801A4D4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A4E8: .4byte gUnknown_03004BB0

	THUMB_FUNC_START FillMovementMap
FillMovementMap: @ 0x0801A4EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, _0801A50C  @ gUnknown_03004E60
	ldr r0, _0801A510  @ gUnknown_030049B0
	str r0, [r1, #4]
	ldr r0, _0801A514  @ gUnknown_03004C50
	str r0, [r1]
	strb r2, [r1, #9]
	adds r6, r1, #0
	cmp r3, #0
	bne _0801A518
	strb r3, [r6, #8]
	b _0801A51E
	.align 2, 0
_0801A50C: .4byte gUnknown_03004E60
_0801A510: .4byte gUnknown_030049B0
_0801A514: .4byte gUnknown_03004C50
_0801A518:
	movs r0, #1
	strb r0, [r6, #8]
	strb r3, [r6, #0xa]
_0801A51E:
	movs r0, #0
	mov r8, r0
	movs r0, #0x78
	strb r0, [r6, #0xb]
	ldr r4, _0801A56C  @ gUnknown_030049A0
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl ClearMapWith
	ldr r0, [r6, #4]
	strb r5, [r0]
	ldr r0, [r6, #4]
	strb r7, [r0, #1]
	ldr r1, [r6, #4]
	movs r0, #5
	strb r0, [r1, #2]
	ldr r0, [r6, #4]
	mov r1, r8
	strb r1, [r0, #3]
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r6, #4]
	adds r0, #4
	str r0, [r6, #4]
	movs r1, #4
	strb r1, [r0, #2]
	bl CallARM_FillMovementMap
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A56C: .4byte gUnknown_030049A0

	THUMB_FUNC_START sub_801A570
sub_801A570: @ 0x0801A570
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	mov ip, r2
	ldr r5, _0801A62C  @ gUnknown_03004E60
	ldr r1, [r5]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	add ip, r0
	ldr r2, _0801A630  @ gUnknown_03004BB0
	ldr r0, _0801A634  @ gUnknown_0202E4DC
	ldr r0, [r0]
	mov r3, ip
	lsls r7, r3, #2
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r3, [r0]
	adds r3, r3, r2
	ldrb r0, [r1, #1]
	ldr r4, _0801A638  @ gUnknown_030049A0
	ldr r2, [r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r7, r2
	ldr r1, [r2]
	adds r1, r1, r6
	ldrb r1, [r1]
	cmp r0, r1
	bge _0801A622
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0801A5F0
	ldr r0, _0801A63C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r2, [r0]
	cmp r2, #0
	beq _0801A5F0
	ldrb r0, [r5, #0xa]
	eors r0, r2
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0801A622
_0801A5F0:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r5, #9]
	cmp r0, r1
	bgt _0801A622
	ldr r0, [r5, #4]
	strb r6, [r0]
	ldr r0, [r5, #4]
	mov r2, ip
	strb r2, [r0, #1]
	ldr r0, [r5, #4]
	mov r1, r8
	strb r1, [r0, #2]
	ldr r0, [r5, #4]
	strb r3, [r0, #3]
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	ldr r1, [r4]
	mov r2, ip
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	strb r3, [r0]
_0801A622:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A62C: .4byte gUnknown_03004E60
_0801A630: .4byte gUnknown_03004BB0
_0801A634: .4byte gUnknown_0202E4DC
_0801A638: .4byte gUnknown_030049A0
_0801A63C: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START sub_801A640
sub_801A640: @ 0x0801A640
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	mov r9, r1
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0
	mov ip, r0
	ldr r1, _0801A690  @ gUnknown_030049A0
	ldr r0, [r1]
	mov r3, r9
	lsls r2, r3, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801A672
	b _0801A7D6
_0801A672:
	mov r4, sp
	add r7, sp, #4
	mov sl, r7
	mov r8, r2
_0801A67A:
	ldr r0, _0801A694  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	cmp r6, r0
	bne _0801A698
	ldrb r0, [r4]
	movs r3, #0xff
	orrs r0, r3
	b _0801A6A2
	.align 2, 0
_0801A690: .4byte gUnknown_030049A0
_0801A694: .4byte gUnknown_0202E4D4
_0801A698:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
_0801A6A2:
	strb r0, [r4]
	cmp r6, #0
	bne _0801A6B0
	ldrb r0, [r4, #1]
	movs r7, #0xff
	orrs r0, r7
	b _0801A6BC
_0801A6B0:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
_0801A6BC:
	strb r0, [r4, #1]
	ldr r2, _0801A6D4  @ gUnknown_0202E4D4
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r0, #1
	cmp r9, r0
	bne _0801A6D8
	ldrb r0, [r4, #3]
	movs r7, #0xff
	orrs r0, r7
	b _0801A6E2
	.align 2, 0
_0801A6D4: .4byte gUnknown_0202E4D4
_0801A6D8:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
_0801A6E2:
	strb r0, [r4, #3]
	mov r0, r9
	cmp r0, #0
	bne _0801A6F2
	ldrb r0, [r4, #2]
	movs r1, #0xff
	orrs r0, r1
	b _0801A6FE
_0801A6F2:
	ldr r0, [r1]
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
_0801A6FE:
	strb r0, [r4, #2]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r7, #0
	movs r2, #0
	ldr r3, [sp, #8]
	adds r3, #1
	str r3, [sp, #0x10]
_0801A70E:
	mov r3, sp
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _0801A71A
	adds r1, r0, #0
_0801A71A:
	adds r2, #1
	cmp r2, #3
	ble _0801A70E
	movs r2, #0
	adds r5, r1, #0
	add r3, sp, #4
_0801A726:
	mov r1, sp
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r5, r0
	bne _0801A744
	adds r1, r7, #0
	lsls r0, r1, #0x10
	movs r7, #0x80
	lsls r7, r7, #9
	adds r0, r0, r7
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r3, r1
	strb r2, [r1]
_0801A744:
	adds r2, #1
	cmp r2, #3
	ble _0801A726
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0801A76A
	cmp r0, #2
	bgt _0801A75C
	cmp r0, #1
	beq _0801A766
	b _0801A77E
_0801A75C:
	cmp r0, #3
	beq _0801A76E
	cmp r0, #4
	beq _0801A772
	b _0801A77E
_0801A766:
	mov r0, sl
	b _0801A77A
_0801A76A:
	movs r0, #2
	b _0801A774
_0801A76E:
	movs r0, #3
	b _0801A774
_0801A772:
	movs r0, #4
_0801A774:
	bl NextRN_N
	add r0, sl
_0801A77A:
	ldrb r0, [r0]
	mov ip, r0
_0801A77E:
	mov r2, ip
	ldr r1, [sp, #8]
	strb r2, [r1]
	ldr r3, [sp, #0x10]
	str r3, [sp, #8]
	mov r0, ip
	cmp r0, #1
	beq _0801A7A6
	cmp r0, #1
	bgt _0801A798
	cmp r0, #0
	beq _0801A7A2
	b _0801A7C0
_0801A798:
	cmp r0, #2
	beq _0801A7B4
	cmp r0, #3
	beq _0801A7AA
	b _0801A7C0
_0801A7A2:
	adds r6, #1
	b _0801A7C0
_0801A7A6:
	subs r6, #1
	b _0801A7C0
_0801A7AA:
	movs r7, #4
	add r8, r7
	movs r0, #1
	add r9, r0
	b _0801A7C0
_0801A7B4:
	movs r1, #4
	negs r1, r1
	add r8, r1
	movs r2, #1
	negs r2, r2
	add r9, r2
_0801A7C0:
	ldr r1, _0801A7F0  @ gUnknown_030049A0
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801A7D6
	b _0801A67A
_0801A7D6:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl sub_801A7F4
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A7F0: .4byte gUnknown_030049A0

	THUMB_FUNC_START sub_801A7F4
sub_801A7F4: @ 0x0801A7F4
	push {lr}
	sub sp, #0x40
	adds r3, r0, #0
	mov r2, sp
	cmp r1, r3
	bls _0801A80C
_0801A800:
	subs r1, #1
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #1
	cmp r1, r3
	bhi _0801A800
_0801A80C:
	movs r0, #4
	strb r0, [r2]
	mov r2, sp
	b _0801A81A
_0801A814:
	strb r0, [r3]
	adds r2, #1
	adds r3, #1
_0801A81A:
	ldrb r0, [r2]
	cmp r0, #4
	bne _0801A814
	movs r0, #4
	strb r0, [r3]
	add sp, #0x40
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_801A82C
sub_801A82C: @ 0x0801A82C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r3, r1, #0
	adds r4, r2, #0
	ldr r5, _0801A840  @ gUnknown_02033EFC
	ldr r6, _0801A844  @ gUnknown_0203A958
	ldr r0, _0801A848  @ gUnknown_0202E4EC
	mov ip, r0
	b _0801A84E
	.align 2, 0
_0801A840: .4byte gUnknown_02033EFC
_0801A844: .4byte gUnknown_0203A958
_0801A848: .4byte gUnknown_0202E4EC
_0801A84C:
	adds r5, #1
_0801A84E:
	strb r3, [r6, #0xe]
	strb r4, [r6, #0xf]
	ldrb r0, [r5]
	cmp r0, #1
	beq _0801A876
	cmp r0, #1
	bgt _0801A862
	cmp r0, #0
	beq _0801A872
	b _0801A878
_0801A862:
	cmp r0, #2
	beq _0801A86E
	cmp r0, #3
	bne _0801A878
	subs r4, #1
	b _0801A878
_0801A86E:
	adds r4, #1
	b _0801A878
_0801A872:
	subs r3, #1
	b _0801A878
_0801A876:
	adds r3, #1
_0801A878:
	ldr r0, [r7]
	ldr r2, [r7, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	ldr r0, _0801A8B0  @ gUnknown_02001808
	ands r1, r0
	lsls r2, r4, #2
	cmp r1, #0
	bne _0801A8B4
	mov r1, ip
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A8B4
	movs r0, #4
	strb r0, [r5, #1]
	movs r0, #0x1e
	strb r0, [r6, #0x11]
	strb r3, [r6, #0xe]
	strb r4, [r6, #0xf]
	b _0801A8DC
	.align 2, 0
_0801A8B0: .4byte gUnknown_02001808
_0801A8B4:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801A8D6
	movs r0, #0xa
	strb r0, [r5]
	movs r0, #4
	strb r0, [r5, #1]
	movs r0, #0x1e
	strb r0, [r6, #0x11]
	b _0801A8DC
_0801A8D6:
	ldrb r0, [r5]
	cmp r0, #4
	bne _0801A84C
_0801A8DC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_801A8E4
sub_801A8E4: @ 0x0801A8E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801A9C4  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r4, r0, #1
	ldr r7, _0801A9C8  @ gUnknown_03004E60
	mov r9, r7
	cmp r4, #0
	blt _0801A9AC
	mov ip, r1
	mov sl, r9
_0801A902:
	mov r1, ip
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r7, r4, #1
	mov r8, r7
	cmp r3, #0
	blt _0801A9A6
	lsls r5, r4, #2
	mov r6, sl
_0801A916:
	ldr r1, _0801A9CC  @ gUnknown_0202E4E0
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _0801A9A0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r2, [r6, #0xb]
	cmp r0, r2
	beq _0801A9A0
	subs r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A940
	cmp r3, #0
	beq _0801A940
	strb r2, [r1]
_0801A940:
	ldr r2, _0801A9CC  @ gUnknown_0202E4E0
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r3, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A962
	mov r7, ip
	movs r2, #0
	ldrsh r0, [r7, r2]
	subs r0, #1
	cmp r3, r0
	beq _0801A962
	ldrb r0, [r6, #0xb]
	strb r0, [r1, #1]
_0801A962:
	ldr r7, _0801A9CC  @ gUnknown_0202E4E0
	ldr r0, [r7]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A97E
	cmp r4, #0
	beq _0801A97E
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A97E:
	ldr r1, _0801A9CC  @ gUnknown_0202E4E0
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A9A0
	mov r2, ip
	movs r7, #2
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r4, r0
	beq _0801A9A0
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A9A0:
	subs r3, #1
	cmp r3, #0
	bge _0801A916
_0801A9A6:
	mov r4, r8
	cmp r4, #0
	bge _0801A902
_0801A9AC:
	mov r1, r9
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A9C4: .4byte gUnknown_0202E4D4
_0801A9C8: .4byte gUnknown_03004E60
_0801A9CC: .4byte gUnknown_0202E4E0

	THUMB_FUNC_START sub_801A9D0
sub_801A9D0: @ 0x0801A9D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801AAB0  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r4, r0, #1
	ldr r7, _0801AAB4  @ gUnknown_03004E60
	mov r9, r7
	cmp r4, #0
	blt _0801AA98
	mov ip, r1
	mov sl, r9
_0801A9EE:
	mov r1, ip
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r7, r4, #1
	mov r8, r7
	cmp r3, #0
	blt _0801AA92
	lsls r5, r4, #2
	mov r6, sl
_0801AA02:
	ldr r1, _0801AAB8  @ gUnknown_030049A0
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _0801AA8C
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r2, [r6, #0xb]
	cmp r0, r2
	beq _0801AA8C
	subs r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801AA2C
	cmp r3, #0
	beq _0801AA2C
	strb r2, [r1]
_0801AA2C:
	ldr r2, _0801AAB8  @ gUnknown_030049A0
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r3, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801AA4E
	mov r7, ip
	movs r2, #0
	ldrsh r0, [r7, r2]
	subs r0, #1
	cmp r3, r0
	beq _0801AA4E
	ldrb r0, [r6, #0xb]
	strb r0, [r1, #1]
_0801AA4E:
	ldr r7, _0801AAB8  @ gUnknown_030049A0
	ldr r0, [r7]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801AA6A
	cmp r4, #0
	beq _0801AA6A
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801AA6A:
	ldr r1, _0801AAB8  @ gUnknown_030049A0
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801AA8C
	mov r2, ip
	movs r7, #2
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r4, r0
	beq _0801AA8C
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801AA8C:
	subs r3, #1
	cmp r3, #0
	bge _0801AA02
_0801AA92:
	mov r4, r8
	cmp r4, #0
	bge _0801A9EE
_0801AA98:
	mov r1, r9
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801AAB0: .4byte gUnknown_0202E4D4
_0801AAB4: .4byte gUnknown_03004E60
_0801AAB8: .4byte gUnknown_030049A0

	THUMB_FUNC_START MapAddInRange
MapAddInRange: @ 0x0801AABC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r9, r1
	mov r8, r2
	mov sl, r3
	mov r5, r8
	mov r4, r9
	adds r0, r4, r5
	cmp r4, r0
	bgt _0801AB3C
	ldr r1, _0801ABB8  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _0801AB3C
_0801AAE4:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801AAF4
	adds r0, r0, r1
	movs r1, #0
_0801AAF4:
	adds r3, r1, r0
	ldr r2, _0801ABB8  @ gUnknown_0202E4D4
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801AB02
	adds r3, r0, #0
_0801AB02:
	adds r2, r1, #0
	subs r5, #1
	adds r7, r4, #1
	mov r6, r9
	add r6, r8
	cmp r2, r3
	bge _0801AB2C
	ldr r0, _0801ABBC  @ gUnknown_030049A0
	mov ip, r0
	lsls r4, r4, #2
_0801AB16:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r1, [r0]
	adds r1, r1, r2
	ldrb r0, [r1]
	add r0, sl
	strb r0, [r1]
	adds r2, #1
	cmp r2, r3
	blt _0801AB16
_0801AB2C:
	adds r4, r7, #0
	cmp r4, r6
	bgt _0801AB3C
	ldr r2, _0801ABB8  @ gUnknown_0202E4D4
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r4, r0
	blt _0801AAE4
_0801AB3C:
	mov r5, r8
	subs r5, #1
	mov r4, r9
	subs r4, #1
	mov r0, r9
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r4, r8
	blt _0801ABA6
	cmp r4, #0
	blt _0801ABA6
	ldr r2, _0801ABB8  @ gUnknown_0202E4D4
	mov ip, r2
	ldr r6, _0801ABBC  @ gUnknown_030049A0
	mov r9, r6
_0801AB5C:
	ldr r0, [sp]
	subs r1, r0, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801AB6C
	adds r0, r0, r1
	movs r1, #0
_0801AB6C:
	adds r3, r1, r0
	mov r2, ip
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801AB7A
	adds r3, r0, #0
_0801AB7A:
	adds r2, r1, #0
	subs r5, #1
	subs r6, r4, #1
	cmp r2, r3
	bge _0801AB9C
	mov r7, r9
	lsls r4, r4, #2
_0801AB88:
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r1, [r0]
	adds r1, r1, r2
	ldrb r0, [r1]
	add r0, sl
	strb r0, [r1]
	adds r2, #1
	cmp r2, r3
	blt _0801AB88
_0801AB9C:
	adds r4, r6, #0
	cmp r6, r8
	blt _0801ABA6
	cmp r6, #0
	bge _0801AB5C
_0801ABA6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801ABB8: .4byte gUnknown_0202E4D4
_0801ABBC: .4byte gUnknown_030049A0

	THUMB_FUNC_START StoreR3ToMapSomething
StoreR3ToMapSomething: @ 0x0801ABC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r9, r1
	mov r8, r2
	mov sl, r3
	mov r5, r8
	mov r3, r9
	adds r0, r3, r5
	cmp r3, r0
	bgt _0801AC3C
	ldr r4, _0801ACB4  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _0801AC3C
_0801ABE8:
	ldr r2, [sp]
	subs r1, r2, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801ABF8
	adds r0, r0, r1
	movs r1, #0
_0801ABF8:
	adds r2, r1, r0
	ldr r4, _0801ACB4  @ gUnknown_0202E4D4
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801AC06
	adds r2, r0, #0
_0801AC06:
	subs r6, r5, #1
	adds r7, r3, #1
	mov r0, r9
	add r0, r8
	mov ip, r0
	cmp r1, r2
	bge _0801AC2A
	ldr r5, _0801ACB8  @ gUnknown_030049A0
	lsls r4, r3, #2
_0801AC18:
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801AC18
_0801AC2A:
	adds r5, r6, #0
	adds r3, r7, #0
	cmp r3, ip
	bgt _0801AC3C
	ldr r4, _0801ACB4  @ gUnknown_0202E4D4
	movs r6, #2
	ldrsh r0, [r4, r6]
	cmp r3, r0
	blt _0801ABE8
_0801AC3C:
	mov r5, r8
	subs r5, #1
	mov r3, r9
	subs r3, #1
	mov r0, r9
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r3, r8
	blt _0801ACA4
	cmp r3, #0
	blt _0801ACA4
	ldr r2, _0801ACB4  @ gUnknown_0202E4D4
	mov ip, r2
	ldr r4, _0801ACB8  @ gUnknown_030049A0
	mov r9, r4
_0801AC5C:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801AC6C
	adds r0, r0, r1
	movs r1, #0
_0801AC6C:
	adds r2, r1, r0
	mov r4, ip
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801AC7A
	adds r2, r0, #0
_0801AC7A:
	subs r6, r5, #1
	subs r4, r3, #1
	cmp r1, r2
	bge _0801AC98
	mov r7, r9
	lsls r5, r3, #2
_0801AC86:
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801AC86
_0801AC98:
	adds r5, r6, #0
	adds r3, r4, #0
	cmp r4, r8
	blt _0801ACA4
	cmp r4, #0
	bge _0801AC5C
_0801ACA4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801ACB4: .4byte gUnknown_0202E4D4
_0801ACB8: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillMapAttackRangeForUnit
FillMapAttackRangeForUnit: @ 0x0801ACBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	movs r1, #1
	negs r1, r1
	bl GetUnitWeaponReachBits
	subs r0, #1
	cmp r0, #0xe
	bls _0801ACDA
	b _0801B378
_0801ACDA:
	lsls r0, r0, #2
	ldr r1, _0801ACE4  @ _0801ACE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801ACE4: .4byte _0801ACE8
_0801ACE8: @ jump table
	.4byte _0801AD24 @ case 0
	.4byte _0801AED4 @ case 1
	.4byte _0801ADB4 @ case 2
	.4byte _0801AFF4 @ case 3
	.4byte _0801B114 @ case 4
	.4byte _0801AF64 @ case 5
	.4byte _0801AE44 @ case 6
	.4byte _0801B378 @ case 7
	.4byte _0801B2FC @ case 8
	.4byte _0801B378 @ case 9
	.4byte _0801B378 @ case 10
	.4byte _0801B084 @ case 11
	.4byte _0801B1C0 @ case 12
	.4byte _0801B378 @ case 13
	.4byte _0801B26C @ case 14
_0801AD24:
	ldr r0, _0801ADA4  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AD32
	b _0801B378
_0801AD32:
	ldr r0, _0801ADA4  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AD9C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AD48:
	ldr r0, _0801ADA8  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AD96
	ldr r0, _0801ADAC  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AD96
	ldr r0, _0801ADB0  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AD96
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AD96:
	subs r7, #1
	cmp r7, #0
	bge _0801AD48
_0801AD9C:
	mov r6, sl
	cmp r6, #0
	bge _0801AD32
	b _0801B378
	.align 2, 0
_0801ADA4: .4byte gUnknown_0202E4D4
_0801ADA8: .4byte gUnknown_0202E4E0
_0801ADAC: .4byte gUnknown_0202E4D8
_0801ADB0: .4byte gUnknown_0202E4F0
_0801ADB4:
	ldr r0, _0801AE34  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801ADC2
	b _0801B378
_0801ADC2:
	ldr r0, _0801AE34  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AE2C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801ADD8:
	ldr r0, _0801AE38  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AE26
	ldr r0, _0801AE3C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AE26
	ldr r0, _0801AE40  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AE26
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AE26:
	subs r7, #1
	cmp r7, #0
	bge _0801ADD8
_0801AE2C:
	mov r6, sl
	cmp r6, #0
	bge _0801ADC2
	b _0801B378
	.align 2, 0
_0801AE34: .4byte gUnknown_0202E4D4
_0801AE38: .4byte gUnknown_0202E4E0
_0801AE3C: .4byte gUnknown_0202E4D8
_0801AE40: .4byte gUnknown_0202E4F0
_0801AE44:
	ldr r0, _0801AEC4  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AE52
	b _0801B378
_0801AE52:
	ldr r0, _0801AEC4  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AEBC
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AE68:
	ldr r0, _0801AEC8  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AEB6
	ldr r0, _0801AECC  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEB6
	ldr r0, _0801AED0  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEB6
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AEB6:
	subs r7, #1
	cmp r7, #0
	bge _0801AE68
_0801AEBC:
	mov r6, sl
	cmp r6, #0
	bge _0801AE52
	b _0801B378
	.align 2, 0
_0801AEC4: .4byte gUnknown_0202E4D4
_0801AEC8: .4byte gUnknown_0202E4E0
_0801AECC: .4byte gUnknown_0202E4D8
_0801AED0: .4byte gUnknown_0202E4F0
_0801AED4:
	ldr r0, _0801AF54  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AEE2
	b _0801B378
_0801AEE2:
	ldr r0, _0801AF54  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AF4C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AEF8:
	ldr r0, _0801AF58  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AF46
	ldr r0, _0801AF5C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF46
	ldr r0, _0801AF60  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF46
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AF46:
	subs r7, #1
	cmp r7, #0
	bge _0801AEF8
_0801AF4C:
	mov r6, sl
	cmp r6, #0
	bge _0801AEE2
	b _0801B378
	.align 2, 0
_0801AF54: .4byte gUnknown_0202E4D4
_0801AF58: .4byte gUnknown_0202E4E0
_0801AF5C: .4byte gUnknown_0202E4D8
_0801AF60: .4byte gUnknown_0202E4F0
_0801AF64:
	ldr r0, _0801AFE4  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AF72
	b _0801B378
_0801AF72:
	ldr r0, _0801AFE4  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AFDC
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AF88:
	ldr r0, _0801AFE8  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AFD6
	ldr r0, _0801AFEC  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFD6
	ldr r0, _0801AFF0  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFD6
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AFD6:
	subs r7, #1
	cmp r7, #0
	bge _0801AF88
_0801AFDC:
	mov r6, sl
	cmp r6, #0
	bge _0801AF72
	b _0801B378
	.align 2, 0
_0801AFE4: .4byte gUnknown_0202E4D4
_0801AFE8: .4byte gUnknown_0202E4E0
_0801AFEC: .4byte gUnknown_0202E4D8
_0801AFF0: .4byte gUnknown_0202E4F0
_0801AFF4:
	ldr r0, _0801B074  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B002
	b _0801B378
_0801B002:
	ldr r0, _0801B074  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B06C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801B018:
	ldr r0, _0801B078  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B066
	ldr r0, _0801B07C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B066
	ldr r0, _0801B080  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B066
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B066:
	subs r7, #1
	cmp r7, #0
	bge _0801B018
_0801B06C:
	mov r6, sl
	cmp r6, #0
	bge _0801B002
	b _0801B378
	.align 2, 0
_0801B074: .4byte gUnknown_0202E4D4
_0801B078: .4byte gUnknown_0202E4E0
_0801B07C: .4byte gUnknown_0202E4D8
_0801B080: .4byte gUnknown_0202E4F0
_0801B084:
	ldr r0, _0801B104  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B092
	b _0801B378
_0801B092:
	ldr r0, _0801B104  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B0FC
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801B0A8:
	ldr r0, _0801B108  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B0F6
	ldr r0, _0801B10C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B0F6
	ldr r0, _0801B110  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B0F6
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B0F6:
	subs r7, #1
	cmp r7, #0
	bge _0801B0A8
_0801B0FC:
	mov r6, sl
	cmp r6, #0
	bge _0801B092
	b _0801B378
	.align 2, 0
_0801B104: .4byte gUnknown_0202E4D4
_0801B108: .4byte gUnknown_0202E4E0
_0801B10C: .4byte gUnknown_0202E4D8
_0801B110: .4byte gUnknown_0202E4F0
_0801B114:
	ldr r0, _0801B1B0  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B122
	b _0801B378
_0801B122:
	ldr r0, _0801B1B0  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B1A8
	lsls r1, r6, #2
	mov r8, r1
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801B13A:
	ldr r0, _0801B1B4  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B1A2
	ldr r0, _0801B1B8  @ gUnknown_0202E4D8
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B1A2
	ldr r0, _0801B1BC  @ gUnknown_0202E4F0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B1A2
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B1A2:
	subs r7, #1
	cmp r7, #0
	bge _0801B13A
_0801B1A8:
	mov r6, sl
	cmp r6, #0
	bge _0801B122
	b _0801B378
	.align 2, 0
_0801B1B0: .4byte gUnknown_0202E4D4
_0801B1B4: .4byte gUnknown_0202E4E0
_0801B1B8: .4byte gUnknown_0202E4D8
_0801B1BC: .4byte gUnknown_0202E4F0
_0801B1C0:
	ldr r0, _0801B25C  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B1CE
	b _0801B378
_0801B1CE:
	ldr r0, _0801B25C  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	subs r2, r6, #1
	mov sl, r2
	cmp r7, #0
	blt _0801B254
	lsls r0, r6, #2
	mov r8, r0
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801B1E6:
	ldr r0, _0801B260  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B24E
	ldr r0, _0801B264  @ gUnknown_0202E4D8
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B24E
	ldr r0, _0801B268  @ gUnknown_0202E4F0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B24E
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B24E:
	subs r7, #1
	cmp r7, #0
	bge _0801B1E6
_0801B254:
	mov r6, sl
	cmp r6, #0
	bge _0801B1CE
	b _0801B378
	.align 2, 0
_0801B25C: .4byte gUnknown_0202E4D4
_0801B260: .4byte gUnknown_0202E4E0
_0801B264: .4byte gUnknown_0202E4D8
_0801B268: .4byte gUnknown_0202E4F0
_0801B26C:
	ldr r0, _0801B2EC  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B27A
	b _0801B378
_0801B27A:
	ldr r0, _0801B2EC  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B2E4
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801B290:
	ldr r0, _0801B2F0  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B2DE
	ldr r0, _0801B2F4  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B2DE
	ldr r0, _0801B2F8  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B2DE
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B2DE:
	subs r7, #1
	cmp r7, #0
	bge _0801B290
_0801B2E4:
	mov r6, sl
	cmp r6, #0
	bge _0801B27A
	b _0801B378
	.align 2, 0
_0801B2EC: .4byte gUnknown_0202E4D4
_0801B2F0: .4byte gUnknown_0202E4E0
_0801B2F4: .4byte gUnknown_0202E4D8
_0801B2F8: .4byte gUnknown_0202E4F0
_0801B2FC:
	ldr r0, _0801B44C  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801B378
_0801B308:
	ldr r0, _0801B44C  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B372
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801B31E:
	ldr r0, _0801B450  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B36C
	ldr r0, _0801B454  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B36C
	ldr r0, _0801B458  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B36C
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #4
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B36C:
	subs r7, #1
	cmp r7, #0
	bge _0801B31E
_0801B372:
	mov r6, sl
	cmp r6, #0
	bge _0801B308
_0801B378:
	mov r1, r9
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801B434
	ldr r0, _0801B44C  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801B434
_0801B398:
	ldr r0, _0801B44C  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	subs r2, r6, #1
	mov sl, r2
	cmp r7, #0
	blt _0801B42E
	lsls r0, r6, #2
	mov r8, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r9, r0
_0801B3B2:
	ldr r0, _0801B450  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B428
	ldr r0, _0801B454  @ gUnknown_0202E4D8
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B428
	ldr r0, _0801B458  @ gUnknown_0202E4F0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B428
	adds r0, r7, #0
	adds r1, r6, #0
	bl GetBallistaItemAt
	adds r1, r0, #0
	cmp r1, #0
	beq _0801B428
	lsls r5, r7, #0x10
	asrs r5, r5, #0x10
	str r1, [sp]
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, [sp]
	adds r0, r1, #0
	bl GetItemMaxRange
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	mov r1, r9
	movs r3, #1
	bl MapAddInRange
	subs r4, #1
	adds r0, r5, #0
	mov r1, r9
	adds r2, r4, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B428:
	subs r7, #1
	cmp r7, #0
	bge _0801B3B2
_0801B42E:
	mov r6, sl
	cmp r6, #0
	bge _0801B398
_0801B434:
	ldr r2, _0801B450  @ gUnknown_0202E4E0
	ldr r1, [r2]
	ldr r0, _0801B45C  @ gUnknown_030049A0
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B44C: .4byte gUnknown_0202E4D4
_0801B450: .4byte gUnknown_0202E4E0
_0801B454: .4byte gUnknown_0202E4D8
_0801B458: .4byte gUnknown_0202E4F0
_0801B45C: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillRangeByRangeMask
FillRangeByRangeMask: @ 0x0801B460
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	subs r0, r1, #1
	cmp r0, #0x1f
	bls _0801B474
	b _0801B610
_0801B474:
	lsls r0, r0, #2
	ldr r1, _0801B480  @ _0801B484
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B480: .4byte _0801B484
_0801B484: @ jump table
	.4byte _0801B504 @ case 0
	.4byte _0801B51C @ case 1
	.4byte _0801B50C @ case 2
	.4byte _0801B544 @ case 3
	.4byte _0801B56C @ case 4
	.4byte _0801B530 @ case 5
	.4byte _0801B514 @ case 6
	.4byte _0801B610 @ case 7
	.4byte _0801B5D0 @ case 8
	.4byte _0801B610 @ case 9
	.4byte _0801B610 @ case 10
	.4byte _0801B558 @ case 11
	.4byte _0801B59A @ case 12
	.4byte _0801B610 @ case 13
	.4byte _0801B5C8 @ case 14
	.4byte _0801B610 @ case 15
	.4byte _0801B610 @ case 16
	.4byte _0801B610 @ case 17
	.4byte _0801B610 @ case 18
	.4byte _0801B610 @ case 19
	.4byte _0801B610 @ case 20
	.4byte _0801B610 @ case 21
	.4byte _0801B610 @ case 22
	.4byte _0801B610 @ case 23
	.4byte _0801B610 @ case 24
	.4byte _0801B610 @ case 25
	.4byte _0801B610 @ case 26
	.4byte _0801B610 @ case 27
	.4byte _0801B610 @ case 28
	.4byte _0801B610 @ case 29
	.4byte _0801B610 @ case 30
	.4byte _0801B5EC @ case 31
_0801B504:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B5D6
_0801B50C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5D6
_0801B514:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	b _0801B5D6
_0801B51C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B5E2
_0801B530:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B5E2
_0801B544:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5E2
_0801B558:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5E2
_0801B56C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5E2
_0801B59A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5E2
_0801B5C8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	b _0801B5D6
_0801B5D0:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
_0801B5D6:
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
_0801B5E2:
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	b _0801B610
_0801B5EC:
	adds r0, r2, #0
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B610:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START FillMapStaffRangeForUnit
FillMapStaffRangeForUnit: @ 0x0801B618
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl GetUnitStaffReachBits
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	cmp r5, #3
	beq _0801B6D8
	cmp r5, #3
	bgt _0801B640
	cmp r5, #1
	beq _0801B648
	b _0801B7F2
_0801B640:
	cmp r5, #0x20
	bne _0801B646
	b _0801B768
_0801B646:
	b _0801B7F2
_0801B648:
	ldr r0, _0801B6C8  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B656
	b _0801B7F2
_0801B656:
	ldr r0, _0801B6C8  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B6C0
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B66C:
	ldr r0, _0801B6CC  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B6BA
	ldr r0, _0801B6D0  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B6BA
	ldr r0, _0801B6D4  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B6BA
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B6BA:
	subs r5, #1
	cmp r5, #0
	bge _0801B66C
_0801B6C0:
	mov r1, r8
	cmp r1, #0
	bge _0801B656
	b _0801B7F2
	.align 2, 0
_0801B6C8: .4byte gUnknown_0202E4D4
_0801B6CC: .4byte gUnknown_0202E4E0
_0801B6D0: .4byte gUnknown_0202E4D8
_0801B6D4: .4byte gUnknown_0202E4F0
_0801B6D8:
	ldr r0, _0801B758  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B6E6
	b _0801B7F2
_0801B6E6:
	ldr r0, _0801B758  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B750
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B6FC:
	ldr r0, _0801B75C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B74A
	ldr r0, _0801B760  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B74A
	ldr r0, _0801B764  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B74A
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B74A:
	subs r5, #1
	cmp r5, #0
	bge _0801B6FC
_0801B750:
	mov r1, r8
	cmp r1, #0
	bge _0801B6E6
	b _0801B7F2
	.align 2, 0
_0801B758: .4byte gUnknown_0202E4D4
_0801B75C: .4byte gUnknown_0202E4E0
_0801B760: .4byte gUnknown_0202E4D8
_0801B764: .4byte gUnknown_0202E4F0
_0801B768:
	ldr r0, _0801B800  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0801B7F2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0801B77A:
	ldr r0, _0801B800  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B7EC
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r0, sl
	lsls r0, r0, #0x10
	mov r9, r0
_0801B796:
	ldr r0, _0801B804  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B7E6
	ldr r0, _0801B808  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B7E6
	ldr r0, _0801B80C  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B7E6
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	mov r3, r9
	asrs r2, r3, #0x10
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B7E6:
	subs r5, #1
	cmp r5, #0
	bge _0801B796
_0801B7EC:
	mov r1, r8
	cmp r1, #0
	bge _0801B77A
_0801B7F2:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B800: .4byte gUnknown_0202E4D4
_0801B804: .4byte gUnknown_0202E4E0
_0801B808: .4byte gUnknown_0202E4D8
_0801B80C: .4byte gUnknown_0202E4F0

	THUMB_FUNC_START ApplyStuffToRangeMaps
ApplyStuffToRangeMaps: @ 0x0801B810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	negs r0, r0
	mov sl, r0
	ldr r0, _0801B840  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	bl IsNotEnemyPhaseMaybe
	mov r9, r0
	mov r6, r9
	adds r6, #1
	b _0801B934
	.align 2, 0
_0801B840: .4byte gUnknown_0202E4E4
_0801B844:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801B930
	ldr r0, [r4]
	cmp r0, #0
	beq _0801B930
	ldr r1, [sp]
	lsls r0, r1, #0x18
	mov r8, r0
	cmp r0, #0
	beq _0801B86C
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B930
_0801B86C:
	ldr r0, _0801B8FC  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801B88E
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B900  @ gUnknown_0202E4E8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801B930
_0801B88E:
	ldr r5, [r4, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0801B930
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0x12]
	ldrb r0, [r4, #0x1d]
	adds r1, r1, r0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl FillMovementMapForUnitAndMovement
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B904  @ gUnknown_0202E4D8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r7, [r0]
	strb r5, [r0]
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp sl, r5
	beq _0801B8E6
	ldr r0, _0801B908  @ gUnknown_0202E4F0
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	cmp r5, #0
	beq _0801B8E4
	movs r0, #1
	bl sub_801B950
_0801B8E4:
	mov sl, r5
_0801B8E6:
	ldr r0, _0801B90C  @ gUnknown_0202E4E4
	ldr r1, [r0]
	ldr r0, _0801B910  @ gUnknown_030049A0
	str r1, [r0]
	mov r1, r8
	cmp r1, #0
	beq _0801B914
	adds r0, r4, #0
	bl FillMapStaffRangeForUnit
	b _0801B91A
	.align 2, 0
_0801B8FC: .4byte gUnknown_0202BCF0
_0801B900: .4byte gUnknown_0202E4E8
_0801B904: .4byte gUnknown_0202E4D8
_0801B908: .4byte gUnknown_0202E4F0
_0801B90C: .4byte gUnknown_0202E4E4
_0801B910: .4byte gUnknown_030049A0
_0801B914:
	adds r0, r4, #0
	bl FillMapAttackRangeForUnit
_0801B91A:
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B94C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
_0801B930:
	adds r6, #1
	mov r0, r9
_0801B934:
	adds r0, #0x80
	cmp r6, r0
	bge _0801B93C
	b _0801B844
_0801B93C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B94C: .4byte gUnknown_0202E4D8

	.align 2, 0 @ Don't pad with nop.
