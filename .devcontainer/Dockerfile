# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.241.1/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
FROM mcr.microsoft.com/vscode/devcontainers/base:0-bullseye

RUN wget --progress=dot:giga -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64 \
    && chmod 755 /usr/local/bin/hadolint

# ** [Optional] Uncomment this section to install additional packages. **
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

