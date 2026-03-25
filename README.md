# 🚀 Xray Manager (Go)

Современный CLI-инструмент для управления **Xray-core**: пользователи, протоколы, лимиты и ссылки.

> ⚡ Переписан с bash на Go — быстрее, надёжнее и удобнее.

---

## ✨ Возможности

* 👤 Управление пользователями (добавление, удаление, список)
* 🌐 Управление протоколами (VLESS, VMess, Trojan и др.)
* 🔗 Генерация ссылок подключения
* 📊 Учёт трафика и лимитов
* ⚡ Быстрый CLI (без bash и jq)
* 📦 Один бинарник — без зависимостей

---

## 🚧 Статус проекта

> ⚠️ В активной разработке

---

## 📦 Установка

### 🔹 Быстрая установка (рекомендуется)

```bash
git clone https://github.com/stump3/xray-manager-go.git
cd xray-manager-go

chmod +x install-xray-manager.sh
sudo ./install-xray-manager.sh
```

---

### ⚡ Альтернатива (в одну команду)

```bash
curl -fsSL https://raw.githubusercontent.com/stump3/xray-manager-go/main/install-xray-manager.sh | sudo bash
```

---

## 🔧 Что делает скрипт

Скрипт автоматически:

* 🔍 проверяет установлен ли Go
* ⚙️ устанавливает Go (если не установлен)
* 📦 собирает бинарник `xray-manager`
* 🚀 устанавливает его в `/usr/local/bin`
* 🔐 делает команду глобальной

---

## 🚀 Запуск

После установки:

```bash
xray-manager --help
```

---

## 🧪 Проверка

```bash
xray-manager user add
xray-manager protocol list
```

---

## ⚠️ Требования

* Ubuntu / Debian
* root-доступ (sudo)

---

## 🛠 Если что-то пошло не так

Проверь:

```bash
go version
which xray-manager
```

---

## 💡 Совет

После установки можно удалить исходники:

```bash
cd ~
rm -rf xray-manager-go
```


## 📦 Установка

### Сборка из исходников

```bash id="m7z1al"
git clone https://github.com/stump3/xray-manager-go.git
cd xray-manager-go

go build -o xray-manager
```

---

### Запуск

```bash id="x1y2qs"
./xray-manager --help
```

---

## ⚙️ Использование

### 👤 Пользователи

```bash id="9j2vsi"
xray-manager user add --email test --tag vless
xray-manager user list
```

---

### 🌐 Протоколы

```bash id="8h1y7b"
xray-manager protocol list
```

---

### 📊 Лимиты

```bash id="t4x3wr"
xray-manager limits check
```

---

### ⚙️ Система

```bash id="q2k8np"
xray-manager system status
```

---

## 🧠 Идея проекта

Этот инструмент создаётся как:

* 🔥 простой — минимум действий
* ⚡ быстрый — нативный бинарник
* 🧩 расширяемый — модульная архитектура
* 🛠 удобный для разработчиков

---

## 🤝 Участие в разработке

PR и идеи приветствуются!

1. Сделай fork
2. Создай ветку
3. Отправь Pull Request

---

## 📜 Лицензия

MIT

---

## ⭐ Зачем этот проект

Большинство менеджеров Xray:

* написаны на bash
* сложно поддерживаются
* плохо масштабируются

👉 Этот проект решает это с помощью Go и нормальной архитектуры.
