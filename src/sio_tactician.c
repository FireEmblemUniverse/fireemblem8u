#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "constants/characters.h"

void sub_8044614(struct ProcTactician * proc)
{
    int i, j;

    for (i = 0; i < 5; i++)
    {
        ClearText(Texts_0203DB14 + (i + proc->text_idx * 5));
        Text_SetColor(Texts_0203DB14 + (i + proc->text_idx * 5), TEXT_COLOR_SYSTEM_WHITE);

        for (j = 0; j < 0xF; j++)
        {
            int idx = gUnknown_080D9C9E[i * 15 + j];
            const struct TacticianTextConf * conf = gTacticianTextConf + idx;
            u8 * str = conf->str[proc->line_idx * 3];

            if (*str != '\0')
            {
                Text_SetCursor(Texts_0203DB14 + (i + proc->text_idx * 5), conf->xpos);
                Text_DrawString(
                    Texts_0203DB14 + (i + proc->text_idx * 5),
                    conf->str[proc->line_idx * 3]
                );
            }
        }

        PutText(
            Texts_0203DB14 + (i + proc->text_idx * 5),
            TILEMAP_LOCATED(gBG1TilemapBuffer, 0, i * 2 + 9)
        );
    }
}

void TacticianDrawCharacters(struct ProcTactician * proc)
{
    int x;
    struct Text * text;
    const char * str = proc->str;

    ClearText(&Text_0203DB14);

    if (*str != '\0')
    {
        text = &Text_0203DB14;
        x = 0;
    
        while (*str != '\0')
        {
            Text_SetCursor(text, x);
            str = Text_DrawCharacter(text, str);
            x = x + 7;
        }
    }
    PutText(&Text_0203DB14, TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 5));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

int StrLen(u8 * buf)
{
    int i = 0;
    while (*buf != '\0')
    {
        i++;
        buf++;
    }
    return i;
}

void Tactician_InitScreen(struct ProcTactician * proc)
{
    int i, char_cnt;
    char * str;
    u8 str_buf[0x10];
    struct TacticianTextConf * conf;

    ClearSioBG();
    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0, 0, 0);
    Decompress(Img_TacticianSelObj, (void *)0x06014800);
    ApplyPalette(Pal_TacticianSelObj, 0x13);
    ApplyPalette(Pal_085ADE68, 0x14);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 0, 8), Tsa_085AE190, 0x1000);
    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    if (CheckInLinkArena())
    {
        proc->max_len = 7;
    }
    else
    {
        gLinkArenaSt.unk_00 = 0;;
        proc->max_len = 5;
    }

    for (i = 0; i < (proc->max_len * 2 + 1); i++)
        proc->str[i] = '\0';

    for (i = 0; i < proc->max_len; i++)
        proc->unk4C[i] = 0;

    if (CheckInLinkArena())
        proc->max_len = 9;

    proc->cur_len = 0;
    InitText(&Text_0203DB14, 8);
    proc->line_idx = 1;
    proc->conf_idx = 6;

    conf = GetTacticianTextConf(6);
    proc->child1 = NewProc_085AAAC4(proc, conf->xpos - 4, conf->unk32 + 1);
    proc->unk39 = 0;

    for (i = 0; i < 10; i++)
        InitText(Texts_0203DB14 + i, 0x1A);

    InitText(&Texts_0203DAB0, 0xC);
    NewProc085AA980(proc->child1, 3, 0x500);
    sub_804C508();
    gUnknown_0203DD24 = 0;
    proc->text_idx = 0;
    sub_8044614(proc);

    /* 80448DE */
    if (proc->unk32 != 0)
    {
        i = 0;
        str = GetTacticianName();
        while (*str != '\0')
        {
            proc->str[i] = *str;
            str_buf[i] = *str;

            str++;
            i++;

            char_cnt = proc->cur_len + 1;
            if (char_cnt < proc->unk33)
                proc->cur_len = char_cnt;
        }
        sub_8044560(proc, str_buf);
        TacticianDrawCharacters(proc);
        proc->child1->unk40 = proc->cur_len * 7;
    }
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void SioUpdateTeam(char * str, int team)
{
    int i;
    struct Unit * buffer = GetUnit(FACTION_RED + 1);
    for (i = 0; i < 5; i++)
        ClearUnit(buffer + i);

    for (i = 0; i < 5; i++)
    {
        u8 pid = gSioPidPool.pids[i];
        if (pid != 0)
        {
            struct Unit * unit = GetUnitFromCharId(pid);
            if (!(unit->state & US_NOT_DEPLOYED))
            {
                SetUnitStatus(unit, UNIT_STATUS_NONE);
                unit->state = 0;
                MemCpy(unit, buffer + i, sizeof(struct Unit));
            }
        }
    }
    WriteMultiArenaSaveTeam(team, buffer, str);
}

void sub_80449E8(struct ProcTactician * proc, int idx, const struct TacticianTextConf * conf)
{
    int str_idx;
    u16 ret;
    const struct TacticianTextConf * conf2;

    ret = conf->unk36[idx];
    conf2 = gTacticianTextConf + conf->unk36[idx];

    str_idx = proc->line_idx * 3;

    while (*conf2->str[str_idx] == '\0')
    {
        ret = conf2->unk36[idx];
        conf2 = gTacticianTextConf + conf2->unk36[idx];
    }
    proc->conf_idx = ret;
}

void TacticianTryAppendChar(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    int cur_len;

    if (proc->cur_len < proc->max_len)
    {
        SioPlaySoundEffect(2);
        SioStrCpy(conf->str[proc->line_idx * 3], &proc->str[proc->cur_len]);

        proc->unk4C[proc->cur_len] = (0x3FFF & proc->conf_idx) | ((3 & proc->line_idx) << 14);
        cur_len = proc->cur_len + 1;

        if (cur_len < proc->max_len)
            proc->cur_len = cur_len;
        else
            proc->conf_idx = 5;

        TacticianDrawCharacters(proc);
        proc->unk39 = 0;
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}

void TacticianTryDeleteChar(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    int cur_len;

    if (proc->cur_len != 0)
    {
        SioPlaySoundEffect(2);

        if (proc->unk4C[proc->cur_len] == 0)
            proc->cur_len--;

        *(proc->str + proc->cur_len) = 0;
        proc->unk4C[proc->cur_len] = 0;
        proc->unk39 = 0;

        TacticianDrawCharacters(proc);
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}

void SaveTactician(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    if (proc->str[0] != '\0')
    {
        SioPlaySoundEffect(2);

        if (CheckInLinkArena())
            SioUpdateTeam(proc->str, gLinkArenaSt.unk_03);
        else
            SetTacticianName(proc->str);

        Proc_Break(proc);
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}

bool sub_8044B78(struct ProcTactician * proc, const struct TacticianTextConf * conf, u32 c, int d)
{
    if (proc->line_idx > 1 && d == 0)
    {
        SioPlaySoundEffect(2);
        TacticianTryAppendChar(proc, conf);
        return false;
    }

    if (proc->cur_len != 0)
    {
        struct TacticianTextConf * conf2;
        int r8, line_idx;
        u16 conf_idx;

        if (0x3FFF & proc->unk4C[proc->cur_len / 2])
            r8 = 0;
        else
            r8 = 1;

        conf_idx = 0x3FFF & proc->unk4C[proc->cur_len / 2 - r8];
        conf2 = GetTacticianTextConf(conf_idx);
        line_idx = proc->unk4C[proc->cur_len / 2 - r8] >> 14;

        if (*conf2->str[line_idx * 3 + c] != '\0')
        {
            SioPlaySoundEffect(2);
            SioStrCpy(conf2->str[line_idx * 3 + c], &proc->str[proc->cur_len] - r8 * 2);
            TacticianDrawCharacters(proc);
            proc->unk39 = c;
            return true;
        }
        else if (d == 0)
            SioPlaySoundEffect(0);
    }
    else if (d == 0)
        SioPlaySoundEffect(0);

    return false;
}
