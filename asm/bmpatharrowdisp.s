	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Logic for displaying the movement path/arrow thing

	THUMB_FUNC_START sub_803318C
sub_803318C: @ 0x0803318C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _08033238  @ gUnknown_0859DBA0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08033228
	ldrb r0, [r1]
	lsls r5, r0, #0x18
	cmp r5, #0
	blt _08033228
	ldr r0, _0803323C  @ gUnknown_0859DB6C
	mov r9, r0
_080331B2:
	ldr r0, _08033238  @ gUnknown_0859DBA0
	ldr r1, [r0]
	asrs r6, r5, #0x18
	adds r0, r1, #0
	adds r0, #0x2d
	adds r0, r0, r6
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, #0x41
	adds r1, r1, r6
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r7, r2, #4
	lsls r0, r0, #4
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	movs r3, #0x10
	bl PointInCameraBounds
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033220
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl GetDirectionOfPathBeforeIndex
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetDirectionOfPathAfterIndex
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x17
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r4, r4, r1
	add r4, r9
	ldrh r3, [r4]
	ldr r0, _08033240  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r1, r7, r1
	movs r4, #0xe
	ldrsh r2, [r0, r4]
	mov r0, r8
	subs r2, r0, r2
	str r3, [sp]
	movs r0, #0xb
	ldr r3, _08033244  @ gObject_16x16
	bl PutSprite
_08033220:
	subs r0, r6, #1
	lsls r5, r0, #0x18
	cmp r5, #0
	bge _080331B2
_08033228:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033238: .4byte gUnknown_0859DBA0
_0803323C: .4byte gUnknown_0859DB6C
_08033240: .4byte gUnknown_0202BCB0
_08033244: .4byte gObject_16x16

	THUMB_FUNC_END sub_803318C

	THUMB_FUNC_START sub_8033248
sub_8033248: @ 0x08033248
	push {lr}
	bl sub_8032EB4
	bl sub_803318C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8033248

.align 2, 0
