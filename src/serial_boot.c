// These ARM tail transfers preserve the bootstrap's incoming register state.
extern void SerialReset(void);
void __attribute__((noinline, section(".text.serial_init"))) FE6SIO_Init(void)
{
    SerialReset();
}
void __attribute__((section(".text.serial_entry"))) FE6SIO_Entry(void)
{
    FE6SIO_Init();
}
