	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED
	THUMB_FUNC_START GetPortraitStructPointer
GetPortraitStructPointer: @ 0x08005514
	adds r1, r0, #0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08005524  @ gUnknown_088ACBC4
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08005524: .4byte gUnknown_088ACBC4

	THUMB_FUNC_START ResetFaces
ResetFaces: @ 0x08005528
	push {r4, lr}
	movs r4, #0
_0800552C:
	adds r0, r4, #0
	bl DeleteFaceByIndex
	adds r4, #1
	cmp r4, #3
	ble _0800552C
	movs r0, #0
	bl SetupFaceGfxData
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START SetupFaceGfxData
SetupFaceGfxData: @ 0x08005544
	push {lr}
	cmp r0, #0
	bne _0800554C
	ldr r0, _08005568  @ gUnknown_08590FEC
_0800554C:
	ldr r2, _0800556C  @ gUnknown_0202A68C
	adds r1, r0, #0
	movs r3, #3
_08005552:
	ldr r0, [r1]
	str r0, [r2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	adds r2, #8
	adds r1, #8
	subs r3, #1
	cmp r3, #0
	bge _08005552
	pop {r0}
	bx r0
	.align 2, 0
_08005568: .4byte gUnknown_08590FEC
_0800556C: .4byte gUnknown_0202A68C

	THUMB_FUNC_START sub_8005570
sub_8005570: @ 0x08005570
	push {lr}
	movs r1, #0
	ldr r2, _08005580  @ gUnknown_03004980
_08005576:
	ldr r0, [r2]
	cmp r0, #0
	bne _08005584
	adds r0, r1, #0
	b _08005590
	.align 2, 0
_08005580: .4byte gUnknown_03004980
_08005584:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08005576
	movs r0, #1
	negs r0, r0
_08005590:
	pop {r1}
	bx r1

	THUMB_FUNC_START Load6CFACEGraphics
Load6CFACEGraphics: @ 0x08005594
	push {lr}
	ldr r1, [r0, #0x2c]
	ldr r2, [r1]
	ldr r1, _080055B4  @ gUnknown_0202A68C
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080055B8  @ 0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl CopyDataWithPossibleUncomp
	pop {r0}
	bx r0
	.align 2, 0
_080055B4: .4byte gUnknown_0202A68C
_080055B8: .4byte 0x06010000

	THUMB_FUNC_START sub_80055BC
sub_80055BC: @ 0x080055BC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_80057A4
	movs r1, #0x80
	lsls r1, r1, #7
	ands r1, r0
	cmp r1, #0
	bne _08005602
	adds r0, r4, #0
	bl sub_80057A4
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	negs r2, r2
	asrs r2, r2, #0x1f
	ands r2, r0
	ldrh r1, [r4, #0x36]
	movs r0, #0xff
	ands r0, r1
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldrh r3, [r4, #0x34]
	ldr r1, _0800560C  @ 0x000001FF
	ands r1, r3
	ldr r3, [r4, #0x38]
	ldrh r4, [r4, #0x3c]
	str r4, [sp]
	bl RegisterObjectAttributes
_08005602:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800560C: .4byte 0x000001FF

	THUMB_FUNC_START sub_8005610
sub_8005610: @ 0x08005610
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl sub_8005570
	cmp r0, #0
	blt _08005632
	str r4, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl NewFace
	b _08005634
_08005632:
	movs r0, #0
_08005634:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START NewFace
NewFace: @ 0x0800563C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov r9, r2
	mov sl, r3
	ldr r1, _08005660  @ gUnknown_03004980
	lsls r0, r6, #2
	adds r5, r0, r1
	ldr r7, [r5]
	cmp r7, #0
	beq _08005664
	movs r0, #0
	b _08005720
	.align 2, 0
_08005660: .4byte gUnknown_03004980
_08005664:
	ldr r0, _080056A4  @ gUnknown_08591154
	movs r1, #5
	bl Proc_Create
	adds r4, r0, #0
	str r4, [r5]
	mov r0, r8
	bl GetPortraitStructPointer
	adds r5, r0, #0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _080056B4
	str r7, [sp]
	ldr r1, _080056A8  @ gUnknown_0202A68C
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r1, r1, #5
	ldr r0, _080056AC  @ gUnknown_02022AA8
	adds r1, r1, r0
	ldr r2, _080056B0  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	b _080056C8
	.align 2, 0
_080056A4: .4byte gUnknown_08591154
_080056A8: .4byte gUnknown_0202A68C
_080056AC: .4byte gUnknown_02022AA8
_080056B0: .4byte 0x01000008
_080056B4:
	ldr r0, [r5, #8]
	ldr r2, _080056F8  @ gUnknown_0202A68C
	lsls r1, r6, #3
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
_080056C8:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x40
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #5
	strb r0, [r1]
	mov r1, r9
	strh r1, [r4, #0x34]
	mov r0, sl
	strh r0, [r4, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _080056FC
	str r2, [r4, #0x44]
	str r2, [r4, #0x48]
	b _08005710
	.align 2, 0
_080056F8: .4byte gUnknown_0202A68C
_080056FC:
	ldr r0, _08005730  @ gUnknown_0859124C
	adds r1, r4, #0
	bl Proc_Create
	str r0, [r4, #0x44]
	ldr r0, _08005734  @ gUnknown_08591264
	adds r1, r4, #0
	bl Proc_Create
	str r0, [r4, #0x48]
_08005710:
	ldr r1, [sp, #0x24]
	mvns r0, r1
	str r0, [r4, #0x30]
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl sub_8005770
	adds r0, r4, #0
_08005720:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005730: .4byte gUnknown_0859124C
_08005734: .4byte gUnknown_08591264

	THUMB_FUNC_START DeleteE_FACEByPointer
DeleteE_FACEByPointer: @ 0x08005738
	push {lr}
	ldr r2, _08005754  @ gUnknown_03004980
	adds r1, r0, #0
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	str r2, [r1]
	bl Proc_Delete
	pop {r0}
	bx r0
	.align 2, 0
_08005754: .4byte gUnknown_03004980

	THUMB_FUNC_START DeleteFaceByIndex
DeleteFaceByIndex: @ 0x08005758
	push {lr}
	ldr r1, _0800576C  @ gUnknown_03004980
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DeleteE_FACEByPointer
	pop {r0}
	bx r0
	.align 2, 0
_0800576C: .4byte gUnknown_03004980

	THUMB_FUNC_START sub_8005770
sub_8005770: @ 0x08005770
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08005782
	str r1, [r4, #0x30]
	bl sub_80057C0
	ldr r0, [r4, #0x30]
	b _08005784
_08005782:
	movs r0, #0
_08005784:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_800578C
sub_800578C: @ 0x0800578C
	push {lr}
	ldr r2, _080057A0  @ gUnknown_03004980
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_8005770
	pop {r1}
	bx r1
	.align 2, 0
_080057A0: .4byte gUnknown_03004980

	THUMB_FUNC_START sub_80057A4
sub_80057A4: @ 0x080057A4
	ldr r0, [r0, #0x30]
	bx lr

	THUMB_FUNC_START sub_80057A8
sub_80057A8: @ 0x080057A8
	push {lr}
	ldr r1, _080057BC  @ gUnknown_03004980
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_80057A4
	pop {r1}
	bx r1
	.align 2, 0
_080057BC: .4byte gUnknown_03004980

	THUMB_FUNC_START sub_80057C0
sub_80057C0: @ 0x080057C0
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x30]
	ldr r0, _080057E8  @ 0x00000807
	ands r1, r0
	cmp r1, #3
	beq _0800580C
	cmp r1, #3
	bls _080057EC
	cmp r1, #5
	beq _0800581C
	cmp r1, #5
	bcc _08005814
	subs r0, #7
	cmp r1, r0
	beq _08005824
	adds r0, #1
	cmp r1, r0
	beq _0800582C
	b _08005830
	.align 2, 0
_080057E8: .4byte 0x00000807
_080057EC:
	cmp r1, #1
	beq _080057FC
	cmp r1, #1
	bhi _08005804
	ldr r0, _080057F8  @ gUnknown_0859100C
	b _0800582E
	.align 2, 0
_080057F8: .4byte gUnknown_0859100C
_080057FC:
	ldr r0, _08005800  @ gUnknown_08591026
	b _0800582E
	.align 2, 0
_08005800: .4byte gUnknown_08591026
_08005804:
	ldr r0, _08005808  @ gUnknown_08591040
	b _0800582E
	.align 2, 0
_08005808: .4byte gUnknown_08591040
_0800580C:
	ldr r0, _08005810  @ gUnknown_08591066
	b _0800582E
	.align 2, 0
_08005810: .4byte gUnknown_08591066
_08005814:
	ldr r0, _08005818  @ gUnknown_0859108C
	b _0800582E
	.align 2, 0
_08005818: .4byte gUnknown_0859108C
_0800581C:
	ldr r0, _08005820  @ gUnknown_085910BE
	b _0800582E
	.align 2, 0
_08005820: .4byte gUnknown_085910BE
_08005824:
	ldr r0, _08005828  @ gUnknown_085910F0
	b _0800582E
	.align 2, 0
_08005828: .4byte gUnknown_085910F0
_0800582C:
	ldr r0, _08005848  @ gUnknown_08591122
_0800582E:
	str r0, [r3, #0x38]
_08005830:
	ldr r1, [r3, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0x80
	beq _0800585A
	cmp r1, #0x80
	bhi _0800584C
	cmp r1, #0x40
	beq _08005856
	b _08005866
	.align 2, 0
_08005848: .4byte gUnknown_08591122
_0800584C:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _08005860
	b _08005866
_08005856:
	movs r4, #0
	b _0800586A
_0800585A:
	movs r4, #0x80
	lsls r4, r4, #3
	b _0800586A
_08005860:
	movs r4, #0xc0
	lsls r4, r4, #4
	b _0800586A
_08005866:
	movs r4, #0x80
	lsls r4, r4, #4
_0800586A:
	ldr r1, _08005890  @ gUnknown_0202A68C
	adds r0, r3, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	lsrs r1, r1, #5
	ldrh r2, [r0, #4]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r4
	strh r1, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005890: .4byte gUnknown_0202A68C

	THUMB_FUNC_START sub_8005894
sub_8005894: @ 0x08005894
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov ip, r2
	ldrb r7, [r1]
	adds r1, #1
	ldrb r6, [r1]
	adds r2, r1, #1
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _080058DE
	movs r0, #0
	cmp r0, r6
	bge _08005918
_080058B2:
	adds r4, r0, #1
	cmp r7, #0
	beq _080058D6
	lsls r0, r0, #6
	mov r3, r8
	adds r1, r0, r3
	adds r3, r7, #0
_080058C0:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080058CC
	ldrb r0, [r2]
	add r0, ip
	strh r0, [r1]
_080058CC:
	adds r2, #1
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _080058C0
_080058D6:
	adds r0, r4, #0
	cmp r0, r6
	blt _080058B2
	b _08005918
_080058DE:
	movs r0, #0
	cmp r0, r6
	bge _08005918
_080058E4:
	subs r3, r7, #1
	adds r4, r0, #1
	cmp r3, #0
	blt _08005912
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r1, #0
	lsls r1, r3, #1
	lsls r0, r0, #6
	add r0, r8
	adds r1, r1, r0
_080058FA:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08005908
	ldrb r0, [r2]
	add r0, ip
	adds r0, r0, r5
	strh r0, [r1]
_08005908:
	adds r2, #1
	subs r1, #2
	subs r3, #1
	cmp r3, #0
	bge _080058FA
_08005912:
	adds r0, r4, #0
	cmp r0, r6
	blt _080058E4
_08005918:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8005924
sub_8005924: @ 0x08005924
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08005958  @ 0x00007EFF
	cmp r4, r0
	ble _08005960
	adds r0, r4, #0
	bl sub_8005F6C
	lsls r1, r5, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	ldr r2, _0800595C  @ 0x0001FFFF
	ands r1, r2
	adds r1, r1, r3
	movs r2, #0x80
	lsls r2, r2, #2
	bl RegisterTileGraphics
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005F9C
	b _08005980
	.align 2, 0
_08005958: .4byte 0x00007EFF
_0800595C: .4byte 0x0001FFFF
_08005960:
	adds r0, r4, #0
	bl GetPortraitStructPointer
	adds r4, r0, #0
	ldr r0, [r4, #4]
	lsls r1, r5, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, [r4, #8]
	lsls r1, r6, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08005980:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8005988
sub_8005988: @ 0x08005988
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x14]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_8005924
	ldr r2, _080059C4  @ 0x000003FF
	ands r2, r6
	ldr r1, _080059C8  @ gUnknown_085911C4
	lsls r5, r5, #0xc
	adds r2, r2, r5
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r0, r8
	adds r3, r4, #0
	bl sub_8005894
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080059C4: .4byte 0x000003FF
_080059C8: .4byte gUnknown_085911C4

	THUMB_FUNC_START sub_80059CC
sub_80059CC: @ 0x080059CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08005A5C  @ 0xFFFFFE00
	add sp, r4
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r0, #0x80
	lsls r0, r0, #4
	adds r7, r7, r0
	ldr r0, _08005A60  @ 0x00007EFF
	cmp r6, r0
	ble _08005A68
	adds r0, r6, #0
	bl sub_8005F6C
	lsls r1, r7, #5
	ldr r5, _08005A64  @ 0x0001FFFF
	ands r1, r5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterTileGraphics
	adds r0, r6, #0
	bl sub_8005F6C
	adds r0, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterTileGraphics
	adds r0, r6, #0
	bl sub_8005F6C
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #4
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterTileGraphics
	adds r0, r6, #0
	bl sub_8005F6C
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterTileGraphics
	mov r1, r8
	adds r1, #0x10
	adds r0, r6, #0
	bl sub_8005F9C
	b _08005AC4
	.align 2, 0
_08005A5C: .4byte 0xFFFFFE00
_08005A60: .4byte 0x00007EFF
_08005A64: .4byte 0x0001FFFF
_08005A68:
	adds r0, r6, #0
	bl GetPortraitStructPointer
	adds r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, sp
	bl CopyDataWithPossibleUncomp
	lsls r1, r7, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	mov r0, sp
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x100
	adds r1, r7, #4
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x180
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	ldr r0, [r5, #8]
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08005AC4:
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8005AD4
sub_8005AD4: @ 0x08005AD4
	push {r4, lr}
	sub sp, #4
	movs r2, #0x34
	ldrsh r1, [r0, r2]
	ldr r3, _08005B00  @ gLCDControlBuffer
	ldrh r2, [r3, #0x1c]
	subs r1, r1, r2
	movs r4, #0x36
	ldrsh r2, [r0, r4]
	ldrh r3, [r3, #0x1e]
	subs r2, r2, r3
	ldr r3, [r0, #0x38]
	ldrh r0, [r0, #0x3c]
	str r0, [sp]
	movs r0, #5
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005B00: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_8005B04
sub_8005B04: @ 0x08005B04
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	adds r0, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	ldr r7, [sp, #0x24]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80059CC
	ldr r0, _08005B4C  @ gUnknown_085911D8
	adds r1, r7, #0
	bl Proc_Create
	adds r1, r0, #0
	mov r0, r8
	strh r0, [r1, #0x34]
	mov r0, r9
	strh r0, [r1, #0x36]
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r6, r6, r4
	strh r6, [r1, #0x3c]
	cmp r5, #0
	beq _08005B54
	ldr r0, _08005B50  @ gUnknown_085911F6
	b _08005B56
	.align 2, 0
_08005B4C: .4byte gUnknown_085911D8
_08005B50: .4byte gUnknown_085911F6
_08005B54:
	ldr r0, _08005B64  @ gUnknown_085911E8
_08005B56:
	str r0, [r1, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005B64: .4byte gUnknown_085911E8

	THUMB_FUNC_START sub_8005B68
sub_8005B68: @ 0x08005B68
	push {lr}
	ldr r0, _08005B74  @ gUnknown_085911D8
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_08005B74: .4byte gUnknown_085911D8

	THUMB_FUNC_START sub_8005B78
sub_8005B78: @ 0x08005B78
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldrb r5, [r2, #0x14]
	subs r5, #1
	ldrb r4, [r2, #0x15]
	ldr r1, _08005BC8  @ gUnknown_085A0838
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl CallARM_FillTileRect
	lsls r4, r4, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	adds r2, r4, r6
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005BC8: .4byte gUnknown_085A0838

	THUMB_FUNC_START sub_8005BCC
sub_8005BCC: @ 0x08005BCC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldrb r5, [r2, #0x14]
	subs r5, #1
	ldrb r4, [r2, #0x15]
	subs r4, #1
	ldr r1, _08005C20  @ gUnknown_085A08F0
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl CallARM_FillTileRect
	lsls r4, r4, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	adds r2, r4, r6
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005C20: .4byte gUnknown_085A08F0

	THUMB_FUNC_START ShouldPortraitBeSmol
ShouldPortraitBeSmol: @ 0x08005C24
	push {lr}
	subs r0, #0x10
	cmp r0, #0x16
	bhi _08005C9C
	lsls r0, r0, #2
	ldr r1, _08005C38  @ _08005C3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005C38: .4byte _08005C3C
_08005C3C: @ jump table
	.4byte _08005C98 @ case 0
	.4byte _08005C9C @ case 1
	.4byte _08005C9C @ case 2
	.4byte _08005C9C @ case 3
	.4byte _08005C9C @ case 4
	.4byte _08005C9C @ case 5
	.4byte _08005C9C @ case 6
	.4byte _08005C9C @ case 7
	.4byte _08005C9C @ case 8
	.4byte _08005C98 @ case 9
	.4byte _08005C9C @ case 10
	.4byte _08005C9C @ case 11
	.4byte _08005C9C @ case 12
	.4byte _08005C9C @ case 13
	.4byte _08005C9C @ case 14
	.4byte _08005C9C @ case 15
	.4byte _08005C9C @ case 16
	.4byte _08005C98 @ case 17
	.4byte _08005C9C @ case 18
	.4byte _08005C98 @ case 19
	.4byte _08005C9C @ case 20
	.4byte _08005C9C @ case 21
	.4byte _08005C98 @ case 22
_08005C98:
	movs r0, #1
	b _08005C9E
_08005C9C:
	movs r0, #0
_08005C9E:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8005CA4
sub_8005CA4: @ 0x08005CA4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	beq _08005D54
	adds r0, r5, #0
	bl GetPortraitStructPointer
	adds r4, r0, #0
	ldr r0, [r4, #8]
	lsls r1, r7, #5
	mov r8, r1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, [r4]
	cmp r0, #0
	beq _08005D34
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, [r4, #8]
	mov r1, r8
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r0, r5, #0
	bl ShouldPortraitBeSmol
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08005D0C
	lsls r1, r7, #0xc
	ldr r0, _08005D08  @ 0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, r9
	adds r2, r4, #0
	bl sub_8005BCC
	b _08005D1C
	.align 2, 0
_08005D08: .4byte 0x000003FF
_08005D0C:
	lsls r1, r7, #0xc
	ldr r0, _08005D30  @ 0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, r9
	adds r2, r4, #0
	bl sub_8005B78
_08005D1C:
	movs r2, #0
	mov r0, r9
	movs r1, #4
_08005D22:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #0x40
	subs r1, #1
	cmp r1, #0
	bge _08005D22
	b _08005D54
	.align 2, 0
_08005D30: .4byte 0x000003FF
_08005D34:
	ldr r0, [r4, #0x10]
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	lsls r1, r7, #0xc
	ldr r0, _08005D60  @ 0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, r9
	movs r2, #0xa
	movs r3, #9
	bl sub_8013104
_08005D54:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005D60: .4byte 0x000003FF

	THUMB_FUNC_START sub_8005D64
sub_8005D64: @ 0x08005D64
	movs r2, #0
	str r2, [r0, #0x2c]
	movs r1, #0x78
	str r1, [r0, #0x38]
	strh r2, [r0, #0x32]
	bx lr

	THUMB_FUNC_START sub_8005D70
sub_8005D70: @ 0x08005D70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _08005D90
	adds r0, r4, #0
	bl sub_8006470
	str r0, [r4, #0x38]
	movs r0, #0
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
_08005D90:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8005D98
sub_8005D98: @ 0x08005D98
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	lsls r1, r1, #0xc
	subs r0, #2
	ldrh r2, [r0]
	ldr r0, _08005DCC  @ 0x000003FF
	ands r0, r2
	adds r7, r1, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetPortraitStructPointer
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bhi _08005E38
	lsls r0, r0, #2
	ldr r1, _08005DD0  @ _08005DD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005DCC: .4byte 0x000003FF
_08005DD0: .4byte _08005DD4
_08005DD4: @ jump table
	.4byte _08005E00 @ case 0
	.4byte _08005E8A @ case 1
	.4byte _08005E8A @ case 2
	.4byte _08005DFC @ case 3
	.4byte _08005E8A @ case 4
	.4byte _08005E8A @ case 5
	.4byte _08005E00 @ case 6
	.4byte _08005E8A @ case 7
	.4byte _08005E8A @ case 8
	.4byte _08005E04 @ case 9
_08005DFC:
	movs r6, #0x58
	b _08005E38
_08005E00:
	movs r6, #0x18
	b _08005E38
_08005E04:
	ldr r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	lsls r1, r1, #0xc
	adds r2, r4, #0
	adds r2, #0x40
	ldrh r3, [r2]
	ldr r2, _08005E34  @ 0x000003FF
	ands r2, r3
	adds r1, r1, r2
	adds r2, r5, #0
	bl sub_8005B78
	ldr r0, [r4, #0x3c]
	bl GetBackgroundFromBufferPointer
	bl BG_EnableSync
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
	b _08005E90
	.align 2, 0
_08005E34: .4byte 0x000003FF
_08005E38:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetPortraitStructPointer
	adds r5, r0, #0
	ldrb r0, [r5, #0x17]
	lsls r0, r0, #6
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	ldrb r0, [r5, #0x16]
	lsls r0, r0, #1
	adds r1, r1, r0
	mov ip, r1
	mov r0, ip
	subs r0, #2
	adds r2, r7, r6
	strh r2, [r0]
	adds r1, r2, #1
	strh r1, [r0, #2]
	adds r1, r2, #2
	strh r1, [r0, #4]
	adds r1, r2, #3
	strh r1, [r0, #6]
	adds r1, #0x1d
	mov r3, ip
	strh r1, [r3, #0x3e]
	adds r3, #0x40
	adds r1, #1
	strh r1, [r3]
	adds r3, #2
	adds r1, #1
	strh r1, [r3]
	mov r1, ip
	adds r1, #0x44
	adds r2, #0x23
	strh r2, [r1]
	bl GetBackgroundFromBufferPointer
	bl BG_EnableSync
_08005E8A:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
_08005E90:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8005E98
sub_8005E98: @ 0x08005E98
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x14]
	ldr r0, _08005EC8  @ gUnknown_08591204
	bl Proc_DeleteAllWithScript
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_8005CA4
	mov r0, r8
	bl GetPortraitStructPointer
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005EC8: .4byte gUnknown_08591204

	THUMB_FUNC_START sub_8005ECC
sub_8005ECC: @ 0x08005ECC
	push {lr}
	ldr r0, [r0, #0x54]
	bl DeleteE_FACEByPointer
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8005ED8
sub_8005ED8: @ 0x08005ED8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08005EEC  @ gUnknown_08591234
	movs r1, #3
	bl Proc_Create
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005EEC: .4byte gUnknown_08591234

	THUMB_FUNC_START sub_8005EF0
sub_8005EF0: @ 0x08005EF0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetPortraitStructPointer
	mov r8, r0
	ldr r6, _08005F34  @ gUnknown_0202A68C
	adds r5, r4, #0
	adds r5, #0x40
	ldrb r0, [r5]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	adds r0, #0x10
	bl sub_8013A84
	mov r1, r8
	ldr r0, [r1, #8]
	ldrb r1, [r5]
	lsls r1, r1, #3
	adds r1, r1, r6
	ldrh r1, [r1, #4]
	adds r1, #0x10
	movs r2, #0xc
	adds r3, r4, #0
	bl sub_8013928
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005F34: .4byte gUnknown_0202A68C

	THUMB_FUNC_START sub_8005F38
sub_8005F38: @ 0x08005F38
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetPortraitStructPointer
	ldr r1, _08005F68  @ gUnknown_0202A68C
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r0, #0x10
	movs r1, #0xc
	adds r2, r4, #0
	bl sub_80138F0
	adds r0, r4, #0
	bl sub_8005ED8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005F68: .4byte gUnknown_0202A68C

	THUMB_FUNC_START sub_8005F6C
sub_8005F6C: @ 0x08005F6C
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08005F94  @ gUnknown_080D77BC
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	ldr r5, _08005F98  @ 0xFFFF8100
	adds r0, r0, r5
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005F94: .4byte gUnknown_080D77BC
_08005F98: .4byte 0xFFFF8100

	THUMB_FUNC_START sub_8005F9C
sub_8005F9C: @ 0x08005F9C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	mov r3, sp
	ldr r2, _08005FCC  @ gUnknown_080D77DC
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5}
	stm r3!, {r4, r5}
	ldr r6, _08005FD0  @ 0xFFFF8100
	adds r0, r0, r6
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005FCC: .4byte gUnknown_080D77DC
_08005FD0: .4byte 0xFFFF8100

	THUMB_FUNC_START sub_8005FD4
sub_8005FD4: @ 0x08005FD4
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x2c]
	movs r1, #0
	strh r1, [r0, #0x32]
	bx lr

	THUMB_FUNC_START sub_8005FE0
sub_8005FE0: @ 0x08005FE0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl sub_80057A4
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	bne _08006034
	ldr r0, [r4, #0x2c]
	bl sub_80057A4
	movs r1, #8
	ands r1, r0
	movs r3, #0
	cmp r1, #0
	bne _08006006
	movs r3, #0x18
_08006006:
	adds r3, #0x10
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _0800602C  @ 0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08006030  @ 0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl RegisterObjectTileGraphics
	b _080060A4
	.align 2, 0
_0800602C: .4byte 0x000003FF
_08006030: .4byte 0x06010000
_08006034:
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080060A4
	ldr r0, [r4, #0x2c]
	bl sub_80057A4
	movs r1, #8
	ands r1, r0
	movs r5, #0
	cmp r1, #0
	bne _08006052
	movs r5, #0x18
_08006052:
	bl AdvanceGetLCGRNValue
	lsrs r0, r0, #0x10
	movs r1, #7
	ands r0, r1
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0800607E
	cmp r0, #1
	ble _08006084
	cmp r0, #2
	beq _08006082
	cmp r0, #3
	bne _08006084
_0800607E:
	adds r5, #8
	b _08006084
_08006082:
	adds r5, #0x10
_08006084:
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r5, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _08006124  @ 0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08006128  @ 0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl RegisterObjectTileGraphics
_080060A4:
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x2c]
	ldrb r2, [r1, #0x14]
	movs r1, #4
	subs r5, r1, r2
	bl sub_80057A4
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	bne _080060BC
	negs r5, r5
_080060BC:
	lsls r1, r5, #3
	ldr r0, [r4, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r5, r1, #0
	subs r5, #0x10
	ldr r1, _0800612C  @ 0x000001FF
	ands r5, r1
	bl sub_80057A4
	ands r0, r6
	cmp r0, #0
	beq _080060DE
	movs r0, #0x80
	lsls r0, r0, #5
	adds r5, r5, r0
_080060DE:
	ldr r0, [r4, #0x2c]
	bl sub_80057A4
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	negs r2, r2
	asrs r2, r2, #0x1f
	ands r2, r0
	ldr r4, [r4, #0x2c]
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #0x15]
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	adds r2, r2, r1
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _08006130  @ gUnknown_08590F8C
	ldrh r1, [r4, #0x3c]
	adds r1, #0x1c
	str r1, [sp]
	adds r1, r5, #0
	bl RegisterObjectAttributes
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006124: .4byte 0x000003FF
_08006128: .4byte 0x06010000
_0800612C: .4byte 0x000001FF
_08006130: .4byte gUnknown_08590F8C

	THUMB_FUNC_START sub_8006134
sub_8006134: @ 0x08006134
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0
	mov r9, r0
	cmp r5, #1
	beq _08006162
	cmp r5, #1
	bgt _08006154
	cmp r5, #0
	beq _0800615E
	b _0800622A
_08006154:
	cmp r5, #0x80
	beq _08006166
	cmp r5, #0x81
	beq _0800616E
	b _0800622A
_0800615E:
	movs r5, #0x58
	b _08006174
_08006162:
	movs r5, #0x18
	b _08006174
_08006166:
	movs r5, #0x58
	movs r1, #1
	mov r9, r1
	b _08006174
_0800616E:
	movs r5, #0x18
	movs r3, #1
	mov r9, r3
_08006174:
	ldr r0, [r7, #0x2c]
	ldr r1, [r0, #0x2c]
	ldrb r2, [r1, #0x16]
	movs r1, #4
	subs r4, r1, r2
	bl sub_80057A4
	movs r1, #1
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	bne _0800618E
	negs r4, r4
_0800618E:
	lsls r1, r4, #3
	ldr r0, [r7, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r4, r1, #0
	subs r4, #0x10
	ldr r1, _0800620C  @ 0x000001FF
	ands r4, r1
	bl sub_80057A4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080061B2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r4, r4, r0
_080061B2:
	ldr r0, [r7, #0x2c]
	bl sub_80057A4
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	negs r0, r0
	asrs r6, r0, #0x1f
	ands r6, r1
	ldr r2, [r7, #0x2c]
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	ldr r0, [r2, #0x2c]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	adds r6, r6, r1
	mov r0, r9
	cmp r0, #0
	beq _08006214
	adds r0, r2, #0
	bl sub_80057A4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080061EE
	adds r4, #0x10
_080061EE:
	ldr r1, [r7, #0x2c]
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _08006210  @ gUnknown_08590F4C
	ldrh r1, [r1, #0x3c]
	adds r1, r1, r5
	adds r1, #2
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl RegisterObjectAttributes
	b _0800622A
	.align 2, 0
_0800620C: .4byte 0x000001FF
_08006210: .4byte gUnknown_08590F4C
_08006214:
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _08006238  @ gUnknown_08590F8C
	ldrh r1, [r2, #0x3c]
	adds r1, r1, r5
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl RegisterObjectAttributes
_0800622A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006238: .4byte gUnknown_08590F8C

	THUMB_FUNC_START sub_800623C
sub_800623C: @ 0x0800623C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	ldr r0, [r0, #0x2c]
	ldrb r0, [r0, #0x18]
	movs r4, #0
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_8006470
	str r0, [r5, #0x38]
	strh r4, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	cmp r1, #6
	bne _08006274
	movs r0, #5
	strh r0, [r5, #0x30]
	ldr r0, _0800627C  @ 0x7FFFFFFF
	str r0, [r5, #0x38]
	movs r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x34]
	adds r0, r5, #0
	movs r1, #0x61
	bl Proc_GotoLabel
_08006274:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800627C: .4byte 0x7FFFFFFF

	THUMB_FUNC_START sub_8006280
sub_8006280: @ 0x08006280
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	movs r1, #0x32
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq _0800629C
	adds r1, r5, #0
	adds r0, r4, #0
	bl Proc_GotoLabel
	b _080062B2
_0800629C:
	cmp r0, #0
	bge _080062B2
	adds r0, r4, #0
	bl sub_8006470
	str r0, [r4, #0x38]
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl Proc_GotoLabel
_080062B2:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80062B8
sub_80062B8: @ 0x080062B8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _08006310
	lsls r0, r0, #2
	ldr r1, _080062D0  @ _080062D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080062D0: .4byte _080062D4
_080062D4: @ jump table
	.4byte _08006304 @ case 0
	.4byte _08006304 @ case 1
	.4byte _08006304 @ case 2
	.4byte _08006300 @ case 3
	.4byte _08006300 @ case 4
	.4byte _08006300 @ case 5
	.4byte _08006304 @ case 6
	.4byte _08006304 @ case 7
	.4byte _08006304 @ case 8
	.4byte _08006310 @ case 9
	.4byte _08006308 @ case 10
_08006300:
	movs r5, #0
	b _08006310
_08006304:
	movs r5, #1
	b _08006310
_08006308:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_GotoLabel
_08006310:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8006134
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8006324
sub_8006324: @ 0x08006324
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_START sub_800632C
sub_800632C: @ 0x0800632C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bgt _08006340
	adds r0, r4, #0
	bl sub_80062B8
	b _08006368
_08006340:
	adds r0, r4, #0
	movs r1, #0
	bl sub_8006134
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08006358
	adds r0, r4, #0
	movs r1, #1
	bl Proc_GotoLabel
_08006358:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne _08006368
	adds r0, r4, #0
	movs r1, #3
	bl Proc_GotoLabel
_08006368:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8006370
sub_8006370: @ 0x08006370
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_START sub_8006378
sub_8006378: @ 0x08006378
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bgt _0800638C
	adds r0, r4, #0
	bl sub_80062B8
	b _080063B4
_0800638C:
	adds r0, r4, #0
	movs r1, #1
	bl sub_8006134
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080063A4
	adds r0, r4, #0
	movs r1, #1
	bl Proc_GotoLabel
_080063A4:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne _080063B4
	adds r0, r4, #0
	movs r1, #2
	bl Proc_GotoLabel
_080063B4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80063BC
sub_80063BC: @ 0x080063BC
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_START sub_80063C4
sub_80063C4: @ 0x080063C4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _08006420
	lsls r0, r0, #2
	ldr r1, _080063DC  @ _080063E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080063DC: .4byte _080063E0
_080063E0: @ jump table
	.4byte _08006410 @ case 0
	.4byte _08006410 @ case 1
	.4byte _08006410 @ case 2
	.4byte _0800640C @ case 3
	.4byte _0800640C @ case 4
	.4byte _0800640C @ case 5
	.4byte _08006410 @ case 6
	.4byte _08006410 @ case 7
	.4byte _08006410 @ case 8
	.4byte _08006420 @ case 9
	.4byte _08006414 @ case 10
_0800640C:
	movs r5, #0
	b _08006420
_08006410:
	movs r5, #1
	b _08006420
_08006414:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_GotoLabel
	movs r0, #0
	strh r0, [r4, #0x32]
_08006420:
	adds r1, r5, #0
	adds r1, #0x80
	adds r0, r4, #0
	bl sub_8006134
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8006438
sub_8006438: @ 0x08006438
	push {r4, lr}
	adds r2, r0, #0
	cmp r1, #0
	bne _08006444
	ldr r0, [r2, #0x2c]
	ldrb r1, [r0, #0x18]
_08006444:
	ldr r4, [r2, #0x48]
	strh r1, [r4, #0x30]
	adds r0, r4, #0
	bl sub_8006470
	str r0, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8006458
sub_8006458: @ 0x08006458
	push {lr}
	ldr r2, _0800646C  @ gUnknown_03004980
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_8006438
	pop {r0}
	bx r0
	.align 2, 0
_0800646C: .4byte gUnknown_03004980

	THUMB_FUNC_START sub_8006470
sub_8006470: @ 0x08006470
	push {r4, lr}
	adds r4, r0, #0
	bl AdvanceGetLCGRNValue
	adds r1, r0, #0
	lsrs r2, r1, #0x10
	ldrh r1, [r4, #0x30]
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	bhi _080064C8
	lsls r0, r1, #2
	ldr r1, _08006494  @ _08006498
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006494: .4byte _08006498
_08006498: @ jump table
	.4byte _080064B6 @ case 0
	.4byte _080064BC @ case 1
	.4byte _080064AC @ case 2
	.4byte _080064C2 @ case 3
	.4byte _080064C6 @ case 4
_080064AC:
	asrs r0, r2, #7
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	b _080064C8
_080064B6:
	asrs r0, r2, #7
	adds r0, #0x1e
	b _080064C8
_080064BC:
	asrs r0, r2, #9
	adds r0, #0x1e
	b _080064C8
_080064C2:
	movs r0, #1
	b _080064C8
_080064C6:
	ldr r0, _080064D0  @ 0x7FFFFFFF
_080064C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080064D0: .4byte 0x7FFFFFFF

	THUMB_FUNC_START sub_80064D4
sub_80064D4: @ 0x080064D4
	ldr r0, [r0, #0x48]
	strh r1, [r0, #0x32]
	bx lr

	THUMB_FUNC_START sub_80064DC
sub_80064DC: @ 0x080064DC
	push {lr}
	ldr r2, _080064F0  @ gUnknown_03004980
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_80064D4
	pop {r0}
	bx r0
	.align 2, 0
_080064F0: .4byte gUnknown_03004980

	THUMB_FUNC_START sub_80064F4
sub_80064F4: @ 0x080064F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r9, r1
	mov sl, r2
	str r3, [sp, #4]
	ldr r1, _08006518  @ gUnknown_03004980
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r6, [r4]
	cmp r6, #0
	beq _0800651C
	movs r0, #0
	b _08006602
	.align 2, 0
_08006518: .4byte gUnknown_03004980
_0800651C:
	ldr r0, _0800655C  @ gUnknown_0859118C
	movs r1, #5
	bl Proc_Create
	adds r5, r0, #0
	str r5, [r4]
	mov r0, r9
	bl GetPortraitStructPointer
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _0800656C
	str r6, [sp]
	ldr r0, _08006560  @ gUnknown_0202A68C
	lsls r4, r7, #3
	adds r0, r4, r0
	ldrh r1, [r0, #4]
	lsls r1, r1, #5
	ldr r0, _08006564  @ gUnknown_02022AA8
	adds r1, r1, r0
	ldr r2, _08006568  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	b _08006582
	.align 2, 0
_0800655C: .4byte gUnknown_0859118C
_08006560: .4byte gUnknown_0202A68C
_08006564: .4byte gUnknown_02022AA8
_08006568: .4byte 0x01000008
_0800656C:
	mov r2, r8
	ldr r0, [r2, #8]
	ldr r1, _080065C8  @ gUnknown_0202A68C
	lsls r4, r7, #3
	adds r1, r4, r1
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08006582:
	mov r0, r8
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strb r7, [r0]
	mov r2, r9
	strh r2, [r5, #0x3e]
	adds r2, r5, #0
	adds r2, #0x41
	movs r0, #5
	strb r0, [r2]
	mov r0, sl
	strh r0, [r5, #0x34]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r5, #0x36]
	str r1, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_80057C0
	movs r1, #0xf0
	lsls r1, r1, #2
	ldr r2, [sp, #0x28]
	ands r1, r2
	cmp r1, #0x80
	beq _080065DA
	cmp r1, #0x80
	bgt _080065CC
	cmp r1, #0x40
	beq _080065D6
	b _080065E6
	.align 2, 0
_080065C8: .4byte gUnknown_0202A68C
_080065CC:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _080065E0
	b _080065E6
_080065D6:
	movs r3, #0
	b _080065EA
_080065DA:
	movs r3, #0x80
	lsls r3, r3, #3
	b _080065EA
_080065E0:
	movs r3, #0xc0
	lsls r3, r3, #4
	b _080065EA
_080065E6:
	movs r3, #0x80
	lsls r3, r3, #4
_080065EA:
	ldr r0, _08006614  @ gUnknown_0202A68C
	adds r0, r4, r0
	ldr r1, [r0]
	lsrs r1, r1, #5
	ldrh r2, [r0, #4]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r3
	strh r1, [r5, #0x3c]
	adds r0, r5, #0
_08006602:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006614: .4byte gUnknown_0202A68C

	THUMB_FUNC_START sub_8006618
sub_8006618: @ 0x08006618
	ldr r3, _08006628  @ gUnknown_03004980
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	strh r1, [r3, #0x34]
	ldr r0, [r0]
	strh r2, [r0, #0x36]
	bx lr
	.align 2, 0
_08006628: .4byte gUnknown_03004980

	THUMB_FUNC_START sub_800662C
sub_800662C: @ 0x0800662C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _0800663C
	bl sub_8097D54
_0800663C:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08006648
	bl sub_8097D54
_08006648:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8006650
sub_8006650: @ 0x08006650
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl GetPortraitStructPointer
	str r0, [r4, #0x30]
	ldr r0, [r0]
	ldr r5, _080066A0  @ gUnknown_0202A68C
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldr r1, [r1]
	ldr r2, _080066A4  @ 0x06010000
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x34]
	strh r0, [r1, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080066A0: .4byte gUnknown_0202A68C
_080066A4: .4byte 0x06010000

	THUMB_FUNC_START sub_80066A8
sub_80066A8: @ 0x080066A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _080066CC
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #0x18]
	strh r0, [r1, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	movs r1, #0
	bl Proc_GotoLabel
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	bl sub_8097D68
_080066CC:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _080066D8
	bl sub_8097D68
_080066D8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80066E0
sub_80066E0: @ 0x080066E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080066F8  @ gUnknown_08591304
	adds r1, r4, #0
	bl Proc_Create
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080066F8: .4byte gUnknown_08591304

	THUMB_FUNC_START sub_80066FC
sub_80066FC: @ 0x080066FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetPortraitStructPointer
	ldr r0, [r0]
	lsls r4, r4, #5
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r4, r1
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_800671C
sub_800671C: @ 0x0800671C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetPortraitStructPointer
	ldr r0, [r0, #8]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8006738
sub_8006738: @ 0x08006738
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r3, _08006770  @ gUnknown_080D77FC
	lsls r2, r2, #0x18
	cmp r2, #0
	bne _08006792
	movs r2, #0
	ldr r1, _08006774  @ 0x0000FFFF
	mov r8, r1
	movs r1, #0
	mov ip, r1
_08006756:
	adds r6, r3, #0
	adds r6, #0x18
	adds r5, r0, #0
	adds r5, #0x40
	adds r4, r2, #1
	adds r2, r0, #0
	movs r1, #0xb
_08006764:
	ldrh r0, [r3]
	cmp r0, r8
	bne _08006778
	mov r0, ip
	b _0800677A
	.align 2, 0
_08006770: .4byte gUnknown_080D77FC
_08006774: .4byte 0x0000FFFF
_08006778:
	adds r0, r7, r0
_0800677A:
	strh r0, [r2]
	adds r2, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bge _08006764
	adds r3, r6, #0
	adds r0, r5, #0
	adds r2, r4, #0
	cmp r2, #9
	ble _08006756
	b _080067DA
_08006792:
	movs r2, #0
	ldr r1, _080067BC  @ 0x0000FFFF
	mov r9, r1
	movs r1, #0
	mov ip, r1
	movs r1, #0x80
	lsls r1, r1, #3
	mov r8, r1
_080067A2:
	adds r6, r3, #0
	adds r6, #0x18
	adds r5, r0, #0
	adds r5, #0x40
	adds r4, r2, #1
	adds r2, r0, #0
	adds r3, #0x16
	movs r1, #0xb
_080067B2:
	ldrh r0, [r3]
	cmp r0, r9
	bne _080067C0
	mov r0, ip
	b _080067C4
	.align 2, 0
_080067BC: .4byte 0x0000FFFF
_080067C0:
	adds r0, r7, r0
	add r0, r8
_080067C4:
	strh r0, [r2]
	adds r2, #2
	subs r3, #2
	subs r1, #1
	cmp r1, #0
	bge _080067B2
	adds r3, r6, #0
	adds r0, r5, #0
	adds r2, r4, #0
	cmp r2, #9
	ble _080067A2
_080067DA:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80067E8
sub_80067E8: @ 0x080067E8
	push {r4, lr}
	movs r2, #0
	ldr r4, _08006808  @ gUnknown_0859133C
	movs r3, #0
_080067F0:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	str r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080067F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006808: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_800680C
sub_800680C: @ 0x0800680C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r4, _08006890  @ gUnknown_030000F0
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08006894  @ 0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl Font_InitForUI
	bl sub_8006978
	ldr r0, _08006898  @ gUnknown_0859133C
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	cmp r6, #0
	ble _08006862
	ldr r4, _0800689C  @ gUnknown_030000D0
	adds r5, r6, #0
_0800684A:
	adds r0, r4, #0
	movs r1, #0x1e
	bl Text_Init
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColorId
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0800684A
_08006862:
	cmp r7, #0
	beq _08006884
	ldr r4, _080068A0  @ gUnknown_089E8238
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080068A4  @ 0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080068A8  @ gUnknown_089E84D4
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08006884:
	bl sub_80067E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006890: .4byte gUnknown_030000F0
_08006894: .4byte 0x000003FF
_08006898: .4byte gUnknown_0859133C
_0800689C: .4byte gUnknown_030000D0
_080068A0: .4byte gUnknown_089E8238
_080068A4: .4byte 0x06000200
_080068A8: .4byte gUnknown_089E84D4

	THUMB_FUNC_START sub_80068AC
sub_80068AC: @ 0x080068AC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r5, _0800693C  @ gUnknown_030000F0
	ldr r1, _08006940  @ 0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08006944  @ 0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl InitSomeOtherGraphicsRelatedStruct
	adds r0, r5, #0
	bl SetFont
	movs r0, #1
	bl SetFontGlyphSet
	ldr r0, _08006948  @ gUnknown_0859EF20
	adds r4, #0x10
	lsls r1, r4, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r2, _0800694C  @ gUnknown_020228A8
	lsls r4, r4, #4
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08006950  @ 0x00007247
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08006954  @ 0x000031AE
	strh r1, [r0]
	adds r4, #0xf
	lsls r4, r4, #1
	adds r4, r4, r2
	ldr r0, _08006958  @ 0x00007FFF
	strh r0, [r4]
	ldr r0, _0800695C  @ gUnknown_0859133C
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	movs r5, #0
	cmp r5, r6
	bge _08006934
_0800690C:
	lsls r4, r5, #3
	ldr r0, _08006960  @ gUnknown_030000D0
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Init3
	adds r0, r4, #0
	bl sub_800465C
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetXCursor
	adds r5, #1
	cmp r5, r6
	blt _0800690C
_08006934:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800693C: .4byte gUnknown_030000F0
_08006940: .4byte 0x000003FF
_08006944: .4byte 0x06010000
_08006948: .4byte gUnknown_0859EF20
_0800694C: .4byte gUnknown_020228A8
_08006950: .4byte 0x00007247
_08006954: .4byte 0x000031AE
_08006958: .4byte 0x00007FFF
_0800695C: .4byte gUnknown_0859133C
_08006960: .4byte gUnknown_030000D0

	THUMB_FUNC_START sub_8006964
sub_8006964: @ 0x08006964
	push {lr}
	ldr r0, _08006974  @ gUnknown_0859EF00
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08006974: .4byte gUnknown_0859EF00

	THUMB_FUNC_START sub_8006978
sub_8006978: @ 0x08006978
	push {lr}
	ldr r0, _08006988  @ gUnknown_030000F0
	bl SetFont
	bl Font_LoadForDialogue
	pop {r0}
	bx r0
	.align 2, 0
_08006988: .4byte gUnknown_030000F0

	THUMB_FUNC_START sub_800698C
sub_800698C: @ 0x0800698C
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	ldr r4, _08006A14  @ gUnknown_0859133C
	ldr r3, [r4]
	movs r5, #0
	strb r0, [r3, #0xc]
	ldr r0, [r4]
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	str r2, [r0]
	str r5, [r0, #4]
	movs r6, #1
	strb r6, [r0, #8]
	ldr r0, [r4]
	strb r5, [r0, #9]
	ldr r0, [r4]
	adds r0, #0x82
	strb r5, [r0]
	ldr r0, [r4]
	strb r5, [r0, #0xb]
	bl GetTextSpeed
	ldr r1, [r4]
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	strb r5, [r0, #0x14]
	movs r0, #0xff
	bl sub_8007838
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, [r4]
	strb r5, [r0, #0x15]
	ldr r0, [r4]
	strb r5, [r0, #0x12]
	ldr r0, [r4]
	strb r6, [r0, #0x16]
	ldr r0, [r4]
	strb r5, [r0, #0x17]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x80
	movs r2, #0
	strh r5, [r1]
	str r5, [r0, #0x38]
	adds r0, #0x83
	strb r2, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	bl sub_8008B44
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	cmp r7, #0
	bne _08006A1C
	ldr r0, _08006A18  @ gUnknown_08591358
	movs r1, #3
	bl Proc_Create
	b _08006A24
	.align 2, 0
_08006A14: .4byte gUnknown_0859133C
_08006A18: .4byte gUnknown_08591358
_08006A1C:
	ldr r0, _08006A2C  @ gUnknown_08591358
	adds r1, r7, #0
	bl Proc_CreateBlockingChild
_08006A24:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006A2C: .4byte gUnknown_08591358

	THUMB_FUNC_START sub_8006A30
sub_8006A30: @ 0x08006A30
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_800698C
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8006A50
sub_8006A50: @ 0x08006A50
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r6, r3, #0
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl sub_800698C
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8006A70
sub_8006A70: @ 0x08006A70
	push {lr}
	movs r3, #0
	bl sub_800698C
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8006A7C
sub_8006A7C: @ 0x08006A7C
	push {lr}
	ldr r0, _08006A88  @ gUnknown_08591358
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_08006A88: .4byte gUnknown_08591358

	THUMB_FUNC_START sub_8006A8C
sub_8006A8C: @ 0x08006A8C
	ldr r1, _08006A94  @ gUnknown_0859133C
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08006A94: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8006A98
sub_8006A98: @ 0x08006A98
	ldr r0, _08006AA4  @ gUnknown_0859133C
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08006AA4: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8006AA8
sub_8006AA8: @ 0x08006AA8
	ldr r1, _08006AB8  @ gUnknown_0859133C
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_08006AB8: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8006ABC
sub_8006ABC: @ 0x08006ABC
	ldr r1, _08006AC4  @ gUnknown_0859133C
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_08006AC4: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8006AC8
sub_8006AC8: @ 0x08006AC8
	ldr r1, _08006AD8  @ gUnknown_0859133C
	ldr r2, [r1]
	adds r2, #0x80
	ldrh r1, [r2]
	bics r1, r0
	strh r1, [r2]
	bx lr
	.align 2, 0
_08006AD8: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8006ADC
sub_8006ADC: @ 0x08006ADC
	adds r1, r0, #0
	ldr r0, _08006AEC  @ gUnknown_0859133C
	ldr r0, [r0]
	adds r0, #0x80
	ldrh r0, [r0]
	ands r0, r1
	bx lr
	.align 2, 0
_08006AEC: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8006AF0
sub_8006AF0: @ 0x08006AF0
	push {lr}
	ldr r2, _08006B0C  @ gUnknown_0859133C
	ldr r1, [r2]
	strb r0, [r1, #0x13]
	ldr r2, [r2]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _08006B06
	movs r0, #0
	strb r0, [r2, #0x13]
_08006B06:
	pop {r0}
	bx r0
	.align 2, 0
_08006B0C: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8006B10
sub_8006B10: @ 0x08006B10
	push {r4, r5, r6, lr}
	ldr r2, _08006B44  @ gUnknown_0859133C
	ldr r1, [r2]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08006B3C
	adds r6, r2, #0
	ldr r5, _08006B48  @ gUnknown_030000D0
_08006B26:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl Text_SetColorId
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08006B26
_08006B3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006B44: .4byte gUnknown_0859133C
_08006B48: .4byte gUnknown_030000D0

	THUMB_FUNC_START sub_8006B4C
sub_8006B4C: @ 0x08006B4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08006BAC  @ gUnknown_08591470
	bl Proc_Find
	cmp r0, #0
	bne _08006BEE
	ldr r0, _08006BB0  @ gUnknown_085914C8
	bl Proc_Find
	cmp r0, #0
	bne _08006BEE
	movs r0, #4
	bl sub_8006ADC
	cmp r0, #0
	bne _08006BC4
	ldr r0, _08006BB4  @ gUnknown_0858791C
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08006BC4
	bl sub_800D3E4
	ldr r0, _08006BB8  @ gUnknown_0859133C
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl sub_80089C4
	adds r0, r4, #0
	bl Proc_Delete
	bl sub_8006A7C
	ldr r0, _08006BBC  @ gUnknown_02022CA8
	movs r1, #0
	bl BG_Fill
	ldr r0, _08006BC0  @ gUnknown_020234A8
	movs r1, #0
	bl BG_Fill
	movs r0, #3
	bl BG_EnableSyncByMask
	b _08006BEE
	.align 2, 0
_08006BAC: .4byte gUnknown_08591470
_08006BB0: .4byte gUnknown_085914C8
_08006BB4: .4byte gUnknown_0858791C
_08006BB8: .4byte gUnknown_0859133C
_08006BBC: .4byte gUnknown_02022CA8
_08006BC0: .4byte gUnknown_020234A8
_08006BC4:
	ldr r0, _08006BF4  @ gUnknown_085913F0
	bl Proc_Find
	cmp r0, #0
	bne _08006BEE
	movs r0, #8
	bl sub_8006ADC
	cmp r0, #0
	bne _08006BEE
	ldr r0, _08006BF8  @ gUnknown_0858791C
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _08006BEE
	ldr r0, _08006BFC  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x12]
_08006BEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006BF4: .4byte gUnknown_085913F0
_08006BF8: .4byte gUnknown_0858791C
_08006BFC: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8006C00
sub_8006C00: @ 0x08006C00
	push {lr}
	movs r0, #0x20
	bl sub_8006ADC
	cmp r0, #0
	bne _08006C24
	bl LoadObjUIGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08006C24:
	ldr r0, _08006C30  @ gUnknown_08591340
	movs r1, #3
	bl Proc_Create
	pop {r0}
	bx r0
	.align 2, 0
_08006C30: .4byte gUnknown_08591340

	THUMB_FUNC_START sub_8006C34
sub_8006C34: @ 0x08006C34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_8007A3C
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	beq _08006C4A
	b _08006D94
_08006C4A:
	ldr r2, _08006C94  @ gUnknown_0859133C
	ldr r1, [r2]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08006C6E
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r2]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08006C6E
	b _08006D94
_08006C6E:
	ldr r0, [r2]
	strb r3, [r0, #0x14]
_08006C72:
	ldr r7, _08006C94  @ gUnknown_0859133C
	ldr r0, _08006C98  @ gUnknown_0202BD31
	mov r8, r0
_08006C78:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl sub_80089C4
	adds r0, r6, #0
	bl sub_8006FD0
	cmp r0, #1
	beq _08006CD0
	cmp r0, #1
	bgt _08006C9C
	cmp r0, #0
	beq _08006CA6
	b _08006CD0
	.align 2, 0
_08006C94: .4byte gUnknown_0859133C
_08006C98: .4byte gUnknown_0202BD31
_08006C9C:
	cmp r0, #2
	beq _08006CAE
	cmp r0, #3
	beq _08006CC2
	b _08006CD0
_08006CA6:
	adds r0, r6, #0
	bl Proc_ClearNativeCallback
	b _08006D94
_08006CAE:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08006C72
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08006D7E
	b _08006D94
_08006CC2:
	ldr r0, [r7]
	ldrb r1, [r0, #0x13]
	movs r2, #0
	strb r1, [r0, #0x14]
	ldr r0, [r7]
	strb r2, [r0, #0x12]
	b _08006D94
_08006CD0:
	movs r0, #0x20
	bl sub_8006ADC
	cmp r0, #0
	bne _08006CE2
	adds r0, r6, #0
	bl sub_8006DA0
	b _08006CE8
_08006CE2:
	adds r0, r6, #0
	bl sub_8006E8C
_08006CE8:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08006D94
	ldr r5, _08006D38  @ gUnknown_0859133C
	ldr r4, [r5]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xb]
	adds r0, r0, r1
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08006D3C  @ gUnknown_030000D0
	adds r0, r0, r1
	ldr r1, [r4]
	bl Text_AppendChar
	ldr r1, [r5]
	str r0, [r1]
	movs r0, #0x40
	bl sub_8006ADC
	cmp r0, #0
	bne _08006D7E
	movs r0, #0x80
	bl sub_8006ADC
	cmp r0, #0
	beq _08006D40
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08006D7E
	movs r0, #0x7a
	bl m4aSongNumStart
	b _08006D7E
	.align 2, 0
_08006D38: .4byte gUnknown_0859133C
_08006D3C: .4byte gUnknown_030000D0
_08006D40:
	bl GetTextSpeed
	adds r4, r0, #0
	cmp r4, #1
	bne _08006D54
	bl sub_8000D28
	ands r0, r4
	cmp r0, #0
	beq _08006D7E
_08006D54:
	ldr r1, [r5]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08006D68
	adds r0, r1, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne _08006D7E
_08006D68:
	adds r1, #0x82
	movs r0, #1
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08006D7E
	movs r0, #0x6e
	bl m4aSongNumStart
_08006D7E:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08006D8A
	b _08006C78
_08006D8A:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bgt _08006D94
	b _08006C78
_08006D94:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8006DA0
sub_8006DA0: @ 0x08006DA0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_800890C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08006E0C
	ldr r4, _08006E08  @ gUnknown_0859133C
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	beq _08006E0C
	movs r0, #2
	bl sub_8006ADC
	cmp r0, #0
	bne _08006E0C
	ldr r1, [r4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _08006DCC
	ldr r0, [r1]
_08006DCC:
	movs r1, #0
	bl sub_8008B44
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	bl sub_80081A8
	ldr r4, _08006E08  @ gUnknown_0859133C
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	adds r1, r7, #0
	bl sub_80088A8
	ldr r0, [r4]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl sub_8006ADC
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_800798C
	movs r0, #1
	b _08006E7C
	.align 2, 0
_08006E08: .4byte gUnknown_0859133C
_08006E0C:
	ldr r6, _08006E28  @ gUnknown_0859133C
	ldr r5, [r6]
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	cmp r0, r1
	bcc _08006E30
	movs r0, #0
	strb r0, [r5, #0x12]
	ldr r0, _08006E2C  @ gUnknown_085914C8
	adds r1, r7, #0
	bl Proc_CreateBlockingChild
	movs r0, #1
	b _08006E7C
	.align 2, 0
_08006E28: .4byte gUnknown_0859133C
_08006E2C: .4byte gUnknown_085914C8
_08006E30:
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	bne _08006E6C
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08006E84  @ gUnknown_030000D0
	adds r0, r0, r1
	lsls r4, r4, #1
	ldrb r1, [r5, #0xd]
	adds r4, r4, r1
	lsls r4, r4, #5
	ldrb r5, [r5, #0xc]
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08006E88  @ gUnknown_02022CA8
	adds r4, r4, r1
	adds r1, r4, #0
	bl Text_Draw
	movs r0, #1
	bl sub_8008F20
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x15]
_08006E6C:
	ldr r1, [r6]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _08006E7A
	ldrb r0, [r1, #0x11]
	bl sub_80089B8
_08006E7A:
	movs r0, #0
_08006E7C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006E84: .4byte gUnknown_030000D0
_08006E88: .4byte gUnknown_02022CA8

	THUMB_FUNC_START sub_8006E8C
sub_8006E8C: @ 0x08006E8C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08006EAC  @ gUnknown_0859133C
	ldr r2, [r0]
	ldrb r0, [r2, #9]
	ldrb r3, [r2, #0xa]
	cmp r0, r3
	bcc _08006EB4
	movs r0, #0
	strb r0, [r2, #0x12]
	ldr r0, _08006EB0  @ gUnknown_085914F0
	bl Proc_CreateBlockingChild
	movs r0, #1
	b _08006EC0
	.align 2, 0
_08006EAC: .4byte gUnknown_0859133C
_08006EB0: .4byte gUnknown_085914F0
_08006EB4:
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	bne _08006EBE
	movs r0, #1
	strb r0, [r2, #0x15]
_08006EBE:
	movs r0, #0
_08006EC0:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8006EC4
sub_8006EC4: @ 0x08006EC4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08006ED4  @ gUnknown_08591388
	bl Proc_CreateBlockingChild
	pop {r0}
	bx r0
	.align 2, 0
_08006ED4: .4byte gUnknown_08591388

	THUMB_FUNC_START sub_8006ED8
sub_8006ED8: @ 0x08006ED8
	push {lr}
	ldr r0, _08006EEC  @ gUnknown_08591388
	bl Proc_Find
	cmp r0, #0
	beq _08006EE6
	movs r0, #1
_08006EE6:
	pop {r1}
	bx r1
	.align 2, 0
_08006EEC: .4byte gUnknown_08591388

	THUMB_FUNC_START sub_8006EF0
sub_8006EF0: @ 0x08006EF0
	push {lr}
	ldr r0, _08006EFC  @ gUnknown_08591388
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_08006EFC: .4byte gUnknown_08591388

	THUMB_FUNC_START sub_8006F00
sub_8006F00: @ 0x08006F00
	push {r4, r5, lr}
	ldr r1, _08006F40  @ gUnknown_0859133C
	ldr r2, [r1]
	ldrb r0, [r2, #8]
	cmp r0, #1
	bne _08006F48
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _08006F38
	adds r5, r1, #0
_08006F16:
	ldr r1, [r5]
	ldrb r0, [r1, #0xb]
	adds r0, r4, r0
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08006F44  @ gUnknown_030000D0
	adds r0, r0, r1
	movs r1, #4
	bl Text_SetColorId
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08006F16
_08006F38:
	ldr r0, _08006F40  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #4
	b _08006F7A
	.align 2, 0
_08006F40: .4byte gUnknown_0859133C
_08006F44: .4byte gUnknown_030000D0
_08006F48:
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _08006F74
	adds r5, r1, #0
_08006F52:
	ldr r1, [r5]
	ldrb r0, [r1, #0xb]
	adds r0, r4, r0
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08006F84  @ gUnknown_030000D0
	adds r0, r0, r1
	movs r1, #1
	bl Text_SetColorId
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08006F52
_08006F74:
	ldr r0, _08006F88  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #1
_08006F7A:
	strb r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006F84: .4byte gUnknown_030000D0
_08006F88: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8006F8C
sub_8006F8C: @ 0x08006F8C
	push {lr}
	cmp r0, #0
	beq _08006FB0
	ldr r0, _08006FA8  @ gUnknown_0859F000
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08006FAC  @ gUnknown_0859EFE0
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _08006FC4
	.align 2, 0
_08006FA8: .4byte gUnknown_0859F000
_08006FAC: .4byte gUnknown_0859EFE0
_08006FB0:
	ldr r0, _08006FC8  @ gUnknown_089E84D4
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08006FCC  @ gUnknown_0859EF00
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08006FC4:
	pop {r0}
	bx r0
	.align 2, 0
_08006FC8: .4byte gUnknown_089E84D4
_08006FCC: .4byte gUnknown_0859EF00

	THUMB_FUNC_START sub_8006FD0
sub_8006FD0: @ 0x08006FD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
_08006FDA:
	ldr r7, _08007010  @ gUnknown_0859133C
	adds r5, r7, #0
_08006FDE:
	ldr r1, [r5]
	ldr r4, [r1]
	ldrb r0, [r4]
	cmp r0, #0x14
	bgt _08007014
	cmp r0, #0x12
	blt _08007014
	adds r4, #1
	str r4, [r1]
	bl sub_800890C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_8008B44
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r5]
	adds r0, #2
	strb r0, [r1, #0xe]
	b _08006FDE
	.align 2, 0
_08007010: .4byte gUnknown_0859133C
_08007014:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x81
	bls _08007022
	bl _08007828
_08007022:
	lsls r0, r0, #2
	ldr r1, _0800702C  @ _08007030
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800702C: .4byte _08007030
_08007030: @ jump table
	.4byte _08007298 @ case 0
	.4byte _080072AE @ case 1
	.4byte _080072CC @ case 2
	.4byte _08007314 @ case 3
	.4byte _08007350 @ case 4
	.4byte _08007350 @ case 5
	.4byte _08007350 @ case 6
	.4byte _08007350 @ case 7
	.4byte _08007450 @ case 8
	.4byte _08007450 @ case 9
	.4byte _08007450 @ case 10
	.4byte _08007450 @ case 11
	.4byte _08007450 @ case 12
	.4byte _08007450 @ case 13
	.4byte _08007450 @ case 14
	.4byte _08007450 @ case 15
	.4byte _080073AC @ case 16
	.4byte _080073EC @ case 17
	.4byte _08007828 @ case 18
	.4byte _08007828 @ case 19
	.4byte _08007828 @ case 20
	.4byte _08007384 @ case 21
	.4byte _08007394 @ case 22
	.4byte _080073A0 @ case 23
	.4byte _08007462 @ case 24
	.4byte _080074AC @ case 25
	.4byte _080074F8 @ case 26
	.4byte _08007544 @ case 27
	.4byte _08007430 @ case 28
	.4byte _08007440 @ case 29
	.4byte _08007828 @ case 30
	.4byte _08007828 @ case 31
	.4byte _08007828 @ case 32
	.4byte _08007828 @ case 33
	.4byte _08007828 @ case 34
	.4byte _08007828 @ case 35
	.4byte _08007828 @ case 36
	.4byte _08007828 @ case 37
	.4byte _08007828 @ case 38
	.4byte _08007828 @ case 39
	.4byte _08007828 @ case 40
	.4byte _08007828 @ case 41
	.4byte _08007828 @ case 42
	.4byte _08007828 @ case 43
	.4byte _08007828 @ case 44
	.4byte _08007828 @ case 45
	.4byte _08007828 @ case 46
	.4byte _08007828 @ case 47
	.4byte _08007828 @ case 48
	.4byte _08007828 @ case 49
	.4byte _08007828 @ case 50
	.4byte _08007828 @ case 51
	.4byte _08007828 @ case 52
	.4byte _08007828 @ case 53
	.4byte _08007828 @ case 54
	.4byte _08007828 @ case 55
	.4byte _08007828 @ case 56
	.4byte _08007828 @ case 57
	.4byte _08007828 @ case 58
	.4byte _08007828 @ case 59
	.4byte _08007828 @ case 60
	.4byte _08007828 @ case 61
	.4byte _08007828 @ case 62
	.4byte _08007828 @ case 63
	.4byte _08007828 @ case 64
	.4byte _08007828 @ case 65
	.4byte _08007828 @ case 66
	.4byte _08007828 @ case 67
	.4byte _08007828 @ case 68
	.4byte _08007828 @ case 69
	.4byte _08007828 @ case 70
	.4byte _08007828 @ case 71
	.4byte _08007828 @ case 72
	.4byte _08007828 @ case 73
	.4byte _08007828 @ case 74
	.4byte _08007828 @ case 75
	.4byte _08007828 @ case 76
	.4byte _08007828 @ case 77
	.4byte _08007828 @ case 78
	.4byte _08007828 @ case 79
	.4byte _08007828 @ case 80
	.4byte _08007828 @ case 81
	.4byte _08007828 @ case 82
	.4byte _08007828 @ case 83
	.4byte _08007828 @ case 84
	.4byte _08007828 @ case 85
	.4byte _08007828 @ case 86
	.4byte _08007828 @ case 87
	.4byte _08007828 @ case 88
	.4byte _08007828 @ case 89
	.4byte _08007828 @ case 90
	.4byte _08007828 @ case 91
	.4byte _08007828 @ case 92
	.4byte _08007828 @ case 93
	.4byte _08007828 @ case 94
	.4byte _08007828 @ case 95
	.4byte _08007828 @ case 96
	.4byte _08007828 @ case 97
	.4byte _08007828 @ case 98
	.4byte _08007828 @ case 99
	.4byte _08007828 @ case 100
	.4byte _08007828 @ case 101
	.4byte _08007828 @ case 102
	.4byte _08007828 @ case 103
	.4byte _08007828 @ case 104
	.4byte _08007828 @ case 105
	.4byte _08007828 @ case 106
	.4byte _08007828 @ case 107
	.4byte _08007828 @ case 108
	.4byte _08007828 @ case 109
	.4byte _08007828 @ case 110
	.4byte _08007828 @ case 111
	.4byte _08007828 @ case 112
	.4byte _08007828 @ case 113
	.4byte _08007828 @ case 114
	.4byte _08007828 @ case 115
	.4byte _08007828 @ case 116
	.4byte _08007828 @ case 117
	.4byte _08007828 @ case 118
	.4byte _08007828 @ case 119
	.4byte _08007828 @ case 120
	.4byte _08007828 @ case 121
	.4byte _08007828 @ case 122
	.4byte _08007828 @ case 123
	.4byte _08007828 @ case 124
	.4byte _08007828 @ case 125
	.4byte _08007828 @ case 126
	.4byte _08007828 @ case 127
	.4byte _08007590 @ case 128
	.4byte _08007238 @ case 129
_08007238:
	ldr r2, [r7]
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	cmp r0, #0x40
	beq _08007244
	b _08007828
_08007244:
	adds r0, r1, #2
	str r0, [r2]
	ldrb r0, [r2, #9]
	ldrb r1, [r2, #0xb]
	adds r0, r0, r1
	ldrb r1, [r2, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08007290  @ gUnknown_030000D0
	adds r0, r0, r1
	movs r1, #6
	bl Text_Advance
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0800726C
	b _08007360
_0800726C:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08007360
	ldr r0, _08007294  @ gUnknown_085913D0
	mov r1, r8
	bl Proc_CreateBlockingChild
	adds r4, r0, #0
	movs r0, #4
	bl sub_8008198
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
_0800728A:
	movs r0, #3
	b _0800782A
	.align 2, 0
_08007290: .4byte gUnknown_030000D0
_08007294: .4byte gUnknown_085913D0
_08007298:
	ldr r1, [r7]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _080072A4
_080072A0:
	movs r0, #0
	b _0800782A
_080072A4:
	adds r0, #2
	str r0, [r1]
	movs r0, #0
	str r0, [r1, #4]
	b _08006FDA
_080072AE:
	ldr r1, [r7]
	ldrb r0, [r1, #0x15]
	cmp r0, #1
	beq _080072BC
	ldrb r0, [r1, #9]
	cmp r0, #1
	bne _080072C2
_080072BC:
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
_080072C2:
	ldr r1, [r7]
	movs r0, #0
	strb r0, [r1, #0x15]
	ldr r1, [r7]
	b _0800735A
_080072CC:
	movs r0, #0x80
	bl sub_8006ADC
	cmp r0, #0
	beq _080072EC
	bl sub_800815C
	ldr r0, _080072E8  @ gUnknown_0859133C
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08007308
	.align 2, 0
_080072E8: .4byte gUnknown_0859133C
_080072EC:
	movs r0, #1
	bl sub_8006ADC
	cmp r0, #0
	bne _08007304
	ldr r0, _08007300  @ gUnknown_08591470
	mov r1, r8
	bl Proc_CreateBlockingChild
	b _08007308
	.align 2, 0
_08007300: .4byte gUnknown_08591470
_08007304:
	bl sub_8008250
_08007308:
	ldr r0, _08007310  @ gUnknown_0859133C
	ldr r1, [r0]
	b _0800773C
	.align 2, 0
_08007310: .4byte gUnknown_0859133C
_08007314:
	ldr r1, [r7]
	ldrb r0, [r1, #9]
	ldrb r2, [r1, #0xb]
	adds r0, r0, r2
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0800734C  @ gUnknown_030000D0
	adds r0, r0, r1
	bl Text_GetXCursor
	ldr r3, [r7]
	ldrb r1, [r3, #0xc]
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #4
	ldrb r2, [r3, #0xd]
	lsls r2, r2, #3
	ldrb r0, [r3, #9]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	mov r0, r8
	bl sub_8007CD8
	b _0800773A
	.align 2, 0
_0800734C: .4byte gUnknown_030000D0
_08007350:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08007364
_0800735A:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_08007360:
	movs r0, #2
	b _0800782A
_08007364:
	ldr r0, _08007380  @ gUnknown_085913D0
	mov r1, r8
	bl Proc_CreateBlockingChild
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	bl sub_8008198
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	b _0800773A
	.align 2, 0
_08007380: .4byte gUnknown_085913D0
_08007384:
	bl sub_80081A8
	ldr r0, _08007390  @ gUnknown_0859133C
	ldr r1, [r0]
	b _0800773C
	.align 2, 0
_08007390: .4byte gUnknown_0859133C
_08007394:
	ldr r2, [r7]
	ldrb r1, [r2, #0x16]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2, #0x16]
	b _0800773A
_080073A0:
	ldr r2, [r7]
	ldrb r1, [r2, #0x17]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2, #0x17]
	b _0800773A
_080073AC:
	ldr r4, _080073C4  @ gUnknown_0859133C
_080073AE:
	ldr r2, [r4]
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #8
	bge _080073BA
	b _0800728A
_080073BA:
	cmp r0, #0xf
	ble _080073C8
	cmp r0, #0x10
	beq _080073D8
	b _0800728A
	.align 2, 0
_080073C4: .4byte gUnknown_0859133C
_080073C8:
	subs r0, #8
	bl sub_8007838
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _080073AE
_080073D8:
	adds r0, r1, #1
	str r0, [r2]
	mov r0, r8
	bl sub_8007854
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	b _080073AE
_080073EC:
	bl sub_800890C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080073FA
	bl sub_80081A8
_080073FA:
	ldr r4, _0800742C  @ gUnknown_0859133C
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	lsls r1, r1, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8005F38
	ldr r2, [r4]
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x18
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	mov r0, r8
	movs r1, #0x10
	bl NewBlockingTimer
	b _0800728A
	.align 2, 0
_0800742C: .4byte gUnknown_0859133C
_08007430:
	movs r0, #0x10
	bl sub_8006AA8
	ldr r0, _0800743C  @ gUnknown_0859133C
	ldr r1, [r0]
	b _0800773C
	.align 2, 0
_0800743C: .4byte gUnknown_0859133C
_08007440:
	movs r0, #0x10
	bl sub_8006AC8
	ldr r0, _0800744C  @ gUnknown_0859133C
	ldr r1, [r0]
	b _0800773C
	.align 2, 0
_0800744C: .4byte gUnknown_0859133C
_08007450:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl sub_80089C4
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #8
	b _08007736
_08007462:
	ldr r6, _080074A0  @ gUnknown_08591490
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _080074A4  @ gUnknown_030000D0
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _080074A8  @ gUnknown_02022CA8
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_8007DE8
	b _0800773A
	.align 2, 0
_080074A0: .4byte gUnknown_08591490
_080074A4: .4byte gUnknown_030000D0
_080074A8: .4byte gUnknown_02022CA8
_080074AC:
	ldr r6, _080074EC  @ gUnknown_08591490
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _080074F0  @ gUnknown_030000D0
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _080074F4  @ gUnknown_02022CA8
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_8007DE8
	b _0800773A
	.align 2, 0
_080074EC: .4byte gUnknown_08591490
_080074F0: .4byte gUnknown_030000D0
_080074F4: .4byte gUnknown_02022CA8
_080074F8:
	ldr r6, _08007538  @ gUnknown_085914A0
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _0800753C  @ gUnknown_030000D0
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _08007540  @ gUnknown_02022CA8
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_8007DE8
	b _0800773A
	.align 2, 0
_08007538: .4byte gUnknown_085914A0
_0800753C: .4byte gUnknown_030000D0
_08007540: .4byte gUnknown_02022CA8
_08007544:
	ldr r6, _08007584  @ gUnknown_085914A0
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08007588  @ gUnknown_030000D0
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _0800758C  @ gUnknown_02022CA8
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_8007DE8
	b _0800773A
	.align 2, 0
_08007584: .4byte gUnknown_085914A0
_08007588: .4byte gUnknown_030000D0
_0800758C: .4byte gUnknown_02022CA8
_08007590:
	ldr r0, [r7]
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldrb r0, [r2, #1]
	cmp r0, #0x25
	bls _080075A0
	b _080072A0
_080075A0:
	lsls r0, r0, #2
	ldr r1, _080075AC  @ _080075B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080075AC: .4byte _080075B0
_080075B0: @ jump table
	.4byte _0800766C @ case 0
	.4byte _0800766C @ case 1
	.4byte _0800766C @ case 2
	.4byte _0800766C @ case 3
	.4byte _080076BE @ case 4
	.4byte _080076D0 @ case 5
	.4byte _08007708 @ case 6
	.4byte _0800773A @ case 7
	.4byte _0800773A @ case 8
	.4byte _080072A0 @ case 9
	.4byte _08007720 @ case 10
	.4byte _08007720 @ case 11
	.4byte _08007720 @ case 12
	.4byte _08007720 @ case 13
	.4byte _08007720 @ case 14
	.4byte _08007720 @ case 15
	.4byte _08007720 @ case 16
	.4byte _08007720 @ case 17
	.4byte _080072A0 @ case 18
	.4byte _080072A0 @ case 19
	.4byte _080072A0 @ case 20
	.4byte _080072A0 @ case 21
	.4byte _08007744 @ case 22
	.4byte _0800775A @ case 23
	.4byte _08007770 @ case 24
	.4byte _08007786 @ case 25
	.4byte _0800779C @ case 26
	.4byte _080077B2 @ case 27
	.4byte _080077CC @ case 28
	.4byte _080077E2 @ case 29
	.4byte _080077F8 @ case 30
	.4byte _0800780E @ case 31
	.4byte _080076F0 @ case 32
	.4byte _08007658 @ case 33
	.4byte _080072A0 @ case 34
	.4byte _080072A0 @ case 35
	.4byte _08007648 @ case 36
	.4byte _080076AC @ case 37
_08007648:
	ldr r0, [r7]
	ldr r1, [r0, #0x38]
	cmp r1, #0
	beq _0800773A
	mov r0, r8
	bl _call_via_r1
	b _0800773A
_08007658:
	bl sub_8006F00
	ldr r0, _08007668  @ gUnknown_0859133C
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08006FDA
	.align 2, 0
_08007668: .4byte gUnknown_0859133C
_0800766C:
	ldr r3, _080076A4  @ gUnknown_0859133C
	ldr r1, [r3]
	ldr r2, [r1]
	adds r0, r2, #1
	str r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r3]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _0800769E
	adds r6, r3, #0
	ldr r5, _080076A8  @ gUnknown_030000D0
_08007688:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl Text_SetColorId
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08007688
_0800769E:
	ldr r0, _080076A4  @ gUnknown_0859133C
	ldr r1, [r0]
	b _0800773C
	.align 2, 0
_080076A4: .4byte gUnknown_0859133C
_080076A8: .4byte gUnknown_030000D0
_080076AC:
	ldr r2, [r7]
	adds r2, #0x83
	ldrb r0, [r2]
	movs r1, #1
	ands r1, r0
	movs r0, #3
	subs r0, r0, r1
	strb r0, [r2]
	b _0800773A
_080076BE:
	mov r0, r8
	bl sub_8006EC4
	ldr r0, _080076CC  @ gUnknown_0859133C
	ldr r1, [r0]
	b _0800773C
	.align 2, 0
_080076CC: .4byte gUnknown_0859133C
_080076D0:
	ldr r4, _080076EC  @ gUnknown_0859133C
	ldr r1, [r4]
	ldr r0, [r1, #0x3c]
	adds r1, #0x40
	bl String_FromNumber
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r1]
	b _08006FDA
	.align 2, 0
_080076EC: .4byte gUnknown_0859133C
_080076F0:
	ldr r4, _08007704  @ gUnknown_0859133C
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	bl GetTacticianNameStringPtr
	ldr r1, [r4]
	str r0, [r1]
	b _08006FDA
	.align 2, 0
_08007704: .4byte gUnknown_0859133C
_08007708:
	ldr r0, _0800771C  @ gUnknown_0859133C
	ldr r1, [r0]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x60
	str r0, [r1]
	b _08006FDA
	.align 2, 0
_0800771C: .4byte gUnknown_0859133C
_08007720:
	ldr r1, [r7]
	ldrb r0, [r1, #0x11]
	ldr r1, [r1]
	ldrb r1, [r1]
	subs r1, #0xa
	bl sub_80079E4
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0xa
_08007736:
	bl sub_8007838
_0800773A:
	ldr r1, [r7]
_0800773C:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _0800728A
_08007744:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _080077C6
_0800775A:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #1
	b _080077C6
_08007770:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _080077C6
_08007786:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _080077C6
_0800779C:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
	b _080077C6
_080077B2:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #5
_080077C6:
	bl sub_8006438
	b _0800728A
_080077CC:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _08007822
_080077E2:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _08007822
_080077F8:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _08007822
_0800780E:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
_08007822:
	bl sub_80064D4
	b _0800728A
_08007828:
	movs r0, #1
_0800782A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8007838
sub_8007838: @ 0x08007838
	ldr r1, _08007840  @ gUnknown_0859133C
	ldr r1, [r1]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08007840: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8007844
sub_8007844: @ 0x08007844
	push {lr}
	ldr r0, _08007850  @ gUnknown_08591390
	bl SetupFaceGfxData
	pop {r0}
	bx r0
	.align 2, 0
_08007850: .4byte gUnknown_08591390

	THUMB_FUNC_START sub_8007854
sub_8007854: @ 0x08007854
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0800787C  @ gUnknown_0859133C
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	bne _0800786A
	movs r0, #1
	bl sub_8007838
_0800786A:
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08007880
	bl sub_8007844
	b _08007882
	.align 2, 0
_0800787C: .4byte gUnknown_0859133C
_08007880:
	movs r6, #2
_08007882:
	ldr r4, _080078B4  @ gUnknown_0859133C
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	bl sub_8008934
	cmp r0, #0xe
	bgt _08007894
	movs r0, #1
	orrs r6, r0
_08007894:
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r4, [r0]
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	adds r4, r4, r0
	ldr r0, _080078B8  @ 0x0000FFFF
	cmp r4, r0
	bne _080078C0
	ldr r0, _080078BC  @ gUnknown_03004E50
	ldr r0, [r0]
	bl GetUnitPortraitId
	adds r4, r0, #0
	b _080078C4
	.align 2, 0
_080078B4: .4byte gUnknown_0859133C
_080078B8: .4byte 0x0000FFFF
_080078BC: .4byte gUnknown_03004E50
_080078C0:
	ldr r0, _080078E0  @ 0xFFFFFF00
	adds r4, r4, r0
_080078C4:
	ldr r5, _080078E4  @ gUnknown_0859133C
	ldr r0, [r5]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080078E8
	adds r1, r4, #0
	bl sub_80066E0
	b _08007930
	.align 2, 0
_080078E0: .4byte 0xFFFFFF00
_080078E4: .4byte gUnknown_0859133C
_080078E8:
	adds r0, r2, #0
	bl sub_8008934
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r0, r4, #0
	movs r2, #0x50
	adds r3, r6, #0
	bl sub_8005610
	ldr r3, [r5]
	ldrb r1, [r3, #0x11]
	lsls r1, r1, #2
	adds r2, r3, #0
	adds r2, #0x18
	adds r1, r2, r1
	str r0, [r1]
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	bl sub_8005EF0
	ldr r0, [r5]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl sub_8006ADC
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_800798C
	adds r0, r7, #0
	movs r1, #8
	bl NewBlockingTimer
_08007930:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8007938
sub_8007938: @ 0x08007938
	push {r4, lr}
	ldr r4, [sp, #8]
	bl sub_8005610
	ldr r1, _08007954  @ gUnknown_0859133C
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #0x18
	adds r1, r1, r4
	str r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007954: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8007958
sub_8007958: @ 0x08007958
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _08007974  @ gUnknown_03004980
_08007960:
	ldr r0, [r2]
	cmp r0, #0
	beq _08007978
	movs r4, #0x34
	ldrsh r0, [r0, r4]
	cmp r0, r3
	bne _08007978
	adds r0, r1, #0
	b _08007984
	.align 2, 0
_08007974: .4byte gUnknown_03004980
_08007978:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08007960
	movs r0, #1
	negs r0, r0
_08007984:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_800798C
sub_800798C: @ 0x0800798C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	cmp r1, #0
	bne _080079DE
	movs r7, #5
	movs r6, #6
	cmp r3, #0
	blt _080079A4
	cmp r3, #2
	ble _080079A4
	cmp r3, #5
	ble _080079AA
_080079A4:
	movs r1, #0
	movs r4, #2
	b _080079AE
_080079AA:
	movs r1, #3
	movs r4, #5
_080079AE:
	adds r2, r1, #0
	cmp r2, r4
	bgt _080079DE
	ldr r5, _080079D0  @ gUnknown_0859133C
_080079B6:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080079D8
	cmp r2, r3
	bne _080079D4
	adds r0, #0x41
	strb r7, [r0]
	b _080079D8
	.align 2, 0
_080079D0: .4byte gUnknown_0859133C
_080079D4:
	adds r0, #0x41
	strb r6, [r0]
_080079D8:
	adds r2, #1
	cmp r2, r4
	ble _080079B6
_080079DE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80079E4
sub_80079E4: @ 0x080079E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r7, #0
	ldr r0, _08007A38  @ gUnknown_0859133C
	mov r8, r0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, #0x18
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _08007A0E
	movs r7, #1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_8007A58
_08007A0E:
	adds r2, r7, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8007A58
	mov r1, r8
	ldr r0, [r1]
	lsls r2, r5, #2
	adds r0, #0x18
	adds r2, r0, r2
	ldr r3, [r2]
	adds r0, r0, r6
	ldr r1, [r0]
	str r1, [r2]
	str r3, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007A38: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8007A3C
sub_8007A3C: @ 0x08007A3C
	push {lr}
	ldr r0, _08007A4C  @ gUnknown_085913B0
	bl Proc_Find
	cmp r0, #0
	bne _08007A50
	movs r0, #0
	b _08007A52
	.align 2, 0
_08007A4C: .4byte gUnknown_085913B0
_08007A50:
	movs r0, #1
_08007A52:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8007A58
sub_8007A58: @ 0x08007A58
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	bl sub_8008934
	lsls r0, r0, #3
	bl sub_8007958
	adds r5, r0, #0
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq _08007AA0
	ldr r0, _08007AA8  @ gUnknown_085913B0
	ldr r1, _08007AAC  @ gUnknown_03004980
	lsls r4, r5, #2
	adds r4, r4, r1
	ldr r1, [r4]
	bl Proc_Create
	adds r3, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r0, [r4]
	ldrh r1, [r0, #0x34]
	adds r0, r3, #0
	adds r0, #0x68
	strh r1, [r0]
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r3, #0
	adds r1, #0x6a
	strh r0, [r1]
_08007AA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007AA8: .4byte gUnknown_085913B0
_08007AAC: .4byte gUnknown_03004980

	THUMB_FUNC_START sub_8007AB0
sub_8007AB0: @ 0x08007AB0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x58]
	adds r4, r6, #0
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_8008934
	adds r5, r6, #0
	adds r5, #0x68
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0
	bge _08007AEA
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_8008934
	lsls r0, r0, #3
	movs r2, #0
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	cmp r0, #0x18
	bgt _08007AFE
	b _08007B02
_08007AEA:
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_8008934
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0x18
	ble _08007B02
_08007AFE:
	movs r0, #0x20
	b _08007B04
_08007B02:
	movs r0, #0x10
_08007B04:
	str r0, [r6, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8007B0C
sub_8007B0C: @ 0x08007B0C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	cmp r2, #0x10
	ble _08007B80
	adds r1, r2, #0
	cmp r2, #0
	bge _08007B20
	adds r1, r2, #7
_08007B20:
	asrs r1, r1, #3
	ldr r0, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, r1
	bne _08007B3E
	ldr r1, _08007B7C  @ gUnknown_03004980
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08007B3E:
	ldr r0, [r4, #0x5c]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	cmp r1, r0
	bne _08007B5E
	ldr r1, _08007B7C  @ gUnknown_03004980
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
_08007B5E:
	ldr r1, [r4, #0x5c]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge _08007B6A
	adds r0, #7
_08007B6A:
	asrs r1, r0, #3
	ldr r0, [r4, #0x58]
	cmp r0, r1
	bne _08007BA2
	ldr r1, _08007B7C  @ gUnknown_03004980
	movs r2, #0
	ldrsh r0, [r5, r2]
	b _08007B96
	.align 2, 0
_08007B7C: .4byte gUnknown_03004980
_08007B80:
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r1, r0
	bne _08007BA2
	ldr r1, _08007BC4  @ gUnknown_03004980
	movs r3, #0
	ldrsh r0, [r5, r3]
_08007B96:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08007BA2:
	ldr r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	cmp r1, r0
	blt _08007BC8
	ldr r1, _08007BC4  @ gUnknown_03004980
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
	b _08007C00
	.align 2, 0
_08007BC4: .4byte gUnknown_03004980
_08007BC8:
	adds r0, r4, #0
	adds r0, #0x66
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl sub_8008934
	adds r2, r0, #0
	lsls r2, r2, #3
	adds r0, r4, #0
	adds r0, #0x68
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x58]
	adds r3, r0, #0
	adds r0, #1
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	str r0, [sp]
	movs r0, #4
	bl sub_8012DCC
	ldr r2, _08007C08  @ gUnknown_03004980
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	strh r0, [r1, #0x34]
_08007C00:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007C08: .4byte gUnknown_03004980

	THUMB_FUNC_START sub_8007C0C
sub_8007C0C: @ 0x08007C0C
	push {lr}
	ldr r0, _08007C20  @ gUnknown_08591340
	bl Proc_DeleteAllWithScript
	ldr r0, _08007C24  @ gUnknown_08591470
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_08007C20: .4byte gUnknown_08591340
_08007C24: .4byte gUnknown_08591470

	THUMB_FUNC_START _Loop6CBlockingTimer
_Loop6CBlockingTimer: @ 0x08007C28
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _08007C42
	adds r0, r2, #0
	bl Proc_ClearNativeCallback
	b _08007C46
_08007C42:
	subs r0, r3, #1
	strh r0, [r1]
_08007C46:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8007C4C
sub_8007C4C: @ 0x08007C4C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8000D28
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x80
	bl sub_8006ADC
	cmp r0, #0
	bne _08007C8C
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _08007C88  @ gUnknown_08591430
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	bl RegisterObjectAttributes_SafeMaybe
	b _08007CAC
	.align 2, 0
_08007C88: .4byte gUnknown_08591430
_08007C8C:
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _08007CC8  @ gUnknown_08591430
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _08007CCC  @ 0x0000B2BF
	str r0, [sp]
	movs r0, #0
	bl RegisterObjectAttributes_SafeMaybe
_08007CAC:
	ldr r0, _08007CD0  @ gUnknown_0858791C
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _08007CC0
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
_08007CC0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007CC8: .4byte gUnknown_08591430
_08007CCC: .4byte 0x0000B2BF
_08007CD0: .4byte gUnknown_0858791C

	THUMB_FUNC_START sub_8007CD4
sub_8007CD4: @ 0x08007CD4
	bx lr

	THUMB_FUNC_START sub_8007CD8
sub_8007CD8: @ 0x08007CD8
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08007D00  @ gUnknown_085913F0
	adds r1, r3, #0
	bl Proc_CreateBlockingChild
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007D00: .4byte gUnknown_085913F0

	THUMB_FUNC_START sub_8007D04
sub_8007D04: @ 0x08007D04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08007D34  @ gUnknown_085913F0
	adds r1, r4, #0
	bl Proc_CreateBlockingChild
	adds r1, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007D34: .4byte gUnknown_085913F0

	THUMB_FUNC_START sub_8007D38
sub_8007D38: @ 0x08007D38
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08007D80  @ gUnknown_0859133C
	ldr r2, [r4]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08007D84  @ gUnknown_02022CA8
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl sub_8008F20
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _08007D88
	adds r1, r5, #0
	adds r1, #0x66
	movs r0, #0x10
	strh r0, [r1]
	b _08007D9E
	.align 2, 0
_08007D80: .4byte gUnknown_0859133C
_08007D84: .4byte gUnknown_02022CA8
_08007D88:
	ldrb r0, [r1, #9]
	adds r0, #1
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	blt _08007D96
	lsls r1, r1, #4
	b _08007D98
_08007D96:
	lsls r1, r0, #4
_08007D98:
	adds r0, r5, #0
	adds r0, #0x66
	strh r1, [r0]
_08007D9E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8007DA4
sub_8007DA4: @ 0x08007DA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	adds r0, r5, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _08007DE0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_80081EC
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
_08007DE0:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8007DE8
sub_8007DE8: @ 0x08007DE8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov r9, r3
	adds r0, r6, #0
	bl Text_GetXCursor
	adds r4, r0, #0
	movs r0, #0x10
	adds r0, r0, r4
	mov r8, r0
	ldrh r0, [r7]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	mov r1, r8
	ldr r2, [sp, #0x1c]
	bl Text_InsertString
	adds r4, #0x38
	ldrh r0, [r7, #8]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	bl Text_InsertString
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_Draw
	movs r0, #1
	bl sub_8008F20
	ldr r0, _08007E90  @ gUnknown_085914B0
	ldr r1, [sp, #0x20]
	bl Proc_CreateBlockingChild
	adds r2, r0, #0
	mov r1, r9
	strh r1, [r2, #0x2a]
	ldr r0, _08007E94  @ gUnknown_02022CA8
	subs r5, r5, r0
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r0, r5
	lsls r0, r0, #3
	ldr r3, _08007E98  @ gLCDControlBuffer
	ldrh r1, [r3, #0x1c]
	subs r0, r0, r1
	add r0, r8
	strh r0, [r2, #0x2c]
	cmp r5, #0
	bge _08007E64
	adds r5, #0x1f
_08007E64:
	asrs r0, r5, #5
	lsls r0, r0, #3
	ldrh r1, [r3, #0x1e]
	subs r0, r0, r1
	strh r0, [r2, #0x2e]
	str r7, [r2, #0x34]
	mov r1, r9
	lsls r0, r1, #3
	adds r0, r0, r7
	subs r0, #8
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _08007E82
	bl _call_via_r0
_08007E82:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007E90: .4byte gUnknown_085914B0
_08007E94: .4byte gUnknown_02022CA8
_08007E98: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_8007E9C
sub_8007E9C: @ 0x08007E9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08007EC8  @ gUnknown_0858791C
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08007ED4
	ldr r0, _08007ECC  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08007EC0
	movs r0, #0x6b
	bl m4aSongNumStart
_08007EC0:
	ldr r1, _08007ED0  @ gUnknown_030000E8
	movs r0, #0
	b _08007EF6
	.align 2, 0
_08007EC8: .4byte gUnknown_0858791C
_08007ECC: .4byte gUnknown_0202BCF0
_08007ED0: .4byte gUnknown_030000E8
_08007ED4:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08007F08
	ldr r0, _08007F00  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08007EF0
	movs r0, #0x6a
	bl m4aSongNumStart
_08007EF0:
	ldr r1, _08007F04  @ gUnknown_030000E8
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
_08007EF6:
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
	b _08007F8C
	.align 2, 0
_08007F00: .4byte gUnknown_0202BCF0
_08007F04: .4byte gUnknown_030000E8
_08007F08:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08007F38
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne _08007F38
	ldr r0, _08007F94  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08007F2A
	movs r0, #0x67
	bl m4aSongNumStart
_08007F2A:
	strh r5, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _08007F38
	bl _call_via_r0
_08007F38:
	ldr r0, _08007F98  @ gUnknown_0858791C
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08007F70
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bne _08007F70
	ldr r0, _08007F94  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08007F60
	movs r0, #0x67
	bl m4aSongNumStart
_08007F60:
	movs r0, #2
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _08007F70
	bl _call_via_r0
_08007F70:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl sub_804E79C
_08007F8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007F94: .4byte gUnknown_0202BCF0
_08007F98: .4byte gUnknown_0858791C

	THUMB_FUNC_START sub_8007F9C
sub_8007F9C: @ 0x08007F9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08007FD4  @ gUnknown_0859133C
	ldr r2, [r0]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08007FD8  @ gUnknown_02022CA8
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl sub_8008F20
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007FD4: .4byte gUnknown_0859133C
_08007FD8: .4byte gUnknown_02022CA8

	THUMB_FUNC_START sub_8007FDC
sub_8007FDC: @ 0x08007FDC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	ble _080080BC
	ldr r4, _080080C4  @ gUnknown_0859133C
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r5, #0
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	bge _0800805A
	adds r6, r4, #0
_08008026:
	ldr r4, [r6]
	ldrb r0, [r4, #0xb]
	adds r0, r5, r0
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080080C8  @ gUnknown_030000D0
	adds r0, r0, r1
	lsls r1, r5, #1
	ldrb r2, [r4, #0xd]
	adds r1, r1, r2
	lsls r1, r1, #5
	ldrb r4, [r4, #0xc]
	adds r1, r1, r4
	lsls r1, r1, #1
	ldr r2, _080080CC  @ gUnknown_02022CA8
	adds r1, r1, r2
	bl Text_Draw
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	blt _08008026
_0800805A:
	ldr r4, _080080C4  @ gUnknown_0859133C
	ldr r2, [r4]
	ldrb r0, [r2, #0xa]
	subs r0, #1
	lsls r0, r0, #1
	ldrb r1, [r2, #0xd]
	adds r0, r0, r1
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080080CC  @ gUnknown_02022CA8
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	ldrb r0, [r0, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	ldr r5, _080080C8  @ gUnknown_030000D0
	adds r0, r0, r5
	bl Text_Clear
	ldr r4, [r4]
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4, #8]
	bl Text_SetColorId
	movs r0, #1
	bl sub_8008F20
	adds r0, r7, #0
	bl Proc_ClearNativeCallback
_080080BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080080C4: .4byte gUnknown_0859133C
_080080C8: .4byte gUnknown_030000D0
_080080CC: .4byte gUnknown_02022CA8

	THUMB_FUNC_START sub_80080D0
sub_80080D0: @ 0x080080D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x80
	bl sub_8006ADC
	cmp r0, #0
	beq _080080EE
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #0x1c
	movs r2, #0
	adds r3, r4, #0
	bl sub_8008F64
	b _080080FC
_080080EE:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, _08008104  @ 0x44444444
	movs r1, #0x19
	adds r3, r4, #0
	bl sub_8008F64
_080080FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008104: .4byte 0x44444444

	THUMB_FUNC_START sub_8008108
sub_8008108: @ 0x08008108
	push {r4, lr}
	ldr r0, _08008130  @ gUnknown_0859133C
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	movs r0, #0x80
	bl sub_8006ADC
	cmp r0, #0
	beq _08008138
	ldr r4, _08008134  @ gUnknown_030000D8
	adds r0, r4, #0
	bl sub_800465C
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	b _08008148
	.align 2, 0
_08008130: .4byte gUnknown_0859133C
_08008134: .4byte gUnknown_030000D8
_08008138:
	ldr r4, _08008158  @ gUnknown_030000D8
	adds r0, r4, #0
	bl sub_80045FC
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColorId
_08008148:
	ldr r0, _08008158  @ gUnknown_030000D8
	movs r1, #4
	bl Text_SetXCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008158: .4byte gUnknown_030000D8

	THUMB_FUNC_START sub_800815C
sub_800815C: @ 0x0800815C
	push {r4, r5, lr}
	ldr r0, _08008190  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #9]
	movs r5, #0
_08008168:
	lsls r4, r5, #3
	ldr r0, _08008194  @ gUnknown_030000D0
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_800465C
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetXCursor
	adds r5, #1
	cmp r5, #1
	ble _08008168
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008190: .4byte gUnknown_0859133C
_08008194: .4byte gUnknown_030000D0

	THUMB_FUNC_START sub_8008198
sub_8008198: @ 0x08008198
	ldr r1, _080081A4  @ gUnknown_08591520
	subs r0, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080081A4: .4byte gUnknown_08591520

	THUMB_FUNC_START sub_80081A8
sub_80081A8: @ 0x080081A8
	push {lr}
	ldr r0, _080081E0  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, _080081E4  @ gUnknown_020234A8
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl sub_8008F20
	bl sub_80081EC
	ldr r2, _080081E8  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080081E0: .4byte gUnknown_0859133C
_080081E4: .4byte gUnknown_020234A8
_080081E8: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_80081EC
sub_80081EC: @ 0x080081EC
	push {r4, r5, r6, lr}
	ldr r0, _08008244  @ gUnknown_02022CA8
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl sub_8008F20
	ldr r2, _08008248  @ gUnknown_0859133C
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _0800823E
	adds r6, r2, #0
_0800821E:
	lsls r4, r5, #3
	ldr r0, _0800824C  @ gUnknown_030000D0
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl Text_SetColorId
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _0800821E
_0800823E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008244: .4byte gUnknown_02022CA8
_08008248: .4byte gUnknown_0859133C
_0800824C: .4byte gUnknown_030000D0

	THUMB_FUNC_START sub_8008250
sub_8008250: @ 0x08008250
	push {r4, r5, r6, lr}
	ldr r2, _0800829C  @ gUnknown_0859133C
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _08008294
	adds r6, r2, #0
_08008274:
	lsls r4, r5, #3
	ldr r0, _080082A0  @ gUnknown_030000D0
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl Text_SetColorId
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _08008274
_08008294:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800829C: .4byte gUnknown_0859133C
_080082A0: .4byte gUnknown_030000D0

	THUMB_FUNC_START sub_80082A4
sub_80082A4: @ 0x080082A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	mov sl, r1
	adds r4, r2, #0
	str r3, [sp, #4]
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldr r0, _080082F4  @ gUnknown_020234A8
	movs r1, #0
	bl BG_Fill
	movs r7, #1
	cmp r5, #0xf
	bgt _080082CE
	movs r7, #0
_080082CE:
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080082DA
	adds r7, #2
_080082DA:
	mov r1, sl
	ldr r2, [sp, #4]
	subs r0, r1, r2
	adds r0, #1
	mov r9, r0
	cmp r7, #1
	beq _08008316
	cmp r7, #1
	bgt _080082F8
	cmp r7, #0
	beq _08008302
	b _0800835A
	.align 2, 0
_080082F4: .4byte gUnknown_020234A8
_080082F8:
	cmp r7, #2
	beq _0800833A
	cmp r7, #3
	beq _0800834C
	b _0800835A
_08008302:
	adds r5, #3
	mov r8, r5
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	subs r6, r5, r0
	cmp r6, #0
	bgt _0800835A
	movs r6, #1
	b _0800835A
_08008316:
	subs r5, #5
	mov r8, r5
	adds r0, r4, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, r8
	cmp r0, #0x1d
	ble _0800832E
	movs r0, #0x1d
	subs r6, r0, r4
	b _0800835A
_0800832E:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	mov r1, r8
	subs r6, r1, r0
	b _0800835A
_0800833A:
	movs r6, #9
	movs r2, #0xe
	mov r9, r2
	movs r4, #0x14
	movs r0, #8
	mov r8, r0
	movs r1, #0x10
	mov sl, r1
	b _0800835A
_0800834C:
	movs r6, #1
	movs r2, #0xe
	mov r9, r2
	movs r4, #0x14
	mov r8, r4
	movs r0, #0x10
	mov sl, r0
_0800835A:
	ldr r5, _080083DC  @ gUnknown_0859133C
	ldr r1, [r5]
	adds r0, r6, #1
	strb r0, [r1, #0xc]
	ldr r1, [r5]
	mov r0, r9
	adds r0, #1
	strb r0, [r1, #0xd]
	ldr r1, [sp, #4]
	str r1, [sp]
	movs r0, #1
	adds r1, r6, #0
	mov r2, r9
	adds r3, r4, #0
	bl sub_8008668
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800839C
	movs r0, #1
	ands r0, r1
	bl sub_8006F8C
	ldr r1, [r5]
	adds r1, #0x83
	ldrb r0, [r1]
	movs r2, #2
	eors r0, r2
	strb r0, [r1]
_0800839C:
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080083B6
	movs r0, #1
	mov r1, r8
	mov r2, sl
	adds r3, r7, #0
	bl sub_80084E0
_080083B6:
	adds r0, r6, #0
	mov r1, r9
	adds r2, r4, #0
	ldr r3, [sp, #4]
	bl sub_8008464
	bl sub_80083E0
	movs r0, #2
	bl sub_8008F20
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080083DC: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_80083E0
sub_80083E0: @ 0x080083E0
	push {lr}
	ldr r0, _080083F4  @ gUnknown_08591530
	movs r1, #3
	bl Proc_Create
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080083F4: .4byte gUnknown_08591530

	THUMB_FUNC_START sub_80083F8
sub_80083F8: @ 0x080083F8
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _0800845C  @ gUnknown_080D78EC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x64
	ldrh r1, [r5]
	adds r2, r1, #1
	strh r2, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08008454
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #2
	add r0, sp
	ldr r4, [r0]
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08008460  @ 0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0
	bne _08008454
	adds r0, r6, #0
	bl Proc_ClearNativeCallback
_08008454:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800845C: .4byte gUnknown_080D78EC
_08008460: .4byte 0x06000200

	THUMB_FUNC_START sub_8008464
sub_8008464: @ 0x08008464
	push {r4, r5, r6, lr}
	ldr r4, _080084DC  @ gLCDControlBuffer
	mov ip, r4
	ldrb r4, [r4, #1]
	movs r5, #0x20
	orrs r4, r5
	movs r5, #0x41
	negs r5, r5
	ands r4, r5
	movs r5, #0x7f
	ands r4, r5
	mov r5, ip
	strb r4, [r5, #1]
	adds r4, r0, #1
	lsls r4, r4, #3
	adds r5, #0x2d
	strb r4, [r5]
	adds r4, r1, #1
	lsls r4, r4, #3
	adds r5, #4
	strb r4, [r5]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #3
	mov r2, ip
	adds r2, #0x2c
	strb r0, [r2]
	adds r1, r1, r3
	subs r1, #1
	lsls r1, r1, #3
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	adds r2, #8
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080084DC: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_80084E0
sub_80084E0: @ 0x080084E0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl BG_GetMapBuffer
	adds r3, r0, #0
	cmp r6, #5
	bls _080084F4
	b _08008656
_080084F4:
	lsls r0, r6, #2
	ldr r1, _08008500  @ _08008504
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008500: .4byte _08008504
_08008504: @ jump table
	.4byte _0800851C @ case 0
	.4byte _08008550 @ case 1
	.4byte _08008588 @ case 2
	.4byte _080085BC @ case 3
	.4byte _080085F4 @ case 4
	.4byte _0800862C @ case 5
_0800851C:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08008544  @ 0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _08008548  @ 0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _0800854C  @ 0x00003416
	adds r1, r3, #0
	strh r1, [r0]
	adds r2, #1
	b _08008652
	.align 2, 0
_08008544: .4byte 0x00003014
_08008548: .4byte 0x00003414
_0800854C: .4byte 0x00003416
_08008550:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08008578  @ 0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _0800857C  @ 0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08008580  @ 0x00003015
	adds r1, r3, #0
	strh r1, [r0]
	ldr r2, _08008584  @ 0x00003016
	b _08008652
	.align 2, 0
_08008578: .4byte 0x00003014
_0800857C: .4byte 0x00003414
_08008580: .4byte 0x00003015
_08008584: .4byte 0x00003016
_08008588:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _080085B0  @ 0x00003418
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080085B4  @ 0x00003419
	adds r1, r3, #0
	strh r1, [r0]
	subs r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _080085B8  @ 0x00003C17
	b _08008652
	.align 2, 0
_080085B0: .4byte 0x00003418
_080085B4: .4byte 0x00003419
_080085B8: .4byte 0x00003C17
_080085BC:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _080085E4  @ 0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080085E8  @ 0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _080085EC  @ 0x00003018
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _080085F0  @ 0x00003019
	b _08008652
	.align 2, 0
_080085E4: .4byte 0x00003017
_080085E8: .4byte 0x00003817
_080085EC: .4byte 0x00003018
_080085F0: .4byte 0x00003019
_080085F4:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _0800861C  @ 0x00003C19
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08008620  @ 0x00003C18
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08008624  @ 0x00003417
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08008628  @ 0x00003C17
	b _08008652
	.align 2, 0
_0800861C: .4byte 0x00003C19
_08008620: .4byte 0x00003C18
_08008624: .4byte 0x00003417
_08008628: .4byte 0x00003C17
_0800862C:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _0800865C  @ 0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08008660  @ 0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	adds r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08008664  @ 0x00003818
_08008652:
	adds r1, r2, #0
	strh r1, [r0, #2]
_08008656:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800865C: .4byte 0x00003017
_08008660: .4byte 0x00003817
_08008664: .4byte 0x00003818

	THUMB_FUNC_START sub_8008668
sub_8008668: @ 0x08008668
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r1
	str r2, [sp]
	adds r5, r3, #0
	ldr r4, [sp, #0x28]
	bl BG_GetMapBuffer
	adds r7, r0, #0
	subs r5, #1
	subs r4, #1
	mov r0, r8
	adds r3, r0, r5
	cmp r8, r3
	bge _080086C0
	ldr r1, _08008780  @ 0x00003011
	mov r9, r1
	ldr r2, [sp]
	adds r0, r2, r4
	mov r6, r8
	lsls r1, r6, #1
	lsls r0, r0, #6
	adds r0, r0, r7
	adds r2, r1, r0
	ldr r6, [sp]
	lsls r0, r6, #6
	adds r0, r0, r7
	adds r1, r1, r0
	ldr r6, _08008784  @ 0x00003811
	adds r0, r6, #0
	mov r6, r8
	subs r3, r3, r6
_080086B0:
	mov r6, r9
	strh r6, [r1]
	strh r0, [r2]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _080086B0
_080086C0:
	ldr r3, [sp]
	add r5, r8
	mov ip, r5
	lsls r0, r3, #5
	str r0, [sp, #4]
	adds r4, r4, r3
	mov r9, r4
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r3, r9
	bge _08008704
	ldr r2, _08008788  @ 0x00003012
	adds r6, r2, #0
	ldr r4, _0800878C  @ 0x00003412
	adds r5, r4, #0
	lsls r0, r3, #6
	mov r2, ip
	lsls r1, r2, #1
	adds r1, r1, r7
	adds r2, r0, r1
	mov r4, r8
	lsls r1, r4, #1
	adds r1, r1, r7
	adds r0, r0, r1
	mov r1, r9
	subs r3, r1, r3
_080086F6:
	strh r6, [r0]
	strh r5, [r2]
	adds r2, #0x40
	adds r0, #0x40
	subs r3, #1
	cmp r3, #0
	bne _080086F6
_08008704:
	mov r3, sl
	cmp r3, ip
	bge _08008736
	mov r5, r9
	mov sl, ip
_0800870E:
	ldr r2, [sp]
	adds r2, #1
	adds r4, r3, #1
	cmp r2, r5
	bge _08008730
	ldr r0, _08008790  @ 0x00003013
	adds r6, r0, #0
	lsls r1, r2, #6
	lsls r0, r3, #1
	adds r0, r0, r7
	adds r0, r1, r0
	subs r2, r5, r2
_08008726:
	strh r6, [r0]
	adds r0, #0x40
	subs r2, #1
	cmp r2, #0
	bne _08008726
_08008730:
	adds r3, r4, #0
	cmp r3, sl
	blt _0800870E
_08008736:
	ldr r0, [sp, #4]
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r2, _08008794  @ 0x00003010
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [sp, #4]
	add r0, ip
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _08008798  @ 0x00003410
	adds r1, r3, #0
	strh r1, [r0]
	mov r4, r9
	lsls r1, r4, #5
	mov r6, r8
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _0800879C  @ 0x00003810
	adds r2, r3, #0
	strh r2, [r0]
	add r1, ip
	lsls r1, r1, #1
	adds r1, r1, r7
	ldr r4, _080087A0  @ 0x00003C10
	adds r0, r4, #0
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008780: .4byte 0x00003011
_08008784: .4byte 0x00003811
_08008788: .4byte 0x00003012
_0800878C: .4byte 0x00003412
_08008790: .4byte 0x00003013
_08008794: .4byte 0x00003010
_08008798: .4byte 0x00003410
_0800879C: .4byte 0x00003810
_080087A0: .4byte 0x00003C10

	THUMB_FUNC_START sub_80087A4
sub_80087A4: @ 0x080087A4
	bx lr

	THUMB_FUNC_START sub_80087A8
sub_80087A8: @ 0x080087A8
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [r0, #0x58]
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_8006ADC
	cmp r0, #0
	bne _08008802
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	ldr r1, _08008808  @ gLCDControlBuffer
	adds r2, r1, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_08008802:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08008808: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_800880C
sub_800880C: @ 0x0800880C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r2, r4, #0
	adds r2, #0x68
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r3, r4, #0
	adds r3, #0x6a
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl sub_80082A4
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8008840
sub_8008840: @ 0x08008840
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, [r5, #0x58]
	adds r3, #1
	str r3, [r5, #0x58]
	movs r1, #0x1e
	negs r1, r1
	movs r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_8012DCC
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_8006ADC
	cmp r0, #0
	bne _08008892
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #1
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_08008892:
	ldr r0, [r5, #0x58]
	cmp r0, #0xc
	bne _0800889E
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
_0800889E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80088A8
sub_80088A8: @ 0x080088A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08008904  @ gUnknown_08591540
	bl Proc_CreateBlockingChild
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8008934
	adds r2, r4, #0
	adds r2, #0x64
	strh r0, [r2]
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #8
	strh r0, [r1]
	ldr r3, _08008908  @ gUnknown_0859133C
	ldr r0, [r3]
	ldrb r1, [r0, #0xe]
	adds r0, r4, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6a
	movs r0, #6
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _080088E8
	movs r0, #0
	strh r0, [r2]
_080088E8:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x1d
	ble _080088F4
	movs r0, #0x1e
	strh r0, [r2]
_080088F4:
	ldr r0, [r3]
	strb r5, [r0, #0xf]
	ldr r1, [r3]
	ldrb r0, [r1, #0xe]
	strb r0, [r1, #0x10]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008904: .4byte gUnknown_08591540
_08008908: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_800890C
sub_800890C: @ 0x0800890C
	push {lr}
	ldr r0, _08008928  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	ldrb r2, [r1, #0x11]
	cmp r0, r2
	bne _0800892C
	ldrb r0, [r1, #0x10]
	ldrb r1, [r1, #0xe]
	cmp r0, r1
	bne _0800892C
	movs r0, #1
	b _0800892E
	.align 2, 0
_08008928: .4byte gUnknown_0859133C
_0800892C:
	movs r0, #0
_0800892E:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8008934
sub_8008934: @ 0x08008934
	push {r4, lr}
	adds r4, r0, #0
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800894E
	cmp r4, #2
	bgt _0800894A
	movs r0, #4
	b _08008956
_0800894A:
	movs r0, #0x1a
	b _08008956
_0800894E:
	ldr r0, _0800895C  @ gUnknown_08591570
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
_08008956:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800895C: .4byte gUnknown_08591570

	THUMB_FUNC_START sub_8008960
sub_8008960: @ 0x08008960
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _080089B0  @ gUnknown_080D7908
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r5, #0xff
	beq _080089A6
	ldr r4, _080089B4  @ gUnknown_0859133C
	ldr r0, [r4]
	lsls r5, r5, #2
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_80057A4
	movs r1, #0x39
	negs r1, r1
	ands r1, r0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	orrs r1, r6
	ldrb r2, [r2, #0x17]
	lsls r2, r2, #2
	add r2, sp
	ldr r2, [r2]
	orrs r1, r2
	bl sub_8005770
_080089A6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080089B0: .4byte gUnknown_080D7908
_080089B4: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_80089B8
sub_80089B8: @ 0x080089B8
	push {lr}
	movs r1, #0x10
	bl sub_8008960
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80089C4
sub_80089C4: @ 0x080089C4
	push {lr}
	movs r1, #0
	bl sub_8008960
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80089D0
sub_80089D0: @ 0x080089D0
	push {lr}
	ldr r0, _080089E4  @ gUnknown_08591358
	bl Proc_Find
	cmp r0, #0
	beq _080089DE
	movs r0, #1
_080089DE:
	pop {r1}
	bx r1
	.align 2, 0
_080089E4: .4byte gUnknown_08591358

	THUMB_FUNC_START Face6CExists
Face6CExists: @ 0x080089E8
	push {lr}
	ldr r0, _080089FC  @ gUnknown_08591154
	bl Proc_Find
	cmp r0, #0
	beq _080089F6
	movs r0, #1
_080089F6:
	pop {r1}
	bx r1
	.align 2, 0
_080089FC: .4byte gUnknown_08591154

	THUMB_FUNC_START sub_8008A00
sub_8008A00: @ 0x08008A00
	ldr r0, _08008A08  @ gUnknown_030000E8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08008A08: .4byte gUnknown_030000E8

	THUMB_FUNC_START sub_8008A0C
sub_8008A0C: @ 0x08008A0C
	adds r2, r0, #0
	ldr r1, _08008A14  @ gUnknown_030000E8
	str r2, [r1]
	bx lr
	.align 2, 0
_08008A14: .4byte gUnknown_030000E8

	THUMB_FUNC_START sub_8008A18
sub_8008A18: @ 0x08008A18
	ldr r1, _08008A20  @ gUnknown_0859133C
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_08008A20: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8008A24
sub_8008A24: @ 0x08008A24
	push {lr}
	adds r1, r0, #0
	ldr r0, _08008A38  @ gUnknown_0859133C
	ldr r0, [r0]
	adds r0, #0x60
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_08008A38: .4byte gUnknown_0859133C

	THUMB_FUNC_START sub_8008A3C
sub_8008A3C: @ 0x08008A3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r4, r1, #0
	str r2, [sp]
	mov r9, r3
	movs r6, #0
	mov r7, sl
	adds r5, r2, #0
	b _08008A62
_08008A58:
	ldr r0, [r7]
	adds r1, r4, #0
	bl Text_AppendChar
	adds r4, r0, #0
_08008A62:
	movs r0, #0
	mov r8, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08008A88
	cmp r0, #1
	bne _08008A82
	ldm r7!, {r0}
	adds r1, r5, #0
	bl Text_Draw
	adds r5, #0x80
	adds r6, #1
	adds r4, #1
	cmp r6, r9
	bge _08008A98
_08008A82:
	mov r2, r8
	cmp r2, #0
	beq _08008A58
_08008A88:
	lsls r0, r6, #2
	add r0, sl
	ldr r0, [r0]
	lsls r1, r6, #7
	ldr r2, [sp]
	adds r1, r2, r1
	bl Text_Draw
_08008A98:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8008AA8
sub_8008AA8: @ 0x08008AA8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r0, _08008B14  @ gUnknown_085915AA
	mov ip, r0
	movs r3, #0x52
	adds r3, r3, r7
	mov r9, r3
	ldrh r0, [r3]
	ldr r6, _08008B18  @ 0x000003FF
	adds r4, r6, #0
	ands r4, r0
	adds r0, r7, #0
	adds r0, #0x64
	ldrh r0, [r0]
	mov r8, r0
	movs r5, #0xf
	adds r0, r5, #0
	mov r3, r8
	ands r0, r3
	lsls r0, r0, #0xc
	orrs r4, r0
	str r4, [sp]
	movs r0, #3
	mov r3, ip
	bl RegisterObjectAttributes_SafeMaybe
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, _08008B1C  @ gUnknown_08591590
	mov r4, r9
	ldrh r0, [r4]
	ands r6, r0
	ldr r0, _08008B20  @ gUnknown_030000F0
	ldrh r0, [r0, #0x14]
	ands r5, r0
	lsls r5, r5, #0xc
	orrs r6, r5
	str r6, [sp]
	movs r0, #3
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008B14: .4byte gUnknown_085915AA
_08008B18: .4byte 0x000003FF
_08008B1C: .4byte gUnknown_08591590
_08008B20: .4byte gUnknown_030000F0

	THUMB_FUNC_START sub_8008B24
sub_8008B24: @ 0x08008B24
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8008B30
sub_8008B30: @ 0x08008B30
	push {lr}
	ldr r0, _08008B40  @ sub_8008B24
	movs r1, #1
	bl SetupFutureCall2
	pop {r0}
	bx r0
	.align 2, 0
_08008B40: .4byte sub_8008B24

	THUMB_FUNC_START sub_8008B44
sub_8008B44: @ 0x08008B44
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r0, _08008B78  @ gUnknown_0859133C
	ldr r0, [r0]
	movs r1, #0xf
	ldrsb r1, [r0, r1]
	mov r9, r1
	ldrb r5, [r0, #0x11]
	movs r6, #0
	movs r7, #0x18
_08008B66:
	ldrb r0, [r4]
	cmp r0, #0x81
	bls _08008B6E
	b _08008EE0
_08008B6E:
	lsls r0, r0, #2
	ldr r1, _08008B7C  @ _08008B80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008B78: .4byte gUnknown_0859133C
_08008B7C: .4byte _08008B80
_08008B80: @ jump table
	.4byte _08008D88 @ case 0
	.4byte _08008D92 @ case 1
	.4byte _08008D92 @ case 2
	.4byte _08008D9E @ case 3
	.4byte _08008D9A @ case 4
	.4byte _08008D9A @ case 5
	.4byte _08008D9A @ case 6
	.4byte _08008D9A @ case 7
	.4byte _08008DA2 @ case 8
	.4byte _08008DA2 @ case 9
	.4byte _08008DA2 @ case 10
	.4byte _08008DA2 @ case 11
	.4byte _08008DA2 @ case 12
	.4byte _08008DA2 @ case 13
	.4byte _08008DA2 @ case 14
	.4byte _08008DA2 @ case 15
	.4byte _08008DAA @ case 16
	.4byte _08008DC8 @ case 17
	.4byte _08008DCE @ case 18
	.4byte _08008DCE @ case 19
	.4byte _08008DCE @ case 20
	.4byte _08008D88 @ case 21
	.4byte _08008D9A @ case 22
	.4byte _08008D9A @ case 23
	.4byte _08008DD6 @ case 24
	.4byte _08008DD6 @ case 25
	.4byte _08008DD6 @ case 26
	.4byte _08008DD6 @ case 27
	.4byte _08008D9A @ case 28
	.4byte _08008D9A @ case 29
	.4byte _08008EE0 @ case 30
	.4byte _08008EE0 @ case 31
	.4byte _08008EE0 @ case 32
	.4byte _08008EE0 @ case 33
	.4byte _08008EE0 @ case 34
	.4byte _08008EE0 @ case 35
	.4byte _08008EE0 @ case 36
	.4byte _08008EE0 @ case 37
	.4byte _08008EE0 @ case 38
	.4byte _08008EE0 @ case 39
	.4byte _08008EE0 @ case 40
	.4byte _08008EE0 @ case 41
	.4byte _08008EE0 @ case 42
	.4byte _08008EE0 @ case 43
	.4byte _08008EE0 @ case 44
	.4byte _08008EE0 @ case 45
	.4byte _08008EE0 @ case 46
	.4byte _08008EE0 @ case 47
	.4byte _08008EE0 @ case 48
	.4byte _08008EE0 @ case 49
	.4byte _08008EE0 @ case 50
	.4byte _08008EE0 @ case 51
	.4byte _08008EE0 @ case 52
	.4byte _08008EE0 @ case 53
	.4byte _08008EE0 @ case 54
	.4byte _08008EE0 @ case 55
	.4byte _08008EE0 @ case 56
	.4byte _08008EE0 @ case 57
	.4byte _08008EE0 @ case 58
	.4byte _08008EE0 @ case 59
	.4byte _08008EE0 @ case 60
	.4byte _08008EE0 @ case 61
	.4byte _08008EE0 @ case 62
	.4byte _08008EE0 @ case 63
	.4byte _08008EE0 @ case 64
	.4byte _08008EE0 @ case 65
	.4byte _08008EE0 @ case 66
	.4byte _08008EE0 @ case 67
	.4byte _08008EE0 @ case 68
	.4byte _08008EE0 @ case 69
	.4byte _08008EE0 @ case 70
	.4byte _08008EE0 @ case 71
	.4byte _08008EE0 @ case 72
	.4byte _08008EE0 @ case 73
	.4byte _08008EE0 @ case 74
	.4byte _08008EE0 @ case 75
	.4byte _08008EE0 @ case 76
	.4byte _08008EE0 @ case 77
	.4byte _08008EE0 @ case 78
	.4byte _08008EE0 @ case 79
	.4byte _08008EE0 @ case 80
	.4byte _08008EE0 @ case 81
	.4byte _08008EE0 @ case 82
	.4byte _08008EE0 @ case 83
	.4byte _08008EE0 @ case 84
	.4byte _08008EE0 @ case 85
	.4byte _08008EE0 @ case 86
	.4byte _08008EE0 @ case 87
	.4byte _08008EE0 @ case 88
	.4byte _08008EE0 @ case 89
	.4byte _08008EE0 @ case 90
	.4byte _08008EE0 @ case 91
	.4byte _08008EE0 @ case 92
	.4byte _08008EE0 @ case 93
	.4byte _08008EE0 @ case 94
	.4byte _08008EE0 @ case 95
	.4byte _08008EE0 @ case 96
	.4byte _08008EE0 @ case 97
	.4byte _08008EE0 @ case 98
	.4byte _08008EE0 @ case 99
	.4byte _08008EE0 @ case 100
	.4byte _08008EE0 @ case 101
	.4byte _08008EE0 @ case 102
	.4byte _08008EE0 @ case 103
	.4byte _08008EE0 @ case 104
	.4byte _08008EE0 @ case 105
	.4byte _08008EE0 @ case 106
	.4byte _08008EE0 @ case 107
	.4byte _08008EE0 @ case 108
	.4byte _08008EE0 @ case 109
	.4byte _08008EE0 @ case 110
	.4byte _08008EE0 @ case 111
	.4byte _08008EE0 @ case 112
	.4byte _08008EE0 @ case 113
	.4byte _08008EE0 @ case 114
	.4byte _08008EE0 @ case 115
	.4byte _08008EE0 @ case 116
	.4byte _08008EE0 @ case 117
	.4byte _08008EE0 @ case 118
	.4byte _08008EE0 @ case 119
	.4byte _08008EE0 @ case 120
	.4byte _08008EE0 @ case 121
	.4byte _08008EE0 @ case 122
	.4byte _08008EE0 @ case 123
	.4byte _08008EE0 @ case 124
	.4byte _08008EE0 @ case 125
	.4byte _08008EE0 @ case 126
	.4byte _08008EE0 @ case 127
	.4byte _08008DDA @ case 128
	.4byte _08008ED4 @ case 129
_08008D88:
	cmp r6, r7
	bgt _08008D8E
	b _08008F06
_08008D8E:
	adds r7, r6, #0
	b _08008F06
_08008D92:
	cmp r6, r7
	ble _08008D98
	adds r7, r6, #0
_08008D98:
	movs r6, #0
_08008D9A:
	adds r4, #1
	b _08008B66
_08008D9E:
	adds r6, #0xc
	b _08008D9A
_08008DA2:
	ldrb r0, [r4]
	adds r5, r0, #0
	subs r5, #8
	b _08008D9A
_08008DAA:
	ldrb r0, [r4]
	cmp r0, #8
	bge _08008DB2
	b _08008B66
_08008DB2:
	cmp r0, #0xf
	ble _08008DBC
	cmp r0, #0x10
	beq _08008DC4
	b _08008B66
_08008DBC:
	adds r5, r0, #0
	subs r5, #8
	adds r4, #1
	b _08008DAA
_08008DC4:
	adds r4, #3
	b _08008DAA
_08008DC8:
	cmp r5, r9
	beq _08008D88
	b _08008D9A
_08008DCE:
	mov r2, r8
	cmp r2, #0
	beq _08008D88
	b _08008D9A
_08008DD6:
	adds r6, #0x80
	b _08008D9A
_08008DDA:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0x25
	bls _08008DE4
	b _08008B66
_08008DE4:
	lsls r0, r0, #2
	ldr r1, _08008DF0  @ _08008DF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008DF0: .4byte _08008DF4
_08008DF4: @ jump table
	.4byte _08008D9A @ case 0
	.4byte _08008D9A @ case 1
	.4byte _08008D9A @ case 2
	.4byte _08008D9A @ case 3
	.4byte _08008D9A @ case 4
	.4byte _08008E8C @ case 5
	.4byte _08008EB2 @ case 6
	.4byte _08008D9A @ case 7
	.4byte _08008D9A @ case 8
	.4byte _08008D9A @ case 9
	.4byte _08008ECC @ case 10
	.4byte _08008ECC @ case 11
	.4byte _08008ECC @ case 12
	.4byte _08008ECC @ case 13
	.4byte _08008ECC @ case 14
	.4byte _08008ECC @ case 15
	.4byte _08008ECC @ case 16
	.4byte _08008ECC @ case 17
	.4byte _08008B66 @ case 18
	.4byte _08008B66 @ case 19
	.4byte _08008B66 @ case 20
	.4byte _08008B66 @ case 21
	.4byte _08008D9A @ case 22
	.4byte _08008D9A @ case 23
	.4byte _08008D9A @ case 24
	.4byte _08008D9A @ case 25
	.4byte _08008D9A @ case 26
	.4byte _08008D9A @ case 27
	.4byte _08008D9A @ case 28
	.4byte _08008D9A @ case 29
	.4byte _08008D9A @ case 30
	.4byte _08008D9A @ case 31
	.4byte _08008EA8 @ case 32
	.4byte _08008D9A @ case 33
	.4byte _08008B66 @ case 34
	.4byte _08008B66 @ case 35
	.4byte _08008D9A @ case 36
	.4byte _08008D9A @ case 37
_08008E8C:
	ldr r0, _08008EA4  @ gUnknown_0859133C
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	mov r1, sp
	bl sub_8014270
	mov r0, r8
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sp
	b _08008EBE
	.align 2, 0
_08008EA4: .4byte gUnknown_0859133C
_08008EA8:
	bl GetTacticianNameStringPtr
	bl GetStringTextWidth
	b _08008EC2
_08008EB2:
	ldr r0, _08008EC8  @ gUnknown_0859133C
	ldr r0, [r0]
	adds r0, #0x60
	mov r2, r8
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
_08008EBE:
	bl sub_8008B44
_08008EC2:
	adds r6, r6, r0
	b _08008D9A
	.align 2, 0
_08008EC8: .4byte gUnknown_0859133C
_08008ECC:
	ldrb r0, [r4]
	adds r5, r0, #0
	subs r5, #0xa
	b _08008D9A
_08008ED4:
	ldrb r0, [r4, #1]
	cmp r0, #0x40
	bne _08008EE0
	adds r4, #2
	adds r6, #6
	b _08008B66
_08008EE0:
	cmp r5, r9
	beq _08008EF6
	cmp r5, #0xff
	beq _08008EF6
	mov r0, r8
	cmp r0, #0
	beq _08008EF0
	b _08008D88
_08008EF0:
	movs r1, #1
	mov r8, r1
	mov r9, r5
_08008EF6:
	add r1, sp, #0x20
	adds r0, r4, #0
	bl GetCharTextWidth
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	adds r6, r6, r0
	b _08008B66
_08008F06:
	adds r0, r7, #0
	add sp, #0x24
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetZero
GetZero: @ 0x08008F18
	movs r0, #0
	bx lr

	THUMB_FUNC_START sub_8008F1C
sub_8008F1C: @ 0x08008F1C
	bx lr

	THUMB_FUNC_START sub_8008F20
sub_8008F20: @ 0x08008F20
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	bl sub_8006ADC
	cmp r0, #0
	bne _08008F34
	adds r0, r4, #0
	bl BG_EnableSyncByMask
_08008F34:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8008F3C
sub_8008F3C: @ 0x08008F3C
	push {lr}
	ldr r0, _08008F50  @ gUnknown_08591624
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _08008F4C
	movs r0, #1
_08008F4C:
	pop {r1}
	bx r1
	.align 2, 0
_08008F50: .4byte gUnknown_08591624

	THUMB_FUNC_START sub_8008F54
sub_8008F54: @ 0x08008F54
	push {lr}
	ldr r0, _08008F60  @ gUnknown_08591624
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_08008F60: .4byte gUnknown_08591624

	THUMB_FUNC_START sub_8008F64
sub_8008F64: @ 0x08008F64
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08008F9C  @ gUnknown_08591624
	movs r1, #0
	bl Proc_Create
	ldr r1, _08008FA0  @ 0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, _08008FA4  @ 0x06010000
	adds r1, r1, r2
	str r1, [r0, #0x4c]
	str r5, [r0, #0x54]
	str r6, [r0, #0x58]
	ldr r0, _08008FA8  @ gUnknown_0859160C
	mov r1, r8
	bl Proc_CreateBlockingChild
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008F9C: .4byte gUnknown_08591624
_08008FA0: .4byte 0x000003FF
_08008FA4: .4byte 0x06010000
_08008FA8: .4byte gUnknown_0859160C

	THUMB_FUNC_START sub_8008FAC
sub_8008FAC: @ 0x08008FAC
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_START sub_8008FB4
sub_8008FB4: @ 0x08008FB4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, [r3, #0x4c]
	movs r1, #0
	b _08009010
_08008FBE:
	movs r2, #0
	lsls r0, r1, #2
	adds r5, r1, #0
	adds r5, #8
	adds r4, r0, r6
_08008FC8:
	lsls r0, r2, #2
	adds r1, r0, r4
	ldr r0, [r1, #4]
	str r0, [r1]
	ldr r0, [r1, #8]
	str r0, [r1, #4]
	ldr r0, [r1, #0xc]
	str r0, [r1, #8]
	ldr r0, [r1, #0x10]
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldr r0, _08008FF8  @ 0x000002FF
	cmp r2, r0
	bgt _08008FFC
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r1, r7
	ldr r0, [r0]
	b _08008FFE
	.align 2, 0
_08008FF8: .4byte 0x000002FF
_08008FFC:
	ldr r0, [r3, #0x58]
_08008FFE:
	str r0, [r1, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	ble _08008FC8
	adds r1, r5, #0
_08009010:
	ldr r0, [r3, #0x54]
	lsls r0, r0, #3
	cmp r1, r0
	blt _08008FBE
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08009030
	adds r0, r3, #0
	bl Proc_ClearNativeCallback
_08009030:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START nullsub_15
nullsub_15: @ 0x08009038
	bx lr

	THUMB_FUNC_START sub_800903C
sub_800903C: @ 0x0800903C
	push {lr}
	movs r1, #0
	str r1, [r0, #0x3c]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_800904C
sub_800904C: @ 0x0800904C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	adds r2, r1, r0
	str r2, [r4, #0x3c]
	cmp r2, #0xff
	bgt _08009088
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r2
	lsls r3, r0, #8
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r0, r3, r0
	cmp r0, #0
	bge _08009070
	adds r0, #0xff
_08009070:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r1, r3, r0
	cmp r1, #0
	bge _0800907E
	adds r1, #0xff
_0800907E:
	asrs r1, r1, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r3, r0
	b _080090B8
_08009088:
	movs r0, #0x80
	lsls r0, r0, #2
	subs r3, r0, r2
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r5, _080090E8  @ 0xFFFFFF00
	adds r0, r2, r5
	lsls r2, r0, #8
	adds r0, r1, r2
	cmp r0, #0
	bge _080090A2
	adds r0, #0xff
_080090A2:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r3, r0
	adds r0, r0, r2
	cmp r0, #0
	bge _080090B0
	adds r0, #0xff
_080090B0:
	asrs r1, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r3, r0
	adds r0, r0, r2
_080090B8:
	cmp r0, #0
	bge _080090BE
	adds r0, #0xff
_080090BE:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _080090EC
	ldr r0, [r4, #0x2c]
	subs r0, #1
	str r0, [r4, #0x2c]
	cmp r0, #0
	bgt _080090F8
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
	b _080090F8
	.align 2, 0
_080090E8: .4byte 0xFFFFFF00
_080090EC:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bne _080090F8
	movs r0, #0
	str r0, [r4, #0x3c]
_080090F8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8009100
sub_8009100: @ 0x08009100
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x38]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r2, r7, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	lsls r1, r1, #8
	adds r0, r0, r1
	cmp r0, #0
	bge _08009120
	adds r0, #0xff
_08009120:
	asrs r6, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _0800912E
	adds r0, #0xff
_0800912E:
	asrs r5, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _0800913C
	adds r0, #0xff
_0800913C:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _08009154
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
_08009154:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_800915C
sub_800915C: @ 0x0800915C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, _08009194  @ gUnknown_0859163C
	bl Proc_CreateBlockingChild
	str r4, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x48]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009194: .4byte gUnknown_0859163C

	THUMB_FUNC_START sub_8009198
sub_8009198: @ 0x08009198
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x18
	mov r8, r0
	ldr r1, _080091F8  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	mov r5, r8
	ldr r3, [r5, #0x2c]
	subs r3, r3, r0
	adds r3, #8
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	ldr r4, [r5, #0x30]
	subs r4, r4, r0
	adds r4, #8
	ldr r6, [r5, #0x38]
	ldr r0, [r6, #4]
	ldr r1, [r6]
	ldr r2, [r6, #8]
	ldr r5, _080091FC  @ 0x000001FF
	ands r3, r5
	movs r5, #0xff
	ands r4, r5
	ldrh r5, [r6, #0xc]
	adds r4, r4, r5
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldrb r4, [r6, #0x10]
	str r4, [sp, #8]
	ldrb r4, [r6, #0x11]
	str r4, [sp, #0xc]
	ldrh r4, [r6, #0xe]
	str r4, [sp, #0x10]
	movs r4, #4
	str r4, [sp, #0x14]
	bl sub_80AE9B0
	mov r1, r8
	str r0, [r1, #0x34]
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080091F8: .4byte gUnknown_0202BCB0
_080091FC: .4byte 0x000001FF

	THUMB_FUNC_START sub_8009200
sub_8009200: @ 0x08009200
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x34]
	ldr r5, [r6]
	cmp r5, #0
	beq _08009240
	ldr r2, _08009238  @ gUnknown_0202BCB0
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	ldr r1, [r4, #0x2c]
	subs r1, r1, r0
	adds r1, #8
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	ldr r2, [r4, #0x30]
	subs r2, r2, r0
	adds r2, #8
	ldr r0, _0800923C  @ 0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	movs r3, #1
	negs r3, r3
	adds r0, r6, #0
	bl TCSWrapper_SetParameters
	b _08009248
	.align 2, 0
_08009238: .4byte gUnknown_0202BCB0
_0800923C: .4byte 0x000001FF
_08009240:
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
	str r5, [r4, #0x34]
_08009248:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8009250
sub_8009250: @ 0x08009250
	push {lr}
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _0800925C
	bl TCSWrapper_Delete
_0800925C:
	pop {r0}
	bx r0