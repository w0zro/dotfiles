#
# Path
#

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# GPG
export "GPG_TTY=$(tty)"

#
# Aliases
#

alias ll="ls -lah"
alias cloc="cloc --exclude-dir=\$(tr '\n' ',' < ~/.clocignore)"

#
# Colors
#

autoload -U colors && colors

# Theme
export BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"

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
# Completions
#

autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

#
# SSH
#

# ssh-agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent`
fi

#
# GRC
#
[[ -s "/opt/homebrew/etc/grc.zsh" ]] && source /opt/homebrew/etc/grc.zsh


#
# FZF
#
[ -f "$HOME/.fzf.zsh" ] && source $HOME/.fzf.zsh

# cloc
touch ~/.clocignore

#
# KEEP AS LAST LINE
#
source $HOME/.zshrc_local
