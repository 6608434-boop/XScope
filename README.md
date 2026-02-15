# XScope — AI-аналитика для X/Twitter

## 📌 О проекте
Веб-приложение для работы с AI-экспертами, специализирующимися на Twitter/X Ads, арбитраже трафика, антидетекте и аналитике.

## 🚀 Быстрый старт

### 1. Клонировать
git clone https://github.com/your-username/xscope.git
cd xscope

### 2. Создать виртуальное окружение
python -m venv .venv
source .venv/bin/activate  # для Mac/Linux
# или
.venv\Scripts\activate  # для Windows

### 3. Установить зависимости
pip install -r requirements.txt

### 4. Настроить переменные окружения
cp .env.example .env
# Отредактируйте .env, добавьте свои ключи

### 5. Инициализировать базу данных
flask init-db
flask load-profiles

### 6. Запустить
python app.py

Откройте http://localhost:8080

    📁 xscope/                           # Корень проекта
    │
    ├── 📄 app.py                        # Точка входа в приложение
    ├── 📄 requirements.txt              # Зависимости Python
    ├── 📄 .env.example                   # Пример переменных окружения
    ├── 📄 .gitignore                     # Игнорируемые Git файлы
    ├── 📄 README.md                      # Главная документация
    │
    ├── 📁 config/                        # Настройки приложения
    │   ├── 📄 __init__.py                # Сборка всех конфигов
    │   ├── 📄 base.py                    # Базовые настройки Flask
    │   ├── 📄 database.py                 # Настройки БД
    │   ├── 📄 api_keys.py                 # Ключи API
    │   ├── 📄 security.py                 # Настройки безопасности
    │   ├── 📄 features.py                 # Флаги функций
    │   ├── 📁 environments/               # Окружения
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 development.py          # Для разработки
    │   │   ├── 📄 production.py           # Для продакшна
    │   │   └── 📄 testing.py              # Для тестов
    │   └── 📄 CONFIG.README.md            # Документация config
    │
    ├── 📁 core/                           # Ядро приложения
    │   ├── 📄 __init__.py                  # Главный инициализатор
    │   ├── 📁 factory/                     # Создание приложения
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 create_app.py            # Фабрика Flask
    │   ├── 📁 database/                    # Инициализация БД
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 create_tables.py         # Создание таблиц
    │   ├── 📁 profiles/                    # Загрузка профилей
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 loader.py                # Загрузчик промптов
    │   ├── 📁 hooks/                       # Хуки приложения
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 error_handlers.py        # Обработка ошибок
    │   ├── 📁 startup/                     # Проверки при старте
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 check_config.py          # Проверка конфига
    │   ├── 📁 cli/                         # CLI команды
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 init_db.py                # flask init-db
    │   │   └── 📄 load_profiles.py          # flask load-profiles
    │   └── 📄 CORE.README.md                # Документация core
    │
    ├── 📁 routes/                          # Маршруты
    │   ├── 📄 __init__.py                  # Регистрация маршрутов
    │   ├── 📁 main/                         # Главные страницы
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 index.py                  # GET /
    │   ├── 📁 auth/                         # Авторизация
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 login.py                   # GET/POST /auth/login
    │   │   ├── 📄 logout.py                  # GET /auth/logout
    │   │   ├── 📄 register.py                # POST /auth/register
    │   │   └── 📄 profile.py                 # GET /auth/profile
    │   ├── 📁 chat/                         # Управление чатами
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 list.py                    # GET /chat/list
    │   │   ├── 📄 new.py                     # POST /chat/new
    │   │   ├── 📄 rename.py                  # POST /chat/rename
    │   │   ├── 📄 delete.py                  # POST /chat/delete/<id>
    │   │   └── 📄 load.py                    # GET /chat/load/<id>
    │   ├── 📁 api/                          # JSON API
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 profiles.py                # GET /api/bot-profiles
    │   ├── 📁 analyze/                      # AI обработка
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 message.py                 # POST /analyze/message
    │   └── 📄 ROUTES.README.md               # Документация routes
    │
    ├── 📁 services/                        # Бизнес-логика
    │   ├── 📄 __init__.py                  # Главный сборщик
    │   ├── 📁 chat/                         # Сервисы чатов
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 get_list.py               # Получить список
    │   │   ├── 📄 create.py                 # Создать чат
    │   │   ├── 📄 rename.py                 # Переименовать
    │   │   ├── 📄 delete.py                 # Удалить
    │   │   ├── 📄 load.py                   # Загрузить
    │   │   └── 📄 validate_owner.py         # Проверить владельца
    │   ├── 📁 message/                       # Сервисы сообщений
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 send.py                    # Отправить сообщение
    │   │   └── 📄 get_history.py             # Получить историю
    │   ├── 📁 profile/                       # Сервисы профилей
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 get_all.py                 # Все профили
    │   │   └── 📄 get_by_id.py               # Профиль по ID
    │   ├── 📁 user/                          # Сервисы пользователей
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 authenticate.py            # Аутентификация
    │   │   └── 📄 register.py                # Регистрация
    │   ├── 📁 ai/                            # AI сервисы
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 call_deepseek.py           # Вызов DeepSeek
    │   │   └── 📄 build_prompt.py            # Сборка промпта
    │   └── 📄 SERVICES.README.md              # Документация services
    │
    ├── 📁 models/                          # Модели данных
    │   ├── 📄 __init__.py                  # Экспорт моделей
    │   ├── 📄 base.py                       # Базовый класс
    │   ├── 📄 user.py                       # Пользователи
    │   ├── 📄 chat.py                       # Чаты
    │   ├── 📄 message.py                    # Сообщения
    │   ├── 📄 profile.py                    # Профили ботов
    │   ├── 📄 rule.py                       # Правила профилей
    │   └── 📄 MODELS.README.md               # Документация models
    │
    ├── 📁 utils/                           # Утилиты
    │   ├── 📄 __init__.py                  # Главный сборщик
    │   ├── 📁 db/                           # Работа с БД
    │   │   ├── 📄 __init__.py
    │   │   ├── 📄 connection.py             # Подключение
    │   │   └── 📄 cursor.py                 # Курсоры
    │   ├── 📁 decorators/                   # Декораторы
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 login_required.py         # Проверка авторизации
    │   ├── 📁 validators/                   # Валидация
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 chat_title.py             # Название чата
    │   ├── 📁 formatters/                   # Форматирование
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 date.py                   # Даты
    │   ├── 📁 security/                      # Безопасность
    │   │   ├── 📄 __init__.py
    │   │   └── 📄 hash.py                    # Хеширование
    │   └── 📄 UTILS.README.md                # Документация utils
    │
    ├── 📁 prompts/                          # Промпты ботов
    │   ├── 📄 __init__.py                   # Загрузчик
    │   ├── 📄 oliver.txt                     # Oliver Vance
    │   ├── 📄 isaac.txt                      # Isaac
    │   ├── 📄 arseniy.txt                    # Арсений
    │   ├── 📄 victor.txt                     # Victor
    │   ├── 📄 mark.txt                       # Марк
    │   ├── 📄 teo.txt                        # Тео
    │   ├── 📄 adam.txt                       # Адам
    │   ├── 📄 steve.txt                      # Стив
    │   ├── 📄 will.txt                       # Уилл Купер
    │   └── 📄 PROMPTS.README.md              # Документация prompts
    │
    ├── 📁 temp_tests/                      # Временные тесты
    │   ├── 📄 test_config.py
    │   ├── 📄 test_utils.py
    │   └── 📄 README.md
    │
    ├── 📁 scripts/                          # Вспомогательные скрипты
    │   ├── 📄 deploy.sh
    │   ├── 📄 backup.sh
    │   └── 📄 seed.py
    │
    └── 📁 .github/                          # GitHub интеграция
        ├── 📁 workflows/
        │   ├── 📄 tests.yml
        │   └── 📄 deploy.yml
        └── 📄 PULL_REQUEST_TEMPLATE.md

## 👥 Эксперты
𝕏 Oliver Vance — Twitter-стратег
🐍 Isaac — Python-инженер
Я Арсений — Яндекс.Директ
G Victor — Google Ads
❤️ Марк — психолог, наставник
📱 Тео — Telegram
💘 Адам — дейтинг-приложения
🍏 Стив — iOS
🤠 Уилл Купер — английский язык

## 📄 Лицензия
MIT