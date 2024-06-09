return {
	{ 'catppuccin/nvim', name = 'catppuccin', lazy = false },
	{ 'nvim-lualine/lualine.nvim', opts = {}, },
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'tpope/vim-vinegar' },
	{ 'preservim/vimux' },
	{ 'preservim/vim-wheel' },
	{ 'bfontaine/Brewfile.vim' },
	{ 'goolord/alpha-nvim',
		dependencies = { { 'nvim-tree/nvim-web-devicons', } },
		config = function(_,_)
			local alpha = require('alpha')
			local startify = require('alpha.themes.startify')
			startify.section.header.val = {}
			alpha.setup(startify.config)
		end,
	},
}
