#!/bin/python3

class HuffNode:
    def __init__(self, data=None, freq=None, left=None, right=None):
        self.left = left
        self.right = right
        self.data = data
        if left is None and right is None:
            self.freq = freq
        else:
            self.freq = (left.freq if left else 0) + (right.freq if right else 0)

    def __eq__(self, other):
        if isinstance(other, HuffNode):
            return (self.data == other.data and
                    self.freq == other.freq and
                    self.left == other.left and
                    self.right == other.right)
        return False

    def is_leaf(self):
        return self.left is None and self.right is None

all_nodes = []

def HuffNodeCreateLeaf(data, freq):
    new_node = HuffNode(data=data, freq=freq)
    all_nodes.append(new_node)
    return new_node

def HuffNodeCreateNode(left, right):
    new_node = HuffNode(left=left, right=right)
    all_nodes.append(new_node)
    return new_node

def HuffNodeGetFreq(node):
    return node.freq

def HuffNodeFindIdx(node):
    return all_nodes.index(node)

def GenerateFreqTable(all_data):
    freq_table = [0] * 0x10000

    for value in all_data:
        freq_table[value] += 1

    return freq_table

class HuffList:
    def __init__(self, node=None, next_list=None):
        self.node = node
        self.next = next_list

    def check_head(self):
        return self.is_head


def HuffListAdd(list_node, node):
    new_node = HuffList(node)

    if list_node == None:
        new_node.next = list_node
        return new_node

    if list_node.node.freq > node.freq:
        new_node.next = list_node
        return new_node

    current = list_node
    while current.next is not None and current.next.node.freq <= node.freq:
        current = current.next

    new_node.next = current.next
    current.next = new_node
    return list_node

def HuffListPopHead(list_node):
    return list_node.node, list_node.next

def BuildHuffmanList_Leaves(freq_table):
    list_node = None
    for i in range(0x100):
        if freq_table[i] > 0:
            new_leaf = HuffNodeCreateLeaf(i, freq_table[i])
            list_node = HuffListAdd(list_node, new_leaf)

    for i in range(0x100):
        code = 0x0100 | i
        if freq_table[code] > 0:
            new_leaf = HuffNodeCreateLeaf(code, freq_table[code])
            list_node = HuffListAdd(list_node, new_leaf)

    for lo in range(0x100):
        for hi in range(2, 0x100):
            code = (hi << 8) | lo
            if freq_table[code] > 0:
                new_leaf = HuffNodeCreateLeaf(code, freq_table[code])
                list_node = HuffListAdd(list_node, new_leaf)

    return list_node

def BuildHuffmanTree(freq_table):
    list_node = BuildHuffmanList_Leaves(freq_table)
    while True:
        left, list_node = HuffListPopHead(list_node)

        if list_node is None:
            head = left
            break

        right, list_node = HuffListPopHead(list_node)
        list_node = HuffListAdd(list_node, HuffNodeCreateNode(left, right))

    return head

def BuildHuffmanTree_Ext(all_data):
    freq_table = GenerateFreqTable(all_data)
    return huffman.BuildHuffmanTree(freq_table)

def BuildHuffmanTable():
    result = [0] * len(all_nodes)
    for i, node in enumerate(all_nodes):
        if node.is_leaf():
            result[i] = 0xFFFF0000 | node.data
        else:
            result[i] = (HuffNodeFindIdx(node.right) << 16) | HuffNodeFindIdx(node.left)

    return result

class CompressedValue:
    def __init__(self, path, _len):
        self.path = path
        self._len = _len

cache = {}

def SearchValue(node, value, path=[]):
    if node is None:
        return None

    if node.is_leaf():
        if node.data == value:
            return path
        else:
            return None

    left_path = path.append(0)
    if SearchValue(node.left, value, left_path) is not None:
        return left_path

    right_path = path.append(1)
    if SearchValue(node.left, value, right_path) is not None:
        return right_path

    return None

def build_code_table(node, current_code="", code_table=None):
    if code_table is None:
        code_table = {}

    if node.is_leaf():
        code_table[node.data] = current_code
    else:
        if node.left is not None:
            build_code_table(node.left, current_code + "0", code_table)
        if node.right is not None:
            build_code_table(node.right, current_code + "1", code_table)

    return code_table

def CompressData(data, code_table):
    compressed_bits = 0
    bit_count = 0
    u8_array = []

    for value in data:
        if value in code_table:
            bits = code_table[value]
            for bit in bits:
                if int(bit) == 0:
                    compressed_bits = compressed_bits & ~(1 << bit_count)
                else:
                    compressed_bits = compressed_bits |  (1 << bit_count)

                bit_count += 1
                if bit_count == 8:
                    u8_array.append(compressed_bits)
                    compressed_bits = 0
                    bit_count = 0
        else:
            raise ValueError(f"Value {value} not found in Huffman code table")

    if bit_count > 0:
        u8_array.append(compressed_bits)

    return u8_array

# Some testing code
def dump_code_table(code_table):
    for i in range(0xFFFF):
        if i in code_table:
            print(f"[0x{i:04X}] = {code_table[i]}")
