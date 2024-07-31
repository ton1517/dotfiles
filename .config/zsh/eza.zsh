if (( ! ${+commands[eza]} )); then
  return 1
fi

export EZA_COLORS='da=1;34:gm=1;34'

alias ls='eza --classify --icons -h --group-directories-first'
alias ll='ls -la --git'
