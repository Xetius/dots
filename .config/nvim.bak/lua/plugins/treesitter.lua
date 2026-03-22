return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.install({
			"c",
			"cpp",
			"glsl",
			"lua",
			"meson",
			"python",
			"vim",
			"vimdoc",
			"query",
			"rust",
			"go",
			"json",
			"yaml",
			"terraform",
			"javascript",
			"typescript",
			"markdown",
			"markdown_inline",
			"html",
			"latex",
			"yaml",
			"css",
			"latex",
			"scss",
			"svelte",
			"tsx",
			"typst",
			"vue",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "markdown" },
			callback = function(args)
				vim.treesitter.start(args.buf)
			end,
		})
	end,
}
