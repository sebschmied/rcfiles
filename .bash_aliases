alias dita='cd /home/sschmied/git/ditahelp && git --no-pager log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit -n5 && git status'
alias ditaot='cd /home/sschmied/git/ditaot-bin/dita-ot-2.2.0/plugins/de.1und1.html && git --no-pager log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit -n5 && git status'
alias metadita='cd /home/sschmied/git/metadita && git --no-pager log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" -- abbrev-commit -n5 && git status'

alias inst="sudo apt -y install"
alias what="apt-cache search"
alias grepr="grep -r"
alias unixtime="date +%s"
alias dummy='git commit --allow-empty -m "Dummy commit" && git push'
alias clean="~/clean"
alias dita-livegang="~/git/golive/dita-livegang"
alias dita-upload="~/git/golive/dita-upload"
alias dita-status="~/git/golive/dita-status"
alias upload-all="~/git/golive/upload-all"

alias notepad=/usr/bin/gedit

alias livegang-all=/home/sschmied/git/golive/livegang-all
alias xp="xmllint --xpath"
alias mergetodev=~/git/golive/mergetodev
alias pingsitemap="tail -n 30 ~/git/golive/ping.log"
