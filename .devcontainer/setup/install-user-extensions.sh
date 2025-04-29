#!/bin/bash

# user-extensions.json allows a user to customize their VS Code environment
# by specifying a list of extensions to be installed.
# This script reads the user-extensions.json file and installs the specified extensions.
# This script is intended to be run in a development container environment.
# The extensions in the user-extensions.json will not be committed to the repository.
# This allows users to have their own set of extensions without affecting the shared configuration.

USER_EXTENSIONS_FILE=".devcontainer/user-extensions.json"

# Check if the file exists
if [ -f "$USER_EXTENSIONS_FILE" ]; then
    echo "Installing user-specific VS Code extensions..."
    # Read the extensions from the JSON file and install them
    jq -r '.extensions[]' "$USER_EXTENSIONS_FILE" | while read -r extension; do
        code --install-extension "$extension" || echo "Failed to install $extension"
    done
else
    echo "No user-specific extensions file found. Skipping."
fi
