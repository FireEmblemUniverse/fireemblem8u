#include "global.h"

#include "hardware.h"
#include "chap_title.h"
#include "chapterdata.h"

extern ChapTitle chap_title_data[];

struct {
    u16 unk_00;
    u16 unk_02;
} gUnknown_0203E78C;

void sub_80895B4(int config, int palId) {
    u16* pal;

    pal = (config & 1)
        ? gPal_08A07AD8
        : gPal_08A07C58;

    if ((config & 0x80) == 0) {
        if ((config & 8) != 0) {
            pal = pal + 0xA0;
        } else {
            if ((config & 0x10) == 0) {
                if ((config & 0x20) != 0) {
                    pal = pal + 0x20;
                }
                if ((config & 0x40) != 0) {
                    pal = pal + 0x40;
                }
                if ((config & 4) != 0) {
                    pal = pal + 0x40;
                }
            }
        }
    }

    if ((config & 2) != 0) {
        pal = pal + 0x10;
    }

    CopyToPaletteBuffer(pal, palId * 0x20, 0x20);

    return;
}

void sub_8089624(int chr, u32 titleId) {

    if (titleId > 0x108) {
        titleId = 0x54;
    }

    gUnknown_0203E78C.unk_02 = chr & 0x3FF;

    CopyDataWithPossibleUncomp(chap_title_data[titleId].save, (void*)((chr * 0x20) + 0x6000000));

    return;
}

void sub_808966C(int chr, u32 titleId) {
    sub_8089624(chr, titleId);
    return;
}

void sub_8089678(int chr) {

    gUnknown_0203E78C.unk_00 = chr & 0x3FF;

    CopyDataWithPossibleUncomp(gGfx_08A09E4C, (void*)((chr * 0x20) + 0x6000000));

    return;
}

extern u8 gUnknown_08A0A4E8[];

void sub_80896A8(int chr) {

    gUnknown_0203E78C.unk_00 = chr & 0x3FF;

    CopyDataWithPossibleUncomp(gUnknown_08A0A4E8, (void*)((chr * 0x20) + 0x6000000));

    return;
}

void sub_80896D8(u16* tm, int pal) {
    int i;

    int tile = TILEREF(gUnknown_0203E78C.unk_02, pal);

    for (i = 0; i < 0x40; i++) {
        *tm++ = tile++;
    }

    return;
}

void sub_80896FC(u16* tm, int pal, int c) {
    int i;

    int tile = TILEREF(gUnknown_0203E78C.unk_02, pal);

    for (i = 0; i < 0x40; i++) {
        *tm++ = tile++;
    }

    return;
}

void sub_8089720(u16* tm, int pal) {
    int i;

    int tile = TILEREF(gUnknown_0203E78C.unk_00, pal);

    for (i = 0; i < 0x80; i++) {
        *tm++ = tile++;
    }

    return;
}

void sub_8089744(u16* tm, int pal) {

    CallARM_FillTileRect(tm, gTsa_08A0A9F8, (u16)TILEREF(gUnknown_0203E78C.unk_00, pal));

    return;
}

int sub_8089768(struct PlaySt* chapterData) {

    if (chapterData == 0) {
        return 0x54; // No Data
    }

    if (chapterData->chapterStateBits & PLAY_FLAG_POSTGAME) {
        return 0x57; // Creature Campaign
    }

    if (chapterData->chapterStateBits & PLAY_FLAG_COMPLETE) {
        return 0x55; // Epilogue
    }

    return GetROMChapterStruct(chapterData->chapterIndex)->chapTitleId;
}

int sub_808979C(struct PlaySt* chapterData) {
    int unk;
    int i;

    if (chapterData == 0) {
        return 0x54; // No Data
    }

    unk = sub_80BCFDC(chapterData->chapterIndex);

    if ((chapterData->chapterStateBits & PLAY_FLAG_POSTGAME) || sub_80BD014(&gGMData) != unk) {

        for (i = 0; i < gWMMonsterSpawnsSize; i++) {

            if (unk == gWMMonsterSpawnLocations[i]) {
                return 0x46 + i;
            }

        }
    }

    return GetROMChapterStruct(chapterData->chapterIndex)->chapTitleId;
}
