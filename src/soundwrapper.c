#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "soundwrapper.h"

struct Struct02024E5C
{
    u8 filler0[2];
    u16 unk2;
    u16 unk4;
    s8 unk6;
    s8 unk7;
    s8 unk8;
};

EWRAM_DATA static struct Struct02024E5C gUnknown_02024E5C = {0};

static struct Proc *gUnknown_03000040;
static struct Proc *gUnknown_03000044;

struct MusicProc {
    PROC_HEADER
    /*0x2A*/ s16 filler2A[16];
    /*0x4A*/ s16 unk4A;
    /*0x4C*/ s16 unk4C; // 16
    /*0x4E*/ s16 unk4E; // 17
    /*0x50*/ s16 filler50[2];
    /*0x54*/ s32 unk54;
    /*0x58*/ s32 unk58; // 23
    /*0x5C*/ s32 unk5C; // 25
    /*0x60*/ s16 filler60[2];
    /*0x64*/ s16 unk64;
    /*0x66*/ s16 unk66;
    /*0x68*/ s16 unk68;
    /*0x6A*/ s16 unk6A;
};

static void sub_8002788(struct Proc *proc);

int sub_8002258(void)
{
    return gUnknown_02024E5C.unk4;
}

s8 sub_8002264(void)
{
    return gUnknown_02024E5C.unk6;
}

void SomethingSoundRelated_8002274(int volume)
{
    m4aMPlayVolumeControl(&gUnknown_03006690, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gUnknown_03006760, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gUnknown_030066D0, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gUnknown_030063C0, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gUnknown_03006400, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gUnknown_03006610, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gUnknown_03006720, 0xFFFF, volume);
}

void SomethingSoundRelated_80022EC(int volume)
{
    m4aMPlayVolumeControl(&gUnknown_03006440, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gUnknown_03006650, 0xFFFF, volume);
}

void SoundStuff_800231C(int speed)
{
    if (speed < 0)
        speed = 6;
    if (gUnknown_03000040 != NULL)
    {
        Proc_ClearNativeCallback(gUnknown_03000040);
        gUnknown_03000040 = NULL;
    }
    if (gUnknown_03000044 != NULL)
    {
        Proc_ClearNativeCallback(gUnknown_03000044);
        gUnknown_03000044 = NULL;
    }
    m4aMPlayFadeOut(&gUnknown_03006440, speed);
    m4aMPlayFadeOut(&gUnknown_03006650, speed);
    gUnknown_02024E5C.unk6 = 0;
}

void sub_800237C(int speed)
{
    if (speed < 0)
        speed = 6;
    if (gUnknown_03000040 != NULL)
    {
        Proc_ClearNativeCallback(gUnknown_03000040);
        gUnknown_03000040 = NULL;
    }
    if (gUnknown_03000044 != NULL)
    {
        Proc_ClearNativeCallback(gUnknown_03000044);
        gUnknown_03000044 = NULL;
    }
    m4aMPlayFadeOut(&gUnknown_03006440, speed);
    m4aMPlayFadeOutTemporarily(&gUnknown_03006650, speed);
    gUnknown_02024E5C.unk6 = 0;
    gUnknown_02024E5C.unk7 = 1;
}

void SoundStuff_80023E0(int speed)
{
    if (speed == 0)
        speed = 6;
    m4aMPlayFadeOut(&gUnknown_03006690, speed);
    m4aMPlayFadeOut(&gUnknown_03006760, speed);
    m4aMPlayFadeOut(&gUnknown_030066D0, speed);
    m4aMPlayFadeOut(&gUnknown_030063C0, speed);
    m4aMPlayFadeOut(&gUnknown_03006400, speed);
    m4aMPlayFadeOut(&gUnknown_03006610, speed);
    m4aMPlayFadeOut(&gUnknown_03006720, speed);
}

void sub_8002448(int a, int b)
{
    gUnknown_02024E5C.unk6 = 1;
    gUnknown_02024E5C.unk7 = 0;
    gUnknown_02024E5C.unk4 = a;
    sub_8002890(a, b);
    m4aMPlayImmInit(&gUnknown_03006440);
    m4aMPlayImmInit(&gUnknown_03006650);
}

void sub_8002478(int a, int speed, int c)
{
    if (gUnknown_02024E5C.unk6 != 0 && sub_8002258() == a)
        return;
    if (gUnknown_0202BCF0.unk41_1 == 0)
    {
        DeleteAll6CWaitMusicRelated();
        if (gUnknown_02024E5C.unk6 != 0)
        {
            SoundStuff_800231C(speed);
            Exec6CSomeWaitIfMusicOn(a, speed * 16, c);
        }
        else
        {
            sub_8002448(a, c);
        }
    }
}

void sub_80024D4(int a, int b)
{
    sub_8002478(a, 3, b);
}

void sub_80024E4(int a, int speed, int c)
{
    sub_8002478(a, speed, c);
}

static void sub_80024F0(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    int volume = sub_8012DCC(0, 0, 0x100, mproc->unk4C, mproc->unk4E);

    m4aMPlayVolumeControl(&gUnknown_03006440, 0xFFFF, volume);
    m4aMPlayVolumeControl(&gUnknown_03006650, 0xFFFF, volume);
    mproc->unk4C++;
    if (mproc->unk4C >= mproc->unk4E)
    {
        Proc_ClearNativeCallback((struct Proc *)mproc);
        gUnknown_03000040 = NULL;
    }
}

struct ProcCmd gUnknown_08587958[] =
{
    PROC_END_DUPLICATES,
    PROC_LOOP_ROUTINE(sub_80024F0),
    PROC_END,
};

void sub_8002574(int a, int b, int c)
{
    struct MusicProc *proc;

    if (gUnknown_0202BCF0.unk41_1 == 0)
    {
        gUnknown_02024E5C.unk6 = 1;
        gUnknown_02024E5C.unk7 = 0;
        gUnknown_02024E5C.unk4 = a;
        proc = (struct MusicProc *)Proc_Create(gUnknown_08587958, ROOT_PROC_3);
        m4aMPlayStop(&gUnknown_03006440);
        m4aMPlayStop(&gUnknown_03006650);
        sub_8002890(a, c);
        m4aMPlayImmInit(&gUnknown_03006440);
        m4aMPlayImmInit(&gUnknown_03006650);
        m4aMPlayVolumeControl(&gUnknown_03006440, 0xFFFF, 0);
        m4aMPlayVolumeControl(&gUnknown_03006650, 0xFFFF, 0);
        proc->unk4C = 0;
        proc->unk4E = b * 16;
        gUnknown_03000040 = (struct Proc *)proc;
    }
}

void sub_8002620(int a)
{
    if (gUnknown_0202BCF0.unk41_1 == 0)
    {
        gUnknown_02024E5C.unk2 = gUnknown_02024E5C.unk4;
        if (gUnknown_02024E5C.unk7 == 0)
            m4aMPlayFadeOutTemporarily(&gUnknown_03006650, 3);
        gUnknown_02024E5C.unk6 = 0;
        gUnknown_02024E5C.unk7 = 0;
        if (a != 0)
            Exec6CSomeWaitIfMusicOn(a, 32, &gUnknown_03006440);
    }
}

void sub_8002670(void)
{
    if (gUnknown_0202BCF0.unk41_1 == 0 && gUnknown_02024E5C.unk2 != 0)
    {
        m4aMPlayFadeOut(&gUnknown_03006440, 3);
        m4aMPlayFadeIn(&gUnknown_03006650, 6);
        gUnknown_02024E5C.unk6 = 1;
        gUnknown_02024E5C.unk7 = 0;
        gUnknown_02024E5C.unk4 = gUnknown_02024E5C.unk2;
        gUnknown_02024E5C.unk2 = 0;
    }
}

void sub_80026BC(u16 a)
{
    if (gUnknown_0202BCF0.unk41_1 == 0 && gUnknown_02024E5C.unk2 != 0)
    {
        m4aMPlayFadeOut(&gUnknown_03006440, 3);
        m4aMPlayFadeIn(&gUnknown_03006650, a);
        gUnknown_02024E5C.unk6 = 1;
        gUnknown_02024E5C.unk7 = 0;
        gUnknown_02024E5C.unk4 = gUnknown_02024E5C.unk2;
        gUnknown_02024E5C.unk2 = 0;
    }
}

void sub_800270C(void)
{
    if (gUnknown_0202BCF0.unk41_1 == 0)
    {
        gUnknown_02024E5C.unk4 = gUnknown_02024E5C.unk2;
        gUnknown_02024E5C.unk2 = 0;
    }
}

struct ProcCmd gUnknown_08587970[] =
{
    PROC_YIELD,
    PROC_LOOP_ROUTINE(sub_8002788),
    PROC_END,
};

void ISuspectThisToBeMusicRelated_8002730(int a, int b, int c, struct Proc *parent)
{
    struct MusicProc *proc;

    if (parent)
        proc = (struct MusicProc *)Proc_CreateBlockingChild(gUnknown_08587970, parent);
    else
        proc = (struct MusicProc *)Proc_Create(gUnknown_08587970, ROOT_PROC_3);
    proc->unk64 = a;
    proc->unk66 = b;
    proc->unk68 = 0;
    proc->unk6A = c;
    if (a == 0)
        a = 1;
    SomethingSoundRelated_80022EC(a);
    gUnknown_03000044 = (struct Proc *)proc;
}

static void sub_8002788(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    SomethingSoundRelated_80022EC(sub_8012DCC(4, mproc->unk64, mproc->unk66, mproc->unk68++, mproc->unk6A));
    if (mproc->unk68 >= mproc->unk6A)
    {
        if (mproc->unk66 == 0)
        {
            m4aSongNumStop(sub_8002258());
            gUnknown_02024E5C.unk6 = 0;
            gUnknown_02024E5C.unk2 = 0;
            gUnknown_02024E5C.unk4 = 0;
        }
        else
        {
            gUnknown_02024E5C.unk6 = 1;
        }
        Proc_ClearNativeCallback(proc);
        gUnknown_03000044 = NULL;
    }
}

void Some6CMusicRelatedWaitCallback(struct Proc *proc)
{
    struct MusicProc *mproc = (struct MusicProc *)proc;
    mproc->unk4C--;
    if (mproc->unk4C < 0)
    {
        gUnknown_02024E5C.unk6 = 1;
        gUnknown_02024E5C.unk4 = mproc->unk4A;
        sub_8002890(mproc->unk4A, mproc->unk54);
        Proc_Delete((struct Proc *)proc);
    }
}

struct ProcCmd gUnknown_08587988[] =
{
    PROC_LOOP_ROUTINE(Some6CMusicRelatedWaitCallback),
    PROC_END,
};

void Exec6CSomeWaitIfMusicOn(int a, int b, int c)
{
    if (gUnknown_0202BCF0.unk41_1 == 0)
    {
        struct MusicProc *mproc = (struct MusicProc *)Proc_Create(gUnknown_08587988, ROOT_PROC_3);

        mproc->unk4C = b;
        mproc->unk4A = a;
        mproc->unk54 = c;
    }
}

void sub_8002890(int songId, struct MusicPlayerInfo *mplayInfo)
{
    if (songId < 128)
    {
        sub_80028FC(songId);
        sub_80A3F08(0, songId);
    }
    if (mplayInfo != NULL)
        MPlayStart(mplayInfo, gSongTable[songId].header);
    else
        m4aSongNumStart(songId);
}

void sub_80028D0(void)
{
    sub_80028E8(7);
    gUnknown_02024E5C.unk8 = 0xFF;
}

void sub_80028E8(int a)
{
    gUnknown_02024E5C.unk8 = a;
    m4aSoundMode(a << 8);
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
        if (gUnknown_02024E5C.unk8 != 8)
            sub_80028E8(8);
        break;
    default:
        if (gUnknown_02024E5C.unk8 != -1)
            sub_80028D0();
        break;
    }
}

int sub_8002950(void)
{
    if (Proc_Find(gUnknown_08587970) != NULL)
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
        sub_80024D4(mproc->unk5C, 0);
        SomethingSoundRelated_80022EC(mproc->unk66);
    }
    else
    {
        Proc_GotoLabel(proc, 0);
    }
}

struct ProcCmd gUnknown_08587998[] =
{
    PROC_SLEEP(1),
    PROC_CALL_ROUTINE(sub_800296C),
    PROC_SLEEP(1),
    PROC_CALL_ROUTINE(sub_80029BC),
    PROC_SLEEP(8),
    PROC_LABEL(0),
    PROC_YIELD,
    PROC_END,
};

void sub_80029E8(int a, int b, int c, int d, struct Proc *parent)
{
    struct MusicProc *mproc;

    if (sub_8002264() != 0 && a == gUnknown_02024E5C.unk4 && b == c)
        return;

    if (parent != NULL)
        mproc = (struct MusicProc *)Proc_CreateBlockingChild(gUnknown_08587998, parent);
    else
        mproc = (struct MusicProc *)Proc_Create(gUnknown_08587998, ROOT_PROC_3);
    mproc->unk58 = d;
    if (sub_8002264() != 0 && a == gUnknown_02024E5C.unk4)
        mproc->unk5C = -1;
    else
        mproc->unk5C = a;
    mproc->unk64 = b;
    mproc->unk66 = c;
}

int sub_8002A6C(void)
{
    if (Proc_Find(gUnknown_08587998) != NULL)
        return TRUE;
    else
        return FALSE;
}

void sub_8002A88(int a)
{
    if (a != gUnknown_02024E5C.unk4)
    {
        if (sub_8002264() != 0)
            SomethingSoundRelated_80022EC(0);
        sub_8002448(a, 0);
    }
}

void DeleteAll6CWaitMusicRelated(void)
{
    Proc_DeleteAllWithScript(gUnknown_08587988);
}

void sub_8002AC8(void)
{
    DeleteAll6CWaitMusicRelated();
    m4aMPlayFadeOut(&gUnknown_03006440, 1);
    m4aMPlayFadeOut(&gUnknown_03006650, 1);
    gUnknown_02024E5C.unk2 = 0;
    gUnknown_02024E5C.unk4 = 0;
}
