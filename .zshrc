# checking .cache direcory for declutter home
CACHE="$HOME/.cache/zsh"
if [[ ! -d ~/.cache/zsh ]]; then
    CACHE="$HOME"
fi    

export LANG=en
export LC_ALL=en_US.UTF-8
export EDITOR="vim"
export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE="~/.cache/zsh/.zsh_history"

autoload -U colors zcalc compinit

colors
compinit -d "$CACHE/.zcompdump"

setopt AUTO_CD              # why would you type 'cd dir' if you could just type 'dir'?
setopt CORRECT              # Spell check commands!  (Sometimes annoying)
setopt PUSHD_TO_HOME        # blank pushd goes to home
setopt NUMERIC_GLOB_SORT    # sort by numeric method
setopt GLOB_COMPLETE        # completion in scp ex.

# history
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

bindkey "^[[1~" beginning-of-line   # fn-left
bindkey "^[[4~" end-of-line         # fn-right
bindkey "^[[1;5C" forward-word      # ctrl-left
bindkey "^[[1;5D" backward-word     # ctrl-right

# env if exist
if [[ -r ~/.zshenv ]]; then
    source ~/.zshenv
fi

# tmux autostart
if [ -z $TMUX ]; then; 
    tmux attach || tmux new;
fi  

source ~/.zsh/autocomplete.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/git-prompt/git-prompt.zsh

PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg_bold[white]%}%~%{$reset_color%}$(git_super_status)$ '
