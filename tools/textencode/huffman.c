#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "textencode.h"

// ================
// = HUFFMAN NODE =
// ================

struct HuffNode
{
    struct HuffNode * left;
    struct HuffNode * right;
    union
    {
        struct
        {
            u32 data; // One of the input characters
            u32 freq; // Frequency of the character
        } leaf;
        struct
        {
            u32 freq;
        } node;
    };
};

struct HuffNode * g_nodes[MAX_NODE_NUM] = { NULL };
size_t g_node_count = 0;

static struct HuffNode * HuffNodeCreateLeaf(u32 data, u32 freq);
static struct HuffNode *
HuffNodeCreateNode(struct HuffNode * left, struct HuffNode * right);
static void HuffNodeDestroy(struct HuffNode * node);
static bool HuffNodeIsLeaf(struct HuffNode * node);
static u32 HuffNodeGetFreq(struct HuffNode * node);
static size_t HuffNodeFindIdx(struct HuffNode * node);

struct HuffNode * HuffNodeCreateLeaf(u32 data, u32 freq)
{
    struct HuffNode * result = calloc(1, sizeof(struct HuffNode));
    g_nodes[g_node_count++] = result;

    result->leaf.data = data;
    result->leaf.freq = freq;

    return result;
}

struct HuffNode *
HuffNodeCreateNode(struct HuffNode * left, struct HuffNode * right)
{
    struct HuffNode * result = calloc(1, sizeof(struct HuffNode));
    g_nodes[g_node_count++] = result;

    result->left = left;
    result->right = right;
    result->node.freq = HuffNodeGetFreq(left) + HuffNodeGetFreq(right);

    return result;
}

void HuffNodeDestroy(struct HuffNode * node)
{
    if (!HuffNodeIsLeaf(node))
    {
        HuffNodeDestroy(node->left);
        HuffNodeDestroy(node->right);
    }

    free(node);
}

bool HuffNodeIsLeaf(struct HuffNode * node)
{
    return node->left == NULL && node->right == NULL;
}

u32 HuffNodeGetFreq(struct HuffNode * node)
{
    return HuffNodeIsLeaf(node) ? node->leaf.freq : node->node.freq;
}

size_t HuffNodeFindIdx(struct HuffNode * node)
{
    for (size_t i = 0; i < g_node_count; i++)
        if (g_nodes[i] == node)
            return i;

    FATAL_ERROR("could not find node 0x%p\n", (void *)node);
}

// =====================
// = HUFFMAN NODE LIST =
// =====================
// this is used exclusively internally by the build func

struct HuffList
{
    struct HuffNode * node;
    struct HuffList * next;
};

static struct HuffList * HuffListCreate(void);
static void HuffListDestroy(struct HuffList * list);
static bool HuffListIsEmpty(struct HuffList * list);
static void HuffListAdd(struct HuffList ** p_self, struct HuffNode * node);
static struct HuffNode * HuffListPopHead(struct HuffList ** p_self);

struct HuffList * HuffListCreate(void) { return NULL; }

void HuffListDestroy(struct HuffList * list)
{
    if (list != NULL)
    {
        HuffListDestroy(list->next);
        free(list);
    }
}

bool HuffListIsEmpty(struct HuffList * list) { return list == NULL; }

void HuffListAdd(struct HuffList ** p_self, struct HuffNode * node)
{
    struct HuffList * self = *p_self;

    assert(p_self != NULL);

    if (self == NULL || HuffNodeGetFreq(node) < HuffNodeGetFreq(self->node))
    {
        struct HuffList * new_list = calloc(1, sizeof(struct HuffList));

        new_list->node = node;
        new_list->next = self;

        *p_self = new_list;

        return;
    }

    HuffListAdd(&self->next, node);
}

struct HuffNode * HuffListPopHead(struct HuffList ** p_self)
{
    struct HuffList * self = *p_self;
    struct HuffNode * result = self->node;

    assert(p_self != NULL);

    *p_self = self->next;
    free(self);

    return result;
}

// ================
// = HUFFMAN TREE =
// ================

HuffTree_t BuildHuffmanTree(u32 * freq_table)
{
    struct HuffList * list = HuffListCreate();

    // TODO: this better

    // single byte values
    for (size_t i = 0; i < 0x100; i++)
    {
        if (freq_table[i] > 0)
        {
            HuffListAdd(&list, HuffNodeCreateLeaf(i, freq_table[i]));
        }
    }

    // portrait codes
    for (size_t i = 0; i < 0x100; i++)
    {
        size_t code = 0x0100 | i;

        if (freq_table[code] > 0)
        {
            HuffListAdd(&list, HuffNodeCreateLeaf(code, freq_table[code]));
        }
    }

    // everything else (double byte values)
    for (size_t lo = 0; lo < 0x100; lo++)
    {
        for (size_t hi = 2; hi < 0x100; hi++)
        {
            size_t code = (hi << 8) | lo;

            if (freq_table[code] > 0) {
                HuffListAdd(&list, HuffNodeCreateLeaf(code, freq_table[code]));
            }
        }
    }

    assert(!HuffListIsEmpty(list));

    struct HuffNode * head;

    for (;;)
    {
        head = HuffListPopHead(&list);

        if (HuffListIsEmpty(list))
        {
            HuffListDestroy(list);
            break;
        }

        HuffListAdd(&list, HuffNodeCreateNode(head, HuffListPopHead(&list)));
    }

    return head;
}

void FreeHuffmanTree(HuffTree_t tree)
{
    HuffNodeDestroy((struct HuffNode *)tree);
}

u32 * BuildHuffmanTable(void)
{
    u32 * result = calloc(g_node_count, sizeof(u32));

    for (size_t i = 0; i < g_node_count; i++)
    {
        struct HuffNode * node = g_nodes[i];

        if (HuffNodeIsLeaf(node))
        {
            result[i] = 0xFFFF0000 | node->leaf.data;
        }
        else
        {
            result[i] = (HuffNodeFindIdx(node->right) << 16) |
                        HuffNodeFindIdx(node->left);
        }
    }

    return result;
}
