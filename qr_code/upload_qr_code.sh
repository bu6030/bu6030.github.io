echo 开始压缩文件
python3 change_qr_code.py
echo 开始上传文件
git add WechatIMG274.jpeg
cd $USER_ZDOTDIR/Documents/git_code/bu6030.github.io/docs/images/
git add wechat-group-qr-code.png
git commit -m "修改群二维码"
git push origin main