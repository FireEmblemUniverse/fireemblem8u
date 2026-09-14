// ARMv4T's canonical NOP is the flag-preserving identity move r8 = r8.
register volatile unsigned eventIdentity asm("r8");
void EventIdentity(void)
{
    eventIdentity = eventIdentity;
}
