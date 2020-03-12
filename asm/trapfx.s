	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Various Graphical Effects related to activating traps

	THUMB_FUNC_START sub_801F540
sub_801F540: @ 0x0801F540
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	movs r6, #0
	movs r7, #0
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r1, #1
	beq _0801F598
	cmp r1, #1
	bgt _0801F562
	cmp r1, #0
	beq _0801F588
	b _0801F59C
_0801F562:
	cmp r1, #2
	beq _0801F578
	cmp r1, #3
	bne _0801F59C
	ldr r0, _0801F570  @ gUnknown_085A1510
	ldr r6, _0801F574  @ gUnknown_085A0FF8
	b _0801F59C
	.align 2, 0
_0801F570: .4byte gUnknown_085A1510
_0801F574: .4byte gUnknown_085A0FF8
_0801F578:
	ldr r0, _0801F580  @ gUnknown_085A1510
	ldr r6, _0801F584  @ gUnknown_085A0FF8
	movs r7, #1
	b _0801F59C
	.align 2, 0
_0801F580: .4byte gUnknown_085A1510
_0801F584: .4byte gUnknown_085A0FF8
_0801F588:
	ldr r0, _0801F590  @ gUnknown_085A1AF8
	ldr r6, _0801F594  @ gUnknown_085A129C
	movs r7, #1
	b _0801F59C
	.align 2, 0
_0801F590: .4byte gUnknown_085A1AF8
_0801F594: .4byte gUnknown_085A129C
_0801F598:
	ldr r0, _0801F5EC  @ gUnknown_085A1AF8
	ldr r6, _0801F5F0  @ gUnknown_085A129C
_0801F59C:
	ldr r1, _0801F5F4  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0801F5F8  @ gUnknown_085A206C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801F5FC  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	bl APProc_Create
	adds r4, #8
	movs r0, #0xba
	adds r1, r4, #0
	bl PlaySpacialSoundMaybe
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F5EC: .4byte gUnknown_085A1AF8
_0801F5F0: .4byte gUnknown_085A129C
_0801F5F4: .4byte 0x06014800
_0801F5F8: .4byte gUnknown_085A206C
_0801F5FC: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_801F540

	THUMB_FUNC_START sub_801F600
sub_801F600: @ 0x0801F600
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _0801F62C  @ gUnknown_0859AFC8
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	adds r0, #0x4a
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F62C: .4byte gUnknown_0859AFC8

	THUMB_FUNC_END sub_801F600

	THUMB_FUNC_START sub_801F630
sub_801F630: @ 0x0801F630
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801F67C  @ gUnknown_085A2940
	ldr r1, _0801F680  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801F684  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F688  @ gUnknown_085A2DFC
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	bl APProc_Create
	adds r4, #8
	movs r0, #0xbf
	adds r1, r4, #0
	bl PlaySpacialSoundMaybe
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F67C: .4byte gUnknown_085A2940
_0801F680: .4byte 0x06014800
_0801F684: .4byte gUnknown_0202BCB0
_0801F688: .4byte gUnknown_085A2DFC

	THUMB_FUNC_END sub_801F630

	THUMB_FUNC_START sub_801F68C
sub_801F68C: @ 0x0801F68C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0801F6B4  @ gUnknown_085A2DDC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0801F6B8  @ gUnknown_0859AFE8
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F6B4: .4byte gUnknown_085A2DDC
_0801F6B8: .4byte gUnknown_0859AFE8

	THUMB_FUNC_END sub_801F68C

	THUMB_FUNC_START sub_801F6BC
sub_801F6BC: @ 0x0801F6BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0801F6E4  @ gUnknown_085A3490
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0801F6E8  @ gUnknown_0859AFE8
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F6E4: .4byte gUnknown_085A3490
_0801F6E8: .4byte gUnknown_0859AFE8

	THUMB_FUNC_END sub_801F6BC

	THUMB_FUNC_START sub_801F6EC
sub_801F6EC: @ 0x0801F6EC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #0x2c]
	lsls r1, r1, #4
	ldr r3, _0801F748  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r0, #8
	subs r1, r1, r0
	ldr r0, _0801F74C  @ 0x000001FF
	ands r1, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	subs r0, #8
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F750  @ gUnknown_089A6FD8
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	bl APProc_Create
	ldr r0, [r5, #0x5c]
	subs r0, #1
	str r0, [r5, #0x5c]
	cmp r0, #0
	bgt _0801F736
	adds r0, r5, #0
	movs r1, #0x64
	bl Proc_Goto
_0801F736:
	ldr r0, [r5, #0x58]
	cmp r0, #1
	beq _0801F772
	cmp r0, #1
	bgt _0801F754
	cmp r0, #0
	beq _0801F76C
	b _0801F778
	.align 2, 0
_0801F748: .4byte gUnknown_0202BCB0
_0801F74C: .4byte 0x000001FF
_0801F750: .4byte gUnknown_089A6FD8
_0801F754:
	cmp r0, #2
	beq _0801F764
	cmp r0, #3
	bne _0801F778
	ldr r0, [r5, #0x30]
	subs r0, #1
	str r0, [r5, #0x30]
	b _0801F778
_0801F764:
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	b _0801F778
_0801F76C:
	ldr r0, [r5, #0x2c]
	subs r0, #1
	b _0801F776
_0801F772:
	ldr r0, [r5, #0x2c]
	adds r0, #1
_0801F776:
	str r0, [r5, #0x2c]
_0801F778:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801F6EC

	THUMB_FUNC_START sub_801F780
sub_801F780: @ 0x0801F780
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	mov r8, r1
	mov r9, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r0, _0801F7C8  @ gUnknown_089ADA80
	ldr r1, _0801F7CC  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0801F7D0  @ gUnknown_089ADD0C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0801F7D4  @ gUnknown_0859B008
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x58]
	str r6, [r0, #0x5c]
	mov r1, r8
	str r1, [r0, #0x2c]
	mov r1, r9
	str r1, [r0, #0x30]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F7C8: .4byte gUnknown_089ADA80
_0801F7CC: .4byte 0x06014800
_0801F7D0: .4byte gUnknown_089ADD0C
_0801F7D4: .4byte gUnknown_0859B008

	THUMB_FUNC_END sub_801F780

	THUMB_FUNC_START sub_801F7D8
sub_801F7D8: @ 0x0801F7D8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801F830  @ gUnknown_085A20AC
	ldr r1, _0801F834  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0801F838  @ gUnknown_085A208C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r0, _0801F83C  @ gUnknown_0202BCB0
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	subs r0, #8
	subs r4, r4, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F840  @ gUnknown_085A2384
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0x50
	bl APProc_Create
	adds r4, #8
	movs r0, #0xbc
	adds r1, r4, #0
	bl PlaySpacialSoundMaybe
	ldr r1, [r5, #0x2c]
	adds r0, r5, #0
	movs r2, #0x1f
	bl EnsureCameraOntoPosition
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F830: .4byte gUnknown_085A20AC
_0801F834: .4byte 0x06014800
_0801F838: .4byte gUnknown_085A208C
_0801F83C: .4byte gUnknown_0202BCB0
_0801F840: .4byte gUnknown_085A2384

	THUMB_FUNC_END sub_801F7D8

	THUMB_FUNC_START sub_801F844
sub_801F844: @ 0x0801F844
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0801F85C  @ gUnknown_0859B048
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F85C: .4byte gUnknown_0859B048

	THUMB_FUNC_END sub_801F844

	THUMB_FUNC_START sub_801F860
sub_801F860: @ 0x0801F860
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl GetMapChange
	ldrb r4, [r0, #3]
	lsrs r4, r4, #1
	ldrb r1, [r0, #1]
	adds r4, r4, r1
	ldrb r2, [r0, #4]
	lsrs r2, r2, #1
	ldrb r0, [r0, #2]
	adds r2, r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl EnsureCameraOntoPosition
	str r4, [r5, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801F860

	THUMB_FUNC_START sub_801F88C
sub_801F88C: @ 0x0801F88C
	push {r4, lr}
	adds r4, r0, #0
	bl RenderBmMapOnBg2
	bl sub_8019778
	bl RenderBmMap
	movs r0, #0
	bl NewBMXFADE
	ldr r0, [r4, #0x30]
	movs r2, #0xbd
	cmp r0, #0
	beq _0801F8AC
	movs r2, #0xbe
_0801F8AC:
	ldr r0, _0801F8C4  @ gUnknown_0202BCB0
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	ldr r1, [r4, #0x34]
	subs r1, r1, r0
	adds r0, r2, #0
	bl PlaySpacialSoundMaybe
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F8C4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_801F88C

	THUMB_FUNC_START sub_801F8C8
sub_801F8C8: @ 0x0801F8C8
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r4, r2, #0
	ldr r0, _0801F8F0  @ gUnknown_0859B070
	bl Proc_StartBlocking
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetTrap
	adds r2, r0, #0
	ldrb r0, [r2, #3]
	movs r1, #1
	eors r0, r1
	strb r0, [r2, #3]
	cmp r0, #0
	beq _0801F8F4
	ldrb r0, [r2, #1]
	b _0801F8F6
	.align 2, 0
_0801F8F0: .4byte gUnknown_0859B070
_0801F8F4:
	ldrb r0, [r2]
_0801F8F6:
	str r0, [r5, #0x2c]
	ldrb r0, [r2, #3]
	str r0, [r5, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801F8C8

	THUMB_FUNC_START sub_801F904
sub_801F904: @ 0x0801F904
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801F964  @ gUnknown_085A34B0
	ldr r1, _0801F968  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0801F96C  @ gUnknown_085A3944
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801F970  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F974  @ gUnknown_085A3730
	adds r5, #0x4a
	movs r6, #0
	ldrsh r1, [r5, r6]
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	bl APProc_Create
	adds r4, #8
	movs r0, #0xbb
	adds r1, r4, #0
	bl PlaySpacialSoundMaybe
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F964: .4byte gUnknown_085A34B0
_0801F968: .4byte 0x06014800
_0801F96C: .4byte gUnknown_085A3944
_0801F970: .4byte gUnknown_0202BCB0
_0801F974: .4byte gUnknown_085A3730

	THUMB_FUNC_END sub_801F904

	THUMB_FUNC_START sub_801F978
sub_801F978: @ 0x0801F978
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0801F99C  @ gUnknown_0859B0A0
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	cmp r7, #1
	beq _0801F9A6
	cmp r7, #1
	bgt _0801F9A0
	cmp r7, #0
	beq _0801F9AE
	b _0801F9BE
	.align 2, 0
_0801F99C: .4byte gUnknown_0859B0A0
_0801F9A0:
	cmp r7, #3
	beq _0801F9B6
	b _0801F9BE
_0801F9A6:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #0
	b _0801F9BC
_0801F9AE:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #1
	b _0801F9BC
_0801F9B6:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #2
_0801F9BC:
	strh r0, [r1]
_0801F9BE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801F978

	THUMB_FUNC_START sub_801F9C4
sub_801F9C4: @ 0x0801F9C4
	adds r0, #0x4c
	movs r1, #0xf0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_801F9C4

.align 2, 0