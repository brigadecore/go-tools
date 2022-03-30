FROM golang:1.18.0-bullseye

ARG GOLANGCI_LINT_VERSION=v1.45.2

    # Install golangci-lint; Docs recommend this method over `go install`
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin $GOLANGCI_LINT_VERSION \
    # Install codecov
    && curl -o /usr/local/bin/codecov https://uploader.codecov.io/v0.1.0_8880/linux/codecov \
    && chmod 755 /usr/local/bin/codecov
