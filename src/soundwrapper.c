#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"

EWRAM_DATA struct SoundSt gSoundSt = {0};

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
    /*0x64*/ s16 vc_init_volume;
    /*0x66*/ s16 vc_end_volume;
    /*0x68*/ s16 vc_clock;
    /*0x6A*/ s16 vc_time_end;
};

static void MusicVc_OnLoop(struct Proc *proc);

int GetCurrentBgmSong(void)
{
    return gSoundSt.songId;
}

s8 IsBgmPlaying(void)
{
    return gSoundSt.is_song_playing;
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
    gSoundSt.is_song_playing = FALSE;
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
    gSoundSt.is_song_playing = FALSE;
    gSoundSt.unk7 = 1;
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

void StartBgmCore(int songId, struct MusicPlayerInfo *player)
{
    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = songId;
    PlaySong(songId, player);
    m4aMPlayImmInit(&gMPlayInfo_BGM1);
    m4aMPlayImmInit(&gMPlayInfo_BGM2);
}

void StartOrChangeBgm(int songId, int speed, struct MusicPlayerInfo * player)
{
    if (gSoundSt.is_song_playing && GetCurrentBgmSong() == songId)
        return;
    if (gPlaySt.config.disableBgm == 0)
    {
        DeleteAll6CWaitMusicRelated();
        if (gSoundSt.is_song_playing)
        {
            Sound_FadeOutBGM(speed);
            StartSongDelayed(songId, speed * 16, player);
        }
        else
        {
            StartBgmCore(songId, player);
        }
    }
}

void StartBgm(int songId, struct MusicPlayerInfo *player)
{
    StartOrChangeBgm(songId, 3, player);
}

void StartBgmExt(int songId, int speed, struct MusicPlayerInfo * player)
{
    StartOrChangeBgm(songId, speed, player);
}

void MusicFi_OnLoop(ProcPtr proc)
{
    struct MusicProc *mproc = proc;
    int volume = Interpolate(0, 0, 0x100, mproc->delayCounter, mproc->unk4E);

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
    PROC_REPEAT(MusicFi_OnLoop),
    PROC_END,
};

void StartBgmFadeIn(int songId, int duration, struct MusicPlayerInfo *player)
{
    struct MusicProc *proc;

    if (gPlaySt.config.disableBgm == 0)
    {
        gSoundSt.is_song_playing = TRUE;
        gSoundSt.unk7 = 0;
        gSoundSt.songId = songId;
        proc = Proc_Start(sMusicProc1Script, PROC_TREE_3);
        m4aMPlayStop(&gMPlayInfo_BGM1);
        m4aMPlayStop(&gMPlayInfo_BGM2);
        PlaySong(songId, player);
        m4aMPlayImmInit(&gMPlayInfo_BGM1);
        m4aMPlayImmInit(&gMPlayInfo_BGM2);
        m4aMPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, 0);
        m4aMPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, 0);
        proc->delayCounter = 0;
        proc->unk4E = duration * 16;
        sMusicProc1 = (struct Proc *)proc;
    }
}

void OverrideBgm(int songId)
{
    if (gPlaySt.config.disableBgm == 0)
    {
        gSoundSt.unk2 = gSoundSt.songId;
        if (gSoundSt.unk7 == 0)
            m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM2, 3);
        gSoundSt.is_song_playing = FALSE;
        gSoundSt.unk7 = 0;
        if (songId != 0)
            StartSongDelayed(songId, 32, &gMPlayInfo_BGM1);
    }
}

void RestoreBgm(void)
{
    if (gPlaySt.config.disableBgm == 0 && gSoundSt.unk2 != 0)
    {
        m4aMPlayFadeOut(&gMPlayInfo_BGM1, 3);
        m4aMPlayFadeIn(&gMPlayInfo_BGM2, 6);
        gSoundSt.is_song_playing = TRUE;
        gSoundSt.unk7 = 0;
        gSoundSt.songId = gSoundSt.unk2;
        gSoundSt.unk2 = 0;
    }
}

void _RestoreBgm(u16 speed)
{
    if (gPlaySt.config.disableBgm == 0 && gSoundSt.unk2 != 0)
    {
        m4aMPlayFadeOut(&gMPlayInfo_BGM1, 3);
        m4aMPlayFadeIn(&gMPlayInfo_BGM2, speed);
        gSoundSt.is_song_playing = TRUE;
        gSoundSt.unk7 = 0;
        gSoundSt.songId = gSoundSt.unk2;
        gSoundSt.unk2 = 0;
    }
}

void MakeBgmOverridePersist(void)
{
    if (gPlaySt.config.disableBgm == 0)
    {
        gSoundSt.songId = gSoundSt.unk2;
        gSoundSt.unk2 = 0;
    }
}

struct ProcCmd sMusicProc2Script[] =
{
    PROC_YIELD,
    PROC_REPEAT(MusicVc_OnLoop),
    PROC_END,
};

void StartBgmVolumeChange(int volume, int b, int c, ProcPtr parent)
{
    struct MusicProc *proc;

    if (parent)
        proc = Proc_StartBlocking(sMusicProc2Script, parent);
    else
        proc = Proc_Start(sMusicProc2Script, PROC_TREE_3);
    proc->vc_init_volume = volume;
    proc->vc_end_volume = b;
    proc->vc_clock = 0;
    proc->vc_time_end = c;
    if (volume == 0)
        volume = 1;
    Sound_SetSEVolume(volume);
    sMusicProc2 = (ProcPtr)proc;
}

static void MusicVc_OnLoop(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    int volume = Interpolate(4, mproc->vc_init_volume, mproc->vc_end_volume, mproc->vc_clock++, mproc->vc_time_end);
    Sound_SetSEVolume(volume);
    if (mproc->vc_clock >= mproc->vc_time_end)
    {
        if (mproc->vc_end_volume == 0)
        {
            m4aSongNumStop(GetCurrentBgmSong());
            gSoundSt.is_song_playing = FALSE;
            gSoundSt.unk2 = 0;
            gSoundSt.songId = 0;
        }
        else
        {
            gSoundSt.is_song_playing = TRUE;
        }
        Proc_Break(proc);
        sMusicProc2 = NULL;
    }
}

void DelaySong_OnLoop(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    mproc->delayCounter--;
    if (mproc->delayCounter < 0)
    {
        gSoundSt.is_song_playing = TRUE;
        gSoundSt.songId = mproc->songId;
        PlaySong(mproc->songId, mproc->player);
        Proc_End((struct Proc *)proc);
    }
}

struct ProcCmd gMusicProc3Script[] =
{
    PROC_REPEAT(DelaySong_OnLoop),
    PROC_END,
};

void StartSongDelayed(int songId, int delay, struct MusicPlayerInfo *player)
{
    if (gPlaySt.config.disableBgm == 0)
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
        UnlockSoundRoomSong(0, songId);
    }

    if (player != NULL)
        MPlayStart(player, gSongTable[songId].header);
    else
        m4aSongNumStart(songId);
}

void Sound_SetDefaultMaxNumChannels(void)
{
    Sound_SetMaxNumChannels(7);
    gSoundSt.maxChannels = -1;
}

void Sound_SetMaxNumChannels(int maxchn)
{
    gSoundSt.maxChannels = maxchn;
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
        if (gSoundSt.maxChannels != 8)
            Sound_SetMaxNumChannels(8);
        break;
    default:
        if (gSoundSt.maxChannels != -1)
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
    if (IsBgmPlaying() != 0 && mproc->vc_init_volume != 0)
    {
        if (mproc->unk5C == -1)
            StartBgmVolumeChange(mproc->vc_init_volume, mproc->vc_end_volume, mproc->unk58, proc);
        else
            StartBgmVolumeChange(mproc->vc_init_volume, 0, mproc->unk58, proc);
    }
}

void sub_80029BC(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    if (mproc->unk5C > 0)
    {
        StartBgm(mproc->unk5C, 0);
        Sound_SetSEVolume(mproc->vc_end_volume);
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

void CallSomeSoundMaybe(int songId, int vc_init_volume, int vc_end_volume, int d, ProcPtr parent)
{
    struct MusicProc *mproc;

    if (IsBgmPlaying() != 0 && songId == gSoundSt.songId && vc_init_volume == vc_end_volume)
        return;

    if (parent != NULL)
        mproc = Proc_StartBlocking(sMusicProc4Script, parent);
    else
        mproc = Proc_Start(sMusicProc4Script, PROC_TREE_3);

    mproc->unk58 = d;

    if (IsBgmPlaying() != 0 && songId == gSoundSt.songId)
        mproc->unk5C = -1;
    else
        mproc->unk5C = songId;

    mproc->vc_init_volume = vc_init_volume;
    mproc->vc_end_volume = vc_end_volume;
}

s8 MusicProc4Exists(void)
{
    if (Proc_Find(sMusicProc4Script) != NULL)
        return TRUE;
    else
        return FALSE;
}

void sub_8002A88(int songId)
{
    if (songId != gSoundSt.songId)
    {
        if (IsBgmPlaying() != 0)
            Sound_SetSEVolume(0);
        StartBgmCore(songId, 0);
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
    gSoundSt.unk2 = 0;
    gSoundSt.songId = 0;
}
