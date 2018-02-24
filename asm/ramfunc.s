	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START StoreRoutinesToIRAM
StoreRoutinesToIRAM: @ 0x08002AF8
	push {r4, r5, lr}
	ldr r2, _08002B54  @ ARMCodeToCopy_End
	ldr r4, _08002B58  @ ARMCodeToCopy_Start
	subs r2, r2, r4
	ldr r5, _08002B5C  @ gUnknown_03003750
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	adds r1, r5, #0
	bl CpuSet
	ldr r1, _08002B60  @ gUnknown_03003740
	ldr r0, _08002B64  @ IRAMARM_Func3_DrawGlyph
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B68  @ gUnknown_03004150
	ldr r0, _08002B6C  @ IRAMARM_DecompText
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B70  @ gUnknown_03003130
	ldr r0, _08002B74  @ IRAMARM_CopyToSecondaryOAM
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B78  @ gUnknown_03004154
	ldr r0, _08002B7C  @ IRAMARM_CopyToPrimaryOAM
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B80  @ gUnknown_03004960
	ldr r0, _08002B84  @ IRAMARM_Func5
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B88  @ gUnknown_03003128
	ldr r0, _08002B8C  @ IRAMARM_FillMovementMap
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002B54: .4byte ARMCodeToCopy_End
_08002B58: .4byte ARMCodeToCopy_Start
_08002B5C: .4byte gUnknown_03003750
_08002B60: .4byte gUnknown_03003740
_08002B64: .4byte IRAMARM_Func3_DrawGlyph
_08002B68: .4byte gUnknown_03004150
_08002B6C: .4byte IRAMARM_DecompText
_08002B70: .4byte gUnknown_03003130
_08002B74: .4byte IRAMARM_CopyToSecondaryOAM
_08002B78: .4byte gUnknown_03004154
_08002B7C: .4byte IRAMARM_CopyToPrimaryOAM
_08002B80: .4byte gUnknown_03004960
_08002B84: .4byte IRAMARM_Func5
_08002B88: .4byte gUnknown_03003128
_08002B8C: .4byte IRAMARM_FillMovementMap

	THUMB_FUNC_START CallARM_Func3
CallARM_Func3: @ 0x08002B90
	push {r4, lr}
	ldr r4, _08002BA0  @ gUnknown_03003740
	ldr r4, [r4]
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002BA0: .4byte gUnknown_03003740

	THUMB_FUNC_START CallARM_DecompText
CallARM_DecompText: @ 0x08002BA4
	push {lr}
	ldr r2, _08002BB4  @ gUnknown_03004150
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08002BB4: .4byte gUnknown_03004150

	THUMB_FUNC_START CallARM_PushToSecondaryOAM
CallARM_PushToSecondaryOAM: @ 0x08002BB8
	push {r4, lr}
	ldr r4, _08002BC8  @ gUnknown_03003130
	ldr r4, [r4]
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002BC8: .4byte gUnknown_03003130

	THUMB_FUNC_START CallARM_PushToPrimaryOAM
CallARM_PushToPrimaryOAM: @ 0x08002BCC
	push {r4, lr}
	ldr r4, _08002BDC  @ gUnknown_03004154
	ldr r4, [r4]
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002BDC: .4byte gUnknown_03004154

	THUMB_FUNC_START CallARM_Func5
CallARM_Func5: @ 0x08002BE0
	push {lr}
	ldr r3, _08002BF0  @ gUnknown_03004960
	ldr r3, [r3]
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_08002BF0: .4byte gUnknown_03004960

	THUMB_FUNC_START CallARM_FillMovementMap
CallARM_FillMovementMap: @ 0x08002BF4
	push {lr}
	ldr r0, _08002C04  @ gUnknown_03003128
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_08002C04: .4byte gUnknown_03003128
