#include "sio_core.h"

#include "sioerror.h"
#include "soundwrapper.h"

#include <string.h> // memcpy, TODO: remvoe

struct SioSt EWRAM_DATA gSioStInstance = { 0 };

struct SioSt * SHOULD_BE_CONST gSioSt = &gSioStInstance;

u16 EWRAM_DATA gSioOutgoing[0x200] = { 0 };
u16 EWRAM_DATA gSioIncoming[0x200][4] = { 0 };

static u8 sSioCnt;
static int sSioId;
static struct SioPending * sUnk_0;
static u32 sUnk_1;

static u16 sSendCursor;
static u16 sWriteCursor;
static u16 sReadCursor[4];
static u16 sRecvCursor[4];

// COMMON
extern u32 gUnk_71;
extern u32 gUnk_72;
extern u32 gSioStateId;
extern struct SioMessage gSioMsgBuf;
extern u8 gUnk_75[SIO_MAX_PACKET];

// clang-format off

struct ProcCmd CONST_DATA gProcScr_SioBigSend[] =
{
    PROC_YIELD,
    PROC_CALL(SioBigSend_Init),
    PROC_REPEAT(SioBigSend_Loop),
    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SioBigReceive[] =
{
    PROC_YIELD,
    PROC_CALL(SioBigReceive_Init),
    PROC_REPEAT(SioBigReceive_RecvHeader),
    PROC_REPEAT(SioBigReceive_Loop),
    PROC_END,
};

// clang-format on

// TODO: what to do here? This is improvable
struct SioRegs
{
    u16 siocnt;
    u16 siodata;
};

#define SIO ((struct SioRegs *)(&REG_SIOCNT))

int SioPollingMsg(void)
{
    u16 siocnt;

    switch (gSioStateId)
    {
        case 0:
            REG_RCNT = 0;

            SIO->siodata = ~gSioSt->unk_1B78;
            SIO->siocnt = sSioCnt | SIO_INTR_ENABLE | SIO_MULTI_MODE;

            siocnt = REG_SIOCNT;

            if ((siocnt & SIO_MULTI_SD) != 0)
            {
                sSioId = siocnt & SIO_MULTI_SI;

                if (sSioId != 0)
                    sSioId = -1;

                gUnk_72 = 0;
                gSioStateId = 1;
            }

            return -1;

        case 1:
            siocnt = REG_SIOCNT;

            if (gUnk_72 != 0 && (siocnt & SIO_ERROR) == 0 && gSioSt->lastRecv[1] != UINT16_MAX)
            {
                sSioId = (siocnt & SIO_ID) >> 4; // TODO: shift constant
                gSioStateId = 2;

                return sSioId;
            }
            else
            {
                SIO->siodata = ~gSioSt->unk_1B78;

                if (sSioId != 0)
                {
                    REG_SIOCNT = sSioCnt | SIO_INTR_ENABLE | SIO_MULTI_MODE;
                }
                else
                {
                    REG_SIOCNT = sSioCnt | SIO_INTR_ENABLE | SIO_MULTI_MODE | SIO_MULTI_BUSY;
                }

                return -1;
            }

        default:
            return sSioId;
    }
}

int GetSioIndex(void)
{
    return (REG_SIOCNT & SIO_ID) >> 4; // TODO: shift constant
}

void Sio_SetCommParams(u16 arg_0, u16 sioCnt, u16 arg_2)
{
    gSioSt->unk_1B78 = arg_0;
    gSioSt->unk_1B7A = sioCnt;
    gSioSt->unk_1B7C = arg_2;
    sSioCnt = sioCnt;
}

void Sio_ResetSession(void)
{
    int j, i;

    // TODO: constants

    gUnk_71 = 0;

    gSioSt->unk_022 = 0;
    gSioSt->selfSeq = 0;
    gSioSt->nextPendingSend = 0;
    gSioSt->nextPendingWrite = 0;
    gSioSt->nextPendingRead = 0;
    gSioSt->nextPendingRecv = 0;
    gSioSt->unk_01E = 0;
    gSioSt->unk_01F = 0;
    gSioSt->unk_020 = 0;
    gSioSt->unk_030 = 0;

    for (i = 0; i < 4; i++)
    {
        gSioSt->playerStatus[i] = PLAYER_STATUS_0;
        gSioSt->lastRecv[i] = 0;
        gSioSt->timeoutClock[i] = 0;
        gSioSt->seq[i] = 0;
    }

    for (i = 0; i < SIO_MAX_PACKET; i++)
    {
        gUnk_75[i] = 0;
        gSioSt->buf[i] = 0;
    }

    for (j = 0; j < SIO_MAX_PENDING_SEND; j++)
    {
        struct SioPending * ent = &gSioSt->pendingSend[j];

        ent->unk_00 = 0;
        ent->packet.head.kind = 0;

        for (i = 0; i < (int)ARRAY_COUNT(ent->packet.bytes); i++)
            ent->packet.bytes[i] = 0;
    }

    for (j = 0; j < SIO_MAX_PENDING_RECV; j++)
    {
        struct SioPending * ent = &gSioSt->pendingRecv[j];

        ent->unk_00 = 0;
        ent->packet.head.kind = 0;

        for (i = 0; i < (int)ARRAY_COUNT(ent->packet.bytes); i++)
            ent->packet.bytes[i] = 0;
    }

    sSendCursor = sWriteCursor = 0;

    for (i = 0; i < 0x200; i++)
    {
        gSioOutgoing[i] = 0;
    }

    for (j = 0; j < 4; j++)
    {
        sReadCursor[j] = sRecvCursor[j] = 0;

        for (i = 0; i < 0x200; i++)
        {
            gSioIncoming[i][j] = 0;
        }
    }
}

void Sio_ResetState(void)
{
    int i;

    gSioSt->unk_000 = 0;
    gSioSt->unk_001 = 0;
    gSioSt->lastSioCnt = 0;
    gSioSt->unk_004 = 0;
    gSioSt->selfId = -1;
    gSioSt->unk_007 = 0;
    gSioSt->recvFlags = 0;
    gSioSt->unk_009 = 0;
    gSioSt->unk_00F = 0;
    gSioSt->unk_010 = 0;
    gSioSt->unk_011 = 0;
    gSioSt->unk_02E = 0;
    gSioSt->unk_00A = 0;

    Sio_SetCommParams(0x6584, 3, 0x88);
    Sio_SetSubState(0);
    Sio_ResetSession();

    sUnk_1 = 0;
}

void SioRegisterIrq(void)
{
    // Multi-Player mode SIO
    REG_RCNT = 0;
    REG_SIOCNT = sSioCnt | SIO_MULTI_MODE;

    REG_TM3CNT_H = 0;

    gUnk_72 = gUnk_71 = 0;
    gSioStateId = 0;
    sSioId = -1;

    SetIRQHandler(7, SioHandleIrq_Serial);
    SetIRQHandler(6, SioHandleIrq_Timer3);

    REG_IE |= INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL;
}

void SioReleaseIrq(void)
{
    // general purpose SIO
    REG_RCNT = 0x8000;
    REG_SIOCNT = 0;

    gUnk_72 = gUnk_71 = 0;
    gSioStateId = 0;
    sSioId = -1;

    SetIRQHandler(7, NULL);
    SetIRQHandler(6, NULL);

    REG_IE &= ~(INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
}

void SioHandleIrq_Serial(void)
{
    int i;
    u16 recv[4];
    u16 var_08;
    u16 siocnt;

    u16 sb = 0;

    // TODO: constants, cleanup

    gUnk_72 = 1;
    gSioSt->unk_01E = 0;
    gUnk_71 = 1;
    gSioSt->recvFlags = 0;

    REG_TM3CNT_H = 0;

    gSioSt->lastSioCnt = siocnt = REG_SIOCNT;

    if (gSioSt->unk_004 != 6)
    {
        gSioSt->selfId = (siocnt >> 4) & 3;
    }

    // ew
    *(u64 *)(recv) = REG_SIOMLT_RECV;

    REG_SIOCNT = sSioCnt | SIO_MULTI_MODE | SIO_INTR_ENABLE;
    SIO->siodata = 0x7FFF;

    for (i = 0; i < 4; i++)
    {
        if (recv[i] != 0 && recv[i] != 0xFFFF)
        {
            if (gSioSt->playerStatus[i] == PLAYER_STATUS_0)
                gSioSt->playerStatus[i] = PLAYER_STATUS_1;

            gSioSt->recvFlags |= 1 << i;
        }
        else
        {
            if (Sio_IsPlayerConnected(i) == TRUE)
            {
                if (gSioSt->lastRecv[i] == 0xFFFF)
                {
                    gSioSt->timeoutClock[i]++;
                }
                else
                {
                    gSioSt->timeoutClock[i] = 0;
                }
            }
        }

        gSioSt->lastRecv[i] = gSioIncoming[sRecvCursor[i]][i] = recv[i];

        sRecvCursor[i] = (sRecvCursor[i] + 1) & 0x1FF;
    }

    if (gSioSt->unk_004 > 4)
    {
        switch (gSioSt->unk_001)
        {
            case 1:
                if (sWriteCursor != sSendCursor)
                {
                    var_08 = gSioOutgoing[sSendCursor];
                    sSendCursor = (sSendCursor + 1) & 0x1FF;
                    SioSend16(&var_08, 1);
                }

                if (gSioSt->selfId == 0 && gSioSt->unk_1B7C != 0)
                {
                    REG_TM3CNT = -gSioSt->unk_1B7C;
                    REG_TM3CNT_H = 0xC3;
                }

                break;

            case 3:
                if (gSioSt->selfId != 0)
                {
                    SioSend16(&gSioSt->unk_030, 1);
                    gSioSt->unk_030 = 0x5FFF;
                }

                for (i = 0; i < 4; i++)
                {
                    // TODO: what is 0x1288? it is 0x9ABC in mgfembp
                    if (Sio_IsPlayerConnected(i) && recv[i] != 0x1288)
                        sb++;
                }

                if (sb == 0)
                    gSioSt->unk_1B7E = 1;

                break;
        }
    }

    gUnk_71 = 0;
}

void SioVsync_Loop(void)
{
    int i;
    u32 len;
    struct SioData * dat;

    // TODO: cleanup

    if (gSioSt->unk_004 > 4 && gSioSt->unk_001 != 0)
    {
        gSioSt->unk_01E++;

        if (gSioSt->unk_004 == 6)
        {
            switch (gSioSt->unk_021)
            {
                case 3:
                    if (gSioSt->unk_01E > 60)
                    {
                        gSioSt->playerStatus[gSioSt->selfId] = PLAYER_STATUS_0;
                        StartSioErrorScreen();
                    }

                    // fallthrough

                case 2:
                    if (gSioSt->unk_001 != 0 && !Sio_CheckLinkAlive())
                    {
                        gSioSt->playerStatus[gSioSt->selfId] = PLAYER_STATUS_0;
                        StartSioErrorScreen();
                    }

                    // fallthrough

                case 1:
                    for (i = 0; i < 4; i++)
                    {
                        if (gSioSt->timeoutClock[i] > 60)
                        {
                            gSioSt->playerStatus[i] = PLAYER_STATUS_0;
                            StartSioErrorScreen();
                        }
                    }

                    break;
            }
        }

        if (gSioSt->unk_001 == 1)
        {
            if (gSioSt->unk_010 == 0)
            {
                if (gSioSt->unk_011 > 60)
                {
                    StartSioErrorScreen();
                    gSioSt->unk_004 = 2;
                    return;
                }

                dat = Sio_PeekPendingSendData(&len);

                if (dat != NULL)
                {
                    if (SioSend(dat, len + offsetof(struct SioData, bytes)) > 0)
                    {
                        gSioSt->unk_010 = 0;
                        gSioSt->unk_011++;
                        gSioSt->unk_02E = 1;
                    }
                }
            }

            gSioSt->unk_010++;
            gSioSt->unk_010 = gSioSt->unk_010 % 38;
        }
        else if (gSioSt->unk_001 == 2 || gSioSt->unk_001 == 3)
        {
            if (gSioSt->selfId == 0)
            {
                SioSend16(&gSioSt->unk_030, -1);
                gSioSt->unk_030 = 0x5FFF;
            }
        }
    }
}

void SioHandleIrq_Timer3(void)
{
    REG_TM3CNT_H = 0;
    REG_SIOCNT = sSioCnt | SIO_MULTI_MODE | SIO_INTR_ENABLE | SIO_ENABLE;
}

void Sio_PlayRemoteSoundEffect(int num)
{
    u32 table[4] = {
        0x6C, 0x6C, 0x6C, 0x6C
    };

    PlaySoundEffect(table[num]);
}

void SioMain_Loop(void)
{
    int i, j;

    // TODO: clean up

    if (gSioSt->unk_001 != 1)
        return;

    gSioSt->unk_00F |= 1 << gSioSt->selfId;

    for (i = 0; i < 4; i++)
    {
        u16 len;

    redo:
        len = Sio_ReadPacket(i, gSioSt->buf);

        if (len != 0)
        {
            switch (len)
            {
                struct SioMessage * message;
                struct SioData * data_message;

                case 0x0A:
                case 0x16:
                case 0x2A:
                case 0x2E:
                case 0x80:
                    data_message = (void *)gSioSt->buf;

                    if (data_message->head.kind != SIO_MSG_8C)
                    {
                        if (data_message->head.kind != SIO_MSG_DATA)
                            break;

                        if (data_message->head.sender == gSioSt->selfId)
                            break;

                        if (data_message->head.param != gSioSt->seq[data_message->head.sender])
                        {
                            gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
                            gSioMsgBuf.sender = (gSioSt->selfId << 4) | data_message->head.sender;
                            gSioMsgBuf.param = gSioSt->seq[data_message->head.sender];

                            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

                            goto redo;
                        }
                        else
                        {
                            SioQueuePendingRecvData(data_message);

                            gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
                            gSioMsgBuf.sender = (gSioSt->selfId << 4) | data_message->head.sender;
                            gSioMsgBuf.param = gSioSt->seq[data_message->head.sender] + 1;

                            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));
                        }

                        break;
                    }

                    for (j = 0; j < 15; j++)
                    {
                        gLinkArenaSt.unk_A1[i][j] = data_message->bytes[j];
                    }

                    if ((Sio_IsPlayerConnected(i) == 0 && gSioSt->unk_000 == data_message->head.param && gSioSt->unk_004 <= 5) ||
                        (Sio_IsPlayerConnected(i) == 1))
                    {
                        if (gSioSt->selfId == 0)
                        {
                            gSioMsgBuf.kind = SIO_MSG_86;
                            gSioMsgBuf.sender = gSioSt->selfId;
                            gSioMsgBuf.param = i;

                            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));
                        }

                        break;
                    }

                    if (gSioSt->selfId == 0)
                    {
                        u32 cmd = gSioSt->unk_000 != data_message->head.param ? SIO_MSG_87 : SIO_MSG_85;

                        gSioMsgBuf.kind = cmd;
                        gSioMsgBuf.sender = gSioSt->selfId;
                        gSioMsgBuf.param = i;

                        SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));
                    }

                    break;

                case 0x04:
                    message = (void *)gSioSt->buf;

                    switch (message->kind)
                    {
                        case SIO_MSG_89:
                            gSioSt->unk_00A |= 1 << message->sender;
                            break;

                        case SIO_MSG_DATA_ACK:
                            if (gSioSt->unk_02E != 0)
                            {
                                if ((message->sender >> 4) != gSioSt->selfId &&
                                    (message->sender & 0x0F) == gSioSt->selfId &&
                                    (message->param == (u16)(gSioSt->selfSeq + 1)))
                                {
                                    gSioSt->unk_00F |= 1 << (message->sender >> 4);
                                    sUnk_0->unk_00 = gSioSt->unk_00F;

                                    if ((gSioSt->unk_00F & gSioSt->unk_009) == gSioSt->unk_009)
                                    {
                                        gSioSt->selfSeq++;
                                        gSioSt->pendingSend[gSioSt->nextPendingSend].packet.head.kind = 0;
                                        gSioSt->nextPendingSend++;
                                        gSioSt->nextPendingSend &= (SIO_MAX_PENDING_SEND - 1);
                                        gSioSt->unk_02E = 0;
                                        gSioSt->unk_010 = gSioSt->unk_011 = gSioSt->unk_00F = 0;
                                    }
                                }
                            }

                            break;

                        case SIO_MSG_87:
                            if (Sio_IsPlayerConnected(message->param) == 0)
                            {
                                gSioSt->playerStatus[gSioSt->selfId] = PLAYER_STATUS_2;
                                gSioSt->playerStatus[(gSioSt->lastSioCnt & 0x30) >> 4] = PLAYER_STATUS_2;
                                gSioSt->playerStatus[message->param] = PLAYER_STATUS_2;
                                gSioSt->unk_004 = 6;
                            }

                            break;

                        case SIO_MSG_85:
                            if (Sio_IsPlayerConnected(message->param) == 0)
                            {
                                gSioSt->playerStatus[message->param] = PLAYER_STATUS_2;
                                gSioSt->unk_004 = 6;
                            }

                            break;

                        case SIO_MSG_86:
                            gLinkArenaSt.linking_status[message->param] = 1;
                            gSioSt->playerStatus[message->param] = PLAYER_STATUS_5;
                            gSioSt->unk_009 |= 1 << message->param;
                            gSioSt->timeoutClock[message->param] = 0;
                            break;

                        case SIO_MSG_84:
                            Sio_PlayRemoteSoundEffect(message->sender);
                            break;
                    }

                    break;
            }
        }
    }
}

void SioCore_Nop_0(void)
{
}

int Sio_CountConnectedPlayers(void)
{
    int i;

    u8 count = 0;

    for (i = 0; i < 4; i++)
    {
        if (Sio_IsPlayerConnected(i) == TRUE)
            count++;
    }

    return count;
}

int Sio_CountActivePlayers(void)
{
    int i;

    u8 count = 0;

    for (i = 0; i < 4; i++)
    {
        if (Sio_IsPlayerActiveThisFrame(i) == TRUE)
            count++;
    }

    return count;
}

bool Sio_IsPlayerConnected(u8 playerId)
{
    if (((gSioSt->unk_009 >> playerId) & 1) != 0)
        return TRUE;

    return FALSE;
}

bool Sio_IsPlayerActiveThisFrame(u8 playerId)
{
    if (((gSioSt->recvFlags >> playerId) & 1) != 0)
        return TRUE;

    return FALSE;
}

bool Sio_CheckLinkAlive(void)
{
    int lastSioCnt = gSioSt->lastSioCnt;
    gSioSt->lastSioCnt = 0;

    if ((lastSioCnt & SIO_MULTI_SD) == 0 && (REG_SIOCNT & SIO_MULTI_SD) == 0)
    {
        gSioSt->unk_020++;
    }
    else
    {
        gSioSt->unk_020 = 0;
    }

    if (gSioSt->unk_020 > 10)
        return FALSE;

    return TRUE;
}

int Sio_GetPendingSendCount(void)
{
    if (gSioSt->nextPendingWrite >= gSioSt->nextPendingSend)
    {
        return gSioSt->nextPendingWrite - gSioSt->nextPendingSend;
    }
    else
    {
        return SIO_MAX_PENDING_SEND + gSioSt->nextPendingWrite - gSioSt->nextPendingSend;
    }
}

bool Sio_AreAllPlayersReady(void)
{
    int i, count = 0;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->playerStatus[i] == PLAYER_STATUS_5)
            count++;
    }

    if ((gSioSt->unk_009 == 0x3 && count == 2) || (gSioSt->unk_009 == 0x7 && count == 3) ||
        (gSioSt->unk_009 == 0xF && count == 4))
    {
        return TRUE;
    }

    return FALSE;
}

s16 SioSend(const void * src, u16 len)
{
#define SRC_U16 ((u16 const *)src)

    int i;

    u16 magic;

    u16 sum_a = 0;
    u16 sum_b = 0;

    u16 cur = sWriteCursor;

    if (len > SIO_MAX_PACKET)
        return -1;

    len = len / 2;
    magic = 0x4FFF;
    sum_a = magic + len;

    // write headers

    gSioOutgoing[cur] = magic;
    cur = cur + 1;
    cur = cur & 0x1FF;

    if (cur == sSendCursor)
        return -1;

    gSioOutgoing[cur] = len;
    cur = cur + 1;
    cur = cur & 0x1FF;

    if (cur == sSendCursor)
        return -1;

    // compute checksum

    for (i = 0; i < len; i++)
    {
        u32 frag = SRC_U16[i] * (i + 1);

        sum_a = sum_a + frag;
        sum_b = sum_b + ~frag;
    }

    // write checksum

    gSioOutgoing[cur] = sum_a;
    cur = cur + 1;
    cur = cur & 0x1FF;

    if (cur == sSendCursor)
        return -1;

    gSioOutgoing[cur] = sum_b;
    cur = cur + 1;
    cur = cur & 0x1FF;

    if (cur == sSendCursor)
        return -1;

    // write data

    for (i = 0; i < len; i++)
    {
        gSioOutgoing[cur] = SRC_U16[i];
        cur = cur + 1;
        cur = cur & 0x1FF;

        if (cur == sSendCursor)
            return -1;
    }

    sWriteCursor = cur;

    return len;

#undef SRC_U16
}

s16 Sio_ReadPacket(s8 playerId, void * dst)
{
#define DST_U16 ((u16 *)dst)

    int i;

    u16 magic;

    u16 sum_a = 0;
    u16 recv_sum_a;
    u16 sum_b = 0;
    u16 recv_sum_b;

    u16 count;
    u16 lookahead;
    u16 len;

    if (sReadCursor[playerId] == sRecvCursor[playerId])
        return -2;

    if (gSioIncoming[sReadCursor[playerId]][playerId] != 0x4FFF)
    {
        while (sReadCursor[playerId] != sRecvCursor[playerId])
        {
            sReadCursor[playerId] += 1;
            sReadCursor[playerId] &= 0x1FF;

            if (gSioIncoming[sReadCursor[playerId]][playerId] == 0x4FFF &&
                sReadCursor[playerId] != sRecvCursor[playerId])
            {
                goto yes;
            }
        }

        return -4;
    }

yes:
    if (sRecvCursor[playerId] < sReadCursor[playerId])
    {
        count = 0x200 - sReadCursor[playerId] + sRecvCursor[playerId];
    }
    else
    {
        count = sRecvCursor[playerId] - sReadCursor[playerId];
    }

    if (count <= 4)
        return -4;

    if (sReadCursor[playerId] + 1 < 0x200)
    {
        lookahead = sReadCursor[playerId] + 1;
    }
    else
    {
        lookahead = 0;
    }

    len = gSioIncoming[lookahead][playerId];

    if (len > SIO_MAX_PACKET)
    {
        sReadCursor[playerId] += 1;
        sReadCursor[playerId] &= 0x1FF;

        return -4;
    }

    if (len + 6 > count)
    {
        return -2;
    }

    sReadCursor[playerId] += 2;
    sReadCursor[playerId] &= 0x1FF;

    recv_sum_a = gSioIncoming[sReadCursor[playerId]][playerId];

    sReadCursor[playerId] += 1;
    sReadCursor[playerId] &= 0x1FF;

    recv_sum_b = gSioIncoming[sReadCursor[playerId]][playerId];

    sReadCursor[playerId] += 1;
    sReadCursor[playerId] &= 0x1FF;

    sum_a += 0x4FFF + len;

    for (i = 0; i < len; i++)
    {
        u32 data = gSioIncoming[sReadCursor[playerId]][playerId];
        u32 frag = data * (i + 1);

        sum_a = sum_a + frag;
        sum_b = sum_b + ~frag;

        DST_U16[i] = data;

        sReadCursor[playerId] += 1;
        sReadCursor[playerId] &= 0x1FF;
    }

    if (sum_a != recv_sum_a || sum_b != recv_sum_b)
    {
        return -3;
    }

    return len * 2;

#undef DST_U16
}

int SioSend16(u16 * word, int arg_1)
{
    if (gSioSt->selfId == -1)
        return -1;

    SIO->siodata = *word;

    if (gSioSt->selfId == 0 && arg_1 < 0)
    {
        REG_SIOCNT = sSioCnt | SIO_MULTI_MODE | SIO_INTR_ENABLE | SIO_ENABLE;
    }

    return 0;
}

int Sio_ReadMultiFrame(int unused_0, u16 * arg_1)
{
    int i;

    if (sReadCursor[0] == sRecvCursor[0])
    {
        *arg_1++ = 0x7FFF;
        *arg_1++ = 0x7FFF;
        *arg_1++ = 0x7FFF;
        *arg_1++ = 0x7FFF;

        return -2;
    }

    for (i = 0; i < 4; i++)
    {
        *arg_1++ = gSioIncoming[sReadCursor[i]][i];

        sReadCursor[i] += 1;
        sReadCursor[i] &= 0x1FF;
    }

    return 0;
}

void SioQueuePendingRecvData(struct SioData * data)
{
    // TODO: clean up

    int i;

    struct SioPending * ent = &gSioSt->pendingRecv[gSioSt->nextPendingRecv];

    ent->packet.head.kind = data->head.kind;
    ent->packet.head.sender = data->head.sender;
    ent->packet.head.param = data->head.param;

    ent->packet.len = data->len;

    for (i = 0; i < data->len; i++)
    {
        ent->packet.bytes[i] = data->bytes[i];
    }

    gSioSt->nextPendingRecv += 1;
    gSioSt->nextPendingRecv &= (SIO_MAX_PENDING_RECV - 1);
}

struct SioData * Sio_PeekPendingSendData(u32 * out)
{
    if (gSioSt->pendingSend[gSioSt->nextPendingSend].packet.head.kind != SIO_MSG_DATA)
        return NULL;

    sUnk_0 = &gSioSt->pendingSend[gSioSt->nextPendingSend];

    *out = gSioSt->pendingSend[gSioSt->nextPendingSend].packet.len;
    return &gSioSt->pendingSend[gSioSt->nextPendingSend].packet;
}

int SioEmitData(u8 const * src, u16 len)
{
    // TODO: clean up

    int result;
    u8 i;

    struct SioData * dat;

    sUnk_1 = 1;

    gSioSt->pendingSend[gSioSt->nextPendingWrite].unk_00 = 0;
    dat = &gSioSt->pendingSend[gSioSt->nextPendingWrite].packet;

    dat->head.kind = SIO_MSG_DATA;
    dat->head.sender = gSioSt->selfId;
    dat->head.param = gSioSt->unk_022;
    dat->len = len;

    gSioSt->unk_022++;

    for (i = 0; i < len; i++)
    {
        dat->bytes[i] = src[i];
    }

    result = gSioSt->nextPendingWrite;

    gSioSt->nextPendingWrite += 1;
    gSioSt->nextPendingWrite &= (SIO_MAX_PENDING_SEND - 1);

    sUnk_1 = 0;

    return result;
}

int SioReceiveData(void * dst, u8 * outSenderId, bool (*verify)(void *))
{
    u8 i;
    u8 sender_id;

    struct SioData * dat = &gSioSt->pendingRecv[gSioSt->nextPendingRead].packet;

    if (dat->head.kind != SIO_MSG_DATA || dat->head.sender == gSioSt->selfId)
        return 0;

    if (dat->head.param != gSioSt->seq[dat->head.sender])
    {
        gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
        gSioMsgBuf.sender = (gSioSt->selfId << 4) | dat->head.sender;
        gSioMsgBuf.param = gSioSt->seq[dat->head.sender];

        SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

        dat->head.kind = 0;

        gSioSt->nextPendingRead += 1;
        gSioSt->nextPendingRead &= (SIO_MAX_PENDING_RECV - 1);

        // recursion!
        return SioReceiveData(dst, outSenderId, verify);
    }
    else
    {
        for (i = 0; i < dat->len; i++)
        {
            ((u8 *)dst)[i] = dat->bytes[i];
        }

        if (verify != NULL && !verify(dst))
        {
            gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
            gSioMsgBuf.sender = (gSioSt->selfId << 4) | dat->head.sender;
            gSioMsgBuf.param = gSioSt->seq[dat->head.sender];

            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

            dat->head.kind = 0;

            gSioSt->nextPendingRead += 1;
            gSioSt->nextPendingRead &= (SIO_MAX_PENDING_RECV - 1);

            // recursion!
            return SioReceiveData(dst, outSenderId, verify);
        }
        else
        {
            dat->head.kind = 0;

            sender_id = dat->head.sender;

            gSioSt->seq[dat->head.sender] += 1;

            gSioSt->nextPendingRead += 1;
            gSioSt->nextPendingRead &= (SIO_MAX_PENDING_RECV - 1);

            *outSenderId = sender_id;

            gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
            gSioMsgBuf.sender = (gSioSt->selfId << 4) | dat->head.sender;
            gSioMsgBuf.param = gSioSt->seq[dat->head.sender];

            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

            return dat->len;
        }
    }
}

void Sio_Halt(void)
{
    int i;

    u16 abc = 0x7FFF;

    gSioSt->unk_001 = 0;

    SioSend16(&abc, 1);

    sWriteCursor = sSendCursor;

    for (i = 0; i < 4; i++)
    {
        sRecvCursor[i] = sReadCursor[i];
    }
}

void Sio_SetSubState(int arg_0)
{
    gSioSt->unk_021 = arg_0;
}

void Sio_BeginSyncPhase(void)
{
    int i;

    u16 abc = 0x7FFF;

    gSioSt->unk_001 = 0;
    gSioSt->unk_1B7C = 0;

    SioSend16(&abc, 1);

    sWriteCursor = sSendCursor;

    for (i = 0; i < 4; i++)
    {
        sRecvCursor[i] = sReadCursor[i];
    }

    gSioSt->unk_1B7E = 0;
    gSioSt->unk_001 = 3;
}

void Sio_StartLinkSession(void)
{
    int i;

    u16 abc = 0x2586;

    gSioSt->unk_004 = 0;
    gSioSt->unk_001 = 0;
    gSioSt->unk_1B7C = 0x88;

    sWriteCursor = sSendCursor;

    for (i = 0; i < 4; i++)
    {
        sRecvCursor[i] = sReadCursor[i];
    }

    gSioSt->unk_001 = 1;
    gSioSt->unk_004 = 6;

    SioSend16(&abc, -1);
}

void Sio_StartLinkSessionFast(void)
{
    int i;

    u16 abc = 0x2586;

    gSioSt->unk_004 = 0;
    gSioSt->unk_001 = 0;
    gSioSt->unk_1B7C = 24;

    sWriteCursor = sSendCursor;

    for (i = 0; i < 4; i++)
    {
        sRecvCursor[i] = sReadCursor[i];
    }

    gSioSt->unk_001 = 1;
    gSioSt->unk_004 = 6;

    SioSend16(&abc, -1);
}

void SioClearOutgoingQueue(void)
{
    sWriteCursor = sSendCursor;
}

void SioBigSend_Init(struct SioBigSendProc * proc)
{
    int i;
    u8 data[4];

    gSioSt->selfSeq = gSioSt->unk_022 = gSioSt->unk_02E = 0;

    gSioSt->seq[0] = gSioSt->seq[1] = gSioSt->seq[2] = gSioSt->seq[3] = 0;

    Sio_ResetSession();

    data[0] = proc->unk_34;
    data[1] = proc->blockCount >> 8;
    data[2] = proc->blockCount & 0xFF;
    data[3] = proc->lastBlockLen;

    SioEmitData(data, sizeof(data));
    gSioSt->unk_02E = 1;
}

void SioBigSend_Loop(struct SioBigSendProc * proc)
{
    if (proc->func != NULL)
        proc->func(proc);

    if (gSioSt->unk_02E == 0)
    {
        if (proc->currentBlock != gSioSt->selfSeq - 1)
        {
            proc->data += SIO_MAX_DATA;
            proc->completionPercent = proc->currentBlock * 100 / proc->blockCount;
            proc->currentBlock++;
        }

        SioEmitData(proc->data, SIO_MAX_DATA);
        gSioSt->unk_02E = 1;

        gSioSt->unk_010 = 0;

        if (proc->currentBlock >= proc->blockCount)
            Proc_Break(proc);
    }
}

void SioBigReceive_Init(struct SioBigReceiveProc * proc)
{
    gSioSt->selfSeq = gSioSt->unk_022 = gSioSt->unk_02E = 0;

    gSioSt->seq[0] = gSioSt->seq[1] = gSioSt->seq[2] = gSioSt->seq[3] = 0;

    Sio_ResetSession();
}

void SioBigReceive_RecvHeader(struct SioBigReceiveProc * proc)
{
    u8 data[4];
    u8 id;

    u16 got = SioReceiveData(&data, &id, NULL);

    if (got != 0)
    {
        proc->unk_34 = data[0];
        proc->blockCount = (data[1] << 8) + (data[2] & 0xFF);
        proc->lastBlockLen = data[3];

        Proc_Break(proc);
    }
}

void SioBigReceive_Loop(struct SioBigReceiveProc * proc)
{
    int i;
    u8 id;

    u8 * buf = gGenericBuffer;

    if (proc->currentBlock < proc->blockCount - 1)
    {
        u16 got = SioReceiveData(proc->data, &id, NULL);

        if (got != 0)
        {
            proc->data += SIO_MAX_DATA;
            proc->completionPercent = proc->currentBlock * 100 / proc->blockCount;
            proc->currentBlock++;
        }
    }
    else
    {
        u16 got = SioReceiveData(buf, &id, NULL);

        if (got != 0)
        {
            for (i = 0; i < proc->lastBlockLen; i++)
            {
                *((u8 *)proc->data) = buf[i];
                proc->data++;
            }

            proc->completionPercent = proc->currentBlock * 100 / proc->blockCount;
            proc->currentBlock++;
        }
    }

    if (proc->func != NULL)
        proc->func(proc);

    if (proc->currentBlock >= proc->blockCount)
        Proc_Break(proc);
}

int StartSioBigSend(void * data, u32 len, void (*func)(struct SioBigSendProc *), u8 arg_3, ProcPtr parent)
{
    struct SioBigSendProc * proc;

    u8 lastBlockLen;
    u16 blockCount;

    if (len > SIO_MAX_DATA * UINT16_MAX)
        return -1;

    blockCount = len / SIO_MAX_DATA + 1;

    if (len % SIO_MAX_DATA != 0)
        blockCount++;

    lastBlockLen = len % SIO_MAX_DATA;

    proc = Proc_StartBlocking(gProcScr_SioBigSend, parent);

    proc->data = data;
    proc->unk_34 = arg_3;
    proc->func = func;
    proc->blockCount = blockCount;
    proc->lastBlockLen = lastBlockLen;
    proc->completionPercent = 0;
    proc->currentBlock = 0;
    proc->unk_3C = 0;

    return 0;
}

void StartSioBigReceive(void * data, void (*func)(struct SioBigReceiveProc *), ProcPtr parent)
{
    struct SioBigReceiveProc * proc;

    proc = Proc_StartBlocking(gProcScr_SioBigReceive, parent);

    proc->func = func;
    proc->data = data;
    proc->completionPercent = 0;
    proc->currentBlock = 0;
    proc->unk_3C = 0;
}

bool IsSioBigTransferActive(void)
{
    if (Proc_Find(gProcScr_SioBigSend) == NULL && Proc_Find(gProcScr_SioBigReceive) == NULL)
        return FALSE;

    return TRUE;
}
