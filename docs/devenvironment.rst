Development Environment
======================================================================

User-Specific VSCode Extensions
----------------------------------------------------------------------

User-specific VSCode extensions can be added to .devcontainer/user-extensions.json. These extensions will be installed to each environment without affecting the shared configuration.

For example, to add the vim keybindings extension, add the following to .devcontainer/user-extensions.json:
    ::

        {
            "extensions": [
                "vscodevim.vim"
            ]
        }
This will install the vim keybindings extension in the devcontainer environment, allowing you to use vim keybindings in VSCode. These are installed using the script in .devcontainer/setup/install-user-extensions.sh.