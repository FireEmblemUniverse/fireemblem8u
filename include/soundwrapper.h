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
void ISuspectThisToBeMusicRelated_8002730(int volume, int b, int c, struct Proc *parent);
// ??? sub_8002788(???);
// ??? Some6CMusicRelatedWaitCallback(???);
void StartSongDelayed();
void PlaySong();
void Sound_SetDefaultMaxNumChannels();
void Sound_SetMaxNumChannels();
void sub_80028FC(int songId);
// ??? IsMusicProc2Running(???);
// ??? sub_800296C(???);
// ??? sub_80029BC(???);
void sub_80029E8(int songId, int b, int c, int d, struct Proc *parent);
// ??? sub_8002A6C(???);
// ??? sub_8002A88(???);
void DeleteAll6CWaitMusicRelated();
// ??? sub_8002AC8(???);

#define PlaySoundEffect(id) \
    if (!gRAMChapterData.unk41_2) \
        m4aSongNumStart((id))

#endif  // GUARD_SOUNDWRAPPER_H
