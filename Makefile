.PHONY: deploy deploy-default build

# Build project & Deploy to production (alexushkov82)
deploy:
	@./scripts/deploy.sh

# Build project & Deploy to default hosting (sleeping-satellite)
deploy-default:
	@./scripts/deploy-default.sh

# Build project
build:
	@./scripts/build.sh



