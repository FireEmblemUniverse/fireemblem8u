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
static __inline__ __attribute__((always_inline)) void Step(int c, int x, int y)
{
    register int connection asm("r0") = c;
    register int dx asm("r1");
    register int dy asm("r2");
    asm("" : "+r"(connection));
    dx = x;
    asm("" : "+r"(dx));
    dy = y;
    asm("" : "+r"(dy));
    MapFloodCoreStep(connection, dx, dy);
}
void MapFloodCore(void)
{
    register unsigned phase asm("r4") = 0;
    register struct State *state asm("r5") = &gMovMapFillState;
    register unsigned connection asm("r6");
    register struct Node *node asm("r6");
    register struct Node *pool asm("r0");
    asm("" : "+r"(phase), "+r"(state));
    for (;;) {
        phase ^= 1;
        asm("" : "+r"(phase));
        if (phase) {
            pool = gMovMapFillStPool1;
            asm("" : "+r"(pool));
            state->src = pool;
            pool = gMovMapFillStPool2;
            asm("" : "+r"(pool));
            state->dst = pool;
        } else {
            pool = gMovMapFillStPool2;
            asm("" : "+r"(pool));
            state->src = pool;
            pool = gMovMapFillStPool1;
            asm("" : "+r"(pool));
            state->dst = pool;
        }
        node = state->src;
        asm("" : "+r"(node));
        connection = node->connection;
        asm("" : "+r"(connection));
        if (connection == 4) return;
        for (;;) {
            node = state->src;
            asm("" : "+r"(node));
            connection = node->connection;
            asm("" : "+r"(connection));
            switch (connection) {
            case 5:
                Step(3, 0, -1);
                Step(2, 0, 1);
                Step(0, -1, 0);
                Step(1, 1, 0);
                break;
            case 3:
                Step(3, 0, -1);
                Step(0, -1, 0);
                Step(1, 1, 0);
                break;
            case 2:
                Step(2, 0, 1);
                Step(0, -1, 0);
                Step(1, 1, 0);
                break;
            case 0:
                Step(3, 0, -1);
                Step(2, 0, 1);
                Step(0, -1, 0);
                break;
            case 1:
                Step(3, 0, -1);
                Step(2, 0, 1);
                Step(1, 1, 0);
                break;
            case 4:
                goto next_frontier;
            default:
                __builtin_unreachable();
            }
            node = state->dst;
            asm("" : "+r"(node));
            {
                register unsigned end asm("r0") = 4;
                asm("" : "+r"(end));
                node->connection = end;
            }
            node = state->src;
            asm("" : "+r"(node));
            node++;
            asm("" : "+r"(node));
            state->src = node;
        }
next_frontier:;
    }
}
