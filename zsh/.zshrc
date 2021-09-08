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

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey -s '^s' 'cd "$(~/src "$(fzf)")"\n'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -v
export KEYTIMEOUT=1
bindkey -M viins 'jk' vi-cmd-mode

# crtl-l for autosuggest-accept
bindkey '^l' autosuggest-accept

# Load in plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
