#!/bin/bash
packer_dir="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [[ ! -d  $packer_dir ]]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $packer_dir
fi
