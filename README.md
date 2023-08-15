# Serious Scaffold Python

A development-focused Python project template with various integrations, configurations and modules.

[![CI Status](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/serious-scaffold/serious-scaffold-python/branch/main/graph/badge.svg?token=4JPKXI122N)](https://codecov.io/gh/serious-scaffold/serious-scaffold-python)
[![Documentation Status](https://readthedocs.org/projects/serious-scaffold-python/badge/)](https://serious-scaffold-python.readthedocs.io/)
[![GitHub](https://img.shields.io/github/license/serious-scaffold/serious-scaffold-python)](https://github.com/serious-scaffold/serious-scaffold-python/blob/main/LICENSE)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/serious-scaffold)](https://pypi.org/project/serious-scaffold/)
[![PyPI](https://img.shields.io/pypi/v/serious-scaffold)](https://pypi.org/project/serious-scaffold/)

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Imports: isort](https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336)](https://pycqa.github.io/isort/)
[![Checked with mypy](https://www.mypy-lang.org/static/mypy_badge.svg)](http://mypy-lang.org/)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![Pydantic v2](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/pydantic/pydantic/5697b1e4c4a9790ece607654e6c02a160620c7e1/docs/badge/v2.json)](https://pydantic.dev)
[![Serious Scaffold Python](https://img.shields.io/badge/serious%20scaffold-python-blue)](https://github.com/serious-scaffold/serious-scaffold-python)

[![Serious Scaffold Python](docs/_static/images/logo.svg)](https://github.com/serious-scaffold/serious-scaffold-python)

Setting up a project often involves more than just establishing a basic project structure. It involves tasks like integrating GitHub Actions or GitLab CI/CD, configuring linters, tests and documentation, as well as implementing settings, logging and other frequently used modules. [Serious Scaffold Python](https://github.com/serious-scaffold/serious-scaffold-python) streamlines this process. Powered by [`copier`](https://copier.readthedocs.io/), bootstrapping a new Python project can be done with a single command. By answering a few questions, the project will be fully configured and ready for development. Furthermore, the project can be updated alongside the advancement of the template.

If you find this helpful, please consider [sponsorship](https://github.com/sponsors/huxuan).

## :hammer_and_wrench: Features

- **Template Rendering**
  - Leverage [`copier`](https://copier.readthedocs.io/) for project initiation and  template updates.
- **Environment Management**
  - Leverage [`pipenv`](https://pipenv.pypa.io/) for [virtual environment](https://docs.python.org/3/glossary.html#term-virtual-environment) management in development and containers for CI/CD.
- **Dependency Management**
  - Categorize dependencies with [constraints](https://pip.pypa.io/en/stable/user_guide/#constraints-files) for different environments.
- **Code Quality**
  - Incorporate linters such as [`black`](https://github.com/psf/black), [`isort`](https://pycqa.github.io/isort/), [`mypy`](http://www.mypy-lang.org/), [`ruff`](https://github.com/charliermarsh/ruff), and [`toml-sort`](https://github.com/pappasam/toml-sort).
  - Integrate [`pre-commit`](https://pre-commit.com/) with [built-in hooks](https://github.com/pre-commit/pre-commit-hooks) and [local](https://pre-commit.com/#repository-local-hooks) linters for Git hooks automation.
- **Tests**
  - Leverage [`pytest`](https://pytest.org/) for tests, supplemented by [`coverage`](https://coverage.readthedocs.io) reports and thresholds.
- **Documentation**
  - Adopt [`sphinx`](https://www.sphinx-doc.org/) with the [`furo`](https://pradyunsg.me/furo) theme, incorporating [MyPy](https://mypy.readthedocs.io/en/stable/command_line.html?report-generation) and [Coverage](https://coverage.readthedocs.io/en/7.3.0/cmd.html#html-reporting-coverage-html) reports.
- **Continuous Integration**
  - Include pre-configured [GitHub Actions](https://docs.github.com/actions) and [GitLab CI/CD](https://docs.gitlab.com/ee/ci/) for lint, tests, documentation generation, and package deployment.
  - Offer a unified `Makefile` as the entry point for common actions.
  - Support integration with [Read the Docs](https://readthedocs.org/).
- **Common Modules**
  - Utilize [`typer`](https://typer.tiangolo.com/) for Command Line Interface development.
  - Utilize [`setuptools-scm`](https://github.com/pypa/setuptools_scm/) for versioning using git metadata.
  - Utilize [`pydantic-settings`](https://docs.pydantic.dev/latest/usage/pydantic_settings/) for settings management.
- **Miscellaneous**
  - Provide VSCode [settings](.vscode/settings.json) with recommended [extensions](.vscode/extensions.json).

## :wrench: Prerequisites

Certain system-level Python applications are needed and it is recommended to use [`pipx`](https://pypa.github.io/pipx/) to install and run them in isolated environments. Refer to pipx's installation instructions [here](https://pypa.github.io/pipx/installation/). Once `pipx` is set up, install the necessary tools using the following commands.

```bash
# Copier: Template rendering for projects.
pipx install copier

# Pipenv: Virtual environment and package manager for Python.
pipx install pipenv

# Pre-commit: Automates Git hooks for code quality checks.
pipx install pre-commit
```

## :rocket: Quickstart

1. Generate the project.

   ```bash
   copier copy gh:serious-scaffold/serious-scaffold-python /path/to/project
   ```

1. Navigate to the project directory and initialize a git repository.

   ```bash
   cd /path/to/project
   git init
   ```

1. Set up the development environment.

   ```bash
   make dev
   ```

1. Commit the initialized project.

   ```bash
   git add .
   git commit -m "Initialize from serious-scaffold-python."
   ```

1. That's it! Focus on the coding mostly within `src` folder now.

## :scroll: License

MIT, for more details, see the [LICENSE](LICENSE) file.
