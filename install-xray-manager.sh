#!/usr/bin/env bash

set -e

echo "🚀 Installing Xray Manager..."

# Проверка root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Запусти с sudo"
  exit 1
fi

# Скачиваем бинарник
echo "📥 Downloading binary..."

curl -L https://github.com/stump3/xray-manager-go/releases/latest/download/xray-manager-linux-amd64 -o xray-manager

# Делаем исполняемым
chmod +x xray-manager

# Установка
mv xray-manager /usr/local/bin/

echo "✅ Installed!"
echo "👉 xray-manager --help"
