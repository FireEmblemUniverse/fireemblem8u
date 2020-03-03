//
// Created by laqieer on 2020/3/3.
//

#include "../include/bmdebug.h"

// if current seconds is even, return 2; else return 3
int Return2or3BySecondParity(void)
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

// if current seconds is even, return 3; else return 2
int Return3or2BySecondParity(void)
{
    int retVal;
    unsigned short hours;
    unsigned short minutes;
    unsigned short seconds;

    ComputeDisplayTime(GetGameClock(),&hours,&minutes,&seconds);
    if ((seconds & 1) != 0) {
        retVal = 2;
    }
    else {
        retVal = 3;
    }
    return retVal;
}

// return 8
int Get8(void)
{
    return 8;
}

// return 23
int Get23(void)
{
    return 23;
}

// do nothing, return directly
void DummyFunction(void)
{

}

void Loop6C_WaitForSelectPress(struct Proc *proc)
{
    if (gKeyStatusPtr->newKeys & SELECT_BUTTON) {
        Proc_ClearNativeCallback(proc);
    }
}

void SetNewKeyStatusWith16(void)
{
    NewKeyStatusSetter(16);
}


// do nothing, return directly
void DummyFunction2(void)
{

}

