# dotfiles

macOS setup managed with [rcm](https://github.com/thoughtbot/rcm): files in this
repo are symlinked into `$HOME` (dotted, so `zshrc` → `~/.zshrc`), with
`config/` mapping into `~/.config/`.

## What's here

| File / dir            | Purpose                                            |
| --------------------- | -------------------------------------------------- |
| `zshrc` / `zprofile`  | zsh: prompt with git status, mise, minimal PATH    |
| `gitconfig`           | git identity, aliases, signing key                 |
| `tmux.conf`           | tmux: `^<space>` prefix, Ghostty truecolor         |
| `config/ghostty/`     | Ghostty terminal: Monaspace fonts, w0zro themes    |
| `config/nvim/`        | Neovim: minimal vim-pro config (full one archived) |
| `config/tmuxinator/`  | tmuxinator project layouts (`mux dot`)             |
| `phoenix.js`          | Phoenix window manager: `cmd+ctrl` + hjkl/space    |
| `ssh/config`          | ssh: keychain-backed key loading                   |
| `Brewfile`            | the toolchain (`brew bundle --file ~/Brewfile`)    |
| `rcrc`                | rcm configuration                                  |

## Bootstrap on a new machine

```sh
# 1. Homebrew, then the toolchain
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone <this repo> ~/projects/w0zro/dotfiles
brew bundle --file ~/projects/w0zro/dotfiles/Brewfile

# 2. Symlink everything into $HOME
RCRC=~/projects/w0zro/dotfiles/rcrc rcup

# 3. Language runtimes (node, python, ruby — pinned in ~/.config/mise/config.toml)
mise install
```

## Secrets

Never commit secrets. Machine-local secrets and overrides live in
`~/.zshrc.local` (chmod 600, untracked), which `zshrc` sources if present.
