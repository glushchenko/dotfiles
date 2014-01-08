export LANG=ru
export LC_ALL=ru_RU.UTF-8
export EDITOR="vim"

autoload -U colors zcalc compinit 

colors 
compinit

PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg_bold[white]%}%~%{$reset_color%}$ "

setopt AUTO_CD              # why would you type 'cd dir' if you could just type 'dir'?
setopt CORRECT              # Spell check commands!  (Sometimes annoying)
setopt PUSHD_TO_HOME        # blank pushd goes to home
setopt NUMERIC_GLOB_SORT    # sort by numeric method
setopt GLOB_COMPLETE        # completion in scp ex.

bindkey "^[[H" beginning-of-line    # fn+left
bindkey "^[[F"  end-of-line         # fn+right
bindkey "\e[3~" delete-char         # fn+return
bindkey "\e\e[D" backward-word      # alt+left
bindkey "\e\e[C" forward-word       # alt+right

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# env if exist
if [[ -r ~/.zshenv ]]; then
    source ~/.zshenv
fi

source ~/.zsh/iterm2.zsh
source ~/.zsh/autocomplete.zsh
source ~/.zsh/aliases.zsh
