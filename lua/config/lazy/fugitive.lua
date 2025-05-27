return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>s", vim.cmd.Git)
	end
}
