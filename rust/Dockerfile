# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/rust/.devcontainer/base.Dockerfile

ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${VARIANT}


# See https://github.com/hadolint/hadolint/releases
ARG HADOLINT_VERSION="v2.10.0"
RUN wget --progress=dot:giga -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64 \
    && chmod 755 /usr/local/bin/hadolint

RUN apt-get update && apt-get install --no-install-recommends -y \
    cmake \
    protobuf-compiler \
    apt-transport-https \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# See https://www.terraform.io/downloads
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget --progress=dot:giga -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update && apt-get install --no-install-recommends -y terraform \
    && rm -rf /var/lib/apt/lists/*

# shellcheck source=/dev/null
RUN wget --progress=dot:giga https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh \
    && source /install_linux.sh \
    && rm -f /install_linux.sh

ENV GOPATH /usr/local/go/bin
ENV PROTOC /usr/bin/protoc
ENV PATH $PATH:$GOPATH:/usr/local/go/bin/bin

RUN wget --progress=dot:giga https://go.dev/dl/go1.19.linux-amd64.tar.gz &&\
    tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz &&\
    rm go1.19.linux-amd64.tar.gz &&\
    /usr/local/go/bin/go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest

# Install Bazel
RUN wget --progress=dot:giga -O - https://bazel.build/bazel-release.pub.gpg | gpg --dearmor | tee /usr/share/keyrings/bazel-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
    && apt-get update -y && apt-get install --no-install-recommends -y bazel \
    && rm -rf /var/lib/apt/lists/* \
    && go install github.com/bazelbuild/buildtools/buildifier@latest
USER vscode
RUN cargo install cargo-raze
USER root

WORKDIR /app
RUN wget --progress=dot:giga --no-check-certificate https://www.python.org/ftp/python/3.9.15/Python-3.9.15.tgz &&\
    tar -xf Python-3.9.15.tgz &&\
    rm Python-3.9.15.tgz
WORKDIR /app/Python-3.9.15
RUN ./configure --enable-optimizations &&\
    make &&\
    make install

WORKDIR /
