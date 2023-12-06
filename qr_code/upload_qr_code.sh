#!/bin/bash
cd $USER_ZDOTDIR/Documents/git_code/bu6030.github.io/qr_code
file_path=WechatIMG274.jpeg
echo "Checking if file exists: $file_path"
# 判断文件是否存在
if [ -e "$file_path" ]; then
    echo "文件存在，继续执行脚本"
    # 在这里可以继续编写脚本的其他部分
else
    echo "文件不存在，退出脚本"
    git push origin main
    exit 1  # 退出脚本，可以使用不同的退出码
fi
echo 开始压缩文件
python3 change_qr_code.py
echo 删除WechatIMG274.jpeg
rm WechatIMG274.jpeg
echo 开始上传文件
git add WechatIMG274.jpeg
cd $USER_ZDOTDIR/Documents/git_code/bu6030.github.io/docs/images/
git add wechat-group-qr-code.png
git commit -m "修改群二维码"
git push origin main
