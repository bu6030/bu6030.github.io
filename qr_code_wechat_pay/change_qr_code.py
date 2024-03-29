import os
from PIL import Image

# 定义文件夹路径
folder_path = "/Users/XuesongBu/Documents/git_code/bu6030.github.io/qr_code_wechat_pay/"

for filename in os.listdir(folder_path):
    # 检查文件是否以.jpg为扩展名
    if filename.endswith(".jpeg"):
        # 构建完整的文件路径
        file_path = os.path.join(folder_path, filename)

        # 使用Image.open打开图片文件
        image = Image.open(file_path)

        # 在这里可以对图片进行处理或进行其他操作
        # 例如，可以调用image.show()显示图片
        left = 0
        top = 0
        right = 800
        bottom = 900

        # 剪切图片
        cropped_image = image.crop((left, top, right, bottom))

        # 修改图片大小
        new_size = (350, 400)
        resized_image = cropped_image.resize(new_size)

        rgb_image = Image.new("RGB", resized_image.size)
        rgb_image.paste(resized_image, (0, 0))

        # 修改图片名称
        new_filename = "/Users/XuesongBu/Documents/git_code/bu6030.github.io/docs/images/wechat-pay-qr-code.png"

        resized_image.save(new_filename, "JPEG")

        # 关闭图片文件
        image.close()

