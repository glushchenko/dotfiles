# Path for brew
export PATH=$HOME/bin:/usr/local/sbin:$PATH

# Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin

# Locale config
export LANG=ru
export LC_ALL=ru_RU.UTF-8

# Default editor
export EDITOR="vim"

# Aliases
alias sn='pmset sleepnow'
alias ls='ls -vFlaG'

# Virtualenv init
source /usr/local/bin/virtualenvwrapper.sh

# PROMPT
autoload -U colors zcalc compinit
colors
compinit

PS1="%{$fg_bold[red]%}$  %{$fg_bold[cyan]%}%c  %{$reset_color%}"

setopt AUTO_CD              # why would you type 'cd dir' if you could just type 'dir'?
setopt CORRECT              # Spell check commands!  (Sometimes annoying)
setopt PUSHD_TO_HOME        # blank pushd goes to home
setopt NUMERIC_GLOB_SORT    # sort by numeric method

# Key bindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F"  end-of-line

# Autocomplete SSH hosts
zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config
