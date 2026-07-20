# dotfiles

macOS setup managed with [chezmoi](https://chezmoi.io): this repo is the
chezmoi source directory (`sourceDir` is pinned in
`dot_config/chezmoi/chezmoi.toml`, so chezmoi manages its own config).
Source names map to targets: `dot_zshrc` → `~/.zshrc`,
`dot_config/ghostty/` → `~/.config/ghostty/`, `private_dot_ssh/` → `~/.ssh/`.
`Brewfile` is deliberately undotted (`~/Brewfile`).

## What's here

| Source                   | Purpose                                            |
| ------------------------ | -------------------------------------------------- |
| `dot_zshrc` / `dot_zprofile` | zsh: prompt with git status, completions, mise |
| `dot_gitconfig`          | git identity, aliases, signing key                 |
| `dot_tmux.conf`          | tmux: `^<space>` prefix, Ghostty truecolor         |
| `dot_config/ghostty/`    | Ghostty terminal: Monaspace fonts, w0zro themes    |
| `dot_config/nvim/`       | Neovim: minimal vim-pro config (full one archived) |
| `dot_config/mise/`       | pinned language runtimes (node, python, ruby)      |
| `dot_config/tmuxinator/` | tmuxinator project layouts (`mux dot`)             |
| `dot_phoenix.js`         | Phoenix window manager: `cmd+ctrl` + hjkl/space    |
| `private_dot_ssh/`       | ssh: keychain-backed key loading                   |
| `Brewfile`               | the toolchain (`brew bundle --file ~/Brewfile`)    |

## Daily workflow

Edit files here (or via `chezmoi edit <target>`), then:

```sh
chezmoi diff    # what would change
chezmoi apply   # write to $HOME
```

Targets are real files, not symlinks — `chezmoi apply` is the sync step.

## Bootstrap on a new machine

```sh
# 1. Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. This repo becomes the chezmoi source, then everything applies
brew install chezmoi
git clone <this repo> ~/projects/w0zro/dotfiles
chezmoi apply --source ~/projects/w0zro/dotfiles   # includes chezmoi's own config

# 3. The toolchain, then language runtimes
brew bundle --file ~/Brewfile
mise install
```

## Secrets

Never commit secrets. Machine-local secrets and overrides live in
`~/.zshrc.local` (chmod 600, untracked, unmanaged), which `dot_zshrc`
sources if present.
