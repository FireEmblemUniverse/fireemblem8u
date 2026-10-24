import os
import re
import yaml

def extract_files():
    for root, dirs, files in os.walk("graphics"):
        for file in files:
            if ".png" not in file and ".json" not in file and ".pal" not in file and ".tsa" not in file and ".bin" not in file and ".tmap" not in file and ".mar" not in file and ".mk":
                os.remove(os.path.join(root, file))

    with open("baserom.gba", "rb") as f:
        rom_data = f.read()

    with open("graphic_extract.yml", "r") as stream:
        yaml_data = yaml.safe_load(stream)

    yaml_files = yaml_data["files"]

    for file in yaml_files:
        adress = int(file["adress"], 16) - 0x08000000
        file_content = rom_data[adress:adress + file["size"]]
        output_path = os.path.join(file["location"], file["file_name"] + "." + file["type"])
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
        with open(output_path, "wb") as extracted:
            extracted.write(file_content)

    for root, dirs, files_to_decompress in os.walk("../graphics"):
        for file in files_to_decompress:
            if file.endswith(".lz"):
                file_path = os.path.join(root, file)
                decompressed_file_path = file_path[:-3]
                subprocess.run(["tools/gbagfx/gbagfx", file_path,decompressed_file_path], check=True)


if __name__ == "__main__":
    extract_files()