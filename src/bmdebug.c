//
// Created by laqieer on 2020/3/3.
//

#include "../include/bmdebug.h"

// if total frame is even, return 2; else return 3
int Return2or3ByFrameTotalParity(void)
{
    int retVal;
    unsigned short hours;
    unsigned short minutes;
    unsigned short seconds;

    ComputeDisplayTime(GetGameClock(),&hours,&minutes,&seconds);
    if ((seconds & 1) == 0) {
        retVal = 2;
    }
    else {
        retVal = 3;
    }
    return retVal;
}