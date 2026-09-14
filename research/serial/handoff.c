// Research only: SVC remains instruction assembly; this is not C-owned production.
register const void *input asm("r0");
register void *output asm("r1");
register void (*entry)(void) asm("lr");
void __attribute__((noreturn)) handoff(void) {
 input=(const void *)0x020002b0;
 output=(void *)0x02010000;
 asm volatile("svc #0x110000" : "+r"(input), "+r"(output) : : "r2", "r3", "ip", "cc", "memory");
 entry=(void (*)(void))0x02010000;
 entry();
 __builtin_unreachable();
}
