import tool, os
import gfxtools.tsa2 as tsa

graphics_dir = "../graphics/op_anim"
data_file = "../data/data_opanim_gfx.s"
paths = list(os.walk(graphics_dir))
paths = list(filter(lambda x : x.endswith(".bin"), paths[0][2]))
def convert_images():
    for p in paths:
        basePath = os.path.join(graphics_dir, p).replace(".bin", "")
        tool.save_image(basePath+".4bpp", basePath + ".png", 32, basePath + ".gbapal", basePath + ".bin")
        nomap = basePath +".png.nomap.png"
        if os.path.exists(nomap):
            os.remove(nomap)

def update_data():
    with open(data_file, "r") as f:
        text = f.read()

    for p in paths:
        p = os.path.join(graphics_dir, p.replace(".4bpp", "")).replace("../", "")
        text = text.replace(p+".bin.lz", p+".fetsa2.bin.lz")
        text = text.replace(p+".4bpp.lz", p+".feimg2.bin.lz")
    with open(data_file, "w") as f:
        f.write(text)
def insert_image_dimensions(p, width = 30, height = 20):
        width  -= 1
        height -= 1
        with open(p, "rb") as f:
            data = f.read()
        if data[0] == width: return
        data = bytearray([width, height]) + data
        with open(p, "wb") as f:
            f.write(data)
def reformat_battle_bg_tsa():
    for p in paths:
        p = os.path.join(graphics_dir, p.replace(".4bpp", ".bin"))

        with open(p, "rb") as f:
            data = f.read()
        if data[0] ==29: continue
        data = bytearray([29, 19]) + data
        with open(p, "wb") as f:
            f.write(data)

        read_tsa = tsa.read_file(p)
        read_tsa.tiles = read_tsa.order_chunks()
        with open(p, "wb") as f:
            f.write(read_tsa.to_bytes())
        p = 1

def check_tsas():
    for p in paths:
        bin_path = os.path.join(graphics_dir, p)

        if not os.path.exists(bin_path):continue
        print(bin_path)
        insert_image_dimensions(bin_path, 30)
        out = tsa.read_file(bin_path, with_dimensions=False)
        print(out.tiles[0].tile_id, out.tiles[1].tile_id)
        test = 1

op_anim_images = [
    ["OpAnimSaleh", "OpAnimSaleh2"],
    ["OpAnimJoshua", "OpAnimJoshua2"],
    ["OpAnimTethys", "OpAnimTethys2"],
    ["OpAnimMyrrh", "OpAnimMyrrh2"],
    ["OpAnimLArachel", "OpAnimLArachel2"],
    ["OpAnimSeth", "OpAnimSeth2"],
    #["OpAnimEphraimClose1", "OpAnimEphraimClose2"],
    #["OpAnimEirikaClose1", "OpAnimEirikaClose2"]
]

TEMP_TSA = "temp_tsa.bin"
TEMP_IMG  = "temp_image.4bpp"
WIDTH = 32
def convert_op_anim():
    for image in op_anim_images:
        image = [os.path.join(graphics_dir, p)for p in image]
        temp_tsa = bytearray()
        temp_image = bytearray()
        for i in image:
            with open(i+".bin", "rb") as f:
                temp_tsa = temp_tsa + f.read()
            with open(i+".4bpp", "rb") as f:
                temp_image = temp_image + f.read()
        height = len(temp_tsa)//2//WIDTH
        with open(TEMP_TSA, "wb+") as f:
            f.write(temp_tsa)
        with open(TEMP_IMG, "wb+") as f:
            f.write(temp_image)
        insert_image_dimensions(TEMP_TSA, WIDTH,height)
        read_tsa = tsa.read_file(TEMP_TSA)
        read_tsa.tiles = read_tsa.order_chunks()
        with open(TEMP_TSA, "wb") as f:
            f.write(read_tsa.to_bytes())
        pal = (image[0] + ".gbapal").replace("2","")
        tool.save_image(TEMP_IMG, image[0] + ".png", WIDTH, pal, TEMP_TSA)
def clear_no_maps():
    map_paths =list(os.walk(graphics_dir))[0][2]
    for m in map_paths:
        if m.endswith(".nomap.png"):
            os.remove(os.path.join(graphics_dir, m))
#check_tsas()
convert_op_anim()
#check_tsas()
#convert_images()
#update_data()
clear_no_maps()