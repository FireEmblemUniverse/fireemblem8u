#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "mapanim.h"
#include "bmlib.h"

void UncompMapBattleBoxNumGfx(int tileNum)
{
    Decompress(
        Img_MapBattleInfoNum,
        (u8*)(VRAM) + GetBackgroundTileDataOffset(0) + 0x20*(tileNum & 0x3FF));
}

void sub_807BA28(u16* tilemap, int num, int tileref, int len, u16 blankref, int arg5)
{
    char buf[8];
    int i, j;

    for (i = sizeof(buf)-1; i >= 0; --i) {
        buf[i] = '0' + num % 10;
        num = num / 10;

        if (num == 0) {
            for (j = i - 1; j >= 0; --j)
                buf[j] = ' ';

            break;
        }
    }

    sub_8013168(tilemap, buf + sizeof(buf)-1, tileref, len, arg5);

    for (i = len - 1; i > 0 && buf[7 - i] == ' '; --i)
        tilemap[-i] = blankref;
}

void PrepareMapBattleBoxNumGfx(const u8* src)
{
    UncompMapBattleBoxNumGfx(0x20);
    Decompress(src, (u8*)(VRAM + 0x20 * 43)); // TODO: named constants
    ApplyPalette(Pal_MapBattleInfoNum, 5);
}

void sub_807BB10(u16* buf1, int* buf2, int arg2, int arg3, int arg4)
{
    int r1;
    if (*buf2 > arg3)
        r1 = arg3;
    else
        r1 = *buf2;

    *buf1 = TILEREF(arg4 + r1, arg2);
    *buf2 += 1 - arg3;

    if (*buf2 < 0)
        *buf2 = 0;
}

void sub_807BB40(u16* tilemap, int arg1, int arg2, int arg3, u16* buf)
{
    int unk4, count = 0;
    u16* it;

    for (it = buf; it[0]; it += 2)
        count -= 1 - it[0];

    count += 1;

    if (arg1 == arg2)
        unk4 = count;
    else
        unk4 = ((count<<8) / arg1 * arg2) >> 8;

    if (unk4 == 0 && arg2 > 0)
        unk4 = 1;

    for (it = buf; it[0]; ++tilemap, it += 2)
        sub_807BB10(tilemap, &unk4, gUnknown_089A3668[arg3], it[0], it[1]);
}

void DeleteBattleAnimInfoThing(void)
{
    Proc_EndEach(ProcScr_MapBattleInfoBox);
}

void NewMapBattleInfoThing(int x, int y, struct Proc* parent)
{
    struct MAInfoFrameProc* proc = Proc_Start(ProcScr_MapBattleInfoBox, PROC_TREE_3);

    proc->x = x;
    proc->y = y;

    proc->maMain = parent;
}

void ProcMapInfoBox_OnEnd(void)
{
    SetPrimaryHBlankHandler(NULL);
    ClearBg0Bg1();
}

void ProcMapInfoBox_OnDraw(struct MAInfoFrameProc* proc)
{
    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    Decompress(
        Img_MapBattleInfoBox,
        (void*)(VRAM) + GetBackgroundTileDataOffset(1) + BM_BGCHR_BANIM_IFBACK * 0x20); //< TODO: put in macro?

    PrepareMapBattleBoxNumGfx(Img_MapBattleInfoHpBar);

    switch (gManimSt.actorCount_maybe) {
    case 1:
        DisplayBattleInfoBox(proc, 0, -5);
        break;

    case 2:
        DisplayBattleInfoBox(proc, 0, -1);
        DisplayBattleInfoBox(proc, 1, -11);
        break;
    } // switch (gManimSt.actorCount_maybe)

    sub_8081E78();

    sub_80820D8(
        gManimSt.actor[0].hp_info_y*8,
        gManimSt.actor[0].hp_info_y*8 + 0x20,
        gPaletteBuffer[BGPAL_OFFSET(1) + 1],
        gPaletteBuffer[BGPAL_OFFSET(2) + 1]);
}

void sub_807BCA8(struct MAInfoFrameProc* proc)
{
    s8 updated = FALSE;
    int i;

    for (i = 0; i < gManimSt.actorCount_maybe; ++i) {
        u16 r4 = gManimSt.actor[i].hp_displayed_q4;

        if (r4 > gManimSt.actor[i].hp_cur*16)
            r4 = r4 - 16;

        if (r4 < gManimSt.actor[i].hp_cur*16) {
            r4 = r4 + 4;

            if (r4 % 16 == 0)
                PlaySoundEffect(0x75); // TODO: song ids
        }

        if (r4 != gManimSt.actor[i].hp_displayed_q4) {
            gManimSt.actor[i].hp_displayed_q4 = r4;
            sub_807BD54(proc, i);
            updated = TRUE;
        }
    }

    if (!updated && gManimSt.hp_changing)
        gManimSt.hp_changing = FALSE;
}

void sub_807BD54(struct MAInfoFrameProc* proc, int a)
{
    int dummy = gManimSt.actor[a].hp_displayed_q4/16;
    int r6 = (dummy >= 100);

    sub_807BA28(
        gBG0TilemapBuffer + TILEMAP_INDEX(
            gManimSt.actor[a].hp_info_x + 3,
            gManimSt.actor[a].hp_info_y + 3),
        gManimSt.actor[a].hp_displayed_q4/16,
        TILEREF(32, BM_BGPAL_BANIM_UNK5), 3, 0, r6);

    sub_807BB40(
        gBG0TilemapBuffer + TILEMAP_INDEX(
            gManimSt.actor[a].hp_info_x + 4,
            gManimSt.actor[a].hp_info_y + 3),
        gManimSt.actor[a].hp_max,
        gManimSt.actor[a].hp_displayed_q4/16,
        0, gUnknown_089A3648);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

u16* GetBattleInfoPalByFaction(struct Unit* unit)
{
    switch (UNIT_FACTION(unit)) {
    case FACTION_BLUE:
        return Pal_MapBattleInfoBlue;

    case FACTION_RED:
        return Pal_MapBattleInfoRed;

    case FACTION_GREEN:
        return Pal_MapBattleInfoGreen;

    case FACTION_PURPLE:
        return Pal_MapBattleInfoPurple;
    } // switch (UNIT_FACTION(unit))

    return NULL;
}

void DisplayBattleInfoBox(struct MAInfoFrameProc* proc, int index, int arg2)
{
    gManimSt.actor[index].hp_info_x = proc->x + arg2;
    gManimSt.actor[index].hp_info_y = proc->y;

    ApplyPalette(
        GetBattleInfoPalByFaction(gManimSt.actor[index].unit),
        BM_BGPAL_BANIM_IFBACK + index);

    Decompress(
        TsaSet_MapBattleBoxGfx[gManimSt.actorCount_maybe][index], gGenericBuffer);

    CallARM_FillTileRect(
        TILEMAP_LOCATED(gBG1TilemapBuffer,
            gManimSt.actor[index].hp_info_x,
            gManimSt.actor[index].hp_info_y),
        (u16*) gGenericBuffer,
        (u16)(BM_BGCHR_BANIM_IFBACK | TILEREF(0, BM_BGPAL_BANIM_IFBACK + index)));

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    PutStringCentered(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            gManimSt.actor[index].hp_info_x + 2,
            gManimSt.actor[index].hp_info_y + 1),
        0, 9,
        GetStringFromIndex(UNIT_NAME_ID(gManimSt.actor[index].unit)));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    gManimSt.actor[index].hp_displayed_q4 = gManimSt.actor[index].hp_cur*16;

    sub_807BD54(proc, index);
}

void MapInfoBox_PrepareForShake(struct MAInfoFrameProc* proc)
{
    proc->unk2A = 0;

    MapInfoBoxShake(proc);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);
}

void MapInfoBoxShake(struct MAInfoFrameProc* proc)
{
    // TODO: SetWin0PtA macro?
    gLCDControlBuffer.win0_left   = 0;
    gLCDControlBuffer.win0_top    = (proc->y+2)*8 - proc->unk2A;

    // TODO: SetWin0PtB macro?
    gLCDControlBuffer.win0_right  = 240; // TODO: SCREEN_WIDTH?
    gLCDControlBuffer.win0_bottom = (proc->y+2)*8 + proc->unk2A;

    proc->unk2A += 2;

    if (proc->unk2A > 0x10) {
        SetWinEnable(0, 0, 0);
        Proc_Break(proc);
    }
}

/** 
 * section.data
*/

CONST_DATA u16 gUnknown_089A3648[] = {
    0x05, 0x2B, 0x08, 0x31,
    0x08, 0x31, 0x08, 0x31,
    0x08, 0x31, 0x08, 0x31,
    0x05, 0x3A, 0x00, 0x00
};

CONST_DATA int gUnknown_089A3668[] = {
    0x05, 0x06
};

CONST_DATA u8* TsaSet_MapBattleBoxGfx[3][2] = {
    {Tsa_MapBattleBoxGfx1, Tsa_MapBattleBoxGfx1},
    {Tsa_MapBattleBoxGfx1, Tsa_MapBattleBoxGfx1},
    {Tsa_MapBattleBoxGfx3, Tsa_MapBattleBoxGfx2},
};

CONST_DATA struct ProcCmd ProcScr_MapBattleInfoBox[] = {
    PROC_SET_END_CB(ProcMapInfoBox_OnEnd),
    PROC_SLEEP(0x1),
    PROC_CALL(MapInfoBox_PrepareForShake),
    PROC_CALL(ProcMapInfoBox_OnDraw),
    PROC_REPEAT(MapInfoBoxShake),
    PROC_REPEAT(sub_807BCA8),
    PROC_END
};
