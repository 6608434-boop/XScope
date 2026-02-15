#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
================================================================================
ФАЙЛ: app.py
НАЗНАЧЕНИЕ: Точка входа в приложение
АВТОР: Oliver Vance
ДАТА: 2026-02-15

ОПИСАНИЕ:
    Создаёт и запускает Flask приложение.

ИСПОЛЬЗОВАНИЕ:
    python app.py

ИСТОРИЯ ИЗМЕНЕНИЙ:
    2026-02-15 - Oliver - создание
================================================================================
"""

import os
import logging
from core import create_app, check_config
from core.startup import print_banner

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='[%(levelname)s] %(asctime)s - %(name)s - %(message)s'
)
logger = logging.getLogger(__name__)


def main():
    """Главная функция запуска приложения."""
    print_banner()

    try:
        check_config()
    except Exception as e:
        logger.error(f"❌ Критическая ошибка конфигурации: {e}")
        return

    app = create_app()

    port = int(os.environ.get('PORT', 8080))
    debug = os.environ.get('DEBUG', 'False').lower() == 'true'

    logger.info(f"🚀 Запуск сервера на порту {port}")
    app.run(host='0.0.0.0', port=port, debug=debug)


if __name__ == '__main__':
    main()