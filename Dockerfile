FROM golang:1.18.0-bullseye

ARG GOLANGCI_LINT_VERSION=v1.45.0
ARG CODECOV_UPLOADER_VERSION=v0.1.20

    # Install golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin $GOLANGCI_LINT_VERSION \
    # Install codecov
    && curl -o /usr/local/bin/codecov https://uploader.codecov.io/$CODECOV_UPLOADER_VERSION/linux/codecov \
    && chmod 755 /usr/local/bin/codecov
