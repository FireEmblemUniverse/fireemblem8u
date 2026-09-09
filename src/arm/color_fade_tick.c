#include "global.h"
#include "hardware.h"

// Stored components wrap to eight bits; display clamps the full signed sum.
// Empty register constraints preserve the copied ARM routine's register contract.
void ColorFadeTick(void)
{
    register u32 paletteOffset asm("r7") = 0x3E0;
    register u32 colorOffset asm("r6");
    register int step asm("r5");
    register u8 * components asm("r4");
    register u32 red asm("r0");
    register u32 green asm("r1");
    register u32 blue asm("r2");

    do
    {
        {
            register s8 * steps asm("r0") = gFadeComponentStep;
            asm("" : "+r"(steps));
            steps += paletteOffset >> 5;
            asm("" : "+r"(steps));
            step = *steps;
        }
        asm("" : "+r"(step));
        if (step == 0)
            goto next_palette;
        components = (u8 *) gFadeComponents;
        asm("" : "+r"(components));
        red = paletteOffset >> 1;
        asm("" : "+r"(red));
        red += red << 1;
        asm("" : "+r"(red));
        red += 48;
        asm("" : "+r"(red));
        components += red;
        asm("" : "+r"(components));
        colorOffset = 30;
        do
        {
            components -= 3;
            asm("" : "+r"(components));
            red = components[0] + step;
            components[0] = red;
            asm("" : "+r"(red));
            red -= 32;
            if ((int) red < 0)
            {
                asm("" ::: "memory");
                red = 0;
            }
            asm("" : "+r"(red));
            if (red >= 32)
            {
                asm("" ::: "memory");
                red = 31;
            }
            asm("" : "+r"(red));

            green = components[1] + step;
            components[1] = green;
            asm("" : "+r"(green));
            green -= 32;
            if ((int) green < 0)
            {
                asm("" ::: "memory");
                green = 0;
            }
            asm("" : "+r"(green));
            if (green >= 32)
            {
                asm("" ::: "memory");
                green = 31;
            }
            asm("" : "+r"(green));

            blue = components[2] + step;
            components[2] = blue;
            asm("" : "+r"(blue));
            blue -= 32;
            if ((int) blue < 0)
            {
                asm("" ::: "memory");
                blue = 0;
            }
            asm("" : "+r"(blue));
            if (blue >= 32)
            {
                asm("" ::: "memory");
                blue = 31;
            }
            asm("" : "+r"(blue));

            red += green << 5;
            red += blue << 10;
            asm("" : "+r"(red));
            {
                register u16 * palette asm("r1") = gPaletteBuffer;
                asm("" : "+r"(palette));
                palette = (u16 *) ((u8 *) palette + colorOffset);
                asm("" : "+r"(palette));
                *(u16 *) ((u8 *) palette + paletteOffset) = red;
            }
            colorOffset -= 2;
        } while ((int) colorOffset >= 0);
next_palette:
        paletteOffset -= 32;
    } while ((int) paletteOffset >= 0);
}
