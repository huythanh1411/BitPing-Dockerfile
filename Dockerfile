# Sử dụng image Docker gốc theo tài liệu của Bitping
FROM bitping/bitpingd:latest

USER root

# Cài đặt Python3 để làm Dummy Server (script tự nhận diện base image là Alpine hay Ubuntu/Debian)
RUN if command -v apt-get >/dev/null; then \
        apt-get update && apt-get install -y python3; \
    elif command -v apk >/dev/null; then \
        apk add --no-cache python3; \
    fi

# Copy script khởi động vào container và cấp quyền thực thi
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Ghi đè Entrypoint mặc định để chạy file script của chúng ta
ENTRYPOINT ["/start.sh"]