return {
	"barrett-ruth/import-cost.nvim",
	event = { "BufReadPre", "BufNewFile" },
	build = "sh install.sh yarn",
	config = function()
		require("import-cost").setup({})
	end,
}
