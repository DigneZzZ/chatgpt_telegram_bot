# ChatGPT Telegram Bot: **GPT-4. Fast. No daily limits. Special chat modes**

<div align="center">
<img src="https://raw.githubusercontent.com/karfly/chatgpt_telegram_bot/main/static/header.png" align="center" style="width: 100%" />
</div>

<br>


## Особенности:
- Мгновенные ответы с низкой задержкой (обычно занимает около 3-5 секунд)
- Отсутствие ограничений на запросы
- Потоковая передача сообщений (смотрите демонстрацию)
- Поддержка GPT-4
- Поддержка группового чата (/help_group_chat для получения инструкций)
- DALLE 2 (выберите режим 👩‍🎨 Художник для создания изображений)
- Распознавание голосовых сообщений
- Подсветка кода
- 15 специальных режимов чата: 👩🏼‍🎓 Помощник, 👩🏼‍💻 Помощник по коду, 👩‍🎨 Художник, 🧠 Психолог, 🚀 Илон Маск и другие. Вы также можете легко создать свои собственные режимы чата, отредактировав файл `config/chat_modes.yml`
- Поддержка [API ChatGPT](https://platform.openai.com/docs/guides/chat/introduction)
- Список разрешенных пользователей Telegram
- Отслеживание баланса $, потраченного на OpenAI API

<p align="center">
  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYmM2ZWVjY2M4NWQ3ZThkYmQ3MDhmMTEzZGUwOGFmOThlMDIzZGM4YiZjdD1n/unx907h7GSiLAugzVX/giphy.gif" />
</p>

---

## Команды бота:
- /retry – Повторить последний ответ бота
- /new – Начать новый диалог
- /mode – Выбрать режим чата
- /balance – Показать баланс
- /settings – Показать настройки
- /help – Показать справку

## EASY SETUP
### Just RUN:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/DigneZzZ/chatgpt_telegram_bot/main/setup.sh)
```
### Русификация отдельно:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/DigneZzZ/chatgpt_telegram_bot/main/russian.sh)
```
После русификации нужно пересобрать контейнер:
```bash
docker-compose --env-file config/config.env up --build -d
```
## Ручная установка
Процесс описан на странице:
https://openode.ru/topic/352-sozdaem-bota-chatgpt-v-telegram-podrobnaya-instruktsiya/

