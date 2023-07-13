#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "constants/classes.h"
#include "constants/items.h"

extern struct Anim *gAnims[4];

void sub_8070D04(u16 * ptr, u16 a, u16 b, int r3, int r4)
{
    int i, j;
    u16 val;
    u16* ptr_ = ptr;

    for (i = b; i != 0; i--)
    {
        for (j = a; j != 0; j--)
        {
            val = *ptr_;
            if (r3 != -1) val = TILEREF(val & 0xFFF, r3);
            if (r4 != -1) val += r4;

            *ptr_ = val;
            ptr_++;
        }
        val = 0x20 - a;
        ptr_ += val;
    }
}
