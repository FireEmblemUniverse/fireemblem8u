#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"

#include "unitlistscreen.h"
#include "constants/songs.h"

extern u16 gUnitlistscreen_0[32][32];
extern u16 gUnitlistscreen_1[2][32];

void __attribute__((thumb_row_shift_alloc)) UnitList_PageChangeIn_Loop(struct UnitListScreenProc * proc)
{
    int r4, r5;

    proc->unk_38 += gUnitlistscreen_11[proc->unk_3c];

    if (proc->unk_38 > 20)
    {
        proc->unk_38 = 20;
    }

    proc->unk_3c++;

    if (proc->pageTarget > proc->unk_37)
    {
        for (r5 = 0; r5 < proc->unk_38; r5++)
        {
            for (r4 = proc->unk_3e / 8; r4 < proc->unk_3e / 8 + 12; r4++)
            {
                gBG0TilemapBuffer[(({
                    int temp = r4 & 0x1f;
                    asm("" ::: "r1");
                    temp;
                })) * 0x20 + (({r5 + 0x1c;}) - proc->unk_38)] = gUnitlistscreen_0[r4 & 0x1f][r5 + 8];
            }

            for (r4 = 0; r4 < 2; r4++)
            {
                gBG2TilemapBuffer[(r4 + 5) * 0x20 + (({r5 + 0x1c;}) - proc->unk_38)] = gUnitlistscreen_1[r4][r5 + 8];
            }
        }
    }
    else
    {
        for (r5 = 0; r5 < proc->unk_38; r5++)
        {
            for (r4 = proc->unk_3e / 8; r4 < proc->unk_3e / 8 + 12; r4++)
            {
                int off = (r4 & 0x1f) * 0x20 + 8;
                asm("" ::: "r1");
                gBG0TilemapBuffer[off + r5] = gUnitlistscreen_0[r4 & 0x1f][({r5 + 0x1c;}) - proc->unk_38];
            }

            for (r4 = 0; r4 < 2; r4++)
            {
                gBG2TilemapBuffer[(r4 + 5) * 0x20 + (r5 + 8)] = gUnitlistscreen_1[r4][({r5 + 0x1c;}) - proc->unk_38];
            }
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->unk_38 >= 20)
    {
        Proc_Break(proc);
    }

    return;
}
