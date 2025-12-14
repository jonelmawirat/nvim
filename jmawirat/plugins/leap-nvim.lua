return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		leap.opts.case_sensitive = true

		local modes = { "n", "x", "o" }
		vim.keymap.set(modes, "s", "<Plug>(leap-forward)", { silent = true })
		vim.keymap.set(modes, "S", "<Plug>(leap-backward)", { silent = true })
		vim.keymap.set(modes, "gs", "<Plug>(leap-cross-window)", { silent = true })
	end,
}
