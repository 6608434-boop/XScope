# 📁 ПАПКА: utils/

## 📌 НАЗНАЧЕНИЕ
Набор переиспользуемых функций (утилит) для всего проекта. Разделено на категории для удобства поддержки.

## 📋 СТРУКТУРА
    📁 utils/
    │
    ├── 📄 __init__.py          # Главный сборщик всех утилит
    │
    ├── 📁 db/                  # Работа с базой данных
    │   ├── 📄 __init__.py
    │   ├── 📄 connection.py    # Подключение к БД
    │   └── 📄 cursor.py        # Курсоры и выполнение запросов
    │
    ├── 📁 decorators/          # Декораторы для маршрутов
    │   ├── 📄 __init__.py
    │   └── 📄 login_required.py # Проверка авторизации
    │
    ├── 📁 validators/          # Валидация данных
    │   ├── 📄 __init__.py
    │   └── 📄 chat_title.py    # Проверка названия чата
    │
    ├── 📁 formatters/          # Форматирование
    │   ├── 📄 __init__.py
    │   └── 📄 date.py          # Форматирование дат
    │
    └── 📁 security/            # Безопасность
        ├── 📄 __init__.py
        └── 📄 hash.py          # Хеширование паролей

## 🎯 КАК ИСПОЛЬЗОВАТЬ
### Импорт всего сразу:
from utils import get_db_connection, login_required, validate_chat_title
conn = get_db_connection()
@login_required
def profile(): pass
validate_chat_title("Мой чат")

### Импорт подмодулей:
from utils.db import execute_dict
from utils.decorators import admin_required
from utils.formatters import format_date_ru
from utils.security import hash_password

## 📦 МОДУЛИ
### 1. utils.db — База данных
get_db_connection() - Подключение к PostgreSQL
test_connection() - Проверка работоспособности
get_dict_cursor(conn) - Курсор со словарями
execute_dict(conn, query, params) - Запрос → список словарей
execute_insert(conn, table, data) - Упрощенная вставка

### 2. utils.decorators — Декораторы
@login_required - Проверка авторизации
@admin_required - Проверка прав админа
get_current_user_id() - ID текущего пользователя
request_wants_json() - Проверка типа ответа

### 3. utils.validators — Валидация
validate_chat_title(title) - Проверка названия (исключение)
is_chat_title_valid(title) - Проверка (True/False)
sanitize_chat_title(title) - Очистка названия
get_title_validation_error(title) - Текст ошибки

### 4. utils.formatters — Форматирование
format_datetime(dt) - "2026-02-14 15:30:45"
format_date_ru(dt) - "14 февраля 2026"
format_time_ago(dt) - "5 минут назад"
format_for_chat_list(dt) - Для списка чатов

### 5. utils.security — Безопасность
hash_password(password) - Хеш пароля
check_password(hash, password) - Проверка пароля
generate_api_key() - Генерация API ключа
hash_with_salt(password) - Хеш с солью

## 🔧 КАК ДОБАВИТЬ НОВУЮ УТИЛИТУ
1. Если новая категория — создай папку в utils/
2. Если новый файл — создай .py файл в нужной папке
3. Добавь функции с комментариями
4. Обнови __init__.py в папке (экспорт)
5. Обнови utils/__init__.py (главный экспорт)
6. Обнови этот README

## ✅ ПРИМЕРЫ
### Подключение к БД:
from utils import get_db_connection, execute_dict
conn = get_db_connection()
users = execute_dict(conn, "SELECT * FROM users")
conn.close()

### Защита маршрута:
from utils import login_required
@login_required
@bp.route('/profile')
def profile():
    return render_template('profile.html')

### Валидация и форматирование:
from utils import validate_chat_title, format_date_ru
try:
    validate_chat_title(user_input)
    chat_date = format_date_ru(created_at)
except ValueError as e:
    flash(str(e))

## 📦 ЗАВИСИМОСТИ
- psycopg2-binary — для работы с БД
- werkzeug — для хеширования паролей

## 👨‍💻 АВТОР
Oliver Vance — при изменении утилит уведомить команду!

## 📝 ИСТОРИЯ ИЗМЕНЕНИЙ
2026-02-14 - Oliver Vance - Создание документации