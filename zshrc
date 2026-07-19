#
# Colors
#

autoload -U colors && colors
[[ -s '/opt/homebrew/etc/grc.zsh' ]] && source /opt/homebrew/etc/grc.zsh

#
# Prompt
#

setopt prompt_subst

# Version control information in prompt
autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info
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
alias mux=tmuxinator
alias ll='ls -lah'

#
# Env
#

export EDITOR='nvim'
export GOPATH="$HOME/go"
export GPG_TTY=$(tty)

#
# Keybindings
#

bindkey -e # always use emacs keybindings

#
# Runtimes (node, python, ruby via mise)
#

eval "$(mise activate zsh)"

#
# Tools
#

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# flyctl
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"

#
# Local overrides & secrets (machine-specific, never tracked)
#

[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
