#!/usr/bin/env bash

set -euo pipefail

echo "🚀 Installing Xray Manager..."

# Проверка root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Запусти с sudo"
  exit 1
fi

# Временная директория
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

echo "📥 Downloading latest binary..."

curl -L https://github.com/stump3/xray-manager-go/releases/latest/download/xray-manager -o xray-manager

# Проверка скачивания
if [ ! -f xray-manager ]; then
  echo "❌ Failed to download binary"
  exit 1
fi

chmod +x xray-manager

echo "🚀 Installing..."

mv xray-manager /usr/local/bin/

# Очистка
cd /
rm -rf "$TMP_DIR"

# Проверка
if command -v xray-manager >/dev/null 2>&1; then
  echo "✅ Installation successful!"
else
  echo "❌ Installation failed"
  exit 1
fi

echo ""
echo "🎉 Done!"
echo "👉 xray-manager --help"
