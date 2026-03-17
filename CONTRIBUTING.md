# Contributing to ContribAI

Thank you for your interest in contributing to ContribAI! 🎉

## 🚀 Quick Start

```bash
# Clone & install
git clone https://github.com/tang-vu/ContribAI.git
cd ContribAI
python -m venv .venv
.venv\Scripts\Activate.ps1  # or source .venv/bin/activate on Unix
pip install -e ".[dev]"

# Verify
pytest tests/ -v
contribai --help
```

## 📋 Development Workflow

1. **Create a branch** from `main`:
   ```bash
   git checkout -b feat/your-feature
   ```

2. **Write code** following our standards:
   - Async-first for I/O operations
   - Type hints on all public APIs
   - Pydantic models for data structures
   - Google-style docstrings

3. **Write tests** in `tests/unit/` or `tests/integration/`

4. **Lint & format**:
   ```bash
   make lint    # or: ruff check contribai/ --fix && ruff format contribai/
   ```

5. **Run tests**:
   ```bash
   make test    # or: pytest tests/ -v
   ```

6. **Commit** with conventional messages:
   ```
   feat: add Django security analyzer
   fix: handle 403 rate limit gracefully
   docs: update configuration reference
   ```

7. **Push & create PR** using the PR template

## 🏗️ Project Structure

| Directory | Purpose |
|-----------|---------|
| `contribai/core/` | Config, models, exceptions |
| `contribai/llm/` | LLM providers (Gemini, OpenAI, Anthropic, Ollama) |
| `contribai/github/` | GitHub API client & discovery |
| `contribai/analysis/` | Code analysis engine |
| `contribai/generator/` | Contribution generator |
| `contribai/pr/` | PR lifecycle manager |
| `contribai/orchestrator/` | Pipeline & memory |
| `contribai/cli/` | CLI interface |
| `tests/` | Tests |
| `.agents/agents/` | Team agent definitions |
| `.agents/workflows/` | Development workflows |

## 🤝 Team Roles

See `.agents/agents/` for detailed role descriptions:
- **Tech Lead** – Architecture and design decisions
- **Backend Dev** – Feature implementation
- **Security Engineer** – Security analysis and review
- **QA Engineer** – Testing and quality gates
- **DevOps Engineer** – CI/CD and infrastructure
- **Technical Writer** – Documentation
- **Code Reviewer** – PR review process
- **Product Manager** – Roadmap and prioritization

## ✅ PR Requirements

- All CI checks pass (lint, tests, security)
- Tests for new/changed code
- Documentation updated (if user-facing)
- Follows conventional commits
- CHANGELOG.md updated (if applicable)
