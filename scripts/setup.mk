# Description: Setup environment variables

.PHONY: setup
setup: # Description: Setup environment variables
	@echo "Setting up the environment..."
	@make setup-envs
	@echo "Setup complete."

.PHONY: setup-envs
setup-envs: # Description: Setup environment variables
	@echo "Setting up environment variables..."
	@echo "Running setup-envs script..."
	@scripts/setup/setup-envs.sh
	@echo "Setup complete."
