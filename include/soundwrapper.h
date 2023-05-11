#ifndef GUARD_SOUNDWRAPPER_H
#define GUARD_SOUNDWRAPPER_H

int Sound_GetCurrentSong(void);
// ??? sub_8002264(???);
// ??? Sound_SetBGMVolume(???);
void Sound_SetSEVolume(int vol);
void Sound_FadeOutBGM(int speed);
// ??? Sound_FadeOutBGMAlt(???);
void Sound_FadeOutSE(int speed);
void StartBgmCore(int songId, struct MusicPlayerInfo *player);
// ??? StartOrChangeBgm(???);
void StartBgm(int songId, struct MusicPlayerInfo *player);
void StartBgmExt(int songId, int speed, struct MusicPlayerInfo *player);
// ??? sub_80024F0(???);
void StartBgmFadeIn(int songId, int b, struct MusicPlayerInfo *player);
void OverrideBgm(int songId);
void RestoreBgm(void);
// ??? _RestoreBgm(???);
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
void sub_80029E8(int songId, int b, int c, int d, ProcPtr parent);
s8 MusicProc4Exists(void);
// ??? sub_8002A88(???);
void DeleteAll6CWaitMusicRelated();
void sub_8002AC8(void);

#define PlaySoundEffect(id) \
    if (!gPlaySt.cfgDisableSoundEffects) \
        m4aSongNumStart((id))

extern struct ProcCmd CONST_DATA gMusicProc3Script[];

#endif  // GUARD_SOUNDWRAPPER_H
