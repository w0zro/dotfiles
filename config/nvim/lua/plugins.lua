
return {
	{ 'catppuccin/nvim', name = 'catppuccin', lazy = false },
	{ 'nvim-lualine/lualine.nvim', opts = {}, },
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'tpope/vim-vinegar' },
	{ 'preservim/vimux' },
	{ 'preservim/vim-wheel' },
	{ 'bfontaine/Brewfile.vim' },
}
