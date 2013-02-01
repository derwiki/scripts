### Aliases ###

alias us_email_only_grep="grep -e '(.org\|.com\|.net\|.edu\|.mil\|.gov)'"

# these were tested on Linux but might not on OS X
alias ssl_encrypt="openssl des3 -salt -in $1 -out > $1.encrypted"
alias ssl_decrypt="openssl des3 -d -salt -in file -out $2 -k $1"

alias t="tmux attach"
alias rsync="rsync --partial --progress"

# git aliases
alias g=git
function opencommit {
  vim -p $(git diff HEAD^ --name-only)
}
function mmr {
  vim -p $(git diff --diff-filter=U --name-only)
}

# Python aliases
alias shs="python -m SimpleHTTPServer"

# Ruby aliases
alias be="bundle exec"
alias ber="bundle exec rake"
alias ss="bundle exec spec --drb"
alias bi="bundle install"
alias nquery="ack 'SELECT ' log/development.log |  ack -o 'SELECT.*?=' | sort | uniq -c | sort"
function def {
  ack "def (self.)?$1"
}

# Clojure aliases
alias clj="java -cp ~/bin/clojure-1.3.0.jar clojure.main"

### Functions ###
function flac2mp3 {
  # note to self: % replaces substring backwards, # forwards
  mp3filename="${1%flac}mp3"
  echo ffmpeg -i $1 -ab 196k -ac 2 -ar 4800 $mp3filename
  if [ -n "$RMSRC" ]; then
    rm $1
  fi
}

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
    if ~/scripts/timeout -t 2 ssh-add -l 2>&1 > /dev/null; then
      return
    fi
  done
  echo Cannot find ssh agent - maybe you should reconnect and forward it?
}
alias sr='ssh-reagent'

function f {
  find . -name \*$1\*
}

alias c=clear

function sum {
  paste -sd+ $1 | bc
}
