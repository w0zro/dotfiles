
return {
	{ 'catppuccin/nvim', name = 'catppuccin', lazy = false },
	{ 'nvim-lualine/lualine.nvim', opts = {}, },
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
