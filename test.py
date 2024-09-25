from PIL import Image
import sys, re

def reduce_palette(image_path, output_path):
    # 打开原始图像
    image = Image.open(image_path)

    # 确保图像是调色板模式
    if image.mode != 'P':
        raise ValueError("Image must be in 'P' mode (palette mode)")

    # 获取原始调色板
    palette = image.getpalette()

    # 只保留前 16 个颜色
    new_palette = palette[:16 * 3]  # 每个颜色有三个值（R, G, B）

    # 创建新的图像
    new_image = Image.new('P', image.size)

    # 将新调色板应用到新图像
    new_image.putpalette(new_palette)

    # 重新调色，确保使用新调色板
    new_image.putdata(image.getdata())

    # 保存新的图像
    new_image.save(output_path)

# 示例使用
reduce_palette(f'{sys.argv[1]}.png', f'{sys.argv[1]}.png')
