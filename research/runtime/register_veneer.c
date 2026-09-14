/* Incoming-register terminal handoff. The checked compiler contract removes
 * the ordinary call frame and preserves incoming SP, LR and all other state.
 * Compile separately for each VENEER_REGISTER and VENEER_NAME pair. */
register void (*destination)(void) __asm__(VENEER_REGISTER);
__attribute__((matching_register_veneer))
void VENEER_NAME(void)
{
    destination();
}
