#!/bin/bash

# Đường dẫn tuyệt đối để cron chạy được
LOG_FILE="/root/devops-lab/logs/health.log"
mkdir -p "$(dirname "$LOG_FILE")"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Thu thập số liệu
LOAD=$(uptime | awk -F'load average:' '{print $2}' | xargs)
RAM=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
DISK=$(df -h / | awk 'NR==2 {print $5 " da dung (" $3 "/" $2 ")"}')
CORES=$(nproc)

# Ghi báo cáo
{
    echo "[$TIMESTAMP] === BAO CAO SUC KHOE ==="
    echo "  CPU load (1/5/15 phut): $LOAD  (so nhan: $CORES)"
    echo "  RAM da dung: $RAM"
    echo "  Disk /: $DISK"
    echo ""
} >> "$LOG_FILE"

# In ra màn hình luôn (khi chạy tay)
echo "Da ghi bao cao vao $LOG_FILE"
tail -n 5 "$LOG_FILE"