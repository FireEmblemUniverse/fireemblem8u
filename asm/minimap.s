	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80A7578
sub_80A7578: @ 0x080A7578
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _080A75C8  @ gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r0, r4
	ldrb r3, [r5]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A7598
	movs r2, #1
_080A7598:
	lsls r2, r2, #1
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A75A8
	adds r2, #1
_080A75A8:
	lsls r2, r2, #1
	ldrb r0, [r5, #1]
	cmp r0, r3
	bne _080A75B2
	adds r2, #1
_080A75B2:
	lsls r2, r2, #1
	subs r0, r5, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A75BE
	adds r2, #1
_080A75BE:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A75C8: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_80A7578

	THUMB_FUNC_START sub_80A75CC
sub_80A75CC: @ 0x080A75CC
	push {lr}
	cmp r0, #0x36
	beq _080A75E0
	cmp r0, #0x36
	bgt _080A75DC
	cmp r0, #0
	beq _080A75E0
	b _080A75E2
_080A75DC:
	cmp r0, #0x3d
	bne _080A75E2
_080A75E0:
	movs r0, #0x15
_080A75E2:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A75CC

	THUMB_FUNC_START sub_80A75E8
sub_80A75E8: @ 0x080A75E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080A7678  @ gBmMapTerrain
	mov r8, r0
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A75CC
	adds r7, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A75CC
	cmp r0, r7
	bne _080A761E
	movs r4, #1
_080A761E:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A75CC
	cmp r0, r7
	bne _080A7638
	adds r4, #1
_080A7638:
	lsls r4, r4, #1
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
	bl sub_80A75CC
	cmp r0, r7
	bne _080A7650
	adds r4, #1
_080A7650:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
	bl sub_80A75CC
	cmp r0, r7
	bne _080A766A
	adds r4, #1
_080A766A:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A7678: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_80A75E8

	THUMB_FUNC_START sub_80A767C
sub_80A767C: @ 0x080A767C
	push {lr}
	cmp r0, #0x17
	beq _080A7694
	cmp r0, #0x17
	bgt _080A768C
	cmp r0, #0
	beq _080A7694
	b _080A7696
_080A768C:
	cmp r0, #0x1a
	beq _080A7694
	cmp r0, #0x3f
	bne _080A7696
_080A7694:
	movs r0, #0x3c
_080A7696:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A767C

	THUMB_FUNC_START sub_80A769C
sub_80A769C: @ 0x080A769C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080A772C  @ gBmMapTerrain
	mov r8, r0
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A767C
	adds r7, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A767C
	cmp r0, r7
	bne _080A76D2
	movs r4, #1
_080A76D2:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A767C
	cmp r0, r7
	bne _080A76EC
	adds r4, #1
_080A76EC:
	lsls r4, r4, #1
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
	bl sub_80A767C
	cmp r0, r7
	bne _080A7704
	adds r4, #1
_080A7704:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
	bl sub_80A767C
	cmp r0, r7
	bne _080A771E
	adds r4, #1
_080A771E:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A772C: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_80A769C

	THUMB_FUNC_START sub_80A7730
sub_80A7730: @ 0x080A7730
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	ldr r2, _080A77D0  @ gBmMapTerrain
	ldr r1, [r2]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A775A
	cmp r0, #0x15
	beq _080A775A
	cmp r0, #0x36
	beq _080A775A
	cmp r0, #0x16
	beq _080A775A
	cmp r0, #0x13
	bne _080A775C
_080A775A:
	adds r3, #1
_080A775C:
	lsls r3, r3, #1
	ldr r0, [r2]
	lsls r1, r5, #2
	adds r0, r1, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A7780
	cmp r0, #0x15
	beq _080A7780
	cmp r0, #0x36
	beq _080A7780
	cmp r0, #0x16
	beq _080A7780
	cmp r0, #0x13
	bne _080A7782
_080A7780:
	adds r3, #1
_080A7782:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r0, [r0, #1]
	cmp r0, #0x10
	beq _080A77A2
	cmp r0, #0x15
	beq _080A77A2
	cmp r0, #0x36
	beq _080A77A2
	cmp r0, #0x16
	beq _080A77A2
	cmp r0, #0x13
	bne _080A77A4
_080A77A2:
	adds r3, #1
_080A77A4:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A77C6
	cmp r0, #0x15
	beq _080A77C6
	cmp r0, #0x36
	beq _080A77C6
	cmp r0, #0x16
	beq _080A77C6
	cmp r0, #0x13
	bne _080A77C8
_080A77C6:
	adds r3, #1
_080A77C8:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A77D0: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_80A7730

	THUMB_FUNC_START sub_80A77D4
sub_80A77D4: @ 0x080A77D4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080A780C  @ gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r2, r0, r4
	ldrb r3, [r2]
	subs r0, r2, #1
	ldrb r6, [r0]
	cmp r6, r3
	beq _080A77F4
	ldrb r5, [r2, #1]
	cmp r5, r3
	bne _080A782E
_080A77F4:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A7808
	cmp r2, #0x36
	beq _080A7808
	cmp r2, #0x16
	bne _080A7810
_080A7808:
	movs r0, #4
	b _080A78F4
	.align 2, 0
_080A780C: .4byte gBmMapTerrain
_080A7810:
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _080A7822
	cmp r0, #0x36
	beq _080A7822
	cmp r0, #0x16
	bne _080A7826
_080A7822:
	movs r0, #0
	b _080A78F4
_080A7826:
	cmp r2, #0xf
	bne _080A78F2
	movs r0, #0xc
	b _080A78F4
_080A782E:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, r3
	beq _080A7844
	ldr r0, [r1, #4]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, r3
	bne _080A7874
_080A7844:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A7852
	cmp r0, #0x36
	beq _080A7852
	cmp r0, #0x16
	bne _080A7856
_080A7852:
	movs r0, #2
	b _080A78F4
_080A7856:
	adds r1, r6, #0
	cmp r1, #0x15
	beq _080A7864
	cmp r1, #0x36
	beq _080A7864
	cmp r1, #0x16
	bne _080A7868
_080A7864:
	movs r0, #6
	b _080A78F4
_080A7868:
	cmp r0, #0xf
	bne _080A7870
	movs r0, #0xd
	b _080A78F4
_080A7870:
	movs r0, #9
	b _080A78F4
_080A7874:
	subs r0, r1, #1
	ldrb r5, [r0]
	cmp r5, r3
	beq _080A7882
	ldrb r4, [r2, #1]
	cmp r4, r3
	bne _080A78B4
_080A7882:
	subs r0, r2, #1
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A7892
	cmp r2, #0x36
	beq _080A7892
	cmp r2, #0x16
	bne _080A7896
_080A7892:
	movs r0, #5
	b _080A78F4
_080A7896:
	ldrb r0, [r1, #1]
	cmp r0, #0x15
	beq _080A78A4
	cmp r0, #0x36
	beq _080A78A4
	cmp r0, #0x16
	bne _080A78A8
_080A78A4:
	movs r0, #1
	b _080A78F4
_080A78A8:
	cmp r2, #0xf
	bne _080A78B0
	movs r0, #0xe
	b _080A78F4
_080A78B0:
	movs r0, #0xa
	b _080A78F4
_080A78B4:
	ldrb r0, [r1, #1]
	cmp r0, r3
	beq _080A78C2
	subs r0, r2, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A78F2
_080A78C2:
	adds r1, r4, #0
	cmp r1, #0x15
	beq _080A78D0
	cmp r1, #0x36
	beq _080A78D0
	cmp r1, #0x16
	bne _080A78D4
_080A78D0:
	movs r0, #3
	b _080A78F4
_080A78D4:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A78E2
	cmp r0, #0x36
	beq _080A78E2
	cmp r0, #0x16
	bne _080A78E6
_080A78E2:
	movs r0, #7
	b _080A78F4
_080A78E6:
	cmp r1, #0xf
	bne _080A78EE
	movs r0, #0xf
	b _080A78F4
_080A78EE:
	movs r0, #0xb
	b _080A78F4
_080A78F2:
	movs r0, #8
_080A78F4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A77D4

	THUMB_FUNC_START sub_80A78FC
sub_80A78FC: @ 0x080A78FC
	push {lr}
	adds r2, r0, #0
	ldr r0, _080A7934  @ gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A7930
	ldr r0, [r1, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A7930
	ldr r0, [r1]
	adds r1, r2, r0
	subs r0, r1, #1
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A7930
	ldrb r0, [r1, #1]
	cmp r0, #0x2d
	bne _080A7938
_080A7930:
	movs r0, #0x12
	b _080A793A
	.align 2, 0
_080A7934: .4byte gBmMapTerrain
_080A7938:
	movs r0, #0x11
_080A793A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A78FC

	THUMB_FUNC_START sub_80A7940
sub_80A7940: @ 0x080A7940
	push {lr}
	ldr r2, _080A7958  @ gBmMapTerrain
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r0, r1
	ldrb r0, [r1, #1]
	cmp r0, #0x1e
	bne _080A795C
	movs r0, #0x16
	b _080A796A
	.align 2, 0
_080A7958: .4byte gBmMapTerrain
_080A795C:
	subs r0, r1, #1
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _080A7968
	movs r0, #7
	b _080A796A
_080A7968:
	movs r0, #0x17
_080A796A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A7940

	THUMB_FUNC_START sub_80A7970
sub_80A7970: @ 0x080A7970
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, _080A79E0  @ gBmMapTerrain
	mov ip, r2
	ldr r2, [r2]
	lsls r7, r1, #2
	adds r2, r7, r2
	ldr r1, [r2]
	adds r1, r5, r1
	ldrb r4, [r1, #1]
	cmp r4, #0x13
	beq _080A79DA
	subs r1, #1
	ldrb r3, [r1]
	cmp r3, #0x13
	beq _080A79DA
	ldr r1, [r2, #4]
	adds r1, r1, r5
	ldrb r6, [r1]
	cmp r6, #0x13
	beq _080A79F6
	subs r1, r2, #4
	ldr r1, [r1]
	adds r1, r1, r5
	ldrb r1, [r1]
	cmp r1, #0x13
	beq _080A79F6
	cmp r4, #0x10
	beq _080A79F6
	cmp r3, #0x10
	beq _080A79F6
	cmp r6, #0x10
	beq _080A79DA
	cmp r1, #0x10
	beq _080A79DA
	cmp r4, #0x16
	beq _080A79F6
	cmp r3, #0x16
	beq _080A79F6
	mov r3, ip
	ldr r1, [r3]
	adds r2, r7, r1
	ldr r1, [r2, #4]
	adds r1, r1, r5
	ldrb r4, [r1]
	cmp r4, #0x16
	beq _080A79DA
	subs r1, r2, #4
	ldr r1, [r1]
	adds r1, r1, r5
	ldrb r3, [r1]
	cmp r3, #0x16
	bne _080A79E4
_080A79DA:
	movs r0, #0x10
	b _080A7A04
	.align 2, 0
_080A79E0: .4byte gBmMapTerrain
_080A79E4:
	ldr r1, [r2]
	adds r2, r5, r1
	ldrb r1, [r2, #1]
	cmp r1, #0x3c
	beq _080A79F6
	subs r1, r2, #1
	ldrb r1, [r1]
	cmp r1, #0x3c
	bne _080A79FA
_080A79F6:
	movs r0, #0x18
	b _080A7A04
_080A79FA:
	cmp r4, #0x3c
	beq _080A7A02
	cmp r3, #0x3c
	bne _080A7A04
_080A7A02:
	movs r0, #0x10
_080A7A04:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A7970

	THUMB_FUNC_START sub_80A7A0C
sub_80A7A0C: @ 0x080A7A0C
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _080A7A30  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x40
	bls _080A7A26
	b _080A7BF2
_080A7A26:
	lsls r0, r0, #2
	ldr r1, _080A7A34  @ _080A7A38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A7A30: .4byte gBmMapTerrain
_080A7A34: .4byte _080A7A38
_080A7A38: @ jump table
	.4byte _080A7BF2 @ case 0
	.4byte _080A7B3C @ case 1
	.4byte _080A7B40 @ case 2
	.4byte _080A7B4C @ case 3
	.4byte _080A7B4C @ case 4
	.4byte _080A7B4C @ case 5
	.4byte _080A7B50 @ case 6
	.4byte _080A7B50 @ case 7
	.4byte _080A7B54 @ case 8
	.4byte _080A7BF2 @ case 9
	.4byte _080A7B58 @ case 10
	.4byte _080A7B5C @ case 11
	.4byte _080A7B60 @ case 12
	.4byte _080A7B64 @ case 13
	.4byte _080A7B68 @ case 14
	.4byte _080A7B68 @ case 15
	.4byte _080A7B6C @ case 16
	.4byte _080A7B78 @ case 17
	.4byte _080A7B7C @ case 18
	.4byte _080A7B80 @ case 19
	.4byte _080A7BF2 @ case 20
	.4byte _080A7B96 @ case 21
	.4byte _080A7B96 @ case 22
	.4byte _080A7BA2 @ case 23
	.4byte _080A7BA2 @ case 24
	.4byte _080A7BE2 @ case 25
	.4byte _080A7BE2 @ case 26
	.4byte _080A7BE2 @ case 27
	.4byte _080A7BE2 @ case 28
	.4byte _080A7BA6 @ case 29
	.4byte _080A7BAA @ case 30
	.4byte _080A7BB4 @ case 31
	.4byte _080A7BB8 @ case 32
	.4byte _080A7BB8 @ case 33
	.4byte _080A7BE2 @ case 34
	.4byte _080A7B4C @ case 35
	.4byte _080A7BF2 @ case 36
	.4byte _080A7BBC @ case 37
	.4byte _080A7BC4 @ case 38
	.4byte _080A7BD0 @ case 39
	.4byte _080A7BD0 @ case 40
	.4byte _080A7BD0 @ case 41
	.4byte _080A7BD4 @ case 42
	.4byte _080A7BE2 @ case 43
	.4byte _080A7BE2 @ case 44
	.4byte _080A7BD8 @ case 45
	.4byte _080A7BE2 @ case 46
	.4byte _080A7B96 @ case 47
	.4byte _080A7BF2 @ case 48
	.4byte _080A7BEE @ case 49
	.4byte _080A7BF2 @ case 50
	.4byte _080A7B60 @ case 51
	.4byte _080A7B80 @ case 52
	.4byte _080A7B96 @ case 53
	.4byte _080A7B96 @ case 54
	.4byte _080A7B5C @ case 55
	.4byte _080A7B4C @ case 56
	.4byte _080A7BE2 @ case 57
	.4byte _080A7BC4 @ case 58
	.4byte _080A7BC0 @ case 59
	.4byte _080A7B8A @ case 60
	.4byte _080A7BE2 @ case 61
	.4byte _080A7BA2 @ case 62
	.4byte _080A7BE2 @ case 63
	.4byte _080A7BE2 @ case 64
_080A7B3C:
	movs r0, #1
	b _080A7BF4
_080A7B40:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A7578
	adds r0, #0x40
	b _080A7BF4
_080A7B4C:
	movs r0, #2
	b _080A7BF4
_080A7B50:
	movs r0, #3
	b _080A7BF4
_080A7B54:
	movs r0, #4
	b _080A7BF4
_080A7B58:
	movs r0, #5
	b _080A7BF4
_080A7B5C:
	movs r0, #6
	b _080A7BF4
_080A7B60:
	movs r0, #8
	b _080A7BF4
_080A7B64:
	movs r0, #9
	b _080A7BF4
_080A7B68:
	movs r0, #0xa
	b _080A7BF4
_080A7B6C:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A7730
	adds r0, #0x60
	b _080A7BF4
_080A7B78:
	movs r0, #0xb
	b _080A7BF4
_080A7B7C:
	movs r0, #0x14
	b _080A7BF4
_080A7B80:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A7970
	b _080A7BF4
_080A7B8A:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A769C
	adds r0, #0x30
	b _080A7BF4
_080A7B96:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A75E8
	adds r0, #0x30
	b _080A7BF4
_080A7BA2:
	movs r0, #0xc
	b _080A7BF4
_080A7BA6:
	movs r0, #0xd
	b _080A7BF4
_080A7BAA:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A7940
	b _080A7BF4
_080A7BB4:
	movs r0, #0xe
	b _080A7BF4
_080A7BB8:
	movs r0, #0xf
	b _080A7BF4
_080A7BBC:
	movs r0, #0x1a
	b _080A7BF4
_080A7BC0:
	movs r0, #0x1b
	b _080A7BF4
_080A7BC4:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A77D4
	adds r0, #0x50
	b _080A7BF4
_080A7BD0:
	movs r0, #0x13
	b _080A7BF4
_080A7BD4:
	movs r0, #0x3a
	b _080A7BF4
_080A7BD8:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A78FC
	b _080A7BF4
_080A7BE2:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A7578
	adds r0, #0x20
	b _080A7BF4
_080A7BEE:
	movs r0, #0x19
	b _080A7BF4
_080A7BF2:
	movs r0, #0
_080A7BF4:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A7A0C

	THUMB_FUNC_START sub_80A7BF8
sub_80A7BF8: @ 0x080A7BF8
	push {lr}
	bl sub_80A7A0C
	lsls r0, r0, #5
	ldr r1, _080A7C08  @ gUnknown_02020188
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080A7C08: .4byte gUnknown_02020188

	THUMB_FUNC_END sub_80A7BF8

	THUMB_FUNC_START sub_80A7C0C
sub_80A7C0C: @ 0x080A7C0C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _080A7C40  @ gUnknown_08205D84
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _080A7C44  @ gBmMapUnit
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A7C4C
	asrs r0, r0, #6
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _080A7C48  @ gUnknown_02020188
	adds r0, r0, r1
	b _080A7C4E
	.align 2, 0
_080A7C40: .4byte gUnknown_08205D84
_080A7C44: .4byte gBmMapUnit
_080A7C48: .4byte gUnknown_02020188
_080A7C4C:
	ldr r0, _080A7C58  @ gUnknown_02020188
_080A7C4E:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A7C58: .4byte gUnknown_02020188

	THUMB_FUNC_END sub_80A7C0C

	THUMB_FUNC_START sub_80A7C5C
sub_80A7C5C: @ 0x080A7C5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	str r1, [sp]
	cmp r4, #0
	bne _080A7C72
	ldr r4, _080A7C84  @ 0x06000020
_080A7C72:
	lsls r0, r4, #0xf
	lsrs r7, r0, #0x14
	ldr r0, [sp]
	cmp r0, #0
	bge _080A7C80
	movs r1, #3
	str r1, [sp]
_080A7C80:
	movs r2, #0
	b _080A7E56
	.align 2, 0
_080A7C84: .4byte 0x06000020
_080A7C88:
	movs r6, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r3, r8
	adds r3, #2
	str r3, [sp, #0xc]
	cmp r6, r0
	blt _080A7C9A
	b _080A7E54
_080A7C9A:
	movs r0, #1
	add r0, r8
	mov r9, r0
	mov r1, r8
	lsrs r0, r1, #0x1f
	add r0, r8
	asrs r0, r0, #1
	lsls r0, r0, #5
	str r0, [sp, #4]
	movs r2, #1
	mov sl, r2
_080A7CB0:
	adds r0, r6, #0
	mov r1, r8
	bl sub_80A7BF8
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl sub_80A7BF8
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, r9
	bl sub_80A7BF8
	adds r5, r0, #0
	mov r0, sl
	mov r1, r9
	bl sub_80A7BF8
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A7E74  @ gBG1TilemapBuffer
	asrs r2, r6, #0x1f
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r3, [sp]
	lsls r0, r3, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
	ldr r0, _080A7E78  @ gBmMapUnit
	ldr r1, [r0]
	mov r3, r8
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r0, [r3]
	adds r1, r0, r6
	ldrb r0, [r1]
	str r2, [sp, #8]
	cmp r0, #0
	bne _080A7D8E
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _080A7D8E
	ldr r0, [r3, #4]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A7D8E
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _080A7E42
_080A7D8E:
	adds r0, r6, #0
	mov r1, r8
	bl sub_80A7C0C
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl sub_80A7C0C
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, r9
	bl sub_80A7C0C
	adds r5, r0, #0
	mov r0, sl
	mov r1, r9
	bl sub_80A7C0C
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A7E7C  @ gBG0TilemapBuffer
	ldr r2, [sp, #8]
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
_080A7E42:
	movs r0, #2
	add sl, r0
	adds r6, #2
	ldr r0, _080A7E80  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r6, r0
	bge _080A7E54
	b _080A7CB0
_080A7E54:
	ldr r2, [sp, #0xc]
_080A7E56:
	mov r8, r2
	ldr r1, _080A7E80  @ gBmMapSize
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r8, r0
	bge _080A7E64
	b _080A7C88
_080A7E64:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7E74: .4byte gBG1TilemapBuffer
_080A7E78: .4byte gBmMapUnit
_080A7E7C: .4byte gBG0TilemapBuffer
_080A7E80: .4byte gBmMapSize

	THUMB_FUNC_END sub_80A7C5C

	THUMB_FUNC_START sub_80A7E84
sub_80A7E84: @ 0x080A7E84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A7EC0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7E9A
	movs r0, #0x78
	bl m4aSongNumStart
_080A7E9A:
	adds r0, r4, #0
	bl sub_80A86AC
	movs r4, #1
	negs r4, r4
	adds r0, r4, #0
	bl sub_80A83D0
	movs r0, #0
	adds r1, r4, #0
	bl sub_80A7C5C
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7EC0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A7E84

	THUMB_FUNC_START sub_80A7EC4
sub_80A7EC4: @ 0x080A7EC4
	push {lr}
	ldr r0, _080A7EF4  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _080A7EF8  @ gUnknown_02000508
	cmp r1, #0xa0
	bls _080A7EDE
	ldr r0, _080A7EFC  @ gUnknown_02000500
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_080A7EDE:
	ldr r2, _080A7F00  @ 0x04000040
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #8
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080A7EF4: .4byte 0x04000006
_080A7EF8: .4byte gUnknown_02000508
_080A7EFC: .4byte gUnknown_02000500
_080A7F00: .4byte 0x04000040

	THUMB_FUNC_END sub_80A7EC4

	THUMB_FUNC_START sub_80A7F04
sub_80A7F04: @ 0x080A7F04
	ldr r2, _080A7F14  @ gUnknown_02000500
	ldr r3, [r2]
	ldr r1, _080A7F18  @ gUnknown_02000504
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_080A7F14: .4byte gUnknown_02000500
_080A7F18: .4byte gUnknown_02000504

	THUMB_FUNC_END sub_80A7F04

	THUMB_FUNC_START sub_80A7F1C
sub_80A7F1C: @ 0x080A7F1C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _080A8004  @ gUnknown_02000500
	ldr r1, _080A8008  @ gUnknown_02000280
	str r1, [r0]
	ldr r2, _080A800C  @ gUnknown_02000504
	ldr r3, _080A8010  @ 0xFFFFFD80
	adds r0, r1, r3
	str r0, [r2]
	ldr r0, _080A8014  @ gUnknown_02000508
	str r1, [r0]
	ldr r7, _080A8018  @ gLCDControlBuffer
	ldrb r0, [r7, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r5, r7, #0
	adds r5, #0x34
	ldrb r0, [r5]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r5]
	movs r0, #0x36
	adds r0, r0, r7
	mov r9, r0
	ldrb r1, [r0]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r1, r9
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r4, #0
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	strb r4, [r0]
	subs r0, #5
	strb r4, [r0]
	adds r1, #3
	movs r0, #0xa0
	strb r0, [r1]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	movs r0, #3
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r5]
	orrs r0, r6
	strb r0, [r5]
	adds r1, r7, #0
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	mov r3, r9
	ldrb r0, [r3]
	orrs r0, r6
	strb r0, [r3]
	movs r0, #0x4c
	add r8, r0
	mov r1, r8
	strh r4, [r1]
	ldr r0, _080A801C  @ sub_80A7EC4
	bl SetPrimaryHBlankHandler
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8004: .4byte gUnknown_02000500
_080A8008: .4byte gUnknown_02000280
_080A800C: .4byte gUnknown_02000504
_080A8010: .4byte 0xFFFFFD80
_080A8014: .4byte gUnknown_02000508
_080A8018: .4byte gLCDControlBuffer
_080A801C: .4byte sub_80A7EC4

	THUMB_FUNC_END sub_80A7F1C

	THUMB_FUNC_START sub_80A8020
sub_80A8020: @ 0x080A8020
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	adds r6, r0, #0
	adds r6, #0x4c
	movs r0, #0
	ldrsh r3, [r6, r0]
	cmp r3, #0
	bge _080A803C
	adds r3, #3
_080A803C:
	asrs r3, r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #3
	movs r1, #0x10
	movs r2, #0
	bl SetSpecialColorEffectsParameters
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	ldrsh r3, [r6, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0
	bl sub_8012DCC
	adds r7, r0, #0
	adds r1, r7, #0
	cmp r7, #0
	bge _080A806A
	adds r1, r7, #3
_080A806A:
	asrs r1, r1, #2
	subs r1, #0x40
	add r0, sp, #4
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0x34]
	negs r5, r2
	strh r5, [r0]
	ldr r4, [r3, #0x38]
	negs r3, r4
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r4, [r0, #0xe]
	str r6, [sp, #0x18]
	ldr r4, _080A81B0  @ gUnknown_02000504
	mov sl, r4
	ldr r2, _080A81B4  @ gSinLookup
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	mov r9, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r8, r1
	add r6, sp, #4
	movs r5, #3
	mov ip, r5
_080A80AC:
	mov r0, r9
	movs r1, #0
	ldrsh r5, [r0, r1]
	movs r2, #0
	ldrsh r4, [r6, r2]
	adds r2, r5, #0
	muls r2, r4, r2
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #2
	ldrsh r3, [r6, r0]
	adds r0, r1, #0
	muls r0, r3, r0
	subs r2, r2, r0
	muls r1, r4, r1
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r1, r0
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x78
	strh r0, [r6]
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x50
	strh r0, [r6, #2]
	adds r6, #4
	movs r1, #1
	negs r1, r1
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _080A80AC
	mov r3, sl
	ldr r0, [r3]
	bl sub_80131D0
	mov r4, sl
	ldr r0, [r4]
	add r1, sp, #4
	movs r5, #0
	ldrsh r1, [r1, r5]
	add r2, sp, #4
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #4
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #6
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80131F0
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #4
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #8
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xa
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80131F0
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #8
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0xc
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xe
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80131F0
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #2
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80131F0
	bl sub_80A7F04
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080A819E
	ldr r0, [sp, #0x14]
	bl Proc_Break
_080A819E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A81B0: .4byte gUnknown_02000504
_080A81B4: .4byte gSinLookup

	THUMB_FUNC_END sub_80A8020

	THUMB_FUNC_START sub_80A81B8
sub_80A81B8: @ 0x080A81B8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080A821C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A81D0
	movs r0, #0x79
	bl m4aSongNumStart
_080A81D0:
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	movs r0, #3
	movs r1, #0x10
	movs r2, #0
	movs r3, #4
	bl SetSpecialColorEffectsParameters
	ldr r0, _080A8220  @ gUnknown_02000500
	ldr r1, _080A8224  @ gUnknown_02000280
	str r1, [r0]
	ldr r2, _080A8228  @ gUnknown_02000504
	ldr r3, _080A822C  @ 0xFFFFFD80
	adds r0, r1, r3
	str r0, [r2]
	ldr r0, _080A8230  @ gUnknown_02000508
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A821C: .4byte gRAMChapterData
_080A8220: .4byte gUnknown_02000500
_080A8224: .4byte gUnknown_02000280
_080A8228: .4byte gUnknown_02000504
_080A822C: .4byte 0xFFFFFD80
_080A8230: .4byte gUnknown_02000508

	THUMB_FUNC_END sub_80A81B8

	THUMB_FUNC_START sub_80A8234
sub_80A8234: @ 0x080A8234
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	adds r6, r0, #0
	adds r6, #0x4c
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _080A8250
	adds r0, #3
_080A8250:
	asrs r0, r0, #2
	movs r3, #4
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #3
	movs r1, #0x10
	movs r2, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0
	ldrsh r3, [r6, r2]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	bl sub_8012DCC
	adds r7, r0, #0
	cmp r7, #0
	bge _080A8280
	adds r0, r7, #3
_080A8280:
	asrs r0, r0, #2
	movs r1, #0x40
	subs r1, r1, r0
	add r0, sp, #4
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0x34]
	negs r5, r2
	strh r5, [r0]
	ldr r4, [r3, #0x38]
	negs r3, r4
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r4, [r0, #0xe]
	str r6, [sp, #0x18]
	ldr r4, _080A83C8  @ gUnknown_02000504
	mov sl, r4
	ldr r2, _080A83CC  @ gSinLookup
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	mov r9, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r8, r1
	add r6, sp, #4
	movs r5, #3
	mov ip, r5
_080A82C4:
	mov r0, r9
	movs r1, #0
	ldrsh r5, [r0, r1]
	movs r2, #0
	ldrsh r4, [r6, r2]
	adds r2, r5, #0
	muls r2, r4, r2
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #2
	ldrsh r3, [r6, r0]
	adds r0, r1, #0
	muls r0, r3, r0
	subs r2, r2, r0
	muls r1, r4, r1
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r1, r0
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x78
	strh r0, [r6]
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x50
	strh r0, [r6, #2]
	adds r6, #4
	movs r1, #1
	negs r1, r1
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _080A82C4
	mov r3, sl
	ldr r0, [r3]
	bl sub_80131D0
	mov r4, sl
	ldr r0, [r4]
	add r1, sp, #4
	movs r5, #0
	ldrsh r1, [r1, r5]
	add r2, sp, #4
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #4
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #6
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80131F0
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #4
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #8
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xa
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80131F0
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #8
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0xc
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xe
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80131F0
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #2
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80131F0
	bl sub_80A7F04
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080A83B6
	ldr r0, [sp, #0x14]
	bl Proc_Break
_080A83B6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A83C8: .4byte gUnknown_02000504
_080A83CC: .4byte gSinLookup

	THUMB_FUNC_END sub_80A8234

	THUMB_FUNC_START sub_80A83D0
sub_80A83D0: @ 0x080A83D0
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080A83DA
	movs r4, #3
_080A83DA:
	ldr r0, _080A8400  @ gUnknown_08A1FBD8
	ldr r1, _080A8404  @ gUnknown_02020188
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A8408  @ gUnknown_08A1FFB0
	lsls r1, r4, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080A840C  @ gUnknown_08A1FFD0
	adds r1, r4, #1
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8400: .4byte gUnknown_08A1FBD8
_080A8404: .4byte gUnknown_02020188
_080A8408: .4byte gUnknown_08A1FFB0
_080A840C: .4byte gUnknown_08A1FFD0

	THUMB_FUNC_END sub_80A83D0

	THUMB_FUNC_START sub_80A8410
sub_80A8410: @ 0x080A8410
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080A8490  @ gUnknown_0200050C
	ldr r0, _080A8494  @ gUnknown_02020188
	str r0, [r1]
	movs r2, #1
	ldr r0, _080A8498  @ gPaletteBuffer
	mov sl, r0
	movs r0, #0x1f
	mov r8, r0
	mov r9, r1
_080A842C:
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r5, r0, #0
	mov r1, r8
	ands r5, r1
	asrs r4, r0, #5
	ands r4, r1
	asrs r3, r0, #0xa
	ands r3, r1
	adds r0, r2, #1
	mov ip, r0
	lsls r6, r2, #1
	movs r7, #7
_080A844C:
	mov r1, r9
	ldr r0, [r1]
	adds r0, r6, r0
	lsls r1, r3, #0xa
	lsls r2, r4, #5
	adds r1, r1, r2
	adds r1, r1, r5
	strh r1, [r0]
	adds r5, #3
	cmp r5, #0x1f
	ble _080A8464
	movs r5, #0x1f
_080A8464:
	adds r4, #3
	cmp r4, #0x1f
	ble _080A846C
	movs r4, #0x1f
_080A846C:
	adds r3, #3
	cmp r3, #0x1f
	ble _080A8474
	movs r3, #0x1f
_080A8474:
	adds r6, #0x20
	subs r7, #1
	cmp r7, #0
	bge _080A844C
	mov r2, ip
	cmp r2, #0xf
	ble _080A842C
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8490: .4byte gUnknown_0200050C
_080A8494: .4byte gUnknown_02020188
_080A8498: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80A8410

	THUMB_FUNC_START sub_80A849C
sub_80A849C: @ 0x080A849C
	push {lr}
	sub sp, #0x10
	ldr r1, _080A84D0  @ gUnknown_08205D87
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	bl GetGameClock
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	add r0, sp
	ldrb r1, [r0]
	ldr r0, _080A84D4  @ gUnknown_0200050C
	lsls r1, r1, #5
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A84D0: .4byte gUnknown_08205D87
_080A84D4: .4byte gUnknown_0200050C

	THUMB_FUNC_END sub_80A849C

	THUMB_FUNC_START sub_80A84D8
sub_80A84D8: @ 0x080A84D8
	push {lr}
	sub sp, #0x20
	ldr r1, _080A8514  @ gUnknown_08205D97
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	bl GetGameClock
	movs r1, #0x1f
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r3, r0, #0
	adds r3, #0x10
	ldr r2, _080A8518  @ gPaletteBuffer
	lsls r0, r3, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0x87
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
	add sp, #0x20
	pop {r0}
	bx r0
	.align 2, 0
_080A8514: .4byte gUnknown_08205D97
_080A8518: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80A84D8

	THUMB_FUNC_START sub_80A851C
sub_80A851C: @ 0x080A851C
	push {r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r1, _080A8560  @ gUnknown_08205DB8
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	ldr r3, _080A8564  @ gUnknown_0202BCB0
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _080A8538
	adds r1, #3
_080A8538:
	asrs r1, r1, #2
	ldr r0, [r4, #0x3c]
	adds r2, r0, r1
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080A8548
	adds r0, #3
_080A8548:
	asrs r0, r0, #2
	ldr r1, [r4, #0x40]
	adds r1, r1, r0
	adds r0, r2, #0
	mov r2, sp
	movs r3, #0
	bl CallARM_PushToSecondaryOAM
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8560: .4byte gUnknown_08205DB8
_080A8564: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_80A851C

	THUMB_FUNC_START sub_80A8568
sub_80A8568: @ 0x080A8568
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _080A85D8  @ gBmMapSize
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r5, r0, #1
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r1, r0, #2
	movs r0, #0xa0
	subs r0, r0, r1
	asrs r4, r0, #1
	cmp r1, #0x90
	ble _080A85AE
	adds r4, r1, #0
	subs r4, #0x90
	ldr r1, _080A85DC  @ gUnknown_0202BCB0
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	lsls r0, r0, #0x10
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	bl __divsi3
	muls r0, r4, r0
	cmp r0, #0
	bge _080A85A8
	ldr r1, _080A85E0  @ 0x0000FFFF
	adds r0, r0, r1
_080A85A8:
	asrs r4, r0, #0x10
	movs r0, #8
	subs r4, r0, r4
_080A85AE:
	str r5, [r6, #0x3c]
	str r4, [r6, #0x40]
	negs r5, r5
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	negs r4, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A85D8: .4byte gBmMapSize
_080A85DC: .4byte gUnknown_0202BCB0
_080A85E0: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80A8568

	THUMB_FUNC_START sub_80A85E4
sub_80A85E4: @ 0x080A85E4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r1, _080A86A4  @ gUnknown_0202BCB0
	movs r0, #0xc
	ldrsh r3, [r1, r0]
	movs r0, #0xe
	ldrsh r4, [r1, r0]
	movs r5, #0xf
	adds r0, r3, #0
	ands r0, r5
	adds r7, r1, #0
	cmp r0, #0
	bne _080A866E
	adds r0, r4, #0
	ands r0, r5
	cmp r0, #0
	bne _080A866E
	str r0, [r2, #0x2c]
	str r0, [r2, #0x30]
	ldr r5, _080A86A8  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A8626
	movs r0, #8
	negs r0, r0
	str r0, [r2, #0x2c]
	adds r1, r2, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A8626:
	ldr r5, [r5]
	ldrh r1, [r5, #4]
	movs r0, #0x10
	ands r0, r1
	adds r6, r5, #0
	cmp r0, #0
	beq _080A8640
	movs r0, #8
	str r0, [r2, #0x2c]
	adds r1, r2, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A8640:
	ldrh r1, [r6, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A8658
	movs r0, #8
	negs r0, r0
	str r0, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A8658:
	ldrh r1, [r5, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A866E
	movs r0, #8
	str r0, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A866E:
	ldr r0, [r2, #0x2c]
	adds r3, r3, r0
	ldr r0, [r2, #0x30]
	adds r4, r4, r0
	cmp r3, #0
	bge _080A867C
	movs r3, #0
_080A867C:
	adds r1, r7, #0
	movs r2, #0x28
	ldrsh r0, [r1, r2]
	cmp r3, r0
	ble _080A8688
	adds r3, r0, #0
_080A8688:
	cmp r4, #0
	bge _080A868E
	movs r4, #0
_080A868E:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	cmp r4, r0
	ble _080A8698
	adds r4, r0, #0
_080A8698:
	strh r3, [r7, #0xc]
	strh r4, [r7, #0xe]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A86A4: .4byte gUnknown_0202BCB0
_080A86A8: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_80A85E4

	THUMB_FUNC_START sub_80A86AC
sub_80A86AC: @ 0x080A86AC
	adds r2, r0, #0
	adds r2, #0x4a
	movs r1, #0
	strh r1, [r2]
	ldr r2, _080A86C8  @ gBmMapSize
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r3, #2
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
_080A86C8: .4byte gBmMapSize

	THUMB_FUNC_END sub_80A86AC

	THUMB_FUNC_START sub_80A86CC
sub_80A86CC: @ 0x080A86CC
	push {lr}
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080A86FA
	ldr r1, _080A8704  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _080A86E4
	adds r0, #0xf
_080A86E4:
	asrs r0, r0, #4
	adds r0, #7
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bge _080A86F2
	adds r1, #0xf
_080A86F2:
	asrs r1, r1, #4
	adds r1, #5
	bl SetCursorMapPosition
_080A86FA:
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_080A8704: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_80A86CC

	THUMB_FUNC_START sub_80A8708
sub_80A8708: @ 0x080A8708
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_80A849C
	adds r0, r4, #0
	bl sub_80A84D8
	adds r0, r4, #0
	bl sub_80A8568
	adds r0, r4, #0
	bl sub_80A851C
	adds r0, r4, #0
	bl sub_80A85E4
	ldr r0, _080A8768  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080A876C
	movs r0, #0
	str r0, [sp]
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
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080A8794
	.align 2, 0
_080A8768: .4byte gKeyStatusPtr
_080A876C:
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	movs r0, #3
	movs r1, #0x10
	movs r2, #0
	movs r3, #4
	bl SetSpecialColorEffectsParameters
_080A8794:
	ldr r0, _080A87BC  @ gUnknown_0202BCB0
	ldr r0, [r0, #0xc]
	ldr r1, _080A87C0  @ 0x000F000F
	ands r0, r1
	cmp r0, #0
	bne _080A87B4
	ldr r0, _080A87C4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080A87B4
	adds r0, r4, #0
	bl Proc_Break
_080A87B4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A87BC: .4byte gUnknown_0202BCB0
_080A87C0: .4byte 0x000F000F
_080A87C4: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_80A8708

	THUMB_FUNC_START sub_80A87C8
sub_80A87C8: @ 0x080A87C8
	push {lr}
	ldr r0, _080A87D8  @ gUnknown_08A1FB38
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080A87D8: .4byte gUnknown_08A1FB38

	THUMB_FUNC_END sub_80A87C8

	THUMB_FUNC_START sub_80A87DC
sub_80A87DC: @ 0x080A87DC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A87EC  @ gUnknown_08A1FB38
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A87EC: .4byte gUnknown_08A1FB38

	THUMB_FUNC_END sub_80A87DC

	THUMB_FUNC_START sub_80A87F0
sub_80A87F0: @ 0x080A87F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080A8824  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080A8828  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	adds r0, r5, #0
	bl InitChapterPreviewMap
	adds r0, r4, #0
	bl sub_80A83D0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A7C5C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8824: .4byte gBG0TilemapBuffer
_080A8828: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80A87F0

.align 2, 0
