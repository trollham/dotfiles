if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
    eval $(ssh-agent -s) > /dev/null
    if [ "$(ssh-add -l)" = "The agent has no identities." ] ; then
        # Auto-add ssh keys to your ssh agent
        # Example:
        # ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
		ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1
    fi
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

get_install_date () {
	echo $(curl -s -H "Accept: application/vnd.github+json" https://api.github.com/repos/rust-lang/rust-analyzer/releases/latest | jq .published_at)
}

normalize_date () {
	local input_date=$(echo $1 | sed 's/Z//' | sed 's/"//g')
	if [[ $OSTYPE == 'darwin'* ]]; then
		echo $(date -j -f  "%Y-%m-%dT%H:%M:%s" "${input_date}" +%s)
	else
		echo $(date -d "${input_date}" +%s)
	fi
}

check_rust_analyzer () {
	local latest_date=$(get_install_date)
	local installed_date=$(cat $HOME/.rust_analyzer_version)
	local la_d=$(normalize_date "${latest_date}")
	local in_d=$([ "$installed_date" ] && echo $(normalize_date "${installed_date}") || echo "0")

	if [[ $la_d -gt $in_d ]]; then
		echo "Update available"
	else
		echo "Already up-to-date."
	fi
}

update_rust_analyzer () {
	local version=$(get_install_date)
	local host=$(rustc --version --verbose | grep host | awk '{print $2}')
	curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-${host}.gz | gunzip -c - > ~/.local/bin/rust-analyzer
	chmod +x ~/.local/bin/rust-analyzer
	echo $version > ~/.rust_analyzer_version
}

# history settings to remove duplicates
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# autocomplete settings
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-za-z}'

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git ssh-agent
# 	zsh-autosuggestions
# 	fzf
# 	)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

if command -v nvim &> /dev/null; then
	export EDITOR='nvim'
else
	export EDITOR='vim'
fi

# vi keybinds
bindkey -v

alias icat="kitty +kitten icat"
alias ls="ls -G"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# sourcing zsh-syntax-highlighting must happen at the END of ~/.zshrc
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
