#
# Colors
#

autoload -U colors && colors
[[ -s "/opt/homebrew/etc/grc.zsh" ]] && source /opt/homebrew/etc/grc.zsh

#
# Prompt
#

setopt prompt_subst
autoload -U promptinit && promptinit

# Version control information in prompt
autoload -Uz vcs_info
precmd() {
  vcs_info
}
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}'
zstyle ':vcs_info:*' stagedstr '%F{yellow}'
zstyle ':vcs_info:git*' actionformats '%F{magenta}%a %c%f'
zstyle ':vcs_info:git*' formats '%F{green}%c%u%b %f'

PROMPT=$'%F{8}%~%f ${vcs_info_msg_0_}\n$%f '

#
# Aliases
#

alias vim=nvim
