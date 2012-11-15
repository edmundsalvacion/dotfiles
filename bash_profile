# PS1 with Git Completion
PS1='[\T] \[\e[0;34m\]\u \W$(__git_ps1 " [%s]") 💻  \[\e[m\]'

# Aliases
alias ls='ls -G'
alias ll='ls -l'
alias flushcache='dscacheutil -flushcache'
alias git=hub

# Set Editor to be MacVim
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

# Use Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Git PS1 Configuration
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto

# PATH
export PATH=/usr/local/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH

# Loads environment variables
ENV_DIR=$HOME/.include/environment.d
if [ ! -z "`ls $ENV_DIR`" ]
then
  for f in $ENV_DIR/*
  do
    . $f
  done
fi
