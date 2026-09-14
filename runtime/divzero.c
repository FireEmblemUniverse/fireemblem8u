// Private legacy Thumb return: __div0 returns and this path reports zero.
extern void __div0(void);
__attribute__((matching_divzero_return))
unsigned runtime_divzero(void)
{
    __div0();
    return 0;
}
