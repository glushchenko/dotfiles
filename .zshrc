# Locale config
export LANG=ru
export LC_ALL=ru_RU.UTF-8

# Default editor
export EDITOR="vim"

# Aliases
alias ls='ls -vFlaG'

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

# Key bindings
bindkey "^[[H" beginning-of-line    # fn+left
bindkey "^[[F"  end-of-line         # fn+right
bindkey "\e[3~" delete-char         # fn+return
bindkey "\e\e[D" backward-word      # alt+left
bindkey "\e\e[C" forward-word       # alt+right

# Autocomplete SSH hosts
zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

# Case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
    zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    unset CASE_SENSITIVE
else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi
