#include "global.h"

#include "agb_sram.h"
#include "bmsave.h"

//! FE8U = 0x080A6DA0
void WriteWorldMapNodes(struct GMapData* pGMapData, u8* nodeFlags) {
    int i;
    int j;
    int count;

    for (i = 0; i < 8; i++) {
        nodeFlags[i] = 0;
    }

    count = 0;

    for (i = 0; i < 0x1d; i++) {
        for (j = 0; j < 2; j++) {
            s8 r3;

            switch (j) {
                case 0:
                    r3 = pGMapData->unk30[i].state & 1;
                    break;

                case 1:
                    r3 = pGMapData->unk30[i].state & 2;
                    break;
            }

            if (r3 != 0) {
                int idx = count / 8;
                int bit = count & 7;

                nodeFlags[idx] |= (1 << bit);
            }

            count++;
        }
    }
}

//! FE8U = 0x080A6E24
void ReadWorldMapNodes(struct GMapData* pGMapData, u8* nodeFlags) {
    int i;
    int j;

    int count = 0;

    for (i = 0; i < 0x1d; i++) {
        for (j = 0; j < 2; j++) {
            int idx = count / 8;
            u8 bit = 1 << (count & 7);

            switch (j) {
                case 0:
                    if (nodeFlags[idx] & bit) {
                        pGMapData->unk30[i].state |= 1;
                    } else {
                        pGMapData->unk30[i].state &= ~1;
                    }
                    break;

                case 1:
                    if (nodeFlags[idx] & bit) {
                        pGMapData->unk30[i].state |= 2;
                    } else {
                        pGMapData->unk30[i].state &= ~2;
                    }
                    break;
            }

            count++;
        }
    }

    return;
}

//! FE8U = 0x080A6EB0
void WriteWorldMapPaths(struct GMapData* pGMapData, u8* pathFlags) {
    int i;

    for (i = 0; i < 4; i++) {
        pathFlags[i] = 0;
    }

    for (i = 0; i < pGMapData->unk_c4; i++) {
        int path = pGMapData->unk_a4[i];

        int idx = path / 8;
        u8* addr = pathFlags + idx;

        int bit = path & 7;

        *addr |= 1 << bit;
    }

    return;
}

//! FE8U = 0x080A6F0C
void ReadWorldMapPaths(struct GMapData* pGMapData, u8* pathFlags) {
    int i;

    pGMapData->unk_c4 = 0;

    for (i = 0; i < 0x20; i++) {
        int idx = i / 8;

        if ((pathFlags[idx] >> (i & 7)) & 1) {
            SetupNewWMRoute(pGMapData, pGMapData->unk_a4, i);
        }
    }

    return;
}

/* https://decomp.me/scratch/2QiqH */

//! FE8U = 0x080A6F50
void WriteWorldMapUnits(struct GMapData* pGMapData, u16* param_2) {
    int i;
    u8 r8;
    u8 ip;

    r8 = 1;
#if !NONMATCHING
    asm("mov r2, #1");
#endif
    ip = 1;

    for (i = 0; i < 7; i++) {
        int r5;
#if NONMATCHING
        int a;
        int b;
        int c;
#else // if !NONMATCHING
        register int a asm("r3");
        register int b asm("r1");
        register int c asm("r2");
#endif // NONMATCHING
        int d;

        struct GMUnit* u = &pGMapData->unk10[i];

        a = (u->state & ip);
        a |= (r5 & 0xfffffffe);

#if NONMATCHING
        b = ((u->location & 0x3f) << 1);
        b |= (a & 0xffffff81);
#else // if !NONMATCHING
        asm(
            "ldrb r1, [r4, #1]\n\
            mov r0, #0x3f\n\
            and r1, r0\n\
            lsl r1, r1, #1\n\
            sub r0, #0xbe\n\
            and r0, r3\n\
            orr r1, r0\n\
            "
            : "=r" (b)
            : "r" (a));
#endif // NONMATCHING

        c = ((((u->state >> 1) & r8) & ip) << 7);
        c |= (b & 0xffffff7f);

        d = (((u8)u->id << 8));
        d |= (c & 0xffff00ff);

        r5 = d;
        param_2[i] = r5;
    }

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/wG1FK */

//! FE8U = 0x080A6FBC
void ReadWorldMapUnits(struct GMapData* param_1, u16* param_2) {
    int i;

    for (i = 0; i < 7; i++) {
        int a = param_2[i];
        u32 packed = (packed & 0xffff0000) | a;

        if (packed & 1) {
            param_1->unk10[i].state |= 1;
        } else {
            param_1->unk10[i].state &= ~1;
        }

        param_1->unk10[i].location = (packed << 0x19) >> 0x1a;

        if (packed & 0x80) {
            param_1->unk10[i].id = packed;
            param_1->unk10[i].state |= 2;
        } else {
            param_1->unk10[i].id = packed;
            param_1->unk10[i].state &= ~2;
        }
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void ReadWorldMapUnits(struct GMapData* param_1, u16* param_2) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        sub sp, #4\n\
        mov r4, sp\n\
        movs r7, #1\n\
        adds r3, r0, #0\n\
        adds r5, r1, #0\n\
        movs r6, #6\n\
    _080A6FCA:\n\
        ldrh r2, [r5]\n\
        ldr r1, _080A6FE8  @ 0xFFFF0000\n\
        ldr r0, [sp]\n\
        ands r0, r1\n\
        orrs r0, r2\n\
        str r0, [sp]\n\
        ldrb r1, [r4]\n\
        movs r0, #1\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080A6FEC\n\
        ldrb r0, [r3, #0x10]\n\
        orrs r0, r7\n\
        b _080A6FF2\n\
        .align 2, 0\n\
    _080A6FE8: .4byte 0xFFFF0000\n\
    _080A6FEC:\n\
        ldrb r1, [r3, #0x10]\n\
        movs r0, #0xfe\n\
        ands r0, r1\n\
    _080A6FF2:\n\
        strb r0, [r3, #0x10]\n\
        ldr r0, [sp]\n\
        lsls r0, r0, #0x19\n\
        lsrs r0, r0, #0x1a\n\
        movs r2, #0\n\
        strb r0, [r3, #0x11]\n\
        ldrb r1, [r4]\n\
        movs r0, #0x80\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080A7014\n\
        ldrb r0, [r4, #1]\n\
        strh r0, [r3, #0x12]\n\
        ldrb r0, [r3, #0x10]\n\
        movs r1, #2\n\
        orrs r0, r1\n\
        b _080A701E\n\
    _080A7014:\n\
        ldrb r0, [r4, #1]\n\
        strh r0, [r3, #0x12]\n\
        ldrb r1, [r3, #0x10]\n\
        movs r0, #0xfd\n\
        ands r0, r1\n\
    _080A701E:\n\
        strb r0, [r3, #0x10]\n\
        adds r3, #4\n\
        adds r5, #2\n\
        subs r6, #1\n\
        cmp r6, #0\n\
        bge _080A6FCA\n\
        add sp, #4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

//! FE8U = 0x080A7034
void WriteWorldMapSkirmishes(struct GMapData* pGMapData, u8* skirmishFlags) {
    int i;

    for (i = 0; i < 3; i++) {
        skirmishFlags[i] = pGMapData->unk_c9[i];
    }

    return;
}

//! FE8U = 0x080A7054
void ReadWorldMapSkirmishes(struct GMapData* pGMapData, u8* skirmishFlags) {
    int i;

    for (i = 0; i < 3; i++) {
        pGMapData->unk_c9[i] = skirmishFlags[i];
    }

    return;
}

//! FE8U = 0x080A7074
void ClearWorldMapStuff(void* ptr) {
    struct GMapSaveInfo info;

    CpuFill16(0, &info, sizeof(struct GMapSaveInfo));

    info.unk_1c_2 = 1;
    info.unk_1c_3 = 3;

    WriteAndVerifySramFast(&info, ptr, sizeof(struct GMapSaveInfo));

    return;
}

//! FE8U = 0x080A70B0
void WriteWorldMapStuff(void* sram_dest, void* src) {
    struct GMapData* pGMapData;
    struct GMapSaveInfo info;

    pGMapData = (struct GMapData*)src;

    WriteWorldMapNodes(pGMapData, info.nodes);
    WriteWorldMapPaths(pGMapData, info.paths);
    WriteWorldMapUnits(pGMapData, info.units);
    WriteWorldMapSkirmishes(pGMapData, info.skirmishes);

    info.skirmishState = pGMapData->unk_cc;
    info.xCursor = pGMapData->xCamera;
    info.yCursor = pGMapData->yCamera;

    info.unk_1c_1 = pGMapData->state.bits.state_1;
    info.unk_1c_2 = pGMapData->state.bits.state_2;
    info.unk_1c_3 = pGMapData->state.bits.state_4_5;

    WriteAndVerifySramFast(&info, sram_dest, sizeof(struct GMapSaveInfo));

    return;
}

//! FE8U = 0x080A7138
void ReadWorldMapStuff(const void* sram_src, void* dst) {
    struct GMapData* pGMapData;
    struct GMapSaveInfo info;

    pGMapData = (struct GMapData*) dst;
    ReadSramFast(sram_src, &info, sizeof(struct GMapSaveInfo));

    ReadWorldMapNodes(pGMapData, info.nodes);
    ReadWorldMapPaths(pGMapData, info.paths);
    ReadWorldMapUnits(pGMapData, info.units);
    ReadWorldMapSkirmishes(pGMapData, info.skirmishes);

    pGMapData->unk_cc = info.skirmishState;

    if (info.unk_1c_1) {
        pGMapData->state.bits.state_1 = 1;
    } else {
        pGMapData->state.bits.state_1 = 0;
    }

    if (info.unk_1c_2) {
        pGMapData->state.bits.state_2 = 1;
    } else {
        pGMapData->state.bits.state_2 = 0;
    }

    pGMapData->state.bits.state_4_5 = info.unk_1c_3;

    pGMapData->xCamera = info.xCursor;
    pGMapData->yCamera = info.yCursor;

    return;
}

//! FE8U = 0x080A71E4
void sub_80A71E4(void* rngState) {
    sub_80BD260(&gGMData, rngState);
    return;
}

//! FE8U = 0x080A71F8
void sub_80A71F8(void* rngState) {
    sub_80BD270(&gGMData, rngState);
    return;
}
