alias us_email_only_grep="grep -e '(.org\|.com\|.net\|.edu\|.mil\|.gov)'"

# these used to work on linux but might not on OS X
alias ssl_encrypt="openssl des3 -salt -in $1 -out > $1.encrypted"
alias ssl_decrypt="openssl des3 -d -salt -in file -out $2 -k $1"


alias pf="grep -nr --include=*.py"
alias jsf="grep -nr --include=*.js"
alias rf="grep -nr --include=*.rb"
alias ef="grep -nr --include=*.erb"
alias rkf="grep -nr --include=*.rake"

alias s="screen -xRR"
