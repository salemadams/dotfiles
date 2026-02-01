return {
	"Eutrius/Otree.nvim",
	lazy = false,
	dependencies = {
		"stevearc/oil.nvim",
	},
	keys = {
		{ "-", "<cmd>Otree<cr>", desc = "Open Otree" },
	},
	config = function()
		require("Otree").setup({
			keymaps = {
				["<CR>"] = "actions.select_then_close",
				["l"] = "actions.select_then_close",
			},
		})
	end,
}
