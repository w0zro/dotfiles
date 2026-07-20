-- vanilla nvim + vim.pro, nothing else.
--
-- The old lazy.nvim-based config is preserved in ~/projects/archive_dotfiles
-- (dot_config/nvim/init.full.lua) if it's ever needed again.

-- must precede any <leader> mappings (incl. plugins) -- leader is resolved
-- at mapping-definition time, not at use time.
vim.g.mapleader = ' '

vim.opt.rtp:append(vim.fn.expand('~/projects/w0zro/vim-pro/vim-pro'))
require('vim-pro').setup()

-- conjurer: ~{motion} prompts for an intent and rewrites the target via LLM.
-- ~~ for the line, ~ in visual, . repeats the intent. Needs $ANTHROPIC_API_KEY.
vim.opt.rtp:append(vim.fn.expand('~/projects/vim-pro/conjure'))
require('conjurer').setup()

vim.opt.rtp:append(vim.fn.expand('~/projects/w0zro/w0zro.nvim'))
vim.opt.termguicolors = true  -- w0zro is truecolor-first; renders exact hexes
vim.opt.background = 'light'   -- set before colorscheme so it picks the light branch
vim.cmd.colorscheme('w0zro')

-- w0zro's chroma tiers need real tokens: base regex syntax never populates
-- Identifier/Delimiter and can't tell a function call from a definition.
-- Start treesitter where a parser exists; fall back silently where it doesn't.
vim.api.nvim_create_autocmd('FileType', {
  callback = function() pcall(vim.treesitter.start) end,
})

-- <leader>bg flips light/dark. Changing 'background' reloads the colorscheme
-- on its own, so nothing else is needed here.
vim.keymap.set('n', '<leader>bg', function()
  vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'
end, { desc = 'Toggle w0zro light/dark' })
