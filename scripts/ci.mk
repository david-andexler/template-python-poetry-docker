# Description: Continuous integration helpers

ci: # CI checks
	@make lint
	@make typecheck
	@make test
	@make coverage

.PHONY: coverage
coverage: # Run tests with coverage
	pytest --cov=app --cov-report=term --cov-fail-under=80

lint: # lint checks
	pre-commit run --all-files

test: # runs tests
	pytest

typecheck: # runs typechecking
	mypy .
