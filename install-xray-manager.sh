#!/usr/bin/env bash

set -euo pipefail

echo "🚀 Installing Xray Manager..."

# ─────────────────────────────
# Проверка root
# ─────────────────────────────
if [ "$EUID" -ne 0 ]; then
  echo "❌ Запусти с sudo"
  exit 1
fi

# ─────────────────────────────
# Проверка Go
# ─────────────────────────────
install_go() {
  echo "⚙️ Установка Go..."
  apt update -y
  apt install -y golang-go
  echo "✅ Go установлен: $(go version)"
}

if command -v go >/dev/null 2>&1; then
  echo "✅ Go найден: $(go version)"
else
  echo "⚠️ Go не найден"
  install_go
fi

# ─────────────────────────────
# Создаём временную директорию
# ─────────────────────────────
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

echo "📥 Клонирование репозитория..."
git clone https://github.com/stump3/xray-manager-go.git

cd xray-manager-go

# ─────────────────────────────
# Сборка
# ─────────────────────────────
echo "📦 Сборка..."

go build -o xray-manager

# ─────────────────────────────
# Установка
# ─────────────────────────────
echo "🚀 Установка..."

mv xray-manager /usr/local/bin/
chmod +x /usr/local/bin/xray-manager

# ─────────────────────────────
# Очистка
# ─────────────────────────────
cd /
rm -rf "$TMP_DIR"

# ─────────────────────────────
# Проверка
# ─────────────────────────────
if command -v xray-manager >/dev/null 2>&1; then
  echo "✅ Установка успешна!"
else
  echo "❌ Ошибка установки"
  exit 1
fi

echo ""
echo "🎉 Готово!"
echo "👉 xray-manager --help"
