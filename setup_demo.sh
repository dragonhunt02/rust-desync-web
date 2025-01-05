#!/bin/bash
set -e

# Requires Go
go install -v github.com/folbricht/desync/cmd/desync@latest
mkdir -p desync-go
cp -v $GOPATH/bin/desync desync-go/desync
