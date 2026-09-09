	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

@ ColorFadeTick and its preceding pool are generated from matching C.

@ ClearOam and Checksum32 are linked here from src/arm/.
	.section .text.after_checksum32, "ax", %progbits

@ TmFillRect is linked here from matching C.

@ TmCopyRect is linked here from matching C.

@ TmApplyTsa is linked here from src/arm/tm_apply_tsa.c.
	.section .text.after_tm_apply_tsa, "ax", %progbits

@ PutOamHi and its pointer pool are generated from matching C.
.LOamLoPutIt: .4byte gOamLoPutIt @ pool

@ void PutOamLo(int x, int y, u16 const * oam_list, int oam2)
	ARM_FUNC_START PutOamLo
PutOamLo: @ 0x08000534
	push {r4, r5, r6, r7}
	ldr r7, .LOamLoPutIt
	b PutOamSharedBody
	ARM_FUNC_END PutOamLo

@ DrawGlyph and its shift table/pointer pool are generated from matching C.
	.section .text.after_draw_glyph, "ax", %progbits

@ DecodeString and its preceding pointers are generated from matching C.

@ MapFloodCoreStep and its shared pointer pool are generated from C.
	.section .text.after_map_flood_step, "ax", %progbits

@ Following literals and dispatch entries belong to the shared flood code.
	.align 2, 0
.LMovMapFillStPool1: .4byte gMovMapFillStPool1 @ pool
.LMovMapFillStPool2: .4byte gMovMapFillStPool2 @ pool

_08000858:
	b _08000994
	b _080009C8
	b _08000960
	b _0800092C
	b _08000A14
	b _080008E8

	.4byte _08000858



/*
void MapFloodCore(void)
{
	int i = 0;
	while (1)
	{
		i = i ^ 1;
		if (i)
		{
			gMovMapFillState.src = gMovMapFillStPool1;
			gMovMapFillState.dst = gMovMapFillStPool2;
		}
		else
		{
			gMovMapFillState.src = gMovMapFillStPool2;
			gMovMapFillState.dst = gMovMapFillStPool1;
		}

		// 4 is the terminator
		if (gMovMapFillState.src->connexion == 4)
			return;

		while (1)
		{
			switch (gMovMapFillState.src->connexion) {
			case 3:
				MapFloodCoreStep(3, 0, -1);
				MapFloodCoreStep(0, -1, 0);
				MapFloodCoreStep(1, 1, 0);
				break;

			case 2:
				MapFloodCoreStep(2, 0, 1);
				MapFloodCoreStep(0, -1, 0);
				MapFloodCoreStep(1, 1, 0);
				break;

			case 0:
				MapFloodCoreStep(3, 0, -1);
				MapFloodCoreStep(2, 0, 1);
				MapFloodCoreStep(0, -1, 0);
				break;

			case 1:
				MapFloodCoreStep(3, 0, -1);
				MapFloodCoreStep(2, 0, 1);
				MapFloodCoreStep(1, 1, 0);
				break;

			case 4:
				goto break_internal_loop;

			case 5:
				MapFloodCoreStep(3, 0, -1);
				MapFloodCoreStep(2, 0, 1);
				MapFloodCoreStep(0, -1, 0);
				MapFloodCoreStep(1, 1, 0);
				break;
			}

			gMovMapFillState.dst->connexion = 4;
			gMovMapFillState.src++;
		}
		break_internal_loop:
	}
}
*/
	ARM_FUNC_START MapFloodCore
MapFloodCore: @ 0x08000874
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r5, [pc, #:pc_g0:(MapFloodCoreStepPool + 4 - 8)] @ shared gMovMapFillState pointer
.LMapFloodCoreLoop:
	eors r4, r4, #1
	beq _0800089C
	ldr r0, .LMovMapFillStPool1  @ gMovMapFillStPool1
	str r0, [r5]
	ldr r0, .LMovMapFillStPool2  @ gMovMapFillStPool2
	str r0, [r5, #4]
	b _080008AC
_0800089C:
	ldr r0, .LMovMapFillStPool2  @ gMovMapFillStPool2
	str r0, [r5]
	ldr r0, .LMovMapFillStPool1  @ gMovMapFillStPool1
	str r0, [r5, #4]
_080008AC:
	ldr r6, [r5]
	ldrb r6, [r6, #2]
	cmp r6, #4
	beq _08000A18
_080008BC:
	ldr r6, [r5]
	ldrb r6, [r6, #2]
	mov r0, pc
	add r0, r0, #8
	add r0, r0, r6, lsl #2
	bx r0
	b _08000994
	b _080009C8
	b _08000960
	b _0800092C
	b _08000A14
_080008E8:
	mov r0, #3
	mov r1, #0
	mvn r2, #0
	bl MapFloodCoreStep
	mov r0, #2
	mov r1, #0
	mov r2, #1
	bl MapFloodCoreStep
	mov r0, #0
	mvn r1, #0
	mov r2, #0
	bl MapFloodCoreStep
	mov r0, #1
	mov r1, #1
	mov r2, #0
	bl MapFloodCoreStep
	b _080009F8
_0800092C:
	mov r0, #3
	mov r1, #0
	mvn r2, #0
	bl MapFloodCoreStep
	mov r0, #0
	mvn r1, #0
	mov r2, #0
	bl MapFloodCoreStep
	mov r0, #1
	mov r1, #1
	mov r2, #0
	bl MapFloodCoreStep
	b _080009F8
_08000960:
	mov r0, #2
	mov r1, #0
	mov r2, #1
	bl MapFloodCoreStep
	mov r0, #0
	mvn r1, #0
	mov r2, #0
	bl MapFloodCoreStep
	mov r0, #1
	mov r1, #1
	mov r2, #0
	bl MapFloodCoreStep
	b _080009F8
_08000994:
	mov r0, #3
	mov r1, #0
	mvn r2, #0
	bl MapFloodCoreStep
	mov r0, #2
	mov r1, #0
	mov r2, #1
	bl MapFloodCoreStep
	mov r0, #0
	mvn r1, #0
	mov r2, #0
	bl MapFloodCoreStep
	b _080009F8
_080009C8:
	mov r0, #3
	mov r1, #0
	mvn r2, #0
	bl MapFloodCoreStep
	mov r0, #2
	mov r1, #0
	mov r2, #1
	bl MapFloodCoreStep
	mov r0, #1
	mov r1, #1
	mov r2, #0
	bl MapFloodCoreStep
_080009F8:
	ldr r6, [r5, #4]
	mov r0, #4
	strb r0, [r6, #2]
	ldr r6, [r5]
	add r6, r6, #4
	str r6, [r5]
	b _080008BC
_08000A14:
	b .LMapFloodCoreLoop
_08000A18:
	pop {r4, r5, r6, lr}
	bx lr
	ARM_FUNC_END MapFloodCore

	.global ARMCodeToCopy_End
ARMCodeToCopy_End:
