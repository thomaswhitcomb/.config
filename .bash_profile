# run /usr/libexec/java_home --verbose
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
function kcx() { kubectl exec -ti $@ bash; }

set -o vi
alias ls='ls -G'
alias clip='xclip -sel c'
alias kc='kubectl'
alias kcp='kubectl get pods'
alias kcl='kc logs `kubectl get pods --no-headers | cut -f1 -d\ `'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -l'
alias la='ls -a'
alias h='history'
alias lsd='ls -l | grep ^d'
alias l.='ls -a | grep "^\."'
alias vi='/usr/local/bin/nvim'
alias kce='kubectl exec -it -- /bin/bash'
alias kcg='kubectl get pods'
alias kcc='kubetcl create -f '
alias kcd='kubectl delete -f '
export AWS_DEFAULT_REGION=us-west-2

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
#export PS1="\[\033[92m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[31m\] $ \[\033[00m\]"
PATHCOLOR=39
BRANCHCOLOR=92
CURSORCOLOR=31
export PS1="\[\e[${PATHCOLOR}m\]\W\[\e[${BRANCHCOLOR}m\]\$(parse_git_branch)\[\e[${CURSORCOLOR}m\] > \[\e[00m\]"

complete -C aws_completer aws
source ~/git-completion.bash

# <<< conda init <<<
