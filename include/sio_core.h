#ifndef GUARD_SIO_H
#define GUARD_SIO_H

#include "global.h"

#include "proc.h"

#define SIO_MAX_PACKET 0x80

#define SIO_MAX_PENDING_SEND 0x20
#define SIO_MAX_PENDING_RECV 0x10

enum
{
    SIO_MSG_84 = 0x84, // sound ?
    SIO_MSG_85,
    SIO_MSG_86,
    SIO_MSG_87,
    SIO_MSG_88,
    SIO_MSG_89,
    SIO_MSG_8A,
    SIO_MSG_8B,
    SIO_MSG_8C,
    SIO_MSG_8D,
    SIO_MSG_DATA_ACK,
    SIO_MSG_DATA,
};

struct SioBigSendProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C); // implicit
    /* 2C */ void (*func)(struct SioBigSendProc *);
    /* 30 */ void const * data;
    /* 34 */ u8 unk_34;
    /* 35 */ STRUCT_PAD(0x35, 0x36); // implicit
    /* 36 */ u16 blockCount;
    /* 38 */ u16 currentBlock;
    /* 3A */ u8 lastBlockLen;
    /* 3B */ u8 completionPercent;
    /* 3C */ u8 unk_3C;
};

struct SioBigReceiveProc
{
    // identical to SioBigSendProc, except data is non const pointer

    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C); // implicit
    /* 2C */ void (*func)(struct SioBigReceiveProc *);
    /* 30 */ void * data;
    /* 34 */ u8 unk_34;
    /* 35 */ STRUCT_PAD(0x35, 0x36); // implicit
    /* 36 */ u16 blockCount;
    /* 38 */ u16 currentBlock;
    /* 3A */ u8 lastBlockLen;
    /* 3B */ u8 completionPercent;
    /* 3C */ u8 unk_3C;
};

enum
{
    PLAYER_STATUS_0 = 0,
    PLAYER_STATUS_1 = 1,
    PLAYER_STATUS_2 = 2,
    PLAYER_STATUS_5 = 5,
};

struct SioMessage
{
    /* 00 */ u8 kind;
    /* 01 */ u8 sender;
    /* 02 */ u16 param;
};

struct SioData
{
    /* 00 */ struct SioMessage head;
    /* 04 */ u16 len;
    /* 06 */ u8 bytes[SIO_MAX_PACKET];
    /* 86 */ STRUCT_PAD(0x86, 0x88);
};

struct SioPending
{
    /* 00 */ u8 unk_00;
    /* 01 */ STRUCT_PAD(0x01, 0x04);
    /* 04 */ struct SioData packet;
    /* 8C */ // end
};

struct SioSt
{
    /* 0000 */ u8 unk_000;
    /* 0001 */ u8 unk_001;
    /* 0002 */ u16 lastSioCnt;
    /* 0004 */ u16 unk_004;
    /* 0006 */ s8 selfId;
    /* 0007 */ u8 unk_007;
    /* 0008 */ u8 recvFlags;
    /* 0009 */ u8 unk_009;
    /* 000A */ u8 unk_00A;
    /* 000B */ u8 playerStatus[4];
    /* 000F */ u8 unk_00F;
    /* 0010 */ u8 unk_010;
    /* 0011 */ u8 unk_011;
    /* 0012 */ u16 lastRecv[4];
    /* 001A */ u8 timeoutClock[4];
    /* 001E */ u8 unk_01E;
    /* 001F */ u8 unk_01F;
    /* 0020 */ u8 unk_020;
    /* 0021 */ u8 unk_021;
    /* 0022 */ u16 unk_022;
    /* 0024 */ u16 selfSeq;
    /* 0026 */ u16 seq[4];
    /* 002E */ u8 unk_02E;
    /* 002F */ STRUCT_PAD(0x02F, 0x030); // implicit
    /* 0030 */ u16 unk_030;
    /* 0032 */ u16 buf[SIO_MAX_PACKET];
    /* 0132 */ STRUCT_PAD(0x132, 0x134); // implicit
    /* 0134 */ struct SioPending pendingSend[SIO_MAX_PENDING_SEND];
    /* 0594 */ struct SioPending pendingRecv[SIO_MAX_PENDING_RECV];
    /* 1B74 */ u8 nextPendingSend;
    /* 1B75 */ u8 nextPendingWrite;
    /* 1B76 */ u8 nextPendingRead;
    /* 1B77 */ u8 nextPendingRecv;
    /* 1B78 */ u16 unk_1B78;
    /* 1B7A */ u16 unk_1B7A;
    /* 1B7C */ u16 unk_1B7C;
    /* 1B7E */ u16 unk_1B7E;
};

#define SIO_MAX_DATA (SIO_MAX_PACKET - offsetof(struct SioData, bytes))

int sub_80415B0(void);
int sub_80416D0(void);
void sub_80416E0(u16 arg_0, u16 sioCnt, u16 arg_2);
void sub_8041718(void);
void sub_8041898(void);
void sub_8041900(void);
void sub_804197C(void);
void sub_80419DC(void);
void sub_8041C1C(void);
void sub_8041D68(void);
void sub_8041D8C(int num);
void sub_8041DC4(void);
void sub_8042138(void);
int sub_804213C(void);
int sub_8042168(void);
bool sub_8042194(u8 playerId);
bool sub_80421BC(u8 playerId);
bool sub_80421E4(void);
int sub_8042238(void);
bool sub_804226C(void);
s16 SioSend(const void * src, u16 len);
s16 sub_80423B0(s8 playerId, void * dst);
int SioSend16(u16 * word, int arg_1);
int sub_80425B4(int unused_0, u16 * arg_1);
void SioQueuePendingRecvData(struct SioData * data);
struct SioData * sub_8042694(u32 * out);
int SioEmitData(const u8 * src, u16 len);
int SioReceiveData(void * dst, u8 * outSenderId, bool (*verify)(void *));
void sub_804292C(void);
void sub_8042980(int arg_0);
void sub_8042990(void);
void sub_8042A04(void);
void sub_8042A7C(void);
void sub_8042AF4(void);
void sub_8042B08(struct SioBigSendProc * proc);
void sub_8042B68(struct SioBigSendProc * proc);
void sub_8042BD8(struct SioBigReceiveProc * proc);
void sub_8042C00(struct SioBigReceiveProc * proc);
void sub_8042C44(struct SioBigReceiveProc * proc);
int StartSioBigSend(void * data, u32 len, void (*func)(struct SioBigSendProc *), u8 arg_3, ProcPtr parent);
void StartSioBigReceive(void * data, void (*func)(struct SioBigReceiveProc *), ProcPtr parent);
bool IsSioBigTransferActive(void);

extern struct SioSt * SHOULD_BE_CONST gSioSt;

extern u16 EWRAM_DATA gSioOutgoing[0x200];
extern u16 EWRAM_DATA gSioIncoming[0x200][4];

extern u32 gUnknown_03004E70;
extern u32 gUnknown_03004E74;
extern u32 gSioStateId;
extern struct SioMessage gSioMsgBuf;
extern u8 gUnknown_03004F20[SIO_MAX_PACKET];

extern struct ProcCmd CONST_DATA gProcScr_SioBigSend[];
extern struct ProcCmd CONST_DATA gProcScr_SioBigReceive[];

// TODO: NOTE: the following is probably not part of sio_core but some other sio file

struct Unknown_0203DA24
{
    // TODO: this layout is very temporary, hopefully
    // +0x0C is TextHandles
    STRUCT_PAD(0x00, 0x9C);
    u8 unk_9C[5];
    u8 unk_A1[15][15];
};

extern struct Unknown_0203DA24 gUnknown_0203DA24;

#endif // GUARD_SIO_H
