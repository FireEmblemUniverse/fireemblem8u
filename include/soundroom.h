#ifndef GUARD_SOUNDROOM_H
#define GUARD_SOUNDROOM_H

struct SoundRoomProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29; // maybe padding?
    /* 2A */ u16 bgYOffset;
    /* 2C */ u16 currentSongTime;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ s8 isSongPlaying;
    /* 31 */ u8 shuffleIndex;
    /* 32 */ s8 currentSongIdx;
    /* 33 */ u8 playableSongs;
    /* 34 */ u8 completionPercent;
    /* 35 */ u8 curIndex;
    /* 36 */ u8 totalSongs;
    /* 37 */ s8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39; // pad?
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ s8 unk_3c;
    /* 3D */ s8 unk_3d;
    /* 3E */ s8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ u32 flags[4];
};

struct SoundRoomEnt
{
    /* 00 */ int bgmId;
    /* 04 */ int songLength; // in frames
    /* 08 */ s8 (* displayCondFunc)(ProcPtr proc);
    /* 0C */ int nameTextId;
};

// ??? IsSoundRoomCompleted(???);
// ??? sub_80AEC90(???);
int CountTotalSoundRoomSongs(void);
// ??? CountSecretSoundRoomSongs(???);
// ??? IsSoundRoomSongPlayable(???);
// ??? CountDisplayedSoundRoomSongs(???);
// ??? InitSoundRoomSongData(???);
// ??? sub_80AEEC0(???);
// ??? SoundRoomSongChange_FadeOutPrevious(???);
// ??? SoundRoomSongChange_StartNext(???);
// ??? PlayNextShuffledSong(???);
// ??? InitSoundRoomShuffleBuffer(???);
// ??? SoundRoom_StartNextSong_Positive(???);
// ??? SoundRoom_StartNextSong_Negative(???);
// ??? UpdateVolumeGraphBuffer(???);
// ??? InitSoundRoomVolumeGraph(???);
// ??? VolumeGraphBuffer_Init(???);
// ??? VolumeGraphBuffer_Null(???);
// ??? VolumeGraphBuffer_Loop(???);
// ??? sub_80AF338(???);
// ??? sub_80AF350(???);
// ??? sub_80AF378(???);
// ??? sub_80AF3C8(???);
// ??? sub_80AF4D0(???);
// ??? TickCurrentSongTime(???);
// ??? SoundRoomUi_Init(???);
bool StartSoundRoomSong(struct SoundRoomProc * proc, int index, int flagsMaybe);
// ??? StopSoundRoomSong(???);
void TryDrawSoundRoomSongTitle(struct SoundRoomProc *);
// ??? SoundRoomUi_Loop_MainKeyHandler(???);
// ??? SoundRoomUi_RestartTitleMusic(???);
// ??? SoundRoomUi_OnEnd(???);
// ??? sub_80AFAB4(???);
// ??? SoundRoomUi_80AFBBC(???);
// ??? SoundRoomUi_Loop_MainUiSlideOut(???);
// ??? SoundRoomUi_80AFC98(???);
// ??? SoundRoomUi_80AFCE4(???);
// ??? SoundRoomUi_Loop_MainUiSlideIn(???);
// ??? SoundRoomUi_80AFD48(???);
// ??? SoundRoomUi_Loop_ShufflePlayUiSlideIn(???);
// ??? SoundRoomUi_Loop_ShufflePlayKeyHandler(???);
// ??? SoundRoomUi_Loop_ShufflePlayUiSlideOut(???);
ProcPtr StartSoundRoomScreen(ProcPtr);
void sub_80AFF30(void);
void DrawSoundRoomSongTitle(int index);
// ??? sub_80B0088(???);
// ??? DrawSoundRoomVolumeGraphSprites(???);
// ??? sub_80B0204(???);
// ??? DrawMusicPlayerTime(???);
// ??? SoundRoom_DrawSprites_Init(???);
// ??? SoundRoom_DrawSprites_Loop(???);
ProcPtr DrawSoundRoomSprites(ProcPtr);

extern struct SoundRoomEnt gSoundRoomTable[];

#endif // GUARD_SOUNDROOM_H
