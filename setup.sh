#!/bin/bash
set -e

# Setup Rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# echo 'source $HOME/.cargo/env' >> ~/.bash_profile

curl -L -O "https://github.com/krishnakumar4a4/desync-rs/archive/refs/heads/master.zip"
unzip master.zip && rm master.zip && mv desync-rs-master desync-rs

cd desync-rs
cargo update -p rustc-serialize # Unlock to solve compile error
