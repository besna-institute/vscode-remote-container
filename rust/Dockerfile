# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/rust/.devcontainer/base.Dockerfile

ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${VARIANT}


# See https://github.com/hadolint/hadolint/releases
ARG HADOLINT_VERSION="v2.10.0"
RUN wget --progress=dot:giga -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64 \
    && chmod 755 /usr/local/bin/hadolint

RUN apt-get update && apt-get install --no-install-recommends -y \
    cmake \
    && rm -rf /var/lib/apt/lists/*
