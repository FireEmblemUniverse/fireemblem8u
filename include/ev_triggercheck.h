#ifndef GUARD_EV_TRIGGERCHECK_H
#define GUARD_EV_TRIGGERCHECK_H

enum
{
    TILE_COMMAND_NONE,

    TILE_COMMAND_10       = 0x10,
    TILE_COMMAND_11       = 0x11,

    TILE_COMMAND_DOOR     = 0x12,
    TILE_COMMAND_BRIDGE   = 0x13,
    TILE_COMMAND_CHEST    = 0x14,

    TILE_COMMAND_ARMORY   = 0x16,
    TILE_COMMAND_VENDOR   = 0x17,
    TILE_COMMAND_SECRET   = 0x18,
    TILE_COMMAND_SHOP_UNK = 0x19,

    TILE_COMMAND_20       = 0x20,
};

typedef uintptr_t EventListScr;

struct EventInfo {
    /* 00 */ EventListScr* listScript;
    /* 04 */ u32 script;
    /* 08 */ u32 flag;
    /* 0C */ u32 commandId;
    /* 10 */ u32 givenMoney;
    /* 14 */ u32 givenItem;
    /* 18 */ s8 xPos;
    /* 19 */ s8 yPos;
    /* 1A */ u8 pidA;
    /* 1B */ u8 pidB;
};

struct EventListCmdInfo {
    /* 00 */ int (*func)(struct EventInfo* buf);
    /* 04 */ int length;
};

struct SupportTalkEnt {
    /* 00 */ u16 unitA;
    /* 02 */ u16 unitB;

    /* 04 */ u16 msgSupports[3];

    /* 0A */ u16 _pad1;
    /* 0C */ u8 unk_0c_0 : 5;
    /* 0C */ u8 unk_0c_5 : 5;
    /* 0D */ u8 unk_0d_3 : 5;
};

struct BattleTalkEnt {
    /* 00 */ u8 pid;
    /* 01 */ u8 chapter;
    /* 04 */ u32 msg;
    /* 08 */ u32 flag;
};

struct BattleTalkExtEnt {
    /* 00 */ u16 pidA;
    /* 02 */ u16 pidB;
    /* 04 */ u16 chapter;
    /* 06 */ u16 flag;
    /* 08 */ u16 msg;
    /* 0C */ u32 unk_0c;
};

struct DefeatTalkEnt {
    /* 00 */ u16 pid;
    /* 02 */ u8 route;
    /* 03 */ u8 chapter;
    /* 04 */ u16 flag;
    /* 06 */ u16 msg;
    /* 08 */ u32 event;
};

struct ForceDeploymentEnt {
    /* 00 */ u16 pid;
    /* 01 */ u8 route;
    /* 02 */ u8 chapter;
};

// ??? CallEventsFromBuffer(???);
struct EventInfo* CheckForEvents(struct EventInfo* info);
// ??? CheckForNextEvents(???);
// ??? sub_8082F58(???);
// ??? sub_8082F84(???);
// ??? sub_8082FB8(???);
// ??? sub_8083018(???);
// ??? sub_8083044(???);
// ??? sub_8083094(???);
// ??? sub_80830AC(???);
// ??? sub_80830D4(???);
// ??? sub_80830FC(???);
// ??? sub_8083124(???);
// ??? sub_808314C(???);
s8 IsThereClosedChestAt(s8 x, s8 y);
// ??? sub_80831C8(???);
// ??? IsThereClosedDoorAt(???);
// ??? sub_808320C(???);
// ??? sub_8083234(???);
// ??? sub_8083250(???);
// ??? sub_808326C(???);
// ??? sub_8083280(???);
s8 sub_80832C4(void);
s8 sub_80832C8(void);
// ??? sub_80832CC(???);
s8 sub_80832D0(void);
s8 sub_80832D4(void);
s8 CheckEventId3(void);
void sub_80832E8(void);
// ??? GetCurrentChapterBallistaePtr(???);
// ??? GetCurrentChapterBallistae2Ptr(???);
void* GetChapterAllyUnitDataPointer(void);
// ??? sub_80833B0(???);
// ??? sub_8083400(???);
// ??? sub_8083424(???);
// ??? sub_8083468(???);
bool ShouldCallBattleQuote(u8 charA, u8 charB);
void CallBattleQuoteEventsIfAny(u8 charA, u8 charB);
// ??? sub_8083570(???);
bool EkrCheckSomeDeathMaybe(u8 pid);
void sub_80835DC(u8 pid);
// ??? sub_8083654(???);
void sub_808371C(u8, u8, int);
void sub_8083764(u8, u8, int);
// u16 sub_8083790(u8, u8, u8, int);
// ??? sub_80837B0(???);
// ??? sub_80837D8(???);
s8 sub_80837F8(void);
// ??? sub_8083830(???);
// ??? CheckAFEV(???);
// ??? CheckTURN(???);
// ??? CheckCHAR(???);
// ??? CheckCHARASM(???);
// ??? CheckLOCA(???);
// ??? CheckVILL(???);
// ??? CheckCHES(???);
// ??? CheckDOOR(???);
// ??? sub_8083A10(???);
// ??? CheckSHOP(???);
// ??? CheckAREA(???);
// ??? sub_8083B24(???);
// ??? sub_8083B28(???);
// ??? sub_8083B2C(???);
// ??? sub_8083B58(???);
// ??? sub_8083B98(???);
// ??? SetLocalEventId(???);
// ??? UnsetLocalEventId(???);
void ClearLocalEvents(void);
// ??? CheckLocalEventId(???);
// ??? SetGlobalEventId(???);
// ??? UnsetGlobalEventId(???);
void ResetPermanentFlags(void);
s8 sub_8083D34(int, void*);
s8 CheckGlobalEventId(int);
void SetEventId(int);
void UnsetEventId(int);
s8 CheckEventId(int);
u8 *GetPermanentFlagBits();
int GetPermanentFlagBitsSize();
u8 *GetChapterFlagBits();
int GetChapterFlagBitsSize();;
// ??? sub_8083DD8(???);
// ??? sub_8083E34(???);
// ??? TryCallSelectEvents_u1C(???);
s8 sub_8083EB8(void);
// ??? sub_8083F68(???);
void sub_8083FB0(u8, u8);
// ??? sub_8083FFC(???);
int GetAvailableLocaCommandAt(s8, s8);
void sub_80840C4(s8, s8); // RunLocationEvents
s8 CheckForWaitEvents(void);
void RunWaitEvents(void);
// ??? TryCallSelectEvents(???);
// ??? sub_80844B0(???);
// ??? sub_8084508(???);
// ??? sub_8084560(???);
// ??? sub_808457C(???);
// ??? sub_8084590(???);
void sub_80845A4(void);
void sub_80845B8(u32, u16);
// ??? sub_80845E4(???);
// ??? sub_8084628(???);
// ??? sub_8084634(???);
struct BattleTalkExtEnt* GetBattleQuoteEntry(u16, u16);
struct DefeatTalkEnt* sub_80846E4(u16);
struct SupportTalkEnt* sub_8084748(u16, u16);
int sub_808478C(u16, u16, u8);
struct SupportTalkEnt* GetSupportTalkList();
s8 IsCharacterForceDeployed_(u16 pid);
// ??? IsSethLArachelMyrrhInnes(???);

extern struct BattleTalkExtEnt gUnknown_089EC6BC[];
extern struct DefeatTalkEnt gUnknown_089ECD4C[];
extern struct SupportTalkEnt gSupportTalkList[];
extern struct ForceDeploymentEnt gUnknown_089ED64C[];
extern u8 gUnknown_089ED674[];

#endif // GUARD_EV_TRIGGERCHECK_H
