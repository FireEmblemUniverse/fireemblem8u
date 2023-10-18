#ifndef GUARD_SOUNDWRAPPER_H
#define GUARD_SOUNDWRAPPER_H

#include "global.h"
#include "proc.h"

struct SoundSt {
    u8 filler0[2];
    u16 unk2;
    u16 songId;
    s8 is_song_playing;
    s8 unk7;
    s8 maxChannels;
};

extern struct SoundSt gSoundSt;

int GetCurrentBgmSong(void);
// ??? IsBgmPlaying(???);
void Sound_SetBGMVolume(int volume);
void Sound_SetSEVolume(int vol);
void Sound_FadeOutBGM(int speed);
// ??? Sound_FadeOutBGMAlt(???);
void Sound_FadeOutSE(int speed);
void StartBgmCore(int songId, struct MusicPlayerInfo * player);
void StartOrChangeBgm(int songId, int speed, struct MusicPlayerInfo * player);
void StartBgm(int songId, struct MusicPlayerInfo * player);
void StartBgmExt(int songId, int speed, struct MusicPlayerInfo * player);
void MusicFi_OnLoop(ProcPtr proc);
void StartBgmFadeIn(int songId, int b, struct MusicPlayerInfo * player);
void OverrideBgm(int songId);
void RestoreBgm(void);
void _RestoreBgm(u16 speed);
void MakeBgmOverridePersist(void);
void StartBgmVolumeChange(int volumeInit, int volumeEnd, int duration, ProcPtr parent);
// ??? MusicVc_OnLoop(???);
// ??? DelaySong_OnLoop(???);
void StartSongDelayed();
void PlaySong();
void Sound_SetDefaultMaxNumChannels();
void Sound_SetMaxNumChannels();
void sub_80028FC(int songId);
int IsMusicProc2Running(void);
// ??? sub_800296C(???);
// ??? sub_80029BC(???);
void CallSomeSoundMaybe(int songId, int b, int c, int d, ProcPtr parent);
s8 MusicProc4Exists(void);
// ??? sub_8002A88(???);
void DeleteAll6CWaitMusicRelated();
void sub_8002AC8(void);

#define PlaySoundEffect(id) \
    if (!gPlaySt.config.disableSoundEffects) \
        m4aSongNumStart((id))

extern struct ProcCmd CONST_DATA gMusicProc3Script[];

#endif  // GUARD_SOUNDWRAPPER_H
