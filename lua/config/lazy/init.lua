return {
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"nvim-lua/plenary.nvim",
		name = "plenary"
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"plenary"
		}
	},

}
