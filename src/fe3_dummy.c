#include "global.h"
#include "fontgrp.h"

void PrintDebugBuildDateAndTime(u16 *bg)
{
    PrintDebugStringToBG(bg, gBuildDateTime);
    PrintDebugStringToBG(bg - 0x20, gYearProjectCreated); // subtract to print to the line above.
}
