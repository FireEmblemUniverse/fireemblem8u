#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 envelopeValue asm("r0");
register volatile u32 envelopePhase asm("r2");
register volatile struct WaveData *envelopeWave asm("r3");
register volatile struct SoundChannel *envelopeChannel asm("r4");
register volatile u32 envelopeLevel asm("r5");
register volatile u32 envelopeStatus asm("r6");
extern void SoundMainRAM_EnvelopeVolume(void);
extern void SoundMainRAM_EnvelopeSkip(void);
__attribute__((matching_tail_transfer))
void SoundMainRAM_EnvelopeCandidate(void)
{
    envelopeStatus = envelopeChannel->status;
    asm("" : "+r"(envelopeStatus));
    envelopeValue = 0xC7;
    asm("" : "+r"(envelopeValue));
    if (!(envelopeValue & envelopeStatus))
        { SoundMainRAM_EnvelopeSkip(); return; }
    envelopeValue = 0x80;
    asm("" : "+r"(envelopeValue));
    if (!(envelopeValue & envelopeStatus))
        goto existing;
    envelopeValue = 0x40;
    asm("" : "+r"(envelopeValue));
    if (envelopeValue & envelopeStatus)
        goto stop;
    envelopeStatus = 3;
    asm("" : "+r"(envelopeStatus));
    envelopeChannel->status = envelopeStatus;
    envelopeValue = (u32)envelopeWave;
    asm("" : "+r"(envelopeValue));
    envelopeValue += 16;
    envelopeChannel->cp = envelopeValue;
    envelopeValue = envelopeWave->size;
    asm("" : "+r"(envelopeValue));
    envelopeChannel->ct = envelopeValue;
    envelopeLevel = 0;
    asm("" : "+r"(envelopeLevel));
    envelopeChannel->ev = envelopeLevel;
    envelopeChannel->fw = envelopeLevel;
    envelopePhase = ((volatile u8 *)envelopeWave)[3];
    envelopeValue = 0xC0;
    asm("" : "+r"(envelopeValue));
    if (envelopeValue & envelopePhase) {
        envelopeValue = 0x10;
        asm("" : "+r"(envelopeValue));
        envelopeStatus |= envelopeValue;
        envelopeChannel->status = envelopeStatus;
    }
    goto attack;
existing:
    envelopeLevel = envelopeChannel->ev;
    asm("" : "+r"(envelopeLevel));
    envelopeValue = 4;
    asm("" : "+r"(envelopeValue));
    if (!(envelopeValue & envelopeStatus))
        goto release;
    envelopeValue = envelopeChannel->echoLength;
    envelopeValue -= 1;
    envelopeChannel->echoLength = envelopeValue;
    if ((s32)envelopeValue > 0)
        goto volume;
stop:
    envelopeValue = 0;
    asm("" : "+r"(envelopeValue));
    envelopeChannel->status = envelopeValue;
    SoundMainRAM_EnvelopeSkip();
    return;
release:
    envelopeValue = 0x40;
    asm("" : "+r"(envelopeValue));
    if (!(envelopeValue & envelopeStatus))
        goto decay;
    envelopeValue = envelopeChannel->release;
    asm("" : "+r"(envelopeValue));
    envelopeLevel *= envelopeValue;
    envelopeLevel >>= 8;
    envelopeValue = envelopeChannel->echoVolume;
    asm("" : "+r"(envelopeValue));
    if (envelopeLevel > envelopeValue)
        goto volume;
echo:
    envelopeLevel = envelopeChannel->echoVolume;
    asm("" : "+r"(envelopeLevel));
    if (!envelopeLevel)
        goto stop;
    envelopeValue = 4;
    asm("" : "+r"(envelopeValue));
    envelopeStatus |= envelopeValue;
    envelopeChannel->status = envelopeStatus;
    goto volume;
decay:
    envelopePhase = 3;
    envelopePhase &= envelopeStatus;
    asm("" : "+r"(envelopePhase));
    if (envelopePhase != 2)
        goto other;
    envelopeValue = envelopeChannel->decay;
    asm("" : "+r"(envelopeValue));
    envelopeLevel *= envelopeValue;
    envelopeLevel >>= 8;
    envelopeValue = envelopeChannel->sustain;
    asm("" : "+r"(envelopeValue));
    if (envelopeLevel > envelopeValue)
        goto volume;
    envelopeLevel = envelopeValue;
    if (!envelopeLevel)
        goto echo;
    envelopeStatus -= 1;
    envelopeChannel->status = envelopeStatus;
    goto volume;
other:
    if (envelopePhase != 3)
        goto volume;
attack:
    envelopeValue = envelopeChannel->attack;
    asm("" : "+r"(envelopeValue));
    envelopeLevel += envelopeValue;
    if (envelopeLevel < 255)
        goto volume;
    envelopeLevel = 255;
    asm("" : "+r"(envelopeLevel));
    envelopeStatus -= 1;
    envelopeChannel->status = envelopeStatus;
volume:
    SoundMainRAM_EnvelopeVolume();

}
