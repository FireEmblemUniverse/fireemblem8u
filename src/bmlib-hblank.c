#include "global.h"
#include "bmlib.h"
#include "spline.h"
#include "hardware.h"

void HBlank_BgVerticalScroll(void)
{
    int i;
    u16 vcount = REG_VCOUNT + 1;

    if (vcount == 228)
        vcount = 0;

    if (vcount < DISPLAY_HEIGHT)
    {
        if (gpBgVerticalScrollSt->updating)
        {
            u16 * src = gpBgVerticalScrollSt->buf + gpBgVerticalScrollSt->frame * 480;
            for (i = 0; i < 3; i++)
                if (gpBgVerticalScrollSt->dst[i])
                    *gpBgVerticalScrollSt->dst[i] = vcount[src + DISPLAY_HEIGHT * i]; // ¿
        }
		return;
    }

    if (vcount == DISPLAY_HEIGHT)
    {
        if (gpBgVerticalScrollSt->scroll_en)
        {
            gpBgVerticalScrollSt->updating = true;
            gpBgVerticalScrollSt->frame = gpBgVerticalScrollSt->frame_flip;

            for (i = 0; i < 3; i++)
                gpBgVerticalScrollSt->dst[i] = gpBgVerticalScrollSt->src[i];
        }
        else
            gpBgVerticalScrollSt->updating = false;
    }
}

void StartBgVerticalScroll(struct BgVerticalScrollSt * buf)
{
    int i;
    gpBgVerticalScrollSt = buf;

    for (i = 0; i < 3; i++)
    {
        gpBgVerticalScrollSt->unk_798[i] = 0;

        gpBgVerticalScrollSt->dst[i] = gpBgVerticalScrollSt->src[i] = NULL;
    }

    gpBgVerticalScrollSt->frame = gpBgVerticalScrollSt->frame_flip = 0;
    
    gpBgVerticalScrollSt->updating = false;
    gpBgVerticalScrollSt->scroll_en = false;

    SetPrimaryHBlankHandler(NULL);
    SetPrimaryHBlankHandler(HBlank_BgVerticalScroll);
}

void EndBgVerticalScroll(void)
{
    SetPrimaryHBlankHandler(NULL);
    CpuFill16(0, gpBgVerticalScrollSt->buf, sizeof(gpBgVerticalScrollSt->buf));
    gpBgVerticalScrollSt->scroll_en = false;
}

u16 * GetBgVerticalScrollBuffer(int i, int flip)
{
    int frame =  (gpBgVerticalScrollSt->frame_flip + flip) & 1;
    u16 * tm = gpBgVerticalScrollSt->buf + frame * 480;
    return tm + i * DISPLAY_HEIGHT;
}

void FlipBgVerticalScroll(void)
{
    gpBgVerticalScrollSt->frame_flip ^= 1;
}

void SetBgVerticalScrollPosition(int index, void * pr_offset)
{
    gpBgVerticalScrollSt->src[index] = pr_offset;
}

void ResetBgVerticalScrollPosition(int index)
{
    gpBgVerticalScrollSt->src[index] = NULL;
}

void sub_8014EF4(int index)
{
    gpBgVerticalScrollSt->unk_798[index] &= 3;
}

void sub_8014F10(int index)
{
    gpBgVerticalScrollSt->unk_798[index] = (gpBgVerticalScrollSt->unk_798[index] & 3) | 1;
}

void sub_8014F30(int index)
{
    gpBgVerticalScrollSt->unk_798[index] = (gpBgVerticalScrollSt->unk_798[index] & 3) | 2;
}
