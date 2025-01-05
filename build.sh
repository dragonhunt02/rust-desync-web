#!/bin/bash
set -e

mkdir -p bin
rm -rf bin/*

cd desync-rs
cargo build
cp -v target/debug/desync-rs ../bin/desync-rs
cp -v log4rs.yml ../bin/log4rs.yml
chmod +x ../bin/desync-rs