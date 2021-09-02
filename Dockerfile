FROM golang:1.17.0-bullseye

ENV GOPATH=/tmp/gotools
ENV GO111MODULE=on

RUN go get -v \
    golang.org/x/tools/cmd/goimports@release-branch.go1.15 \
    github.com/gobuffalo/packr/v2/packr2@v2.8.1 \
    #
    # Install Go tools
    && mv $GOPATH/bin/* /usr/local/bin/ \
    #
    # Install golangci-lint
    && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin v1.33.0 \
    #
    # Clean up
    && rm -rf $GOPATH

# Put go env vars back to normal
ENV GOPATH=/go
ENV GO111MODULE=auto
