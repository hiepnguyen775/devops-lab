#!/bin/bash
set -eu

# Đường dẫn tuyệt đối (để cron chạy được)
SOURCE_DIR="/root/devops-lab"
BACKUP_DIR="/root/backups"
LOG_FILE="/root/devops-lab/logs/backup.log"

# Tạo thư mục chứa backup nếu chưa có
mkdir -p "$BACKUP_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

# Timestamp cho tên file và cho log
TIMESTAMP=$(date '+%Y%m%d-%H%M%S')
LOG_TIME=$(date '+%Y-%m-%d %H:%M:%S')
BACKUP_FILE="$BACKUP_DIR/backup-$TIMESTAMP.tar.gz"

# Ghi log bắt đầu
echo "[$LOG_TIME] Bắt đầu backup $SOURCE_DIR" >> "$LOG_FILE"

# Nén thư mục
tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Ghi log kết thúc
echo "[$LOG_TIME] Hoàn tất: $BACKUP_FILE" >> "$LOG_FILE"
echo "Backup xong: $BACKUP_FILE"
