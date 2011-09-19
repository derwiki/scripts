### Aliases ###

alias us_email_only_grep="grep -e '(.org\|.com\|.net\|.edu\|.mil\|.gov)'"

# these were tested on Linux but might not on OS X
alias ssl_encrypt="openssl des3 -salt -in $1 -out > $1.encrypted"
alias ssl_decrypt="openssl des3 -d -salt -in file -out $2 -k $1"

alias pf="grep -nr --include=*.py"
alias jsf="grep -nr --include=*.js"
alias rf="grep -nr --include=*.rb"
alias ef="grep -nr --include=*.erb"
alias rkf="grep -nr --include=*.rake"

alias s="screen -xRR"
alias shs="python -m SimpleHTTPServer"

alias git-head="rev-parse HEAD"

### Functions ###

function deployhead {
  sha1=$(git-head)
  pushd $HOME/starways
  git pull origin master
  ./deploy $1 $sha1
  popd
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
