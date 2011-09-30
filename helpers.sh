### Aliases ###

alias us_email_only_grep="grep -e '(.org\|.com\|.net\|.edu\|.mil\|.gov)'"

# these were tested on Linux but might not on OS X
alias ssl_encrypt="openssl des3 -salt -in $1 -out > $1.encrypted"
alias ssl_decrypt="openssl des3 -d -salt -in file -out $2 -k $1"

alias s="screen -xRR"
alias shs="python -m SimpleHTTPServer"
alias be="bundle exec"
alias rsync="rsync --partial --progress"

### Functions ###

# Usage:
#  github-clone derwiki/scripts
function github-clone {
 git clone git@github.com:$1.git
}

# Usage:
#  waitforpid 311 ; sendEmail "long running task finished"
function waitforpid {
  while ps -p $1 1>/dev/null 2> /dev/null; do 
    sleep 1; 
  done
}

# Usage:
#  waitforprocess myscript.py ; sendEmail "long running script finished"
function waitforprocess {
  while ps -p $(pgrep $1) 1>/dev/null 2> /dev/null; do
    sleep 1; 
  done
}

# This function look for files that have $1 in them and use sed to replace $1
# with $2. It's best to `git commit` before you do this so you can `git diff`
# to see what has changed.
# Usage:
#  refactor old_function new_better_function
function refactor {
  grep -r $1 * | cut -d: -f 1 | uniq | xargs -n 1 sed -i "s/$1/$2/g"
}

# returns the number of seconds a process has been alive by looking at /proc
# folder creation time for the process
function pid_seconds {
  echo $(($(date +%s) - $(stat -c '%Y' /proc/$1)))
}

ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
    export SSH_AUTH_SOCK=$agent
    if ssh-add -l 2>&1 > /dev/null; then
      echo Found working SSH Agent:
      ssh-add -l
      return
    fi
  done
  echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

function git-merge-to-master  {
  branch=$(git branch | grep '*' | cut -d' ' -f2)
  git fetch && \
  git rebase origin/master && \
  git checkout master && \
  git merge $1 $branch
}
