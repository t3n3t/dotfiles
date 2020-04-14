#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'

force_color_prompt=yes
color_prompt=yes


PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$\[ \]\]'


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias kerouac='ssh deploy@kerouac.app'
alias tdglobus='ssh admin@tdglobus.ru'
alias cpu_performance='sudo cpupower frequency-set -g performance'
alias cpu_powersave='sudo cpupower frequency-set -g powersave'
alias glog='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

set bell-style none

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
source /etc/profile.d/vte.sh

fo() (
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
)

stty -ixon

export SAL_USE_VCLPLUGIN=kf5
