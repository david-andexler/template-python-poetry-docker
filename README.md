# Template - Python, Poetry, Docker, Devcontainers

Template - Python, Poetry, Docker, Devcontainers

## Setup

### Install Docker

Install Docker from
- [Direct](<https://www.docker.com/products/docker-desktop/>)
- [Homebrew](https://formulae.brew.sh/cask/docker)
- [Chocolatey](https://community.chocolatey.org/packages/docker-desktop)

The following command should run successfully:

    $ docker --version
    Docker version 27.5.1, build 9f9e405

### Install VSCode (optional, recommended)
- Install [VSCode](https://code.visualstudio.com/download)
- Install the [Devcontainers VSCode extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) (ID:
`ms-vscode-remote.remote-containers`)

### Application Build
#### Application Build Option 1 (with VSCode/Devcontainers)
- Create a VSCode workspace for project
- `Cmd`+`Shift`+`P` (Mac) to open commands
- `Dev Containers: Open Workspace in Container`
- Utilizes docker-compose.local.yml and .devcontainer/devcontainer.json

#### Application Build Option 2 (without VSCode/Devcontainers)
Build and run the local application with

    docker compose -f docker-compose.local.yml up

### Documentation Build
Build and run the project's Sphinx documentation with

    docker compose -f docker-compose.docs.yml up

## Development

### Development Environment

#### Secrets

- Modify .envs/.local/.app or .envs/.local/.postgres for local development environments
- Modify .envs/.production/.app or .envs/.production/.postgres for production environments

### Linting

Uses ruff to check and fix linting issues.

    make lint

### Type Checking

Mypy for type checking.

    make typecheck

### Tests

    make test

#### Test Coverage

Runs tests on Python and HTML, generating an output HTML report.
    $ coverage run -m pytest
    $ coverage html
    $ open htmlcov/index.html

#### Testing Github Actions

We can use [`act`](https://github.com/nektos/act) to test Github Actions locally
