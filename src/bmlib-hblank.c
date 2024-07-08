#include "global.h"
#include "bmlib.h"
#include "spline.h"
#include "hardware.h"

int sub_8014CA4(int timer, int speed, int a, int b)
{
    return sub_800A42C(DivArm(speed, timer * 0x1000), a, b);
}

void HBlank_8014CC4(void)
{
    int bg;
    u16 vcount = REG_VCOUNT + 1;

    if (vcount == 228)
        vcount = 0;

    if (vcount < DISPLAY_HEIGHT)
    {
        if (gUnknown_03004990->unk_79D)
        {
            u16 * src = gUnknown_03004990->buf + gUnknown_03004990->unk_79C * 480;
            for (bg = 0; bg < 3; bg++)
            {
                if (gUnknown_03004990->dst[bg])
                {
                    *gUnknown_03004990->dst[bg] = vcount[src + 160 * bg]; // ¿
                }
            }
        }
    }
    else if (vcount == DISPLAY_HEIGHT)
    {
        if (gUnknown_03004990->unk_79E)
        {
            gUnknown_03004990->unk_79D = true;
            gUnknown_03004990->unk_79C = gUnknown_03004990->unk_79B;

            for (bg = 0; bg < 3; bg++)
            {
                gUnknown_03004990->dst[bg] = gUnknown_03004990->src[bg];
            }
        }
        else
        {
            gUnknown_03004990->unk_79D = false;
        }
    }
}

#if NONMATCHING

void sub_8014DA8(struct Unknown03004990 * buf)
{
    int bg;
    gUnknown_03004990 = buf;

    for (bg = 0; bg < 3; bg++)
    {
        gUnknown_03004990->unk_798[bg] = 0;

        gUnknown_03004990->dst[bg] = NULL;
        gUnknown_03004990->src[bg] = NULL;
    }

    gUnknown_03004990->unk_79B = 0;
    gUnknown_03004990->unk_79C = 0;
    gUnknown_03004990->unk_79D = false;
    gUnknown_03004990->unk_79E = false;

    SetPrimaryHBlankHandler(NULL);
    SetPrimaryHBlankHandler(HBlank_8014CC4);
}

#else

/* https://decomp.me/scratch/isCOG */
NAKEDFUNC
void sub_8014DA8(struct Unknown03004990 * buf)
{
asm("\
	.syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6, r7}\n\
	ldr r1, _08014E24  @ gUnknown_03004990\n\
	str r0, [r1]\n\
	movs r3, #0\n\
	adds r6, r1, #0\n\
	adds r5, r6, #0\n\
	movs r0, #0xf3\n\
	lsls r0, r0, #3\n\
	mov r8, r0\n\
	movs r4, #0\n\
	ldr r1, _08014E28  @ 0x0000078C\n\
	mov ip, r1\n\
	movs r2, #0xf0\n\
	lsls r2, r2, #3\n\
	mov r9, r2\n\
_08014DCC:\n\
	ldr r0, [r5]\n\
	add r0, r8\n\
	adds r0, r0, r3\n\
	strb r4, [r0]\n\
	ldr r0, [r5]\n\
	lsls r2, r3, #2\n\
	mov r7, ip\n\
	adds r1, r0, r7\n\
	adds r1, r1, r2\n\
	add r0, r9\n\
	adds r0, r0, r2\n\
	str r4, [r0]\n\
	str r4, [r1]\n\
	adds r3, #1\n\
	cmp r3, #2\n\
	ble _08014DCC\n\
	ldr r0, [r6]\n\
	ldr r1, _08014E2C  @ 0x0000079B\n\
	adds r2, r0, r1\n\
	movs r1, #0\n\
	strb r1, [r2]\n\
	ldr r2, _08014E30  @ 0x0000079C\n\
	adds r0, r0, r2\n\
	strb r1, [r0]\n\
	ldr r0, [r6]\n\
	ldr r7, _08014E34  @ 0x0000079D\n\
	adds r0, r0, r7\n\
	strb r1, [r0]\n\
	ldr r0, [r6]\n\
	adds r2, #2\n\
	adds r0, r0, r2\n\
	strb r1, [r0]\n\
	movs r0, #0\n\
	bl SetPrimaryHBlankHandler\n\
	ldr r0, _08014E38  @ HBlank_8014CC4\n\
	bl SetPrimaryHBlankHandler\n\
	pop {r3, r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4, r5, r6, r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08014E24: .4byte gUnknown_03004990\n\
_08014E28: .4byte 0x0000078C\n\
_08014E2C: .4byte 0x0000079B\n\
_08014E30: .4byte 0x0000079C\n\
_08014E34: .4byte 0x0000079D\n\
_08014E38: .4byte HBlank_8014CC4\n\
	.syntax divided\n\
");
}

#endif

void sub_8014E3C(void)
{
    SetPrimaryHBlankHandler(NULL);
    CpuFill16(0, gUnknown_03004990->buf, sizeof(gUnknown_03004990->buf));
    gUnknown_03004990->unk_79E = 0;
}

u16 * sub_8014E74(int bg, int flip)
{
    int frame =  (gUnknown_03004990->unk_79B + flip) & 1;
    u16 * tm = gUnknown_03004990->buf + frame * 480;
    return tm + bg * 160;
}

void sub_8014EA8(void)
{
    gUnknown_03004990->unk_79B ^= 1;
}

void sub_8014EC4(int index, void * pr_offset)
{
    gUnknown_03004990->src[index] = pr_offset;
}

void sub_8014EDC(int index)
{
    gUnknown_03004990->src[index] = NULL;
}

void sub_8014EF4(int index)
{
    gUnknown_03004990->unk_798[index] &= 3;
}

void sub_8014F10(int index)
{
    gUnknown_03004990->unk_798[index] = (gUnknown_03004990->unk_798[index] & 3) | 1;
}

void sub_8014F30(int index)
{
    gUnknown_03004990->unk_798[index] = (gUnknown_03004990->unk_798[index] & 3) | 2;
}
