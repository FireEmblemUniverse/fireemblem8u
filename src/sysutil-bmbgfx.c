#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sysutil.h"

//! FE8U = 0x080AE4D8
void BmBgfx_Init(struct ProcBmBgfx * proc)
{
    proc->conf = 0;
    proc->bg = 0;
    proc->vram_base = 0;
    proc->vram_free_space = 0;
    proc->vram_base_offset = 0;
    proc->size_per_fx = 0;
    proc->flip = 0;
    proc->timer = 0;
    proc->total_duration = 0;
    proc->counter_procloop = 0;
    proc->callback = 0;
    proc->func_call_type = 0;
    proc->counter_functioncall = 0;
    proc->x = 0;
    proc->y = 0;
    proc->loop_en = 1;
    proc->counter = 0;
}

//! FE8U = 0x080AE518
void BmBgfx_Loop(struct ProcBmBgfx * proc)
{
    struct BmBgxConf * conf = proc->conf;

    if (proc->callback != NULL)
    {
        proc->func_call_type = 0;
        if (proc->callback(proc) != 0)
            return;
    }
    else
    {
        proc->callback = NULL;
    }

    while (1)
    {
        if (conf->type == BMFX_CONFT_LOOP_START)
            conf++;

        /* Loop identifier */
        if (conf->type == BMFX_CONFT_LOOP)
        {
            if (proc->loop_en != false)
            {
                if (proc->counter == 0)
                    proc->counter = conf->duration;
                else if (proc->counter > 0)
                    proc->counter = proc->counter - 1;

                if (proc->counter != 0)
                {
                    int i;
                    struct BmBgxConf * conf_ = conf - 1;
                    for (i = conf_->type; i != BMFX_CONFT_LOOP_START; i = conf_->type)
                    {
                        conf = conf_;
                        conf_--;
                    }
                }
                else
                {
                    conf++;
                }
            }
            else
            {
                proc->counter = 0;
                conf++;
            }
        }

        if (conf->type == BMFX_CONFT_CALL_IDLE)
        {
            if (proc->callback != NULL)
            {
                proc->counter_functioncall++;
                proc->func_call_type = 1;
                proc->callback(proc);
            }
            conf++;
        }

        if (conf->type == BMFX_CONFT_BLOCKING)
            break;

        if (conf->type < 11 && conf->type > 8)
        {
            Proc_Break(proc);
            break;
        }

        if (proc->timer == 0)
        {
            switch (conf->type)
            {
                case BMFX_CONFT_IMG:
                case BMFX_CONFT_ZIMG:
                    if (proc->vram_free_space == 0)
                        proc->flip = 1 - proc->flip;
                    break;
            }

            switch (conf->type)
            {
                case BMFX_CONFT_IMG:
                    CpuFastCopy(
                        conf->data,
                        (void *)(0x6000000 + proc->vram_base + proc->vram_base_offset + proc->vram_free_space + proc->flip * proc->size_per_fx),
                        conf->size);

                    proc->vram_free_space = proc->vram_free_space + conf->size;
                    break;

                case BMFX_CONFT_ZIMG:
                    Decompress(
                        conf->data,
                        (void *)(0x6000000 + proc->vram_base + proc->vram_base_offset + proc->vram_free_space + proc->flip * proc->size_per_fx));

                    proc->vram_free_space = proc->vram_free_space + conf->size;

                    break;

                case BMFX_CONFT_TSA:
                    if (proc->size_per_fx == 0x8000)
                        SetBackgroundTileDataOffset(proc->bg, (proc->vram_base + (proc->flip << 0xf)) & 0xFFFF);

                    CallARM_FillTileRect(
                        BG_GetMapBuffer(proc->bg), conf->data,
                        (u16)((proc->pal_bank << 0xc) +
                              (((proc->vram_base_offset + proc->flip * proc->size_per_fx) << 0x11) >> 0x16)));

                    proc->vram_free_space = 0;
                    BG_EnableSyncByMask(1 << proc->bg);

                    break;

                case BMFX_CONFT_PAL:
                    ApplyPalettes(conf->data, proc->pal_bank, conf->size);
                    break;
            }
        }

        proc->timer++;
        if (proc->timer <= conf->duration)
            break;

        conf++;
        proc->timer = 0;
    }

    proc->conf = conf;
    proc->counter_procloop++;
}

//! FE8U = 0x080AE71C
void BmBgfx_End(struct ProcBmBgfx * proc)
{
    if (proc->conf->type == 10)
    {
        SetBackgroundTileDataOffset(proc->bg, proc->vram_base);
        BG_Fill(BG_GetMapBuffer(proc->bg), 0);
        BG_EnableSyncByMask(1 << proc->bg);
    }
}

struct ProcCmd CONST_DATA ProcScr_BmBgfx[] =
{
    PROC_CALL(BmBgfx_Init),
    PROC_YIELD,
    PROC_REPEAT(BmBgfx_Loop),
    PROC_CALL(BmBgfx_End),
    PROC_END,
};

//! FE8U = 0x080AE750
bool CheckBmBgfxDone(void)
{
    if (Proc_Find(ProcScr_BmBgfx))
        return true;

    return false;
}

//! FE8U = 0x080AE76C
void BmBgfxAdvance(void)
{
    struct ProcBmBgfx * proc = Proc_Find(ProcScr_BmBgfx);
    if ((proc != NULL) && (proc->conf->type == BMFX_CONFT_BLOCKING))
        proc->conf++;
}

//! FE8U = 0x080AE790
void EndBmBgfx(void)
{
    Proc_End(Proc_Find(ProcScr_BmBgfx));
}

//! FE8U = 0x080AE7A4
void BmBgfxSetLoopEN(u8 loop_en)
{
    struct ProcBmBgfx * proc = Proc_Find(ProcScr_BmBgfx);
    if (proc != NULL)
        proc->loop_en = loop_en;
}

//! FE8U = 0x080AE7C4
void StartBmBgfx(struct BmBgxConf * input, int bg, int x, int y, int vram_off, int size, int pal_bank, void * func, ProcPtr parent)
{
    struct ProcBmBgfx * proc;

    if (parent == NULL)
        proc = Proc_Start(ProcScr_BmBgfx, PROC_TREE_3);
    else
        proc = Proc_Start(ProcScr_BmBgfx, parent);

    proc->conf = input;
    proc->bg = bg;
    proc->pal_bank = pal_bank;

    if (size < 0)
        size = 0x4000;

    if (vram_off < 0)
        vram_off = 0;

    proc->vram_base = GetBackgroundTileDataOffset(bg);
    proc->vram_base_offset = vram_off;
    proc->size_per_fx = size;
    proc->x = x;
    proc->y = y;

    proc->callback = func;

    BG_SetPosition(bg, -x & 0xff, -y & 0xff);

    for (; input->type < BMFX_CONFT_END; input++)
        proc->total_duration += input->duration;
}
