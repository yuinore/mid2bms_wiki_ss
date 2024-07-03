#!/bin/bash
set -eux

# https://antulik.com/2016-05-27-rails-as-a-static-site-generator.html

# リリース後に再更新したい場合は DNS 設定で旧サーバーに向ける。
SERVER_URL="http://wiki.mid2bms.net/"

rm -rf dist/
# wget -r -l inf -k -nc -nH -p -E -e robots=off -P ./dist $SERVER_URL
# wget -r -l inf -w 1 -k -nc -nH -p -E -e robots=off --reject-regex "(.*)\?(.*)" -P ./dist $SERVER_URL
wget -r -l inf -w 1 -k -nc -nH -p -E -e robots=off --accept-regex "^([^\?]+|.*cmd=list.*)$" -P ./dist $SERVER_URL

# # ページ上部へのリンクが FrontPage.html へのリンクになってしまうので対症療法
find dist/ -name '*.html' -exec sed -E -i 's!(\.\./)*FrontPage\.html!/!g' {} \;

# kill -15 $!

sleep 1s
echo Finished.
