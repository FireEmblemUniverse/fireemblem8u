// C program for Huffman Coding
#include <stdio.h>
#include <stdlib.h>

#include "textencode.h"

// A Min Heap: Collection of
// min-heap (or Huffman tree) nodes
struct MinHeap {

	// Current size of min heap
	unsigned size;

	// capacity of min heap
	unsigned capacity;

	// Array of minheap node pointers
	struct MinHeapNode** array;
};

int nodeNum = 0;

struct MinHeapNode* nodes[MAX_NODE_NUM] = {NULL};

// A utility function allocate a new
// min heap node with given character
// and frequency of the character
struct MinHeapNode* newNode(unsigned data, unsigned freq)
{
	struct MinHeapNode* temp = (struct MinHeapNode*)malloc(
		sizeof(struct MinHeapNode));

	temp->left = temp->right = NULL;
	temp->data = data;
	temp->freq = freq;

    nodes[nodeNum++] = temp;

	return temp;
}

int indexOfNode(struct MinHeapNode* node)
{
    for (int i = 0; i < nodeNum; i++)
        if (nodes[i] == node)
            return i;

    FATAL_ERROR("could not find node 0x%p\n", node);
}

// A utility function to create
// a min heap of given capacity
struct MinHeap* createMinHeap(unsigned capacity)

{

	struct MinHeap* minHeap
		= (struct MinHeap*)malloc(sizeof(struct MinHeap));

	// current size is 0
	minHeap->size = 0;

	minHeap->capacity = capacity;

	minHeap->array = (struct MinHeapNode**)malloc(
		minHeap->capacity * sizeof(struct MinHeapNode*));
	return minHeap;
}

// A utility function to
// swap two min heap nodes
void swapMinHeapNode(struct MinHeapNode** a,
					struct MinHeapNode** b)

{

	struct MinHeapNode* t = *a;
	*a = *b;
	*b = t;
}

// The standard minHeapify function.
void minHeapify(struct MinHeap* minHeap, int idx)

{

	int smallest = idx;
	int left = 2 * idx + 1;
	int right = 2 * idx + 2;

	if ((unsigned)left < minHeap->size
		&& minHeap->array[left]->freq
			< minHeap->array[smallest]->freq)
		smallest = left;

	if ((unsigned)right < minHeap->size
		&& minHeap->array[right]->freq
			< minHeap->array[smallest]->freq)
		smallest = right;

	if (smallest != idx) {
		swapMinHeapNode(&minHeap->array[smallest],
						&minHeap->array[idx]);
		minHeapify(minHeap, smallest);
	}
}

// A utility function to check
// if size of heap is 1 or not
int isSizeOne(struct MinHeap* minHeap)
{

	return (minHeap->size == 1);
}

// A standard function to extract
// minimum value node from heap
struct MinHeapNode* extractMin(struct MinHeap* minHeap)

{

	struct MinHeapNode* temp = minHeap->array[0];
	minHeap->array[0] = minHeap->array[minHeap->size - 1];

	--minHeap->size;
	minHeapify(minHeap, 0);

	return temp;
}

// A utility function to insert
// a new node to Min Heap
void insertMinHeap(struct MinHeap* minHeap,
				struct MinHeapNode* minHeapNode)

{

	++minHeap->size;
	int i = minHeap->size - 1;

	while (i
		&& minHeapNode->freq
				< minHeap->array[(i - 1) / 2]->freq) {

		minHeap->array[i] = minHeap->array[(i - 1) / 2];
		i = (i - 1) / 2;
	}

	minHeap->array[i] = minHeapNode;
}

// A standard function to build min heap
void buildMinHeap(struct MinHeap* minHeap)

{

	int n = minHeap->size - 1;
	int i;

	for (i = (n - 1) / 2; i >= 0; --i)
		minHeapify(minHeap, i);
}

// A utility function to print an array of size n
void printArr(int arr[], int n)
{
	int i;
	for (i = 0; i < n; ++i)
		printf("%d", arr[i]);

	printf("\n");
}

// Utility function to check if this node is leaf
int isLeaf(struct MinHeapNode* root)

{

	return !(root->left) && !(root->right);
}

// Creates a min heap of capacity
// equal to size and inserts all characters
// counted in min heap. Initially size of
// min heap is equal to capacity
struct MinHeap* createAndBuildMinHeap()

{
    int size = 0;

    for (unsigned value = 0; value < MAX_VALUE_NUM; ++value) {
        if (freq[value] > 0) {
            size++;
        }
    }

	struct MinHeap* minHeap = createMinHeap(size);

    size = 0;

	for (unsigned value = 0; value < MAX_VALUE_NUM; ++value) {
        if (freq[value] > 0) {
            minHeap->array[size] = newNode(value, freq[value]);
            size++;
        }
    }

	minHeap->size = size;
	buildMinHeap(minHeap);

	return minHeap;
}

// The main function that builds Huffman tree
struct MinHeapNode* buildHuffmanTree()

{
	struct MinHeapNode *left, *right, *top;

	// Step 1: Create a min heap of capacity
	// equal to size. Initially, there are
	// modes equal to size.
	struct MinHeap* minHeap
		= createAndBuildMinHeap();

	// Iterate while size of heap doesn't become 1
	while (!isSizeOne(minHeap)) {

		// Step 2: Extract the two minimum
		// freq items from min heap
		left = extractMin(minHeap);
		right = extractMin(minHeap);

		// Step 3: Create a new internal
		// node with frequency equal to the
		// sum of the two nodes frequencies.
		// Make the two extracted node as
		// left and right children of this new node.
		// Add this node to the min heap
		// 0 is a special value for internal nodes, not
		// used
		top = newNode(0, left->freq + right->freq);

		top->left = left;
		top->right = right;

		insertMinHeap(minHeap, top);
	}

	// Step 4: The remaining node is the
	// root node and the tree is complete.
	return extractMin(minHeap);
}

unsigned* buildHuffmanTable()
{
    unsigned* huffmanTable = malloc(sizeof(unsigned) * nodeNum);

    for (int i = 0; i < nodeNum; i++) {
        if (isLeaf(nodes[i])) {
            huffmanTable[i] = 0xffff0000 | nodes[i]->data;
        } else {
            huffmanTable[i] = (indexOfNode(nodes[i]->right) << 16) | indexOfNode(nodes[i]->left);
        }
    }

    return huffmanTable;
}

void printHuffmanTree(struct MinHeapNode *root, int depth)
{
    for (int i = 0; i < depth; i++)
        printf("  ");

    if (isLeaf(root)) {
        printf("(leaf) value = 0x%04X, freq = %d\n", root->data, root->freq);
        return;
    }

    printf("(node) freq = %d\n", root->freq);

    if(root->left) {
        printHuffmanTree(root->left, depth + 1);
    }

    if(root->right) {
        printHuffmanTree(root->right, depth + 1);
    }
}
