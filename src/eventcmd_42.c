#include "global.h"
#include "variables.h"
#include "functions.h"

#include "proc.h"
#include "bmmap.h"
#include "hardware.h"
#include "soundwrapper.h"

struct ProcCmd42 {
    PROC_HEADER
    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;
};

extern struct CONST_DATA ProcCmd gUnknown_085925F0[];

/* Thanks to supper-man YohannDR! */
void sub_8012B9C(struct ProcCmd42* proc)
{
    if (GetGameClock() & 1)
    {
        switch (proc->unk29)
        {
            case 0:
                switch (proc->unk2A)
                {
                    case 0:
                        gBmSt.camera.x ^= 2;
                        break;
                    
                    case 1:
                        gBmSt.camera.y ^= 2;
                        break;
                }
                RenderBmMap();
                break;

            case 1:
                switch (proc->unk2A)
                {
                    case 0:
                        BG_SetPosition(3, GetGameClock() & 2, 0);
                        break;
                    
                    case 1:
                        BG_SetPosition(3, 0, GetGameClock() & 2);
                        break;
                }
                break;
        }
    }
}

void sub_8012C34(u8 a, u8 b, u8 play_sound)
{
    struct ProcCmd42 *proc;

    proc = Proc_Find(gUnknown_085925F0);
    if (!proc) {
        if (1 == play_sound)
            PlaySoundEffect(0x26A);
        
        proc = Proc_Start(gUnknown_085925F0, PROC_TREE_3);
    }

    proc->unk29 = a;
    proc->unk2A = b;
}

/* Thanks to supper-man YohannDR! */
void sub_8012C88()
{
    struct ProcCmd42 *proc;

    proc = Proc_Find(gUnknown_085925F0);
    if (!proc)
        return;

    switch (proc->unk29)
    {
        case 0:
            (u16)gBmSt.camera.x &= 0xFFFC;
            (u16)gBmSt.camera.y &= 0xFFFC;
            break;

        case 1:
            BG_SetPosition(3, 0, 0);
    }

    Proc_EndEach(gUnknown_085925F0);
    Sound_FadeOutSE(4);
}
