/* Standalone dispatcher reconstruction, not integrated. Queue connections are
 * 0=left, 1=right, 2=down, 3=up, 4=end, 5=initial expansion.
 * Callers provide valid connection bytes and sufficient queue capacity.
 */
typedef unsigned char u8;
struct Node { u8 x, y, connection, cost; };
struct State { struct Node *src, *dst; };
extern struct State gMovMapFillState;
extern struct Node gMovMapFillStPool1[], gMovMapFillStPool2[];
extern void MapFloodCoreStep(int connection, int dx, int dy);
void MapFloodCore(void)
{
    register unsigned phase asm("r4") = 0;
    register struct State *state asm("r5") = &gMovMapFillState;
    register unsigned connection asm("r6");
    asm("" : "+r"(phase), "+r"(state));
    for (;;) {
        phase ^= 1;
        asm("" : "+r"(phase));
        if (phase) {
            state->src = gMovMapFillStPool1;
            state->dst = gMovMapFillStPool2;
        } else {
            state->src = gMovMapFillStPool2;
            state->dst = gMovMapFillStPool1;
        }
        connection = state->src->connection;
        asm("" : "+r"(connection));
        if (connection == 4) return;
        for (;;) {
            connection = state->src->connection;
            asm("" : "+r"(connection));
            switch (connection) {
            case 5:
                MapFloodCoreStep(3, 0, -1);
                MapFloodCoreStep(2, 0, 1);
                MapFloodCoreStep(0, -1, 0);
                MapFloodCoreStep(1, 1, 0);
                break;
            case 3:
                MapFloodCoreStep(3, 0, -1);
                MapFloodCoreStep(0, -1, 0);
                MapFloodCoreStep(1, 1, 0);
                break;
            case 2:
                MapFloodCoreStep(2, 0, 1);
                MapFloodCoreStep(0, -1, 0);
                MapFloodCoreStep(1, 1, 0);
                break;
            case 0:
                MapFloodCoreStep(3, 0, -1);
                MapFloodCoreStep(2, 0, 1);
                MapFloodCoreStep(0, -1, 0);
                break;
            case 1:
                MapFloodCoreStep(3, 0, -1);
                MapFloodCoreStep(2, 0, 1);
                MapFloodCoreStep(1, 1, 0);
                break;
            case 4:
                goto next_frontier;
            default:
                __builtin_unreachable();
            }
            state->dst->connection = 4;
            state->src++;
        }
next_frontier:;
    }
}
