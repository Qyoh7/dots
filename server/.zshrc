export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias grep='grep --color=auto'
alias c='clear'
alias ll='eza -a --icons=always'
alias lt='eza -al --icons=always'
alias ls='eza -a --tree --level=1 --icons=always --sort=extension'
alias vim='nvim'
alias gs='git status'

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/scripts/"

bindkey -s ^f "tmux-sessionizer\n"
source <(fzf --zsh)

export SSH_AUTH_SOCK

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
. "/home/zayden/.deno/env"
