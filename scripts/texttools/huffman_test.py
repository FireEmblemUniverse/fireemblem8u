#!/bin/python3

import sys, os
from graphviz import Digraph

import huffman, textdecoder

def test_huff_gen():
    all_data = textdecoder.decode_all_data()
    freq_table = GenerateFreqTable(all_data)
    huff_tree = huffman.BuildHuffmanTree(freq_table)

    huffman_table = huffman.BuildHuffmanTable()
    print("const unsigned int huffman_tree[] = {")
    for branch in huffman_table:
        print(f"    0x{branch:08X},")
    print("};")

def dump_data_freq():
    all_data = textdecoder.decode_all_data()
    freq_table = huffman.GenerateFreqTable(all_data)

    for i in range(0x10000):
        if freq_table[i] > 0:
            print(f"[0x{i:04X}] = {freq_table[i]}")

def test_vanilla_huffmantree():
    huffman_table = textdecoder.build_huffman_table()
    huff_tree = textdecoder.rebuild_huffman_tree(huffman_table)
    code_table = huffman.build_code_table(huff_tree)
    huffman.dump_code_table(code_table)

def test_reworked_huffmantree():
    # build huffman
    all_data = textdecoder.decode_all_data()
    freq_table = huffman.GenerateFreqTable(all_data)
    huff_tree = huffman.BuildHuffmanTree(freq_table)

    code_table = huffman.build_code_table(huff_tree)
    huffman.dump_code_table(code_table)

def _visualize_huffman_tree(node, graph=None, node_id=0):
    if graph is None:
        graph = Digraph(format='png')
        graph.attr('node', shape='circle')

    current_id = str(node_id)

    if node.left is not None:
        left_id = str(node_id * 2 + 1)
        graph.edge(current_id, left_id, label="0")
        _visualize_huffman_tree(node.left, graph, node_id * 2 + 1)

    if node.right is not None:
        right_id = str(node_id * 2 + 2)
        graph.edge(current_id, right_id, label="1")
        _visualize_huffman_tree(node.right, graph, node_id * 2 + 2)

    if node.left is None and node.right is None:
        graph.node(current_id, label=f"0x{node.data:04X}", shape='box')

    return graph

def test_visualize_reconstructed_huffman_tree():
    # build huffman
    all_data = textdecoder.decode_all_data()
    freq_table = huffman.GenerateFreqTable(all_data)
    huff_tree = huffman.BuildHuffmanTree(freq_table)

    # generate graph
    graph = _visualize_huffman_tree(huff_tree)
    graph.render('huffman_tree')

def test_visualize_vanilla_huffman_tree():
    huffman_table = textdecoder.build_huffman_table()
    huff_tree = textdecoder.rebuild_huffman_tree(huffman_table)

    # generate graph
    graph = _visualize_huffman_tree(huff_tree)
    graph.render('huffman_tree')

def dump_all_data():
    all_data = textdecoder.decode_all_data()
    print(all_data)

def dump_huffmanlist_leaves():
    all_data = textdecoder.decode_all_data()
    freq_table = huffman.GenerateFreqTable(all_data)
    lists = huffman.BuildHuffmanList_Leaves(freq_table)

    list_node = lists
    while True:
        head, list_node = huffman.HuffListPopHead(list_node)
        if list_node is None:
            break

        print(f"[0x{head.data:04X}] = {head.freq}")

def dump_vanilla_leave_order():
    with open(textdecoder.ROM, 'rb') as f:
        rom_data = f.read()

    off = textdecoder.HUFFMAN_TREE

    for i in range(textdecoder.ROOT_NODE + 1):
        node_data = int.from_bytes(rom_data[off + 0:off + 4], 'little')
        if textdecoder.is_leaf(node_data):
            print(f"leaf:0x{(node_data & 0xFFFF):04X}")

        off = off + 4

# test_compress_value()
dump_data_freq()
# test_vanilla_huffmantree()
# test_reworked_huffmantree()
# test_visualize_reconstructed_huffman_tree()
# test_visualize_vanilla_huffman_tree()
# dump_all_data()
# dump_huffmanlist_leaves()
# dump_vanilla_leave_order()
