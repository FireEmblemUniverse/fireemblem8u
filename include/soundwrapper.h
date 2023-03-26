#ifndef GUARD_SOUNDWRAPPER_H
#define GUARD_SOUNDWRAPPER_H

int Sound_GetCurrentSong(void);
// ??? sub_8002264(???);
// ??? Sound_SetBGMVolume(???);
void Sound_SetSEVolume(int vol);
void Sound_FadeOutBGM(int speed);
// ??? Sound_FadeOutBGMAlt(???);
void Sound_FadeOutSE(int speed);
void Sound_PlaySong8002448(int songId, struct MusicPlayerInfo *player);
// ??? PlaySong8002478(???);
void Sound_PlaySong80024D4(int songId, struct MusicPlayerInfo *player);
void Sound_PlaySong80024E4(int songId, int speed, struct MusicPlayerInfo *player);
// ??? sub_80024F0(???);
// ??? Sound_PlaySong8002574(???);
void sub_8002620(int songId);
void sub_8002670(void);
// ??? sub_80026BC(???);
// ??? sub_800270C(???);
void ISuspectThisToBeMusicRelated_8002730(int volume, int b, int c, ProcPtr parent);
// ??? sub_8002788(???);
// ??? Some6CMusicRelatedWaitCallback(???);
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
