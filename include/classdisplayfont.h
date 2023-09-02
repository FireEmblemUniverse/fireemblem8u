#ifndef GUARD_CLASS_DISPLAY_FONT_H
#define GUARD_CLASS_DISPLAY_FONT_H

struct ClassDisplayFont {
    u16* a;
    s8 xBase;
    s8 width;
    s8 yBase;
};

struct ClassDisplayFont* GetClassDisplayFontInfo(char chr);

#endif // GUARD_CLASS_DISPLAY_FONT_H
