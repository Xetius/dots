vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", {}),
	callback = function(event)
		local bufmap = function(mode, rhs, lhs, opts)
			opts = opts or {}
			opts.buffer = event.buf
			vim.keymap.set(mode, rhs, lhs, opts)
		end

    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "LSP Hover Documentation" })
    bufmap("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "LSP References" })
    bufmap("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "LSP Implementation" })
    bufmap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "LSP Rename" })
    bufmap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "LSP Code Action" })
    bufmap("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", { desc = "LSP Document Symbols" })
    bufmap({ "i", "s" }, "gq", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "LSP Signature Help" })

    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "LSP Go to Definition" })
    bufmap("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "LSP Go to Type Definition" })
    bufmap("n", "grd", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "LSP Go to Declaration" })
    bufmap({ "n", "x" }, "gq", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", { desc = "LSP Format Document" })
  end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsStartingInstall",
	callback = function()
		vim.schedule(function()
			print("mason-tool-installer is starting")
		end)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Organize imports on save for Rust files",
	group = vim.api.nvim_create_augroup("rust-organize-imports", { clear = true }),
	pattern = "*.rs",
	callback = function()
		local clients = vim.lsp.get_clients({ bufnr = 0, name = "rust-analyzer" })
		if #clients == 0 then
			return
		end
		local client = clients[1]
		local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
		for _, res in pairs(result or {}) do
			for _, action in pairs(res.result or {}) do
				if action.edit then
					vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
				elseif action.command then
					vim.lsp.buf.execute_command(action.command)
				end
			end
		end
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	desc = "Automatically reload file if changed outside of Neovim",
	group = vim.api.nvim_create_augroup("auto-reload", { clear = true }),
	callback = function()
		if vim.fn.mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
})
