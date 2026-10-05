export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias grep='grep --color=auto'
alias c='clear'
alias ls='eza'
alias lt='eza -al --icons=always'
alias ll='eza -a --tree --level=1 --icons=always --sort=extension'
alias vim=nvim
alias bt='bluetuith'
alias blf='hyprshade toggle blue-light-filter'
alias gs='git status'
alias weather='curl wttr.in'

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/var/lib/snapd/snap/bin/"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/scripts/"
export PATH="$PATH:$HOME/go/bin/"
export PATH="$PATH:$HOME/gcc-arm-none-eabi-8-2019-q3-update/bin/"
export PATH_TO_FX="$HOME/java/javafx-sdk-24.0.1/lib/"
bindkey -s ^f "tmux-sessionizer\n"
source <(fzf --zsh)

export SSH_AUTH_SOCK
