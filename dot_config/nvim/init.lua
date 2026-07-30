-- vanilla nvim + a couple of vim.pack plugins, nothing else.
--
-- The old lazy.nvim-based config is preserved in ~/projects/archive_dotfiles
-- (dot_config/nvim/init.full.lua) if it's ever needed again.

-- must precede any <leader> mappings (incl. plugins) -- leader is resolved
-- at mapping-definition time, not at use time.
vim.g.mapleader = ' '

-- Plugins via Neovim's built-in package manager (vim.pack, 0.12+).
-- Homepages: https://conjurer.vim.pro and https://datum.w0zro.com -- vim.pack
-- clones the git repos those pages resolve to.
vim.pack.add({
  'https://github.com/vim-pro/conjurer.nvim',
  'https://github.com/w0zro/datum',
})

-- vim-pro (local rtp) removed for the time being; restore from git history when needed.

-- conjurer: ~{motion} prompts for an intent and rewrites the target via LLM
-- (the local claude CLI by default -- no API key needed). ~~ for the line,
-- ~ in visual, . repeats the intent, :ConjureCancel aborts.
require('conjurer').setup()

vim.opt.termguicolors = true  -- datum is truecolor-first; renders exact hexes

-- Follow the macOS system appearance at startup (like Ghostty does). The
-- AppleInterfaceStyle default exists only in dark mode, so a clean exit == dark.
-- Set before colorscheme so datum picks the branch; <leader>bg still overrides.
vim.fn.system({ 'defaults', 'read', '-g', 'AppleInterfaceStyle' })
vim.opt.background = vim.v.shell_error == 0 and 'dark' or 'light'

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
vim.keymap.set('normal', '<cr>', function()
  -- what this does is yours to write
end)
  vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'
end, { desc = 'Toggle datum light/dark' })
