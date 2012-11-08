# .oh-my-zsh init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fluder"
DISABLE_AUTO_UPDATE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Path for brew
export PATH=$HOME/bin:/usr/local/sbin:$PATH

# Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin

# Locale config
export LANG=ru
export LC_ALL=ru_RU.UTF-8

# Aliases
alias sn='pmset sleepnow'
alias ls='ls -vFlaG'

# Virtualenv init
source /usr/local/bin/virtualenvwrapper.sh
