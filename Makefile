.PHONY: deploy deploy-default build

# Деплой на production (alexushkov82)
deploy:
	@./scripts/deploy.sh

# Деплой на default hosting (sleeping-satellite)
deploy-default:
	@./scripts/deploy-default.sh

# Только сборка без деплоя
build:
	@echo "🚀 Начинаю сборку Flutter Web приложения..."
	@fvm flutter build web
	@echo "✅ Сборка завершена успешно!"



