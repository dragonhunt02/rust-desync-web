#!/bin/bash
set -e

bash build.sh

# Requires Go
go install -v github.com/folbricht/desync/cmd/desync@latest
mkdir -p desync-go
cp -v $GOPATH/bin/desync desync-go/desync
