#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "bmunit.h"

#include "mapanim.h"

void sub_807B9F8(int tileNum)
{
    CopyDataWithPossibleUncomp(
        gUnknown_089AD868,
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

void sub_807BAE4(const u8* src)
{
    sub_807B9F8(0x20);
    CopyDataWithPossibleUncomp(src, (u8*)(VRAM + 0x20 * 43)); // TODO: named constants
    ApplyPalette(gUnknown_08A1D79C, 5);
}

void sub_807BB10(u16* arg0, int* arg1, int arg2, int arg3, int arg4)
{
    int r1;
    if (*arg1 > arg3)
        r1 = arg3;
    else
        r1 = *arg1;

    *arg0 = TILEREF(arg4 + r1, arg2);
    *arg1 += 1 - arg3;

    if (*arg1 < 0)
        *arg1 = 0;
}

void sub_807BB40(u16* tilemap, int arg1, int arg2, int arg3, u16* arg4)
{
    int unk4, count = 0;
    u16* it;

    for (it = arg4; it[0]; it += 2)
        count -= 1 - it[0];

    count += 1;

    if (arg1 == arg2)
        unk4 = count;
    else
        unk4 = ((count<<8) / arg1 * arg2) >> 8;

    if (unk4 == 0 && arg2 > 0)
        unk4 = 1;

    for (it = arg4; it[0]; ++tilemap, it += 2)
        sub_807BB10(tilemap, &unk4, gUnknown_089A3668[arg3], it[0], it[1]);
}

void DeleteBattleAnimInfoThing(void)
{
    Proc_EndEach(ProcScr_MapBattleInfoBox);
}

void NewMapBattleInfoThing(int arg0, int arg1, struct Proc* parent)
{
    struct MAInfoFrameProc* proc = Proc_Start(ProcScr_MapBattleInfoBox, PROC_TREE_3);

    proc->unk2E = arg0;
    proc->unk2F = arg1;

    proc->maMain = parent;
}

void ProcMapInfoBox_OnEnd(void)
{
    SetPrimaryHBlankHandler(NULL);
    ClearBg0Bg1();
}

void sub_807BC00(struct MAInfoFrameProc* proc)
{
    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    CopyDataWithPossibleUncomp(
        gUnknown_089AD500,
        (void*)(VRAM) + GetBackgroundTileDataOffset(1) + BM_BGCHR_BANIM_IFBACK * 0x20); //< TODO: put in macro?

    sub_807BAE4(gUnknown_089AD78C);

    switch (gMapBattle.actorCount_maybe) {
    case 1:
        sub_807BE1C(proc, 0, -5);
        break;

    case 2:
        sub_807BE1C(proc, 0, -1);
        sub_807BE1C(proc, 1, -11);
        break;
    } // switch (gMapBattle.actorCount_maybe)

    sub_8081E78();

    sub_80820D8(
        gMapBattle.actors[0].u11*8,
        gMapBattle.actors[0].u11*8 + 0x20,
        gPaletteBuffer[0x11],
        gPaletteBuffer[0x21]);
}

void sub_807BCA8(struct MAInfoFrameProc* proc)
{
    s8 updated = FALSE;
    int i;

    for (i = 0; i < gMapBattle.actorCount_maybe; ++i) {
        u16 r4 = gMapBattle.actors[i].u0E;

        if (r4 > gMapBattle.actors[i].u0D*16)
            r4 = r4 - 16;

        if (r4 < gMapBattle.actors[i].u0D*16) {
            r4 = r4 + 4;

            if (r4 % 16 == 0)
                PlaySoundEffect(0x75); // TODO: song ids
        }

        if (r4 != gMapBattle.actors[i].u0E) {
            gMapBattle.actors[i].u0E = r4;
            sub_807BD54(proc, i);
            updated = TRUE;
        }
    }

    if (!updated && gMapBattle.u5F)
        gMapBattle.u5F = FALSE;
}

void sub_807BD54(struct MAInfoFrameProc* proc, int a)
{
    int dummy = gMapBattle.actors[a].u0E/16;
    int r6 = (dummy >= 100);

    sub_807BA28(
        gBG0TilemapBuffer + TILEMAP_INDEX(
            gMapBattle.actors[a].u10 + 3,
            gMapBattle.actors[a].u11 + 3),
        gMapBattle.actors[a].u0E/16,
        TILEREF(32, BM_BGPAL_BANIM_UNK5), 3, 0, r6);

    sub_807BB40(
        gBG0TilemapBuffer + TILEMAP_INDEX(
            gMapBattle.actors[a].u10 + 4,
            gMapBattle.actors[a].u11 + 3),
        gMapBattle.actors[a].u0C,
        gMapBattle.actors[a].u0E/16,
        0, gUnknown_089A3648);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

u16* sub_807BDD0(struct Unit* unit)
{
    switch (UNIT_FACTION(unit)) {
    case FACTION_BLUE:
        return gUnknown_089AD648;

    case FACTION_RED:
        return gUnknown_089AD668;

    case FACTION_GREEN:
        return gUnknown_089AD688;

    case FACTION_PURPLE:
        return gUnknown_089AD6A8;
    } // switch (UNIT_FACTION(unit))

    return NULL;
}

void sub_807BE1C(struct MAInfoFrameProc* proc, int a, int arg2)
{
    gMapBattle.actors[a].u10 = proc->unk2E + arg2;
    gMapBattle.actors[a].u11 = proc->unk2F;

    ApplyPalette(
        sub_807BDD0(gMapBattle.actors[a].pUnit),
        BM_BGPAL_BANIM_IFBACK + a);

    CopyDataWithPossibleUncomp(
        gUnknown_089A3670[gMapBattle.actorCount_maybe][a], gGenericBuffer);

    CallARM_FillTileRect(
        TILEMAP_LOCATED(gBG1TilemapBuffer,
            gMapBattle.actors[a].u10,
            gMapBattle.actors[a].u11),
        (u16*) gGenericBuffer,
        (u16)(BM_BGCHR_BANIM_IFBACK | TILEREF(0, BM_BGPAL_BANIM_IFBACK + a)));

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    sub_80143D8(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            gMapBattle.actors[a].u10 + 2,
            gMapBattle.actors[a].u11 + 1),
        0, 9,
        GetStringFromIndex(UNIT_NAME_ID(gMapBattle.actors[a].pUnit)));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    gMapBattle.actors[a].u0E = gMapBattle.actors[a].u0D*16;

    sub_807BD54(proc, a);
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
    gLCDControlBuffer.win0_top    = (proc->unk2F+2)*8 - proc->unk2A;

    // TODO: SetWin0PtB macro?
    gLCDControlBuffer.win0_right  = 240; // TODO: SCREEN_WIDTH?
    gLCDControlBuffer.win0_bottom = (proc->unk2F+2)*8 + proc->unk2A;

    proc->unk2A += 2;

    if (proc->unk2A > 0x10) {
        SetWinEnable(0, 0, 0);
        Proc_Break(proc);
    }
}
