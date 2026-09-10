#include "global.h"
#include "gba/m4a_internal.h"
extern char SoundMainRAM_Buffer[];
// Shared word order is part of the original SoundMain layout.
const u32 gSoundMainEntryLiterals[6] = {
    0x03007ff0, // SoundInfo pointer slot
    ID_NUMBER,
    (u32)SoundMainRAM_Buffer + 1,
    0x04000006, // VCOUNT byte address
    offsetof(struct SoundInfo, pcmBuffer),
    PCM_DMA_BUF_SIZE,
};
