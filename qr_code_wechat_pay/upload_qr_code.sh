echo 开始压缩文件
python3 change_qr_code.py
echo 开始上传文件
cd /Users/XuesongBu/Documents/git_code/bu6030.github.io/docs/images/
git add wechat-pay-qr-code.png
git commit -m "修改微信支付码"
git push origin main