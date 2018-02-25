	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START SomethingSoundRelated_8002274
SomethingSoundRelated_8002274: @ 0x08002274
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080022CC  @ gUnknown_03006690
	ldr r5, _080022D0  @ 0x0000FFFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _080022D4  @ gUnknown_03006760
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _080022D8  @ gUnknown_030066D0
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _080022DC  @ gUnknown_030063C0
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _080022E0  @ gUnknown_03006400
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _080022E4  @ gUnknown_03006610
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _080022E8  @ gUnknown_03006720
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080022CC: .4byte gUnknown_03006690
_080022D0: .4byte 0x0000FFFF
_080022D4: .4byte gUnknown_03006760
_080022D8: .4byte gUnknown_030066D0
_080022DC: .4byte gUnknown_030063C0
_080022E0: .4byte gUnknown_03006400
_080022E4: .4byte gUnknown_03006610
_080022E8: .4byte gUnknown_03006720

	THUMB_FUNC_START SomethingSoundRelated_80022EC
SomethingSoundRelated_80022EC: @ 0x080022EC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08002310  @ gUnknown_03006440
	ldr r5, _08002314  @ 0x0000FFFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _08002318  @ gUnknown_03006650
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002310: .4byte gUnknown_03006440
_08002314: .4byte 0x0000FFFF
_08002318: .4byte gUnknown_03006650

	THUMB_FUNC_START SoundStuff_800231C
SoundStuff_800231C: @ 0x0800231C
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _08002326
	movs r4, #6
_08002326:
	ldr r5, _08002368  @ gUnknown_03000040
	ldr r0, [r5]
	cmp r0, #0
	beq _08002336
	bl Proc_ClearNativeCallback
	movs r0, #0
	str r0, [r5]
_08002336:
	ldr r5, _0800236C  @ gUnknown_03000044
	ldr r0, [r5]
	cmp r0, #0
	beq _08002346
	bl Proc_ClearNativeCallback
	movs r0, #0
	str r0, [r5]
_08002346:
	ldr r0, _08002370  @ gUnknown_03006440
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002374  @ gUnknown_03006650
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r1, _08002378  @ gUnknown_02024E5C
	movs r0, #0
	strb r0, [r1, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002368: .4byte gUnknown_03000040
_0800236C: .4byte gUnknown_03000044
_08002370: .4byte gUnknown_03006440
_08002374: .4byte gUnknown_03006650
_08002378: .4byte gUnknown_02024E5C

	THUMB_FUNC_START sub_800237C
sub_800237C: @ 0x0800237C
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _08002386
	movs r4, #6
_08002386:
	ldr r5, _080023CC  @ gUnknown_03000040
	ldr r0, [r5]
	cmp r0, #0
	beq _08002396
	bl Proc_ClearNativeCallback
	movs r0, #0
	str r0, [r5]
_08002396:
	ldr r5, _080023D0  @ gUnknown_03000044
	ldr r0, [r5]
	cmp r0, #0
	beq _080023A6
	bl Proc_ClearNativeCallback
	movs r0, #0
	str r0, [r5]
_080023A6:
	ldr r0, _080023D4  @ gUnknown_03006440
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _080023D8  @ gUnknown_03006650
	adds r1, r4, #0
	bl m4aMPlayFadeOutTemporarily
	ldr r1, _080023DC  @ gUnknown_02024E5C
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #1
	strb r0, [r1, #7]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080023CC: .4byte gUnknown_03000040
_080023D0: .4byte gUnknown_03000044
_080023D4: .4byte gUnknown_03006440
_080023D8: .4byte gUnknown_03006650
_080023DC: .4byte gUnknown_02024E5C

	THUMB_FUNC_START SoundStuff_80023E0
SoundStuff_80023E0: @ 0x080023E0
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080023EA
	movs r4, #6
_080023EA:
	ldr r0, _0800242C  @ gUnknown_03006690
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002430  @ gUnknown_03006760
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002434  @ gUnknown_030066D0
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002438  @ gUnknown_030063C0
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _0800243C  @ gUnknown_03006400
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002440  @ gUnknown_03006610
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002444  @ gUnknown_03006720
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800242C: .4byte gUnknown_03006690
_08002430: .4byte gUnknown_03006760
_08002434: .4byte gUnknown_030066D0
_08002438: .4byte gUnknown_030063C0
_0800243C: .4byte gUnknown_03006400
_08002440: .4byte gUnknown_03006610
_08002444: .4byte gUnknown_03006720

	THUMB_FUNC_START sub_8002448
sub_8002448: @ 0x08002448
	push {r4, lr}
	ldr r3, _0800246C  @ gUnknown_02024E5C
	movs r4, #0
	movs r2, #1
	strb r2, [r3, #6]
	strb r4, [r3, #7]
	strh r0, [r3, #4]
	bl sub_8002890
	ldr r0, _08002470  @ gUnknown_03006440
	bl m4aMPlayImmInit
	ldr r0, _08002474  @ gUnknown_03006650
	bl m4aMPlayImmInit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800246C: .4byte gUnknown_02024E5C
_08002470: .4byte gUnknown_03006440
_08002474: .4byte gUnknown_03006650

	THUMB_FUNC_START sub_8002478
sub_8002478: @ 0x08002478
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r7, _080024BC  @ gUnknown_02024E5C
	movs r0, #6
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08002492
	bl sub_8002258
	cmp r0, r4
	beq _080024CC
_08002492:
	ldr r0, _080024C0  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080024CC
	bl DeleteAll6CWaitMusicRelated
	movs r0, #6
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _080024C4
	adds r0, r5, #0
	bl SoundStuff_800231C
	lsls r1, r5, #4
	adds r0, r4, #0
	adds r2, r6, #0
	bl Exec6CSomeWaitIfMusicOn
	b _080024CC
	.align 2, 0
_080024BC: .4byte gUnknown_02024E5C
_080024C0: .4byte gUnknown_0202BCF0
_080024C4:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8002448
_080024CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80024D4
sub_80024D4: @ 0x080024D4
	push {lr}
	adds r2, r1, #0
	movs r1, #3
	bl sub_8002478
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80024E4
sub_80024E4: @ 0x080024E4
	push {lr}
	bl sub_8002478
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80024F0
sub_80024F0: @ 0x080024F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r6, r7, #0
	adds r6, #0x4c
	movs r0, #0
	ldrsh r3, [r6, r0]
	movs r1, #0x4e
	adds r1, r1, r7
	mov r8, r1
	movs r4, #0
	ldrsh r0, [r1, r4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012DCC
	adds r4, r0, #0
	ldr r0, _08002564  @ gUnknown_03006440
	ldr r5, _08002568  @ 0x0000FFFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800256C  @ gUnknown_03006650
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08002556
	adds r0, r7, #0
	bl Proc_ClearNativeCallback
	ldr r1, _08002570  @ gUnknown_03000040
	movs r0, #0
	str r0, [r1]
_08002556:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002564: .4byte gUnknown_03006440
_08002568: .4byte 0x0000FFFF
_0800256C: .4byte gUnknown_03006650
_08002570: .4byte gUnknown_03000040

	THUMB_FUNC_START sub_8002574
sub_8002574: @ 0x08002574
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sl, r1
	mov r9, r2
	ldr r0, _08002604  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r7, r0, #0x1f
	cmp r7, #0
	bne _080025F6
	ldr r0, _08002608  @ gUnknown_02024E5C
	movs r1, #1
	strb r1, [r0, #6]
	strb r7, [r0, #7]
	strh r6, [r0, #4]
	ldr r0, _0800260C  @ gUnknown_08587958
	movs r1, #3
	bl Proc_Create
	mov r8, r0
	ldr r4, _08002610  @ gUnknown_03006440
	adds r0, r4, #0
	bl m4aMPlayStop
	ldr r5, _08002614  @ gUnknown_03006650
	adds r0, r5, #0
	bl m4aMPlayStop
	adds r0, r6, #0
	mov r1, r9
	bl sub_8002890
	adds r0, r4, #0
	bl m4aMPlayImmInit
	adds r0, r5, #0
	bl m4aMPlayImmInit
	ldr r6, _08002618  @ 0x0000FFFF
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	mov r0, r8
	adds r0, #0x4c
	strh r7, [r0]
	mov r1, sl
	lsls r0, r1, #4
	mov r2, r8
	adds r2, #0x4e
	strh r0, [r2]
	ldr r0, _0800261C  @ gUnknown_03000040
	mov r1, r8
	str r1, [r0]
_080025F6:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002604: .4byte gUnknown_0202BCF0
_08002608: .4byte gUnknown_02024E5C
_0800260C: .4byte gUnknown_08587958
_08002610: .4byte gUnknown_03006440
_08002614: .4byte gUnknown_03006650
_08002618: .4byte 0x0000FFFF
_0800261C: .4byte gUnknown_03000040

	THUMB_FUNC_START sub_8002620
sub_8002620: @ 0x08002620
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08002660  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0800265A
	ldr r4, _08002664  @ gUnknown_02024E5C
	ldrh r0, [r4, #4]
	movs r6, #0
	strh r0, [r4, #2]
	movs r0, #7
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08002648
	ldr r0, _08002668  @ gUnknown_03006650
	movs r1, #3
	bl m4aMPlayFadeOutTemporarily
_08002648:
	strb r6, [r4, #6]
	strb r6, [r4, #7]
	cmp r5, #0
	beq _0800265A
	ldr r2, _0800266C  @ gUnknown_03006440
	adds r0, r5, #0
	movs r1, #0x20
	bl Exec6CSomeWaitIfMusicOn
_0800265A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002660: .4byte gUnknown_0202BCF0
_08002664: .4byte gUnknown_02024E5C
_08002668: .4byte gUnknown_03006650
_0800266C: .4byte gUnknown_03006440

	THUMB_FUNC_START sub_8002670
sub_8002670: @ 0x08002670
	push {r4, r5, lr}
	ldr r0, _080026AC  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r5, r0, #0x1f
	cmp r5, #0
	bne _080026A4
	ldr r4, _080026B0  @ gUnknown_02024E5C
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _080026A4
	ldr r0, _080026B4  @ gUnknown_03006440
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r0, _080026B8  @ gUnknown_03006650
	movs r1, #6
	bl m4aMPlayFadeIn
	movs r0, #1
	strb r0, [r4, #6]
	strb r5, [r4, #7]
	ldrh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r5, [r4, #2]
_080026A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080026AC: .4byte gUnknown_0202BCF0
_080026B0: .4byte gUnknown_02024E5C
_080026B4: .4byte gUnknown_03006440
_080026B8: .4byte gUnknown_03006650

	THUMB_FUNC_START sub_80026BC
sub_80026BC: @ 0x080026BC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080026FC  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r5, r0, #0x1f
	cmp r5, #0
	bne _080026F4
	ldr r4, _08002700  @ gUnknown_02024E5C
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _080026F4
	ldr r0, _08002704  @ gUnknown_03006440
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r0, _08002708  @ gUnknown_03006650
	adds r1, r6, #0
	bl m4aMPlayFadeIn
	movs r0, #1
	strb r0, [r4, #6]
	strb r5, [r4, #7]
	ldrh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r5, [r4, #2]
_080026F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080026FC: .4byte gUnknown_0202BCF0
_08002700: .4byte gUnknown_02024E5C
_08002704: .4byte gUnknown_03006440
_08002708: .4byte gUnknown_03006650

	THUMB_FUNC_START sub_800270C
sub_800270C: @ 0x0800270C
	push {lr}
	ldr r0, _08002728  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r2, r0, #0x1f
	cmp r2, #0
	bne _08002724
	ldr r0, _0800272C  @ gUnknown_02024E5C
	ldrh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r2, [r0, #2]
_08002724:
	pop {r0}
	bx r0
	.align 2, 0
_08002728: .4byte gUnknown_0202BCF0
_0800272C: .4byte gUnknown_02024E5C

	THUMB_FUNC_START ISuspectThisToBeMusicRelated_8002730
ISuspectThisToBeMusicRelated_8002730: @ 0x08002730
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	beq _0800274C
	ldr r0, _08002748  @ gUnknown_08587970
	bl Proc_CreateBlockingChild
	b _08002754
	.align 2, 0
_08002748: .4byte gUnknown_08587970
_0800274C:
	ldr r0, _08002780  @ gUnknown_08587970
	movs r1, #3
	bl Proc_Create
_08002754:
	adds r4, r0, #0
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r7, [r0]
	cmp r5, #0
	bne _08002770
	movs r5, #1
_08002770:
	adds r0, r5, #0
	bl SomethingSoundRelated_80022EC
	ldr r0, _08002784  @ gUnknown_03000044
	str r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002780: .4byte gUnknown_08587970
_08002784: .4byte gUnknown_03000044

	THUMB_FUNC_START sub_8002788
sub_8002788: @ 0x08002788
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0x66
	adds r3, r3, r5
	mov r8, r3
	movs r7, #0
	ldrsh r2, [r3, r7]
	adds r4, r5, #0
	adds r4, #0x68
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r6, r5, #0
	adds r6, #0x6a
	movs r7, #0
	ldrsh r0, [r6, r7]
	str r0, [sp]
	movs r0, #4
	bl sub_8012DCC
	bl SomethingSoundRelated_80022EC
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r1, r0
	blt _08002806
	mov r3, r8
	movs r7, #0
	ldrsh r4, [r3, r7]
	cmp r4, #0
	bne _080027F4
	bl sub_8002258
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	ldr r0, _080027F0  @ gUnknown_02024E5C
	strb r4, [r0, #6]
	strh r4, [r0, #2]
	strh r4, [r0, #4]
	b _080027FA
	.align 2, 0
_080027F0: .4byte gUnknown_02024E5C
_080027F4:
	ldr r1, _08002814  @ gUnknown_02024E5C
	movs r0, #1
	strb r0, [r1, #6]
_080027FA:
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
	ldr r1, _08002818  @ gUnknown_03000044
	movs r0, #0
	str r0, [r1]
_08002806:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002814: .4byte gUnknown_02024E5C
_08002818: .4byte gUnknown_03000044

	THUMB_FUNC_START Some6CMusicRelatedWaitCallback
Some6CMusicRelatedWaitCallback: @ 0x0800281C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800284E
	ldr r1, _08002854  @ gUnknown_02024E5C
	movs r0, #1
	strb r0, [r1, #6]
	adds r2, r4, #0
	adds r2, #0x4a
	ldrh r0, [r2]
	strh r0, [r1, #4]
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r1, [r4, #0x54]
	bl sub_8002890
	adds r0, r4, #0
	bl Proc_Delete
_0800284E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002854: .4byte gUnknown_02024E5C

	THUMB_FUNC_START Exec6CSomeWaitIfMusicOn
Exec6CSomeWaitIfMusicOn: @ 0x08002858
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08002888  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08002880
	ldr r0, _0800288C  @ gUnknown_08587988
	movs r1, #3
	bl Proc_Create
	adds r1, r0, #0
	adds r0, #0x4c
	strh r4, [r0]
	subs r0, #2
	strh r6, [r0]
	str r5, [r1, #0x54]
_08002880:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002888: .4byte gUnknown_0202BCF0
_0800288C: .4byte gUnknown_08587988

	THUMB_FUNC_START sub_8002890
sub_8002890: @ 0x08002890
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0x7f
	bgt _080028A6
	bl sub_80028FC
	movs r0, #0
	adds r1, r4, #0
	bl sub_80A3F08
_080028A6:
	cmp r5, #0
	beq _080028C0
	ldr r0, _080028BC  @ gSongTable
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl MPlayStart
	b _080028C8
	.align 2, 0
_080028BC: .4byte gSongTable
_080028C0:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_080028C8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80028D0
sub_80028D0: @ 0x080028D0
	push {lr}
	movs r0, #7
	bl sub_80028E8
	ldr r1, _080028E4  @ gUnknown_02024E5C
	movs r0, #0xff
	strb r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080028E4: .4byte gUnknown_02024E5C

	THUMB_FUNC_START sub_80028E8
sub_80028E8: @ 0x080028E8
	push {lr}
	ldr r1, _080028F8  @ gUnknown_02024E5C
	strb r0, [r1, #8]
	lsls r0, r0, #8
	bl m4aSoundMode
	pop {r0}
	bx r0
	.align 2, 0
_080028F8: .4byte gUnknown_02024E5C

	THUMB_FUNC_START sub_80028FC
sub_80028FC: @ 0x080028FC
	push {lr}
	cmp r0, #0x43
	bgt _08002914
	cmp r0, #0x42
	bge _0800291C
	cmp r0, #1
	blt _08002934
	cmp r0, #2
	ble _0800291C
	cmp r0, #0x40
	beq _0800291C
	b _08002934
_08002914:
	cmp r0, #0x56
	beq _0800291C
	cmp r0, #0x74
	bne _08002934
_0800291C:
	ldr r0, _08002930  @ gUnknown_02024E5C
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #8
	beq _08002946
	movs r0, #8
	bl sub_80028E8
	b _08002946
	.align 2, 0
_08002930: .4byte gUnknown_02024E5C
_08002934:
	ldr r0, _0800294C  @ gUnknown_02024E5C
	movs r1, #8
	ldrsb r1, [r0, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _08002946
	bl sub_80028D0
_08002946:
	pop {r0}
	bx r0
	.align 2, 0
_0800294C: .4byte gUnknown_02024E5C

	THUMB_FUNC_START sub_8002950
sub_8002950: @ 0x08002950
	push {lr}
	ldr r0, _08002960  @ gUnknown_08587970
	bl Proc_Find
	cmp r0, #0
	bne _08002964
	movs r0, #0
	b _08002966
	.align 2, 0
_08002960: .4byte gUnknown_08587970
_08002964:
	movs r0, #1
_08002966:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_800296C
sub_800296C: @ 0x0800296C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8002264
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080029B4
	adds r2, r4, #0
	adds r2, #0x64
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _080029B4
	ldr r1, [r4, #0x5c]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080029A6
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r2, [r4, #0x58]
	adds r3, r4, #0
	bl ISuspectThisToBeMusicRelated_8002730
	b _080029B4
_080029A6:
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r2, [r4, #0x58]
	movs r1, #0
	adds r3, r4, #0
	bl ISuspectThisToBeMusicRelated_8002730
_080029B4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80029BC
sub_80029BC: @ 0x080029BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	ble _080029DA
	movs r1, #0
	bl sub_80024D4
	adds r0, r4, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl SomethingSoundRelated_80022EC
	b _080029E2
_080029DA:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_GotoLabel
_080029E2:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80029E8
sub_80029E8: @ 0x080029E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r6, r3, #0
	ldr r4, [sp, #0x18]
	bl sub_8002264
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08002A0E
	ldr r0, _08002A1C  @ gUnknown_02024E5C
	ldrh r0, [r0, #4]
	cmp r5, r0
	bne _08002A0E
	cmp r7, r8
	beq _08002A62
_08002A0E:
	cmp r4, #0
	beq _08002A24
	ldr r0, _08002A20  @ gUnknown_08587998
	adds r1, r4, #0
	bl Proc_CreateBlockingChild
	b _08002A2C
	.align 2, 0
_08002A1C: .4byte gUnknown_02024E5C
_08002A20: .4byte gUnknown_08587998
_08002A24:
	ldr r0, _08002A4C  @ gUnknown_08587998
	movs r1, #3
	bl Proc_Create
_08002A2C:
	adds r4, r0, #0
	str r6, [r4, #0x58]
	bl sub_8002264
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08002A54
	ldr r0, _08002A50  @ gUnknown_02024E5C
	ldrh r0, [r0, #4]
	cmp r5, r0
	bne _08002A54
	movs r0, #1
	negs r0, r0
	str r0, [r4, #0x5c]
	b _08002A56
	.align 2, 0
_08002A4C: .4byte gUnknown_08587998
_08002A50: .4byte gUnknown_02024E5C
_08002A54:
	str r5, [r4, #0x5c]
_08002A56:
	adds r0, r4, #0
	adds r0, #0x64
	strh r7, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
_08002A62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8002A6C
sub_8002A6C: @ 0x08002A6C
	push {lr}
	ldr r0, _08002A7C  @ gUnknown_08587998
	bl Proc_Find
	cmp r0, #0
	bne _08002A80
	movs r0, #0
	b _08002A82
	.align 2, 0
_08002A7C: .4byte gUnknown_08587998
_08002A80:
	movs r0, #1
_08002A82:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8002A88
sub_8002A88: @ 0x08002A88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08002AB4  @ gUnknown_02024E5C
	ldrh r0, [r0, #4]
	cmp r4, r0
	beq _08002AAC
	bl sub_8002264
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08002AA4
	movs r0, #0
	bl SomethingSoundRelated_80022EC
_08002AA4:
	adds r0, r4, #0
	movs r1, #0
	bl sub_8002448
_08002AAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002AB4: .4byte gUnknown_02024E5C

	THUMB_FUNC_START DeleteAll6CWaitMusicRelated
DeleteAll6CWaitMusicRelated: @ 0x08002AB8
	push {lr}
	ldr r0, _08002AC4  @ gUnknown_08587988
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_08002AC4: .4byte gUnknown_08587988

	THUMB_FUNC_START sub_8002AC8
sub_8002AC8: @ 0x08002AC8
	push {lr}
	bl DeleteAll6CWaitMusicRelated
	ldr r0, _08002AEC  @ gUnknown_03006440
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r0, _08002AF0  @ gUnknown_03006650
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r1, _08002AF4  @ gUnknown_02024E5C
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08002AEC: .4byte gUnknown_03006440
_08002AF0: .4byte gUnknown_03006650
_08002AF4: .4byte gUnknown_02024E5C
