#!/bin/bash

file_path="/bot/bot.py"

# Проверяем, существует ли файл по указанному пути
if [ ! -f "$file_path" ]; then
    file_path="/chatgpt_telegram_bot/bot/bot.py"
fi

# Переводим текст на русский и выполняем замены в файле с помощью awk
awk -i inplace '
{
    gsub("HELP_MESSAGE = \"\"\"Commands:", "HELP_MESSAGE = \"\"\"Команды:");
    gsub("🎨 Generate images from text prompts in <b>👩‍🎨 Artist</b> /mode", "🎨 Создавайте изображения по текстовым подсказкам в режиме <b>👩‍🎨 Художник</b> /режим");
    gsub("👥 Add bot to <b>group chat</b>: /help_group_chat", "👥 Добавьте бота в <b>групповой чат</b>: /помощь_групповой_чат");
    gsub("🎤 You can send <b>Voice Messages</b> instead of text", "🎤 Вы можете отправлять <b>голосовые сообщения</b> вместо текста");
    gsub("text = \"⏳ Please <b>wait</b> for a reply to the previous message\\n\"", "text = \"⏳ Пожалуйста, <b>подождите</b>, пока не получите ответ на предыдущее сообщение\\n\"");
    gsub("text += \"Or you can /cancel it\"", "text += \"Или вы можете /отменить его\"");
    gsub("text = \"✍️ <i>Note:</i> Your current dialog is too long, so your <b>first message</b> was removed from the context.\\n Send /new command to start new dialog\"", "text = \"✍️ <i>Примечание:</i> Ваш текущий диалог слишком длинный, поэтому ваше <b>первое сообщение</b> было удалено из контекста.\\n Отправьте команду /new, чтобы начать новый диалог\"");
    gsub("text = f\"✍️ <i>Note:</i> Your current dialog is too long, so <b>{n_first_dialog_messages_removed} first messages</b> were removed from the context.\\n Send /new command to start new dialog\"", "text = f\"✍️ <i>Примечание:</i> Ваш текущий диалог слишком длинный, поэтому <b>{n_first_dialog_messages_removed} первых сообщений</b> были удалены из контекста.\\n Отправьте команду /new, чтобы начать новый диалог\"");
    gsub("if str(e).startswith(\"Your request was rejected as a result of our safety system\")", "if str(e).startswith(\"Ваш запрос был отклонен в результате работы нашей системы безопасности\")");
    gsub("await update.message.reply_text(\"Starting new dialog ✅\")", "await update.message.reply_text(\"Начало нового диалога ✅\")");
    gsub("await update.message.reply_text(\"<i>Nothing to cancel...</i>\", parse_mode=ParseMode.HTML)", "await update.message.reply_text(\"<i>Нет ничего для отмены...</i>\", parse_mode=ParseMode.HTML)");
    gsub("text = f\"Select <b>chat mode</b> ({len(config.chat_modes)} modes available):\"", "text = f\"Выберите <b>режим чата</b> ({len(config.chat_modes)} доступных режимов):\"");
    gsub("if str(e).startswith(\"Message is not modified\")", "if str(e).startswith(\"Сообщение не изменено\")");
    gsub("details_text = \"🏷 Details:\\n\"", "details_text = \"🏷 Детали:\\n\"");
    gsub("text = f\"You spent <b>{total_n_spent_dollars:.03f}\\$</b>\\n\"", "text = f\"Вы потратили <b>{total_n_spent_dollars:.03f}\\$</b>\\n\"");
    gsub("text += f\"You used <b>{total_n_used_tokens}</b> tokens\\n\\n\"", "text += f\"Вы использовали <b>{total_n_used_tokens}</b> токенов\\n\\n\"");
    gsub("text = \"🥲 Unfortunately, message <b>editing</b> is not supported\"", "text = \"🥲 К сожалению, <b>редактирование</b> сообщений не поддерживается\"");
    gsub("logger.error(msg=\"Exception while handling an update:\", exc_info=context.error)", "logger.error(msg=\"Ошибка при обработке обновления:\", exc_info=context.error)");
    gsub("await update.message.reply_text(\"✅ Canceled\", parse_mode=ParseMode.HTML)", "await update.message.reply_text(\"✅ Отменено\", parse_mode=ParseMode.HTML)");
    gsub("error_text = f\"Something went wrong during completion. Reason: {e}\"", "error_text = f\"Что-то пошло не так во время завершения. Причина: {e}\"");
    gsub("await update.message.reply_text(f\"Starting new dialog due to timeout (<b>{config.chat_modes[chat_mode][\"name\"]}</b> mode) ✅\", parse_mode=ParseMode.HTML)", "await update.message.reply_text(f\"Начало нового диалога из-за таймаута (<b>{config.chat_modes[chat_mode][\"name\"]}</b> режим) ✅\", parse_mode=ParseMode.HTML)");
    gsub("db.set_user_attribute(user_id, \"last_interaction\", datetime.now())", "db.set_user_attribute(user_id, \"last_interaction\", datetime.now())");
    print
}
' "$file_path"

# Выводим сообщение о завершении выполнения скрипта
echo "Завершено."
