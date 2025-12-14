return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")

		wk.setup({})

		wk.add({
			{ "<leader>e",  desc = "Explorer" },
			{ "<leader>f",  group = "Find" },
			{ "<leader>fb", desc = "Buffers" },
			{ "<leader>ff", desc = "Find files" },
			{ "<leader>fg", desc = "Live grep" },
			{ "<leader>fh", desc = "Help" },
			{ "<leader>l",  group = "LSP" },
			{ "<leader>lf", desc = "Format buffer" },
			{ "<leader>li", desc = "Toggle inlay hints" },
			{ "<leader>y",  desc = "Yank to clipboard" },
		})
	end,
}
