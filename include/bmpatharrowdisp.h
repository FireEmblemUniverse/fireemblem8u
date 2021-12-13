#ifndef GUARD_BM_PATH_ARROW_DISP_H
#define GUARD_BM_PATH_ARROW_DISP_H

// I think this may be a proc struct because of the way it's accessed - but I
// haven't yet found it going into the proc API so this could be wrong.
struct PathArrowProc
{
    PROC_HEADER;
    s8 u29;
    s8 u2a;
    s8 u2b;
    s8 pathLen;
    /* 0x2d */ s8 pathX[20];
    /* 0x41 */ s8 pathY[20];
    /* 0x55 */ s8 pathCosts[20];
};
struct Unknown_0859DBA0 {
    struct PathArrowProc *proc;
};
extern struct Unknown_0859DBA0 gUnknown_0859DBA0;

void sub_80329EC(s8 arg1);
void AddPointToPathArrowProc(s8 x, s8 y);

#endif // GUARD_BM_PATH_ARROW_DISP_H
