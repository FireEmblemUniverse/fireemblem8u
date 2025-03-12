#include "global.h"

#include "hardware.h"
#include "savemenu.h"

//! FE8U = 0x0808683C
void sub_808683C(void)
{
    u8 i;
    u16 * pal = gPaletteBuffer + 0x60;

    for (i = 0; i < 0xa0; i++)
    {
        u16 color = *pal;

        s16 r = color & 0x1f;
        s16 g = (color >> 5) & 0x1f;
        s16 b = (color >> 10) & 0x1f;

        u32 var = (r * 0x132) + (g * 0x259) + (b * 0x75);

        var = var << 10;

        r = Div(var + 0x29BDDC, 0x100000);

        g = Div(var - 0x41213, 0x100000);

        b = Div(var - 0x38E393, 0x100000);

        if (r < 0)
        {
            r = 0;
        }

        if (g < 0)
        {
            g = 0;
        }

        if (b < 0)
        {
            b = 0;
        }

        if (r > 31)
        {
            r = 31;
        }

        if (g > 31)
        {
            g = 31;
        }

        if (b > 31)
        {
            b = 31;
        }

        color = r;
        color |= g << 5;
        color |= b << 10;

        *pal = color;
        pal++;
    }

    EnablePaletteSync();

    return;
}

//! FE8U = 0x08086928
void sub_8086928(ProcPtr proc)
{
    Make6C_SaveMenuPostChapter(proc);
    return;
}