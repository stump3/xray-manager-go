#!/usr/bin/env bash

set -euo pipefail

echo "🚀 Installing Xray Manager..."

# ─────────────────────────────────────────
# Проверка root
# ─────────────────────────────────────────
if [ "$EUID" -ne 0 ]; then
  echo "❌ Запусти скрипт с sudo"
  exit 1
fi

# ─────────────────────────────────────────
# Проверка Go
# ─────────────────────────────────────────
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

# ─────────────────────────────────────────
# Переход в директорию проекта
# ─────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# ─────────────────────────────────────────
# Сборка
# ─────────────────────────────────────────
echo "📦 Сборка xray-manager..."

go build -o xray-manager

# ─────────────────────────────────────────
# Установка бинарника
# ─────────────────────────────────────────
echo "🚀 Установка в /usr/local/bin..."

mv xray-manager /usr/local/bin/xray-manager
chmod +x /usr/local/bin/xray-manager

# ─────────────────────────────────────────
# Проверка
# ─────────────────────────────────────────
if command -v xray-manager >/dev/null 2>&1; then
  echo "✅ Установка успешна!"
else
  echo "❌ Ошибка установки"
  exit 1
fi

# ─────────────────────────────────────────
# Финал
# ─────────────────────────────────────────
echo ""
echo "🎉 Готово!"
echo "👉 Используй:"
echo "xray-manager --help"
echo ""
