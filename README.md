# ContribAI 🤖

> **AI Agent that automatically contributes to open source projects on GitHub**

ContribAI discovers open source repositories, analyzes them for improvement opportunities (security vulnerabilities, code quality issues, documentation gaps, UI/UX problems), generates high-quality fixes, and submits them as Pull Requests — all autonomously.

[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## ✨ Features

- 🔍 **Smart Discovery** – Finds contribution-friendly repos by language, stars, activity, and community health
- 🔒 **Security Analysis** – Detects hardcoded secrets, SQL injection, XSS, and more
- ✨ **Code Quality** – Finds dead code, missing error handling, complexity issues
- 📝 **Documentation** – Catches missing docstrings, incomplete READMEs, broken links
- 🎨 **UI/UX** – Identifies accessibility issues, missing loading states, responsive design gaps
- 🤖 **Multi-LLM** – Supports Gemini (primary), OpenAI, Anthropic, and local models via Ollama
- 📤 **Auto-PR** – Forks, branches, commits, and creates PRs with detailed descriptions
- 🧠 **Memory** – Tracks analyzed repos and submitted PRs to avoid duplicate work
- 🏃 **Dry Run** – Preview what the agent would do without creating actual PRs

## 🏗️ Architecture

```
Discovery → Analysis → Generation → PR
    │           │           │         │
    ▼           ▼           ▼         ▼
 GitHub    4 Analyzers   LLM-based   Fork+Branch
 Search    (parallel)    code gen    +Commit+PR
```

## 📦 Installation

```bash
# Clone the repo
git clone https://github.com/tang-vu/ContribAI.git
cd ContribAI

# Install with pip (editable mode for development)
pip install -e ".[dev]"

# Or install from PyPI (coming soon)
# pip install contribai
```

## ⚙️ Configuration

```bash
# Copy the example config
cp config.example.yaml config.yaml
```

Edit `config.yaml` with your credentials:

```yaml
github:
  token: "ghp_your_token_here"

llm:
  provider: "gemini"              # gemini | openai | anthropic | ollama
  model: "gemini-2.5-flash"
  api_key: "your_api_key"

discovery:
  languages: [python, javascript]
  stars_range: [100, 5000]
```

## 🚀 Usage

### Auto-discover and contribute

```bash
# Full autonomous run
contribai run

# Dry run (no PRs created)
contribai run --dry-run

# Filter by language and star count
contribai run --language python --stars 100-3000

# Limit PRs
contribai run --max-prs 3
```

### Target a specific repo

```bash
# Contribute to a specific repo
contribai target https://github.com/owner/repo

# Only specific contribution types
contribai target https://github.com/owner/repo --types security_fix,docs_improve

# Preview without creating PRs
contribai target https://github.com/owner/repo --dry-run
```

### Analyze only

```bash
# Analyze a repo and show findings (no PRs)
contribai analyze https://github.com/owner/repo
```

### Status & stats

```bash
# Check submitted PRs
contribai status

# Overall statistics
contribai stats

# View current config
contribai config
```

## 📁 Project Structure

```
contribai/
├── core/              # Config, models, exceptions
├── llm/               # Multi-provider LLM layer (Gemini, OpenAI, Anthropic, Ollama)
├── github/            # GitHub API client & repo discovery
├── analysis/          # LLM-powered code analysis (security, quality, docs, UI/UX)
├── generator/         # Contribution generator with self-review
├── pr/                # PR lifecycle manager (fork → branch → commit → PR)
├── orchestrator/      # Pipeline orchestrator & persistent memory
└── cli/               # Rich CLI interface
```

## 🧪 Development

```bash
# Install dev dependencies
pip install -e ".[dev]"

# Run tests
pytest tests/ -v

# Lint
ruff check contribai/

# Format
ruff format contribai/
```

## 🛡️ Safety

ContribAI includes several safety mechanisms:

- **Daily PR limit** – Configurable max PRs per day (default: 10)
- **Self-review** – LLM reviews its own generated code before PR
- **Dry run mode** – Preview everything without creating actual PRs
- **Rate limit awareness** – Respects GitHub API rate limits
- **Memory** – Never analyzes the same repo twice in a session

## 📄 License

MIT License – see [LICENSE](LICENSE) for details.

---

**Made with ❤️ for the open source community**
