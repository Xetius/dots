return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-c>",
				accept_word = "<C-y>",
				accept_suggestion_quickfix = "<C-y>",
				accept_suggestion_lsp = "<C-y>",
				accept_suggestion_terminal = "<C-y>",
				accept_suggestion_code_action = "<C-y>",
				accept_suggestion_diagnostic = "<C-y>",
				accept_suggestion_quickfix_diagnostic = "<C-y>",
				accept_suggestion_lsp_diagnostic = "<C-y>",
				accept_suggestion_terminal_diagnostic = "<C-y>",
				accept_suggestion_code_action_diagnostic = "<C-y>",
			},
		})
	end,
}
