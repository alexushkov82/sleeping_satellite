#!/bin/bash

# Скрипт для сборки и деплоя Flutter Web приложения в Firebase
# Использование: ./scripts/deploy.sh или из корня проекта: ./scripts/deploy.sh

set -e  # Остановить выполнение при ошибке

# Переходим в корневую директорию проекта (где находится firebase.json)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
cd "$PROJECT_ROOT"

echo "🚀 Начинаю сборку Flutter Web приложения..."
fvm flutter build web

if [ $? -eq 0 ]; then
    echo "✅ Сборка завершена успешно!"
    echo ""
    echo "📤 Начинаю деплой в Firebase..."
    firebase deploy --only hosting:alex
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "🎉 Деплой завершен успешно!"
        echo "🌐 Сайт доступен по адресу: https://alexushkov82.web.app"
    else
        echo "❌ Ошибка при деплое в Firebase"
        exit 1
    fi
else
    echo "❌ Ошибка при сборке Flutter приложения"
    exit 1
fi

