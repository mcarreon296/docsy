# syntax=docker/dockerfile:1

FROM python:3.13-slim

LABEL org.opencontainers.image.title="Docsy Sphinx Builder"
LABEL org.opencontainers.image.description="Sphinx documentation build environment"

ENV DEBIAN_FRONTEND=noninteractive
ENV UV_NO_PROGRESS=1

# install required system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        graphviz \
        make && \
    rm -rf /var/lib/apt/lists/*

# obtain uv
COPY --from=ghcr.io/astral-sh/uv:0.13.0 \
    /uv /uvx /usr/local/bin/

# install dependencies from lockfile
WORKDIR /opt/docsy

COPY pyproject.toml uv.lock ./

RUN uv sync --locked --no-install-project

# make installed Python tools available globally
ENV PATH="/opt/docsy/.venv/bin:$PATH"

# allow git operations
RUN git config --system --add safe.directory /work

# compose mounts repository
WORKDIR /work

CMD ["sphinx-build", "--version"]
