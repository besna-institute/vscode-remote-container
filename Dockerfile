# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/rust/.devcontainer/base.Dockerfile

ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${VARIANT}

RUN apt upgrade
RUN apt update && apt-get install -y cmake