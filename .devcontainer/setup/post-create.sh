#!/bin/bash
set -e  # Stop on error
cat .devcontainer/setup/bashrc.override.sh >> ~/.bashrc
git config --global --add safe.directory /app
pre-commit install --install-hooks

# Install user-specific VS Code extensions
# This script is intended to be run in a development container environment.
# The extensions in the user-extensions.json will not be committed to the repository.
# This allows users to have their own set of extensions without affecting the shared configuration.
# This script is intended to be run in a development container environment.
chmod +x .devcontainer/setup/install-user-extensions.sh
.devcontainer/setup/install-user-extensions.sh
