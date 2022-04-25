if (( ! ${+commands[exa]} )); then
  return 1
fi

export EXA_COLORS='da=1;34:gm=1;34'

alias ls='exa --classify --icons -h --group-directories-first'
alias ll='ls -la --git'
