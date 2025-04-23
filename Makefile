ci: # CI checks
	@make lint
	@make typecheck
	@make test
	@make coverage

lint: # lint checks
	pre-commit run --all-files

test: # runs tests
	pytest

typecheck: # runs typechecking
	mypy .

push: # aliases git push and sets upstream if not set
	@git push --set-upstream origin $(shell git rev-parse --abbrev-ref HEAD)

.PHONY: docs
docs: # Build and serve docs
	docker compose -f docker-compose.docs.yml up --build

.PHONY: coverage
coverage: # Run tests with coverage
	pytest --cov=app --cov-report=term --cov-fail-under=80
