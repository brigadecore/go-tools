FROM golang:1.17.8-bullseye

ENV GOPATH=/tmp/gotools
ENV GO111MODULE=on

RUN go get -v \
    golang.org/x/tools/cmd/goimports@release-branch.go1.15 \
    #
    # Install Go tools
    && mv $GOPATH/bin/* /usr/local/bin/ \
    #
    # Install golangci-lint
    && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin v1.42.1 \
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
