# Locale config
export LANG=ru
export LC_ALL=ru_RU.UTF-8

# Default editor
export EDITOR="vim"

# Aliases
alias ls='ls -vFlaG'
alias sn="osascript -e 'tell application \"Caffeine\" to turn off'; pmset sleepnow"
alias go='ssh ripley.fluder.co "cat /var/log/nginx/fluder.co.access.log" | goaccess'

# ENV if exist
if [[ -r ~/.zshenv ]]; then
    source ~/.zshenv
fi

# Autoload
autoload -U colors zcalc compinit
colors
compinit

# PROMPT
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg_bold[white]%}%~%{$reset_color%}$ "

setopt AUTO_CD              # why would you type 'cd dir' if you could just type 'dir'?
setopt CORRECT              # Spell check commands!  (Sometimes annoying)
setopt PUSHD_TO_HOME        # blank pushd goes to home
setopt NUMERIC_GLOB_SORT    # sort by numeric method
setopt GLOB_COMPLETE        # completion in scp ex.

# Key bindings
bindkey "^[[H" beginning-of-line    # fn+left
bindkey "^[[F"  end-of-line         # fn+right
bindkey "\e[3~" delete-char         # fn+return
bindkey "\e\e[D" backward-word      # alt+left
bindkey "\e\e[C" forward-word       # alt+right

##
# Autocomplete SSH hosts
##

# ~/.ssh/config
if [ -f ~/.ssh/config ]; then
    zstyle -e ':completion:*:hosts' hosts "_ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))"
fi

# /etc/ssh_hosts, ~/.ssh/known_hosts
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
    zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    unset CASE_SENSITIVE
else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
