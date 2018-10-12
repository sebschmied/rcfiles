#!/bin/bash
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
alias vi="vim"

alias td="todolist"
alias tda="todolist a"
alias todo="todolist"
alias tdl="todolist l"

alias google="googler"
# ghost in the shell part 3
# SHORT QUERY FUNCTIONS q()
q() {
  if [ ${#} -eq 1 ]
  then
    ls | grep --color -i ${1} 2> /dev/null
  else
    echo "usage: q string"
  fi
}

# SHORT QUERY FUNCTIONS Q()
Q() {
  if [ ${#} -eq 1 ]
  then
    ls | grep --color ${1} 2> /dev/null
  else
    echo "usage: Q string"
  fi
}

# SHORT QUERY FUNCTIONS qq()
qq() {
  if [ ${#} -eq 1 ]
  then
    find . \
      | grep -i ${1} 2> /dev/null \
      | cut -c 3-999 \
      | grep --color -i ${1} 2> /dev/null
        else
          echo "usage: qq string"
        fi
      }

# SHORT QUERY FUNCTIONS QQ()
QQ() {
  if [ ${#} -eq 1 ]
  then
    find . \
      | grep ${1} 2> /dev/null \
      | cut -c 3-999 \
      | grep ${1} 2> /dev/null
        else
          echo "usage: QQ string"
        fi
      }
