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
    mecab \
    libmecab-dev \
    mecab-ipadic-utf8 \
    && rm -rf /var/lib/apt/lists/*

ENV GOPATH /usr/local/go/bin
ENV PATH $PATH:$GOPATH:/usr/local/go/bin/bin

RUN wget --progress=dot:giga https://go.dev/dl/go1.19.linux-amd64.tar.gz &&\
    tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz &&\
    rm go1.19.linux-amd64.tar.gz &&\
    /usr/local/go/bin/go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest

WORKDIR /app
RUN wget --progress=dot:giga https://ja.osdn.net/dl/unidic/unidic-mecab-2.1.2_src.zip &&\
    unzip unidic-mecab-2.1.2_src.zip &&\
    rm unidic-mecab-2.1.2_src.zip
WORKDIR /app/unidic-mecab-2.1.2_src
RUN ./configure &&\
    make &&\
    make install
