# 📁 ПАПКА: models/

## 📌 НАЗНАЧЕНИЕ
Модели данных для работы с базой данных. Каждая модель отвечает за свою таблицу.

## 📋 СТРУКТУРА

    📁 models/
    │
    ├── 📄 __init__.py           # Экспорт всех моделей
    ├── 📄 base.py               # Базовый класс для всех моделей
    ├── 📄 user.py               # Модель пользователя
    ├── 📄 chat.py               # Модель чата
    ├── 📄 message.py            # Модель сообщения
    ├── 📄 profile.py            # Модель профиля бота
    └── 📄 rule.py               # Модель правил профиля

## 🎯 КАК ИСПОЛЬЗОВАТЬ

### Импорт всех моделей:
from models import User, Chat, Message, BotProfile, ProfileRule

### Пример с User:
user_id = User.create('username', 'hash123')
user = User.get_by_username('username')
if User.verify_password('username', 'password'):
    print("Успешный вход")

### Пример с Chat:
chat_id = Chat.create(user_id=1, title="Мой чат")
chats = Chat.get_user_chats(1)
if Chat.is_owner(chat_id, user_id):
    print("Это ваш чат")

### Пример с Message:
Message.save(chat_id=1, role='user', content='Привет')
history = Message.get_chat_history(1)

### Пример с BotProfile:
profiles = BotProfile.get_all_enabled()
will = BotProfile.get_by_bot_id('will')

### Пример с ProfileRule:
ProfileRule.add(profile_id=1, rule_text="Будь вежлив", priority='❗')
rules_text = ProfileRule.format_for_prompt(1)

## 📦 ЗАВИСИМОСТИ
- utils.db — для работы с БД
- config.features — для фильтрации профилей

## 👨‍💻 АВТОР
Oliver Vance — при изменении моделей обновить БД!

## 📝 ИСТОРИЯ ИЗМЕНЕНИЙ
2026-02-14 - Oliver Vance - Создание документации