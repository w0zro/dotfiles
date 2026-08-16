-- vanilla nvim + a couple of vim.pack plugins, nothing else.
--
-- The old lazy.nvim-based config is preserved in ~/projects/archive_dotfiles
-- (dot_config/nvim/init.full.lua) if it's ever needed again.

-- must precede any <leader> mappings (incl. plugins) -- leader is resolved
-- at mapping-definition time, not at use time.
vim.g.mapleader = ' '

-- Plugins via Neovim's built-in package manager (vim.pack, 0.12+).
-- Homepage: https://datum.w0zro.com -- vim.pack clones the git repo that
-- page resolves to.
vim.pack.add({
  'https://github.com/w0zro/datum',
})

-- Local checkouts instead of published plugins while the aggregate-conjuring
-- + quickfix.pro work is in progress; drop back to plain vim.pack.add lines
-- once merged. On a machine without the checkouts (a fresh machine before
-- chezmoi clones them, the vim.pro check's CI runner) each falls back to its
-- published repo, so this config boots anywhere.
-- quickfix.pro is prepended first so its plugin/ bootstrap (the FileType qf
-- hook + client API) is available before conjurer registers as a client.
local function dev(checkout, published)
  if vim.uv.fs_stat(checkout) then
    vim.opt.rtp:prepend(checkout)
  else
    vim.pack.add({ published })
  end
end
dev('/Users/w0zro/projects/vim-pro/quickfix', 'https://github.com/vim-pro/quickfix-pro.nvim')
dev('/Users/w0zro/projects/vim-pro/conjure', 'https://github.com/vim-pro/conjurer.nvim')
-- fingers.nvim: watches how you actually edit and notes where there was a
-- shorter way. Observed live, never interrupts -- it surfaces only in the
-- vim.pro buffer, which you open with :pro (:checkhealth fingers if it looks
-- idle). Local-only -- stdpath('data')/fingers/counts.json, nothing uploaded.
dev('/Users/w0zro/projects/vim-pro/fingers.nvim', 'https://github.com/vim-pro/fingers.nvim')

-- conjurer: ~{motion} prompts for an intent and rewrites the target via LLM
-- (the local claude CLI by default -- no API key needed). ~~ for the line,
-- ~ in visual, . repeats the intent, :ConjureCancel aborts. :ConjureAll casts
-- an intent over the whole quickfix list (aggregate branch).
require('conjurer').setup()

vim.opt.termguicolors = true  -- datum is truecolor-first; renders exact hexes

-- Follow the macOS system appearance at startup (like Ghostty does). The
-- AppleInterfaceStyle default exists only in dark mode, so a clean exit == dark.
-- Guarded: the list form of vim.fn.system RAISES where 'defaults' is not
-- executable (Linux, CI), it doesn't fail soft. Elsewhere nvim's own default
-- background stands. Set before colorscheme so datum picks the branch;
-- <leader>bg still overrides.
if vim.fn.executable('defaults') == 1 then
  vim.fn.system({ 'defaults', 'read', '-g', 'AppleInterfaceStyle' })
  vim.opt.background = vim.v.shell_error == 0 and 'dark' or 'light'
end

vim.cmd.colorscheme('datum')

-- datum's chroma tiers need real tokens: base regex syntax never populates
-- Identifier/Delimiter and can't tell a function call from a definition.
-- Start treesitter where a parser exists; fall back silently where it doesn't.
vim.api.nvim_create_autocmd('FileType', {
  callback = function() pcall(vim.treesitter.start) end,
})

-- <leader>bg flips light/dark. Changing 'background' reloads the colorscheme
-- on its own, so nothing else is needed here.
vim.keymap.set('n', '<leader>bg', function()
  vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'
end, { desc = 'Toggle datum light/dark' })
