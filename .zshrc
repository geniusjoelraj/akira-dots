export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting )

fpath=($HOME/.zsh_completions $fpath)
source $ZSH/oh-my-zsh.sh
source /usr/share/wikiman/widgets/widget.zsh

# User configuration

## Export
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR="nvim"
export ANI_CLI_DOWNLOAD_DIR="/home/tensai/Media/Anime"
export HYPRSHOT_DIR="/home/tensai/Pictures/Screenshots" 
export PATH=/home/tensai/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin:$HOME/.scripts:$HOME/.cargo/bin
export DOTFILES="/home/tensai/dotfiles/"
export TESS_DIR="/home/tensai/Code/tess"
export PYSCRIPT="/home/tensai/.scripts/pyscripts/"

## Aliases
alias v="nvim"
alias ani-cli="ani-cli -q 1080p"
alias c="clear"
alias ls="eza --icons=always --git-ignore"
alias l="eza -alh --icons=always"
alias osu="flatpak run sh.ppy.osu"
alias yz="yazi"
alias i="sudo pacman -S"
alias lg="lazygit"
alias t="~/.scripts/timer.sh"
alias fpclean="flatpak uninstall --unused --delete-data"
alias clean="yay -Sc"
alias cn="clear && nitch"
alias hf="history | fzf -e"
# alias tldrless='f() { tldr $1 --color always | less -R };f'


# Alias functions
nzf() {
  nvim "$(fzf --preview='cat {}')"
}

mdprev() {
  uv run "$PYSCRIPT/render-md/main.py" $1
}


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
bindkey -e


## API_KEYS
source "$HOME/.zshrc_api_keys"
source "$HOME/.auto_complete"
# nitch
