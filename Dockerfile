FROM golang:1.17.8-bullseye

ARG GOPATH=/tmp/gotools
ARG GO111MODULE=on
ARG GOLANGCI_LINT_VERSION=v1.44.2

RUN go get -v \
    golang.org/x/tools/cmd/goimports@release-branch.go1.15 \
    #
    # Install Go tools
    && mv $GOPATH/bin/* /usr/local/bin/ \
    #
    # Install golangci-lint
    && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin $GOLANGCI_LINT_VERSION \
    #
    # Clean up
    && rm -rf $GOPATH \
    #
    # Install codecov
    && curl -o /usr/local/bin/codecov https://uploader.codecov.io/v0.1.0_8880/linux/codecov \
    && chmod 755 /usr/local/bin/codecov
