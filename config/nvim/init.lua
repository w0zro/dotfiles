local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup('plugins')

vim.cmd.colorscheme 'catppuccin'
vim.o.number = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'

function nmap(keys, command, opts)
	opts = opts or {}
	vim.keymap.set('n', keys, command, opts)
end

function vmap(keys, command, opts)
	opts = opts or {}
	vim.keymap.set('v', keys, command, opts)
end

-- keybindings
local builtin = require('telescope.builtin')

nmap('<cr><cr>', ':noh<cr>', { silent = true })

nmap('<leader>/', builtin.live_grep)
nmap('<leader>*', builtin.grep_string)
nmap('<leader>e', builtin.find_files)
nmap('<leader>E', builtin.git_files)
nmap('<leader>b', builtin.buffers)

nmap('<leader><leader>', ':b#<cr>')
nmap('<leader>w', ':w<cr>')
nmap('<leader>q', ':q<cr>')
nmap('<leader>x', ':x<cr>')
