#!/usr/bin/env python3
"""Verify generated text provenance, linked bytes and bounded Huffman streams."""
import hashlib,json,re,subprocess,sys,tempfile
from pathlib import Path
from audit_linked_code import read_contributions,read_mappings,partition
ROOT=Path(__file__).resolve().parents[1]
def digest(data):return hashlib.sha256(data).hexdigest()
def decode(data,tree,root):
 node=root;tokens=[]
 for bit in range(len(data)*8):
  value=tree[node];node=(value>>16)&65535 if (data[bit//8]>>(bit%8))&1 else value&65535
  if node>=len(tree):raise ValueError('invalid Huffman child')
  value=tree[node]
  if value>>16==65535:
   token=value&65535;tokens.append(token);node=root
   if token==0:
    if (bit+8)//8!=len(data):raise ValueError('unused compressed bytes after terminator')
    return tokens,bit+1
 raise ValueError('unterminated message')
def main():
 source=(ROOT/'src/msg_data.c').read_bytes();header=(ROOT/'include/constants/msg.h').read_bytes()
 with tempfile.TemporaryDirectory(prefix='message-audit-') as tmp:
  c,h=Path(tmp)/'messages.c',Path(tmp)/'messages.h'
  subprocess.run([sys.executable,'scripts/texttools/textprocess.py','texts/texts.txt','texts/textdefs.txt',str(c),str(h),'utf8'],cwd=ROOT,stdout=subprocess.DEVNULL,check=True)
  assert c.read_bytes()==source and h.read_bytes()==header,'generated text source changed'
 rom=(ROOT/'fireemblem8.gba').read_bytes();assert rom==(ROOT/'baserom.gba').read_bytes()
 elf=ROOT/'fireemblem8.elf';symtext=subprocess.check_output(['arm-none-eabi-readelf','-sW',str(elf)],text=True);symbols={}
 for line in symtext.splitlines():
  f=line.split()
  if len(f)>=8 and f[0].rstrip(':').isdigit():symbols[f[7]]=(int(f[1],16),int(f[2]))
 text=source.decode();arrays={}
 for name,body in re.findall(r'static const u8 (CompressedText_MSG_[0-9A-F]+)\[\] = \{([^}]+)\};',text):
  assert name not in arrays
  arrays[name]=bytes(int(x.strip(),16) for x in body.split(',') if x.strip())
 tree=[int(x.strip(),16) for x in re.search(r'const u32 gMsgHuffmanTable\[\] = \{([^}]+)\};',text,re.S)[1].split(',') if x.strip()]
 root=int(re.search(r'gMsgHuffmanTableRoot = gMsgHuffmanTable \+ (0x[0-9A-F]+);',text)[1],16);assert root==len(tree)-1
 items=dict(arrays);items['gMsgHuffmanTable']=b''.join(x.to_bytes(4,'little') for x in tree)
 items['gMsgHuffmanTableRoot']=(symbols['gMsgHuffmanTable'][0]+root*4).to_bytes(4,'little')
 names=[x.strip() for x in re.search(r'const u8 \* const gMsgTable\[\] = \{([^}]+)\};',text,re.S)[1].split(',') if x.strip()]
 assert len(names)==len(arrays) and set(names)==set(arrays)
 items['gMsgTable']=b''.join(symbols[name][0].to_bytes(4,'little') for name in names)
 intervals=[]
 for name,data in items.items():
  address,size=symbols[name];assert size==len(data) and rom[address-0x08000000:address-0x08000000+size]==data,name
  intervals.append((address,address+size,name))
 intervals.sort();maptext=(ROOT/'fireemblem8.map').read_text();sections=[x for x in read_contributions(maptext) if x['object']=='src/msg_data.o'];assert len(sections)==1
 section=sections[0];cursor=section['start'];padding=0
 for start,end,name in intervals:
  assert cursor<=start and end<=section['end'];gap=start-cursor
  assert gap<=3 and rom[cursor-0x08000000:start-0x08000000]==bytes(gap),'unexplained message gap'
  padding+=gap;cursor=end
 assert cursor==section['end']
 sys.path.insert(0,str(ROOT/'scripts/texttools'))
 import textprocess
 expected_messages=textprocess.process_file(str(ROOT/'texts/texts.txt'),textprocess.load_control_chars(str(ROOT/'texts/textdefs.txt')),'utf8')
 expected={f'CompressedText_MSG_{msg.idx:03X}':msg.data for msg in expected_messages}
 assert set(expected)==set(arrays)
 records=[];decoded=0
 for name in names:
  tokens,bits=decode(arrays[name],tree,root);assert tokens==expected[name],name;decoded+=len(tokens)
  records.append(dict(name=name,compressed_bytes=len(arrays[name]),decoded_tokens=len(tokens),consumed_bits=bits,decoded_sha256=digest(b''.join(x.to_bytes(2,'little') for x in tokens))))
 negatives=[]
 for name,data,bad_tree in [('trailing-byte',arrays[names[0]]+b'\0',tree),('truncated-stream',b'',tree),('invalid-child',b'\0',[0xffffffff]*(len(tree)-1)+[0xfffefffe])]:
  try:decode(data,bad_tree,root)
  except ValueError:negatives.append(name)
  else:raise AssertionError(name)
 regions=partition(sections,read_mappings(symtext));unmapped=sum(x['size'] for x in regions if x['kind']=='unmapped')
 report=dict(messages=len(arrays),compressed_message_bytes=sum(map(len,arrays.values())),huffman_nodes=len(tree),decoded_tokens=decoded,pointer_table_bytes=len(items['gMsgTable']),object_bytes=section['end']-section['start'],unmapped_input_bytes_explained=unmapped,internal_alignment_bytes=padding,source_sha256=digest(source),header_sha256=digest(header),elf_sha256=digest(elf.read_bytes()),map_sha256=digest((ROOT/'fireemblem8.map').read_bytes()),rejected_checks=negatives,messages_detail=records,scope='Generated text arrays, Huffman tree and pointer tables reproduce linked bytes; each stream terminates within its declared array without trailing whole bytes. Decoded tokens also match the text-source parser. Data provenance and decode completeness, not proof of execution reachability or an overall code denominator.')
 (ROOT/'docs/message-data-classification.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k!='messages_detail'},indent=2))
if __name__=='__main__':main()
