return {
{
		"nyoom-engineering/oxocarbon.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("oxocarbon")
			vim.cmd.hi("Comment gui=none guifg=#707070")
			vim.cmd.hi("LspInlayHint gui=none guifg=#5e5e5e")
		end,
	},
}
