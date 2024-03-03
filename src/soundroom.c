#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"

#include "soundroom.h"

// TODO: Implicit declarations
void PutMenuScrollBarAt(int, int);
void UpdateMenuScrollBarConfig(int, int, int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);

struct VolumeGraphBufferProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

struct SoundRoomSpriteDrawProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

struct Unknown_08A212DC
{
    u8 x;
    u8 y;
} __attribute__((packed));

struct Unknown201F148
{
    /* 00 */ struct Font font;
    /* 18 */ struct Text text[7];
    /* 50 */ u16 unk_50;
};

extern struct Unknown201F148 gUnk_SoundRoom_0201F148;
extern u8 gSoundRoomVolumeGraphBuffer[][0x31];

extern u8 gUnknown_08A2C908[]; // gfx
extern u16 gUnknown_08A01EE4[]; // pal
extern u16 gUnknown_08A01F04[]; // pal
extern u8 gUnknown_08A2C4C8[]; // tsa
extern u8 gUnknown_08A2C5A8[]; // tsa

extern u8 gUnknown_08A2D32C[]; // gfx
extern u16 gUnknown_08A2E1B8[]; // pal

extern u8 Img_SoundRoomUiElements[];
extern u16 Pal_SoundRoomUiElements[];

extern u8 gUnknown_08A2C92C[];
extern u8 gUnknown_08A2C7A4[];

u16 * CONST_DATA gUnknown_08A212D4 = (u16 *)gGenericBuffer;
void * CONST_DATA gUnknown_08A212D8 = gGenericBuffer + 0x800;
struct Unknown_08A212DC * CONST_DATA gUnknown_08A212DC = (void *)(gGenericBuffer + 0x1000);
s8 * CONST_DATA gSoundRoomShuffleBuffer = gGenericBuffer + 0x1200;

//! FE8U = 0x080AEC7C
bool IsSoundRoomCompleted(struct SoundRoomProc * proc)
{
    if (proc->completionPercent == 100)
    {
        return TRUE;
    }

    return FALSE;
}

//! FE8U = 0x080AEC90
bool sub_80AEC90(void)
{
    return FALSE;
}

//! FE8U = 0x080AEC94
int CountTotalSoundRoomSongs(void)
{
    int i = 0;

    do
    {
        if (gSoundRoomTable[i].bgmId < 0)
        {
            break;
        }

        i++;
    } while (1);

    return i;
}

//! FE8U = 0x080AECB4
int CountSecretSoundRoomSongs(void)
{
    int i = 0;
    int count = 0;

    do
    {
        if (gSoundRoomTable[i].bgmId < 0)
        {
            return count;
        }

        if (gSoundRoomTable[i].displayCondFunc != NULL)
        {
            count++;
        }

        i++;
    } while (1);
}

//! FE8U = 0x080AECEC
bool IsSoundRoomSongPlayable(struct SoundRoomProc * proc, int flag)
{
    if ((*(proc->flags + (flag >> 5)) >> (flag & 0x1f)) & 1)
    {
        return TRUE;
    }

    return FALSE;
}

//! FE8U = 0x080AED10
int CountDisplayedSoundRoomSongs(struct SoundRoomProc * proc)
{
    int i = 0;

    int result = 0;

    do
    {
        if (gSoundRoomTable[i].bgmId < 0)
        {
            return result;
        }

        if (gSoundRoomTable[i].displayCondFunc != NULL)
        {
            if ((*(proc->flags + (i >> 5)) >> (i & 0x1f)) & 1)
            {
                result = i + 1;
            }
        }
        else
        {
            result = i + 1;
        }

        i++;

    } while (1);
}

//! FE8U = 0x080AED64
void InitSoundRoomSongData(struct SoundRoomProc * proc)
{
    struct SoundRoomSaveData soundRoomData;

    proc->totalSongs = CountTotalSoundRoomSongs();
    CpuFill16(0, proc->flags, 0x10);

    proc->playableSongs = 0;

    if (LoadAndVerifySoundRoomData(&soundRoomData))
    {
        int i;
        for (i = 0; gSoundRoomTable[i].bgmId > -1; i++)
        {
            if (gSoundRoomTable[i].displayCondFunc != NULL)
            {
                continue;
            }

            if ((soundRoomData.flags[gSoundRoomTable[i].bgmId >> 5] >> (gSoundRoomTable[i].bgmId & 0x1f)) & 1)
            {
                *(proc->flags + (i >> 5)) |= 1 << (i & 0x1f);
                proc->playableSongs++;
            }
        }

        proc->completionPercent = (proc->playableSongs * 100) / (proc->totalSongs - CountSecretSoundRoomSongs());

        for (i = 0; gSoundRoomTable[i].bgmId > -1; i++)
        {
            if (gSoundRoomTable[i].displayCondFunc == NULL)
            {
                continue;
            }

            if (!((soundRoomData.flags[gSoundRoomTable[i].bgmId >> 5] >> (gSoundRoomTable[i].bgmId & 0x1f)) & 1))
            {
                if (!gSoundRoomTable[i].displayCondFunc(proc))
                {
                    continue;
                }
            }

            *(proc->flags + (i >> 5)) |= 1 << (i & 0x1f);
            proc->playableSongs++;
            proc->unk_2e = 1;
        }
    }

    proc->totalSongs = CountDisplayedSoundRoomSongs(proc);

    return;
}

//! FE8U = 0x080AEEC0
void sub_80AEEC0(void)
{
    return;
}

//! FE8U = 0x080AEEC4
void SoundRoomSongChange_FadeOutPrevious(struct Proc * proc)
{
    struct SoundRoomProc * parent = proc->proc_parent;
    CallSomeSoundMaybe(0, 0x100, 0, 0x78, proc);
    parent->unk_3f = 1;
    return;
}

//! FE8U = 0x080AEEE8
void SoundRoomSongChange_StartNext(struct Proc * proc)
{
    struct SoundRoomProc * parent = proc->proc_parent;
    StartSoundRoomSong(parent, gSoundRoomShuffleBuffer[parent->shuffleIndex], 0);
    DrawSoundRoomSongTitle(parent->currentSongIdx);
    parent->unk_3f = 0;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_SoundRoomSongChange[] =
{
    PROC_CALL(SoundRoomSongChange_FadeOutPrevious),
    PROC_YIELD,

    PROC_CALL(SoundRoomSongChange_StartNext),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AEF24
void PlayNextShuffledSong(struct SoundRoomProc * proc)
{
    Proc_Start(gProcScr_SoundRoomSongChange, proc);

    proc->shuffleIndex++;

    if ((gSoundRoomShuffleBuffer[proc->shuffleIndex] == -1) || (proc->shuffleIndex == 0x80))
    {
        proc->shuffleIndex = 0;
    }

    return;
}

//! FE8U = 0x080AEF64
void InitSoundRoomShuffleBuffer(struct SoundRoomProc * proc)
{
    int seed1;
    int seed2;
    int it;
    int i;
    int numAvailableSongs;

    for (i = 0; i < 0x80; i++)
    {
        gSoundRoomShuffleBuffer[i] = -1;
    }

    seed1 = GetGameClock() & 0x7f;
    it = seed1;
    i = 0;

    do
    {
        // TODO: Permuter; addition does not seem to match here
        if ((*(proc->flags - -(it >> 5)) >> (it & 0x1f)) & 1)
        {
            gSoundRoomShuffleBuffer[i] = it;
            i++;
        }

        it = ((it + 1) % 0x80);
    } while (it != seed1);

    numAvailableSongs = i;

    seed2 = GetGameClock() + 0x7b;
    for (i = 0; i < 0x100; i++)
    {
        int idx1;
        int idx2;

        seed2 = ((seed2 * 0xd) + 1) % 0x8000;
        idx1 = (seed2 >> 8) % numAvailableSongs;

        seed2 = ((seed2 * 0xd) + 1) % 0x8000;
        idx2 = (seed2 >> 8) % numAvailableSongs;

        if (idx1 != idx2)
        {
            gSoundRoomShuffleBuffer[idx1] = gSoundRoomShuffleBuffer[idx1] + gSoundRoomShuffleBuffer[idx2];
            gSoundRoomShuffleBuffer[idx2] = gSoundRoomShuffleBuffer[idx1] - gSoundRoomShuffleBuffer[idx2];
            gSoundRoomShuffleBuffer[idx1] = gSoundRoomShuffleBuffer[idx1] - gSoundRoomShuffleBuffer[idx2];
        }
    }

    proc->shuffleIndex = 0;

    if ((*(proc->flags + (proc->curIndex >> 5)) >> (proc->curIndex & 0x1f)) & 1)
    {
        for (; gSoundRoomShuffleBuffer[proc->shuffleIndex] != proc->curIndex; proc->shuffleIndex++)
        {
            if (proc->shuffleIndex == 0x80)
            {
                proc->shuffleIndex = 0;
                goto _080AF0C4;
            }
        }
    }
_080AF0C4:
    proc->isSongPlaying = 1;
    PlayNextShuffledSong(proc);

    return;
}

//! FE8U = 0x080AF0E0
bool SoundRoom_StartNextSong_Positive(struct SoundRoomProc * proc)
{
    u8 idx;

    for (idx = (proc->currentSongIdx + 1) & 0x7f;; idx = (idx + 1), idx &= 0x7f)
    {
        if (!(((*(proc->flags + (idx >> 5))) >> (idx & 0x1f)) & 1))
        {
            continue;
        }

        if (StartSoundRoomSong(proc, idx, 0x20))
        {
            DrawSoundRoomSongTitle(proc->currentSongIdx);
            return TRUE;
        }

        return FALSE;
    }
}

//! FE8U = 0x080AF140
bool SoundRoom_StartNextSong_Negative(struct SoundRoomProc * proc)
{
    u8 idx;

    for (idx = (proc->currentSongIdx - 1) & 0x7f;; idx = (idx - 1), idx &= 0x7f)
    {
        if (!(((*(proc->flags + (idx >> 5))) >> (idx & 0x1f)) & 1))
        {
            continue;
        }

        if (StartSoundRoomSong(proc, idx, 0x20))
        {
            DrawSoundRoomSongTitle(proc->currentSongIdx);
            return TRUE;
        }

        return FALSE;
    }
}

//! FE8U = 0x080AF1A0
void UpdateVolumeGraphBuffer(int bufferIndex, int value)
{
    int i;

    for (i = 0; i < 0x30; i++)
    {
        gSoundRoomVolumeGraphBuffer[bufferIndex][i] = gSoundRoomVolumeGraphBuffer[bufferIndex][i + 1];
    }

    gSoundRoomVolumeGraphBuffer[bufferIndex][0x30] = value;

    return;
}

//! FE8U = 0x080AF1D8
void InitSoundRoomVolumeGraph(void)
{
    int i;

    for (i = 0; i < 0x31; i++)
    {
        gSoundRoomVolumeGraphBuffer[0][i] = 0;
        gSoundRoomVolumeGraphBuffer[1][i] = 0;
    }

    Decompress(Img_SoundRoomVolumeGraph, (void *)0x06010800);
    ApplyPalettes(Pal_SoundRoomVolumeGraph, 0x1D, 3);

    return;
}

//! FE8U = 0x080AF220
void VolumeGraphBuffer_Init(struct VolumeGraphBufferProc * proc)
{
    proc->unk_2c = 0;
    return;
}

//! FE8U = 0x080AF228
void VolumeGraphBuffer_Null(void)
{
    return;
}

struct SoundInfo * CONST_DATA gpSoundInfo = &gSoundInfo;

//! FE8U = 0x080AF22C
void VolumeGraphBuffer_Loop(struct VolumeGraphBufferProc * proc)
{
    int i;

    u8 r7 = 0;
    u8 r5 = 0;
    u8 r8 = -1;
    u8 ip = -1;

    for (i = 0; i < 0xe0; i++)
    {
        gUnknown_08A212DC[i].x = (u8)(gpSoundInfo->pcmBuffer[PCM_DMA_BUF_SIZE + proc->unk_2c] - 0x80) >> 1;
        gUnknown_08A212DC[i].y = 0xf0 - ((u8)((gpSoundInfo->pcmBuffer[proc->unk_2c]) - 0x80) >> 1);

        r5 = r5 > gUnknown_08A212DC[i].x ? r5 : gUnknown_08A212DC[i].x;
        ip = ip < gUnknown_08A212DC[i].x ? ip : gUnknown_08A212DC[i].x;

        r7 = r7 > gUnknown_08A212DC[i].y ? r7 : gUnknown_08A212DC[i].y;
        r8 = r8 < gUnknown_08A212DC[i].y ? r8 : gUnknown_08A212DC[i].y;

        proc->unk_2c++;
        if (proc->unk_2c >= PCM_DMA_BUF_SIZE)
        {
            proc->unk_2c -= PCM_DMA_BUF_SIZE;
        }
    }

    r5 = (r5 - ip) < 0x3f ? r5 - ip : 0x3f;
    r7 = (r7 - r8) < 0x3f ? r7 - r8 : 0x3f;

    UpdateVolumeGraphBuffer(0, (r5 * 3) / 4);
    UpdateVolumeGraphBuffer(1, (r7 * 3) / 4);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_VolumeGraphBuffer[] =
{
    PROC_YIELD,
    PROC_CALL(VolumeGraphBuffer_Init),
    PROC_YIELD,

    PROC_CALL(VolumeGraphBuffer_Null),
    PROC_REPEAT(VolumeGraphBuffer_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AF338
void sub_80AF338(struct SoundRoomProc * proc)
{
    int currentSegment = proc->bgYOffset;
    int totalRows = (proc->totalSongs + 3) / 4;
    UpdateMenuScrollBarConfig(8, currentSegment, totalRows, 5);
    return;
}

//! FE8U = 0x080AF350
void sub_80AF350(struct SoundRoomProc * proc)
{
    int x = (proc->curIndex & 3) * 32 + 96;
    int y = (proc->curIndex >> 2) * 16;

    int r2 = (proc->bgYOffset - 64);
    y = y - r2;
    ShowSysHandCursor(x, y, 2, 0x800);
    return;
}

//! FE8U = 0x080AF378
s8 sub_80AF378(struct SoundRoomProc * proc)
{
    int adjusted = ((proc->curIndex / 4) * 16 - proc->bgYOffset) / 16;

    if (proc->bgYOffset != 0 && adjusted <= 0)
    {
        return -1;
    }

    if ((proc->bgYOffset / 16) + 5 > (proc->totalSongs - 1) / 4)
    {
        return 0;
    }
    else if (adjusted < 4)
    {
        return 0;
    }
    else
    {
        return +1;
    }
}

//! FE8U = 0x080AF3C8
void sub_80AF3C8(struct SoundRoomProc * proc)
{
    int i;
    int color;

    int var = ((proc->bgYOffset >> 4) - 1) * 4;
    BG_Fill(gBG2TilemapBuffer, 0);

    for (i = var; i < (var + 28); i++)
    {
        color = TEXT_COLOR_SYSTEM_GRAY;

        if (i < 0)
        {
            continue;
        }

        if (i >= proc->totalSongs)
        {
            break;
        }

        if (IsSoundRoomSongPlayable(proc, i))
        {
            color = TEXT_COLOR_SYSTEM_WHITE;
        }
        else
        {
            if ((gSoundRoomTable[i].displayCondFunc) != 0)
            {
                PutTwoSpecialChar(
                    gBG2TilemapBuffer + TILEMAP_INDEX(12 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)),
                    TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);

                continue;
            }
        }

        if (i >= 99)
        {
            PutNumber(gBG2TilemapBuffer + TILEMAP_INDEX(13 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)), color, i + 1);
        }
        else
        {
            PutNumber2Digit(
                gBG2TilemapBuffer + TILEMAP_INDEX(13 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)), color, i + 1);
        }
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void sub_80AF4D0(u16 * tm, struct SoundRoomProc * proc)
{
    PutText(&gUnk_SoundRoom_0201F148.text[0], tm);
    PutNumber(
        tm + 8, (proc->completionPercent == 100) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        proc->completionPercent);
    PutText(&gUnk_SoundRoom_0201F148.text[6], tm + 9);
    return;
}

void TickCurrentSongTime(struct SoundRoomProc * proc)
{
    if (proc->currentSongTime != 0)
    {
        proc->currentSongTime++;
    }

    return;
}

//! FE8U = 0x080AF524
void SoundRoomUi_Init(struct SoundRoomProc * proc)
{
    SetupBackgrounds(NULL);

    ResetTextFont();
    ResetText();

    LoadObjUIGfx();
    LoadUiFrameGraphics();
    InitSystemTextFont();

    SetDispEnable(1, 1, 1, 1, 1);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetWinEnable(0, 0, 0);

    RegisterBlankTile(0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->curIndex = 0;
    proc->unk_37 = 0;
    proc->bgYOffset = 0;
    proc->unk_3b = 0;
    proc->unk_3c = 0;
    proc->unk_3d = 0;
    proc->unk_3e = 0;
    proc->unk_2f = 0;
    proc->isSongPlaying = 0;
    proc->currentSongIdx = -1;
    proc->unk_2e = 0;
    proc->currentSongTime = 0;
    proc->unk_3f = 0;

    InitSoundRoomSongData(proc);
    sub_80AFF30();
    TryDrawSoundRoomSongTitle(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x280, 2);
    sub_80AF350(proc);
    sub_80AF3C8(proc);
    StartMenuScrollBarExt(proc, 216, 72, 0x1000, 3);
    sub_80AF338(proc);

    Decompress(gUnknown_08A2C908, (void *)0x06004000);
    ApplyPalette(gUnknown_08A01EE4, 4);
    ApplyPalette(gUnknown_08A01F04, 5);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 1, 7), gUnknown_08A2C4C8, 0x1000);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 5), gUnknown_08A2C5A8, 0x1000);

    sub_80AF4D0(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 6), proc);

    Decompress(gUnknown_08A2D32C, (void *)0x06016000);
    ApplyPalette(gUnknown_08A2E1B8, 0x1C);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_2, -4, 0);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin0Box(4, 66, 240, 144);
    SetWOutLayers(1, 1, 0, 1, 1);

    Decompress(Img_SoundRoomUiElements, (void *)0x06012000);
    ApplyPalettes(Pal_SoundRoomUiElements, 0x13, 3);

    DrawSoundRoomSprites(proc);

    SetBlendAlpha(15, 3);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    StartMuralBackground(proc, NULL, 0xe);

    StartGreenText(proc);

    InitSoundRoomVolumeGraph();
    StartParallelWorker(TickCurrentSongTime, proc);
    Proc_Start(gProcScr_VolumeGraphBuffer, proc);

    return;
}

//! FE8U = 0x080AF7F4
bool StartSoundRoomSong(struct SoundRoomProc * proc, int index, int flagsMaybe)
{
    if (MusicProc4Exists())
    {
        return FALSE;
    }

    proc->currentSongIdx = index;
    proc->currentSongTime = 1;
    CallSomeSoundMaybe(gSoundRoomTable[index].bgmId, 0x100, 0x100, flagsMaybe, NULL);

    return TRUE;
}

//! FE8U = 0x080AF840
void StopSoundRoomSong(struct SoundRoomProc * proc)
{
    if (MusicProc4Exists())
    {
        return;
    }

    proc->currentSongTime = 0;
    CallSomeSoundMaybe(0, 0x100, 0, 0x18, 0);
    proc->unk_2f = 0;
    proc->isSongPlaying = 0;

    return;
}

//! FE8U = 0x080AF878
void TryDrawSoundRoomSongTitle(struct SoundRoomProc * proc)
{
    if (IsSoundRoomSongPlayable(proc, proc->curIndex))
    {
        DrawSoundRoomSongTitle(proc->curIndex);
    }
    else
    {
        DrawSoundRoomSongTitle(-1);
    }

    return;
}

//! FE8U = 0x080AF8A0
void SoundRoomUi_Loop_MainKeyHandler(struct SoundRoomProc * proc)
{
    int moveAmt = 0;

    if (proc->unk_37 == 0)
    {

        u16 keys = gKeyStatusPtr->repeatedKeys;
        proc->unk_38 = 4;

        if (gKeyStatusPtr->heldKeys & L_BUTTON)
        {
            keys = gKeyStatusPtr->heldKeys;
            proc->unk_38 = 8;
        }

        if (keys & DPAD_UP)
        {
            moveAmt = -4;
        }

        if (keys & DPAD_DOWN)
        {
            moveAmt = +4;
        }

        if (keys & DPAD_LEFT)
        {
            u32 tmp = proc->curIndex;
            if ((tmp & 3) != 0)
            {
                moveAmt = -1;
            }
        }

        if (keys & DPAD_RIGHT)
        {
            u32 tmp = proc->curIndex;
            if ((tmp & 3) < 3)
            {
                moveAmt = +1;
            }
        }

        if (moveAmt != 0)
        {
            if ((proc->curIndex + moveAmt) < 0)
            {
                return;
            }

            if ((proc->curIndex + moveAmt) >= proc->totalSongs)
            {
                return;
            }

            proc->curIndex += moveAmt;

            TryDrawSoundRoomSongTitle(proc);

            proc->unk_37 = sub_80AF378(proc);

            if (proc->unk_37 != 0)
            {
                if (proc->unk_37 == -1)
                {
                    Proc_Goto(proc, 10);
                }

                if (proc->unk_37 == +1)
                {
                    Proc_Goto(proc, 11);
                }

                sub_80AF3C8(proc);
            }
            else
            {
                sub_80AF350(proc);
            }
        }
    }

    if (proc->unk_37 != 0)
    {
        int tmp;

        proc->bgYOffset = proc->unk_37 * proc->unk_38 + proc->bgYOffset;

        BG_SetPosition(2, -4, proc->bgYOffset & 0xff);

        tmp = proc->bgYOffset;
        if ((tmp & 0xf) == 0)
        {
            proc->unk_37 = 0;
        }

        sub_80AF338(proc);

        return;
    }

    if (gKeyStatusPtr->newKeys & START_BUTTON)
    {
        StopSoundRoomSong(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (IsSoundRoomSongPlayable(proc, proc->curIndex))
        {
            StartSoundRoomSong(proc, proc->curIndex, 0x20);
            return;
        }

        PlaySoundEffect(0x6c);
        return;
    }

    if (gKeyStatusPtr->newKeys & SELECT_BUTTON)
    {
        if (MusicProc4Exists())
        {
            return;
        }

        Proc_Goto(proc, 2);

        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 3);
        return;
    }

    return;
}

//! FE8U = 0x080AFA64
void SoundRoomUi_RestartTitleMusic(struct SoundRoomProc * proc)
{
    if (!MusicProc4Exists())
    {
        CallSomeSoundMaybe(0x43, 0, 0xc0, 0x18, 0);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFA94
void SoundRoomUi_OnEnd(struct SoundRoomProc * proc)
{
    EndMuralBackground();
    EndAllProcChildren(proc);
    Proc_EndEach(gProcScr_VolumeGraphBuffer);

    return;
}

//! FE8U = 0x080AFAB4
void sub_80AFAB4(struct SoundRoomProc * proc)
{
    proc->unk_3c = -proc->unk_3b / 3;
    proc->unk_3d = (-(proc->unk_3b) * 2) / 3;

    proc->unk_3e = proc->unk_3b;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    sub_80AC844(gUnknown_08A212D4, 0, 7, 1, proc->unk_3d + 1, 7, 10, 11);
    sub_80AC844(gUnknown_08A212D4, 10, 5, 1, proc->unk_3e + 11, 5, 18, 14);

    sub_80AC844(gUnknown_08A212D8, 12, 0, 2, proc->unk_3e + 12, 0, 16, 32);
    sub_80AC844(gUnknown_08A212D8, 0, 0, 0, proc->unk_3e + 15, 6, 10, 2);

    PutMenuScrollBarAt(proc->unk_3e * 8 + 216, 72);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080AFBBC
void SoundRoomUi_80AFBBC(struct SoundRoomProc * proc)
{
    proc->unk_3b = 0;

    CallARM_FillTileRect(TILEMAP_LOCATED(gUnknown_08A212D4, 0, 7), gUnknown_08A2C4C8, 0x1000);
    CallARM_FillTileRect(TILEMAP_LOCATED(gUnknown_08A212D4, 10, 5), gUnknown_08A2C5A8, 0x1000);

    CpuFastCopy(gBG2TilemapBuffer, gUnknown_08A212D8, 0x800);

    sub_80AF4D0(gUnknown_08A212D8, proc);

    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 2, 19), gUnknown_08A2C92C, 0x1200);
    CallARM_FillTileRect(TILEMAP_LOCATED(gUnknown_08A212D4, 1, 25), gUnknown_08A2C7A4, 0x1000);

    HideSysHandCursor();

    proc->unk_3a = 0;

    return;
}

//! FE8U = 0x080AFC60
void SoundRoomUi_Loop_MainUiSlideOut(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = ((proc->unk_3a * 2 + proc->unk_3a) << 3) * proc->unk_3a;

    proc->unk_3b = tmp >> 6;

    sub_80AFAB4(proc);

    if (proc->unk_3b == 24)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFC98
void SoundRoomUi_80AFC98(struct SoundRoomProc * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | SELECT_BUTTON))
    {
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT)
    {
        SoundRoom_StartNextSong_Positive(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
    {
        SoundRoom_StartNextSong_Negative(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 3);
        return;
    }

    return;
}

//! FE8U = 0x080AFCE4
void SoundRoomUi_80AFCE4(struct SoundRoomProc * proc)
{
    TryDrawSoundRoomSongTitle(proc);
    proc->unk_3a = 0;
    return;
}

//! FE8U = 0x080AFCF8
void SoundRoomUi_Loop_MainUiSlideIn(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = (tmp / 64);

    sub_80AFAB4(proc);

    if (proc->unk_3b == 0)
    {
        sub_80AF350(proc);
        sub_80AF338(proc);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFD48
void SoundRoomUi_80AFD48(struct SoundRoomProc * proc)
{
    proc->unk_3a = 0;
    proc->currentSongTime = 0;
    InitSoundRoomShuffleBuffer(proc);
    return;
}

//! FE8U = 0x080AFD5C
void SoundRoomUi_Loop_ShufflePlayUiSlideIn(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = 0x18 - (tmp / 0x40);

    proc->unk_3c = 0x14 - (proc->unk_3b / 3);

    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80AC844(gUnknown_08A212D4, 1, 25, 1, 3, proc->unk_3c + 4, 24, 3);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (proc->unk_3b == 24)
    {
        proc->unk_3a = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AFDF4
void SoundRoomUi_Loop_ShufflePlayKeyHandler(struct SoundRoomProc * proc)
{
    if (proc->unk_3f != 0)
    {
        return;
    }

    if (proc->isSongPlaying != 0)
    {
        if (proc->currentSongTime >= (gSoundRoomTable[proc->currentSongIdx].songLength))
        {
            PlayNextShuffledSong(proc);
            return;
        }
    }

    if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
    {
        SoundRoom_StartNextSong_Positive(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT)
    {
        SoundRoom_StartNextSong_Negative(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & (START_BUTTON | SELECT_BUTTON))
    {
        Proc_Break(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 3);
    }

    return;
}

//! FE8U = 0x080AFE8C
void SoundRoomUi_Loop_ShufflePlayUiSlideOut(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = (tmp / 0x40);

    proc->unk_3c = 20 - (proc->unk_3b / 3);

    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80AC844(gUnknown_08A212D4, 1, 25, 1, 3, proc->unk_3c + 4, 24, 3);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (proc->unk_3b == 0)
    {
        proc->isSongPlaying = 0;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_SoundRoomUi[] =
{
    PROC_YIELD,

    PROC_CALL(SoundRoomUi_Init),

    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),

    PROC_WHILE(MusicProc4Exists),

PROC_LABEL(0),
    PROC_REPEAT(SoundRoomUi_Loop_MainKeyHandler),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(SoundRoomUi_80AFBBC),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideOut),

    PROC_REPEAT(SoundRoomUi_80AFC98),

    PROC_CALL(SoundRoomUi_80AFCE4),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideIn),

    PROC_GOTO(0),

PROC_LABEL(2),
    PROC_CALL(SoundRoomUi_80AFBBC),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideOut),

    PROC_CALL(SoundRoomUi_80AFD48),
    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayUiSlideIn),

    PROC_SLEEP(16),

    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayKeyHandler),

    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayUiSlideOut),
 
    PROC_CALL(SoundRoomUi_80AFCE4),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideIn),

    PROC_SLEEP(16),

    PROC_GOTO(0),

PROC_LABEL(3),
    PROC_REPEAT(SoundRoomUi_RestartTitleMusic),

    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(SoundRoomUi_OnEnd),
    PROC_YIELD,

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AFF1C
ProcPtr StartSoundRoomScreen(ProcPtr parent)
{
    return Proc_StartBlocking(gProcScr_SoundRoomUi, parent);
}

//! FE8U = 0x080AFF30
void sub_80AFF30(void)
{
    int i;

    u32 vram = 0x06014000;

    InitSpriteTextFont(&gUnk_SoundRoom_0201F148.font, (void *)vram, 5);

    ApplyPalettes(Pal_Text, 0x1A, 2);
    gPaletteBuffer[0x1A * 0x10] = 0;

    EnablePaletteSync();

    SetTextFont(&gUnk_SoundRoom_0201F148.font);
    InitSpriteText(&gUnk_SoundRoom_0201F148.text[1]);
    InitSpriteText(&gUnk_SoundRoom_0201F148.text[2]);

    for (i = 0; i < 3; i++)
    {
        InitSpriteText(&gUnk_SoundRoom_0201F148.text[3 + i]);
    }

    SetTextFont(NULL);

    gUnk_SoundRoom_0201F148.unk_50 = (((0x1FFFF & vram) >> 5) & 0x3FF) + 0xa000;

    SetTextFont(NULL);
    SetTextFontGlyphs(0);

    InitText(&gUnk_SoundRoom_0201F148.text[0], 5);
    ClearText(&gUnk_SoundRoom_0201F148.text[0]);

    Text_InsertDrawString(&gUnk_SoundRoom_0201F148.text[0], 0, 0, GetStringFromIndex(0x5AA)); // TODO: msgid "Success[.]"

    InitText(&gUnk_SoundRoom_0201F148.text[6], 2);
    ClearText(&gUnk_SoundRoom_0201F148.text[6]);

    Text_DrawString(&gUnk_SoundRoom_0201F148.text[6], GetStringFromIndex(0x5AE)); // TODO: msgid "%[.]"

    return;
}

//! FE8U = 0x080B0018
void DrawSoundRoomSongTitle(int index)
{
    const char * str;

    if (index == -1)
    {
        str = GetStringFromIndex(0x7D0); // TODO: msgid "?????[.]"
    }
    else
    {
        str = GetStringFromIndex(gSoundRoomTable[index].nameTextId);
    }

    SetTextFont(&gUnk_SoundRoom_0201F148.font);
    SetTextFontGlyphs(1);

    SpriteText_DrawBackgroundExt(&gUnk_SoundRoom_0201F148.text[1], 0);

    Text_SetCursor(&gUnk_SoundRoom_0201F148.text[1], GetStringTextCenteredPos(176, str));
    Text_SetColor(&gUnk_SoundRoom_0201F148.text[1], 0);
    Text_DrawString(&gUnk_SoundRoom_0201F148.text[1], str);

    SetTextFont(NULL);

    return;
}

//! FE8U = 0x080B0088
void sub_80B0088(int y, u16 unk)
{
    int i;

    if (unk > 32)
    {
        y = OAM0_Y(y);

        // clang-format off
        SetObjAffine(
            0,
            Div(+COS(0) * 16, 256),
            Div(-SIN(0) * 16, unk),
            Div(+SIN(0) * 16, 256),
            Div(+COS(0) * 16, unk)
        );
        // clang-format on

        for (i = 0; i < 5; i++)
        {
            PutSpriteExt(4, 36 + i * 32, y + 264, gObject_32x16, i * 4 + gUnk_SoundRoom_0201F148.unk_50 + 0x1000);
        }

        for (i = 0; i < 3; i++)
        {
            PutSpriteExt(4, 24 + i * 64, y + 256, gObject_64x32, 0xcb00 + i * 8);
        }
    }

    return;
}

//! FE8U = 0x080B017C
void DrawSoundRoomVolumeGraphSprites(int x, int y, int c, int d)
{
    int count = 0;
    int pal = 0xd;

    if (d == 0)
    {
        return;
    }

    y = OAM0_Y(y);

    if (c > 7)
    {
        int x_ = x;

        for (; c > 7;)
        {
            c -= 8;

            PutSpriteExt(0, OAM1_X(x_), y, gObject_8x8, OAM2_PAL(pal) + OAM2_CHR(0x47) + OAM2_LAYER(2));

            x_ += 8;
            count++;

            if (count > 2)
            {
                pal = 0xe;
            }

            if (count > 4)
            {
                pal = 0xf;
            }
        }
    }

    PutSpriteExt(0, OAM1_X(count * 8 + x), y, gObject_8x8, c + OAM2_PAL(pal) + OAM2_CHR(0x40) + OAM2_LAYER(2));

    return;
}

//! FE8U = 0x080B0204
void sub_80B0204(struct SoundRoomSpriteDrawProc * proc)
{
    int i;

    struct SoundRoomProc * parent = proc->proc_parent;

    u8 * ptr = gSoundRoomVolumeGraphBuffer[0];
    ptr += 0x30;

    for (i = 0; i < 2; i++)
    {
        int a = ptr[i * 0x31];

        DrawSoundRoomVolumeGraphSprites(parent->unk_3d * 8 + 15, 64 + i * 8, a, a);
    }

    return;
}

// clang-format off

u16 CONST_DATA gSprite_SoundRoom_AButtonPlay[] =
{
    2,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(8), OAM2_CHR(0x150) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x112) + OAM2_LAYER(1),
};

u16 CONST_DATA gSprite_SoundRoom_StartButtonStop[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x152) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x116) + OAM2_LAYER(1),
};

u16 CONST_DATA gSprite_SoundRoom_SelectButtonRandom[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x156) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x11A) + OAM2_LAYER(1),
};

u16 CONST_DATA gSprite_RandomModeBanner[] =
{
    5,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x100) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x104) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x108) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(96), OAM2_CHR(0x10C) + OAM2_LAYER(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(128), OAM2_CHR(0x110) + OAM2_LAYER(1),
};

u16 CONST_DATA gSprite_MusicPlayer_SeekBar[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x160) + OAM2_LAYER(1),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x164) + OAM2_LAYER(1),
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_X(64), OAM2_CHR(0x168) + OAM2_LAYER(1),
};

u16 CONST_DATA gSprite_MusicPlayer_SeekBarIndicator[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14F),
};

u16 CONST_DATA gSprite_MusicPlayer_Time[] =
{
    1,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x140),
};

u16 CONST_DATA gSprite_MusicPlayer_Colon[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14E),
};

u16 CONST_DATA gSprite_08A214B6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x144),
};

u16 CONST_DATA gSprite_08A214BE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x145),
};

u16 CONST_DATA gSprite_08A214C6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x146),
};

u16 CONST_DATA gSprite_08A214CE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x147),
};

u16 CONST_DATA gSprite_08A214D6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x148),
};

u16 CONST_DATA gSprite_08A214DE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x149),
};

u16 CONST_DATA gSprite_08A214E6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14A),
};

u16 CONST_DATA gSprite_08A214EE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14B),
};

u16 CONST_DATA gSprite_08A214F6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14C),
};

u16 CONST_DATA gSprite_08A214FE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14D),
};

u16 * CONST_DATA gSpriteArray_MusicPlayer_TimeNumbers[] =
{
    gSprite_08A214B6,
    gSprite_08A214BE,
    gSprite_08A214C6,
    gSprite_08A214CE,
    gSprite_08A214D6,
    gSprite_08A214DE,
    gSprite_08A214E6,
    gSprite_08A214EE,
    gSprite_08A214F6,
    gSprite_08A214FE,
};

// clang-format on

//! FE8U = 0x080B0240
void DrawMusicPlayerTime(int x, int y, int time)
{
    int seconds = time / 60;
    int minutes = seconds / 60;
    int secondsIntoMin = seconds % 60;

    PutSpriteExt(0, x, y, gSprite_MusicPlayer_Time, OAM2_PAL(4));
    PutSpriteExt(0, x + 40, y, gSpriteArray_MusicPlayer_TimeNumbers[minutes], OAM2_PAL(4));
    PutSpriteExt(0, x + 48, y, gSprite_MusicPlayer_Colon, OAM2_PAL(4));

    if (secondsIntoMin >= 10)
    {
        PutSpriteExt(0, x + 56, y, gSpriteArray_MusicPlayer_TimeNumbers[secondsIntoMin / 10], OAM2_PAL(4));
    }
    else
    {
        PutSpriteExt(0, x + 56, y, gSpriteArray_MusicPlayer_TimeNumbers[0], OAM2_PAL(4));
    }

    PutSpriteExt(0, x + 64, y, gSpriteArray_MusicPlayer_TimeNumbers[secondsIntoMin % 10], OAM2_PAL(4));

    return;
}

//! FE8U = 0x080B031C
void SoundRoom_DrawSprites_Init(struct SoundRoomSpriteDrawProc * proc)
{
    proc->unk_2c = 0;
    return;
}

//! FE8U = 0x080B0324
void SoundRoom_DrawSprites_Loop(struct SoundRoomSpriteDrawProc * proc)
{
    struct SoundRoomProc * parent = proc->proc_parent;

    sub_80B0088(parent->unk_3c * 8 + 6, 0x100);

    if (parent->isSongPlaying != 0)
    {
        int y = OAM0_Y(parent->unk_3c * 8 + 36);

        // Draw "Random Mode" banner
        PutSpriteExt(0, 4, OAM0_Y((12 - parent->unk_3c) * 8 + 4) + OAM0_BLEND, gSprite_RandomModeBanner, OAM2_PAL(5));

        // Draw "seek bar" for music player
        PutSpriteExt(0, 124, OAM0_Y(y + 1), gSprite_MusicPlayer_SeekBar, OAM2_PAL(4));

        // Draw indicator at the song's current playback position
        PutSpriteExt(
            0, parent->currentSongTime * 66 / (gSoundRoomTable[parent->currentSongIdx].songLength + 120) + 124, y,
            gSprite_MusicPlayer_SeekBarIndicator, OAM2_PAL(4));

        DrawMusicPlayerTime(48, y, parent->currentSongTime);
    }

    PutSprite(0xb, OAM1_X(parent->unk_3d * 8 + 17), 88, gSprite_SoundRoom_AButtonPlay, OAM2_PAL(3));
    PutSprite(0xb, OAM1_X(parent->unk_3d * 8 + 17), 104, gSprite_SoundRoom_StartButtonStop, OAM2_PAL(3));
    PutSprite(0xb, OAM1_X(parent->unk_3d * 8 + 17), 120, gSprite_SoundRoom_SelectButtonRandom, OAM2_PAL(3));

    sub_80B0204(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_SoundRoom_DrawSprites[] =
{
    PROC_YIELD,

    PROC_CALL(SoundRoom_DrawSprites_Init),
    PROC_REPEAT(SoundRoom_DrawSprites_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B0444
ProcPtr DrawSoundRoomSprites(ProcPtr parent)
{
    return Proc_Start(gProcScr_SoundRoom_DrawSprites, parent);
}
