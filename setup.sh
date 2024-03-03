#!/usr/bin/env bash

# Install rust
if ! which cargo &> /dev/null ; then
	curl https://sh.rustup.rs -sSf | sh < yes
else
	echo "cargo already installed, skipping installation"
fi

# Install ripgrep
if ! which rg &> /dev/null; then
	cargo install ripgrep
else
	echo "ripgrep already installed, skipping installation"
fi

# Install find fd
if ! which fd &> /dev/null; then
	cargo install fd-find
else
	echo "fd already installed, skipping installation"
fi

# Install fzf
if ! which fzf &> /dev/null; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	yes | ~/.fzf/install
else
	echo "fzf already installed, skipping installation"
fi

# Install zioxide 
if ! which zoxide &> /dev/null; then
	curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
else
	echo "zioxide already installed, skipping installation"
fi
