.PHONY: clean deepclean install dev black isort mypy ruff toml-sort lint pre-commit test freeze version build upload docs docs-autobuild docs-mypy docs-coverage reports changelog docs-all

########################################################################################
# Variables
########################################################################################

# Only create virtual environment when not in CI and pipenv is available.
PIPRUN := $(if $(and $(shell [ "$$CI" != "true" ] && echo 1),$(shell command -v pipenv > /dev/null 2>&1 && echo 1)),pipenv run)

# Documentation target directory, will be adapted to specific folder for readthedocs.
PUBLIC_DIR := $(if $(shell [ "$$READTHEDOCS" = "True" ] && echo 1),$$READTHEDOCS_OUTPUT/html,public)

########################################################################################
# Development Environment Management
########################################################################################

# Remove common intermediate files.
clean:
	-rm -rf \
		${PUBLIC_DIR} \
		.copier-answers.yml \
		.coverage \
		.mypy_cache \
		.pytest_cache \
		.ruff_cache \
		Pipfile* \
		coverage.xml \
		dist
	find . -name '*.egg-info' -print0 | xargs -0 rm -rf
	find . -name '*.pyc' -print0 | xargs -0 rm -f
	find . -name '*.swp' -print0 | xargs -0 rm -f
	find . -name '.DS_Store' -print0 | xargs -0 rm -f
	find . -name '__pycache__' -print0 | xargs -0 rm -rf

# Remove pre-commit hook, virtual environment alongside itermediate files.
deepclean: clean
	if command -v pre-commit > /dev/null 2>&1; then pre-commit uninstall --hook-type pre-push; fi
	if command -v pipenv >/dev/null 2>&1 && pipenv --venv >/dev/null 2>&1; then pipenv --rm; fi

# Install the package in editable mode.
install:
	${PIPRUN} pip install -e . -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt

# Install the package in editable mode with specific optional dependencies.
dev-%:
	${PIPRUN} pip install -e .[$*] -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt

# Prepare the development environment.
# Install the pacakge in editable mode with all optional dependencies and pre-commit hoook.
dev:
	${PIPRUN} pip install -e .[docs,lint,package,test] -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt
	if [ "${CI}" != "true" ] && command -v pre-commit > /dev/null 2>&1; then pre-commit install --hook-type pre-push; fi

########################################################################################
# Lint and pre-commit
########################################################################################

# Check lint with black.
black:
	${PIPRUN} python -m black --check .

# Check lint with isort.
isort:
	${PIPRUN} python -m isort --check .

# Check lint with mypy.
mypy:
	${PIPRUN} python -m mypy .

# Check lint with ruff.
ruff:
	${PIPRUN} python -m ruff .

# Check lint with toml-sort.
toml-sort:
	${PIPRUN} toml-sort --check pyproject.toml

# Check lint with all linters.
lint: black isort mypy ruff toml-sort

# Run pre-commit with autofix against all files.
pre-commit:
	pre-commit run --all-files

########################################################################################
# Test
########################################################################################

# Run test with coverage report.
test:
	${PIPRUN} python -m coverage erase
	${PIPRUN} python -m coverage run -m pytest
	${PIPRUN} python -m coverage report
	${PIPRUN} python -m coverage xml

########################################################################################
# Package
########################################################################################

# Show currently installed dependecies excluding the package itself with versions
freeze:
	@${PIPRUN} pip freeze --exclude-editable

# Get the version of the package.
version:
	${PIPRUN} python -m setuptools_scm

# Build the package
build:
	${PIPRUN} python -m build

# Upload the package
upload:
	${PIPRUN} python -m twine upload dist/*

########################################################################################
# Documentation
########################################################################################

# Generate documentation.
docs:
	${PIPRUN} python -m sphinx.cmd.build docs ${PUBLIC_DIR}

# Generate documentation with auto build when changes happen.
docs-autobuild:
	${PIPRUN} python -m sphinx_autobuild docs ${PUBLIC_DIR} \
		--watch README.md \
		--watch src

# Generate mypy reports.
docs-mypy: docs
	${PIPRUN} python -m mypy src test --html-report ${PUBLIC_DIR}/reports/mypy

# Generate coverage reports and badge.
docs-coverage: docs
	${PIPRUN} python -m coverage erase
	${PIPRUN} python -m coverage run -m pytest
	${PIPRUN} python -m coverage html -d ${PUBLIC_DIR}/reports/coverage
	${PIPRUN} bash scripts/generate-coverage-badge.sh ${PUBLIC_DIR}/reports/coverage

# Generate all reports.
reports: docs-mypy docs-coverage

# Generate changelog from git commits.
changelog:
	${PIPRUN} git-changelog -ETrio docs/changelog.md -c conventional -s build,chore,ci,docs,feat,fix,perf,refactor,revert,style,test

# Generate all documentation with reports.
docs-all: changelog docs reports

########################################################################################
# End
########################################################################################
