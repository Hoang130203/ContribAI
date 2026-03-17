# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 0.1.x   | ✅        |

## Reporting a Vulnerability

If you discover a security vulnerability, please report it responsibly:

1. **DO NOT** create a public GitHub issue for security vulnerabilities
2. Email: **security@contribai.dev** (or use GitHub Security Advisories)
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### Response Timeline
- **Acknowledgment**: Within 48 hours
- **Assessment**: Within 1 week
- **Fix & Release**: Within 2 weeks for critical issues

## Security Considerations

ContribAI handles sensitive data:
- **GitHub Tokens** – Stored in `config.yaml` (gitignored)
- **LLM API Keys** – Stored in `config.yaml` (gitignored)
- **LLM Outputs** – Treated as untrusted data, sanitized before use
- **Repository Code** – Fetched via API, processed in memory

### What We Do
- Config files with secrets are in `.gitignore`
- Only `yaml.safe_load()` is used (no unsafe deserialization)
- LLM output is parsed with try/except, never `eval()`'d
- GitHub tokens use minimal required scopes
- Rate limiting prevents API abuse
