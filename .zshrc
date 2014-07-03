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

bindkey "^[[1~" beginning-of-line   # fn-left
bindkey "^[[4~" end-of-line         # fn-right
bindkey "^[[1;5C" forward-word      # ctrl-left
bindkey "^[[1;5D" backward-word     # ctrl-right

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# env if exist
if [[ -r ~/.zshenv ]]; then
    source ~/.zshenv
fi

source ~/.zsh/autocomplete.zsh
source ~/.zsh/aliases.zsh

# auto ls after cd
function chpwd() {
	emulate -L zsh
	ls -a
}
