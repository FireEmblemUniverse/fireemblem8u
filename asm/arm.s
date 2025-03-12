	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	.global ARMCodeToCopy_Start
ARMCodeToCopy_Start:

.LPal: .4byte gPaletteBuffer @ pool
.LFadeComponents: .4byte gFadeComponents @ pool
.LFadeComponentStep: .4byte gFadeComponentStep @ pool

	ARM_FUNC_START ColorFadeTick
ColorFadeTick: @ 0x08000234
	push {r4, r5, r6, r7}

	@ r7 = start offset of next palette
    @ we start from the end, so palette 0x1F
	mov r7, 0x20 * 0x1F
.Lpal_loop:
	 @ r0 = gFadeComponentStep + pal_idx
	ldr r0, .LFadeComponentStep
	add r0, r0, r7, lsr #5

	@ r5 = component step for this palette
	ldrsb r5, [r0]

	@ skip if step is 0
	tst r5, r5
	beq .Lpal_loop_continue

	ldr r4, .LFadeComponents

	@ r4 = r4 + 0x30 + r7 * 1.5
	lsr r0, r7, #1
	add r0, r0, r0, lsl #1
	add r0, r0, #0x30
	add r4, r4, r0

	@ r6 = start offset of next color
    @ starting from the end again
	mov r6, #0x1e
.Lcolor_loop:
	sub r4, r4, #3

	@ the clamp compares could be made branchless with some conditional operations
    @ eg: subs r0, 0x20 ; movlo r0, 0 ; cmp r0, 0x20 ; movhs r0, 

	@ get, update and clamp red component (r0)
	ldrb r0, [r4]
	add r0, r0, r5
	strb r0, [r4]
	subs r0, r0, #0x20
	bpl 1f
	mov r0, #0
1:
	cmp r0, #0x20
	blo 1f
	mov r0, #0x1f
1:

	@ get, update and clamp green component (r1)
	ldrb r1, [r4, #1]
	add r1, r1, r5
	strb r1, [r4, #1]
	subs r1, r1, #0x20
	bpl 1f
	mov r1, #0
1:
	cmp r1, #0x20
	blo 1f
	mov r1, #0x1f
1:

	@ get, update and clamp blue component (r2)
	ldrb r2, [r4, #2]
	add r2, r2, r5
	strb r2, [r4, #2]
	subs r2, r2, #0x20
	bpl 1f
	mov r2, #0
1:
	cmp r2, #0x20
	blo 1f
	mov r2, #0x1f
1:

	@ get combined RGB5 color value
	add r0, r0, r1, lsl #5
	add r0, r0, r2, lsl #10

	@ store updated color to pal buffer
	ldr r1, .LPal
	add r1, r1, r6
	strh r0, [r1, r7]
	subs r6, r6, #2
	bpl .Lcolor_loop
.Lpal_loop_continue:
	subs r7, r7, #0x20
	bpl .Lpal_loop
	pop {r4, r5, r6, r7}
	bx lr

	ARM_FUNC_END ColorFadeTick

@ void ClearOam(void * buf, int count);
	ARM_FUNC_START ClearOam
ClearOam: @ 0x08000304
	lsr r1, r1, #4
	sub r1, r1, #1		@ count = count / 16 - 1

	@ set the y-coordinate of each OBJ to 160, which moves it offscreen
	@ This loop is unrolled to set 16 OBJs each iteration
	mov r2, #160
1:
	str r2, [r0, 8 * 0]
	str r2, [r0, 8 * 1]
	str r2, [r0, 8 * 2]
	str r2, [r0, 8 * 3]
	str r2, [r0, 8 * 4]
	str r2, [r0, 8 * 5]
	str r2, [r0, 8 * 6]
	str r2, [r0, 8 * 7]
	str r2, [r0, 8 * 8]
	str r2, [r0, 8 * 9]
	str r2, [r0, 8 * 10]
	str r2, [r0, 8 * 11]
	str r2, [r0, 8 * 12]
	str r2, [r0, 8 * 13]
	str r2, [r0, 8 * 14]
	str r2, [r0, 8 * 15]
	add r0, r0, 8 * 16
	subs r1, r1, #1
	bpl 1b
	bx lr

	ARM_FUNC_END ClearOam

/*
u32 Checksum32(const u32 * buf, int size)
{
	int i;
	for (i = 0; i < size / 4; i++)
	{
		add_acc += data_u32[i];
		xor_acc ^= data_u32[i];
	}
	return (u16)add_acc + ((u16)xor_acc << 0x10);
}
*/
	ARM_FUNC_START Checksum32
Checksum32: @ 0x08000360
	push {r4, r5, r6, r7}
	sub r1, r1, #2		@ r1 = len
	mov r2, #0			@ r2 = add_acc
	mov r3, #0			@ r3 = xor_acc
1:
	ldrh r4, [r0]
	add r2, r2, r4		@ r2 = add_acc += data_u32[i]
	eor r3, r3, r4		@ r3 = xor_acc ^= data_u32[i]
	add r0, r0, #2
	subs r1, r1, #2
	bpl 1b

	mov r0, #0x10000
	sub r0, r0, #1		@ 0xFFFF
	and r2, r2, r0
	lsl r3, r3, #0x10
	mov r0, r2
	add r0, r0, r3		@ return (u16)add_acc + ((u16)xor_acc << 0x10)
	pop {r4, r5, r6, r7}
	bx lr

	ARM_FUNC_END Checksum32

/*
void TmFillRect(u16 * dest, int width, int height, int fillValue)
{
	int i, j;
	for (i = 0; i < height; i++)
		for (j = 0; j < width; j++)
			dst[j + 0x20 * i] = fillValue;
}
*/
	ARM_FUNC_START TmFillRect
TmFillRect: @ 0x080003A8
	push {r4, r5, r6, r7}
	mov r4, r0
	sub r6, r2, #0
  1:
	sub r5, r1, #0
  2:
	strh r3, [r4]
	add r4, r4, #2
	subs r5, r5, #1		@ decrement width counter
	bpl 2b
	add r0, r0, #0x40
	mov r4, r0
	subs r6, r6, #1		@ decrement height counter
	bpl 1b
	pop {r4, r5, r6, r7}
	bx lr

	ARM_FUNC_END TmFillRect

/*
void TmCopyRect(u16 * src, u16 * dst, int width, int height)
{
	int i, j;
	for (i = 0; i < height; i++)
		for (j = 0; j < width; j++)
			dst[j + 0x20 * i] = src[j + 0x20 * i];
}
*/
	ARM_FUNC_START TmCopyRect
TmCopyRect: @ 0x080003E0
	push {r4, r5, r6, r7}
	tst r2, r2
	beq .LCopyRectEnd
	bmi .LCopyRectEnd
	tst r3, r3
	beq .LCopyRectEnd
	bmi .LCopyRectEnd
	mov r4, #0x40
	sub r4, r4, r2, lsl #1
	sub r6, r3, #1
1:
	sub r5, r2, #1
2:
	@ *dst++ = *src++
	ldrh r7, [r0]
	strh r7, [r1]
	add r0, r0, #2
	add r1, r1, #2
	subs r5, r5, #1
	bpl 2b
	add r0, r0, r4
	add r1, r1, r4
	subs r6, r6, #1
	bpl 1b
.LCopyRectEnd:
	pop {r4, r5, r6, r7}
	bx lr

	ARM_FUNC_END TmCopyRect

/*
struct TillMapArrangement {
	u8 width, height;
	u16 data[];
};

void TmApplyTsa(u16 * tilemap, const void * _tsa, int tileref)
{
	const struct TillMapArrangement * tsa = _tsa;
	int width  = tsa->width;
	int height = tsa->height;
	u16 * src  = tsa->data;
	u16 * dst  = TILEMAP_LOCATED(tilemap, height, 0); // dest is set from the bottom to top

	int w, h;
	for (h = 0; h < height; h++)
	{
		for (w = 0; w < width; w++)
			*dst++ = *src++;

		dst = dst - width - 1 - 0x20;
	}
}
*/
	ARM_FUNC_START TmApplyTsa
TmApplyTsa: @ 0x0800043C
	push {r4, r5, r6, r7}
	ldrb r3, [r1]		@ r3 = width  = tsa->width
	ldrb r4, [r1, #1]	@ r4 = height = tsa->height
	add r1, r1, #2		@ r1 = src    = tsa->data
	lsl r7, r4, #6
	add r0, r0, r7		@ dst  = TILEMAP_LOCATED(tilemap, height, 0);
	mov r6, r4
1:
	mov r5, r3
2:
	ldrh r7, [r1]
	add r7, r7, r2
	strh r7, [r0]
	add r0, r0, #2
	add r1, r1, #2
	subs r5, r5, #1
	bpl 2b
	sub r0, r0, r3, lsl #1
	sub r0, r0, #0x42
	subs r6, r6, #1
	bpl 1b
	pop {r4, r5, r6, r7}
	bx lr

	.align 2, 0
	ARM_FUNC_END TmApplyTsa

@ void PutOamHi(int x, int y, u16 const * oam_list, int oam2)
.LOamHiPutIt: .4byte gOamHiPutIt @ pool
	ARM_FUNC_START PutOamHi
PutOamHi: @ 0x08000494
	push {r4, r5, r6, r7}
	ldr r7, .LOamHiPutIt
.LPutOamExt:
	ldr r5, [r7]				@ r5 = dst
	ldrh r4, [r2]				@ r4 = count = *oam_list;
	tst r4, r4
	beq .LPutOamEnd
	bmi .LPutOamEnd
	add r2, r2, #2				@ src = oam_list + 1;
	add r6, r5, r4, lsl #3
	str r6, [r7]				@ *pdst = *pdst + count;
	mov r7, #0x10000
	sub r7, r7, #1
	and r0, r0, r7
	and r1, r1, r7
	orr r0, r0, r1, lsl #16
.LPutOamLoop:
	@ ATTR0 = src[0]
	@ ATTR0::Y = y
	ldrh r1, [r2]
	orr r6, r1, r0, lsr #16
	and r6, r6, #0xff00
	add r7, r1, r0, lsr #16
	and r7, r7, #0xff
	orr r6, r6, r7
	strh r6, [r5]

	@ ATTR1 = src[1]
	@ ATTR1::X = x
	ldrh r1, [r2, #2]
	orr r6, r1, r0
	and r6, r6, #0xfe00
	add r7, r1, r0
	lsl r7, r7, #0x17
	lsr r7, r7, #0x17
	orr r6, r6, r7
	strh r6, [r5, #2]

	@ ATTR2 = src[2] + oam2
	ldrh r1, [r2, #4]
	add r6, r1, r3
	strh r6, [r5, #4]

	add r2, r2, #6		@ src = src + 3;
	add r5, r5, #8		@ dst++;
	subs r4, r4, #1
	bne .LPutOamLoop
.LPutOamEnd:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	ARM_FUNC_END PutOamHi

.LOamLoPutIt: .4byte gOamLoPutIt @ pool

@ void PutOamLo(int x, int y, u16 const * oam_list, int oam2)
	ARM_FUNC_START PutOamLo
PutOamLo: @ 0x08000534
	push {r4, r5, r6, r7}
	ldr r7, .LOamLoPutIt
	b .LPutOamExt
	ARM_FUNC_END PutOamLo

bitTable:
	.4byte (1 << 0)
	.4byte (1 << 2)
	.4byte (1 << 4)
	.4byte (1 << 6)
	.4byte (1 << 8)
	.4byte (1 << 10)
	.4byte (1 << 12)
	.4byte (1 << 14)

lt_bitTable: .4byte bitTable @ pool

@ void DrawGlyph(u16 * pal, u32 * dst, u32 * src, int subx)
	ARM_FUNC_START DrawGlyph
DrawGlyph: @ 0x08000564
	push {r4, r5, r6, r7, r8, r9, sl}
	mov r9, #0xf
	mov sl, #0x10000
	sub sl, sl, #1
_08000574:
	@ u64 ref = src[i] * (1 << subx);
	ldr r4, lt_bitTable  @ bitTable
	ldr r5, [r4, r3, lsl #2]
	ldr r4, [r2]
	umull r5, r6, r4, r5

	mov r7, r5
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r5, #8
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1]
	orr r4, r4, r7
	str r4, [r1]

	lsr r7, r5, #0x10
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r5, #0x18
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1, #0x40]
	orr r4, r4, r7
	str r4, [r1, #0x40]

	mov r7, r6
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r6, #8
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1, #0x80]
	orr r4, r4, r7
	str r4, [r1, #0x80]

	add r1, r1, #4
	add r2, r2, #4
	subs r9, r9, #1
	bpl _08000574
	pop {r4, r5, r6, r7, r8, r9, sl}
	bx lr

	ARM_FUNC_END DrawGlyph

	ARM_FUNC_START sub_8000620
sub_8000620: @ 0x08000620
	push {r4, r5, r6, r7, r8, r9, sl}
	mov r9, #7
	mov sl, #0x10000
	sub sl, sl, #1
_08000630:
	ldr r4, lt_bitTable  @ gUnknown_08000540
	ldr r5, [r4, r3, lsl #2]
	ldr r4, [r2]
	umull r5, r6, r4, r5
	mov r7, r5
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r5, #8
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1]
	orr r4, r4, r7
	str r4, [r1]
	lsr r7, r5, #0x10
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r5, #0x18
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1, #0x40]
	orr r4, r4, r7
	str r4, [r1, #0x20]
	mov r7, r6
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r6, #8
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1, #0x80]
	orr r4, r4, r7
	str r4, [r1, #0x40]
	add r1, r1, #4
	add r2, r2, #4
	subs r9, r9, #1
	bpl _08000630
	pop {r4, r5, r6, r7, r8, r9, sl}
	bx lr

	.align 2, 0
.LMsgHuffmanTableRoot: .4byte gMsgHuffmanTableRoot
.LMsgHuffmanTable: .4byte gMsgHuffmanTable

	ARM_FUNC_END sub_8000620

	ARM_FUNC_START DecodeString
DecodeString: @ 0x080006E4
	push {r4, r5, r6, r7}
	sub r3, r3, r3
	ldr r5, .LMsgHuffmanTable
	ldr r7, .LMsgHuffmanTableRoot
	ldr r7, [r7]
_080006F8:
	mov r4, r7
_080006FC:
	subs r3, r3, #1
	bpl _08000710
	ldrb r2, [r0]
	add r0, r0, #1
	mov r3, #7
_08000710:
	tst r2, #1
	beq _08000720
	ldrh r6, [r4, #2]
	b _08000724
_08000720:
	ldrh r6, [r4]
_08000724:
	add r4, r5, r6, lsl #2
	lsr r2, r2, #1
	ldr r6, [r4]
	tst r6, r6
	bpl _080006FC
	tst r6, #0xff00
	beq _08000754
	strb r6, [r1]
	lsr r6, r6, #8
	strb r6, [r1, #1]
	add r1, r1, #2
	b _080006F8
_08000754:
	strb r6, [r1]
	tst r6, #0xff
	beq _08000768
	add r1, r1, #1
	b _080006F8
_08000768:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
.LWorkingTerrainMoveCosts: .4byte gWorkingTerrainMoveCosts @ pool
.LMovMapFillState: .4byte gMovMapFillState @ pool
.LWorkingBmMap: .4byte gWorkingBmMap @ pool
.LBmMapTerrain: .4byte gBmMapTerrain @ pool
.LBmMapUnit: .4byte gBmMapUnit @ pool

	ARM_FUNC_END DecodeString

/*
void MapFloodCoreStep(int connexion, int xPos, int yPos)
{
	u8 uid1, uid2;
	struct MovMapFillState * st = &gMovMapFillState;
	int xsrc = st->src->xPos;
	int xdst = xsrc + xPos;
	int ysrc = st->src->yPos;
	int ydst = ysrc + yPos;
	u32 cost = gWorkingTerrainMoveCosts[gBmMapTerrain[ydst][xdst]] + gWorkingBmMap[y1][xsrc];

	if (cost > gWorkingBmMap[ydst][xdst])
		return;

	uid1 = st->hasUnit;
	uid2 = gBmMapUnit[ydst][xdst];
	if (uid1 && uid2 && (uid1 ^ uid2) & 0x80) // not allied
		return;

	if (cost > st->movement)
		return;

	st->dst->xPos = xdst;
	st->dst->yPos = ydst;
	st->dst->connexion = connexion;
	st->dst->leastMoveCost = cost;
	sr->dst++;

	gWorkingBmMap[ydst][xdst] = cost;
}
*/
	ARM_FUNC_START MapFloodCoreStep
MapFloodCoreStep: @ 0x08000784
	push {r4, r5, r6, r7, r8, r9, sl}
	ldr r3, .LMovMapFillState
	ldr r4, [r3]
	ldrb r5, [r4]
	add r1, r1, r5
	ldrb r6, [r4, #1]
	add r2, r2, r6
	ldr r7, .LBmMapTerrain
	ldr r7, [r7]
	ldr r7, [r7, r2, lsl #2]
	ldrb r7, [r7, r1]
	ldr r8, .LWorkingTerrainMoveCosts
	ldrb sl, [r8, r7]
	ldr r7, .LWorkingBmMap
	ldr r7, [r7]
	ldr r9, [r7, r6, lsl #2]
	ldrb r9, [r9, r5]
	add sl, sl, r9
	ldr r9, [r7, r2, lsl #2]
	ldrb r9, [r9, r1]
	cmp sl, r9
	bhs .LMapFloodCoreStepEnd
	ldrb r4, [r3, #8]
	tst r4, r4
	beq _08000810
	ldr r7, .LBmMapUnit
	ldr r7, [r7]
	ldr r7, [r7, r2, lsl #2]
	ldrb r7, [r7, r1]
	tst r7, r7
	beq _08000810
	ldrb r4, [r3, #0xa]
	eor r4, r4, r7
	ands r4, r4, #0x80
	bne .LMapFloodCoreStepEnd
_08000810:
	ldrb r4, [r3, #9]
	cmp sl, r4
	bhi .LMapFloodCoreStepEnd
	ldr r4, [r3, #4]
	strb r1, [r4]
	strb r2, [r4, #1]
	strb r0, [r4, #2]
	strb sl, [r4, #3]
	add r4, r4, #4
	str r4, [r3, #4]
	ldr r7, .LWorkingBmMap
	ldr r7, [r7]
	ldr r7, [r7, r2, lsl #2]
	strb sl, [r7, r1]
.LMapFloodCoreStepEnd:
	pop {r4, r5, r6, r7, r8, r9, sl}
	bx lr
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

	ARM_FUNC_END MapFloodCoreStep

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
	ldr r5, .LMovMapFillState  @ gMovMapFillState
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
