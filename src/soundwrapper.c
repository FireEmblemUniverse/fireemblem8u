#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "soundwrapper.h"

struct Struct02024E5C
{
    u8 filler0[2];
    u16 unk2;
    u16 songId;
    s8 unk6;
    s8 unk7;
    s8 maxChannels;
};

EWRAM_DATA static struct Struct02024E5C sSoundStatus = {0};

static struct Proc *sMusicProc1;
static struct Proc *sMusicProc2;

struct MusicProc {
    PROC_HEADER
    /*0x2A*/ s16 filler2A[16];
    /*0x4A*/ s16 songId;
    /*0x4C*/ s16 delayCounter; // 16
    /*0x4E*/ s16 unk4E; // 17
    /*0x50*/ s16 filler50[2];
    /*0x54*/ struct MusicPlayerInfo *player;
    /*0x58*/ s32 unk58; // 23
    /*0x5C*/ s32 unk5C; // 25
    /*0x60*/ s16 filler60[2];
    /*0x64*/ s16 unk64;
    /*0x66*/ s16 unk66;
    /*0x68*/ s16 unk68;
    /*0x6A*/ s16 unk6A;
};

static void sub_8002788(struct Proc *proc);

int Sound_GetCurrentSong(void)
{
    return sSoundStatus.songId;
}

s8 sub_8002264(void)
{
    return sSoundStatus.unk6;
}

void Sound_SetBGMVolume(int volume)
{
    m4aMPlayVolumeControl(&gMPlayInfo_SE1_SYS1, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE2_SYS2, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3_BMP1, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE4_BMP2, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE5_BMP3, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE6_BMP4, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE7_EVT, 0xFFFF, volume);
}

void Sound_SetSEVolume(int volume)
{
    m4aMPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, volume);
}

void Sound_FadeOutBGM(int speed)
{
    if (speed < 0)
        speed = 6;
    if (sMusicProc1 != NULL)
    {
        Proc_Break(sMusicProc1);
        sMusicProc1 = NULL;
    }
    if (sMusicProc2 != NULL)
    {
        Proc_Break(sMusicProc2);
        sMusicProc2 = NULL;
    }
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_BGM2, speed);
    sSoundStatus.unk6 = FALSE;
}

void Sound_FadeOutBGMAlt(int speed)
{
    if (speed < 0)
        speed = 6;
    if (sMusicProc1 != NULL)
    {
        Proc_Break(sMusicProc1);
        sMusicProc1 = NULL;
    }
    if (sMusicProc2 != NULL)
    {
        Proc_Break(sMusicProc2);
        sMusicProc2 = NULL;
    }
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, speed);
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM2, speed);
    sSoundStatus.unk6 = FALSE;
    sSoundStatus.unk7 = 1;
}

void Sound_FadeOutSE(int speed)
{
    if (speed == 0)
        speed = 6;
    m4aMPlayFadeOut(&gMPlayInfo_SE1_SYS1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE2_SYS2, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE3_BMP1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE4_BMP2, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE5_BMP3, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE6_BMP4, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE7_EVT, speed);
}

void Sound_PlaySong8002448(int songId, struct MusicPlayerInfo *player)
{
    sSoundStatus.unk6 = TRUE;
    sSoundStatus.unk7 = 0;
    sSoundStatus.songId = songId;
    PlaySong(songId, player);
    m4aMPlayImmInit(&gMPlayInfo_BGM1);
    m4aMPlayImmInit(&gMPlayInfo_BGM2);
}

void PlaySong8002478(int songId, int speed, struct MusicPlayerInfo *player)
{
    if (sSoundStatus.unk6 && Sound_GetCurrentSong() == songId)
        return;
    if (gRAMChapterData.unk41_1 == 0)
    {
        DeleteAll6CWaitMusicRelated();
        if (sSoundStatus.unk6)
        {
            Sound_FadeOutBGM(speed);
            StartSongDelayed(songId, speed * 16, player);
        }
        else
        {
            Sound_PlaySong8002448(songId, player);
        }
    }
}

void Sound_PlaySong80024D4(int songId, struct MusicPlayerInfo *player)
{
    PlaySong8002478(songId, 3, player);
}

void Sound_PlaySong80024E4(int songId, int speed, struct MusicPlayerInfo *player)
{
    PlaySong8002478(songId, speed, player);
}

static void sub_80024F0(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    int volume = sub_8012DCC(0, 0, 0x100, mproc->delayCounter, mproc->unk4E);

    m4aMPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, volume);
    mproc->delayCounter++;
    if (mproc->delayCounter >= mproc->unk4E)
    {
        Proc_Break((struct Proc *)mproc);
        sMusicProc1 = NULL;
    }
}

static struct ProcCmd sMusicProc1Script[] =
{
    PROC_END_DUPLICATES,
    PROC_REPEAT(sub_80024F0),
    PROC_END,
};

void Sound_PlaySong8002574(int songId, int b, struct MusicPlayerInfo *player)
{
    struct MusicProc *proc;

    if (gRAMChapterData.unk41_1 == 0)
    {
        sSoundStatus.unk6 = TRUE;
        sSoundStatus.unk7 = 0;
        sSoundStatus.songId = songId;
        proc = Proc_Start(sMusicProc1Script, PROC_TREE_3);
        m4aMPlayStop(&gMPlayInfo_BGM1);
        m4aMPlayStop(&gMPlayInfo_BGM2);
        PlaySong(songId, player);
        m4aMPlayImmInit(&gMPlayInfo_BGM1);
        m4aMPlayImmInit(&gMPlayInfo_BGM2);
        m4aMPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, 0);
        m4aMPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, 0);
        proc->delayCounter = 0;
        proc->unk4E = b * 16;
        sMusicProc1 = (struct Proc *)proc;
    }
}

void sub_8002620(int songId)
{
    if (gRAMChapterData.unk41_1 == 0)
    {
        sSoundStatus.unk2 = sSoundStatus.songId;
        if (sSoundStatus.unk7 == 0)
            m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM2, 3);
        sSoundStatus.unk6 = FALSE;
        sSoundStatus.unk7 = 0;
        if (songId != 0)
            StartSongDelayed(songId, 32, &gMPlayInfo_BGM1);
    }
}

void sub_8002670(void)
{
    if (gRAMChapterData.unk41_1 == 0 && sSoundStatus.unk2 != 0)
    {
        m4aMPlayFadeOut(&gMPlayInfo_BGM1, 3);
        m4aMPlayFadeIn(&gMPlayInfo_BGM2, 6);
        sSoundStatus.unk6 = TRUE;
        sSoundStatus.unk7 = 0;
        sSoundStatus.songId = sSoundStatus.unk2;
        sSoundStatus.unk2 = 0;
    }
}

void sub_80026BC(u16 speed)
{
    if (gRAMChapterData.unk41_1 == 0 && sSoundStatus.unk2 != 0)
    {
        m4aMPlayFadeOut(&gMPlayInfo_BGM1, 3);
        m4aMPlayFadeIn(&gMPlayInfo_BGM2, speed);
        sSoundStatus.unk6 = TRUE;
        sSoundStatus.unk7 = 0;
        sSoundStatus.songId = sSoundStatus.unk2;
        sSoundStatus.unk2 = 0;
    }
}

void sub_800270C(void)
{
    if (gRAMChapterData.unk41_1 == 0)
    {
        sSoundStatus.songId = sSoundStatus.unk2;
        sSoundStatus.unk2 = 0;
    }
}

struct ProcCmd sMusicProc2Script[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_8002788),
    PROC_END,
};

void ISuspectThisToBeMusicRelated_8002730(int volume, int b, int c, struct Proc *parent)
{
    struct MusicProc *proc;

    if (parent)
        proc = Proc_StartBlocking(sMusicProc2Script, parent);
    else
        proc = Proc_Start(sMusicProc2Script, PROC_TREE_3);
    proc->unk64 = volume;
    proc->unk66 = b;
    proc->unk68 = 0;
    proc->unk6A = c;
    if (volume == 0)
        volume = 1;
    Sound_SetSEVolume(volume);
    sMusicProc2 = (struct Proc *)proc;
}

static void sub_8002788(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    Sound_SetSEVolume(sub_8012DCC(4, mproc->unk64, mproc->unk66, mproc->unk68++, mproc->unk6A));
    if (mproc->unk68 >= mproc->unk6A)
    {
        if (mproc->unk66 == 0)
        {
            m4aSongNumStop(Sound_GetCurrentSong());
            sSoundStatus.unk6 = FALSE;
            sSoundStatus.unk2 = 0;
            sSoundStatus.songId = 0;
        }
        else
        {
            sSoundStatus.unk6 = TRUE;
        }
        Proc_Break(proc);
        sMusicProc2 = NULL;
    }
}

void Some6CMusicRelatedWaitCallback(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    mproc->delayCounter--;
    if (mproc->delayCounter < 0)
    {
        sSoundStatus.unk6 = TRUE;
        sSoundStatus.songId = mproc->songId;
        PlaySong(mproc->songId, mproc->player);
        Proc_End((struct Proc *)proc);
    }
}

struct ProcCmd gMusicProc3Script[] =
{
    PROC_REPEAT(Some6CMusicRelatedWaitCallback),
    PROC_END,
};

void StartSongDelayed(int songId, int delay, struct MusicPlayerInfo *player)
{
    if (gRAMChapterData.unk41_1 == 0)
    {
        struct MusicProc *mproc = Proc_Start(gMusicProc3Script, PROC_TREE_3);

        mproc->delayCounter = delay;
        mproc->songId = songId;
        mproc->player = player;
    }
}

void PlaySong(int songId, struct MusicPlayerInfo *player)
{
    if (songId < 128)
    {
        sub_80028FC(songId);
        sub_80A3F08(0, songId);
    }

    if (player != NULL)
        MPlayStart(player, gSongTable[songId].header);
    else
        m4aSongNumStart(songId);
}

void Sound_SetDefaultMaxNumChannels(void)
{
    Sound_SetMaxNumChannels(7);
    sSoundStatus.maxChannels = -1;
}

void Sound_SetMaxNumChannels(int maxchn)
{
    sSoundStatus.maxChannels = maxchn;
    m4aSoundMode(maxchn << SOUND_MODE_MAXCHN_SHIFT);
}

void sub_80028FC(int songId)
{
    switch (songId)
    {
    case 1:
    case 2:
    case 0x42:
    case 0x43:
    case 0x40:
    case 0x56:
    case 0x74:
        if (sSoundStatus.maxChannels != 8)
            Sound_SetMaxNumChannels(8);
        break;
    default:
        if (sSoundStatus.maxChannels != -1)
            Sound_SetDefaultMaxNumChannels();
        break;
    }
}

int IsMusicProc2Running(void)
{
    if (Proc_Find(sMusicProc2Script) != NULL)
        return TRUE;
    else
        return FALSE;
}

void sub_800296C(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    if (sub_8002264() != 0 && mproc->unk64 != 0)
    {
        if (mproc->unk5C == -1)
            ISuspectThisToBeMusicRelated_8002730(mproc->unk64, mproc->unk66, mproc->unk58, proc);
        else
            ISuspectThisToBeMusicRelated_8002730(mproc->unk64, 0, mproc->unk58, proc);
    }
}

void sub_80029BC(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    if (mproc->unk5C > 0)
    {
        Sound_PlaySong80024D4(mproc->unk5C, 0);
        Sound_SetSEVolume(mproc->unk66);
    }
    else
    {
        Proc_Goto(proc, 0);
    }
}

static struct ProcCmd sMusicProc4Script[] =
{
    PROC_SLEEP(1),
    PROC_CALL(sub_800296C),
    PROC_SLEEP(1),
    PROC_CALL(sub_80029BC),
    PROC_SLEEP(8),
    PROC_LABEL(0),
    PROC_YIELD,
    PROC_END,
};

void sub_80029E8(int songId, int b, int c, int d, struct Proc *parent)
{
    struct MusicProc *mproc;

    if (sub_8002264() != 0 && songId == sSoundStatus.songId && b == c)
        return;

    if (parent != NULL)
        mproc = Proc_StartBlocking(sMusicProc4Script, parent);
    else
        mproc = Proc_Start(sMusicProc4Script, PROC_TREE_3);
    mproc->unk58 = d;
    if (sub_8002264() != 0 && songId == sSoundStatus.songId)
        mproc->unk5C = -1;
    else
        mproc->unk5C = songId;
    mproc->unk64 = b;
    mproc->unk66 = c;
}

int sub_8002A6C(void)
{
    if (Proc_Find(sMusicProc4Script) != NULL)
        return TRUE;
    else
        return FALSE;
}

void sub_8002A88(int songId)
{
    if (songId != sSoundStatus.songId)
    {
        if (sub_8002264() != 0)
            Sound_SetSEVolume(0);
        Sound_PlaySong8002448(songId, 0);
    }
}

void DeleteAll6CWaitMusicRelated(void)
{
    Proc_EndEach(gMusicProc3Script);
}

void sub_8002AC8(void)
{
    DeleteAll6CWaitMusicRelated();
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, 1);
    m4aMPlayFadeOut(&gMPlayInfo_BGM2, 1);
    sSoundStatus.unk2 = 0;
    sSoundStatus.songId = 0;
}
