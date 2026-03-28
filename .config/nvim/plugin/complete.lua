vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.0") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.4.1") },
	{ src = "https://github.com/budimanjojo/k8s-snippets" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/fang2hou/blink-copilot" },
})

local snippet_paths = {}
for _, p in ipairs(vim.api.nvim_get_runtime_file("package.json", true)) do
	table.insert(snippet_paths, vim.fn.fnamemodify(p, ":h"))
end
require("luasnip.loaders.from_vscode").lazy_load({ paths = snippet_paths })

require("copilot").setup({
	suggestion = { enabled = true },
	panel = { enabled = true },
})

require("blink.cmp").setup({
	keymap = {
    preset = "default",

  },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		menu = {
			draw = {
				padding = { 0, 1 },
				components = {
					kind_icon = {
						text = function(ctx)
							return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
						end,
					},
				},
			},
		},
		documentation = { auto_show = false },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
		},
	},
	snippets = { preset = "luasnip" },
	fuzzy = {
		implementation = "prefer_rust",
	},
})

