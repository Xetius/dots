-- Completely disable nvim-lspconfig's rust_analyzer
-- rustaceanvim handles Rust LSP
return {
	cmd = {},
	filetypes = {},
	root_markers = {},
	autostart = false,
}
