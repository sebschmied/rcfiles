## Based on Mxlian's bashrc, who based it "on many sources" ##

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set terminal colors capabilities
# see http://vim.wikia.com/wiki/256_colors_in_vim (comments section)

### Colors
SCREEN_COLORS="`tput colors`"
if [ -z "$SCREEN_COLORS" ] ; then
    case "$TERM" in
        screen-*color-bce)
            echo "Unknown terminal $TERM. Falling back to 'screen-bce'."
            export TERM=screen-bce
            ;;
        *-88color)
            echo "Unknown terminal $TERM. Falling back to 'xterm-88color'."
            export TERM=xterm-88color
            ;;
        *-256color)
            echo "Unknown terminal $TERM. Falling back to 'xterm-256color'."
            export TERM=xterm-256color
            ;;
    esac
    SCREEN_COLORS=`tput colors`
else
    case "$SCREEN_COLORS" in
        8)
           :
            #echo "Using linux terminal? Trying fbterm for 256 color..."
            #export TERM=fbterm
            ;;
    esac
fi
if [ -z "$SCREEN_COLORS" ] ; then
    case "$TERM" in
        gnome*|xterm*|konsole*|aterm|[Ee]term)
            echo "Unknown terminal $TERM. Falling back to 'xterm'."
            export TERM=xterm
            ;;
        rxvt*)
            echo "Unknown terminal $TERM. Falling back to 'rxvt'."
            export TERM=rxvt
            ;;
        screen*)
            echo "Unknown terminal $TERM. Falling back to 'screen'."
            export TERM=screen
            ;;
    esac
    SCREEN_COLORS=`tput colors`
fi

### Bash defaults
# Use vim
export VISUAL=vim
export EDITOR="$VISUAL"

## History settings
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# Don't execute command after ! or !? or !!
shopt -s histverify

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTTIMEFORMAT='%F %T  '
PROMPT_COMMAND='history -a'

## Resizing
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Maxi: Add git information to command prommt 
    function parse_git_branch_and_add_brackets {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
    }

### Command overrides/aliases ###

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls shortcuts
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Autocompletion when sudoing
complete -cf sudo

# ls when changing to another directory

function cd {
    builtin cd "$@" && ls -F
    }


# oxygen xml editor shortcut
function ox(){
    /bin/sh "/home/sschmied/oxygen/oxygen17.1/oxygen17.1" $* > /dev/null 2>&1 &
}

# http://stackoverflow.com/a/23328996 lazy git commit
function gt(){
    git add .
    git commit -a -m "$*"
    git push
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# other Aliases
if [ -f ~/.rc/.bash_aliases ]; then
    . ~/.rc/.bash_aliases
fi

# other Aliases
if [ -f ~/.rc/.bash_sensitive ]; then
    . ~/.rc/.bash_sensitive
fi



### The prompt ###

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# From maxi:
# To use red on root and blue on normal user
if [[ ${EUID} == 0 ]] ; then
    sq_color="\[\033[0;31m\]"
else        
    sq_color="\[\033[1;30m\]"
fi

PS1="$sq_color\342\224\214"
# Show a X when previous command failed
PS1=$PS1"\$([[ \$? != 0 ]] && echo \"\342\224\200[\[\033[01;31m\]\342\234\227$sq_color]\")"
# Command  history possition
# PS1=$PS1"\342\224\200[\[\033[01;37m\]\!$sq_color]"
# Time
PS1=$PS1"\342\224\200[\[\033[01;39m\]\t$sq_color]"
# User/host
PS1=$PS1"\342\224\200[\[\033[01;39m\]\u@\h$sq_color]"

PS1=$PS1"\n"
PS1=$PS1"\342\224\224\342\224\200\342\224\200> " 

# Path
PS1=$PS1"\[\033[01;39m\]\w$sq_color"
# Show branch if in a git directory
PS1=$PS1"\[\033[1;39m\]\$(parse_git_branch_and_add_brackets)\[\033[0m\]"
# Separator
PS1=$PS1"⇒ "

