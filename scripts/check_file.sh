#!/bin/bash
read -p "Nhập tên file cần kiểm tra: " filename

if [ -f "$filename" ]; then
    echo "File '$filename' tồn tại."
else
    echo "File '$filename' KHÔNG tồn tại."
fi
