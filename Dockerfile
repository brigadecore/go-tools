FROM golang:1.17.6-bullseye

ENV GOPATH=/tmp/gotools
ENV GO111MODULE=on
ARG GOLANGCI_LINT_VERSION=v1.44.2

RUN go get -v \
    golang.org/x/tools/cmd/goimports@release-branch.go1.15 \
    github.com/gobuffalo/packr/v2/packr2@v2.8.1 \
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

# Put go env vars back to normal
ENV GOPATH=/go
ENV GO111MODULE=auto
