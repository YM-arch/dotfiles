# ~/.zshrc: Zsh 配置文件
export ZSH="${HOME}/.oh-my-zsh"

# 主题配置
# 推荐主题：robbyrussell (简洁), agnoster (美观), powerlevel10k (功能强大)
ZSH_THEME="robbyrussell"

# 插件配置
plugins=(
  git                    # Git 命令补全和别名
  zsh-syntax-highlighting  # 语法高亮
  zsh-autosuggestions     # 自动建议
  colored-man-pages       # 彩色 man 页面
  extract                 # 智能解压
  sudo                    # 按两次 ESC 添加 sudo
  web-search             # 快速搜索
  copypath               # 复制当前路径
  copyfile               # 复制文件内容
)

# Oh My Zsh 核心加载
source $ZSH/oh-my-zsh.sh

# starship配置
eval "$(starship init zsh)"


# 环境变量
export EDITOR='nano'
export VISUAL='nano'
export BROWSER='firefox'
export LANG='zh_CN.UTF-8'
export LC_ALL='zh_CN.UTF-8'

# PATH 配置
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# --- Proxy Settings (Reliable Method) ---
export host_ip=$(ip route | grep default | awk '{print $3}')
export proxy_port=7897

export http_proxy="http://${host_ip}:${proxy_port}"
export https_proxy="http://${host_ip}:${proxy_port}"
export all_proxy="socks5://${host_ip}:${proxy_port}"

# 别名配置

# 系统相关
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

# 更新系统
alias update='sudo apt update && sudo apt upgrade'
alias install='sudo apt install'
alias search='apt search'

# Git 相关
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'

# 快速编辑配置文件
alias zshrc='$EDITOR ~/.zshrc'
alias vimrc='$EDITOR ~/.vimrc'
alias reload='source ~/.zshrc'

# 网络相关
alias ping='ping -c 5'
alias ports='netstat -tulanp'

# 函数定义
# 创建目录并进入
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# 查找文件
ff() {
    find . -name "*$1*" -type f
}

# 查找目录
fd() {
    find . -name "*$1*" -type d
}

# 历史配置
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

# 自动补全配置
autoload -U compinit
compinit

# 大小写不敏感补全
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# 键绑定
# 使用 emacs 键绑定
bindkey -e

# Ctrl+左/右箭头移动单词
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# 如果存在本地配置文件则加载
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# 如果安装了 fzf 则加载
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# 如果安装了 nvm 则加载
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
. "$HOME/.cargo/env"