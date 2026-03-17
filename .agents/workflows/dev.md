---
description: Development workflow – code, lint, test, commit cycle for implementing features and fixes
---

# Development Workflow

## Steps

1. **Pull latest changes**
// turbo
```bash
git pull origin main
```

2. **Create feature branch**
```bash
git checkout -b <type>/<short-description>
```
Types: `feat/`, `fix/`, `refactor/`, `docs/`, `perf/`, `test/`, `chore/`

3. **Write code changes**
Follow the Backend Developer agent standards:
- Async-first for I/O
- Type hints on all public APIs
- Pydantic models for data
- Custom exceptions from `contribai.core.exceptions`
- Logging via `logging.getLogger(__name__)`

4. **Write tests alongside code**
```bash
# Create test file in tests/unit/ matching the module
# e.g., contribai/analysis/analyzer.py → tests/unit/test_analyzer.py
```

5. **Run lint**
// turbo
```bash
ruff check contribai/ --fix
```

6. **Run format**
// turbo
```bash
ruff format contribai/ tests/
```

7. **Run tests**
// turbo
```bash
pytest tests/ -v --tb=short
```

8. **Check coverage**
// turbo
```bash
pytest tests/ --cov=contribai --cov-report=term-missing
```

9. **Stage changes**
```bash
git add -A
```

10. **Commit with conventional message**
```bash
git commit -m "<type>: <short description>"
```
Format: `type: description` where type is one of:
- `feat` – New feature
- `fix` – Bug fix
- `refactor` – Code restructuring
- `docs` – Documentation
- `test` – Tests
- `perf` – Performance improvement
- `chore` – Maintenance

11. **Push to remote**
```bash
git push origin <branch-name>
```

12. **Create Pull Request**
Open PR on GitHub with the PR template, request review from Code Reviewer agent.
