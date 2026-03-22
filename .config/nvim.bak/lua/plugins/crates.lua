return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local crates = require("crates")
		crates.setup({
			completion = {
				crates = {
					enabled = true,
				},
			},
		})

		-- Keymaps for Cargo.toml
		vim.api.nvim_create_autocmd("BufRead", {
			pattern = "Cargo.toml",
			callback = function(args)
				local opts = { buffer = args.buf, silent = true }

				vim.keymap.set("n", "<leader>ct", crates.toggle, vim.tbl_extend("force", opts, { desc = "Toggle crate info" }))
				vim.keymap.set("n", "<leader>cr", crates.reload, vim.tbl_extend("force", opts, { desc = "Reload crates" }))

				vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, vim.tbl_extend("force", opts, { desc = "Show versions" }))
				vim.keymap.set("n", "<leader>cf", crates.show_features_popup, vim.tbl_extend("force", opts, { desc = "Show features" }))
				vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, vim.tbl_extend("force", opts, { desc = "Show dependencies" }))

				vim.keymap.set("n", "<leader>cu", crates.update_crate, vim.tbl_extend("force", opts, { desc = "Update crate" }))
				vim.keymap.set("v", "<leader>cu", crates.update_crates, vim.tbl_extend("force", opts, { desc = "Update selected crates" }))
				vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, vim.tbl_extend("force", opts, { desc = "Upgrade crate" }))
				vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, vim.tbl_extend("force", opts, { desc = "Upgrade selected crates" }))
				vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, vim.tbl_extend("force", opts, { desc = "Upgrade all crates" }))

				vim.keymap.set("n", "<leader>cH", crates.open_homepage, vim.tbl_extend("force", opts, { desc = "Open homepage" }))
				vim.keymap.set("n", "<leader>cR", crates.open_repository, vim.tbl_extend("force", opts, { desc = "Open repository" }))
				vim.keymap.set("n", "<leader>cD", crates.open_documentation, vim.tbl_extend("force", opts, { desc = "Open docs.rs" }))
				vim.keymap.set("n", "<leader>cC", crates.open_crates_io, vim.tbl_extend("force", opts, { desc = "Open crates.io" }))
			end,
		})
	end,
}
