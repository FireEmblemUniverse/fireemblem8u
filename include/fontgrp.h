#ifndef GUARD_FONTGRP_H
#define GUARD_FONTGRP_H

#include "global.h"

struct Text {
    u16 chr_position;
    u8 x;
    u8 colorId;
    u8 tile_width;
    s8 db_enabled;
    u8 db_id;
    u8 is_printing;
};


struct Glyph {
    struct Glyph *sjisNext;  // (only used in Shift-JIS fonts) next element in linked list
    u8 sjisByte1;            // (only used in Shift-JIS fonts) second byte of character
    u8 width;                // width of the glyph in pixels
    u32 bitmap[16];          // image data of the glyph (16x16 pixels, 2 bits per pixel)
};

enum langaguge_index {
    LANG_JAPANESE,
    LANG_ENGLISH,
};

struct Font {
    /*0x00*/ u8 *vramDest;
             // pointer to table of glyph structs
             // In ASCII fonts, there is just one byte per character, so the glyph
             // for a given character is obtained by indexing this array.
             // In Shift-JIS fonts, each character is 2 bytes. Each element in
             // this array is a linked list. byte2 - 0x40 is the index of the head
             // of the list, and the list is traversed until a matching byte1 is found.
    /*0x04*/ struct Glyph **glyphs;
    /*0x08*/ void (*drawGlyph)(struct Text *, struct Glyph *);
    /*0x0C*/ void *(*get_draw_dest)(struct Text *);
    /*0x10*/ u16 tileref;
    /*0x12*/ u16 chr_counter;
    /*0x14*/ u16 palid;
    /*0x16*/ u8 lang;
};

struct TextInitInfo {
    struct Text *text;
    u8 width;
};

enum {
    TEXT_GLYPHS_SYSTEM,
    TEXT_GLYPHS_TALK,
};

enum text_colors {
    TEXT_COLOR_0123 = 0,
    TEXT_COLOR_0456 = 1,
    TEXT_COLOR_0789 = 2,
    TEXT_COLOR_0ABC = 3,
    TEXT_COLOR_0DEF = 4,
    TEXT_COLOR_0030 = 5,
    TEXT_COLOR_4DEF = 6,
    TEXT_COLOR_456F = 7,
    TEXT_COLOR_47CF = 8,
    TEXT_COLOR_MASK = 9,

    TEXT_COLOR_COUNT,

    TEXT_COLOR_SYSTEM_WHITE = TEXT_COLOR_0123,
    TEXT_COLOR_SYSTEM_GRAY  = TEXT_COLOR_0456,
    TEXT_COLOR_SYSTEM_BLUE  = TEXT_COLOR_0789,
    TEXT_COLOR_SYSTEM_GOLD  = TEXT_COLOR_0ABC,
    TEXT_COLOR_SYSTEM_GREEN = TEXT_COLOR_0DEF,
    TEXT_COLOR_SYSTEM_BLACK = TEXT_COLOR_0030,

    // TEXT_COLOR_TALK_...
};

enum text_special_char {
    TEXT_SPECIAL_BIGNUM_0,
    TEXT_SPECIAL_BIGNUM_1,
    TEXT_SPECIAL_BIGNUM_2,
    TEXT_SPECIAL_BIGNUM_3,
    TEXT_SPECIAL_BIGNUM_4,
    TEXT_SPECIAL_BIGNUM_5,
    TEXT_SPECIAL_BIGNUM_6,
    TEXT_SPECIAL_BIGNUM_7,
    TEXT_SPECIAL_BIGNUM_8,
    TEXT_SPECIAL_BIGNUM_9,
    TEXT_SPECIAL_SMALLNUM_0,
    TEXT_SPECIAL_SMALLNUM_1,
    TEXT_SPECIAL_SMALLNUM_2,
    TEXT_SPECIAL_SMALLNUM_3,
    TEXT_SPECIAL_SMALLNUM_4,
    TEXT_SPECIAL_SMALLNUM_5,
    TEXT_SPECIAL_SMALLNUM_6,
    TEXT_SPECIAL_SMALLNUM_7,
    TEXT_SPECIAL_SMALLNUM_8,
    TEXT_SPECIAL_SMALLNUM_9,
    TEXT_SPECIAL_DASH,
    TEXT_SPECIAL_PLUS,
    TEXT_SPECIAL_SLASH,
    TEXT_SPECIAL_TILDE,
    TEXT_SPECIAL_S,
    TEXT_SPECIAL_A,
    TEXT_SPECIAL_B,
    TEXT_SPECIAL_C,
    TEXT_SPECIAL_D,
    TEXT_SPECIAL_E,
    TEXT_SPECIAL_G,
    TEXT_SPECIAL_K, // NOTE: this is an E? used as statscreen exp label and equip marker
    TEXT_SPECIAL_COLON,
    TEXT_SPECIAL_DOT,
    TEXT_SPECIAL_HP_A,
    TEXT_SPECIAL_HP_B,
    TEXT_SPECIAL_LV_A,
    TEXT_SPECIAL_LV_B,
    TEXT_SPECIAL_ARROW,
    TEXT_SPECIAL_HEART,
    TEXT_SPECIAL_100_A,
    TEXT_SPECIAL_100_B,
    TEXT_SPECIAL_PERCENT,
    // TODO: rest

    TEXT_SPECIAL_NOTHING = 0xFF,
};

struct TextPrintProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Text * text;
    /* 30 */ char const * str;
    /* 34 */ s8 interval;
    /* 35 */ s8 clock;
    /* 36 */ s8 char_per_tick;
};

extern char gUnknown_02028E44[9];

// ??? SetupDebugFontForBG(???);
void PrintDebugStringToBG(u16 *bg, const char *asciiStr);
// ??? sub_800384C(???);
// ??? sub_8003870(???);
// ??? sub_80038B4(???);
// ??? ClearSmallStringBuffer(???);
void StoreNumberStringToSmallBuffer(int n);
void StoreNumberStringOrDashesToSmallBuffer(int n);
// ??? sub_800394C(???);
// ??? StoreNumberHexStringToSmallBuffer(???);
// ??? sub_80039B4(???);
void PrintStringToDBG(const char *str);
// ??? FlushDBGToBG2(???);
// ??? sub_8003ABC(???);
void SetupDebugFontForOBJ(int a, int objPalNum);
// ??? PrintDebugStringAsOBJ(???);
// ??? sub_8003BFC(???);
// ??? sub_8003C20(???);
// ??? sub_8003C44(???);
int GetLang(void);
void SetLang(int);
void ResetText(void);
void InitTextFont(struct Font *a, void *b, int c, int d);
void SetTextFontGlyphs(int a);
void ResetTextFont(void);
void SetTextFont(struct Font *a);
void InitText(struct Text *a, int tileWidth);
void InitTextDb(struct Text *th, int tileWidth);
void InitTextInitInfo(const struct TextInitInfo* a);
void ClearText(struct Text* a);
void ClearTextPart(struct Text *th, int b, int c);
// ??? Text_GetChrOffset(???);
int Text_GetCursor(struct Text *th);
void Text_SetCursor(struct Text *th, int x);
void Text_Skip(struct Text *th, int x);
void Text_SetColor(struct Text *th, int colorId);
int Text_GetColor(struct Text *th);
void Text_SetParams(struct Text* th, int x, int colorId);
void PutText(struct Text* th, u16* dest);
void PutBlankText(struct Text *th, u16 *dest);
int GetStringTextLen(const char *str);
const char *GetCharTextLen(const char *str, u32 *pWidth);
int GetStringTextCenteredPos(int x, const char* str);
void GetStringTextBox(const char* str, int* outWidth, int* outHeight);
char *GetStringLineEnd(char *str);
void Text_DrawString(struct Text *th, const char* str);
void Text_DrawNumber(struct Text *th, int n);
void Text_DrawNumberOrSpace(struct Text *th, int n);
void Text_DrawNumberOrBlank(struct Text *th, int n);
const char *Text_DrawCharacter(struct Text *a, const char *b);
void *GetTextDrawDest(struct Text *a);
// ??? GetColorLut(???);
// ??? DrawTextGlyph(???);
// ??? DrawTextGlyphNoClear(???);
void InitSystemTextFont(void);
void InitTalkTextFont(void);
void SetTextDrawNoClear(void);
void PutDrawText(struct Text* text, u16* dest, int colorId, int x, int tileWidth, const char* string);
void Text_InsertDrawString(struct Text *th, int x, int colorId, const char *str);
void Text_InsertDrawNumberOrBlank(struct Text *th, int x, int colorId, int n);
void Text_DrawStringASCII(struct Text *text, const char *str);
const char *Text_DrawCharacterAscii(struct Text *text, const char *str);
const char *GetCharTextLenASCII(const char *str, u32 *width);
int GetStringTextLenASCII(const char *str);
// ??? nop_8004598(???);
void InitSpriteTextFont(struct Font *font, void *vramDest, int c);
void InitSpriteText(struct Text *th);
void SpriteText_DrawBackground(struct Text*);
void SpriteText_Clear(struct Text *th);
void SpriteText_DrawBackgroundExt(struct Text *th, u32 b);
void *GetSpriteTextDrawDest(struct Text *);
void DrawSpriteTextGlyph(struct Text *, struct Glyph *);
// ??? TextPrint_OnLoop(???);
// ??? StartTextPrint(???);
// ??? IsTextPrinting(???);
// ??? EndTextPrinting(???);
// ??? GreenText_OnLoop(???);
void StartGreenText(ProcPtr parent);
void EndGreenText(void);
// ??? DrawSpecialCharGlyph_old(???);
// ??? DrawSpecialCharGlyph(???);
// ??? AddSpecialChar(???);
// ??? GetSpecialCharChr(???);
void PutSpecialChar(u16 *a, int b, int c);
// ??? PutNumberExt(???);
void PutNumber(u16 *a, int b, int c);
void PutNumberOrBlank(u16* a, int b, int c);
void PutNumberTwoChr(u16 *a, int b, int c);
void PutNumberSmall(u16* a, int b, int c);
void PutNumberBonus(int a, u16 *b);
// ??? SpecialCharTest(???);
void PutTime(u16 * tm, int color, int time, bool always_display_punctuation);
void PutTwoSpecialChar(u16 *a, int b, int c, int d);
void PutNumber2Digit(u16 *tm, int color, int number);
void PutNumber2DigitSmall(u16 *tm, int color, int number);
void PutNumber2DigitExt(u16 *tm, int color, int number, int id_zero);
// ??? sub_8004D7C(???);
// ??? sub_8004DB8(???);
// ??? sub_8004DF8(???);
void SetupDebugFontForBG(int bg, int tileDataOffset);

#endif  // GUARD_FONTGRP_H
