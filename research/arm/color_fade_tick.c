/* NONMATCHING research candidate; excluded from the ROM build.
 * Component storage wraps to eight bits; displayed color clamps the full sum.
 */
typedef unsigned char u8;
typedef signed char s8;
typedef unsigned short u16;
typedef unsigned int u32;
extern u16 gPaletteBuffer[];
extern s8 gFadeComponents[];
extern s8 gFadeComponentStep[];

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
        step = gFadeComponentStep[paletteOffset >> 5];
        asm("" : "+r"(step));
        if (step == 0)
            goto next_palette;
        components = (u8 *) gFadeComponents + (paletteOffset >> 1) * 3 + 48;
        asm("" : "+r"(components));
        colorOffset = 30;
        do
        {
            components -= 3;
            red = components[0] + step;
            components[0] = red;
            asm("" : "+r"(red));
            red -= 32;
            if ((int) red < 0) red = 0;
            if (red >= 32) red = 31;
            asm("" : "+r"(red));

            green = components[1] + step;
            components[1] = green;
            asm("" : "+r"(green));
            green -= 32;
            if ((int) green < 0) green = 0;
            if (green >= 32) green = 31;
            asm("" : "+r"(green));

            blue = components[2] + step;
            components[2] = blue;
            asm("" : "+r"(blue));
            blue -= 32;
            if ((int) blue < 0) blue = 0;
            if (blue >= 32) blue = 31;
            asm("" : "+r"(blue));

            red += green << 5;
            red += blue << 10;
            gPaletteBuffer[(paletteOffset + colorOffset) >> 1] = red;
            colorOffset -= 2;
        } while ((int) colorOffset >= 0);
next_palette:
        paletteOffset -= 32;
    } while ((int) paletteOffset >= 0);
}
