return {
	"lewis6991/gitsigns.nvim",

	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local function map(mode, l, r, desc)
					local opts = {}
					opts.buffer = bufnr
					opts.desc = desc
					vim.keymap.set(mode, l, r, opts)
				end
				--
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]g", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "Next Hunk")

				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[g", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "Previous Hunk")

				map("n", "<leader>gs", gitsigns.stage_hunk, "Stage Hunk")
				map("n", "<leader>gr", gitsigns.reset_hunk, "Reset Hunk")
				map("n", "<leader>gu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>gS", gitsigns.stage_buffer, "Stage Buffer")
				map("n", "<leader>gR", gitsigns.reset_buffer, "Reset Buffer")
				map("n", "<leader>gp", gitsigns.preview_hunk, "Preview Hunk")
				map("n", "<leader>gi", gitsigns.preview_hunk_inline, "Preview Hunk Inline")
				map("n", "<leader>gb", function()
					gitsigns.blame_line({ full = true })
				end, "Blame Line")
				map("n", "<leader>gd", gitsigns.diffthis, "Diff Hunk")
				map("n", "<leader>gD", function()
					gitsigns.diffthis("~")
				end, "Diff Hunk")
				map("n", "<leader>gq", gitsigns.setqflist, "Add Hunk to QF list")
				map("n", "<leader>gQ", function()
					gitsigns.setqflist("all")
				end, "Add Hunk to QF list")

				map("n", "<leader>gl", gitsigns.toggle_current_line_blame, "Toggle Current Line Blame")
				map("n", "<leader>gw", gitsigns.toggle_word_diff, "Toggle Word Diff")

				map({ "o", "x" }, "ih", gitsigns.select_hunk, "Hunk as text object")
			end,
		})
	end,
}
