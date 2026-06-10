#!/bin/bash

# Lấy % dùng của phân vùng gốc, bỏ dấu %
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

THRESHOLD=80

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "CẢNH BÁO: Đĩa đã dùng ${USAGE}%, vượt ngưỡng ${THRESHOLD}%!"
else
    echo "OK: Đĩa dùng ${USAGE}%, trong ngưỡng an toàn."
fi
