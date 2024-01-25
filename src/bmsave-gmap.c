#include "global.h"

#include "worldmap.h"
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
                    r3 = pGMapData->nodes[i].state & 1;
                    break;

                case 1:
                    r3 = pGMapData->nodes[i].state & 2;
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
                        pGMapData->nodes[i].state |= 1;
                    } else {
                        pGMapData->nodes[i].state &= ~1;
                    }
                    break;

                case 1:
                    if (nodeFlags[idx] & bit) {
                        pGMapData->nodes[i].state |= 2;
                    } else {
                        pGMapData->nodes[i].state &= ~2;
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

    for (i = 0; i < pGMapData->openPaths.openPathsLength; i++) {
        int path = pGMapData->openPaths.openPaths[i];

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

    pGMapData->openPaths.openPathsLength = 0;

    for (i = 0; i < 0x20; i++) {
        int idx = i / 8;

        if ((pathFlags[idx] >> (i & 7)) & 1) {
            AddGmPath(pGMapData, &pGMapData->openPaths, i);
        }
    }

    return;
}

union Unk_80A6FBC {
    struct __attribute__((packed, aligned(2))) Unk_80A6FBC_pat1 {
        u8 unk0_0 : 1;
        u8 unk0_1 : 6;
        u8 unk0_7 : 1;
        u8 unk1;
    } pat1;
    u16 pat2;
};

//! FE8U = 0x080A6F50
void WriteWorldMapUnits(struct GMapData* pGMapData, u16* param_2) {
    int i;
    union Unk_80A6FBC unaff_r5;

    for (i = 0; i < 7; i++) {
        unaff_r5.pat1.unk0_0 = pGMapData->units[i].state & 1;
        unaff_r5.pat1.unk0_1 = pGMapData->units[i].location;
        unaff_r5.pat1.unk0_7 = (pGMapData->units[i].state >> 1) & 1;
        unaff_r5.pat1.unk1 = pGMapData->units[i].id;
        {
            union Unk_80A6FBC *ptr = &unaff_r5;
            param_2[i] = ptr->pat2;
        }
    }

    return;
}

//! FE8U = 0x080A6FBC
void ReadWorldMapUnits(struct GMapData* param_1, u16* param_2) {
    int i;

    for (i = 0; i < 7; i++) {
        union Unk_80A6FBC sp;
        union Unk_80A6FBC *ptr = &sp;

        ptr->pat2 = param_2[i];

        if (sp.pat1.unk0_0) {
            param_1->units[i].state |= 1;
        } else {
            param_1->units[i].state &= ~1;
        }

        param_1->units[i].location = sp.pat1.unk0_1;

        if (sp.pat1.unk0_7) {
            param_1->units[i].id = sp.pat1.unk1;
            param_1->units[i].state |= 2;
        } else {
            param_1->units[i].id = sp.pat1.unk1;
            param_1->units[i].state &= ~2;
        }
    }

    return;
}

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

    info.unk_1c_1 = pGMapData->state.bits.monster_merged;
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
        pGMapData->state.bits.monster_merged = 1;
    } else {
        pGMapData->state.bits.monster_merged = 0;
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
