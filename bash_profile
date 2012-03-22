# PS1 with Git Completion
PS1='\[\e[0;34m\]\u \W$(__git_ps1 " [%s]")\$ \[\e[m\]'

# Aliases
alias ls='ls -G'
alias ll='ls -l'
alias flushcache='dscacheutil -flushcache'
alias git=hub

# RVM - This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Set Editor to be MacVim
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

# Use Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# System env vars
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Git PS1 Configuration
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Loads environment variables
ENV_DIR=$HOME/.include/environment.d
if [ ! -z `ls $ENV_DIR` ]
then
  for f in $ENV_DIR/*
  do
    . $f
  done
fi
