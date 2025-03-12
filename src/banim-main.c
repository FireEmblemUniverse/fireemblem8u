#include "global.h"
#include "bmunit.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "banim_data.h"
#include "ctc.h"

void BattleAIS_ExecCommands(void)
{
    int type;
    u32 i, idx, frame_front;
    struct Anim *anim, *anim1, *anim2;

    for (i = 0; i < 4; i++) {
        gBanimDebugCurrentIndex = i;

        anim = gAnims[i];
        if (!anim)
            continue;

        type = anim->state2 & ANIM_BIT2_CMD_MASK;
        if (type == 0)
            continue;

        if (type & ANIM_BIT2_COMMAND) {
            while (1) {
                if (anim->commandQueueSize == 0)
                    goto end_exec_loop;

                switch (anim->commandQueue[anim->commandQueueSize - 1]) {
                case 0:
                    break;

                /**
                 * C01
                 * End of anim
                 *
                 * Mode9(BANIM_MODE_STANDING) is always endded in C01.
                 * Since this mode is used both in:
                 *      - on battle starting
                 *      - on unit get hitted
                 * 
                 * So we need to ensure that C01 can freeze banim in both of two cases.
                 *
                 * - On battle starting, set bit [gCtrlC01Blocking] to freeze anim
                 * - In battle, set bit [anim::state3::BIT2] to freeze anim
                 */
                case ANIM_CMD_WAIT_01:
                    if (C01_BLOCKING_PRE_BATTLE(anim))
                    {
                        anim->pScrCurrent = anim->pScrStart;
                    }
                    else if (!C01_BLOCKING_IN_BATTLE(anim))
                    {
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    else if (anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED)
                    {
                        /* Release the anim lock after battle hitting */
                        if (CheckEkrHitDone() == true)
                        {
                            anim->state3 &= ~(ANIM_BIT3_TAKE_BACK_ENABLE |
                                              ANIM_BIT3_C01_BLOCKING_IN_BATTLE |
                                              ANIM_BIT3_HIT_EFFECT_APPLIED);

                            anim->pScrCurrent = anim->pScrCurrent + 1;

                            if (Get0201FAC8() != 0)
                                Set0201FAC8(0);
                        }
                    }
                    break;

                case ANIM_CMD_WAIT_02:
                    if (anim->state3 & ANIM_BIT3_TAKE_BACK_ENABLE) {
                        anim->state3 &= ~ANIM_BIT3_TAKE_BACK_ENABLE;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;

                /**
                 * C03
                 * 1. Unset some debuff flashing effect
                 * 2. Exec shinning effect for legend weapon
                 */
                case ANIM_CMD_WAIT_03:
                    if (GetUnitEfxDebuff(gAnims[0]) & 0xC)
                        SetUnitEfxDebuff(gAnims[0], 0);

                    if (GetUnitEfxDebuff(gAnims[1]) & 0xC)
                        SetUnitEfxDebuff(gAnims[1], 0);

                    if (GetUnitEfxDebuff(gAnims[2]) & 0xC)
                        SetUnitEfxDebuff(gAnims[2], 0);

                    if (GetUnitEfxDebuff(gAnims[3]) & 0xC)
                        SetUnitEfxDebuff(gAnims[3], 0);
                    
                    if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                        anim->state3 |= ANIM_BIT3_BLOCKING;
                        if (GetAISLayerId(anim) == 0)
                            NewEfxSpecalEffect(anim);
                    }

                    if (anim->state3 & ANIM_BIT3_BLOCKEND) {
                        anim->state3 &= ~ANIM_BIT3_BLOCKING;
                        anim->state3 &= ~ANIM_BIT3_BLOCKEND;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;

                /**
                 * C04
                 * Start normal hitted effect if not MISS
                 */
                case ANIM_CMD_WAIT_04:
                    if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                        anim->state3 |= ANIM_BIT3_BLOCKING;
                        anim->state3 |= ANIM_BIT3_BLOCKEND;
                    }

                    if (anim->state3 & ANIM_BIT3_BLOCKEND) {
                        anim->state3 &= ~ANIM_BIT3_BLOCKING;
                        anim->state3 &= ~ANIM_BIT3_BLOCKEND;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                        anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;

                        /* Trigger hit effect for another side */
                        anim1 = GetAnimAnotherSide(anim);
                        type = GetAnimRoundTypeAnotherSide(anim);
                        if (CheckRoundMiss(type) == true)
                            if (anim1) {
                                anim1->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;

                                if (GetAISLayerId(anim) == 0)
                                    StartBattleAnimHitEffectsDefault(anim1, CheckRoundMiss(type));
                            }
                    }
                    break;

                /**
                 * C05
                 * Start spell anim (efxmagic)
                 */
                case ANIM_CMD_WAIT_05:
                    if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                        anim->state3 |= ANIM_BIT3_BLOCKING;
                        anim->state3 |= ANIM_BIT3_BLOCKEND;
                    }

                    if (anim->state3 & ANIM_BIT3_BLOCKEND) {
                        anim->state3 &= ~ANIM_BIT3_BLOCKING;
                        anim->state3 &= ~ANIM_BIT3_BLOCKEND;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                        anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;

                        if (GetAISLayerId(anim) == 0) {
                            StartSpellAnimation(anim);

                            if (Get0201FAC8())
                                Set0201FAC8(0x2);
                        }
                    }
                    break;

                /**
                 * C06
                 * Attacker anim trigger opponent's next round anim.
                 * 
                 * Usually, atttacker anim is written in:
                 * C06
                 * C0D
                 * in end.
                 */
                case 0x06:
                    anim1 = GetAnimAnotherSide(anim);
                    if (anim1) {
                        type = GetAnimNextRoundTypeAnotherSide(anim1);
                        if (type != ANIM_ROUND_INVALID)
                            anim1->state3 |= ANIM_BIT3_NEXT_ROUND_START;
                    }
                    break;

                /**
                 * C07
                 * Start attack animation
                 */
                case 0x07:
                    if (GetRoundFlagByAnim(anim) & ANIM_ROUND_SURE_SHOT) {
                        if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                            anim->state3 |= ANIM_BIT3_BLOCKING;

                            if (GetAISLayerId(anim) == 0)
                                NewEfxSkillType01BG(anim);
                        }
                    }
                    // Great shield
                    else if (GetRoundFlagByAnim(anim) & ANIM_ROUND_GREAT_SHIELD) {
                        if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                            anim->state3 |= ANIM_BIT3_BLOCKING;

                            if (GetAISLayerId(anim) == 0)
                                NewEfxSkillCommonBG(anim, 1);
                        }
                    }
                    // Pierce
                    else if (GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE) {
                        if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                            anim->state3 |= ANIM_BIT3_BLOCKING;
                
                            if (GetAISLayerId(anim) == 0) {
                                NewEfxSkillType01BG(anim);
                                gAnims[2]->state3 &= ANIM_BIT3_BLOCKING;
                                gAnims[2]->state &= ~ANIM_BIT_FROZEN;
                                gAnims[3]->state3 &= ANIM_BIT3_BLOCKING;
                                gAnims[3]->state &= ~ANIM_BIT_FROZEN;
                            }
                        }
                    }

                    if (!(anim->state3 & ANIM_BIT3_BLOCKING))
                        break;

                    if (anim->state3 & ANIM_BIT3_BLOCKEND) {
                        anim->state3 &= ~ANIM_BIT3_BLOCKING;
                        anim->state3 &= ~ANIM_BIT3_BLOCKEND;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;

                /**
                 * C08
                 * Critical hit
                 */
                case 0x08:
                case 0x09:
                case 0x0A:
                case 0x0B:
                case 0x0C:
                    if (GetAISLayerId(anim) == 0) {
                        anim1 = GetAnimAnotherSide(anim);
                        type = GetAnimRoundTypeAnotherSide(anim);
                        if (CheckRoundMiss(type) == false) {
                            if (GetEfxHpChangeType(anim1) != EFX_HPT_NOT_CHANGE) {
                                if (GetRoundFlagByAnim(anim) & ANIM_ROUND_SILENCER)
                                    NewEfxChillEffect(anim1);
                                else
                                    NewEfxPierceCritical(anim1);
                            }
                        }

                        if (anim1) {
                            anim1->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
                            type = GetAnimRoundTypeAnotherSide(anim);
                            StartBattleAnimHitEffectsDefault(anim1, CheckRoundMiss(type));
                        }
                    }
                    break;

                /**
                 * C0D
                 * Attack start its own next round anim.
                */
                case 0x0D:
                    type = GetAnimNextRoundType(anim);
                    anim1 = gAnims[GetAnimPosition(anim) * 2];
                    anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

                    switch (anim->currentRoundType) {
                    case ANIM_ROUND_HIT_CLOSE:
                    case ANIM_ROUND_CRIT_CLOSE:
                    case ANIM_ROUND_NONCRIT_FAR:
                    case ANIM_ROUND_CRIT_FAR:
                    case ANIM_ROUND_MISS_CLOSE:
                        if (type != -1)
                        {
                            anim1->nextRoundId = anim1->nextRoundId + 1;
                            anim2->nextRoundId = anim2->nextRoundId + 1;

                            SwitchAISFrameDataFromBARoundType(anim1, type);
                            SwitchAISFrameDataFromBARoundType(anim2, type);

                            anim1->state3 |= ANIM_BIT3_C01_BLOCKING_IN_BATTLE;
                            anim2->state3 |= ANIM_BIT3_C01_BLOCKING_IN_BATTLE;

                            type = BattleTypeToAnimModeEndOfDodge[gEkrDistanceType];
                            frame_front = BanimDefaultModeConfig[type * 4 + 0];

                            if (GetAnimPosition(anim) == EKR_POS_L)
                                idx = gpBanimModesLeft[frame_front];
                            else
                                idx = gpBanimModesRight[frame_front];

#ifndef NONMATCHING
                            {
                                register const void *_ptr asm("r4");
                                register u32 r1 asm("r1");
                                struct BanimModeData * unk = (void *)(idx + gBanimScrLeft + GetAnimPosition(anim) * 0x2A00);

                                anim1->pImgSheet = unk->img;
                                _ptr = anim1->pSpriteDataPool;
                                _ptr += r1 = unk->unk2;
                                anim1->pSpriteData = _ptr;
                                _ptr = anim2->pSpriteDataPool + 0x57F0;
                                anim2->pSpriteData = _ptr;
                            }
#else
                            {
                                struct BanimModeData * unk = (void *)(idx + gBanimScrLeft + GetAnimPosition(anim) * 0x2A00);

                                anim1->pImgSheet = unk->img;
                                anim1->pSpriteData = anim1->pSpriteDataPool + unk->unk2;
                                anim2->pSpriteData = anim2->pSpriteDataPool + 0x57F0;
                            }
#endif

                            if (gBanimForceUnitChgDebug[GetAnimPosition(anim)] == NULL)
                            {
                                if (gpImgSheet[GetAnimPosition(anim1)] != anim1->pImgSheet)
                                {
                                    NewEkrChienCHR(anim1);
                                    gpImgSheet[GetAnimPosition(anim1)] = anim1->pImgSheet;
                                }
                            }

                            AnimScrAdvance(anim1);
                            AnimScrAdvance(anim2);
                            goto end_exec_loop;
                        }

                    case ANIM_ROUND_TAKING_MISS_CLOSE:
                    case ANIM_ROUND_TAKING_MISS_FAR:
                        type = BattleTypeToAnimModeEndOfDodge[gEkrDistanceType];

                    case ANIM_ROUND_TAKING_HIT_CLOSE:
                    case ANIM_ROUND_STANDING:
                    case ANIM_ROUND_TAKING_HIT_FAR:
                        SwitchAISFrameDataFromBARoundType(anim1, type);
                        SwitchAISFrameDataFromBARoundType(anim2, type);

                        AnimScrAdvance(anim1);
                        AnimScrAdvance(anim2);
                        goto end_exec_loop;
                    } /* switch (type) */
                    break;

                /**
                 * C13
                 * efxTeonoOBJ?
                 */
                case ANIM_CMD_WAIT_13:
                    if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                        anim->state3 |= ANIM_BIT3_BLOCKING;
                    } else if (gEfxTeonoState == 1) {
                        gEfxTeonoState = 0;
                        anim->state3 &= ~ANIM_BIT3_BLOCKING;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;

                /**
                 * C14
                 * Heavy vibration of screen
                 */
                case 0x14:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxQuake(3);
                    break;

                /**
                 * C15
                 * Slight vibration of screen
                 */
                case 0x15:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxQuake(0);
                    break;

                /**
                 * C18
                 * Start of dodge toward the foreground
                 */
                case ANIM_CMD_WAIT_18:
                    if (anim->state3 & ANIM_BIT3_TAKE_BACK_ENABLE) {
                        anim->state3 &= ~ANIM_BIT3_TAKE_BACK_ENABLE;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                        anim->oam2Base = (0xF3FF & anim->oam2Base) | OAM2_LAYER(0x1);
                        anim->drawLayerPriority = 0x8C;
                        AnimSort();
                    }
                    break;

                /**
                 * C1A
                 * Normal hit effect
                 */
                case 0x1A:
                    if (GetAISLayerId(anim) == 0) {
                        anim1 = GetAnimAnotherSide(anim);
                        if (anim1) {
                            anim1->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
                            type = GetAnimRoundTypeAnotherSide(anim);
                            StartBattleAnimHitEffectsDefault(anim1, CheckRoundMiss(type));
                        }

                        if (GetEfxHpChangeType(anim1) != EFX_HPT_NOT_CHANGE) {
                            if (GetRoundFlagByAnim(anim) & ANIM_ROUND_SILENCER)
                                NewEfxChillEffect(anim1);
                            else
                                NewEfxNormalEffect(anim);
                        }
                    }
                    break;

                case 0x26:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxYushaSpinShield(anim, 0x0);
                    break;

                case 0x27:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxYushaSpinShield(anim, 0x1);
                    break;

                case 0x2C:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxHurtmutEff00(anim);
                    break;

                case ANIM_CMD_WAIT_2D:
                    if (GetRoundFlagByAnim(anim) & ANIM_ROUND_SILENCER) {
                        if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                            anim->state3 |= ANIM_BIT3_BLOCKING;

                            if (GetAISLayerId(anim) == 0)
                                NewEfxChillAnime(anim, 0);
                        } else {
                            if (anim->state3 & ANIM_BIT3_BLOCKEND) {
                                anim->state3 &= ~ANIM_BIT3_BLOCKING;
                                anim->state3 &= ~ANIM_BIT3_BLOCKEND;
                                anim->pScrCurrent = anim->pScrCurrent + 1;
                            }
                        }
                    } else {
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;

                /**
                 * C2E
                 * Sage's normal magic
                 */
                case 0x2E:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxMagfcast(anim, 0);
                    break;

                /**
                 * C2F
                 * Sage's critical magic
                 */
                case 0x2F:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxMagfcast(anim, 1);
                    break;

                /**
                 * C30
                 * Dirt kicking (as from dashing forward) animation
                 */
                case 0x30:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxSunakemuri(anim, 0);
                    break;

                /**
                 * C31
                 * Dirt wave (as from horse kicking forward from ground) animation
                 */
                case 0x31:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxSunakemuri(anim, 1);
                    break;

                /**
                 * C32
                 * Medium sized dirt wave moving backward animation
                 */
                case 0x32:
                    if (GetAISLayerId(anim) == 0)
                        NewEfxSunakemuri(anim, 2);
                    break;

                case ANIM_CMD_WAIT_39:
                    if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                        anim->state3 |= ANIM_BIT3_BLOCKING;
                        if (GetAISLayerId(anim) == 0)
                            NewEfxKingPika(anim);
                    } else {
                        if (anim->state3 & ANIM_BIT3_BLOCKEND) {
                            anim->state3 &= ~ANIM_BIT3_BLOCKING;
                            anim->state3 &= ~ANIM_BIT3_BLOCKEND;
                            anim->pScrCurrent = anim->pScrCurrent + 1;
                        }
                    }
                    break;

                case 0x3D:
                    if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                        anim->state3 |= ANIM_BIT3_BLOCKING;
                        if (GetAISLayerId(anim) == 0)
                            Set0201FAC8(1);
                        
                        nullsub_17(anim);
                        NewEfxspdquake(anim);
                    }

                    if (anim->state3 & ANIM_BIT3_BLOCKEND) {
                        anim->state3 &= ~ANIM_BIT3_BLOCKING;
                        anim->state3 &= ~ANIM_BIT3_BLOCKEND;
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;

                case 0x47:
                    NewEfxMantBatabata(anim);
                    break;

                case 0x4E:
                    NewEfxLokmsuna(anim);
                    break;
                
                case 0x51:
                    if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                        anim->state3 |= ANIM_BIT3_BLOCKING;
                        if (GetAISLayerId(anim) == 0)
                            NewEfxFlashFX(anim);
                    } else {
                        if (anim->state3 & ANIM_BIT3_BLOCKEND) {
                            anim->state3 &= ~ANIM_BIT3_BLOCKING;
                            anim->state3 &= ~ANIM_BIT3_BLOCKEND;
                            anim->pScrCurrent = anim->pScrCurrent + 1;
                        }
                    }
                    break;

                case ANIM_CMD_WAIT_52:
                    if (GetRoundFlagByAnim(anim) & ANIM_ROUND_SILENCER) {
                        if (!(anim->state3 & ANIM_BIT3_BLOCKING)) {
                            anim->state3 |= ANIM_BIT3_BLOCKING;
                            if (GetAISLayerId(anim) == 0)
                                NewEfxChillAnime(anim, 1);
                        } else {
                            if (anim->state3 & ANIM_BIT3_BLOCKEND) {
                                anim->state3 &= ~ANIM_BIT3_BLOCKING;
                                anim->state3 &= ~ANIM_BIT3_BLOCKEND;
                                anim->pScrCurrent = anim->pScrCurrent + 1;
                            }
                        }
                    } else {
                        anim->pScrCurrent = anim->pScrCurrent + 1;
                    }
                    break;

                case 25:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                case 33:
                case 34:
                case 35:
                case 36:
                case 37:
                case 40:
                case 41:
                case 42:
                case 43:
                case 51:
                case 52:
                case 53:
                case 54:
                case 55:
                case 56:
                case 58:
                case 60:
                case 62:
                case 63:
                case 64:
                case 65:
                case 66:
                case 67:
                case 68:
                case 69:
                case 70:
                case 72:
                case 73:
                case 74:
                case 75:
                case 76:
                case 77:
                case 79:
                case 86:
                case 87:
                case 88:
                case 89:
                case 90:
                case 91:
                case 92:
                case 93:
                case 94:
                case 95:
                case 96:
                case 97:
                case 98:
                case 99:
                case 100:
                case 101:
                case 102:
                case 103:
                case 104:
                case 106:
                case 107:
                case 108:
                case 109:
                case 110:
                case 111:
                case 112:
                case 115:
                case 116:
                case 117:
                case 118:
                case 119:
                case 120:
                case 121:
                case 122:
                case 123:
                    EfxPlaySEwithCmdCtrl(anim, anim->commandQueue[anim->commandQueueSize - 1]);
                    break;

                case 0x71:
                    if (GetAISLayerId(anim) == 0) {
                        anim->drawLayerPriority = 0x14;
                        AnimSort();
                    }
                    break;

                case 0x72:
                    if (GetAISLayerId(anim) == 0) {
                        anim->drawLayerPriority = 0x64;
                        AnimSort();
                    }
                    break;
                } /* switch */

                anim->commandQueueSize--;
            }

        // _080596D6
        end_exec_loop:
            anim->state2 &= ~(ANIM_BIT2_COMMAND |
                              ANIM_BIT2_0800 |
                              ANIM_BIT2_0080 |
                              ANIM_BIT2_0040 |
                              ANIM_BIT2_0020 |
                              ANIM_BIT2_0010 |
                              ANIM_BIT2_0008 |
                              ANIM_BIT2_0004 |
                              ANIM_BIT2_0002 |
                              ANIM_BIT2_0001);
        } /* ANIM_BIT2_COMMAND */

        // _080596E0
        if (type & ANIM_BIT2_FRAME) {
            if (GetAISLayerId(anim) == 0) {
                if (gBanimForceUnitChgDebug[GetAnimPosition(anim)] == NULL)
                    if (!(anim->state3 & ANIM_BIT3_4000))
                        if (gpImgSheet[GetAnimPosition(anim)] != anim->pImgSheet) {
                            RegisterAISSheetGraphics(anim);
                            gpImgSheet[GetAnimPosition(anim)] = anim->pImgSheet;
                        }
            }

            anim->state2 &= ~(ANIM_BIT2_FRAME |
                              ANIM_BIT2_0800 |
                              ANIM_BIT2_0080 |
                              ANIM_BIT2_0040 |
                              ANIM_BIT2_0020 |
                              ANIM_BIT2_0010 |
                              ANIM_BIT2_0008 |
                              ANIM_BIT2_0004 |
                              ANIM_BIT2_0002 |
                              ANIM_BIT2_0001);
        }

        if (!(type & ANIM_BIT2_STOP) && gCtrlC01Blocking != 1)
            continue;

        if (anim->state3 & ANIM_BIT3_NEXT_ROUND_START)
        {
            type = GetAnimNextRoundType(anim);
            if (type != ANIM_ROUND_INVALID)
            {
                anim1 = gAnims[GetAnimPosition(anim) * 2];
                SwitchAISFrameDataFromBARoundType(anim1, type);
                anim1->state3 &= ~ANIM_BIT3_NEXT_ROUND_START;
                anim1->state3 |= ANIM_BIT3_C01_BLOCKING_IN_BATTLE;

                anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];
                SwitchAISFrameDataFromBARoundType(anim2, type);
                anim2->state3 &= ~ANIM_BIT3_NEXT_ROUND_START;
                anim2->state3 |= ANIM_BIT3_C01_BLOCKING_IN_BATTLE;

                anim1->nextRoundId = anim1->nextRoundId + 1;
                anim2->nextRoundId = anim2->nextRoundId + 1;

                AnimScrAdvance(anim1);
                AnimScrAdvance(anim2);
            }
            else
            {
                anim1 = gAnims[GetAnimPosition(anim) * 2 + 0];
                anim1->state3 &= ~ANIM_BIT3_NEXT_ROUND_START;

                anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];
                anim2->state3 &= ~ANIM_BIT3_NEXT_ROUND_START;
            } /* ANIM_ROUND_INVALID */
        }
        else
        {
            if (anim->state3 & ANIM_BIT3_NEW_ROUND_START)
            {
                type = GetAnimNextRoundType(anim);
                if (type != ANIM_ROUND_INVALID)
                {
                    anim1 = gAnims[GetAnimPosition(anim) * 2];
                    SwitchAISFrameDataFromBARoundType(anim1, type);
                    anim1->state3 &= ~ANIM_BIT3_NEW_ROUND_START;
                    anim1->state3 |= ANIM_BIT3_C01_BLOCKING_IN_BATTLE;

                    anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];
                    SwitchAISFrameDataFromBARoundType(anim2, type);
                    anim2->state3 &= ~ANIM_BIT3_NEW_ROUND_START;
                    anim2->state3 |= ANIM_BIT3_C01_BLOCKING_IN_BATTLE;

                    anim1->nextRoundId = anim1->nextRoundId + 1;
                    anim2->nextRoundId = anim2->nextRoundId + 1;

                    AnimScrAdvance(anim1);
                    AnimScrAdvance(anim2);
                }
            }
            else
            {
                if (GetAISLayerId(anim) == 0)
                {
                    type = GetBattleAnimRoundType(anim->nextRoundId * 2 + GetAnimPosition(anim));
                    if (type == ANIM_ROUND_INVALID)
                        gBanimDoneFlag[GetAnimPosition(anim)] = 1;
                }
            }
        }
    }
}
