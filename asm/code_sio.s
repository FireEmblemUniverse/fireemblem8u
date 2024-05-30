	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Everything related to link arena multiplayer stuff

	@ Needs further splitting, but since I know nothing about
	@ all this, this will have to wait.

	THUMB_FUNC_START sub_8045930
sub_8045930: @ 0x08045930
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r1
	mov sl, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r4, r3, #0
	movs r2, #0
	ldr r1, _08045964  @ gSioResultRankings
_0804594C:
	ldr r0, [r1]
	lsrs r0, r0, #5
	cmp r0, r4
	bcs _08045968
	adds r7, r2, #0
	movs r2, #9
	lsls r3, r3, #5
	str r3, [sp, #4]
	cmp r2, r7
	ble _080459E4
	b _08045976
	.align 2, 0
_08045964: .4byte gSioResultRankings
_08045968:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #9
	ble _0804594C
	movs r0, #1
	negs r0, r0
	b _08045A48
_08045976:
	ldr r6, _08045A58  @ gSioResultRankings
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r5, r1, r6
	subs r2, #1
	mov r8, r2
	lsls r4, r2, #2
	add r4, r8
	lsls r4, r4, #2
	adds r4, r4, r6
	ldrb r2, [r4]
	lsls r2, r2, #0x1e
	lsrs r2, r2, #0x1e
	ldrb r3, [r5]
	movs r0, #4
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	ldr r3, [r4]
	lsrs r3, r3, #5
	lsls r3, r3, #5
	ldr r0, [r5]
	movs r2, #0x1f
	ands r0, r2
	orrs r0, r3
	str r0, [r5]
	ldrb r0, [r4]
	movs r2, #0xc
	ands r2, r0
	ldrb r3, [r5]
	movs r0, #0xd
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	ldrb r2, [r4]
	movs r3, #0x10
	ands r3, r2
	movs r2, #0x11
	negs r2, r2
	ands r0, r2
	orrs r0, r3
	strb r0, [r5]
	adds r0, r6, #0
	subs r0, #0x10
	adds r0, r1, r0
	adds r6, #4
	adds r1, r1, r6
	bl SioStrCpy
	mov r2, r8
	cmp r2, r7
	bgt _08045976
_080459E4:
	ldr r5, _08045A58  @ gSioResultRankings
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r4, r1, r5
	movs r6, #3
	ldr r2, [sp]
	ands r2, r6
	ldrb r3, [r4]
	movs r0, #4
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	ldr r0, [r4]
	movs r2, #0x1f
	ands r0, r2
	ldr r2, [sp, #4]
	orrs r0, r2
	str r0, [r4]
	mov r3, r9
	ands r3, r6
	lsls r3, r3, #2
	ldrb r2, [r4]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	movs r2, #1
	mov r3, sl
	ands r3, r2
	lsls r3, r3, #4
	movs r2, #0x11
	negs r2, r2
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	ldr r0, _08045A5C  @ gSioSt
	ldr r0, [r0]
	movs r2, #6
	ldrsb r2, [r0, r2]
	lsls r0, r2, #4
	subs r0, r0, r2
	ldr r2, _08045A60  @ gUnk_Sio_0203DAC5
	adds r0, r0, r2
	adds r5, #4
	adds r1, r1, r5
	bl SioStrCpy
	adds r0, r7, #0
_08045A48:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045A58: .4byte gSioResultRankings
_08045A5C: .4byte gSioSt
_08045A60: .4byte gUnk_Sio_0203DAC5

	THUMB_FUNC_END sub_8045930

	THUMB_FUNC_START sub_8045A64
sub_8045A64: @ 0x08045A64
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r1, _08045AD0  @ gLinkArenaSt
	adds r0, r1, #0
	adds r0, #0xec
	ldrb r5, [r0]
	lsls r5, r5, #0x1e
	lsrs r5, r5, #0x1f
	adds r1, #0xa0
	ldrb r6, [r1]
	subs r6, #1
	bl sub_8049A60
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08045AD4  @ gUnk_Sio_0203DD90
	ldr r0, _08045AD8  @ gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r0, _08045ADC  @ gSioResultRankings
	mov r8, r0
	bl ReadMultiArenaSaveRankings
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	mov r3, r9
	bl sub_8045930
	str r0, [r7, #0x58]
	mov r0, r8
	bl WriteMultiArenaSaveRankings
	ldr r1, [r7, #0x58]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _08045AE0
	adds r0, r1, #0
	adds r1, r7, #0
	bl StartSioResultNewHighScore
	b _08045AE6
	.align 2, 0
_08045AD0: .4byte gLinkArenaSt
_08045AD4: .4byte gUnk_Sio_0203DD90
_08045AD8: .4byte gSioSt
_08045ADC: .4byte gSioResultRankings
_08045AE0:
	movs r0, #1
	bl Sound_FadeOutBGM
_08045AE6:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8045A64

	THUMB_FUNC_START sub_8045AF4
sub_8045AF4: @ 0x08045AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08045B78  @ gUnknown_080D9E44
	mov r0, sp
	movs r2, #3
	bl memcpy
	bl InitUnits
	movs r6, #0
	ldr r1, _08045B7C  @ gLinkArenaSt
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _08045BCC
	mov r9, r1
_08045B1C:
	lsls r4, r6, #6
	adds r4, #1
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	mov r0, r9
	adds r0, #6
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r2, r6, #4
	subs r2, r2, r6
	ldr r1, _08045B80  @ gUnk_Sio_0203DAC5
	adds r2, r2, r1
	adds r1, r5, #0
	bl ReadMultiArenaSaveTeam
	movs r7, #0
	adds r0, r6, #1
	mov sl, r0
	lsls r0, r6, #1
	ldr r1, _08045B84  @ gUnk_Sio_0203DDB4
	adds r0, r0, r1
	mov r8, r0
_08045B4C:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	strb r0, [r5, #9]
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	movs r1, #0
	strb r1, [r5, #0x1b]
	ldr r0, _08045B88  @ gSioSaveConfig
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08045B8C
	adds r0, r5, #0
	bl sub_80431B4
	b _08045B92
	.align 2, 0
_08045B78: .4byte gUnknown_080D9E44
_08045B7C: .4byte gLinkArenaSt
_08045B80: .4byte gUnk_Sio_0203DAC5
_08045B84: .4byte gUnk_Sio_0203DDB4
_08045B88: .4byte gSioSaveConfig
_08045B8C:
	adds r0, r5, #0
	bl sub_804D40C
_08045B92:
	cmp r7, #0
	bne _08045BA0
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	mov r1, r8
	strh r0, [r1]
_08045BA0:
	strb r4, [r5, #0xb]
	cmp r6, #0
	beq _08045BB8
	ldr r0, _08045C04  @ gSioSaveConfig
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08045BB8
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_08045BB8:
	adds r4, #1
	adds r7, #1
	cmp r7, #4
	ble _08045B4C
	mov r6, sl
	mov r1, r9
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt _08045B1C
_08045BCC:
	ldr r0, _08045C08  @ gUnk_Sio_0203DD90
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08045C0C  @ gSioSt
	ldr r0, [r2]
	strb r1, [r0, #6]
	ldr r3, [r2]
	ldr r1, _08045C10  @ gLinkArenaSt
	ldrb r0, [r1, #5]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldr r2, [r2]
	ldrb r0, [r1, #5]
	adds r0, #2
	strb r0, [r2, #7]
	ldrb r0, [r1, #5]
	adds r0, #2
	adds r1, #0xa0
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045C04: .4byte gSioSaveConfig
_08045C08: .4byte gUnk_Sio_0203DD90
_08045C0C: .4byte gSioSt
_08045C10: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8045AF4

	THUMB_FUNC_START New6C_SIOMAIN2
New6C_SIOMAIN2: @ 0x08045C14
	push {lr}
	ldr r0, _08045C24  @ ProcScr_SIOMAIN2
	movs r1, #2
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08045C24: .4byte ProcScr_SIOMAIN2

	THUMB_FUNC_END New6C_SIOMAIN2

	THUMB_FUNC_START sub_8045C28
sub_8045C28: @ 0x08045C28
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08045C60  @ ProcScr_SIOMAIN2
	bl Proc_Find
	cmp r0, #0
	bne _08045C5A
	ldr r5, _08045C64  @ gLinkArenaSt
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne _08045C46
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08045C46:
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	bne _08045C54
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_08045C54:
	adds r0, r4, #0
	bl Proc_Break
_08045C5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045C60: .4byte ProcScr_SIOMAIN2
_08045C64: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8045C28

	THUMB_FUNC_START sub_8045C68
sub_8045C68: @ 0x08045C68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl SetInitTalkTextFont
	bl ClearTalkText
	bl ResetTextFont
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r6, #0
	bl StartTalkExt
	movs r0, #1
	bl SetTalkPrintColor
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkPrintDelay
	movs r0, #1
	bl SetActiveTalkFace
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8045C68

	THUMB_FUNC_START sub_8045CBC
sub_8045CBC: @ 0x08045CBC
	push {lr}
	ldr r0, _08045CD4  @ ProcScr_SIOVSYNC
	bl Proc_EndEach
	ldr r0, _08045CD8  @ ProcScr_SIOMAIN
	bl Proc_EndEach
	ldr r0, _08045CDC  @ ProcScr_SIOCON
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08045CD4: .4byte ProcScr_SIOVSYNC
_08045CD8: .4byte ProcScr_SIOMAIN
_08045CDC: .4byte ProcScr_SIOCON

	THUMB_FUNC_END sub_8045CBC

	THUMB_FUNC_START sub_8045CE0
sub_8045CE0: @ 0x08045CE0
	push {lr}
	bl SioReleaseIrq
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8045CE0

	THUMB_FUNC_START sub_8045CEC
sub_8045CEC: @ 0x08045CEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _08045D68  @ gLinkArenaSt
	mov r9, r0
	movs r0, #0x98
	lsls r0, r0, #2
	mov r8, r0
	movs r0, #0xa1
	add r0, r9
	mov sl, r0
	movs r7, #5
_08045D0C:
	mov r0, r9
	adds r0, #0x9c
	adds r5, r6, r0
	ldr r0, _08045D6C  @ gSioSt
	ldr r0, [r0]
	adds r0, #0xb
	adds r0, r0, r6
	ldrb r1, [r0]
	ldrb r0, [r5]
	cmp r0, r1
	beq _08045D9C
	strb r1, [r5]
	lsls r0, r6, #3
	mov r1, r9
	adds r1, #0xc
	adds r4, r0, r1
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldrb r0, [r5]
	cmp r0, #4
	bhi _08045D78
	ldr r1, _08045D70  @ gUnknown_080D9D34
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	bl PutDrawTextCentered
	ldr r0, _08045D74  @ gUnknown_085ADDA8
	mov r1, r8
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _08045D96
	.align 2, 0
_08045D68: .4byte gLinkArenaSt
_08045D6C: .4byte gSioSt
_08045D70: .4byte gUnknown_080D9D34
_08045D74: .4byte gUnknown_085ADDA8
_08045D78:
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	mov r3, sl
	bl PutDrawTextCentered
	lsls r0, r6, #5
	ldr r1, _08045DBC  @ Pal_TacticianSelObj
	adds r0, r0, r1
	mov r1, r8
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08045D96:
	movs r0, #1
	bl BG_EnableSyncByMask
_08045D9C:
	movs r0, #0x20
	add r8, r0
	movs r0, #0xf
	add sl, r0
	adds r7, #3
	adds r6, #1
	cmp r6, #3
	ble _08045D0C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045DBC: .4byte Pal_TacticianSelObj

	THUMB_FUNC_END sub_8045CEC

	THUMB_FUNC_START sub_8045DC0
sub_8045DC0: @ 0x08045DC0
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	bl ClearSioBG
	bl InitSioBG
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl StartMuralBackgroundExt
	ldr r0, _08045ECC  @ Img_TacticianSelObj
	ldr r1, _08045ED0  @ 0x06014800
	bl Decompress
	ldr r0, _08045ED4  @ Img_LinkArenaPlayerBanners
	ldr r1, _08045ED8  @ 0x06016000
	bl Decompress
	ldr r0, _08045EDC  @ gUnknown_085AC604
	ldr r1, _08045EE0  @ 0x06016800
	bl Decompress
	movs r4, #0x98
	lsls r4, r4, #2
	movs r5, #3
_08045DFC:
	ldr r0, _08045EE4  @ gUnknown_085ADDA8
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08045DFC
	ldr r4, _08045EE8  @ gLinkArenaSt
	ldrb r0, [r4, #3]
	add r1, sp, #4
	bl ReadMultiArenaSaveTeamName
	ldr r0, _08045EEC  @ Font_0203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_8043164
	movs r5, #0
	adds r4, #0x9c
	movs r2, #0xff
_08045E30:
	adds r1, r5, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #3
	ble _08045E30
	bl sub_8045CEC
	movs r5, #0
	ldr r2, _08045EF0  @ gUnknown_03004E86
_08045E46:
	adds r0, r5, r2
	mov r1, sp
	adds r1, r1, r5
	adds r1, #4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0xe
	ble _08045E46
	movs r0, #0
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r6, #0
	bl sub_804C2EC
	movs r0, #0x50
	movs r1, #0x20
	adds r2, r6, #0
	bl sub_804D664
	str r0, [r6, #0x2c]
	ldr r0, _08045EF4  @ gUnknown_085A9864
	bl SetupFaceGfxData
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x64
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	ldr r0, [r6, #0x2c]
	ldr r2, _08045EF8  @ gUnknown_080D9D5E
	ldr r1, _08045EE8  @ gLinkArenaSt
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl NewProc085AA980
	bl sub_804C508
	ldr r0, [r6, #0x30]
	movs r1, #0xe9
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #1
	bl sub_8043100
	ldr r2, _08045EFC  @ gLCDControlBuffer
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
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045ECC: .4byte Img_TacticianSelObj
_08045ED0: .4byte 0x06014800
_08045ED4: .4byte Img_LinkArenaPlayerBanners
_08045ED8: .4byte 0x06016000
_08045EDC: .4byte gUnknown_085AC604
_08045EE0: .4byte 0x06016800
_08045EE4: .4byte gUnknown_085ADDA8
_08045EE8: .4byte gLinkArenaSt
_08045EEC: .4byte Font_0203DB64
_08045EF0: .4byte gUnknown_03004E86
_08045EF4: .4byte gUnknown_085A9864
_08045EF8: .4byte gUnknown_080D9D5E
_08045EFC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8045DC0

	THUMB_FUNC_START sub_8045F00
sub_8045F00: @ 0x08045F00
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08045F38  @ 0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _08045F3C  @ ProcScr_SIOVSYNC
	movs r1, #0
	bl Proc_Start
	ldr r0, _08045F40  @ ProcScr_SIOMAIN
	adds r1, r4, #0
	bl Proc_Start
	ldr r0, _08045F44  @ ProcScr_SIOCON
	adds r1, r4, #0
	bl Proc_Start
	movs r1, #1
	negs r1, r1
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045F38: .4byte 0x00002586
_08045F3C: .4byte ProcScr_SIOVSYNC
_08045F40: .4byte ProcScr_SIOMAIN
_08045F44: .4byte ProcScr_SIOCON

	THUMB_FUNC_END sub_8045F00

	THUMB_FUNC_START sub_8045F48
sub_8045F48: @ 0x08045F48
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0
	ldr r5, [r4, #0x2c]
	ldr r0, _08045F88  @ gUnk_Sio_0203DD28
	str r1, [r0]
	mov r0, sp
	strb r1, [r0]
	bl sub_8045CEC
	ldr r0, _08045F8C  @ ProcScr_SIOCON
	bl Proc_Find
	cmp r0, #0
	beq _08045F94
	ldr r0, _08045F90  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08045F7A
	b _0804618A
_08045F7A:
	movs r0, #1
	bl SioPlaySoundEffect
	bl sub_804C31C
	b _08045FEE
	.align 2, 0
_08045F88: .4byte gUnk_Sio_0203DD28
_08045F8C: .4byte ProcScr_SIOCON
_08045F90: .4byte gKeyStatusPtr
_08045F94:
	ldr r0, _08046000  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08045FBC
	movs r0, #1
	bl SioPlaySoundEffect
	bl sub_804C31C
	bl sub_8045CBC
	bl sub_8045CE0
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_08045FBC:
	ldr r0, _08046004  @ gSioSt
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	str r1, [r5, #0x34]
	movs r1, #0
	adds r7, r0, #0
	adds r2, #0x1a
_08045FCC:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08045FD6
	adds r6, #1
_08045FD6:
	adds r1, #1
	cmp r1, #3
	ble _08045FCC
	adds r5, r7, #0
	ldr r0, [r5]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _08046008
_08045FEE:
	bl sub_8045CBC
	bl sub_8045CE0
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _0804618A
	.align 2, 0
_08046000: .4byte gKeyStatusPtr
_08046004: .4byte gSioSt
_08046008:
	bl sub_80421E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804601E
	ldr r1, [r5]
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bhi _0804601E
	cmp r6, #0
	beq _08046046
_0804601E:
	bl sub_8045CBC
	bl sub_8045CE0
	adds r0, r4, #0
	bl sub_8045F00
	movs r0, #0
	str r0, [r4, #0x30]
	movs r0, #0xe9
	lsls r0, r0, #3
	movs r1, #1
	bl sub_8043100
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_804C2EC
	b _0804618A
_08046046:
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080460DC
	bl sub_804226C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080460DC
	ldr r0, [r4, #0x30]
	cmp r0, #2
	beq _0804606C
	movs r0, #2
	str r0, [r4, #0x30]
	ldr r0, _080460CC  @ 0x0000074A
	movs r1, #1
	bl sub_8043100
_0804606C:
	ldr r0, _080460D0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080460EE
	bl sub_804C31C
	ldr r0, [r7]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r1, #0
	adds r3, r7, #0
	movs r2, #0
_0804608E:
	ldr r0, [r3]
	adds r0, #0x1a
	adds r0, r0, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	ble _0804608E
	movs r0, #2
	bl SioPlaySoundEffect
	bl sub_804213C
	ldr r2, _080460D4  @ gSioSt
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _080460D8  @ gLinkArenaSt
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_8042AF4
	mov r1, sp
	movs r0, #0x18
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl SioEmitData
	str r0, [r4, #0x34]
	b _08046150
	.align 2, 0
_080460CC: .4byte 0x0000074A
_080460D0: .4byte gKeyStatusPtr
_080460D4: .4byte gSioSt
_080460D8: .4byte gLinkArenaSt
_080460DC:
	ldr r0, [r4, #0x30]
	cmp r0, #1
	beq _080460EE
	movs r0, #1
	str r0, [r4, #0x30]
	ldr r0, _08046158  @ 0x00000749
	movs r1, #1
	bl sub_8043100
_080460EE:
	ldr r5, _0804615C  @ gSioSt
	ldr r1, [r5]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08046164
	ldrb r0, [r1, #6]
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046164
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046164
	bl sub_804C31C
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r1, #0
	adds r3, r5, #0
	movs r2, #0
_0804612A:
	ldr r0, [r3]
	adds r0, #0x1a
	adds r0, r0, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	ble _0804612A
	bl sub_804213C
	ldr r2, _0804615C  @ gSioSt
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _08046160  @ gLinkArenaSt
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_8042AF4
_08046150:
	adds r0, r4, #0
	bl Proc_Break
	b _0804618A
	.align 2, 0
_08046158: .4byte 0x00000749
_0804615C: .4byte gSioSt
_08046160: .4byte gLinkArenaSt
_08046164:
	bl GetGameClock
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _0804618A
	ldr r0, _08046194  @ gUnknown_03004E80
	movs r1, #0x8c
	strb r1, [r0]
	ldr r1, _08046198  @ gSioSt
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0x16
	bl SioSend
_0804618A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046194: .4byte gUnknown_03004E80
_08046198: .4byte gSioSt

	THUMB_FUNC_END sub_8045F48

	THUMB_FUNC_START sub_804619C
sub_804619C: @ 0x0804619C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8045CEC
	ldr r1, _080461F4  @ gUnk_Sio_0203DD28
	ldr r0, [r1]
	adds r3, r0, #1
	str r3, [r1]
	ldr r0, _080461F8  @ gLinkArenaSt
	adds r0, #0xa0
	ldr r1, _080461FC  @ gSioSt
	ldr r2, [r1]
	ldrb r0, [r0]
	ldrb r1, [r2, #7]
	cmp r0, r1
	bne _080461C4
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r3, r0
	ble _08046200
_080461C4:
	bl sub_8045CBC
	bl sub_8045CE0
	adds r0, r4, #0
	bl sub_8045F00
	movs r0, #0
	str r0, [r4, #0x30]
	movs r0, #0xe9
	lsls r0, r0, #3
	movs r1, #1
	bl sub_8043100
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_804C2EC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08046220
	.align 2, 0
_080461F4: .4byte gUnk_Sio_0203DD28
_080461F8: .4byte gLinkArenaSt
_080461FC: .4byte gSioSt
_08046200:
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08046228
	ldr r1, [r4, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2, #9]
	ands r0, r1
	cmp r0, r1
	bne _0804622E
_08046220:
	adds r0, r4, #0
	bl Proc_Break
	b _0804622E
_08046228:
	adds r0, r4, #0
	bl Proc_Break
_0804622E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804619C

	THUMB_FUNC_START sub_8046234
sub_8046234: @ 0x08046234
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _080462C8  @ 0x00000749
	movs r1, #1
	bl sub_8043100
	ldr r0, _080462CC  @ gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080462B4
	bl GetGameClock
	ldr r4, _080462D0  @ gLinkArenaSt
	adds r5, r4, #0
	adds r5, #0xa0
	ldrb r1, [r5]
	bl __umodsi3
	adds r6, r7, #0
	adds r6, #0x3b
	strb r0, [r6]
	bl AdvanceGetLCGRNValue
	ldrb r2, [r5]
	movs r1, #3
	ands r1, r0
	adds r1, #4
	adds r3, r2, #0
	muls r3, r1, r3
	ldrb r0, [r6]
	adds r3, r3, r0
	adds r0, r7, #0
	adds r0, #0x39
	strb r3, [r0]
	mov r2, sp
	adds r4, #0xec
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r2, #1]
	mov r0, sp
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #2]
	mov r1, sp
	ldrb r0, [r6]
	strb r0, [r1, #3]
	mov r0, sp
	strb r3, [r0, #4]
	adds r0, #6
	bl StoreRNState
	mov r0, sp
	movs r1, #0x10
	bl SioEmitData
	str r0, [r7, #0x34]
_080462B4:
	adds r0, r7, #0
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080462C8: .4byte 0x00000749
_080462CC: .4byte gSioSt
_080462D0: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8046234

	THUMB_FUNC_START sub_80462D4
sub_80462D4: @ 0x080462D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r7, [r5, #0x2c]
	ldr r0, _08046310  @ gSioSt
	ldr r2, [r0]
	movs r4, #6
	ldrsb r4, [r2, r4]
	cmp r4, #0
	bne _08046318
	ldr r1, [r5, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _08046398
	ldr r0, _08046314  @ 0x0000074E
	movs r1, #1
	bl sub_8043100
	str r4, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
	b _08046398
	.align 2, 0
_08046310: .4byte gSioSt
_08046314: .4byte 0x0000074E
_08046318:
	bl GetGameClock
	movs r1, #0x26
	bl __umodsi3
	adds r6, r0, #0
	cmp r6, #0
	bne _08046398
	add r1, sp, #0x10
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046398
	ldr r4, _080463A0  @ gLinkArenaSt
	mov r0, sp
	adds r4, #0xec
	movs r3, #1
	ldrb r1, [r0]
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #1]
	ands r1, r3
	lsls r1, r1, #2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #2]
	ands r1, r3
	lsls r1, r1, #1
	adds r2, #2
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r5, #0
	adds r1, #0x3b
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #4]
	subs r1, #2
	strb r0, [r1]
	mov r0, sp
	adds r0, #6
	bl LoadRNState
	ldr r0, _080463A4  @ 0x0000074E
	movs r1, #1
	bl sub_8043100
	str r6, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
_08046398:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080463A0: .4byte gLinkArenaSt
_080463A4: .4byte 0x0000074E

	THUMB_FUNC_END sub_80462D4

	THUMB_FUNC_START sub_80463A8
sub_80463A8: @ 0x080463A8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls _0804644C
	movs r0, #0
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x3a
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _08046428  @ gLinkArenaSt
	adds r1, #0xa0
	ldrb r0, [r4]
	ldrb r1, [r1]
	bl __umodsi3
	strb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r0, _0804642C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080463FC
	movs r0, #0x7d
	bl m4aSongNumStart
_080463FC:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0804644C
	adds r1, r6, #0
	adds r1, #0x3b
	ldrb r2, [r1]
	ldr r0, _08046430  @ gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r2, r0
	beq _08046434
	movs r1, #0xea
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r1, #1
	bl sub_8043100
	b _0804643C
	.align 2, 0
_08046428: .4byte gLinkArenaSt
_0804642C: .4byte gPlaySt
_08046430: .4byte gSioSt
_08046434:
	ldr r0, _08046454  @ 0x0000074F
	movs r1, #1
	bl sub_8043100
_0804643C:
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r1, _08046458  @ gUnk_Sio_0203DD90
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0804644C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046454: .4byte 0x0000074F
_08046458: .4byte gUnk_Sio_0203DD90

	THUMB_FUNC_END sub_80463A8

	THUMB_FUNC_START sub_804645C
sub_804645C: @ 0x0804645C
	push {lr}
	ldr r0, _08046474  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08046470
	movs r0, #0x7e
	bl m4aSongNumStart
_08046470:
	pop {r0}
	bx r0
	.align 2, 0
_08046474: .4byte gPlaySt

	THUMB_FUNC_END sub_804645C

	THUMB_FUNC_START sub_8046478
sub_8046478: @ 0x08046478
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	strb r4, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	strb r4, [r5, #0x1b]
	ldr r0, _080464A0  @ gLinkArenaSt
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080464A4
	adds r0, r5, #0
	bl sub_80431B4
	b _080464AA
	.align 2, 0
_080464A0: .4byte gLinkArenaSt
_080464A4:
	adds r0, r5, #0
	bl sub_804D40C
_080464AA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8046478

	THUMB_FUNC_START sub_80464B0
sub_80464B0: @ 0x080464B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	ldr r0, _0804656C  @ gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #6
	adds r0, #1
	mov r8, r0
	ldr r1, _08046570  @ gUnk_Sio_0203DD28
	movs r0, #0
	str r0, [r1]
	bl InitUnits
	ldr r0, _08046574  @ gLinkArenaSt
	ldrb r0, [r0, #3]
	ldr r4, _08046578  @ gUnknown_085A9884
	ldr r1, [r4]
	bl ReadMultiArenaSaveTeamRaw
	movs r6, #0
	ldr r0, _0804657C  @ gUnk_Sio_0203DDB4
	mov sl, r0
	movs r7, #0x10
_080464EA:
	mov r1, r8
	adds r4, r1, r6
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	ldr r1, _08046578  @ gUnknown_085A9884
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_8046478
	strb r4, [r5, #0xb]
	cmp r6, #0
	bne _08046528
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r1, _0804656C  @ gSioSt
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	add r1, sl
	strh r0, [r1]
_08046528:
	adds r7, #0x24
	adds r6, #1
	cmp r6, #4
	ble _080464EA
	ldr r2, _0804656C  @ gSioSt
	mov r3, r9
	adds r3, #0x64
	mov r4, r9
	adds r4, #0x4c
	ldr r0, _08046574  @ gLinkArenaSt
	movs r1, #0
	movs r6, #3
	adds r0, #0x9f
_08046542:
	strb r1, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge _08046542
	ldr r2, [r2]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	movs r1, #0
	strb r0, [r2, #0xa]
	strh r1, [r3]
	strh r1, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804656C: .4byte gSioSt
_08046570: .4byte gUnk_Sio_0203DD28
_08046574: .4byte gLinkArenaSt
_08046578: .4byte gUnknown_085A9884
_0804657C: .4byte gUnk_Sio_0203DDB4

	THUMB_FUNC_END sub_80464B0

	THUMB_FUNC_START sub_8046580
sub_8046580: @ 0x08046580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	movs r0, #0
	mov sl, r0
	mov r0, r8
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080465B0
	ldr r0, _080466EC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080465B0
	movs r0, #0x7c
	bl m4aSongNumStart
_080465B0:
	mov r1, r8
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _080465C6
	movs r0, #0
	strh r0, [r1]
_080465C6:
	mov r4, r8
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bgt _08046606
	ldr r2, _080466F0  @ gUnknown_085A9884
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0x28
	bl SioEmitData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	str r0, [r1, #0x58]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	ldr r1, _080466F4  @ gLinkArenaSt
	ldr r0, _080466F8  @ gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x9c
	adds r0, r0, r1
	strb r2, [r0]
_08046606:
	bl GetGameClock
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _080466DA
	add r6, sp, #0x24
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046696
	ldrb r0, [r6]
	lsls r4, r0, #6
	adds r4, #1
	ldr r1, _080466F4  @ gLinkArenaSt
	mov r9, r1
	mov r7, r9
	adds r7, #0x9c
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r4, r0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	mov r0, sp
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_8046478
	ldrb r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r0, r4
	strb r0, [r5, #0xb]
	ldrb r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046678
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r2, _080466FC  @ gUnk_Sio_0203DD90
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r2, #0x24
	adds r1, r1, r2
	strh r0, [r1]
_08046678:
	mov r0, r9
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0804668C
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_0804668C:
	ldrb r1, [r6]
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08046696:
	movs r4, #0
	ldr r5, _08046700  @ gUnk_Sio_0203DAC0
_0804669A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080466BA
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080466BA
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_080466BA:
	adds r4, #1
	cmp r4, #3
	ble _0804669A
	mov r0, sl
	cmp r0, #0
	bne _080466DA
	ldr r0, _080466F8  @ gSioSt
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	mov r0, r8
	bl Proc_Break
_080466DA:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080466EC: .4byte gPlaySt
_080466F0: .4byte gUnknown_085A9884
_080466F4: .4byte gLinkArenaSt
_080466F8: .4byte gSioSt
_080466FC: .4byte gUnk_Sio_0203DD90
_08046700: .4byte gUnk_Sio_0203DAC0

	THUMB_FUNC_END sub_8046580

	THUMB_FUNC_START sub_8046704
sub_8046704: @ 0x08046704
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08046724
	ldr r0, _08046798  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08046724
	movs r0, #0x7c
	bl m4aSongNumStart
_08046724:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r6, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _0804673A
	strh r6, [r1]
_0804673A:
	ldr r0, _0804679C  @ gUnk_Sio_0203DD28
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r1, r0
	ble _0804674E
	bl StartSioErrorScreen
_0804674E:
	ldr r0, _080467A0  @ gSioMsgBuf
	movs r1, #0x89
	strb r1, [r0]
	ldr r4, _080467A4  @ gSioSt
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r6, [r0, #2]
	movs r1, #4
	bl SioSend
	ldr r4, [r4]
	ldr r1, [r5, #0x58]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r4, #9]
	ldrb r2, [r0]
	cmp r2, r1
	bne _08046790
	ldrb r0, [r4, #0xa]
	ands r0, r1
	cmp r0, r2
	bne _08046790
	ldr r0, _080467A8  @ gUnknown_085A93A0
	bl Proc_EndEach
	adds r0, r5, #0
	bl Proc_Break
_08046790:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046798: .4byte gPlaySt
_0804679C: .4byte gUnk_Sio_0203DD28
_080467A0: .4byte gSioMsgBuf
_080467A4: .4byte gSioSt
_080467A8: .4byte gUnknown_085A93A0

	THUMB_FUNC_END sub_8046704

	THUMB_FUNC_START sub_80467AC
sub_80467AC: @ 0x080467AC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl ClearSioBG
	bl InitSioBG
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl StartMuralBackgroundExt
	bl sub_804D6B4
	movs r0, #3
	bl EndFaceById
	ldr r4, _08046828  @ gUnk_Sio_0203DA78
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r5, _0804682C  @ 0x0000077D
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	movs r0, #0x60
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _08046830  @ gBG2TilemapBuffer+0x312
	adds r0, r4, #0
	bl PutText
	ldr r0, _08046834  @ gUnknown_085A93A0
	adds r1, r6, #0
	bl Proc_Start
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046828: .4byte gUnk_Sio_0203DA78
_0804682C: .4byte 0x0000077D
_08046830: .4byte gBG2TilemapBuffer+0x312
_08046834: .4byte gUnknown_085A93A0

	THUMB_FUNC_END sub_80467AC

	THUMB_FUNC_START sub_8046838
sub_8046838: @ 0x08046838
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r9, r0
	bl ClearSioBG
	bl InitSioBG
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl StartMuralBackgroundExt
	ldr r4, _0804696C  @ Img_LinkArenaRankIcons
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08046970  @ 0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08046974  @ Pal_LinkArenaRankIcons
	movs r1, #0xc0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08046978  @ Img_TacticianSelObj
	ldr r1, _0804697C  @ 0x06014800
	bl Decompress
	ldr r0, _08046980  @ Pal_TacticianSelObj
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	movs r0, #0
	bl sub_804C3A4
	ldr r0, _08046984  @ gUnknown_085AE778
	ldr r4, _08046988  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r0, _0804698C  @ gBG2TilemapBuffer+0x142
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _08046990  @ Font_0203DB64
	bl SetTextFont
	bl ResetTextFont
	bl sub_8043164
	bl sub_804CEB0
	add r0, sp, #4
	bl LoadLinkArenaRuleSettings
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl BG_SetPosition
	movs r5, #0
	movs r7, #0xc0
	lsls r7, r7, #1
	ldr r6, _08046994  @ gLinkArenaRuleData
_080468D4:
	lsls r4, r5, #3
	ldr r0, _08046998  @ gLinkArenaSt+0x0C
	mov r8, r0
	add r4, r8
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r6]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0804699C  @ gBG0TilemapBuffer+0x00C
	adds r1, r7, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r5
	adds r0, #4
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_80476CC
	adds r7, #0xc0
	adds r6, #0x14
	adds r5, #1
	cmp r5, #2
	ble _080468D4
	ldr r5, _08046994  @ gLinkArenaRuleData
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _080469A0  @ gBG1TilemapBuffer+0x23C
	adds r0, r0, r4
	movs r1, #0
	bl DrawLinkArenaModeIcon
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl DrawLinkArenaModeIcon
	ldr r1, _080469A4  @ gUnknown_080D9D5E
	mov r0, r8
	subs r0, #0xc
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r0, r9
	movs r2, #0
	bl NewProc085AA980
	bl sub_804C508
	ldr r0, _080469A8  @ 0x0000074B
	movs r1, #1
	bl sub_8043100
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804696C: .4byte Img_LinkArenaRankIcons
_08046970: .4byte 0x06000F00
_08046974: .4byte Pal_LinkArenaRankIcons
_08046978: .4byte Img_TacticianSelObj
_0804697C: .4byte 0x06014800
_08046980: .4byte Pal_TacticianSelObj
_08046984: .4byte gUnknown_085AE778
_08046988: .4byte gGenericBuffer
_0804698C: .4byte gBG2TilemapBuffer+0x142
_08046990: .4byte Font_0203DB64
_08046994: .4byte gLinkArenaRuleData
_08046998: .4byte gLinkArenaSt+0x0C
_0804699C: .4byte gBG0TilemapBuffer+0x00C
_080469A0: .4byte gBG1TilemapBuffer+0x23C
_080469A4: .4byte gUnknown_080D9D5E
_080469A8: .4byte 0x0000074B

	THUMB_FUNC_END sub_8046838

	THUMB_FUNC_START sub_80469AC
sub_80469AC: @ 0x080469AC
	push {lr}
	movs r0, #3
	bl sub_8042980
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80469AC

	THUMB_FUNC_START sub_80469B8
sub_80469B8: @ 0x080469B8
	push {lr}
	movs r0, #0
	bl sub_8042980
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80469B8

	THUMB_FUNC_START sub_80469C4
sub_80469C4: @ 0x080469C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x6c
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x54]
	bl ClearSioBG
	bl InitSioBG
	ldr r1, [sp, #0x54]
	str r1, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl StartMuralBackgroundExt
	ldr r0, _08046AB8  @ Img_TacticianSelObj
	ldr r1, _08046ABC  @ 0x06014800
	bl Decompress
	ldr r0, _08046AC0  @ Font_0203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_804C2EC
	ldr r4, _08046AC4  @ gSioTexts
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	ldr r0, _08046AC8  @ 0x0000074C
	movs r1, #0
	bl sub_8043100
	ldr r0, _08046ACC  @ 0x0000074D
	movs r1, #1
	bl sub_8043100
	movs r0, #1
	negs r0, r0
	str r0, [r7, #0x4c]
	movs r2, #2
	mov r9, r2
	mov r3, sp
	adds r3, #0x50
	str r3, [sp, #0x58]
	add r6, sp, #4
	movs r5, #8
	mov r4, sp
	adds r4, #0x52
_08046A4A:
	movs r0, #0
	strb r0, [r4]
	mov r0, r9
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046B34
	mov r0, r9
	add r1, sp, #4
	bl ReadGameSavePlaySt
	add r0, sp, #4
	bl sub_8089768
	adds r2, r7, #0
	adds r2, #0x2c
	adds r1, r2, r5
	str r0, [r1]
	ldrb r1, [r6, #0x14]
	movs r0, #0x40
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq _08046A84
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_08046A84:
	mov r0, sp
	adds r0, #0x46
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _08046AD0
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08046A9E
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
_08046A9E:
	ldrb r0, [r6, #0x1b]
	cmp r0, #2
	bne _08046AAC
	ldrb r0, [r4]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4]
_08046AAC:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne _08046AE4
	ldrb r0, [r4]
	movs r1, #0x40
	b _08046AE0
	.align 2, 0
_08046AB8: .4byte Img_TacticianSelObj
_08046ABC: .4byte 0x06014800
_08046AC0: .4byte Font_0203DB64
_08046AC4: .4byte gSioTexts
_08046AC8: .4byte 0x0000074C
_08046ACC: .4byte 0x0000074D
_08046AD0:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne _08046ADC
	ldrb r0, [r4]
	movs r1, #0x40
	b _08046AE0
_08046ADC:
	ldrb r0, [r4]
	movs r1, #0x20
_08046AE0:
	orrs r0, r1
	strb r0, [r4]
_08046AE4:
	add r0, sp, #4
	bl IsGameNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046B02
	adds r2, r7, #0
	adds r2, #0x38
	adds r1, r2, r5
	mov r3, sl
	adds r0, r3, r5
	ldr r0, [r0]
	str r0, [r1]
	mov r8, r2
	b _08046B10
_08046B02:
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r2, #1
	negs r2, r2
	str r2, [r0]
	mov r8, r1
_08046B10:
	mov r3, r8
	adds r0, r3, r5
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _08046B50
	ldr r2, [sp, #0x54]
	cmp r2, #0
	bne _08046B2E
	mov r3, r9
	str r3, [r7, #0x50]
	movs r0, #1
	str r0, [sp, #0x54]
	b _08046B50
_08046B2E:
	mov r1, r9
	str r1, [r7, #0x4c]
	b _08046B50
_08046B34:
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r2, r5
	mov r8, r3
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r3, #1
	negs r3, r3
	str r3, [r0]
	mov r0, r8
	str r3, [r0]
	mov sl, r2
	mov r8, r1
_08046B50:
	subs r5, #4
	subs r4, #1
	movs r1, #1
	negs r1, r1
	add r9, r1
	mov r2, r9
	cmp r2, #0
	blt _08046B62
	b _08046A4A
_08046B62:
	adds r0, r1, #0
	ldr r1, [r7, #0x4c]
	cmp r1, r0
	bne _08046B72
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x4c]
	str r0, [r7, #0x48]
	b _08046B74
_08046B72:
	str r1, [r7, #0x48]
_08046B74:
	movs r0, #0xd0
	lsls r0, r0, #1
	bl sub_8089678
	movs r3, #0
	mov r9, r3
	movs r0, #0xa0
	lsls r0, r0, #1
	str r0, [sp, #0x5c]
	mov r1, sl
	str r1, [sp, #0x60]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #0x64]
	ldr r6, [sp, #0x58]
	str r3, [sp, #0x68]
	movs r0, #0x88
	lsls r0, r0, #7
	mov sl, r0
_08046B9A:
	ldr r0, [sp, #0x68]
	add r0, r8
	ldr r1, [r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08046BB0
	ldrb r1, [r6]
	movs r0, #2
	orrs r0, r1
	strb r0, [r6]
_08046BB0:
	ldrb r1, [r6]
	movs r0, #1
	orrs r0, r1
	mov r4, r9
	adds r4, #4
	adds r1, r4, #0
	bl sub_80895B4
	ldrb r0, [r6]
	mov r5, r9
	adds r5, #7
	adds r1, r5, #0
	bl sub_80895B4
	ldr r0, _08046C58  @ gBG1TilemapBuffer+0x006
	ldr r1, [sp, #0x64]
	adds r0, r1, r0
	adds r1, r4, #0
	bl sub_8089720
	mov r2, sl
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	ldr r3, [sp, #0x60]
	ldm r3!, {r1}
	str r3, [sp, #0x60]
	bl sub_8089624
	ldr r0, _08046C5C  @ gBG0TilemapBuffer+0x006
	ldr r1, [sp, #0x5c]
	adds r0, r1, r0
	adds r1, r5, #0
	bl sub_80896D8
	ldr r2, [sp, #0x5c]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	str r2, [sp, #0x5c]
	ldr r0, [sp, #0x64]
	adds r0, r0, r3
	str r0, [sp, #0x64]
	adds r6, #1
	ldr r1, [sp, #0x68]
	adds r1, #4
	str r1, [sp, #0x68]
	movs r2, #0x80
	lsls r2, r2, #4
	add sl, r2
	movs r3, #1
	add r9, r3
	mov r0, r9
	cmp r0, #2
	ble _08046B9A
	ldr r2, _08046C60  @ gLCDControlBuffer
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
	adds r0, r7, #0
	movs r1, #1
	movs r2, #0
	bl NewProc085AA980
	bl sub_804C508
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0x6c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046C58: .4byte gBG1TilemapBuffer+0x006
_08046C5C: .4byte gBG0TilemapBuffer+0x006
_08046C60: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80469C4

	THUMB_FUNC_START sub_8046C64
sub_8046C64: @ 0x08046C64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08046CEC  @ gKeyStatusPtr
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08046CB2
	ldr r0, [r4]
	cmp r0, r6
	bgt _08046C94
	ldrh r3, [r3, #8]
	cmp r2, r3
	bne _08046CB2
_08046C94:
	subs r2, r7, #1
	movs r3, #1
	negs r3, r3
_08046C9A:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _08046CA6
	str r2, [r4]
_08046CA6:
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	beq _08046C9A
_08046CB2:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08046CE6
	ldr r0, [r4]
	cmp r0, ip
	blt _08046CCA
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _08046CE6
_08046CCA:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r1, r7, #0
	bl __modsi3
	str r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _08046CCA
_08046CE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046CEC: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8046C64

	THUMB_FUNC_START sub_8046CF0
sub_8046CF0: @ 0x08046CF0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x48]
	adds r0, #0x48
	ldr r1, [r6, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r6, #0x4c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x38
	movs r4, #3
	str r4, [sp]
	bl sub_8046C64
	ldr r1, [r6, #0x48]
	lsls r1, r1, #5
	adds r1, #0x28
	movs r0, #0x1c
	bl DisplayUiHand
	ldr r0, [r6, #0x48]
	cmp r5, r0
	beq _08046D2A
	movs r0, #3
	bl SioPlaySoundEffect
_08046D2A:
	ldr r4, _08046D68  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08046D44
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r6, #0
	bl Proc_Break
_08046D44:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08046D5E
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_08046D5E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046D68: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8046CF0

	THUMB_FUNC_START sub_8046D6C
sub_8046D6C: @ 0x08046D6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl ReadGameSave
	ldr r1, _08046DAC  @ gPlaySt
	ldrb r2, [r1, #0x14]
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	ldrb r2, [r1]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08046DB0  @ gLinkArenaSt
	ldr r0, [r4, #0x48]
	strb r0, [r1, #4]
	bl SetupMapSpritesPalettes
	bl sub_80496A4
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046DAC: .4byte gPlaySt
_08046DB0: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8046D6C

	THUMB_FUNC_START sub_8046DB4
sub_8046DB4: @ 0x08046DB4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046DCC  @ gLinkArenaSt
	ldrb r0, [r0, #3]
	cmp r0, #0xff
	bne _08046DC8
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_08046DC8:
	pop {r0}
	bx r0
	.align 2, 0
_08046DCC: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8046DB4

	THUMB_FUNC_START sub_8046DD0
sub_8046DD0: @ 0x08046DD0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046DE8  @ gLinkArenaSt
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne _08046DE4
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
_08046DE4:
	pop {r0}
	bx r0
	.align 2, 0
_08046DE8: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8046DD0

	THUMB_FUNC_START sub_8046DEC
sub_8046DEC: @ 0x08046DEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08046E08  @ ProcScr_AtMenu
	bl Proc_Find
	cmp r0, #0
	bne _08046E00
	adds r0, r4, #0
	bl Proc_Break
_08046E00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046E08: .4byte ProcScr_AtMenu

	THUMB_FUNC_END sub_8046DEC

	THUMB_FUNC_START sub_8046E0C
sub_8046E0C: @ 0x08046E0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08046E48  @ gUnk_Sio_0203DD24
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08046E40
	bl sub_804309C
	bl nullsub_13
	bl sub_804C4F8
	bl sub_804C590
	bl sub_804C31C
	bl BMapVSync_End
	bl StartPrepAtMenu
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08046E40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046E48: .4byte gUnk_Sio_0203DD24

	THUMB_FUNC_END sub_8046E0C

	THUMB_FUNC_START sub_8046E4C
sub_8046E4C: @ 0x08046E4C
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8046E4C

	.align 2, 0
