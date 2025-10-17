# ~/.zshrc: Zsh
export ZSH="${HOME}/.oh-my-zsh"

#
# robbyrussell , agnoster , powerlevel10k
ZSH_THEME="robbyrussell"

#
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
  extract
  sudo
  web-search
  copypath
  copyfile
)

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# starship
eval "$(starship init zsh)"


#
export EDITOR='code'
export VISUAL='code'
export BROWSER='firefox'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# --- Proxy Settings
export host_ip=$(ip route | grep default | awk '{print $3}')
export proxy_port=7897

export http_proxy="http://${host_ip}:${proxy_port}"
export https_proxy="http://${host_ip}:${proxy_port}"
export all_proxy="socks5://${host_ip}:${proxy_port}"

#
alias motd='run-parts --lsbsysinit /etc/update-motd.d'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
#
alias update='sudo apt update && sudo apt upgrade'
alias install='sudo apt install'
alias search='apt search'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'

#
alias zshrc='$EDITOR ~/.zshrc'
alias vimrc='$EDITOR ~/.vimrc'
alias reload='source ~/.zshrc'

#
alias ping='ping -c 5'
alias ports='netstat -tulanp'

#
mkcd() {
    mkdir -p "$1" && cd "$1"
}

#
ff() {
    find . -name "*$1*" -type f
}

#
fd() {
    find . -name "*$1*" -type d
}

#
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

#
autoload -U compinit
compinit

#
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# 
bindkey -e

#
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# 
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

#
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

#
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
. "$HOME/.cargo/env"
