#!/bin/sh

# 1. Lấy PORT, mặc định là 8080 nếu không tồn tại
PORT=${PORT:-8080}

echo "Bật Dummy Web Server ở cổng $PORT để vượt qua Health-check..."
# Chạy một web server siêu nhẹ bằng Python ở chế độ nền ngầm (&)
python3 -m http.server $PORT &

# 2. Khởi động Bitping Node
echo "Bắt đầu chạy Bitping Node..."
exec /app/bitpingd