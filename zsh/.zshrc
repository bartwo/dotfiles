#source /usr/local/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
CASE_SENSITIVE="false"
autoload -U colors && colors

source ~/.aliases

#autoload -U promptinit; promptinit
#prompt pure
eval "$(starship init zsh)"

export EDITOR=nvim

# keep track of history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# vi mode
bindkey -v
export KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
