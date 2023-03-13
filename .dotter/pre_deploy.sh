packer_dir="~/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [[ ! -f  $packer_dir ]]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $packer_dir
fi
