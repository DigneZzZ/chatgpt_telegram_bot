#!/bin/bash

# Клонирование репозитория
git clone https://github.com/karfly/chatgpt_telegram_bot.git

# Проверка наличия установленного Git
if ! command -v git &> /dev/null
then
    echo "Git не установлен. Пожалуйста, установите его с помощью команды 'apt install git'."
    exit 1
fi

# Переход в директорию с клонированным репозиторием
cd chatgpt_telegram_bot

# Переименование файлов конфигурации
mv config/config.example.yml config/config.yml
mv config/config.example.env config/config.env

# Запрос API-токена Telegram
while true; do
    printf "Введите ваш API-токен Telegram: "
    read telegram_token

    if [[ -n "$telegram_token" ]]; then
        break
    else
        printf "API-токен Telegram не может быть пустым. Пожалуйста, повторите ввод.\n"
    fi
done

# Запрос ключа API OpenAI
while true; do
    printf "Введите ваш ключ API OpenAI: "
    read openai_api_key

    if [[ -n "$openai_api_key" ]]; then
        break
    else
        printf "Ключ API OpenAI не может быть пустым. Пожалуйста, повторите ввод.\n"
    fi
done

# Запрос разрешенных имен пользователей Telegram
printf "Введите список разрешенных имен пользователей Telegram через запятую (оставьте пустым для разрешения любого): "
read allowed_usernames

# Обновление файла config.yml с введенными значениями
sed -i "s/telegram_token: \"\"/telegram_token: \"$telegram_token\"/g" config/config.yml
sed -i "s/openai_api_key: \"\"/openai_api_key: \"$openai_api_key\"/g" config/config.yml
sed -i "s/allowed_telegram_usernames: \[\]/allowed_telegram_usernames: [$allowed_usernames]/g" config/config.yml

# Запрос тайм-аута нового диалога
printf "Введите время тайм-аута нового диалога в секундах (по умолчанию: 600): "
read new_dialog_timeout

# Обновление файла config.yml с новым тайм-аутом диалога
sed -i "s/new_dialog_timeout: 600/new_dialog_timeout: $new_dialog_timeout/g" config/config.yml

# Сборка и запуск бота с использованием Docker
docker-compose --env-file config/config.env up --build -d
