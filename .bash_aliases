alias dita='cd /home/sschmied/git/ditahelp && git --no-pager log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit -n5 && git fetch && git status'

alias inst="sudo apt -y install"
alias what="apt show"
alias grepr="grep -r"
alias unixtime="date +%s"
alias dummy='git commit --allow-empty && git push'
alias clean="~/clean"
alias notepad=/usr/bin/gedit
alias xp="xmllint --xpath"
alias watch="watch --differences=permanent"
# Pipe stdout to clipboard, e.g. cat foo.txt | copy
alias copy="xsel -ib"
