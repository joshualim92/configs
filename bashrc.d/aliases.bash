alias ~='cd ~'
alias ..='cd ..'         # Go up one directory
alias cd..='cd ..'       # Common misspelling for going up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

# clear
alias c='clear'

# dir
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# docker
alias doc='docker'
alias docb='docker build'
alias docr='docker run -it --rm'

# Emacs
alias emac='emacsclient'
alias es='emacsclient -c'

# Git
complete -o bashdefault -o default -o nospace -F _git g
alias g='git'

# google
alias google='open http://google.com'

# grep
# colored grep
# Need to check an existing file for a pattern that will be found to ensure
# that the check works when on an OS that supports the color option
if grep --color=auto 'a' '${BASH_IT}/'*.md &> /dev/null
then
  alias grep='grep --color=auto'
  export GREP_COLOR='1;33'
fi
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias gr='grep'

# history
alias h='history'

# kubectl
complete -o bashdefault -o default -o nospace -F __start_kubectl kc
alias kc='kubectl'

# itunes
alias it='itunes'
alias iti='itunes info'
alias itn='itunes next'
alias ito='itunes open'
alias itpa='itunes pause'
alias itpl='itunes play'
alias itpr='itunes previous'

# ls
if ls --color -d . &> /dev/null
then
  alias ls='ls --color=auto'
elif ls -G -d . &> /dev/null
then
  alias ls='ls -G'        # Compact view, show colors
fi

alias sl=ls
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -lah'
alias l1='ls -1'

# MacOS
alias addUpNext='osascript ~/Library/Mobile\ Documents/com~apple~ScriptEditor2/Documents/add_to_up_next.scpt'

# jobs
alias jb='jobs'

# skaffold
alias ska='skaffold'

# source
alias so='source'
alias bp='source ~/.bash_profile'
alias bashrc='source ~/.bashrc'

# Tmux
complete -o bashdefault -o default -o nospace -F _tmux t
alias t='tmux'
alias ta='tmux a'
alias tat='tmux a -t'
alias td='tmux detach'
alias tks='tmux kill-session -t'
alias tkw='tmux kill-window -t'
alias tl='tmux ls'
alias tm='tmux move-window -t'
alias tn='newTmuxSessionInPwd'
alias tns='tmux new -s'
alias tnt='tmux new -t'
alias ts='tmux switchc -t'
alias tsl='tmux switchc -l'

# v
alias vi='vim'
alias vc='v -c'
alias vl='v -l'

# z
alias zc='z -c'
alias zl='z -l'
