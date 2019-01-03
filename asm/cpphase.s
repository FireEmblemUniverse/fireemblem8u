	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Computer/AI Phase (and berserk) controller proc(s) (equivalent to E_PLAYERPHASE)

	THUMB_FUNC_START sub_80396AC
sub_80396AC: @ 0x080396AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _08039708  @ gUnknown_0203AA04
	adds r3, r2, #0
	adds r3, #0x7b
	movs r1, #0
	movs r0, #1
	strb r0, [r3]
	adds r3, #3
	movs r0, #0xff
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x78
	strb r1, [r0]
	ldr r5, _0803970C  @ gUnknown_080D8538
	ldr r4, _08039710  @ gUnknown_0202BCF0
	movs r3, #0
	movs r1, #7
	adds r0, #0x15
_080396D2:
	strb r3, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _080396D2
	adds r1, r2, #0
	adds r1, #0x80
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	movs r0, #0
	strb r0, [r1]
	bl UpdateAllPhaseHealingAIStatus
	bl SetupUnitInventoryAIFlags
	ldr r0, _08039714  @ gUnknown_085A7F5C
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039708: .4byte gUnknown_0203AA04
_0803970C: .4byte gUnknown_080D8538
_08039710: .4byte gUnknown_0202BCF0
_08039714: .4byte gUnknown_085A7F5C

	THUMB_FUNC_START sub_8039718
sub_8039718: @ 0x08039718
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08039768  @ gUnknown_0203AA04
	adds r2, r0, #0
	adds r2, #0x7b
	movs r1, #4
	strb r1, [r2]
	adds r2, #3
	movs r1, #0xff
	strb r1, [r2]
	adds r1, r0, #0
	ldr r5, _0803976C  @ gUnknown_080D8538
	ldr r4, _08039770  @ gUnknown_0202BCF0
	movs r0, #0
	movs r3, #7
	adds r2, r1, #0
	adds r2, #0x8d
_0803973A:
	strb r0, [r2]
	subs r2, #1
	subs r3, #1
	cmp r3, #0
	bge _0803973A
	adds r1, #0x80
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r1]
	bl UpdateAllPhaseHealingAIStatus
	bl SetupUnitInventoryAIFlags
	ldr r0, _08039774  @ gUnknown_085A7F74
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039768: .4byte gUnknown_0203AA04
_0803976C: .4byte gUnknown_080D8538
_08039770: .4byte gUnknown_0202BCF0
_08039774: .4byte gUnknown_085A7F74

	THUMB_FUNC_START sub_8039778
sub_8039778: @ 0x08039778
	ldr r0, _08039784  @ gUnknown_0203AA04
	adds r0, #0x7b
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08039784: .4byte gUnknown_0203AA04

.align 2, 0
