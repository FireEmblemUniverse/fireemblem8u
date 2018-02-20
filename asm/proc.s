	.INCLUDE "macro.inc"

	.syntax unified
	.thumb
	THUMB_FUNC_START Initialize6CEngine
Initialize6CEngine: @ 0x08002C08
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _08002C6C
	ldr r5, _08002C70
	ldr r0, _08002C74
	mov ip, r0
	movs r2, #0
	adds r6, r5, #0
	movs r3, #0
_08002C1A:
	adds r1, r3, r7
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	str r2, [r1, #0x18]
	str r2, [r1, #0x1c]
	str r2, [r1, #0x20]
	strh r2, [r1, #0x24]
	adds r0, r1, #0
	adds r0, #0x26
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	stm r6!, {r1}
	adds r3, #0x6c
	adds r4, #1
	cmp r4, #0x3f
	ble _08002C1A
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	mov r0, ip
	str r5, [r0]
	ldr r1, _08002C78
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_08002C5E:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08002C5E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C6C: .4byte 0x02024E68
_08002C70: .4byte 0x02026968
_08002C74: .4byte 0x02026A6C
_08002C78: .4byte 0x02026A70

	THUMB_FUNC_START New6C
New6C: @ 0x08002C7C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl Allocate6C
	adds r5, r0, #0
	str r4, [r5]
	str r4, [r5, #4]
	movs r0, #0
	str r0, [r5, #8]
	str r0, [r5, #0xc]
	str r0, [r5, #0x14]
	str r0, [r5, #0x18]
	str r0, [r5, #0x1c]
	str r0, [r5, #0x20]
	movs r1, #0
	strh r0, [r5, #0x24]
	adds r0, r5, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	cmp r6, #7
	bgt _08002CBE
	adds r0, r5, #0
	adds r1, r6, #0
	bl InsertMain6C
	b _08002CC6
_08002CBE:
	adds r0, r5, #0
	adds r1, r6, #0
	bl InsertChild6C
_08002CC6:
	adds r0, r5, #0
	bl Call6CCode
	adds r2, r5, #0
	adds r2, #0x27
	ldrb r1, [r2]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START NewBlocking6C
NewBlocking6C: @ 0x08002CE0
	push {lr}
	bl New6C
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08002D08
	adds r3, r2, #0
	adds r3, #0x27
	ldrb r1, [r3]
	movs r0, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r1, [r2, #0x14]
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	b _08002D0A
_08002D08:
	movs r0, #0
_08002D0A:
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START Delete6CInternal
Delete6CInternal: @ 0x08002D10
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08002D1E
	bl Delete6CInternal
_08002D1E:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08002D28
	bl Delete6CInternal
_08002D28:
	adds r6, r4, #0
	adds r6, #0x27
	ldrb r0, [r6]
	movs r5, #1
	ands r5, r0
	cmp r5, #0
	bne _08002D66
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _08002D42
	adds r0, r4, #0
	bl BXR1
_08002D42:
	adds r0, r4, #0
	bl Free6C
	str r5, [r4]
	str r5, [r4, #0xc]
	ldrb r0, [r6]
	movs r1, #1
	orrs r0, r1
	strb r0, [r6]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08002D66
	ldr r1, [r4, #0x14]
	adds r1, #0x28
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_08002D66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START Delete6C
Delete6C: @ 0x08002D6C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08002D7E
	bl Isolate6C
	adds r0, r4, #0
	bl Delete6CInternal
_08002D7E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START Allocate6C
Allocate6C: @ 0x08002D84
	ldr r1, _08002D90
	ldr r2, [r1]
	ldm r2!, {r0}
	str r2, [r1]
	bx lr
	.align 2, 0
_08002D90: .4byte 0x02026A6C

	THUMB_FUNC_START Free6C
Free6C: @ 0x08002D94
	ldr r2, _08002DA0
	ldr r1, [r2]
	subs r1, #4
	str r1, [r2]
	str r0, [r1]
	bx lr
	.align 2, 0
_08002DA0: .4byte 0x02026A6C

	THUMB_FUNC_START InsertMain6C
InsertMain6C: @ 0x08002DA4
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	lsls r1, r3, #2
	ldr r0, _08002DC4
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _08002DBA
	str r2, [r0, #0x1c]
	str r0, [r2, #0x20]
_08002DBA:
	str r3, [r2, #0x14]
	str r2, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08002DC4: .4byte 0x02026A70

	THUMB_FUNC_START InsertChild6C
InsertChild6C: @ 0x08002DC8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _08002DD8
	str r2, [r0, #0x1c]
	ldr r0, [r1, #0x18]
	str r0, [r2, #0x20]
_08002DD8:
	str r2, [r1, #0x18]
	str r1, [r2, #0x14]
	pop {r0}
	bx r0

	THUMB_FUNC_START Isolate6C
Isolate6C: @ 0x08002DE0
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	beq _08002DEE
	ldr r0, [r2, #0x20]
	str r0, [r1, #0x20]
_08002DEE:
	ldr r1, [r2, #0x20]
	cmp r1, #0
	beq _08002DF8
	ldr r0, [r2, #0x1c]
	str r0, [r1, #0x1c]
_08002DF8:
	ldr r1, [r2, #0x14]
	cmp r1, #8
	ble _08002E0A
	ldr r0, [r1, #0x18]
	cmp r0, r2
	bne _08002E1A
	ldr r0, [r2, #0x20]
	str r0, [r1, #0x18]
	b _08002E1A
_08002E0A:
	lsls r0, r1, #2
	ldr r1, _08002E24
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, r2
	bne _08002E1A
	ldr r0, [r2, #0x20]
	str r0, [r1]
_08002E1A:
	movs r0, #0
	str r0, [r2, #0x1c]
	str r0, [r2, #0x20]
	pop {r0}
	bx r0
	.align 2, 0
_08002E24: .4byte 0x02026A70

	THUMB_FUNC_START Exec6C_
Exec6C_: @ 0x08002E28
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08002E36
	bl Exec6C_
_08002E36:
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08002E74
	adds r2, r4, #0
	adds r2, #0x27
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	bne _08002E74
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _08002E62
	adds r0, r4, #0
	bl Call6CCode
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08002E6A
_08002E62:
	ldr r1, [r4, #0xc]
	adds r0, r4, #0
	bl BXR1
_08002E6A:
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08002E7E
_08002E74:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08002E7E
	bl Exec6C_
_08002E7E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START Exec6C
Exec6C: @ 0x08002E84
	push {lr}
	cmp r0, #0
	beq _08002E8E
	bl Exec6C_
_08002E8E:
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START Break6CLoop
Break6CLoop: @ 0x08002E94
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Find6C
Find6C: @ 0x08002E9C
	push {lr}
	adds r3, r0, #0
	ldr r1, _08002EB0
	movs r2, #0
_08002EA4:
	ldr r0, [r1]
	cmp r0, r3
	bne _08002EB4
	adds r0, r1, #0
	b _08002EBE
	.align 2, 0
_08002EB0: .4byte 0x02024E68
_08002EB4:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _08002EA4
	movs r0, #0
_08002EBE:
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_08002EC4
sub_08002EC4: @ 0x08002EC4
	push {lr}
	adds r3, r0, #0
	ldr r1, _08002EE0
	movs r2, #0
_08002ECC:
	ldr r0, [r1]
	cmp r0, r3
	bne _08002EE4
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08002EE4
	adds r0, r1, #0
	b _08002EEE
	.align 2, 0
_08002EE0: .4byte 0x02024E68
_08002EE4:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _08002ECC
	movs r0, #0
_08002EEE:
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_08002EF4
sub_08002EF4: @ 0x08002EF4
	push {lr}
	adds r3, r0, #0
	ldr r1, _08002F10
	movs r2, #0
_08002EFC:
	ldr r0, [r1]
	cmp r0, #0
	beq _08002F14
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r3
	bne _08002F14
	adds r0, r1, #0
	b _08002F1E
	.align 2, 0
_08002F10: .4byte 0x02024E68
_08002F14:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _08002EFC
	movs r0, #0
_08002F1E:
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START Goto6CLabel
Goto6CLabel: @ 0x08002F24
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r1, r0, #0
	ldr r2, [r1]
	ldrh r3, [r2]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0
	beq _08002F56
	movs r5, #0
_08002F38:
	cmp r3, #0xb
	bne _08002F4A
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r0, r4
	bne _08002F4A
	str r2, [r1, #4]
	str r5, [r1, #0xc]
	b _08002F56
_08002F4A:
	adds r2, #8
	ldrh r3, [r2]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r0, #0
	bne _08002F38
_08002F56:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START Goto6CPointer
Goto6CPointer: @ 0x08002F5C
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr

	THUMB_FUNC_START Set6CMark
Set6CMark: @ 0x08002F64
	adds r0, #0x26
	strb r1, [r0]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Set6CDestructor
Set6CDestructor: @ 0x08002F6C
	str r1, [r0, #8]
	bx lr

	THUMB_FUNC_START ForAll6C
ForAll6C: @ 0x08002F70
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08002F94
	movs r5, #0x3f
_08002F78:
	ldr r0, [r4]
	cmp r0, #0
	beq _08002F84
	adds r0, r4, #0
	bl BXR6
_08002F84:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08002F78
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002F94: .4byte 0x02024E68

	THUMB_FUNC_START ForEach6C
ForEach6C: @ 0x08002F98
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _08002FBC
	movs r5, #0x3f
_08002FA2:
	ldr r0, [r4]
	cmp r0, r7
	bne _08002FAE
	adds r0, r4, #0
	bl BXR6
_08002FAE:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08002FA2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002FBC: .4byte 0x02024E68

	THUMB_FUNC_START sub_08002FC0
sub_08002FC0: @ 0x08002FC0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _08002FE8
	movs r5, #0x3f
_08002FCA:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r7
	bne _08002FDA
	adds r0, r4, #0
	bl BXR6
_08002FDA:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08002FCA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002FE8: .4byte 0x02024E68

	THUMB_FUNC_START BlockEach6CMarked
BlockEach6CMarked: @ 0x08002FEC
	push {lr}
	adds r3, r0, #0
	movs r2, #0x3f
	ldr r0, _08003010
	adds r1, r0, #0
	adds r1, #0x26
_08002FF8:
	ldrb r0, [r1]
	cmp r0, r3
	bne _08003004
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
_08003004:
	subs r2, #1
	adds r1, #0x6c
	cmp r2, #0
	bge _08002FF8
	pop {r0}
	bx r0
	.align 2, 0
_08003010: .4byte 0x02024E68

	THUMB_FUNC_START UnblockEach6CMarked
UnblockEach6CMarked: @ 0x08003014
	push {lr}
	adds r3, r0, #0
	movs r2, #0x3f
	ldr r0, _0800303C
	adds r1, r0, #0
	adds r1, #0x26
_08003020:
	ldrb r0, [r1]
	cmp r0, r3
	bne _08003030
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08003030
	subs r0, #1
	strb r0, [r1, #2]
_08003030:
	subs r2, #1
	adds r1, #0x6c
	cmp r2, #0
	bge _08003020
	pop {r0}
	bx r0
	.align 2, 0
_0800303C: .4byte 0x02024E68

	THUMB_FUNC_START DeleteEach6CMarked
DeleteEach6CMarked: @ 0x08003040
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08003068
	movs r5, #0x3f
_08003048:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r6
	bne _08003058
	adds r0, r4, #0
	bl Delete6C
_08003058:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08003048
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003068: .4byte 0x02024E68

	THUMB_FUNC_START Delete6C_
Delete6C_: @ 0x0800306C
	push {lr}
	bl Delete6C
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START DeleteEach6C
DeleteEach6C: @ 0x08003078
	push {lr}
	ldr r1, _08003084
	bl ForEach6C
	pop {r0}
	bx r0
	.align 2, 0
_08003084: .4byte 0x0800306D

	THUMB_FUNC_START Clear6CLoopWrapper
Clear6CLoopWrapper: @ 0x08003088
	push {lr}
	bl Break6CLoop
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START ClearCallbackAll6CMatch
ClearCallbackAll6CMatch: @ 0x08003094
	push {lr}
	ldr r1, _080030A0
	bl ForEach6C
	pop {r0}
	bx r0
	.align 2, 0
_080030A0: .4byte 0x08003089

	THUMB_FUNC_START ForAllFollowing6C
ForAllFollowing6C: @ 0x080030A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _080030B4
	bl ForAllFollowing6C
_080030B4:
	adds r0, r4, #0
	bl BXR5
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _080030C6
	adds r1, r5, #0
	bl ForAllFollowing6C
_080030C6:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_080030CC
sub_080030CC: @ 0x080030CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl BXR5
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _080030E2
	adds r1, r5, #0
	bl ForAllFollowing6C
_080030E2:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START Call6C_00Delete
Call6C_00Delete: @ 0x080030E8
	push {lr}
	bl Delete6C
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_START Call6C_01Name
Call6C_01Name: @ 0x080030F4
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0x10]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_02CallAndContinue
Call6C_02CallAndContinue: @ 0x08003104
	push {lr}
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	adds r1, #8
	str r1, [r0, #4]
	bl BXR2
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_START Call6C_16Call
Call6C_16Call: @ 0x08003118
	push {lr}
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	adds r1, #8
	str r1, [r0, #4]
	bl BXR2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_18CallWithArg
Call6C_18CallWithArg: @ 0x08003130
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #4]
	ldrh r0, [r2, #2]
	ldr r3, [r2, #4]
	adds r2, #8
	str r2, [r1, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl BXR3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_14While
Call6C_14While: @ 0x08003150
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, #8
	str r0, [r4, #4]
	adds r0, r4, #0
	bl BXR1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800316E
	movs r0, #1
	b _08003176
_0800316E:
	ldr r0, [r4, #4]
	subs r0, #8
	str r0, [r4, #4]
	movs r0, #0
_08003176:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START Call6C_03SetLoop
Call6C_03SetLoop: @ 0x0800317C
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0xc]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #0
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_04SetDestructor
Call6C_04SetDestructor: @ 0x0800318C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl Set6CDestructor
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START Call6C_05AddChild
Call6C_05AddChild: @ 0x080031A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl New6C
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START Call6C_06AddBlockingChild
Call6C_06AddBlockingChild: @ 0x080031C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl NewBlocking6C
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START Call6C_07AddGlobal_BuggedMaybe
Call6C_07AddGlobal_BuggedMaybe: @ 0x080031E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	bl New6C
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_08WhileExists
Call6C_08WhileExists: @ 0x08003200
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl Find6C
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _0800321E
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	b _08003220
_0800321E:
	movs r0, #0
_08003220:
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_09DeleteEach6C
Call6C_09DeleteEach6C: @ 0x08003228
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl DeleteEach6C
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_0AClearLoopForEach6C
Call6C_0AClearLoopForEach6C: @ 0x08003244
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl ClearCallbackAll6CMatch
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_0BOr19Label
Call6C_0BOr19Label: @ 0x08003260
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_0DJump
Call6C_0DJump: @ 0x0800326C
	push {lr}
	ldr r1, [r0, #4]
	ldr r1, [r1, #4]
	bl Goto6CPointer
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_START Call6C_0CGotoLabel
Call6C_0CGotoLabel: @ 0x0800327C
	push {lr}
	ldr r1, [r0, #4]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl Goto6CLabel
	movs r0, #1
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START _6CSleepLoop
_6CSleepLoop: @ 0x08003290
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x24]
	subs r0, #1
	strh r0, [r1, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080032A6
	adds r0, r1, #0
	bl Break6CLoop
_080032A6:
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_0ESleep
Call6C_0ESleep: @ 0x080032AC
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldrh r2, [r0, #2]
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _080032C2
	strh r2, [r1, #0x24]
	ldr r0, _080032D0
	str r0, [r1, #0xc]
_080032C2:
	ldr r0, [r1, #4]
	adds r0, #8
	str r0, [r1, #4]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080032D0: .4byte 0x08003291

	THUMB_FUNC_START Call6C_0FMark
Call6C_0FMark: @ 0x080032D4
	ldr r1, [r0, #4]
	ldrh r1, [r1, #2]
	adds r2, r0, #0
	adds r2, #0x26
	strb r1, [r2]
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr

	THUMB_FUNC_START Call6C_13Blank
Call6C_13Blank: @ 0x080032E8
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_10Block
Call6C_10Block: @ 0x080032F4
	movs r0, #0
	bx lr

	THUMB_FUNC_START Call6C_11DeleteIfDuplicate
Call6C_11DeleteIfDuplicate: @ 0x080032F8
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _08003324
	movs r4, #0
	ldr r5, [r3]
	movs r1, #0x3f
_08003304:
	ldr r0, [r2]
	cmp r0, r5
	bne _0800330C
	adds r4, #1
_0800330C:
	subs r1, #1
	adds r2, #0x6c
	cmp r1, #0
	bge _08003304
	cmp r4, #1
	bgt _08003328
	ldr r0, [r3, #4]
	adds r0, #8
	str r0, [r3, #4]
	movs r0, #1
	b _08003330
	.align 2, 0
_08003324: .4byte 0x02024E68
_08003328:
	adds r0, r3, #0
	bl Delete6C
	movs r0, #0
_08003330:
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_17DeleteOtherDuplicates
Call6C_17DeleteOtherDuplicates: @ 0x08003338
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08003344
	movs r3, #0
	b _0800334C
	.align 2, 0
_08003344: .4byte 0x02024E68
_08003348:
	adds r3, #1
	adds r2, #0x6c
_0800334C:
	cmp r3, #0x3f
	bgt _08003362
	cmp r2, r4
	beq _08003348
	ldr r1, [r2]
	ldr r0, [r4]
	cmp r1, r0
	bne _08003348
	adds r0, r2, #0
	bl Delete6C
_08003362:
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START Call6C_15Blank
Call6C_15Blank: @ 0x08003370
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6C_12SetBit4
Call6C_12SetBit4: @ 0x0800337C
	adds r3, r0, #0
	adds r3, #0x27
	ldrb r2, [r3]
	movs r1, #4
	orrs r1, r2
	strb r1, [r3]
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Call6CCode
Call6CCode: @ 0x08003394
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _080033D6
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _080033D6
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _080033D6
	ldr r5, _080033B4
	b _080033BE
	.align 2, 0
_080033B4: .4byte 0x085879D8
_080033B8:
	ldr r0, [r4]
	cmp r0, #0
	beq _080033D6
_080033BE:
	ldr r0, [r4, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl BXR1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080033B8
_080033D6:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START nullsub_2
nullsub_2: @ 0x080033DC
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ForEach6CDoNothing
ForEach6CDoNothing: @ 0x080033E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _080033F0
	bl ForEach6CDoNothing
_080033F0:
	adds r0, r4, #0
	bl nullsub_2
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _08003410
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	adds r0, r1, #0
	adds r1, r5, #0
	bl ForEach6CDoNothing
	ldr r0, [r5]
	subs r0, #2
	str r0, [r5]
_08003410:
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_08003418
sub_08003418: @ 0x08003418
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	bl nullsub_2
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _08003442
	ldr r0, [sp]
	adds r0, #2
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sp
	bl ForEach6CDoNothing
	ldr r0, [sp]
	subs r0, #2
	str r0, [sp]
_08003442:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_0800344C
sub_0800344C: @ 0x0800344C
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Set6CLoop
Set6CLoop: @ 0x08003450
	str r1, [r0, #0xc]
	bx lr

	THUMB_FUNC_START sub_08003454
sub_08003454: @ 0x08003454
	adds r0, #0x28
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_08003460
sub_08003460: @ 0x08003460
	adds r0, #0x28
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Find6C_
Find6C_: @ 0x0800346C
	push {lr}
	adds r3, r0, #0
	cmp r1, #0
	bne _08003480
	ldr r1, _08003478
	b _08003482
	.align 2, 0
_08003478: .4byte 0x02024E68
_0800347C:
	adds r0, r1, #0
	b _08003498
_08003480:
	adds r1, #0x6c
_08003482:
	ldr r0, _0800349C
	cmp r1, r0
	bhs _08003496
	adds r2, r0, #0
_0800348A:
	ldr r0, [r1]
	cmp r0, r3
	beq _0800347C
	adds r1, #0x6c
	cmp r1, r2
	blo _0800348A
_08003496:
	movs r0, #0
_08003498:
	pop {r1}
	bx r1
	.align 2, 0
_0800349C: .4byte 0x02026968

	THUMB_FUNC_START sub_80034A0
sub_80034A0: @ 0x080034A0
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	bne _080034B4
	ldr r2, _080034AC
	b _080034B6
	.align 2, 0
_080034AC: .4byte 0x02024E68
_080034B0:
	adds r0, r2, #0
	b _080034CC
_080034B4:
	adds r2, #0x6c
_080034B6:
	ldr r0, _080034D0
	cmp r2, r0
	bhs _080034CA
	adds r3, r0, #0
_080034BE:
	ldr r0, [r2, #0x14]
	cmp r0, r1
	beq _080034B0
	adds r2, #0x6c
	cmp r2, r3
	blo _080034BE
_080034CA:
	movs r0, #0
_080034CC:
	pop {r1}
	bx r1
	.align 2, 0
_080034D0: .4byte 0x02026968

	THUMB_FUNC_START sub_080034D4
sub_080034D4: @ 0x080034D4
	push {lr}
	movs r2, #0x40
	ldr r1, _080034F4
	ldr r0, _080034F8
	adds r3, r1, r0
_080034DE:
	ldr r0, [r1]
	cmp r0, #0
	beq _080034E6
	subs r2, #1
_080034E6:
	adds r1, #0x6c
	cmp r1, r3
	ble _080034DE
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080034F4: .4byte 0x02024E68
_080034F8: .4byte 0x00001A94

	THUMB_FUNC_START sub_80034FC
sub_80034FC: @ 0x080034FC
	push {r4, lr}
	adds r3, r0, #0
	ldr r2, _08003514
	movs r1, #0
	movs r4, #0x3f
_08003506:
	cmp r3, #0
	bne _08003518
	ldr r0, [r2]
	cmp r0, #0
	beq _08003520
	b _0800351E
	.align 2, 0
_08003514: .4byte 0x02024E68
_08003518:
	ldr r0, [r2]
	cmp r0, r3
	bne _08003520
_0800351E:
	adds r1, #1
_08003520:
	subs r4, #1
	adds r2, #0x6c
	cmp r4, #0
	bge _08003506
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8003530
sub_8003530: @ 0x08003530
	ldr r2, _0800353C
	str r2, [r0]
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_0800353C: .4byte 0x02024E68

	THUMB_FUNC_START sub_8003540
sub_8003540: @ 0x08003540
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	ldr r0, [r3, #8]
	cmp r0, #0x3f
	bgt _08003570
	ldr r5, [r3, #4]
_0800354E:
	ldr r1, [r3]
	ldr r0, [r1]
	cmp r0, r5
	bne _08003558
	adds r4, r1, #0
_08003558:
	ldr r0, [r3, #8]
	adds r2, r0, #1
	str r2, [r3, #8]
	adds r0, r1, #0
	adds r0, #0x6c
	str r0, [r3]
	cmp r4, #0
	beq _0800356C
	adds r0, r4, #0
	b _08003572
_0800356C:
	cmp r2, #0x3f
	ble _0800354E
_08003570:
	movs r0, #0
_08003572:
	pop {r4, r5}
	pop {r1}
	bx r1

	
	