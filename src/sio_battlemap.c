#include "global.h"

#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/terrains.h"

struct SioBattleMapProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ STRUCT_PAD(0x3C, 0x58);
    /* 58 */ int unk_58;
};

struct SioProc85AA1AC
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk_64;
};

extern u8 gUnknown_03001818[];
extern struct Vec2 gUnknown_0300182C;
extern int gUnknown_03001830;
extern u8 gUnknown_03001834[];
extern struct MUProc * gUnknown_03001838[];
extern u16 gUnknown_03001840[];

extern u8 gUnknown_080D9F28[][4];
extern struct Vec2 gUnknown_080D9F48[];

//! FE8U = 0x08049298
void sub_8049298(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        gUnknown_03001840[i] = unit->items[i];
    }

    return;
}

//! FE8U = 0x080492B8
void sub_80492B8(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        unit->items[i] = gUnknown_03001840[i];
    }

    return;
}

//! FE8U = 0x080492D8
void sub_80492D8(void)
{
    sub_8049594();
    RefreshUnitSprites();
    return;
}

//! FE8U = 0x080492E8
void sub_80492E8(int faction)
{
    int current = faction;
    int next = FACTION_ID_BLUE;

    while (1)
    {
        switch (current)
        {
            case FACTION_ID_BLUE:
                next = FACTION_ID_RED;
                break;

            case FACTION_ID_GREEN:
                next = FACTION_ID_PURPLE;
                break;

            case FACTION_ID_RED:
                next = FACTION_ID_GREEN;
                break;

            case FACTION_ID_PURPLE:
                next = FACTION_ID_BLUE;
                break;

            case 0xFF:
                next = 0xFF;
                break;
        }

        if (gUnk_Sio_0203DD90.unk_0A[next] != 0 || next == 0xFF)
        {
            break;
        }

        current = next;
    }

    gUnk_Sio_0203DD90.unk_01 = next;

    return;
}

//! FE8U = 0x0804933C
void sub_804933C(void)
{
    gUnknown_03001834[0] = 0;
    gUnknown_03001834[1] = 0;
    gUnknown_03001834[3] = 0;
    gUnknown_03001834[2] = 0;

    return;
}

//! FE8U = 0x08049350
u16 sub_8049350(u8 a, u8 b, u8 c, u8 d)
{
    sub_804933C();

    gUnknown_03001834[0] = a;
    gUnknown_03001834[1] = b;
    gUnknown_03001834[2] = c;
    gUnknown_03001834[3] = d;

    if (gLinkArenaSt.unk_00 == 2)
    {
        return SioEmitData(gUnknown_03001834, 4);
    }

    return 0;
}

//! FE8U = 0x080493A8
int sub_80493A8(u8 target)
{
    int i = 0;

    for (i = 0; i < 20; i++)
    {
        if (gUnknown_03001818[i] == target)
        {
            return i;
        }
    }

    // BUG -- no return if > 20
}

//! FE8U = 0x080493D0
void sub_80493D0(u8 a, int b, u8 * c, int * xOut, int * yOut)
{
    struct Unit * unit;

    // clang-format off

    u8 gUnknown_080D9FA0[8] =
    {
        MU_COMMAND_MOVE_UP,
        MU_COMMAND_HALT,

        MU_COMMAND_MOVE_LEFT,
        MU_COMMAND_HALT,

        MU_COMMAND_MOVE_DOWN,
        MU_COMMAND_HALT,

        MU_COMMAND_MOVE_RIGHT,
        MU_COMMAND_HALT,
    };

    s8 gUnknown_080D9FA8[8] =
    {
        +0, -1,
        -1, +0,
        +0, +1,
        +1, +0,
    };

    // clang-format on

    int var = sub_80493A8(a);
    int index = Div(var, 5) << 1;

    *c = var;

    unit = GetUnit(gUnknown_03001818[var]);

    if ((unit->state & US_BIT9) == 0)
    {
        gUnknown_03001838[b] = MU_Create(unit);
        MU_DisableAttractCamera(gUnknown_03001838[b]);
        MU_StartMoveScript(gUnknown_03001838[b], gUnknown_080D9FA0 + index);
    }

    unit->state |= US_HIDDEN;

    RefreshUnitSprites();

    *xOut = unit->xPos + gUnknown_080D9FA8[index + 0];
    *yOut = unit->yPos + gUnknown_080D9FA8[index + 1];

    if ((unit->state & US_BIT9) != 0)
    {
        unit->xPos = *xOut;
        unit->yPos = *yOut;

        *xOut = *xOut - gUnknown_080D9FA8[index + 0];
        *yOut = *yOut - gUnknown_080D9FA8[index + 1];

        gUnknown_03001838[b] = NULL;
    }

    return;
}

//! FE8U = 0x080494D4
void sub_80494D4(void)
{
    int i = 0;

    for (i = 0; i < 20; i++)
    {
        gUnknown_03001818[i] = 0;
    }

    return;
}

// clang-format off

const u8 gUnknown_080D9FB0[] =
{
    4, 2, 0, 1, 3,
};

// clang-format on

//! FE8U = 0x080494F0
void sub_80494F0(void)
{
    int faction;
    int i;
    int j;

    for (i = 0; i < 4; i++)
    {
        int playerId = gUnknown_080D9F28[gSioSt->selfId][i];

        if (!sub_8042194(playerId))
        {
            continue;
        }

        faction = playerId * 0x40 + 1;

        for (j = 0; j < 5; j++)
        {
            int idx = i * 5 + j;
            int unitId = faction + gUnknown_080D9FB0[j];

            struct Unit * unit = GetUnit(unitId);

            if (unit->pCharacterData != NULL)
            {
                gUnknown_03001818[idx] = unitId;

                unit->xPos = gUnknown_080D9F48[idx].x;
                unit->yPos = gUnknown_080D9F48[idx].y;
            }
        }
    }

    return;
}

//! FE8U = 0x08049594
void sub_8049594(void)
{
    int i;

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapFog, 1);

    for (i = FACTION_BLUE + 1; i < FACTION_PURPLE + 6; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if ((unit->state & US_HIDDEN) != 0)
        {
            continue;
        }

        gBmMapUnit[unit->yPos][unit->xPos] = i;
    }

    return;
}

//! FE8U = 0x080495F4
void sub_80495F4(void)
{
    int i;
    int j;

    for (i = 0; i < 4; i++)
    {
        int faction;

        int playerId = gUnknown_080D9F28[gSioSt->selfId][i];

        if (!sub_8042194(playerId))
        {
            continue;
        }

        faction = playerId * 0x40 + 1;

        for (j = 0; j < 5; j++)
        {
            int idx = i * 5 + j;
            int unitId = faction + gUnknown_080D9FB0[j];

            struct Unit * unit = GetUnit(unitId);

            if ((unit->pCharacterData == NULL) || ((unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) != 0))
            {
                gUnknown_03001818[idx] = 0;
            }
            else
            {
                gUnknown_03001818[idx] = unitId;
            }
        }
    }

    return;
}

//! FE8U = 0x080496A4
void sub_80496A4(void)
{
    CpuFill16(0, &gBmSt, sizeof(struct BmSt));

    gBmSt.gameStateBits |= BM_FLAG_LINKARENA;

    ClearTraps();

    gPlaySt.faction = FACTION_GREEN;
    gPlaySt.chapterIndex = 0x3a;
    gPlaySt.chapterTurnNumber = 0;

    gPlaySt.chapterVisionRange = GetROMChapterStruct(gPlaySt.chapterIndex)->initialFogLevel;
    gPlaySt.chapterWeatherId = GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather;

    InitChapterMap(0x3a);

    gPlaySt.time_chapter_started = GetGameClock();
    gPlaySt.unk48 = 0;

    return;
}

//! FE8U = 0x0804970C
void sub_804970C(void)
{
    sub_80496A4();
    sub_80494D4();
    sub_80494F0();

    BmMapFill(gBmMapFog, gPlaySt.chapterVisionRange == 0);

    sub_8049594();

    RenderBmMap();

    return;
}

//! FE8U = 0x08049744
void sub_8049744(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        gUnk_Sio_0203DD90.unk_0A[i] = 0;
    }

    for (i = 0; i < 20; i++)
    {
        u32 a = gUnknown_03001818[i];

        if (a != 0)
        {
            gUnk_Sio_0203DD90.unk_0A[a >> 6]++;
        }
    }

    return;
}

//! FE8U = 0x08049788
void sub_8049788(void)
{
    Decompress(gUnknown_085AD9CC, (void *)(0x06013E00));
    return;
}

//! FE8U = 0x080497A0
void sub_80497A0(void)
{
    SetupBackgrounds(NULL);

    sub_80156D4();

    SetupMapSpritesPalettes();
    ForceSyncUnitSpriteSheet();

    sub_8049788();
    InitSystemTextFont();

    gUnk_Sio_0203DD90.unk_03 = 0xff;

    return;
}

//! FE8U = 0x080497CC
void sub_80497CC(void)
{
    gPlaySt.config.animationType = 0;

    gPlaySt.config.autoCursor = 1;
    gPlaySt.config.textSpeed = 2;
    gPlaySt.config.gameSpeed = 0;

    gPlaySt.config.disableBgm = 0;
    gPlaySt.config.disableSoundEffects = 0;
    gPlaySt.config.windowColor = 0;

    gPlaySt.config.battleForecastType = 0;

    gPlaySt.config.unitColor = 1;

    return;
}

// clang-format off

u8 CONST_DATA gUnknown_085AA158[] =
{
    FACTION_ID_PURPLE,
    FACTION_ID_RED,
    FACTION_ID_BLUE,
    FACTION_ID_GREEN,
};

// clang-format on

//! FE8U = 0x08049828
void sub_8049828(void)
{
    int i;
    struct Unit * unit;

    SetupBackgrounds(NULL);
    ClearSioBG();

    sub_804970C();
    sub_8049744();

    gUnk_Sio_0203DD90.unk_09 = 0;
    gLinkArenaSt.unk_0B = 0;

    sub_80492E8(gUnknown_085AA158[gUnk_Sio_0203DD90.unk_00]);

    gUnk_Sio_0203DD90.unk_0E = 1;
    gUnk_Sio_0203DD90.unk_02 = 0;
    gUnk_Sio_0203DD90.unk_03 = 1;

    for (i = 0; i < 4; i++)
    {
        gUnk_Sio_0203DD90.currentScore[i] = 0;
    }

    unit = GetUnit(gUnknown_03001818[3]);

    gUnknown_0300182C.x = unit->xPos * 16;
    gUnknown_0300182C.y = unit->yPos * 16;

    SetCursorMapPosition(unit->xPos, unit->yPos);

    gBmSt.camera.x = 0;
    gBmSt.camera.y = 0;

    ReadGameSaveCoreGfx();

    SetupMapSpritesPalettes();
    ResetUnitSprites();
    RefreshUnitSprites();

    sub_8049788();
    sub_804B38C();

    Proc_Start(gProc_MapTask, PROC_TREE_4);
    BMapVSync_Start();
    sub_80497CC();

    gPlaySt.chapterStateBits &= ~PLAY_FLAG_HARD;

    return;
}

//! FE8U = 0x080498F4
void sub_80498F4(void)
{
    struct Unit * unit = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);

    gUnknown_03001838[0] = MU_Create(unit);

    MU_SetDisplayPosition(gUnknown_03001838[0], unit->xPos * 16, (unit->yPos - 1) * 16);

    MU_DisableAttractCamera(gUnknown_03001838[0]);
    MU_SetFacing(gUnknown_03001838[0], 3);

    return;
}

//! FE8U = 0x08049940
void sub_8049940(ProcPtr proc)
{
    if ((gKeyStatusPtr->newKeys & L_BUTTON) != 0)
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085AA2FC[];
extern struct ProcCmd gUnknown_085AA4CC[];
extern struct ProcCmd gUnknown_085AA5BC[];

//! FE8U = 0x08049964
void sub_8049964(ProcPtr parent)
{
    switch (gLinkArenaSt.unk_00)
    {
        case 1:
            if (gPlaySt.faction == FACTION_BLUE)
            {
                Proc_StartBlocking(gUnknown_085AA2FC, parent);
            }
            else
            {
                Proc_StartBlocking(gUnknown_085AA5BC, parent);
            }

            break;

        case 2:
            if (gPlaySt.faction == gSioSt->selfId)
            {
                Proc_StartBlocking(gUnknown_085AA2FC, parent);
            }
            else
            {
                Proc_StartBlocking(gUnknown_085AA4CC, parent);
            }

            break;
    }

    Proc_Break(parent);

    return;
}

//! FE8U = 0x080499D0
void sub_80499D0(ProcPtr proc)
{
    int i = 0;

    if (gLinkArenaSt.unk_00 == 1)
    {
        if (gLinkArenaSt.unk_0B == 1)
        {
            Proc_Goto(proc, 3);
            return;
        }
    }
    else if (gLinkArenaSt.unk_0B == 2)
    {
        Proc_Goto(proc, 3);
        return;
    }

    if (gUnk_Sio_0203DD90.unk_01 == 0xFF)
    {
        Proc_Goto(proc, 2);
        return;
    }

    gPlaySt.faction = gUnk_Sio_0203DD90.unk_01;

    for (; gUnknown_03001818[i] == 0; i++)
    {
    }

    gUnk_Sio_0203DD90.unk_02 = i;
    gUnk_Sio_0203DD90.unk_03 = i + 1;

    LoadObjUIGfx();

    for (i = 0; i < 4; i++)
    {
        gUnk_Sio_0203DD90.unk_2c[i].newScore = 0;
        gUnk_Sio_0203DD90.unk_2c[i].unitId = 0;
    }

    SetupDebugFontForOBJ(-1, 9);

    return;
}

//! FE8U = 0x08049A60
int sub_8049A60(void)
{
    int i;

    u32 ret = 4;

    u32 score = gUnk_Sio_0203DD90.currentScore[gSioSt->selfId];

    if (gLinkArenaSt.unk_ec.unk_0_1)
    {
        for (i = 0; i < 4; i++)
        {
            if (sub_8042194(i) && (gSioSt->selfId == gUnk_Sio_0203DD90.unk_0F[i]))
            {
                return i;
            }
        }

        ret = 3;
    }
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (!sub_8042194(i))
            {
                ret--;
                continue;
            }

            if (gSioSt->selfId == i)
            {
                ret--;
                continue;
            }

            if (score > gUnk_Sio_0203DD90.currentScore[i])
            {
                ret--;
                continue;
            }
        }
    }

    return ret;
}

//! FE8U = 0x08049B04
void sub_8049B04(void)
{
    Proc_EndEach(gProc_MapTask);

    sub_804B3A0();

    BMapVSync_End();
    Sound_FadeOutBGM(1);

    return;
}

// clang-format off

u8 CONST_DATA gUnknown_085AA15C[] =
{
    0x0E, 0x0E, 0x13, 0x01,
    0x0D, 0x0D, 0x00, 0x02,
    0x0C, 0x0C, 0x01, 0x03,
    0x0B, 0x0B, 0x02, 0x04,
    0x0A, 0x0A, 0x03, 0x05,
    0x06, 0x04, 0x13, 0x13,
    0x07, 0x05, 0x12, 0x12,
    0x08, 0x06, 0x11, 0x11,
    0x09, 0x07, 0x10, 0x10,
    0x0A, 0x08, 0x0F, 0x0F,
    0x04, 0x04, 0x0B, 0x09,
    0x03, 0x03, 0x0C, 0x0A,
    0x02, 0x02, 0x0D, 0x0B,
    0x01, 0x01, 0x0E, 0x0C,
    0x00, 0x00, 0x0F, 0x0D,
    0x0E, 0x10, 0x09, 0x09,
    0x0F, 0x11, 0x08, 0x08,
    0x10, 0x12, 0x07, 0x07,
    0x11, 0x13, 0x06, 0x06,
    0x12, 0x00, 0x05, 0x05,
};

// clang-format on

//! FE8U = 0x08049B24
void sub_8049B24(u16 keys, s8 flag)
{
    u8 r2;
    int r4;
    int r5;

    r2 = gUnk_Sio_0203DD90.unk_02;
    r5 = r2;
    gUnk_Sio_0203DD90.unk_03 = gUnk_Sio_0203DD90.unk_02;

    if ((keys & DPAD_ANY) == 0)
    {
        return;
    }

    r4 = r2 << 2;

    if ((keys & DPAD_UP) != 0)
    {
        r2 = gUnknown_085AA15C[r4 + 0];
    }
    else if ((keys & DPAD_DOWN) != 0)
    {
        r2 = gUnknown_085AA15C[r4 + 1];
    }
    else if ((keys & DPAD_LEFT) != 0)
    {
        r2 = gUnknown_085AA15C[r4 + 2];
    }
    else if ((keys & DPAD_RIGHT) != 0)
    {
        r2 = gUnknown_085AA15C[r4 + 3];
    }

    r5 = r2 - r5;

    if ((gUnk_Sio_0203DD90.unk_03 == 0) && ((keys & DPAD_LEFT) != 0))
    {
        r5 = -1;
    }

    if ((gUnk_Sio_0203DD90.unk_03 == 19) && ((keys & DPAD_DOWN) != 0))
    {
        r5 = +1;
    }

    while (1)
    {
        if (gUnknown_03001818[r2] != 0)
        {
            if (flag == 0 || (gUnknown_03001818[r2] >> 6) != gSioSt->selfId)
            {
                goto _end; // FIXME: Goto appears to be required for match
            }
        }

        if (r5 < 0)
        {
            r2--;

            if (r2 == 0xFF)
            {
                r2 = 19;
            }
        }
        else
        {
            r2++;
            r2 = r2 % 20;
        }
    }

_end:
    gUnk_Sio_0203DD90.unk_02 = r2;

    return;
}

//! FE8U = 0x08049C18
void sub_8049C18(void)
{
    struct Unit * unitA;
    struct Unit * unitB;

    if (gUnk_Sio_0203DD90.unk_02 == gUnk_Sio_0203DD90.unk_03)
    {
        return;
    }

    unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_03]);
    unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_02]);

    if (unitA != NULL)
    {
        MU_EndAll();
        ShowUnitSprite(unitA);
    }

    if (unitB == NULL)
    {
        return;
    }

    if ((unitB->state & US_UNSELECTABLE) != 0)
    {
        return;
    }

    if ((gUnknown_03001818[gUnk_Sio_0203DD90.unk_02] >> 6) != gSioSt->selfId)
    {
        return;
    }

    MU_DisableAttractCamera(MU_Create(unitB));
    HideUnitSprite(unitB);

    return;
}

//! FE8U = 0x08049C94
bool sub_8049C94(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = unit->items[i];

        if ((GetItemAttributes(item) & IA_WEAPON) == 0)
        {
            continue;
        }

        if (CanUnitUseWeapon(unit, item) == 1)
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x08049CD4
void sub_8049CD4(ProcPtr proc)
{
    if (gUnk_Sio_0203DD90.unk_09 >= gLinkArenaSt.unk_A0 * 3)
    {
        EndLinkArenaPointsBox();
        Proc_Goto(proc, 3);
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08049D0C
void sub_8049D0C(ProcPtr proc)
{
    if (sub_8042238() < 8)
    {
        Proc_Break(proc);
    }

    return;
}

extern u8 gUnknown_080D9FB5[];

//! FE8U = 0x08049D24
void sub_8049D24(struct SioBattleMapProc * proc)
{
    int x;
    int y;

    // clang-format off

    u8 gUnknown_080D9FB5[2] =
    {
        MU_COMMAND_MOVE_UP,
        MU_COMMAND_HALT,
    };

    // clang-format on

    u8 previous = gUnk_Sio_0203DD90.unk_02;

    sub_8049C18();
    sub_8049B24(gKeyStatusPtr->repeatedKeys, 0);

    gActiveUnitId = gUnknown_03001818[gUnk_Sio_0203DD90.unk_02];
    gActiveUnit = GetUnit(gActiveUnitId);

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        if (((gActiveUnitId >> 6) == gSioSt->selfId) && (sub_8049C94(gActiveUnit) == 1))
        {
            PlaySoundEffect(0x69);
            MU_EndAll();

            gUnknown_03001838[0] = MU_Create(gActiveUnit);
            MU_DisableAttractCamera(gUnknown_03001838[0]);
            MU_StartMoveScript(gUnknown_03001838[0], gUnknown_080D9FB5);

            proc->unk_2c = gActiveUnit->xPos;
            proc->unk_30 = gActiveUnit->yPos - 1;
            gActiveUnit->state |= US_HIDDEN;

            sub_80492D8();

            gUnk_Sio_0203DD90.unk_04 = gUnk_Sio_0203DD90.unk_02;

            sub_8049B24(0x40, 1);
            sub_8049350(1, gActiveUnitId, 0, 0);

            Proc_Goto(proc, 5);
            return;
        }

        PlaySoundEffect(0x6c);
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0)
    {
        if ((gActiveUnit->state & US_BIT9) == 0)
        {
            MU_EndAll();
            Proc_Goto(proc, 4);
            return;
        }
    }

    if ((gKeyStatusPtr->newKeys & START_BUTTON) != 0)
    {
        EndLinkArenaPointsBox();

        if (!gPlaySt.config.disableSoundEffects)
        {
            // Interestingly this does not seem to use the normal PlaySoundEffect macro
            m4aSongNumStart(0x68);
            Proc_Goto(proc, 2);
        }

        return;
    }

    x = gActiveUnit->xPos * 16;
    y = gActiveUnit->yPos * 16;

    SetCursorMapPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    if (GetGameClock() - 1 == gUnknown_03001830)
    {
        x = (x + gUnknown_0300182C.x) >> 1;
        y = (y + gUnknown_0300182C.y) >> 1;
    }

    gUnknown_0300182C.x = x;
    gUnknown_0300182C.y = y;

    gUnknown_03001830 = GetGameClock();

    PutMapCursor(x, y, 0);

    if (previous != gUnk_Sio_0203DD90.unk_02)
    {
        PlaySoundEffect(0x65);
    }

    return;
}

//! FE8U = 0x08049F38
void sub_8049F38(ProcPtr unused)
{
    StartLinkArenaPointsBox();
    return;
}

//! FE8U = 0x08049F44
void sub_8049F44(struct SioBattleMapProc * proc)
{
    int x;
    int y;

    u8 previous = gUnk_Sio_0203DD90.unk_02;

    sub_8049B24(gKeyStatusPtr->repeatedKeys, 1);

    gActiveUnitId = gUnknown_03001818[gUnk_Sio_0203DD90.unk_02];

    gActiveUnit = GetUnit(gActiveUnitId);
    x = gActiveUnit->xPos * 16;
    y = gActiveUnit->yPos * 16;

    SetCursorMapPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    if (GetGameClock() - 1 == gUnknown_03001830)
    {
        x = (x + gUnknown_0300182C.x) >> 1;
        y = (y + gUnknown_0300182C.y) >> 1;
    }

    gUnknown_0300182C.x = x;
    gUnknown_0300182C.y = y;

    gUnknown_03001830 = GetGameClock();

    PutMapCursor(x, y, 0);

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        PlaySoundEffect(0x69);

        sub_80493D0(
            gUnknown_03001818[gUnk_Sio_0203DD90.unk_02], 1, &gUnk_Sio_0203DD90.unk_05, &proc->unk_34, &proc->unk_38);
        sub_8049350(3, gUnknown_03001818[gUnk_Sio_0203DD90.unk_05], gActiveUnitId, 0);
        EndLinkArenaPointsBox();

        Proc_Goto(proc, 7);

        return;
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        PlaySoundEffect(0x6b);

        MU_End(gUnknown_03001838[0]);
        GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04])->state &= ~US_HIDDEN;

        sub_80492D8();

        gUnk_Sio_0203DD90.unk_02 = gUnk_Sio_0203DD90.unk_04;
        gUnk_Sio_0203DD90.unk_03 = gUnk_Sio_0203DD90.unk_04 + 1;

        sub_8049350(2, gActiveUnitId, gUnknown_03001818[gUnk_Sio_0203DD90.unk_04], 0);

        Proc_Goto(proc, 1);

        return;
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0)
    {
        if ((gActiveUnit->state & US_BIT9) == 0)
        {
            MU_EndAll();
            Proc_Goto(proc, 6);
            return;
        }
    }

    if (previous != gUnk_Sio_0203DD90.unk_02)
    {
        PlaySoundEffect(0x65);
    }

    return;
}

extern struct MenuDef gUnknown_085AADA0;

//! FE8U = 0x0804A108
void sub_804A108(struct SioProc85AA1AC * proc)
{
    ResetTextFont();

    gUnk_Sio_0203DD90.unk_06 = 0xff;

    gActiveUnit = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    sub_8049298(gActiveUnit);

    proc->unk_64 = GetGameLock();
    LoadIconPalettes(4);

    StartOrphanMenu(&gUnknown_085AADA0);

    return;
}

//! FE8U = 0x0804A158
void sub_804A158(struct SioProc85AA1AC * proc)
{
    if (proc->unk_64 != GetGameLock())
    {
        return;
    }

    if (gUnk_Sio_0203DD90.unk_06 == 0)
    {
        sub_80492B8(gActiveUnit);
        Proc_End(proc);
        SetDispEnable(1, 1, 1, 1, 1);
    }
    else
    {
        Proc_Break(proc);
        SetDispEnable(0, 0, 1, 1, 1);
    }

    return;
}

//! FE8U = 0x0804A1D0
void sub_804A1D0(struct SioProc85AA1AC * proc)
{
    u16 item = gActiveUnit->items[gUnk_Sio_0203DD90.unk_07];

    proc->unk_64 = GetGameLock();

    if ((GetItemMinRange(item) == 1) && (GetItemMaxRange(item) == 1))
    {
        gUnk_Sio_0203DD90.unk_06 = 1;
        return;
    }

    if ((GetItemMinRange(item) == 2) && (GetItemMaxRange(item) == 2))
    {
        gUnk_Sio_0203DD90.unk_06 = 2;
        return;
    }

    if ((GetItemMinRange(item) == 2) && (GetItemMaxRange(item) == 3))
    {
        gUnk_Sio_0203DD90.unk_06 = 2;
        return;
    }

    item = GetUnitEquippedWeapon(GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]));

    if (item == 0)
    {
        gUnk_Sio_0203DD90.unk_06 = 1;
        return;
    }

    if (GetItemMinRange(item) >= 2)
    {
        gUnk_Sio_0203DD90.unk_06 = 2;
        return;
    }

    gUnk_Sio_0203DD90.unk_06 = 1;
    LoadIconPalettes(4);

    return;
}

//! FE8U = 0x0804A298
void sub_804A298(struct SioProc85AA1AC * proc)
{
    int tmp = 0;
    int local_24 = +1;

    struct Unit * unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    struct Unit * unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    if (proc->unk_64 == GetGameLock())
    {
        int y = unitB->yPos + 1;

        if (gBmMapTerrain[y][unitB->xPos] != TERRAIN_FLOOR_17)
        {
            local_24 = -1;
        }

        if (gUnk_Sio_0203DD90.unk_06 == 0)
        {
            sub_80492B8(gActiveUnit);
            Proc_Goto(proc, 0);
        }
        else
        {
            EquipUnitItemSlot(gActiveUnit, gUnk_Sio_0203DD90.unk_07);

            if ((unitB->state & US_BIT9) == 0)
            {
                NewBattleForecast(proc);
                tmp = (gUnk_Sio_0203DD90.unk_06 == 2) ? 1 : 0;
                BattleGenerateSimulation(unitA, unitB, unitB->xPos + tmp, unitB->yPos + local_24, 0);
                UpdateBattleForecastContents();
                sub_80492B8(gActiveUnit);
                Proc_Break(proc);
            }
            else
            {
                sub_80492B8(gActiveUnit);
                Proc_Goto(proc, 1);
            }
        }
    }
    return;
}

//! FE8U = 0x0804A3A8
void sub_804A3A8(ProcPtr proc)
{
    SetDispEnable(1, 1, 1, 1, 1);

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        PlaySoundEffect(0x6a);
        CloseBattleForecast();

        Proc_Break(proc);

        return;
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        PlaySoundEffect(0x6b);
        CloseBattleForecast();

        Proc_Goto(proc, 0);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AA1AC[] =
{
PROC_LABEL(0),
    PROC_WHILE_EXISTS(gProcScr_BKSEL),
    PROC_SLEEP(1),

    PROC_CALL(sub_804A108),

    PROC_REPEAT(sub_804A158),

    PROC_CALL(sub_804A1D0),
    PROC_REPEAT(sub_804A298),
    PROC_REPEAT(sub_804A3A8),

PROC_LABEL(1),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804A430
void sub_804A430(ProcPtr parent)
{
    Proc_StartBlocking(gUnknown_085AA1AC, parent);
    Proc_Break(parent);
    return;
}

//! FE8U = 0x0804A44C
void sub_804A44C(struct SioBattleMapProc * proc)
{
    struct Unit * unit = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    ClearBg0Bg1();

    if (gUnk_Sio_0203DD90.unk_06 == 0)
    {
        if ((unit->state & US_BIT9) == 0)
        {
            MU_End(gUnknown_03001838[1]);
        }
        else
        {
            unit->xPos = proc->unk_34;
            unit->yPos = proc->unk_38;
        }

        unit->state &= ~US_HIDDEN;

        RefreshUnitSprites();

        gUnk_Sio_0203DD90.unk_02 = gUnk_Sio_0203DD90.unk_05;
        gUnk_Sio_0203DD90.unk_03 = gUnk_Sio_0203DD90.unk_05 + 1;
        sub_8049350(4, 0, gUnknown_03001818[gUnk_Sio_0203DD90.unk_05], 0);
        sub_8049F38(proc);
        Proc_Goto(proc, 5);
    }
    else
    {
        if ((unit->state & US_BIT9) != 0)
        {
            gUnknown_03001838[1] = (void *)MU_Create(unit);
            proc->unk_34 = unit->xPos;
            proc->unk_38 = unit->yPos;
            unit->state &= ~US_BIT9;
        }

        sub_8049350(5, 0, gUnk_Sio_0203DD90.unk_06, gUnk_Sio_0203DD90.unk_07);
    }

    return;
}

//! FE8U = 0x0804A51C
void sub_804A51C(struct SioBattleMapProc * proc)
{
    struct Unit * unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    struct Unit * unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    unitA->xPos = proc->unk_2c;
    unitA->yPos = proc->unk_30;

    unitB->xPos = proc->unk_34;
    unitB->yPos = proc->unk_38;

    sub_804C208(unitA, gUnknown_03001838[0], 6, 5, 1, 1, proc);
    sub_804C208(unitB, gUnknown_03001838[1], 8, 5, 0, 0, proc);

    return;
}

extern u8 gUnknown_03001834[];

extern u8 gUnknown_080D9FB7[];

//! FE8U = 0x0804A5A4
void sub_804A5A4(void)
{
    struct Unit * unitB;
    struct Unit * unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);

    // clang-format off

    u8 gUnknown_080D9FB7[2] =
    {
        MU_COMMAND_MOVE_RIGHT,
        MU_COMMAND_HALT,
    };

    // clang-format on

    MU_End(gUnknown_03001838[1]);

    unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);
    unitB->state &= ~US_HIDDEN;

    if (gUnknown_03001834[2] == 1)
    {
        MU_StartMoveScript(gUnknown_03001838[0], gUnknown_080D9FB7);
        unitA->xPos = 7;
    }

    sub_80492D8();

    return;
}

extern struct ProcCmd gUnknown_085AA75C[];

//! FE8U = 0x0804A614
void sub_804A614(ProcPtr proc)
{
    struct Unit * unitA;
    struct Unit * unitB;

    if (MU_IsAnyActive() == 1)
    {
        return;
    }

    unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    HideUnitSprite(unitA);

    gActionData.unitActionType = 2;
    gActionData.targetIndex = gUnknown_03001818[gUnk_Sio_0203DD90.unk_05];

    EquipUnitItemSlot(unitA, gUnknown_03001834[3]);
    BattleGenerateReal(unitA, unitB);

    gBmSt.gameStateBits |= BM_FLAG_LINKARENA;

    Proc_StartBlocking(gUnknown_085AA75C, proc);
    Proc_Break(proc);

    return;
}

//! FE8U = 0x0804A6A4
void sub_804A6A4(ProcPtr proc)
{
    u8 unitIdA = gUnknown_03001818[gUnk_Sio_0203DD90.unk_04];
    u8 unitIdB = gUnknown_03001818[gUnk_Sio_0203DD90.unk_05];

    struct Unit * unitA = GetUnit(unitIdA);
    struct Unit * unitB = GetUnit(unitIdB);

    sub_8049788();

    gUnk_Sio_0203DD90.unk_2c[unitIdA >> 6].newScore = gBattleActor.expGain;
    gUnk_Sio_0203DD90.unk_2c[unitIdA >> 6].unitId = unitIdA;
    unitA->exp = 0;

    gUnk_Sio_0203DD90.unk_2c[unitIdB >> 6].newScore = gBattleTarget.expGain;
    gUnk_Sio_0203DD90.unk_2c[unitIdB >> 6].unitId = unitIdB;
    unitB->exp = 0;

    sub_804D40C(unitA);
    sub_804D40C(unitB);

    SetUnitStatus(unitA, 0);
    SetUnitStatus(unitB, 0);

    MU_EndAll();

    if (GetUnitCurrentHp(unitA) != 0)
    {
        ShowUnitSprite(unitA);
        unitA->state &= ~US_HIDDEN;
    }

    sub_80492D8();
    BG_SetPosition(2, 0, 0);

    if ((GetUnitCurrentHp(unitA) == gBattleActor.hpInitial) && (GetUnitCurrentHp(unitB) == gBattleTarget.hpInitial))
    {
        gUnk_Sio_0203DD90.unk_09++;
    }
    else
    {
        gUnk_Sio_0203DD90.unk_09 = 0;
    }

    Proc_Break(proc);

    return;
}

extern struct Vec2 gUnknown_080D9F48[];

//! FE8U = 0x0804A7C0
void sub_804A7C0(ProcPtr proc)
{
    u8 unitIdA = gUnknown_03001818[gUnk_Sio_0203DD90.unk_04];
    u8 unitIdB = gUnknown_03001818[gUnk_Sio_0203DD90.unk_05];

    struct Unit * unitA = GetUnit(unitIdA);
    struct Unit * unitB = GetUnit(unitIdB);

    s8 flag = 0;

    int indexA = sub_80493A8(unitIdA);
    int indexB = sub_80493A8(unitIdB);

    gUnknown_03001838[1] = NULL;
    gUnknown_03001838[0] = NULL;

    if (((unitA->state & (US_DEAD | US_BIT16)) != 0) || (unitA->pCharacterData == NULL))
    {
        gUnk_Sio_0203DD90.unk_0A[unitIdA >> 6]--;
    }
    else
    {
        gUnknown_03001838[0] = (void *)MU_Create(unitA);
        MU_DisableAttractCamera(gUnknown_03001838[0]);

        unitA->state |= US_HIDDEN;

        flag = 1;

        sub_804C208(
            unitA, gUnknown_03001838[0], gUnknown_080D9F48[indexA].x, gUnknown_080D9F48[indexA].y, 2, flag, proc);
    }

    if (((unitB->state & (US_DEAD | US_BIT16)) != 0) || (unitB->pCharacterData == NULL))
    {
        gUnk_Sio_0203DD90.unk_0A[unitIdB >> 6]--;
    }
    else
    {
        gUnknown_03001838[1] = (void *)MU_Create(unitB);
        MU_DisableAttractCamera(gUnknown_03001838[1]);

        unitB->state |= US_HIDDEN;

        if (!flag)
        {
            flag = 1;
        }
        else
        {
            flag = 0;
        }

        sub_804C208(
            unitB, gUnknown_03001838[1], gUnknown_080D9F48[indexB].x, gUnknown_080D9F48[indexB].y, 2, flag, proc);
    }

    sub_80492D8();

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0804A914
void sub_804A914(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        int j;
        int countA;
        int countB;

        if (sub_8042194(i) == 0)
        {
            continue;
        }

        countA = 0;
        countB = 0;

        for (j = 0; j < 5; j++)
        {
            struct Unit * unit;

            if (gUnknown_03001818[i + j * 5] == 0)
            {
                continue;
            }

            countB++;

            unit = GetUnit(gUnknown_03001818[i + j * 5]);

            if ((unit->state & (US_DEAD | US_BIT16)) != 0)
            {
                continue;
            }

            if (sub_8049C94(unit) == 1)
            {
                countA++;
            }
        }

        if ((countA == 0) && (countB != 0))
        {
            gUnk_Sio_0203DD90.unk_0A[i] = 0;
        }
    }

    return;
}

//! FE8U = 0x0804A9A4
void sub_804A9A4(ProcPtr proc)
{
    u8 r4_;

    u8 r6 = gUnknown_03001818[gUnk_Sio_0203DD90.unk_04];
    u8 r7 = gUnknown_03001818[gUnk_Sio_0203DD90.unk_05];

    struct Unit * r4 = GetUnit(r6);
    struct Unit * r2 = GetUnit(r7);

    if ((r4->state & (US_DEAD | US_BIT16)) == 0)
    {
        r4->state &= ~US_HIDDEN;
    }

    if ((r2->state & (US_DEAD | US_BIT16)) == 0)
    {
        r2->state &= ~US_HIDDEN;
    }

    if (gUnk_Sio_0203DD90.unk_0A[r6 >> 6] == 0)
    {
        r4_ = r6 >> 6;
    }
    else if (gUnk_Sio_0203DD90.unk_0A[r7 >> 6] == 0)
    {
        r4_ = r7 >> 6;
    }
    else
    {
        goto _end;
    }

    gUnk_Sio_0203DD90.unk_0F[gLinkArenaSt.unk_A0 - gUnk_Sio_0203DD90.unk_0E] = r4_;
    gUnk_Sio_0203DD90.unk_0E++;

    if (gUnk_Sio_0203DD90.unk_0E == gLinkArenaSt.unk_A0)
    {

        if (gUnk_Sio_0203DD90.unk_0A[r6 >> 6] != 0)
        {
            r4_ = r6 >> 6;
        }
        else
        {
            r4_ = r7 >> 6;
        }

        gUnk_Sio_0203DD90.unk_0F[0] = r4_;

        sub_80492E8(0xff);

        Proc_Break(proc);

        return;
    }

_end:
    sub_80492E8(gPlaySt.faction);
    Proc_Break(proc);

    return;
}

//! FE8U = 0x0804AA88
void sub_804AA88(void)
{
    MU_EndAll();
    MU_EndAll();

    sub_8049594();
    sub_80495F4();

    RefreshUnitSprites();

    return;
}

//! FE8U = 0x0804AAA4
void sub_804AAA4(void)
{
    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        gSioMsgBuf.kind = SIO_MSG_84;
        gSioMsgBuf.sender = gSioSt->selfId;
        gSioMsgBuf.param = 0;
        SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));
    }

    return;
}

//! FE8U = 0x0804AADC
bool sub_804AADC(void * data)
{
    u8 * cast = data;

    switch (cast[0])
    {
        case 1:
        case 6:
        case 7:
            return true;
    }

    return false;
}

extern const struct PopupInstruction gUnknown_085AA1FC[];
extern const struct PopupInstruction gUnknown_085AA21C[];

struct SioProc85AA4CC
{
    PROC_HEADER;
    int unk_2c;
    int unk_30;
    int unk_34;
    int unk_38;
};

extern u8 gUnknown_03001834[];
extern u8 gUnknown_03001850[];

//! FE8U = 0x0804AAFC
void sub_804AAFC(struct SioProc85AA4CC * proc)
{
    u8 buf[4];

    u16 got = SioReceiveData(gUnknown_03001834, buf, sub_804AADC);

    if (got != 0)
    {
        switch (gUnknown_03001834[0])
        {
            case 1:
                sub_80493D0(gUnknown_03001834[1], 0, &gUnk_Sio_0203DD90.unk_04, &proc->unk_2c, &proc->unk_30);
                Proc_Goto(proc, 1);

                break;

            case 6:
                EndLinkArenaPointsBox();
                SioStrCpy(gUnk_Sio_0203DAC5[buf[0]], gUnknown_03001850);
                NewPopup_Simple(gUnknown_085AA1FC, 0x60, 0, 0);

                Proc_Goto(proc, 3);

                break;

            case 7:
                EndLinkArenaPointsBox();
                NewPopup_Simple(gUnknown_085AA21C, 0x60, 0, 0);

                Proc_Goto(proc, 4);

                break;
        }
    }

    sub_804AAA4();

    return;
}

//! FE8U = 0x0804ABB4
bool sub_804ABB4(void * data)
{
    u8 * cast = data;

    switch (cast[0])
    {
        case 2:
        case 3:
            return true;
    }

    return false;
}

//! FE8U = 0x0804ABCC
void sub_804ABCC(struct SioProc85AA4CC * proc)
{
    struct Unit * unit;
    u8 buf[4];

    u16 got = SioReceiveData(gUnknown_03001834, buf, sub_804ABB4);

    if (got != 0)
    {
        switch (gUnknown_03001834[0])
        {
            case 2:
                unit = GetUnit(gUnknown_03001834[2]);

                if ((unit->state & US_BIT9) == 0)
                {
                    MU_End(gUnknown_03001838[0]);
                }
                else
                {
                    unit->xPos = proc->unk_2c;
                    unit->yPos = proc->unk_30;
                }

                unit->state &= 0xfffffffe;

                RefreshUnitSprites();

                Proc_Goto(proc, 0);

                break;

            case 3:
                sub_80493D0(gUnknown_03001834[1], 1, &gUnk_Sio_0203DD90.unk_05, &proc->unk_34, &proc->unk_38);
                Proc_Goto(proc, 2);
                break;
        }
    }

    sub_804AAA4();

    return;
}

//! FE8U = 0x0804AC68
void sub_804AC68(struct Unit * unit, int idx, int * xOut, int * yOut)
{
    gUnknown_03001838[idx] = MU_Create(unit);

    *xOut = unit->xPos;
    *yOut = unit->yPos;

    unit->state &= ~US_BIT9;

    return;
}

//! FE8U = 0x0804ACAC
bool sub_804ACAC(void * data)
{
    u8 * cast = data;

    switch (cast[0])
    {
        case 4:
        case 5:
            return true;
    }

    return false;
}

//! FE8U = 0x0804ACC4
void sub_804ACC4(struct SioProc85AA4CC * proc)
{
    struct Unit * unitA;
    struct Unit * unitB;
    u8 buf[4];

    u16 got = SioReceiveData(gUnknown_03001834, buf, sub_804ACAC);

    if (got != 0)
    {
        switch (gUnknown_03001834[0])
        {
            case 4:
                unitA = GetUnit(gUnknown_03001834[2]);

                if ((unitA->state & US_BIT9) == 0)
                {
                    MU_End(gUnknown_03001838[1]);
                }
                else
                {
                    unitA->xPos = proc->unk_34;
                    unitA->yPos = proc->unk_38;
                }

                unitA->state &= ~US_HIDDEN;

                RefreshUnitSprites();
                Proc_Goto(proc, 1);

                break;

            case 5:
                unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
                unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

                if ((unitA->state & US_BIT9) != 0)
                {
                    sub_804AC68(unitA, 0, &proc->unk_2c, &proc->unk_30);
                }

                if ((unitB->state & US_BIT9) != 0)
                {
                    sub_804AC68(unitB, 1, &proc->unk_34, &proc->unk_38);
                }

                Proc_Break(proc);

                break;
        }
    }

    sub_804AAA4();

    return;
}

//! FE8U = 0x0804ADA0
int sub_804ADA0(struct Unit * unit)
{
    int i;

    u16 bestItem = 0;
    u32 bestMight = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = unit->items[i];

        if (item == 0)
        {
            break;
        }

        if (!CanUnitUseWeapon(unit, item))
        {
            continue;
        }

        if (GetItemMight(item) <= bestMight)
        {
            continue;
        }

        bestItem = item;
        bestMight = GetItemMight(item);
    }

    if (bestItem == 0)
    {
        return 0;
    }

    return bestMight + GetUnitPower(unit);
}

//! FE8U = 0x0804AE08
int sub_804AE08(int playerId)
{
    int i;

    int count = 0;
    int score = 0;

    for (i = playerId; i < playerId + 5; i++)
    {
        struct Unit * unit = GetUnit(i);

        if ((unit->state & (US_DEAD | US_BIT16)) != 0)
        {
            continue;
        }

        if (unit->pCharacterData == NULL)
        {
            continue;
        }

        count++;

        score += sub_804ADA0(unit);
        score += GetUnitCurrentHp(unit);
    }

    score += gUnk_Sio_0203DD90.currentScore[playerId >> 6];

    score = Div(score, count);

    return score;
}

//! FE8U = 0x0804AE7C
bool sub_804AE7C(struct SioBattleMapProc * proc, int b)
{
    if ((gKeyStatusPtr->heldKeys & START_BUTTON) != 0)
    {
        EndLinkArenaPointsBox();
        proc->unk_58 = b;

        if (!gPlaySt.config.disableSoundEffects)
        {
            // Another non-usage of the PlaySoundEffects macro
            m4aSongNumStart(0x68);
            Proc_Goto(proc, 3);
        }

        return true;
    }

    return false;
}

//! FE8U = 0x0804AEC4
void sub_804AEC4(ProcPtr proc)
{
    int i;

    int bestScore = -1;

    if (sub_804AE7C(proc, 0) == true)
    {
        return;
    }

    for (i = 0; i < 4; i++)
    {
        u32 score;

        if (!sub_8042194(i))
        {
            continue;
        }

        if (gUnk_Sio_0203DD90.unk_0A[i] == 0)
        {
            continue;
        }

        if (gPlaySt.faction == i)
        {
            continue;
        }

        score = sub_804AE08(i * 0x40 + 1);

        if (bestScore <= score)
        {
            continue;
        }

        bestScore = score;
        gUnk_Sio_0203DD90.unk_02 = i;
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0804AF2C
int ITEMRANGEDONE_sub_804AF2C(int unused, struct Unit * unit)
{
    u16 weapon = GetUnitEquippedWeapon(unit);

    if (weapon == 0)
    {
        return 1;
    }

    if (GetItemMaxRange(weapon) == 1)
    {
        return 1;
    }

    if (GetItemMinRange(weapon) > 1)
    {
        return 2;
    }

    return 1;
}

//! FE8U = 0x0804AF5C
void sub_804AF5C(struct SioBattleMapProc * proc)
{
    struct AiCombatSimulationSt sim;
    int i;
    int bestSlot;
    int slot;
    int allegiance;

    int bestScore = 0;
    u8 selectedUnitId = 0;
    u8 targetUnitId = 0;

    if (sub_804AE7C(proc, 1) == true)
    {
        return;
    }

    gAiState.combatWeightTableId = 0xe;
    allegiance = gPlaySt.faction * 0x40;

    for (i = allegiance + 1; i < allegiance + 6; i++)
    {
        gActiveUnitId = i;
        gActiveUnit = GetUnit(gActiveUnitId);

        if ((gActiveUnit->state & (US_DEAD | US_BIT16)) != 0)
        {
            continue;
        }

        if (gActiveUnit->pCharacterData == NULL)
        {
            continue;
        }

        for (slot = 0; slot < UNIT_ITEM_COUNT; slot++)
        {
            int targetFaction;
            int j;
            int flags;

            u16 item = gActiveUnit->items[slot];

            if (item == 0)
            {
                continue;
            }

            if (!CanUnitUseWeapon(gActiveUnit, item))
            {
                continue;
            }

            bestSlot = slot;
            flags = 0;

            if (GetItemMinRange(item) > 2)
            {
                continue;
            }

            if ((GetItemAttributes(item) & IA_UNCOUNTERABLE) != 0)
            {
                continue;
            }

            if (GetItemMinRange(item) == 1)
            {
                flags |= 2;
            }

            if (GetItemMaxRange(item) > 1)
            {
                flags |= 1;
            }

            sim.itemSlot = bestSlot;

            targetFaction = gUnk_Sio_0203DD90.unk_02 * 0x40;

            for (j = targetFaction + 1; j < targetFaction + 6; j++)
            {
                struct AiCombatSimulationSt * simp = &sim;
                int flags2;
                u8 * r7 = gUnknown_03001834;
                struct Unit * unit = GetUnit(j);

                if ((unit->state & (US_DEAD | US_BIT16)) != 0)
                {
                    continue;
                }

                if (unit->pCharacterData == NULL)
                {
                    continue;
                }

                flags2 = flags & 2; // permuter
                simp->targetId = j;

                if (((u8)flags2) != 0)
                {
                    simp->xMove = unit->xPos + 1;
                    simp->yMove = unit->yPos;

                    AiSimulateBattleAgainstTargetAtPosition(&sim);

                    if (bestScore <= sim.score)
                    {
                        bestScore = sim.score;
                        selectedUnitId = gActiveUnitId;
                        targetUnitId = j;

                        if (flags == 3)
                        {
                            r7[2] = ITEMRANGEDONE_sub_804AF2C(3, unit);
                        }
                        else
                        {
                            r7[2] = 1;
                        }
                        r7[3] = bestSlot;
                    }
                }

                if ((flags & 1) != 0)
                {
                    simp->xMove = unit->xPos + 1;
                    simp->yMove = unit->yPos - 1;

                    AiSimulateBattleAgainstTargetAtPosition(&sim);

                    if (bestScore <= sim.score)
                    {
                        bestScore = sim.score;
                        selectedUnitId = gActiveUnitId;
                        targetUnitId = j;

                        if (flags == 3)
                        {
                            r7[2] = ITEMRANGEDONE_sub_804AF2C(3, unit);
                        }
                        else
                        {
                            r7[2] = 2;
                        }
                        r7[3] = bestSlot;
                    }
                }
            }
        }
    }

    sub_80493D0(selectedUnitId, 0, &gUnk_Sio_0203DD90.unk_04, &proc->unk_2c, &proc->unk_30);
    gUnknown_03001834[1] = targetUnitId;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0804B190
void sub_804B190(ProcPtr proc)
{
    struct Unit * unit = GetUnit(gUnknown_03001834[1]);

    StartAiTargetCursor(unit->xPos * 16, unit->yPos * 16, 2, proc);

    return;
}

//! FE8U = 0x0804B1C0
void sub_804B1C0(struct SioProc85AA4CC * proc)
{
    struct Unit * unitA;
    struct Unit * unitB;

    sub_80493D0(gUnknown_03001834[1], 1, &gUnk_Sio_0203DD90.unk_05, &proc->unk_34, &proc->unk_38);

    unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    if ((unitA->state & US_BIT9) != 0)
    {
        sub_804AC68(unitA, 0, &proc->unk_2c, &proc->unk_30);
    }

    if ((unitB->state & US_BIT9) != 0)
    {
        sub_804AC68(unitB, 1, &proc->unk_34, &proc->unk_38);
    }

    return;
}

//! FE8U = 0x0804B250
void sub_804B250(ProcPtr proc)
{
    if (sub_804AE7C(proc, 2) == 1)
    {
        return;
    }

    if (MU_IsAnyActive() != 0)
    {
        return;
    }

    Proc_Break(proc);

    return;
}

extern u8 gUnknown_085AA22C[];

//! FE8U = 0x0804B278
void sub_804B278(void)
{
    int i;
    int j;

    int yOffset = (gUnknown_085AA22C[GetGameClock() & 0x1f] + 4) >> 1;

    for (i = 0; i < 4; i++)
    {
        if (!sub_8042194(gUnknown_080D9F28[gSioSt->selfId][i]))
        {
            continue;
        }

        for (j = 0; j < 5; j++)
        {
            struct Unit * unit = GetUnit(gUnknown_03001818[i * 5 + j]);

            if (!UNIT_IS_VALID(unit))
            {
                continue;
            }

            if ((unit->state & US_BIT9) == 0)
            {
                continue;
            }

            CallARM_PushToSecondaryOAM(
                unit->xPos * 16, unit->yPos * 16 - yOffset, gObject_16x8,
                ((GetUnitDisplayedSpritePalette(unit) & 0xf) << 12) + 0x9f0);
            CallARM_PushToSecondaryOAM(
                unit->xPos * 16, (unit->yPos * 16 - yOffset) + 8, gObject_16x8,
                ((GetUnitDisplayedSpritePalette(unit) & 0xf) << 12) + 0x9F2);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085AA24C[];

//! FE8U = 0x0804B38C
void sub_804B38C(void)
{
    Proc_Start(gUnknown_085AA24C, PROC_TREE_4);
    return;
}

//! FE8U = 0x0804B3A0
void sub_804B3A0(void)
{
    Proc_EndEach(gUnknown_085AA24C);
    return;
}
