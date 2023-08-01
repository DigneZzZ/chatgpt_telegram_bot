 #!/bin/bash

file_path="bot/bot.py"

# Проверяем, существует ли файл по указанному пути
if [ ! -f "$file_path" ]; then
    file_path="chatgpt_telegram_bot/bot/bot.py"
fi
# Переводим текст на русский и выполняем замены в файле с помощью awk
sed -i '
s/HELP_MESSAGE = \"\"\"Commands:/HELP_MESSAGE = \"\"\"Команды:/g;
s/🎨 Generate images from text prompts in <b>👩‍🎨 Artist<\/b> \/mode/🎨 Создавайте изображения по текстовым подсказкам в режиме <b>👩‍🎨 Художник<\/b> \/режим/g;
s/👥 Add bot to <b>group chat<\/b>: \/help_group_chat/👥 Добавьте бота в <b>групповой чат<\/b>: \/помощь_групповой_чат/g;
s/🎤 You can send <b>Voice Messages<\/b> instead of text/🎤 Вы можете отправлять <b>голосовые сообщения<\/b> вместо текста/g;
s/text = \"⏳ Please <b>wait<\/b> for a reply to the previous message\\n\"/text = \"⏳ Пожалуйста, <b>подождите<\/b>, пока не получите ответ на предыдущее сообщение\\n\"/g;
s/text += \"Or you can \/cancel it\"/text += \"Или вы можете \/отменить его\"/g;
s/text = \"✍️ <i>Note:<\/i> Your current dialog is too long, so your <b>first message<\/b> was removed from the context.\\n Send \/new command to start new dialog\"/text = \"✍️ <i>Примечание:<\/i> Ваш текущий диалог слишком длинный, поэтому ваше <b>первое сообщение<\/b> было удалено из контекста.\\n Отправьте команду \/new, чтобы начать новый диалог\"/g;
s/text = f\"✍️ <i>Note:<\/i> Your current dialog is too long, so <b>{n_first_dialog_messages_removed} first messages<\/b> were removed from the context.\\n Send \/new command to start new dialog\"/text = f\"✍️ <i>Примечание:<\/i> Ваш текущий диалог слишком длинный, поэтому <b>{n_first_dialog_messages_removed} первых сообщений<\/b> были удалены из контекста.\\n Отправьте команду \/new, чтобы начать новый диалог\"/g;
s/if str(e).startswith(\"Your request was rejected as a result of our safety system\")/if str(e).startswith(\"Ваш запрос был отклонен в результате работы нашей системы безопасности\")/g;
s/await update.message.reply_text(\"Starting new dialog ✅\")/await update.message.reply_text(\"Начало нового диалога ✅\")/g;
s/await update.message.reply_text(\"<i>Nothing to cancel...<\/i>\", parse_mode=ParseMode.HTML)/await update.message.reply_text(\"<i>Нет ничего для отмены...<\/i>\", parse_mode=ParseMode.HTML)/g;
s/text = f\"Select <b>chat mode<\/b> ({len(config.chat_modes)} modes available):\"/text = f\"Выберите <b>режим чата<\/b> ({len(config.chat_modes)} доступных режимов):\"/g;
s/if str(e).startswith(\"Message is not modified\")/if str(e).startswith(\"Сообщение не изменено\")/g;
s/details_text = \"🏷 Details:\\n\"/details_text = \"🏷 Детали:\\n\"/g;
s/text = f\"You spent <b>{total_n_spent_dollars:.03f}\\$<\/b>\\n\"/text = f\"Вы потратили <b>{total_n_spent_dollars:.03f}\\$<\/b>\\n\"/g;
s/text += f\"You used <b>{total_n_used_tokens}<\/b> tokens\\n\\n\"/text += f\"Вы использовали <b>{total_n_used_tokens}<\/b> токенов\\n\\n\"/g;
s/text = \"🥲 Unfortunately, message <b>editing<\/b> is not supported\"/text = \"🥲 К сожалению, <b>редактирование<\/b> сообщений не поддерживается\"/g;
s/logger.error(msg=\"Exception while handling an update:\", exc_info=context.error)/logger.error(msg=\"Ошибка при обработке обновления:\", exc_info=context.error)/g;
s/await update.message.reply_text(\"✅ Canceled\", parse_mode=ParseMode.HTML)/await update.message.reply_text(\"✅ Отменено\", parse_mode=ParseMode.HTML)/g;
s/error_text = f\"Something went wrong during completion. Reason: {e}\"/error_text = f\"Что-то пошло не так во время завершения. Причина: {e}\"/g;
s/await update.message.reply_text(f\"Starting new dialog due to timeout (<b>{config.chat_modes[chat_mode][\"name\"]}<\/b> mode) ✅\", parse_mode=ParseMode.HTML)/await update.message.reply_text(f\"Начало нового диалога из-за таймаута (<b>{config.chat_modes[chat_mode][\"name\"]}<\/b> режим) ✅\", parse_mode=ParseMode.HTML)/g;
s/db.set_user_attribute(user_id, \"last_interaction\", datetime.now())/db.set_user_attribute(user_id, \"last_interaction\", datetime.now())/g;
' "$file_path"

# Выводим сообщение о завершении выполнения скрипта
echo "Завершено."
