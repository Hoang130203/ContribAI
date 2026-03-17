# ── Build ──────────────────────────────────────────
FROM python:3.12-slim AS builder

WORKDIR /build
COPY pyproject.toml .
COPY contribai/ contribai/
COPY README.md .
COPY LICENSE .

RUN pip install --no-cache-dir build && \
    python -m build --wheel

# ── Runtime ───────────────────────────────────────
FROM python:3.12-slim

LABEL maintainer="ContribAI Team"
LABEL description="AI Agent for Open Source Contributions"

# Create non-root user
RUN useradd --create-home --shell /bin/bash contribai
WORKDIR /home/contribai

# Install the built wheel
COPY --from=builder /build/dist/*.whl /tmp/
RUN pip install --no-cache-dir /tmp/*.whl && rm /tmp/*.whl

# Create config and data directories
RUN mkdir -p /home/contribai/.contribai && \
    chown -R contribai:contribai /home/contribai

USER contribai

# Default: show help
ENTRYPOINT ["contribai"]
CMD ["--help"]
