# Deployment

This document describes how to build and deploy the Flutter Web application
to Firebase Hosting.

## Overview

The Firebase project contains two Hosting sites:

| Hosting Site ID    | Alias   | Purpose             | URL                                |
|--------------------|---------|---------------------|------------------------------------|
| sleeping-satellite | default | Technical / default | https://sleeping-satellite.web.app |
| alexushkov82       | alex    | Production          | https://alexushkov82.web.app       |

Notes:
- The Firebase project name is `sleeping-satellite`

## Requirements

- Flutter (managed via FVM)
- Firebase CLI

## Build

Build the Flutter Web application:
fvm flutter build web

The output will be generated in:
build/web

## Deploy

### Quick Deploy - Рекомендуемые способы

#### Вариант 1: Использование Makefile (самый простой)

Из корня проекта выполните:

**Production (alexushkov82):**
```bash
make deploy
```

**Default hosting (sleeping-satellite):**
```bash
make deploy-default
```

**Только сборка без деплоя:**
```bash
make build
```

#### Вариант 2: Настройка алиасов (для удобных команд)

Добавьте в ваш `~/.zshrc` (или `~/.bashrc`):

```bash
# Алиасы для деплоя проекта sleeping_satellite
alias deploy='cd ~/Desktop/projects/sleeping_satellite && ./scripts/deploy.sh'
alias deploy-default='cd ~/Desktop/projects/sleeping_satellite && ./scripts/deploy-default.sh'
```

После этого выполните:
```bash
source ~/.zshrc
```

Теперь вы можете использовать команды из любой директории:
```bash
deploy          # Деплой на production
deploy-default  # Деплой на default hosting
```

#### Вариант 3: Прямой вызов скриптов

**Production (alexushkov82):**
```bash
./scripts/deploy.sh
```

**Default hosting (sleeping-satellite):**
```bash
./scripts/deploy-default.sh
```

### Что делают скрипты

Эти скрипты автоматически выполняют:
1. `fvm flutter build web` - сборку приложения
2. `firebase deploy --only hosting:alex` или `firebase deploy --only hosting:default` - деплой

### Manual Deploy

Deploy the application to the production hosting site (alexushkov82):
```bash
firebase deploy --only hosting:alex
```

Result:
https://alexushkov82.web.app

Deploy the application to the default technical hosting site:
```bash
firebase deploy --only hosting:default
```

Result:
https://sleeping-satellite.web.app