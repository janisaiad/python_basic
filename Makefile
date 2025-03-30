# Makefile for Python project management using uv

# Variables
VENV_DIR = .venv
PYTHON = python3
REQUIREMENTS = requirements.txt

.PHONY: env venv clean test sync update help

help:
	@echo "Available commands:"
	@echo "  make env      - Create and activate virtual environment with dependencies"
	@echo "  make venv     - Create virtual environment only"
	@echo "  make sync     - Sync dependencies from requirements.txt"
	@echo "  make test     - Run tests"
	@echo "  make update   - Update all dependencies"
	@echo "  make clean    - Remove virtual environment and cache files"

env: venv sync
	@echo "$(GREEN)Virtual environment created and dependencies installed$(NC)"

venv:
	@echo "Creating virtual environment..."
	@uv venv $(VENV_DIR)
	@echo "$(GREEN)Virtual environment created at $(VENV_DIR)$(NC)"

sync:
	@echo "Installing dependencies..."
	@uv sync
	@echo "$(GREEN)Dependencies installed$(NC)"

test:
	@echo "Running tests..."
	@. $(VENV_DIR)/bin/activate && pytest tests/
	@echo "$(GREEN)Tests completed$(NC)"

update:
	@echo "Updating dependencies..."
	@uv pip install --upgrade -r $(REQUIREMENTS)
	@echo "$(GREEN)Dependencies updated$(NC)"

clean:
	@echo "Cleaning up..."
	@rm -rf $(VENV_DIR)
	@rm -rf .pytest_cache
	@rm -rf __pycache__
	@rm -rf .ruff_cache
	@echo "$(GREEN)Cleanup complete$(NC)"
