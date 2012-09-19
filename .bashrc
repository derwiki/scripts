export PATH=$PATH:$HOME/bin
. $HOME/.git-completion.bash

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

export PS1='\h:\w$(__git_ps1 "\[\e[32m\][%s]\[\e[0m\]")$ '
export EDITOR=vim
export SKIP_CHECKS=test_history

alias python='/opt/python2.7/bin/python'
alias python2.7='/opt/python2.7/bin/python'
PATH=$PATH:/opt/python2.7/bin

source $HOME/scripts/helpers.sh
source $HOME/devscripts/helpers.sh
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/scripts/
export PATH=$PATH:$HOME/devscripts/
export PATH=$PATH:$HOME/devscripts/gerrit
export PATH=$PATH:$HOME/devscripts/git

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000
ssh-reagent
