# Description: Sphinx docs helpers

.PHONY: docs
docs: # Build and serve docs
	docker compose -f docker-compose.docs.yml up --build
