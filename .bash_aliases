alias dita='cd /home/sschmied/git/ditahelp && git --no-pager log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit -n5 && git fetch && git status'
alias ditaot='cd /home/sschmied/git/ditaot-bin/dita-ot-2.2.0/plugins/de.1und1.html && git --no-pager log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit -n5 && git fetch && git status'
alias metadita='cd /home/sschmied/git/metadita && git --no-pager log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" -- abbrev-commit -n5 && git fetch && git status'

alias inst="sudo apt -y install"
alias what="apt show"
alias grepr="grep -r"
alias unixtime="date +%s"
alias dummy='git commit --allow-empty && git push'
alias clean="~/clean"

alias dita-livegang="~/git/golive/dita-livegang"
alias dita-upload="~/git/golive/dita-upload"
alias dita-status="~/git/golive/dita-status"
alias upload-all="~/git/golive/upload-all"
alias autolive="~/git/golive/autolive"

alias notepad=/usr/bin/gedit

alias livegang-all=/home/sschmied/git/golive/livegang-all
alias xp="xmllint --xpath"
alias mergetodev=~/git/golive/mergetodev
alias pingsitemap="tail -n 30 ~/git/golive/ping.log"

alias watch="watch --differences=permanent"

# Pipe stdout to clipboard, e.g. cat foo.txt | copy
alias copy="xsel -ib"
alias kantine="curl --silent --max-time 3 https://speiseplan.die-frischemacher.de/index.php/app/api/getFood -X POST -d \"client_code=145&$(date '+year=%Y&week=%W&day=%u')\" |
jq -c '.Records.food[].food_menu[]|  {food_name, price} ' | sed 's/{\"food_name\":\" *\(.*\)\",\"price\":\"\\(.*\\)\"}/\\1:\\2/g;s/\\\\//g' | column -t -s ':'"
