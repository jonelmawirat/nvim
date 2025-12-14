return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<CR>"] = actions.select_default,
					},
					n = {
						["<CR>"] = actions.select_default,
					},
				},
			},
		})
	end,
}
