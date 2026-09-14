/* Legacy Thumb-only zero-division hook: preserve all incoming machine state. */
#ifdef MATCHING_DIV0
__attribute__((matching_empty_thumb_return))
#endif
void runtime_div0(void) {}
