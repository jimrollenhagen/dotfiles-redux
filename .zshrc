# (ohmy)zsh options
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
plugins=(git django zsh-syntax-highlighting tmux)
source $ZSH/oh-my-zsh.sh
CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"
setopt NO_NOMATCH
setopt PROMPT_SUBST
setopt extendedglob
setopt nonomatch

# aliases
alias zshconfig='vim ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias djsh='./manage.py shell_plus'
alias djcelery='./manage.py celeryd worker --loglevel=info'
alias migrate='./manage.py migrate; say "Your migrations are complete, master."'
alias sync='git pull --rebase && git push'
alias ipy='ipython'
alias bower='noglob bower'
alias :q='exit'

# github/hub
if [[ -e /usr/local/bin/hub ]] then
  # hub wraps git
  function git(){hub "$@"}
  # code review for a commit
  function cr(){hub browse -- commit/$1}
fi

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/sbin
export TERM=screen-256color
export GOPATH=$HOME/code/gopath

export TEETH_VAGRANT_DEV=$HOME/code

# virtualenv(wrapper)
export WORKON_HOME=$HOME/virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
VIRTUAL_ENV_DISABLE_PROMPT=1
source /usr/local/bin/virtualenvwrapper.sh

# option-arrow to jump word
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
