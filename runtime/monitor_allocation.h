/* Allocation-only half of the monitor compiler bridge. This marker is not an
 * executable implementation and must be consumed by build_syscall_member.py.
 * The pinned helper's operands and r0/r1/LR clobbers remain in place. */
#ifndef MATCHING_MONITOR_BRIDGE
#error "Monitor allocation marker requires the checked compiler bridge"
#endif
#define MONITOR_ALLOCATION_TEMPLATE "@ recovered_monitor %0 %1 %2"
