alias ls='ls -vFlaG'
alias sn="osascript -e 'tell application \"Caffeine\" to turn off'; pmset sleepnow"
alias go="ssh -t ripley.fluder.co 'goaccess -f /var/log/nginx/fluder.co.access.log'"
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim' # +clipboard
alias c='cal_head=`cal | head -1`; cal_tail=`cal | tail -7`; today=`date "+%e"`; echo "$cal_head"; echo -en "${cal_tail/${today}/\033[1;32m${today}\033[0m}";'
alias balance='ledger -f ~/Dropbox/Apps/ledger/common.dat -s bal'
