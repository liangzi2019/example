# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#

test -s ~/.alias && . ~/.alias || true

### 终端记录器并输出到指定目录
# /usr/bin/script -qa /home/xuan/logs/bash-history.log

# export XAUTHORITY=~/.Xauthority

#-设定PS1对当前登录用户环境生效
# export PS1="\w\n\d|\A >"
export PS1="\w\n\h@\u \# \A >"


# GO环境变量（来自系统zypper安装）
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/go_work
export PATH=$GOPATH/bin:$PATH
# export GO111MODULE=on
# export GOPROXY=https://goproxy.io

# GoLand
export PATH=/usr/local/GoLand/bin:$PATH

# export PATH=/opt/composer/:$PATH

# export PATH=/usr/local/nginx/sbin:$PATH

#export PATH=/opt/arm-gcc/aarch64-linux-android-4.8/bin/:$PATH

# export PATH=/opt/android-ndk-r19/prebuilt/linux-x86_64/bin/:$PATH

# Android Studio
export PATH=/opt/android-studio/bin:$PATH

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# export PATH=/usr/brlcad/rel-7.26.0/bin/:$PATH

# export PATH=/opt/arm-gcc/4.7-2013.03/bin/:$PATH

# export PATH=/usr/local/cantact/bin/:$PATH

# export PATH="$HOME/.cargo/bin:$PATH"

export PATH=/home/xuan/.local/bin:$PATH

### dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH="$PATH:/home/xuan/.dotnet/tools"

# wabt
# export PATH=$PATH:/usr/local/wabt-1.0.12/


# 生成证书
# alias acme.sh='~/.acme.sh/acme.sh'

# OneDrive Sync-Download-only
# alias onedrive-download-only='onedrive --synchronize --download-only'

# 查看本机公网IP
alias pubip='curl ifconfig.me'

# 按照大小排序目录（仅限目录）
alias sortDirBySize='du -h --time --max-depth=1 | sort -hr '

# 只列出目录
alias listdir='find * -type d -maxdepth 0'

#找出“当前目录下”最大的5个文件
alias listFilesTop5='find . -type f -exec ls -s {} \; | sort -n -r | head -5'

# 显示可执行文件
alias showExecutable-files='ls -F | grep '*$''

# 列出tcp链接
alias listTcpLink='sudo lsof -i -n -P | grep TCP'

#把当前目录下面的GBK编码转换为UTF-8编码
alias gbk2utf-8='convmv -f GBK -t utf8 --notest -r .'

#trash-cli相关的配置
alias rm='trash'
alias rm-trash='rm -rf /home/xuan/.Trash/*'

#清除$HOME目录的Trash
alias rm-Trash="sudo rm -rf $HOME/.local/share/Trash/files/*"
alias rm-Trash_info="sudo rm -rf $HOME/.local/share/Trash/info/*"

#防止mv命令覆盖已有的同名文件
# alias mv='mv -i'

# 自定义ls ps cpu
alias l='ls -ltr'
alias pscpu='ps -e --sort=-%cpu'

#逐行显示环境变量
alias path='echo -e ${PATH//:/\\n}'

# 删除日志仅保留最近5天的内容
alias journal-rm_5daily='sudo journalctl --vacuum-time=5d'

# 更详细的历史记录
export HISTTIMEFORMAT='%Y.%m.%d-%T :: ' HISTFILESIZE=90000 HISTSIZE=90000

# unset HISTFILE
alias nongli='python3 /home/xuan/bin/nongli.py'

# HTTPS证书
# . "/home/xuan/.acme.sh/acme.sh.env"

# python虚拟环境
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
# eval "$(pyenv init -)"
# fi
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
# eval "$(pyenv init -)"
# fi
# [[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile

### fsl arm v7
# export PATH=/opt/arm-gcc/fsl-linaro-4.6-2/bin:$PATH


# ganache-cli
# export PATH=/home/xuan/nfs_share/node_modules/.bin:$PATH

### usbmuxd

# alias usbmuxd-user-start=`sudo /usr/local/sbin/usbmuxd --user usbmux --systemd`

### golang proxy
alias goproxycn="export GOPROXY=https://goproxy.cn"
alias proxy-socks5="export http_proxy=socks5://127.0.0.1:1080"
alias proxy-http="export http_proxy=http://127.0.0.1:8118"

### dotnet自动补全 https://docs.microsoft.com/zh-cn/dotnet/core/tools/enable-tab-autocomplete

_dotnet_bash_complete()
{
  local word=${COMP_WORDS[COMP_CWORD]}

  local completions
  completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}")"

  COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}

complete -f -F _dotnet_bash_complete dotnet

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
